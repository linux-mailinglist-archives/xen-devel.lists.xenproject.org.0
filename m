Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4152584F13D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 09:12:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678561.1055943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYLyo-0005JB-NK; Fri, 09 Feb 2024 08:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678561.1055943; Fri, 09 Feb 2024 08:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYLyo-0005HG-K4; Fri, 09 Feb 2024 08:11:26 +0000
Received: by outflank-mailman (input) for mailman id 678561;
 Fri, 09 Feb 2024 08:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSO/=JS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rYLyn-0005HA-Ke
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 08:11:25 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0dd46f9-c722-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 09:11:24 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41047395814so5775345e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 00:11:24 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 g4-20020a5d46c4000000b0033b1f023af2sm1158153wrs.52.2024.02.09.00.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 00:11:23 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d0dd46f9-c722-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707466284; x=1708071084; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GVTHB6Z/WJ/dQCx8xwxfP0PgrYlWn1zft1GvNWCII9Y=;
        b=wBbHpNVKpv2oBQH68/1I0UErB83pvxFE16ifQg2BfmtwTPc4gImuAIgEFaQmfZM1eX
         jVpwK74DxO8BYIA3Ry3/YrhZjPljwwzB3gZdfSp+a8zjYffOLexHd9C7yaQh3KQx7Wrm
         hJvNse/WFWoHdDaNoqMPq3xmFMGa8AGejLUWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707466284; x=1708071084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVTHB6Z/WJ/dQCx8xwxfP0PgrYlWn1zft1GvNWCII9Y=;
        b=mcskyw+VRFctiUzOYrVHbJ0MPWOv+wEXrRRknJxUbpBxlXeMlF80X4BVss/26JX3kK
         OigXnsFDtLu9jQcd55F08YDQIXesNBLFelPeM7U6ujZxDuhcEw9Qr7i1/vaFpOepzP7Q
         3oUzG9nEaMN6e1mYdOgn4GU9qF2NWKmiYdJ9l4qolY08ZMSDlZDFSuWwLp1O+aVDStrI
         p7cV4n4AXMbBfICepwzzVPDxCDCPzWluEYbHnVzTuoqofme1IBtN2vBUDIELk34BEits
         uPaI5GpaeISODbtLDxJJ2f/lzdznnC3mcxuBwmr3wFDsIibvGifZAoLkEHpdvi67FNHE
         Cjag==
X-Gm-Message-State: AOJu0YwMBzq0dNPvGRXNdidRPELDavfO05wK2uyIA0reufL9RjKpzVod
	1z5xmdz7nCFt80eqEt1UVR4ZFkGRGj8Uyag4am9o05HcWlmy2FQe4bsAYmO90cQ=
X-Google-Smtp-Source: AGHT+IGzU79p5Epp/sld2vo3kIRxLlIxaVQpLL66jc5+oNk88fQ8L4QjfR1GaqacXCjUobQXVE3ayw==
X-Received: by 2002:a05:600c:19d1:b0:40f:b691:d3c1 with SMTP id u17-20020a05600c19d100b0040fb691d3c1mr580645wmq.30.1707466283957;
        Fri, 09 Feb 2024 00:11:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGNUXcW1v1eaGMXjXB8JscA07ihnYPOXlZpjTsPxKXMpCn0C5ZlLuKaoKRqrawjIHQ4q85QdDcNRUrvYqNgn3pejFFMPmAFpBVQAq1CPT0Lzze
Date: Fri, 9 Feb 2024 09:11:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 4/7] VT-d: replace find_ats_dev_drhd()
Message-ID: <ZcXeKvdyxwtECV4a@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <a75bef32-8bbb-4471-b26b-981b06173cd5@suse.com>
 <ZcUP-t5gFx2v31at@macbook>
 <ee53bbdd-4d57-4470-9ff4-1ff6b9eec63c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee53bbdd-4d57-4470-9ff4-1ff6b9eec63c@suse.com>

On Fri, Feb 09, 2024 at 08:06:07AM +0100, Jan Beulich wrote:
> On 08.02.2024 18:31, Roger Pau Monné wrote:
> > On Mon, Feb 05, 2024 at 02:56:36PM +0100, Jan Beulich wrote:
> >> All callers only care about boolean outcome. For this there's no point
> >> in allocating a duplicate of the respective DRHD structure; a simple
> >> boolean suffices (which eventually may wantg to become a count, such
> >                                          ^ want
> >> that the "any ATS devices assigned state" can also clear again). With
> >> that boolean, remove respective parameters from internal helper
> >> functions right away, as those have access to the flag through another
> >> parameter.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > AFAICT the intention is that this is a non-functional change?
> 
> No functional effect intended, yes. Added such a sentence.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> >> --- a/xen/drivers/passthrough/vtd/extern.h
> >> +++ b/xen/drivers/passthrough/vtd/extern.h
> >> @@ -65,8 +65,6 @@ struct acpi_drhd_unit *ioapic_to_drhd(un
> >>  struct acpi_drhd_unit *hpet_to_drhd(unsigned int hpet_id);
> >>  struct acpi_rhsa_unit *drhd_to_rhsa(const struct acpi_drhd_unit *drhd);
> >>  
> >> -struct acpi_drhd_unit *find_ats_dev_drhd(struct vtd_iommu *iommu);
> >> -
> >>  int ats_device(const struct pci_dev *, const struct acpi_drhd_unit *);
> >>  
> >>  int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 did,
> >> --- a/xen/drivers/passthrough/vtd/iommu.c
> >> +++ b/xen/drivers/passthrough/vtd/iommu.c
> >> @@ -624,8 +624,7 @@ int cf_check vtd_flush_iotlb_reg(
> >>  }
> >>  
> >>  static int __must_check iommu_flush_iotlb_global(struct vtd_iommu *iommu,
> >> -                                                 bool flush_non_present_entry,
> >> -                                                 bool flush_dev_iotlb)
> >> +                                                 bool flush_non_present_entry)
> >>  {
> >>      int status;
> >>  
> >> @@ -633,7 +632,7 @@ static int __must_check iommu_flush_iotl
> >>      vtd_ops_preamble_quirk(iommu);
> >>  
> >>      status = iommu->flush.iotlb(iommu, 0, 0, 0, DMA_TLB_GLOBAL_FLUSH,
> >> -                                flush_non_present_entry, flush_dev_iotlb);
> >> +                                flush_non_present_entry, iommu->flush_dev_iotlb);
> > 
> > Any reason to not also remove the parameter from here also?  As the handler
> > gets iommu passed as the first parameter anyway.
> 
> Indeed, yet then the patch would have grown quite a bit. I think I
> meant to have a respective post-commit-message remark, but then
> forgot to actually put one there. Once (if) this change has gone in,
> a follow-on patch could further tidy tings. (The "right away" in the
> description was kind of meant to indicate that.)

Would you mind adding a sentence to the commit message that the
vtd_iommu hooks are not modified in order to avoid the patch growing
too much?  Otherwise it it's not clear why those are not also
converted.

Thanks, Roger.

