Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D24B803619
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647006.1009684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA9fJ-00018N-4x; Mon, 04 Dec 2023 14:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647006.1009684; Mon, 04 Dec 2023 14:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA9fJ-00016E-2D; Mon, 04 Dec 2023 14:11:17 +0000
Received: by outflank-mailman (input) for mailman id 647006;
 Mon, 04 Dec 2023 14:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rA9fH-0000Xk-Nk
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:11:15 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbbdda18-92ae-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 15:11:14 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50bce78f145so5331245e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 06:11:14 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d500e000000b0033335644478sm7694127wrt.114.2023.12.04.06.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:11:12 -0800 (PST)
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
X-Inumbo-ID: fbbdda18-92ae-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701699073; x=1702303873; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OV7JDXsw4T8t6RmiQ2mrWIVppwMRgt2M9rFfBsbnIao=;
        b=LlLKik4ew1x1nVJIgj5HL0owDhS7oM2cX/6owbVK8ccOIylIt+H+uM9TV///UMSb7Z
         4vg88Jjsg4xJYWc5/m4zoYptycgUzEjrWDeHWzT3OnD7OeQ766XykUwzAIFg0v5O/p1D
         t6MXRV2U/00m16kDvHgZMmEQXm+ai0KFq62Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699073; x=1702303873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OV7JDXsw4T8t6RmiQ2mrWIVppwMRgt2M9rFfBsbnIao=;
        b=XSLmfSoEZsKIoqQdczg2JQQ+w4oVFXghBK6O1xc7WxQ68arBhpKuyXEQqqCK3Ppl55
         BTxGtxh6PS6j0SlJcVav2U0vnaQCmAQVQNiPcuA03oofesrsPTrD6qFLcfEHIPk3yitq
         hTL5wf38PrKKlid3cPWL70VtbWiqtwkbHmRXgTh5GHFaQeaycjPme6yaiPuOaNzSZY59
         9CSr35gwe/4ZBGI+a3D3JtZ/D3fjaIbL74c3bF+McSf7iEn17DjkYwDKDGHoqsJIsAcn
         8LMGdqwiGq0byOedoeVlxsmOnXF/qlj5XN2bW2BEZSD7jspokSgVvisa4kuOWFRpacyg
         qeXA==
X-Gm-Message-State: AOJu0Yydc5Sw+cv6Vz98aGhPWBOgG2KS/ZQ1A3Myo+9d3W74hSoEha5U
	yBgfXulTMAZFh6oOddH+9ZrwgQ==
X-Google-Smtp-Source: AGHT+IF0q1cly9Art+8S9DGcTEcPuKXcoR2SQtOxNOBqDExm6XcLofIKGSlFfHU//Qb2BjxSMgDIyA==
X-Received: by 2002:a05:6512:1113:b0:50b:fbdf:de7d with SMTP id l19-20020a056512111300b0050bfbdfde7dmr348169lfg.154.1701699073580;
        Mon, 04 Dec 2023 06:11:13 -0800 (PST)
Date: Mon, 4 Dec 2023 15:11:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/2] xen/vpci: header: filter PCI capabilities
Message-ID: <ZW3eAAb9TvSIup8J@macbook>
References: <20231201154552.3066321-1-stewart.hildebrand@amd.com>
 <20231201154552.3066321-3-stewart.hildebrand@amd.com>
 <11674268-4da3-4f20-909c-43b94bdfad2e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <11674268-4da3-4f20-909c-43b94bdfad2e@suse.com>

On Mon, Dec 04, 2023 at 12:48:00PM +0100, Jan Beulich wrote:
> On 01.12.2023 16:45, Stewart Hildebrand wrote:
> > --- a/xen/drivers/pci/pci.c
> > +++ b/xen/drivers/pci/pci.c
> > @@ -39,31 +39,42 @@ unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
> >      return 0;
> >  }
> >  
> > -unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
> > -                               unsigned int cap)
> > +unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
> > +                                   const unsigned int *cap, unsigned int n,
> 
> Imo this would better be written as cap[] (or even caps[]).
> 
> > @@ -545,6 +546,68 @@ static int cf_check init_bars(struct pci_dev *pdev)
> >      if ( rc )
> >          return rc;
> >  
> > +    if ( !is_hardware_domain(pdev->domain) )
> > +    {
> > +        if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
> > +        {
> > +            /* Only expose capabilities to the guest that vPCI can handle. */
> > +            unsigned int next, ttl = 48;
> > +            const unsigned int supported_caps[] = {
> > +                PCI_CAP_ID_MSI,
> > +                PCI_CAP_ID_MSIX,
> > +            };
> 
> static?
> 
> With the two adjustments
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

FTAOD: please also keep my RB when doing those adjustments.

Thanks, Roger.

