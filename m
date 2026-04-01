Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPTBKle7zGmcWAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:29:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5BD3752FC
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269714.1558629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7p4m-0007Ka-H3; Wed, 01 Apr 2026 06:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269714.1558629; Wed, 01 Apr 2026 06:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7p4m-0007Hb-DY; Wed, 01 Apr 2026 06:29:16 +0000
Received: by outflank-mailman (input) for mailman id 1269714;
 Wed, 01 Apr 2026 06:29:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7p4k-0007HV-Mt
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 06:29:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7p4j-005R2s-OG
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:29:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ccbb32-e002-0a2a0a5209dd-0a2a4502c4d4-6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:29:13 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ccbb39-63bb-0a2a45020019-d1558030ec58-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:29:13 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-486507134e4so73107455e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 23:29:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e83e906sm85638505e9.8.2026.03.31.23.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 23:29:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1775024953; x=1775629753; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Bmie9qj6MlGel6w/+sZbpTxj82sDgs07ODjWhFHiCQ=;
        b=SbP69BvZuSPscGsD8sRgOyN0AO4C1jUGN+TT7tFHp1F14iOLINfs1RSdP6FEXHckSq
         kQEYIHlN4hD9oqOCg2MmytYx1ODMLZ05BGBGWnIN2SH8MIk+tgk7NS+W8+L5e4uHr3mQ
         /ghh9uoXHwU+me7CDHf39uEdpKegvai6wxQ3LNDtnWvpoX4mRjgofMDWXyxg06K7lAWI
         c9XEwO7Pkjz4T5A8MHY5xqf9vLp1pahl99eFArKW7d6HGHBhycH5dpNi6sCbpquCZ4tW
         sS7CvPSXoBSL/X0D6mz7HMokgzdTGMv+OEx1u/9+U6hyK46m3RnGcyhJTBMYDGS2sz7/
         I2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775024953; x=1775629753;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Bmie9qj6MlGel6w/+sZbpTxj82sDgs07ODjWhFHiCQ=;
        b=NWNOmLNiyTKve3usXU3b695OH4mFBx9sqfTTuZ7QNH2fY+nzaBodNAmGRFsufg5cmd
         ZqQbn0zsBso+iGoLef5REeHdJCHze2K3XK+zjDGfAfUzVPjRoF7o0o8U5IpvMPbRLFL9
         dSmjhZ4R8smtxnMcVWidKL9CF6zPAnslsUT9iby2j6LH+afo+4i/h0L0gq3toZnS/J3h
         q2ky2mv2Hp8bjJ2pH+2jzvN+CZRP2G3oGeiPJ/JBCwvjy1FlMfMtBQ2mkXlyVk0CXG+6
         VRhV5sTv9+9Q197mznYMNwZh8gACT1V6XwFfsl3El5Xqc8j8cErnjV9XtLteNH9kOJaA
         LJSg==
X-Forwarded-Encrypted: i=1; AJvYcCUFkYSQ57mHdqxf9P7fTUYTUzfPrV0MA88S7RCRjgMZI0UEKFAxx9ydW56SSf8W2LqpG+iFjjbqPTk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuQYzPzx4lDKJAm/MTe/L/wQLLHB5n/AOD2/oileEgSF6aT4hB
	HLkFYT2nCRJDmyUxKJ2i+Jb22WPburM4e9nsoZnhfPcJ9JdFdHZf9vMy6Jpoam9B5g==
X-Gm-Gg: ATEYQzwyHw/QP+EQb0AXFPqcvhLuUYvnK7qElTcS+qEMJ9w5cRneTlSCVpH6SMkO4ig
	Tb/S78QpJWuF6xt/KPY5EpdimGCWZUxj/R6wx94wgXUdyl5gzyl14JA2792UHC5c/rddMQTG5eR
	+XQphCGjkQ3ORpGnfdwK7oQ+7tR5nnAWqLofaQEg/0JTw93+o5OJfCxXrCw5Ygns/DajnXqRv7w
	/FR/3LVEf/m7uBLuYa+RkuT3VpfMMWWgE/K4aWUl88RvhReP5zdL3VjiIHUX7tHkW2uONx9RyID
	bhWlSmYYCidDDJMx7uwp91r+v1OlIMnJZeDACWYkiXhj5OfNE2GrQHIU/aYY2S5R0e7vr8HEBHM
	IPq/IhD2y4niYLhS3bozQUDnYvccpC4YdIMrhoa4Fj19FZGEotPIoayfJJ498JpSb3++Y31bAM/
	UpkezI1pKvxLzHZjntRqTpWZMn1OKfIdAExp4ZVJX5Hl9lepGhUiSSD74EyXFJbZhEn/3boEPBd
	w6YzVyTFYJI5hA=
X-Received: by 2002:a05:600c:4f94:b0:487:338:b4f3 with SMTP id 5b1f17b1804b1-4888359cec9mr31653315e9.17.1775024952916;
        Tue, 31 Mar 2026 23:29:12 -0700 (PDT)
Message-ID: <dc5550d7-5a2d-4ca1-85de-5a17c24aeac4@suse.com>
Date: Wed, 1 Apr 2026 08:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI
 arguments
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <e1d18d55557ebe232fd62174f186b1cf228e48e5.1774981189.git.mykola_kvach@epam.com>
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
In-Reply-To: <e1d18d55557ebe232fd62174f186b1cf228e48e5.1774981189.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1775024953-69371DB8-BDD92897/0/0
X-purgate-type: clean
X-purgate-size: 2350
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,xen.org:email,arm.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CE5BD3752FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 20:31, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC calls
> using Wn, only the least significant 32 bits are significant and the
> upper 32 bits must be ignored by the implementation.
> 
> So for SMC32 PSCI calls, Xen must not treat non-zero upper bits in the
> argument registers as an error. Instead, they should be discarded when
> decoding the arguments.
> 
> Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits may be
> implementation defined when entering from AArch32. Xen zeros them on
> entry, but that guarantee is only relevant for 32-bit domains.
> 
> Update PSCI v0.2+ CPU_ON, CPU_SUSPEND, AFFINITY_INFO and SYSTEM_SUSPEND
> to read SMC32 arguments via PSCI_ARG32(), while keeping the SMC64
> handling unchanged.
> 
> No functional change is intended for PSCI 0.1.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I thought I might as well include this in my next commit sweep, but isn't
this R-b being invalidated by ...

> ---
> v3:
>  - use PSCI_ARG_CONV for SYSTEM_SUSPEND

... this change. That's ...

> @@ -422,14 +427,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>      case PSCI_1_0_FN32_SYSTEM_SUSPEND:
>      case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>      {
> -        register_t epoint = PSCI_ARG(regs, 1);
> -        register_t cid = PSCI_ARG(regs, 2);
> -
> -        if ( fid == PSCI_1_0_FN32_SYSTEM_SUSPEND )
> -        {
> -            epoint &= GENMASK(31, 0);
> -            cid &= GENMASK(31, 0);
> -        }
> +        register_t epoint = PSCI_ARG_CONV(regs, 1, is_conv_64);
> +        register_t cid = PSCI_ARG_CONV(regs, 2, is_conv_64);
>  
>          perfc_incr(vpsci_system_suspend);
>          PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));

... this hunk aiui, which is far from merely cosmetic imo. While
behavior looks to remain the same for PSCI_1_0_FN32_SYSTEM_SUSPEND, it
clearly changes for PSCI_1_0_FN64_SYSTEM_SUSPEND. That may be intended
and for the better, but the change clearly wasn't reviewed by Bertrand,
nor - when offering the R-b - did he ask for this extra change.

Jan

