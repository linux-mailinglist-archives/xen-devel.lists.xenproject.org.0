Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D21EB6B0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 09:44:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg1ay-0003fs-9K; Tue, 02 Jun 2020 07:44:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJcj=7P=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jg1aw-0003fg-4t
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 07:44:22 +0000
X-Inumbo-ID: defd9fda-a4a4-11ea-81bc-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id defd9fda-a4a4-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 07:44:21 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u26so1603764wmn.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=koEIlgZs2d8H8p9FpJD2bIP4CIQi8B1hPb8TlcbuqXM=;
 b=k2rziECOt3ZeGegY1Zx3VBvuRF7L7cEpXPVkyPC6mB4Vxo02fLYhzl5ZfzgGeHlg7e
 2q+Mq+LYR/74aob+VoVXU2X806FtJ0Edi1wa2klf6pDa+eosQvhWX92fV+/TbuGGoqoq
 zlDROpn8oH1V2CIlAPkgKW93PLePR2JGTzPZL4/TmCkKqOGSzImwBIyJnm6PolZD4sZw
 6OZyjGhRjKT6c49nAzbQeoF415H+VW2IlupdsrRiGgPM5BiIi34dT6CbsFKR1Eo/SiHu
 69ltY+bjZqJ9LXTD00xg17bdgPiSkGWdIeRI5g1y0X39v4pbnu2DlSSgSCId6k0dqyYA
 +38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=koEIlgZs2d8H8p9FpJD2bIP4CIQi8B1hPb8TlcbuqXM=;
 b=ng+E2lZBt+MqPhwDqLf+r4LqkgJV43rb2No8YvYLX/ASErrneKRyYhfni1oa0Cv+Bx
 QaAOw3E4DIU+3/JeOWqJYaQvPwOl7UgpZkHaXG3J7driV4I+FiIAZNdnSDmu/68+2FX1
 DW1916FB7Of0T90dFpRKlB8hG4D6seNGI1J2vh6rPvcfQIK3R+EAULURq2zzjZQK8EWF
 j+R4nqwvgId0cJnhmzwqH7YQS6U+NhC2MkKhyb5diLBwsEI/Y7MWCl4bMXDlUplRuWf5
 fAyPE9gjpgibRFQ/VwKrVpQgCva3SpRA0J0LU2/LJIe7dzAOKhaRGbLd8mmn4BSGDvip
 hbJw==
X-Gm-Message-State: AOAM532upYJuiT5Gw4icXPUElPZPtHqQGYJ/d0hNfRbh3ttIxtb1OF3f
 4O5zGUGzsS2UdME7uKxQkWQ=
X-Google-Smtp-Source: ABdhPJylMVUeMguFDgXcEPBRHx8WISVCKGbn4b1ucGZiU66wJ9R5JSqFoEZpxMM/GSvxtvlbddw8Qw==
X-Received: by 2002:a05:600c:29a:: with SMTP id
 26mr2832697wmk.76.1591083860708; 
 Tue, 02 Jun 2020 00:44:20 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id c65sm2359428wme.8.2020.06.02.00.44.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jun 2020 00:44:20 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Tamas K Lengyel'" <tamas.lengyel@intel.com>,
 <xen-devel@lists.xenproject.org>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
 <03b382a38c62b5431c63d00f9acffacf43b55c1d.1591017086.git.tamas.lengyel@intel.com>
In-Reply-To: <03b382a38c62b5431c63d00f9acffacf43b55c1d.1591017086.git.tamas.lengyel@intel.com>
Subject: RE: [PATCH v19 for-4.14 02/13] tools/libxc: xc_memshr_fork with
 interrupts blocked
Date: Tue, 2 Jun 2020 08:44:19 +0100
Message-ID: <003501d638b1$a03038d0$e090aa70$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLopxTEy5NbImEQwB/v9n5io2F1+gJjgvcxpoz40jA=
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
Cc: 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Tamas K Lengyel
> Sent: 01 June 2020 14:22
> To: xen-devel@lists.xenproject.org
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>; Tamas K Lengyel =
<tamas.lengyel@intel.com>; Wei Liu
> <wl@xen.org>; Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Subject: [PATCH v19 for-4.14 02/13] tools/libxc: xc_memshr_fork with =
interrupts blocked
>=20
> Toolstack side for creating forks with interrupt injection blocked.
>=20
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
>  tools/libxc/include/xenctrl.h | 3 ++-
>  tools/libxc/xc_memshr.c       | 4 +++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/libxc/include/xenctrl.h =
b/tools/libxc/include/xenctrl.h
> index f9e17ae424..5eeee1de46 100644
> --- a/tools/libxc/include/xenctrl.h
> +++ b/tools/libxc/include/xenctrl.h
> @@ -2241,7 +2241,8 @@ int xc_memshr_range_share(xc_interface *xch,
>  int xc_memshr_fork(xc_interface *xch,
>                     uint32_t source_domain,
>                     uint32_t client_domain,
> -                   bool allow_with_iommu);
> +                   bool allow_with_iommu,
> +                   bool block_interrupts);
>=20
>  /*
>   * Note: this function is only intended to be used on short-lived =
forks that
> diff --git a/tools/libxc/xc_memshr.c b/tools/libxc/xc_memshr.c
> index 2300cc7075..a6cfd7dccf 100644
> --- a/tools/libxc/xc_memshr.c
> +++ b/tools/libxc/xc_memshr.c
> @@ -240,7 +240,7 @@ int xc_memshr_debug_gref(xc_interface *xch,
>  }
>=20
>  int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t =
domid,
> -                   bool allow_with_iommu)
> +                   bool allow_with_iommu, bool block_interrupts)
>  {
>      xen_mem_sharing_op_t mso;
>=20
> @@ -251,6 +251,8 @@ int xc_memshr_fork(xc_interface *xch, uint32_t =
pdomid, uint32_t domid,
>=20
>      if ( allow_with_iommu )
>          mso.u.fork.flags |=3D XENMEM_FORK_WITH_IOMMU_ALLOWED;
> +    if ( block_interrupts )
> +        mso.u.fork.flags |=3D XENMEM_FORK_BLOCK_INTERRUPTS;
>=20
>      return xc_memshr_memop(xch, domid, &mso);
>  }
> --
> 2.25.1
>=20



