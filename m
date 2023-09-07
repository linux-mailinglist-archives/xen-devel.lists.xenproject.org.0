Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B26797277
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 15:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597318.931538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeEcJ-0007kA-N3; Thu, 07 Sep 2023 13:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597318.931538; Thu, 07 Sep 2023 13:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeEcJ-0007go-JH; Thu, 07 Sep 2023 13:00:15 +0000
Received: by outflank-mailman (input) for mailman id 597318;
 Thu, 07 Sep 2023 13:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tY2=EX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qeEcH-0007gi-PZ
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 13:00:13 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a6594d5-4d7e-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 15:00:11 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-501b9f27eb2so2566291e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 06:00:11 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x12-20020ac2488c000000b005007fc9ccccsm3179649lfc.122.2023.09.07.06.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 06:00:09 -0700 (PDT)
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
X-Inumbo-ID: 7a6594d5-4d7e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694091610; x=1694696410; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eFcv9xpSdPwUNvg0QQBKpn+GcMcLIIWWzQr0O8eqmlY=;
        b=MUz7uNeSq4tS20GjU/ZckyG7e3kytabf5AXW0+XxW8R1eKdDKCHrzK/9N3ZNYUEipg
         pMRzQJDa1uQdXBClVguWWWOzv8Hdfc2njczL0NHVFh3BibVWBTjQ9/NON2xn9YknUJGr
         9J6r9Fx7tYxHm/axrebAqQSdu9WqWVOkMTB7HaaDuf1CpwxDsJzjeFWI2ih3iUs+SWix
         kHLBrXxdlEmRfwWPOjfxs4tHWioVIH/fGYjMQ0jwsP33kjGSn9A5NFyuaaN3Xksxe1rR
         Ni/zp68fPGFMGqEu1FlbS/YPw25dNO1l/hVBmmOKiIOMkMpEYbHWTySA9Jz1ec4KCbZ/
         mcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694091610; x=1694696410;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eFcv9xpSdPwUNvg0QQBKpn+GcMcLIIWWzQr0O8eqmlY=;
        b=LbhIJEs4NTwm5IfbssGI62wxE8jkvXE+A0NpXLbhT9XxdTYOqeBr+oTOA4p9fl2+N7
         YSDwvR+KeqcYJkdzB1ZZjDODM+79OiFGKFo97Y2HG7lfmcjGRuhVl3LVttjqgxoF8ezG
         zIml/drTTo1OOtC00ikUzc6XZtouaHAvLXA6p8u7K/P/S+iZ41iHm36LEzGuZrdNB3Kp
         xspiZxJPYpz+gbP4s21ETEJbykyMIpzhpGYo4zVIUNpBKQ8wHXSafHV1Y0Vk0j6l9J7Z
         g9ZaDTNv5GzFzDdk33lrlTVMAIcUWNVMSkEe+iJYCF4p63wEntpt7gkaxwkECw6CagTr
         5zIQ==
X-Gm-Message-State: AOJu0YyE/yY/zcLmUESBdM/f/PfmfT30nHU8yP5ERKeU+afmXsPrLYx1
	NBazYCkbSctiTYdVTLKfhuo=
X-Google-Smtp-Source: AGHT+IHcpxzrAF1V9BYMASzlSN3sUYfPicBTCxP0O0vAskoPKunhOPBoBTv9K+9i5FMjqJAGtyBKsw==
X-Received: by 2002:a05:6512:239b:b0:500:bf44:b2b3 with SMTP id c27-20020a056512239b00b00500bf44b2b3mr1043113lfv.21.1694091609866;
        Thu, 07 Sep 2023 06:00:09 -0700 (PDT)
Message-ID: <79dd759e64c5eb5447c7375cdc8e24f5589f1dad.camel@gmail.com>
Subject: Re: [PATCH v6 1/2] xen: asm-generic support
From: Oleksii <oleksii.kurochko@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>,  George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,  Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Thu, 07 Sep 2023 16:00:08 +0300
In-Reply-To: <11cca5d8-5456-4908-b1be-1664f39fb134@perard>
References: <cover.1694078544.git.oleksii.kurochko@gmail.com>
	 <cf5f446915bd5c8980beda22718efff32678e16b.1694078544.git.oleksii.kurochko@gmail.com>
	 <11cca5d8-5456-4908-b1be-1664f39fb134@perard>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-09-07 at 11:08 +0100, Anthony PERARD wrote:
> On Thu, Sep 07, 2023 at 12:32:56PM +0300, Oleksii Kurochko wrote:
> > diff --git a/xen/scripts/Makefile.asm-generic
> > b/xen/scripts/Makefile.asm-generic
> > new file mode 100644
> > index 0000000000..92a3a741c5
> > --- /dev/null
> > +++ b/xen/scripts/Makefile.asm-generic
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +# include/asm-generic contains a lot of files that are used
> > +# verbatim by several architectures.
> > +#
> > +# This Makefile reads the file
> > arch/$(SRCARCH)/include/asm/Makefile
> > +# and for each file listed in this file with generic-y creates
> > +# a small wrapper file in arch/$(SRCARCH)/include/generated/asm.
> > +
> > +PHONY :=3D all
> > +all:
> > +
> > +src :=3D $(subst /generated,,$(obj))
> > +
> > +include $(srctree)/scripts/Kbuild.include
> > +-include $(src)/Makefile
> > +
> > +redundant :=3D $(filter $(mandatory-y) $(generated-y), $(generic-y))
> > +redundant +=3D $(foreach f, $(generic-y), $(if $(wildcard
> > $(srctree)/$(src)/$(f)),$(f)))
> > +redundant :=3D $(sort $(redundant))
> > +$(if $(redundant),\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(warning redundant generic-=
y found in $(src)/Kbuild:
> > $(redundant)))
>=20
> This warning would need to say "$(src)/Makefile" now instead of
> Kbuild.
Thanks. Missed that.

>=20
> Beside this, patch looks fine to me:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
>=20
> Thanks,
>=20

~ Oleksii


