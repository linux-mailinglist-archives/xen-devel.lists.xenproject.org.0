Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20EA805849
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648005.1011873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAX4q-0008Jy-3F; Tue, 05 Dec 2023 15:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648005.1011873; Tue, 05 Dec 2023 15:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAX4q-0008HI-03; Tue, 05 Dec 2023 15:11:12 +0000
Received: by outflank-mailman (input) for mailman id 648005;
 Tue, 05 Dec 2023 15:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAX4o-0008Ft-SD
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:11:10 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 852b1775-9380-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 16:11:09 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c09d0b045so29652965e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:11:09 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c155200b004094d4292aesm19072382wmg.18.2023.12.05.07.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 07:11:08 -0800 (PST)
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
X-Inumbo-ID: 852b1775-9380-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701789069; x=1702393869; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lZkw4TD3P9ymEBLOGazy99l9ZiAtxd57Bn0tL7xPlbk=;
        b=CUFZu+2X/8LQLoN5NH7N7PqtLPH3CtNAWRk6Mgzu/0MNQbi2autZX19q+pmh/CTY+D
         faPgfAzeNdesBiak/gpvYp2GFqx6q9TYuu6Huucah/duZHyVX8IG+H2QFUGAZnZl5I1H
         65xL0dWslvMIj7YeF7N4BxjdM7pCfs6ISob8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701789069; x=1702393869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZkw4TD3P9ymEBLOGazy99l9ZiAtxd57Bn0tL7xPlbk=;
        b=eKvNIj0H3YsYNRgqphsivmbWuVGIcOrZeJeCqDY09FPfoYbCVdokOFk4DK32ZZMutU
         12eWePu0OMGxx9RmzhrFX5uOhKnFl6Sgh8EpFjcAGsfPEphqTL71jplp+Jc4wTlPDni1
         ZKl7Y9Kz0TNfSvvcg5/hoYlIiMnq2jRGL/61aS1xCIv4RceGJ4AMJeBagK6QNik+Iqs2
         GlGK6qh5Fy5wUvROiXwg9R2wPrR70M080Ld7CxMylDiKq4SJ03ejq0txCy3+giuc0C+7
         eLNy/PeGGBlRyRQtjWW5LAArGyszweQqCYorLa92ge4YEuaJ30GDSVinw9iGJB18e8+F
         PmUA==
X-Gm-Message-State: AOJu0YzwzU9fJP9gNCqPm/uw0hTDns/SgtQYw7wl3oJVqE0D4Q5jU1UP
	JrPQWkv6XUFdKkwrpWzF170rrQ==
X-Google-Smtp-Source: AGHT+IFvFxaUT+s1wyyDErZpNPKqY9ZIdVrtCiGc1HihcuUQ3HiJHtAVurJyvzg1h7uHGaFqnD/osg==
X-Received: by 2002:a05:600c:3541:b0:40b:5e1e:fb94 with SMTP id i1-20020a05600c354100b0040b5e1efb94mr417849wmq.73.1701789069032;
        Tue, 05 Dec 2023 07:11:09 -0800 (PST)
Date: Tue, 5 Dec 2023 16:11:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/6] amd-vi: set IOMMU page table levels based on
 guest reported paddr width
Message-ID: <ZW89jMz1yaD4qLN9@macbook>
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-3-roger.pau@citrix.com>
 <17de355f-623f-4310-ac55-df028235c240@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <17de355f-623f-4310-ac55-df028235c240@suse.com>

On Tue, Dec 05, 2023 at 03:32:20PM +0100, Jan Beulich wrote:
> On 04.12.2023 10:43, Roger Pau Monne wrote:
> > --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> > +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> > @@ -359,21 +359,17 @@ int __read_mostly amd_iommu_min_paging_mode = 1;
> >  static int cf_check amd_iommu_domain_init(struct domain *d)
> >  {
> >      struct domain_iommu *hd = dom_iommu(d);
> > +    int pglvl = amd_iommu_get_paging_mode(
> > +                PFN_DOWN(1UL << paging_max_paddr_bits(d)));
> 
> This is a function in the paging subsystem, i.e. generally inapplicable
> to system domains (specifically DomIO). If this is to remain this way,
> the function would imo need to gain a warning. Yet better would imo be
> if the function was avoided for system domains.

I have to admit I'm confused, won't systems domains return
paging_mode_hap(d) == false, and thus fallback to using paddr_bits
(host paddr width?).

I can avoid such domains calling into paging_max_paddr_bits() but it
seems redundant, and would just be duplicated logic for a case that
paging_max_paddr_bits() already handles correctly AFAICT.

Would it be better for me to rename paging_max_paddr_bits() to
domain_max_paddr_bits() and move it to asm/domain.h?

Thanks, Roger.

