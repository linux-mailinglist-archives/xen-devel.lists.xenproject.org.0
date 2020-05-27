Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1391E33E9
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 02:03:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdjXG-0001DP-Ov; Wed, 27 May 2020 00:03:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xzom=7J=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jdjXF-0001DK-Ad
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 00:03:05 +0000
X-Inumbo-ID: 702300b0-9fad-11ea-9dbe-bc764e2007e4
Received: from mail-qv1-xf33.google.com (unknown [2607:f8b0:4864:20::f33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 702300b0-9fad-11ea-9dbe-bc764e2007e4;
 Wed, 27 May 2020 00:03:04 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id v15so10395364qvr.8
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2020 17:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=37NBoZxOHh49AYaQ2gDLWnrnuuRxdlIh80uAzZEA4PM=;
 b=OsKPJg6qIycZl8TSUN1uxpVCzvGANmELsaMWVuy7AdftEyScnJxI/fv2rDJ5tnYsvh
 uqKaiwf6gkUFnz/tI5bRLFoFJ0cwnOJOu+UN+vn04WYP0lFI1PfCHb5r+1I9JF25ygz9
 Xr5gr1MIHgpq9ADWVDRi5I0O5Rh0E1eF+xG2JOBhVOiv+HAjWsjaSrLis/decFZi+wV8
 4TvCv7/Hxpej7Ih6ks3PCZoRAQ7675J6fEntGt/UeeZxO1gjwK9C8PQPWpoSncwCTUlA
 6xSPbwtsUxTPu6KyQiaxm8ytGhb+7VEu3tb0TrNR/IfeEnvGIFQ8yFrcHGKJY/1WnsM0
 G8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=37NBoZxOHh49AYaQ2gDLWnrnuuRxdlIh80uAzZEA4PM=;
 b=GJNiSIovl4YGJX9qlRSmEhhctPIV71uX55+IK/r1mT/i8YlHz06Jp/9D7CJhSMlJ35
 K78HtHJA8Ze/6DXHcCxKKjYXXTfjQqws6T5xIEfAf2hOvSaLh5iOyAlzamoGpqfRkxHZ
 u/6xmcOv27AREFQv6LZpfdeSBYaK/hZDnC551VWGrhu3eMYbVsFrTzZV0dnSPE/a9G4F
 Yl5HE2dNzHWFI7qyQlYMvQzg4TkpMU8k+pkTleMd5txZgh+SXcNR/z9Rx8pWUc3LYFCZ
 UK3t1UVgeEJuyi25tGr3ZNIq9G5tmqcudO+AYL7Rmqkq1NoLIHtkEL5/SzgfH1bswSi0
 Fd1w==
X-Gm-Message-State: AOAM532o3nZNb39jCAcTKtSl9jSJ4o841xSkd6OJKuPHyrDXydyGmez0
 9GF0VMFEdJRFIuQjmgB1v88=
X-Google-Smtp-Source: ABdhPJxIZ8hF6u7aHWAiIDYuoegJAVUe+le0YM4mjWmC4NmaR4rpWSUXhuR3O6gXUSn+qrxljMoP4Q==
X-Received: by 2002:ad4:5662:: with SMTP id bm2mr22489308qvb.48.1590537784494; 
 Tue, 26 May 2020 17:03:04 -0700 (PDT)
Received: from six (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id v69sm990918qkb.96.2020.05.26.17.03.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 26 May 2020 17:03:03 -0700 (PDT)
Date: Tue, 26 May 2020 20:03:01 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 2/5] golang/xenlight: Get rid of GOPATH-based build
 artefacts
Message-ID: <20200527000301.GB2978@six>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
 <20200526221612.900922-3-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526221612.900922-3-george.dunlap@citrix.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 26, 2020 at 11:16:09PM +0100, George Dunlap wrote:
> The original build setup used a "fake GOPATH" in tools/golang to test
> the mechanism of building from go package files installed on a
> filesystem.  With the move to modules, this isn't necessary, and leads
> to potentially confusing directories being created.  (I.e., it might
> not be obvious that files under tools/golang/src shouldn't be edited.)
> 
> Get rid of the code that creates this (now unused) intermediate
> directory.  Add direct dependencies from 'build' onto the source
> files.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

If you want to just make that change on check-in,

Reviewed-by: Nick Rosbrook <rosbrookn@ainfosec.com>

