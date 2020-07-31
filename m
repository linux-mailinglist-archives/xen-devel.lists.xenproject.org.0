Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5562346A5
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:13:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UqU-0004Yu-Jx; Fri, 31 Jul 2020 13:13:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fae6=BK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k1UqT-0004Yp-DR
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:13:09 +0000
X-Inumbo-ID: 93a0218e-d32f-11ea-8e33-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93a0218e-d32f-11ea-8e33-bc764e2007e4;
 Fri, 31 Jul 2020 13:13:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r2so22881855wrs.8
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2020 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=xbaCTwd47f5RsrTDC/XEMHAiDAHTew0m39W0YHlJ18Y=;
 b=eObv7IGn8kpagi9qChsuYC4riVyG+4fw4dSMn8NF14V/eketgc2TukXTDVuK3gHOOz
 nCV+NEYR+Fj9K3vS6oBvKSMLgZF/isWHINSg+RbgEJU/kFDJvGrHuoEADHn/K4faKcdU
 6AWPAWtAhxfjNSTa1Bhzwx00HPhvuZJwCpFQ23yZAdTZhBTOus2fjaWtNDGBbYAssyIp
 UFYU2IARhOVkuSTpAfvY4NcdKICmopM2qRJv7xqX0p5h7MfXn3EeOOrXaS3/94c12SZB
 6AXe0GobLipGZcyXqulA9NZVqWrW6MN5rWg8obAZQd8KWZB4cQs4VxBwzLiMTt50d36U
 XweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=xbaCTwd47f5RsrTDC/XEMHAiDAHTew0m39W0YHlJ18Y=;
 b=iVRFgLp/v2//xe+e0Q5sX6pizd4bzLF2GRdBcz1KHYnmU8M+/I9E62+Poi3ooHzAXb
 egDM7HQA5zMl6skFUeFBaFqAxJbcDrcxKvXFl25mWuz+2PZ06aLpgGAcq0HLcASDjHX3
 F59ghdbgSZ5ouvlG5G4UStTb4etYcroGF7EWmpWJrATFu5nZaU57ANJVN8Pi8vgvYs2N
 YfD4NmIC+SBsnhKfgfQYvrsaFWo/mdByc43BE+nth8PBkZxQ59lR+UgfwFxl/W8FigIs
 72WloFugcIkTDL7yqLiSNkNOPKvzoXXnSlikvBiC7VnIdAeG59veEkio4d85N3XqTlYF
 4Rng==
X-Gm-Message-State: AOAM5306ds4RsmFoNi6t184SLsYrMWj1pARklTGIGE6FmzHocUpUYsJs
 ThZbJV0XNErGNB6i1BtJNxQ=
X-Google-Smtp-Source: ABdhPJzYlaT8zWLG835WJLzipwvHznzwPetKnvgiMg7UFvrB/qpx6D0UZoh5SxcyhPxHXrE3H96P2A==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr3363853wru.22.1596201187745;
 Fri, 31 Jul 2020 06:13:07 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id 68sm14231059wra.39.2020.07.31.06.13.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Jul 2020 06:13:06 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200731123926.28970-1-paul@xen.org>
 <20200731123926.28970-3-paul@xen.org>
 <a4856c33-8bb0-4afa-cc71-3af4c229bc27@suse.com>
In-Reply-To: <a4856c33-8bb0-4afa-cc71-3af4c229bc27@suse.com>
Subject: RE: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()
Date: Fri, 31 Jul 2020 14:07:54 +0100
Message-ID: <004501d6673b$9adffbf0$d09ff3d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLlfQu00pWfsofZfQkBPK3LKKgwygFbp5BqArgsBgSm4tz34A==
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
> Sent: 31 July 2020 13:58
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>
> Subject: Re: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in =
epte_get_entry_emt()
>=20
> On 31.07.2020 14:39, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Re-factor the code to take advantage of the fact that the APIC =
access page is
> > a 'special' page.
>=20
> Hmm, that's going quite as far as I was thinking to go: In
> particular, you leave in place the set_mmio_p2m_entry() use
> in vmx_alloc_vlapic_mapping(). With that replaced, the
> re-ordering in epte_get_entry_emt() that you do shouldn't
> be necessary; you'd simple drop the checking of the
> specific MFN.

Ok, it still needs to go in the p2m though so are you suggesting just =
calling p2m_set_entry() directly?

> However, ...
>=20
> > --- a/xen/arch/x86/hvm/mtrr.c
> > +++ b/xen/arch/x86/hvm/mtrr.c
> > @@ -814,29 +814,22 @@ int epte_get_entry_emt(struct domain *d, =
unsigned long gfn, mfn_t mfn,
> >          return -1;
> >      }
> >
> > -    if ( direct_mmio )
> > -    {
> > -        if ( (mfn_x(mfn) ^ mfn_x(d->arch.hvm.vmx.apic_access_mfn)) =
>> order )
> > -            return MTRR_TYPE_UNCACHABLE;
> > -        if ( order )
> > -            return -1;
>=20
> ... this part of the logic wants retaining, I think, i.e.
> reporting back to the guest that the mapping needs splitting.
> I'm afraid I have to withdraw my R-b on patch 1 for this
> reason, as the check needs to be added there already.

To be clear... You mean I need the:

if ( order )
  return -1;

there?

  Paul

>=20
> Jan


