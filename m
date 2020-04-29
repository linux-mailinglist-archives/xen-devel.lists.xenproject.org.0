Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CAA1BD6D6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 10:07:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jThkd-00006o-QJ; Wed, 29 Apr 2020 08:07:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/uTc=6N=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jThkd-00006i-0O
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 08:07:27 +0000
X-Inumbo-ID: 763a71cc-89f0-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 763a71cc-89f0-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 08:07:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j1so1360725wrt.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2020 01:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ax/00jztm/qnemFteNHTg0gbhwqdcLui9LbTXg76E5k=;
 b=dDLsXhupuinNGpg5xkRKzJWfoxsiuGHHPtNhmNedrrz/A/+UvUbdHEW6K6E2UvY6ZT
 i5Ufo8hCxjCAwZffnWpqVNDwNV3Nr597TcrfkfmLekDJ4b28DLo3bSlMyNoAWcJcvLIK
 /1WnYwxr7+mLTANoSGBc8mZvLekY4CTZPzkSYbsfEXs5YegBY3OLNAOziopDNnOCQi+d
 Y9aF4A5sT52oDkS8HjKuvZMRrGQo2ZR9VEefITgfFVbXweXFYWvZr6iX4dgGfFfurCxu
 dayP7s5xzjgYf49ZjbtVoXHHdRUVkr6dJDbHD9oBbuhFacO7axo/YS+T1X0rVsiD1RPh
 W3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ax/00jztm/qnemFteNHTg0gbhwqdcLui9LbTXg76E5k=;
 b=Euo2yFGNengqz6qvSHbikYE+6YlcoW9xs7ZAyoD2/ynQCgPL/6tI9dSYmSyP2V49mt
 NGVIHXdg0NHgCEijHE8AVmj+SqCPNczLICAdnL3F0ouASLXs+Mv7XhKGp9aoTpnE7azX
 214w3VoxwQ9OwgR5vliYlXS+OL+7NsJmmnRAelhkLxcCL0WWCdUg5MCaRIStODwY1g/C
 AA9v6Yf9HNy++qunJK3euwD3yL08avr53jxolp8cnUZ6mu6lWdTGATWl1l87q5hF5uVv
 C28DM8qR1Z4lqC7v5Roqn64WWeNb6a0/LWqS5dHi/NFfGzdUfg3CaP4OCWYYdX38T9zT
 dzVA==
X-Gm-Message-State: AGi0Puar0rFF6GKDjbbfBBSqUBr3bcS0aQyV9Xydx+xCJApJgFR0T8UQ
 LfkcQSi80x3XJPS8oijIL/M=
X-Google-Smtp-Source: APiQypI6cFaukOff+Om1OyGYSBYy0HdNoxXqnGGwg7wGAhZ/qZmmPxhAD0dd/UYBlieQpyB7HvLsrA==
X-Received: by 2002:a5d:6844:: with SMTP id o4mr1605691wrw.392.1588147645328; 
 Wed, 29 Apr 2020 01:07:25 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id v16sm6512863wml.30.2020.04.29.01.07.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Apr 2020 01:07:24 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Grzegorz Uriasz'" <gorbak25@gmail.com>,
	<qemu-devel@nongnu.org>
References: <20200429030409.9406-1-gorbak25@gmail.com>
 <20200429030409.9406-2-gorbak25@gmail.com>
In-Reply-To: <20200429030409.9406-2-gorbak25@gmail.com>
Subject: RE: [PATCH v2 1/2] Fix undefined behaviour
Date: Wed, 29 Apr 2020 09:07:22 +0100
Message-ID: <002001d61dfd$37500210$a5f00630$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFtlR//ELGf2l/FYLvu2IzrckebEAJdwmQ+qU3eScA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: artur@puzio.waw.pl, 'Stefano Stabellini' <sstabellini@kernel.org>,
 jakub@bartmin.ski, marmarek@invisiblethingslab.com,
 'Anthony Perard' <anthony.perard@citrix.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Grzegorz Uriasz <gorbak25@gmail.com>
> Sent: 29 April 2020 04:04
> To: qemu-devel@nongnu.org
> Cc: Grzegorz Uriasz <gorbak25@gmail.com>; =
marmarek@invisiblethingslab.com; artur@puzio.waw.pl;
> jakub@bartmin.ski; j.nowak26@student.uw.edu.pl; Stefano Stabellini =
<sstabellini@kernel.org>; Anthony
> Perard <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; =
xen-devel@lists.xenproject.org
> Subject: [PATCH v2 1/2] Fix undefined behaviour
>=20
> This patch fixes qemu crashes when passing through an IGD device to =
HVM guests under XEN. The problem
> is that on almost every laptop
> reading the IGD ROM from SYSFS will fail, the reason for it is that =
the IGD rom is polymorphic and it
> modifies itself
> during bootup - this results in an invalid rom image - the kernel =
checks whether the image is valid
> and when that's not the case
> it won't allow userspace to read it. It seems that when the code was =
first written(xen_pt_load_rom.c)
> the kernel's back then didn't check
> whether the rom is valid and just passed the contents to userspace - =
because of this qemu also tries
> to repair the rom later in the code.
> When stating the rom the kernel isn't validating the rom contents so =
it is returning the proper size
> of the rom(32 4kb pages).
>=20
> This results in undefined behaviour - pci_assign_dev_load_option_rom =
is creating a buffer and then
> writes the size of the buffer to a pointer.
> In pci_assign_dev_load_option_rom under old kernels if the fstat would =
succeed then fread would also
> succeed - this means if the buffer
> is allocated the size of the buffer will be set. On newer kernels this =
is not the case - on all
> laptops I've tested(spanning a few
> generations of IGD) the fstat is successful and the buffer is =
allocated but the fread is failing - as
> the buffer is not deallocated
> the function is returning a valid pointer without setting the size of =
the buffer for the caller. The
> caller of pci_assign_dev_load_option_rom
> is holding the size of the buffer in an uninitialized variable and is =
just checking whether
> pci_assign_dev_load_option_rom returned a valid pointer.
> This later results in cpu_physical_memory_write(0xc0000, =
result_of_pci_assign_dev_load_option_rom,
> unitialized_variable) which
> depending on the compiler parameters, configure flags, etc... might =
crash qemu or might work - the xen
> 4.12 stable release with default configure
> parameters works but changing the compiler options slightly(for =
instance by enabling qemu debug)
> results in qemu crashing =C2=AF\_(;-;)_/=C2=AF
>=20
> The only situation when the original pci_assign_dev_load_option_rom =
works is when the IDG is not the

I think you mean IGD

> boot gpu - this won't happen on any laptop and
> will be rare on desktops.
>=20
> This patch deallocates the buffer and returns NULL if reading the =
VBIOS fails - the caller of the
> function then properly shuts down qemu.
> The next patch in the series introduces a better method for getting =
the vbios so qemu does not exit
> when pci_assign_dev_load_option_rom fails -
> this is the reason I've changed error_report to warn_report as whether =
a failure in
> pci_assign_dev_load_option_rom is fatal
> depends on the caller.
>=20
> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>

With the typo fixed...

Reviewed-by: Paul Durrant <paul@xen.org>


