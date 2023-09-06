Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4FE794082
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 17:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596690.930676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdubL-0008QW-Pc; Wed, 06 Sep 2023 15:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596690.930676; Wed, 06 Sep 2023 15:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdubL-0008O3-MO; Wed, 06 Sep 2023 15:37:55 +0000
Received: by outflank-mailman (input) for mailman id 596690;
 Wed, 06 Sep 2023 15:37:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0AC=EW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qdubJ-0008Nx-KK
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 15:37:53 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 576613f7-4ccb-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 17:37:52 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40078c4855fso37354465e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 08:37:52 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l7-20020a7bc447000000b003fe1fe56202sm20188916wmi.33.2023.09.06.08.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 08:37:51 -0700 (PDT)
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
X-Inumbo-ID: 576613f7-4ccb-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694014672; x=1694619472; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2FjIkkAy8Zh8ff2sYnmAJ7p+TkkrrblMmn/6YWfJ/Dw=;
        b=RWlJsx858Fl+51PdjlvfHgeLbuKVutJJJFNVLCD2dQwdfMa5VBHMt3pdU9U25CJ7GL
         TIEnjHdQVSFZoFo+BIziKLEbSTHgP4WPtFf4O7vwNH4ASQlJAQYKC7/sthkuZT06iASd
         ovlgF9h3xR1+CBSQtK0wpOyEG6ucQwh2iP3pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694014672; x=1694619472;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2FjIkkAy8Zh8ff2sYnmAJ7p+TkkrrblMmn/6YWfJ/Dw=;
        b=WIJvajG486oEEeRee1CYMKEumI2WRYWDQCne8VWo1gA1/Jo8QIAaLPdVqUUXJkC0yf
         T5LhTcT13AT5bnkv/FG7t8IXZrPeu0a92t9w7j4UY0P8DsOmiWYMJYDKK1NeO3MwzTL3
         PR1MU9dRb4pMUyTxeS4udxAKYrYtLBGYu2xWYDjeYtaJrzX7I5lfjKj4YYXKrEhyHi5X
         AB2hJ/t5AFRDEyrkQtG3xEMDW8JdqGM1XEx30gB+KD7aqhENCRMNNYHB1baxxE1tShKR
         e8lHXwuDaJKXSAduQ3229P80F1HnUwd1pYuswv7eLj4t1sgqRMdCQx2Iawi9C2ryyzu8
         nQfQ==
X-Gm-Message-State: AOJu0YwUL9VAu1P+Sv1YL8rzs3eN68AxKwxoOSmU1QFlYZTPllFyxL4i
	01OfCU1+dd5dq+IH+oMsmbBopA==
X-Google-Smtp-Source: AGHT+IERmqEwZ2sg25rG6T6WukPvIdAL/TPinw5G3bKeyqhcm+xA11nQ6ulDrVKqj4pFBwMxJZ5/Zw==
X-Received: by 2002:a7b:c4d1:0:b0:3fd:3006:410b with SMTP id g17-20020a7bc4d1000000b003fd3006410bmr2644172wmk.34.1694014671976;
        Wed, 06 Sep 2023 08:37:51 -0700 (PDT)
Date: Wed, 6 Sep 2023 16:37:51 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Oleksii <oleksii.kurochko@gmail.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
Message-ID: <1f31335f-3c1f-4998-bb6d-5e5e743758be@perard>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
 <3DCD5649-C172-4400-AA75-A28F5C0A106D@arm.com>
 <b90c2e4dc9ec84ef6487f1dd980d7858d7903e89.camel@gmail.com>
 <E2C450BC-F080-41DB-B025-9DD1949C835A@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E2C450BC-F080-41DB-B025-9DD1949C835A@arm.com>

On Wed, Sep 06, 2023 at 01:03:32PM +0000, Bertrand Marquis wrote:
> > On 6 Sep 2023, at 13:37, Oleksii <oleksii.kurochko@gmail.com> wrote:
> > On Mon, 2023-09-04 at 13:39 +0000, Bertrand Marquis wrote:
> >>> diff --git a/xen/scripts/Makefile.asm-generic
> >>> b/xen/scripts/Makefile.asm-generic
> >>> new file mode 100644
> >>> index 0000000000..0aac3f50b8
> >>> --- /dev/null
> >>> +++ b/xen/scripts/Makefile.asm-generic
> >>> +
> >>> +$(obj)/%.h:
> >>> + $(call cmd,wrap)
> >> 
> >> In fact i think your files are not generated in the srctree so this
> >> will break if you use out of tree compilation.
> > I checked that and in both cases it generated in correct place.
> > 
> > First case:
> > $ CONTAINER_NO_PULL=1 CONTAINER=riscv64
> > ./automation/scripts/containerize make XEN_TARGET_ARCH=riscv64 -C xen
> > build
> > 
> > $ ls -la xen/arch/riscv/include/generated/asm/vm_event.h 
> > -rw-r--r--. 1 ok ok 34 вер  6 14:32
> > xen/arch/riscv/include/generated/asm/vm_event.h
> > 
> > Second case: ( out-of-tree )
> > $ CONTAINER_NO_PULL=1 CONTAINER=riscv64
> > ./automation/scripts/containerize make O=xen_build
> > XEN_TARGET_ARCH=riscv64 -C xen build V=1
> > 
> > $ ls -la xen/xen_build/arch/riscv/include/generated/asm/vm_event.h 
> > -rw-r--r--. 1 ok ok 34 вер  6 14:34
> > xen/xen_build/arch/riscv/include/generated/asm/vm_event.h
> > 
> > Could you please clarify if there's somithing I might have overlooked?
> 
> No I do not think you did.
> 
> So obj is empty I would guess.
> Anyway you just need to make sure that CFLAGS is coherent with what you generate.
> So if you generate in $(obj) you need to make sure you use the same in CFLAGS i would say.
> 
> @anthony: any advice here ?

The use of $(obj) looks fine here. $(obj) is temporary and set for a
single subdirectory. $(obj) is set by whatever is calling
"Makefile.asm-generic", or "Rules.mk" is other cases.

In this patch, you can see $(obj) been set in "xen/Makefile":
    $(MAKE) -f $(srctree)/scripts/Makefile.asm-generic obj=arch/$(SRCARCH)/include/generated/asm

Another thing to know, `make` runs from the build directory, so in
Oleksii second case, `make` is running in "xen/xen_build", so $(obj) point
to a directory within the build directory.

For the CFLAGS, we can use $(objtree) (even if it is just "."), which
always point to the top directory of the build tree.

I hope that clarifies things.

Cheers,

-- 
Anthony PERARD

