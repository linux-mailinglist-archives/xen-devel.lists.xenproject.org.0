Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAFE97E7EB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 10:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801728.1211714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssenU-0006dF-0t; Mon, 23 Sep 2024 08:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801728.1211714; Mon, 23 Sep 2024 08:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssenT-0006bM-U4; Mon, 23 Sep 2024 08:51:55 +0000
Received: by outflank-mailman (input) for mailman id 801728;
 Mon, 23 Sep 2024 08:51:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81ci=QV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ssenS-0006bG-Op
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 08:51:54 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13fc1297-7989-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 10:51:52 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c5b6161022so3197026a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 01:51:52 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bc8907asm10442163a12.85.2024.09.23.01.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 01:51:51 -0700 (PDT)
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
X-Inumbo-ID: 13fc1297-7989-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727081512; x=1727686312; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ujaZeKB+jCAfidZqKW/ErZv7KBtPopq63jX0xPchG2k=;
        b=l7+Clx+m1P8kmg6g4js3obWtW158ADXIG8M6thnntziGP3ZLfGz/MogACRxa9luZ1/
         uPYilFFithl/Iyntoap0Ljno2fiu+nJJuflmTLuaF26SXnx09bcUlMLoTkcxF8KmhrkE
         BPbkatdgui0hO0aGeky9PULWbWVg3qhYOJ5KVUZFsuR67zyz+BMjqb99B14LcL/hj3ps
         k642nJZSy3YcB1zTqRvfu5KFRRmN9QQROr6Gt09OQR9bmI6LLef09nHOe1RwqDJ5MSFz
         ncTuEQfumY/gAZABLpOcP7URdJ0kgR1Pe5vV2SldEeSirpM+IGmrrqUfcdd4x346sLpy
         9+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727081512; x=1727686312;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ujaZeKB+jCAfidZqKW/ErZv7KBtPopq63jX0xPchG2k=;
        b=QRrCahosOrvl1ryiebSN9yC6W0UqCHP7IBiseF8x7hb/2l8YPK8cmvhCGGZpHfz/pW
         z/EKuLTqLHptHIw+WkC3FFEARuY0L9iZV7sMf2lOBt1QI1ktAVLJVT3xfETYFqHHh2Wt
         1DqcCwvl71RrzJGaC/2i1AqX+YDqHLMkwb6OnEFUEqfuaCHIP0oVqLeo/JUM9dfN4Htr
         J+XP8fFQPOehYhGk7M4wHPx6588JA8w9S4+FV3ssDRN5AvVg0y3fmMMfbAsj/cNPHSFY
         9uYaCyR1fpdNpBLVfhawvDxobFbZ93W3upIbqF5aTb0SxMO4YScFMPyWGZ/N2Y1Uldq3
         oUOg==
X-Forwarded-Encrypted: i=1; AJvYcCXYYU1pztsuN/cDoLx2btAB0bHiu2vnFe2LQ/8FSpRu8ep5VRQ7/TFx4xckdMP6joCUEXzR1zmkFwM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGIniJYAbnEwAqYrfCaY8G1OV4W6Oy4BeH5KmN56y3bYomGlvz
	hqTLAeXGYTuwieVIRyeYO4byNe/8iPWN9EsZHFfjj54t0YOzPlI0
X-Google-Smtp-Source: AGHT+IHsn26Uh+pCIzQRDLfurSDa5G5zU+f1720If6xlozTUMIkvHDOQMp7ng7kWSdGCu3oRmZtA/A==
X-Received: by 2002:a05:6402:51c9:b0:5c4:1320:e5a3 with SMTP id 4fb4d7f45d1cf-5c464a3f71emr9188498a12.16.1727081511471;
        Mon, 23 Sep 2024 01:51:51 -0700 (PDT)
Message-ID: <0c236a05ca8525d3277f14a8520cebbfa4b34a4d.camel@gmail.com>
Subject: Re: [PATCH v1 3/3] xen/common: move device initialization code to
 common code
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 xen-devel@lists.xenproject.org
Date: Mon, 23 Sep 2024 10:51:50 +0200
In-Reply-To: <45d0c472-8e9a-4e07-9aa1-1b2990c41f75@suse.com>
References: <cover.1726048521.git.oleksii.kurochko@gmail.com>
	 <128d17f3625807a26875b7a419fb56610424b18c.1726048521.git.oleksii.kurochko@gmail.com>
	 <9764051a-c4a7-4c3d-9760-1f80d5faa559@suse.com>
	 <f3a16db18f98a4fff3a4b59f144d4a2fee815465.camel@gmail.com>
	 <f324c131-9446-4444-b5f7-65d851b2be3b@suse.com>
	 <4b3e6a39732bd674fcd4498cc5900f11b99044b3.camel@gmail.com>
	 <45d0c472-8e9a-4e07-9aa1-1b2990c41f75@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-23 at 09:20 +0200, Jan Beulich wrote:
> On 16.09.2024 17:51, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Fri, 2024-09-13 at 19:45 +0200, Jan Beulich wrote:
> > > On 13.09.2024 16:35, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > On Thu, 2024-09-12 at 17:28 +0200, Jan Beulich wrote:
> > > > > On 11.09.2024 12:04, Oleksii Kurochko wrote:
> > > > > > --- a/xen/common/Makefile
> > > > > > +++ b/xen/common/Makefile
> > > > > > @@ -6,6 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) +=3D config_data.o
> > > > > > =C2=A0obj-$(CONFIG_CORE_PARKING) +=3D core_parking.o
> > > > > > =C2=A0obj-y +=3D cpu.o
> > > > > > =C2=A0obj-$(CONFIG_DEBUG_TRACE) +=3D debugtrace.o
> > > > > > +obj-$(call
> > > > > > or,$(CONFIG_HAS_DEVICE_TREE),$(CONFIG_HAS_ACPI)) +=3D
> > > > > > device.o
> > > > >=20
> > > > > I can't spot any HAS_ACPI in the tree. And if this was
> > > > > switched
> > > > > to
> > > > > CONFIG_ACPI
> > > > > I'd further ask why the file needs building on x86.
> > > > Oh, there is no need for building this on x86. With what you
> > > > suggested
> > > > here ...
> > > >=20
> > > > >=20
> > > > > Also I think I'd prefer to avoid the of the "or" macro here:
> > > > >=20
> > > > > obj-$(CONFIG_ACPI) +=3D device.o
> > > > > obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device.o
> > > > ... IIUC it will fix the issue with building this file for x86
> > > > as
> > > > CONFIG_ACPI depends on (ARM_64 && ARM_EFI).
> > >=20
> > > Except that "depends on" is itself Arm-only, so won't affect x86.
> > > Or else x86 would end up without ACPI support, which would mean
> > > full breakage on about every system.
> > There is another CONFIG_ACPI in xen/drivers/acpi which is equal to
> > 'y'
> > for x86 so it seems to me that it is needed another config (
> > GENERIC_DEVICE_INIT ? ) which will be disabled for x86 by default
> > so
> > device.o won't be compiled for x86.
> >=20
> > Have I overlooked something or better option exist? Probably it
> > would
> > be better to use "and" macro?
>=20
> I'm afraid I don't understand your response. There are two seemingly
> separate ACPI in distinct Kconfig files, yes. They combine when both
> are
> visible to kconfig (as is the case for Arm64). Can you try to re-
> express
> your question with this aspect in mind?

I wanted to say that we can't simply rely on CONFIG_ACPI and
CONFIG_HAS_DEVICE_TREE to determine if device.o should be compiled
because, in the case of x86, CONFIG_ACPI=3Dy, device.o will be compiled
and result in compilation errors.

~ Oleksii


