Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB72E1E0FC1
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 15:47:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdDRF-00043X-Kp; Mon, 25 May 2020 13:46:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZKA=7H=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jdDRD-00043R-Re
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 13:46:43 +0000
X-Inumbo-ID: 2aa57dbc-9e8e-11ea-9887-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2aa57dbc-9e8e-11ea-9887-bc764e2007e4;
 Mon, 25 May 2020 13:46:43 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id h16so15053665eds.5
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2020 06:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cIIpcEZlk83IdO9fNWCqBgDU/dAAypxanXhjaWPR5Zc=;
 b=hXqReaxqU4aHxacq8cYSGCSDcWvaF4t4+gR+f4Irh+F1NY02JLX9HYNYvGYYThSsT9
 AfpmQriut/0ztGzpySsdu9VSyK5p/+DGz5QOagPU9MgePL3TSqMNIKbPnT7F1VqMqVks
 3g2+dBUgIfa03AfYKFou2zM9QeG7qaWvt1zqpWJg0IfH2Tl+wvDgbtgZmJblQWQQ4tfV
 0P+9D40nKSqGAqrqMqEjLF4ktMNEaxkbwzg23FF9sSRK3TOeOl4XU6fkYOPaaMWXeu+J
 3wLy9t+/sG/k412xiG/ks0MRJYmizHSfECGeoR4qBZ+VybArUr4PiPkJlzR35yiawX9C
 sLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cIIpcEZlk83IdO9fNWCqBgDU/dAAypxanXhjaWPR5Zc=;
 b=R06GrucqUEZdC5YZJnjXVjkO1MLurMZyDvCH1bwmCFm9dBf2MyzTgqEAuXFd6vrshH
 NcSTDv+9xe32b+fdT99ctQpRmucIWkgntyf08vhxG2QZ7W9c9UB2FjqS4Qow3cau5fxH
 SluelowREIBFPvC6IjtI+ymYKFVzFoMM2NSkAmmZy5Pqi705VfFSVefWi3nPBsnQdubX
 s17isQcQVoepPSIA5CcLCQoJ4yty2Ub25GkGhR8T5PMe8coCU2vde2x6FyU0TyFabzxe
 PxXkA8rtOphEETiF/LwnAtRO/VCO5sy7EYqMv+g/mfpn9x31kMc/uPCWAVpBbyovYOuW
 HsAA==
X-Gm-Message-State: AOAM530TLtuoeDafKjGj8rsZtEMAFmU6GvttZDvdeKHmr3QPXKSHX8O3
 Zn/fY5ILHsZu9yeuYGGlANxYKnVSpTk=
X-Google-Smtp-Source: ABdhPJwNSGnIdk98hq7a1+kKHw3MxkdpByxQ0Ss2wOiqgO6W6U1yt/bp+cApai5NWNzGVTBP5bP0iw==
X-Received: by 2002:aa7:d487:: with SMTP id b7mr15278016edr.351.1590414401679; 
 Mon, 25 May 2020 06:46:41 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id l1sm3291319ejd.114.2020.05.25.06.46.40
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 06:46:40 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id i15so17080856wrx.10
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2020 06:46:40 -0700 (PDT)
X-Received: by 2002:a5d:61d0:: with SMTP id q16mr792065wrv.182.1590414400100; 
 Mon, 25 May 2020 06:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
 <338c26dc-a78a-4519-11f1-1b89bd1cf4db@suse.com>
 <CABfawh=WPyW383QAe_JwRC2q8W1zHXcYntjYF-Vog34baQcrfw@mail.gmail.com>
 <e5a2899c-f375-55e8-fc6c-940b70929ae6@suse.com>
In-Reply-To: <e5a2899c-f375-55e8-fc6c-940b70929ae6@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 25 May 2020 07:46:04 -0600
X-Gmail-Original-Message-ID: <CABfawhnB4WY6U-XcigT+X=n4e8qdDMFokMWR1Sc_s-oMeyZRWg@mail.gmail.com>
Message-ID: <CABfawhnB4WY6U-XcigT+X=n4e8qdDMFokMWR1Sc_s-oMeyZRWg@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 1/2] x86/mem_sharing: block interrupt
 injection for forks
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 25, 2020 at 7:06 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 25.05.2020 14:18, Tamas K Lengyel wrote:
> > On Mon, May 25, 2020 at 12:06 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 22.05.2020 18:33, Tamas K Lengyel wrote:
> >>> When running shallow forks without device models it may be undesirable for Xen
> >>> to inject interrupts. With Windows forks we have observed the kernel going into
> >>> infinite loops when trying to process such interrupts, likely because it attempts
> >>> to interact with devices that are not responding without QEMU running. By
> >>> disabling interrupt injection the fuzzer can exercise the target code without
> >>> interference.
> >>>
> >>> Forks & memory sharing are only available on Intel CPUs so this only applies
> >>> to vmx.
> >>
> >> Looking at e.g. mem_sharing_control() I can't seem to be able to confirm
> >> this. Would you mind pointing me at where this restriction is coming from?
> >
> > Both mem_access and mem_sharing are only implemented for EPT:
> > http://xenbits.xen.org/hg/xen-unstable.hg/file/5eadf9363c25/xen/arch/x86/mm/p2m-ept.c#l126.
>
> p2m-pt.c:p2m_type_to_flags() has a similar case label.

It doesn't do anything though, does it? For mem_sharing to work you
actively have to restrict the memory permissions on the shared entries
to be read/execute only. That's only done for EPT.

> And I can't
> spot a respective restriction in mem_sharing_memop(), i.e. it looks
> to me as if enabling mem-sharing on NPT (to satisfy hap_enabled()
> in mem_sharing_control()) would be possible.

If you are looking for an explicit gate like that, then you are right,
there isn't one. You can ask the original authors of this subsystem
why that is. If you feel like adding an extra gate, I wouldn't object.

Tamas

