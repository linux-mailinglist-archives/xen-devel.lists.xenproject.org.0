Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47520268ADE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 14:27:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHnZP-0000XB-9b; Mon, 14 Sep 2020 12:26:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hQe=CX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kHnZO-0000X6-4U
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 12:26:54 +0000
X-Inumbo-ID: 8c7a8135-f3c9-4281-bd9c-227505460f15
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c7a8135-f3c9-4281-bd9c-227505460f15;
 Mon, 14 Sep 2020 12:26:53 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t10so18535457wrv.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 05:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=GSgLa0I03wN1FJwJ8SZCpuyQCE4fZIiWQ/ytU8r4D3c=;
 b=VqB+TFk7dBRx6C5HFRFxnOcjQIVTgbY970WSbhTOyZwE//+PWGWXsY/Ivmn9dIWa+j
 xEuwrRhL8cvO1kJ2oKC5+pgN6AQ48f0GJi8f7oIq8+ZVV1HWQHQz9Qw2RieYCBOayU92
 q8kdyU++L8bfSYVQ1Ne5JysjhlGGDIJIWZvwu60ZaPGkIUiTCPpWykxfhhtW2LXMteL6
 aZPff4D7y/o8ZiiWfG/FzJS3OjkKkn0wCeLnDgH05vF10KC3rlLocbWeOGwE0iHaniis
 EHMTrHMR7QkMbJ/tKehNaBv6ZndrjR3oh0A+n89eYkzdlbSwUCrjFpw+jJqSqoPDbx8c
 9z5Q==
X-Gm-Message-State: AOAM5318k+pGRDU/vi1x/WQ4LlBi4SH5tiZUUEmSPIqaMYveTUZDbef3
 0Ni0wZuheFodY3OQaN1Qi0o=
X-Google-Smtp-Source: ABdhPJyVce0hWTJ22ODWgUhCyKpwxLqifbomCw4axOgyV5WkZJHIuigkbi1Q1LOopDzY13yBBg5Ojw==
X-Received: by 2002:a5d:4709:: with SMTP id y9mr15768026wrq.59.1600086412497; 
 Mon, 14 Sep 2020 05:26:52 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 185sm20483651wma.18.2020.09.14.05.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 05:26:51 -0700 (PDT)
Date: Mon, 14 Sep 2020 12:26:50 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] libxl: do not automatically force detach of block
 devices
Message-ID: <20200914122650.5pqdeebur3inugbu@liuwe-devbox-debian-v2>
References: <20200903100537.1337-1-paul@xen.org>
 <20200903100537.1337-3-paul@xen.org>
 <20200908141903.it25fe672dltw7pm@liuwe-devbox-debian-v2>
 <20200914104109.GE753@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200914104109.GE753@Air-de-Roger>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 14, 2020 at 12:41:09PM +0200, Roger Pau Monné wrote:
> On Tue, Sep 08, 2020 at 02:19:03PM +0000, Wei Liu wrote:
> > On Thu, Sep 03, 2020 at 11:05:37AM +0100, Paul Durrant wrote:
> > > From: Paul Durrant <pdurrant@amazon.com>
> > > 
> > > The manpage for 'xl' documents that guest co-operation is required for a (non-
> > > forced) block-detach operation and that it may consequently fail. Currently,
> > > however, the implementation of generic device removal means that a time-out
> > > of a block-detach is being automatically re-tried with the force flag set
> > > rather than failing. This patch stops such behaviour.
> > > 
> > > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > 
> > I'm two-minded here.
> > 
> > On the one hand, special-casing VBD in libxl to conform to xl's
> > behaviour seems wrong to me.
> > 
> > On the other hand, if we want to treat all devices the same in libxl,
> > libxl should drop its force-removal behaviour all together, and the
> > retry behaviour would need to be implemented in xl for all devices
> > excepts for VBD. This requires a bit of code churn and, more
> > importantly, changes how those device removal APIs behave. In the end
> > this effort may not worth it.
> 
> I would be worried about those changes, as we would likely have to
> also change libvirt or any other downstreams?
> 
> > If we go with the patch here, we should document this special case on
> > libxl level somehow.
> > 
> > Anthony and Ian, do you have any opinion on this?
> 
> Maybe a new function should be introduced instead, that attempts to
> remove a device gracefully and fail otherwise?
> 
> Then none of the current APIs would change, and xl could use this new
> function to handle VBD removal?

This sounds fine to me.

Wei.

> 
> Roger.

