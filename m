Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIvlKDQremnd3gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:28:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A01A3D3B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215844.1525957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7TB-0002uG-UT; Wed, 28 Jan 2026 15:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215844.1525957; Wed, 28 Jan 2026 15:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7TB-0002rE-Rk; Wed, 28 Jan 2026 15:28:37 +0000
Received: by outflank-mailman (input) for mailman id 1215844;
 Wed, 28 Jan 2026 15:28:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3VuQ=AB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vl7TA-0002r8-0P
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 15:28:36 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0225b2fc-fc5e-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 16:28:34 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso71738255e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 07:28:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806d2585c7sm5132205e9.0.2026.01.28.07.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 07:28:32 -0800 (PST)
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
X-Inumbo-ID: 0225b2fc-fc5e-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769614114; x=1770218914; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QJiCCndpxa6ouT+7PHOSAAeS88/5FL9y7dxzhap/E4c=;
        b=WiY355F80AqEntlFwMtfEtibymuAK2Oh1TxB7UcDTIYLOnEfkVprClhgxfnKturnT3
         xhWo9CmWCI6CDjyaT+920pEUJ67blNif5QVap3hgFlWUkDHY2nfAgVurwy6nGjMdJRTH
         Xp3GCrbUs/NVkZuFFiQEPCaYwWg4TsDDa/zgonnHAULQbckmVJM98UoYl0wQHvQDGYi2
         zVsTAMf/aml8e6BlEbLYYyJmaBi/DBaIqn3fgXqVEUYqV4HuShJjQdKDvEehIiGLl2FY
         MRgSmkN0dR4l9OcMQFouqFfwgo3glIBh5dEqL2aK7/rtKfZd59jAxzCaiuhPEgSsRh38
         m5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769614114; x=1770218914;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJiCCndpxa6ouT+7PHOSAAeS88/5FL9y7dxzhap/E4c=;
        b=VphrM6WYMuKWLeCXkFQEZ0xKCyp1rhW28TsgXYgJNxkY0vcA2/PAkgvJMat8FZunMz
         8VHOCcy0AiDMi5I2hUQ2rAcOdMhT4WMZ+4+Q1nFRPzLDoboMxr/rkzM85gnSIxP0l5bL
         OhdQUj+jKRul9mZDRO1FynxngFgOjFgBCqrDiP+YvYf433UEFjSLhQ+IB2jtgmwxEWrx
         uUl0IGeFxEmWd9d3+dTFrvxSgEaS+zBsp25WqObTrtvtGFTwgxAiHgxlWw9B4vAwKClS
         HFUSpNL08uBjK7GXgbGCbplPtW0ZOz2lOxhBf/563rujrcnkxY5TAe9Fub6lgt8ig5Yr
         Pn9g==
X-Gm-Message-State: AOJu0Yw9cTr2BaOsrMQphTjf34cOhXAkwLTKyWyzUvOgcPB2gXL6tX/C
	MPtmtaW932aQGRM64BirgGyguV47V7Kj7kdMxDSUEbCMJ8qNsR0WnthcIqn7iSajCA==
X-Gm-Gg: AZuq6aLCwT4r3BuJfmtl0q4UvXmIb4rY7aEybCDp1ZhV7Obkt9F+4knrsJ+CODdUEw0
	ltKZtNH4ORfXDIQPhJteuG2j1llzhPKu/AvTWC/n10zth+W+kUadvZJXL4SsRkvk40ia9q/3+F0
	waYsANB3pCWxxM+sORCU0VCF9h81kM/NFn40oA6C8oBbOcxe7DiFd/i/H6XfnBckbsN97NRjuqk
	6CzGP2r4gBh8YsjvDSSkY1yo+h2GkLTXS8XbEn6DwmH3HXQkDU4QzfWwPq6A1ge+hL05oeOHYEJ
	2/UGD2nV+WnSGutO1xZ0+fx1iXMxBQv0NYax+MHnfwqrgoDxCqNFeBntwgI9MWKPqxuvvrpNzVn
	z8308akDnO++yR3qbupmOlLgYu7HEJ+9mcyEA59QuI/HAVWgVjkkbfJ8usNUb+Sa+bODy7yr4xK
	mLf9/OJwvDwM5dq6UVApbsnY75cyOU7rtFAXtWRQtCUdvk43g5y0kpg9/7Wx/tYZmWUC5Oam6Zg
	HI=
X-Received: by 2002:a05:600c:4e8b:b0:480:4a4f:c366 with SMTP id 5b1f17b1804b1-48069c486e6mr63034295e9.20.1769614113694;
        Wed, 28 Jan 2026 07:28:33 -0800 (PST)
Message-ID: <9a0db632-adc1-4ab1-8905-b73f337cda39@suse.com>
Date: Wed, 28 Jan 2026 16:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH] x86/EFI: correct symbol table generation with older GNU
 ld
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <27f291a3-6546-4834-a9cd-22a4636b152e@suse.com>
Content-Language: en-US
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
In-Reply-To: <27f291a3-6546-4834-a9cd-22a4636b152e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[jbeulich.suse.com:server fail];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email]
X-Rspamd-Queue-Id: E4A01A3D3B
X-Rspamd-Action: no action

On 21.01.2026 11:05, Jan Beulich wrote:
> See the extensive code comment. This isn't really nice, but unless I'm
> overlooking something there doesn't look to be a way to have the linker
> strip individual symbols while doing its work.
> 
> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This is, afaict, the only left piece which prevents "symbols: check table
sizes don't change between linking passes 2 and 3" from going in. May I
therefore ask for an ack or comments to move this forward?

Thanks, Jan

> ---
> Should we try to somehow avoid the introduction of the two symbols when
> using new enough ld, i.e. relocs-dummy.o not needing linking in?
> 
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -339,6 +339,24 @@ SECTIONS
>      *(.reloc)
>      __base_relocs_end = .;
>    }
> +
> +  /*
> +   * When efi/relocs-dummy.o is linked into the first-pass binary, the two
> +   * symbols supplied by it (for ./Makefile to use) may appear in the symbol
> +   * table (newer linkers strip them, for not being properly representable).
> +   * No such symbols would appear during subsequent passes.  At least some of
> +   * those older ld versions emit VIRT_START as absolute, but ALT_START as if
> +   * it was part of .text.  The symbols tool generating our own symbol table
> +   * would hence not ignore it when passed --all-symbols, leading to the 2nd
> +   * pass binary having one more symbol than the final (3rd pass) one.
> +   *
> +   * Arrange for both (just in case) symbols to always be there, and to always
> +   * be absolute (zero).
> +   */
> +  PROVIDE(VIRT_START = 0);
> +  PROVIDE(ALT_START = 0);
> +  VIRT_START &= 0;
> +  ALT_START &= 0;
>  #elif defined(XEN_BUILD_EFI)
>    /*
>     * Due to the way EFI support is currently implemented, these two symbols


