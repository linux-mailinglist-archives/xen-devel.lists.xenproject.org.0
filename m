Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL/uOoNmzmmXnQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 14:52:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E4E38941F
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 14:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271859.1559860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8HWc-0007ve-Tm; Thu, 02 Apr 2026 12:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271859.1559860; Thu, 02 Apr 2026 12:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8HWc-0007tl-Qq; Thu, 02 Apr 2026 12:51:54 +0000
Received: by outflank-mailman (input) for mailman id 1271859;
 Thu, 02 Apr 2026 12:51:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w8HWb-0007tc-Gr
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:51:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8HWa-00FAUJ-Sc
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 14:51:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce6668-e002-0a2a0a5209dd-0a2a450c8076-0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 14:51:52 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce6668-f40c-0a2a450c0019-d1558036e0a6-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 14:51:52 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-486b96760easo9214975e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 05:51:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a62616dsm85845275e9.3.2026.04.02.05.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 05:51:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775134312; x=1775739112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=37oUeQzwd1FO/hzuvv6FbRflQOYLfg6X3dRmyiH+plc=;
        b=g11PVKHPhDIvEfBHtyug51nGw/HbR9WSItss8NiUzET+oAJsFF5Awxq7C82ALIHJpT
         SJAU6g18OaXlEVD050T3F08ebDb5IrfbMytclTlJZbK5DHWVw7p56seRv8OMOAys7Y8F
         oSR8rb4bAwn/SVTZrlFaV3yrV15xK0+hqoOtxxtv0o1XUG6Sf/P99vbrL3HQWkkb92lX
         jDdC4V0QpQ4saQ+vU59AUfEZDTMtBM9j9wIz9YUCYMeNJ79sDwEaPhZ3UN6BKnHYEQHf
         RyF06jlL50yxrLnHjlRpGrpEJVax/LVdfGMx9g/l5retkTTkwe2Xe0izi1HFtZpDGL+k
         If2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134312; x=1775739112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37oUeQzwd1FO/hzuvv6FbRflQOYLfg6X3dRmyiH+plc=;
        b=X1b2JohFbNOYen6tgWM4hshYa+BbAS24Fk84z1hZzbli5l5ufe9z9xhferkI3yUDQP
         OJCrg9JzH2FZKQK9icSpGZc7z0MRR9XR9JBF+2WeGpqDAYDBBT8a8hFhmH9/X//+53Ix
         69zw/KQsxNNPMIPO6U8oPwTY+hKf86sZ0fQfa0sSO+OXuxcXgX/GPh+cBK++3W4Ln+6N
         6Z5FsrkKwL6qW3TCEAzZoejbPU2+GNq07sFAy2mHR5bwhQTb8CWxcfIabz1+8+AapDPj
         lStyy01B7mHpL8lDRzL/vlBA79Z6ykfW7HY++fLgidD41vnRu9u1M3M1hchdTG7RVzVM
         OQtg==
X-Forwarded-Encrypted: i=1; AJvYcCWzbDTbTkT2XzksB6ZmRdGKeiUXDVrfn6ek68sW4e8sHtAAzYUrMLDuZ29520fQIgi2z42JL9+cbwk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsooCMBOo0HcwECwPhi4ueLGoAan6OHW0LW7bEry0kvRHneSBf
	DPGA/J7Hfbr21csbnNcgNX1/fYYgBUTtW+B0ysCqhFzO5Xec7dv0H9XApbDCO3yepA==
X-Gm-Gg: ATEYQzzLF917fc8BGH23R7xaAv6oEA88A2ARlxS0iLqIH+dUpbeRdc7KVkEnf4kbwss
	pQPxmtzp7YDrPEngDZEoqjyoeXXWMAq/7LkBGbQah60/o4PzjnMlgV4MivopJBk1fvTETbQgi0b
	dsXv/jgROJycuprzDg4iue/d3Fe9a3XOr75Cb28DR57T7NnDAa+188zPT4UK2jxtCuN+DqKOMvJ
	Y6oqEQTztqxDjEnXWxZCFAk5asOfnrPgQZ6BwoTDBvt/baWBOdCnSqZ6aVTzCeQGwqdErflzUMh
	d9Ojko/utZgq8rhls61mnprNDHluqwKYXPhS+WlWacZpTRWZFwKfl0eI685cFuqp5rGbhvhmAcR
	4mT499HayS+LiuSfTl0DOxWOmiABlaxuuFLEyI3XG9sLmpePYVP62IfMH8ooBnfH+v4tifDqt5+
	7DN+5vxL0QLpYJHK6qa5vpCCMlWN8ERb8uBOXHkrSd//YR9GntuHA42LgaxEmuKX3qTPjC701v8
	zSJF8fUHcCIPIc=
X-Received: by 2002:a05:600c:4f12:b0:485:9a50:3369 with SMTP id 5b1f17b1804b1-488835a1820mr126393215e9.29.1775134312033;
        Thu, 02 Apr 2026 05:51:52 -0700 (PDT)
Message-ID: <072c0f21-a223-46dd-8ea2-f3591c2fd547@suse.com>
Date: Thu, 2 Apr 2026 14:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 17/27] xen/riscv: add missing APLIC register offsets,
 masks to asm/aplic.h.
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <2097fefb49fca36f641ddd7d7fb31e796a03619e.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2097fefb49fca36f641ddd7d7fb31e796a03619e.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1775134312-A51BBA3D-BC82449B/10/73395122804
X-purgate-type: spam
X-purgate-size: 2380
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E5E4E38941F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> These definitions are required for correct decoding of APLIC MMIO
> accesses and target configuration, and will be used by both the
> physical and virtual APLIC implementations.
> 
> No functional change is intended by this patch; it only centralises
> hardware definitions that were previously missing.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I can commit this as is (with my ack added), but I'd like you to consider
again my remark elsewhere as to ...

> --- a/xen/arch/riscv/include/asm/aplic.h
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -17,6 +17,11 @@
>  
>  #define APLIC_NUM_REGS 32
>  
> +#define APLIC_REG_OFFSET_MASK   0x3FFF
> +#define APLIC_TARGET_IPRIO_MASK 0xFF
> +#define APLIC_TARGET_GUEST_IDX_SHIFT 12
> +#define APLIC_TARGET_EIID_MASK  0x7FF
> +
>  #define APLIC_DOMAINCFG_IE      BIT(8, U)
>  #define APLIC_DOMAINCFG_DM      BIT(2, U)
>  
> @@ -27,6 +32,36 @@
>  #define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
>  #define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
>  
> +#define APLIC_DOMAINCFG         0x0000
> +#define APLIC_SOURCECFG_BASE    0x0004
> +#define APLIC_SOURCECFG_LAST    0x0FFC
> +
> +#define APLIC_SMSICFGADDR       0x1BC8
> +#define APLIC_SMSICFGADDRH      0x1BCC
> +
> +#define APLIC_SETIP_BASE        0x1C00
> +#define APLIC_SETIP_LAST        0x1C7C
> +#define APLIC_SETIPNUM          0x1CDC
> +
> +#define APLIC_CLRIP_BASE        0x1D00
> +#define APLIC_CLRIP_LAST        0x1D7C
> +#define APLIC_CLRIPNUM          0x1DDC
> +
> +#define APLIC_SETIE_BASE        0x1E00
> +#define APLIC_SETIE_LAST        0x1E7C
> +#define APLIC_SETIENUM          0x1EDC
> +
> +#define APLIC_CLRIE_BASE        0x1F00
> +#define APLIC_CLRIE_LAST        0x1F7C
> +#define APLIC_CLRIENUM          0x1FDC
> +
> +#define APLIC_SETIPNUM_LE       0x2000
> +
> +#define APLIC_GENMSI            0x3000
> +
> +#define APLIC_TARGET_BASE       0x3004
> +#define APLIC_TARGET_LAST       0x3FFC

... the case of hex digits vs the need to have L (and hence U) suffixes in
upper case for Misra's sake. Those suffixes are easier to spot as such when
the hex digits use lower case. Then even for un-suffixed numbers lower case
is preferable imo, for overall consistency.

Jan

