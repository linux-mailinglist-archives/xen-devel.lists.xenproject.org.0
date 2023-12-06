Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482648070C6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 14:21:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649223.1013641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rArqS-0003Et-4A; Wed, 06 Dec 2023 13:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649223.1013641; Wed, 06 Dec 2023 13:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rArqS-0003Ck-1c; Wed, 06 Dec 2023 13:21:44 +0000
Received: by outflank-mailman (input) for mailman id 649223;
 Wed, 06 Dec 2023 13:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uigp=HR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rArqQ-0003Cc-Or
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 13:21:42 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 640ac783-943a-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 14:21:40 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-54c1cd8d239so7954807a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 05:21:40 -0800 (PST)
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
X-Inumbo-ID: 640ac783-943a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701868900; x=1702473700; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNYRcybAn4BGMoOijGW/sCfjDF4lv0wZiF0NA8lsD50=;
        b=fPBEsEwIrz8v/g6Y32sSF6yws2mCHTRURqV1Xd74yxZVT3k+WkqZFkBsaFVNZoDX0p
         crxEWjsgPfsnHzkjDn78NPZdHN9xA5WaIqKm+EIMzTqcTj+ZC/fwMjs4bAhiJKfQOzoP
         F6bcMRI7zKjTNRGA8dAqiRwueBdJX3y/WAphyNw4nYCjb+snlN1/cYGnTLde1Nb4OSgG
         a4SlJlEj5wM7xc4GlQvZ8mMSuuKhgu2pQG+pWPOSRO+CugeW/i3ziOTeb4XBBbDRGagQ
         PjBZhZ/Tp/ztx83MJFmGlBcI95JqnvMY7KLnv8UxkIAJYkA3/CIVf/21iPXkGLS0xQrG
         lsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701868900; x=1702473700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNYRcybAn4BGMoOijGW/sCfjDF4lv0wZiF0NA8lsD50=;
        b=bO/pe7ODtMZ4FEe+++7OBKc4ap8k8+KzA1RhO/2c1R97vvvS3CVFy9IEttbt0/p3uF
         +s04yQ5TU2dd06zIjaYWX4I26MrvS0y5sAmylZdEa4ORTWpBfoBdYppTK29ILQV5NXyk
         8aLwuFBbqwNtl7hwjZnQToZfjn3eJOEUUc0XQsT4VCcRAOJBTgetqBwWwYTIQRs7zr/f
         y/D7AwwmpY4ags78UH88Hvz38xMBUhJor2JW0buA1qoQLFt/HTsglKygDII6Ty70bpXN
         IdTuX67DzdZrA1+3fBcF0BznKgRbRoLW66IculYSwkCBNr7FDB2BD+m2i11PyyzkgB0X
         j7rQ==
X-Gm-Message-State: AOJu0YxnkuB/sG0ZFamrPc6GbioUqmIq2j9Dj7xUFqj2sw0e3cPaxCea
	L8bmijZOlKgfjpte2qDY+EkYjlew0d2Nmh5Gk2s=
X-Google-Smtp-Source: AGHT+IEeZTUkZBV7iat2sVegZoAuopsstNiZNBbUiZ4w/849MjaixDBy5EKaZEAW458e6QTSZwJvaTpvs0hCB+AWwVE=
X-Received: by 2002:a50:d092:0:b0:54b:bb31:3de9 with SMTP id
 v18-20020a50d092000000b0054bbb313de9mr384358edd.32.1701868899692; Wed, 06 Dec
 2023 05:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20231205183226.26636-1-julien@xen.org>
In-Reply-To: <20231205183226.26636-1-julien@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 6 Dec 2023 08:21:27 -0500
Message-ID: <CAKf6xptrqSn4YoyBZA1_zZhQBAkuPrwn-JoxFdjNW=vE3m11Lw@mail.gmail.com>
Subject: Re: [PATCH] Only compile the hypervisor with -Wdeclaration-after-statement
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>, 
	Juergen Gross <jgross@suse.com>, Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 4:49=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> From: Julien Grall <jgrall@amazon.com>
>
> Right now, all tools and hypervisor will be complied with the option
> -Wdeclaration-after-statement. While most of the code in the hypervisor
> is controlled by us, for tools we may import external libraries.
>
> The build will fail if one of them are using the construct we are
> trying to prevent. This is the case when building against Python 3.12
> and Yocto:
>
> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2=
-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/=
Python.h:44,
> |                  from xen/lowlevel/xc/xc.c:8:
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-too=
ls/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h: In function =
'Py_SIZE':
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-too=
ls/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h:233:5: error:=
 ISO C90 forbids mixed declarations and code [-Werror=3Ddeclaration-after-s=
tatement]
> |   233 |     PyVarObject *var_ob =3D _PyVarObject_CAST(ob);
> |       |     ^~~~~~~~~~~
> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2=
-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/=
Python.h:53:
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-too=
ls/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h:=
 In function '_PyLong_CompactValue':
> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-too=
ls/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h:=
121:5: error: ISO C90 forbids mixed declarations and code [-Werror=3Ddeclar=
ation-after-statement]
> |   121 |     Py_ssize_t sign =3D 1 - (op->long_value.lv_tag & _PyLong_SI=
GN_MASK);
> |       |     ^~~~~~~~~~
> | cc1: all warnings being treated as errors
>
> Looking at the tools directory, a fair few directory already add
> -Wno-declaration-after-statement to inhibit the default behavior.
>
> We have always build the hypervisor with the flag, so for now remove
> only the flag for anything but the hypervisor. We can decide at later
> time whether we want to relax.
>
> Also remove the -Wno-declaration-after-statement in some subdirectory
> as the flag is now unnecessary.
>
> Part of the commit message was take from Alexander's first proposal:
>
> Link: https://lore.kernel.org/xen-devel/20231128174729.3880113-1-alex@lin=
utronix.de/
> Reported-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Tested-by: Jason Andryuk <jandryuk@gmail.com>

Also needed for compiling on Fedora 39.

Thanks,
Jason

