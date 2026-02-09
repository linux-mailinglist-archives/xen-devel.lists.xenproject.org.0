Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIKQMNzqiWn1EAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:10:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC1F1101A9
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:10:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225413.1531908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRxm-00036A-Dc; Mon, 09 Feb 2026 14:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225413.1531908; Mon, 09 Feb 2026 14:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpRxm-00033q-Ao; Mon, 09 Feb 2026 14:10:06 +0000
Received: by outflank-mailman (input) for mailman id 1225413;
 Mon, 09 Feb 2026 14:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpRxk-0002kv-PO
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:10:04 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 075e87d0-05c1-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 15:10:03 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so38378145e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 06:10:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d7a963sm296692555e9.9.2026.02.09.06.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 06:10:02 -0800 (PST)
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
X-Inumbo-ID: 075e87d0-05c1-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770646203; x=1771251003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wFvOG2PHs/YhAlG0EftJED06hEKrvzFmCzK8Elb+jWc=;
        b=gZBq+tAHcaCTsun8uEgA/qijJy1ZBm4R6NVscxDsplKj0lra5nIUE5mNnESimdGGll
         Aa+Z5Mtl/3wCB2ceQHyktcngNctn43QaJBrEhKHsCu/NR0FHQBSv6lRjW2EHpsfy7hWs
         Ra2YMo0RC/vaP544U76syOGMjc3ndSjgghqn/G/fUXFRefyg52uCHYNYhHp35V8dI0Pk
         tUjZ8+vP0FkLQhi7RyVAIpuxXJRu46Ox1wx8j/X2HRXLPMVdwOMtJRVZFMl/3687NW1P
         20h/AMo0RAmcU5za+lVQ8zutqIDDg/Vyii81ghAszA4Mg3V0EccKVW+MmMPm96eC1e6m
         WC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770646203; x=1771251003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFvOG2PHs/YhAlG0EftJED06hEKrvzFmCzK8Elb+jWc=;
        b=vtJM98o8cvOdpHSg7O6DpnzTLdvavipjHX8Hn6SfE2Sw56vlB2m1BRPDE61bJST6+/
         lH/MxFXuSedPZ0Flggq9o3HWbUah44pP/ykxWZ6rfnS2/0iyyBcpC/3KtqX2H4aMnrsM
         omaw/5ZQde0WId/A/IS9089TYDj0gTGNcEUqrgSwcMyh5TLwRaTPd8NQBwYR4K0oV+GQ
         IrllhfbsliGgmE/KDiLvpsglb4joLLmLHlP7QqW7tGfOmJfrXXTdz+qx+69aU0Hu5jFC
         kNnO87bjQIHDrIfz15RzxMehv8//DyPDA3vp3l1tMs7U9WtfRukYHoDKSY58RJEOdyyz
         x7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvzz1guJgr4k7bpMcIUXtNmWNH5e9njiQXBwC+nduH8AFrtkLuzigwpx71VF6nqXQX/e7aXkvHorI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1f53pH5BhQGo+5sUoqVlQZlnvzwhA2FAmsdhZpffNCiJpzNPE
	BrI299fsBcuQvq0ZU6IktlD8LJFTKzOLbT4D7CVFXGlTIaZ9WKggu56k6xjKr2322Q==
X-Gm-Gg: AZuq6aLyHWg62qHSgJksBlv/6TKPyotrPTB9vPAy2x99I8z/b9xzbDhccpjlhhVYWpn
	t72W8n0EA/VvoWBUHYKDruSftgl1J6Fo2M7PMT1lp8ps/iA45fv2PnS1PhacKKeXw8MOIRlv+qt
	jf7PnLgHLmXgMDN/FmuzM4BRuUzDYrMP1rRrfgw1ZIhsew7qEMAsAd1GT8/AMRhOrXSSAev3w+P
	XYRc2+2AqG7ByLqddbPwZMx4L96rqrpYMJJ6zBu9hFTz+I3IREMLT8viGaouSYxTkUr4kXrG4/J
	ruX80wcRhchsPXmRqIlXyiSffyfzTK26KJZsVCzsQf+ywPOxtepJuZos/pErEPJF2xkWVV2P/kz
	21zkiHJmnAEONJyt50q3MPf6g2oPjlvoVhYUDgqCGwxgi5m3SG5oPC37rE1JHAFPMDqRdLMWX0i
	X018GQfPa/jNeJXU5AH0OZF7Fy9OzMyjXYzacfM3yt5pQQ0T65/U5i6ptvQ8a4C8nSkzfo1zfkr
	Es=
X-Received: by 2002:a05:600c:528b:b0:477:9cdb:e337 with SMTP id 5b1f17b1804b1-483201d61c7mr166417715e9.7.1770646203011;
        Mon, 09 Feb 2026 06:10:03 -0800 (PST)
Message-ID: <491d4d54-243d-48bd-ae9c-10567d0de1a6@suse.com>
Date: Mon, 9 Feb 2026 15:10:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Advertise and support extended destination IDs
 for MSI/IO-APIC
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260209113412.2603088-1-julian.vetter@vates.tech>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260209113412.2603088-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1DC1F1101A9
X-Rspamd-Action: no action

On 09.02.2026 12:34, Julian Vetter wrote:
> --- a/xen/arch/x86/include/asm/hvm/vioapic.h
> +++ b/xen/arch/x86/include/asm/hvm/vioapic.h
> @@ -32,6 +32,19 @@
>  #define VIOAPIC_EDGE_TRIG  0
>  #define VIOAPIC_LEVEL_TRIG 1
>  
> +/*
> + * Extract the destination ID from a 64-bit IO-APIC RTE, including the
> + * extended bits (55:49) used when XEN_HVM_CPUID_EXT_DEST_ID is advertised.
> + */
> +#define IO_APIC_REDIR_DEST_SHIFT        56
> +#define IO_APIC_REDIR_DEST_MASK         0xffULL
> +#define IO_APIC_REDIR_EXT_DEST_SHIFT    49
> +#define IO_APIC_REDIR_EXT_DEST_MASK     0x7fULL

Can we please stop introducing pairs of mask and shift values? Already these
versus ...

> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -54,6 +54,9 @@
>  #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
>  #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)
>  
> +#define MSI_ADDR_EXT_DEST_ID_SHIFT	5
> +#define MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0

... this shows one of the problems: It's never clear whether the mask is
intended to be applied to the shifted or un-shifted value. Like you have it
down here, the mask constant alone is enough. You use it with MASK_EXTR()
and MASK_INSR().

Jan

