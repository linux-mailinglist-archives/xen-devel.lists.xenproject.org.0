Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E520DA8414C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 12:58:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945266.1343484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2pb9-0005YS-2u; Thu, 10 Apr 2025 10:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945266.1343484; Thu, 10 Apr 2025 10:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2pb9-0005Wz-00; Thu, 10 Apr 2025 10:57:31 +0000
Received: by outflank-mailman (input) for mailman id 945266;
 Thu, 10 Apr 2025 10:57:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2pb7-0005Ws-SU
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 10:57:29 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9613d50a-15fa-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 12:57:25 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so7702435e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 03:57:25 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f23572c43sm48919605e9.25.2025.04.10.03.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 03:57:24 -0700 (PDT)
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
X-Inumbo-ID: 9613d50a-15fa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744282645; x=1744887445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ro2VPRL/3KmoEsBybMZYaQ1SrdwGkTym/+MsO2Oi+u0=;
        b=KpOK/BJpx3RVGhAgDRSse/B2XXc35pYa6XQ44rnIMgqLUUOC9oKbWyc7IFCxKYKiil
         kVS2Lm5YkAus7zx0/UQ1H4fuyaN0Fi/DYwkuYGj8aLM8BoPKwN2xb188KeLTfo0T5mKA
         eNSZenjCOROP/mB+Kf38obOmF6/o6BMuBbfD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744282645; x=1744887445;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ro2VPRL/3KmoEsBybMZYaQ1SrdwGkTym/+MsO2Oi+u0=;
        b=RXGOaSFLhfx60+KDw0c6zBrGy+jX83O88cEWO6MyErT5bKE9UKbYs5ZuFWaQSPAv/c
         cgJszp3e5VW9FA7qFy76NyjiMgqatX2uw9pyitBfPi4A24v75jgtAvAdWvIjWuO3Q+yy
         TLUrzD8uj1zzY8sanEVbtmh+muOnQJyua/BhcM/Ctx9glC94YH4t/JH41CGpirPxUd6U
         jHjchKexYuIGGg+xLjx7UW22dvjLSFI8I9Kok8eevw5rBgqw8GVGUEhnsm7bxNbVLp1M
         v0/hXRZ1aIuGF7GwpyVkESC8n5loXlgIOkDz8kLbNCU24Q5n+9/xqymWKir57f71gICi
         u6Vw==
X-Gm-Message-State: AOJu0Yxzn+bWn80E0xKnIXCA1Z7gO9xBu41EWWVokE416lfwMEIUk3S1
	pjkoJDVSgWeWXG2IIPaHu1brEWwuf+W7jNxfoh5Cil7uY5sMg+S8BsG94uo+U+A=
X-Gm-Gg: ASbGncs5hbHp3Cldig1bp9KP6XlvoDwFqxx0n+1Kt1BEVAFNs8+AtuUl4I+RNIXazxd
	pobEvUntCOH+FtJFlM7T+f6DGaw5Q0RiLPMaR/Qlf+DHMMpuQRGCf17jFJ+LW7dNMpOBEU9wKNC
	oBjwU/ngbswxz3Zzs8IO4ReSAseDVhnDowL84NW2lJfuZJSOHJpdNZtIr/IKgRVdM/DsEGu2hX+
	+Yc68nfdB964wqspZq6HtnCTQ/JrdB0dnQXbYiAIm49YX/XnPLvmH5mB7yO0vvTTeNoy8vVhDMR
	jV9z4Se5syOctvg5yhzsL3xPqyfCqbLScB8eDZGoBQgdmh6FLpcqtkJ5DjYShv+uuIFsppcRptQ
	VciqeOQ==
X-Google-Smtp-Source: AGHT+IHg83oJrvcOGiKy1j9mZd81Qm4nCH6UadXfRno6R6UeXR4dlEMPWfnc/5CSQ6OdNLGCyeKs1Q==
X-Received: by 2002:a05:600c:3b20:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-43f2ff05310mr21017365e9.17.1744282644810;
        Thu, 10 Apr 2025 03:57:24 -0700 (PDT)
Message-ID: <96fe43c7-e2a6-47d0-bdd7-e6284c86acfa@citrix.com>
Date: Thu, 10 Apr 2025 11:57:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] Infrastructure for arm64 linux builds
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <20250409163702.2037301-8-andrew.cooper3@citrix.com>
 <Z_aqUikDqi1UEOHb@mail-itl> <21a35c38-ce2e-48c4-9586-9c232f77affa@citrix.com>
 <8ef0f462-a487-4d76-84e7-9552c75995b7@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8ef0f462-a487-4d76-84e7-9552c75995b7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2025 11:41 am, Andrew Cooper wrote:
> On 09/04/2025 6:15 pm, Andrew Cooper wrote:
>> On 09/04/2025 6:11 pm, Marek Marczykowski-Górecki wrote:
>>> On Wed, Apr 09, 2025 at 05:37:01PM +0100, Andrew Cooper wrote:
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Michal Orzel <michal.orzel@amd.com>
>>>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>> ---
>>>>  .gitlab-ci.yml                            |  7 ++++++
>>>>  containerize                              |  1 +
>>>>  images/alpine/3.18-arm64-build.dockerfile | 27 +++++++++++++++++++++++
>>>>  scripts/build-linux.sh                    | 10 +++++++++
>>>>  4 files changed, 45 insertions(+)
>>>>  create mode 100644 images/alpine/3.18-arm64-build.dockerfile
>>>>
>>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>>> index ff8dce7be05d..6e38c2f2a108 100644
>>>> --- a/.gitlab-ci.yml
>>>> +++ b/.gitlab-ci.yml
>>>> @@ -19,6 +19,13 @@ stages:
>>>>      exclude:
>>>>        - binaries/.gitignore
>>>>  
>>>> +.arm64-artifacts:
>>>> +  extends: .artifacts
>>>> +  tags:
>>>> +    - arm64
>>>> +  variables:
>>>> +    CONTAINER: alpine:3.18-arm64-build
>>> Arm64 kernel used to be built in a Bookworm container.
>> So did x86 before they were moved across.
>>
>>>  The build in alpine
>>> has "find: unrecognized: -printf" in the middle of the build. It doesn't
>>> fail outright, but something might be broken. I guess it's related to
>>> initramfs - maybe some option can be disabled, to avoid this message?
>> Nothing seems to break...
>>
>> There's also a bad awk regex.  Alpine seem to fix this by using mawk,
>> except they then have to patch the Linux build system to take the
>> override properly.
>>
>> I can't see anything obvious they do to fix this -printf warning.
> Yes I can.  We want findutils too.
>
> x86 also wants diffutils too. (as I'm fixing that side of things too)

Excellent.  Both x86 and ARM are clean with these changes:

https://gitlab.com/xen-project/hardware/test-artifacts/-/jobs/9682944850
https://gitlab.com/xen-project/hardware/test-artifacts/-/jobs/9682944867

The awk complaint has gone away too, so I suppose that's a knock-on effect.

~Andrew

