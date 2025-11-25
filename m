Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E9C85917
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 15:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171966.1497042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNuPc-0007Ur-DP; Tue, 25 Nov 2025 14:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171966.1497042; Tue, 25 Nov 2025 14:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNuPc-0007TQ-A2; Tue, 25 Nov 2025 14:53:00 +0000
Received: by outflank-mailman (input) for mailman id 1171966;
 Tue, 25 Nov 2025 14:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BAQ+=6B=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vNuPa-0007TE-QJ
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 14:52:58 +0000
Received: from sender3-of-o50.zoho.com (sender3-of-o50.zoho.com
 [136.143.184.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d5cb011-ca0e-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 15:52:57 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1764082372633646.0527291575573;
 Tue, 25 Nov 2025 06:52:52 -0800 (PST)
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
X-Inumbo-ID: 6d5cb011-ca0e-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; t=1764082375; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=haVKs9RlIE9Zd7bd+9pNto2qrt2WP9DYMc/kyUWhrSF9vabrFzqzZne880A5tsUh+4383ngn4vcYS+tdGWLJZgOELK+i981jHcf8oTjFbptIlr/F/HyAQdTXzFjwGNIKBH5RglMoa4Xvwk7CGC7VyyCZAHoRmIHwYBA2AFR54Lc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764082375; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YxyBSs827jprtHBHXV4PwXcAAh3LrjjfS7ftNklC6V4=; 
	b=bxlf5+p/PcTjF7ISAVptncW4MHHUn91c/a5NMpILF9NfDDPPpWoeeTrzt3qLSO5iEHmt5uRC3vKcm8vyew84yXNtxsUcUBUbwPcpNBkPD+Hpf+V3lc0WJv7ffDwj+iZsaqOX3OUZ5JjLsKjQR4BUujOPnAtD1R73Rt6D8RcKeGU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764082375;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YxyBSs827jprtHBHXV4PwXcAAh3LrjjfS7ftNklC6V4=;
	b=ZXLMWyulgyEjoZlRiGqvEJQDrTDQlzwiSfTzqMj1YNN3F4gtw9d/7OIN76Ix8a4i
	wnlCZkBWrXA82zOMAW9ayUICuYWVXAT2X3l34//V0m8OXc/7QFaot2aUQaEZhwIvTbY
	ibuwl2pvsIjzfzA02JGLFDcOgjqCrVSfASp11BAU=
Message-ID: <c70e4aa8-96d6-48ed-a4a4-eb9c26d17c17@apertussolutions.com>
Date: Tue, 25 Nov 2025 09:52:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/xsm: address violations of MISRA C rules 8.3 and
 7.2
To: Nicola Vetrini <nicola.vetrini@gmail.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, sstabellini@kernel.org
References: <cover.1763642993.git.nicola.vetrini@gmail.com>
 <e59c8b5c1240417d7f55d9ec16378fb180cd63a9.1763642993.git.nicola.vetrini@gmail.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <e59c8b5c1240417d7f55d9ec16378fb180cd63a9.1763642993.git.nicola.vetrini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/20/25 2:32 PM, Nicola Vetrini wrote:
> Rule 8.3 states: Function types shall be in prototype form
> with named parameters.
> 
> add parameter to 'has_xsm_magic' to make it consistent with the
> definition.
> 
> Rule 7.2 states: A `u' or `U' suffix shall be applied to all
> integer constants that are represented in an unsigned type.
> 
> add missing `U' to both #define for `XSM_MAGIC` for consistency.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
> ---
>   xen/include/xsm/xsm.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 9a23d2827c..074d61cd45 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -22,9 +22,9 @@
>   typedef uint32_t xsm_magic_t;
>   
>   #ifdef CONFIG_XSM_FLASK
> -#define XSM_MAGIC 0xf97cff8c
> +#define XSM_MAGIC 0xf97cff8cU
>   #else
> -#define XSM_MAGIC 0x0
> +#define XSM_MAGIC 0x0U
>   #endif
>   
>   /*
> @@ -815,7 +815,7 @@ int xsm_multiboot_policy_init(
>    */
>   int xsm_dt_init(void);
>   int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
> -bool has_xsm_magic(paddr_t);
> +bool has_xsm_magic(paddr_t start);
>   #endif
>   
>   void xsm_fixup_ops(struct xsm_ops *ops);

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>


