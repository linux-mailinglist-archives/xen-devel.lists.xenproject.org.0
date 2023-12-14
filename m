Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61C6813CA2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 22:32:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654751.1022055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtJP-0000QQ-CM; Thu, 14 Dec 2023 21:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654751.1022055; Thu, 14 Dec 2023 21:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtJP-0000OZ-9I; Thu, 14 Dec 2023 21:32:07 +0000
Received: by outflank-mailman (input) for mailman id 654751;
 Thu, 14 Dec 2023 21:32:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtJO-0000OT-6U
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 21:32:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38d831b2-9ac8-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 22:32:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8DC7ACE2568;
 Thu, 14 Dec 2023 21:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41666C433C8;
 Thu, 14 Dec 2023 21:32:01 +0000 (UTC)
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
X-Inumbo-ID: 38d831b2-9ac8-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702589521;
	bh=0zQK4DOnY6Pob5LVEP3ox98r5A7wfFmZy2UWkaki5Wk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JDETZf12ailXNDGILTSBfI2YycglFQf9qHCezpVxVUDpfxHtfbo/yOylA7lNPOdkB
	 TVqyrVlPwy4llLXK417veb7plf5TUBR4P1GpqzYqBg1e7uxayFB2Kws0M/9nmZ9gb8
	 Z66By4qOAdNhD+aznBFPR8ZquvSzmSYLgHpQ6Kj0HOdCnkSAKmL33TBYiuujxwthnD
	 VrfQlRDX+R8UdyZKy/pwfS9HkHgcKuhn7g+WH6Del19HESJoxgN5KuZSB0tcuLZt3z
	 A34oMgRPh2ckypDqFraUoLgjoDdO2N+5e8fmdwkPGaBPuc88V+9LeVqPrG1UrCpX/Z
	 rLg+ynAt4/dRg==
Date: Thu, 14 Dec 2023 13:31:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH 3/5] xen/acpi: Use NULL as a null pointer constant
In-Reply-To: <bb10a86a08eb36e9f9c6bda899cdc850afada403.1702553835.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312141331540.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com> <bb10a86a08eb36e9f9c6bda899cdc850afada403.1702553835.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Nicola Vetrini wrote:
> Resolves a violation of MISRA C Rule 11.9.
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

