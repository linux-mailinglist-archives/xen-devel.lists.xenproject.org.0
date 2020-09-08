Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F082260B2E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 08:46:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFXOY-0002cc-1D; Tue, 08 Sep 2020 06:46:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+vaX=CR=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kFXOW-0002cW-Ob
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 06:46:20 +0000
X-Inumbo-ID: 9bbd4183-5d51-49bc-beec-41428d86a41c
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bbd4183-5d51-49bc-beec-41428d86a41c;
 Tue, 08 Sep 2020 06:46:19 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s13so16095139wmh.4
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 23:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=9cdLAcpdK5tatiOtFH2bfJv59U90zP8b3lAcQwbXgCY=;
 b=L5OPLq+rK9+q/nRLV5/jbOMws16Fm/q42/7dyN5q/fy6aHd4B0dZOGD/8vcmvAAqKP
 gvMpYjN/pS88YOSPmISsviaRfpkbesp4kCJ0uD45/cQBjQbVmQS9zirg4qwucv9CI7DQ
 by0W1b/rvnz/7Wo4NoWzl8W1yHU/ny3HIKjMTbXbh8BzeDKufvFz1/sdCBhRF8eqa11z
 gNh+YiiQi+W2oehs23HpAo2ndlxku9JxkbVJu5A3kALlc39bxu68/E47hkfOUJR/r4VL
 uH87/hYvQn9elhd6Ow+BFtJw34Bjk5clQ3Uul9rqREiWDB2w7rkrtRXrOwD0Oq3KroP3
 eiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=9cdLAcpdK5tatiOtFH2bfJv59U90zP8b3lAcQwbXgCY=;
 b=dZO4xA3HCPAgdbHT5+NZwGrZ+H5PKMx7se3jl02guailtmCyEVAlvBaGPUP82cRMXd
 ZKj+NLaOkmGPSpRW5XIaxJZzaEvzuq2bMFrw4vCMK02G7YBwd093gZBoUcb6TVRXyyg2
 Loc6dBmpvyyR32j1dsKhC3aClKeKSsC4bMZ/QERasgGumuVlmd6RU4MQstmsHyGlsrkn
 c4NMb5CXg3RSEQkOGAcHgpw6RnX3wjBxNH7DTcXyL8asWtJItFAUkSSVbrjGQ2R7h2K3
 CVhlG/4iCGdNA1UP7m7Tkuxkm7ixHrxG0D7HB6zhF/Q8eDopeIq02DPvcr5yMGoCjf5h
 2mJg==
X-Gm-Message-State: AOAM5324/AQulhUagLT6BKWYcljAItGYhLsadX8/Ol+7iwaFi/W+P5sq
 EzVs5iyJ8HbV1nZS1OcrMeg=
X-Google-Smtp-Source: ABdhPJyAtIYq5Zdzny6fV31qVPMDSKbuhLpfv6Wo2hYyJ1gZrZ3HvBm+fBrVc4BTyBT2XRLfWd3Cmw==
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr2728432wmh.39.1599547578838; 
 Mon, 07 Sep 2020 23:46:18 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:8d91:60a7:66fc:bffd])
 by smtp.gmail.com with ESMTPSA id i26sm32343092wmb.17.2020.09.07.23.46.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:46:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>
References: <20200907170916.61693-1-roger.pau@citrix.com>
In-Reply-To: <20200907170916.61693-1-roger.pau@citrix.com>
Subject: RE: [PATCH] Revert "x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()"
Date: Tue, 8 Sep 2020 07:47:09 +0100
Message-ID: <004801d685ab$e0452ce0$a0cf86a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHvYfA3sB9ZkHJrO8AlZmsNF74W9qkskPiw
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
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 07 September 2020 18:09
> To: xen-devel@lists.xenproject.org
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>; Paul Durrant =
<paul@xen.org>
> Subject: [PATCH] Revert "x86/hvm: simplify 'mmio_direct' check in =
epte_get_entry_emt()"
>=20
> This reverts commit 81fd0d3ca4b2cd309403c6e8da662c325dd35750.
>=20
> Original commit only takes into account the APIC access page being a
> 'special' page, but when running a PVH dom0 there are other pages that
> also fulfill the 'special' page check but shouldn't have it's cache
> type set to WB.
>=20
> For example the ACPI regions are identity mapped into the guest but
> are also Xen heap pages, and forcing those to WB cache type is wrong.

I don't understand why reversion of this patch alone is sufficient =
then...
=20
>=20
> I've discovered this while trying to boot a PVH dom0, which fail to
> boot with this commit applied.
>=20
> Revert the commit while this is sorted out: either we settle that the
> current code is correct, or we modify the way ACPI regions are mapped
> into a PVH dom0.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Cc: Paul Durrant <paul@xen.org>
> ---
>  xen/arch/x86/hvm/mtrr.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
> index fb051d59c3..2bd64e8025 100644
> --- a/xen/arch/x86/hvm/mtrr.c
> +++ b/xen/arch/x86/hvm/mtrr.c
> @@ -815,13 +815,23 @@ int epte_get_entry_emt(struct domain *d, =
unsigned long gfn, mfn_t mfn,
>          return -1;
>      }
>=20
> +    if ( direct_mmio )
> +    {
> +        if ( (mfn_x(mfn) ^ mfn_x(d->arch.hvm.vmx.apic_access_mfn)) >> =
order )
> +            return MTRR_TYPE_UNCACHABLE;
> +        if ( order )
> +            return -1;
> +        *ipat =3D 1;
> +        return MTRR_TYPE_WRBACK;
> +    }
> +
>      if ( !mfn_valid(mfn) )
>      {
>          *ipat =3D 1;
>          return MTRR_TYPE_UNCACHABLE;
>      }
>=20
> -    if ( !direct_mmio && !is_iommu_enabled(d) && =
!cache_flush_permitted(d) )
> +    if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
>      {
>          *ipat =3D 1;
>          return MTRR_TYPE_WRBACK;

... since just below this hunk, commit ca24b2ffdbd9 "x86/hvm: set 'ipat' =
in EPT for special pages" introduced the check:

+    for ( i =3D 0; i < (1ul << order); i++ )
+    {
+        if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
+        {
+            if ( order )
+                return -1;
+            *ipat =3D 1;
+            return MTRR_TYPE_WRBACK;
+        }
+    }
+

So, would that not be catching the ACPI regions?

Also, why is it ok for ACPI regions to be WB if the IOMMU is not =
enabled? I know that this will never be the case for PVH dom0 but why do =
domUs also have to suffer? I think we need a more targeted patch.

  Paul

> @@ -838,9 +848,6 @@ int epte_get_entry_emt(struct domain *d, unsigned =
long gfn, mfn_t mfn,
>          }
>      }
>=20
> -    if ( direct_mmio )
> -        return MTRR_TYPE_UNCACHABLE;
> -
>      gmtrr_mtype =3D hvm_get_mem_pinned_cacheattr(d, _gfn(gfn), =
order);
>      if ( gmtrr_mtype >=3D 0 )
>      {
> --
> 2.28.0



