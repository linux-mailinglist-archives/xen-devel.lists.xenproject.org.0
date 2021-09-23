Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F754162A0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 18:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194492.346483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTRAv-0000VB-Lm; Thu, 23 Sep 2021 16:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194492.346483; Thu, 23 Sep 2021 16:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTRAv-0000SP-IG; Thu, 23 Sep 2021 16:02:17 +0000
Received: by outflank-mailman (input) for mailman id 194492;
 Thu, 23 Sep 2021 16:02:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gl1=ON=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1mTRAt-0000SJ-TI
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 16:02:16 +0000
Received: from mail-ed1-x536.google.com (unknown [2a00:1450:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50eb9f99-289b-41fd-92a1-959b7e063bc5;
 Thu, 23 Sep 2021 16:02:14 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g8so25313702edt.7
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 09:02:14 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48])
 by smtp.gmail.com with ESMTPSA id n10sm3294322ejk.86.2021.09.23.09.02.13
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 09:02:13 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id e21so225548ejz.12
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 09:02:13 -0700 (PDT)
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
X-Inumbo-ID: 50eb9f99-289b-41fd-92a1-959b7e063bc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DLOxhnwH/JaVIhRbDcxcZPpiYGHLJbtd0CRIGAWnOsw=;
        b=QMXOiJ6n28J2emY/y7cY9+DD4h8Pn0KRvNWmJxYGi/2iw91Mhhsv5k4E/yi6SvFmH+
         cwsdxpHCcIaSp+pnaMQx9j8vfDg38b4ujoTb2lzS4jvwjrgaoWuJfcNbrdzMUshkRDfy
         wyxZpTZP4dsY0GDCSs5bbcT3wFiFu+kSB/Akk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DLOxhnwH/JaVIhRbDcxcZPpiYGHLJbtd0CRIGAWnOsw=;
        b=Lr5dPBaeMQugsGOJeUC56HO7tuySBs0gHTXtHRTrSmB5OQcHW4aR24oeLRs4yEcGtO
         ZerSSkj/v4foZLmEFeOkbo4ZaYfT3dDKkmhkhDtKDjGhUQiJAbjzFnLhJ+bcx2EEdGxP
         GwN8WIt5c/w9B+96eRTEtJFyJRczwp/RimYLuepClQfXdomB/kNrUvpL7mxO+z4OJG1u
         Oi3SkNG2JOD+lNnfxqLEXlz0s7wgqGEqE/xaBfIpQdaY5HfEY5DuPefAGMrgwjK3DD9R
         Mz9DdfImh8e+eTwLHbILndG+3snkEsIqouju5rnrDx8CTfIqvEirC5l7iGsobZ2+tz4y
         3E4g==
X-Gm-Message-State: AOAM533J3FZzVsUC9ZcMcMOx+YlP1GJ7Vx3eu+n7f53EJxPxsBP+ziZp
	HPbI4M30vKWPW6cankK2sJHVMfMRFAct232pQbY=
X-Google-Smtp-Source: ABdhPJy1THLnoCM+GbaIhRuthYQzp/+4SGFDokVasBXXLI2ttoCWFCMYc4b2mAmYotUMRDMcIj0YOA==
X-Received: by 2002:a05:6402:3088:: with SMTP id de8mr6441783edb.76.1632412933833;
        Thu, 23 Sep 2021 09:02:13 -0700 (PDT)
X-Received: by 2002:a2e:3309:: with SMTP id d9mr5950451ljc.249.1632412922441;
 Thu, 23 Sep 2021 09:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210923074335.12583-1-rppt@kernel.org>
In-Reply-To: <20210923074335.12583-1-rppt@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Sep 2021 09:01:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJB8H5pZz-AKaSJ7ViRtdxQGJT7eOByp8DJx2OwZSYwA@mail.gmail.com>
Message-ID: <CAHk-=wiJB8H5pZz-AKaSJ7ViRtdxQGJT7eOByp8DJx2OwZSYwA@mail.gmail.com>
Subject: Re: [PATCH 0/3] memblock: cleanup memblock_free interface
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, devicetree <devicetree@vger.kernel.org>, 
	iommu <iommu@lists.linux-foundation.org>, kasan-dev <kasan-dev@googlegroups.com>, 
	KVM list <kvm@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-efi <linux-efi@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, 
	"open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
	linux-um <linux-um@lists.infradead.org>, linux-usb@vger.kernel.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-sparc <sparclinux@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 12:43 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> The core change is in the third patch that makes memblock_free() a
> counterpart of memblock_alloc() and adds memblock_phys_alloc() to be a

^^^^^^^^^^^^^^^^^^^
> counterpart of memblock_phys_alloc().

That should be 'memblock_phys_free()'

HOWEVER.

The real reason I'm replying is that this patch is horribly buggy, and
will cause subtle problems that are nasty to debug.

You need to be a LOT more careful.

From a trivial check - exactly because I looked at doing it with a
script, and decided it's not so easy - I found cases like this:

-               memblock_free(__pa(paca_ptrs) + new_ptrs_size,
+               memblock_free(paca_ptrs + new_ptrs_size,

which is COMPLETELY wrong.

Why? Because now that addition is done as _pointer_ addition, not as
an integer addition, and the end result is something completely
different.

pcac_ptrs is of type 'struct paca_struct **', so when you add
new_ptrs_size to it, it will add it in terms of that many pointers,
not that many bytes.

You need to use some smarter scripting, or some way to validate it.

And no, making the scripting just replace '__pa(x)' with '(void *)(x)'
- which _would_ be mindless and get the same result - is not
acceptable either, because it avoids one of the big improvements from
using the right interface, namely having compiler type checking (and
saner code that people understand).

So NAK. No broken automated scripting patches.

               Linus

