Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40A47972E1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 15:45:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597381.931607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeFJg-0002MM-FK; Thu, 07 Sep 2023 13:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597381.931607; Thu, 07 Sep 2023 13:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeFJg-0002Jy-CK; Thu, 07 Sep 2023 13:45:04 +0000
Received: by outflank-mailman (input) for mailman id 597381;
 Thu, 07 Sep 2023 13:45:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tY2=EX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qeFJf-0002Js-8T
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 13:45:03 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be8db47e-4d84-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 15:45:02 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-501be2d45e0so1587972e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 06:45:02 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 m2-20020ac24282000000b004fe47879d93sm3172562lfh.106.2023.09.07.06.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 06:45:01 -0700 (PDT)
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
X-Inumbo-ID: be8db47e-4d84-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694094302; x=1694699102; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pE7VAydKmw8vGjxffAzjfk0Rhred4uM3KwN9wk9Ixfk=;
        b=C4KNG5omR42VgF+8I9hOe/BlR0bVk7lmUCrmwTu4PbQCKLmAFsFMlWWBnQl1WzrStA
         /iOtQ9Zq8X3gxCdhQI6DFScgOdaDqoOhuvlgJHNM7U6m6ooUSPPdh0s5Oxak8jucrxLm
         nMszAx7hj5ZX+8oZODeFlF9JKdML7cqZt3xz3c40NusX9pp7hJnvELAJDWq5SxhEugUv
         v4VkxoAsMlQtH9HkSJ5S59xiZ/ORBKGaB3+qE8iEhALpur1t7LcfqzLepMpqMBHo5pdl
         B9es0OZwHaA/Z4pYPFtPqTbuoNsemA9M3ScOzoccEuLLrDzD8O6j8izAoitzG2FS6Jvq
         SbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694094302; x=1694699102;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pE7VAydKmw8vGjxffAzjfk0Rhred4uM3KwN9wk9Ixfk=;
        b=UIobuEsbscWGujii/w2yn0SAGOQ7UNgOpAvMKo5rwczNf3pWEwEOzoax/kcH9U/EcV
         0y3m4BTsSJVYcCi8m1IA7FT6pIU0ivi+JQvk8MYPhM4tgfH+uc5WxFXliJy1gSRme1ii
         oOadnBl+rkTcYWrFcPQOAYT4TSjRmnjCfBSrC9cZS4GCERRY4UNeT6vEEUrA/BnT0jsR
         Rqt2JqCi5q2pMO0njuFUj5r3ie/2FVU2+fPPKJrnAL71rZPGO3JYnWYGdhUXHLxpRzm6
         DpHOatIOnKhWrHCuMuCY6jJJ1FWeOsrNo3aLfDUmja6zdhBHxDMAuRA745SLgpiJEoIy
         TRog==
X-Gm-Message-State: AOJu0Yyy9nTOtnDt3ixRJgshCHq1USqp2XZoPue5j3fv/0h9urgx0sPv
	BGGbqo4CxgtBg3yt91VrZTBYGXo6D4Q=
X-Google-Smtp-Source: AGHT+IGEM9XHjFPDiLKSrkOLdtisTVKOb8h2rT48gayGh/Vnd9kTP9bFwCt6F6kfffIVzm03TtXuPA==
X-Received: by 2002:a05:6512:3702:b0:4fb:8bea:f5f6 with SMTP id z2-20020a056512370200b004fb8beaf5f6mr4398156lfr.34.1694094301491;
        Thu, 07 Sep 2023 06:45:01 -0700 (PDT)
Message-ID: <39d85cdb68d29cc83743da703539f9c536ce7ded.camel@gmail.com>
Subject: Re: [PATCH v6 1/2] xen: asm-generic support
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,  xen-devel@lists.xenproject.org
Date: Thu, 07 Sep 2023 16:45:00 +0300
In-Reply-To: <fbc5ea33-22c1-52a5-dc7d-97ba29e06e9d@suse.com>
References: <cover.1694078544.git.oleksii.kurochko@gmail.com>
	 <cf5f446915bd5c8980beda22718efff32678e16b.1694078544.git.oleksii.kurochko@gmail.com>
	 <fbc5ea33-22c1-52a5-dc7d-97ba29e06e9d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-09-07 at 12:48 +0200, Jan Beulich wrote:
> On 07.09.2023 11:32, Oleksii Kurochko wrote:
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
>=20
> With the definition of src above, is this correct for out-of-tree
> builds?
Logically you are right and I think it would be better to use
$(srctree)/$src but it works for out-of-tree builds too.

$ CONTAINER_NO_PULL=3D1 CONTAINER=3Driscv64
./automation/scripts/containerize make O=3Dxen-build V=3D2
XEN_TARGET_ARCH=3Driscv64 -C xen build

$ ls -la xen/xen-build/arch/riscv/include/generated/asm/vm_event.h
-rw-r--r--. 1 ok ok 34 =D0=B2=D0=B5=D1=80  7 16:27 xen/xen-
build/arch/riscv/include/generated/asm/vm_event.h

> You want to reference the Makefile in the source tree, ...
>=20
> > +redundant :=3D $(filter $(mandatory-y) $(generated-y), $(generic-y))
> > +redundant +=3D $(foreach f, $(generic-y), $(if $(wildcard
> > $(srctree)/$(src)/$(f)),$(f)))
>=20
> ... much like $(srctree) is used here (and similarly again further
> down).
>=20
~ Oleksii


