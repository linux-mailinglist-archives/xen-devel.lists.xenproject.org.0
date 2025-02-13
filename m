Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED05A33E6E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 12:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887370.1296881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiXiS-0004Zv-RE; Thu, 13 Feb 2025 11:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887370.1296881; Thu, 13 Feb 2025 11:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiXiS-0004YT-OO; Thu, 13 Feb 2025 11:49:12 +0000
Received: by outflank-mailman (input) for mailman id 887370;
 Thu, 13 Feb 2025 11:49:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rl8u=VE=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1tiXiR-0004YN-SB
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 11:49:11 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 894b855e-ea00-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 12:49:09 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5deb956aa5eso1015492a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 03:49:09 -0800 (PST)
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
X-Inumbo-ID: 894b855e-ea00-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739447348; x=1740052148; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H83yssLGj/mw91cTXVc34PsEHsxcHkf8r6f9NG5d544=;
        b=Z3nEAolXyqhqGwu2kxTdKgsSGGirzeMt+H2+uCzZEVGq5Q+C+BNC4ScFY9ayG3hK85
         jLrT0Nu2MxZ1NUgNd66ENOHyPsy3yFSr5uf+pK2qmxB8NkSrasTVCfmsWDIZqa18vmJr
         6BriHwpYyWvnaeZQxpicMavjlanPt7+vLQxl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739447348; x=1740052148;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H83yssLGj/mw91cTXVc34PsEHsxcHkf8r6f9NG5d544=;
        b=vhYxDXbqsxRkNPH7PwNRU/3hoiOE1vp2j8qskn83Xgx9Yh+4csoRHqktOscXCt+xd8
         sxMUyvJ8ZqKNGtnZYMiL7AidSTFDEAv3y/0/eKMiBTSsLL6swscILeSWhvRojKnHy+Cd
         Qauqxhnrnszz9W01eMsnmwzYdzgQPb/+nmzxggNxvK0MA+QPYR8C4IHc2XPXfPFqEypr
         XIPSifNbzVQLDdmFkZf/S6Xgyhg3WKyzI+c1UrQAwYXOBNBAwNko/fUXDLu+TB5uxK87
         cP+7CFdeP7gVRKjtSXvS7vC6Vqj0LyZx4yz4ZGWwi+Qic/EMIQ3/vFHiIi8s33yOcvaO
         xjTA==
X-Gm-Message-State: AOJu0YyhoREH91Xc7M9fUFsjJ5NhCcsMOIx7t0ybK8PlHw8Hg7w4W4AD
	3xnqrbLTJKGEuY+Gi+0RbGJUe68mFYu9YH148ezlozbRNreDWUczG2iBleK0Z9LpSXUOpnp1umR
	xFe+AaAaTLCHZ219Qk72cvqkiSRcgVN4jbmTA+0Jlj0lPUalAoo8=
X-Gm-Gg: ASbGncs/L/XxvF8a/eRwnjZiezrcxz8DVhLpeu+1RnIeXycWVrjKX3C8qpSeSIcZ+q9
	8O7ZS/cZesTdJW+1d4a8knMwEb5DvhqJPQJOQG+DidXI5MIrlVcy6NSesVZgv8fCNREYIiTPdnh
	KjB+nY+LoapTiuIJq+gOWDEnQUShcEiQ==
X-Google-Smtp-Source: AGHT+IFdEWPiHAACIA2OOPDzhyR5CdxcrgUos/IO6QLMWdCzdETM4M3+0EMakFQB9JlqtvAwD+oF5bnxegIsu9n3GTQ=
X-Received: by 2002:a05:6402:3818:b0:5de:bcdf:bf3e with SMTP id
 4fb4d7f45d1cf-5dec9a7a413mr7506807a12.0.1739447348126; Thu, 13 Feb 2025
 03:49:08 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 13 Feb 2025 11:48:31 +0000
X-Gm-Features: AWEUYZnLafnLPTCpXhHe2blT06ENEUvUhT1VNSXjpDSlnR2ohBrVU5KZATsaWRg
Message-ID: <CAO-mL=wQ25iWr9Gk1pcCf56EZDw0HDi9U26wp3-Zd_ca859mOQ@mail.gmail.com>
Subject: REMINDER: Xen Project Annual Survey
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004a81a7062e04a504"

--0000000000004a81a7062e04a504
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

As we start the New Year, I'd like to ask you to reflect on how the project
went in 2024. This will help us track the health of the community and also
give you a chance to express your ideas and feedback.

The survey can be answered anonymously and should take less than 10 minutes.

*Link: https://cryptpad.fr/form/#/2/form/view/dGiaMnO4J56m29UHjJc8Ai2IzZM6deWNOOatz5eGOaU/
<https://cryptpad.fr/form/#/2/form/view/dGiaMnO4J56m29UHjJc8Ai2IzZM6deWNOOatz5eGOaU/>*
*Deadline: 28th February 2025. *

Thanks,
Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>

--0000000000004a81a7062e04a504
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi everyone,</div><div><br></div><div><div>As we=
 start the New Year, I&#39;d like to ask you to reflect on how the project =
went in=C2=A02024. This will help us track the health of the community and =
also give you a chance to express your ideas and feedback.=C2=A0</div><div>=
<br></div><div>The=C2=A0<span class=3D"gmail-il">survey</span>=C2=A0can be =
answered anonymously and should take less than 10 minutes.</div><div><br></=
div><div><b>Link:=C2=A0<a href=3D"https://cryptpad.fr/form/#/2/form/view/dG=
iaMnO4J56m29UHjJc8Ai2IzZM6deWNOOatz5eGOaU/" target=3D"_blank">https://crypt=
pad.fr/form/#/2/form/view/dGiaMnO4J56m29UHjJc8Ai2IzZM6deWNOOatz5eGOaU/</a><=
/b></div><div><b>Deadline: 28th February 2025.=C2=A0</b></div><div><br></di=
v></div></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmai=
l=3D"gmail_signature"><div dir=3D"ltr"><div>Thanks,</div><div>Kelly Choi<br=
></div><div><div style=3D"color:rgb(136,136,136)">Community Manager</div><d=
iv style=3D"color:rgb(136,136,136)"><a href=3D"https://xenproject.org/" tar=
get=3D"_blank">Xen Project</a><br></div></div></div></div></div></div>

--0000000000004a81a7062e04a504--

