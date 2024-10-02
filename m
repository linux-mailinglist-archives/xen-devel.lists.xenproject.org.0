Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB8F98E695
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 01:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809092.1221249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw8Sl-00055M-5A; Wed, 02 Oct 2024 23:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809092.1221249; Wed, 02 Oct 2024 23:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw8Sl-00052H-1D; Wed, 02 Oct 2024 23:08:55 +0000
Received: by outflank-mailman (input) for mailman id 809092;
 Wed, 02 Oct 2024 23:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw8Sj-00052B-Sx
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 23:08:53 +0000
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [2a00:1450:4864:20::544])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a668f5c-8113-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 01:08:52 +0200 (CEST)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-5c89bdb9019so258252a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 16:08:52 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88240a38asm8241415a12.22.2024.10.02.16.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 16:08:51 -0700 (PDT)
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
X-Inumbo-ID: 4a668f5c-8113-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727910532; x=1728515332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f7mYPNI4IC3vlYsK+CyOuvYwDnGjm039an7FH4KSsKQ=;
        b=J759YRD6aLyClOVpCEpqWqm/k5XlIdl8gh0oi8e9ssHBkERjgS4Z3S1otmH8doy265
         ccS49biWrTb8y4DjUQwLZyvfMob0VgtT4I9tlQBv/UNTxmA+gp+vL82Jp80OWll56uAE
         N3Lm+bTu2V+GOwaU9clNaN8rbr0OMA6Qw3Qrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727910532; x=1728515332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7mYPNI4IC3vlYsK+CyOuvYwDnGjm039an7FH4KSsKQ=;
        b=tomO+sGhA2ZCJlWyNGmy/fxfAbaj8q/yyej4wt7Nct6fR5+fpiy7DRbvjIwUhDrb2b
         NVQPLnR4saYjPDB/EPa3VgNdgLMu6eb87POJdWoSSHU1WPpybqicQPL5YvDo/0XTFhXD
         axDSBq/HAwqJudFaxf6DZOMk6Ytq5uscgc0++p33mxGs90vfjpLL/zgZVpYuhLZWmAil
         j4Nj/fKN2pu5AF+JhZXZz15zjWTNtqw/+LT3tDqGhtG9qqtuXmG1pSFoBs1jLmbVEwJa
         OO0GC082lPLGix+RSY/+qeTI74zlA42qjDF6Iw63V/hPSNn6YU4gGJb351ZYzLmm4tAM
         T7LQ==
X-Gm-Message-State: AOJu0YzSHp3KUd6Lg26iUFfmIeOdzvSxS+dS8sCo1SUve9BkAnZ8rMwD
	EgRX16yBKiY8x3IVrzZtXd07AMTLVxBQQViQ/CAKnd2D2ZtEZIPS79OcKkScb7gyjbDFy51noFD
	9i8Xqek2b
X-Google-Smtp-Source: AGHT+IEpIIRi68LOp4sqvDVuYsUCbLxxD2T+5qQI5+HOhPUS/VcRuiYn1yJvHbf5y60/IOmfh2iUvA==
X-Received: by 2002:a05:6402:51c8:b0:5c2:5c36:f838 with SMTP id 4fb4d7f45d1cf-5c8b1a2f7damr3192516a12.16.1727910531941;
        Wed, 02 Oct 2024 16:08:51 -0700 (PDT)
Message-ID: <9c8e50d2-29d4-411a-9aeb-3bcf6847c345@citrix.com>
Date: Thu, 3 Oct 2024 00:08:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] automation: add a smoke test for xen.efi on X86
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
References: <20241002124245.716302-1-marmarek@invisiblethingslab.com>
 <20241002124245.716302-2-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2410021516180.1138574@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2410021517500.1138574@ubuntu-linux-20-04-desktop>
 <Zv3Pbx1gkeypGQem@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zv3Pbx1gkeypGQem@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/10/2024 11:55 pm, Marek Marczykowski-Górecki wrote:
> On Wed, Oct 02, 2024 at 03:22:59PM -0700, Stefano Stabellini wrote:
>> I forgot to reply to one important part below
>>
>>
>> On Wed, 2 Oct 2024, Stefano Stabellini wrote:
>>> On Wed, 2 Oct 2024, Marek Marczykowski-Górecki wrote:
>>>> Check if xen.efi is bootable with an XTF dom0.
>>>>
>>>> The TEST_TIMEOUT is set in the script to override project-global value.
>>>> Setting it in the gitlab yaml file doesn't work, as it's too low
>>>> priority
>>>> (https://docs.gitlab.com/ee/ci/variables/#cicd-variable-precedence).
>>>>
>>>> The multiboot2+EFI path is tested on hardware tests already.
>>>>
>>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>> ---
>>>> This requires rebuilding debian:bookworm container.
>>>>
>>>> The TEST_TIMEOUT issue mentioned above applies to xilix-* jobs too. It's
>>>> not clear to me why the default TEST_TIMEOUT is set at the group level
>>>> instead of in the yaml file, so I'm not adjusting the other places.
>>> Let me premise that now that we use "expect" all successful tests will
>>> terminate as soon as the success condition is met, without waiting for
>>> the test timeout to expire.
>>>
>>> There is a CI/CD variable called TEST_TIMEOUT set at the
>>> gitlab.com/xen-project level. (There is also a check in console.exp in
>>> case TEST_TIMEOUT is not set so that we don't run into problems in case
>>> the CI/CD variable is removed accidentally.) The global TEST_TIMEOUT is
>>> meant to be a high value to account for slow QEMU tests running
>>> potentially on our slowest cloud runners.
>>>
>>> However, for hardware-based tests such as the xilinx-* jobs, we know
>>> that the timeout is supposed to be less than that. The test is running
>>> on real hardware which is considerably faster than QEMU running on our
>>> slowest runners. Basically, the timeout depends on the runner more than
>>> the test. So we override the TEST_TIMEOUT variable for the xilinx-* jobs
>>> providing a lower timeout value.
>>>
>>> The global TEST_TIMEOUT is set to 1500.
>>> The xilinx-* timeout is set to 120 for ARM and 1000 for x86.
>>>
>>> You are welcome to override the TEST_TIMEOUT value for the
>>> hardware-based QubesOS tests. At the same time, given that on success
>>> the timeout is not really used, it is also OK to leave it like this.
>>  
>>  
>>>> ---
>>>>  automation/build/debian/bookworm.dockerfile |  1 +
>>>>  automation/gitlab-ci/test.yaml              |  7 ++++
>>>>  automation/scripts/qemu-smoke-x86-64-efi.sh | 44 +++++++++++++++++++++
>>>>  3 files changed, 52 insertions(+)
>>>>  create mode 100755 automation/scripts/qemu-smoke-x86-64-efi.sh
>>>>
>>>> diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
>>>> index 3dd70cb6b2e3..061114ba522d 100644
>>>> --- a/automation/build/debian/bookworm.dockerfile
>>>> +++ b/automation/build/debian/bookworm.dockerfile
>>>> @@ -46,6 +46,7 @@ RUN apt-get update && \
>>>>          # for test phase, qemu-smoke-* jobs
>>>>          qemu-system-x86 \
>>>>          expect \
>>>> +        ovmf \
>>>>          # for test phase, qemu-alpine-* jobs
>>>>          cpio \
>>>>          busybox-static \
>>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>>>> index 8675016b6a37..74fd3f3109ae 100644
>>>> --- a/automation/gitlab-ci/test.yaml
>>>> +++ b/automation/gitlab-ci/test.yaml
>>>> @@ -463,6 +463,13 @@ qemu-smoke-x86-64-clang-pvh:
>>>>    needs:
>>>>      - debian-bookworm-clang-debug
>>>>  
>>>> +qemu-smoke-x86-64-gcc-efi:
>>>> +  extends: .qemu-x86-64
>>>> +  script:
>>>> +    - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv 2>&1 | tee ${LOGFILE}
>>>> +  needs:
>>>> +    - debian-bookworm-gcc-debug
>>> Given that the script you wrote (thank you!) can also handle pvh, can we
>>> directly add a pvh job to test.yaml too?
> I guess we can, but is xen.efi + PVH dom0 actually different enough to
> worth testing given we already test MB2+EFI + PVH dom0?

Given that its only an XTF dom0, no.  We're only smoke testing the
"native EFI" bits here.

~Andrew

