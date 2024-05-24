Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E898CE2B4
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 10:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729190.1134304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAQlW-0006Tk-OY; Fri, 24 May 2024 08:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729190.1134304; Fri, 24 May 2024 08:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAQlW-0006Qh-LM; Fri, 24 May 2024 08:59:06 +0000
Received: by outflank-mailman (input) for mailman id 729190;
 Fri, 24 May 2024 08:59:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqrK=M3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sAQlU-0006Q7-Jk
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 08:59:04 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcb9bcad-19ab-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 10:59:00 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2e52181c228so84190861fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 01:59:00 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcc4a5esm1150761fa.17.2024.05.24.01.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 01:58:59 -0700 (PDT)
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
X-Inumbo-ID: dcb9bcad-19ab-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716541140; x=1717145940; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TE++0mqN830mI0zg2Twwha2LqgPNu+D/hgMhSYXEPEc=;
        b=CreWCAzCYO8zcDD2+mpRWp/n/4Ta9wLNugC2Z4zE5UGSyycAehneIP0tS8ioExDx68
         wL7jIW/CwiIShL6sW/LePjikVslRenop5bv6zmhcLyQKS/wHGKMpombUaPDFjNrv4zJ1
         pRMsRnVqw4470EpXbQJntajrLucK5L3So/uyBesCtnrPWPkUM9MrOxKJtHNq+Xsnm6eO
         Y1rc57V2bbRidAmxgclydIaR0Dh0Rp4Igh8RQu2Mn5sJflNduWbrYwcAKsktSCNEezEK
         0yISjOi4aqyZai3m6SX3RPMgYsGvIRweN9AEOkHmld6fbtUk2YoZ9xQHzCKuKW7+gDH0
         uypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716541140; x=1717145940;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TE++0mqN830mI0zg2Twwha2LqgPNu+D/hgMhSYXEPEc=;
        b=QPWInHJBCZmYFcmYN/u1rbUfmtnLLK5vUX/t2mu37SWFlY1zlylKC2F90dJqFSpTDs
         swUMI6FMHrluHGQ98JP54xVxQNg/7ZYoEGQ/4wmoLaSNVQkPr3Cqb8bb/Ovz/cNlmClW
         4MBd/OZdTHKEsMlezwpjW4V+O4FuplwUvvfDf8l0qL5/4WROhBTdaNww1No3VC15CAeC
         1uBE27UE4PLfzUemLIukcpvlEtcUMzCEW4LjGA0etx/+r6I2HpXYGYZf6RDCRYWTmI2h
         3n2yMg1lwN+7ieoys3Oc5lKsiJeFJ17qspG6FQRcI+aWFLjkLx5SAOHZxgfT1xfZ1jvC
         xAUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWme8tL0EvyCie27ASo7iOYllPetp3drsubTa0FgoVLHPzWaNEGHDtn62SQVusMJCjpU1rSHn8dBUePJGuNiLuPvmC9wIbFcJ4JfwvUOpU=
X-Gm-Message-State: AOJu0YzPhkggtL0pZLcT0xgo1xF/BUpVZDegaJRcTa/kqvFpMI2WeYhq
	qv+4poOMAEHk3rYVVJDLsgXovZHSgAAQkEA6DWSdhI2Dyaz+LZ6x
X-Google-Smtp-Source: AGHT+IHkni//8e/T8wQnYgjD9Z35amuMBlrv2KQoD1BxDfFiT9oRX8c00EbbRVVGAVqOAmK1U5JPpg==
X-Received: by 2002:a2e:bc08:0:b0:2e9:570e:1cf with SMTP id 38308e7fff4ca-2e95b3089d9mr10591321fa.52.1716541139842;
        Fri, 24 May 2024 01:58:59 -0700 (PDT)
Message-ID: <82b8828112ffb05170472310d7d510ceb4edc555.camel@gmail.com>
Subject: Re: [PATCH v10 02/14] xen: introduce generic non-atomic test_*bit()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Date: Fri, 24 May 2024 10:58:58 +0200
In-Reply-To: <a535a3fc-5b90-454f-8d3f-202de631bc49@xen.org>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
	 <219df9d840a183fc55de02aff011c0972a68587c.1715952103.git.oleksii.kurochko@gmail.com>
	 <1554d534-7998-4ad4-9218-579b2568b744@xen.org>
	 <9f02d973c2520d36ee33d01b871378de16ede4d0.camel@gmail.com>
	 <a535a3fc-5b90-454f-8d3f-202de631bc49@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-23 at 15:33 +0100, Julien Grall wrote:
> > > > =C2=A0 =C2=A0 #include <asm/bitops.h>
> > > > =C2=A0=C2=A0=C2=A0=20
> > > > +/**
> > > > + * generic__test_and_set_bit - Set a bit and return its old
> > > > value
> > > > + * @nr: Bit to set
> > > > + * @addr: Address to count from
> > > > + *
> > > > + * This operation is non-atomic and can be reordered.
> > > > + * If two examples of this operation race, one can appear to
> > > > succeed
> > > > + * but actually fail.=C2=A0 You must protect multiple accesses wit=
h
> > > > a
> > > > lock.
> > > > + */
> > >=20
> > > Sorry for only mentioning this on v10. I think this comment
> > > should be
> > > duplicated (or moved to) on top of test_bit() because this is
> > > what
> > > everyone will use. This will avoid the developper to follow the
> > > function
> > > calls and only notice the x86 version which says "This function
> > > is
> > > atomic and may not be reordered." and would be wrong for all the
> > > other arch.
> > It makes sense to add this comment on top of test_bit(), but I am
> > curious if it is needed to mention that for x86 arch_test_bit() "is
> > atomic and may not be reordered":
>=20
> I would say no because any developper modifying common code can't=20
> relying it.
But won't then be confusion that if not generic implementation of
test_bit() is chosen then test_bit() can be " atomic and cannot be
reordered " ( as it is in case of x86 )?

~ Oleksii


