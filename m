Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE81C39BE
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 14:45:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVaSx-0000xm-HU; Mon, 04 May 2020 12:44:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iI9=6S=gmail.com=tcminyard@srs-us1.protection.inumbo.net>)
 id 1jVaSw-0000xZ-2B
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 12:44:58 +0000
X-Inumbo-ID: 0f4785cc-8e05-11ea-b07b-bc764e2007e4
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f4785cc-8e05-11ea-b07b-bc764e2007e4;
 Mon, 04 May 2020 12:44:57 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id j4so8676515otr.11
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2020 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yKN6Orp+qv0eDJWOFRBgwbnE7XXmJgLTrkQ1xQ02x5A=;
 b=uXSbf6BiNG1Gcm+nuKiWEP/RxvwTQWMrIgdTL3kKjBDv8WE6ros7gvZfE9zL2USjsG
 0BkUWsY2P5FhaXwpZ6OcsaW7d4Ln9QAyETxkr73sUFDF2fWHHTCVNRUjqYYTUZD6G9XB
 WuhCehuchlG4DHONe0wEDwKbIBudTpcNdjJZ/z2MxB7O3y2ZDMz5gCuQ84hgihZZN7Bu
 0fruxYSpSrsaLTtqcd8cP5mTCMiq9mjCqmLqz3skh1Jvc0t53/COVbdHc+9NyxVf2oUO
 0Oz2D48RKabl6U3QfWLIqCXers6EhjFdijSQt0ytAMinx9ZzsD70J3+a2Kw+9zavg9PG
 ESHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=yKN6Orp+qv0eDJWOFRBgwbnE7XXmJgLTrkQ1xQ02x5A=;
 b=b0kSQj6Cc/0/O+UOPNq6zGgfMutAKewVEFnS5q6umsGzPWWhPYeKF6ntD477nvgj8/
 6g6RKQYdPMIqbXsaOQvln8ijBk4JdNX3lcjeXKn4Du63UNnzKwm7wKgR+PVc5rgi+nAo
 M1EZzGdkydcYsbzikvC13nue3xN7Boe5CqZz1UvLt+ASA0aI1Y17YKf0p2P9TuJc+LwD
 SNMX5Jui+kBp0DXVWNI37GJnomBWQ8kbWCKHr9zcNGiXJsn2Ll2oTCDZFzibOB9egJgk
 or5CYqzHp6bLHVUVmW+kCoFjqVeFmIKYKRP6FUoPAA/PsN1Ie/r4HNt/sE2MoIS01RPh
 p5Yw==
X-Gm-Message-State: AGi0PuYZTYyp6eis0JHNNX0PPPZaRllGINm6fv3enmaMl4BfzeVAE6c4
 oCJAiCc17R5Ck4cpX7wmug==
X-Google-Smtp-Source: APiQypIOqTOQMS4dBVAstFsVtlfi1AFsQvXTSS8ZJ2tZdhq7OyDzQ+epAuX1MH4cO3IUn/1d+HhhrA==
X-Received: by 2002:a05:6830:1bd4:: with SMTP id
 v20mr12996393ota.353.1588596296537; 
 Mon, 04 May 2020 05:44:56 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id u197sm2382367oie.7.2020.05.04.05.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 05:44:55 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
 by serve.minyard.net (Postfix) with ESMTPSA id A6F3E180042;
 Mon,  4 May 2020 12:44:54 +0000 (UTC)
Date: Mon, 4 May 2020 07:44:53 -0500
From: Corey Minyard <minyard@acm.org>
To: Julien Grall <julien@xen.org>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
Message-ID: <20200504124453.GI9902@minyard.net>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <20200501114201.GE9902@minyard.net>
 <CAMmSBy_h9=5cjMv3+-BKHYhBikgna731DoA+t-8FK-2tbPUH-A@mail.gmail.com>
 <20200502021647.GG9902@minyard.net>
 <4f6ef562-e213-8952-66d6-0f083bf8c593@xen.org>
 <20200502173529.GH9902@minyard.net>
 <ed02b555-dbaa-2ebf-d09f-0474e1a7a745@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed02b555-dbaa-2ebf-d09f-0474e1a7a745@xen.org>
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
Reply-To: minyard@acm.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Roman Shaposhnik <roman@zededa.com>, jeff.kubascik@dornerworks.com,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, May 02, 2020 at 06:48:27PM +0100, Julien Grall wrote:
> 
> 
> On 02/05/2020 18:35, Corey Minyard wrote:
> > On Sat, May 02, 2020 at 12:46:14PM +0100, Julien Grall wrote:
> > No.  If I am understanding this correctly, all the memory in dom0 below
> > 1GB would have to be physically below 1GB.
> 
> Well, dom0 is directly mapped. In other word, dom0 physical address == host
> physical address. So if we allocate memory below 1GB in Xen, then it will
> mapped below 1GB on dom0 as well.
> 
> The patch I suggested would try to allocate as much as possible memory below
> 1GB. I believe this should do the trick for you here.

Yes, that does seem to do the trick:

root@raspberrypi4-64-xen:~# xl info
host                   : raspberrypi4-64-xen
release                : 4.19.115-v8
version                : #1 SMP PREEMPT Thu Apr 16 13:53:57 UTC 2020
machine                : aarch64
nr_cpus                : 4
max_cpu_id             : 3
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 54.000
hw_caps                : 00000000:00000000:00000000:00000000:00000000:00000000:00000000:00000000
virt_caps              : hvm hap
total_memory           : 3956
free_memory            : 3634
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 13
xen_extra              : .0
xen_version            : 4.13.0
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=0x200000
xen_changeset          : Tue Dec 17 14:19:49 2019 +0000 git:a2e84d8e42-dirty
xen_commandline        : console=dtuart dtuart=/soc/serial@7e215040 sync_console dom0_mem=256M bootscrub=0
cc_compiler            : aarch64-montavista-linux-gcc (GCC) 9.3.0
cc_compile_by          : xen-4.13+gitAUT
cc_compile_domain      : mvista-cgx
cc_compile_date        : 2019-12-17
build_id               : b0e9b4af9d83f67953e1640976f0720452a88f6a
xend_config_format     : 4

Thanks for the fix.

-corey

> 
> Cheers,
> 
> -- 
> Julien Grall

