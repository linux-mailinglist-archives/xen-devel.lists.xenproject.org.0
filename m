Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57DD853ED7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 23:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680165.1058100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra1Ox-0000Uo-Ep; Tue, 13 Feb 2024 22:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680165.1058100; Tue, 13 Feb 2024 22:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra1Ox-0000T3-Bg; Tue, 13 Feb 2024 22:37:19 +0000
Received: by outflank-mailman (input) for mailman id 680165;
 Tue, 13 Feb 2024 22:37:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QnSS=JW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ra1Ov-0000Sx-D5
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 22:37:17 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7068462d-cac0-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 23:37:16 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d1080cb9easo15804811fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 14:37:16 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p25-20020a05620a22f900b0078719b3b55bsm1040202qki.14.2024.02.13.14.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 14:37:15 -0800 (PST)
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
X-Inumbo-ID: 7068462d-cac0-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707863836; x=1708468636; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Th9gFrU9rSiUUgBV5Ym3ThorHf7Gql3Eb2J172Mslg=;
        b=f0KfZeXWuZ5Xh+wm93jjOLsguosI6bWSDfWVv4DEWMec7cxW2LVlNVn2nq7P5hBR55
         10mUFscOor/ssZrwluOJ/SA+D6b1Cw27k1ta9KorunyuBln3Ry7Rw2U4n8PTCvjomoEb
         KEW5D9ZWwnrOCM7j/LfInlF1vRhoz4AZCj5pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707863836; x=1708468636;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Th9gFrU9rSiUUgBV5Ym3ThorHf7Gql3Eb2J172Mslg=;
        b=r00ey8tEOUm2rMOXkZwExsm1+oAcnYcZvveNg0WZDBY95A+TO80e55bLXlx4m9FUOT
         5YDPIrAMerXGf2AlahX5E3RgeRE6NRT0gfyRy4ruG7iQxCIvkLtPZY/HN9LIRwADuf7N
         VJdzp9MMT4vAxLWa0d52aZzsRFt1qicGGSF9HZusM+s/7GGBbK3lyqySrspPsccXpAYy
         9YXO4uuzNpjwr0w4ck5ACMhng1UE06EnKSvab8GINWVjxGxKp1/Ed/xE+5qhuYAxIOnl
         qdCkIPaAhMpTyVoeJwK6uRSQJ9q0Wq+Yvj4YCF0ODE1hXszGF9hJkCiQ6GJYu7+4fSuh
         upcw==
X-Forwarded-Encrypted: i=1; AJvYcCWSODyjKWa0ZyJjVrmybTuzQr8CL5lgR9R4HuoJejuZrzcxLdmL+miVgFxisjhZD+eVsEyieMoPh7zUUghPWbMOLOlqyYKdAAYSn1TvhPM=
X-Gm-Message-State: AOJu0YzqSPaeHdwzzg1UQIAg8Ase+k6B3IrtqxBvh7gVAHwW3CoQDI+L
	7WXPbTDckNanSynYt/NmvLDScXAeFhhZ/7ouLE+rJ6JydRtb7r1BjwcOnKDS1ns=
X-Google-Smtp-Source: AGHT+IFTsUWdeoXcIf2vJi+R8gAQp/ik0q75Yunwoln4AVqdh2VHf0ukfIqJEDbX1AEU4sP3tG5Bqw==
X-Received: by 2002:a2e:aaa4:0:b0:2d1:e45:d083 with SMTP id bj36-20020a2eaaa4000000b002d10e45d083mr601375ljb.3.1707863835898;
        Tue, 13 Feb 2024 14:37:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMWDPItydWzEYtfLr5TrTXujspOimM6RSvwQC6JjIpRkuyQjavCsn/x7u6i3wb8uSPqvcuJiX0uJvEStcbNBop1w8RKn+4+mB0xQrCm7027HbFlMoI+eE3/KT3ymih52nf4vGV
Message-ID: <c4f27180-86bf-45fd-8641-bd160c6de229@citrix.com>
Date: Tue, 13 Feb 2024 22:37:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [regression] Re: [PATCH v2 2/2] iommu/vt-d: switch to common RMRR
 checker
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20240207153417.89975-1-roger.pau@citrix.com>
 <20240207153417.89975-3-roger.pau@citrix.com>
 <c27c76ec-36cd-43cb-b76f-e8f95fb27ed8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c27c76ec-36cd-43cb-b76f-e8f95fb27ed8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/02/2024 2:38 pm, Jan Beulich wrote:
> On 07.02.2024 16:34, Roger Pau Monne wrote:
>> Use the newly introduced generic unity map checker.
>>
>> Also drop the message recommending the usage of iommu_inclusive_mapping: the
>> ranges would end up being mapped anyway even if some of the checks above
>> failed, regardless of whether iommu_inclusive_mapping is set.  Plus such option
>> is not supported for PVH, and it's deprecated.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

XenRT says no.

It's not clear exactly what's going on here, but the latest resync with
staging (covering only today's pushed changes) suffered 4 failures to
boot, on a mix of Intel hardware (SNB, SKL, SKX and CLX).

All 4 triple-fault-like things where following a log message about an RMRR:

(XEN) RMRR: [0x0e8 ,0x0e8] is not (entirely) in reserved memory

not being in reserved memory.


First of all - fix this printk() to print full addresses, not frame
numbers.  It's obnoxious to cross reference with the E820.

In the example above, 0xe8000 is regular RAM in:

(XEN)  [0000000000000000, 000000000009d3ff] (usable)


In another example,

(XEN) RMRR: [0x4d800 ,0x4ffff] is not (entirely) in reserved memory

is a hole between:

(XEN)  [000000004d3ff000, 000000004d3fffff] (usable)
(XEN)  [00000000e0000000, 00000000efffffff] (reserved)

We should also explicitly render holes when printing the E820, because
that's also unnecessarily hard to spot.


It's very likely something in this series, but the link to Intel might
just be chance of which hardware got selected, and I've got no clue why
there's a reset with no further logging out of Xen...

~Andrew

