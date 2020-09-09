Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2E6262DC0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 13:24:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFyD9-0001wm-Ij; Wed, 09 Sep 2020 11:24:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jAoN=CS=ellerman.id.au=mpe@srs-us1.protection.inumbo.net>)
 id 1kFyD8-0001we-B4
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 11:24:22 +0000
X-Inumbo-ID: e5c816e0-621d-4f77-8d82-3277b4e159c1
Received: from ozlabs.org (unknown [2401:3900:2:1::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5c816e0-621d-4f77-8d82-3277b4e159c1;
 Wed, 09 Sep 2020 11:24:17 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmfmN3SGmz9sTd;
 Wed,  9 Sep 2020 21:24:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599650649;
 bh=McxY0vGyvNVlrIIx6KzYtU4PcHnFzd9G9dek0Ykf36c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SmXDZKzAAkIskfZPfi7qrbi2STOAaRgkLgLUwpRIri563PnPrs5blw/OlSwl2MX5i
 69HKj9JHLONl1Qz3CbYvZy/4cbddpiJHmROqXSbmg8WJh+BTuQXH9dKNRHILZpAo1t
 hze5cgR0ZcFpNy/5f5QSzsCR/ywLKY3MFV1MB2evwZ2HPd+YxWui6TnWbMXUjz3bFE
 Dflejkj7ciOj6dUGOWs0UizA/kfuOX43D8JH9M1T139ttlnt9G8+OPWPLzwt3iVOxx
 uuXIzjXH4T67FDy3bvc2QCqjoeC0dD5axnVjQL4imxfeD2KhwwbuLyb1WJFKSm2qYS
 /CHKbJLh3kYdA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Wei Liu <wei.liu@kernel.org>, Michal Hocko
 <mhocko@suse.com>, Dan Williams <dan.j.williams@intel.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Baoquan He <bhe@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown
 <lenb@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang
 <dave.jiang@intel.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang
 Zhang <haiyangz@microsoft.com>, Stephen Hemminger
 <sthemmin@microsoft.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oliver O'Halloran <oohall@gmail.com>, Pingfan
 Liu <kernelfans@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>, Libor
 Pechacek <lpechacek@suse.cz>, Anton Blanchard <anton@ozlabs.org>, Leonardo
 Bras <leobras.c@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 3/7] mm/memory_hotplug: prepare passing flags to
 add_memory() and friends
In-Reply-To: <3bc5b464-3229-d442-714a-ec33b5728ac6@redhat.com>
References: <20200908201012.44168-1-david@redhat.com>
 <20200908201012.44168-4-david@redhat.com> <20200909071759.GD435421@kroah.com>
 <3bc5b464-3229-d442-714a-ec33b5728ac6@redhat.com>
Date: Wed, 09 Sep 2020 21:24:02 +1000
Message-ID: <87eenbry5p.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

David Hildenbrand <david@redhat.com> writes:
> On 09.09.20 09:17, Greg Kroah-Hartman wrote:
>> On Tue, Sep 08, 2020 at 10:10:08PM +0200, David Hildenbrand wrote:
>>> We soon want to pass flags, e.g., to mark added System RAM resources.
>>> mergeable. Prepare for that.
>> 
>> What are these random "flags", and how do we know what should be passed
>> to them?
>> 
>> Why not make this an enumerated type so that we know it all works
>> properly, like the GPF_* flags are?  Passing around a random unsigned
>> long feels very odd/broken...
>
> Agreed, an enum (mhp_flags) seems to give a better hint what can
> actually be passed. Thanks!

You probably know this but ...

Just using a C enum doesn't get you any type safety.

You can get some checking via sparse by using __bitwise, which is what
gfp_t does. You don't actually have to use an enum for that, it works
with #defines also.

Or you can wrap the flag in a struct, the way atomic_t does, and then
the compiler will prevent passing plain integers in place of your custom
type.

cheers

