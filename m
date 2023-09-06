Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00335793CA4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 14:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596569.930490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdreJ-00038P-PJ; Wed, 06 Sep 2023 12:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596569.930490; Wed, 06 Sep 2023 12:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdreJ-00036i-MS; Wed, 06 Sep 2023 12:28:47 +0000
Received: by outflank-mailman (input) for mailman id 596569;
 Wed, 06 Sep 2023 12:28:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UMkA=EW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qdreI-00036c-HW
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 12:28:46 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eae431be-4cb0-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 14:28:43 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-500cd6261fdso6223647e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 05:28:44 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x26-20020a19e01a000000b00500d1f67be9sm2774671lfg.43.2023.09.06.05.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 05:28:43 -0700 (PDT)
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
X-Inumbo-ID: eae431be-4cb0-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694003324; x=1694608124; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o2ZD6jPwNLGcVHUurMD6kEC54tTmJqEhRDaHvLcHsz0=;
        b=MUV96ftyMIxYRKfhbkkGJdA5vaqeB/Ek1wUK10v695s5tFPWj6/+KgwI/ICjW6oKMv
         kCSj2tU7oC3QaTNaOJI+NpnBMB7TORzemzMcwuEp35ODZ6HMhdYiq5zqJroTO2Ekww54
         yWms0IaZ/kepcKXjwMxSH2ObTtGT6629Aa5iSahxNWXzeRvaAmhdul/S2wVOAEEiegcP
         CoFxTKTma/ryExGflxZqeWQ0mmekE8Bb+IP7zrY8R4AjSv2R6IFRghKKlUBYFX9hxsx3
         tKXS2wQ1yvtcIUFqwhdF44lyrYfxlD4liuAEMkl4gIw/cMB6pKDmBrrLAk5fiSz0R6gs
         2YFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694003324; x=1694608124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2ZD6jPwNLGcVHUurMD6kEC54tTmJqEhRDaHvLcHsz0=;
        b=iOHSX5Oj2lQ1MWXDZa9eOIQqqUM0wY375JXHBeZnWW9MMV+vDQsWEblsuCnNzxeleQ
         RENW7FnRSi3tm+Xtn9noBOlsQwf6sENODW29IJ/vtQhUMSBlsb18ATaHBCQHJ8l0ws9/
         QcPG6SOkV7Yrn+6ZWkFkMztrO3W5th+E+4GTeVjP/SkU15OjxOCj72OexwkQOrLcdAMX
         I2tCi6/fc6YgyKgCvkClcxFIOH6ovRfMXgIGcR+NySnzk+uQkYKDAIxgG4aWOggRZE86
         qJkupX7sVgWxFgoZSKglDB+04zxP6zQmhH3WSw4p0tL/3mzen/uPJwhT0S7qzERJrI9c
         aQwA==
X-Gm-Message-State: AOJu0Yw+7fC7SnMi1Qb1dGmcbFJBgBN8sh0u5PCMzP3De08Wa85e0wNP
	vWVcUeaodD98PiSa1oT4b2A=
X-Google-Smtp-Source: AGHT+IGKQ+0ycDAfNw05bzB60M7PJ+AwPth5mqmHRhbL/X68GMvqKa0mGPpi+BTvcARBOC4eMcmpdw==
X-Received: by 2002:a05:6512:2108:b0:500:d960:8b6d with SMTP id q8-20020a056512210800b00500d9608b6dmr2199569lfr.33.1694003323517;
        Wed, 06 Sep 2023 05:28:43 -0700 (PDT)
Message-ID: <66fcd43cbcb176f13b5fe2aad53f659feefb9667.camel@gmail.com>
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
  Shawn Anastasio <sanastasio@raptorengineering.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 06 Sep 2023 15:28:42 +0300
In-Reply-To: <731b436d-748c-092d-0bec-dcea5bdaed29@suse.com>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
	 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
	 <731b436d-748c-092d-0bec-dcea5bdaed29@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-09-06 at 14:16 +0200, Jan Beulich wrote:
> On 01.09.2023 18:02, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/scripts/Makefile.asm-generic
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: GPL-2.0
>=20
> While this is what the Linux file presently says, you still want to
> add
> "-only", which is merely the newer name for the same thing.
>=20
> > +# include/asm-generic contains a lot of files that are used
> > +# verbatim by several architectures.
> > +#
> > +# This Makefile reads the file arch/$(SRCARCH)/include/asm/Kbuild
> > +# and for each file listed in this file with generic-y creates
> > +# a small wrapper file in $(obj)
> > (arch/$(SRCARCH)/include/generated/asm)
> > +
> > +kbuild-file :=3D $(srctree)/arch/$(SRCARCH)/include/asm/Kbuild
> > +include $(kbuild-file)
> > +
> > +include scripts/Kbuild.include
> > +
> > +# Create output directory if not already present
> > +_dummy :=3D $(shell [ -d $(obj) ] || mkdir -p $(obj))
> > +
> > +quiet_cmd_wrap =3D WRAP=C2=A0=C2=A0=C2=A0 $@
> > +cmd_wrap =3D echo "\#include <asm-generic/$*.h>" >$@
> > +
> > +all: $(patsubst %, $(obj)/%, $(generic-y))
> > +
> > +$(obj)/%.h:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(call cmd,wrap)
>=20
> You've removed quite a bit of functionality, comparing with the Linux
> original. May I ask why that is? What they have all makes sense to
> me,
> and looks to be useful down the road.
I decided to take only minimum needed now but if you think it would be
better to use the latest Linux's Makefile.asm-generic then I will
update it in the next patch version.

~ Oleksii

