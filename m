Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FE08BCCA1
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 13:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717549.1119864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wE2-0004EO-PO; Mon, 06 May 2024 11:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717549.1119864; Mon, 06 May 2024 11:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wE2-0004CV-Lf; Mon, 06 May 2024 11:09:42 +0000
Received: by outflank-mailman (input) for mailman id 717549;
 Mon, 06 May 2024 11:09:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3wE1-0004By-3w
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 11:09:41 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 214646c3-0b99-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 13:09:39 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34de61b7ca4so1251129f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 04:09:39 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 z18-20020adff1d2000000b0034df178a9acsm10388104wro.99.2024.05.06.04.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 04:09:38 -0700 (PDT)
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
X-Inumbo-ID: 214646c3-0b99-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714993778; x=1715598578; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SN6cXPrjM8zvabuWv90fC9A8MK0G1jsVP2M5Dz/QHXM=;
        b=af3H1eUVJUnAkzHljEdX3jBe+UUUIVRFEA4Q+bSisKkt0N9Uwz6YxbY4o4Ohot4sSe
         UaULU4Gu3MsE9LvHRxRe2ZHDENl+Rvyb/AikiFxuKSrD4LR3/Fsmw1tt8pQ8ggymYgyv
         CrgS4XQDUBR/W5ulGbp5qlqtHGNzi3zTTVTbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714993778; x=1715598578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SN6cXPrjM8zvabuWv90fC9A8MK0G1jsVP2M5Dz/QHXM=;
        b=uSnpiCykuZyaL/ZNERFGv9K+7LfIMKNGjF17riv8v9oeTlGX6EsJtcpvpDnJw2T3TH
         QA4+jF37QksI8PxpaYC2ESzoez/VBaZdaVtzbTKPG0h6bAeasX0QuBXYCbvrqVWdK9Hb
         V0UL1qEATpu1JYsopS5oWlCB1mClWbg/4sUj+q8HPx+icjuuhRfLfTLLBfRxs9ltobQJ
         WSa7T/BH4b7D1ilWJ2TOrNQWHAWQnyj15/X9KrU2YhhiP/Ixyhjpf3yPswQMF7DzDmsH
         UM3kMsTZqcLUOe+l3rOP8SI7y6cvugFfgHkaBW2QqTe0DmVtQrZJBp4FH+0fk8whH5sI
         +UuQ==
X-Gm-Message-State: AOJu0Yw3SOHl0KLJnqfacYf71CNr5etB4tbSOtohFjlmoAa2ioOYSYho
	Si87JPW44BCfDoUhwOs7BGVS35ASBnvCaYVry4QJIWPNRoAT2PpsOK9RD7hg7qg=
X-Google-Smtp-Source: AGHT+IHLJ/8wloe8izuJOeQqefxaHn6wmY/aRSzCnUC1+AqirbyKx6DNeQdaWFoJq4BA0tuYAdUg3w==
X-Received: by 2002:a5d:678b:0:b0:34b:44d7:f3eb with SMTP id v11-20020a5d678b000000b0034b44d7f3ebmr9305830wru.3.1714993778311;
        Mon, 06 May 2024 04:09:38 -0700 (PDT)
Date: Mon, 6 May 2024 13:09:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 03/12] VT-d: parse ACPI "SoC Integrated Address
 Translation Cache Reporting Structure"s
Message-ID: <Zji6cWcAQD1RsQWD@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <c70b250d-2ec4-4254-89cf-d3241dac0d35@suse.com>
 <Zjiw89WKvy6vJAPn@macbook>
 <fb687016-6979-4294-8426-a70d579dfb50@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb687016-6979-4294-8426-a70d579dfb50@suse.com>

On Mon, May 06, 2024 at 01:01:48PM +0200, Jan Beulich wrote:
> On 06.05.2024 12:29, Roger Pau Monné wrote:
> > On Thu, Feb 15, 2024 at 11:14:31AM +0100, Jan Beulich wrote:
> >> This is a prereq to us, in particular, respecting the "ATC required"
> >> flag.
> >>
> >> Note that ACPI_SATC_ATC_REQUIRED has its #define put in dmar.h, as we
> >> try to keep actbl*.h in sync what Linux (who in turn inherit from ACPI
> >> CA) has.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I think however it should be mentioned in the description that
introduced code attempts to stay in sync with the existing
register_one_satc and acpi_parse_one_*() functions.

> >> ---
> >> Lovely: On the SPR system with the SATC I tried passing "ats" (the
> >> "required" flag is clear there), just to then hit "IOMMU#4: QI dev wait
> >> descriptor taking too long" while setting up Dom0. The 2nd message there
> >> doesn't ever appear, so the request never completes. Not sure whether
> >> that's us doing something wrong or the hardware acting up. In the former
> >> case I'd generally expect an IOMMU fault to be raised, though. FTR same
> >> on 4.18 with just "VT-d: correct ATS checking for root complex
> >> integrated devices" backported there.
> > 
> > Great, so we likely have a bug in our ATS implementation?
> 
> Or there's a hardware / firmware issue. As said in the remark, while I'm
> not really sure which one it is, I'd kind of expect some form of error
> indication rather than just a hang if we did something wrong.
> 
> >> --- a/xen/drivers/passthrough/vtd/dmar.c
> >> +++ b/xen/drivers/passthrough/vtd/dmar.c
> >> @@ -47,6 +47,7 @@ LIST_HEAD_READ_MOSTLY(acpi_drhd_units);
> >>  LIST_HEAD_READ_MOSTLY(acpi_rmrr_units);
> >>  static LIST_HEAD_READ_MOSTLY(acpi_atsr_units);
> >>  static LIST_HEAD_READ_MOSTLY(acpi_rhsa_units);
> >> +static LIST_HEAD_READ_MOSTLY(acpi_satc_units);
> > 
> > We could even make this one RO after init.
> 
> Maybe, after first introducing LIST_HEAD_RO_AFTER_INIT() and then
> perhaps switching the others up front. IOW I'd prefer to keep those
> consistent and then (if so desired) update them all in one go.
> 
> >> @@ -750,6 +751,93 @@ acpi_parse_one_rhsa(struct acpi_dmar_hea
> >>      return ret;
> >>  }
> >>  
> >> +static int __init register_one_satc(struct acpi_satc_unit *satcu)
> >> +{
> >> +    bool ignore = false;
> >> +    unsigned int i = 0;
> >> +    int ret = 0;
> >> +
> >> +    /* Skip checking if segment is not accessible yet. */
> >> +    if ( !pci_known_segment(satcu->segment) )
> >> +        i = UINT_MAX;
> >> +
> >> +    for ( ; i < satcu->scope.devices_cnt; i++ )
> >> +    {
> >> +        uint8_t b = PCI_BUS(satcu->scope.devices[i]);
> >> +        uint8_t d = PCI_SLOT(satcu->scope.devices[i]);
> >> +        uint8_t f = PCI_FUNC(satcu->scope.devices[i]);
> >> +
> >> +        if ( !pci_device_detect(satcu->segment, b, d, f) )
> >> +        {
> >> +            dprintk(XENLOG_WARNING VTDPREFIX,
> >> +                    " Non-existent device (%pp) is reported in SATC scope!\n",
> >> +                    &PCI_SBDF(satcu->segment, b, d, f));
> >> +            ignore = true;
> >> +        }
> >> +        else
> >> +        {
> >> +            ignore = false;
> >> +            break;
> >> +        }
> >> +    }
> >> +
> >> +    if ( ignore )
> >> +    {
> >> +        dprintk(XENLOG_WARNING VTDPREFIX,
> >> +                " Ignore SATC for seg %04x as no device under its scope is PCI discoverable\n",
> >> +                satcu->segment);
> > 
> > Re the error messages: won't it be better to print them using plain
> > printk and gate on iommu_verbose being enabled if anything?
> > 
> > It does seem a bit odd that such messages won't be printed when
> > iommu={debug,verbose} is enabled on the command line.
> 
> Well, perhaps yes. Yet I'm trying here to stay (largely) in sync with how
> in particular register_one_rmrr() behaves. Do you strictly think I should
> diverge here?
> 
> >> +static int __init
> >> +acpi_parse_one_satc(const struct acpi_dmar_header *header)
> >> +{
> >> +    const struct acpi_dmar_satc *satc =
> >> +        container_of(header, const struct acpi_dmar_satc, header);
> >> +    struct acpi_satc_unit *satcu;
> >> +    const void *dev_scope_start, *dev_scope_end;
> >> +    int ret = acpi_dmar_check_length(header, sizeof(*satc));
> >> +
> >> +    if ( ret )
> >> +        return ret;
> >> +
> >> +    satcu = xzalloc(struct acpi_satc_unit);
> >> +    if ( !satcu )
> >> +        return -ENOMEM;
> >> +
> >> +    satcu->segment = satc->segment;
> >> +    satcu->atc_required = satc->flags & ACPI_SATC_ATC_REQUIRED;
> >> +
> >> +    dev_scope_start = (const void *)(satc + 1);
> >> +    dev_scope_end   = (const void *)satc + header->length;
> > 
> > Isn't it enough to just cast to void * and inherit the const from the
> > left side variable declaration?
> 
> Misra won't like the (transient) removal of const, afaict. Personally I
> also consider it bad practice to omit such const.
> 
> > You could even initialize dev_scope_{start,end} at definition.
> 
> Right. This is again the way it is to be in sync with other
> acpi_parse_one_...() functions. It's always hard to judge where to diverge
> and where consistency is weighed higher. Whichever way you do it, you may
> get comment asking for the opposite ...

Oh, yes, IIRC you already mentioned this in v1, yet I've forgot when
reviewing this one.

Thanks, Roger.

