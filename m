Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEF52688BD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:48:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHl51-0001Rl-BD; Mon, 14 Sep 2020 09:47:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hQe=CX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kHl4z-0001Rg-7C
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:47:21 +0000
X-Inumbo-ID: 68c317ad-48d3-4f21-b2fb-864c2b6523a5
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68c317ad-48d3-4f21-b2fb-864c2b6523a5;
 Mon, 14 Sep 2020 09:47:10 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l9so10552126wme.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 02:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TlaFNdLUQT92fdUoylEll5iv8jZ8q5Cjm/rKs3hhd0I=;
 b=BwG3t3t3caF71M6Em6rGuqcorDzQujQowqDU6bBessg9u41UZGPZq/S40wRMmX6DhO
 Ps1QqSShb3JpzRPxazg5wkp+A3HX3ihYzqv0Jf01eb2iZdTee8zAVo2JrQO+fFy0rh+o
 HRgHsdhz3uXxGm7n4gc7HyjTpP0uvYnaOFDKHdUMS8dtclPmaBLWmAkfWIAEbFsZCXy7
 +GjOykThfx+abmldmAYqZyBLCWWndp1Om0iO+Mfzyi6apLexVrSpaBCXIYBxfirKErm2
 H5Tm8cUsxDJ0Njzyzd8KWNpvgaCWmjHevpWYOhsEtPfHWvmPaaFa/L7vCP25kIA4CMvb
 PDnA==
X-Gm-Message-State: AOAM5322z2NWEriLxBEdh15m/9fMBdDlAuNBL/3vBlBqHD36qyeI2wJe
 ReXiJqeQbCPg5EyVna34cIRJiqothWw=
X-Google-Smtp-Source: ABdhPJypVce7g6leMREjsJ3NMqHIZS3FYxomnEIoFBJKcsa1sVmbxaiDrCdvoVxShPbzFWmzUykXUg==
X-Received: by 2002:a1c:e256:: with SMTP id z83mr14538090wmg.33.1600076829794; 
 Mon, 14 Sep 2020 02:47:09 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n4sm19531432wrp.61.2020.09.14.02.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 02:47:09 -0700 (PDT)
Date: Mon, 14 Sep 2020 09:47:07 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libs/guest: fix Makefile regarding zlib options
Message-ID: <20200914094707.x5vyjksszh7oqjs4@liuwe-devbox-debian-v2>
References: <20200910154210.2440-1-jgross@suse.com>
 <20200914093901.ce74eajfp36oiuw5@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914093901.ce74eajfp36oiuw5@liuwe-devbox-debian-v2>
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

On Mon, Sep 14, 2020 at 09:39:01AM +0000, Wei Liu wrote:
> On Thu, Sep 10, 2020 at 05:42:10PM +0200, Juergen Gross wrote:
> > When renaming the libxenguest sources to xg_*.c there was an omission
> > in the Makefile when setting the zlib related define for the related
> > sources. Fix that.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Acked-by: Wei Liu <wl@xen.org>

Actually this is already applied. Thanks Andrew.

