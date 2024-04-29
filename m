Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2808B5356
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 10:41:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713921.1114840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1MZ0-0002aY-Td; Mon, 29 Apr 2024 08:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713921.1114840; Mon, 29 Apr 2024 08:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1MZ0-0002YJ-Qt; Mon, 29 Apr 2024 08:40:42 +0000
Received: by outflank-mailman (input) for mailman id 713921;
 Mon, 29 Apr 2024 08:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXAa=MC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1MYz-0002YD-7P
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 08:40:41 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 274a587d-0604-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 10:40:38 +0200 (CEST)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5af2358c7e5so2447399eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 01:40:38 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 k17-20020a0cc791000000b0069b5672bab8sm2696526qvj.134.2024.04.29.01.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 01:40:37 -0700 (PDT)
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
X-Inumbo-ID: 274a587d-0604-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714380037; x=1714984837; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kKl8Luk2uSE9IYup0Z/mRNdGXTEvWMATsLUSxT3EOKs=;
        b=RXXP7TEUZV1u/GaYE3AImLPU5Chwxhj2nU3ZqO5v4tHrEVlAy+YzU+EBmKO4Em0i5P
         AgJfVPhi3Mw7Fz6ztLCVKisSawgy77FrKTD2B9zrYnGioIQxPougfJW3VPEBLTjZaVPi
         +BZNMlMxm7iXCyf6vXrehWFH1Ev05GB96KV5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714380037; x=1714984837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKl8Luk2uSE9IYup0Z/mRNdGXTEvWMATsLUSxT3EOKs=;
        b=Yxu+w0QDCeip8s0edQcX0STL4bmloFg4PjI7b51egxq8vSHZp11AEGbC8JIXw9U8FW
         xPgxnnRbNvQmlNZi2sHaBJV2vLbsM7fSF7/6NeG7tuOSvXdArms/eA37ISbvdXJkZNcT
         gNoCXCGtFjfFGuLB1k90eIlAnu4zY4Z478dvz+60kgyZoYc8vVz0ArlZgAfJvE2QVDqH
         vXdr1rTWtc0pi8D497Ej/Fbz9usnPULO/cJxOtUyIFgtdV5ZbXj08Q2i17j0CPuxvHUe
         qyxxFNO0w3rUqCqKvzEGNHNaspHEOqjQmIu/pQPiX3S2R9JT6RKyj/mP3jwWoy7RXRmQ
         5jow==
X-Gm-Message-State: AOJu0YwkFgb0T7I6LL/dyTI1Chth9S0KeU11HLq3UJNVjs4e8a/xfpnO
	e9ncp+35j9GDiHy1NeQuUGm9+JIEbOqJbRs18p225aD4HQLItza5/QyA0r7r/xE=
X-Google-Smtp-Source: AGHT+IE1+pQyJmu0n6HwvTUtWKVYxBAkYueJLBZy9XujAX0LIAm+EfRGIzEP6sWzD8gQR88xvKdfPg==
X-Received: by 2002:a05:6359:5101:b0:186:1b7f:e885 with SMTP id ob1-20020a056359510100b001861b7fe885mr9727041rwb.17.1714380037467;
        Mon, 29 Apr 2024 01:40:37 -0700 (PDT)
Date: Mon, 29 Apr 2024 10:40:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 1/7] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Message-ID: <Zi9dA0d4ZvI25ksu@macbook>
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
 <3e1150560a41bd567049627d684cd4e754530869.1710342968.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e1150560a41bd567049627d684cd4e754530869.1710342968.git-series.marmarek@invisiblethingslab.com>

On Wed, Mar 13, 2024 at 04:16:06PM +0100, Marek Marczykowski-Górecki wrote:
> QEMU needs to know whether clearing maskbit of a vector is really
> clearing, or was already cleared before. Currently Xen sends only
> clearing that bit to the device model, but not setting it, so QEMU
> cannot detect it. Because of that, QEMU is working this around by
> checking via /dev/mem, but that isn't the proper approach.
> 
> Give all necessary information to QEMU by passing all ctrl writes,
> including masking a vector. Advertise the new behavior via
> XENVER_get_features, so QEMU can know it doesn't need to access /dev/mem
> anymore.
> 
> While this commit doesn't move the whole maskbit handling to QEMU (as
> discussed on xen-devel as one of the possibilities), it is a necessary
> first step anyway. Including telling QEMU it will get all the required
> information to do so. The actual implementation would need to include:
>  - a hypercall for QEMU to control just maskbit (without (re)binding the
>    interrupt again
>  - a methor for QEMU to tell Xen it will actually do the work
       ^ method
> Those are not part of this series.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> I did not added any control to enable/disable this new behavior (as
> Roger have suggested for possible non-QEMU ioreqs). I don't see how the
> new behavior could be problematic for some existing ioreq server (they
> already received writes to those addresses, just not all of them),
> but if that's really necessary, I can probably add a command line option
> to restore previous behavior system-wide.

That's fine I guess, as you say such ioreq servers should already know
how to handle the ranges, and if anything the current behavior of
device models not receiving all accesses is likely the bogus (or
unexpected at least).

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

