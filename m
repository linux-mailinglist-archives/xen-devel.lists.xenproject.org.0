Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F128598F169
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 16:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809508.1221866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMq5-0006uG-GG; Thu, 03 Oct 2024 14:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809508.1221866; Thu, 03 Oct 2024 14:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMq5-0006tM-D6; Thu, 03 Oct 2024 14:29:57 +0000
Received: by outflank-mailman (input) for mailman id 809508;
 Thu, 03 Oct 2024 14:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCg9=Q7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1swMq3-0006sV-TF
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 14:29:55 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4777242-8193-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 16:29:55 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so10899781fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 07:29:53 -0700 (PDT)
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
X-Inumbo-ID: f4777242-8193-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727965793; x=1728570593; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OuG0nL1nshuHEoO3+Bf8F3VQ4py/vB3+PiGdBulfOho=;
        b=hEi5mlve8hl+LM0PGGd5Wm1cHsdW0WuqYE0DAJl0GtLJKfLuIqUiIly1zjt3/sDXgM
         p38Fsl7pdVmHNX91+JkTGQz6412LAO5Jphyx2PUkzRjSIrktrgDxaL/gpiziprP7dWOB
         OgAEjeLw901pSYqvIqtPFNyE2M9vlwEX/FSIpDbQ8QXHxkj4Imudf7ZbDbJAHTJH1RBJ
         WvoQWDqQSjGGNnU3DRFqHFAHoXZreOqE4h3eQaKRJBQcADhtHLi9/NTjKNf48Jgo9ZQu
         2rbRvj4/b7/ujO/n9nHQNTVf7wnvbNVrnw0UbLoqDt6Whxd/gtnVTM877RhxwxQo9cQ8
         FlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727965793; x=1728570593;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OuG0nL1nshuHEoO3+Bf8F3VQ4py/vB3+PiGdBulfOho=;
        b=XGgfXUN6xIXU0KLziBqT/S6tKoyiSqX/EYeyGXqIQZRWru5q6VcuV0efRkF4aT8bA2
         1x1Oxewrn1YMNvzhTSK+AARRUu+Xt8eo5xtHiGF6Utu0jo4aHQ2teJNOP/JFU2UMk/Ii
         INmxwVhBQGFMFFwewCYv3K7Qg5yPPFpwmzGQ3Yofe+oCYmJfaUVbz4Mp+hY3hXN8KVuP
         fwr8Av0TZdT+l39YACRlTUKISHa2rVV5h8Gq6YqJj/fFmeuxSFdV2mox0i3muwgkUGsJ
         iFStM9fJUsHBeqCIcM22QoZX2p72ONyukIcbI2hjG5G1Y0yPr6vveZepfcmQAbLgc3+5
         A/hg==
X-Gm-Message-State: AOJu0Yxl+grikBg39PlQq945od+fq97UUYICTSdHtvDsj5f5Dsq1olFN
	VnSGtQgS3nrck2L5Oi986Zvd71f5lRIP0dxCEE0+hShe5DGSZl4aPZaoeYtyBj6YTlC7b3Ohnbd
	nMwJ1JVgrnntoyMRKorspDos2KPf4Wxql
X-Google-Smtp-Source: AGHT+IEqg99bAOiXN7BcHxiHtGurYltOhJBaCX9nPb6b2nduxnBE/jffUZHh9oiHPPXRlGAuI2pKSPA+p3XEfpc1m08=
X-Received: by 2002:a2e:e01:0:b0:2f4:50c:ab55 with SMTP id 38308e7fff4ca-2fae103b122mr37548011fa.16.1727965792175;
 Thu, 03 Oct 2024 07:29:52 -0700 (PDT)
MIME-Version: 1.0
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date: Thu, 3 Oct 2024 16:29:16 +0200
Message-ID: <CAMacjJxEi6PThwH2=NwG3He8eQn39aiaxZCw3bQF7i4YcmjuNw@mail.gmail.com>
Subject: Xen 4.20 release schedule proposal (v2)
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>, 
	"committers @ xenproject . org" <committers@xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000003a128106239363ae"

--0000000000003a128106239363ae
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

Please look at the updated version ( the previous version can be found here
[1] ) of Xen 4.20 release schedule.

** Proposed option: Wed Feb 26, 2025 **
 (~ +8 months from Xen 4.19 release)

- Last posting date          Fri Nov 29, 2024 (+8 weeks from now)

Patches adding new features are expected to be posted to the mailing
list by this date, although perhaps not in their final version.


- Feature freeze             Fri Dec 20, 2024 (+3 weeks from Last posting
date)

Patches adding new features should be committed by this date.
Straightforward bugfixes may continue to be accepted by maintainers.

- Code freeze                Fri Jan 17, 2025 (+4 weeks from Feature freeze)

Bugfixes only.

- Hard code freeze           Fri Feb 07, 2025 (+3 weeks from Code freeze)

Bugfixes for serious bugs (including regressions), and low-risk fixes only.

- Final commits              Fri Feb 21, 2025 (+2 weeks from Hard code
freeze)

Branch off staging-4.20.

- Release                    Wed Feb 26, 2025


Please don't hesitate to provide your feedback.

If there are no objections, I plan to update the Wiki page
Xen_Project_X.YY_Release_Notes to make it easier to find our final schedule
( especially for the people who aren't following xen-devel mailing list ).
As an additional benefit, it will also be accessible via SUPPORT.md (in the
wiki at https://xenbits.xen.org/docs/unstable-staging/support-matrix.html).

Thanks and have a good end of the week!

Best regards,
 Oleksii

[1]
https://lore.kernel.org/xen-devel/CAMacjJya_30yczOSBR=3f7_wGVgaSw_fWh7jhPqn3EQ3h4i2pQ@mail.gmail.com/

--0000000000003a128106239363ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone,<br><br>Please look at the updated version =
( the previous version can be found here [1] ) of Xen 4.20 release schedule=
.<br><br>** Proposed option: Wed Feb 26, 2025 **<br>=C2=A0(~ +8 months from=
 Xen 4.19 release)<br><br>- Last posting date =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Fri Nov 29, 2024 (+8 weeks from now)<br><br>Patches adding new featur=
es are expected to be posted to the mailing<br>list by this date, although =
perhaps not in their final version.<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<b=
r>- Feature freeze =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fri Dec 20, 20=
24 (+3 weeks from Last posting date)<br><br>Patches adding new features sho=
uld be committed by this date.<br>Straightforward bugfixes may continue to =
be accepted by maintainers.<br><br>- Code freeze =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Fri Jan 17, 2025 (+4 weeks from Feature free=
ze)<br><br>Bugfixes only.<br><br>- Hard code freeze =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Fri Feb 07, 2025 (+3 weeks from Code freeze)<br><br>Bugfixes =
for serious bugs (including regressions), and low-risk fixes only.<br><br>-=
 Final commits =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Fri Feb 21, =
2025 (+2 weeks from Hard code freeze)<br><br>Branch off staging-4.20.<br><b=
r>- Release =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Wed Feb 26, 2025<br><br><br>Please don&#39;t hesitate to provide your=
 feedback. <br><br>If there are no objections, I plan to update the Wiki pa=
ge Xen_Project_X.YY_Release_Notes to make it easier to find our final sched=
ule ( especially for the people who aren&#39;t following xen-devel mailing =
list ). As an additional benefit, it will also be accessible via SUPPORT.md=
 (in the wiki at <a href=3D"https://xenbits.xen.org/docs/unstable-staging/s=
upport-matrix.html">https://xenbits.xen.org/docs/unstable-staging/support-m=
atrix.html</a>).<br><br>Thanks and have a good end of the week!<br><br>Best=
 regards,<br>=C2=A0Oleksii<br><br>[1]=C2=A0<a href=3D"https://lore.kernel.o=
rg/xen-devel/CAMacjJya_30yczOSBR=3D3f7_wGVgaSw_fWh7jhPqn3EQ3h4i2pQ@mail.gma=
il.com/">https://lore.kernel.org/xen-devel/CAMacjJya_30yczOSBR=3D3f7_wGVgaS=
w_fWh7jhPqn3EQ3h4i2pQ@mail.gmail.com/</a><br><br><br></div>

--0000000000003a128106239363ae--

