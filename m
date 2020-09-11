Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1C9265AFE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 10:00:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGdyV-00044L-A3; Fri, 11 Sep 2020 08:00:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtdL=CU=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kGdyT-0003e0-2x
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 08:00:01 +0000
X-Inumbo-ID: 7ad1f9e9-6244-4598-81bd-9864990349c9
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ad1f9e9-6244-4598-81bd-9864990349c9;
 Fri, 11 Sep 2020 07:59:59 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a65so3515847wme.5
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2020 00:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=rbGBXit++KrlNpCeAjWS4OQ/f9dzkPBNE7LJMRcicAQ=;
 b=pyB1e0I9S6zk+YLbzyW91QR1vGrfYoFtXKSFLOehpLLtTh3Y26W/qNRisFm8W91LNj
 /dW+Ks+qyYdVoi29nEY9sk2VCSqLnr71O6gP1jx54y4yijFytIpjTdqDIahE8+gJ5lpO
 rYJW401QMT6+JiLoYo/+rNC6p9dPuJQLG2LQZ6cY2kOkzWmLrMyfdxMnAlT136clSZNn
 9MW3/2rtcwjny1c3bq1o2qX/Ryw0iprS9dCRzh5/K/dDSx9AokFe8wmVS8+BhO4tXxgB
 9EJJXnbIoV8B6/G+/c8cTsR7DrhPunN/f81BQBnBsE/+FYkPae3Ulo9kS/8e1E933qMq
 jJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=rbGBXit++KrlNpCeAjWS4OQ/f9dzkPBNE7LJMRcicAQ=;
 b=G00yZZyHSrRb7JdVld48eyCSfhHPfz7hcVjG9uMjWroao3TjlN9v9Wn9pDrqixr+dw
 G5c1SS2lE2egOkpwnXY/IPuNXfE9RmjtrSMYKTcxh7k8pG7+Q2C3IZGpfmuop0gMfdYa
 7hAn2gWgwo/5i1nHJ8ouiYHBxP16mlUabPP3F5RxT/Z6/xICZ3jIpXP09dnnaZPwB9rB
 3KN0tozy8HGAbSURA+dwuvc53pYIfHKc/y0ZACsGEKzooxr00h/srfpB4pJ0GHsrrZD4
 IDiQv0PAa6jI7fvlpRjw/4RanP3IfXaGIMoiQNms1l4uonC8QIR9W2LoYxXgw+KB1l3L
 CKPQ==
X-Gm-Message-State: AOAM531RfNBi+Jeyu7Nx60B0Hgg7t2eJq5Ie1EiQjSj59mduFaS06JPf
 T+DKAITNDvg2Jf4TyrdCGyQ=
X-Google-Smtp-Source: ABdhPJza5H5l8iUb3y5//piy0MWxce6okwPwzBKBBhymz7mJngwzpEjkjXUGxWhhpb1PHhB+GVFu2Q==
X-Received: by 2002:a1c:678a:: with SMTP id b132mr986886wmc.10.1599811199085; 
 Fri, 11 Sep 2020 00:59:59 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id v128sm2677876wme.2.2020.09.11.00.59.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Sep 2020 00:59:58 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
 "'Durrant, Paul'" <pdurrant@amazon.co.uk>
Cc: "'Bertrand Marquis'" <Bertrand.Marquis@arm.com>,
 "'open list:X86'" <xen-devel@lists.xenproject.org>,
 "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Jun Nakajima'" <jun.nakajima@intel.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>
References: <20200910145007.14107-1-paul@xen.org>
 <20200910145007.14107-5-paul@xen.org>
 <797DD1A2-60EB-455C-943D-C515881A69CC@arm.com>
 <C9ADFBE4-D7C7-43EC-9F33-D658548CE98D@arm.com>
 <88fc2079ec3f452db02fb4148b69240a@EX13D32EUC003.ant.amazon.com>
 <CAPD2p-nop-LF4-c9DDBaG6R1c7ZknPODdjsDeyg2opNN9KTQTQ@mail.gmail.com>
In-Reply-To: <CAPD2p-nop-LF4-c9DDBaG6R1c7ZknPODdjsDeyg2opNN9KTQTQ@mail.gmail.com>
Subject: RE: [PATCH v6 4/8] iommu: make map and unmap take a page count,
 similar to flush
Date: Fri, 11 Sep 2020 08:59:46 +0100
Message-ID: <004801d68811$84894ae0$8d9be0a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGDoYfTQ+O59bAcTdsNQ87JtdoTKAL+MzNeAY/j9QQCF7JtBAIESfpOAiPGA+ypsnDVcA==
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

De-htmling...

-----
From: Oleksandr Tyshchenko <olekstysh@gmail.com>=20
Sent: 10 September 2020 19:20
To: Durrant, Paul <pdurrant@amazon.co.uk>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Paul Durrant =
<paul@xen.org>; open list:X86 <xen-devel@lists.xenproject.org>; Jan =
Beulich <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; =
Wei Liu <wl@xen.org>; Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; =
George Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano =
Stabellini <sstabellini@kernel.org>; Jun Nakajima =
<jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v6 4/8] iommu: make map and unmap take a page count, =
similar to flush



On Thu, Sep 10, 2020 at 8:49 PM Durrant, Paul =
<mailto:pdurrant@amazon.co.uk> wrote:

Hi Paul

[sorry for the possible format issue]

> -----Original Message-----
> From: Bertrand Marquis <mailto:Bertrand.Marquis@arm.com>
> Sent: 10 September 2020 17:46
> To: Paul Durrant <mailto:paul@xen.org>
> Cc: open list:X86 <mailto:xen-devel@lists.xenproject.org>; Durrant, =
Paul <mailto:pdurrant@amazon.co.uk>; Jan Beulich
> <mailto:jbeulich@suse.com>; Andrew Cooper =
<mailto:andrew.cooper3@citrix.com>; Wei Liu <mailto:wl@xen.org>; Roger =
Pau Monn=C3=A9
> <mailto:roger.pau@citrix.com>; George Dunlap =
<mailto:george.dunlap@citrix.com>; Ian Jackson
> <mailto:ian.jackson@eu.citrix.com>; Julien Grall =
<mailto:julien@xen.org>; Stefano Stabellini
> <mailto:sstabellini@kernel.org>; Jun Nakajima =
<mailto:jun.nakajima@intel.com>; Kevin Tian =
<mailto:kevin.tian@intel.com>
> Subject: RE: [EXTERNAL] [PATCH v6 4/8] iommu: make map and unmap take =
a page count, similar to flush
>=20
> CAUTION: This email originated from outside of the organization. Do =
not click links or open
> attachments unless you can confirm the sender and know the content is =
safe.
>=20
>=20
>=20
> >> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> >> index 1831dc66b0..13f68dc93d 100644
> >> --- a/xen/include/xen/iommu.h
> >> +++ b/xen/include/xen/iommu.h
> >> @@ -146,23 +146,23 @@ enum
> >> #define IOMMU_FLUSHF_modified (1u << _IOMMU_FLUSHF_modified)
> >>
> >> int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
> >> -                           unsigned int page_order, unsigned int =
flags,
> >> +                           unsigned long page_count, unsigned int =
flags,
> >>                           unsigned int *flush_flags);
> >> int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
> >> -                             unsigned int page_order,
> >> +                             unsigned long page_count,
> >>                             unsigned int *flush_flags);
> >>
> >> int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, =
mfn_t mfn,
> >> -                                  unsigned int page_order,
> >> +                                  unsigned long page_count,
> >>                                  unsigned int flags);
> >> int __must_check iommu_legacy_unmap(struct domain *d, dfn_t dfn,
> >> -                                    unsigned int page_order);
> >> +                                    unsigned long page_count);
> >>
> >> int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, =
mfn_t *mfn,
> >>                                   unsigned int *flags);
> >>
> >> int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
> >> -                                   unsigned int page_count,
> >> +                                   unsigned long page_count,
> >>                                   unsigned int flush_flags);
> >> int __must_check iommu_iotlb_flush_all(struct domain *d,
> >>                                       unsigned int flush_flags);
> >> @@ -281,7 +281,7 @@ struct iommu_ops {
> >>    void (*share_p2m)(struct domain *d);
> >>    void (*crash_shutdown)(void);
> >>    int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
> >> -                                    unsigned int page_count,
> >> +                                    unsigned long page_count,
> >
> > This change will require to change the arm smmu code to have the =
right type for page count:
> > xen/drivers/passthrough/smmu.c:2536
> > static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t =
dfn,
> >                         unsigned int page_count,
> >                         unsigned int flush_flags)
> >
> > Otherwise compilation is failing for arm.
> >
> > With that fixed i could compile and start an arm system with the =
complete serie (but not one with an
> arm SMMU).
>=20
> I should have specified because my test system right now does not have =
an SMMUv1.
>=20

Thanks for spotting that; I did run a cross compilation on arm a while =
ago so not sure how I managed to miss this. Will fix and send v7.


 Probably ipmmu_iotlb_flush() in ipmmu-vmsa.c needs the same update as =
well (I don't have the possibility to apply your series and re-check)? =
Please note, it is still under CONFIG_EXPERT.
-----

Oh, that's new I guess? I'll go check.

  Paul


--=20
Regards,

Oleksandr Tyshchenko


