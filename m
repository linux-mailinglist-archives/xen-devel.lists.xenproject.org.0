Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472858ACC70
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 14:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709939.1108982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rysQA-00049D-Sy; Mon, 22 Apr 2024 12:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709939.1108982; Mon, 22 Apr 2024 12:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rysQA-00047U-Oy; Mon, 22 Apr 2024 12:05:18 +0000
Received: by outflank-mailman (input) for mailman id 709939;
 Mon, 22 Apr 2024 12:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CuSK=L3=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rysQ8-000475-U4
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 12:05:16 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9489bf30-00a0-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 14:05:16 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51ae315bb20so2344043e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 05:05:15 -0700 (PDT)
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
X-Inumbo-ID: 9489bf30-00a0-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713787515; x=1714392315; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jRAg0b2Cp6SPMWikZYeRePQzZJnFCrsJTO9dtcrtpDU=;
        b=gUwMc8z05POGtvGdGq7HZm6c/IzkWbhW3B2Mi3yGoz99RCDGNbTX2hA/3sdz2fCFgQ
         g6Tzpv5ErORrgjdX5UmPQicdNU7q4XqhKdHm5hycHImszbdq0DOPhdNSfPIsUY5ecoj/
         76PaXBpCAQAPUAMv2fNpj2f/qAwVU31QhTE/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713787515; x=1714392315;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jRAg0b2Cp6SPMWikZYeRePQzZJnFCrsJTO9dtcrtpDU=;
        b=ci8RxpF6aZPGobRhOrbwi7TcCIGwVloW6XOMAeXiM8kcU0ENMUtCRY2vWwnG2lCT0t
         z2jXjdSHBEgKivFHEfviMXlAg9yLy+l9c28991u7BNiQP2XjiKqI9Ts+/wL2Tx99+v9Z
         YeHNhW6nrRMFZy57auWURMQx1IDqscbSMDDpBzaIDIQ2npInayWnxFVWnIBtwYwexB34
         +AjLMCHTm6WSIH2A6jiU7jDZrzCVttBI2tP2AXC2sri256/WVS61vMsdrbEFZy1DJGGL
         AZJ0LL5Y1ufbog1/4CHsXzqopVKEr+rI9zBgncYIQoJIXeHC25cpkIoLE6zITED6i79X
         ANlg==
X-Gm-Message-State: AOJu0YzBrQytUy1UFqhr6TX5xKIfOT48P6n4E63SNjibLpJPIp4uvaaz
	JKOrw72J3R5AuA2G//h3pK7Jc+iiD8L98VHvrj5j9pDYA9Fguc2uk1t2gylINbxPYFJmbJVSrMI
	2oUYUJruyrUsJS5Q6x0wh9laBbQSznNK1yjCsqo44k8grFD++UjE=
X-Google-Smtp-Source: AGHT+IHGepqzfC+BRO54oEoHxgBEwjeqNBKq6m+yljPxQ4TueDAaATMVn9usB13SkmgxT65RoGadvm/d0ozSyBrCrXY=
X-Received: by 2002:a19:6445:0:b0:518:b144:9020 with SMTP id
 b5-20020a196445000000b00518b1449020mr6316257lfj.61.1713787514765; Mon, 22 Apr
 2024 05:05:14 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 22 Apr 2024 13:04:38 +0100
Message-ID: <CAO-mL=z3XHS+hpKtgDbZWk602vH3pzBPHDW3rQcbu8b1tFSU0w@mail.gmail.com>
Subject: 4.19 Release schedule - Reminder
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000009f3860616ae40b8"

--00000000000009f3860616ae40b8
Content-Type: text/plain; charset="UTF-8"

Hello all,

*Please find below our 4.19 Release Schedule*
*(Original thread from Release Manager
<https://lore.kernel.org/xen-devel/26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com/>)
*

** Proposed option: Wed Jul 10, 2024 **
(+9 months from Xen 4.18 release)

- Last posting date          Fri Apr 26, 2024

Patches adding new features are expected to be posted to the mailing
list by this date, although perhaps not in their final version.

- Feature freeze             Fri May 17, 2024 (+3 weeks from Last
posting date)

Patches adding new features should be committed by this date.
Straightforward bug fixes may continue to be accepted by maintainers.

- Code freeze                Fri May 31, 2024 (+2 weeks from Feature
freeze)

Bugfixes only.

- Hard code freeze           Fri Jun 21, 2024 (+3 weeks from Code
freeze)

Bugfixes for serious bugs (including regressions), and low-risk fixes
only.

- Final commits              Fri Jul 05, 2024 (+2 weeks from Hard code
freeze)

Branch off staging-4.19.

- Release                    Wed Jul 10, 2024

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000009f3860616ae40b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div>Hello all,</div><div><br></div><=
div><b>Please find below our 4.19 Release Schedule</b></div><div><i>(<a hre=
f=3D"https://lore.kernel.org/xen-devel/26152790b0b8c3330d9cfc3c0462a1c072d6=
d598.camel@gmail.com/">Original thread from Release Manager</a>)=C2=A0</i><=
/div><div><i><br></i>** Proposed option: Wed Jul 10, 2024 **<br>(+9 months =
from Xen 4.18 release)<br><br>- Last posting date =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Fri Apr 26, 2024<br><br>Patches adding new features are expected =
to be posted to the mailing<br>list by this date, although perhaps not in t=
heir final version.<br><br>- Feature freeze =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Fri May 17, 2024 (+3 weeks from Last<br>posting date)<br><br>Pat=
ches adding new features should be committed by this date.<br>Straightforwa=
rd bug fixes=C2=A0may continue to be accepted by maintainers.<br><br>- Code=
 freeze =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Fri May 31, =
2024 (+2 weeks from Feature<br>freeze)<br><br>Bugfixes only.<br><br>- Hard =
code freeze =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fri Jun 21, 2024 (+3 weeks f=
rom Code<br>freeze)<br><br>Bugfixes for serious bugs (including regressions=
), and low-risk fixes<br>only.<br><br>- Final commits =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Fri Jul 05, 2024 (+2 weeks from Hard code<br>fre=
eze)<br><br>Branch off staging-4.19.<br><br>- Release =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Wed Jul 10, 2024<br></div><=
div><br></div><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><d=
iv><div style=3D"color:rgb(136,136,136)">Community Manager</div><div style=
=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></=
div>

--00000000000009f3860616ae40b8--

