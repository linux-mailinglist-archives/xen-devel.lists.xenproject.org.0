Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2208BA449A3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 19:09:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895948.1304629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmzMg-00069l-Sh; Tue, 25 Feb 2025 18:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895948.1304629; Tue, 25 Feb 2025 18:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmzMg-00066d-PO; Tue, 25 Feb 2025 18:09:06 +0000
Received: by outflank-mailman (input) for mailman id 895948;
 Tue, 25 Feb 2025 18:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHA0=VQ=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tmzMf-00066U-Js
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 18:09:05 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98f5bb2d-f3a3-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 19:09:04 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54843052bcdso3122181e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 10:09:04 -0800 (PST)
Received: from [192.168.10.20] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514fa0e9sm237810e87.235.2025.02.25.10.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 10:09:02 -0800 (PST)
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
X-Inumbo-ID: 98f5bb2d-f3a3-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740506944; x=1741111744; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vMG4Yn4Nf7CpejD37O9whbinM7FJU1O2Ox20yBelT48=;
        b=hA0bfvK6akR+vTCW0f6KNkGZYbcXYMQZbdqWOY6aW3N8Q5lmapnuMClwzk1NDzwjqC
         e2wRY93dyEOiPq482Ges5kvMJCk75uMKDk0693K854X0iBeqLYQwp8eJUR62gJKoG+vM
         JQYqY8wetLwuTg0bOVq++PjlewLNDOQa8wNezuzVZFgjoWUAvcCDg09JM4LIeTi9Dm08
         ZxbLggPMGfFmBw/IIofFetbA3XY9G0UNAJKhvhjEUZrBEsTqr3yC2E8EbzXrDHVOoJ5I
         e/KARaLvtNfyf35JviufZ7e9YFK4Ws9gQnJrjQeK4YLJGy3weEaJsUTFh8lDGLJbCVIO
         VvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506944; x=1741111744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMG4Yn4Nf7CpejD37O9whbinM7FJU1O2Ox20yBelT48=;
        b=Q8J7tQ9E01xzo95LQo2s1zttAXsdQLVb+G5KP8EOlpMPtc5DBi5kCS56BMbohIyaPl
         as2JTRHAfREpRcz8RLVDdyTngaKPB9Zosw2F51T94lAY8XLEg1Q1d3w4De7jmGYufQLr
         PSB05YGihCMFSIHe6O/sKENir/WxZMJbK7Mdz3D+9Dd4DRewm7TTzx0ct3JY8R9fJqrR
         +qxqfzsbRaDV490YNdkyin2B+yv28sCVbndtbfiaYIbutYISMx2Deom5zAC3IAUrJPsc
         ZXv1yf36YOJq9WtSYyrqdLwE+7wRur6I6ManwqPOGQtVFsz9FO1Eq0CE2OqgZkeRgCVE
         45sQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5al3CXkW/mN31ZcWRIbEjeu9lEkTRDnBfzujQrkmSZOLHOttYPAc9TjCMBbNuvCp8x41fA+yEo2c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQgy9Oj6R4U+SlwphnkKC8nK5K4R46br0DORjNQCoojz/jQ5By
	UJMPjTjAYSjpCPTZNl+VJNg/nYOP8eozQgzNqeJmSMihj1HwmVOo1wHZdQ==
X-Gm-Gg: ASbGnct7K+xF1gIrP27X83ZQ5+wwmueShGQ4xPdm7V0z1vTmWf4vkB8dYS08yWVfY1r
	8YVp9K2UhmikrqmD31DiLxkx8KtMGVja6Ob5d00z8uxJBpfTDc4BQSuKjnFc6rc+anP1vSIoiwi
	73VB2Yk+WOousRiWdX4htyVmoV+AyUUp22xI0bFM6GPD55qJnFvh7zhHI67WDJAGRdGwmYcEGnQ
	X4TGrekyhB1LG8yYpZkNPy8Xj0TbXmwnnbsBiM44FEqKugNLKU7vLKoFj/V06G1A2f3WupNz67U
	3FRN76ebAd/pXM//3G9+PgvNmuY=
X-Google-Smtp-Source: AGHT+IGdglEFainUwnal6J2Gkp0CJ+T3OsGpi39M2Qv1QU9hlYKNHa9JHA7PzGN5ny7+u8uhDVqySw==
X-Received: by 2002:a05:6512:3053:b0:546:2f44:ee99 with SMTP id 2adb3069b0e04-548510d68fbmr2830905e87.17.1740506943429;
        Tue, 25 Feb 2025 10:09:03 -0800 (PST)
Message-ID: <01032f64-1a34-412a-b23b-08762e0efcc0@gmail.com>
Date: Tue, 25 Feb 2025 20:09:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Jan Beulich <jbeulich@suse.com>
Cc: Artem_Mygaiev@epam.com, Luca.Fancellu@arm.com, roger.pau@citrix.com,
 marmarek@invisiblethingslab.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <4f1fcad5-dd6c-471f-9496-023973fa8857@suse.com>
 <alpine.DEB.2.22.394.2502171833370.1085376@ubuntu-linux-20-04-desktop>
 <f6db4e23-8c6e-43a5-a90a-ea3526f88b23@suse.com>
 <26cfd51b-123f-48e7-9911-2c96b48abdfe@gmail.com>
 <f0a4af56-016f-4ea7-92a8-6f6f4a62809a@suse.com>
 <924753a2-8abc-4d49-84f9-6f4677bf76f1@gmail.com>
 <alpine.DEB.2.22.394.2502191725300.1791669@ubuntu-linux-20-04-desktop>
 <020f1294-cd11-4733-a518-f4a42f146a83@gmail.com>
 <62498ba8-dbbb-48ab-8bc1-9833909c90b4@suse.com>
Content-Language: en-US
From: Oleksandr Andrushchenko <andr2000@gmail.com>
In-Reply-To: <62498ba8-dbbb-48ab-8bc1-9833909c90b4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, Jan!

On 24.02.25 12:55, Jan Beulich wrote:
> On 23.02.2025 08:42, Oleksandr Andrushchenko wrote:
>> On 20.02.25 03:34, Stefano Stabellini wrote:
>>> On Wed, 19 Feb 2025, Oleksandr Andrushchenko wrote:
>>>> Yes, I do agree. But only if we talk about having an automated
>>>> code style check now (which is definitely the goal at some time).
>>>> Before that we could still use the tool to take all that good that
>>>> it does and manually prepare a set of patches to fix those
>>>> code style issues which we like.
>>> Let's explore this option a bit more. Let's say that we write down our
>>> coding style in plain English by enhancing CODING_STYLE. This newer
>>> CODING_STYLE has also a corresponding clang-format configuration.
>>>
>>> Now, we cannot use clang-format to reformat everything because, as we
>>> are discovering with this example, clang-format is overzealous and
>>> changes too many things. Instead, we take "inspiration" from
>>> clang-format's output but we manually prepare a patch series to apply
>>> code style changes to Xen as the coding style today is not uniform
>>> across the code base and also not always conforming to CODING_STYLE.
>>>
>>> At this point, we have already made an improvement to CODING_STYLEe, and
>>> made the Xen coding style more uniform across the codebase.
>>>
>>> But do we also have an automated coding style checker that we can use?
>> It really depends on what that coding style would look like and
>> if the rules we impose are supported by clang-format and if we ready
>> to change ourselves if they are not.
>> Again, here we are trying to do what we already did, but in the opposite
>> direction: "diff -p" didn't work as expected(?) and we have changed
>> *our* coding style to *fit that tool*. So, are we ready to do the same for
>> another?
> With a small but relevant difference: "diff" is a tool that people have been
> using forever.
This is true. It is also true that that respectful tool expects labels to
use no indentation at the function scope.
>
>>> Can we use clang-format to check new patches coming in?
>> Yes, we can use git-clang-format for that. clang-format is flexible enough
>> in its configuration. So, it can be used for checking patches with different
>> coding styles by providing .clang-format files at any folder level, e.g. we may
>> have something like (just to show an example):
>> - xen/drivers: Linux style .clang-format
>> - xen (rest): Xen style .clang-format
>> - libxl: its own .clang-format
>> - etc.
>> We can also disable formatting for the entire folder if need be by putting
>> a .clang-format with "DisableFormat: true" option in it.
>> clang-format respects the nested configuration files
> Folder granularity is likely far too coarse.
That was just an example of what we can do.
>
>> So, to answer your question: I think we can use the tool to check incoming
>> patches.
> I think the question was more aiming at: Can we have the tool check a patch
> for it to only introduce well-formed code, even if elsewhere in a file being
> touched there are instances of what the tool would re-format?
I need to do some tests, but with git-clang-format and possible some
pre-commit hook we can have formatting for the patch only.
>
> Jan
Thank you,
Oleksandr

