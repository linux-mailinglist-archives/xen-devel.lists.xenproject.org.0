Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D866B8C9C27
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 13:37:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726039.1130301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s91JO-0005hp-2b; Mon, 20 May 2024 11:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726039.1130301; Mon, 20 May 2024 11:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s91JN-0005ex-Uj; Mon, 20 May 2024 11:36:13 +0000
Received: by outflank-mailman (input) for mailman id 726039;
 Mon, 20 May 2024 11:36:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ccuw=MX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s91JM-0005er-Hy
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 11:36:12 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27900ea0-169d-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 13:36:10 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-34e28e32ea4so1918506f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 04:36:10 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbde1sm29036195f8f.97.2024.05.20.04.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 04:36:09 -0700 (PDT)
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
X-Inumbo-ID: 27900ea0-169d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716204969; x=1716809769; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7G1UNVHntPqOsTFZ4pYMGCFJ1i/Q1Hr1oP7bRCRszRQ=;
        b=teJZy/8URf1mD4tyfdfiLpreIu7MHdnj1MihjdYsGHbcB/lh1pYHRg9agFQD7RXMx2
         HVNCHEA5HFDlJIqCpMOaZ3i9yi+1hD0/PknQ3s6LG3Pz9dcnxWv7yx0FkHtif5BWokdz
         i+SQ6zIh2rlrRJCHxcd9TmPPcjZ/JkAsnugNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716204969; x=1716809769;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7G1UNVHntPqOsTFZ4pYMGCFJ1i/Q1Hr1oP7bRCRszRQ=;
        b=dtFJ+SdMjmCaR2HJVB5MZY20CQVW1DSBc0cp9mEbGzsjGSCpudI1UZdGIcu2oJIzpd
         2CaSbmbR/lRL+3QsXwY3jk5KOuyLkI+BrM3NkRhfCC8rO8qGVnjeyISOStO0GkoX1jOP
         dSigj98/nS4UBD77G+D4ycLrL+lfSwra6Ue3s1u+1+jAQE8Vljc5/YY7boaBa5gqRYNb
         oeo1wEJfAI4lXjuR+j9LpbyQ58oSUc5SX53zSWP11R5V75ApfDe3e04HiScR/sbk1ksx
         c+l+YzlYTMlvl7QzJicf9gs/A2/6Eb/RLPIlpmH5fK9Lj9ECS7mGVnmQyjafTwSzT1nK
         Cezw==
X-Gm-Message-State: AOJu0YxQbnzaBRSfpRbO3w7jvY7UWHrjIB7BEgs5YTTBHiYcB7VluVee
	EbPOiqlrtE7p5Ko3OnKoUfwLypATTF7ucp/H14pUff3UuggBt4hNJPuQ4TW6p3y0TD2z+Nbymb2
	i
X-Google-Smtp-Source: AGHT+IH13V6X2KGF/5xDJMvod4udLcJjR1HHieaKFavy7bcm2rYnRymHLlxVM4sRJVEW0CLFT6Rcbw==
X-Received: by 2002:adf:ecc9:0:b0:352:2700:3f34 with SMTP id ffacd0b85a97d-3522700401emr7076984f8f.32.1716204969516;
        Mon, 20 May 2024 04:36:09 -0700 (PDT)
Date: Mon, 20 May 2024 13:36:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 06/12] VT-d: respect ACPI SATC's ATC_REQUIRED flag
Message-ID: <Zks1qFNsQdLkOCAs@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <e98daa41-c6b6-4f4e-b41d-84006011068d@suse.com>
 <ZjjdZRPluS0YIazc@macbook>
 <e9281523-a807-4889-80f0-a13804188af9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9281523-a807-4889-80f0-a13804188af9@suse.com>

On Wed, May 15, 2024 at 12:42:40PM +0200, Jan Beulich wrote:
> On 06.05.2024 15:38, Roger Pau Monné wrote:
> > On Thu, Feb 15, 2024 at 11:16:11AM +0100, Jan Beulich wrote:
> >> When the flag is set, permit Dom0 to control the device (no worse than
> >> what we had before and in line with other "best effort" behavior we use
> >> when it comes to Dom0),
> > 
> > I think we should somehow be able to signal dom0 that this device
> > might not operate as expected, otherwise dom0 might use it and the
> > device could silently malfunction due to ATS not being enabled.
> 
> Whatever signaling we invented, no Dom0 would be required to respect it,
> and for (perhaps quite) some time no Dom0 kernel would even exist to query
> that property.
> 
> > Otherwise we should just hide the device from dom0.
> 
> This would feel wrong to me, almost like a regression from what we had
> before.

Exposing a device to dom0 that won't be functional doesn't seem like a
very wise choice from Xen TBH.

> > I assume setting the IOMMU context entry to passthrough mode would
> > also be fine for such devices that require ATS?
> 
> I'm afraid I'm lacking the connection of the question to what is being
> done here. Can you perhaps provide some more context? To provide some
> context from my side: Using pass-through mode would be excluded when Dom0
> is PVH. Hence why I'm not getting why we would want to even just consider
> doing so.
> 
> Yet, looking at the spec, in pass-through mode translation requests are
> treated as UR. So maybe your question was towards there needing to be
> handling (whichever way) for the case where pass-through mode was
> requested for PV Dom0? The only half-way sensible thing to do in that case
> that I can think of right now would be to ignore that command line option,

Hm, maybe I'm confused, but if the IOMMU device context entry is set
in pass-through mode ATS won't be enabled and hence no translation
requests would be send from the device?

IOW, devices listed in the SATC can only mandate ATS enabled when the
IOMMU is enforcing translation.   IF the IOMMU is not enabled or if
the device is in passthrough mode then the requirement for having ATS
enabled no longer applies.

Thanks, Roger.

