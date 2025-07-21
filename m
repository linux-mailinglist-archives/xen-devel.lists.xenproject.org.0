Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3A6B0C60C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 16:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051575.1419923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udrJs-0008U0-SP; Mon, 21 Jul 2025 14:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051575.1419923; Mon, 21 Jul 2025 14:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udrJs-0008RU-PZ; Mon, 21 Jul 2025 14:16:44 +0000
Received: by outflank-mailman (input) for mailman id 1051575;
 Mon, 21 Jul 2025 14:16:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQHN=2C=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1udrJr-0008RO-3Z
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 14:16:43 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53156af8-663d-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 16:16:42 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-455b002833bso16536875e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 07:16:42 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4562e89c87esm160130145e9.33.2025.07.21.07.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 07:16:41 -0700 (PDT)
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
X-Inumbo-ID: 53156af8-663d-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753107402; x=1753712202; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x2jn88KjgeMxOJj2flt1itrDvQfkyduI2+bxUS8o1ZM=;
        b=C/FJfP2Yb2D62Sn8Juhhn27pt/0tYumVHU+fosAueOIMhx+NlSyMkVGmU5ovJJtDmB
         WBG/toZWSPVlYLp1eJ6h1W+FB5TIl08fB+OeiwlZKYp46NoqV+iX8e0uERTcGEXhlzHu
         3FVsoxM6/Q8U1GgIF9LJiXE8e2YRlpZzTtlhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753107402; x=1753712202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2jn88KjgeMxOJj2flt1itrDvQfkyduI2+bxUS8o1ZM=;
        b=KjiFV/YvfJ4V7VTl89o7WOyO0EK0vvwJHeox6o6YeTWlan/ii7h2Taop71Cba2JO1v
         E/k7C6BamzYqcHn/B3d0XZEKbNajKhjPkBHLWwRZIOZT63CnTVs78FhCmsyxrNseVPn9
         6WjToH0+63H5CZ+EqXUeAhsVCjxC/ZS5BpTL28jyG9msKHjWTQ8oQ8ga7srk+D/uoN5c
         4BWm5hfACXp13Q4OhIwsIQqYhS7g26yx18/KmAZeqYRC2N6w53FE10Gzb5T/D6rn9z30
         6Mwd90yTT+RH7+VkpYd/UaLXE1l1p/i7bJQ3eVhdZyVs8A4syEn1yd3YMf3S+lBc41ZO
         jeHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr/GL+L2MAMuV87lvZs1Bd0oz9c6xOW2+x0IrtyahRf68IQ2nrpb/wtUpfZ4fnh9fbVFtfKMhjnuQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygU5Sm/HhS/e1KMF4cL18n/6W8mosnPwe0yXF5NiIpnIh6X3aO
	qgANrlBxNwJlCxvRrlfGnhLyG6ChVsq4D4zOn753acT4dI3Tml8ybmmpdIdUnB0o0DA=
X-Gm-Gg: ASbGncuxezgI7gFISaV23F+0TXSeU0/rS5oqeD1N9+Qr6OXOxCzl2BR0E1cKJazx+pQ
	JC3VEj71WaOZxURiw22AdP+tSGy+j7c/3ccHqsh2xqjS9OJInYRn3JzjFyY9dFFVropXm2LIVcc
	XOqrFEnxK9o3WPl0ZTsDaFA7BfKTiK0++cogJ5ny0twOy8Et5RWs70j5CZOKXElgv0B19WjH5cS
	Qf9loxKtwdA/hlEnG9Q9A8r4LKnlCQ4S7b+yqmU6l7alyPe3wO2Dh36ujej52qa1iaMEOuXQxzv
	uAqxSwhFO6lrsQbcqpGOhQW8rpOlXy3eyBNbEHBGwa/HMql8qAq0bTYvTNa+ZsOEc5OTmxXqgTK
	rqwUrObbSmlm6lJaLOBH+JaYPJ0aVO4YTyc6rFWFArxlBhukv+nKoFDltd0H/9cEoqsLhVeNzZr
	eg
X-Google-Smtp-Source: AGHT+IE9WzrcG15XO1zbbSkFAokjMmAax3Gxf1Xwo98xTq/7HLS2TRxszw9Wyb5QREZkarX5jqk6LQ==
X-Received: by 2002:a05:600c:83cc:b0:441:a715:664a with SMTP id 5b1f17b1804b1-4562e276516mr190739845e9.20.1753107401609;
        Mon, 21 Jul 2025 07:16:41 -0700 (PDT)
Date: Mon, 21 Jul 2025 16:16:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v7 1/8] vpci/header: Emulate extended capability list for
 dom0
Message-ID: <aH5LyM0og-vEDmTV@macbook.local>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-2-Jiqian.Chen@amd.com>
 <dd44b55a-eb9d-454a-836b-25dc7195a5ac@suse.com>
 <BL1PR12MB5849CD51AE6C1D7DE46EAD89E749A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <49c5ba24-e1fd-4b55-b230-1af2b22c1b18@suse.com>
 <BL1PR12MB584906633E31701F71330325E749A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BL1PR12MB584906633E31701F71330325E749A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Jul 09, 2025 at 05:34:28AM +0000, Chen, Jiqian wrote:
> On 2025/7/9 13:32, Jan Beulich wrote:
> > On 09.07.2025 07:29, Chen, Jiqian wrote:
> >> On 2025/7/8 22:10, Jan Beulich wrote:
> >>> On 04.07.2025 09:07, Jiqian Chen wrote:
> >>>> --- a/xen/drivers/vpci/header.c
> >>>> +++ b/xen/drivers/vpci/header.c
> >>>> @@ -836,6 +836,39 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
> >>>>                                    PCI_STATUS_RSVDZ_MASK);
> >>>>  }
> >>>>  
> >>>> +static int vpci_init_ext_capability_list(const struct pci_dev *pdev)
> >>>> +{
> >>>> +    unsigned int pos = PCI_CFG_SPACE_SIZE;
> >>>> +
> >>>> +    if ( !is_hardware_domain(pdev->domain) )
> >>>> +        /* Extended capabilities read as zero, write ignore for DomU */
> >>>> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
> >>>> +                                 pos, 4, (void *)0);
> >>>> +
> >>>> +    do
> >>>> +    {
> >>>> +        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
> >>>> +        int rc;
> >>>> +
> >>>> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
> >>>> +                               pos, 4, (void *)(uintptr_t)header);
> >>>
> >>> If it wasn't for this use of vpci_hw_write32(), I'd be happy to provide my
> >>> R-b. But this continues to look bogus to me: What use is it to allow writes
> >>> when Dom0 then can't read back any possible effect of such a write (in the
> >>> unexpected event that some of the bits were indeed writable)?
> >> Oh, I got your concern.
> >> What do you think about updating the header value after writing to hardware in write function?
> 
> > That would imo be a layering violation. Once again that's something that you
> > primarily would need Roger's input on.
> OK, wait for Roger's input.

Hm, I see the asymmetry of allowing writes but not direct writes, my
thought was to give the hw domain as less interference as possibly,
hence my recommendation to use vpci_hw_write32().

I practice I think it's very unlikely that devices re-use reserved
bits in the capability register, so I'm fine with using NULL (thus
discarding the write).  We can always add more complex handling here
if we ever came across a device that requires it.

Thanks, Roger.

