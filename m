Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799675A94A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 10:29:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566485.885353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMP1u-0005mF-9b; Thu, 20 Jul 2023 08:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566485.885353; Thu, 20 Jul 2023 08:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMP1u-0005jb-6h; Thu, 20 Jul 2023 08:28:58 +0000
Received: by outflank-mailman (input) for mailman id 566485;
 Thu, 20 Jul 2023 08:28:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1Sz=DG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qMP1s-0005jJ-7F
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 08:28:56 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76146da0-26d7-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 10:28:53 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so768573e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 01:28:53 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q4-20020ac25284000000b004fdc6f03c6dsm90561lfm.37.2023.07.20.01.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 01:28:52 -0700 (PDT)
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
X-Inumbo-ID: 76146da0-26d7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689841733; x=1690446533;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=smyzLeygPGKA0rC9jUZSOwG5+PJ3VqfR+LpYNKICf34=;
        b=pI0kqj3l2EAq63WBezahXRCys3v7i8qXRkN/sm7J7UTBL7JuA44Mr1M4h2Cbu3mThy
         BJrk1VSLsPNTkCPCIZ41M9Iia4mbDu//5bGwCwH2ie3EtCRxO33/HALdIsl8CUkuIvIr
         z05JYpiJmCBMjZOXFwEzm8s8A+lGnSAG64L+2LODAcIrPFW7CzXpxb3+iMUAmeIc2B4V
         pcRDfO0FrowUnIdRryUeHa8sC8XYJmtcFtzyA2c5kuiVW+jI1mCKCZ7GbVTDfs78HrgC
         1OcX6XWAc/Im9OjrCFvvdj2/PWRQwZqw3h/RcrUlC4RH8n/Sv46A2BqaXF5d2GvnUwie
         G39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689841733; x=1690446533;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smyzLeygPGKA0rC9jUZSOwG5+PJ3VqfR+LpYNKICf34=;
        b=QGSGcI1XiWlef/lAYBWyRneCH2ytviToeNvH8pEUw+WTwIhKrnp40k63SqYc3yy6W1
         KCu+MxlFY4tt/JRkh8hcM3ESRZHHELjTMgkLWUpZSlZ8s+hN0MdoujlnbckQLL5SNze6
         wZ7Dq/znjmain/4YrQNQVufpW9VMwznVJLW8eEsn0TkMQSZj+f4wXZLMb8qzdwRGm11m
         merDeHK7ly/bRfg/juQXg7GDq6B71ZjeC0DSmy0iIlpz0ivTEEM3GAk635J7mdn3hGkr
         wUICkEPrZpEdDMdxo/Ybaz2puIhyaVFHOHkLmQ8LTZYT+0Jd/DdMb+JF6vMT9EtpB0z6
         tXhg==
X-Gm-Message-State: ABy/qLYATb1Q/uyfwSoncFhKEbkedCcEaeE/eMzvp3njsAWbwj0ADt9V
	9AAskpSFzlmpbbtA/N4tFSQ=
X-Google-Smtp-Source: APBJJlGc0NVpS61/F2J2toUyXaVZ6uTBwDHrzOHKT6V9DBWm6LEzHwsLpGgKnkDWpnVPNZy5ui+bGA==
X-Received: by 2002:a19:4409:0:b0:4fb:74d6:6154 with SMTP id r9-20020a194409000000b004fb74d66154mr1527230lfa.37.1689841732873;
        Thu, 20 Jul 2023 01:28:52 -0700 (PDT)
Message-ID: <0cbf6a69e8ae08f6b85edcc4f8d53a84e0103d8b.camel@gmail.com>
Subject: Re: [PATCH v3 3/3] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Thu, 20 Jul 2023 11:28:52 +0300
In-Reply-To: <c1a3d447-4b4d-cd9f-642d-e30fed088302@suse.com>
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
	 <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
	 <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
	 <30540953fb363fce4dfd59f8a7e709247a9872fd.camel@gmail.com>
	 <c1a3d447-4b4d-cd9f-642d-e30fed088302@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-07-20 at 07:58 +0200, Jan Beulich wrote:
> On 19.07.2023 18:35, Oleksii wrote:
> > On Tue, 2023-07-18 at 17:03 +0200, Jan Beulich wrote:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 unsigned long load_end =3D LINK_TO_LOAD(_end);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 unsigned long pt_level_size =3D XEN_PT_LEVEL_SIZE(i
> > > > -
> > > > 1);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 unsigned long xen_size =3D ROUNDUP(load_end -
> > > > load_start, pt_level_size);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 unsigned long page_entries_num =3D xen_size /
> > > > pt_level_size;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 while ( page_entries_num-- )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pgtbl[index++].pte =3D 0;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 break;
> > >=20
> > > Unless there's a "not crossing a 2Mb boundary" guarantee
> > > somewhere
> > > that I've missed, this "break" is still too early afaict.
> > If I will add a '2 MB boundary check' for load_start and
> > linker_start
> > could it be an upstreamable solution?
> >=20
> > Something like:
> > =C2=A0=C2=A0=C2=A0 if ( !IS_ALIGNED(load_start, MB(2) )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printk("load_start shou=
ld be 2Mb algined\n");
> > and
> > =C2=A0=C2=A0=C2=A0 ASSERT( !IS_ALIGNED(XEN_VIRT_START, MB(2) )
> > in xen.lds.S.
>=20
> Arranging for the linked address to be 2Mb-aligned is certainly
> reasonable. Whether expecting the load address to also be depends
> on whether that can be arranged for (which in turn depends on boot
> loader behavior); it cannot be left to "luck".
Maybe I didn't quite understand you here, but if Xen has an alignment
check of load address then boot loader has to follow the alignment
requirements of Xen. So it doesn't look as 'luck'.

>=20
> > Then we will have completely different L0 tables for identity
> > mapping
> > and not identity and the code above will be correct.
>=20
> As long as Xen won't grow beyond 2Mb total. Considering that at
> some point you may want to use large page mappings for .text,
> .data, and .rodata, that alone would grow Xen to 6 Mb (or really 8,
> assuming .init goes separate as well). That's leaving aside the
> realistic option of the mere sum of all sections being larger than
> 2. That said, even Arm64 with ACPI is still quite a bit below 2Mb.
> x86 is nearing 2.5 though in even a somewhat limited config;
> allyesconfig may well be beyond that already.
I am missing something about Xen size. Lets assume that Xen will be
mapped using only 4k pagees ( like it is done now ). Then if Xen will
be more then 2Mb then only what will be changed is a number of page
tables so it is only question of changing of PGTBL_INITIAL_COUNT ( in
case of RISC-V).

Could you please explain why Xen will grow to 6/8 MB in case of larger
page mappings? In case of larger page mapping fewer tables are needed.
For example, if we would like to use 2Mb pages then we will stop at L1
page table and write an physical address to L1 page table entry instead
of creating new L0 page table.

>=20
> Of course you may legitimately leave dealing with that to the
> future.
Then I'll send new patch series with updated alignment requirements.

~ Oleksii

