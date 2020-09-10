Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA0826435F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 12:11:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGJXo-0004uE-Ow; Thu, 10 Sep 2020 10:11:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WysH=CT=gmail.com=pankaj.gupta.linux@srs-us1.protection.inumbo.net>)
 id 1kGJXn-0004u9-Bq
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 10:11:07 +0000
X-Inumbo-ID: 1865a28d-fb00-4cf5-8dd4-9ed9dd7838ed
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1865a28d-fb00-4cf5-8dd4-9ed9dd7838ed;
 Thu, 10 Sep 2020 10:11:06 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id b6so6420976iof.6
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 03:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oq85Kv8Q2AnOzhchKRfF2cZCLjCk+7ncSapWENTEmk0=;
 b=NpOvnUxQq6zIh7M0z4jf/7u5uRWZt/oSXLnIqUkyv7UHc7QlSUjFlxN8w01avNNj5R
 GIm+2WkUVIuiSioAVODbjW358fbxikoLVuYG4exvQcak7FjX/IiYRTX2PzzNjc1PoJFu
 DWSfs6JHmRc2Fx5/G78235gadr2zBFYDEN1v+xGV8GrXaDQz8ZvlkBF/g2ayWbki0KPT
 UdJIeElMyVOnUo3VuKz0UrZvS7qPqc2RKC3bpuoCD/bYQR81k8PL1p1o8VuZrhgjA0mY
 MtYtT/CLOcJb6YQ7fiCkCbegRa2yQUPI4mkjZ52U8tPadGGyP0T2+W8VV4KaZiJBn7fI
 xh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oq85Kv8Q2AnOzhchKRfF2cZCLjCk+7ncSapWENTEmk0=;
 b=TdDhnsSRKg5y0oej5BCh7rJFKZG8AEx9WqH0EzFn0jSuGXPrqdZ4SwcSSB1bDQwO5k
 HzuEoqMBV2Rhc4xi7NWtx7r1iuJbMdUMBHjnZzuIQMaUAC/zsjY/IsfwvPUbvm9gPnGG
 B2TlqoN00iC0IAHv/aGtL/D7cM3pyMYRFVqECunOTVKd2Kpi1s7dVMWMA4Zj/HLGexp0
 xmfNT2SgABaHHzu+THlngiZkLTi/lft6IFi0oufaX1QiTz8JaUKwqoOuipMrkO0tzgtg
 ENKwvelnvmG3IYbK0UlVC9FK1BmVa1YkObzK7XhgQmjAOzauNTMVb7kZ3NvH/ryD7ETW
 HiGA==
X-Gm-Message-State: AOAM530MHU6z23Nv6KaxBqzfyRSBVHVCOVG2zQxrjweAvBxEx5XrCr6J
 9FseJhjWU8hU+Ra1kOv9qtLf348mLjnLPsuMaXw=
X-Google-Smtp-Source: ABdhPJzKGRYgqpr+9cz3Q74NoY3jG8toy/e9Rt6AOpX9QHNPs+I2y7L9ikBZUu1GNvFqq1njb4EKG9NdktrkvXJEm78=
X-Received: by 2002:a6b:fb0c:: with SMTP id h12mr6197002iog.98.1599732666180; 
 Thu, 10 Sep 2020 03:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200910091340.8654-1-david@redhat.com>
 <20200910091340.8654-6-david@redhat.com>
In-Reply-To: <20200910091340.8654-6-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 10 Sep 2020 12:10:54 +0200
Message-ID: <CAM9Jb+jQP+n-bCxYHTwOFQm-+D3VZj+MhqmUMnu9xVoxs2a4VA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] virtio-mem: try to merge system ram resources
To: David Hildenbrand <david@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, 
 Linux MM <linux-mm@kvack.org>, linux-hyperv@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org, 
 linux-nvdimm <linux-nvdimm@lists.01.org>, linux-s390@vger.kernel.org, 
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, 
 Dan Williams <dan.j.williams@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Baoquan He <bhe@redhat.com>, 
 Wei Yang <richardw.yang@linux.intel.com>
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

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

