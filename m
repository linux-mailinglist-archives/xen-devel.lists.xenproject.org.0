Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4070A336E69
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 10:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96398.182310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKHCe-00037r-Ql; Thu, 11 Mar 2021 09:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96398.182310; Thu, 11 Mar 2021 09:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKHCe-00037S-NS; Thu, 11 Mar 2021 09:01:56 +0000
Received: by outflank-mailman (input) for mailman id 96398;
 Thu, 11 Mar 2021 09:01:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QHYH=IJ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lKHCd-00037N-5L
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 09:01:55 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b11a59e5-cf2f-489a-85d2-4d5b8dc3561c;
 Thu, 11 Mar 2021 09:01:53 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id y16so933684wrw.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Mar 2021 01:01:53 -0800 (PST)
Received: from ?IPv6:2a00:23c5:5785:9a01:ad53:27c8:8931:32bf?
 ([2a00:23c5:5785:9a01:ad53:27c8:8931:32bf])
 by smtp.gmail.com with ESMTPSA id 3sm3096719wry.72.2021.03.11.01.01.52
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 01:01:52 -0800 (PST)
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
X-Inumbo-ID: b11a59e5-cf2f-489a-85d2-4d5b8dc3561c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Orp3Bk0hKm0aeaWNTiYcbHxTKdI6bsXJmidsqgGPQnA=;
        b=raRGHMmL6dL9HjiNq7tGPH9/33AcwIgRcpDSF3vITUz7CyNkKn+z7bar4MywLXRoDb
         hYXCN/33PVEg9Cjt7pJrK4WeeOLN+PZeCuokCj0CjSmCmMtdDRWbx5PpRswvHgZghX2d
         aMyt209Swi/FvNb1ykOAhQMNrc7Ct6eCBzOptFtGcplNtIJ7tiMaef/vmmOU7qBKBoGg
         H9+v2BfgRxK/pLRzeSCnvPksSHZpUutv6x1LDurS+fujDfIKK33pyzxQmrRczcAuuKSv
         gSt7Qj85JqsrZYDfS5Xuph4v9ppk882ZZrbaKVvJ4DKaYZO06NMCETsSe+fT31SkRSUE
         FCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Orp3Bk0hKm0aeaWNTiYcbHxTKdI6bsXJmidsqgGPQnA=;
        b=RTxwxFW15JDp/hdENB2hz6WTzeHBlK4drUmaqBlb8Zzrqah7w0okg0zBTMop14dwQ6
         +3WNUXHuVu4VbjNRKkkBIlBsWVLVRXHdWv5Sb3uJVOo7+KZrkTLjxC2byou3G38P2ayL
         fHzDGNlXPYtLcQpVGLiPDKu6gj8XZ/ClzIh8RXImnEl7Gzx5olPTPwrOH0Zp4R/u5jBZ
         qi1tiHN5F+gedHf/0em6H4KbdQfYX4P5h08j0836QvGIl3ZJ0RKO7yImV30EMyGK+gf6
         m5pxtN5ghmLHwthmsGkWTXm+Er120AiGIv3y34lxm/IH49C3v9zlTontqCWLNA9KcSLf
         echw==
X-Gm-Message-State: AOAM531NNqNpRlC0xABCraTelUuDYb2b/udS3pJdSu2B/liPd8Df6BpF
	pBmcR+hHF48afxfCbBNBUiquE82EcAM=
X-Google-Smtp-Source: ABdhPJxLPEWEsOD3Re+nDuE/Wy0VJNVA27JxAAYvZybqzNbq+HzX7eLpwcdRJz+z1OqZkGHK3SFwyw==
X-Received: by 2002:a5d:4e83:: with SMTP id e3mr7650591wru.82.1615453312782;
        Thu, 11 Mar 2021 01:01:52 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: xen-blkfront: BUG_ON(info->nr_rings)
To: xen-devel@lists.xenproject.org
References: <CAKf6xpuRADfXfC2JA_D==-k+RTHF90h3+um1uiBf9-QXGFk+zA@mail.gmail.com>
Message-ID: <e2020ca3-4dfb-793e-f37b-d33b77cfae88@xen.org>
Date: Thu, 11 Mar 2021 09:01:51 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpuRADfXfC2JA_D==-k+RTHF90h3+um1uiBf9-QXGFk+zA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/03/2021 14:58, Jason Andryuk wrote:
> Hi,
> 
> I was running a loop of `xl block-attach ; xl block-detach` and I
> triggered a BUG in xen-blkfront, drivers/block/xen-blkfront.c:1917
> This is BUG_ON(info->nr_rings) in negotiate_mq called by blkback_changed.
> 
> I'm using Linux 5.4.103 and blktap3 on Xen 4.12 (OpenXT), though I
> don't think that matters.  The backtrace and some preceding logs (from
> the reproducer) are below.
> 
> I just repro-ed with this:
> path=<backend path/state>
> xenstore-write $path 5 ; xenstore-write $path 4
> 
> info->nr_rings is still set because of the unexpected transition
> XenbusStateClosing -> XenbusStateConnected:
> dom7: [ 2866.574853] vbd vbd-51728: blkfront:blkback_changed to state 5.
> dom7: [ 2866.578385] vbd vbd-51728: blkfront:blkback_changed to state 4.
> 
> I'm not totally sure how to handle this.  The XenbusStateConnected
> event should be creating a new blkfront device, but instead it's seen
> by the old one which hasn't been cleaned up yet.
> 

Sounds like blkfront needs to be fixed. Once it is in state 5 the only 
state it should go to should be 6. From there it can cycle back to 4.

   Paul


> After this BUG, the xenwatch thread is gone.  The VM is still running,
> but watches aren't triggering anymore.
> 
> Regards,
> Jason
> 
> dom7: [ 2866.494691] vbd vbd-51728: blkfront:blkback_changed to state 1.
> tapback[27208]: backend.c:276 51728 physical_device_changed
> tapback[27208]: backend.c:362 51728 found tapdisk[17223], for 254:9
> tapdisk[17223]: VBD 9 got disk info: sectors=147456 sector size=512, info=0
> xl: [18012] libxl_disk.c:303:device_disk_add:Domain 7:device already
> exists in xenstore
> xl: [18012] libxl_device.c:1468:device_addrm_aocomplete:unable to add device
> dom7: [ 2866.507702] vbd vbd-51728: blkfront:blkback_changed to state 2.
> xl: [18022] libxl_disk.c:303:device_disk_add:Domain 7:device already
> exists in xenstore
> xl: [18026] libxl_disk.c:303:device_disk_add:Domain 7:device already
> exists in xenstore
> xl: [18024] libxl_disk.c:303:device_disk_add:Domain 7:device already
> exists in xenstore
> xl: [18022] libxl_device.c:1468:device_addrm_aocomplete:unable to add device
> xl: [18018] libxl_disk.c:303:device_disk_add:Domain 7:device already
> exists in xenstore
> xl: [18026] libxl_device.c:1468:device_addrm_aocomplete:unable to add device
> xl: [18024] libxl_device.c:1468:device_addrm_aocomplete:unable to add device
> xl: [18018] libxl_device.c:1468:device_addrm_aocomplete:unable to add device
> xl: [18038] libxl_disk.c:303:device_disk_add:Domain 7:device already
> exists in xenstore
> xl: [18034] libxl_disk.c:303:device_disk_add:Domain 7:device already
> exists in xenstore
> xl: [18038] libxl_device.c:1468:device_addrm_aocomplete:unable to add device
> xl: [18034] libxl_device.c:1468:device_addrm_aocomplete:unable to add device
> xl: [18030] libxl_disk.c:303:device_disk_add:Domain 7:device already
> exists in xenstore
> xl: [18030] libxl_device.c:1468:device_addrm_aocomplete:unable to add device
> tapback[27208]: frontend.c:216 51728 front-end supports persistent
> grants but we don't
> tapdisk[17223]: connecting VBD 9 domid=7, devid=51728, pool (null),
> evt 12, poll duration 0, poll idle threshold 0
> tapdisk[17223]: ring 0x74ce10 connected
> dom7: [ 2866.536144] vbd vbd-51728: blkfront:blkback_changed to state 5.
> xl: [18020] libxl_disk.c:303:device_disk_add:Domain 7:device already
> exists in xenstore
> xl: [18016] libxl_disk.c:303:device_disk_add:Domain 7:device already
> exists in xenstore
> xl: [18020] libxl_device.c:1468:device_addrm_aocomplete:unable to add device
> xl: [18016] libxl_device.c:1468:device_addrm_aocomplete:unable to add device
> xl: [18036] libxl_disk.c:303:device_disk_add:Domain 7:device already
> exists in xenstore
> dom7: [ 2866.544439] vbd vbd-51728: blkfront:blkback_changed to state 5.
> xl: [18036] libxl_device.c:1468:device_addrm_aocomplete:unable to add device
> dom7: [ 2866.555778] vbd vbd-51728: blkfront:blkback_changed to state 5.
> dom7: [ 2866.565810] vbd vbd-51728: blkfront:blkback_changed to state 5.
> dom7: [ 2866.574853] vbd vbd-51728: blkfront:blkback_changed to state 5.
> dom7: [ 2866.578385] vbd vbd-51728: blkfront:blkback_changed to state 4.
> dom7: [ 2866.578655] ------------[ cut here ]------------
> dom7: [ 2866.578662] kernel BUG at .../drivers/block/xen-blkfront.c:1917!
> dom7: [ 2866.578681] invalid opcode: 0000 [#1] SMP PTI
> dom7: [ 2866.578688] CPU: 0 PID: 76 Comm: xenwatch Tainted: G  O      5.4.103 #1
> dom7: [ 2866.578699] RIP: 0010:talk_to_blkback+0x7b7/0xdb0
> dom7: [ 2866.578706] Code: ff ff fa ff e9 5d fb ff ff 49 8b 56 08 48
> 8b b3 08 01 00 00 8b 7c 24 1c e8 96 bb ff ff 85 c0 0f 84 60 ff ff ff
> e9 4b ff ff ff <0f> 0b 48 c7 c2 0c e7 c0 81 be f4 ff ff ff 4c 89 f7 e8
> c3 ff fa ff
> dom7: [ 2866.578727] RSP: 0018:ffffc900004e3d80 EFLAGS: 00010202
> dom7: [ 2866.578734] RAX: 0000000000000001 RBX: ffff88801df68200 RCX:
> 0000000000000000
> dom7: [ 2866.578743] RDX: 000000000000004a RSI: ffff88801d20ab80 RDI:
> 0000000000000000
> dom7: [ 2866.578752] RBP: ffff88801e31a800 R08: 00000000000003c6 R09:
> 0000000000000800
> dom7: [ 2866.578761] R10: ffffc900004d3db0 R11: 00000000000002da R12:
> ffffffff81ea4410
> dom7: [ 2866.578770] R13: dead000000000122 R14: ffff88801e31a800 R15:
> ffff88801df68200
> dom7: [ 2866.578779] FS:  0000000000000000(0000)
> GS:ffff88801f200000(0000) knlGS:0000000000000000
> dom7: [ 2866.578789] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> dom7: [ 2866.578797] CR2: 00007f34ade5a0d4 CR3: 000000001d0bc003 CR4:
> 00000000003606b0
> dom7: [ 2866.578807] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> dom7: [ 2866.578815] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> dom7: [ 2866.578825] Call Trace:
> dom7: [ 2866.578830]  blkback_changed+0x14a/0xc50
> dom7: [ 2866.578836]  ? find_watch+0x40/0x40
> dom7: [ 2866.578841]  ? xenbus_read_driver_state+0x34/0x60
> dom7: [ 2866.578848]  ? find_watch+0x40/0x40
> dom7: [ 2866.578853]  xenwatch_thread+0x97/0x160
> dom7: [ 2866.578859]  ? wait_woken+0x80/0x80
> dom7: [ 2866.578866]  kthread+0xf3/0x130
> dom7: [ 2866.578871]  ? kthread_create_worker_on_cpu+0x70/0x70
> dom7: [ 2866.578879]  ret_from_fork+0x35/0x40
> dom7: [ 2866.578884] Modules linked in: xen_argo(O)
> dom7: [ 2866.578890] ---[ end trace 06163b0483faf9c0 ]---
> dom7: [ 2866.578898] RIP: 0010:talk_to_blkback+0x7b7/0xdb0
> dom7: [ 2866.586251] Code: ff ff fa ff e9 5d fb ff ff 49 8b 56 08 48
> 8b b3 08 01 00 00 8b 7c 24 1c e8 96 bb ff ff 85 c0 0f 84 60 ff ff ff
> e9 4b ff ff ff <0f> 0b 48 c7 c2 0c e7 c0 81 be f4 ff ff ff 4c 89 f7 e8
> c3 ff fa ff
> dom7: [ 2866.586276] RSP: 0018:ffffc900004e3d80 EFLAGS: 00010202
> dom7: [ 2866.586288] RAX: 0000000000000001 RBX: ffff88801df68200 RCX:
> 0000000000000000
> dom7: [ 2866.586301] RDX: 000000000000004a RSI: ffff88801d20ab80 RDI:
> 0000000000000000
> dom7: [ 2866.586315] RBP: ffff88801e31a800 R08: 00000000000003c6 R09:
> 0000000000000800
> dom7: [ 2866.586325] R10: ffffc900004d3db0 R11: 00000000000002da R12:
> ffffffff81ea4410
> dom7: [ 2866.586339] R13: dead000000000122 R14: ffff88801e31a800 R15:
> ffff88801df68200
> dom7: [ 2866.586354] FS:  0000000000000000(0000)
> GS:ffff88801f200000(0000) knlGS:0000000000000000
> dom7: [ 2866.586368] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> dom7: [ 2866.586376] CR2: 00007f34ade5a0d4 CR3: 000000001d0bc003 CR4:
> 00000000003606b0
> dom7: [ 2866.586390] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> dom7: [ 2866.586404] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> tapdisk[17223]: disconnecting domid=7, devid=51728
> 


