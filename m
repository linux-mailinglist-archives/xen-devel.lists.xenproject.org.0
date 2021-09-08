Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851454031FB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 02:50:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181412.328501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNlmI-00035K-Qz; Wed, 08 Sep 2021 00:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181412.328501; Wed, 08 Sep 2021 00:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNlmI-00032p-O0; Wed, 08 Sep 2021 00:49:26 +0000
Received: by outflank-mailman (input) for mailman id 181412;
 Wed, 08 Sep 2021 00:49:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IK88=N6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mNlmG-00032j-Ra
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 00:49:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c0d77ac-103e-11ec-b138-12813bfff9fa;
 Wed, 08 Sep 2021 00:49:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8EFC60F92;
 Wed,  8 Sep 2021 00:49:22 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9c0d77ac-103e-11ec-b138-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631062163;
	bh=7Wrz7jbq4ZQpZbwmyQgxeFbh9DIedMdFxmZ4tupnR8g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=loxhqFx2E6wvRf5U+77Vgq/G4KD4QYGjNxv/XXwguJR7h+SGcMNdeCalOVlWBVmlv
	 XpxOnyIjCYt9iNy/57iu/a55l7C51KbUdnvtZqrf8owUP8ymQHDG5/8v6I9y/iqKNY
	 2Rf/pUzL1rOqvX0AVjQX0rz4UvQ4jlhnBPXO5zEVnwSZezdW8uLbTh9tv9pXTXtqam
	 5CbGn/QNfcrdITpjLzz71QHXWDUfIXt98Ln6hHjz9PJdrlzA8yokvcxNB1M37+gZzx
	 YdyMRfDizU/B1oCc1Vg/7S3x3J97fGgH9rBTDpNXNERBLNINInx5C4/DFrzXpKGjTK
	 yMstLYGXAQWIA==
Date: Tue, 7 Sep 2021 17:49:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/pvcalls: backend can be a module
In-Reply-To: <54a6070c-92bb-36a3-2fc0-de9ccca438c5@suse.com>
Message-ID: <alpine.DEB.2.21.2109071745270.14059@sstabellini-ThinkPad-T480s>
References: <54a6070c-92bb-36a3-2fc0-de9ccca438c5@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Sep 2021, Jan Beulich wrote:
> It's not clear to me why only the frontend has been tristate. Switch the
> backend to be, too.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Actually although the frontend is a tristate, it cannot really work as a
module. Specifically see pvcalls_stream_ops in the enabling patch (still
not upstream):

https://github.com/lf-edge/runx/blob/master/kernel/patches/0001-patch-pvcalls_enable.patch


So I had to change tristate to bool for XEN_PVCALLS_FRONTEND in our
internal kernel tree.

That said, the PVCalls backend could very well be a module and
technically I don't see any reasons why not. So:


Acked-by: Stefano Stabellini <sstabellini@kernel.org>



> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -214,7 +214,7 @@ config XEN_PVCALLS_FRONTEND
>  	  implements them.
>  
>  config XEN_PVCALLS_BACKEND
> -	bool "XEN PV Calls backend driver"
> +	tristate "XEN PV Calls backend driver"
>  	depends on INET && XEN && XEN_BACKEND
>  	help
>  	  Experimental backend for the Xen PV Calls protocol
> 

