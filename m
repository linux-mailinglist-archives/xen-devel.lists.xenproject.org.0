Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A9A3C460
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 17:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893202.1302128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkmYZ-0000Qo-R3; Wed, 19 Feb 2025 16:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893202.1302128; Wed, 19 Feb 2025 16:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkmYZ-0000PD-OG; Wed, 19 Feb 2025 16:04:15 +0000
Received: by outflank-mailman (input) for mailman id 893202;
 Wed, 19 Feb 2025 16:04:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lO3z=VK=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tkmYY-0000P5-7T
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 16:04:14 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 286fa51a-eedb-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 17:04:12 +0100 (CET)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7272b51f677so466913a34.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 08:04:12 -0800 (PST)
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
X-Inumbo-ID: 286fa51a-eedb-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739981051; x=1740585851; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bX6ritMg7VRYgTTo94icnnIE91Dt4orR5Woa6wJaNEk=;
        b=Qs556PeEwWIilzOEvmJ1dD95vzhAFMEGiUs+w1J2AWMBj/CVvo5znNN3JiVWGiTIn2
         8ogVlsXCOmJxtozDnhQu09pVJsVLzDq+7dt38lyjC1iGD1DG6YhWwVUO4ESo1B0DxpxT
         Rl0BJ/6wyZk/tmKvc3KlkybpEIjz0OfnXguNVvj40mbGCXsYFKTchIY9N8TOlcvAXdFD
         DAV8B9aEQww3JCnpx3K59nqD3lOdh8zlybDvlo0DD24WsaEVuL4ZitNjBLGqGwwymmnZ
         wAFUB/9VyONzoaBwx8kYtF1O/705jxDJpGkO1DcE53IlobYjHpF2JDO7iKZeo+zWqWV3
         1MRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981051; x=1740585851;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bX6ritMg7VRYgTTo94icnnIE91Dt4orR5Woa6wJaNEk=;
        b=Wg6KTaJNOXznHALG1jkrjKJZ8D5/Drib5YQtP5vtnkWUnRj92R7VB0jZkxPvsdHdzn
         wAgKns+j4cRwnd6LSruyMh5HyMo7F6CCXZmVG7rX2UOXz7SjEdsRai9aFx0NtAeegwUQ
         4uTDTakPUEebNErRsPghni9uxijHBWFbsOWNtUN+9bCCquWO01cvjxm/GFUA9X7NT/kM
         QyLTVsWXLOKOXDIIqA3xX/VABblcK+vm/Pqz72IM/p9zRqm3THnd6d6UbVvkfVRDRPJQ
         GclHLFIFUU9GMVsbEWUoNWlZzyLuM4tM9oaesD2+PfypOe294Zbi8J9CYT9nDVmzmRKQ
         WkJA==
X-Gm-Message-State: AOJu0YwkQcP9c6zL33ejh21+6FDa9nBZANbMIaX2zVHnLoQsYljJBZOs
	PNDQ/PInDb/20LKuNWW/rfEzOXHMXjoZbhF9y7SoFIpTQ3ZqoELHDjXd2EyFup8/95RFc+UfXuz
	3iVPOue6tf2LOk6CnZFX53GbXUS+rkStW
X-Gm-Gg: ASbGncs1dj8BEqHOLPIrQ7xFRWVH1cdGUJmjp2K3YffjOs+M3lrPOtIb2pxP2WEGGH6
	4qHD884ibl32TbkF7e/VDbFgIweT/H6NM9FMr7P4GEi7SWJsjaGQ8Cc2hERAJcXHvg9ngufpk/D
	hlVmOmdTZHVEYzDZBNv92m7EfpEqI4HKs=
X-Google-Smtp-Source: AGHT+IFzvCkdB/nqEijBZorKjdhfMH4RLM0idHbQdz8kW/TbmB7Nc2zktEAo9tzgyUA7wfafjhOyLS7UU092IdVyUsg=
X-Received: by 2002:a05:6870:c69a:b0:295:f266:8aee with SMTP id
 586e51a60fabf-2bc99a7c0acmr4325005fac.5.1739981050729; Wed, 19 Feb 2025
 08:04:10 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 19 Feb 2025 17:04:00 +0100
X-Gm-Features: AWEUYZlUAIUgZtlc7GHpjRJ_D8vBPgPJdEpogiVLUD7aE3ft-BLdIrACmpBw6s0
Message-ID: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
Subject: xl create/save throwing errors
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

I have a script that's supposed to start a couple of (Windows 10) VMs
in parallel, wait until they boot and connect to the network, and then
create a live snapshot.

VMs are created by simple "xl create vm.cfg" and the live snapshot is
created by "xl save win10-18362-NNN path/to/state".

I have noticed, that "xl create" occasionally throws this line:
```
libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: qemu
command-line probe already exited
```

First I thought it's related to the fact that multiple "xl create"
commands are being run in parallel, but to my surprise, this line
sometimes occurs even for standalone "xl create" commands.

However, when "xl save" is being executed in parallel, I'm very often
met with output similar to this:
```
Saving to win10-18362-102/state new xl format (info 0x3/0x0/1780)
xc: info: Saving domain 193, type x86 HVM
Saving to win10-18362-101/state new xl format (info 0x3/0x0/1780)
xc: info: Saving domain 192, type x86 HVM
Saving to win10-18362-104/state new xl format (info 0x3/0x0/1780)
xc: info: Saving domain 194, type x86 HVM
xc: error: save callback suspend() failed: 0: Internal error
xc: error: Save failed (0 = Success): Internal error
libxl: error: libxl_stream_write.c:347:libxl__xc_domain_save_done:
Domain 192:saving domain: domain responded to suspend request: Success
Failed to save domain, resuming domain
xc: error: save callback suspend() failed: 0: Internal error
xc: error: Save failed (0 = Success): Internal error
xc: error: Dom 192 not suspended: (shutdown 4, reason 3): Internal error
libxl: error: libxl_dom_suspend.c:661:domain_resume_done: Domain
192:xc_domain_resume failed: Invalid argument
libxl: error: libxl_stream_write.c:347:libxl__xc_domain_save_done:
Domain 194:saving domain: domain responded to suspend request: Success
Failed to save domain, resuming domain
xc: error: Dom 194 not suspended: (shutdown 4, reason 3): Internal error
libxl: error: libxl_dom_suspend.c:661:domain_resume_done: Domain
194:xc_domain_resume failed: Invalid argument
xc: Frames: 1044480/1044480  100%: Frames: 52224/1044480    5%
```

Here's an output of snapshotting 4 live VMs in parallel, where 3 of
the commands failed, and left the VMs in a running state.

Note that each "xl create"/"xl save" is executed for a separate VM.

For several months, I have executed standalone "xl save" commands with
VMs of the same settings without any problems.

Note that my VMs use qcow2 images as their disks - not ZFS or LVM:
```
disk = [ 'tap:qcow2:/win10-18362-101/clone/image.qcow2,xvda,w' ]
```

where win10-18362-101/clone/image.qcow2 is created as:
```
qemu-img create -f qcow2 -F qcow2 -b
"/win10-18362-101/base/image.qcow2"
"/win10-18362-101/clone/image.qcow2"
```

Is running "xl save" in parallel not supported? Or is it an issue with
qcow2 handling?

Best,
Petr

