Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691EA9C0141
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 10:36:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831562.1246884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ywB-00076k-PX; Thu, 07 Nov 2024 09:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831562.1246884; Thu, 07 Nov 2024 09:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ywB-00074Z-MB; Thu, 07 Nov 2024 09:36:23 +0000
Received: by outflank-mailman (input) for mailman id 831562;
 Thu, 07 Nov 2024 09:36:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8ywA-00074T-CO
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 09:36:22 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcc7723c-9ceb-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 10:36:17 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5cedf5fe237so876906a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 01:36:17 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b7f0eesm589363a12.31.2024.11.07.01.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 01:36:16 -0800 (PST)
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
X-Inumbo-ID: bcc7723c-9ceb-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmEiLCJoZWxvIjoibWFpbC1lZDEteDUyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJjYzc3MjNjLTljZWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTcyMTc3LjE4Njk4OSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730972176; x=1731576976; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IL2yLEbWrQ6V2Lj7RiGk6bI3gNn4wSAKk94B1WfCVAg=;
        b=fk+Bw2o2GzlsSHtDey0gDCyKgV7lLt4XuvvOsA0y2mwFO5d9OGOp7Gu6fDPUa09DSX
         s27+gDaFGT37TG8WhqYt3fHF4CcnZDY+PNOqoKCvI7Ly/tTRsV82BACSHYNzQmk1LPlp
         WH6DEST4v/ND8ULmUp0OEZgR3eXAd8G9+gAfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730972176; x=1731576976;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IL2yLEbWrQ6V2Lj7RiGk6bI3gNn4wSAKk94B1WfCVAg=;
        b=oN0GvHM14heTmCNv7yTpDIYhVl0ap5DXyyu8UwKkmt+Ek9W4dbfnnRVGPDK0tzFjeO
         ChJO3DEXuZ+yiNwwDFJcTjugnxYoH0lkTrH0vYTjPTBNGEtELpsOIuVqlHb5jkcnPahY
         af2L05ULkAHgkDbYg1XAIrvuqM5K5shS9/XzLKckDN311GL5vBAXD/O6ruh67IUbJI0h
         naPL0ZKr+jbmi5TFmHxATJj36ucPB74lo1WFjqWjfIvyElhUzCoSHJKRA++ZIYzbXkyp
         QXgHdq+dN4hzgQCY+cyNkvpV7Lmk/j4hs2qZowBMF2acwvhNwxGFFnJiIItbIQNBzjQG
         R5zw==
X-Forwarded-Encrypted: i=1; AJvYcCVHUwhImDO/ty8iX3Gq5vkye5ZFonhRgrfMTN2KwEaT3hQMKxfGmxSIxtQI69padPxJv0yQADYRx6Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4UoHVsLXshIgRI4yMqOv93obrNzlEbJJ2wdm/fFmnvKqVjqqs
	+Ih4s8FuOv0I6ertUUNh+kei2IbgGwp6YxgSb9brB6iP3ci29ncYL8wOPi/67+/F3tCfRo/l5oM
	N
X-Google-Smtp-Source: AGHT+IGmwnQC6C2ckIm4fAaiXGdaI2B5+Rf/dya63Xa5NPQYfWomX2Co0YCbHp69nrKlFqI82DlfOA==
X-Received: by 2002:a05:6402:518b:b0:5ce:fa47:2597 with SMTP id 4fb4d7f45d1cf-5cefa472620mr2865985a12.9.1730972176540;
        Thu, 07 Nov 2024 01:36:16 -0800 (PST)
Date: Thu, 7 Nov 2024 10:36:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykyta Poturai <Mykyta_Poturai@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen/vpci: Fix UB in mask_write
Message-ID: <ZyyKD2knurwS4cMi@macbook>
References: <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
 <ZyswF4grJSNcVqY_@macbook>
 <Zysx4ZwCUv62uTBw@macbook>
 <6d3f322f-7047-4033-95b5-86751a58cc70@suse.com>
 <65d2043f-5e6f-4d84-8241-eb28dd94fc45@epam.com>
 <f731b7a3-9581-4acc-85d2-2b3decd35fae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f731b7a3-9581-4acc-85d2-2b3decd35fae@suse.com>

On Thu, Nov 07, 2024 at 10:25:02AM +0100, Jan Beulich wrote:
> On 06.11.2024 13:26, Mykyta Poturai wrote:
> > On 06.11.2024 10:07, Roger Pau Monné wrote:>
> >> Wait - how can msi->vectors ever be 0?  AFAICT there's no way in the
> >> MSI logic to configure 0 vectors, there will always be at least 1 vector
> >> enabled.
> >>
> >> Maybe what you want, if this fix is for compliance reasons, is an
> >> assert unreachable that msi->vectors > 0?
> > 
> > I did some investigation and figured out that the value of 0 is being
> > set by guest writing to msi_control_reg. As far as I understand, the
> > control_write() function only checks that vectors are not greater than
> > the maximum allowed value, but does not check for 0.
> 
> How that? How could it even check for 0, when 0 isn't possible? Quoting
> the code there:
> 
>     unsigned int vectors = min_t(uint8_t,
>                                  1u << MASK_EXTR(val, PCI_MSI_FLAGS_QSIZE),
>                                  pdev->msi_maxvec);
> 
> "val" in the guest written value. As that's used as a shift count, how
> could 0 result there? The only way I can see 0 ending up in vectors is
> when pdev->msi_maxvec was still zero. Yet that's then a bug in device
> initialization.

See followup emails, I've arrived at the same conclusion and Mykyta
confirmed it's msi_maxvec that's indeed 0.  Still waiting for them to
figure out why msi_maxvec is 0.

Thanks, Roger.

