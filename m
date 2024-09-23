Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3172597E9E8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801863.1211903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgHu-0003gf-IE; Mon, 23 Sep 2024 10:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801863.1211903; Mon, 23 Sep 2024 10:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgHu-0003dE-FW; Mon, 23 Sep 2024 10:27:26 +0000
Received: by outflank-mailman (input) for mailman id 801863;
 Mon, 23 Sep 2024 10:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qfp8=QV=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ssgHs-0003d4-EH
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:27:24 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b81a405-7996-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 12:27:23 +0200 (CEST)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5d5c7f23f22so2312832eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 03:27:23 -0700 (PDT)
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
X-Inumbo-ID: 6b81a405-7996-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727087242; x=1727692042; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oM+fIIvioJjRq3qlAG37FF5BHFpu5n1rQ35NeNGjfzI=;
        b=O0PZtQYOT9Elj/Asp5CQOexMKOCYBx9YgFvuGQPc1GFiPT7+l2oazjIrNFNaQjow4k
         JDHp9IcX1J77rYVsD6bQ3Sqaa0XybDiPaUgO0emrGQiy04HQNw9FDDRyHq6UCSYJ5MGq
         f9/E6F5lJC8BPT3/Ikly4Vxqqc42y1lKS272Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727087242; x=1727692042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oM+fIIvioJjRq3qlAG37FF5BHFpu5n1rQ35NeNGjfzI=;
        b=sEOHgH5I+fz4/d8aBc7vwUlamAcsFFjN6TtEaEzTuzlbyNlck7MHTlV4EJTKrxeDof
         f+XB/EuhkAD+30RTI0AfS7n8t817Faa/eUlZCJhN/IlGBTURHVCDBpDb+BQvaOhp1kIN
         EzZoAcKQNiaUp5b9oVVQ1tIfyIpTnHm5lULyNlyNK4sT4YdMalhPTgkx1o+g8UHr4gZX
         9L2KyZb2s1Iqe7pQ+Bq+Q5kTTSdHtt9cMPVtiUq3BGbibeVKZg4s1V1t2Gp6MwOixGej
         VkIx4OmvbfZxX4gCoDulIkl5u2z2sV7HrWp80PHSnI/3yUdp12jWCpvc/LiDHraJUNnI
         t8Bg==
X-Gm-Message-State: AOJu0YwelxtX4xWS1q7w84s9dIL3b5wehjhhS+BgxMbFUDuBgE5QsbZg
	uCTXjyfClDGJaZac+oRQDTnhsbz9WWXd5a3hMmyFHSMl/K/Ke6FIgz4O5Ztv1kPO91sPuL0SruG
	5f940FSx5VG+x2jSSXR+z8lQhhA+xpLlvKUGagg==
X-Google-Smtp-Source: AGHT+IETtRMXnIvWQ99rFsYXFE1IEnyw3tZ+7KxkBCWpfvTansA4QBveehOeYK9KpFUdW0kwUajhdDrnIcJliNAG2zc=
X-Received: by 2002:a05:6820:16ac:b0:5e1:eba9:8fee with SMTP id
 006d021491bc7-5e58d0fcfd0mr4822002eaf.1.1727087242154; Mon, 23 Sep 2024
 03:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <6cf2799ced7dcee515ad8a6b6657522cdc7cec61.1724699546.git.milan.djokic@verisure.com>
 <367c5d95fb89e7dd3b4260f136d194a4cd0b854a.1724765763.git.milandjokic1995@gmail.com>
 <CAKp59VFp8gNA6ndeK2DeE9EaRZJSup0ptYYPz4FwN4_Shx9SjA@mail.gmail.com>
 <CACHz=Zh7FB0h26zJDZnzkVRatwhTb=vWMA0TM+fpqZ=RtULTJA@mail.gmail.com> <CAKp59VEDE=9o4r_=n_bf_W=VOMvCpz5d_oBCDqkPSruO9ZUr=g@mail.gmail.com>
In-Reply-To: <CAKp59VEDE=9o4r_=n_bf_W=VOMvCpz5d_oBCDqkPSruO9ZUr=g@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 23 Sep 2024 11:27:10 +0100
Message-ID: <CACHz=ZiVgKSPvoHd645kcMgA6e=ZP-7LapnrVeSmgieh-poqqg@mail.gmail.com>
Subject: Re: [PATCH v2] x86/efi: Use generic PE/COFF structures
To: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com, 
	Nikola Jelic <nikola.jelic@rt-rk.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Milan Djokic <milan.djokic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 9:56=E2=80=AFAM Milan =C4=90oki=C4=87 <milandjokic1=
995@gmail.com> wrote:
>
> Hello Frediano,
> Thank you for your feedback
> >
> > On Thu, Sep 19, 2024 at 11:42=E2=80=AFAM Milan =C4=90oki=C4=87 <milandj=
okic1995@gmail.com> wrote:
> > >
> > > Hello everyone,
> > >
> > > Any comments on v2 patch?
> > > Just checking if you missed this email or didn't have time for review=
.
> > >
> > > BR,
> > > Milan
> > >
> >
> > Hi,
> >   it does look good to me.
> > I don't like the "#include "../../../include/efi/pe.h"" line, but I
> > don't exactly know how to add a -I option.
> >
> Yes, this does look bad. Although, I don't see that we have other
> options with the current build setup. mkreloc is built as a separate
> binary and it's added to the hostprogs list, for which we are not able
> to add additional flags. Relative paths are also used for other
> hostprogs when some local xen file needs to be included. Only solution
> which I see here is to have a separate makefile for mkreloc, but I
> would say that this is also not a good option, since we will separate
> mkreloc from other hostprogs in build config. If someone has some
> better idea here we shall be happy to apply it.

Not strong about, a change like

$ git diff
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 286c003ec3..00ab091634 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -88,6 +88,8 @@ extra-y +=3D xen.lds
hostprogs-y +=3D boot/mkelf32
hostprogs-y +=3D efi/mkreloc

+$(obj)/efi/mkreloc: HOSTCFLAGS +=3D -I$(srctree)/include
+
# Allows usercopy.c to include itself
$(obj)/usercopy.o: CFLAGS-y +=3D -iquote .

diff --git a/xen/arch/x86/efi/mkreloc.c b/xen/arch/x86/efi/mkreloc.c
index 89c525d81e..7c9aac49ed 100644
--- a/xen/arch/x86/efi/mkreloc.c
+++ b/xen/arch/x86/efi/mkreloc.c
@@ -9,7 +9,7 @@
#include <sys/mman.h>
#include <unistd.h>

-#include "../../../include/efi/pe.h"
+#include <efi/pe.h>

#define PE_PAGE_SIZE 0x1000


would work. Not sure the best place to put the option in the Makefile
or I should change a different macro.

> > There are some spurious space changes that could be removed but okay
> > for the rest.
> >
> Space changes are caused by our formatter which aligned this file
> according to coding guidelines. We can revert those if formatting
> needs to be done separately.
>

Minor for me. I personally cannot see anything so wrong that prevents a mer=
ge.

> Best regards,
> Milan

Frediano

