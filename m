Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466DC4291AD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206130.361631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwCF-0006Bf-9W; Mon, 11 Oct 2021 14:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206130.361631; Mon, 11 Oct 2021 14:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwCF-00068x-6V; Mon, 11 Oct 2021 14:22:31 +0000
Received: by outflank-mailman (input) for mailman id 206130;
 Mon, 11 Oct 2021 14:22:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rMo6=O7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mZwCD-00068g-LO
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:22:29 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8d05c3c-2a9e-11ec-80e0-12813bfff9fa;
 Mon, 11 Oct 2021 14:22:28 +0000 (UTC)
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
X-Inumbo-ID: a8d05c3c-2a9e-11ec-80e0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633962148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4nRljQS8nVpVHJNzZV7SnqlN3ajyLFly2XyKieHbMzk=;
  b=E8MMMxTB5Av0Bh3E98ON5aBxb0VCXpcWIj5v+j3Y5a84bWBX7nmVEpNI
   8gRtLMgyg7TW/XPL/5+TraPnAZPGFFTpOORL3pxqqfa5mwDvUdRa8ECPz
   tMefCpw0YB6z9QHY2LMKxUj+a+x3FYCMuNe6AV3HggLSOdArtydgqVpBP
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iBhIL0yiUdV9ov6YDuEZgHbCVJ4VHg9iYvSwgUNHiS2i91Ep8RzLIWxt9B9MIGwwYtTCSYvExu
 NBW1rywKJH5x04g7vhf3KW+phxIqGeQZ293ANsBbx7EKMzIu7GCenA7t9bnmFuz9EnyKGaxY62
 QcmZ+NA9Fg5/cg876rli/8/1/LQiQ3xBq/sqyx7pOEkEtDrEZtYluVYF8DA+NJ3uFJFLfKkxLm
 H0LgScduu6gG2FgRwSCylLgFUCd8C0V2YPs0Dls1CBKiJurnFbtJTy2UjP1c8KWrqo4yfYAu4E
 bedmutbtEJhH44pY5eTDLmaA
X-SBRS: 5.1
X-MesageID: 54884379
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IHucNKjvvNryy0h0qeoF7K/xX161qRcKZh0ujC45NGQN5FlHY01je
 htvWz/TPamDZ2Tzedtxa4zipBsP7MSHxoU2GQBl/iBmQ34b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg29Yx2IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /12nI6UGSsEL5aRmbhFUQR6TRpfJ6dJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauCN
 5pFMmU+BPjGSyBPOkoaEJEhoP6hg0jNNAZEhEu34qVitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoNEJWo+/gsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4KMQozFGh57vvvgfFXmoZbGB6ScYsu5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnBcE1NUizX3iMRq1EiXF4c8eEKgpoStQWmY/
 tyckMQpa1z/Z+Yw3KKn4UuPvTuoopXYJuLezlSKBjz7hu+ViYjMWmBJ1bQ5xaoQRGp6ZgPY1
 JThpyR4xLpTZX1qvHbcKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aImS5M
 ReM4FoNusQ70J6WgUlfONjZ5yMCl/mIKDgYfqqMMoomjmZZJWdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7dAhQcydgX8yq8qS6tIere2JbJY3oMNeJqZtJRmCvt/g9ej7g8
 i7vV0lG5kD4gHGbewyGZmo6MOHkXIplrGJ9NispZA76138maIepzaEea5poIuV3qL09laZ5H
 6sfZsGNIvVTUTCbqT4TWobw8d55fxOxiAPQYyf8OGojf4RtThDi88P/ele97zEHCye67JNso
 7Cp2g7Bb4AEQgBuUJTfZP61lgvjtnkBguNiGUDPJ4ALKknr9YFrLQ33j+M2fJ5QeUmSmGPC2
 l/PUxkCpOTLr4sky/XzhPiJ/9WzDu9zPktGBG2Hv7y4AjbXozi4yohaXefWIT2EDDHo+L+vb
 Pl+xu3nNKFVh05DtodxHuo5za864Nez9bZWwh49QSfOZlWvTLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd1PP6e0fw0myXJ6aVnKUr30yZ74b6bXBgAJBKLkiFccON4PY5NL
 T3NYyLKB9hTUiYXD+s=
IronPort-HdrOrdr: A9a23:qwa8nqNNUfP1FcBcTsOjsMiBIKoaSvp037Eqv3oRdfVwSL3+qy
 nOpoV+6faaslossR0b9uxofZPwJ080lqQFhLX5X43SPzUO0VHAROoJgLcKgQeQeREWntQtrJ
 uIGJIfNDSfNzZHsfo=
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54884379"
Date: Mon, 11 Oct 2021 15:21:48 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 17/51] build: set XEN_BUILD_EFI earlier
Message-ID: <YWRIfH+62TUsOqPA@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-18-anthony.perard@citrix.com>
 <6d2f9787-d156-0b06-0548-97198af644f9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6d2f9787-d156-0b06-0548-97198af644f9@suse.com>

On Thu, Oct 07, 2021 at 06:14:33PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > $(nr-fixups) is renamed to $(efi-check-relocs) as the former might be
> > a bit too generic.
> 
> While I don't mind the prefix addition, may I please ask that the rest
> of the name remain as is, i.e. $(efi-nr-fixups)? "nr" because that's
> what the variable holds, and "fixups" to distinguish from full-fledged
> relocations as well as to match commentary there.

Will change.

> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -123,41 +123,7 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
> >  	mv $(TMP) $(TARGET)
> >  
> >  ifneq ($(efi-y),)
> > -
> > -# Check if the compiler supports the MS ABI.
> > -export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
> >  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
> > -
> > -# Check if the linker supports PE.
> > -EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10
> > -XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o))
> > -# If the above failed, it may be merely because of the linker not dealing well
> > -# with debug info. Try again with stripping it.
> > -ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
> > -EFI_LDFLAGS += --strip-debug
> > -XEN_BUILD_PE := $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o)
> > -endif
> > -
> > -ifeq ($(XEN_BUILD_PE),y)
> > -
> > -# Check if the linker produces fixups in PE by default
> > -nr-fixups := $(shell $(OBJDUMP) -p efi/check.efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
> > -ifeq ($(nr-fixups),2)
> > -MKRELOC := :
> > -relocs-dummy :=
> > -else
> > -MKRELOC := efi/mkreloc
> > -relocs-dummy := efi/relocs-dummy.o
> > -# If the linker produced fixups but not precisely two of them, we need to
> > -# disable it doing so.  But if it didn't produce any fixups, it also wouldn't
> > -# recognize the option.
> > -ifneq ($(nr-fixups),0)
> > -EFI_LDFLAGS += --disable-reloc-section
> > -endif
> > -endif
> > -
> > -endif # $(XEN_BUILD_PE)
> > -
> >  endif # $(efi-y)
> 
> Is the remaining if(,) block still warranted? I.e. can't the single line
> 
> CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
> 
> live without the surrounding conditional?

Let's see, $(efi-y) depends on CONFIG_PV_SHIM_EXCLUSIVE and `sudo make
install`, but XEN_BUILD_EFI also depends on CONFIG_PV_SHIM_EXCLUSIVE and
we don't want to build in `sudo make install` so CFLAGS shouldn't be
used. So the single line without the if() block seems enough. I remove
the surrounding conditional.

Thanks,

-- 
Anthony PERARD

