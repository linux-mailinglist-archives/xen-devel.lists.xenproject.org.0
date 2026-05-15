Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNT4ERcPB2qbrAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 14:18:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A825F54F526
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 14:18:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309963.1580969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNrUV-0004He-BE; Fri, 15 May 2026 12:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309963.1580969; Fri, 15 May 2026 12:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNrUV-0004FI-7p; Fri, 15 May 2026 12:18:07 +0000
Received: by outflank-mailman (input) for mailman id 1309963;
 Fri, 15 May 2026 12:18:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNrUU-0004Dx-07
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 12:18:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNrUT-008VmL-Bk
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 14:18:05 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a070ef4-e002-0a2a0a5209dd-0a2a4507c44a-18
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 14:18:05 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a070efd-229c-0a2a45070019-d155802db418-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 14:18:05 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so107044145e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 05:18:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febf8305dsm17076655e9.9.2026.05.15.05.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 05:18:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1778847485; x=1779452285; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=56aPe6Sl70jf73ZxmQ1aaiuBQCF7Crluv9U2uPdl1fo=;
        b=GTZZJOeqnjm+zqnc2VbDccXmbclDzeQ42SLTFiMT0aeKQ7zj3DEUXM+RadoJ0x7NE/
         hZn95WC0o0y3wKEHQe5mR+xr5vHu+AMy33vAbWYXFmDYucE2VYqDNIIZx8k2EqALLXUa
         6ohHzxmQkO/Nkkahtb+7iGat6LWQHTWV1eVr+DVEHMGjPteeHFA/Y3hlsBEmks7by5g0
         z3jJEISaLldKvfnzZoerDaikZpuHosmTvxglF0RfkqbCw+zLVB9Qmh1DJQraLD7A1VUV
         Sbu9dg8PQoekptCB5GXP470RezEeyzc4OWJxgc9+6x/sz0jWuOV/0aUL8D6u+YefhHpN
         WG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847485; x=1779452285;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56aPe6Sl70jf73ZxmQ1aaiuBQCF7Crluv9U2uPdl1fo=;
        b=Zqrt+PdHCdeWF6QqqDjWZHsfcmPyWPed53A+PE5TYggIEueRv5mrp7oTOzGBS9/wII
         JFQoKSgAafZqI5iYW1wgDCwDLE48dSTGdwi3xHEDMBS9URoF5fmdPJJWORRojODS/ykw
         05zl6A7yTxzNS9JJSOIPUL1psfMLFcyAr+m901g4fghbiq3JrE6+bD70Xhidl1GqzWf9
         be95cMAoUO7cNkw05sTUDwhyFzJ/Uk9EucPB8cfdqbeBOshKII8keH1IsUsohhIa1C+n
         f4OAeKMHNFH9APl10WYMh8wbkh1hsLA1LweHET9l4pxb0z5LibYtQGuQeOM834S/edqQ
         nlAA==
X-Forwarded-Encrypted: i=1; AFNElJ/xD2TKUxN8qKOna/0Mv1DsACBIyWI6xM+CH248loU30vxIb0A9Jue/dKi7CapWU943tMnehOj2Cvo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyN8x0Cl6igxlxSBQAmdCXb7EOTmCQy3EykZfar4tcoUCtoTHqI
	AV/nTJhf4g1PO3dbgZJFwXpq7ljY9x8wUtmffelX5PPY8iTX2hDlJWJAtGQVW4KvbAXcpy8HQ8Z
	d5/M=
X-Gm-Gg: Acq92OGVWD9OXtLcuzmztRaz2LrYIcztn18+bITJSUpEYK2TNarMsMo0gtXe8PjHQVN
	VgdxftPyNntnp3A2cNOvXDZyenXOfoN8l99IJhhNViQ95rNGpssj9kZXX2o/7nhO/mVE5B2v8DC
	SybI9PW4kS/odeivYBzLFDII7rId4Of7PLm8Kj8gM1Qa8r9gMDunfttW1U7i0bM8IgiZ1kkPGcJ
	f1ax2eB5PK00r6jPQYh/SF74/Ov1QFEIRGwLobpFZ0sNuGphC0uApb0ONN3Y1OoN2hoAWbSb+v/
	se6ItNm3X+tjijbzHVpQBJtC7nhDrmJI8YhMx8026wFBEcEg963r+3ru0Hr5/ST74tOUXZJCr0K
	lVPVYKTdJQw2OtjlyO83TzuZDupZkW2pC8lo4VRia4t4DHaExztFJX5FGU4TRGInW+tOcAPY3cg
	H1hNucVih8S+P08LwRi/gGwfwHzDA+5jj0ufqH0tlvnrHdxLoMMnNxqRMKzChbU1/icn66CB14p
	vW2HnKYIsWG3OE=
X-Received: by 2002:a05:600d:10:b0:48a:568f:ae6d with SMTP id 5b1f17b1804b1-48fe60e7d79mr45372625e9.8.1778847484590;
        Fri, 15 May 2026 05:18:04 -0700 (PDT)
Message-ID: <854d16a5-fa78-478c-b8a7-4ef4fcbf79e3@suse.com>
Date: Fri, 15 May 2026 14:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] arm/sysctl: Implement cpu hotplug ops
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1778845596.git.mykyta_poturai@epam.com>
 <8d0d4f74ef5730edf59ff21fe8ab2aead6a7f1c6.1778845596.git.mykyta_poturai@epam.com>
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
In-Reply-To: <8d0d4f74ef5730edf59ff21fe8ab2aead6a7f1c6.1778845596.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778847485-20961C48-2B2FA5C9/0/0
X-purgate-type: clean
X-purgate-size: 1750
X-Rspamd-Queue-Id: A825F54F526
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:teddy.astie@vates.tech,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 15.05.2026 13:54, Mykyta Poturai wrote:
> SMT-disable enforcement check is moved into a separate
> architecture-specific function.
> 
> For now this operations only support Arm64. For proper Arm32 support,
> there needs to be a mechanism to free per-cpu page tables, allocated in
> init_domheap_mappings. Also, hotplug is not supported if ITS enabled,
> and partially supported FFA, or TEE is enabled, as they use non-static
> IRQ actions.
> 
> Remove ifdef guards for x86 in flask, as cpu hotplug is now
> supported on more architectures.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> ---
> v7->v8:
> * simplify dependencies of config CPU_ONLINE_OFFLINE

Which now raises the question of ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -637,9 +637,9 @@ config SYSTEM_SUSPEND
>  	  If unsure, say N.
>  
>  config CPU_ONLINE_OFFLINE
> -	bool "CPU online/offline support"
> -	depends on X86
> -	default y
> +	bool "CPU online/offline support" if EXPERT
> +	depends on X86 || (ARM_64 && !HAS_ITS)

... this being overly strict towards other architectures. Typically we'd
allow them to express such via select-ing a respective HAS_* control. In
the absence of that, couldn't the above be further simplified to

	depends on !HAS_ITS

Alternatively, to make exclusions more explicit, and to not preclude other
ports to use HAS_ITS for something entirely different (just with the same
acronym), maybe

	depends on !ARM || !HAS_ITS

? Then, if RISC-V and/or PPC really want to opt out of supporting this,
they'd add themselves here. Yes as said, expressing such via HAS_* scales
better.

> +	default X86

This, I agree, wants to stay as is. At least for now.

Jan

