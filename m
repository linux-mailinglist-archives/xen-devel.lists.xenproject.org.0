Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332259143F3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746142.1153102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeXf-0001U8-PA; Mon, 24 Jun 2024 07:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746142.1153102; Mon, 24 Jun 2024 07:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeXf-0001R6-M2; Mon, 24 Jun 2024 07:55:11 +0000
Received: by outflank-mailman (input) for mailman id 746142;
 Mon, 24 Jun 2024 07:55:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLeXd-0001R0-Po
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:55:09 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1310b12b-31ff-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 09:55:07 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52ce655ff5bso631428e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 00:55:07 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a725ed447e6sm20760466b.147.2024.06.24.00.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 00:55:06 -0700 (PDT)
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
X-Inumbo-ID: 1310b12b-31ff-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719215707; x=1719820507; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TQyjBCx/reW5w7XJGJBAgHTdQBEa6lsidgMMzhUmHTo=;
        b=VzYnWDLclNjRLWrweFHPDgGlTGXeDcVSuZsp0VYzf7m8wwNCBLiMwK+rql6HvUWhww
         98wPRyV3YIh1jSJrLb0vKhOBb1611Tkk1hB+drdNpSrbHhjWgeVHeMcGMXbAXbSIPwZ7
         gjKyBvCBPJ+Ii2INWoaU6uEa5CYRR8SQanHVsd6/FPxtXaLpgBKvJ7xmKlGrM/EIFRiY
         C3n7p+cy3gvHmDdwjEG3nwOMf3UkN5rS0CgTCF8HljJ5xIdjiDkSQ8+Zjk5NegkoD9Kj
         GEUM92rRSEF5Ov6XbPZ95hb4+u3mUw2ENwMMvdICjmG0Lw2423IIJ0u99Y5w8HMzM4pi
         JlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215707; x=1719820507;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQyjBCx/reW5w7XJGJBAgHTdQBEa6lsidgMMzhUmHTo=;
        b=wNihU7D3HqWpm3JbzJvE+2nMFJoy9hvdeaJJenG6JM5j1CKKgKUPDdWa7vqX4/+JJn
         Ysx2NEn7dnwJQNRdzfPPWKB+uYfjGjnrYGJONVQuCttiNklNR1tKjz/q+r7amCWpqJEN
         o+suZSspU6qoXgZQxMMnMXvvgxxMRBs+hbEl/ly15vfBVCK4oqv5lAToa3N0NRJNfl71
         hEKsZE5lE4vYj3YIbXr5VMInfojpFt8X3OKwNHcoENbO1O3bhHd+Nut3NWjAHGHOCmQe
         KNrKPhK6H1CwtTw6Z94tkXFZ8tToyVCr87JYbzq7ze8X2qfvnzARNaRQjPyfYYqiLuW0
         OoqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwgD5W/mBdT06r9XV39JmcNS3JApuMYX2myBx58oCKxCMXt3MYByaWjozPktpfZXFxkbNVa2xckBDGf3yvesX/zKy7o21TH7aYIORD/44=
X-Gm-Message-State: AOJu0YzasiaD0triZtFB0njcKw7QL1mByJ1tpXG8Yk3bTP/Z+XFqUC2j
	orgx9bJj962/M9KFVWCJBkkcopnosMWAqtrNE13ZI5geoe0I1h7s
X-Google-Smtp-Source: AGHT+IFoq2gRiQGG5oIEgcijcvj2DmdMuB/z7FUXOVVRbIdCV7ycd0ZhtfLefvJFO/Jrh77UuLSk4w==
X-Received: by 2002:a05:6512:3c86:b0:52c:dccd:39aa with SMTP id 2adb3069b0e04-52ce0646944mr4139613e87.67.1719215707011;
        Mon, 24 Jun 2024 00:55:07 -0700 (PDT)
Message-ID: <d5f7a8bb342cb585e2774395b1ce64dcf5406bd5.camel@gmail.com>
Subject: Re: [XEN PATCH v3] automation/eclair: add deviation for MISRA C
 Rule 17.7
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>, 
 xen-devel@lists.xenproject.org, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>
Date: Mon, 24 Jun 2024 09:55:05 +0200
In-Reply-To: <alpine.DEB.2.22.394.2406211522270.2572888@ubuntu-linux-20-04-desktop>
References: 
	<b571bd05955ab9967a44517c9947545a2a530f01.1718354974.git.federico.serafini@bugseng.com>
	 <alpine.DEB.2.22.394.2406191819370.2572888@ubuntu-linux-20-04-desktop>
	 <alpine.DEB.2.22.394.2406211522270.2572888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-06-21 at 15:24 -0700, Stefano Stabellini wrote:
> On Wed, 19 Jun 2024, Stefano Stabellini wrote:
> > On Fri, 14 Jun 2024, Federico Serafini wrote:
> > > Update ECLAIR configuration to deviate some cases where not using
> > > the return value of a function is not dangerous.
> > >=20
> > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >=20
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> =C2=A0
> I would like to request a release ack, as this patch only affects the
> ECLAIR analysis for R17.7, which is non-blocking anyway (meaning: it
> cannot cause a gitlab-ci failure, it is only informative).
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
>=20
>=20
>=20
> > > ---
> > > Changes in v3:
> > > - removed unwanted underscores;
> > > - grammar fixed;
> > > - do not constraint to the first actual argument.
> > > Changes in v2:
> > > - do not deviate strlcpy and strlcat.
> > > ---
> > > =C2=A0automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
> > > =C2=A0docs/misra/deviations.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++++++++
> > > =C2=A02 files changed, 13 insertions(+)
> > >=20
> > > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > index 447c1e6661..97281082a8 100644
> > > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > @@ -413,6 +413,10 @@ explicit comment indicating the fallthrough
> > > intention is present."
> > > =C2=A0-config=3DMC3R1.R17.1,macros+=3D{hide , "^va_(arg|start|copy|en=
d)$"}
> > > =C2=A0-doc_end
> > > =C2=A0
> > > +-doc_begin=3D"Not using the return value of a function does not
> > > endanger safety if it coincides with an actual argument."
> > > +-config=3DMC3R1.R17.7,calls+=3D{safe, "any()",
> > > "decl(name(__builtin_memcpy||__builtin_memmove||__builtin_memset|
> > > |cpumask_check))"}
> > > +-doc_end
> > > +
> > > =C2=A0#
> > > =C2=A0# Series 18.
> > > =C2=A0#
> > > diff --git a/docs/misra/deviations.rst
> > > b/docs/misra/deviations.rst
> > > index 36959aa44a..f3abe31eb5 100644
> > > --- a/docs/misra/deviations.rst
> > > +++ b/docs/misra/deviations.rst
> > > @@ -364,6 +364,15 @@ Deviations related to MISRA C:2012 Rules:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 by `stdarg.h`.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `deliberate` for ECLAIR.
> > > =C2=A0
> > > +=C2=A0=C2=A0 * - R17.7
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 - Not using the return value of a function =
does not
> > > endanger safety if it
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 coincides with an actual argume=
nt.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR. Such functio=
ns are:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - __builtin_memcpy(=
)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - __builtin_memmove=
()
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - __builtin_memset(=
)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - cpumask_check()
> > > +
> > > =C2=A0=C2=A0=C2=A0 * - R20.4
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - The override of the keyword \"inline=
\" in xen/compiler.h
> > > is present so
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 that section contents chec=
ks pass when the compiler
> > > chooses not to
> > > --=20
> > > 2.34.1
> > >=20
> >=20


