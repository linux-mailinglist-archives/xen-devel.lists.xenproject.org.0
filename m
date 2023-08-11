Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E49779ADB
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 00:55:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582693.912573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUb1t-0007pA-PZ; Fri, 11 Aug 2023 22:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582693.912573; Fri, 11 Aug 2023 22:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUb1t-0007m6-Ma; Fri, 11 Aug 2023 22:54:49 +0000
Received: by outflank-mailman (input) for mailman id 582693;
 Fri, 11 Aug 2023 22:54:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUb1s-0007ly-Ra
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 22:54:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1187682e-389a-11ee-b284-6b7b168915f2;
 Sat, 12 Aug 2023 00:54:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F1B566619A;
 Fri, 11 Aug 2023 22:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BA0C433C7;
 Fri, 11 Aug 2023 22:54:44 +0000 (UTC)
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
X-Inumbo-ID: 1187682e-389a-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691794485;
	bh=UzJbn4F/KDGS52lo2tBuaLjR+yLOj+a6Zmt2OmfsBJw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X39qUv8bXWgrj4se6LE9flJtfwGe32mYMlxxnN3Xg+xFWCOLHwgReWFBJDU6Ya553
	 4f8A2I+3KSWhodhKBaDEYbb+SpoF/GVf5cYPXVpSR7Ii876IRTH1MoiDqO52bNjGkU
	 Im/+Uc9yn9/wYm/kfaNtKUpI0SWMZCkelMbOtZQ/cb976HmZb045qpoy0QzuWFv6JN
	 52traZACAbP/NbpVCDa7yDO+IyiWf0mU/UArFor7BGCn0PMSWr8w9n8ZzHsp+dcYwx
	 dq4C7BKjd6KlHAbBGvVCKlDkZydvIN+lOrhMEuHwXF/1ymDZyxVuDOOoBG3dclE7Mp
	 FFuqXXkJsv6nA==
Date: Fri, 11 Aug 2023 15:54:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com
Subject: Re: [XEN PATCH 1/6] x86/hpet: make variable 'per_cpu__cpu_bc_channel'
 static
In-Reply-To: <5e13888db7b69cee21e5367ce8750fbdc1e22d5c.1691676251.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308111554360.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com> <5e13888db7b69cee21e5367ce8750fbdc1e22d5c.1691676251.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Aug 2023, Nicola Vetrini wrote:
> The variable is only ever used inside the file where it's
> defined, therefore it can have static storage. This also
> resolves a violation of MISRA C:2012 Rule 8.4 due to the absence
> of a declaration prior to the definition.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/hpet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
> index a2df1c7df401..79c07f6a9e09 100644
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -49,7 +49,7 @@ static struct hpet_event_channel *__read_mostly hpet_events;
>  /* msi hpet channels used for broadcast */
>  static unsigned int __read_mostly num_hpets_used;
>  
> -DEFINE_PER_CPU(struct hpet_event_channel *, cpu_bc_channel);
> +static DEFINE_PER_CPU(struct hpet_event_channel *, cpu_bc_channel);
>  
>  unsigned long __initdata hpet_address;
>  int8_t __initdata opt_hpet_legacy_replacement = -1;
> -- 
> 2.34.1
> 

