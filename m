Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5590021C5D9
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2020 20:45:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juKUP-0007p4-Ea; Sat, 11 Jul 2020 18:44:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EKeT=AW=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1juKUN-0007ox-No
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2020 18:44:44 +0000
X-Inumbo-ID: 95197f81-c3a6-11ea-90f5-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 95197f81-c3a6-11ea-90f5-12813bfff9fa;
 Sat, 11 Jul 2020 18:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594493082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bS19/wWScaoigC28WtauFL/l6Ha+uxblMLUn/Mypy1E=;
 b=DQMnvWiiZflT0AWnTyRqDBlBueVW65Yir9ON4xHra06Sb1qqJ5IheuIH4SU+o1SGGeFc2Y
 0fG6vYIBtCaigfc6vl3GtrSfo23tjEwHVKqNfTiLkV20OXxmVb0CRguD/SXTI6DSC9VCYh
 M2zsNySXeufAyhmDxANWlwYjj6/5Qbc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-rwQCwpe6PQuZv95v1V8g5w-1; Sat, 11 Jul 2020 14:44:40 -0400
X-MC-Unique: rwQCwpe6PQuZv95v1V8g5w-1
Received: by mail-wm1-f69.google.com with SMTP id l5so11714297wml.7
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2020 11:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bS19/wWScaoigC28WtauFL/l6Ha+uxblMLUn/Mypy1E=;
 b=XPqvfsLYWtJ6GcSEiahaE6pxqZAFkj/7XBkZFOVnnP9denMB9rBTwsTLarzX/hBGq7
 25Ty5OzgC4jz4p8AGvIYvvuPd9qiqaD32zogpYv0Qa9eZ+ThDN9dfpQ8pUIU3L3hvtHf
 Pa7onfiDTOHrEcvBbcvSnTt7Zn4d4DKfGMeb+Y4OrTfRix39ZB/xERp9tTyxaKX2tML5
 8ZDPDYccL/ONnGssvcUeDD1yNTFOraVAzCclHiLaOAUieIl9g1gIyI/U/FK8iVQPRJr6
 Z0/0kxuo9LK3O0Wa5z+0L/LIiUHtOkjVMivg4lTPFbLf1jglUmpL4exdgLjTj8b06GQy
 a92Q==
X-Gm-Message-State: AOAM533nDvnXofHb/oy/kSjgQkRy5EEdRRvmskLrFz6gRbBUM3IszK5p
 aGGH74aGyW9tR48k3uV/EiO29Jvv/CC13y7F25iESSsMEL2p0KivM1RapNzioVPEq5z2346V0tI
 t/+tNvQwrTwnTmvhadTnYGilYArI=
X-Received: by 2002:a1c:4d11:: with SMTP id o17mr10838357wmh.134.1594493079797; 
 Sat, 11 Jul 2020 11:44:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygwQmxPTGDCpKObOVAAUSmALBrwy00qKV5C2K74YeE+tRXIP/JRrrSaIMIkdPE6mekfNCtDg==
X-Received: by 2002:a1c:4d11:: with SMTP id o17mr10838336wmh.134.1594493079525; 
 Sat, 11 Jul 2020 11:44:39 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 a84sm4541096wmh.47.2020.07.11.11.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2020 11:44:38 -0700 (PDT)
Date: Sat, 11 Jul 2020 14:44:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200711144334-mutt-send-email-mst@kernel.org>
References: <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
 <20200701133456.GA23888@infradead.org>
 <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
 <20200701172219-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2007101019340.4124@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007101019340.4124@sstabellini-ThinkPad-T480s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, konrad.wilk@oracle.com,
 jasowang@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 10, 2020 at 10:23:22AM -0700, Stefano Stabellini wrote:
> Sorry for the late reply -- a couple of conferences kept me busy.
> 
> 
> On Wed, 1 Jul 2020, Michael S. Tsirkin wrote:
> > On Wed, Jul 01, 2020 at 10:34:53AM -0700, Stefano Stabellini wrote:
> > > Would you be in favor of a more flexible check along the lines of the
> > > one proposed in the patch that started this thread:
> > > 
> > >     if (xen_vring_use_dma())
> > >             return true;
> > > 
> > > 
> > > xen_vring_use_dma would be implemented so that it returns true when
> > > xen_swiotlb is required and false otherwise.
> > 
> > Just to stress - with a patch like this virtio can *still* use DMA API
> > if PLATFORM_ACCESS is set. So if DMA API is broken on some platforms
> > as you seem to be saying, you guys should fix it before doing something
> > like this..
> 
> Yes, DMA API is broken with some interfaces (specifically: rpmesg and
> trusty), but for them PLATFORM_ACCESS is never set. That is why the
> errors weren't reported before. Xen special case aside, there is no
> problem under normal circumstances.

So why not fix DMA API? Then this patch is not needed.


> 
> If you are OK with this patch (after a little bit of clean-up), Peng,
> are you OK with sending an update or do you want me to?


