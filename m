Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22981CF2524
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 09:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195067.1513105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcfcC-0006v5-53; Mon, 05 Jan 2026 08:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195067.1513105; Mon, 05 Jan 2026 08:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcfcC-0006su-2A; Mon, 05 Jan 2026 08:07:00 +0000
Received: by outflank-mailman (input) for mailman id 1195067;
 Sun, 04 Jan 2026 17:29:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9R8C=7J=gmail.com=akmarkov45@srs-se1.protection.inumbo.net>)
 id 1vcRuz-00081A-IC
 for xen-devel@lists.xen.org; Sun, 04 Jan 2026 17:29:29 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb3e4084-e992-11f0-b15e-2bf370ae4941;
 Sun, 04 Jan 2026 18:29:28 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-598f81d090cso13857935e87.2
 for <xen-devel@lists.xen.org>; Sun, 04 Jan 2026 09:29:27 -0800 (PST)
Received: from [192.168.1.66] (95-24-239-83.broadband.corbina.ru.
 [95.24.239.83]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38122687547sm124189561fa.47.2026.01.04.09.29.22
 for <xen-devel@lists.xen.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jan 2026 09:29:24 -0800 (PST)
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
X-Inumbo-ID: eb3e4084-e992-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767547766; x=1768152566; darn=lists.xen.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1u5fdZmMOkdhG7z6A4tRt3Cl7Fdt/qRjWRb6Ckni6s=;
        b=ncBNsJ/nMmHj9RHihGv5OecoqdpB1ICezFezZrr1wtYJAEyYryXpuOH+8PCG+FlzyF
         WdKpGZjoBSTqfLeiAr/oint3kivSIv1djcutBlC4oHiVg8NgQv+e3d53Z5wmoiTQm66t
         G5AcOChjiiZzyYFRqyqVKvCYO6/x3j2iWqTeaovXmGYMb5Ys1z8kEKkxz2HAwgb66/9k
         bibs/qZ2Gb+WO6AQssJD8PJ1brGIuQo7U/NyNUv3/RiGNmA+FyVvwQNdpZvSB3hddOgU
         OKoVHxuC4aKoUPJyOBSrZOtUwAN3Ha0TA58ADUJlwOqP3dgmoRacimE6fOOZGGbJu7jy
         wJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767547766; x=1768152566;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1u5fdZmMOkdhG7z6A4tRt3Cl7Fdt/qRjWRb6Ckni6s=;
        b=KYmWg9OgY4eeu8azUMQeWnqKpYVFiwH8iCDTNHaRoecLCzyeSf/8r/SHtgbTAGFSQG
         K9uFq8cjChVhOZPqe78zsY2eYDEh38mgGEeSbEbC4LUL8Rk23vsbMIQ3Sx3lXsDknRG7
         PJoJcdy037gCX6dKZJ/J3bFLTD4sRDewaMci6TgaeO2sWX1A+UXnzkJ7njdgRCl9ORWv
         xvBP2ZAd784xdoAfBWM7Ge5vpLgdEoHsZOaNWYOqf8wgezQR5vaH8d7d+CSssj5SUY7g
         9Q7n34tScxp9S202AlOas2hGofmyLDWFtiQ0g7RLpvrU1XWF9sXlOuOGa+LJ6hST3mUt
         Bh2Q==
X-Gm-Message-State: AOJu0Yzd07JHk9Mf+De4Fmi1u5EFjYG+KPM+mTw/kJ/KJh0oRAjh8b1C
	epOGUZfZjHxktDP+YWq3/wqvfAM1HB55y4eFc0KIhPUbuC3kGZQ6VxrH7Ig5DRKaGuE=
X-Gm-Gg: AY/fxX7+KBcRJKaOSVIUoPmWi8hO1BGtZcM8bhHEF/d2K5RQV/KCM2FfNFwXsdWThJa
	DMj0qXY+E7DO8URsvqr19RI10TFJrXHWqaLCrL1wToVo0xISkHSiz29ffxCsK1KyDOgJz7qVRlt
	rpWm1NNfITpuXPsaB3ULi29HRpxEWudpXS/zI1ybAQpzR8hDVQW+2XO44huxNwycz37c8fczPVZ
	Z9foxx3W5PkZoYZr5HPq71hGYgSdhUrEUPAfZOXWVhkSFVb1XOPB/U2aJVVmDXQsyU0fmQetlGT
	BuVeVWU+o16FBZubnEzl3rCFdRodPdeLV9Z3djLDNptmPMkLY9WcnAAsx6+6JyCurqCZ6mcjCJA
	6mu681knerxsw7kjbci7BZgBBGDoz55sV+k+i/Gq/Usa7+8eNAhvMkD7ZtspT4d9/SclFu4Z7bb
	W/Gq63fWDmt+t91O/Kze34ZZ1jB8gyp0vjmyPBo1OQg9qNOSsoPwRlZO8hc9A=
X-Google-Smtp-Source: AGHT+IFVRoqwOGEN8QOYprmFNMDA9/GZs2cS7OnM0rGqPrBoKd6LyKkJmd08CLTb/htPss0OhMtErw==
X-Received: by 2002:a2e:a816:0:b0:36d:4996:1c26 with SMTP id 38308e7fff4ca-3812158e095mr137682301fa.11.1767547765754;
        Sun, 04 Jan 2026 09:29:25 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------HQ8XlUAhr8DTv2IAMrzprYDH"
Message-ID: <3ef6bcd6-2936-46f8-a7d0-54cd965a6861@gmail.com>
Date: Sun, 4 Jan 2026 20:29:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ru
To: xen-devel@lists.xen.org
From: =?UTF-8?B?0JDQvdGC0L7QvSDQnNCw0YDQutC+0LI=?= <akmarkov45@gmail.com>
Subject: [BUG] Potential Integer Underflow in Time Calibration Logic and Live
 Snapshot Revert causing DWM crashes in Windows Guests

This is a multi-part message in MIME format.
--------------HQ8XlUAhr8DTv2IAMrzprYDH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Component: Xen Hypervisor (x86 / time.c)
Versions affected: Potential in 4.17-4.21 and unstable (tested on 4.18 
with high vCPU density)
Description:
In high-load scenarios (24+ cores, heavy Dom0 load, and frequent VM 
pauses via DRAKVUF/VMI), Windows guests experience Desktop Window 
Manager (DWM.exe) crashes with error 0x8898009b.
The root cause is an integer memory overflow in the time scaling logic, 
in case if the time calibration occurs simultaneously with a snapshot 
reversion or RDTSC(P) instruction emulation.
Technical Analysis:
The get_s_time_fixed function in (xen/arch/x86/time.c) accepts at_tsc as 
an argument. If it is less than local_tsc, a negative delta will be 
produced, which will be incorrectly handled in scale_delta (Or, if 
at_tsc is zero, a race condition may occur after receiving ticks via 
rdtsc_ordered, time calibration will occur, and local_tsc may become 
larger than the tick values). This will result in an extremely large 
number instead of a backward offset. This is guaranteed to be 
reproducible in hvm_load_cpu_ctxt (xen/arch/x86/hvm/hvm.c), as sync_tsc 
will be less than local_tsc after time calibration. This can also 
potentially occur during RDTSC(P) emulation simultaneously with 
time_calibration_rendezvous_tail (xen/arch/x86/time.c).
Windows DWM, sensitive to QueryPerformanceCounter jumps, fails 
catastrophically when it receives an essentially infinite timestamp delta.

Steps to Reproduce:

       Setup a host with a high core count (e.g., 24+ cores).

       Run a high density of Windows 10 DomUs (20 domains with 4 vcpus 
each).

       Apply heavy load on Dom0 (e.g., DRAKVUF monitoring).

       Frequently pause/resume or revert snapshots of the DomUs.

       Observe dwm.exe crashes in Guests with 
MILERR_QPC_TIME_WENT_BACKWARD (0x8898009b).

Currently, the lack of sign-awareness in the delta scaling path allows a 
nanosecond-scale race condition to turn into a multi-millennium time jump.

Environment:

       CPU: 24 cores (Intel Xeon with Invariant TSC)

       Dom0: High vCPU count (24)

       Feature: tsc_mode="always_emulate", 
*timer_mode="**no_delay_for_missed_ticks**"*

       Guest: Windows 10/11 with tsc as time source

--------------HQ8XlUAhr8DTv2IAMrzprYDH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Component: Xen Hypervisor (x86 / time.c)<br>
      Versions affected: Potential in 4.17-4.21 and unstable (tested on
      4.18 with high vCPU density)<br>
      Description:<br>
      In high-load scenarios (24+ cores, heavy Dom0 load, and frequent
      VM pauses via DRAKVUF/VMI), Windows guests experience Desktop
      Window Manager (DWM.exe) crashes with error 0x8898009b.<br>
      <span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span
            class="ryNqvb">The root cause is an integer memory overflow
            in the time scaling logic, in case if the time calibration
            occurs simultaneously with a snapshot reversion or RDTSC(P)
            instruction emulation</span></span></span>.<br>
      Technical Analysis:<br>
      The get_s_time_fixed function in (xen/arch/x86/time.c) accepts
      at_tsc as an argument. If it is less than local_tsc, a negative
      delta will be produced, which will be incorrectly handled in
      scale_delta (<span class="HwtZe" lang="en"><span
          class="jCAhz ChMk0b"><span class="ryNqvb">Or, if at_tsc is
            zero, a race condition may occur after receiving ticks via
            rdtsc_ordered, time calibration will occur, and local_tsc
            may become larger than the tick values</span></span></span>).
      This will result in an extremely large number instead of a
      backward offset. This is guaranteed to be reproducible in
      hvm_load_cpu_ctxt (xen/arch/x86/hvm/hvm.c), as sync_tsc will be
      less than local_tsc after time calibration. This can also
      potentially occur during RDTSC(P) emulation simultaneously with
      time_calibration_rendezvous_tail (xen/arch/x86/time.c).<br>
      Windows DWM, sensitive to QueryPerformanceCounter jumps, fails
      catastrophically when it receives an essentially infinite
      timestamp delta.</p>
    <p>Steps to Reproduce:<br>
      <br>
            Setup a host with a high core count (e.g., 24+ cores).<br>
              <br>
            Run a high density of Windows 10 DomUs (20 domains with 4
      vcpus each).<br>
              <br>
            Apply heavy load on Dom0 (e.g., DRAKVUF monitoring).<br>
              <br>
            Frequently pause/resume or revert snapshots of the DomUs.<br>
              <br>
            Observe dwm.exe crashes in Guests with
      MILERR_QPC_TIME_WENT_BACKWARD (0x8898009b).<br>
      <br>
      Currently, the lack of sign-awareness in the delta scaling path
      allows a nanosecond-scale race condition to turn into a
      multi-millennium time jump.</p>
    <p>Environment:<br>
      <br>
            CPU: 24 cores (Intel Xeon with Invariant TSC)<br>
      <br>
            Dom0: High vCPU count (24)<br>
              <br>
            Feature: tsc_mode="always_emulate", <b>timer_mode="</b><b>no_delay_for_missed_ticks</b><b>"</b><br>
              <br>
            Guest: Windows 10/11 with tsc as time source</p>
  </body>
</html>

--------------HQ8XlUAhr8DTv2IAMrzprYDH--

