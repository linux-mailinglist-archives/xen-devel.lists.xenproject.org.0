Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782252778EA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 21:04:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLWW9-0006E5-7f; Thu, 24 Sep 2020 19:02:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sU0P=DB=intel.com=dan.j.williams@srs-us1.protection.inumbo.net>)
 id 1kLWW7-0006E0-RR
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 19:02:55 +0000
X-Inumbo-ID: c210c782-d032-4948-9d61-2972736a4dd6
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c210c782-d032-4948-9d61-2972736a4dd6;
 Thu, 24 Sep 2020 19:02:52 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id i26so200953ejb.12
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 12:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zwh0H2Di2EjtS2oxRbwDl/g8AzPPtz4bTYVlHB6Q43U=;
 b=PSB3PcPl255zINexLzD5htRXOK8A7IpaIdKXFGiLO32U75F2k9xaAm8mZS7ely1gPq
 yZLW+0hCIn45DdWUyYO8G9jfS8J6+rlp2nsVNrm8+l/5IaMYV707qmr5UQ0dfW8t8mFM
 TGM/ejnQq6OR4f+ghs/rkS7hDoJYuUJW4L657stRoYQr04STf5dpZEl4CMwmFaDzfbER
 EPIt5iCUQqcQiTMaJpgnlFWhAOySGAsfIYSWvKD+cpfQaaZ8pNFsj3lLaMbMZTcQHkyw
 RvAYj9nOfidFYdho2D68Le7t2VZhia2mhnOBKQiCeSv5uNiyhRaV9CGBi+SEG1SSy/ah
 LHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zwh0H2Di2EjtS2oxRbwDl/g8AzPPtz4bTYVlHB6Q43U=;
 b=RNF4s1lP8/VXab/PCrFIxnRwK+SAnUICqDm9KjVZAT/+ZXs+qfKcVQDJgEyPUybTTz
 op6Y9+hclk57jEfs/FMHjXcuydY3j+XSpOSfXksUpQTfzlOP/x2dujwrmhr78VLVn2DB
 vwKG+z7bZwqgMzcuvBuxujTldNrHVqFmZ7boUtrNMa9c3mlvW3V/OglownyexghyIhH5
 zZvOPi4CrGNmgRCjBoVUqHyFi2UJnWUCdeKiBCT0GhWjutkyWMivHoLKIMNF3UW7f+LP
 08FG55qJ0ObhDNCjMrEYTnqVDvRgRFc1S3skMZcSbNu5jLZ8dZmsP+Ol/rJRbKGY+Txk
 C5vQ==
X-Gm-Message-State: AOAM53026/FiEPIAqqny3z0fb0tBb7OGDBGnUYtE7qa7Ton1uS5u5ZMc
 cO5z8B+LjR/rd5KPZ7a1BR1bnCop62eKxOSdjegKkg==
X-Google-Smtp-Source: ABdhPJyIjxPAbvw6mQwJDfqAdCr+NXbyHb0p0fA9nsaaQoL9Tj0/ldsUQQNqjWQJKZxocvoYQ0aBvveDA8qxbuKZJtY=
X-Received: by 2002:a17:907:4035:: with SMTP id
 nk5mr79283ejb.418.1600974171842; 
 Thu, 24 Sep 2020 12:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200901083326.21264-1-roger.pau@citrix.com>
 <20200901083326.21264-3-roger.pau@citrix.com>
In-Reply-To: <20200901083326.21264-3-roger.pau@citrix.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 24 Sep 2020 12:02:40 -0700
Message-ID: <CAPcyv4isGqsNXqz7tmVbu3UZMNSpZUphCKUkyBMgWYwv5o6OLw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] memremap: rename MEMORY_DEVICE_DEVDAX to
 MEMORY_DEVICE_GENERIC
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Johannes Thumshirn <jthumshirn@suse.de>, 
 Logan Gunthorpe <logang@deltatee.com>, Juergen Gross <jgross@suse.com>, 
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Linux MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Sep 1, 2020 at 1:33 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
>
> This is in preparation for the logic behind MEMORY_DEVICE_DEVDAX also
> being used by non DAX devices.
>

FWIW I would not call this MEMORY_DEVICE_GENERIC. This is really
MEMORY_DEVICE_SIMPLE and the kernel-doc can clarify in contrast to the
other MEMORY_DEVICE types this type implies no need for driver or
filesystem notification when a page goes idle.

