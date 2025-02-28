Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61484A495C5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 10:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898578.1307099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnwyw-0007Pn-7B; Fri, 28 Feb 2025 09:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898578.1307099; Fri, 28 Feb 2025 09:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnwyw-0007O7-4L; Fri, 28 Feb 2025 09:48:34 +0000
Received: by outflank-mailman (input) for mailman id 898578;
 Fri, 28 Feb 2025 09:48:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zu1c=VT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnwyu-0007O1-MI
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 09:48:32 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a285499-f5b9-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 10:48:30 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2230c74c8b6so53760705ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 01:48:30 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223504dc489sm29086755ad.159.2025.02.28.01.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 01:48:28 -0800 (PST)
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
X-Inumbo-ID: 2a285499-f5b9-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740736109; x=1741340909; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OAgZG8AAq2hHBVfaKNFEB7Ws5w6D6HpKvtTC3iQAiwM=;
        b=NdAPiIr7EOFI4vWUs47TyWhNPPz70N5uqegbdSFSsmJJCkJUFOgQ7nLw13fJb7xNTc
         PAIOK/ek5YEaPyRy+w81XeutAEldMG83IXiK3LRlTrIwue15KuYTErPuz4NR5X5O5NnG
         fg2h86LnGUASARh+bgSmpEzYGn9hXr0By4ot0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740736109; x=1741340909;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OAgZG8AAq2hHBVfaKNFEB7Ws5w6D6HpKvtTC3iQAiwM=;
        b=Z74+OaiySJiLdny9WONKlZqcKgiahi4RtPqwRjfgtn1KUV1pNrbe5gfNyenxncNZMy
         BxoCtdMksW6wIhwGGMXqNFnlZx8w3f27wpnYI6prikQVDS6Ja8PZfWLIdt8Aw5T6xjkz
         c0iouiZGdJMQXzbJF61GFUu5u4o67/sKwY74kFr4oE1g8+C3dEBPykNTp1P4M2KR/IYi
         fZgZyW24HWNJ2bhB2ACAQ76YzoEils90WLtkc9LpXrIuRkU0KFHUKhbW6mFXfZbB17/4
         DCy7ARcnsXOQSsQZXiRH38F2gtIPUZBDS/10bzrcE9/mOsPUL6ofFKUr3Akqr+gBkjPk
         rTtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG91qOl4t1Ve3W5zCWbgVPSgtgHNHyTS40mQTdQGuaVslYkepyK8PvvODcFLI2+g8/lIIZL7SRssY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd+PBkxzlfd9Aue+lTQiFMTl7nfuUI/k2P72oJDiBeE42Xa8kw
	6Zgv2GdWjDGY8yQPDgt/4POwzKe+isOuOPcoofExqfWhhVssT2Tx+WUcxL4tjvo=
X-Gm-Gg: ASbGncuEnJab7Sc9vPFVRFXtUcYHEtRxpc4TCpGN0DpqEDyS4dV8AwXbGDJw5j0I2j4
	QEhoiMb4Lmi/ss9Ci/1205sgNlOiTkseKd1LxHRqkLE8PpVr8nYf1YDh4GsB7pQmXgLbnG+HQw2
	+IKGPvn//zv5EqHPBOkucQLq0eiCAA4PXj7fgqG35neqJHN9sKFuSiDgolYlmUnxmBUb/xcf8v4
	bj/KfcC9MwLW9rNAcjxPmzpCOEVGn0JsdBRLf80p2A3T/2BIZVtZp1aA7h77cN7noRUfX1KMku3
	Siqa/dlW/AEWm+H54wtycEZZN1huJ3jb1e+a
X-Google-Smtp-Source: AGHT+IE1cWaU5lQoR+w0RTvKmYr2aCRKfWTu6oy4YdkWixOGiTMLI/h0mK03wVKkqPrZ3hXeMu3CLA==
X-Received: by 2002:a17:903:3b8f:b0:220:efc8:60b1 with SMTP id d9443c01a7336-2236925851fmr39728365ad.39.1740736109053;
        Fri, 28 Feb 2025 01:48:29 -0800 (PST)
Date: Fri, 28 Feb 2025 10:48:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/hvm: Add APIC IDs to the per-vLAPIC save area
Message-ID: <Z8GGZ3p6w4hktVNh@macbook.local>
References: <20250218142259.6697-1-alejandro.vallejo@cloud.com>
 <1de43f95-5ed1-46c1-a157-094ceb84ac83@suse.com>
 <Z79Qe3kMS18P6JNQ@macbook.local>
 <D83AG7NO6F5P.YV16VNJWJ8FS@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D83AG7NO6F5P.YV16VNJWJ8FS@cloud.com>

On Thu, Feb 27, 2025 at 02:12:58PM +0000, Alejandro Vallejo wrote:
> Hi,
> 
> On Wed Feb 26, 2025 at 5:33 PM GMT, Roger Pau Monné wrote:
> > On Wed, Feb 26, 2025 at 02:11:23PM +0100, Jan Beulich wrote:
> > > On 18.02.2025 15:22, Alejandro Vallejo wrote:
> > > > @@ -1621,6 +1624,14 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> > > >          return -EINVAL;
> > > >      }
> > > >  
> > > > +    /*
> > > > +     * Xen 4.20 and earlier had no x2APIC ID in the migration stream and
> > > > +     * hard-coded "vcpu_id * 2". Default back to this if we have a
> > > > +     * zero-extended record.
> > > > +     */
> > > > +    if ( h->size <= offsetof(struct hvm_hw_lapic, x2apic_id) )
> > > > +        s->hw.x2apic_id = v->vcpu_id * 2;
> > > 
> > > While we better wouldn't get to see such input, it is in principle possible
> > > to have an input stream with, say, half the field. Imo the condition ought
> > > to be such that we'd make the adjustment when less than the full field is
> > > available.
> >
> > I would add an additional check to ensure _rsvd0 remains 0, to avoid
> > further additions from attempting to reuse that padding space.
> >
> > if ( s->hw._rsvd0 )
> >     return -EINVAL;
> 
> That's already on lapic_check_hidden(), so it's guaranteed to be zero. Unless
> you mean something else?

Oh, I've missed that - it's indeed fine.  I was missing the previous
chunk when replying here and forgot about it.

Thanks, Roger.

