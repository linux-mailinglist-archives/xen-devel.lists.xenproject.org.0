Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F5F3E4962
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 18:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165056.301638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD7jG-0000ui-MF; Mon, 09 Aug 2021 16:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165056.301638; Mon, 09 Aug 2021 16:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD7jG-0000s9-I0; Mon, 09 Aug 2021 16:02:18 +0000
Received: by outflank-mailman (input) for mailman id 165056;
 Mon, 09 Aug 2021 16:02:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gMyi=NA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mD7jF-0000ry-5N
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 16:02:17 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93813878-e0c0-4214-93f2-ef416d1faa80;
 Mon, 09 Aug 2021 16:02:15 +0000 (UTC)
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
X-Inumbo-ID: 93813878-e0c0-4214-93f2-ef416d1faa80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628524935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8lPz4JD5shX+wAaW3ECQMZqis3ZrOy7GGydYDzTJSvg=;
  b=IM7MNPdZkt0NF1qeoC6XSa6r5BUilkdMdU52nQy7S7ZqMe+wvdWTGRLg
   G8IsZY4HviNufnzrjYkac1aGvy8naGvkFKztbp2O5gBQaImEAg4ulvGSt
   lT417idmaVir3SOTzJ3hkOKJ3uuvhOfAzYUHxbZ68Yd+LFwkPPFVgsO+D
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MArjyXIyB8gpVuQpVEtHmH3HcZurhbvc4H6QoFpDryHP8gob+EI8YhRGqyB531I3cSby3L3HPF
 /WnjfGqRhgg9tzpmRat8wR1/Frv2YLjz7kzixkv3aujO1PxMiUuCnzEgF0ReKnejHYdbkLHfaX
 vWNBhtlaxKC84WWaCRnOkxroJJcaJgNsC0CwqXqChB8iWfye863AIS5ULbrmSIKDAxuVj9cvGS
 5Cgpl6OVYNc5uVPuP6PGBp27HwfIHifJMMVAJJkWCOXKUI36SYf7XgjH1eqT2CXEzWUFRf8vc7
 VdzrRyqFoH8aI+fVGkhsTCnj
X-SBRS: 5.1
X-MesageID: 50046963
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QLkMuarUOv5FAAtj2w90qQEaV5opeYIsimQD101hICG8cqSj9v
 xGuM5rsiMc6QxhPE3I9urtBEDtexzhHNtOkO8s1NSZLWzbUQmTXeJfBOLZqlWKcUDDH6xmpM
 VdmsBFeaTN5DNB7foSjjPXL+od
X-IronPort-AV: E=Sophos;i="5.84,307,1620705600"; 
   d="scan'208";a="50046963"
Date: Mon, 9 Aug 2021 16:59:34 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 21/31] build: set XEN_BUILD_EFI earlier
Message-ID: <YRFQ5ufigapRnXgr@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-22-anthony.perard@citrix.com>
 <791838fb-b69d-d471-cfff-fe984e13f6e6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <791838fb-b69d-d471-cfff-fe984e13f6e6@suse.com>

On Thu, Aug 05, 2021 at 09:27:18AM +0200, Jan Beulich wrote:
> On 01.07.2021 16:10, Anthony PERARD wrote:
> > We are going to need the variable XEN_BUILD_EFI earlier.
> > 
> > This early check is using "try-run" to allow to have a temporary
> > output file in case it is needed for $(CC) to build the *.c file.
> > 
> > The "efi/check.o" file is still needed in "arch/x86/Makefile" so the
> > check is currently duplicated.
> 
> Why is this? Can't you ...
> 
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -126,7 +126,7 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
> >  ifneq ($(efi-y),)
> >  
> >  # Check if the compiler supports the MS ABI.
> > -export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
> > +XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
> >  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
> 
> ... use here what you ...
> 
> > --- a/xen/arch/x86/arch.mk
> > +++ b/xen/arch/x86/arch.mk
> > @@ -60,5 +60,10 @@ ifeq ($(CONFIG_UBSAN),y)
> >  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
> >  endif
> >  
> > +ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
> > +# Check if the compiler supports the MS ABI.
> > +export XEN_BUILD_EFI := $(call try-run,$(CC) $(CFLAGS) -c arch/x86/efi/check.c -o "$$TMPO",y)
> > +endif
> 
> ... export here?

The problem with the check for EFI support is that there several step,
with a step depending on the binary produced by the previous one.

XEN_BUILD_EFI
    In addition to check "__ms_abi__" attribute is supported by $CC, the
    file "efi/check.o" is produced.
XEN_BUILD_PE
    It is using "efi/check.o" to check for PE support and produce
    "efi/check.efi".
"efi/check.efi" is also used by the Makefile for additional checks
(mkreloc).


So, if I let the duplicated check for $(XEN_BUILD_EFI) is that it felt
wrong to produce "efi/check.o" in "arch/x86/arch.mk" and then later use
it in "arch/x86/Makefile". I could maybe move the command that create
efi/check.o in the $(XEN_BUILD_PE) check, or I could try to move most of
the checks done for EFI into x86/arch.mk. Or maybe just creating the
"efi/check.o" file in x86/arch.mk and use it in x86/Makefile, with a
comment.

What do you think?

Thanks,

-- 
Anthony PERARD

