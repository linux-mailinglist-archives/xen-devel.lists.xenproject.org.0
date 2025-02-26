Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D0DA453F6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 04:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896130.1304798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn819-0001xp-BY; Wed, 26 Feb 2025 03:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896130.1304798; Wed, 26 Feb 2025 03:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn819-0001vd-8E; Wed, 26 Feb 2025 03:23:27 +0000
Received: by outflank-mailman (input) for mailman id 896130;
 Wed, 26 Feb 2025 03:23:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+Z1=VR=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tn817-0001vX-EC
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 03:23:25 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0872d5a6-f3f1-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 04:23:23 +0100 (CET)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-7273be6e79eso871884a34.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 19:23:23 -0800 (PST)
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
X-Inumbo-ID: 0872d5a6-f3f1-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740540202; x=1741145002; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmr6BPgvBz2V7IpWUTx6DVfi4dzAy2rfQ9zMC1eoDak=;
        b=GcBjFOKOu4uWf/+85/O3NXEc4FP+/8fWjXNATJ1m8BX3qhreIKatXGas46uL5w0jwh
         I+1tGLESh0i2/ivNjbGb82oOgkVRAowR58Vst/zDKL8tldl6GBd6BzHKFJ3UTkARdrv8
         4gV+TkzpobXGmrgcvGR5GDGcgOkEUifBQ4EmqK4ceg41xIWzVu9WB+/fSU3jWSljyLtv
         zXARZw3BChg4NE5rRGJcWd8fYaV+SI+GyVXoZrpCuYljrteInjlMiP+bKtD/JQPeJKP6
         mHUGHRhRWy8utjDM2PXRYY72APs7Kqy7dbn9zASHWg4ljChQwdacmkK1aC28aN1ikc3l
         IuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740540202; x=1741145002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wmr6BPgvBz2V7IpWUTx6DVfi4dzAy2rfQ9zMC1eoDak=;
        b=DLU7ja415B0LBJ+Uhd7RE9wDvfu5i0geIn2umBbwI4AhQErxaibqsoMI+NK7pqJgAu
         vCX090w5B4JQsnqoavG6I9d4zE3Mx4VVUG3qREuQBcjLSxe2KpKdjXacwpQWU1P+LVY6
         QtbPIOfmCsRM0RYyXzpxr8DqUGDB3N6VBhvmLsx8Li9kXzjnv7Hf+a+pA4CF0Wdx9Dhh
         0aUPczsVmzguBOmf8zFlOl5ZViqdgBV6j2mStPNDMY/e5TC2fLbKbg37ivGLooWi0Dg1
         gRJAurT226glqy9ZVXjRJwua1itNMzkx1k0vnpaIVLWgHZfnY5fzxn4+5svVNIqgyHLP
         HSIA==
X-Forwarded-Encrypted: i=1; AJvYcCVU7NNhy8QWEYe/SCY0MWRd0ijxFp2HmIt4VI9OLAcqT3lPPSk22zCzHIJazXJpX6gm8ng6ivuaR3w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZKCIoNi6CwMuhdUcDMwnu8IHa7YEyt03miQp9mu1tDmVJTdzi
	rnwKYLOJMxV/Y5vZX+wGQaaZqifdJ8d/UFsUlyD0J16eeCtTpuGr2PU419PQYHVmyGo7gBlC5hL
	4tMTaODiZc1swqKFe6i8YjrqDdVI=
X-Gm-Gg: ASbGncsBYxbBT9NjZCksA3XFwM7A3Df43PE6eTcpfNH1SjzrJcAOJgcN9Mja4Gr8sp/
	NshJMBFze7ZCCw6tfP1N7QOJ7xAYC+HHrgpnWsOsraCkSYioHp3YHMSWsLpgE3mpnBNZ9bnO3eJ
	ruEYTYr9SBxnDCuDCdFeIfCt622GvRO51kIBlrmqxenQ==
X-Google-Smtp-Source: AGHT+IEum0VSQewzzaTU+3ZpgOMhDtBM/3vZ+Z9210C/3eHeLDTbR7tE88RuQtlSR0x2urkYRVD1mlKFkxYQqJf2ECE=
X-Received: by 2002:a05:6808:2289:b0:3f4:af3:74cc with SMTP id
 5614622812f47-3f42479a12emr5482133b6e.4.1740540201990; Tue, 25 Feb 2025
 19:23:21 -0800 (PST)
MIME-Version: 1.0
References: <CAKBKdXhaQLj01Kn06xMBsHExT1xNMKnHxTB+Hu33jtpySr-few@mail.gmail.com>
 <be2314bd-d212-4b9b-a50c-1b86b42ab861@suse.com> <CAKBKdXgMn90_R6_rKWAzrQdkpPXL1-ZxAKM8n8RPXiOeY7VtJQ@mail.gmail.com>
 <Z75lN_ShrXUGiT5e@mail-itl> <CAKBKdXh0ANyMnB2VbB8ayp64DmOnHTw8WwB4VNQ7NxjpbfV2oQ@mail.gmail.com>
In-Reply-To: <CAKBKdXh0ANyMnB2VbB8ayp64DmOnHTw8WwB4VNQ7NxjpbfV2oQ@mail.gmail.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 26 Feb 2025 04:23:11 +0100
X-Gm-Features: AWEUYZlKeA67gg4UskYODkc4Rkuk2OhfzFP9gnUaaikRxcwmxjL-W10agdie7Dc
Message-ID: <CAKBKdXi=eufqCThU0Qf8mBqJ8zXbi9NtFKJN1c=H2ow4nFoo0w@mail.gmail.com>
Subject: Re: xl create/save throwing errors
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 3:29=E2=80=AFAM Petr Bene=C5=A1 <w1benny@gmail.com>=
 wrote:
>
> and frustratingly, the generated MEMORY.DMP is corrupted.
>

I finally managed to capture a few non-corrupted crashdumps.
The cause of crash always points to the same symbol:
nt!KiIpiProcessRequests+0x193

Crashdump#1
00 fffff802`0867ad90     : 00000000`00000061 fffff307`eb40d3f0
00000000`00000000 00000000`00000000 : nt!KiIpiProcessRequests+0x193
01 fffff802`0867aaa7     : 00000000`00000000 00000000`00000000
00000000`00000000 00000000`00000000 :
nt!KiIpiInterruptSubDispatch+0x90
02 fffff802`08566c8e     : 00000000`00006000 ffffd801`78e20180
00000000`00000000 00000000`00000000 : nt!KiIpiInterrupt+0x307
03 fffff802`0855a96c     : 00000000`00000000 00000000`0000609c
00000000`00000000 00000000`00000000 : nt!MiFlushTbList+0x39e
04 fffff802`0855a304     : 00000000`00000000 00000000`00000000
00000000`00000003 00179800`0000609a : nt!MiReplenishBitMap+0x5bc
05 fffff802`084d3857     : 00179841`0000609b 00000000`00000001
00000000`00000020 00000000`00000000 : nt!MiEmptyPteBins+0x124
06 fffff802`084d2d1c     : 00000000`00000000 ffffd66c`00000003
ffff940f`390d7d10 fffff802`084fec14 : nt!MiReservePtes+0x447
07 fffff802`0a8b45b8     : 00000000`00015000 ffff940f`361ea3e0
00000000`00000001 00000000`00000001 :
nt!MmMapLockedPagesSpecifyCache+0xcc
08 fffff802`0a8b05df     : 00000000`00015000 00000000`0000100c
ffff940f`00015000 ffff940f`361ea050 :
rdyboost!SMKM_STORE<SMD_TRAITS>::SmStMapPhysicalRegion+0x80
09 fffff802`0a8b0327     : a8d26432`0000100c 00000000`00000000
00000000`00000000 ffff940f`3addd650 :
rdyboost!ST_STORE<SMD_TRAITS>::StDmpSinglePageRetrieve+0x22f
0a fffff802`0a8b0066     : ffff940f`361ea000 fffff802`0a8ae3ff
00000000`00000000 00000000`ffffffff :
rdyboost!ST_STORE<SMD_TRAITS>::StDmPageRetrieve+0x147
0b fffff802`0a8ae1ee     : 00000000`00000080 ffff940f`3addd650
00000000`00000000 00000000`00000000 :
rdyboost!ST_STORE<SMD_TRAITS>::StWorkItemProcess+0xa6
0c fffff802`0a8b5be1     : 00000000`00000000 ffffd801`00000000
00000000`00000000 00000000`000001de :
rdyboost!SMKM_STORE<SMD_TRAITS>::SmStWorker+0x15e
0d fffff802`085dd715     : ffff940f`361ea000 fffff802`0a8b5bd0
fffff307`eb005f38 0000247f`b19bbdff :
rdyboost!SMKM_STORE<SMD_TRAITS>::SmStWorkerThread+0x11
0e fffff802`0867b6ea     : ffffd801`78e20180 ffff940f`361d0040
fffff802`085dd6c0 00000000`00000000 : nt!PspSystemThreadStartup+0x55
0f 00000000`00000000     : fffff307`eb40e000 fffff307`eb408000
00000000`00000000 00000000`00000000 : nt!KiStartSystemThread+0x2a

Crashdump#2
00 fffff800`03476d90     : 00000000`00000000 fffff800`05a75db0
00000000`00000000 00000000`00000000 : nt!KiIpiProcessRequests+0x193
01 fffff800`03476aa7     : 00000000`00000000 00000000`00000000
00000000`00000000 00000000`00000000 :
nt!KiIpiInterruptSubDispatch+0x90
02 fffff800`068e1749     : fffff800`024e7180 fffff800`033aa251
00000000`00000000 00000000`00000005 : nt!KiIpiInterrupt+0x307
03 fffff800`05140713     : ffffc787`47d447e0 fffff800`05a75f30
ffff9880`b57716f0 ffff9880`b5179180 : Rtnic64!MPIsr+0x41
04 fffff800`032b19e5     : ffff9880`b5771640 00000000`00000000
fffff800`024e7180 fffff800`024e7180 : ndis!ndisMIsr+0x83
05 fffff800`034718bf     : fffff800`05a6ea90 ffff9880`b5771640
00000000`0000fffe fffff800`03476d90 :
nt!KiCallInterruptServiceRoutine+0xa5
06 fffff800`03471b87     : ffff9880`b5b7f000 ffffc787`47d1e1a0
fffff800`05185050 00001f80`00350ac0 : nt!KiInterruptSubDispatch+0x11f
07 fffff800`0347130b     : ffffc787`47d1e1a0 fffff800`068e192e
ffffc787`47d447e0 00000000`00000000 : nt!KiInterruptDispatch+0x37
08 fffff800`0514063a     : ffffc787`47751de0 fffff800`068e2ea8
ffffc787`47d44000 ffff078b`23b4f299 : nt!KeSynchronizeExecution+0x5b
09 fffff800`05140208     : ffffc787`47d1e1a0 fffff800`05a6ed40
ffffc787`47d44808 ffffc787`47d447e0 : ndis!ndisMDpcX+0xde
0a fffff800`0331a065     : fffff800`024e9f80 00000000`00000008
fffff800`05a6ecd0 00000000`00000008 : ndis!ndis5InterruptDpc+0x98
0b fffff800`033196bf     : 00000000`00000014 00000000`00989680
00000000`0000038a 00000000`000000a2 : nt!KiExecuteAllDpcs+0x305
0c fffff800`034770e5     : 00000000`00000000 fffff800`024e7180
ffff9880`b5771640 000000d6`5dffc510 : nt!KiRetireDpcList+0x1ef
0d fffff800`03476ed0     : 00000000`00000000 fffff800`0320f2cb
ffffffff`0000ffff 00000000`00000000 : nt!KxRetireDpcList+0x5
0e fffff800`03476785     : 000000d6`5dffc510 fffff800`03471c01
00000000`00000000 fffffc83`95752780 : nt!KiDispatchInterruptContinue
0f fffff800`03471c01     : 00000000`00000000 fffffc83`95752780
ffff9880`b5771640 fffff800`0387d507 : nt!KiDpcInterruptBypass+0x25
10 fffff800`038a387b     : 00000000`00000000 00000000`00000008
00000000`00000008 fffff800`032f4e97 : nt!KiInterruptDispatch+0xb1
11 fffff800`03481915     : ffffffff`fffffffb ffffc787`4cf60040
ffffdc03`00000001 000000d6`5dffcee8 : nt!NtQueryKey+0x34b
12 00007ffc`6dcfc394     : 00007ffc`6b88aad7 000000d6`5dffc630
000000d6`5dffc630 00000000`00000000 : nt!KiSystemServiceCopyEnd+0x25
13 00007ffc`6b88aad7     : 000000d6`5dffc630 000000d6`5dffc630
00000000`00000000 0000025c`00000001 : ntdll!NtQueryKey+0x14

Also, I would like to reiterate that these crashes happen AT THE VERY
MOMENT the xl save command is executed. I experimented with delaying
the xl save by a few seconds, even minutes. The VM runs always fine
until the moment xl save is executed. Then this crash happens
(randomly).

P.

