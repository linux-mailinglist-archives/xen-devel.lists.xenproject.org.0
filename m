Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA07D1DC33
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 10:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202847.1518273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxey-0001Nr-9Q; Wed, 14 Jan 2026 09:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202847.1518273; Wed, 14 Jan 2026 09:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfxey-0001LM-6i; Wed, 14 Jan 2026 09:59:28 +0000
Received: by outflank-mailman (input) for mailman id 1202847;
 Wed, 14 Jan 2026 09:59:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfxex-0001LG-6a
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 09:59:27 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4e39e3b-f12f-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 10:59:25 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6536e4d25e1so2264001a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 01:59:25 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b9d44bfsm22530193a12.8.2026.01.14.01.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:59:24 -0800 (PST)
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
X-Inumbo-ID: b4e39e3b-f12f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768384764; x=1768989564; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYicekyITAX4irHFHrfOAg5BwT5oh5/ixpFZktRVUOg=;
        b=QKSrPU5UuhnV94zxn4oT0puzRU9dmpG5pmdkI5h7MeJbS0VNmwqGXLptWkBjrhRpI2
         faCFdZNNnPos7xzf3tMBMkWz1HlRVt88XddgwjGuDMJUcUNXJxPQ9krVL+iFgXRJeuWL
         jov8hw9eebopUXbjle67iTGME9NhJ+j7XD5lxFPGV0b/9nWkaOBxGumRGmeRO/e5Sv6D
         Q9vt0E8ro/91vWZtsgYfHyd8r02cFs6YB5v3ZNeipk8jHukEFcXIbrweLoLv+MiEwlz9
         tRbtKwi+BkcKHVIvSLnB0WvQ2cq3SgWpNKRSGcqCYadvmWm8stJiPPfZbDfEewETKsgE
         kURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384764; x=1768989564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYicekyITAX4irHFHrfOAg5BwT5oh5/ixpFZktRVUOg=;
        b=vDELpO8OWWVn3lc9xET8s8eQB90UJNaiVWwhGkQHcCsxGBBITMiRVl4k26R+l/tPVO
         7V4Jpk4gcgw8XT9ejpruB6luU/m5oZA24QBm5/qQMXkJLdiuv6rbEPAyu7hdmz/8AEE7
         W1MSfiOAZhVNeNwQbm67/UpGrydKHx8CiR9/8MgV8OsrltCBfgT64pezd3HfIvhxegs9
         4BnxoPVL+fUfmQUJzH5tLP4UfZhgjxX/vbmmkecXgKhlSku+OudtBRi77neEjec4NXgJ
         TWNZi3tPxJ5/m5HHjvDyx+JzXJ+pZ+hcm9zwUDoaXTB1Rc3SOdcir+eOt6Fsz7pHoZ94
         xuFA==
X-Forwarded-Encrypted: i=1; AJvYcCVFjSOqKs9MV+5DaFZ6AMfrV9Xufy1tKoKQvQVbsTZo9WgAETlQJgRAEAFgNJSrnoaCAJ6n1pJu2es=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvGaIa5+bDcsq0rxGTWaOBS5aRYdhfwytf8tO1JCxIeBqKeXTe
	v299oIrJIaaNBxkUyPE+fvQn/iZJzlOIX6H3D/71GxweUfiT9RSSRAc5Gjlz+g==
X-Gm-Gg: AY/fxX6bIkVgdoDXphNBq7sIra1ADueOCUO/yn1DgCQjYQ63axW03yqoXL4lJU1P03u
	YWmBo9Dvn5q8MrGLTJNSdJ8rU/w9Mkxdibsm2wWxToHFdmkEPs4aCx+tVxg18ktU05NmTcTC0E3
	uJGiEXbuYyhCzOLgvbyZOWCmo8u4lTsZ569m9sGOQ23lBDxNxofXPnOwZ79LmTQjM7Xrf0AInv2
	KY3a6dExfoO4AoWSWMMufWHiWdFg508cV228ZcTOddneHSqX6aUKlx2ylHnpqxLg5jGibBHRaKt
	nGwe/p0pNnqZTQicD9UfZiIykLgnVtCQktY6vov/WLUnzln7ZbHlhn6a7v3vgB4a/4+At2z4NOT
	hGEuEGmsKLFdXl3S1XGbDml+tdTviGMBWAeohU6xRCRoanvYsu4UfKfSCbfo60qAX7UK1e2W9wK
	MB18Pqv6/3rcdPpTspGKWD1f4x9aJNv/B20TvCwUytSNbjxXd8YNzgbNkgehql5E4=
X-Received: by 2002:aa7:d68c:0:b0:64b:458d:83 with SMTP id 4fb4d7f45d1cf-653ec11a4b7mr1117529a12.9.1768384764238;
        Wed, 14 Jan 2026 01:59:24 -0800 (PST)
Message-ID: <6795ad9f-d755-4898-aaf7-c88bc6f9f754@gmail.com>
Date: Wed, 14 Jan 2026 10:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/15] xen/riscv: introduce sbi_set_timer()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <84cf8fb2331614c6d0cc6e9030571f42bfc6d928.1766595589.git.oleksii.kurochko@gmail.com>
 <de975e5d-4df7-4dee-9edf-400e5287cc82@suse.com>
 <5f658f5b-1c22-4bd7-9f25-f89576d5003e@gmail.com>
 <d0f8a1eb-6aaf-482e-8e86-4435265764fa@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d0f8a1eb-6aaf-482e-8e86-4435265764fa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/14/26 10:07 AM, Jan Beulich wrote:
> On 13.01.2026 17:33, Oleksii Kurochko wrote:
>> On 1/12/26 4:12 PM, Jan Beulich wrote:
>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>> Introduce pointer to function which points to a specific sbi_set_timer()
>>>> implementation. It is done in this way as different OpenSBI version can
>>>> have different Extenion ID and/or funcion ID for TIME extension.
>>>>
>>>> sbi_set_time() programs the clock for next event after stime_value
>>>> time. This function also clears the pending timer interrupt bit.
>>>>
>>>> Introduce extension ID and SBI function ID for TIME extension.
>>>>
>>>> Implement only sbi_set_timer_v02() as there is not to much sense
>>>> to support earlier version and, at the moment, Xen supports only v02.
>>> Besides this somewhat contradicting the use of a function pointer: What
>>> about the legacy extension's equivalent?
>> I think this is not really needed, and the same implementation can be used for
>> both the Legacy and TIME extensions, since the API is identical and the only
>> difference is that|sbi_set_timer()| was moved into a separate extension.
>>
>> Since Xen reports to the guest that it supports SBI v0.2, it is up to the guest
>> implementation to decide why it is still using|sbi_set_timer()| from the
>> Legacy extension instead of the TIME extension.
>>
>> I think that I can add Legacy extension equivalent but considering that we are
>> using OpenSBI v0.2 for which Time extension is available it seems for me it is
>> enough to define sbi_set_timer to sbi_set_timer_v02() for now.
> Feels like here you're negating what just before you wrote in reply to 10/15.
> IOW - I'm now sufficiently confused. (Just consider if you ran Xen itself as
> a guest of the very same Xen. From what you said for 10/15, it would end up
> not seeing the TIME extension as available, hence would need a fallback to
> the Legacy one.

You are right, a fallback to the Legacy one should be provided for such cases.

Actually, it is why Linux could be ran now as it has its fallback too.

~ Oleksii


