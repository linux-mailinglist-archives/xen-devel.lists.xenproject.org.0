Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP8oASwPwWk7QQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 11:00:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C60B2EF883
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 11:00:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259153.1552465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4c4h-0007vV-PB; Mon, 23 Mar 2026 09:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259153.1552465; Mon, 23 Mar 2026 09:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4c4h-0007sU-MJ; Mon, 23 Mar 2026 09:59:55 +0000
Received: by outflank-mailman (input) for mailman id 1259153;
 Mon, 23 Mar 2026 09:59:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HLc=BX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w4c4h-0007sO-1Q
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 09:59:55 +0000
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09e7c1c7-269f-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 10:59:53 +0100 (CET)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-486fd5360d4so40717995e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 02:59:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486ff1d3befsm76524565e9.32.2026.03.23.02.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2026 02:59:52 -0700 (PDT)
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
X-Inumbo-ID: 09e7c1c7-269f-11f1-b166-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774259993; x=1774864793; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3DLANbnAjGM/Eoas1qkKQhrJXINnxOS1h4TXdgu8BeA=;
        b=Hjbg/2ZjunPLaF5CvWzkCy1GXCVXwddZBoTxCSQxVTpVo5sVgh2OGJk9Zw3NjtSQRb
         v3L51IdX+3s1gET2DA0qK/Dn8McEKKWZQ6xFvLPlozZpalj1JJ5ipN26ghDy8Edy5/4J
         C2O6FsJBklWg37YfxkRMNaznz0R0GSUI0BzJAOreV+5GVeF4g1c35ybBPhQch8tWiwVs
         7D5SbFbN8LGKmNZn3Upj6LtBV2aOS4nTQ4pjCxFS4KqJaZSM7SpKb+EAY7SU/XzBjCcJ
         KipzfntlNLkX5nflOlj7EP0kNDDAlZQRgxVyjUPf5B49stdtBIZ51ais5OxBLz+I4jOP
         X+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259993; x=1774864793;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DLANbnAjGM/Eoas1qkKQhrJXINnxOS1h4TXdgu8BeA=;
        b=RfS41XAuztPizy+hKM/MUArZmL0UUrNwoIq5zyUWyF6Ul9nXVhER822FVFlXTvZhwk
         nw7Lzh81zfQra9SeKrCy1yOA3AmbFnqjkgQi/7kwkaEKY6WlWI/OXNud2oRwrtXbmTvr
         baIefLAd3fRM8Cn1cHvodxefUInldbDE4YXjdeZCJxYcfkqrVq59maFQcBS2cCiWr/UV
         uDnQMlqlbqUaS4C7P4crCL35DMAbC88etbgLb62ASKVu9rE60N/8l6tch3DfwcHMjtP8
         bcf1UW3j/7KZfK03Uy/97TgHtmw2WXfwwcGshHVejM0DsB96AbINFWxGb6ygdFSMeMA3
         fEXw==
X-Forwarded-Encrypted: i=1; AJvYcCWcsFdJ4DHg7joutJSMy2SThplKfO7wLSmk81FZoGU4RtXioW1h3aQdii9f8H+xzpOuNLN7uBz4bac=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDvDET6E4POFhbsAlnYVkq/f/j8nkKUS7EGzBLU7CPblr2mCEh
	Z29rbLBzxs8ZIMVzCAT2MhGOT/2hFfIMPl7XyOi7PP1pD1u+8yxS/xOuZS43Han7rg==
X-Gm-Gg: ATEYQzwSsCr10escNbqfYHy0h9B4IHbgt94ZeluqUu+VlGr1CqCZj2l71tkIWlmXBN6
	n9M/ZHUPBjTauxb9vhsOgtEVuHBqYxfLL2oFapyhljEryD9JagoaCf9inscBvAGmOpbvnRF+r3I
	P+joZZ0q4LT5obX+w5hiPx7Nc4WmEDnBvAFdFGoi23o4rpo/BZwZFEBM6FWRWzuDyLbIRwmpuXs
	aktA+Ex11TvjUUGqCRlY1CNnhligHJ7fXuZvtF22A7BqEQEzJ7B6jPf7fNnWFlCoOpWiGxaGpAN
	e41Gc0rycrqlyTiVK/5JDOFoifQ0/ruaK6jvgu8tVMMsFQ+JVz/KKP9WOygNmCwlz13wu4Kp32U
	SPZDPlg/ff21WqM+YavFZXwvrINViTp1ofe/ihvXhomY0OEAJJDa6JR6QJ76kUJduxc+c5TLWnM
	EmEUUVcTS0MGenOH5Go5e0uW3e7U8UvpUCVcYm/yxOe7GByMtEJvdf58wreuR3no0fZjHg9lHjZ
	fqo2wC84WMn3x4=
X-Received: by 2002:a05:600c:a4a:b0:485:4eaf:eb14 with SMTP id 5b1f17b1804b1-486fee0fbf6mr146228095e9.21.1774259992755;
        Mon, 23 Mar 2026 02:59:52 -0700 (PDT)
Message-ID: <bf640040-22b2-4d30-9e1f-df60be623ff7@suse.com>
Date: Mon, 23 Mar 2026 10:59:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v3 2/7] x86: Remove x86 prefixed names from mcheck code
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
 <20260313163630.1073019-3-kevin.lampis@citrix.com>
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
In-Reply-To: <20260313163630.1073019-3-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4C60B2EF883
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 17:36, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
> 
> No functional change.
> 
> This work is part of making Xen safe for Intel family 18/19.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

This description doesn't quite cover ...

> --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
> +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
> @@ -711,10 +711,7 @@ static bool mce_is_broadcast(struct cpuinfo_x86 *c)
>       * DisplayFamily_DisplayModel encoding of 06H_EH and above,
>       * a MCA signal is broadcast to all logical processors in the system
>       */
> -    if ( c->x86_vendor == X86_VENDOR_INTEL && c->x86 == 6 &&
> -         c->x86_model >= 0xe )
> -        return true;
> -    return false;
> +    return c->vendor == X86_VENDOR_INTEL && c->family != 0xf;
>  }

... this change. Code changes themselves look alright.

Jan

