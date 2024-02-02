Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F140B8472DE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 16:16:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675070.1050243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvGj-0005qB-69; Fri, 02 Feb 2024 15:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675070.1050243; Fri, 02 Feb 2024 15:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVvGj-0005me-2e; Fri, 02 Feb 2024 15:15:53 +0000
Received: by outflank-mailman (input) for mailman id 675070;
 Fri, 02 Feb 2024 15:15:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pa3t=JL=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rVvGh-0005mR-6J
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 15:15:51 +0000
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2238b82-c1dd-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 16:15:49 +0100 (CET)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-a271a28aeb4so327411366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2024 07:15:49 -0800 (PST)
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
X-Inumbo-ID: f2238b82-c1dd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706886948; x=1707491748; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TNDypIirJFmg0WiRSLJ9ja2kfhRIBVyVdgbPpTnEuD4=;
        b=GhqOuUwV7/yd4Os85Z/ox9D3IdBKGZZU2sUulsKqMv8Po9f7u+J9XR1hCuswbrQV5e
         +zIQiXX4MqAokKP1wZPxRPcCNtl/MvDYV+Hn7iP/Wxb7/Tbk/isX2ys1BiQMhMd2VbWY
         ZdGNQcG0qeGzeDXT+sF3uib5YReOP/tzl0Bms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706886948; x=1707491748;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNDypIirJFmg0WiRSLJ9ja2kfhRIBVyVdgbPpTnEuD4=;
        b=QlV7aRXdw/CavhTLp5s5OKIR1T8hGCsMcM38vPiyC2ArZWSuqDhsF10vITs51cL9i4
         UCswCbxw3zh0FplJdwE05sJ8M6rstDx4adJgr4pSLhPox5qBe+OUYofiAp3Qm2Lzl+CC
         BHNaZtXj3BlSgTRSoY+o/1eZ83pXoUSnZEFToffvpYJHNPT+lslssP00nlb5f9c+9X67
         RNWshuDPp5dLRp3BaWZsN/vrSMSun71Pw9/XhahUpRkBCmENN32gD3DUv9A/oUyR+u68
         S+pfT0ZKO3EdWY0v2pbqi//lDKLZpQT6giJlWzo71hPozSR44xaYfZ0rQ+Kgxhnkyt4/
         RFbg==
X-Gm-Message-State: AOJu0YysJSEgGnodVFd15MpJh5ncWwH5tRybmFG73AGcKaOgyfsGUGKF
	DNXv8AYJO3tgrhdfD8/1YAJSrDVgB6piwsFCh0gA/Es0yefee7zn+XGDZG+fguWKSbM2tIxyUEE
	t/kKrFUxNvoLxT4lD9Xd6oO8kVrEB/nQ8YTTD+IQlL7KbrJC5EgB4JlEXIC+etg==
X-Google-Smtp-Source: AGHT+IH9rRd0s1x5tRCe+14Sm6gbdVbmZgQvYL/lsjv85Gc3axsCs1i0uEjvBDDFmNYRL7m6eVzmOsFcNRONgivkns4=
X-Received: by 2002:a17:907:7701:b0:a37:3234:3e9f with SMTP id
 kw1-20020a170907770100b00a3732343e9fmr140463ejc.39.1706886948207; Fri, 02 Feb
 2024 07:15:48 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 2 Feb 2024 16:14:00 +0100
Message-ID: <CAO-mL=xKyG0EyFJyUkbkojUVc8-kpL4e9mciP2O0PueCMXnGWQ@mail.gmail.com>
Subject: Community call recording: 1st February 2024
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000038634e0610679607"

--00000000000038634e0610679607
Content-Type: text/plain; charset="UTF-8"

Hi all,

Please find the community call recording below.
https://www.youtube.com/watch?v=MJSTvwvNtF8&ab_channel=TheXenProject

These are unlisted and published on our new YouTube channel. Only users
with the specific link below will be able to access the recording.

This has also been saved in the agenda notes.

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000038634e0610679607
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,=C2=A0</div><div><br></div><div>Please find th=
e community call recording below.=C2=A0</div><div><a href=3D"https://www.yo=
utube.com/watch?v=3DMJSTvwvNtF8&amp;ab_channel=3DTheXenProject">https://www=
.youtube.com/watch?v=3DMJSTvwvNtF8&amp;ab_channel=3DTheXenProject</a><br></=
div><div><br></div><div>These are unlisted and published on our new YouTube=
 channel. Only users with the specific link below will be able to access th=
e=C2=A0<span class=3D"gmail-il">recording</span>.<br></div><div><br></div><=
div>This has also been saved in the agenda notes.=C2=A0</div><div><br></div=
><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div>=
<br></div><div><div style=3D"color:rgb(136,136,136)">Community Manager</div=
><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></d=
iv></div></div></div>

--00000000000038634e0610679607--

