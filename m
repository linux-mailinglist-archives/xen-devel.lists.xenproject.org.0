Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97DD1BE425
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 18:42:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTpmb-0005Rt-FW; Wed, 29 Apr 2020 16:42:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7tx0=6N=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1jTpmZ-0005Ro-ON
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 16:41:59 +0000
X-Inumbo-ID: 57f8d71a-8a38-11ea-b07b-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57f8d71a-8a38-11ea-b07b-bc764e2007e4;
 Wed, 29 Apr 2020 16:41:59 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id e26so2772630wmk.5
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2020 09:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b1NmnG+Bha+R6DCsicsXkjR18of0wt/SYtjmCqwDrqU=;
 b=ByMUSrur6ph09MPg67mnA/w3gvsZAN4fqFrrccbWGrJn9CygTcsy2RyBFxs71jUdf8
 b5Qp4+vKbEW9Y/HFn9F8MWUEaXDjacqh4BUOc6eNPq9lM4U/dycOv4OQIZaJ7PuvbS51
 LyWeE2vr0pqxFDRB+3/fN/W2jVxpmUpNMAkvAuAmGf7nbyzwBSqoDF/ihDAQ5OArHyoH
 n6CpYLsGD5S0mfJoMB3HpofGmft3UzxKt19LJZapdTJ3empXGO2aAdEPkH1ejcxEeFsz
 CbKsERjvsMIXv2WG1wpqBJ1qcnINLcqHS2RagZytfEZMDNUjGjJdL0VpI/1So31J8+uR
 MFsg==
X-Gm-Message-State: AGi0PuY94vbXo4LiPLEIIM0Goq5kADKYknv0yHklXFcTTiVfK1V78fGw
 etsKBr5AsBRIdYqWER04nNA=
X-Google-Smtp-Source: APiQypK92COmCk6jtDXQuM8RbqIzlQmTZkmvIjtD7/GMtqebIJTWbJ+7ip3K+A9bRbw+AFyvMNQEDw==
X-Received: by 2002:a1c:2383:: with SMTP id j125mr4175112wmj.6.1588178518352; 
 Wed, 29 Apr 2020 09:41:58 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id i25sm8360761wml.43.2020.04.29.09.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 09:41:57 -0700 (PDT)
Date: Wed, 29 Apr 2020 16:41:55 +0000
From: Wei Liu <wei.liu@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/3] mm/memory_hotplug: Prepare passing flags to
 add_memory() and friends
Message-ID: <20200429164154.ctflq4ouwrwwe4wq@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200429160803.109056-1-david@redhat.com>
 <20200429160803.109056-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429160803.109056-2-david@redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason Wang <jasowang@redhat.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Pingfan Liu <kernelfans@gmail.com>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, virtio-dev@lists.oasis-open.org,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 linux-acpi@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>,
 Nathan Lynch <nathanl@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Leonardo Bras <leobras.c@gmail.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Eric Biederman <ebiederm@xmission.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 29, 2020 at 06:08:01PM +0200, David Hildenbrand wrote:
> We soon want to pass flags - prepare for that.
> 
> This patch is based on a similar patch by Oscar Salvador:
> 
> https://lkml.kernel.org/r/20190625075227.15193-3-osalvador@suse.de
> 
[...]
> ---
>  drivers/hv/hv_balloon.c                         |  2 +-

> diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
> index 32e3bc0aa665..0194bed1a573 100644
> --- a/drivers/hv/hv_balloon.c
> +++ b/drivers/hv/hv_balloon.c
> @@ -726,7 +726,7 @@ static void hv_mem_hot_add(unsigned long start, unsigned long size,
>  
>  		nid = memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
>  		ret = add_memory(nid, PFN_PHYS((start_pfn)),
> -				(HA_CHUNK << PAGE_SHIFT));
> +				(HA_CHUNK << PAGE_SHIFT), 0);
>  
>  		if (ret) {
>  			pr_err("hot_add memory failed error is %d\n", ret);

Acked-by: Wei Liu <wei.liu@kernel.org>

