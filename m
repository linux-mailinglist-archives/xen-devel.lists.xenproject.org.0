Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA217D5030
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621916.968831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGns-0002WX-8r; Tue, 24 Oct 2023 12:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621916.968831; Tue, 24 Oct 2023 12:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGns-0002TE-5s; Tue, 24 Oct 2023 12:46:36 +0000
Received: by outflank-mailman (input) for mailman id 621916;
 Tue, 24 Oct 2023 12:46:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lhve=GG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qvGnq-0002T8-Rf
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 12:46:34 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c902687-726b-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 14:46:33 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507975d34e8so6547429e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 05:46:34 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a19ca49000000b00507987ff761sm2150621lfj.56.2023.10.24.05.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 05:46:32 -0700 (PDT)
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
X-Inumbo-ID: 5c902687-726b-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698151593; x=1698756393; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WNAw0v8mCj9zjTBy9wUVcNuBSK596G4Btplqlv/1d9o=;
        b=BjvAGi+xLKCuumT42WRUSBJE/qAM6cue7qbwDeq9A0MgTvb5QMhGkbCrZrGCTVr+WR
         HBiFkidsWszp/vAGYiNt6Dr8KSqJ21zZ8unm2s11Pzpev1iONhyzfKzdc8pqMBfJFEsG
         rgBV5pOFq3z0QGFAmgzH8MYCvqq0G2R6nw1enbMoqm5CmCPawVxcDehm1aKw1W1itVBU
         gY3tlLe+Bad+JzpXKpe2pPVgT2THBqvw0kk2p1QaB6X9cMf7sEtq9R8Tn8jjYBGsAxsg
         qz8OKWd3jHxnY4yzWnoTq1fAlO7/xGupUFFYiaodAFr1zx2f2jLa44nvBt3gv99Pzgsv
         xkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698151593; x=1698756393;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNAw0v8mCj9zjTBy9wUVcNuBSK596G4Btplqlv/1d9o=;
        b=szVEilnEKgzO2jguRlY4o/A48Dx483b6m9zxpJCnDgSMM84udm4HtE0DWmCVyVdvxo
         /UMtJfv7NdswT7BlpsHTyRz81YBE5QjsHVJcV0JPPCZJpDeHziERFTyDixYZTBC5N66J
         2R2h8Dm5tvaBuuna1l7ygtt9w4mEmLyMvBW73KAIpIIjG1k3vhLyQOgt+c3q19HodYdH
         ORZeVU5VwGbkvjJvyMVjkSybXXIgDcA9P4ZNpmmFjCEJ8nb84xkhXyfayQ5IuFF0sD8w
         QmeCQJ64hy09j1y66fR2HdE3WLpvQchpr3qN2P6vSmwlcshfsMSgC44FOvkx3xyMB/c/
         BVIQ==
X-Gm-Message-State: AOJu0Yy1u23DmENJAXA8Gz98W5OHv9SMe/2JzsFPi0pN8ip5j1VsSGFz
	L9t2SfzktsctokQzAjaVfoQ=
X-Google-Smtp-Source: AGHT+IFQH+Y8BdmW10j7kk0nDtFw57Uuh6t4ePr0tgtZMjDzIKPazXeKMaKlGGBdA136Vy2CobKB0g==
X-Received: by 2002:ac2:4adb:0:b0:4f9:54f0:b6db with SMTP id m27-20020ac24adb000000b004f954f0b6dbmr8001486lfp.13.1698151593375;
        Tue, 24 Oct 2023 05:46:33 -0700 (PDT)
Message-ID: <141935204e035701468cfaae9ff4310230f26983.camel@gmail.com>
Subject: Re: [PATCH v1 10/29] xen/asm-generic: introduce stub header iommu.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 24 Oct 2023 15:46:31 +0300
In-Reply-To: <176d38b2-eafc-7a78-ee17-0d5e0369cb2a@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <8990c5c77c12333bfa7aba42b66bf7fffee5a096.1694702259.git.oleksii.kurochko@gmail.com>
	 <65cdbeaa-6766-e5b7-65fb-191da6f59d81@suse.com>
	 <e1e26fd0a31c7ab14e474d6d7fb16163e8163f2b.camel@gmail.com>
	 <176d38b2-eafc-7a78-ee17-0d5e0369cb2a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-10-23 at 12:47 +0200, Jan Beulich wrote:
> On 23.10.2023 12:43, Oleksii wrote:
> > On Thu, 2023-10-19 at 11:44 +0200, Jan Beulich wrote:
> > > On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/include/asm-generic/iommu.h
> > > > @@ -0,0 +1,17 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +#ifndef __ASM_GENERIC_IOMMU_H__
> > > > +#define __ASM_GENERIC_IOMMU_H__
> > > > +
> > > > +struct arch_iommu {
> > > > +};
> > > > +
> > > > +#endif /* __ASM_IOMMU_H__ */
> > > This one's perhaps slightly more "interesting": Yes, we have a
> > > HAS_PASSTHROUGH Kconfig option, which both Arm and x86 select.
> > > But it
> > > is in principle possible to support guests without any kind of
> > > IOMMU
> > > (permitting solely emulated and PV devices). In which case what's
> > > (imo) needed here in addition is
> > >=20
> > > #ifdef CONFIG_HAS_PASSTHROUGH
> > > # error
> > > #endif
> > I am not 100% sure but not all platform has support of IOMMU.
> >=20
> > And I thought that passthrough it is when a device is fully
> > committed
> > to=C2=A0 a guest domain with all MMIO things. So it is a question of
> > properly mapping MMIO to guest domain. Am I right?
>=20
> Yes. And do you expect you will get away with such a stub
> implementation
> when you actually start supporting pass-through on RISC-V?
No, it will be=C2=A0changed. It was added to asm-generic because of the
build purpose for the full Xen build ( the same header with the same
content is used for PPC ).

But yeah, taking into account about device.h header in this patch
series looks like this patch will be=C2=A0arch-specific.

~ Oleksii

