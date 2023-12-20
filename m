Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387AF81A77B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 21:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658250.1027361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG2p6-00057A-81; Wed, 20 Dec 2023 20:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658250.1027361; Wed, 20 Dec 2023 20:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG2p6-00055M-5K; Wed, 20 Dec 2023 20:05:44 +0000
Received: by outflank-mailman (input) for mailman id 658250;
 Wed, 20 Dec 2023 20:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rG2p5-00055G-84
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 20:05:43 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 267635e2-9f73-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 21:05:41 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50e44c1b35fso97095e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 12:05:41 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z1-20020ac24f81000000b0050e3f35e549sm50318lfs.203.2023.12.20.12.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 12:05:39 -0800 (PST)
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
X-Inumbo-ID: 267635e2-9f73-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703102740; x=1703707540; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7XXaZ148JMl9fL6qBS2K6YuKFKoFXCcdRayp3lFcKD4=;
        b=JcGJGB9tJhBP0fQiflviTIy/Wa7egoG33R/3biNzs+XFjn93BDJ4xj454T4L1OtVhF
         aHKSBba9D0O26vrWVUoniZ1SN+aKyMdMtfDwxTMbw/dzJ/kwwmNlzgvBnjdfuO144TNu
         raL/Ud5Abe5DBr8SXTjs5BiKbZmBkn2poC3nPRP4myog6NqzWVPVUq69WY5N2GK1Vci0
         gQjxQRm/JSdD+sk6WfA8lmZwSxjii0XGiTtfcyV8UsZ4Lkwr1R9C6YDFQ8C4o+i/vv85
         Abvk+DRnxNudZ8WmUFfbmU6AGj9vQAccXfWlQJbkQOyRm/dXsYx/zUsRJygwk5ZcvT3p
         Vw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703102740; x=1703707540;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7XXaZ148JMl9fL6qBS2K6YuKFKoFXCcdRayp3lFcKD4=;
        b=gE1U2O8o+ejbyTqPgaz7q9oxbPjuwFnC86fbmy7M5xo8MGIVzIDd9/jv7oe+iFSonU
         SREcrOIHVSZy2DBLUtcdheP7GAHyTvhn0929fpYTcD4i5E8qIYdDB3TlShm4vnzgv4y0
         23SLCyEJHyspipcvNE1RIPE3MwJa6XlPOEZ7UoltN/JLR0bXaj+/QgQATCY+Vmkrqq5T
         zE8PaevlX8liHeFDwSScaQg8JBCUucHzQ5panCmo0DRR/dpntPgJ/PCfc1wQNTEsJoyU
         eFz9tHtaVdmskNBkc/vMhPtwuERf1QkNmxuXfU42gAgJKb0mf9kwmCrHUfBQURY0x5Pe
         hSQA==
X-Gm-Message-State: AOJu0YzXJtQ+nzzzBgrFFlWgJtloIzyiSa8GCQFtuhosYU0ySNKY7mOg
	bAPMHliMGrK8V/vn4vBFLnM=
X-Google-Smtp-Source: AGHT+IGo7nphxPuXlO6K6wUACnIje+9FM7ngmlAvo88Dv4czcDl4D3P978d29iwQOw4GLWGQXcCWLA==
X-Received: by 2002:a05:6512:31d2:b0:50b:f0a2:25dd with SMTP id j18-20020a05651231d200b0050bf0a225ddmr11607923lfe.3.1703102740335;
        Wed, 20 Dec 2023 12:05:40 -0800 (PST)
Message-ID: <f890996c2b100c6ace1f853da2c293d2f9244ef9.camel@gmail.com>
Subject: Re: [PATCH v2 07/39] xen/riscv: introduce arch-riscv/hvm/save.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org
Date: Wed, 20 Dec 2023 22:05:34 +0200
In-Reply-To: <5eae9d9b-e499-4c8c-aed0-2f52c0aa7c9f@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <acb870b980a791d7800d47c08c9574275159df39.1700761381.git.oleksii.kurochko@gmail.com>
	 <5eae9d9b-e499-4c8c-aed0-2f52c0aa7c9f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2023-12-05 at 16:59 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/public/arch-riscv/hvm/save.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Structure definitions for HVM state that is held by Xen and
> > must
> > + * be saved along with the domain's memory and device-model state.
> > + */
> > +
> > +#ifndef __XEN_PUBLIC_HVM_SAVE_RISCV_H__
> > +#define __XEN_PUBLIC_HVM_SAVE_RISCV_H__
> > +
> > +#endif
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * tab-width: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
>=20
> Seeing that Arm's is as empty, I wonder why we have it. Julien,
> Stefano?
It seems to exist to satisfy the 'install-tools-public-headers' target:
install: cannot stat 'xen/arch-arm/hvm/*.h': No such file or directory
Makefile:58: recipe for target 'install' failed
make[1]: *** [install] Error 1
make[1]: Leaving directory '/builds/xen-
project/people/olkur/xen/tools/include'
Makefile:44: recipe for target 'install-tools-public-headers' failed

From tools/include/Makefile:
install: all
...
$(DESTDIR)$(includedir)/xen/arch-arm
	$(INSTALL_DATA) xen/arch-arm/hvm/*.h
$(DESTDIR)$(includedir)/xen/arch-arm/hvm
...

We have the following options:
1. Remove the line with $(INSTALL_DATA) xen/arch-arm/hvm/*.h (only
save.h is now in this folder, which is empty).
2. Don't touch the Arm part, but for PPC and RISC-V, do the following:
#if defined(__i386__) || defined(__x86_64__)
#include "../arch-x86/hvm/save.h"
#elif defined(__arm__) || defined(__aarch64__)
#include "../arch-arm/hvm/save.h"
+#elif defined(__powerpc64__) || defined(__riscv)
+/* no specific header to include */
#else
#error "unsupported architecture"
#endif

3. Provide an asm-generic version of save.h for Arm, PPC, and RISC-V
and use it in public/save.h.

In your opinion, which option would be better?

~ Oleksii
> ....
> > --- a/xen/include/public/hvm/save.h
> > +++ b/xen/include/public/hvm/save.h
> > @@ -91,6 +91,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct
> > hvm_save_end);
> > =C2=A0#include "../arch-arm/hvm/save.h"
> > =C2=A0#elif defined(__powerpc64__)
> > =C2=A0#include "../arch-ppc.h"
> > +#elif defined(__riscv)
> > +#include "../arch-riscv/hvm/save.h"
> > =C2=A0#else
> > =C2=A0#error "unsupported architecture"
> > =C2=A0#endif
>=20
> The PPC part here looks bogus altogether. Shawn?
>=20
> Jan


