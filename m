Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDO9LBbqr2nkdAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 10:53:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1614E248E22
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 10:53:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249919.1547284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vztlm-0006wI-VY; Tue, 10 Mar 2026 09:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249919.1547284; Tue, 10 Mar 2026 09:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vztlm-0006ty-Sm; Tue, 10 Mar 2026 09:52:54 +0000
Received: by outflank-mailman (input) for mailman id 1249919;
 Tue, 10 Mar 2026 09:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vztll-0006tq-DV
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 09:52:53 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e76e3e7e-1c66-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 10:52:52 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439cd6b09f8so4298063f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 02:52:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2b9ccsm34080319f8f.19.2026.03.10.02.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 02:52:51 -0700 (PDT)
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
X-Inumbo-ID: e76e3e7e-1c66-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773136371; x=1773741171; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cQhj+ZqfJMzx6WmErb/09tHVtJEKFVNJ++SvDsmyi1s=;
        b=Do7c1ws/oVvNMslfXgjMg57ML1F3lJIPhTjZSjJRtWwHgWO98Tqdnu0ywgj5F1pGrP
         PSZCJL+sjAzt4LaNDjz0x9Kee+o7nTvrG6ezihL7r17sSF9j8KWfleRuw72+Gh3PRBuc
         FzMP+5NNAKvt5NIOMx2ubXaK2AGiMZ7fXdWIuu3+l2agzUPTwu3FYXrXUUXpWqHY63Gx
         8qmds77n6Kjd91XamE3nQ2fTaFHJq2bT0jtjlSL/PGFyx/91EuO79C1q27i+RmhEM3fS
         xdPKNFqFUMK+uqMaXmFU4YeQBXRQX2Ci+a2WVuZTDEN1zwljlED4Kdzae1cb4OfLwPe9
         CAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136371; x=1773741171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQhj+ZqfJMzx6WmErb/09tHVtJEKFVNJ++SvDsmyi1s=;
        b=oMdCQ5tvukWnyyTBPMtN7qCdW4ItmR+NnTHyEJ+wwaXFsA+0cSZJuLEszERo0O+xOz
         1FZozH0nHYMI+bGl7/TgB9DGI2RiQ05kI2Zqv+ow50Jfb3IuCCck4T+vPKQ4DrrL6+Z1
         lhGXnWTgyTZD0NeZ1DiKt52k20kc4R1suHOnbQ++llTdJTUAhTsGdapv+FR2cz95C02t
         a36wANodNKvvEfGFcIoT09Oyq2dTbOk4TxoVfiMf97ft3tjPDPSqw4yd5WejobjtsGgk
         lSMf9bd+1CCWQHCbQLt9SHr0NkNsgqXFIMQtMMcLAqKUClYjXaHJJ/y2tC9uQT5qEVkN
         tO+w==
X-Forwarded-Encrypted: i=1; AJvYcCWCpGQiwPeYHEI8vC/46NNZW8l5/Co3VcsVrBh/W1fzRwnj+dXpOeF1Ip8t2xPBoGO8ke12XkOl8lc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKG4rFvooBmtPiLF4guJj7+EH5zyv6+a/s2o7dvJvbi0ux7r+7
	CKhrXr/Cp5hiwehhXDacc80s+Gh8H/Aqk464KKSFbH6yKuqqpAylOgSXzxCaAJEfxQ==
X-Gm-Gg: ATEYQzzL4Iqm6rjfrKc85VGBtlJ7vMSp9W2ZGXoneYC/pWF21jmbydVMefii2rmDCqn
	89cWiaC5NtDGNNXmSJ6Hk9BWMHwup+plXSDkq3LKCETn2mK/DoBTuuXv6PWQLgkgArfQW4tMLoH
	/un6Az/XWKMu2LsC20Pn6QA1JhW5Md11QRNN7YDTSEfToWWFa9Ocd4so5E3/VIiPxULPPbJ700O
	+kXQdr7D/SNVjQ67fSuXY+n1hHXFqAftzjS/+gKLUiF8Yn9Zefn266saoGD8ozg8FWFnqa6X7mK
	ePa5tD7uAYGr1uLuYv0l+4CYuDgHTfv+bR0+oZ2O3AePVwcWRuOIEu/uU4A2fnJ8NqP6Juib2rQ
	tIoGNu+vpV/gPtg7bbe5kDMZNeVWGCbeL7IjUp6viXmjm1hxSkLSQ7OoZBzA8BqE6uajOibA6mG
	6lPmeoxdyYUgZjIBiYMyJBPsjt9Hs6Rt2YDHIVOJZY/6NxtwWXrPnpM1zfXNLFof4TIUA9P6h48
	EGfarKqpIcvsqc=
X-Received: by 2002:a05:600c:c107:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-4853ebab021mr64815165e9.3.1773136371546;
        Tue, 10 Mar 2026 02:52:51 -0700 (PDT)
Message-ID: <a63a2d5c-dd39-45d1-88e4-18f208be4582@suse.com>
Date: Tue, 10 Mar 2026 10:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86: Remove x86 prefixed names from mcheck code
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
 <20260304195350.837593-2-kevin.lampis@citrix.com>
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
In-Reply-To: <20260304195350.837593-2-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1614E248E22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,citrix.com:email];
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
X-Rspamd-Action: no action

On 04.03.2026 20:53, Kevin Lampis wrote:
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
> ---
> Changes since v1:
> - mcheck_init() check for family != 5 instead of 6 and 15

Imo this wants splitting off, to have its own description. In particular, there's
no 64-bit CPU with family 5, afaia.

> @@ -564,8 +565,7 @@ bool mce_available(const struct cpuinfo_x86 *c)
>   */
>  unsigned int mce_firstbank(struct cpuinfo_x86 *c)
>  {
> -    return c->x86 == 6 &&
> -           c->x86_vendor == X86_VENDOR_INTEL && c->x86_model < 0x1a;
> +    return c->vfm >= INTEL_PENTIUM_PRO && c->vfm < INTEL_NEHALEM_EP;
>  }

Wouldn't this better be

    return c->vendor == X86_VENDOR_INTEL && c->vfm < INTEL_NEHALEM_EP;

similar to how you have it in mce_is_broadcast()?

Independently there's the question whether this is correct, seeing that
INTEL_CORE2_DUNNINGTON > INTEL_NEHALEM_EP. But if a change was needed
for this, it would want to be a separate patch anyway.

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
> +    return c->vendor == X86_VENDOR_INTEL && c->vfm >= INTEL_CORE_YONAH;
>  }

Is anything below Yonah 64-bit capable? Even Yonah itself isn't 64-bit capable
afaics, so perhaps again this check can be simplified in a preferably separate
change (possibly folded with the P5 related adjustment above)?

Jan

