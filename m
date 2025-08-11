Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D0DB20492
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 11:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077203.1438281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulPGK-0002f5-AF; Mon, 11 Aug 2025 09:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077203.1438281; Mon, 11 Aug 2025 09:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulPGK-0002c5-78; Mon, 11 Aug 2025 09:56:16 +0000
Received: by outflank-mailman (input) for mailman id 1077203;
 Mon, 11 Aug 2025 09:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92re=2X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulPGI-0002bz-SJ
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 09:56:14 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69ce6f17-7699-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 11:56:12 +0200 (CEST)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-459d62184c9so23758225e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 02:56:12 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9386sm40087750f8f.18.2025.08.11.02.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 02:56:11 -0700 (PDT)
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
X-Inumbo-ID: 69ce6f17-7699-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754906172; x=1755510972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wF76E3pK10aybSWJoNLKNKlJoCYBCDGZ1DFhqWgInXw=;
        b=lWOS478q/TulV6iALvi/wBOPZ4ry8VPQPkDs0bvznDV5eTzJUJ2IsgpWOBliEChGp0
         Ky4kdB0FNl0kI8CrzqF57IpEMTwFMDZVycfdCPNxWc/SwWLbcvz59pS8xA2NrbIO/tvm
         zncO4mdafRx17Ha0Hq1z7txXvlchwdFmtY2lU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754906172; x=1755510972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wF76E3pK10aybSWJoNLKNKlJoCYBCDGZ1DFhqWgInXw=;
        b=t1YIeSVpPdHp66ukrP9oWhKTL394n8BfslxZw3gDudftc5MkL7XALU01cX74Xc8nZr
         7AIvoXww229s1xkLWmjRsz7CAMLxJRQObsqRQqZdXR0Lgg/NJ2M0Ah1m4M3cQf6XTDlM
         XLRqtpzelWocmITOEjy2dncrlZsSZ0+uc7DWWK8fpC+SPvSTrJVjTABpcd+ZlBZPA0iy
         Dspa7ao3GGBLOZLPn7cRcjmcsbdFB4SU3VYyuo6XdQSmJ0+lf1BvADbnql1+eL3gByfr
         y4kAIOftPolMXX5hE465Eo1KopZg6LBr4nZvN+vF2SFqE8T2N65M8TF756rJdbnEf3bz
         Z6ow==
X-Forwarded-Encrypted: i=1; AJvYcCUDUDTam/XEzPbDrSQuKjvQ1Ikiwi56Cf12M//FmA6yZW/LyNq7wjc6qAYqxzZq9tY6sVr3ny3jKkU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkS59ejXd7Lf43/KOOVkUYyPrgkiVZfJJrKgTFyum/2ijLakIv
	E+BXLHzbAb49YIOZcoYt1Rw9sCdnhIAlLq5bkc7ZDuCs2aHuRJp0XXa0eUNcX2uoY+g=
X-Gm-Gg: ASbGncsmXB2b0SmtGnqfk+8N/slAiCV8ZLYQv4/AAzKsve6j9/gahEgW9jVjISVMSO6
	4uiPlJMqc1aaE1VMRRlceJbx9LwSmCJvLHh1SDmRhQd4ahONO2HuiD4KKq0KUjkVSeQmX7NJdj3
	ZoxJpuHN4coKoPkgtt38+KE6RBIw0bEMr/6mwss8VRi7MxmPl+vFNPrW1pSXJIjeg/7KuGLH4oR
	OjGrJYoe5K9tS8EMU/VLcWGCE/nZ4fv+75dJmv76e8h8HJdiHFW0cSibAHKS+BsijFKSrc+KJXj
	M6GcfboCDeo31ccD5Oe8KiJ9oaIsWt4HGtSy6yupvHSHnxsie/t8gzcA2I+IPdPsSB0caSSZWdF
	3oaf4/V6R3QOjUMCG0n7KT8Y+oJmr1jlP636cD1I2ZG6WRxiKn+Ud9xa4dkOC3mYkkyo1
X-Google-Smtp-Source: AGHT+IEqWhkjwHDaufB0hgjvJZMDTyb3rwb9F/2bwF7cPDMMs6fBXobf70GFQzaxlMhjLKCbInpyOw==
X-Received: by 2002:a05:600c:4e16:b0:456:db0:4f3d with SMTP id 5b1f17b1804b1-459f7a37036mr97810955e9.24.1754906172025;
        Mon, 11 Aug 2025 02:56:12 -0700 (PDT)
Message-ID: <2e3412e8-9d62-449b-87e6-22d34ce06e30@citrix.com>
Date: Mon, 11 Aug 2025 10:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] CI: Update riscv64 to use Debian Trixie
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Victor Lira <victorm.lira@amd.com>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
 <20250809221206.1260861-4-andrew.cooper3@citrix.com>
 <2919f22b-0b0c-488e-b0c6-96b9538e63d9@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2919f22b-0b0c-488e-b0c6-96b9538e63d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/08/2025 9:43 am, Oleksii Kurochko wrote:
>
>
> On 8/10/25 12:12 AM, Andrew Cooper wrote:
>> Everything works fine with Debian 13.  Provide two new build jobs, and update
>> both the randconfig the test jobs.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Doug Goldstein <cardoe@cardoe.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> CC: Victor Lira <victorm.lira@amd.com>
>>
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1975929387
>> ---
>>  automation/gitlab-ci/build.yaml | 22 ++++++++++++++++++----
>>  automation/gitlab-ci/test.yaml  |  2 +-
>>  2 files changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>> index 3fe539dc5683..f8e45f3467c8 100644
>> --- a/automation/gitlab-ci/build.yaml
>> +++ b/automation/gitlab-ci/build.yaml
>> @@ -329,10 +329,10 @@ debian-13-ppc64le-gcc-debug:
>>        CONFIG_UBSAN=y
>>        CONFIG_UBSAN_FATAL=y
>>  
>> -debian-12-riscv64-gcc-debug:
>> +debian-13-riscv64-gcc-debug:
>>    extends: .gcc-riscv64-cross-build-debug
>>    variables:
>> -    CONTAINER: debian:12-riscv64
>> +    CONTAINER: debian:13-riscv64
>>      KBUILD_DEFCONFIG: tiny64_defconfig
>>      HYPERVISOR_ONLY: y
>>      EXTRA_XEN_CONFIG: |
>> @@ -727,6 +727,20 @@ debian-12-riscv64-gcc:
>>      KBUILD_DEFCONFIG: tiny64_defconfig
>>      HYPERVISOR_ONLY: y
>>  
>> +debian-12-riscv64-gcc-debug:
>> +  extends: .gcc-riscv64-cross-build-debug
>> +  variables:
>> +    CONTAINER: debian:12-riscv64
>> +    KBUILD_DEFCONFIG: tiny64_defconfig
>> +    HYPERVISOR_ONLY: y
> Don't you mind to keep an order? So:
>   debian-12-riscv64-gcc-debug:
>   ...
>   debian-13-riscv64-gcc-debug:
>   ...

Notice how those 2 hunks are 400 lines apart in the file.

This is deliberate so debian-13-riscv64-gcc-debug (the one needed for
tests) is scheduled with higher priority than the others.

The diff certainly isn't great, but this is necessary to shorten the
pipeline.

>
> Also, it will make a diff a little bit better.
>
>> +
>> +debian-13-riscv64-gcc:
>> +  extends: .gcc-riscv64-cross-build
>> +  variables:
>> +    CONTAINER: debian:13-riscv64
>> +    KBUILD_DEFCONFIG: tiny64_defconfig
>> +    HYPERVISOR_ONLY: y
>> +
>>  .riscv-fixed-randconfig:
>>    variables: &riscv-fixed-randconfig
>>      EXTRA_FIXED_RANDCONFIG: |
>> @@ -739,10 +753,10 @@ debian-12-riscv64-gcc:
>>        CONFIG_VM_EVENT=n
>>        CONFIG_XSM=n
>>  
>> -debian-12-riscv64-gcc-randconfig:
>> +debian-13-riscv64-gcc-randconfig:
> Are we going to have randconfig build test only for Debian-13?

We only have finite test capacity.

>
>>    extends: .gcc-riscv64-cross-build
>>    variables:
>> -    CONTAINER: debian:12-riscv64
>> +    CONTAINER: debian:13-riscv64
>>      KBUILD_DEFCONFIG: tiny64_defconfig
>>      RANDCONFIG: y
>>      <<: *riscv-fixed-randconfig
>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>> index 2f6f3affa637..9acd984d294c 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -705,7 +705,7 @@ qemu-smoke-riscv64-gcc:
>>    script:
>>      - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
>>    needs:
>> -    - debian-12-riscv64-gcc-debug
>> +    - debian-13-riscv64-gcc-debug
> The same as above, are we going to run smoke tests only for Debian-13?

Again, test capacity.  Even for x86 and ARM, we only have one main build
under test.

>
> If the answer to this and the question above is “yes,” then (probably
> keeping the order — first debian-12, then debian-13 — for the jobs):
>  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Sorry, but rearranging is one thing that can't really happen.  Are you
happy with my justification?

~Andrew

