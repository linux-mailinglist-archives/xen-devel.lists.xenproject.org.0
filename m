Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF56D9BF0E9
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 15:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831185.1246375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hT6-0003KD-FH; Wed, 06 Nov 2024 14:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831185.1246375; Wed, 06 Nov 2024 14:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hT6-0003H3-C9; Wed, 06 Nov 2024 14:57:12 +0000
Received: by outflank-mailman (input) for mailman id 831185;
 Wed, 06 Nov 2024 14:57:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlMZ=SB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8hT5-0003Gv-LX
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 14:57:11 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 654363d0-9c4f-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 15:57:08 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a99e3b3a411so174863166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 06:57:08 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16d4d6bsm288757966b.44.2024.11.06.06.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 06:57:07 -0800 (PST)
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
X-Inumbo-ID: 654363d0-9c4f-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY1NDM2M2QwLTljNGYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTA1MDI4Ljg2NDk2LCJzZW5kZXIiOiJyb2dlci5wYXVAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730905028; x=1731509828; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tg5fNpdufbLioTRL7mwtxuR06iGyLbq0m33VqiHthWA=;
        b=FAtn+K14dJVE4VKJ8nK29Yi6IldJfILoXvlL2YbTgQvUIN0n5c4AtmnaukJ3y8hPIe
         Gk/7BINXRpmikgikM2WUAPAH/434s2u+ys+sh7xDmCAOn9dK/6OinG+/RL8mQEEuigCJ
         uKDDYJ9mcHNW+LQX7GjMMiTFLvMe53iL2j3IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730905028; x=1731509828;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tg5fNpdufbLioTRL7mwtxuR06iGyLbq0m33VqiHthWA=;
        b=eVduqshyUAjWNf+PzHmFZeAyuPObQbOV6njTPku4L16xFZs5HAN7yNLS32AWvvgz5Q
         oIbUgFbK4JQXTdK5bMi8FUFiWbgA9mep9/u5K+Apvlp38NJHX0tbasKYi/p2vJwQfZUY
         9JRwk64iTObttxM9G6tbfptdRLKBYmefWKbE+rpOTFKVjWI4tvVHXM5EHu3DE9dYBayI
         MToiy6f+CsBiPTS0TqP13J9sYkPAURDe3chn3tFO4XI/RPZRZjP9lfJAbuQQ257yiNCS
         FOKm+eDuIyKFANRWnE3OItCWkwG7K6bHmzy7tqMgTAWccGPmobIG6ab5tOdZ3LyDm2mj
         G+FA==
X-Forwarded-Encrypted: i=1; AJvYcCXLABks2+SXmjct+FcylstG9fapIiUNwXSn+0tjb98Cy7SkPgS2VOK6wenw7RZcv0Ag1K3UWk91xKU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfqotH1aWtdgLLne6T+epJy59Jicn/BN5wMhBDf++k0qCGQqce
	Mg35x47ianW3tRlo4WC5+G+Vb++E4db+28GAEy/trW9t/GHd/+Yd/Ix0ZyFE2Z6u0QQcvh1RmWL
	Y
X-Google-Smtp-Source: AGHT+IHgz1AnhI9xEvc3uOOLKDRKg7ZOmdeE67VuCsqIdCT08Ev8GMeLeEdACBk1wOnBPk52rDUgnw==
X-Received: by 2002:a17:907:da3:b0:a9a:f19:8c2a with SMTP id a640c23a62f3a-a9ec65b3a66mr318185266b.6.1730905028159;
        Wed, 06 Nov 2024 06:57:08 -0800 (PST)
Date: Wed, 6 Nov 2024 15:57:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen/vpci: Fix UB in mask_write
Message-ID: <ZyuDwnYj5-uCWrMy@macbook>
References: <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
 <ZyswF4grJSNcVqY_@macbook>
 <Zysx4ZwCUv62uTBw@macbook>
 <6d3f322f-7047-4033-95b5-86751a58cc70@suse.com>
 <65d2043f-5e6f-4d84-8241-eb28dd94fc45@epam.com>
 <ZytkOP_7nmeSVEYH@macbook>
 <7c57371b-803a-418b-97cb-55e79516eed4@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c57371b-803a-418b-97cb-55e79516eed4@epam.com>

On Wed, Nov 06, 2024 at 02:32:13PM +0000, Mykyta Poturai wrote:
> On 06.11.24 14:42, Roger Pau Monné wrote:
> > On Wed, Nov 06, 2024 at 12:26:55PM +0000, Mykyta Poturai wrote:
> >> On 06.11.2024 10:07, Roger Pau Monné wrote:
> >>> Wait - how can msi->vectors ever be 0?  AFAICT there's no way in the
> >>> MSI logic to configure 0 vectors, there will always be at least 1 vector
> >>> enabled.
> >>>
> >>> Maybe what you want, if this fix is for compliance reasons, is an
> >>> assert unreachable that msi->vectors > 0?
> >>
> >> I did some investigation and figured out that the value of 0 is being
> >> set by guest writing to msi_control_reg. As far as I understand, the
> >> control_write() function only checks that vectors are not greater than
> >> the maximum allowed value, but does not check for 0.
> > 
> > control_write() will set vectors to (1UL << val), so even if user
> > provides val == 0, vectors will be 1.
> > 
> > Can you provide an example input value of control_write() that will
> > lead to msi->vectors == 0?
> > 
> > Is maybe msi_maxvec not set correctly in your use case if you indeed
> > see vectors == 0?
> > 
> > Thanks, Roger.
> 
> Indeed, I have checked and msi_maxvec is set to 0. Thanks for pointing
> this out. I will investigate further why this is happening. It is quite
> strange that it somehow worked on 4.18 with the same problem.

Check whether pdev_msi_init() is called during device addition, as
that's what initializes msi_maxvec.  Another cause could be memory
corruption.

> I will change the check to an assert then, so if something similar
> happens again it can be caught earlier.

Let's try to figure out what causes msi_maxvec to be 0 in your case
and then we can see how to better detect this.  If msi_maxvec needs to
be checked it should likely be done in init_msi().

Regards, Roger.

