Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B552543DD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:38:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFI6-0006Rb-MP; Thu, 27 Aug 2020 10:37:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFI5-0006RI-E5
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:37:57 +0000
X-Inumbo-ID: 1b6efb9f-acc2-48b9-a40e-5e27d57d497d
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b6efb9f-acc2-48b9-a40e-5e27d57d497d;
 Thu, 27 Aug 2020 10:37:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s13so4694934wmh.4
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kxTEUep6KFe1JK6NdXOfRcGERgKj1cZ+QxwlqT2DZCs=;
 b=KSOkxcnen/d1WaHA8sGEdgtZWPKZbbG4UAQf8kPFsIi9CdINF1CkuyPQ01G+tkb7Me
 /nwn1mtlcOR30MNQGivvxLkRcyzkFD/lcHtwWq2UA4DXZYiCEOwz78o+rR0/rWFnkEYk
 01h4sBaOEGDiYu8nHNW+kLDBhHyi90l93xrw+wuuv6+EY8/egU2KRq9HR+7Ojp5Noi68
 8JKQyqWWBBhFVJb4Hq3cUeGprmzDr+jePX4iMPJB435LZUMTg6D/0BJUlkur55Z9dmky
 14yg1C3d2Y15oTFERHyLKK2dRWrsCn3r98cbD8ZSEaPgC8AmKQYh3ojaloT6P/9epIq3
 cEuA==
X-Gm-Message-State: AOAM530L895HXmSHscgsyNimr+OC5FDW6PVFUe7nJquNVVQLJn+C7Nwq
 fch5IQRnRAR1dEYYYAtcE0g=
X-Google-Smtp-Source: ABdhPJzVR0HhdqU2iC5N5/6mxZ0hCgFGr+9ASj2Xdk2s9exfmii59tePfQqy8I2+A4sAJ1GeVEiyTQ==
X-Received: by 2002:a1c:7203:: with SMTP id n3mr10532548wmc.149.1598524675757; 
 Thu, 27 Aug 2020 03:37:55 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f2sm5293667wrj.54.2020.08.27.03.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:37:55 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:37:53 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 16/38] tools/misc: replace PAGE_SIZE with XC_PAGE_SIZE
 in xen-mfndump.c
Message-ID: <20200827103753.5pgvb55gctznyf5h@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-17-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-17-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:34:57AM +0200, Juergen Gross wrote:
> The definition of PAGE_SIZE comes from xc_private.h, which shouldn't be
> used by xen-mfndump.c. Replace PAGE_SIZE by XC_PAGE_SIZE, as
> xc_private.h contains:
> 
> #define PAGE_SIZE XC_PAGE_SIZE
> 
> For the same reason PAGE_SHIFT_X86 needs to replaced with
> XC_PAGE_SHIFT.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

