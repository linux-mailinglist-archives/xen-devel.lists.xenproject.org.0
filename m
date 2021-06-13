Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7A23A56DC
	for <lists+xen-devel@lfdr.de>; Sun, 13 Jun 2021 09:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140968.260518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsKiq-0008TD-UK; Sun, 13 Jun 2021 07:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140968.260518; Sun, 13 Jun 2021 07:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsKiq-0008R7-Qx; Sun, 13 Jun 2021 07:39:56 +0000
Received: by outflank-mailman (input) for mailman id 140968;
 Sun, 13 Jun 2021 06:29:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ejil=LH=gmail.com=salvatore.bonaccorso@srs-us1.protection.inumbo.net>)
 id 1lsJd7-0002VB-QW
 for xen-devel@lists.xenproject.org; Sun, 13 Jun 2021 06:29:57 +0000
Received: from mail-ej1-x629.google.com (unknown [2a00:1450:4864:20::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab54bf0b-ff02-435f-871e-54a6d4bc37bf;
 Sun, 13 Jun 2021 06:29:56 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id my49so10991383ejc.7
 for <xen-devel@lists.xenproject.org>; Sat, 12 Jun 2021 23:29:56 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
 by smtp.gmail.com with ESMTPSA id bh2sm4076028ejb.80.2021.06.12.23.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 23:29:54 -0700 (PDT)
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
X-Inumbo-ID: ab54bf0b-ff02-435f-871e-54a6d4bc37bf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nownNaLyh+w2Hh2hW4XMdkpyjXZowhZ5hjX6G051lLE=;
        b=lwzDq4P822FD7x7i1tDBpyVYCy/giWAHWZxhe3KDt4Og2Ld+UYFPvzQJYbufImNACE
         MbeMajFChJylYVz2YzhzmJmMZsH5yMaNgMYmNVLfDBsNtKkRtzGaKNp1kU4hqNETa6LK
         mice6EaId4gnYzYXacc5bAec3HAT03HlN39y0nQw4YxL5/wBc4t/OeKZft/m9BK7d4At
         8TRpiRrAUWyFoMYP83wNu19oga0SgH6TzsC0k0cFD0fFbbsZpbZb9gRAUYo+JQNj1W4R
         zd9vPqZ3/POWxNWhTSJr5vQnXr12VTGp3B06uaGX+t+mYUHgZP3IRXNGr+poq8D6bTtS
         UU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=nownNaLyh+w2Hh2hW4XMdkpyjXZowhZ5hjX6G051lLE=;
        b=CQERRXxCG7R6Dk+9/qbQ39NSwowIVL9ZXA5sYU3g53/2BAqwxt7tb6Ls5RMi2XME17
         sJXXjE2I6xmQ0pac7zO6C2P7hL0QDZGWz55jQPXim7g4liW0/o1FM3R85hwFuNPHv4g9
         jtYq9vzW+xL0gE9zhsEmpu0FejGo2Naa0HYkryhDl3J6Y6k7Jcqk4eqbE4wn7ZpY5lZZ
         gyIYCnOg5xEUJ5lKSNv1uv2qE+br6tilVZ9pJL5T4zatPwBnqz2czh9DqDCNWqAGByp+
         QzqUm8Bf2pZYBkk8MvJOvxlprEdjBFecr9Y2x8lP8EwdF6ypobmASpCpt8g2F6mQ4FE8
         uESQ==
X-Gm-Message-State: AOAM531+UdCgxeD1Nocrzi5lWBoaFU16NIepjEkOv8CXJQ7oZsB6PkQU
	VmmT/KR1cb5yXOh0F31mYPI=
X-Google-Smtp-Source: ABdhPJyCZLvVBZwnmjVV9bW3wGTKBQLXrnDE4vdwzq3ihX/PNWK29zGPP6lAzW4+QKO3OLlfuXpc4Q==
X-Received: by 2002:a17:906:4e91:: with SMTP id v17mr10641608eju.119.1623565795327;
        Sat, 12 Jun 2021 23:29:55 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date: Sun, 13 Jun 2021 08:29:53 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: =?utf-8?B?5bCP5aSq?= <nospam@kota.moe>,
	Jianxiong Gao <jxgao@google.com>, Christoph Hellwig <hch@lst.de>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, xen-devel@lists.xenproject.org
Cc: 989778-maintonly@bugs.debian.org
Subject: Regression in at least 5.10.y and mainline: Firewire audio interface
 fails to work properly (when booted under Xen)
Message-ID: <YMWl4UnFBAVRDnys@eldamar.lan>
References: <162352833546.2353.230557992597997974.reportbug@home.kota.moe>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <162352833546.2353.230557992597997974.reportbug@home.kota.moe>

Hi,

On Sun, Jun 13, 2021 at 06:05:37AM +1000, 小太 wrote:
> Package: src:linux
> Version: 5.10.40-1
> Severity: normal
> Tags: upstream
> X-Debbugs-Cc: nospam@kota.moe
> 
> After updating from linux-image-5.10.0-6-amd64, jackd now fails to sync to my
> DICE-compatible firewire audio interface (Profire 610), with the following
> error messages (full log attached):
> 
> > $ jackd -d firewire -v
> > jackdmp 1.9.12
> > ...snip...
> > 00301056761: Warning (StreamProcessorManager.cpp)[ 913] alignReceivedStreams:
> xrun while aligning streams...
> > 00301056793: Error (StreamProcessorManager.cpp)[ 877] syncStartAll: Could not
> align streams...
> > 00301056829: Fatal (StreamProcessorManager.cpp)[1025] start: Could not
> syncStartAll...
> > 00301400626: Warning (TimestampedBuffer.cpp)[ 248] calculateRate: (0x1fa5a20)
> rate ( 708.18713) more that 10% off nominal (rate= 512.00000, diff=
> 5665.497, update_period=8)
> > 00301416642: Warning (TimestampedBuffer.cpp)[ 248] calculateRate: (0x1fa5a20)
> rate ( 686.49011) more that 10% off nominal (rate= 512.00000, diff=
> 5491.921, update_period=8)
> > 00301416925: Warning (devicemanager.cpp)[ 925] startStreaming: Failed to
> start SPM!
> > firewire ERR: Could not start streaming threads
> > Cannot start driver
> > JackServer::Start() failed with -1
> > 00301424329: Warning (ieee1394service.cpp)[1509] freeIsoChannel:  Channel 1
> not registered
> > 00301424360: Error (dice_avdevice.cpp)[1440] startstopStreamByIndex: Could
> not deallocate iso channel for SP 1 (ARX 0)
> > 00301424397: Warning (devicemanager.cpp)[ 959] stopStreamingOnDevice: Could
> not stop stream 1 of device 0x1f6e600
> > 00301424406: Warning (devicemanager.cpp)[ 931] startStreaming: Could not stop
> streaming on device 0x1f6e600!
> > 00301424429: Fatal (ffado.cpp)[ 220] ffado_streaming_start: Could not start
> the streaming system
> > Failed to start server
> > no message buffer overruns
> 
> Additionally, I also tried using the snd-dice driver to expose the audio
> interface directly in ALSA. While the interface did appear and was usable
> there, all inputs came out of my speakers highly distorted, with channels
> bleeding into each other - practically unusable.
> 
> I've reproduced the issue on upstream kernel version v5.13-rc5+
> (ad347abe4a9876b1f65f408ab467137e88f77eb4), and bisected the first bad commit
> down to 85a5a6875ca93dc4efbf20df942ba41d27a917e3.
> 
> To double check commit 85a5a6875ca93dc4efbf20df942ba41d27a917e3 was indeed the
> issue, I built the latest v5.10 kernel v5.10.43 with the commit reverted, and
> indeed the issue went away.
> Unfortunately, the reverse patch would not apply to v5.13-rc5+, since it seems
> like the file has changed too much.

A user in Debian reported the above issue, which was reproducible with
5.13-rc5 and 5.10.y as packaged in Debian and found that 85a5a6875ca9
("swiotlb: don't modify orig_addr in swiotlb_tbl_sync_single") that
introduced the issue.

The full bug log is at https://bugs.debian.org/989778

I'm CC'ing as well the xen-devel list, as it appears from
https://bugs.debian.org/989778#10 that the issue is only exposed when booting
under Xen.

Any ideas?

Regards,
Salvatore

