Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C4A276ED7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 12:36:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLObm-0005vx-EZ; Thu, 24 Sep 2020 10:36:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puVB=DB=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kLObk-0005vs-8G
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:36:12 +0000
X-Inumbo-ID: cca73e52-9f96-4c10-8b01-ebf8098650c3
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cca73e52-9f96-4c10-8b01-ebf8098650c3;
 Thu, 24 Sep 2020 10:36:11 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w5so3222084wrp.8
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 03:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=phNkZME285VUJc1oyO1kXyPVhxSzLg1oEzRYJAmdsgU=;
 b=o6dxQfnDjQwCNEcWrdDDXzLj1T5Ghmvuqe62Ss1nWeDNIXHHNymVoqe9W8EwZdH+go
 hEDcIKVS8ByNgbnAdaoHrCWyhnv1TNqyviERChiQ6j9Px8/BWhQtVV00WMxLBrDJv/Fe
 svxHquqVrQezv9S/OWeaFg1a2LW9URwK5Z75B8n+wXarms2FpL330jaOTMhzzcD4FkdN
 C+OUeA3ZPc7OCEqxPxctmZ2w/z391vWyarOhYMR1T6yceOk5gMOApckrn8VxFUvPQKAQ
 NtkhSxPk1OfRXSO2l//kwL/vjLeC6XDBtl+B0FCPZzTLMwIkA1/x8w7Y1KiPglnHe/nl
 8mMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=phNkZME285VUJc1oyO1kXyPVhxSzLg1oEzRYJAmdsgU=;
 b=Q3KBdEdzPLpJ7JkF3UiQ1t8p2ZNgRdPzKbeNah1dLKzMwk4shdNrU4RExZf+j58ZoF
 OppOkIMSLhA962RcALZaRvUdXk/qeaLS8m9XLB+UzJ/5nhFdr3H01cT6RNZ3y9vnjMK2
 ePdUqrMHTy/HxRCyFV+2EjWtsuQo80taJdaYt1GdzwdPFYdwGwivUuhZX/y3YFFnHbHp
 t29sjJFhoG32qU0h5JCf/9iGK5h3YyMp0JWYtPs6dQ/wbBYrdxxV2v+YADjkhKY+lw0B
 Fza6uF1vzHQGj5en5syzpN3SG7zxgQOeAaLut4QScWc9tFvLoA3J9shVj4oXdSTSVXO9
 q3uw==
X-Gm-Message-State: AOAM5315i2u27PlfM/6Rr386SvbPTDndi/Cth8OCDpBoxFelMl/SZli+
 ZdCI5zRd8tFdfpsxMXZzFpE=
X-Google-Smtp-Source: ABdhPJzTPc0LvsCh0Xq+8znANuVSRMkiKOWJhRsv7ooo3S59bQmWs5RID5A9d34xPUnAx5Vj4QDRGA==
X-Received: by 2002:adf:ec87:: with SMTP id z7mr4737896wrn.57.1600943770391;
 Thu, 24 Sep 2020 03:36:10 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id h204sm2923900wmf.35.2020.09.24.03.36.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Sep 2020 03:36:09 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
Cc: "'George Dunlap'" <George.Dunlap@eu.citrix.com>,
 "'Ian Jackson'" <iwj@xenproject.org>, "'Jan Beulich'" <JBeulich@suse.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>, "'Wei Liu'" <wl@xen.org>,
 "'Julien Grall'" <julien@xen.org>,
 =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 "'Hubert Jasudowicz'" <hubert.jasudowicz@cert.pl>,
 "'Tamas K Lengyel'" <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-9-andrew.cooper3@citrix.com>
In-Reply-To: <20200922182444.12350-9-andrew.cooper3@citrix.com>
Subject: RE: [PATCH v2 08/11] xen/memory: Indent part of acquire_resource()
Date: Thu, 24 Sep 2020 11:36:08 +0100
Message-ID: <004a01d6925e$84126ef0$8c374cd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIFh6M/JBUQh1P0MghANJzmhArOyAH+X8dcqQm1XqA=
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 22 September 2020 19:25
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap =
<George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Jan Beulich <JBeulich@suse.com>; Stefano =
Stabellini
> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Julien Grall =
<julien@xen.org>; Paul Durrant
> <paul@xen.org>; Micha=C5=82 Leszczy=C5=84ski =
<michal.leszczynski@cert.pl>; Hubert Jasudowicz
> <hubert.jasudowicz@cert.pl>; Tamas K Lengyel <tamas@tklengyel.com>
> Subject: [PATCH v2 08/11] xen/memory: Indent part of =
acquire_resource()
>=20
> Indent the middle of acquire_resource() inside a do {} while ( 0 ) =
loop.  This
> is broken out specifically to make the following change readable.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>
> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>  xen/common/memory.c | 66 =
+++++++++++++++++++++++++++--------------------------
>  1 file changed, 34 insertions(+), 32 deletions(-)
>=20
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index c559935732..369154b7c0 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1087,44 +1087,46 @@ static int acquire_resource(
>          goto out;
>      }
>=20
> -    switch ( xmar.type )
> -    {
> -    case XENMEM_resource_grant_table:
> -        rc =3D gnttab_acquire_resource(d, xmar.id, xmar.frame, =
xmar.nr_frames,
> -                                     mfn_list);
> -        break;
> +    do {
> +        switch ( xmar.type )
> +        {
> +        case XENMEM_resource_grant_table:
> +            rc =3D gnttab_acquire_resource(d, xmar.id, xmar.frame, =
xmar.nr_frames,
> +                                         mfn_list);
> +            break;
>=20
> -    default:
> -        rc =3D arch_acquire_resource(d, xmar.type, xmar.id, =
xmar.frame,
> -                                   xmar.nr_frames, mfn_list);
> -        break;
> -    }
> +        default:
> +            rc =3D arch_acquire_resource(d, xmar.type, xmar.id, =
xmar.frame,
> +                                       xmar.nr_frames, mfn_list);
> +            break;
> +        }
>=20
> -    if ( rc )
> -        goto out;
> +        if ( rc )
> +            goto out;
>=20
> -    if ( !paging_mode_translate(currd) )
> -    {
> -        if ( copy_to_guest(xmar.frame_list, mfn_list, xmar.nr_frames) =
)
> -            rc =3D -EFAULT;
> -    }
> -    else
> -    {
> -        xen_pfn_t gfn_list[ARRAY_SIZE(mfn_list)];
> -        unsigned int i;
> +        if ( !paging_mode_translate(currd) )
> +        {
> +            if ( copy_to_guest(xmar.frame_list, mfn_list, =
xmar.nr_frames) )
> +                rc =3D -EFAULT;
> +        }
> +        else
> +        {
> +            xen_pfn_t gfn_list[ARRAY_SIZE(mfn_list)];
> +            unsigned int i;
>=20
> -        if ( copy_from_guest(gfn_list, xmar.frame_list, =
xmar.nr_frames) )
> -            rc =3D -EFAULT;
> +            if ( copy_from_guest(gfn_list, xmar.frame_list, =
xmar.nr_frames) )
> +                rc =3D -EFAULT;
>=20
> -        for ( i =3D 0; !rc && i < xmar.nr_frames; i++ )
> -        {
> -            rc =3D set_foreign_p2m_entry(currd, gfn_list[i],
> -                                       _mfn(mfn_list[i]));
> -            /* rc should be -EIO for any iteration other than the =
first */
> -            if ( rc && i )
> -                rc =3D -EIO;
> +            for ( i =3D 0; !rc && i < xmar.nr_frames; i++ )
> +            {
> +                rc =3D set_foreign_p2m_entry(currd, gfn_list[i],
> +                                           _mfn(mfn_list[i]));
> +                /* rc should be -EIO for any iteration other than the =
first */
> +                if ( rc && i )
> +                    rc =3D -EIO;
> +            }
>          }
> -    }
> +    } while ( 0 );
>=20
>   out:
>      rcu_unlock_domain(d);
> --
> 2.11.0



