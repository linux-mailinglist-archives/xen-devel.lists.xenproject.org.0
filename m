Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792CE7972F9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 16:14:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597423.931657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeFlT-0002nU-Nu; Thu, 07 Sep 2023 14:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597423.931657; Thu, 07 Sep 2023 14:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeFlT-0002lM-L9; Thu, 07 Sep 2023 14:13:47 +0000
Received: by outflank-mailman (input) for mailman id 597423;
 Thu, 07 Sep 2023 14:13:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tY2=EX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qeFlS-0002jx-8Y
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 14:13:46 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0de87da-4d88-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 16:13:44 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50079d148aeso1655890e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 07:13:44 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w28-20020ac2443c000000b005009d4a5e6fsm3186941lfl.22.2023.09.07.07.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 07:13:43 -0700 (PDT)
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
X-Inumbo-ID: c0de87da-4d88-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694096024; x=1694700824; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y0qTqBIIicRfTU4ngP5GQ7/gnBqhUeRa96W5uqZP3KY=;
        b=KEjRvpA7cYe85gK57+0cYOQTG/52hMdzTHIvY4RS1dRXyV1PQnaONbVzbQ6GzejyFy
         po24zzQi2n+kqdpDSdh/iaM0PMSjQZk/MIrkKM2ZEhQtyP8YyL+LblQHBaYdSZ4UUeci
         anrchTTXEbM1xvh0Xm5HtshcrzEd2B1DKWjVEzsCFuqMYnNiZ3k3gtR1jDB+MElM/ZQ1
         wUpXvsM0lwGLNZzwikZWKhdVh0Jtqi3+jtK87PWuYusxQshhpIdETtAZYHEsyrU6iz3R
         99B4F0mj7gGjMTaztGPo3lP59G5r4CKfqPALn6jdtza4g43NfcQ6tXlmlgkowSPycRZr
         MDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694096024; x=1694700824;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0qTqBIIicRfTU4ngP5GQ7/gnBqhUeRa96W5uqZP3KY=;
        b=gbtiLhSYtClVh1shkh0+/8nRqQmCfYzblcbYfgHRgPJyglrtt2i2uBsUndFuw8oxYT
         HJaZOQ0vzaljQYM5s3eqHRZ0ESWoAXHng7H85H6/yIZg6bkCYYRiDbemg5VTOqOvjMXE
         Z0QOY/+dnqkoB4Z7PkUkkN3CxFoWDdaYiHkt6vPdKqkST0ayFVWAU8JkUpWyO/Iy0Aml
         ggegns8kf1cAO60MteD6pgG3bgbmHJ7Ig/2oGscK8FSFTaQUnKqGnf6kFUbRUPsb1/Wl
         Pas8UVq1cT3k08C+VUc0TsiSeJEeF/8oIlHn24TyQtlH+zHDYDuUh94GpFWIH479qzv2
         vIwA==
X-Gm-Message-State: AOJu0Yzrq9Eup3XhoA6YhjXi3RrJh4tTT0ujbP52yS0th6PB6iKmfedQ
	B6W/4TltJbxvalRSa8Ja3G0=
X-Google-Smtp-Source: AGHT+IEJY2y60K7joEp275lEJ9EKEkkI9DId1k2yYDKpGYr5Um6t5AGfYbID4qfAiLQMTWRFzXpw1g==
X-Received: by 2002:a19:9149:0:b0:500:9704:3c9 with SMTP id y9-20020a199149000000b00500970403c9mr4666984lfj.26.1694096023320;
        Thu, 07 Sep 2023 07:13:43 -0700 (PDT)
Message-ID: <7e34a9f9d3b60888cb006b3e2e2342a944084783.camel@gmail.com>
Subject: Re: [PATCH v6 1/2] xen: asm-generic support
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,  xen-devel@lists.xenproject.org
Date: Thu, 07 Sep 2023 17:13:42 +0300
In-Reply-To: <151a04b2-57c8-20f7-0bbf-0bd1c7c73e97@suse.com>
References: <cover.1694078544.git.oleksii.kurochko@gmail.com>
	 <cf5f446915bd5c8980beda22718efff32678e16b.1694078544.git.oleksii.kurochko@gmail.com>
	 <fbc5ea33-22c1-52a5-dc7d-97ba29e06e9d@suse.com>
	 <39d85cdb68d29cc83743da703539f9c536ce7ded.camel@gmail.com>
	 <151a04b2-57c8-20f7-0bbf-0bd1c7c73e97@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-09-07 at 15:56 +0200, Jan Beulich wrote:
> On 07.09.2023 15:45, Oleksii wrote:
> > On Thu, 2023-09-07 at 12:48 +0200, Jan Beulich wrote:
> > > On 07.09.2023 11:32, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/scripts/Makefile.asm-generic
> > > > @@ -0,0 +1,53 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +# include/asm-generic contains a lot of files that are used
> > > > +# verbatim by several architectures.
> > > > +#
> > > > +# This Makefile reads the file
> > > > arch/$(SRCARCH)/include/asm/Makefile
> > > > +# and for each file listed in this file with generic-y creates
> > > > +# a small wrapper file in
> > > > arch/$(SRCARCH)/include/generated/asm.
> > > > +
> > > > +PHONY :=3D all
> > > > +all:
> > > > +
> > > > +src :=3D $(subst /generated,,$(obj))
> > > > +
> > > > +include $(srctree)/scripts/Kbuild.include
> > > > +-include $(src)/Makefile
> > >=20
> > > With the definition of src above, is this correct for out-of-tree
> > > builds?
> > Logically you are right and I think it would be better to use
> > $(srctree)/$src but it works for out-of-tree builds too.
> >=20
> > $ CONTAINER_NO_PULL=3D1 CONTAINER=3Driscv64
> > ./automation/scripts/containerize make O=3Dxen-build V=3D2
> > XEN_TARGET_ARCH=3Driscv64 -C xen build
> >=20
> > $ ls -la xen/xen-build/arch/riscv/include/generated/asm/vm_event.h
> > -rw-r--r--. 1 ok ok 34 =D0=B2=D0=B5=D1=80=C2=A0 7 16:27 xen/xen-
> > build/arch/riscv/include/generated/asm/vm_event.h
>=20
> Oh, right, aiui because of VPATH being set to $(srctree), and
> therefore
> in the absence of a Makefile in $(objtree)/$(src)/ it'll go look for
> one in $(srctree)/$(src)/. Never mind then:
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
Thanks for explanation.


~ Oleksii

