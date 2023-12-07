Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110C6808B0D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:51:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649949.1015128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFia-0005cs-Kw; Thu, 07 Dec 2023 14:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649949.1015128; Thu, 07 Dec 2023 14:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFia-0005Zl-Hh; Thu, 07 Dec 2023 14:51:12 +0000
Received: by outflank-mailman (input) for mailman id 649949;
 Thu, 07 Dec 2023 14:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0Pn=HS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBFiZ-0005Zf-Gt
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 14:51:11 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ea07f16-9510-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 15:51:09 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c2c65e6aaso4869645e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 06:51:09 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 qo3-20020a170907874300b00a1dc4307ecfsm909996ejc.188.2023.12.07.06.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 06:51:08 -0800 (PST)
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
X-Inumbo-ID: 0ea07f16-9510-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701960669; x=1702565469; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xPWs7+6cb4CyFEf01u8dt/t17I7rUtlNovTWZ2bc5D0=;
        b=DdS9r4aVAGJdl9gGOUw0zwKtd++hFyuomkrLR7GFZ2Q1b3qXE52T99q0DTjCdiqeVq
         PoguHD5no10YjZZVFVIvJ+IbgtT2Bm7AnBO6H5tLPQ0BJ4+w7qLonZxqlDkOyED5MPv1
         dow3+UwJKICkClIE9FzcFTz3d5Kwg87ibN0CfifrEbnjR1rMWbr7drReL7CLVYg2PdPm
         qUWj29lmgH2R5csilGy7QyhNTJPoAMQn+CCAFRBMZdiFt5b71bD0K5oSIo+4D7rX0zcc
         D4fQeLnhuUXytTg/BxBbjNbFN7ZASjkqL54cgJ4noABQ+kMkDc2qukoZ/IdE3/89RjbY
         q6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701960669; x=1702565469;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPWs7+6cb4CyFEf01u8dt/t17I7rUtlNovTWZ2bc5D0=;
        b=xOMx1mcVgdtyEby9NmtHdYtzDepHNez4QZnN8BxS1ys4l2TEJIM7rj/YHXoephtz9U
         Q4PYI21TnSSdbay7oQeVnGzymrCWkp1Rz0INLqBEXxyAY073v0IpxdoZw5PpVMnQlj6s
         w796NkA7ZeYBWQRRafmPnZco1mL5JRZOjFxH0ifS13hHIjZKq12jg2++rCz91+QbrFx0
         Mf0r4aQdA2yOHoBX0Eonvgui21+EvMku/BKNGNa0JZ5YiuV2I1z7Z5GNsFa+EeZ314Hu
         uOB2ET7IU/frjtGkLGKs9LkTaxtclqamiTB7HOCeNUnnzLPgqhxL17/5N6b2AzFXDUZU
         Mbrg==
X-Gm-Message-State: AOJu0YyHofPUEdX3tOzLWhgR5ZNwnlCw4PmFUYufFzifPNp7FSXkwYEV
	KHs3+VBhy7EtKMvVCba5ebI=
X-Google-Smtp-Source: AGHT+IErhR3Jr+XXGIVudKYRNaavw8ccw76vD/fru5vTR0s+9Pv3S8hSMhOmaWbEzIJ9zxsn8Zc2ug==
X-Received: by 2002:a05:600c:2296:b0:40c:6bf:a924 with SMTP id 22-20020a05600c229600b0040c06bfa924mr1488537wmf.78.1701960668661;
        Thu, 07 Dec 2023 06:51:08 -0800 (PST)
Message-ID: <decb178a72c48549d721a7da88459b35ac443f52.camel@gmail.com>
Subject: Re: [PATCH v2 01/39] xen/riscv: disable unnecessary configs
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>, Alistair Francis <alistair.francis@wdc.com>, Bob
	Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Date: Thu, 07 Dec 2023 16:51:07 +0200
In-Reply-To: <4064be07-747e-4b9c-b5da-9935aa13d91f@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <b4e85f8f58787b4d179022973ce25673d6b56e36.1700761381.git.oleksii.kurochko@gmail.com>
	 <fdfda320-b73b-4830-8f1b-d261b02bcdde@suse.com>
	 <22fa451f7b165a00082443a35077e98e101c22e4.camel@gmail.com>
	 <008d0c66-6816-4d12-9e1f-1878e982f9fc@suse.com>
	 <09d24b36380027df21d547de438da10e01eda0e0.camel@gmail.com>
	 <4064be07-747e-4b9c-b5da-9935aa13d91f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-07 at 15:11 +0100, Jan Beulich wrote:
> On 07.12.2023 14:44, Oleksii wrote:
> > On Thu, 2023-12-07 at 11:00 +0100, Jan Beulich wrote:
> > > On 07.12.2023 10:22, Oleksii wrote:
> > > > On Tue, 2023-12-05 at 16:38 +0100, Jan Beulich wrote:
> > > > > > On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > > > > > > > The patch also fixes the build script as conf util
> > > > > > > > expects
> > > > > > > > to have each config on separate line.
> > > > > >=20
> > > > > > The approach doesn't really scale (it's already odd that
> > > > > > you
> > > > > > add
> > > > > > the
> > > > > > (apparently) same set four times. There's also zero
> > > > > > justification
> > > > > > for
> > > > > > this kind of an adjustment (as per discussion elsewhere I
> > > > > > don't
> > > > > > think
> > > > > > we should go this route, and hence arguments towards
> > > > > > convincing
> > > > > > me
> > > > > > [and
> > > > > > perhaps others] would be needed here).
> > > > I agree that this may not be the best approach, but it seems
> > > > like
> > > > we
> > > > don't have too many options to turn off a config for
> > > > randconfig.
> > > >=20
> > > > To be honest, in my opinion (IMO), randconfig should either be
> > > > removed
> > > > or allowed to fail until most of the functionality is ready.
> > > > Otherwise,
> > > > there should be a need to introduce HAS_* or depend on
> > > > 'SUPPORTED_ARCHS' for each config, or introduce a lot of stubs.
> > > >=20
> > > > Could you please suggest a better option?
> > >=20
> > > As to dropping randconfig tests, I'd like to refer you to Andrew,
> > > who
> > > is of the opinion that it was wrong to drop them for ppc. (I'm
> > > agreeing
> > > with him when taking a theoretical perspective, but I'm not happy
> > > with
> > > the practical consequences.)
> > >=20
> > > As to a better approach: Instead of listing the same set of
> > > options
> > > several times, can't there be a template config which is used to
> > > force
> > > randconfig to not touch certain settings? In fact at least for
> > > non-
> > > randconfig purposes I thought tiny64_defconfig /
> > > riscv64_defconfig
> > > already serve kind of a similar purpose. Imo the EXTRA_*CONFIG
> > > overrides
> > > are there for at most very few special case settings, not for
> > > purposes
> > > like you use them here.
> > The template will be the really a good option.
> >=20
> > What do you think about the following patch which introduces arch-
> > specific allrandom.config?
> >=20
> > diff --git a/xen/Makefile b/xen/Makefile
> > index ca571103c8..cb1eca76c2 100644
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
> > =C2=A0# *config targets only - make sure prerequisites are updated, and
> > descend
> > =C2=A0# in tools/kconfig to make the *config target
> > =C2=A0
> > +ARCH_ALLRANDOM_CONFIG :=3D
> > $(srctree)/arch/$(SRCARCH)/configs/allrandom.config
> > +
> > =C2=A0# Create a file for KCONFIG_ALLCONFIG which depends on the
> > environment.
> > =C2=A0# This will be use by kconfig targets
> > allyesconfig/allmodconfig/allnoconfig/randconfig
> > =C2=A0filechk_kconfig_allconfig =3D \
> > =C2=A0=C2=A0=C2=A0=C2=A0 $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)), e=
cho
> > 'CONFIG_XSM_FLASK_POLICY=3Dn';) \
> > -=C2=A0=C2=A0=C2=A0 $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG)=
;) \
> > +=C2=A0=C2=A0=C2=A0 $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCONFIG)=
; \
> > +=C2=A0=C2=A0=C2=A0 $(if $(wildcard $(ARCH_ALLRANDOM_CONFIG)), cat
> > $(ARCH_ALLRANDOM_CONFIG);) ) \
> > =C2=A0=C2=A0=C2=A0=C2=A0 :
>=20
> Something along these lines may be okay, but why would the name be
> "allrandom" when the config is used elsewhere as well?
The naming is not optimal. "unused.config" or "ignored.config" would be
a better choice.

>  Further, besides
> keeping randconfig and all*config from creating unusable configs, it
> will at least want considering whether in other cases that set of
> fixed
> values shouldn't be used as well then.
If I understood you correctly, the other case is *defconfig targets.
Therefore, the following targets might also need to be updated by
merging "unused.config" with {defconfig,%_defconfig}:


defconfig: $(obj)/conf
ifneq ($(wildcard
$(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
	@$(kecho) "*** Default configuration is based on
'$(KBUILD_DEFCONFIG)'"
	$(Q)$< $(silent) --
defconfig=3Darch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
else
	@$(kecho) "*** Default configuration is based on target
'$(KBUILD_DEFCONFIG)'"
	$(Q)$(MAKE) -f $(srctree)/Makefile $(KBUILD_DEFCONFIG)
endif

%_defconfig: $(obj)/conf
	$(Q)$< $(silent) --defconfig=3Darch/$(SRCARCH)/configs/$@
$(Kconfig)

However, I believe it's possible that for *defconfig, a configuration
should be set to N, but in randconfig, it is still acceptable to be set
to Y.

~ Oleksii

