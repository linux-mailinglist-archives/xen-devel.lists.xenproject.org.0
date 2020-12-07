Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAD42D15DD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 17:23:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46823.82985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmJIH-0001xD-4x; Mon, 07 Dec 2020 16:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46823.82985; Mon, 07 Dec 2020 16:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmJIH-0001wo-12; Mon, 07 Dec 2020 16:23:21 +0000
Received: by outflank-mailman (input) for mailman id 46823;
 Mon, 07 Dec 2020 16:23:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=og4e=FL=amazon.co.uk=prvs=60380b542=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kmJIG-0001wj-4H
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 16:23:20 +0000
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76fd9cc1-e8bf-4255-8533-533e0c12770b;
 Mon, 07 Dec 2020 16:23:18 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 07 Dec 2020 16:23:10 +0000
Received: from EX13D32EUC003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id ABFB1A18D5; Mon,  7 Dec 2020 16:23:09 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 7 Dec 2020 16:23:08 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 7 Dec 2020 16:23:08 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 76fd9cc1-e8bf-4255-8533-533e0c12770b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1607358199; x=1638894199;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=M5CQ43J06hArqDloXOWuQ8P6al+1L6FLc+2jHKf0F/o=;
  b=GUtV5HmWq/vHgMxUAcmfBLAbUfv+d42a9Ea2MN2q49FnUMLmoUpKuztQ
   eXIHPQFT9zaoCtv7+wIltjpiJpK55d9Gk4KBycWyuKjsENKEc9wHzZbu+
   R45cEvVxO1eCs3AjVvxpzEcB4qi9qCWk36qkT0NlpCRLlGzY9zvc7cJnm
   M=;
X-IronPort-AV: E=Sophos;i="5.78,400,1599523200"; 
   d="scan'208";a="71039094"
Subject: RE: [PATCH v5 01/23] xl / libxl: s/pcidev/pci and remove
 DEFINE_DEVICE_TYPE_STRUCT_X
Thread-Topic: [PATCH v5 01/23] xl / libxl: s/pcidev/pci and remove
 DEFINE_DEVICE_TYPE_STRUCT_X
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "paul@xen.org" <paul@xen.org>, 'Wei Liu' <wl@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	'Oleksandr Andrushchenko' <oleksandr_andrushchenko@epam.com>, 'Ian Jackson'
	<iwj@xenproject.org>, 'Anthony PERARD' <anthony.perard@citrix.com>
Thread-Index: AQLNnXLs2pPLw4H6lzH6w2mINWFu0wFb+WecAj+9ygIB0uemdAExrIbdAi9lKOCnt67fAIAAAnZw
Date: Mon, 7 Dec 2020 16:23:08 +0000
Message-ID: <7300f5ebe6a6491e9aea02b7276dd9cf@EX13D32EUC003.ant.amazon.com>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-2-paul@xen.org>
 <20201204111326.5pxgqertdm3tk7y2@liuwe-devbox-debian-v2>
 <013d01d6ca2f$605fe7e0$211fb7a0$@xen.org>
 <20201204112141.wdwb54brb23x2bgs@liuwe-devbox-debian-v2>
 <014701d6ca2f$e414f260$ac3ed720$@xen.org>
 <0d2701d6ccb4$9251c3e0$b6f54ba0$@xen.org>
In-Reply-To: <0d2701d6ccb4$9251c3e0$b6f54ba0$@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.209]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: Bulk

> -----Original Message-----
> From: Paul Durrant <xadimgnik@gmail.com>
> Sent: 07 December 2020 16:18
> To: paul@xen.org; 'Wei Liu' <wl@xen.org>
> Cc: xen-devel@lists.xenproject.org; Durrant, Paul <pdurrant@amazon.co.uk>=
; 'Oleksandr Andrushchenko'
> <oleksandr_andrushchenko@epam.com>; 'Ian Jackson' <iwj@xenproject.org>; '=
Anthony PERARD'
> <anthony.perard@citrix.com>
> Subject: RE: [EXTERNAL] [PATCH v5 01/23] xl / libxl: s/pcidev/pci and rem=
ove
> DEFINE_DEVICE_TYPE_STRUCT_X
>=20
> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open
> attachments unless you can confirm the sender and know the content is saf=
e.
>=20
>=20
>=20
> > -----Original Message-----
> [snip]
> > > > >
> > > > > This is going to break libxl callers because the name "pcidev" is
> > > > > visible from the public header.
> > > > >
> > > > > I agree this is confusing and inconsistent, but we didn't go extr=
a
> > > > > length to maintain the inconsistency for no reason.
> > > > >
> > > > > If you really want to change it, I won't stand in the way. In fac=
t, I'm
> > > > > all for consistency. I think the flag you added should help allev=
iate
> > > > > the fallout.
> > > >
> > > > Yes, I thought that was the idea... we can make API changes if we a=
dd a flag. I could see about
> > > adding shims to translate the names
> > > > and keep the internal code clean.
> > >
> > > Yes if you can add some internal shims to handle it that would be
> > > great. Otherwise you will need to at least fix libvirt.
> > >
> >
> > I think shims are safest. We don't know what other callers are lurking =
out there :-)
> >
>=20
> Wei,
>=20
> Looking at this again; the only mentions of 'pcidev' in the public header=
 that I can see are in
> argument names in function
> prototypes, modified in the following hunks.
>=20
> @@ -2307,15 +2314,15 @@ int libxl_device_pvcallsif_destroy(libxl_ctx *ctx=
, uint32_t domid,
>=20
>  /* PCI Passthrough */
>  int libxl_device_pci_add(libxl_ctx *ctx, uint32_t domid,
> -                         libxl_device_pci *pcidev,
> +                         libxl_device_pci *pci,
>                           const libxl_asyncop_how *ao_how)
>                           LIBXL_EXTERNAL_CALLERS_ONLY;
>  int libxl_device_pci_remove(libxl_ctx *ctx, uint32_t domid,
> -                            libxl_device_pci *pcidev,
> +                            libxl_device_pci *pci,
>                              const libxl_asyncop_how *ao_how)
>                              LIBXL_EXTERNAL_CALLERS_ONLY;
>  int libxl_device_pci_destroy(libxl_ctx *ctx, uint32_t domid,
> -                             libxl_device_pci *pcidev,
> +                             libxl_device_pci *pci,
>                               const libxl_asyncop_how *ao_how)
>                               LIBXL_EXTERNAL_CALLERS_ONLY;
>=20
> @@ -2359,8 +2366,8 @@ int libxl_device_events_handler(libxl_ctx *ctx,
>   * added or is not bound, the functions will emit a warning but return
>   * SUCCESS.
>   */
> -int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pc=
idev, int rebind);
> -int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci =
*pcidev, int rebind);
> +int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pc=
i, int rebind);
> +int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci =
*pci, int rebind);
>  libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *=
num);
>=20
>  /* CPUID handling */
>=20
> I can't see how renaming these will break anything. The type name (which =
is what I thought I'd
> changed) actually remains the same.
> The main changes are in the libxl__device_type structure but AFAICT that =
is not publicly visible. Am I
> missing something?

Oh NM... I see the direct use of the domain_config field names lower down. =
I guess I can probably leave those names alone.

  Paul

>=20
>   Paul


