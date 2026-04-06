Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PvADJLx02lxoQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 19:46:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9733A5DEE
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 19:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274337.1560481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9o1Q-0005go-P8; Mon, 06 Apr 2026 17:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274337.1560481; Mon, 06 Apr 2026 17:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9o1Q-0005fM-LG; Mon, 06 Apr 2026 17:46:00 +0000
Received: by outflank-mailman (input) for mailman id 1274337;
 Mon, 06 Apr 2026 17:45:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1w9o1P-0005fG-Su
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 17:45:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9o1N-00GmLw-M8
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 19:45:59 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69d3f123-2eae-0a2a0a5409dd-0a2a450aa396-46
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 19:45:58 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69d3f155-ee98-0a2a450a0019-ac6904febf76-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 19:45:58 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 06B3960103;
 Mon,  6 Apr 2026 17:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A70C4CEF7;
 Mon,  6 Apr 2026 17:45:55 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775497556;
	bh=eGWDO6+7WjkWzY6Nuvk55mQI2p6QMYb3HOtGf9ZPtvs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hUoM9ayNjSVoFMJafY8c5o6aAvUJb/dRfyfVfa9S9mwp4NqtU+js5Y3gVVoICyhyv
	 Arw9WZw193LcuzHf4v0Zbc4ovk11fUbqcWx59M3vbvYoquPnBXUrzbQFShQsznjNxE
	 b8rcoh1/+vDJnJQc+cIcMFjBKHFNlk5DHKM3nTj6tBQSTfRnG9+tbWv0kJuMF75W23
	 iRVbRHKq0aJTgHoTKWSd3d2qhDq+B5U7yGz1NOoduP/aGfPTW1sVsZHzEnnAa+tInQ
	 SA+sZK/dRcPRjiF4SIuGLFvICDGgbw1flUV4Mo60kWTqAd/uATN0RV8ms07d3Z47Cc
	 kUTMIxPcVLbXw==
Date: Mon, 6 Apr 2026 10:45:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, jgross@suse.com
Subject: Re: [PATCH v2] ARM: xen: validate hypervisor compatible before
 parsing its version
In-Reply-To: <20260405094005.5-arm-xen-v2-pengpeng@iscas.ac.cn>
Message-ID: <alpine.DEB.2.22.394.2604061045310.2873990@ubuntu-linux-20-04-desktop>
References: <20260403111502.2-dt-arm-xen-pengpeng@iscas.ac.cn> <20260405094005.5-arm-xen-v2-pengpeng@iscas.ac.cn>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-4011c0/1775497558-0F7470B1-931AE95D/0/0
X-purgate-type: clean
X-purgate-size: 2139
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CD9733A5DEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 5 Apr 2026, Pengpeng Hou wrote:
> fdt_find_hyper_node() reads the raw compatible property and then derives
> hyper_node.version from a prefix match before later printing it with %s.
> Flat DT properties are external boot input, and this path does not prove
> that the first compatible entry is NUL-terminated within the returned
> property length.
> 
> Keep the existing flat-DT lookup path, but verify that the first
> compatible entry terminates within the returned property length before
> deriving the version suffix from it.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v1:
> - keep `of_get_flat_dt_prop()` instead of switching to `fdt_stringlist_get()`
> - validate the first compatible entry with bounded `strnlen()`
> 
>  arch/arm/xen/enlighten.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 4feed2c2..25a0ce3b 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -218,8 +218,9 @@ static __initdata struct {
>  static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
>  				      int depth, void *data)
>  {
> -	const void *s = NULL;
> +	const char *s = NULL;
>  	int len;
> +	size_t prefix_len = strlen(hyper_node.prefix);
>  
>  	if (depth != 1 || strcmp(uname, "hypervisor") != 0)
>  		return 0;
> @@ -228,9 +229,10 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
>  		hyper_node.found = true;
>  
>  	s = of_get_flat_dt_prop(node, "compatible", &len);
> -	if (strlen(hyper_node.prefix) + 3  < len &&
> -	    !strncmp(hyper_node.prefix, s, strlen(hyper_node.prefix)))
> -		hyper_node.version = s + strlen(hyper_node.prefix);
> +	if (s && len > 0 && strnlen(s, len) < len &&
> +	    len > prefix_len + 3 &&
> +	    !strncmp(hyper_node.prefix, s, prefix_len))
> +		hyper_node.version = s + prefix_len;
>  
>  	/*
>  	 * Check if Xen supports EFI by checking whether there is the
> -- 
> 2.50.1
> 

