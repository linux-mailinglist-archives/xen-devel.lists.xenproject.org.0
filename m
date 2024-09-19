Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA697CC14
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 18:11:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800839.1210852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srJkI-0003F7-1W; Thu, 19 Sep 2024 16:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800839.1210852; Thu, 19 Sep 2024 16:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srJkH-0003DM-V2; Thu, 19 Sep 2024 16:11:05 +0000
Received: by outflank-mailman (input) for mailman id 800839;
 Thu, 19 Sep 2024 16:11:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hDEZ=QR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1srJkH-0003DG-FI
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 16:11:05 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3a3c0c6-76a1-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 18:11:01 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2f75aa08a96so11874281fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 09:11:01 -0700 (PDT)
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
X-Inumbo-ID: c3a3c0c6-76a1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762261; x=1727367061; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/tilfcY4bx5zjpDNOXuiwdSForepVxpSexTM0XWXMaA=;
        b=Qk6wVLGPSk0T2IwIPM/mlhmcV7wQx6onA9JxbdHuqs04ZTFKHhjqZiCi+BktfcG8+W
         cQK50h8WwGcVq3XE2Gm3FKPgl75VP2c7G/kuB0pL7gyFsU0NfZsctfc1TQ3SG3/iHlIm
         qjSaDHgvp+JKSU9V0kEm1pOh5MkZFxQGQByP5MoleGiTiZpjUXR9vpnrLqmYBsaBLR4g
         N48Adi2v5ymbzBE1TVTMlZSBwpwbLJunNkg9pvFQIz6zj4LE2HpizcAzwh7Hd+L0UZyS
         SX4DWPLYk4PBulovSdFleTPqQOanT/AqKRcadMOIfhPXj8ZBVcd1tcYRRoC/asCUrJiK
         +acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762261; x=1727367061;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/tilfcY4bx5zjpDNOXuiwdSForepVxpSexTM0XWXMaA=;
        b=T20xfMomkoLBItTi/Sy9xaHmeT0MZuvfuoD3jVL1KPg9sWK7I9XHNpoLn0qQxoDAbd
         s87cCC9fEnhIVZ+XcVXgo+09+pQunHjrLh7VDFj96Bvz50QZyrem2TjGDhk/hpAxYcdv
         +V6RsMfXYEYVOy0DKFWTdFu0qLBZ5iJtExXTuKnyazi7SASqcqZWZDC0zjbPGiEVQs4s
         2LQam3ZNGVH+yjqhh77WQMtiNxhOHXdwvic5bLMMB4ubHfVRFUWEgh6Ohklj50M9FsQ7
         9ZBaQe5tiGCjoYcEYC7db37/kc+TKiR71O7t1x+2p4Gl+RRpHKGU02uTCZOIHaFmrxy3
         gulw==
X-Gm-Message-State: AOJu0Yx89nboAbcxhn7fMlF5YzWDuCjR+RUoGXL+o4blkIHUHF9l7dTX
	HsPJA4RgTiseUK/nJYiHzlz6s2J4ow7Qxxr4dGLrq70758VoRi3r0cKgfJSEaYT4TqPk/BbFv7Q
	gPWiC6jwRwKEcDN3Xs0GAU4aNA/JYa4wT
X-Google-Smtp-Source: AGHT+IF/lDH0NVa4xfJRsyYR4WEkHSbEu1HSDaUgJyt9dHa9/xQvwTh+5N7gRjG0nwaJJRjXpnQgoF12jo+LqriNbp8=
X-Received: by 2002:a2e:a543:0:b0:2f7:708f:d1c3 with SMTP id
 38308e7fff4ca-2f7cb31c9f1mr797771fa.21.1726762260472; Thu, 19 Sep 2024
 09:11:00 -0700 (PDT)
MIME-Version: 1.0
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date: Thu, 19 Sep 2024 18:10:24 +0200
Message-ID: <CAMacjJya_30yczOSBR=3f7_wGVgaSw_fWh7jhPqn3EQ3h4i2pQ@mail.gmail.com>
Subject: Xen 4.20 release schedule proposal
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>, 
	"committers @ xenproject . org" <committers@xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000025a9b106227b2b81"

--00000000000025a9b106227b2b81
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

Following the 8-month release cycle, also taking into account that 4.19
has been released 27.07.24 and the next "good" month for release should
be November according to [1] but it seems to me that it could be too short,
below is the proposed release schedule that I come up with for Xen 4.20.

Please don't hesitate to provide your feedback.

If there are no objections, I plan to update the Wiki page
*Xen_Project_X.YY_Release_Notes* to make it easier to find our final
schedule ( especially for the people who aren't following xen-devel mailing
list ). As an additional benefit, it will also be accessible via
*SUPPORT.md* (in the wiki at
https://xenbits.xen.org/docs/unstable-staging/support-matrix.html).

Thanks!

** Proposed option: Wed March 12, 2024 **
(+8 months from Xen 4.19 release)

- Last posting date          Fri Dec 20, 2023 (+13 weeks from now)

Patches adding new features are expected to be posted to the mailing
list by this date, although perhaps not in their final version.

- Feature freeze             Fri Jan 10, 2024 (+3 weeks from Last posting
date)

Patches adding new features should be committed by this date.
Straightforward bugfixes may continue to be accepted by maintainers.

- Code freeze                Fri Jan 31, 2025 (+3 weeks from Feature freeze)

Bugfixes only.

- Hard code freeze           Fri Feb 21, 2025 (+3 weeks from Code freeze)

Bugfixes for serious bugs (including regressions), and low-risk fixes only.

- Final commits              Fri March 7, 2025 (+2 weeks from Hard code
freeze)

Branch off staging-4.18.

- Release                    Wed March 12, 2025

[1] https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html

Best regards,
 Oleksii

--00000000000025a9b106227b2b81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone,<br><br>Following the 8-month release cycle=
, also taking into account that 4.19<br>has been released 27.07.24 and the =
next &quot;good&quot; month for release should<br>be November according to =
[1] but it seems to me that it could be too short,<br>below is the proposed=
 release schedule that I come up with for Xen 4.20.<br><br>Please don&#39;t=
 hesitate to=C2=A0provide your feedback.=C2=A0<div><br></div><div>If there =
are no objections, I plan to update the Wiki page <em>Xen_Project_X.YY_Rele=
ase_Notes</em> to make it easier to find our final schedule ( especially fo=
r the people who aren&#39;t following xen-devel mailing list ). As an addit=
ional benefit, it will also be accessible via <em>SUPPORT.md</em> (in the w=
iki at <a rel=3D"noopener" href=3D"https://xenbits.xen.org/docs/unstable-st=
aging/support-matrix.html">https://xenbits.xen.org/docs/unstable-staging/su=
pport-matrix.html</a>).<br></div><div><br></div><div>Thanks!<br><br>** Prop=
osed option: Wed March 12, 2024 **<br>(+8 months from Xen 4.19 release)<br>=
<br>- Last posting date =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Fri Dec 20, 2023 =
(+13 weeks from now)<br><br>Patches adding new features are expected to be =
posted to the mailing<br>list by this date, although perhaps not in their f=
inal version.<br><br>- Feature freeze =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Fri Jan 10, 2024 (+3 weeks from Last posting date)<br><br>Patches ad=
ding new features should be committed by this date.<br>Straightforward bugf=
ixes may continue to be accepted by maintainers.<br><br>- Code freeze =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Fri Jan 31, 2025 (+3 we=
eks from Feature freeze)<br><br>Bugfixes only.<br><br>- Hard code freeze =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fri Feb 21, 2025 (+3 weeks from Code fre=
eze)<br><br>Bugfixes for serious bugs (including regressions), and low-risk=
 fixes only.<br><br>- Final commits =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Fri March 7, 2025 (+2 weeks from Hard code freeze)<br><br>Branch =
off staging-4.18.<br><br>- Release =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Wed March 12, 2025<br><br>[1] <a href=3D"htt=
ps://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html">https://l=
ists.xen.org/archives/html/xen-devel/2018-07/msg02240.html</a><br><br>Best =
regards,<br>=C2=A0Oleksii<br></div></div>

--00000000000025a9b106227b2b81--

