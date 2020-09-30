Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960F227F171
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 20:38:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.890.3083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNgyz-00025F-2Z; Wed, 30 Sep 2020 18:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890.3083; Wed, 30 Sep 2020 18:37:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNgyy-00024q-VN; Wed, 30 Sep 2020 18:37:40 +0000
Received: by outflank-mailman (input) for mailman id 890;
 Wed, 30 Sep 2020 18:37:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qtLl=DH=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1kNgyw-00024l-JQ
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 18:37:39 +0000
Received: from mail-ot1-x332.google.com (unknown [2607:f8b0:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4002b70-e1c2-4bf4-8eea-752d09c4b43c;
 Wed, 30 Sep 2020 18:37:36 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id q21so2813030ota.8
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 11:37:36 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qtLl=DH=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
	id 1kNgyw-00024l-JQ
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 18:37:39 +0000
X-Inumbo-ID: f4002b70-e1c2-4bf4-8eea-752d09c4b43c
Received: from mail-ot1-x332.google.com (unknown [2607:f8b0:4864:20::332])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f4002b70-e1c2-4bf4-8eea-752d09c4b43c;
	Wed, 30 Sep 2020 18:37:36 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id q21so2813030ota.8
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 11:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GZokKNgMejCKfo0F2vRKE9nImzYNSzp/HUH90Pr6PJU=;
        b=Iz7k38YFYItPAO2RtiflnlRb5+BDWfPx9FQCvvU2f8SdCl7V1y7fJW6E60irWiBOlQ
         fH9GEK1n0pwT4bpaxG/cqFn7l9Zse+u3/d1Pt4ggVZd6tM3YSzezV3iBWBtU9IY/SgXQ
         GGeYqXdFFnSWXcgBytqYXCxu9xUWTpvQgSvlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GZokKNgMejCKfo0F2vRKE9nImzYNSzp/HUH90Pr6PJU=;
        b=Fczg8jU+eCYxR71xoQrfOrqLoMxemLBrOd8pw+s5z8PFMbMXeVAvgoZZOLeeW3zHo7
         CHRPeTNuS2njduhCgxnvyctTUgxb2OxmZlQJ33RqLsm9hv5x/kQ/BbuBd8AqwvxY223j
         ycfo/VjCfIJc8k/vEnN1R6uLSGM9iHGpM1MBw6ZSyXatrBt/2lkWhYyNCrXxSy8Pv+27
         CxJwFi3h1S5tLXOLK0tiMgDnhBCDxsaFvZ+co4gfow7n3xtdJseiSgFp0MkumaGZYjP0
         YgNk0EbezJYZw0yw9+fZKNMubbdu/hS//x+tEPKyANK7JXl34J7eB2xWG7RXPSs7GlDg
         sHEg==
X-Gm-Message-State: AOAM531wJfp5/HHYyCjU8sY2HIPqMKe2alMaMoI8Ir1JfKOQ6xVSFvTI
	KBjUwLW5vaBOxVWoimFYk0tmxVgO5uV5poyAGXatJg==
X-Google-Smtp-Source: ABdhPJzmG8KuipdmIEStVjCt4k/yD8YpcM6mVrZ29T55c3684BNdLJdgOsz6wDtmq5u1TIJFW1qJF02gBOu8zFVEiX4=
X-Received: by 2002:a05:6830:14d9:: with SMTP id t25mr2508122otq.188.1601491055725;
 Wed, 30 Sep 2020 11:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200924135853.875294-1-hch@lst.de> <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org>
 <20200926062959.GA3427@lst.de> <160128801808.6464.1013594053120198786@jlahtine-mobl.ger.corp.intel.com>
 <20200928123741.GA4999@lst.de> <160138340987.15771.13645983702040612672@jlahtine-mobl.ger.corp.intel.com>
 <20200930144839.GA897@lst.de>
In-Reply-To: <20200930144839.GA897@lst.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Sep 2020 20:37:24 +0200
Message-ID: <CAKMK7uE98o-ELvPZ0YVWjrVWgESVEEz5OSexA_qU64qemihyRg@mail.gmail.com>
Subject: Re: remove alloc_vm_area v2
To: Christoph Hellwig <hch@lst.de>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@linux.ie>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, 
	Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Minchan Kim <minchan@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Nitin Gupta <ngupta@vflare.org>, X86 ML <x86@kernel.org>, 
	"moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 30, 2020 at 4:48 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Sep 29, 2020 at 03:43:30PM +0300, Joonas Lahtinen wrote:
> > Hmm, those are both committed after our last -next pull request, so they
> > would normally only target next merge window. drm-next closes the merge
> > window around -rc5 already.
> >
> > But, in this specific case those are both Fixes: patches with Cc: stable,
> > so they should be pulled into drm-intel-next-fixes PR.
> >
> > Rodrigo, can you cherry-pick those patches to -next-fixes that you send
> > to Dave?
>
> They still haven't made it to linux-next.  I think for now I'll just
> rebase without them again and then you can handle the conflicts for
> 5.11.

Yeah after -rc6 drm is frozen for features, so anything that's stuck
in subordinate trees rolls over to the next merge cycle. To avoid
upsetting sfr from linux-next we keep those -next branches out of
linux-next until after -rc1 again. iow, rebasing onto linux-next and
smashing this into 5.10 sounds like the right approach (since everyone
else freezes a bunch later afaik).

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

