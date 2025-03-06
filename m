Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B43FA553B9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 18:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903924.1311856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqFSM-0007Oi-Hr; Thu, 06 Mar 2025 17:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903924.1311856; Thu, 06 Mar 2025 17:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqFSM-0007Mp-Ec; Thu, 06 Mar 2025 17:56:26 +0000
Received: by outflank-mailman (input) for mailman id 903924;
 Thu, 06 Mar 2025 17:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSAR=VZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tqFSK-0007Mj-Gu
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 17:56:24 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 507c0ac1-fab4-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 18:56:22 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-abf5f4e82caso191626966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 09:56:22 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac239482fa5sm129543766b.46.2025.03.06.09.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 09:56:21 -0800 (PST)
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
X-Inumbo-ID: 507c0ac1-fab4-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741283782; x=1741888582; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hjn0TMiPJKoGbfg6WXmCzq0CwuSwc0VPq0YHuaCCDTE=;
        b=BJ3doLYvltnrPaBzcW65VemaHEDwntBYVfOxfX1auA7PEzfcB/qotaUEjSt2wdvqS/
         tWDZv8cHZ+LVopGlvZ72yAwFLKPc+lAzBXNNFh/nbSHynim8pTKoZoXKOym59KzbcRXO
         TLAfOWkGUcP09/0SxGPoKh+Uq8ORbtI5NYlsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283782; x=1741888582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hjn0TMiPJKoGbfg6WXmCzq0CwuSwc0VPq0YHuaCCDTE=;
        b=VNE9BH3FgKCIWvlWVdD30TququTF5LokegUpEYsPZW25tiW5u3riTuYn01f9cprOxE
         7pQKvNhF8s37qCfm+t+CYoaqwNyrIVC6l/N+/qwiMP/WVMRI4ReDMC5LxiqdgRIlBZs+
         FtM+5csj92PGEszPPreTiK+KPP7Bg0ys2h6dFld2T/KxYKTuLaJk30d1/25yw7uRAP7E
         kvdDlyr/N4UZy3LxVal2PW/LVxllT/meSd/Z0JZH7OePS9D4fd0gfYwaqZ3OkOiOhfws
         cXQKVPUVD8iegUxzTmyTYZ6Z+VODWFQZTDOEqLyfMkOVi5UJDa0Y4M2XlVLpiDyOsjTu
         laRw==
X-Forwarded-Encrypted: i=1; AJvYcCXDcDWbOJj0BfWrwDpjSPpxeo7Fl3BpNuITFBwVRh330WSnYKwfrSJQ6TsfqbyZD2mFoeRSgvT0SDk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVZUyKOxfKSGelVYeyNoJWj6IqZQV6WSblUvQQR4RsP31gZXA2
	e4fm5ZioC9YSw7wRCNt2WqkiLjfTD2zieyi5+/tWQwA1pzA23YHK2pcDwV0iICU=
X-Gm-Gg: ASbGncuUCVPKvVykOiHpoJnO4RCgaEvOWWnClpxU/cGknKPNxKGQYQKhDKjYyuTaX+t
	/xDY5IH34eO3StZmiIFS/5eusOpplFanDeJtol+ATldDjb7Zy/XsvEDTOs06m72ETDK1z8jQ8hp
	M50scB8sFrOZ/Q4F5Egc1vo365fXBNgD3LPTpW6z2vCNEg5ghSqeYAkhm1rBeGg37wdFiyhCgrs
	p7UlIuawgo8TsAcjwjh5/oYZeq2E+XZYnhaMzPzX6qJ82Ot4DGRlhJUhoVgdAxDZ3FOy+51laqy
	l/qBrCp9wsao8mD4FdTh/LWuRs7cSh15+rGjQoFofCDZ1dVaEg==
X-Google-Smtp-Source: AGHT+IGUUVVu5IecpkpwnAryu53h92fh/xeeAriJfZ09vVYAWbwexdINdiHPUrUD2EB2Yctqd3nNcA==
X-Received: by 2002:a17:907:3f11:b0:ac1:d97e:3e4d with SMTP id a640c23a62f3a-ac20db556bemr917544066b.33.1741283781767;
        Thu, 06 Mar 2025 09:56:21 -0800 (PST)
Date: Thu, 6 Mar 2025 18:56:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/3] x86/msi: don't use cached address and data fields
 in msi_desc for dump_msi()
Message-ID: <Z8nhxJV5lS4dz0AL@macbook.local>
References: <20250306145733.99927-1-roger.pau@citrix.com>
 <20250306145733.99927-3-roger.pau@citrix.com>
 <697601b2-5592-4552-b6e0-4366a55467e8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <697601b2-5592-4552-b6e0-4366a55467e8@suse.com>

On Thu, Mar 06, 2025 at 05:45:27PM +0100, Jan Beulich wrote:
> On 06.03.2025 15:57, Roger Pau Monne wrote:
> > Instead compose a dummy MSI message just for the purpose of getting the
> > delivery attributes, which are the same for all messages.  Note that the
> > previous usage of the cached MSI message wasn't fetching the hardware MSI
> > fields either.
> 
> This feels not future proof. There's no guarantee special IRQs (HPET, IOMMU)
> would necessarily use msi_compose_msg() (or any open-coded subset thereof).

Hm, even if not using msi_compose_msg() I don't see how any device
would use a different MSI settings from physical delivery and fixed
destination.  I think it's unlikely for a device to use anything
different from the current values set by msi_compose_msg().

Otherwise I can see about returning whether the entry needs to be
updated from iommu_update_ire_from_msi() (if the offset into the IRT
for the entry has changed).  However that requires adding code to both
AMD and Intel IOMMU implementations, and will need at least a way to
signal that the MSI fields must forcefully be written on resume.

> > --- a/xen/arch/x86/msi.c
> > +++ b/xen/arch/x86/msi.c
> > @@ -1454,6 +1454,16 @@ void __init early_msi_init(void)
> >  static void cf_check dump_msi(unsigned char key)
> >  {
> >      unsigned int irq;
> > +    struct msi_msg msg = {};
> > +    uint32_t addr, data;
> > +
> > +    /*
> > +     * Compose a dummy msg message for the purpose of getting the delivery
> > +     * attributes.
> > +     */
> > +    msi_compose_msg(FIRST_DYNAMIC_VECTOR, NULL, &msg);
> > +    addr = msg.address_lo;
> > +    data = msg.data;
> >  
> >      printk("MSI information:\n");
> >  
> > @@ -1461,7 +1471,7 @@ static void cf_check dump_msi(unsigned char key)
> >      {
> >          struct irq_desc *desc = irq_to_desc(irq);
> >          const struct msi_desc *entry;
> > -        u32 addr, data, dest32;
> > +        uint32_t dest32;
> >          signed char mask;
> >          struct msi_attrib attr;
> >          unsigned long flags;
> > @@ -1495,8 +1505,6 @@ static void cf_check dump_msi(unsigned char key)
> >              break;
> >          }
> >  
> > -        data = entry->msg.data;
> > -        addr = entry->msg.address_lo;
> >          dest32 = entry->msg.dest32;
> >          attr = entry->msi_attrib;
> >          if ( entry->msi_attrib.type )
> > @@ -1512,8 +1520,7 @@ static void cf_check dump_msi(unsigned char key)
> >              mask = '?';
> >          printk(" %-6s%4u vec=%02x%7s%6s%3sassert%5s%7s"
> >                 " dest=%08x mask=%d/%c%c/%c\n",
> > -               type, irq,
> > -               (data & MSI_DATA_VECTOR_MASK) >> MSI_DATA_VECTOR_SHIFT,
> > +               type, irq, desc->arch.vector,
> 
> We've already dropped desc's lock, so shouldn't be de-referencing desc anymore.

Right, I need to cache it before dropping the lock.

> >                 data & MSI_DATA_DELIVERY_LOWPRI ? "lowest" : "fixed",
> >                 data & MSI_DATA_TRIGGER_LEVEL ? "level" : "edge",
> >                 data & MSI_DATA_LEVEL_ASSERT ? "" : "de",
> 
> To add to the comment at the top, plus taking patch 1 into account: If we
> uniformly used the output of the dummy msi_compose_msg() invocation, why would
> we even bother to log information conditionally upon what is in data/addr?

We could change what's set by msi_compose_msg(), and then the
information here would be incorrect (if hardcoded).

Thanks, Roger.

