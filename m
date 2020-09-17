Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB726E12A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 18:52:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIx8f-0002FY-Jx; Thu, 17 Sep 2020 16:52:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W15F=C2=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kIx8d-0002EI-9o
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 16:52:03 +0000
X-Inumbo-ID: 34ae25df-89a0-40b8-abde-18084b39c0bf
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34ae25df-89a0-40b8-abde-18084b39c0bf;
 Thu, 17 Sep 2020 16:52:02 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s13so2624811wmh.4
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2020 09:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ahy3UyqXSM9M1b2QdfGGDqrfONYeP/pUcDIjJNhY6qs=;
 b=ddUhCjkKR1ZpqGRu4ZgUDHJy85/oDfvHTig0yjIgIL7X2fh2bRpWVafhw4cSauROMW
 A3BcSYklNZ3jzLwiGj2iMFmDc91eFr3HU+FA7ybG4KCjnW7GTevJfKhZiuWxiO9GF9cQ
 h1nSRxju0XKwG2W5I/FFUpa2kJkMZDNNm67eNTME6KEh+07MSEyjXbxsCdK6CT4aGSJP
 crMQyKgbMokkddB+kHIuZ+X+0X3MBGr17cwAQYjCUbf3nr9fFx0Lds7kv83HFS4wlKPk
 6+Gfi75KM6LElxrbDFZUlYhOjg7rQ51ucqdCFHvd9jcEBpuDyIvVMjd+ZkEtvf/I0VFh
 ii5w==
X-Gm-Message-State: AOAM530psJd2ZnYC1YcXD1ClbuAw6J5r/xwvgNO65IZyhUYqkzaI9vVd
 Bgc03A4+HxW8xL66W1cBknQ=
X-Google-Smtp-Source: ABdhPJzsIofMLNpWPNcPrPjeRnVH9bSDs5OpdrMO7rg0zSujJ/yz0WP/T450QBmQq4NV5kiC6xMxNQ==
X-Received: by 2002:a1c:4943:: with SMTP id w64mr10600833wma.62.1600361521562; 
 Thu, 17 Sep 2020 09:52:01 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q12sm236947wrp.17.2020.09.17.09.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 09:52:00 -0700 (PDT)
Date: Thu, 17 Sep 2020 16:51:59 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v9 6/8] common/grant_table: batch flush I/O TLB
Message-ID: <20200917165159.sg6gz6rlfnf4g7ky@liuwe-devbox-debian-v2>
References: <20200915082936.23663-1-paul@xen.org>
 <20200915082936.23663-7-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915082936.23663-7-paul@xen.org>
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

On Tue, Sep 15, 2020 at 09:29:34AM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch avoids calling iommu_iotlb_flush() for each individual GNTTABOP and
> instead calls iommu_iotlb_flush_all() at the end of a batch. This should mean
> non-singleton map/unmap operations perform better.
> 
> NOTE: A batch is the number of operations done before a pre-emption check and,
>       in the case of unmap, a TLB flush.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Wei Liu <wl@xen.org>

