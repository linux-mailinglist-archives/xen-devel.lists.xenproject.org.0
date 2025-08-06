Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC69B1C20D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 10:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071424.1434878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZPV-0003MN-2E; Wed, 06 Aug 2025 08:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071424.1434878; Wed, 06 Aug 2025 08:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZPU-0003KN-VZ; Wed, 06 Aug 2025 08:22:08 +0000
Received: by outflank-mailman (input) for mailman id 1071424;
 Wed, 06 Aug 2025 08:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kasG=2S=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujZPT-0003KH-O9
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 08:22:07 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 709a9d19-729e-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 10:22:07 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-459eb4ae596so391525e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 01:22:07 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459e87487fcsm15128565e9.3.2025.08.06.01.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 01:22:06 -0700 (PDT)
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
X-Inumbo-ID: 709a9d19-729e-11f0-a322-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754468526; x=1755073326; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCv9BXWg8K0lE9PPFyoiRRKjhYKhLjyDG94FIrtzy3g=;
        b=FDuIO7vqXNf4P2QGUHxZMxgMMn2wYOCsInjVnlIqV144oQMHC4F2CR23Pzj1KjadKv
         r/ilTfHj7PuHmB9ja50UCMO4yXcKxJFSH5I0gKRW5ocifQVvbE1JmKnfa0XrQKoYS7YF
         xJFEQwyVWhH+ygrgjTflBPkbNyCMN2DCSXIAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754468526; x=1755073326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCv9BXWg8K0lE9PPFyoiRRKjhYKhLjyDG94FIrtzy3g=;
        b=HBRTdfHzsHjnSl5BXUGxnWxrEUETBmq18/eAeyzX4IRSr9yli1Vc2chmrXBNjlztZ5
         rLq3Pv3WacFu75S63JzhpkgidMeK29LZ1cAz+cqnxb8TN2xqHoeIWLSyowLqm/ykoxdq
         GqJRBbDt6eYwId6zAfrZVOvZ4MCP6do0Nm8865AM/TnSs6n1CvUNt0TS/t8WKlkgIpTk
         cHvf7bsZsfq7IQd3ErdnJG1Gm7EdBozZnSYZnGKtGzsJxsrh3CZEDl1xpVrPl/Hoqybh
         nDyFf4890fhQEgK1W6yMHdRepLh5vWquXt66QM9gLuJ2l/RWOMkVvhZGoHAtP+Rc0wmQ
         TBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi8s6/7GYjYRDfOtOarkuQaM9oj21xDbiDwqL9+JuwQsqBUUykDXm8Arasqy4xqVT6pTer+gGLma0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvjLqdYeOzWoiVFMWH3HHKYYOYZwHglRovfo8ZUGOuYlofP6eS
	zrDsLcQRiGuYpUKtKwqfNq5BezWDcO5kvXw1Ebfb9CY3ESm2vTsdfHQBWUv3AITnIT8=
X-Gm-Gg: ASbGncsglfTnedbcpSGYohzU75I84fFVAWyszKyfIeTXap4L2cFYNnANCNIQ4VWFPkg
	xBdZMzt1Mpix+lwA4iy2Sb5B/mYBjDlZE5zJbGkjI98neGkWpifN2G8RZmI4x7b4RzHgs5xelYI
	WKcw699r7Kaeyzf0s2ZaYCBtJVL+ei/QnRmd6b1Or43U1uqpU7Ccjws1pXmEXTAICZiyV68mBnq
	Z+/uHe7ia6QxSakPmVztPa4Q79eNOctvXeBNyyYsziUO4UzATPFumiS1YgpY0Y/+Sa8iVk+vkAt
	QQcfIysbwJRKtxxpiajWigfy9eSQpE8hyls9S2VbEnLGlzw6ia+Nm9NOghGRTAyXqjzAzEMcGVd
	k7+9OgV7W+53dtLY+ztuOhCFuuW2Q9oRy5eT2xLtygxqwJMlzi5j4uHT07cL1GSoNdNJH401/em
	sI
X-Google-Smtp-Source: AGHT+IEdILMeF9ekr0VpNyhii7DLh1xhyHJZXQV/k+T4wgl3IrFvVTkHAw3GPaTP5yPbFMV+WhJpOQ==
X-Received: by 2002:a05:600c:1546:b0:459:e165:2661 with SMTP id 5b1f17b1804b1-459e746f7aemr12810995e9.23.1754468526271;
        Wed, 06 Aug 2025 01:22:06 -0700 (PDT)
Date: Wed, 6 Aug 2025 10:22:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix()
 fails
Message-ID: <aJMQrT8NtdDguvYN@macbook.local>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-5-Jiqian.Chen@amd.com>
 <775a45bd-61df-4cab-948e-bdc79dfd89ef@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <775a45bd-61df-4cab-948e-bdc79dfd89ef@suse.com>

On Tue, Aug 05, 2025 at 10:43:09AM +0200, Jan Beulich wrote:
> On 05.08.2025 05:49, Jiqian Chen wrote:
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> > @@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
> >      return 0;
> >  }
> >  
> > +static int cf_check cleanup_msix(const struct pci_dev *pdev)
> > +{
> > +    int rc;
> > +    struct vpci *vpci = pdev->vpci;
> > +    const unsigned int msix_pos = pdev->msix_pos;
> > +
> > +    if ( !msix_pos )
> > +        return 0;
> > +
> > +    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
> > +    if ( rc )
> > +    {
> > +        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
> > +               pdev->domain, &pdev->sbdf, rc);
> > +        ASSERT_UNREACHABLE();
> > +        return rc;
> > +    }
> > +
> > +    if ( vpci->msix )
> > +    {
> > +        list_del(&vpci->msix->next);
> > +        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
> > +            if ( vpci->msix->table[i] )
> > +                iounmap(vpci->msix->table[i]);
> > +
> > +        XFREE(vpci->msix);
> > +    }
> > +
> > +    /*
> > +     * The driver may not traverse the capability list and think device
> > +     * supports MSIX by default. So here let the control register of MSIX
> > +     * be Read-Only is to ensure MSIX disabled.
> > +     */
> > +    rc = vpci_add_register(vpci, vpci_hw_read16, NULL,
> > +                           msix_control_reg(msix_pos), 2, NULL);
> > +    if ( rc )
> > +        printk(XENLOG_ERR "%pd %pp: fail to add MSIX ctrl handler rc=%d\n",
> > +               pdev->domain, &pdev->sbdf, rc);
> 
> Here as well as for MSI: Wouldn't this better be limited to the init-failure
> case? No point in adding a register hook (and possibly emitting a misleading
> log message) when we're tearing down anyway. IOW I think the ->cleanup()
> hook needs a boolean parameter, unless the distinction of the two cases can
> be (reliably) inferred from some other property.

I don't think we have any signal in pci_dev itself that notices
whether the device is being deassigned, in which case it does need an
extra boolean parameter to notice whether to add the r/o handler.

I'm also wondering whether we want to limit this hiding to the
hardware domain only, and for domUs fail the operation instead, and
fail to assign the device.  That can be adjusted in a later patch
though.

Thanks, Roger.

