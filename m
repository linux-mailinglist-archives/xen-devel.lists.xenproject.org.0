Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0C4A46440
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 16:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896831.1305582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJ6c-0001R2-Ej; Wed, 26 Feb 2025 15:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896831.1305582; Wed, 26 Feb 2025 15:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJ6c-0001Oc-C6; Wed, 26 Feb 2025 15:13:50 +0000
Received: by outflank-mailman (input) for mailman id 896831;
 Wed, 26 Feb 2025 15:13:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnJ6b-0001KY-5O
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 15:13:49 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46d42fa1-f454-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 16:13:47 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38f6287649eso5452596f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 07:13:47 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd866f0asm5928689f8f.12.2025.02.26.07.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 07:13:46 -0800 (PST)
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
X-Inumbo-ID: 46d42fa1-f454-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740582827; x=1741187627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wBXwCbyrlSzHpR6lxJK5s0NX/XdXEE14LgJ8csdiVcY=;
        b=FI9VcaXb6EqLW2vY1dY2z45/tHRvjTcqdIz3tMZUNLp+giXh806x2F9UOmV/K2WXls
         WlGxgsbuL4LmnwO2UXYFohdQ6Km7sIb65kHB01yGAhZfyr7tac7UrvGvUpzXPQJ8LfAu
         imIgEWE1yUfRTwL35IodsFnvKl9x+X3t3lZCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740582827; x=1741187627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBXwCbyrlSzHpR6lxJK5s0NX/XdXEE14LgJ8csdiVcY=;
        b=ebptKu/MoU6JPoEmBYcUtfgCQA3ivvxORoQsaHF4cH/wbEl9EGm44r4iNWPCQpYQPf
         IHz/QaJCmEL5yLwDn4Yat7KkijtJBMJCKhbE1YKvOoPxcMoeek1XpU35o8gHb28ttDmZ
         50v/7AbagQqiowvDU1nwz1ldB7VR67YacYAWDDcejV3v00KhIf1EA9DxGcxC2gv04qqC
         qnbYBop6goEQuG5gffinSN4GrC29HMoBjAcVsQT0nLGVuE4Rn/jWgMKm2PcO6Zz7oDFn
         jxZctq3sOZiC3Y/p9S+Ps2vzcr7M/C3tjzTP5rN2SYV/Rup/5r0cWK24N2wkoy+zPZFD
         Xv9A==
X-Forwarded-Encrypted: i=1; AJvYcCUFmEdcByDR4qhF/8YdW+zhnudYxljWm83BSlTTv1EL1EfXskpH/M+u43VQxjrzHkH6u1aagtcq5Lo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnzQaioLsvUwYXiqq+xODOIAk92CMIsiLUKzOgcIrJySWhStHm
	sVhPbRkHT093H0GeiJFKPhFa/M3BCERYpw1u9MyB1h2UtxNU+HrpIESqxbFKRYI=
X-Gm-Gg: ASbGnctzxsxMRoAs3g16Ud6lnbcLo8RaqGOZBgQknbLhG9j5S2ZoMHOX65267X51NSy
	Um9MYvbmBy4tUHwYICdUusAVRYU3MIb9l7IqcULUeccJ9dj6Z+oVvO+4ZwsKZQKeR0k+Jwnt1ut
	eix669oKWLkCNZ7r7KYOvFVitxJ5WXajE/pveL1Ro6O/Gxy8FHtTdKYa++7V2lPPbfapACnfB8W
	iWg7ZoAUhEQ0yixu8c8l1Tg5xmFIKuEBoymeXqi4F8JkZf5ucD6uVhG9MUuG9cabnu5MSB6X5LI
	vykpA2TYM6WVaizK5zGQGexImQRdtFDQhuSVM7aBuhM6//VKD3rxlGmmBJJdOQ3exA==
X-Google-Smtp-Source: AGHT+IEBghiYG5pgDHxqmhVvbGUA2Wl/BfBjrWGk4NYgbA/uR7y7l0sti0IK1RHgJj14AXrnUr+URA==
X-Received: by 2002:a05:6000:1541:b0:38d:e48b:1783 with SMTP id ffacd0b85a97d-38f70825febmr17240958f8f.42.1740582826759;
        Wed, 26 Feb 2025 07:13:46 -0800 (PST)
Message-ID: <82da9566-c545-4ac3-8182-b3368a06b283@citrix.com>
Date: Wed, 26 Feb 2025 15:13:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20 v2] CHANGELOG.md: Finalize changes in 4.20
 release cycle
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250226104556.36324-1-oleksii.kurochko@gmail.com>
 <8ec1b722-3af1-4778-9902-0f3278e4309a@suse.com>
 <0f07557a-f340-4056-b8a0-5efe680bddc7@gmail.com>
 <b45c2acb-9d72-4de9-907f-ad2d0c7ac6bd@suse.com>
 <e801c975-0985-450e-ae6a-7659a78e862c@gmail.com>
 <53c991a5-b398-430e-b94e-d7428c2b2c2b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <53c991a5-b398-430e-b94e-d7428c2b2c2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 2:33 pm, Jan Beulich wrote:
> On 26.02.2025 15:31, Oleksii Kurochko wrote:
>> On 2/26/25 2:13 PM, Jan Beulich wrote:
>>>>>> +   - Zen5 support (including new hardware support to mitigate the SRSO
>>>>>> +     speculative vulnerability).
>>>>> I'd also suggest to qualify Zen5 with AMD.
>>>> I thought that it is clear just from the name for a CPU microachitecture: Zen5 which
>>>> I expect to be develop by AMD. Anyway, if it is really better I will add AMD before Zen5.
>>>>
>>>>>    Whether to mention this here
>>>>> when I think I backported all the pieces isn't entirely clear to me either.
>>>> What is the better place then?
>>> The question isn't where to put it, but whether to in the first place.
>> Wouldn't it be useful to highlight that Xen now supports the new security feature
>> for mitigating SRSO vulnerabilities on AMD Zen5?
> I don't know. Thing is what we list here is supposedly new in 4.20. Yet
> here we're talking about something that was already backported to older
> versions. I'll admit though I didn't check how much of that made it into
> any stable release.

This was my suggested wording.  Yes we've backported it, but it was also
new feature work done during the 4.20 window.

~Andrew

