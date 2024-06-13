Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E225390784F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 18:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740121.1147140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHnM4-0005Ip-Kc; Thu, 13 Jun 2024 16:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740121.1147140; Thu, 13 Jun 2024 16:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHnM4-0005H8-Ht; Thu, 13 Jun 2024 16:31:16 +0000
Received: by outflank-mailman (input) for mailman id 740121;
 Thu, 13 Jun 2024 16:31:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dc9R=NP=amazon.co.uk=prvs=88774d79b=eliasely@srs-se1.protection.inumbo.net>)
 id 1sHnM2-0005Gx-Iv
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 16:31:14 +0000
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com
 [52.119.213.152]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 585bbdf1-29a2-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 18:31:12 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-52003.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 16:31:11 +0000
Received: from EX19MTAEUC001.ant.amazon.com [10.0.10.100:46197]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.47.146:2525]
 with esmtp (Farcaster)
 id 8100c6ab-c6a2-4d88-8eb8-fc882871ded1; Thu, 13 Jun 2024 16:31:09 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 13 Jun 2024 16:31:08 +0000
Received: from [10.95.132.234] (10.95.132.234) by
 EX19D018EUA002.ant.amazon.com (10.252.50.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 13 Jun 2024 16:31:05 +0000
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
X-Inumbo-ID: 585bbdf1-29a2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1718296273; x=1749832273;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EOs3UZ4vIwDq2rjD+Isyyo91v0ijB9Y4SztO4w/VQ7o=;
  b=ZAQsFGnIlhyaLsjRJdf0+2rxSKbN8W1kIs6fvChL6KQpqq1MKAm80QIR
   ryvQ/8qphBWyKCLE0gVxkCXPwDHseL8prARG4iXhskbOnE0fGdxFj6Vlo
   rFNktWqv3RVu3T9EXYW09yUyOmUfN27bZhXTO5xo4iyzlnNuRc64PW5Rr
   s=;
X-IronPort-AV: E=Sophos;i="6.08,235,1712620800"; 
   d="scan'208";a="4786701"
X-Farcaster-Flow-ID: 8100c6ab-c6a2-4d88-8eb8-fc882871ded1
Message-ID: <1ad9ccce-c02b-46c0-8fea-10b35b574cb8@amazon.com>
Date: Thu, 13 Jun 2024 17:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 01/19] x86: Create per-domain mapping of
 guest_root_pt
To: Jan Beulich <jbeulich@suse.com>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<jgrall@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-2-eliasely@amazon.com>
 <dd145c67-8e3e-4b15-94f7-c7cd1f127d45@suse.com>
 <bda3386e-26c5-4efd-b7ad-00f3643523fa@amazon.com>
 <b50d0a83-fab4-4f59-bf4d-5c5593923f34@suse.com>
Content-Language: en-US
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <b50d0a83-fab4-4f59-bf4d-5c5593923f34@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.95.132.234]
X-ClientProxiedBy: EX19D039UWA004.ant.amazon.com (10.13.139.68) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)

Hi Jan,

On 16/05/2024 08:17, Jan Beulich wrote:
> On 15.05.2024 20:25, Elias El Yandouzi wrote:
>> However, I noticed quite a weird bug while doing some testing. I may
>> need your expertise to find the root cause.
> 
> Looks like you've overflowed the dom0 kernel stack, most likely because
> of recurring nested exceptions.
> 
>> In the case where I have more vCPUs than pCPUs (and let's consider we
>> have one pCPU for two vCPUs), I noticed that I would always get a page
>> fault in dom0 kernel (5.10.0-13-amd64) at the exact same location. I did
>> a bit of investigation but I couldn't come to a clear conclusion.
>> Looking at the stack trace [1], I have the feeling the crash occurs in a
>> loop or a recursive call.
>>
>> I tried to identify where the crash occurred using addr2line:
>>
>>   > addr2line -e vmlinux-5.10.0-29-amd64 0xffffffff810218a0
>> debian/build/build_amd64_none_amd64/arch/x86/xen/mmu_pv.c:880
>>
>> It turns out to point on the closing bracket of the function
>> xen_mm_unpin_all()[2].
>>
>> I thought the crash could happen while returning from the function in
>> the assembly epilogue but the output of objdump doesn't even show the
>> address.
>>
>> The only theory I could think of was that because we only have one pCPU,
>> we may never execute one of the two vCPUs, and never setup the mapping
>> to the guest_root_pt in write_ptbase(), hence the page fault. This is
>> just a random theory, I couldn't find any hint suggesting it would be
>> the case though. Any idea how I could debug this?
> 
> I guess you want to instrument Xen enough to catch the top level fault (or
> the 2nd from top, depending on where the nesting actually starts) to see
> why that happens. Quite likely some guest mapping isn't set up properly.
> 

Julien helped me with this one and I believe we have identified the 
problem.

As you've suggested, I wrote the mapping of the guest root PT in our 
per-domain section, root_pt_l1tab, within write_ptbase() function as 
we'd always be in the case v == current plus switch_cr3_cr4() would 
always flush local tlb.

However, there exists a path, in toggle_guest_mode(), where we could 
call update_cr3()/make_cr3() without calling write_ptbase() and hence 
not maintain mappings properly. Instead toggle_guest_mode() has a partly 
open-coded version of write_ptbase().

Would you rather like to see the mappings written in make_cr3() or in 
toggle_guest_mode() within the pseudo open-coded version of write_ptbase()?

Elias


