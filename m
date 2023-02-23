Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FE16A0A51
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 14:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500363.771704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBSC-00080m-E1; Thu, 23 Feb 2023 13:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500363.771704; Thu, 23 Feb 2023 13:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBSC-0007y1-AN; Thu, 23 Feb 2023 13:16:08 +0000
Received: by outflank-mailman (input) for mailman id 500363;
 Thu, 23 Feb 2023 13:16:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxRn=6T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVBSA-0007xv-5P
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 13:16:06 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a2bc05f-b37c-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 14:16:05 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id s20so13424452lfb.11
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 05:16:05 -0800 (PST)
Received: from [192.168.8.199] (46.204.108.92.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.92]) by smtp.gmail.com with ESMTPSA id
 v29-20020a056512049d00b004d9fe9744f8sm1177071lfq.191.2023.02.23.05.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 05:16:04 -0800 (PST)
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
X-Inumbo-ID: 3a2bc05f-b37c-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t9yAfdDqv0xKhSbez5z/iWeMjANzbF54s3zlwuoeKZI=;
        b=mZp911MUASCirEX4RHGRu2Y5dw5U1UoRdGpBbatQAgtQ9chCbKPhul73pmVq18DK5C
         I5cx0nkC2DB/bprjMI1bSc6MCxXhxEdK4ahOFt2mhKobLbv/qs2tBIlk1HC/0qf6Nwr6
         tCZZxYHkWNje5CM7tHncpDGgJACAYXFySneisZhZ1me3Ly/n07WKmM3lTolvX2wup7Hw
         KrUcHBnMIPZt4uAiCm89sdPiH961FfQOZOed+oEII6URcDNNSV+9Gi3AHCFI6tmgDnLG
         G0oXcQj1NQ2FqgIRopPiZlWngEInhXeHmLqTsVcWTPp+MHPY3xsogeWHRTXskSPdyeUl
         U0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t9yAfdDqv0xKhSbez5z/iWeMjANzbF54s3zlwuoeKZI=;
        b=MAdg0mknPRyZx4ngDGCy1Gq2zE3k3RE4R3tpJ7ngZa1IOgE2hhShzgivl7FAQkPYCj
         Mr80OfOSeOD+PEElauFS9Y+lBYblrHnF3ssF2mx9Cxlzg+bPasZxHHpEZMtQkDcshBCZ
         A2/22xbh5txYQ0Ea3+aPChrzLLDI3oMVtwW+vW1CLmS/nlhRdjD/iyVQ7OeWa2r0PHBi
         szPNsbp/AMk6/FQ5Z5WNQhukLtb4OqcbGA8r9kKZKdOnz7BNKJOFfMuP8IO2rIdmqiDD
         WvJLKqiOl6+FKV4sJnhf+/1djzWM74WIzhC+bUH7dSyn8gbQE9KAL8C2wLzZnyEOnbvu
         9m/A==
X-Gm-Message-State: AO0yUKW7vmXNpbjthf4F4GXH/iVM46ftbsrEuRkrqDV43RVch1hCR9II
	4cducWiHPayTYONwb07OcUI=
X-Google-Smtp-Source: AK7set+D5OmadfHXSTR8MBary2sVaUzxspQmnaQ7euPRrdOysz+g04KOOf2khxrRa88MQBrt1CY+9Q==
X-Received: by 2002:ac2:44c7:0:b0:4db:297b:5cbe with SMTP id d7-20020ac244c7000000b004db297b5cbemr3524423lfm.34.1677158164825;
        Thu, 23 Feb 2023 05:16:04 -0800 (PST)
Message-ID: <9d2bbf1821459cbc5c294261a34728cd8aaf99c1.camel@gmail.com>
Subject: Re: [PATCH v2 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Thu, 23 Feb 2023 15:16:02 +0200
In-Reply-To: <214973b0-5fe7-9208-2cfc-dd2884583157@suse.com>
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
	 <aa0d3704921f5ec04b66c8aa935638a64018c50b.1676909088.git.oleksii.kurochko@gmail.com>
	 <214973b0-5fe7-9208-2cfc-dd2884583157@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(const struct cpu=
_user_regs *) =3D (void *)regs-
> > >BUG_FN_REG;
>=20
> ... this, wouldn't it be better (and independent of the specific
> arch) if
> you checked for BUG_FN_REG being defined?
>=20
> Another (#ifdef-free) variant would be to have bug_ptr() take a 2nd
> argument
> and then uniformly use ...
>=20
> > +#else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(const struct cpu=
_user_regs *) =3D bug_ptr(bug);
>=20
> ... this, slightly altered to
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(const struct cpu_us=
er_regs *) =3D bug_ptr(bug,
> regs);
I think that I will go with BUG_FN_REG instead of changing bug_ptr()'s
arguments as bug_ptr() is used below to get file name so it won't be
clear what bug_ptr() should return either an address of file name or
regs->BUG_FN_REG.
>=20
> > +#endif
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn(regs);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /* WARN, BUG or ASSERT: decode the filename pointer=
 and line
> > number. */
> > +=C2=A0=C2=A0=C2=A0 filename =3D bug_ptr(bug);
> > +=C2=A0=C2=A0=C2=A0 if ( !is_kernel(filename) && !is_patch(filename) )
>=20

~ Oleksii


