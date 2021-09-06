Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3595F401E19
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 18:14:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180085.326608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNHFs-000600-5r; Mon, 06 Sep 2021 16:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180085.326608; Mon, 06 Sep 2021 16:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNHFs-0005xl-2k; Mon, 06 Sep 2021 16:13:56 +0000
Received: by outflank-mailman (input) for mailman id 180085;
 Mon, 06 Sep 2021 16:13:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Prhc=N4=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mNHFq-0005xf-Rz
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 16:13:54 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dc0a926-0f2d-11ec-b0ab-12813bfff9fa;
 Mon, 06 Sep 2021 16:13:53 +0000 (UTC)
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
X-Inumbo-ID: 6dc0a926-0f2d-11ec-b0ab-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630944833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sPS1iR3/1qB/kh7mRnkHpyZCa1OlC8FRIQTogK8xtOU=;
  b=IOSLeBP5dKMNpqHtA6oyRJZuNh5pCtw9WmIruSVHXuyvlCxcb/BevhcA
   JR+PVzXxI56LErIQrsnlqrSponcidzUDOMjryeEBdMn/Ua+2le4q9q4uI
   /LrXYPC2WV5UUuvtrHHMky2iNqqqTvS4oaRnTj8B9yg4T9PaO6HIm6diG
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PAneNPwE5aDq+Ll/CpoUPWdhhv9tg4/BUy8AeMc0O2PUU4INBbhv5Kz40Hb/zEJtzX+XAoc7gJ
 O9ERxtzFxcj6M1tVuvfoztfdcc/8gIo2gvWq/zckgyvjznb38WzOdn374IJDFgw+Aa2XS1OG/V
 07XxUl0ltJ0qf6p7fTkzbaA0dH+ZZURnXnyGfBUKg+VSbi5A/gMfk6whFAdXAuDwhl/tngPSp8
 Wpq1PdQGMnTgTGZVOf7/6fuMNmlztdlySu217xAvpDov71s9kfSy6u+ulo1g6rW/1+Cmm7O3dR
 S76Ima7LCUdkkcsCUtYgTuOf
X-SBRS: 5.1
X-MesageID: 52111338
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:c23qnKDy7XGChmDlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="52111338"
Date: Mon, 6 Sep 2021 17:13:48 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 00/51] xen: Build system improvements, now with
 out-of-tree build!
Message-ID: <YTY+PNBccQYPhX0a@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>

I hope this is useful:

On Tue, Aug 24, 2021 at 11:49:47AM +0100, Anthony PERARD wrote:
> Anthony PERARD (51):
>   build: introduce cpp_flags macro
>   build: use if_changed on built_in.o
>   build: use if_changed_rules with %.o:%.c targets

all 3 ready to commit

>   build: factorise generation of the linker scripts

may need a ack from arm maintainers, does it? Otherwise, ready.

>   x86/mm: avoid building multiple .o from a single .c file
>   build,include: rework compat-build-source.py
>   build,include: rework compat-build-header.py
>   build: fix clean targets when subdir-y is used
>   build: use subdir-y in test/Makefile

all 5 ready to commit

>   build,arm: move LDFLAGS change to arch.mk
need edit commit description, but otherwise ready
    not needed before [PATCH 21/51] build: set ALL_OBJS to main Makefile; move prelink.o to main Makefile

>   build: move make option changes check earlier
>   build: avoid building arm/arm/*/head.o twice
both ready

So up to here (12/51) all patch seems to be ready to commit.

>   build: convert binfile use to if_changed
>   xen: move include/asm-* to arch/*/include/asm
both need a ack

>   build,riscv: tell the build system about riscv64/head.S
patch ready
but depends on "[PATCH 14/51] xen: move include/asm-* to arch/*/include/asm"
    for the rune written in the commit message to work.


>   build: generate "include/xen/compile.h" with if_changed
>   build: set XEN_BUILD_EFI earlier
>   build: fix $(TARGET).efi creation in arch/arm
patches needs review

>   build: fix arch/x86/note.o rule
ready, standalone


The rest of the series needs review.

Cheers,

-- 
Anthony PERARD

