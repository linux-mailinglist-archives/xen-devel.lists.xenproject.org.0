Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D30C632CE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 10:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163534.1490624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKva6-0000UV-7j; Mon, 17 Nov 2025 09:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163534.1490624; Mon, 17 Nov 2025 09:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKva6-0000Sd-51; Mon, 17 Nov 2025 09:31:30 +0000
Received: by outflank-mailman (input) for mailman id 1163534;
 Mon, 17 Nov 2025 09:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKva4-0000SW-No
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 09:31:28 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c4c7bb6-c398-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 10:31:19 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b7291af7190so577950666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 01:31:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b737c38c619sm600649466b.1.2025.11.17.01.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 01:31:18 -0800 (PST)
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
X-Inumbo-ID: 2c4c7bb6-c398-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763371879; x=1763976679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yerW25dGvgcbFbGkdVLoeOxLybcdbOVC80ZrnezDTiU=;
        b=CRMkmWgGVx8rHly+L81yl66otol9a8g8Nn+V8TexVpOdWd3h669/mDLTsHoVFpGaiy
         3kfu0RTUsz+ussvSNOK/5qLSIaY87J/4hC75mkgr0TAODssRgLkO1aEi/EEO3e19YjwD
         kiQC+TzF9OcSuryFOomkR8bKE+xGe9SjgO8N18DjSzbSzCoen6gtQdo1Rtd+SFSLHr4K
         c9bN2cd6Jxi7rGRuar1Ee+LM5dvixZTsky/A1QuyHtRD3inJ5enNjKAkaYaDThH2goR+
         mLtEoVD3jDaxkk0PHSU1LRhSD5hTHh9D8Hq5JRD9AtkomQuwTFMHfwZquYUxHdFwtxgL
         QJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763371879; x=1763976679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yerW25dGvgcbFbGkdVLoeOxLybcdbOVC80ZrnezDTiU=;
        b=mF7PFwqB00kvA1tm9a4zN8qSXC6gr6K6IG5Cjfz0mVDUmtxOU/wgEvbcrJd43JD2ye
         hC+R9nwp2q81OPdIsJqgtLgIQDIBEByhY4GeiWBCH9LCVlikJBanzL1w25kNhFMujHFj
         uqHzJUuWp6rNZjyNCwXS4GQ0MdiEipQEO4kZqaUx+Oy77MPdFYCWo+DWdb6Qilr9VDMF
         H2BED1hOwivKE88m9XeM7ugKjZ4H2zF6N8Q+6X/fBx+6/iZ867WA0B6H6y9dP62TOF+L
         H4hFsGdnH9jzg8RwgxwzalvA+Od/zYJYz2RbOfqtmRFuN80WtjE+27nnRH9KffYD715o
         Xsmw==
X-Forwarded-Encrypted: i=1; AJvYcCXoIn1i1ldoztTv2vSaJPCSHpBe1VC/uv6kXFuX/vnidjmB9v0Pb26lLkU33XoSZI4jcNcmOg+LJiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdUyr3QWijTOQpy9c0yCELtrgUAh6mgRmcxmodKOIVMMN4wnkm
	hD8P+WSe1q2DvcYE0+kGGfPUs8CqPTjubKxdxTjoLRix4YFaXnuQovcKwOVtlFYumA==
X-Gm-Gg: ASbGnct+DytdOkVrNxfdM1IQEYtSFJtWPugy6Zh+XjL66wSYkBKU8GAt/6J9NZg/WIj
	fgbv8UFKZloMcgok04qDBLzKOK74xtShV0ubJWEfgma7ZKrgjW3PI/1kvdI/cWUtNdsfz7K+0sf
	PvCt9G2sj9SLgTHSNiZdmxnwdnSIypTnc/k+rYlLIEUMA7Km8C0dx2EnchEyFOi7msgDX2laI12
	hbL7mVqJ7lXc6IgFOVOaaJSWfC+mOGXATjoryVampMITbAROkHP6XppjMbsxDRzDRKScVuzCoeG
	H5vG4CjKklHZFWczG3ctiZAqU+Cp0aDIOeXiD8MZL2YOugklM8jmCFIYxW2uVdvCt0OiNlKtlgf
	kyK1BZG1rvK21j8AnZfxFnHH4PHeljZd6mHnJQ7gVEVKuptnDHSPARpdAM0NPkBBwR+dWEgFC1I
	20VU/njp/Av1B7McS4znURwEUfsAgKW8q67GYZ3n8Rsm/ywgpGuhqzIO3CI+HJ9HHf
X-Google-Smtp-Source: AGHT+IHXQMrxWpVsS/Z2t9jGaxu45zEl1JZ4nBag/HULCyd7lWkQ8v/gjAmAqLSV7ZwCARMXD4fixQ==
X-Received: by 2002:a17:907:3c82:b0:b6d:5df7:3490 with SMTP id a640c23a62f3a-b73677ee60dmr1002033366b.1.1763371878846;
        Mon, 17 Nov 2025 01:31:18 -0800 (PST)
Message-ID: <0557029f-5946-4ee1-a622-842e2698a6c8@suse.com>
Date: Mon, 17 Nov 2025 10:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] common/libfdt: optimize usage
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114180130.346755-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251114180130.346755-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2025 19:01, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Now all libfdt features are built-it unconditionally, but...
> 
> X86: The libfdt is used on x86 only to parse Hyperlaunch/dom0less Xen
> nodes, so full libfdt is not needed in this case and minimal, RO
> configuration can be used.
> 
> ARM - situation is more complicated:
> 1) ARM reads Host DT (fdt.c RO)
> 2) ARM reads passthrough DT (RO)
> 3) ARM generates dom0/hwdom DT from Host DT (there is a mix of WIP and SW APIs)
> 4) ARM generates domU DT (there is a mix of WIP and SW APIs)
> 4) With EFI enabled - ARM needs RW API and fdt_empty_tree
> 5) With CONFIG_OVERLAY_DTB - ARM needs RW and fdt_overlay API

This goes too far, imo.

> --- /dev/null
> +++ b/xen/common/libfdt/Kconfig
> @@ -0,0 +1,14 @@
> +config LIBFDT_WIP
> +	bool
> +
> +config LIBFDT_SW
> +    bool
> +
> +config LIBFDT_RW
> +    bool
> +
> +config LIBFDT_EMPTY_TREE
> +    bool
> +
> +config LIBFDT_OVERLAY
> +    bool

Nit: Inconsistent indentation.

Also, how would one be to guess which of these may need selecting? What do
"WIP", "SW", and "RW" stand for? What exactly would "empty tree" mean? Yes,
you follow what the files are named under libfdt/, but that naming is
overly cryptic, too. The comments at the top of these files also don't
say anything helpful.

Jan

