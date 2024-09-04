Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C97696B86F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790036.1199738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnDJ-0004GD-QI; Wed, 04 Sep 2024 10:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790036.1199738; Wed, 04 Sep 2024 10:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnDJ-0004Dq-Nd; Wed, 04 Sep 2024 10:26:13 +0000
Received: by outflank-mailman (input) for mailman id 790036;
 Wed, 04 Sep 2024 10:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slnDJ-0004Df-1n
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:26:13 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1acd6aa8-6aa8-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 12:26:11 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso1127853a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:26:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d80fcsm790600666b.181.2024.09.04.03.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:26:09 -0700 (PDT)
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
X-Inumbo-ID: 1acd6aa8-6aa8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725445570; x=1726050370; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1kpt0X/CuKqkzuDanB/hnbhWe/cIe7VsE7y4ObFgF60=;
        b=ZSLXZp7EQH2K2ny88Rsf/WUkqlj0iMUDo+XOiOLjPy9B0McehlYodFZOyEt79k/VSp
         PZsSctbuLJ5lLFn8BC65UC7NLUdCawI8McwaUeJoeIkr01Odb5UqnAtQYNRM2OUCzyEW
         qifyLGSFAlCwgzkg7roTugVeCt0FkZLrSiX9H7faOFJb9AtHCm1qnAmzCQvC89+4pzKK
         6s2siA5C/sJlch9MHJR/S8eByRnYVYeWuEMxms9owUZMaGlgI6h0L/Paa0OnEYHsE7GK
         ZIFsEwOydpTcqqsu44HvmJ/2CRrikokkK7F64QCPQaV1zn0/oLAVc2P44eHyEIxxIXmT
         MkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725445570; x=1726050370;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kpt0X/CuKqkzuDanB/hnbhWe/cIe7VsE7y4ObFgF60=;
        b=BOfGP58j7vgoYLmbEpn9EPu5LDYwEswJgd0lPLM3HnIs06ysMsQHyQZ1a00qKRKY3N
         04+OH0sB/h9glj0Gcf/Rbl5Mix+dYNvfdISuODSBsB2DRh2tbo8rnt32yZulOYoL9k29
         /H31Vz4LiiQDRsfUSbxLqgyHvpeF6lFm/y/VVWOHiynPoOcjMit7JeCyiwImOrhPOZmf
         XCS3/2ePREWJndfwJlMFQiHNiFstrzskvAngJFHutjy+ixQwbpSI9zkgGfObASuNIWWz
         xrhNE925JfPPCX471kXzcYbSlG2v6QOV8VfxFM47LwGYHergC3tJ/elNHb4sGXISjbxN
         yrTw==
X-Forwarded-Encrypted: i=1; AJvYcCXc8cjZfAVyy/6a5e+bCY6ERrDhSbR1A37Y70LepwugNZ7DhJICP8JkPaMUfSgnS4OwASC/UFYS0as=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyL9aF8XhxPBLJ1WlP7M/msdrfk1fPNuKZgaCcpX4npuJwzcFss
	+40hGMIttBbFPMWu9pvlhScK0cB7rurFG9A6kJUyKroSbPDSecL9NlFj4NUYAw==
X-Google-Smtp-Source: AGHT+IEs+ljjJzOb/XsWtHLR0W2H7arnNgz2AfmROJWwweyq647p1/MbmAPIbgUdX8K/cMNg/DYeLw==
X-Received: by 2002:a17:907:1c07:b0:a86:8ef6:dc3d with SMTP id a640c23a62f3a-a8a42fdb7b6mr144632566b.8.1725445570170;
        Wed, 04 Sep 2024 03:26:10 -0700 (PDT)
Message-ID: <a45dc467-a1ba-4053-b8c4-24b500c051ed@suse.com>
Date: Wed, 4 Sep 2024 12:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mktarball: only archive Xen
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <14f8887b-1f66-428e-8417-f552b8851c71@suse.com>
 <291083ba-7480-4cfa-90c4-997f83c7a3a9@citrix.com>
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
In-Reply-To: <291083ba-7480-4cfa-90c4-997f83c7a3a9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2024 11:59, Andrew Cooper wrote:
> On 19/08/2024 4:10 pm, Jan Beulich wrote:
>> As was basically decided already a while ago, remove - in the simplest
>> possible way - the archiving of both qemu-s and mini-os from tarball
>> generation.
>>
>> With this the subtree-force-update-all prereq isn't needed anymore in
>> the top level Makefile. That goal, including the respective ones
>> underneath tools/, then also are unreferenced and hence are being
>> dropped, too.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This is the simplistic approach; I'm sure this could now be done quite a
>> bit more efficiently. I also expect there's no longer a need to run
>> ./configure ahead of the invocation of this script, but since I have no
>> idea why it was needed earlier on, I'm not removing that here from the
>> doc. IOW all cleanup that's probably better done separately, by someone
>> actually using all of that machinery.
>> ---
>> v3: Drop subtree-force-update-all rules from underneath tools/.
>> v2: Drop subtree-force-update-all prereqs from ./Makefile.
> 
> Removing the archiving is one thing, and we have agreed that's a good
> thing to do.
> 
> However, the makefile rules might be used manually.  While we have the
> other trees cloned in Xen, I'd be wary about dropping the rules.

They're not mentioned in what the help: goal displays, which makes me
worry not overly much here. And Anthony had basically agreed to their
dropping, in part by asking me to drop more than I did initially.

> I guess the real question is how long we expect this interim state to last.

For quite some more time, I suppose, ...

> SeaBIOS and iPXE could disappear right away; there's nothing xen-local
> there at all.
> 
> OVMF doesn't have anything xen-local, but there's a bit of complexity
> setting up a Xen build IIRC.
> 
> Qemu-upstream won't be going anywhere until a) a release of Xen with
> stabilised hypercalls, b) a release of Qemu after that

... seeing for how long we've been talking of stabilized hypercalls.
But how does it matter here for how much longer that situation will
remain? We want release tarballs of just xen.git, and that's what
this patch achieves (plus some cleanup of then-orphan logic). How
else would you propose we reach said goal?

Jan

