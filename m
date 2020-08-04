Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD8423B97B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 13:23:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2v2k-0004QC-Gk; Tue, 04 Aug 2020 11:23:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUrY=BO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k2v2j-0004Q7-FM
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 11:23:41 +0000
X-Inumbo-ID: f8f67bc2-273d-415b-a66c-b0c2135bed2d
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8f67bc2-273d-415b-a66c-b0c2135bed2d;
 Tue, 04 Aug 2020 11:23:40 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so2534830wmi.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=2xr1Zha5BGUVWCkqX0z9uYsDmihPkLZm1fTgchVOAiA=;
 b=Kuy0vsn893BB1Z1pz0yxewdR8yonJkLCwj80UdVPgCXreZipJWdM5YF6P+iVkmLJl6
 szm4IY8BN2sXc3Hjr/LB1v1OjAjtMlhDAjQ86MNpSi3vd31wQuMQjzG5+7vYnB1btBjS
 oX6WtJGaO1JLqyWWafvdbVbSz/cnqIo3UOR73TFGzVBu6Hy8mlct0RtTDFLK17Z/tuMA
 EKo2rNqOuTe+EHHz5/Puj9UWaYz7IyCno6dGNO/XSnc2ck4R6CEqzrnteHceA3m4+Pmh
 +HvUYKTF5uR5QdOXEkwUG2Vk7pw8Di8n2m9ppD1rtVHRoaLajU1j9E9XCT+W2nABr8zZ
 a61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=2xr1Zha5BGUVWCkqX0z9uYsDmihPkLZm1fTgchVOAiA=;
 b=rUXkiQswg6Hp4xblZ99p8jgIG7kE06umb4pawyBvNPgPv4zv+ctQaN5q//2Ua2558K
 PpBr7NjrNlEpBQ4UkZMMpD6CEG/ru57rGcpPGAzU5PMIq7+Kmgd3cbEOMs+xW7Jwxs30
 rdopiVKkuQ32KccL54G5+Vy5Z1jm73YVsE+wHsvULedRlS6qICrgWnL1Jgu7pAxuQGdp
 WKqbmfPo1z7Ur/io+LoU+ftgtReWdkh7T47y8JHXiy0QVZ94IuncpNBKekg03B+G5Jhp
 GUuKKIQ+nSv6yxkUzAF9ZPrRgmpx/6R2ADtfWa4Se/EiszSEvlyhmG60u6FRsz/3hzCk
 zQlg==
X-Gm-Message-State: AOAM5330FRPTbckN8A6cHMNHrrgUi64USjKtUPygMyNnBZmzLnGtu+T1
 RzgB/bq39EYGzKO+5NzNvH0=
X-Google-Smtp-Source: ABdhPJwldR3x39/8FLNTHdN4sFmcIvDSZQnqH6q6zBfjmBPPfdSQjXwPkPGU+BfOOFuYsl9tJnJsMg==
X-Received: by 2002:a1c:a942:: with SMTP id s63mr3495625wme.19.1596540219532; 
 Tue, 04 Aug 2020 04:23:39 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id s205sm4451340wme.7.2020.08.04.04.23.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 04:23:39 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Oleksandr'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
In-Reply-To: <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
Subject: RE: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
Date: Tue, 4 Aug 2020 12:23:40 +0100
Message-ID: <002101d66a51$b4c59070$1e50b150$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIHYXuU00Oy15gaFT3m+7M9vTQs4QHrpydYAen0VmICUR8SMaiUqjDA
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Oleksandr <olekstysh@gmail.com>
> Sent: 04 August 2020 12:10
> To: paul@xen.org; xen-devel@lists.xenproject.org
> Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>; 'Jan =
Beulich' <jbeulich@suse.com>; 'Andrew
> Cooper' <andrew.cooper3@citrix.com>; 'Wei Liu' <wl@xen.org>; 'Roger =
Pau Monn=C3=A9' <roger.pau@citrix.com>;
> 'George Dunlap' <george.dunlap@citrix.com>; 'Ian Jackson' =
<ian.jackson@eu.citrix.com>; 'Julien Grall'
> <julien@xen.org>; 'Stefano Stabellini' <sstabellini@kernel.org>; 'Jun =
Nakajima'
> <jun.nakajima@intel.com>; 'Kevin Tian' <kevin.tian@intel.com>; 'Tim =
Deegan' <tim@xen.org>; 'Julien
> Grall' <julien.grall@arm.com>
> Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature =
common
>=20
>=20
> On 04.08.20 10:45, Paul Durrant wrote:
>=20
> Hi Paul
>=20
> >> -----Original Message-----
> >> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> >> Sent: 03 August 2020 19:21
> >> To: xen-devel@lists.xenproject.org
> >> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Jan =
Beulich <jbeulich@suse.com>; Andrew
> >> Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>;
> >> George Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Julien Grall
> >> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Paul =
Durrant <paul@xen.org>; Jun
> >> Nakajima <jun.nakajima@intel.com>; Kevin Tian =
<kevin.tian@intel.com>; Tim Deegan <tim@xen.org>;
> Julien
> >> Grall <julien.grall@arm.com>
> >> Subject: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature =
common
> >>
> >> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>
> >> As a lot of x86 code can be re-used on Arm later on, this patch
> >> splits IOREQ support into common and arch specific parts.
> >>
> >> This support is going to be used on Arm to be able run device
> >> emulator outside of Xen hypervisor.
> >>
> >> Please note, this is a split/cleanup of Julien's PoC:
> >> "Add support for Guest IO forwarding to a device emulator"
> >>
> >> Signed-off-by: Julien Grall <julien.grall@arm.com>
> >> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >> ---
> >>   xen/arch/x86/Kconfig            |    1 +
> >>   xen/arch/x86/hvm/dm.c           |    2 +-
> >>   xen/arch/x86/hvm/emulate.c      |    2 +-
> >>   xen/arch/x86/hvm/hvm.c          |    2 +-
> >>   xen/arch/x86/hvm/io.c           |    2 +-
> >>   xen/arch/x86/hvm/ioreq.c        | 1431 =
+--------------------------------------
> >>   xen/arch/x86/hvm/stdvga.c       |    2 +-
> >>   xen/arch/x86/hvm/vmx/realmode.c |    1 +
> >>   xen/arch/x86/hvm/vmx/vvmx.c     |    2 +-
> >>   xen/arch/x86/mm.c               |    2 +-
> >>   xen/arch/x86/mm/shadow/common.c |    2 +-
> >>   xen/common/Kconfig              |    3 +
> >>   xen/common/Makefile             |    1 +
> >>   xen/common/hvm/Makefile         |    1 +
> >>   xen/common/hvm/ioreq.c          | 1430 =
++++++++++++++++++++++++++++++++++++++
> >>   xen/include/asm-x86/hvm/ioreq.h |   45 +-
> >>   xen/include/asm-x86/hvm/vcpu.h  |    7 -
> >>   xen/include/xen/hvm/ioreq.h     |   89 +++
> >>   18 files changed, 1575 insertions(+), 1450 deletions(-)
> >>   create mode 100644 xen/common/hvm/Makefile
> >>   create mode 100644 xen/common/hvm/ioreq.c
> >>   create mode 100644 xen/include/xen/hvm/ioreq.h
> > You need to adjust the MAINTAINERS file since there will now be =
common 'I/O EMULATION' code. Since I
> wrote most of ioreq.c, please retain me as a maintainer of the common =
code.
>=20
> Oh, I completely forgot about MAINTAINERS file. Sure, I will update =
file
> and retain you.
>=20
>=20
> >
> > [snip]
> >> @@ -1528,13 +143,19 @@ static int hvm_access_cf8(
> >>       return X86EMUL_UNHANDLEABLE;
> >>   }
> >>
> >> -void hvm_ioreq_init(struct domain *d)
> >> +void arch_hvm_ioreq_init(struct domain *d)
> >>   {
> >>       spin_lock_init(&d->arch.hvm.ioreq_server.lock);
> >>
> >>       register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
> >>   }
> >>
> >> +void arch_hvm_ioreq_destroy(struct domain *d)
> >> +{
> >> +    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
> >> +        return;
> > There's not really a lot of point in this. I think an empty function =
here would be ok.
>=20
> ok
>=20
>=20
> >> +struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
> >> +                                                 ioreq_t *p)
> >> +{
> >> +    struct hvm_ioreq_server *s;
> >> +    uint8_t type;
> >> +    uint64_t addr;
> >> +    unsigned int id;
> >> +
> >> +    if ( p->type !=3D IOREQ_TYPE_COPY && p->type !=3D =
IOREQ_TYPE_PIO )
> >> +        return NULL;
> >> +
> >> +    hvm_get_ioreq_server_range_type(d, p, &type, &addr);
> > Looking at this, I think it would make more sense to fold the check =
of p->type into
> hvm_get_ioreq_server_range_type() and have it return success/failure.
>=20
> ok, will update.
>=20
>=20
> > diff --git a/xen/include/xen/hvm/ioreq.h =
b/xen/include/xen/hvm/ioreq.h
> >> new file mode 100644
> >> index 0000000..40b7b5e
> >> --- /dev/null
> >> +++ b/xen/include/xen/hvm/ioreq.h
> >> @@ -0,0 +1,89 @@
> >> +/*
> >> + * hvm.h: Hardware virtual machine assist interface definitions.
> >> + *
> >> + * Copyright (c) 2016 Citrix Systems Inc.
> >> + *
> >> + * This program is free software; you can redistribute it and/or =
modify it
> >> + * under the terms and conditions of the GNU General Public =
License,
> >> + * version 2, as published by the Free Software Foundation.
> >> + *
> >> + * This program is distributed in the hope it will be useful, but =
WITHOUT
> >> + * ANY WARRANTY; without even the implied warranty of =
MERCHANTABILITY or
> >> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public =
License for
> >> + * more details.
> >> + *
> >> + * You should have received a copy of the GNU General Public =
License along with
> >> + * this program; If not, see <http://www.gnu.org/licenses/>.
> >> + */
> >> +
> >> +#ifndef __HVM_IOREQ_H__
> >> +#define __HVM_IOREQ_H__
> >> +
> >> +#include <xen/sched.h>
> >> +
> >> +#include <asm/hvm/ioreq.h>
> >> +
> >> +#define GET_IOREQ_SERVER(d, id) \
> >> +    (d)->arch.hvm.ioreq_server.server[id]
> >> +
> >> +static inline struct hvm_ioreq_server *get_ioreq_server(const =
struct domain *d,
> >> +                                                        unsigned =
int id)
> >> +{
> >> +    if ( id >=3D MAX_NR_IOREQ_SERVERS )
> >> +        return NULL;
> >> +
> >> +    return GET_IOREQ_SERVER(d, id);
> >> +}
> >> +
> >> +static inline bool hvm_ioreq_needs_completion(const ioreq_t =
*ioreq)
> >> +{
> >> +    return ioreq->state =3D=3D STATE_IOREQ_READY &&
> >> +           !ioreq->data_is_ptr &&
> >> +           (ioreq->type !=3D IOREQ_TYPE_PIO || ioreq->dir !=3D =
IOREQ_WRITE);
> >> +}
> > I don't think having this in common code is correct. The short-cut =
of not completing PIO reads seems
> somewhat x86 specific. Does ARM even have the concept of PIO?
>=20
> I am not 100% sure here, but it seems that doesn't have.
>=20
> Shall I make hvm_ioreq_needs_completion() per arch? Arm variant would
> have the same implementation, but without "ioreq->type !=3D
> IOREQ_TYPE_PIO" check...
>=20

With your series applied, does any common code actually call =
hvm_ioreq_needs_completion()? I suspect it will remain x86 specific, =
without any need for an Arm variant.

  Paul

> --
> Regards,
>=20
> Oleksandr Tyshchenko



