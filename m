Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA088143D6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 09:40:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654963.1022553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE3k1-00069T-Vk; Fri, 15 Dec 2023 08:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654963.1022553; Fri, 15 Dec 2023 08:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE3k1-00066k-SJ; Fri, 15 Dec 2023 08:40:17 +0000
Received: by outflank-mailman (input) for mailman id 654963;
 Fri, 15 Dec 2023 08:40:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE3jz-00065P-PP
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 08:40:15 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90a31167-9b25-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 09:40:13 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c9f62fca3bso4617911fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 00:40:13 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b0040b45282f88sm30187277wmq.36.2023.12.15.00.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 00:40:13 -0800 (PST)
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
X-Inumbo-ID: 90a31167-9b25-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702629613; x=1703234413; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sCGv2FyzgS5cO4MfOiZidV8ZPybRPrnmFB74OpjXZ2w=;
        b=ZGOipomm3VsdchgN6qxTijqFw7duwpKunm+3MVVL1z8ShdzxDP9jXtHa3C4axEU1CH
         5obIfSBGey4P1XqcfEZiWG1X8TPUvRV9tBD4FWbeDif9bH7V/3xFjKO/7nVxLw0HB2AQ
         9ps7BTSeEx2JmqrsMtjdfqflLLKcNVyalyxkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702629613; x=1703234413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sCGv2FyzgS5cO4MfOiZidV8ZPybRPrnmFB74OpjXZ2w=;
        b=O8uaJtl0P55/FcTYCkpuZdXkyiVigxDB7kMT35ftU5TFs3qdNBsu4ZdK96AT6HGK+H
         x52UKXHABIp08ZUBnIG+FmhYdN+h08ssYrjCYBVX9AeGMqBD2K6l34sDU8SUymuwetYU
         DSYdC9DETpCPwKqM0KlVzoNh+X/peF0FKoxe3ANjHWTKMoFKZmNbTEj+fXSzphLEhGfr
         Y3lFhIHNiQfZHSlW9d2zAWaDTox+jUdVbmSPp7tFbcB5/qTjrjQlaVIJUM4/mRbU5klQ
         GiognlbZAdjpfJd1iJEAKcnDweVvOJ/Y5VP0VzrNWD3zmltNNS7Qkt5pr+qHJ5rxhSl7
         8iug==
X-Gm-Message-State: AOJu0YxXtLSDzbij2Oa2gmNbcBHgwHchvDIpSbAVmrapOLO5I+TJDZ4d
	2xxLyeBK/jYRRYX2Kg61G2i2lw==
X-Google-Smtp-Source: AGHT+IGTwt2Z5UE97wULKluUuImQQDtjAJ06rZnYVD7EaKhE3xolmMOurU0XZQrShboOcnikHjFO/A==
X-Received: by 2002:a2e:b74c:0:b0:2cc:301e:8134 with SMTP id k12-20020a2eb74c000000b002cc301e8134mr2711996ljo.102.1702629613337;
        Fri, 15 Dec 2023 00:40:13 -0800 (PST)
Date: Fri, 15 Dec 2023 09:40:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Message-ID: <ZXwQ7BF9AxZPYPXQ@macbook>
References: <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
 <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXrRG8oc25Do0Dnv@macbook>
 <390368e2-5f13-4bbf-8c07-4a05c04e9939@suse.com>
 <ZXrTwfzedFQLhxiQ@macbook>
 <alpine.DEB.2.22.394.2312141441020.3175268@ubuntu-linux-20-04-desktop>
 <6ba1feda-275a-43f1-911e-8a8596e100ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ba1feda-275a-43f1-911e-8a8596e100ff@suse.com>

On Fri, Dec 15, 2023 at 09:24:22AM +0100, Jan Beulich wrote:
> On 14.12.2023 23:49, Stefano Stabellini wrote:
> > On Thu, 14 Dec 2023, Roger Pau Monné wrote:
> >> On Thu, Dec 14, 2023 at 10:58:24AM +0100, Jan Beulich wrote:
> >>> On 14.12.2023 10:55, Roger Pau Monné wrote:
> >>>> One way to bodge this would be to detect whether the caller of
> >>>> XEN_DOMCTL_irq_permission is a PV or an HVM domain, and in case of HVM
> >>>> assume the pirq field is a GSI.  I'm unsure however how that will work
> >>>> with non-x86 architectures.
> > 
> > PIRQ is an x86-only concept. We have event channels but no PIRQs on ARM.
> > I expect RISC-V will be the same.
> > 
> > 
> >>>> It would  be better to introduce a new XEN_DOMCTL_gsi_permission, or
> > 
> > "GSI" is another x86-only concept.
> 
> Just to mention it - going through the ACPI spec, this looks to be an
> arch-neutral ACPI term. It is also used in places which to me look
> pretty Arm-centric.

Oh, indeed, they have retrofitted GSI(V?) for Arm also, as a way to have a
"flat" uniform interrupt space.  So I guess Arm would also need the
GSI type, unless the translation from GSI to SPI or whatever platform
interrupt type is done by the guest and Xen is completely agnostic to
GSIs (if that's even possible).

Thanks, Roger.

