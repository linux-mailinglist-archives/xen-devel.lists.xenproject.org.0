Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5612EA2C18A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 12:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883575.1293539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgMZZ-00084b-DT; Fri, 07 Feb 2025 11:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883575.1293539; Fri, 07 Feb 2025 11:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgMZZ-00082d-Au; Fri, 07 Feb 2025 11:31:01 +0000
Received: by outflank-mailman (input) for mailman id 883575;
 Fri, 07 Feb 2025 11:31:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CRGW=U6=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1tgMZX-00082X-VL
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 11:31:00 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 009bdb3d-e547-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 12:30:58 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5dcea5d8f16so3857418a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 03:30:58 -0800 (PST)
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
X-Inumbo-ID: 009bdb3d-e547-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738927857; x=1739532657; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/IJprhsZBL9rU+6w1livmSLUl9LoT3QznZYLZTXicuw=;
        b=jEN8eoVZz8wSnth4jld5qa/3hlT2hXoXactFhV2vZ330Khz1k7T8X6ocCIamW9ZJHY
         m1eGciF194N8XTBcrdznXbfqZ2Vha2Agelx0sTVJpykpFg7XwswKJ1UR/Th3S4SmGiWa
         TDukR9MpApT4lxTqj8PgwNXYribUktklBPXVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738927857; x=1739532657;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/IJprhsZBL9rU+6w1livmSLUl9LoT3QznZYLZTXicuw=;
        b=EroWtdp8QC0uvIGfYzLrNEfma8knTf1rvr+keXTEfWa8HxgLRfJKWKIwhfQ+tif5wZ
         BfYD3JfItCGklOiloEa+pX4FRPSAwsuGO0Bys3L8kjzldzG8E3B+Jx0PO9JDYMjEPlJB
         ClaBa+eTA454eBBQWQfZTc0k35iguoeM19gaF+/NkQbc10ZXkmGj5u2Wrcw87vfjfYAR
         4/rxZ5+ASSvTbIXwSVybeXeS70KDhoO1QXRR0le1/VVAo49jH3drYO5Rae1hTKX9zFds
         ZdciG6bF3AFVai2ncph4dg8kVETfoMqqIXBLUseqtm4mVxTyY2MrxMG2ZtufcJVYmWNw
         mlJg==
X-Gm-Message-State: AOJu0YyxwRGae6DZM8PP/7wAUyxEShtJ0D4X7idiDnd68AmRioSMFug6
	q++X7YEk0kDpyFFtQfFq7V8dMC3XKK9MxLcpp3DflNjQunsTirj6KtobFtdOsN/RFjsPFmJZmxY
	qM+TkNh2h3lMX9iS8BCfjJzyc72zlYXH8q0uib5c1+5bS+19s1xg=
X-Gm-Gg: ASbGncswl46hAQ22WE30/6isFTDKlkU1nJNr1BdU1vBFGHTU30Tz9v7fdA5PsEKYbFu
	QKCyjpay0gZ7O6dbj4hZ6XITsVR9NubyH96JWuFCmHBrDqG+DpZiAWgphyNCx+q2bfNZy8tgFCs
	h9ISuGmVcQvfowq4ewoE62WpBhVKLcSZQ=
X-Google-Smtp-Source: AGHT+IEwQU84fn1xw3e6zZYfxsxw2tBeXv51ZN9n/yvu2iihjUUnYyHHTFcfTbd31zyCJCyW8mFr9EMTts2HUQw6y0E=
X-Received: by 2002:a05:6402:1f14:b0:5dc:a452:4f7 with SMTP id
 4fb4d7f45d1cf-5de450e211amr3380831a12.28.1738927857425; Fri, 07 Feb 2025
 03:30:57 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 7 Feb 2025 11:30:21 +0000
X-Gm-Features: AWEUYZn-E-GhrdRgirbNWrQCarGlwow3F2JPGeavOOaLNAucD0Ou7WN6tQ75Uq8
Message-ID: <CAO-mL=wpEFTf9Tvjv31bC19098nN_yh6DpartJ_Bz==_K3MRgQ@mail.gmail.com>
Subject: Xen Project Annual Survey
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000003b8958062d8bb148"

--0000000000003b8958062d8bb148
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

--0000000000003b8958062d8bb148
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><br></div><div><div>As we star=
t the New Year, I&#39;d like to ask you to reflect on how the project went =
in=C2=A0<span class=3D"gmail-il">2024</span>. This will help us track the h=
ealth of the community and also give you a chance to express your ideas and=
 feedback.=C2=A0</div><div><br></div><div>The=C2=A0<span class=3D"gmail-il"=
>survey</span>=C2=A0can be answered anonymously and should take less than 1=
0 minutes.</div><div><br></div><div><b>Link:=C2=A0<a href=3D"https://cryptp=
ad.fr/form/#/2/form/view/dGiaMnO4J56m29UHjJc8Ai2IzZM6deWNOOatz5eGOaU/">http=
s://cryptpad.fr/form/#/2/form/view/dGiaMnO4J56m29UHjJc8Ai2IzZM6deWNOOatz5eG=
OaU/</a></b></div><div><b>Deadline: 28th February 2025.=C2=A0</b></div><div=
><br></div></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><div>Thanks,</div><div>Kelly Choi=
<br></div><div><div style=3D"color:rgb(136,136,136)">Community Manager</div=
><div style=3D"color:rgb(136,136,136)"><a href=3D"https://xenproject.org/" =
target=3D"_blank">Xen Project</a><br></div></div></div></div></div></div>

--0000000000003b8958062d8bb148--

