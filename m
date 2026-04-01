Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFjID3sizWnOaAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 15:49:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A471E37B8F7
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 15:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270305.1559006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7vwk-00084P-RP; Wed, 01 Apr 2026 13:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270305.1559006; Wed, 01 Apr 2026 13:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7vwk-00083G-Nn; Wed, 01 Apr 2026 13:49:26 +0000
Received: by outflank-mailman (input) for mailman id 1270305;
 Wed, 01 Apr 2026 13:49:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7vwj-00082P-5T
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 13:49:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7vwi-0074BD-HW
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 15:49:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2253-5cb7-0a2a0a5109dd-0a2a4508bf48-28
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 15:49:24 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2264-fab6-0a2a45080019-d155802ce0af-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 15:49:24 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-486b96760easo76685635e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 06:49:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e843a55sm96574955e9.12.2026.04.01.06.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 06:49:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1775051364; x=1775656164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2jGw2rrI8V1cOSlVi277JEgtmimJFPcYSIO7U6jarSo=;
        b=LmJPws/G0+/1IEQrlOU+7m5H/GEQKFmjW6M3D0yHicpXxiOUqjYiE28zwsRJkF5pXe
         F87zSiSBajpx0MxHGNHPcBmS458n4UByj39L45RG7VgU0TInS1ehwahXDSv70fyXWDaK
         NbyU3kU12hwHzfbZ8yCP/T4bPlFxX+n42HxXsmLIhA3+eO50E+75RGaoOsItWSCNSHVF
         AKmxch72EvnR5Kw10/npqL6IX76lsasUUE3KoyytxADEJOBtn84M3pnNft+Wzs9Wcx7U
         0d9brcDHvmGUWxrSIdkvz5oxQJbaxEpqzjBO/QO9jrtCuusVYDWcbyx5/BWazfFt3FLr
         ZRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051364; x=1775656164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jGw2rrI8V1cOSlVi277JEgtmimJFPcYSIO7U6jarSo=;
        b=sFh2u5m+6WCRtP+7R0on6/37J0DTeaGvN7r8KkZ2flDNevVvJhaTI8CQmBrlJ71qN8
         AJx4dRKu6slAcyPTJi/ZPO0OYrY5OiNmsjR8Hl5d7ocYPFjtkcg5uaO9UYabWI9h9zNU
         yvaFEbijqhQdlQI60OBSDYTKOfLgPAvADgJPe8di/ORXhysW56BEI1ipmCceQmbsnD08
         LcN3bAKggA3/A+9cI+jLy8EQ5S0w8kHKyKY71OdFL9lrl/obR00Fp8ns8nRBFHNhphKd
         Ettkc64GUixD9YdZDqIiVbSDyIjvCZ6JB6AZi7Y0ufcDAihCoR1WJrdzBp4Tvao8MD4P
         ou1A==
X-Forwarded-Encrypted: i=1; AJvYcCUvUXmaZSwOacVVVrZlA6xyM4dPH3+xjEqK3cBMWts6+dgaQ7XoreB00uBZIy5loycrg5baWmWj3x0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxr/iCNAzbasDY6f1bWj63S2R0Z/2e16iFbHM8WzqsNqx+C8xHg
	GVqyrV98wBpPAX+TH5dHEYywJ3zJCs1T6N48CgLYC+RsOHVSNUe1kHdfA7lUYIlcTQ==
X-Gm-Gg: ATEYQzyMTCjC1ZA5MSoMhgNPR3/Bnfsp70w7qnh5f2s8tLf3Iug+yshZ0TZZGN6Punn
	Hj36lVBI9s1YBQyE7BKRlD3a9p41/2iD4ZmjQB8wcxHNKPI0/e0SawXZaliHkNqFONM02RyF1Y+
	dKThuNV/T5Dl/w7T/dingCBHrqs82dJZqvX8IaUoiZRSj86t+ZGgs/K4nlWj0t/U2ANKjkW8tse
	PjuLXQ2SRaBosy5gutfLHZnPluNFBJIVX0uB7Win9zsakKBb7OQ6uTnpSEoitvM4xS52o2A3Dh+
	LLZ/Tvl8LwaRJQOHRtTu5yDCAPD++o9WskQYRMobGjkJScI4hO08tOTHl+l952c5F6TcxiMoRAb
	qTLUCDpE27Gh/hg+bRT73UF3dubGbRAVBiaOhxcseVi7XI1f2Kh1nB2ehiBoI8kOgy8cXOVg5Cf
	tnHePwFnO8JVw6zzCSKNmswFK72Os/wQn+5zi0K1MxZiDls5tWpAZuSDKtLDpBkQV4dFyAzYoPK
	fYvuvnBNfvk7O4=
X-Received: by 2002:a05:600c:8b88:b0:485:3f38:3de3 with SMTP id 5b1f17b1804b1-4888355e6e3mr65651705e9.3.1775051363743;
        Wed, 01 Apr 2026 06:49:23 -0700 (PDT)
Message-ID: <efe5b1f5-29a0-43a8-92f8-cc20bd922e62@suse.com>
Date: Wed, 1 Apr 2026 15:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/27] xen/riscv: introduce guest riscv,isa string
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
 <007c0a0243ac7ff1d1ab3faa4ebcdd6fcd14e485.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <007c0a0243ac7ff1d1ab3faa4ebcdd6fcd14e485.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775051364-75557497-9D6FEE11/0/0
X-purgate-type: clean
X-purgate-size: 4483
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A471E37B8F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> Introduce generation of the riscv,isa string passed to the guest via the
> Device Tree riscv,isa property.

Title as well as this suggest this is all about guest properties. Then ...

> The following changes are introduced:
> 
> - According to the RISC-V privileged specification, M-mode software controls
>   the XLEN value used by S-mode and U-mode. For RV64 harts, the SXL and UXL
>   fields of the mstatus register are WARL fields that define the XLEN for
>   S-mode and U-mode.
> 
>   The XLEN value is provided by M-mode software (OpenSBI in the case of Xen)
>   via the riscv,isa DT property. Introduce and initialize an xlen variable
>   when parsing the host riscv,isa string in riscv_isa_parse_string().

... suddenly talk is of host aspects? (See below as to what "xlen" really
is meant to hold.)

> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -38,6 +38,8 @@ struct riscv_isa_ext_data {
>  /* Host ISA bitmap */
>  static __ro_after_init DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
>  
> +static __ro_after_init unsigned int xlen;

Nit: Attribute between type and identifier please, whenever possible (it
isn't neatly possible in riscv_isa above, due to DECLARE_BITMAP()).

> @@ -160,6 +162,19 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
>      RISCV_ISA_EXT_DATA(svpbmt),
>  };
>  
> +static const unsigned int __initconst guest_unsupp_exts[] = {
> +    RISCV_ISA_EXT_f,
> +    RISCV_ISA_EXT_d,
> +    RISCV_ISA_EXT_h,
> +    RISCV_ISA_EXT_q,
> +    RISCV_ISA_EXT_v,
> +};

This could do with a comment clarifying what needs (and what doesn't need)
putting here. My expectation would have been that everything in
riscv_isa_ext[] which shouldn't be exposed to guests should appear here.
Yet then there is V (which riscv_isa_ext[] doesn't have), while e.g. Svade
and Svpbmt (which iirc won't be available to guests right away) aren't
there.

> +static __ro_after_init DECLARE_BITMAP(guest_unsupp_bmp, RISCV_ISA_EXT_MAX);

Is the _bmp suffix really needed? riscv_isa, for example, doesn't have it.

> +#define MAX_GUEST_ISA_STR_LEN 256
> +char guest_isa_str[MAX_GUEST_ISA_STR_LEN];

__ro_after_init?

Yet then - can this really be a global? Isn't the set of extensions
available to a guest a per-guest property, i.e. a global could at best
represent an upper bound on features?

> @@ -193,6 +208,15 @@ static void __init match_isa_ext(const char *name, const char *name_end,
>               !memcmp(name, ext->name, name_end - name) )
>          {
>              __set_bit(ext->id, bitmap);
> +
> +            if ( riscv_isa_extension_available(guest_unsupp_bmp, ext->id) )
> +                break;
> +
> +            if ( ext->id >= RISCV_ISA_EXT_BASE )
> +                safe_strcat(guest_isa_str, "_");
> +
> +            safe_strcat(guest_isa_str, ext->name);

Shouldn't you check the (kind-of-)return value? (Yet better would be a build-
time check, but I can't think of a way to achieve that.)

> @@ -207,13 +231,17 @@ static int __init riscv_isa_parse_string(const char *isa,
>  #if defined(CONFIG_RISCV_32)
>      if ( isa[2] != '3' && isa[3] != '2' )
>          return -EINVAL;
> +    xlen = 32;
>  #elif defined(CONFIG_RISCV_64)
>      if ( isa[2] != '6' && isa[3] != '4' )
>          return -EINVAL;
> +    xlen = 64;
>  #else
>  # error "unsupported RISC-V bitness"
>  #endif

This can be had with an initializer of "xlen". Then the (kind-of-)variable
could be const unsigned int. Seeing the use below, is the variable
correctly named, though? I.e. shouldn't it be guest_xlen or some such?

Independently I expect you will want to support 32-bit guests on 64-bit Xen
at some point, in which case encoding this value into a global string won't
work very well.

> +    snprintf(guest_isa_str, sizeof(guest_isa_str), "rv%d", xlen);

%u please with unsigned int.

This being the only use of the variable (afaics), why is it not function-
scope?

> @@ -487,6 +515,11 @@ void __init riscv_fill_hwcap(void)
>      bool all_extns_available = true;
>      struct trap_info trap;
>  
> +    for ( i = 0; i < ARRAY_SIZE(guest_unsupp_exts); i++ )
> +    {
> +        __set_bit(guest_unsupp_exts[i], guest_unsupp_bmp);
> +    }

Nit: No need for braces here. And anyway - can't this be had with an
initializer for guest_unsupp_bmp?

Jan

