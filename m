Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7467C1B4539
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 14:33:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jREYO-00074d-Ol; Wed, 22 Apr 2020 12:32:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mXoo=6G=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jREYN-00074Y-4d
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 12:32:35 +0000
X-Inumbo-ID: 577bd894-8495-11ea-83d8-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 577bd894-8495-11ea-83d8-bc764e2007e4;
 Wed, 22 Apr 2020 12:32:34 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id t12so1348305edw.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2020 05:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mBPOSEUY1oXRJqJRPsCtY53O3+dkrXrAH33/WuR+SJ4=;
 b=WUaCAyWhoC8B3P15XdCYUIp3BSoXcMhe1KLfAm658VjRI/l9Nkll5UK7Q9dfnauRsD
 CJRIMAhVcYvuUYGY/jXFX6XqLAFiqaQDGjCnWduxfr2zQXvefMIkyV1ZEd7jBTZ9KWcN
 txKXMUjCR7SKYJwnPfct+0HUeAE4fHLUQrM8MFPGKF3N26nMWH89ZHuhKwf0/FVrUnSs
 2RDgXDllmTrAAUTiwj6wMjWPKbJx4IYz+wEgMzA0P/Wy1lnbNt6+qbD77v7OySNqbXWz
 bL/cJdGsqwi0HPXUFYZe0ZNIpdzCwK/BvLMQxeQ76w1UBcRG6ccBixLaeHeYtHCAovJt
 LJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mBPOSEUY1oXRJqJRPsCtY53O3+dkrXrAH33/WuR+SJ4=;
 b=K8aH95OOplWImZ4oFgYlBJESHFJn8ejHIOZ08MJZgGp8SbGhEUQPTHbezVxP7CVaTP
 lFghk2cdT+44GKonqKOghZCdSzyiPEbjGKpjos/6Rf0ZSsMBlJcDXQB0sAFEOIAu9cWX
 9PoYvGPUe87CLPPSlTrLDVD1JXIv85U/tuXkVoy0HUJr3qluR84stVSvLCiGvDaZ9k5a
 tyJ8BwWWbqoCXErIImBENVgQQJvAmbrA1t283C8zTL32c0RCm3nDB4LIjNFK45s5O/pf
 eFdmGf1kDG5/7yXiQKCUYqTMoFHSI6V1t5D1KpcX86kSWidk+Idf7leURUaVkVqa55Fz
 bk+Q==
X-Gm-Message-State: AGi0PuaUpILaDEP/op48jU1+d3zz3ojM8B4DnOryON0YlAVJ0mTDFgFK
 NAK7N/kdHp0G8QwVQdUHQ630WcqhUAg=
X-Google-Smtp-Source: APiQypKMoNk8wby8t5D2DGWdWvB4gh3KhMZgAftfJttwN+y0FYahYK5tl+LElutF0DvVuYhIfX6BXg==
X-Received: by 2002:a50:f058:: with SMTP id u24mr21845199edl.171.1587558753287; 
 Wed, 22 Apr 2020 05:32:33 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41])
 by smtp.gmail.com with ESMTPSA id hh1sm929567ejb.46.2020.04.22.05.32.31
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 05:32:32 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id v4so4837307wme.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2020 05:32:31 -0700 (PDT)
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr10496624wmf.77.1587558751325; 
 Wed, 22 Apr 2020 05:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587490511.git.tamas.lengyel@intel.com>
 <c958f3776e602143efb2fb7c146a0c18a3fcd262.1587490511.git.tamas.lengyel@intel.com>
 <20200422090911.GC28601@Air-de-Roger>
In-Reply-To: <20200422090911.GC28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 22 Apr 2020 06:31:54 -0600
X-Gmail-Original-Message-ID: <CABfawhnxTBcV4oZpWubYYfPaYG8-3bG-GbgC11mxFrSmRfAuEA@mail.gmail.com>
Message-ID: <CABfawhnxTBcV4oZpWubYYfPaYG8-3bG-GbgC11mxFrSmRfAuEA@mail.gmail.com>
Subject: Re: [PATCH v16 2/3] mem_sharing: allow forking domain with IOMMU
 enabled
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 22, 2020 at 3:09 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Tue, Apr 21, 2020 at 10:47:24AM -0700, Tamas K Lengyel wrote:
> > The memory sharing subsystem by default doesn't allow a domain to share=
 memory
> > if it has an IOMMU active for obvious security reasons. However, when f=
uzzing a
> > VM fork, the same security restrictions don't necessarily apply. While =
it makes
> > no sense to try to create a full fork of a VM that has an IOMMU attache=
d as only
> > one domain can own the pass-through device at a time, creating a shallo=
w fork
> > without a device model is still very useful for fuzzing kernel-mode dri=
vers.
> >
> > By allowing the parent VM to initialize the kernel-mode driver with a r=
eal
> > device that's pass-through, the driver can enter into a state more suit=
able for
> > fuzzing. Some of these initialization steps are quite complex and are e=
asier to
> > perform when a real device is present. After the initialization, shallo=
w forks
> > can be utilized for fuzzing code-segments in the device driver that don=
't
> > directly interact with the device.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks! This can be merged independent of the other patches in the series.

Tamas

