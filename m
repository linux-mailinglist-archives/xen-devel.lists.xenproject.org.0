Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496038C6C1E
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 20:27:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722573.1126670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7JKC-0001nH-2g; Wed, 15 May 2024 18:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722573.1126670; Wed, 15 May 2024 18:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7JKC-0001kG-03; Wed, 15 May 2024 18:26:00 +0000
Received: by outflank-mailman (input) for mailman id 722573;
 Wed, 15 May 2024 18:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o41/=MS=amazon.co.uk=prvs=858ff6e72=eliasely@srs-se1.protection.inumbo.net>)
 id 1s7JKA-0001kA-Ca
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 18:25:58 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 909f8931-12e8-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 20:25:55 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-2101.iad2.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 18:25:52 +0000
Received: from EX19MTAEUB002.ant.amazon.com [10.0.43.254:12661]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.39.135:2525]
 with esmtp (Farcaster)
 id 89e6cdf7-ef88-4cc4-bee1-a023a310ff98; Wed, 15 May 2024 18:25:50 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 15 May 2024 18:25:47 +0000
Received: from [192.168.26.160] (10.106.82.11) by
 EX19D018EUA002.ant.amazon.com (10.252.50.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 15 May 2024 18:25:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 909f8931-12e8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715797556; x=1747333556;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=C4vQ91EDfpC1i/6V1M2/7OmUKz0oO4cYLUlwCL4b68Q=;
  b=OtVbTjsA7cZIcXl09rJeJhEz/d8hKwrOIzNEA1fSko3hTnYGr8+Kmme0
   VIyfFqb40PMR5VxbIJnMA40vjwd21Edl+HPcV82eZeMLOLvRE1frVJeNP
   nxjtvs6HHLBQpVY93Uv6SuHQsyNDMA3VeDHXti3v5kbZmsFE/8QA3WUFz
   Y=;
X-IronPort-AV: E=Sophos;i="6.08,162,1712620800"; 
   d="scan'208";a="401391469"
X-Farcaster-Flow-ID: 89e6cdf7-ef88-4cc4-bee1-a023a310ff98
Message-ID: <bda3386e-26c5-4efd-b7ad-00f3643523fa@amazon.com>
Date: Wed, 15 May 2024 19:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 01/19] x86: Create per-domain mapping of
 guest_root_pt
To: <xen-devel@lists.xenproject.org>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-2-eliasely@amazon.com>
 <dd145c67-8e3e-4b15-94f7-c7cd1f127d45@suse.com>
Content-Language: en-US
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <dd145c67-8e3e-4b15-94f7-c7cd1f127d45@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.82.11]
X-ClientProxiedBy: EX19D039UWB003.ant.amazon.com (10.13.138.93) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)

Hi Jan,

On 14/05/2024 15:51, Jan Beulich wrote:
> On 13.05.2024 15:40, Elias El Yandouzi wrote:
>> From: Hongyan Xia <hongyxia@amazon.com>
>>
>> Create a per-domain mapping of PV guest_root_pt as direct map is being
>> removed.
>>
>> Note that we do not map and unmap root_pgt for now since it is still a
>> xenheap page.
>>
>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
>>
>> ----
>>      Changes in V3:
>>          * Rename SHADOW_ROOT
>>          * Haven't addressed the potentially over-allocation issue as I don't get it
> 
> I thought I had explained in enough detail that the GDT/LDT area needs
> quite a bit more space (2 times 64k per vCPU) than the root PT one (4k
> per vCPU). Thus while d->arch.pv.gdt_ldt_l1tab really needs to point at
> a full page (as long as not taking into account dynamic domain
> properties), d->arch.pv.root_pt_l1tab doesn't need to (and hence might
> better be allocated using xzalloc() / xzalloc_array(), even when also
> not taking into account dynamic domain properties, i.e. vCPU count).

I just understood your point and yes you're correct I was 
over-allocating... Sorry, it took me so long to get it.

I'll go instead with:

@@ -371,6 +396,12 @@ int pv_domain_initialise(struct domain *d)
          goto fail;
      clear_page(d->arch.pv.gdt_ldt_l1tab);

+    d->arch.pv.root_pt_l1tab =
+        xzalloc_array(l1_pgentry_t *,
+                      DIV_ROUND_UP(d->max_vcpus, L1_PAGETABLE_ENTRIES));
+    if ( !d->arch.pv.root_pt_l1tab )
+        goto fail;
+
      if ( levelling_caps & ~LCAP_faulting &&
           (d->arch.pv.cpuidmasks = xmemdup(&cpuidmask_defaults)) == NULL )
          goto fail;

However, I noticed quite a weird bug while doing some testing. I may 
need your expertise to find the root cause.

In the case where I have more vCPUs than pCPUs (and let's consider we 
have one pCPU for two vCPUs), I noticed that I would always get a page 
fault in dom0 kernel (5.10.0-13-amd64) at the exact same location. I did 
a bit of investigation but I couldn't come to a clear conclusion. 
Looking at the stack trace [1], I have the feeling the crash occurs in a 
loop or a recursive call.

I tried to identify where the crash occurred using addr2line:

 > addr2line -e vmlinux-5.10.0-29-amd64 0xffffffff810218a0
debian/build/build_amd64_none_amd64/arch/x86/xen/mmu_pv.c:880

It turns out to point on the closing bracket of the function 
xen_mm_unpin_all()[2].

I thought the crash could happen while returning from the function in 
the assembly epilogue but the output of objdump doesn't even show the 
address.

The only theory I could think of was that because we only have one pCPU, 
we may never execute one of the two vCPUs, and never setup the mapping 
to the guest_root_pt in write_ptbase(), hence the page fault. This is 
just a random theory, I couldn't find any hint suggesting it would be 
the case though. Any idea how I could debug this?

[1] https://pastebin.com/UaGRaV6a
[2] https://github.com/torvalds/linux/blob/v5.10/arch/x86/xen/mmu_pv.c#L880

Elias

