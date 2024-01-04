Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFF0823F53
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 11:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661473.1031180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLKjs-0003vA-CX; Thu, 04 Jan 2024 10:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661473.1031180; Thu, 04 Jan 2024 10:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLKjs-0003sM-9f; Thu, 04 Jan 2024 10:14:12 +0000
Received: by outflank-mailman (input) for mailman id 661473;
 Thu, 04 Jan 2024 10:14:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Jyd=IO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rLKjr-0003sG-B4
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 10:14:11 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0084ea43-aaea-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 11:14:10 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2cce6bb9b48so3729131fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 02:14:10 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a2ea5c4000000b002cd0651db11sm1671512ljp.50.2024.01.04.02.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 02:14:09 -0800 (PST)
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
X-Inumbo-ID: 0084ea43-aaea-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704363250; x=1704968050; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zw1LvQiWrC4tM8/3EvC/l4uZmCCd2VC/xJIGQf4sNW0=;
        b=NDmmcJxwBTktaR3LbJDO11fD/e0e2hOk6TM90+5xo0ErSoc7t5J2IkGH07ogk53DiR
         SkMwEl1WDW9MWE+1kUn/Xb2FeIa9IW94rrpIb3WZvcAMkroIddNs8UvRq4yqxTSM8T6r
         MebRlxlUuZogRgP5BXGQ9pD3gu5V0E3GMFiubGysRECqqh8+DIQCMMfQQ4vz06nqkmSv
         LtKyPovYFeLx2ix7RSrM0Oa9MnPk3SPzbHt2zy+eEIuUgj93Evd3BxdfTYKKMnW1aK5G
         HRbDuX1K1yW68/0boi4ppK3zBJtXoVnM3Fh1u5fXpw8fhhHemRSp6ufTbJy4Q2+fdVLT
         zIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704363250; x=1704968050;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zw1LvQiWrC4tM8/3EvC/l4uZmCCd2VC/xJIGQf4sNW0=;
        b=w4GDKQcIJVGP35lfRQvdd8I+ZhNdJdR+1Iy3WGcQgKIh3yvkPM58ueQrBUgQKh9CMi
         Nly+ArqiBzr0ZDmWnhnjeL0nBBaYVJPAu29M39yh0ijDIdQUHPak4qQ3qPGtxAFZhoz+
         o75bMM8Wxt8yZ2+0nrdwrvC5W48OWvtSS5GqprQjRS5eiaSMFQ9bt61S4hpkqud2084f
         CPB9gsXf+1XLbxjlk4C70xJDdJquDCO6NYX4WsXmbQdCR0Mst6//JqgpzySdqmo+dPi5
         kl2Ug9YJu8rC6HEcvUYQoKC2lYpXIVEdx91GimopcOXsaMJUHZOAZKLtGs8uHDq0XIC2
         EPXA==
X-Gm-Message-State: AOJu0Yxe7dmHtqJqCNJpBBVPstqFJUowCtJ2Jd2906uHm2leQKZnhi++
	zvyvOW/6WnUqe6QzJPvtU08=
X-Google-Smtp-Source: AGHT+IEKHf9w29QHGu7PY/MSe7A004witrqud/4EIM9MrkNeOvm/tIZMVF345g6K2yPhJMoqbtdXHA==
X-Received: by 2002:a05:651c:1992:b0:2cd:122a:7ed4 with SMTP id bx18-20020a05651c199200b002cd122a7ed4mr140659ljb.8.1704363249646;
        Thu, 04 Jan 2024 02:14:09 -0800 (PST)
Message-ID: <5055a7085e00725394210b5907abbeb8693cca31.camel@gmail.com>
Subject: Re: Xen 4.19 release schedule proposal
From: Oleksii <oleksii.kurochko@gmail.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: community.manager@xenproject.org, julien@xen.org,
 sstabellini@kernel.org,  Bertrand.Marquis@arm.com,
 andrew.cooper3@citrix.com, jbeulich@suse.com,  roger.pau@citrix.com,
 anthony.perard@citrix.com, george.dunlap@cloud.com,  Wei.Chen@arm.com
Date: Thu, 04 Jan 2024 12:14:08 +0200
In-Reply-To: <9637302c-9fcf-46c5-9b70-ec44cd25f89d@suse.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
	 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
	 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
	 <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
	 <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
	 <67bf2be7-53f4-40d0-a856-8ae631a054b0@suse.com>
	 <955e9b02-20bd-4279-9f60-bb757cdf1a03@xen.org>
	 <0f729b61-b839-48f6-89ae-b5570b1eae0b@xen.org>
	 <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>
	 <9637302c-9fcf-46c5-9b70-ec44cd25f89d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-01-03 at 06:53 +0100, Juergen Gross wrote:
> On 02.01.24 17:59, Oleksii wrote:
> > Dear community,
> >=20
> > Wishing you a Happy New Year!
> >=20
> > I'd like to propose the release schedule for Xen 4.19.
> >=20
> > Based on the previous release schedules [1] and [2], it seems the
> > next
> > release date should be on Wednesday, July 10, 2024:
> >=20
> > ** Proposed option: Wed Jul 10, 2024 **
> > (+9 months from Xen 4.18 release)
> >=20
> > - Last posting date=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Fri Apr 26, 2024
> >=20
> > Patches adding new features are expected to be posted to the
> > mailing
> > list by this date, although perhaps not in their final version.
> >=20
> > - Feature freeze=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Fri May 17, 2024 (+3 weeks from Last
> > posting date)
> >=20
> > Patches adding new features should be committed by this date.
> > Straightforward bugfixes may continue to be accepted by
> > maintainers.
> >=20
> > - Code freeze=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fri May 31, 2024 (+2 weeks from
> > Feature
> > freeze)
> >=20
> > Bugfixes only.
> >=20
> > - Hard code freeze=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Fri Jun 21, 2024 (+3 weeks from Code
> > freeze)
> >=20
> > Bugfixes for serious bugs (including regressions), and low-risk
> > fixes
> > only.
> >=20
> > - Final commits=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Fri Jul 05, 2024 (+2 weeks from Hard
> > code
> > freeze)
> >=20
> > Branch off staging-4.19.
> >=20
> > - Release=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Wed Jul 10, 2024
> >=20
> > If there are no objections, we will stick to the proposed schedule.
> >=20
> > One more thing I'd like to discuss is whether to add a file
> > (RELEASE.md) with the release schedule to the source code or update
> > an
> > existing one (xen-release-management.pandoc). I think it will help
> > to
> > find the final release schedule for the nearest release. For
> > example,
> > for the previous release, there are a lot of emails with proposed
> > schedules, polls of Xen release schedules, and I found the final
> > release schedule in just one of the replies (but probably I missed
> > something).
>=20
> What about putting it into the wiki under
> Xen_Project_X.YY_Release_Notes?
> That way it would already be accessible via SUPPORT.md (in the wiki
> under
> https://xenbits.xen.org/docs/unstable-staging/support-matrix.html=C2=A0).
It makes sense to me. Thanks.

~ Oleksii

