Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C0817F4A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 02:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656440.1024586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFOzA-00045A-Jd; Tue, 19 Dec 2023 01:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656440.1024586; Tue, 19 Dec 2023 01:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFOzA-00043V-Fw; Tue, 19 Dec 2023 01:33:28 +0000
Received: by outflank-mailman (input) for mailman id 656440;
 Tue, 19 Dec 2023 01:33:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFOz9-00043P-Hp
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 01:33:27 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a0fe68c-9e0e-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 02:33:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C0992CE14E9;
 Tue, 19 Dec 2023 01:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3335EC433C7;
 Tue, 19 Dec 2023 01:33:22 +0000 (UTC)
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
X-Inumbo-ID: 9a0fe68c-9e0e-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702949603;
	bh=oZF0E4klQNuyKCi6ek28LjIulmGND7/XZb1qWirxeUw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Slzq9eODMZV5FGBmr+Y2IyZl9ABFZPoiOCiYpicPyueaUFtkrQd4X3XJ7R4M7IRmS
	 vmckVFWK6JVagKLWCBgcZScnDpX9T2mOqK7voY7gXAL/YZCKGjLnj7LlXHh1GK6bW5
	 P/D7br+bX1Xf9c3sZOk2cNBvBbn+jKVCKDQSo4smxyt6IhBpthMx1h6bcaXKjnrt7g
	 hrm3EbTwI7gDfIxnq2Dtp95mdY44akpSyBXVj/rn52cJJLqXl/poIXlXKyyahPgc/d
	 JAWfssDaDyV9ETGQM7uDPhyzG/SV5bXlfavvDcKU7TqL4fSpXxtAGY39rgzYfB3AWQ
	 QfOz7S4LBJ6+w==
Date: Mon, 18 Dec 2023 17:33:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 2/7] x86/mm: address MISRA C:2012 Rule 2.1
In-Reply-To: <1cd82cf19a613a122a770bf6670e681ca7fccd44.1702891792.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312181733090.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702891792.git.nicola.vetrini@bugseng.com> <1cd82cf19a613a122a770bf6670e681ca7fccd44.1702891792.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Nicola Vetrini wrote:
> The "return 0" after the swich statement in 'xen/arch/x86/mm.c'
> is unreachable because all switch clauses end with returns, and
> can thus be dropped.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


