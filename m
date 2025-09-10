Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 132E7B51C9C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 17:57:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118578.1464313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwNBt-0001cF-6i; Wed, 10 Sep 2025 15:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118578.1464313; Wed, 10 Sep 2025 15:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwNBt-0001a5-3a; Wed, 10 Sep 2025 15:57:01 +0000
Received: by outflank-mailman (input) for mailman id 1118578;
 Wed, 10 Sep 2025 15:57:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMwI=3V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwNBs-0001Zy-EM
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 15:57:00 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c88ede44-8e5e-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 17:56:59 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3e7428c4cbdso567877f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 08:56:59 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df804bce3sm32780635e9.0.2025.09.10.08.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 08:56:58 -0700 (PDT)
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
X-Inumbo-ID: c88ede44-8e5e-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757519819; x=1758124619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uc0uRevkkxcuK9RJDoboXNlE4uHzDfJeym3CsurVY5I=;
        b=A106QOpWDeL34K27HUc46RTKh1OIfTNzuVs2SNJEAo8JiN93jOwYqUc3+RarLfmeYx
         ANUhRRSKGciba8Nlp4OdrojEXYTKuDrgex0wiOn8pf/JQTpTgFzbjjlUDsXA/uUR64Ha
         XNIROV0pLUciymdjNA6uD0TPLiEuMz+X8tnMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757519819; x=1758124619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc0uRevkkxcuK9RJDoboXNlE4uHzDfJeym3CsurVY5I=;
        b=RZBlNU7rzKEwRg5J8LxG2jvBhdK4RUKsoiGEebFe1hPN981ier7Vza/xP3v6tQbiFe
         nRJRBkEumauwp8s2ctxgBbJ1DMom3yi8eVC8UY7jUoYz/cAUHLI6OwazGjJS+R/+feAs
         lGo5+hmSH7GrowXMEhxL6G2VWMdf64k/qkYLzDLUq6k8UBNhLgVQ1ZOH/+c0NTMqkVTI
         Ao5Ciol/fbfiR8SBW4z0jBkWb8W76YyMUW0tEqjXuYlbI5103zbI/hV78jcfpuCvcfhk
         fCtwD5QZaqnDU+UudBehnPO7Ay5b6AHhfdNE1Tr5PjoECkg5aRUby9qXpRRE+KI1AvZT
         MEUA==
X-Gm-Message-State: AOJu0Yz3EuCkYG4wXV7lZwC5FbCYseED0nSSklLAo/vKQfBdwEtiViIq
	fNYCsC4lJA5GX8sDLW6GXVrrHiChAZ2gRv+x4mwSwrEzSJFtXHKqTRt/4IyGcV47SNg=
X-Gm-Gg: ASbGncuB1yqVJt2aIPSIth+DldQYyrsh/rW3Gb/a7NN/SqOD8XO7pJyX+Bc14g++IGf
	x3NgR7VutbgrYERG2xY2Z5tbgyAshTKHLObtL9y0BMp8ba5pxP5P8CwxotuSeyBRckyfppjnqTR
	u/RSd1vkqpQrFLj4THbTL5yIYBrJOR0UCMMVKCdJqW+WGf5d7qh3WX0djOzTxtcuDWZ6gmaHBxu
	erTZvkIODrEn2KTtnE1YF2XgdLwhHvimEhMmtvtDzdQQNUqtpuLT0FaLZruybigqAWo3oSDUift
	d7qSPa/zkBqQ/lixKkPaFYyOKRd7Kl4yjznrWKAbWKGuhN1S+Z9Z+0jv0FnvZxpuPw86ewEg/Yv
	9exjh7DDgIconPSVsx20hFXM9PhRmIOD3YNo61nprkTG1cwXVv/QwHdH1OIL29LzfB5uA
X-Google-Smtp-Source: AGHT+IExUc1sIMUCc6ll9njETf3E9bFDcJD5GaHTfjaNUrXHheYIMTpyhs1BKLWugS/0R4ECCYvAag==
X-Received: by 2002:a05:6000:1a8b:b0:3c2:d7f0:9c4e with SMTP id ffacd0b85a97d-3e75e0fadc1mr83541f8f.8.1757519818574;
        Wed, 10 Sep 2025 08:56:58 -0700 (PDT)
Message-ID: <33285a11-a28e-490f-94e1-748b741a0405@citrix.com>
Date: Wed, 10 Sep 2025 16:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] CI: Update ppc64 to use Debian Trixie
To: Anthony PERARD <anthony@xenproject.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Victor Lira <victorm.lira@amd.com>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
 <20250809221206.1260861-3-andrew.cooper3@citrix.com> <aJysartA4Sh6bdTE@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aJysartA4Sh6bdTE@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/08/2025 4:16 pm, Anthony PERARD wrote:
> On Sat, Aug 09, 2025 at 11:12:03PM +0100, Andrew Cooper wrote:
>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>> index ab5211f77e5e..3fe539dc5683 100644
>> --- a/automation/gitlab-ci/build.yaml
>> +++ b/automation/gitlab-ci/build.yaml
>> @@ -319,10 +319,10 @@ debian-12-x86_64-clang-debug:
>>    variables:
>>      CONTAINER: debian:12-x86_64
>>  
>> -debian-12-ppc64le-gcc-debug:
>> +debian-13-ppc64le-gcc-debug:
>>    extends: .gcc-ppc64le-cross-build-debug
>>    variables:
>> -    CONTAINER: debian:12-ppc64le
>> +    CONTAINER: debian:13-ppc64le
>>      KBUILD_DEFCONFIG: ppc64_defconfig
>>      HYPERVISOR_ONLY: y
>>      EXTRA_XEN_CONFIG: |
>> @@ -705,6 +705,20 @@ debian-12-ppc64le-gcc:
>>      KBUILD_DEFCONFIG: ppc64_defconfig
>>      HYPERVISOR_ONLY: y
>>  
>> +debian-12-ppc64le-gcc-debug:
>> +  extends: .gcc-ppc64le-cross-build-debug
>> +  variables:
>> +    CONTAINER: debian:12-ppc64le
>> +    KBUILD_DEFCONFIG: ppc64_defconfig
>> +    HYPERVISOR_ONLY: y
>> +
> Why did you remove the EXTRA_XEN_CONFIG from this job? Currently, the
> job is setup as:
>
>     debian-12-ppc64le-gcc-debug:
>       extends: .gcc-ppc64le-cross-build-debug
>       variables:
>         CONTAINER: debian:12-ppc64le
>         KBUILD_DEFCONFIG: ppc64_defconfig
>         HYPERVISOR_ONLY: y
>         EXTRA_XEN_CONFIG: |
>           CONFIG_UBSAN=y
>           CONFIG_UBSAN_FATAL=y

Because the build run under QEMU changes too.  (See the hunk updating
test.yaml)

We use UBSAN/FATAL for builds where we boot the resulting hypervisor,
and not for the plain build tests.  (In farness, UBSAN/FATAL is newer
than the last time I shuffled test baselines).

If we're going to start having config like this on multiple builds,
we're going to need to find a better way to handle it, because we cannot
be duplicating it between different jobs.

~Andrew

