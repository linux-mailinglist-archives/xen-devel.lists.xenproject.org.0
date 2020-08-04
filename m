Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2062023B5F3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 09:45:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2rdH-0000QO-IW; Tue, 04 Aug 2020 07:45:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUrY=BO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k2rdF-0000QJ-KO
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 07:45:09 +0000
X-Inumbo-ID: 6ac9eaa2-d626-11ea-9134-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ac9eaa2-d626-11ea-9134-bc764e2007e4;
 Tue, 04 Aug 2020 07:45:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 184so1921522wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 00:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=vMBDvnVaS6aghQbQyMlKeQdm8TCMaIQQVDU0BX/qKtk=;
 b=jS3Yd+6MiVUkCKIA5ASH0C5xpBhp5PlVhcrUSMqq4piyRXGug78SKWbUzUaPzbjaTq
 DWzyuRJ37p+ddAPtijO19kJA5gYKNBpyYH1nhCiW4AgHLnJHWHvZ6Kd/N0UASdr7ORif
 aibm1E6dRYbe3KQEnU6yTY11VhEVWFoYVmaCLfit5Jw5H07yvkmDRQzpcdzk3WhG1b//
 A3MtVRqS0O5/YubLMOMTWrD7qQs4LWpib/0i35Pc0qLOCRTGy2AEx2ZNBuIrrzFk5BwA
 r3nZhdPZ7y1qJzn7MFPcMJJvShkB5FG7cmthXC5FHlmka2GXDFvoPG0N+YCtosXJVIif
 z5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=vMBDvnVaS6aghQbQyMlKeQdm8TCMaIQQVDU0BX/qKtk=;
 b=IqZDmguEnt6pqox83CKObHqvY7FgSOj2SMnX1lcTa4EKk65PwyIYfP5T9viu+GNnCq
 /Qd5YksYNi6h1YUgfbQK7poQ34sM8UMYwSOu8bfpQ4jIYGBmQxkx1u/SBEMf/vhtETVs
 r01ODa9Q4YhyhPbtlpkuNk993H2soRkjTo5u7pjD/jiL9nRrR2jrl0j1+kv2vZPBvpQi
 mmI4Uxu6wX7CP5qRGjkhU7M0Ab2UmTWQbUt+fBpSLy546sEfQ+CQPskxiuc3szlutsJt
 IEuIn/9AuLNaPg6oUGDto/OBqPC9WFqIp7B76cDFmm2/cYYEYxvmnZuwt7kgjwCIq3AW
 Cccg==
X-Gm-Message-State: AOAM532X66GECe36MHCqL8HzHM7bqH8iUJVJbOZlHUi5ax8JVvk5t7eZ
 t+vnZVxiy6mc/Jky+p+MUQE=
X-Google-Smtp-Source: ABdhPJwY5TkHN3ZWB+03uyjHNCqBD/9KK7aSX1moKZl/0ygkNaUsDlMaVzJ64PhXiWk/3lhJEvlBog==
X-Received: by 2002:a1c:18b:: with SMTP id 133mr2797011wmb.178.1596527107269; 
 Tue, 04 Aug 2020 00:45:07 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:9005:cf07:3ece:ca77])
 by smtp.gmail.com with ESMTPSA id 32sm33571623wrh.18.2020.08.04.00.45.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 00:45:06 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
 <xen-devel@lists.xenproject.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
Subject: RE: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
Date: Tue, 4 Aug 2020 08:45:05 +0100
Message-ID: <000c01d66a33$2bd56510$83802f30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIHYXuU00Oy15gaFT3m+7M9vTQs4QHrpydYqLZB1/A=
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
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 03 August 2020 19:21
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>;
> George Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Julien Grall
> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Paul =
Durrant <paul@xen.org>; Jun
> Nakajima <jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>; =
Tim Deegan <tim@xen.org>; Julien
> Grall <julien.grall@arm.com>
> Subject: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature =
common
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> As a lot of x86 code can be re-used on Arm later on, this patch
> splits IOREQ support into common and arch specific parts.
>=20
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
>=20
> Please note, this is a split/cleanup of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>=20
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  xen/arch/x86/Kconfig            |    1 +
>  xen/arch/x86/hvm/dm.c           |    2 +-
>  xen/arch/x86/hvm/emulate.c      |    2 +-
>  xen/arch/x86/hvm/hvm.c          |    2 +-
>  xen/arch/x86/hvm/io.c           |    2 +-
>  xen/arch/x86/hvm/ioreq.c        | 1431 =
+--------------------------------------
>  xen/arch/x86/hvm/stdvga.c       |    2 +-
>  xen/arch/x86/hvm/vmx/realmode.c |    1 +
>  xen/arch/x86/hvm/vmx/vvmx.c     |    2 +-
>  xen/arch/x86/mm.c               |    2 +-
>  xen/arch/x86/mm/shadow/common.c |    2 +-
>  xen/common/Kconfig              |    3 +
>  xen/common/Makefile             |    1 +
>  xen/common/hvm/Makefile         |    1 +
>  xen/common/hvm/ioreq.c          | 1430 =
++++++++++++++++++++++++++++++++++++++
>  xen/include/asm-x86/hvm/ioreq.h |   45 +-
>  xen/include/asm-x86/hvm/vcpu.h  |    7 -
>  xen/include/xen/hvm/ioreq.h     |   89 +++
>  18 files changed, 1575 insertions(+), 1450 deletions(-)
>  create mode 100644 xen/common/hvm/Makefile
>  create mode 100644 xen/common/hvm/ioreq.c
>  create mode 100644 xen/include/xen/hvm/ioreq.h

You need to adjust the MAINTAINERS file since there will now be common =
'I/O EMULATION' code. Since I wrote most of ioreq.c, please retain me as =
a maintainer of the common code.

[snip]
> @@ -1528,13 +143,19 @@ static int hvm_access_cf8(
>      return X86EMUL_UNHANDLEABLE;
>  }
>=20
> -void hvm_ioreq_init(struct domain *d)
> +void arch_hvm_ioreq_init(struct domain *d)
>  {
>      spin_lock_init(&d->arch.hvm.ioreq_server.lock);
>=20
>      register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
>  }
>=20
> +void arch_hvm_ioreq_destroy(struct domain *d)
> +{
> +    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
> +        return;

There's not really a lot of point in this. I think an empty function =
here would be ok.

> +}
> +
>  /*
>   * Local variables:
>   * mode: C

[snip]
> +struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
> +                                                 ioreq_t *p)
> +{
> +    struct hvm_ioreq_server *s;
> +    uint8_t type;
> +    uint64_t addr;
> +    unsigned int id;
> +
> +    if ( p->type !=3D IOREQ_TYPE_COPY && p->type !=3D IOREQ_TYPE_PIO =
)
> +        return NULL;
> +
> +    hvm_get_ioreq_server_range_type(d, p, &type, &addr);

Looking at this, I think it would make more sense to fold the check of =
p->type into hvm_get_ioreq_server_range_type() and have it return =
success/failure.

> +
> +    FOR_EACH_IOREQ_SERVER(d, id, s)
> +    {
> +        struct rangeset *r;
> +
> +        if ( !s->enabled )
> +            continue;
> +
> +        r =3D s->range[type];
> +
> +        switch ( type )
> +        {
> +            unsigned long start, end;
> +
> +        case XEN_DMOP_IO_RANGE_PORT:
> +            start =3D addr;
> +            end =3D start + p->size - 1;
> +            if ( rangeset_contains_range(r, start, end) )
> +                return s;
> +
> +            break;
> +
> +        case XEN_DMOP_IO_RANGE_MEMORY:
> +            start =3D hvm_mmio_first_byte(p);
> +            end =3D hvm_mmio_last_byte(p);
> +
> +            if ( rangeset_contains_range(r, start, end) )
> +                return s;
> +
> +            break;
> +
> +        case XEN_DMOP_IO_RANGE_PCI:
> +            if ( rangeset_contains_singleton(r, addr >> 32) )
> +            {
> +                p->type =3D IOREQ_TYPE_PCI_CONFIG;
> +                p->addr =3D addr;
> +                return s;
> +            }
> +
> +            break;
> +        }
> +    }
> +
> +    return NULL;
> +}

[snip]
> diff --git a/xen/include/xen/hvm/ioreq.h b/xen/include/xen/hvm/ioreq.h
> new file mode 100644
> index 0000000..40b7b5e
> --- /dev/null
> +++ b/xen/include/xen/hvm/ioreq.h
> @@ -0,0 +1,89 @@
> +/*
> + * hvm.h: Hardware virtual machine assist interface definitions.
> + *
> + * Copyright (c) 2016 Citrix Systems Inc.
> + *
> + * This program is free software; you can redistribute it and/or =
modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but =
WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public =
License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License =
along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __HVM_IOREQ_H__
> +#define __HVM_IOREQ_H__
> +
> +#include <xen/sched.h>
> +
> +#include <asm/hvm/ioreq.h>
> +
> +#define GET_IOREQ_SERVER(d, id) \
> +    (d)->arch.hvm.ioreq_server.server[id]
> +
> +static inline struct hvm_ioreq_server *get_ioreq_server(const struct =
domain *d,
> +                                                        unsigned int =
id)
> +{
> +    if ( id >=3D MAX_NR_IOREQ_SERVERS )
> +        return NULL;
> +
> +    return GET_IOREQ_SERVER(d, id);
> +}
> +
> +static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
> +{
> +    return ioreq->state =3D=3D STATE_IOREQ_READY &&
> +           !ioreq->data_is_ptr &&
> +           (ioreq->type !=3D IOREQ_TYPE_PIO || ioreq->dir !=3D =
IOREQ_WRITE);
> +}

I don't think having this in common code is correct. The short-cut of =
not completing PIO reads seems somewhat x86 specific. Does ARM even have =
the concept of PIO?

  Paul

> +
> +bool hvm_io_pending(struct vcpu *v);
> +bool handle_hvm_io_completion(struct vcpu *v);
> +bool is_ioreq_server_page(struct domain *d, const struct page_info =
*page);
> +
> +int hvm_create_ioreq_server(struct domain *d, int bufioreq_handling,
> +                            ioservid_t *id);
> +int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id);
> +int hvm_get_ioreq_server_info(struct domain *d, ioservid_t id,
> +                              unsigned long *ioreq_gfn,
> +                              unsigned long *bufioreq_gfn,
> +                              evtchn_port_t *bufioreq_port);
> +int hvm_get_ioreq_server_frame(struct domain *d, ioservid_t id,
> +                               unsigned long idx, mfn_t *mfn);
> +int hvm_map_io_range_to_ioreq_server(struct domain *d, ioservid_t id,
> +                                     uint32_t type, uint64_t start,
> +                                     uint64_t end);
> +int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t =
id,
> +                                         uint32_t type, uint64_t =
start,
> +                                         uint64_t end);
> +int hvm_set_ioreq_server_state(struct domain *d, ioservid_t id,
> +                               bool enabled);
> +
> +int hvm_all_ioreq_servers_add_vcpu(struct domain *d, struct vcpu *v);
> +void hvm_all_ioreq_servers_remove_vcpu(struct domain *d, struct vcpu =
*v);
> +void hvm_destroy_all_ioreq_servers(struct domain *d);
> +
> +struct hvm_ioreq_server *hvm_select_ioreq_server(struct domain *d,
> +                                                 ioreq_t *p);
> +int hvm_send_ioreq(struct hvm_ioreq_server *s, ioreq_t *proto_p,
> +                   bool buffered);
> +unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
> +
> +void hvm_ioreq_init(struct domain *d);
> +
> +#endif /* __HVM_IOREQ_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.7.4



