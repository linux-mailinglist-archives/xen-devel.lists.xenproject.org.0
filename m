Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B7A9478FF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 12:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771968.1182400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saua8-0006dp-GD; Mon, 05 Aug 2024 10:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771968.1182400; Mon, 05 Aug 2024 10:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saua8-0006bY-Bu; Mon, 05 Aug 2024 10:04:48 +0000
Received: by outflank-mailman (input) for mailman id 771968;
 Mon, 05 Aug 2024 10:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=006L=PE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1saua6-0006bQ-U1
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 10:04:46 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 247644a3-5312-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 12:04:45 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7d89bb07e7so857009466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 03:04:45 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d4392bsm433366866b.108.2024.08.05.03.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 03:04:44 -0700 (PDT)
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
X-Inumbo-ID: 247644a3-5312-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722852285; x=1723457085; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iOH2UfWF4WwNhd7gGYP5371pLuNg59MCHPKE+ev/Nzk=;
        b=K6g4Fd2Q9P57GR1NUBAP3Is5jTkJXgngWH1F3P8jxOb0nZRC9uvT2SWen4aupZaKzw
         LEXlbEwCkPSsVzJl2Sf1sp+Fk3r+WBpw4CYUzpYLMkBAyDdwg5GPdlrTMhp4DPKRSgSy
         NkqdggPN+dGz/VULnmaxXAyDQdpism2iaIBhRJLp3GbekldAzuT5vbxC5/DhPO8gdrIn
         +3ZlAU87akcD6hvYQ0mmUyageHuVgTZmjVF06Bzhrus08X/rQmB7xuzCTt9rwyRVNMV0
         VJQcFogO8ti8A4SKBRkFUX+Mn++TQSjwepBl4vfDWDoiDuTNLVHwvhrACSjyDU3uM/Fx
         PU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722852285; x=1723457085;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iOH2UfWF4WwNhd7gGYP5371pLuNg59MCHPKE+ev/Nzk=;
        b=rkWTTGn9o4pIVy9qietO9yhLc6C4/K1E3re8vTiYrM0RgldL1mG7OiYBUpCeD1W0gk
         M1DLqw9MsF1O68dVBiOvwWnQlWhnPYDW1BYH6Pa6FGCERC9pEpOQWFjXJZJLfRKCeayl
         kR560H9NdURRKQo2kiTKkJItlWWYti7GWVQsa7x/OfThWULleaULXxLtgwJ/+SszpFbz
         l1cOsQT4WeahfFX5eO+ro2imR3FQ0Enu5D+V4jahsPZlZsARx+TCSDgSCEWKIEd403Ws
         KSSs7YrF2fPtkMQZqu/wz2dlhOvjno090/V+vxBEbIPLl7Z0zUlk1TNjREQaKRWUC8kx
         DOiA==
X-Forwarded-Encrypted: i=1; AJvYcCVjlSCidAC8QJpCJ+e7xXUiNEB2tj+rsWCEtXExClRknPKOT0JftrjBirltJ33uzuUhzFUSMSqDlRqVRSMhMdATtEsFUxFFr96itytAE2w=
X-Gm-Message-State: AOJu0YysquQ9U9P7p62WD1LEoK5OOv2Wfql1IdPfBZ46LafwZDodc04N
	xI/K5LczkAQNiSMYoUw8Wh5Ywd22cIFDhfy7ECov1qVtmEhDJuxt
X-Google-Smtp-Source: AGHT+IF6jwQwwtLGwqhNcoCH3VH69bxffZipEnEG0gX50Ylm2uvvCd6YHrSJYvo3aM2u1f+zvZM+zw==
X-Received: by 2002:a17:907:934a:b0:a7a:a5ed:43d0 with SMTP id a640c23a62f3a-a7dc5071046mr856632966b.47.1722852285123;
        Mon, 05 Aug 2024 03:04:45 -0700 (PDT)
Message-ID: <ca3829ee2de52277c2f6ad0aa400405895dbeee3.camel@gmail.com>
Subject: Re: [PATCH v7 2/9] xen/common: Move Arm's bootfdt.c to common
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>
Date: Mon, 05 Aug 2024 12:04:44 +0200
In-Reply-To: <4af8ef8c-b3c1-48b4-930b-72f8ef7d26d7@xen.org>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <35558886445c39c0f570632d355b42bb764dbdc4.1721834549.git.oleksii.kurochko@gmail.com>
	 <4af8ef8c-b3c1-48b4-930b-72f8ef7d26d7@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hi Julien,

On Mon, 2024-08-05 at 10:31 +0100, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 24/07/2024 16:31, Oleksii Kurochko wrote:
> > From: Shawn Anastasio <sanastasio@raptorengineering.com>
> >=20
> > Move Arm's bootfdt.c to xen/common so that it can be used by other
> > device tree architectures like PPC and RISCV.
> >=20
> > Suggested-by: Julien Grall <julien@xen.org>
> > Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> > Acked-by: Julien Grall <julien@xen.org>
>=20
> On Matrix you asked me to review this patch again. This wasn't
> obvious=20
> given you kept my ack. If you think a review is needed, then please=20
> either drop the ack or explain why you keep it and ask if it is fine.
>=20
> Also, I tend to list in the changes where this was acked. In this
> case,=20
> you said I acked v4.
>=20
> Anyway, before confirming my ack, I would like to ask some
> clarification.
>=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V7:
> > =C2=A0 - Nothing changed. Only rebase.
> > ---
> > Changes in V6:
> > =C2=A0 - update the version of the patch to v6.
> > ---
> > Changes in V5:
> > =C2=A0 - add xen/include/xen/bootfdt.h to MAINTAINERS file.
>=20
> I don't see any change in MAINTAINERS within this patch. Did you
> happen=20
> to copy/paste all the changes made in the series?
This change should be mentioned in this patch. It is part of the
previous patch (
https://lore.kernel.org/xen-devel/102f8b60c55cdf2db5890b9fb1c2fb66e61c4a67.=
1721834549.git.oleksii.kurochko@gmail.com/
)

>=20
> In fact the only change related to this patch doesn't seem to be
> listed.
>=20
> [...]
>=20
> > +#ifndef CONFIG_STATIC_SHM
> > +static inline int process_shm_node(const void *fdt, int node,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t addre=
ss_cells,
> > uint32_t size_cells)
> > +{
> > +=C2=A0=C2=A0=C2=A0 printk("CONFIG_STATIC_SHM must be enabled for parsi=
ng static
> > shared"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " m=
emory nodes\n");
> > +=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > +}
> > +#endif
>=20
> I see you duplicated the stub from arch/arm/include/static-shmem.h.
> But=20
> the one in static-shmem.h will now be unreachable. I think it needs
> to=20
> be removed.
Overlooked that. Originally I added that to make Xen RISC-V and PPC
build happy as early_scan_node() code uses process_shm_node():
   static int __init early_scan_node(const void *fdt,
                                     int node, const char *name, int
   depth,
                                     u32 address_cells, u32 size_cells,
                                     void *data)
   {
   ...
       else if ( depth =3D=3D 2 && device_tree_node_compatible(fdt, node,
   "xen,domain") )
           rc =3D process_domain_node(fdt, node, name, address_cells,
   size_cells);
       else if ( depth <=3D 3 && device_tree_node_compatible(fdt, node,
   "xen,domain-shared-memory-v1") )
           rc =3D process_shm_node(fdt, node, address_cells, size_cells);
  =20
       if ( rc < 0 )
           printk("fdt: node `%s': parsing failed\n", name);
       return rc;
   }

Instead of introducing stub for process_shm_node() when
CONFIG_STATIC_SHM I think it would be better to add "#ifdef
CONFIG_STATIC_SHM" to early_scan_node():

   static int __init early_scan_node(const void *fdt,
                                     int node, const char *name, int
   depth,
                                     u32 address_cells, u32 size_cells,
                                     void *data)
   {
   ...
       else if ( depth =3D=3D 2 && device_tree_node_compatible(fdt, node,
   "xen,domain") )
           rc =3D process_domain_node(fdt, node, name, address_cells,
   size_cells);
   #ifdef CONFIG_STATIC_SHM
       else if ( depth <=3D 3 && device_tree_node_compatible(fdt, node,
   "xen,domain-shared-memory-v1") )
           rc =3D process_shm_node(fdt, node, address_cells, size_cells);
   #endif
  =20
       if ( rc < 0 )
           printk("fdt: node `%s': parsing failed\n", name);
       return rc;
   }

>=20
> Also, I think this change deserve an explanation in the commit
> message.
If the option I mentioned above looks okay then definitely I have to
mentioned that in commit message.

Thanks.

~ Oleksii

>=20
> [...]
>=20
> > +static void __init early_print_info(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 const struct membanks *mi =3D bootinfo_get_mem();
> > +=C2=A0=C2=A0=C2=A0 const struct membanks *mem_resv =3D bootinfo_get_re=
served_mem();
> > +=C2=A0=C2=A0=C2=A0 struct bootmodules *mods =3D &bootinfo.modules;
> > +=C2=A0=C2=A0=C2=A0 struct bootcmdlines *cmds =3D &bootinfo.cmdlines;
> > +=C2=A0=C2=A0=C2=A0 unsigned int i;
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( i =3D 0; i < mi->nr_banks; i++ )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("RAM: %"PRIpaddr" - =
%"PRIpaddr"\n",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mi->bank[i].start,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mi->bank[i].start + mi->bank[i].size - 1);
> > +=C2=A0=C2=A0=C2=A0 printk("\n");
> > +=C2=A0=C2=A0=C2=A0 for ( i =3D 0 ; i < mods->nr_mods; i++ )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("MODULE[%d]: %"PRIpa=
ddr" - %"PRIpaddr" %-12s\n",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 i,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mods->module[i].start,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mods->module[i].start + mods->module[i].size,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 boot_module_kind_as_string(mods->module[i].kind));
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( i =3D 0; i < mem_resv->nr_banks; i++ )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk(" RESVD[%u]: %"PRIpa=
ddr" - %"PRIpaddr"\n", i,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 mem_resv->bank[i].start,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 mem_resv->bank[i].start + mem_resv->bank[i].size -
> > 1);
> > +=C2=A0=C2=A0=C2=A0 }
> > +#ifdef CONFIG_STATIC_SHM
> > +=C2=A0=C2=A0=C2=A0 early_print_info_shmem();
> > +#endif
>=20
> Similar remark here.
>=20
> Cheers,
>=20


