Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFD97A9298
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 10:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606190.943936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjF4h-00050h-VU; Thu, 21 Sep 2023 08:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606190.943936; Thu, 21 Sep 2023 08:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjF4h-0004xy-S2; Thu, 21 Sep 2023 08:30:15 +0000
Received: by outflank-mailman (input) for mailman id 606190;
 Thu, 21 Sep 2023 08:30:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=95bz=FF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qjF4h-0004xS-3W
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 08:30:15 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 155f8149-5859-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 10:30:13 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-52889bc61b6so716354a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 01:30:13 -0700 (PDT)
Received: from [192.168.1.10] (host-92-12-62-212.as13285.net. [92.12.62.212])
 by smtp.gmail.com with ESMTPSA id
 h22-20020aa7c956000000b005224f840130sm491058edt.60.2023.09.21.01.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 01:30:12 -0700 (PDT)
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
X-Inumbo-ID: 155f8149-5859-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695285012; x=1695889812; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fx1l2NcpPZpV+hg7CDGanVJrZbXMjIKBFinY1Qg7LkQ=;
        b=ad2KmQ9JT8//swuu8AH2p2WD2FkIEctIKBKkCaeJcOu/tlYx0ALq8fd4brgy6Okpfg
         ZU0VGfhaCdUzdIIIjCSBM/W9nbB5LA7RPa6D/UpNa6jRV4FSLNxQb+HcZZub/Ph/jpCA
         oJAfoDCLNYuNqGU2VJpHl4y/+K3hqIQP2lGp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695285012; x=1695889812;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx1l2NcpPZpV+hg7CDGanVJrZbXMjIKBFinY1Qg7LkQ=;
        b=wvvFZ8QHMMb4aC+AZ3ECq9sKBRU8izQCOR9xVaVcqqC32Ks5wYxnDk4YFNAG6XARXk
         F9HajO3y4l7qv9Z4Q8jpo1M2k6Dq+zEH8mk0vjJdDFrm4wyd9jQQXjCgIDu4SQ9fm+ki
         oIsb7fptgU09YXd25Ffd+PqNI6NdgtJddJ8L55v5BxyKjnF+ARk2aQXXSj5vylmaMMqb
         2je41EYwn8Dxu9zVfXg3zUv2Uv0b6/bQeeQJaNRQBK5KR//X7br+Zo/c2v/qxLP5qOGG
         eTFVEpEiYeaTlcmiilTSivYl0lU2STgn/fk81o5YEUCpxPdmOZbFgb0kK6ms0fVjdpUH
         M+8w==
X-Gm-Message-State: AOJu0YzyvnIINSfKQjCroaeuPF1G6DNJHhPnUEGrtBWYdBDfh8mk7qVO
	JB+n5MlbkZUZKod8FW6jfc6b9NE/Q7A/tcNzZxA=
X-Google-Smtp-Source: AGHT+IE85vtc3uC/F6DsL2DwB6EdzlC3G+7efIB845IyOod4HXUXFhibN6XBkNrWP227QpW+tw0L9Q==
X-Received: by 2002:aa7:c0c6:0:b0:52c:b469:bb00 with SMTP id j6-20020aa7c0c6000000b0052cb469bb00mr4393721edp.22.1695285012477;
        Thu, 21 Sep 2023 01:30:12 -0700 (PDT)
Message-ID: <433092cd-2a0e-08b8-b846-be33983b6349@citrix.com>
Date: Thu, 21 Sep 2023 09:30:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: xen | Failed pipeline for staging-4.15 | 3a9a2901
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <650ace63a5321_28a55b478157@gitlab-sidekiq-catchall-v2-86b648d56d-wk4kh.mail>
 <fcff9af9-3abd-2d0a-f40c-826f6b1de815@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <fcff9af9-3abd-2d0a-f40c-826f6b1de815@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/09/2023 8:08 am, Jan Beulich wrote:
> On 20.09.2023 12:50, GitLab wrote:
>>
>> Pipeline #1010772231 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/xen )
>> Branch: staging-4.15 ( https://gitlab.com/xen-project/xen/-/commits/staging-4.15 )
>>
>> Commit: 3a9a2901 ( https://gitlab.com/xen-project/xen/-/commit/3a9a2901cc8b24f28dbdc6fb63f57006c77a1f47 )
>> Commit Message: x86/shadow: defer releasing of PV's top-level s...
>> Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
>> Committed by: Andrew Cooper ( https://gitlab.com/andyhhp )
>>
>>
>> Pipeline #1010772231 ( https://gitlab.com/xen-project/xen/-/pipelines/1010772231 ) triggered by Ganis ( https://gitlab.com/ganis )
>> had 19 failed jobs.
> I'm somewhat puzzled here, in two ways:
>
>> Job #5127621914 ( https://gitlab.com/xen-project/xen/-/jobs/5127621914/raw )
>>
>> Stage: build
>> Name: debian-stretch-clang-debug
>> Job #5127621916 ( https://gitlab.com/xen-project/xen/-/jobs/5127621916/raw )
>>
>> Stage: build
>> Name: debian-stretch-gcc
> This one failed with
>
> In file included from /builds/xen-project/xen/tools/qemu-xen-dir/include/qemu/timer.h:4:0,
>                  from /builds/xen-project/xen/tools/qemu-xen-dir/include/qemu/timed-average.h:29,
>                  from /builds/xen-project/xen/tools/qemu-xen-dir/include/block/accounting.h:28,
>                  from /builds/xen-project/xen/tools/qemu-xen-dir/include/block/block_int.h:27,
>                  from /builds/xen-project/xen/tools/qemu-xen-dir/block/file-posix.c:30:
> /usr/include/linux/swab.h: In function '__swab':
> /builds/xen-project/xen/tools/qemu-xen-dir/include/qemu/bitops.h:20:34: error: "sizeof" is not defined [-Werror=undef]
>  #define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)
>                                   ^
> /builds/xen-project/xen/tools/qemu-xen-dir/include/qemu/bitops.h:20:41: error: missing binary operator before token "("
>  #define BITS_PER_LONG           (sizeof (unsigned long) * BITS_PER_BYTE)
>                                          ^
> cc1: all warnings being treated as errors
>
> What? How can "sizeof" no be "defined"?

Because the expression is

#if (sizeof (unsigned long) * BITS_PER_BYTE) = 64

combined with -Werror=undef saying that it can't figure out out what
sizeof is supposed to be here as a preprocessor token.

This needs a bump to qemu in order to fix, like we did on the newer
branches.

>
>> Job #5127621965 ( https://gitlab.com/xen-project/xen/-/jobs/5127621965/raw )
>>
>> Stage: build
>> Name: opensuse-leap-clang-debug
>> Job #5127621939 ( https://gitlab.com/xen-project/xen/-/jobs/5127621939/raw )
>>
>> Stage: build
>> Name: debian-unstable-32-gcc-debug
>> Job #5127621913 ( https://gitlab.com/xen-project/xen/-/jobs/5127621913/raw )
>>
>> Stage: build
>> Name: debian-stretch-clang
>> Job #5127621924 ( https://gitlab.com/xen-project/xen/-/jobs/5127621924/raw )
>>
>> Stage: build
>> Name: debian-unstable-clang-debug
>> Job #5127621934 ( https://gitlab.com/xen-project/xen/-/jobs/5127621934/raw )
>>
>> Stage: build
>> Name: debian-unstable-gcc-debug-randconfig
>> Job #5127621930 ( https://gitlab.com/xen-project/xen/-/jobs/5127621930/raw )
>>
>> Stage: build
>> Name: debian-unstable-gcc-debug
>> Job #5127621928 ( https://gitlab.com/xen-project/xen/-/jobs/5127621928/raw )
>>
>> Stage: build
>> Name: debian-unstable-gcc
>> Job #5127621937 ( https://gitlab.com/xen-project/xen/-/jobs/5127621937/raw )
>>
>> Stage: build
>> Name: debian-unstable-32-clang-debug
>> Job #5127621974 ( https://gitlab.com/xen-project/xen/-/jobs/5127621974/raw )
>>
>> Stage: build
>> Name: debian-unstable-gcc-arm64
>> Job #5127621975 ( https://gitlab.com/xen-project/xen/-/jobs/5127621975/raw )
>>
>> Stage: build
>> Name: debian-unstable-gcc-debug-arm64
>> Job #5127621964 ( https://gitlab.com/xen-project/xen/-/jobs/5127621964/raw )
>>
>> Stage: build
>> Name: opensuse-leap-clang
>> Job #5127621892 ( https://gitlab.com/xen-project/xen/-/jobs/5127621892/raw )
>>
>> Stage: build
>> Name: archlinux-gcc-debug
>> Job #5127621889 ( https://gitlab.com/xen-project/xen/-/jobs/5127621889/raw )
>>
>> Stage: build
>> Name: archlinux-gcc
> This one exhibits what e35138a2ffbe ("rombios: Work around GCC issue 99578")
> addresses, yet 4.16, which also doesn't have that backport, succeeded earlier
> on.

I rebuilt the archlinux container yesterday evening for the Py3
changes.  It's just possible that 4.15 ran with a newer container than 4.16

Nevertheless, I should backport the fix to reduce the noise here.

~Andrew

