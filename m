Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3777B04392
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 17:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042950.1413055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubL1C-0002tJ-Sp; Mon, 14 Jul 2025 15:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042950.1413055; Mon, 14 Jul 2025 15:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubL1C-0002rT-Px; Mon, 14 Jul 2025 15:23:02 +0000
Received: by outflank-mailman (input) for mailman id 1042950;
 Mon, 14 Jul 2025 15:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubL1B-0002rJ-Of
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 15:23:01 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cc01963-60c6-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 17:22:59 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b49ffbb31bso2547723f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 08:22:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de42864a8sm95624935ad.42.2025.07.14.08.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 08:22:58 -0700 (PDT)
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
X-Inumbo-ID: 6cc01963-60c6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752506579; x=1753111379; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6MN85fYUsWz4W3ixmfQPYwZfNgAqJsyrXkyglpUzLro=;
        b=VG2BP7XpzEmzBcC84g9Ap2lM0z/xTcRZA+H5acRtS4VlGRvwr2eO7LbWC3+AKieqdt
         zJDc03Dl5kO4QqX3O3VYfThO4IAfpuV2/Rf/PAXYNMQOwIrMlYqrnaLw+G/8HO2VVaTq
         pAZVz4ePvoCImpdKeBzpjIoaUGu4bUldhCXrC6aC/HBDyes0IWJHqXIzLAYeLV0mPiXL
         tul76eJ8dUFoNCttuRdL4pKMJbRWBMyUshkd7w+bWwdneWPFc3VBhbLISQ9jcc1IbtAo
         WBRKS4YuI/ohsGrdhiTNX3l6SpUDAI6KSMeyL4hsUy5OOUttMuX0Le8HTRL0FBgMN6xm
         fYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506579; x=1753111379;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MN85fYUsWz4W3ixmfQPYwZfNgAqJsyrXkyglpUzLro=;
        b=IK0dM2nH9VtJ0OyQNf//N40yZ/gcybigArsgaWf+TsK/h59T+mQroJVCmz1XFB93xc
         GgzO5j37DTetw3P5LRrEmAtu3qK4yzumYbu17FFzZ3PxEJHk71sAJNe6RGzQjXOA726v
         9h9P7e32m2sSuTKsLJ1jAo9AMYx/cHFEcMEYMuCMpYzs+YtMFJZAAOJjkqo+Qi2VuRy5
         RveqxqdGy10R9jwnVq/ip+tqZczL70/qOBVYmcvTfcFDX3ojofUT+bV4nvuwlX825Y1c
         ebC1w3nfM8DSyjxU5JN5wc2TDF397kgWgYRDkzL77tvXKQW+Yhm7oouIg0BOZyBbpUhr
         Vqqw==
X-Gm-Message-State: AOJu0Yxb/6h3LXBaEd5dPxCZdCT5SByqdEyG8vCLzeacdriTMWt4cjLO
	YB3RT8ix61gFmzvx6kJ7o4sHnltawYSTqmS3Qy+6cR7ooIgUdVmV/dT8sQPY7Pj6pg==
X-Gm-Gg: ASbGncu3BcZ8hrWcHLJkqNwbzdmtNof2gtUTpS94P+v6zaqz0q9Iyi3zr1wzS7/KpyX
	vKEO8KKe46RoxeILZmXKzm/N93m1CaAcrby4cZvG9qcfw+4Neg18FBvLueKtJTXcXXmWI0NuwR7
	TlHZS75GGnnNGDQdrMJMQfYc0FLu983iHU5oMex+PHXPpXS4NcfKkoPY8nJH1+Ltvd3OJZ1lEzg
	wqKnkysgXhOKF2I68ZTCpvZFHYJE7/4yJ+kyeFpIWwY/mnWcUYd3qOeO4tL/WrutnzXNr247oK8
	R5MDGYZrOt7k8OTwPRiDnlYqs3dFaKzjp+5jEBcM/0xUWpVnDtWKWsAnqnQNT5VZTwzZ7Bnpnf/
	PxaEFbyouob1uTDworQpxwN+mxoSsxvC3IAc8jEqIJ5xGJGAmN1MY+wzdKgD2Mq2COyvuNsFbgq
	HgHMpvoRk=
X-Google-Smtp-Source: AGHT+IGB8SFDczskcrKG885L95IL/r0glfvFCmdrBMY9Kmim6hdJT4lWmNFuckQ3QKbYzdjuXx1m+w==
X-Received: by 2002:a05:6000:2407:b0:3a5:2beb:7493 with SMTP id ffacd0b85a97d-3b5f1875992mr11799236f8f.9.1752506578825;
        Mon, 14 Jul 2025 08:22:58 -0700 (PDT)
Message-ID: <3d8863f6-8dee-4ae1-994d-4b44854e83be@suse.com>
Date: Mon, 14 Jul 2025 17:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PVH: extend checking in hwdom_fixup_p2m()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <664472bb-b375-46eb-999e-34f983275d92@suse.com>
 <aHUbeTzCLbYdHvXQ@macbook.local>
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
In-Reply-To: <aHUbeTzCLbYdHvXQ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.07.2025 17:00, Roger Pau Monné wrote:
> On Mon, Jul 07, 2025 at 04:44:25PM +0200, Jan Beulich wrote:
>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -184,6 +184,22 @@ static int hwdom_fixup_p2m(paddr_t addr)
>>           !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
>>          return -EPERM;
>>  
>> +    /*
>> +     * Much like get_page_from_l1e() for PV Dom0 does, check that the page
>> +     * accessed is actually an MMIO one: Either its MFN is out of range, or
>> +     * it's owned by DOM_IO.
>> +     */
>> +    if ( mfn_valid(_mfn(gfn)) )
>> +    {
>> +        struct page_info *pg = mfn_to_page(_mfn(gfn));
> 
> We should consider introducing a mfn_t mfn = _mfn(gfn) local variable,
> as there's a non-trivial amount of _mfn(gfn) instances.  Not that you
> need to do it here, just noticed the amount of instances we have of
> it.

There already is an "mfn" local there, and I first used it here, but then
considered the result confusing.

Jan

