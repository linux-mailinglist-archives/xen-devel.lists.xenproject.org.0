Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CB123BAFC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 15:19:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2wqB-0005in-CY; Tue, 04 Aug 2020 13:18:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUrY=BO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k2wqA-0005ii-0b
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 13:18:50 +0000
X-Inumbo-ID: 261eb5e3-4e59-4e09-9f8d-c71fdf3624f7
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 261eb5e3-4e59-4e09-9f8d-c71fdf3624f7;
 Tue, 04 Aug 2020 13:18:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k20so2876416wmi.5
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 06:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=+OaZ7tXWIqT0JKgQfjEJpgOpykpNB8yWAZ8qPO7QOhI=;
 b=LjdMZIcnmlGIbVkCvBdPn/rOh9eg6r2CWf/AQQyFmG2M1jsO6vveeTHFey8fLYE4/L
 Hozp5KastVX28g3QDILuEBoLeSzyVeciSf0B//wqith1IWzasctLDHjR7pXu1NfngWI8
 J2Lr4U/K5D0TL6Vs6yMdYKapJqi5KOE11aKxVX8Ff6Zte7k/NJzyO0oMi9B50uepNFsd
 uPJI5wjohQb3OWMlaOGJ837e9snJ55qw0FlXTJwpVSEOuI7jjIf3CKz73P1PQNhZA89F
 Acu7LM4TZI2DKiMpJooBx4N+vM6COT2HtqtLJVlGscO8q9xaPS4QBOXgU4a1JslYR8WV
 GyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=+OaZ7tXWIqT0JKgQfjEJpgOpykpNB8yWAZ8qPO7QOhI=;
 b=BrnpPp9nD6G2bhaHMM5Z3WardIA56lS81zICb4/RsM/FEgE7WvQmZXxdPTxzj2ew23
 XPSjl6R12IwkzrhsZz2rEUTl112NG5JF5KZ8fIAWnLNc3A6S0+rMNG0Ev4qw6t6NEbyR
 ppKkA+DvigA3j1jsqFO30qmLKy5+kckgsj2zAfr93NMuQf81L9aHTxv5W6EZ2drUUjlr
 j94k8CfM14YXwBn50zE2JLm1S3gA5W7J86qljUf7A0Fn0ba3ZqI+FkcZjUeH5jwKbWKT
 6BF5JbNH5g7dhAihci5758FwDCKCsKlZcujxvX8243/nbVsxRz/1iQ5Firzzin3O1Toc
 M3aQ==
X-Gm-Message-State: AOAM5308DeOHprRKELb/uBEw/hWUwkwrll9Xd9KtsgC1jCeUw+XkJXcB
 cSZlF3IVusiwBjyCOkDnb2k=
X-Google-Smtp-Source: ABdhPJwYvynzg7XP+NCMOyYm30Gl+2Z/GBc5rp7kPMvE3bzWC05EUFALD6wf4EPs4xUHMKy33K2FMg==
X-Received: by 2002:a1c:c28b:: with SMTP id s133mr3982461wmf.43.1596547128039; 
 Tue, 04 Aug 2020 06:18:48 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id b139sm5068608wmd.19.2020.08.04.06.18.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 06:18:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Oleksandr'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <002101d66a51$b4c59070$1e50b150$@xen.org>
 <396a0833-021c-c21a-1dcf-cc8bddd1f4a9@gmail.com>
In-Reply-To: <396a0833-021c-c21a-1dcf-cc8bddd1f4a9@gmail.com>
Subject: RE: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
Date: Tue, 4 Aug 2020 14:18:48 +0100
Message-ID: <002401d66a61$ca9c2110$5fd46330$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIHYXuU00Oy15gaFT3m+7M9vTQs4QHrpydYAen0VmICUR8SMQI7+bD/AfnOTImocxvKYA==
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
> Sent: 04 August 2020 12:51
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
> On 04.08.20 14:23, Paul Durrant wrote:
> >>
> >>> diff --git a/xen/include/xen/hvm/ioreq.h =
b/xen/include/xen/hvm/ioreq.h
> >>>> new file mode 100644
> >>>> index 0000000..40b7b5e
> >>>> --- /dev/null
> >>>> +++ b/xen/include/xen/hvm/ioreq.h
> >>>> @@ -0,0 +1,89 @@
> >>>> +/*
> >>>> + * hvm.h: Hardware virtual machine assist interface definitions.
> >>>> + *
> >>>> + * Copyright (c) 2016 Citrix Systems Inc.
> >>>> + *
> >>>> + * This program is free software; you can redistribute it and/or =
modify it
> >>>> + * under the terms and conditions of the GNU General Public =
License,
> >>>> + * version 2, as published by the Free Software Foundation.
> >>>> + *
> >>>> + * This program is distributed in the hope it will be useful, =
but WITHOUT
> >>>> + * ANY WARRANTY; without even the implied warranty of =
MERCHANTABILITY or
> >>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public =
License for
> >>>> + * more details.
> >>>> + *
> >>>> + * You should have received a copy of the GNU General Public =
License along with
> >>>> + * this program; If not, see <http://www.gnu.org/licenses/>.
> >>>> + */
> >>>> +
> >>>> +#ifndef __HVM_IOREQ_H__
> >>>> +#define __HVM_IOREQ_H__
> >>>> +
> >>>> +#include <xen/sched.h>
> >>>> +
> >>>> +#include <asm/hvm/ioreq.h>
> >>>> +
> >>>> +#define GET_IOREQ_SERVER(d, id) \
> >>>> +    (d)->arch.hvm.ioreq_server.server[id]
> >>>> +
> >>>> +static inline struct hvm_ioreq_server *get_ioreq_server(const =
struct domain *d,
> >>>> +                                                        unsigned =
int id)
> >>>> +{
> >>>> +    if ( id >=3D MAX_NR_IOREQ_SERVERS )
> >>>> +        return NULL;
> >>>> +
> >>>> +    return GET_IOREQ_SERVER(d, id);
> >>>> +}
> >>>> +
> >>>> +static inline bool hvm_ioreq_needs_completion(const ioreq_t =
*ioreq)
> >>>> +{
> >>>> +    return ioreq->state =3D=3D STATE_IOREQ_READY &&
> >>>> +           !ioreq->data_is_ptr &&
> >>>> +           (ioreq->type !=3D IOREQ_TYPE_PIO || ioreq->dir !=3D =
IOREQ_WRITE);
> >>>> +}
> >>> I don't think having this in common code is correct. The short-cut =
of not completing PIO reads
> seems
> >> somewhat x86 specific. Does ARM even have the concept of PIO?
> >>
> >> I am not 100% sure here, but it seems that doesn't have.
> >>
> >> Shall I make hvm_ioreq_needs_completion() per arch? Arm variant =
would
> >> have the same implementation, but without "ioreq->type !=3D
> >> IOREQ_TYPE_PIO" check...
> >>
> > With your series applied, does any common code actually call =
hvm_ioreq_needs_completion()? I suspect
> it will remain x86 specific, without any need for an Arm variant.
> Yes, it does. Please see common usage in hvm_io_assist() and
> handle_hvm_io_completion() (current patch) and usage in Arm code
> (arch/arm/io.c: io_state try_fwd_ioserv) [1]
>=20
>=20
> [1]
> =
https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00072.htm=
l
>=20

Yes, but that code is clearly not finished since, after setting =
io_completion it says:

/* XXX: Decide what to do */
if ( rc =3D=3D IO_RETRY )
    rc =3D IO_HANDLED;

So, it's not clear what the eventual implementation will be and whether =
it will need to make that call.

  Paul

>=20
> --
> Regards,
>=20
> Oleksandr Tyshchenko



