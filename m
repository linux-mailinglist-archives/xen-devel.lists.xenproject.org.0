Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07A487C184
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 17:48:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693394.1081406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkoFh-00065H-E9; Thu, 14 Mar 2024 16:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693394.1081406; Thu, 14 Mar 2024 16:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkoFh-00063V-BV; Thu, 14 Mar 2024 16:48:21 +0000
Received: by outflank-mailman (input) for mailman id 693394;
 Thu, 14 Mar 2024 16:48:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ7k=KU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rkoFf-00063P-Kd
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 16:48:19 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a87019b4-e222-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 17:48:18 +0100 (CET)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-609f060cbafso14318067b3.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 09:48:18 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a81ac47000000b00607b9efdf49sm344264ywj.2.2024.03.14.09.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 09:48:16 -0700 (PDT)
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
X-Inumbo-ID: a87019b4-e222-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710434897; x=1711039697; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZrtCJv4jEEbuCG8j1AngvJejGsg0ASv5ZPzIuzlQyBw=;
        b=lyetR0FdOCi4aaqoQR5PrDofxluTK2xV0Wxpizc48pnOrkI22YzG/owLn6RoIVVALd
         UK6S+78CU69hwMPhoxUkkkdXtfsnJA6UzkVJijhA1TGKjFiyS7bZRjfcctFP2Q+m5bvv
         NI/wufZgfRC+CxHry/322ZQKdrEPNKi7apYDO85vb8OUX2/qaPTlH9Jj6F/E91t67v5w
         IFkkdVoV1r7r1+UddU6LvBliz+BptlAZnJbcd93opHUOgSoydMZGKZoShCavqWeNrhZO
         kKEAgFEXGx6az+g3+pSjQYBroLbZTXX0xh5Pqt9A4hOD4XtK7l2/enCI1bj6mGI+keTb
         EtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710434897; x=1711039697;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrtCJv4jEEbuCG8j1AngvJejGsg0ASv5ZPzIuzlQyBw=;
        b=uCpPiS0wjNjsN/Ltgn1sYHFqIe7lqZbj7DZUnjP7f5sLRAaHY2fByaurF//JCH4GQ+
         QMbYxkASkkzKfGTPD3QXDPBfZLKgiokTJun9fEV30Ps4s5t4m07f0MM027Y7OdbfvhR6
         3aMQEQygQPz1hQWGuq9ZPbZ0SY+dGrxSikyNBnZ1ffJVGZ5qoOvkjdjLQ8URfYa7m2Rm
         bwZBApOJHlyT36OroUKe5QWnbGXL8QpMaSae1xocmjYSa90YuQkzAwHslFeV3z/yfITQ
         28/ER7kxbbXXCEYh5ZR94iD0f6oPzfS6C7Q6hKre8LKrVy5Ifn9JJQ/k87T5GlQiX09N
         J/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUIPZi58lj0GNAFvIJ66Q5sZZyfIFgRZa9SgDLsI3u4XiaDMdq2PfzF99AMwNnxtaruLPdNMNcxJnCsduahXrox/NW/JIbhU9vd5N76HYk=
X-Gm-Message-State: AOJu0Yw5dmBD0teY4PLi4uj8Slr2F4yFIMiwkDpNVekWSzjWXWHfuynR
	89hrMAgZ+hagsIjvF9RjOb3DDuQcGp3Z5xx+IoEI+gyEnmKfJZFL
X-Google-Smtp-Source: AGHT+IHZZxsQ0foAXkw5kfSM5tw8VR+078au92m/r4jWIbyvf83eR1WEvQALFVfz8gF4iOuqrqAwuQ==
X-Received: by 2002:a81:b61a:0:b0:60c:d230:49d0 with SMTP id u26-20020a81b61a000000b0060cd23049d0mr1258420ywh.2.1710434897254;
        Thu, 14 Mar 2024 09:48:17 -0700 (PDT)
Message-ID: <d3da33b6ef88eac4316061c3c9e7b97fcc97c522.camel@gmail.com>
Subject: Re: [PATCH 6/7] xen: Swap find_first_set_bit() for ffsl() - 1
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>, "consulting @ bugseng .
 com" <consulting@bugseng.com>, Simone Ballarin
 <simone.ballarin@bugseng.com>,  Federico Serafini
 <federico.serafini@bugseng.com>, Nicola Vetrini
 <nicola.vetrini@bugseng.com>, Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 14 Mar 2024 17:48:12 +0100
In-Reply-To: <ba0552cc-10eb-460d-89a1-ffc43fe75542@suse.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
	 <20240313172716.2325427-7-andrew.cooper3@citrix.com>
	 <ba0552cc-10eb-460d-89a1-ffc43fe75542@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-03-14 at 15:30 +0100, Jan Beulich wrote:
> On 13.03.2024 18:27, Andrew Cooper wrote:
> > --- a/xen/drivers/passthrough/x86/iommu.c
> > +++ b/xen/drivers/passthrough/x86/iommu.c
> > @@ -641,7 +641,7 @@ struct page_info *iommu_alloc_pgtable(struct
> > domain_iommu *hd,
> > =C2=A0=C2=A0=C2=A0=C2=A0 if ( contig_mask )
> > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* See pt-contig-marke=
rs.h for a description of the marker
> > scheme. */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i, shift =3D f=
ind_first_set_bit(contig_mask);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i, shift =3D f=
fsl(contig_mask) - 1;
>=20
> The need for subtracting 1 is why personally I dislike ffs() / ffsl()
> (and
> why I think find_first_set_bit() and __ffs() (but no __ffsl()) were
> introduced).
>=20
> But what I first of all would like to have clarification on is what
> your
> (perhaps just abstract at this point) plans are wrt ffz() / ffzl().
> Potential side-by-side uses would be odd now, and would continue to
> be odd
> if the difference in bit labeling was retained. Since we're switching
> to
> a consolidated set of basic helpers, such an anomaly would better not
> survive imo.
Right now, ffz() is defined as __ffs(~(x)), so and it seems to me
__ffs()/ffz() exist only as a Linux compatible, so I wanted as a part
of RISC-V patch series put into xen/linux-compat.h and just include
this header where it will be necessary:

#define __ffs(x) (ffs(~(x)) - 1)
#define ffz(x) __ffs(~(x))

Why should we care about ffzl()? It is not used in Xen, is it?

~ Oleksii



