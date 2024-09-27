Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A830A988119
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 11:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806126.1217445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su6xH-0002Ok-OW; Fri, 27 Sep 2024 09:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806126.1217445; Fri, 27 Sep 2024 09:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su6xH-0002Li-Ln; Fri, 27 Sep 2024 09:08:03 +0000
Received: by outflank-mailman (input) for mailman id 806126;
 Fri, 27 Sep 2024 09:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1su6xG-0002Lc-Sh
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 09:08:02 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fec196c4-7caf-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 11:08:00 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so259282966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 02:08:00 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c5ae5sm106505966b.63.2024.09.27.02.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 02:07:59 -0700 (PDT)
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
X-Inumbo-ID: fec196c4-7caf-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727428080; x=1728032880; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/jWfRDwdK3I+BsHLD07sB8M0QkuAAk9BM3lVtAk7JiA=;
        b=eEC33AL2pTiJGHQ0Qau7MH22Wa5GMMeM9vK3DHoy4Irp9DWcMfmRBGHaX8v4w7KMiS
         4bjqp3kN5Eco7MdeonlpTNE5zxuHgO5/FIHZdmmWqIjMaujxE4Bale/SYLDwGgNQzvKq
         qBalvG9jrRB3I1uZ93hP5rQZJ+UI4x/vkwmB7C/S4WwgLggZlBDgcA0rWHWqngNKGE0M
         5HhNXDFOXRiy4103hEu0mVcl2p2laAm0GrDKBGWe+gA/6hUnjjoIFC8w4tJvR5IokbPR
         dVPP6otvn/jeR1zrF79sjRVHvDdq7xZr+rSJbx8vcJty+Jpu1WNluN29K9hRrBdiBZfi
         GhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727428080; x=1728032880;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/jWfRDwdK3I+BsHLD07sB8M0QkuAAk9BM3lVtAk7JiA=;
        b=klownXcGi4hh+JjoqK8KXKOKdFAh9BqYcMhMYf+X5cBVmzXYRYpVRmNEHjA66U3t5v
         PwP+Xd1f3LoFAt1fI6awUPPQkKLTSLvJPjyzwL0TH0DmtT5wuaCKzcC2g9JTwixsw7NK
         +W7QbRTUEayi1OgXU31jfFzDTWYKBc47tWNCa+p/JbT8PEe1uttEcS1S9dE1SSp/yKv/
         IjHHChn749A+ANgtSL9Rrnm8d1NUzxAwRJyd2/68rzgRgxD7fQOZqNeQ+idO8/1j0Vc2
         DjZM6Ouo0ShVPCUd/k5rTGpSpmTMAD7de1C9H97JHsUyxO4hgAAJ842b6a0jyyzQIdJR
         ZFZA==
X-Gm-Message-State: AOJu0Yx2299f+FgWP2D1wx/ndZoSSkV2ZhBhx9zqiBLakxMAcAMd/wlV
	TCQh2fyVXEDCNB5+NiT+W0AdxMBu/Kkh9s91fovGSMM97L451/2V
X-Google-Smtp-Source: AGHT+IEejxDFgAi7lbNynmLRXTVQXvL06Ptb1+HG+Vz6+VZh8Yummwsg6bzfTpSPHeUfqypN3tJ5gw==
X-Received: by 2002:a17:907:3e86:b0:a90:d1e1:eeb3 with SMTP id a640c23a62f3a-a93c4a60d33mr248698266b.44.1727428079976;
        Fri, 27 Sep 2024 02:07:59 -0700 (PDT)
Message-ID: <05958c4be241866a5698a1396416b2d6317acc17.camel@gmail.com>
Subject: Re: [PATCH v4 1/6] xen: introduce SIMPLE_DECL_SECTION
From: oleksii.kurochko@gmail.com
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Fri, 27 Sep 2024 11:07:58 +0200
In-Reply-To: <ZvZlqy4Y57ewtcq9@macbook.local>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
	 <413dfb16280c3ec541df8775d31902a4b12a64fe.1727365854.git.oleksii.kurochko@gmail.com>
	 <ZvZlqy4Y57ewtcq9@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-09-27 at 09:58 +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 26, 2024 at 06:54:20PM +0200, Oleksii Kurochko wrote:
> > Introduce SIMPLE_DECL_SECTION to cover the case when
> > an architecture wants to declare a section without specifying
> > of load address for the section.
> >=20
> > Update x86/xen.lds.S to use SIMPLE_DECL_SECTION.
>=20
> No strong opinion, but I feel SIMPLE is not very descriptive.=C2=A0 It
> might be better to do it the other way around: introduce a define for
> when the DECL_SECTION macro should specify a load address:
> DECL_SECTION_WITH_LADDR for example.
In the next patch, two sections are introduced: dt_dev_info and
acpi_dev_info. The definition of these sections has been made common
and moved to xen.lds.h, and it looks like this:
   +#define DT_DEV_INFO(secname)    \
   +  . =3D ALIGN(POINTER_ALIGN);     \
   +  DECL_SECTION(secname) {       \
   +       _sdevice =3D .;           \
   +       *(secname)              \
   +       _edevice =3D .;           \
   +  } :text
(A similar approach is used for ACPI, please refer to the next patch in
this series.)

For PPC, DECL_SECTION should specify a load address, whereas for Arm
and RISC-V, it should not.

With this generalization, the name of DECL_SECTION should have the same
name in both cases, whether a load address needs to be specified or not

~ Oleksii

