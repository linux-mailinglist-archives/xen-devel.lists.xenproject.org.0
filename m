Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C18A46BA0E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 12:24:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240951.417756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYZt-00028n-I0; Tue, 07 Dec 2021 11:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240951.417756; Tue, 07 Dec 2021 11:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYZt-00026E-Er; Tue, 07 Dec 2021 11:24:09 +0000
Received: by outflank-mailman (input) for mailman id 240951;
 Tue, 07 Dec 2021 11:24:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjJF=QY=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muYZr-000268-Sq
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 11:24:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2faa8950-5750-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 12:24:06 +0100 (CET)
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
X-Inumbo-ID: 2faa8950-5750-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638876246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IntWDxNmwzVjFV5s9kyYqX93aucXyxvwnepZDEDAcag=;
  b=dpwKIHkCrEqgXb5FXPFq/vvu5+cZhB8o2z6WyhqmOeG7UwZ/7IuLAAId
   6iRmHLQa+hDp4Begt31cf0pc/XZFEqF3OKDc8fgX450Y4wWu97QJmbLnF
   T6qZFcBIX+IcncldLLqj2JNtyHkZVVSCw8j+i6/pdnSuIhah2EoiBHM+h
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: c+HkDxazBjVl/++AjhAJ8ql8CneRxe0U7oNlZFzeNJ91Vy8xKmji3uYpWNioDHyuPL2jPDF6oI
 GgfjHUl4Nc34XQFtAtVj7aRnoE/MjlRW1R7QnVeYmogFC/rgj+W/e5ynwgvnU4wtDz8XgrPxIf
 5df79F1LroGXjTPVf4bIPFgZ2Bm/2nGc+JxtPsNjr1auFEqIuyNITy0Jx9TRiStGJXw2+WIv03
 /QEmG43ymVIlQeUuqcMUzZ8C7tFm/bn9r0c27/VIVlIr/8dVSRsLUpVSdzgi7QQNo0jMLc0eF2
 yuR8HF634aTwh0d+3xEfVEW6
X-SBRS: 5.1
X-MesageID: 58950530
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:850E96wUiW+8PV2rI056t+edwSrEfRIJ4+MujC+fZmUNrF6WrkUPm
 DZJXGrUO67fNmXyetxzaIi19UhQvJTTzNI3TAs5/yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wbZm2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/t7x
 e1InoWIcgosb5T9lLgtUhZ9Ei4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25AfQK6DP
 JJxhTxHTTPZYCVvAhQrVJthmt3z22nGciZhkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKoYGaek7PdsjBuWz3YKFRwNfVKhpL+yjUvWc+xYL
 0sY6y8/t58Y/UagTsT+dxCgqXvCtRkZM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht9HjCCFrsbaVYWmA7brSpjS3UQAXMGsDaCksXQYDpd75r+kbjw3NZsZuFravid/4Ei22x
 CqFxBXSnJ1K05RNjf/iuwma3XT8/fAlUzLZ+C38VG+d6yhgXLWoYt2R2FSH3fdPCYeWGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsIGexO
 CfuVRVtCIi/1ZdARYt+eMqPBssj1sAM/vy1B6mPPrKijnWcHTJrHR2Ch2bMjggBc2B2yMnT3
 Kt3lu72Uh4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgDePrlnsvve+FmLm
 zq6Cydt408AONASnwGNqdJDRbz0BSZT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7GJbIwO/tokC
 kqVAxcCoHKm3CWvAVzTNhhLNeO+Nb4i/ClTFXF9Yj6VN40LPN/HAFE3LMBsI9HKNYVLkJZJc
 hXyU5naX6kUFG2Yo291gFuUhNUKSSlHTDmmZ0KNCAXTtbY5H2QlI/foIVni8jcgFC2yuZdsq
 rGszFqDE5ECWx5jHIDdb/f2lwG9un0UmeRTWUrUI4YMJBWwodYycyGh3OUqJ8wsKAnYwmfI3
 QihHhpF9/LGpJU48YeViPnc/ZupCeZ3AmFTA3LfseStLSDf82f6md1AXe+EcCrzTmTx/Kn+N
 +xZw+ulaK8MnUpQspo6GLFulPps69zqrr5c7wJlAHSUMAj7VuI+eiGLhJAduLdMy7lVvRqNd
 niOotQKa6+UPM7FEUIKIFZ3ZOq0yvxJyCLZ6u44IRum6XYvrqaHS0hbIzKFlDdZcOluKIogz
 Oos5JwW5gi4hkZ4O9qKlHkJpWGFL3hGWKQ7rJAKRoTsj1NzmF1FZJXdDA7w4Y2ONIoQYhV7f
 GfMifqQnalYy2rDb2E3RCrE0udqjJgTvAxHkQ0ZLFOTl9uZ3vI60XW9K9jsoti5Gvmf799OB
 w==
IronPort-HdrOrdr: A9a23:IYAl/Koiv24o6Bzv3Xe4cf8aV5oreYIsimQD101hICG8cqSj+f
 xGuM5rsSMc6QxhPU3I9ursBEDtex/hHNtOkO4s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkZNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.87,293,1631592000"; 
   d="scan'208";a="58950530"
Date: Tue, 7 Dec 2021 11:23:47 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v8 07/47] build: set ALL_OBJS to main Makefile; move
 prelink.o to main Makefile
Message-ID: <Ya9EQwNETQ6BPlma@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-8-anthony.perard@citrix.com>
 <b4bde105-094d-067a-4657-a7ff041aee4a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b4bde105-094d-067a-4657-a7ff041aee4a@suse.com>

On Mon, Dec 06, 2021 at 05:52:51PM +0100, Jan Beulich wrote:
> On 25.11.2021 14:39, Anthony PERARD wrote:
> 
> Nit: In the title, do you mean "set ALL_OBJS in main Makefile; ..."?
> 
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -285,8 +285,21 @@ CFLAGS += -flto
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
> 
> Who's the consumer of these exports? I ask because I don't consider the
> names very suitable for exporting, and hence I'd prefer to see their
> scope limited. If e.g. it's only a single make invocation where they
> need propagating, doing so on the command line might be better.

There seems to be only one consumer, "build.mk", and only the last
$(MAKE) call in the recipe "$(TARGET)". So, it's probably fine to set
both on the command line instead of using export. I'll have a look.

> > --- a/xen/arch/arm/Rules.mk
> > +++ b/xen/arch/arm/Rules.mk
> > @@ -0,0 +1,5 @@
> > +# head.o is built by descending into arch/arm/$(TARGET_SUBARCH), depends on the
> > +# part of $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and
> > +# build head.o
> > +arch/arm/$(TARGET_SUBARCH)/head.o: arch/arm/built_in.o
> > +arch/arm/$(TARGET_SUBARCH)/head.o: ;
> 
> Can't this be a single line:
> 
> arch/arm/$(TARGET_SUBARCH)/head.o: arch/arm/built_in.o ;

Sure.

> > @@ -235,7 +218,7 @@ $(TARGET).efi: FORCE
> >  	echo '$(if $(filter y,$(XEN_BUILD_EFI)),xen.efi generation,EFI support) disabled'
> >  endif
> >  
> > -efi/buildid.o efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
> > +# These should already have been rebuilt when building the prerequisite of "prelink.o"
> >  efi/buildid.o efi/relocs-dummy.o: ;
> 
> If the comment is true in all cases, do they really still need an empty
> rule?

Yes. Those two targets are unfortunately a prerequisite of "xen.efi", so
make will look for a rule to make them, and would use %.o:%.c without
this explicit rule.

Thanks,

-- 
Anthony PERARD

