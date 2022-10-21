Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012D76073E6
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 11:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427471.676560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloE9-00078M-BP; Fri, 21 Oct 2022 09:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427471.676560; Fri, 21 Oct 2022 09:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloE9-00074t-8O; Fri, 21 Oct 2022 09:22:05 +0000
Received: by outflank-mailman (input) for mailman id 427471;
 Fri, 21 Oct 2022 09:22:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sW6B=2W=gmail.com=salvatore.bonaccorso@srs-se1.protection.inumbo.net>)
 id 1oloE8-00074j-8w
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 09:22:04 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af2bedaf-5121-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 11:21:03 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id r14so3472357edc.7
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 02:22:03 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch.
 [82.192.242.114]) by smtp.gmail.com with ESMTPSA id
 nb36-20020a1709071ca400b00780f24b797dsm11445031ejc.108.2022.10.21.02.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 02:22:01 -0700 (PDT)
Received: by eldamar.lan (Postfix, from userid 1000)
 id 97626BE2DE0; Fri, 21 Oct 2022 11:22:00 +0200 (CEST)
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
X-Inumbo-ID: af2bedaf-5121-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WXeFO3tUDl+b4UBpDrafdYBgxDIIGsV6RGnq49HKvNI=;
        b=hGMYaCIQsODSXmUvaY7dBUd2U2fMUgPvXW4wWk5uDSx1XjF78IynDgvKXOhCLulFBl
         8hXFr2eXM1Zx4OJNqXEkXVYSIhHAizQoeTh/jpsyv8RR4l3NzW63pGBrf42ZXbULdxTu
         S2O5YjTt49V8LazCHhtJvkJ2zVYI45/rFtbvbosZCKi27vi/GX0txr2FgCVjp6FC8uyI
         49MAsnenU1EKvKMcWv8IWfGIpCmXyObx+JdGzZ/7r8V8ZcTknvDVkzPpdCtH/VyqnZHU
         brE0r+V8+EcugxdCWjm5DOpRW45lXk9obU7MuHjbnGPc2BbpjVtF+Dpd3x+t23gdR/KN
         8PmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXeFO3tUDl+b4UBpDrafdYBgxDIIGsV6RGnq49HKvNI=;
        b=VTrVZMPwKHUEmNFn482oLYu7Qy3RcvG24YQ94mTe0J3C8epROmY4MQHtb2aqOj+SNB
         /ZV4ZWq9aXpoJHizmbyzbB+pUV80iYCSj4uf3hPmKsu5uVAD78Asy8jj1QW3xIYbBQDC
         eEqpr9Kv7/4umB53JURtYGrIgx5Yco0Q6WSmBCbzTk5D+tSi5a3aRx2yNT8jt4+3vZ7H
         YtPTPO8MIhv+qmUTBkXiSp6u+n1ydq+WEiRX6eBPFsfYmh5IQHIkj1FlYcQPfPs2HoAb
         SGPG4HrQ26xPhA9KiQk/DiSgdB5yx+T+cxXC0A0XHNOEpO/TD9eWIz0WTUe51L0ShPbO
         QpXQ==
X-Gm-Message-State: ACrzQf3avrkWqhhuY6yba5MjfdtEpraBgPDw3IQjNG/WL7VoiTws1bev
	iCWV990hUb+E3yzFUbIzlvw=
X-Google-Smtp-Source: AMsMyM6kVJkpq4aVxDJwEu5TH4lJhVBGtKdR/DRP6PPqVKrAR+U8WqfRUdPGImQBGmUZTH1RlEwYeg==
X-Received: by 2002:a05:6402:f18:b0:460:cf08:2b41 with SMTP id i24-20020a0564020f1800b00460cf082b41mr6034825eda.400.1666344122646;
        Fri, 21 Oct 2022 02:22:02 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date: Fri, 21 Oct 2022 11:22:00 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: "James E.J. Bottomley" <jejb@linux.ibm.com>,
	sathya.prakash@broadcom.com, sreekanth.reddy@broadcom.com,
	suganath-prabu.subramani@broadcom.com,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	MPT-FusionLinux.pdl@broadcom.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, adi@kriegisch.at
Subject: Report in downstream Debian: mpt3sas broken with xen dom0 with
 update to 5.10.149 in 5.10.y.
Message-ID: <Y1JkuKTjVYrOWbvm@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

We got the following report in Debian after an update from 5.10.140 to
the current 5.10.149. Full quoting below (from
https://bugs.debian.org/1022126). Does this ring some bell about known
regressions?
On Thu, Oct 20, 2022 at 05:21:03PM +0200, Adi Kriegisch wrote:
> Package: linux-image-5.10.0-19-amd64
> Version: 5.10.149-1
> Severity: important
> 
> Dear maintainers,
> 
> with the upgrade to the latest bullseye kernel (5.10.149-1), our xen setup
> is unbootable due to swiotlb buffer errors:
>   | sd 0:0:0:0: scsi_dma_map failed: request for 401408 bytes!
> and
>   | mpt3sas 0000:01:00.0: swiotlb buffer is full (sz: 401408 bytes),
>   |     total 32768 (slots), used 0 (slots)
> (the byte sizes vary between boots).
> 
> After reading bug #850425[1], we also tried to force 32bit mode in the
> mpt3sas driver by specifying a dom0 memory below 4G; this lets the machine
> boot, but almost immediately after that fails with the same error. Notable
> difference is that the used slots are 128.
> 
> Xen commandline:
>   dom0_mem=4096M,max:4096M dom0_max_vcpus=4 dom0_vcpus_pin
>   ucode=scan xpti=dom0=false,domu=true gnttab_max_frames=128
> 
> Using dom0-iommu=map-inclusive in some combinations with swiotlb on the
> kernel commandline gives us some used slots (way below 128) in the error
> message even in 64bit dma mode in the mpt3sas driver.
> 
> The kernel works when booted without xen. We'd be more than happy to get
> pointers on how to fix that issue or patches to test!
> 
> Thanks for your help!
> 
> -- Adi
> 
> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=850425

Regards,
Salvatore

