Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EEEB1C24F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 10:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071449.1434899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZgQ-0005ol-KO; Wed, 06 Aug 2025 08:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071449.1434899; Wed, 06 Aug 2025 08:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujZgQ-0005mZ-Gr; Wed, 06 Aug 2025 08:39:38 +0000
Received: by outflank-mailman (input) for mailman id 1071449;
 Wed, 06 Aug 2025 08:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kasG=2S=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujZgO-0005mT-F4
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 08:39:36 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1033f27-72a0-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 10:39:34 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-459e1338565so17229565e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 01:39:34 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c485444sm22298292f8f.66.2025.08.06.01.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 01:39:33 -0700 (PDT)
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
X-Inumbo-ID: e1033f27-72a0-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754469574; x=1755074374; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nF4kZuoLntESWc65KJXI6W4q0k5ppspGyc/lTq0LlEg=;
        b=lO6AcTSnoZDncyKAVilsZjJI7mmQ9kjGpB3AHi3sFIlaMB3uFYiiM3ieCWRbUU21ZO
         GWe2zdXbjf7dF7WHnvtBR1DFP01xIp7Bf7PJVzgGRtEHsgFCKuSlSb8mWWTBv42NWD/A
         INRacjc81i5MTQlqfpmkMa+/uYtT1BO7MprFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754469574; x=1755074374;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nF4kZuoLntESWc65KJXI6W4q0k5ppspGyc/lTq0LlEg=;
        b=jtYR0+zTv7uEr/ALB6xxzylepoHIN7xywwUD6vaHjm1qfXEI7Lj2eV4azw+3vJVeHQ
         TMQLGXQ9OZZ61YUUs+UfRGisyw5+v+BeDf3oJCoO7hOmM3nlVNH/RMWW+SMxKcJkOtQZ
         XwW+HHb9yFQbyafgdre4hpsPOQth8SLsLgnFPJAXCPErFeNahUhIXmYNODXWFh7Rrl6s
         Hcn/TSK7F6Yj4J7WtqGp5Mr4ObsBb5U3Wk++zO1llaIR4tDNfnPZYkKyQUknXp7ttVa4
         XuPfeSlPymmxJ6ufp83G9xP607w8u9FGGem8mvo0XBQEJGSh6fvJXMp/xYqRFFLZez+2
         yY8A==
X-Forwarded-Encrypted: i=1; AJvYcCWd8OpHx3oxglINKsatmzzhHAzwvbmJSHIw93lr28XtsmH10kcetNS2q81wJXtWN2xumtv67Y0PV7M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzN/WpS+reC83D65ZILm1s/fb168zjuBOm7a4BYUHl38F/i7EF3
	puZfARVP7b6isHYHzBnLk/vg7HJiO+SD9cADc93ea2R0mo1ROJBvmF8W9EKVO8+x7Bc=
X-Gm-Gg: ASbGncseAL4ZNhi7AKY+YDVIZJlpG397eNeuCrEUHr43HyzW9cQYl4apwq/NnmHCQft
	kpKVqRMMv1B5DRpkQ+pSkM5l1s5Krb/I4hLZQlawNafo/gDUEfuoza80Wp/Q7D8R7fwCyjq3HBa
	8e9ekRivqWwwS8Nta47b7dPW76TnZeYHemnHqtzapmhI78MjmZByYjdc+f/y/A1Jtnpn/DKm/KP
	7bszsQkRF7efmZzNlbdxQg1+mTEA4xddEwQOKIPWVWGFm+zXahvW1ZSmjWcEjT1sQVL5NltGu4w
	/gDpPbW+4m9KhklqFq6Gghmii+LTBfPELyge3AFwvWJua4nKxPwxovJByAsgCVIZyEmpbAPLo1A
	PQjfL0DWsvKKh5uZr+G6oTchXkyQLGr03IROooNiiL7CdADf1r5Qy3rw/0ceEc+0L9bcVW3y1NL
	PQ
X-Google-Smtp-Source: AGHT+IGcXuKwQEaAu/2kZLgl8LBoZrBwuTZUz1ocYx7SmpdtuLUsPq80/rzgbfZTZxaVKcosdmOSeQ==
X-Received: by 2002:a05:6000:18a7:b0:3b7:810f:6caf with SMTP id ffacd0b85a97d-3b8f491ff5dmr1272054f8f.32.1754469573508;
        Wed, 06 Aug 2025 01:39:33 -0700 (PDT)
Date: Wed, 6 Aug 2025 10:39:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix()
 fails
Message-ID: <aJMUxPWgCmsnh5dF@macbook.local>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-5-Jiqian.Chen@amd.com>
 <775a45bd-61df-4cab-948e-bdc79dfd89ef@suse.com>
 <aJMQrT8NtdDguvYN@macbook.local>
 <20990797-0523-429d-a920-a8e2ba92d18b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20990797-0523-429d-a920-a8e2ba92d18b@suse.com>

On Wed, Aug 06, 2025 at 10:30:53AM +0200, Jan Beulich wrote:
> On 06.08.2025 10:22, Roger Pau Monné wrote:
> > On Tue, Aug 05, 2025 at 10:43:09AM +0200, Jan Beulich wrote:
> >> On 05.08.2025 05:49, Jiqian Chen wrote:
> >>> --- a/xen/drivers/vpci/msix.c
> >>> +++ b/xen/drivers/vpci/msix.c
> >>> @@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
> >>>      return 0;
> >>>  }
> >>>  
> >>> +static int cf_check cleanup_msix(const struct pci_dev *pdev)
> >>> +{
> >>> +    int rc;
> >>> +    struct vpci *vpci = pdev->vpci;
> >>> +    const unsigned int msix_pos = pdev->msix_pos;
> >>> +
> >>> +    if ( !msix_pos )
> >>> +        return 0;
> >>> +
> >>> +    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
> >>> +    if ( rc )
> >>> +    {
> >>> +        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
> >>> +               pdev->domain, &pdev->sbdf, rc);
> >>> +        ASSERT_UNREACHABLE();
> >>> +        return rc;
> >>> +    }
> >>> +
> >>> +    if ( vpci->msix )
> >>> +    {
> >>> +        list_del(&vpci->msix->next);
> >>> +        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
> >>> +            if ( vpci->msix->table[i] )
> >>> +                iounmap(vpci->msix->table[i]);
> >>> +
> >>> +        XFREE(vpci->msix);
> >>> +    }
> >>> +
> >>> +    /*
> >>> +     * The driver may not traverse the capability list and think device
> >>> +     * supports MSIX by default. So here let the control register of MSIX
> >>> +     * be Read-Only is to ensure MSIX disabled.
> >>> +     */
> >>> +    rc = vpci_add_register(vpci, vpci_hw_read16, NULL,
> >>> +                           msix_control_reg(msix_pos), 2, NULL);
> >>> +    if ( rc )
> >>> +        printk(XENLOG_ERR "%pd %pp: fail to add MSIX ctrl handler rc=%d\n",
> >>> +               pdev->domain, &pdev->sbdf, rc);
> >>
> >> Here as well as for MSI: Wouldn't this better be limited to the init-failure
> >> case? No point in adding a register hook (and possibly emitting a misleading
> >> log message) when we're tearing down anyway. IOW I think the ->cleanup()
> >> hook needs a boolean parameter, unless the distinction of the two cases can
> >> be (reliably) inferred from some other property.
> > 
> > I don't think we have any signal in pci_dev itself that notices
> > whether the device is being deassigned, in which case it does need an
> > extra boolean parameter to notice whether to add the r/o handler.
> > 
> > I'm also wondering whether we want to limit this hiding to the
> > hardware domain only, and for domUs fail the operation instead, and
> > fail to assign the device.  That can be adjusted in a later patch
> > though.
> 
> Yes, DomU wants handling as you say. Iirc there are other open issues with
> DomU support, though. Hence yes, "later" ought to suffice here. Perhaps
> worth annotating with a fixme, though, to be able to easily spot all the
> places that require adjustment.

Sometimes I don't take into account that vPCI is also supposed to be
used by domUs in the long run and forget about that aspect when
reviewing patches

Roger.

