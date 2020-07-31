Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE55523447A
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:22:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1T7C-0004M2-Eq; Fri, 31 Jul 2020 11:22:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fae6=BK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k1T7B-0004K9-8v
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:22:17 +0000
X-Inumbo-ID: 152826c6-d320-11ea-8e24-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 152826c6-d320-11ea-8e24-bc764e2007e4;
 Fri, 31 Jul 2020 11:22:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 184so8914882wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2020 04:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=D2H2b7P5qmUsaui6FZYqP2HzZx7XEMBAADHaXJEbRDI=;
 b=uOeMfgoEL/esE1eb/SPXupH4IrJiAQedwg9OKaLlFp5F0lShIHa+FfnORwp9lk2S3g
 bnNCoEf38PT11OxlLIsQkMaQ8J1BagmwXPaIbxIJN+nN5R6vV5V80g8voMJs5KiEx6vD
 QWdBXMtwV9Vb6cXXkTKysNTkbhc37BDenJuaQYNIcJiTtaOkhcB/krGv76h052XnTafJ
 oZu952XUtihKFa3NWKhaX5OpuzxJHz7ixnEnnESZNNfMuFWkYngupZDIRqxPO/LmYMmu
 6Hfq5/PN5wA8MwTQUclJM8d2ZCl/Q8Z981yFC10gpkyo5hFXbmHUD8OfulTbgAdQed78
 zpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=D2H2b7P5qmUsaui6FZYqP2HzZx7XEMBAADHaXJEbRDI=;
 b=T99xQAPQoLBSPnfySQn37EXPBGSNB/47OGY4xvFz4D0lZ++4CZCYQLeKiSSI+DJeog
 hPXiTvWcD1cFJysrHlramQOlGhhpWYYpVi+D9hmuQO4zXOo7nAnOE5M+w3iJB/XKCWTl
 VnYh74pbXi/Fj8YIjod8kWy6RqmoDQNpXHE4WSuBJasTVb+gI3IiqjsfUpDNkdmmtW6L
 KX0cula7InxR/CyDD6E/pLGO62ItlYY5fSqVtCsw0B/qaufq/5YUy9DEDOUgq3ZTNOau
 sit/WGYw7JysJOoqQ+B8o+Lz5DItJN28wUu3EAMXZxN5M+ByxLyCEqJfNCwk+Uyyw92C
 T+uA==
X-Gm-Message-State: AOAM531mRYJyL1L6AKjPdFaQq7jTFiOgF3Jrq+3dHXMpQoIR0X1baBV3
 MGn+mipOi+SglEBWXOEpIwA=
X-Google-Smtp-Source: ABdhPJwfCV64IBQy2Oom0dJKF6OZUSAHEGCss8nmpT4enj7BZ9H78QyqqmU0BjiBxSBUrKt4gTeUEA==
X-Received: by 2002:a1c:2dcb:: with SMTP id t194mr3395904wmt.94.1596194533183; 
 Fri, 31 Jul 2020 04:22:13 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id p22sm11294732wmc.38.2020.07.31.04.22.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Jul 2020 04:22:12 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200731104644.20906-1-paul@xen.org>
 <317725c7-4db4-c844-ec97-6f677b047661@suse.com>
In-Reply-To: <317725c7-4db4-c844-ec97-6f677b047661@suse.com>
Subject: RE: [PATCH] x86/hvm: set 'ipat' in EPT for special pages
Date: Fri, 31 Jul 2020 12:17:00 +0100
Message-ID: <003a01d6672c$1ca0f1e0$55e2d5a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLI7tFygWYJCZY9nQSqDpuxgiPp+AJCrDHjpypktYA=
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 31 July 2020 12:15
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>
> Subject: Re: [PATCH] x86/hvm: set 'ipat' in EPT for special pages
>=20
> On 31.07.2020 12:46, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > All non-MMIO ranges (i.e those not mapping real device MMIO regions) =
that
> > map valid MFNs are normally marked MTRR_TYPE_WRBACK and 'ipat' is =
set. Hence
> > when PV drivers running in a guest populate the BAR space of the Xen =
Platform
> > PCI Device with pages such as the Shared Info page or Grant Table =
pages,
> > accesses to these pages will be cachable.
> >
> > However, should IOMMU mappings be enabled be enabled for the guest =
then these
> > accesses become uncachable. This has a substantial negative effect =
on I/O
> > throughput of PV devices. Arguably PV drivers should bot be using =
BAR space to
> > host the Shared Info and Grant Table pages but it is currently =
commonplace for
> > them to do this and so this problem needs mitigation. Hence this =
patch makes
> > sure the 'ipat' bit is set for any special page regardless of where =
in GFN
> > space it is mapped.
> >
> > NOTE: Clearly this mitigation only applies to Intel EPT. It is not =
obvious
> >       that there is any similar mitigation possible for AMD NPT. =
Downstreams
> >       such as Citrix XenServer have been carrying a patch similar to =
this for
> >       several releases though.
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> However, ...
>=20
> > --- a/xen/arch/x86/hvm/mtrr.c
> > +++ b/xen/arch/x86/hvm/mtrr.c
> > @@ -830,7 +830,8 @@ int epte_get_entry_emt(struct domain *d, =
unsigned long gfn, mfn_t mfn,
> >          return MTRR_TYPE_UNCACHABLE;
> >      }
> >
> > -    if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
> > +    if ( (!is_iommu_enabled(d) && !cache_flush_permitted(d)) ||
> > +         is_special_page(mfn_to_page(mfn)) )
> >      {
> >          *ipat =3D 1;
> >          return MTRR_TYPE_WRBACK;
>=20
> ... shouldn't we leverages this (right away?) to do away with the
> APIC access page special case a few lines up from here? It is my
> understanding that vmx_alloc_vlapic_mapping() uses
> set_mmio_p2m_entry() just in order to get ipat set on the resulting
> EPT entry. Yet with the allocation using MEMF_no_refcount, this will
> now be the result even if no artificial MMIO mapping was created.

That's a good point. Best handled by a separate patch I think so I'll =
re-send this with your R-b plus a follow up patch as a v2.

  Paul

>=20
> Jan


