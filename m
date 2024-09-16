Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90A997A582
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 17:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799606.1209599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqE0o-0005pN-LM; Mon, 16 Sep 2024 15:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799606.1209599; Mon, 16 Sep 2024 15:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqE0o-0005nW-Im; Mon, 16 Sep 2024 15:51:38 +0000
Received: by outflank-mailman (input) for mailman id 799606;
 Mon, 16 Sep 2024 15:51:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CfyS=QO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sqE0n-0005nP-8L
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 15:51:37 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c108e4c-7443-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 17:51:33 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso4570508e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 08:51:33 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a8609sm927591e87.220.2024.09.16.08.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:51:31 -0700 (PDT)
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
X-Inumbo-ID: 8c108e4c-7443-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726501893; x=1727106693; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MZH1fJKlApRkPe9mC+ZK6fIK/iKyznNyK9qKqBhFdrU=;
        b=CA1QBVJrzysto4vWQe2+x62SBqMR2uRgPwgeh5WbX094rJRLYM7cPzcakOjHh271r9
         /OHnPiAQGNW6DRni28wtZau1Bk4tTJObd7O3BAar4jmKhgW0qEk0qeS/hvXxIr4iqHXu
         JxPengl/qG/qQewD7UOdZQIHDOh5drcb//Ac/tXzvfXIwEz9wMuAJ2RAyS7xYp6LqzIP
         niIQXgqwE50wgevei1WsnnR5cgRdH3+3HKL3XDg67Q+a0Nk3gFnYBa0i4wqIoYM7q0ly
         wfaGWsOYhU/i7RGpk6Y97c1SqAYbgZtbEhPg0XkYmbr8w41j8+WCoNgUXME4LQ/7fCcA
         KsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726501893; x=1727106693;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZH1fJKlApRkPe9mC+ZK6fIK/iKyznNyK9qKqBhFdrU=;
        b=EkgejYIPU4zDpSdXaq3xTKK2KatANO18X53R6D8FFxcXl31swQiAVlk/KznM9k7vnL
         L2oaO2zjzNPpn7LstdSUMTpCHXUgyqaYT6coub+tiNbhP5qf5YFJZOxmxsCMK46X5c5c
         yzo3/oSdP2J2YmlY1fcQJLkVNyd9dXDMhHBnxRPPnNffTyQ+isxCBQTrJeWeaVYksSmh
         Tu+b4RgM3mdn54451Y538KimeXdC87KnpAuJ2R+skVfnfMzHYpnTzjTDsCMdxYTEP6Sb
         AvViuhbeVt93advTVH6VM6eIP3UgWOjJ59nw8rXRCQU/ofWfxReQjghCKBVfafPisenP
         IVEw==
X-Forwarded-Encrypted: i=1; AJvYcCV6+rqJ+e4otitGk4uZdMMaXvvEdtNCfz8At7XT6YO5/b1RJc86HylUomq9EsV9mCxD5aZoxL3M88o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySks2mREBrui1kp2f0nktCwzNPOIEhricfzBo79dCfz+ZjZUnB
	7gb5shl1yk0Sm55KL5JTC5zP86rw2lMOZ8+gJ0KrQYgxk2Q5eAkJ
X-Google-Smtp-Source: AGHT+IFzdQxZSPt+6J3p8S3/M0s3yLVw1mjHTwhkkQ7QsPWLs0GQKkllixdrMm0msFBlyMQ99B/OAQ==
X-Received: by 2002:a05:6512:114c:b0:52e:9921:6dff with SMTP id 2adb3069b0e04-5367fee53f2mr8029219e87.26.1726501891801;
        Mon, 16 Sep 2024 08:51:31 -0700 (PDT)
Message-ID: <4b3e6a39732bd674fcd4498cc5900f11b99044b3.camel@gmail.com>
Subject: Re: [PATCH v1 3/3] xen/common: move device initialization code to
 common code
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 xen-devel@lists.xenproject.org
Date: Mon, 16 Sep 2024 17:51:30 +0200
In-Reply-To: <f324c131-9446-4444-b5f7-65d851b2be3b@suse.com>
References: <cover.1726048521.git.oleksii.kurochko@gmail.com>
	 <128d17f3625807a26875b7a419fb56610424b18c.1726048521.git.oleksii.kurochko@gmail.com>
	 <9764051a-c4a7-4c3d-9760-1f80d5faa559@suse.com>
	 <f3a16db18f98a4fff3a4b59f144d4a2fee815465.camel@gmail.com>
	 <f324c131-9446-4444-b5f7-65d851b2be3b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-09-13 at 19:45 +0200, Jan Beulich wrote:
> On 13.09.2024 16:35, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Thu, 2024-09-12 at 17:28 +0200, Jan Beulich wrote:
> > > On 11.09.2024 12:04, Oleksii Kurochko wrote:
> > > > --- a/xen/common/Makefile
> > > > +++ b/xen/common/Makefile
> > > > @@ -6,6 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) +=3D config_data.o
> > > > =C2=A0obj-$(CONFIG_CORE_PARKING) +=3D core_parking.o
> > > > =C2=A0obj-y +=3D cpu.o
> > > > =C2=A0obj-$(CONFIG_DEBUG_TRACE) +=3D debugtrace.o
> > > > +obj-$(call or,$(CONFIG_HAS_DEVICE_TREE),$(CONFIG_HAS_ACPI)) +=3D
> > > > device.o
> > >=20
> > > I can't spot any HAS_ACPI in the tree. And if this was switched
> > > to
> > > CONFIG_ACPI
> > > I'd further ask why the file needs building on x86.
> > Oh, there is no need for building this on x86. With what you
> > suggested
> > here ...
> >=20
> > >=20
> > > Also I think I'd prefer to avoid the of the "or" macro here:
> > >=20
> > > obj-$(CONFIG_ACPI) +=3D device.o
> > > obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device.o
> > ... IIUC it will fix the issue with building this file for x86 as
> > CONFIG_ACPI depends on (ARM_64 && ARM_EFI).
>=20
> Except that "depends on" is itself Arm-only, so won't affect x86.
> Or else x86 would end up without ACPI support, which would mean
> full breakage on about every system.
There is another CONFIG_ACPI in xen/drivers/acpi which is equal to 'y'
for x86 so it seems to me that it is needed another config (
GENERIC_DEVICE_INIT ? ) which will be disabled for x86 by default so
device.o won't be compiled for x86.

Have I overlooked something or better option exist? Probably it would
be better to use "and" macro?

~ Oleksii

