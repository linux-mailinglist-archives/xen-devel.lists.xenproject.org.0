Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9755B6A7BB5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 08:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504352.777001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXdAJ-0002jI-Uh; Thu, 02 Mar 2023 07:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504352.777001; Thu, 02 Mar 2023 07:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXdAJ-0002fu-Ra; Thu, 02 Mar 2023 07:15:47 +0000
Received: by outflank-mailman (input) for mailman id 504352;
 Thu, 02 Mar 2023 07:15:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UTIr=62=gmail.com=asr7247@srs-se1.protection.inumbo.net>)
 id 1pXdAI-0002fj-P8
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 07:15:46 +0000
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [2607:f8b0:4864:20::e2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0954c947-b8ca-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 08:15:41 +0100 (CET)
Received: by mail-vs1-xe2e.google.com with SMTP id o6so21515923vsq.10;
 Wed, 01 Mar 2023 23:15:42 -0800 (PST)
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
X-Inumbo-ID: 0954c947-b8ca-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JVYkfeLqT4XmNG+0ob80P9Rtrn3EjXPZbX3os24Vt+0=;
        b=fIQV1J6I4+uJzHEUo8pKv7LZL9wMf8v+VoIR6IfjJ5s9lj1igg79z/rHcy9ciSUm5L
         Wm+kWsqrTAch4ZLqyvc7z24HUbMU9ec+vjjtTrEeFpPRneRhU1aiBvpegfSGCtWSD+Hu
         MkqYjhaN2I5LL+R42VHzNG3vdScA61ALogJVpTu4D6z6xHybUNfHNiebPCiZm86CZtAU
         PStDGjfr2HbdMcZvDtsDI7z3WNtPU4dUDvxLjKP82mKWU87AmY+pBN8G+194vHT51JDY
         ZAEtwpUUS/x5/JqWLQ4Y0J6A3FjpBoD6Dk03gqMNBJ1szYr9bmW0gDc+gleKGByixJa2
         LoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVYkfeLqT4XmNG+0ob80P9Rtrn3EjXPZbX3os24Vt+0=;
        b=ckyshxzMzsE8S9qLmGcv3qbOTvggClCW3virYzl/Jzl3mFDlGdVoMV6U7ypnc3xYUr
         LWHiHAu7wsERG5wC/CZkVeS0+MlcD1qvmu2gT/L77xL1oGaDPj+XUJ6v6tcCvZ6NHGJA
         brRK7Ava4D2DNDVJail7lKknMNtkD8P5NwBLgas5t7VmXfSJLx2bdLHrb62JqBNiyOeY
         uWn4Lx716WR6jeFZMn/URJSr6xqUSlyR/UYoGHd+XANuHbkqChVSLyUUKKso/7zka2nX
         zk4lVBa0DO/ZCgrDas+ML5AOwe1+E/xly8OeDOuYHfPIrERSQDwmYWxJqS/nbBDVLs4L
         YO4g==
X-Gm-Message-State: AO0yUKX1fhiQVdr/UrtaLQoWRqVOJHgjqL/bl1b6pTgjAsjHCejlg53c
	IhiauZOa/5kpAYiOyLPRCmp8wsZTYugEjxqwiZC2vzz3QT3uJw==
X-Google-Smtp-Source: AK7set/hFHrLiP/Z73xPu94gBvAt57X47ReTaUAh9biG14pXpwd1imO2gTlqqTb3oZnWLnN9YmU7018lXL5oDLpImQA=
X-Received: by 2002:a67:ee19:0:b0:416:8ea0:7f9b with SMTP id
 f25-20020a67ee19000000b004168ea07f9bmr6232771vsp.2.1677741340849; Wed, 01 Mar
 2023 23:15:40 -0800 (PST)
MIME-Version: 1.0
From: A Sudheer <asr7247@gmail.com>
Date: Thu, 2 Mar 2023 12:45:29 +0530
Message-ID: <CABg_Py+W73ahjzyM+5oo0qu2qQ4jJywe0mmDCcM3g7981N6Wwg@mail.gmail.com>
Subject: xl restore domu fails to load state for instance 0x0 for virtio-gpu
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a57b1a05f5e59895"

--000000000000a57b1a05f5e59895
Content-Type: text/plain; charset="UTF-8"

Hi All,

i am verifying xl save/restore functionality. While restoring the ubuntu
domu state , it fails with instance error for "virtio-gpu". Can someone
help how to overcome this error.

*Setup:*
Dom0 : Ubuntu + Xen + qemu
DomU: Ubuntu

*Error:*
qemu-system-i386: Failed to load virtio-gpu:virtio-gpu
qemu-system-i386: error while loading state for instance 0x0 of device
'0000:00:03.0/virtio-gpu'
qemu-system-i386: load of migration failed: Invalid argument

Thanks
Sudheer

--000000000000a57b1a05f5e59895
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>i am verifying xl save/restore =
functionality. While restoring the ubuntu domu state , it fails with instan=
ce error for &quot;virtio-gpu&quot;. Can someone help how to overcome this =
error.</div><div><br></div><div><b><u>Setup:</u></b></div><div>Dom0 : Ubunt=
u=C2=A0+ Xen=C2=A0+ qemu</div><div>DomU: Ubuntu</div><div><b><u><br></u></b=
></div><div><b><u>Error:</u></b></div><div>qemu-system-i386: Failed to load=
 virtio-gpu:virtio-gpu<br>qemu-system-i386: error while loading state for i=
nstance 0x0 of device &#39;0000:00:03.0/virtio-gpu&#39;<br>qemu-system-i386=
: load of migration failed: Invalid argument<br><br></div><div>Thanks</div>=
<div>Sudheer</div></div>

--000000000000a57b1a05f5e59895--

