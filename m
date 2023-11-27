Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3951B7FA144
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 14:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642100.1001246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bwL-0003rA-Qg; Mon, 27 Nov 2023 13:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642100.1001246; Mon, 27 Nov 2023 13:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bwL-0003pN-No; Mon, 27 Nov 2023 13:46:21 +0000
Received: by outflank-mailman (input) for mailman id 642100;
 Mon, 27 Nov 2023 13:46:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJh/=HI=linaro.org=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1r7bwJ-0003nj-U9
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 13:46:19 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56cf92cf-8d2b-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 14:46:17 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3316d3d11e1so2384584f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 05:46:17 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 v5-20020a5d6105000000b0032f7fab0712sm12018505wrt.52.2023.11.27.05.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 05:46:16 -0800 (PST)
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
X-Inumbo-ID: 56cf92cf-8d2b-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701092777; x=1701697577; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YundCbgOqgxog8krRgkHDMLd3spWK5TLMe9KGeiCx18=;
        b=I50vKEjuTOGuHoDB9kO2x5K+/PWjNnaN5HD6Vxm1UIsUkvycIvNjexWeTPkMGS/bHl
         JxvJT8plOL5keMHEPiSujSwB7KADu62F6ejqcjmKcbMpv70nUCAMV8C7D6u0srHwiksZ
         72X/sFO592FvJTBRSdvOxNEorbQFlwC3RfxNcPGfWGZ/f6BSQFlwhlhF+3FpfqMAl/Xh
         pV4N9ZDHeaGbtfqneqLECqMErEhonBTaI0TvKlVvJW2Ol34j+sakC9goR92bOv3yv/BG
         pfJDAEzmgUsvmWtxAw9oM/7GesufqQpU80ZmQ66RT2FR7sSONlT0SD+jOKJ5pLomhcOl
         E1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701092777; x=1701697577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YundCbgOqgxog8krRgkHDMLd3spWK5TLMe9KGeiCx18=;
        b=Zl52ExJzlIDjA/HQzRybaMFA4mlJe441njkxczoObSKjDHo0noRIPY98Ic4CXefD9f
         aB/x/HHW8yUEcfZLjp+ZGHgk0R9cTIG2TVjjLxHeGPA/QTeHfo76iSt19RzCqGzwaJd3
         vw75nksz6VMi3c6MAf7IDm5KqopXPFfcJpDd/QO+C8zAnHmLTVYcbZXThJdG2rqFFqIj
         huJU53XQyqqi9J2FdDsGFasU6LBQ1/Ufebrpi3NkLYGYU4Q4X42OYEZWTZzFWWc/8qY5
         PU74b3hvQmkCrfkiamUHO42gyNBvdbiz4/+srRyXEyH08HQgTxkcSHgN4M4vQX0q1UhD
         MVjg==
X-Gm-Message-State: AOJu0Yyb2C7aIOZ1KRhbORpQMAnO580/8yhzPzRNKFNOgBuInubtWqJS
	V9VObgAXOFLAFgu95b78ZuyEXA==
X-Google-Smtp-Source: AGHT+IHvZXohMRpWp9ljekBnVunFfdsN+Aw6FeyybD7055qlsh79kgqr97OPSx0yef3zaO71BUfszw==
X-Received: by 2002:a5d:64e3:0:b0:333:47e:4cf4 with SMTP id g3-20020a5d64e3000000b00333047e4cf4mr1874886wri.15.1701092776947;
        Mon, 27 Nov 2023 05:46:16 -0800 (PST)
Date: Mon, 27 Nov 2023 16:46:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Julien Grall <jgrall@amazon.com>, Rahul Singh <rahul.singh@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	David Vrabel <david.vrabel@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] xen/events: fix error codes in xen_bind_pirq_msi_to_irq()
Message-ID: <4e85c67c-7e3a-47e1-a493-4906cd79306b@suswa.mountain>
References: <60028de8-a137-423d-91d8-00b2942bd73d@moroto.mountain>
 <6f9c8b08-3865-479f-8f32-686f778203f6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f9c8b08-3865-479f-8f32-686f778203f6@suse.com>

On Mon, Nov 27, 2023 at 02:17:05PM +0100, Juergen Gross wrote:
> On 27.11.23 13:57, Dan Carpenter wrote:
> > The error code needs to be set on these error paths.
> > 
> > Fixes: 5dd9ad32d775 ("xen/events: drop xen_allocate_irqs_dynamic()")
> > Fixes: d2ba3166f23b ("xen/events: move drivers/xen/events.c into drivers/xen/events/")
> 
> Please drop the last Fixes: tag. Said patch didn't introduce any new problem.

Yup.

> 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > Are we going to backport these to stable?  Should I split this into two
> > patches?
> > 
> >   drivers/xen/events/events_base.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
> > index f5edb9e27e3c..aae62603b461 100644
> > --- a/drivers/xen/events/events_base.c
> > +++ b/drivers/xen/events/events_base.c
> > @@ -1105,13 +1105,17 @@ int xen_bind_pirq_msi_to_irq(struct pci_dev *dev, struct msi_desc *msidesc,
> >   	mutex_lock(&irq_mapping_update_lock);
> >   	irq = irq_alloc_descs(-1, 0, nvec, -1);
> > -	if (irq < 0)
> > +	if (irq < 0) {
> > +		ret = irq;
> >   		goto out;
> > +	}
> 
> Why? The return value for the out: label is in irq.
> 

This patch is full of embarrassment.  I misread this code.  I thought
the out label was in the error handling block.

> >   	for (i = 0; i < nvec; i++) {
> >   		info = xen_irq_init(irq + i);
> > -		if (!info)
> > +		if (!info) {
> > +			ret = -ENOMEM;
> >   			goto error_irq;
> > +		}
> 
> It would be easier to just preset ret with -ENOMEM when defining it.
> 

That only works if it fails on the first iteration.

I'll fix this up and resend.

regards,
dan carpenter






