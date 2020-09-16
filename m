Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF4626C9DA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 21:32:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kId9Q-0005rK-2N; Wed, 16 Sep 2020 19:31:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=44SI=CZ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1kId9O-0005rF-RA
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 19:31:31 +0000
X-Inumbo-ID: 50109be4-36b9-49f4-b37a-fb235aadedd8
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 50109be4-36b9-49f4-b37a-fb235aadedd8;
 Wed, 16 Sep 2020 19:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600284689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMsSlQUnIzmWDNnPzcTOyEQmBqnfWVBVNUaHl4+/lPY=;
 b=i/4kg5V3H11zCN3p9/pN+9XJeRuyAabrfIB0bX7skS6c3JEWTINxCXTspktq5/oVwwvy70
 sio1OD3wYr0MfR36UmCYj1+ntOvme9PBiwQ2IJ7Epx4qcHpTiRHQeNdyGQ/9CtOB8v4krW
 pAArM0LH65HWDl/3LVnCyShFD/ZLESw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-RJvmQkdDMYquIHxdCzcb5A-1; Wed, 16 Sep 2020 15:31:25 -0400
X-MC-Unique: RJvmQkdDMYquIHxdCzcb5A-1
Received: by mail-ej1-f72.google.com with SMTP id f17so3379191ejq.5
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2020 12:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=H30dbXoNbzsTkPGiKpd2XjhJWXqjtA7dGp0dwpbyBQA=;
 b=SBjCIfIkT/7LFkqMPnuii8iwvLvyYeTrxDYgK8+zyZjAxTAOwyCNaO4qLurdjl11wt
 ecsVPrroscwmuTYaoPiUCe/ZJFf2wqnY8i/6qexNfqcl37WnByBvz+e5Bk9iwQlWC2O5
 3+bex/Y/Ee2TiEmEYtSRP5jKApmQG2nlVV0sX2BrSAO3bfXbbS7dtXC+aDlOkvpuQKWD
 1I3dw6ggHpJvtUaM3XPgvSb5oJnVtrP4ZUj6xn5hRujDG4u2qASW4KegJzkUc6zYOMET
 9xL709I5M7JBWrMwAkLZRGTh7nx7GV3qo9oJterIeyTyHwHOkl0md3kLhtWcmWOAcS1j
 aB1A==
X-Gm-Message-State: AOAM531nnFzrnOfcI3WMQVYxGRz4hYtgjcoKMXtnyzqMiB8KDQLkcw3N
 /w5/GqbqrA/53WAtrPIfRKnYPhoK/0S030gthseUVSPaW6QBee5FQxin8c/r0glEDg40ywbD8iU
 0O73dSoxG7i7UeEH4y2QK12rCwQM=
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr30417835eds.366.1600284684124; 
 Wed, 16 Sep 2020 12:31:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNf5C6IgWA4C90hz+1DV+boU+avbJN14GYmBM3jetRxVAOiNjdDaQK6JfCvz8qKCYsfBo/YA==
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr30417797eds.366.1600284683833; 
 Wed, 16 Sep 2020 12:31:23 -0700 (PDT)
Received: from [192.168.3.122] (p4ff23c30.dip0.t-ipconnect.de. [79.242.60.48])
 by smtp.gmail.com with ESMTPSA id
 k25sm13202917ejk.3.2020.09.16.12.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 12:31:23 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH RFC 0/4] mm: place pages to the freelist tail when onling
 and undoing isolation
Date: Wed, 16 Sep 2020 21:31:21 +0200
Message-Id: <DAC9E747-BDDF-41B6-A89B-604880DD7543@redhat.com>
References: <5c0910c2cd0d9d351e509392a45552fb@suse.de>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Vlastimil Babka <vbabka@suse.cz>, Wei Liu <wei.liu@kernel.org>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
In-Reply-To: <5c0910c2cd0d9d351e509392a45552fb@suse.de>
To: osalvador@suse.de
X-Mailer: iPhone Mail (17H35)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



> Am 16.09.2020 um 20:50 schrieb osalvador@suse.de:
>=20
> =EF=BB=BFOn 2020-09-16 20:34, David Hildenbrand wrote:
>> When adding separate memory blocks via add_memory*() and onlining them
>> immediately, the metadata (especially the memmap) of the next block will=
 be
>> placed onto one of the just added+onlined block. This creates a chain
>> of unmovable allocations: If the last memory block cannot get
>> offlined+removed() so will all dependant ones. We directly have unmovabl=
e
>> allocations all over the place.
>> This can be observed quite easily using virtio-mem, however, it can also
>> be observed when using DIMMs. The freshly onlined pages will usually be
>> placed to the head of the freelists, meaning they will be allocated next=
,
>> turning the just-added memory usually immediately un-removable. The
>> fresh pages are cold, prefering to allocate others (that might be hot)
>> also feels to be the natural thing to do.
>> It also applies to the hyper-v balloon xen-balloon, and ppc64 dlpar: whe=
n
>> adding separate, successive memory blocks, each memory block will have
>> unmovable allocations on them - for example gigantic pages will fail to
>> allocate.
>> While the ZONE_NORMAL doesn't provide any guarantees that memory can get
>> offlined+removed again (any kind of fragmentation with unmovable
>> allocations is possible), there are many scenarios (hotplugging a lot of
>> memory, running workload, hotunplug some memory/as much as possible) whe=
re
>> we can offline+remove quite a lot with this patchset.
>=20
> Hi David,
>=20

Hi Oscar.

> I did not read through the patchset yet, so sorry if the question is nons=
ense, but is this not trying to fix the same issue the vmemmap patches did?=
 [1]

Not nonesense at all. It only helps to some degree, though. It solves the d=
ependencies due to the memmap. However, it=E2=80=98s not completely ideal, =
especially for single memory blocks.

With single memory blocks (virtio-mem, xen-balloon, hv balloon, ppc dlpar) =
you still have unmovable (vmemmap chunks) all over the physical address spa=
ce. Consider the gigantic page example after hotplug. You directly fragment=
ed all hotplugged memory.

Of course, there might be (less extreme) dependencies due page tables for t=
he identity mapping, extended struct pages and similar.

Having that said, there are other benefits when preferring other memory ove=
r just hotplugged memory. Think about adding+onlining memory during boot (d=
imms under QEMU, virtio-mem), once the system is up you will have most (all=
) of that memory completely untouched.

So while vmemmap on hotplugged memory would tackle some part of the issue, =
there are cases where this approach is better, and there are even benefits =
when combining both.

Thanks!

David

>=20
> I was about to give it a new respin now that thw hwpoison stuff has been =
settled.
>=20
> [1] https://patchwork.kernel.org/cover/11059175/
>=20


