Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AAB853340
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 15:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679923.1057725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZtrT-0005pX-KU; Tue, 13 Feb 2024 14:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679923.1057725; Tue, 13 Feb 2024 14:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZtrT-0005nz-GC; Tue, 13 Feb 2024 14:34:15 +0000
Received: by outflank-mailman (input) for mailman id 679923;
 Tue, 13 Feb 2024 14:34:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SqM6=JW=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rZtrS-0005nn-2j
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 14:34:14 +0000
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [2a00:1450:4864:20::643])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5008d04-ca7c-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 15:34:13 +0100 (CET)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-a3d2587116aso17470466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 06:34:13 -0800 (PST)
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
X-Inumbo-ID: f5008d04-ca7c-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707834852; x=1708439652; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m/tLFueGTPOjDp5fpr95SEip2U5yJw1eI2KrdoB48zQ=;
        b=fA4T3L0WQlI1HdjZRsbFrTjbEhgA71e3t5XF2hSnf/XkBf1AccT56XNF9yAmviCO1i
         7E2i0mAiDJIwvxB3rMq3meVRhy41dGrXaIywPYsoYYjeGNLquE9+6RWBd6bzSdhdW4N3
         BXkO7mugdEInfnepgB8Z71Durk004H/uMh+Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834852; x=1708439652;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m/tLFueGTPOjDp5fpr95SEip2U5yJw1eI2KrdoB48zQ=;
        b=luYEDfB0nvpUAgCyPujsLM4CJZwpA2P5XfRboHuMnJ5o6j2MBmDyBBnhJkg/sgbLFH
         Y0nMt/5zj0RK4qn9o027dSLetJHfLx3N+s298weig3GM0r7IVqp204lUBQI2i09t6hxr
         RGEH1kgN6A4QnGaNgC4k1gcRxhhtn0/Y5mR4Ki//6XNolgQQD8qPFHIJeFdD7hjZs7ye
         LhwNsqb0W3RLtz7WWkdq0FnHwZavu75oc9kW6mPT+SdaHiwTOo7bC84GntheBJ8LrqzM
         qpuH4hA3U8JTyPG9/1FVIbOuLLjbTcetyd7dG21ghaCJRRLDMBw/uJBNLK1p1uyFt6UC
         kD9g==
X-Gm-Message-State: AOJu0YwOHIvO09OKH5U29tJgXoNEd+AX/n43TE1RZ7lC3bvXCMvI/5SS
	N2atOhF1So5hqjf30Waodeg/LbX1UFCV/NzHKJw330o4hSYVuS0wiskKhEM6nY5T4CMzIFWsr/E
	M80eHgjdoYb4IVzV3iqq327zSZuyUNTNvNz+xtwQZRraCqbPwAIKnXb4q
X-Google-Smtp-Source: AGHT+IFIdg7CBNnXtDrwZKaVLcqInhj5HPnWpbNTL4wO9GUhQFOTKUh0XTL6HeglRrdaaFv6cjdEC9qPp3Ad08b372k=
X-Received: by 2002:a17:906:40ca:b0:a35:e7a1:66ec with SMTP id
 a10-20020a17090640ca00b00a35e7a166ecmr6496969ejk.44.1707834852247; Tue, 13
 Feb 2024 06:34:12 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 13 Feb 2024 14:33:36 +0000
Message-ID: <CAO-mL=wFR=jz7sJdBsqVxesg9VQ4mZ4OeHcV-TdtB6mBP81T4Q@mail.gmail.com>
Subject: Xen Summit 2024 - Registrations now open!
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000b4351c0611444966"

--000000000000b4351c0611444966
Content-Type: text/plain; charset="UTF-8"

Hello Xen Community,

Our Xen Summit 2024 registrations are now open! Secure your early bird
rates today.
https://events.linuxfoundation.org/xen-project-summit/register/

If you're an academic studying for a relevant degree, entry is free!
(subject to a social media or blog post after the event)

Please make sure to submit your talks early, as CFPs will close at the end
of the month.

If you have any questions, please let me know or email
cfp@linuxfoundation.org

Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000b4351c0611444966
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Xen Community,=C2=A0<div><br></div><div>Our Xen Summ=
it 2024 registrations are now open! Secure your early bird rates today.=C2=
=A0</div><div><a href=3D"https://events.linuxfoundation.org/xen-project-sum=
mit/register/">https://events.linuxfoundation.org/xen-project-summit/regist=
er/</a><br></div><div><br></div><div>If you&#39;re an academic studying for=
 a relevant degree, entry is free!=C2=A0=C2=A0</div><div>(subject to a soci=
al media or blog post after the event)</div><div><br></div><div>Please make=
 sure to submit your talks early, as CFPs will close at the end of the mont=
h.=C2=A0</div><div><br></div><div>If you have=C2=A0any questions, please=C2=
=A0let me know or email=C2=A0<a href=3D"mailto:cfp@linuxfoundation.org">cfp=
@linuxfoundation.org</a></div><div><br></div><div>Many thanks,<div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rg=
b(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)=
">Xen Project=C2=A0<br></div></div></div></div></div></div></div>

--000000000000b4351c0611444966--

