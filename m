Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF78642C008
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208360.364454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madOl-0008Ql-92; Wed, 13 Oct 2021 12:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208360.364454; Wed, 13 Oct 2021 12:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madOl-0008NN-4h; Wed, 13 Oct 2021 12:30:19 +0000
Received: by outflank-mailman (input) for mailman id 208360;
 Wed, 13 Oct 2021 12:30:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVjq=PB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1madOj-0008My-6W
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:30:17 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 517debbe-2c21-11ec-816d-12813bfff9fa;
 Wed, 13 Oct 2021 12:30:15 +0000 (UTC)
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
X-Inumbo-ID: 517debbe-2c21-11ec-816d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634128215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yXmZjJWva5u9xyCcMFIPDhgpQZW0f8qL3F2nN8fTqN8=;
  b=doXXi0Ziv3M2Dh64Ymo9lzb1a/B+/AOxNlKom4tCGEOIz9VgRDKphGOn
   MuH2d7Zs7WK1nwBm6n3Z+o9D1mytiLzeCSy37rrUYdn2MtAXp1B4RJj+k
   QlTcA7Gc0eCk/TKA9tiVyhIECkwWOThsLpWqX7rNylPwfdJAiBloKzao3
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3AoUv4QfdVr3gH5shJGdABR29/cCW2Eqiamj8IOv3MnAknhoqj6fTOPSzE/h5jUplpjCxAu4G1
 oeevbfH3EGkwVmsecwySOClbXyDKUtz0zVQsyiI3kXWMUSxModsPvMjEBTiS/856O2u7nmBr2C
 Sdbb0G+S+kQVCkr6XFaF3mBLV3QNEnYIDZ2+LQJK1fNseOYoA60IPbOx0/BNKnNNSLee5b2yBH
 auPosBlfHA9OfL+g9k04I/c33ApHKe/E4OTy/vNnlczVmTEFx9Al7ix0VbiCsiQ5fl28FZGOTW
 PJiKDXfkjHjuSpd+25lBMZ1A
X-SBRS: 5.1
X-MesageID: 54649964
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+QbTeqy8nUrCO+mZ6sx6t+eWwSrEfRIJ4+MujC+fZmUNrF6WrkUHz
 jcWDGmDM/zfa2f8f4ojPoi39RtVuZSBmtRrGlQ/+SAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7di2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt99b4
 4thq8GVcCMkNauVpuUPXggJNRgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25wQQaePO
 ZZxhTxHbQTdPx8ROmouGb0ggdeponzfMABltwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 kr4+GD+DgAfJcao4zOP+XKxhcfChSr+HokVEdWQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxYAp71CiRNT5Wxy+oVaHswQaVt4WFPc1gCmPwKfJ5weSBkAfUyVMLtchsaceRCMo/
 k+EmcvzAj5iu6HTTmiSnp+WsDezNC49PWIEIygeQmM4D8LL+d9pyEiVF5A6TfDz3oad9SzML
 y6iowIV2ZkN0Osy86iw+wn5giCht8nvd1tgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJfGsrhfZX2ZvGnUGr9VReD2jxqQGGSE2QYHInU3y9i6F5dPl6hr6zZiOFwhDM8AfTL4C
 KM4kVIMvMENVJdGgKkeXm5QNyjI5fS+fTgGfqqNBjarXnSXXFTYlM2JTRTBt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNHsyjkUj9ieDCPyL9pVI53L2mNb9RAESs+lS9z
 jqiH5HSl0U3vBPWM0E7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJY3SI6S5/F/VQKQ8x/49vr6Rp
 hmVAxYEoHKi1SyvAVjbMRhLNeKwNauTWFpmZETAy37zgCN9CWtuhY9CH6YKkU4PrbQ5k6EvF
 aVZIq1twJ1nE1z6xtjUVrGlxKQKSfhhrVPm0/ONbGdtcph+aRbO/9O4LALj+DNXVni8tNcko
 q3m3QTeGMJRSwNnBcfQSfSu01Lu4iRNxLMsBxPFcotJZUHh0Il2MCit3PU5FN4BdEfYzTyA2
 gfIXRpB/bvRo5U4+cXijLyfq9v7CPN3G0dXRjGJ7bu/OSTA0HCkxItMDLSBcTzHDTum86S+f
 +RFifr7NaRfzlpNtoN9FZdtzL4/uISz9+MLkFw8ESySPVqxC75mLn2X5uV1t/VAlu1DpA+7e
 kOT4d0Ga7+HD9zoTQwKLw0/Y+XdifxNwmvO7e44KVnR7TNs+ObVSl1bOhSBhXAPLLZxN495k
 +4ttNRPtl66gxsudN2HkjpV5yKHKXlZC/crsZQTAYnKjAs3yw4dPcyAW3GuuJzfOc9RNkQKI
 yOPgPuQjrtR8UPObn4vGCWfxuFan5kP5EhHwVJqy45lQTYZaivbBCFszAk=
IronPort-HdrOrdr: A9a23:RnbaMaM0umTQk8BcTsOjsMiBIKoaSvp037Eqv3oRdfVwSL3+qy
 nOpoV+6faaslossR0b9uxofZPwJ080lqQFhLX5X43SPzUO0VHAROoJgLcKgQeQeREWntQtrJ
 uIGJIfNDSfNzZHsfo=
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="54649964"
Date: Wed, 13 Oct 2021 13:30:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 21/51] build: set ALL_OBJS to main Makefile; move
 prelink.o to main Makefile
Message-ID: <YWbRUNgGX0sEHMUo@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-22-anthony.perard@citrix.com>
 <304c1ddc-7bbc-e942-4c5a-8395a750b13d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <304c1ddc-7bbc-e942-4c5a-8395a750b13d@suse.com>

On Mon, Oct 11, 2021 at 01:31:59PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -271,8 +271,21 @@ CFLAGS += -flto
> >  LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
> >  endif
> >  
> > +# Note that link order matters!
> > +ALL_OBJS-y                := common/built_in.o
> > +ALL_OBJS-y                += drivers/built_in.o
> > +ALL_OBJS-y                += lib/built_in.o
> > +ALL_OBJS-y                += xsm/built_in.o
> > +ALL_OBJS-y                += arch/$(TARGET_ARCH)/built_in.o
> > +ALL_OBJS-$(CONFIG_CRYPTO) += crypto/built_in.o
> > +
> > +ALL_LIBS-y                := lib/lib.a
> > +
> >  include $(BASEDIR)/arch/$(TARGET_ARCH)/arch.mk
> >  
> > +export ALL_OBJS := $(ALL_OBJS-y)
> > +export ALL_LIBS := $(ALL_LIBS-y)
> > +
> >  # define new variables to avoid the ones defined in Config.mk
> >  export XEN_CFLAGS := $(CFLAGS)
> >  export XEN_AFLAGS := $(AFLAGS)
> > @@ -393,7 +406,7 @@ $(TARGET): FORCE
> >  	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
> >  	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
> >  	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
> > -	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
> > +	$(MAKE) -f $(BASEDIR)/Rules.mk $@
> 
> This merely results in what was previously invoked from here now getting
> invoked from the very bottom of build.mk. I'm afraid I don't see why this
> is a useful change to make.

Would you rather have this following change?

    @@ -393,7 +406,8 @@ $(TARGET): FORCE
     	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
     	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
     	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
    +	$(MAKE) -f $(BASEDIR)/Rules.mk prelink.o
     	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@

That would probably be fine.

> > --- a/xen/build.mk
> > +++ b/xen/build.mk
> > @@ -56,3 +56,27 @@ arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
> >  	  sed -rne "/^[^#].*==>/{s:.*==>(.*)<==.*:\1:; s: [\$$#]: :; p;}"; \
> >  	  echo ""; \
> >  	  echo "#endif") <$< >$@
> > +
> > +# head.o is built by descending into arch/arm/$(TARGET_SUBARCH), depends on the
> > +# part of $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and
> > +# build head.o
> > +arch/arm/$(TARGET_SUBARCH)/head.o: arch/arm/built_in.o
> > +arch/arm/$(TARGET_SUBARCH)/head.o: ;
> 
> This previously lived in an Arm-specific file. Moving this here in the
> given, still Arm-specific form is imo a no-go when done alongside all
> the other good changes you're making. Is there a reason this can't go
> into xen/arch/arm/arch.mk?

This is temporary and it is removed in patch
    "build: build everything from the root dir, use obj=$subdir"
but I could move it to "arch/arm/Rules.mk" I think.

Thanks,

-- 
Anthony PERARD

