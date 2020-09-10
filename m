Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BC42647F3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:25:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNVn-0003xj-H5; Thu, 10 Sep 2020 14:25:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EwZ=CT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kGNVl-0003xc-Hw
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:25:17 +0000
X-Inumbo-ID: 4fbbe16f-bbdf-4fb5-9bc3-cb7d5f3ed68d
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fbbe16f-bbdf-4fb5-9bc3-cb7d5f3ed68d;
 Thu, 10 Sep 2020 14:25:16 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k18so219032wmj.5
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 07:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=G+0IFq9dtH9drP7fsTjj+zQkrLK8JGDpzH6eFRwDSus=;
 b=d7/zI/qTUUoWKB6dXQ4kUxrK2+n1Px7/2lCwL4ESmShWByPsnSKNjMy5IOMgz1co08
 3/PDkUMGB2Id0qhFEXA2LlexTXKWdMnJNp3DIJ50DRhUIUMJQ6c8ORuo8qsIMYVa6MZI
 twzU6PViHIWgPbUqKaPGffTijOuJo0lcYiP9uhAnCJWdtDDFB3vJHMfWBtEvjZAa8xxm
 0fGDwBuX+q9jqTNB5KaesL0oNlPV3aQFoIJUU+XUeg5G1tu6EIsVP/aJpzqsW85jyl/I
 Le3DQER0CRBNvFZp9pxswk5znet9zQjIduZW2AnVF6EIL/sh70v11XHFEn7xnfmjI2Tn
 K/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=G+0IFq9dtH9drP7fsTjj+zQkrLK8JGDpzH6eFRwDSus=;
 b=m/U9PZ8w8KERYNoDB+DrEOyLiY3hXTIHhVn+NtwmLCCYhq6HQqAzLH9MW6nSvu6Igw
 iaoGe08iW3W+4NJzKPZqdYZX6F4fGberivk+Nf2VHM79WiFc/Y6wP85OLPHkxG4zazvZ
 7xz25BtaZI8T/vaiVEw1Of+xConPnN8WI3ljtELO6CZMTSHHfIpVkk5TZAvoCMaYbm57
 g8NcawIgYu5qDptDiIiooZ6h7I39lOaSBX1zXuG+1ne8HpWSfbyUjhwuV56UsKjpjRIP
 uc5/mFza46KjJCtmu/WBrzPhncAE8wRODpg9w4iSEWjPTWnjyG3BJwDh8FVq63H9zM2C
 GWhw==
X-Gm-Message-State: AOAM532dwARdOIQekxhYNu0JH8BUPzcT1GDToBn5Yt7BfYIDEIvyGFNr
 P9UT8gQv+9qGbUX9LdNNcq0=
X-Google-Smtp-Source: ABdhPJy6CEzVhkisTxWwojbSryQHNeTcOhnxcZWDnpE4n0qYL5iX9zIsstZj3pbSrLAhZsOjayHG0A==
X-Received: by 2002:a1c:bbd6:: with SMTP id l205mr244759wmf.79.1599747915860; 
 Thu, 10 Sep 2020 07:25:15 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id k22sm9473297wrd.29.2020.09.10.07.25.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 07:25:14 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>, "'Paul Durrant'" <pdurrant@amazon.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>, "'Wei Liu'" <wl@xen.org>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>
References: <20200907074023.1392-1-paul@xen.org>
 <20200907074023.1392-8-paul@xen.org>
 <44d46ebd-1cdd-e7f9-5902-69be32bdb3ff@suse.com>
In-Reply-To: <44d46ebd-1cdd-e7f9-5902-69be32bdb3ff@suse.com>
Subject: RE: [PATCH v5 7/8] iommu: remove the share_p2m operation
Date: Thu, 10 Sep 2020 15:25:14 +0100
Message-ID: <003301d6877e$33399890$99acc9b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHhwG7ATr0KfpJW6ur2MqQg9p50hwIej6z4AfJ5/7+pKvLQUA==
Content-Language: en-gb
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
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 10 September 2020 15:20
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; =
Wei Liu <wl@xen.org>; Roger Pau
> Monn=C3=A9 <roger.pau@citrix.com>; Kevin Tian <kevin.tian@intel.com>
> Subject: Re: [PATCH v5 7/8] iommu: remove the share_p2m operation
>=20
> On 07.09.2020 09:40, Paul Durrant wrote:
> > --- a/xen/drivers/passthrough/vtd/iommu.c
> > +++ b/xen/drivers/passthrough/vtd/iommu.c
> > @@ -318,6 +318,48 @@ static u64 addr_to_dma_page_maddr(struct domain =
*domain, u64 addr, int alloc)
> >      return pte_maddr;
> >  }
> >
> > +static uint64_t domain_pgd_maddr(struct domain *d, unsigned int =
nr_pt_levels)
> > +{
> > +    struct domain_iommu *hd =3D dom_iommu(d);
> > +    uint64_t pgd_maddr;
> > +    unsigned int agaw;
> > +
> > +    ASSERT(spin_is_locked(&hd->arch.mapping_lock));
> > +
> > +    if ( iommu_use_hap_pt(d) )
> > +    {
> > +        mfn_t pgd_mfn =3D
> > +            =
pagetable_get_mfn(p2m_get_pagetable(p2m_get_hostp2m(d)));
> > +
> > +        return pagetable_get_paddr(pagetable_from_mfn(pgd_mfn));
>=20
> I thought I had already asked about this odd going through a =
pagetable_t
> a 2nd time without a clear need. Why not simply
>=20
>     if ( iommu_use_hap_pt(d) )
>     {
>         pagetable_t pgt =3D p2m_get_pagetable(p2m_get_hostp2m(d));
>=20
>         return pagetable_get_paddr(pgt);
>     }
>=20
> ?

It's code movement (which IIRC you had acknowledged) but I can change it =
if you wish.

>=20
> > +    }
> > +
> > +    if ( !hd->arch.vtd.pgd_maddr )
> > +    {
> > +        addr_to_dma_page_maddr(d, 0, 1);
>=20
> Ahead of this, would you mind retaining ...
>=20
> > @@ -1340,37 +1382,18 @@ int domain_context_mapping_one(
> >      if ( iommu_hwdom_passthrough && is_hardware_domain(domain) )
> >      {
> >          context_set_translation_type(*context, =
CONTEXT_TT_PASS_THRU);
> > -        agaw =3D level_to_agaw(iommu->nr_pt_levels);
> >      }
> >      else
> >      {
> >          spin_lock(&hd->arch.mapping_lock);
> >
> > -        /* Ensure we have pagetables allocated down to leaf PTE. */
> > -        if ( hd->arch.vtd.pgd_maddr =3D=3D 0 )
> > +        pgd_maddr =3D domain_pgd_maddr(domain, =
iommu->nr_pt_levels);
> > +        if ( !pgd_maddr )
> >          {
> > -            addr_to_dma_page_maddr(domain, 0, 1);
>=20
> ... the comment you remove here?
>=20

Sure.

> With these adjustments
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20

Thanks.

  Paul

> Jan


