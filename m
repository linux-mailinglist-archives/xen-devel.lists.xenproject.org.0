Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 438D623BB2E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 15:31:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2x2B-0007Rm-TH; Tue, 04 Aug 2020 13:31:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUrY=BO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k2x2A-0007Rh-Ag
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 13:31:14 +0000
X-Inumbo-ID: a62b8f89-fafd-4d3a-bead-38dfb9e55709
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a62b8f89-fafd-4d3a-bead-38dfb9e55709;
 Tue, 04 Aug 2020 13:31:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id k8so2943557wma.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Exfbsw1LYEHKpD3Fp0p8k5eNg19gqSg72l4KRzBAg6I=;
 b=HzPtCS01eh92n0k2bVH+lNGZU7hA5R1TKEV55OVPjq+4O6sQK2DQLNlJ4DWmnRcqSm
 ma1eeCoWGWFAReStrM98iWYfSp2ROtMfVzrKQ1x52jfZ9x8jNNtO6Wx6tmCWm2yiF8nr
 KJ3B5sU6yeRbW0UorRDLa2ONV+Ml5gl/jXLdkDtl1STDJP8h9seg9eQdK1lIHWQo3jDe
 8m+ls99C3Lq8w+6hks+vAAsh0dheP9Eh6ZOAZu4KMmfkEqb5+dP3qAAjP6B2lCRmpFZf
 a1PUHKhWcELztWCH2WyBPgaOyFua/8FOdg1gc1WFfXYIkv6VglvCVHkYk0DdGJ+Wc/n2
 IrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Exfbsw1LYEHKpD3Fp0p8k5eNg19gqSg72l4KRzBAg6I=;
 b=BB7Bes3KblpCHGauJwXBJ78Zgit7Tx7hexc6wTw2nMfAeSGDVLgXTJlMFLA89nvvjV
 Qsrq9t53Fpe7o8w9BQctr5izZiMTZ2rG3zCubSV5qLy1b89Bpx344vKPWPZ0DXWJjeak
 iBDmbRe1lxPt8DSZFvwc0X4ERqFmXNQzbNvDKUqSIyoY3YKNkncUnXpNVOJCiv2waRuq
 uBcfCar7z0fDcwxZxzAtGPStK/zUaf42320x9L16SXZdGH+cdSKocpdSzrCgga6+3HDm
 uKJOqXI3EMdIo8/R4iPYs7jl44+xf10iLdlmDvAugzito9wnS8nbbuVk0KAlb0f4oAUL
 OwWw==
X-Gm-Message-State: AOAM5334aiNj4opoZSe8U5Aw9puwMWjZ5N+Gz4Njia17s0dYazFnT0/c
 crTd9OQhU412JFEUYW26Ex0=
X-Google-Smtp-Source: ABdhPJxxd5wng/cXBMewHz/8C3Z5LQFtsMnssxfrxAa/vBg5aukG6FkeVrYQyCo33P23uACXfImFQg==
X-Received: by 2002:a1c:1d92:: with SMTP id d140mr4171448wmd.143.1596547872188; 
 Tue, 04 Aug 2020 06:31:12 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id l10sm30624211wru.3.2020.08.04.06.31.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 06:31:10 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>
References: <20200803124931.2678-1-paul@xen.org>	<20200803124931.2678-5-paul@xen.org>	<24361.17132.762055.478992@mariner.uk.xensource.com>	<002001d66a51$3cd055f0$b67101d0$@xen.org>
 <24361.18433.500622.984594@mariner.uk.xensource.com>
In-Reply-To: <24361.18433.500622.984594@mariner.uk.xensource.com>
Subject: RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the
 frontend via xenstore
Date: Tue, 4 Aug 2020 14:31:12 +0100
Message-ID: <002801d66a63$85fb8c10$91f2a430$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIYGZMBbauEfHj5QMvrSYCboUsizgIdsxRvAjZRG38CQrq5MgKDUJ7HqFvABxA=
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 04 August 2020 12:35
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' <pdurrant@amazon.com>; 'Wei Liu' <wl@xen.org>
> Subject: RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend via xenstore
> 
> Paul Durrant writes ("RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend via
> xenstore"):
> > > -----Original Message-----
> > > From: Ian Jackson <ian.jackson@citrix.com>
> > > Sent: 04 August 2020 12:14
> > > To: Paul Durrant <paul@xen.org>
> > > Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Wei Liu <wl@xen.org>
> > > Subject: Re: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend via xenstore
> > >
> > > Paul Durrant writes ("[PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend via
> > > xenstore"):
> > > > +       XENBUS_PATH="/local/domain/$domid/device/vif/$devid"
> > > > +       xenstore_write "$XENBUS_PATH/mtu" ${mtu}
> > >
> > > It's surprising to me that this code doesn't have the xenbus path
> > > already in some variable.  But I guess from the fact that you've added
> > > this code, that it doesn't.
> >
> > It is set, but set to the backend path. For safety I guess it's probably best if I use a local in
> this instance. Can I keep your R-b
> > with such a change?
> 
> Oh, wow.  I hadn't realised that.  I take back my earlier R-b :-).
> 
> Can you please use a different variable name for the frontend path ?
> 

OK.

> ...
> 
> Actually.
> 
> This shouldn't be in the frontend at all, should it ?  In general the
> backend writes to the backend and the frontend to the frontend.
> 
> So maybe I need to take back my R-b of
>   [PATCH v2 3/4] public/io/netif: specify MTU override node
> 
> Sorry for the confusion.  I seem rather undercaffienated today.
> 

Too late. The xenstore node has been used by Windows frontends for the best part of a decade so we can't practically change the
path. Another way would be to also modify netback to simply echo the value from backend into frontend, but that seems rather
pointless.

Interestingly libxl does define an 'mtu' field for libxl_device_nic, which it sets to 1492 in libxl__device_nic_setdefault() but
never writes it into xenstore. There is even a comment:

/* nic->mtu = */

in libxl__nic_from_xenstore() which implies it should have been there, but isn't.
I still think picking up the MTU from the bridge is the better way though. 

  Paul

> Ian.


