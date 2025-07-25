Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC6EB11970
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 09:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057444.1425347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDK2-0004lm-Mq; Fri, 25 Jul 2025 07:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057444.1425347; Fri, 25 Jul 2025 07:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDK2-0004jj-Jw; Fri, 25 Jul 2025 07:58:30 +0000
Received: by outflank-mailman (input) for mailman id 1057444;
 Fri, 25 Jul 2025 07:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfLl=2G=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ufDK0-0004jd-S0
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 07:58:28 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25bae9e7-692d-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 09:58:27 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so20523145e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 00:58:27 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b76fcb84f2sm4221307f8f.62.2025.07.25.00.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 00:58:26 -0700 (PDT)
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
X-Inumbo-ID: 25bae9e7-692d-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753430307; x=1754035107; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H8dvTayA/folmyRTuQSGeMm3VZ1kjCWBvSr1JOKY9Zo=;
        b=VMtsuarF30kczxHjUtmhKILKOarOr9QV37I5nHYv+aSMoP77upPu4cY6LSb/MIa5fw
         ueIbTEOWe5lgIC+TmHD7M5GQVMaC9HqIBIj9Wd7sQ7RdY86blHdbouGqQwGGP3YtQzM2
         3V+wgxiHfUJvB5TCxjSOyL+yMdGHvOhjxbZNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753430307; x=1754035107;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8dvTayA/folmyRTuQSGeMm3VZ1kjCWBvSr1JOKY9Zo=;
        b=WAqpblGYZrGQPy3CnW/6X8ChTBAhY26KX9kCaJs9eMW7uTfwN3arFFoo0+hY96a7Eq
         Y7mMfshPV0MPVaxQlCZxF+RJU8u/Y2KedJ3+4DUaMXR07ArDbbP7kCx8EImqMd44OoSW
         tIyjHxsefqFf5Kgv60/t7ubhn3W0Xq8DAVrDXwqbXIOxB0EiMouyNGGlVvtZeRGEZ7lY
         LWqhxe6i3KKj9ZMK8E70pVQJDK1d1UpSBWUPemrf88Sr71oDExAMmxXCGLOIMRd4xxXS
         brK7Ecg/QFyJHBJAoBwSQ1LwZhd+Fweze2megMIzAHDtGvCUJJ3k0v+84be0mLQEQs7B
         hbwQ==
X-Gm-Message-State: AOJu0YxNwtX7LK6NIjoZClky1jfn8hJhy05JR20aGdVzy2Bre/MJhxRf
	p1QIicn+s4aL8DdwoYznjALsOhCcU15QKKHZAKFAnSHjnQxsZoi52KYGLe0aHshmBJc=
X-Gm-Gg: ASbGncsLCybK2TGV3Ye9zICCe07rTNWKZDtmoKkdKnfv3UckT7ano5zkW4WaQ4pCcd0
	J+BNTHm+GyPWt2nRHj+oHGUp1o0u7rH/YM+I1g5rnEkGfchJwIgqWqZibbsHva9KMXD7MPRNv7N
	QQcPMzwKbHecoBj9DV6Sog4bkoaqyc4oPy7lBDgKLZFjzLERB+T+mqOVuRkxFPsmQdjCOQd7emG
	HJfBVMS37KIsdQegEil91Hvv67Bd8lkmp23IapaSfVGUg90kAzjMqRrFMR0G6QLb7UXTKpqVbCu
	8wNLCm4ZhhAn3gabETJe60IOjOnnCmQmfeAayLQDcSZDf6BiKoMKqQdgo8JESMHNcJ+eioJOdfE
	vb/yB6aunjR7J3X42JKf12sD6nRF/mXwLpgMHnh6BII8H/pMYSAKsuQG0bn8HAZ70WA==
X-Google-Smtp-Source: AGHT+IHn1QuHsdXpSde7sJ/n0DZB87ql/v7Z5AG3lx2rDEfPKndg74ul5hLArSVGggvg/yMy4UX2eg==
X-Received: by 2002:a05:6000:2410:b0:3b7:75dd:f378 with SMTP id ffacd0b85a97d-3b7765ece16mr874686f8f.10.1753430307086;
        Fri, 25 Jul 2025 00:58:27 -0700 (PDT)
Date: Fri, 25 Jul 2025 09:58:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] vpci: allow queueing of mapping operations
Message-ID: <aIM5IR-d4_u19JVe@macbook.local>
References: <20250723163744.13095-1-stewart.hildebrand@amd.com>
 <20250723163744.13095-2-stewart.hildebrand@amd.com>
 <aIJi8E2BC-dzAIz8@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIJi8E2BC-dzAIz8@macbook.local>

On Thu, Jul 24, 2025 at 06:44:32PM +0200, Roger Pau Monné wrote:
> On Wed, Jul 23, 2025 at 12:37:41PM -0400, Stewart Hildebrand wrote:
> > @@ -283,7 +297,48 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> >      return rc;
> >  }
> >  
> > -static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> > +static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
> > +                                            uint16_t cmd, bool rom_only)
> > +{
> > +    struct vpci_map_task *task = xzalloc(struct vpci_map_task);
> 
> xvzalloc() preferably.
> 
> This however introduces run-time allocations as a result of guest
> actions, which is not ideal IMO.  It would be preferable to do those
> allocations as part of the header initialization, and re-use them.

I've been thinking over this, as I've realized that while commenting
on it, I didn't provide any alternatives.

The usage of rangesets to figure out the regions to map is already not
optimal, as adding/removing from a rangeset can lead to memory
allocations.  It would be good if we could create rangesets with a
pre-allocated number of ranges (iow: a pool of struct ranges), but
that's for another patchset.  I think Jan already commented on this
aspect long time ago.

I'm considering whether to allocate the deferred mapping structures
per-vCPU instead of per-device.  That would for example mean moving
the current vpci_bar->mem rangeset so it's allocated in vpci_vcpu
struct instead.  The point would be to not have the rangesets per
device (because there can be a lot of devices, specially for the
hardware domain), but instead have those per-vCPU.  This should work
because a vCPU can only queue a single vPCI operation, from a single
device.

It should then be possible to allocate the deferred mapping structures
at vCPU creation.  I also ponder if we really need a linked list to
queue them; AFAIK there can only ever be an unmapping and a mapping
operation pending (so 2 operations at most).  Hence we could use a
more "fixed" structure like an array.  For example in struct vpci_vcpu
you could introduce a struct vpci_map_task task[2] field?

Sorry, I know this is not a minor change to request.  It shouldn't
change the overall logic much, but it would inevitably affect the
code.  Let me know what you think.

Thanks, Roger.

