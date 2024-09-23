Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394B97E9E7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801858.1211893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgGz-00031W-9g; Mon, 23 Sep 2024 10:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801858.1211893; Mon, 23 Sep 2024 10:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgGz-0002z7-77; Mon, 23 Sep 2024 10:26:29 +0000
Received: by outflank-mailman (input) for mailman id 801858;
 Mon, 23 Sep 2024 10:26:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81ci=QV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ssgGx-0002yF-JO
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:26:27 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4953b0d7-7996-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 12:26:25 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c46680a71bso3290254a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 03:26:25 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5c3d18cb0sm710769a12.77.2024.09.23.03.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 03:26:24 -0700 (PDT)
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
X-Inumbo-ID: 4953b0d7-7996-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727087185; x=1727691985; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EtFPwZJPOOk5BuK4Ciy05tc/divqztAHuZ/w8yeENnQ=;
        b=k0jdP3b3cMkN6Vhw+vovNdMSDF+NzyLNo3lsZfhDHWUL4PsO10K5uOrfnAi3kxnmM3
         sPbfy40lK1a4wsPdKyU1JWYzsib/TZ/XsW9ncOiemGMmsLfGgmIOgISiS/teV92XK3bt
         Ap0CXTEPYigyZDBEKhcS0ENPzHXXe23ZFN+Q7lqu6nL/KmhDfEWskkWXSEYMyrIriYo6
         URvj8/ChWE58Mm3wSERZO4Iff0gZFx7nF4CTF/CVMMPwMtSf5E5EP++V50PXKcJxgO7/
         1OYwOGJwTiN3TcmGvCBg5drVl3RqrtnEH5WerOhqAvY6ko+JK/BwkEv31IkYLSj0iDuo
         p1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727087185; x=1727691985;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EtFPwZJPOOk5BuK4Ciy05tc/divqztAHuZ/w8yeENnQ=;
        b=XkSCiaUjCBLEp/q8OUlkm4GS65NU50uVB6fu8IEat9J79Ly05iimRXzVso2JQW38nB
         ZzMXOpjV4kOZVUkbXOb8Tvm6D5SaQi6ZaW/AsidiDgpN1QNNZzcWeXX+FGxiyM/otm/b
         DMoVoa19BF8qPW3t0RzEzUxTa7PcPzI/t/A0jGDNtDo7LMpQrBwWKC0Ij7eGc9f/GphF
         2zvH8/eTh5g0aKAkOzdLzb+Rj12GXOQlGt7OFn6ZcYkvjLAn5/Uf7YKy5/KzO45c2ZtL
         +bGTaVmKqMQg6Qv24NAIspFa7/H/sg1CJI5KA3z1+ZLw1vaa0cYN6oLSjfUJkbsX7TGy
         H/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5klINj7NrxA8SK9PNFfLL0ZSz63IB2rXU/Oj8Bo3L8kRyFz/bH7OQSM06kKAxknkkByv38p0XnE0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOs9fLD6GRB0Na9icYoC9yuSprmPQTp+9Up7hBU12kUzdOPekQ
	drPZLZ5CIEwoME48A9s8heV+FX4WkZTpjoGeerfr2a/EPXTdmYZ6X4s8lQ==
X-Google-Smtp-Source: AGHT+IEcVh01QFMppPrTsrD4EeAuXgCz67PENfVV8a/D8ge5mi1G8f2P2MUcNaUyGBvH+04JCD0gkg==
X-Received: by 2002:a05:6402:5206:b0:5c2:480e:7960 with SMTP id 4fb4d7f45d1cf-5c464326770mr10323638a12.0.1727087184608;
        Mon, 23 Sep 2024 03:26:24 -0700 (PDT)
Message-ID: <169f8921d324504622d30efea588a04c51d1c861.camel@gmail.com>
Subject: Re: Xen 4.20 release schedule proposal
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>, "committers @
 xenproject . org" <committers@xenproject.org>
Date: Mon, 23 Sep 2024 12:26:23 +0200
In-Reply-To: <6426e9c3-2971-4497-8703-c2653b1a164c@xen.org>
References: 
	<CAMacjJya_30yczOSBR=3f7_wGVgaSw_fWh7jhPqn3EQ3h4i2pQ@mail.gmail.com>
	 <6426e9c3-2971-4497-8703-c2653b1a164c@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-09-19 at 21:30 +0200, Julien Grall wrote:
>=20
>=20
> On 19/09/2024 18:10, Oleksii Kurochko wrote:
> > Hello everyone,
> >=20
> > Following the 8-month release cycle, also taking into account that
> > 4.19
> > has been released 27.07.24 and the next "good" month for release
> > should
> > be November according to [1] but it seems to me that it could be
> > too short,
> > below is the proposed release schedule that I come up with for Xen
> > 4.20.
> >=20
> > Please don't hesitate to provide your feedback.
> >=20
> > If there are no objections, I plan to update the Wiki page
> > *Xen_Project_X.YY_Release_Notes* to make it easier to find our
> > final
> > schedule ( especially for the people who aren't following xen-devel
> > mailing
> > list ). As an additional benefit, it will also be accessible via
> > *SUPPORT.md* (in the wiki at
> > https://xenbits.xen.org/docs/unstable-staging/support-matrix.html).
> >=20
> > Thanks!
> >=20
> > ** Proposed option: Wed March 12, 2024 **
> > (+8 months from Xen 4.19 release)
> >=20
> > - Last posting date=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Fri Dec 20, 2023 (+13 weeks from now)
> >=20
> > Patches adding new features are expected to be posted to the
> > mailing
> > list by this date, although perhaps not in their final version.
> =C2=A0> > - Feature freeze=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fri Jan 10, 2024 (+3 weeks from
> Last=20
> posting
> > date)
> >=20
> > Patches adding new features should be committed by this date.
> > Straightforward bugfixes may continue to be accepted by
> > maintainers.
>=20
> I expect a few maintainer to be off around Christmas for a couple of=20
> weeks. So that will not leave much time between the last posting date
> and feature freeze. If you don't want to push too much the release,
> then=20
> I think it would be better if the feature freeze is just before (e.g.
> 20th December) so last posting date early December.
Thank you for the feedback.
It makes sense to me to move the feature freeze to December 20th and
the last posting date to November 30th.

~ Oleksii



