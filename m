Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F832D5976
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 12:43:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49112.86846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knKLr-0001Bk-I9; Thu, 10 Dec 2020 11:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49112.86846; Thu, 10 Dec 2020 11:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knKLr-0001BI-Es; Thu, 10 Dec 2020 11:43:15 +0000
Received: by outflank-mailman (input) for mailman id 49112;
 Thu, 10 Dec 2020 11:43:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wUnW=FO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1knKLq-0001BD-Hb
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 11:43:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47aa3161-e3fd-4813-bf34-523b5cf023db;
 Thu, 10 Dec 2020 11:43:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB7F3ACE0;
 Thu, 10 Dec 2020 11:43:11 +0000 (UTC)
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
X-Inumbo-ID: 47aa3161-e3fd-4813-bf34-523b5cf023db
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607600592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rHv+vrHEFSnyiqfyOw9O5XBc5B+d/fjAEKvyLvCM0lM=;
	b=kQCIyifVts2rpvwOjc76Imytuj+L6BlkEke93rCarW/DCzlGbZujZM213j3JzrgnW+NQPR
	kfL85k548bNxIg7eGOwGtn1165K+KYLxQcudt4IeWwFdnwoc27KUA0jubuoxyuWheohUU9
	lvSsjJuVuozOIdqE2Q4KsiCEVcwWRPE=
Subject: Re: dom0 PV looping on search_pre_exception_table()
To: Manuel Bouyer <bouyer@antioche.eu.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20201209101512.GA1299@antioche.eu.org>
 <3f7e50bb-24ad-1e32-9ea1-ba87007d3796@citrix.com>
 <20201209135908.GA4269@antioche.eu.org>
 <c612616a-3fcd-be93-7594-20c0c3b71b7a@citrix.com>
 <20201209154431.GA4913@antioche.eu.org>
 <52e1b10d-75d4-63ac-f91e-cb8f0dcca493@citrix.com>
 <20201209163049.GA6158@antioche.eu.org>
 <30a71c9d-3eff-3727-9c61-e387b5bccc95@citrix.com>
 <20201209185714.GS1469@antioche.eu.org>
 <6c06abf1-7efe-f02c-536a-337a2704e265@citrix.com>
 <20201210095139.GA455@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <27f113f3-01a3-e5a4-eea5-e593693625fe@suse.com>
Date: Thu, 10 Dec 2020 11:41:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210095139.GA455@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.12.2020 10:51, Manuel Bouyer wrote:
> On Wed, Dec 09, 2020 at 07:08:41PM +0000, Andrew Cooper wrote:
>> Oh of course - we don't follow the exit-to-guest path on the way out here.
>>
>> As a gross hack to check that we've at least diagnosed the issue
>> appropriately, could you modify NetBSD to explicitly load the %ss
>> selector into %es (or any other free segment) before first entering user
>> context?
> 
> If I understood it properly, the user %ss is loaded by Xen from the
> trapframe when the guest swictes from kernel to user mode, isn't it ?
> So you mean setting %es to the same value in the trapframe ?
> 
> Actually I used %fs because %es is set equal to %ds.
> Xen 4.13 boots fine with this change, but with 4.15 I get a loop of:
> 
> 
> (XEN) *** LDT: gl1e 0000000000000000 not present                               
> (XEN) *** pv_map_ldt_shadow_page(0x40) failed                                  
> [  12.3586540] Process (pid 1) got sig 11                                      
> 
> which means that the dom0 gets the trap, and decides that the fault address
> is not mapped. Without the change the dom0 doesn't show the
> "Process (pid 1) got sig 11"
> 
> I activated the NetBSD trap debug code, and this shows:
> [   6.7165877] kern.module.path=/stand/amd64-xen/9.1/modules                    (XEN) *** LDT: gl1e 0000000000000000 not present                                
> (XEN) *** pv_map_ldt_shadow_page(0x40) failed                                   
> [   6.9462322] pid 1.1 (init): signal 11 code=1 (trap 0x6) @rip 0x7f7ef0c007d0 a
> ddr 0xffffbd800000a040 error=14
> [   7.0647896] trapframe 0xffffbd80381cff00
> [   7.1126288] rip 0x00007f7ef0c007d0  rsp 0x00007f7fff10aa30  rfl 0x00000000000
> 00202
> [   7.2041518] rdi 000000000000000000  rsi 000000000000000000  rdx 0000000000000
> 00000
> [   7.2956758] rcx 000000000000000000  r8  000000000000000000  r9  0000000000000
> 00000
> [   7.3872013] r10 000000000000000000  r11 000000000000000000  r12 0000000000000
> 00000
> [   7.4787216] r13 000000000000000000  r14 000000000000000000  r15 0000000000000
> 00000
> [   7.5702439] rbp 000000000000000000  rbx 0x00007f7fff10afe0  rax 0000000000000
> 00000
> [   7.6617663] cs 0x47  ds 0x23  es 0x23  fs 0000  gs 0000  ss 0x3f
> [   7.7345663] fsbase 000000000000000000 gsbase 000000000000000000
> 
> so it looks like something resets %fs to 0 ...
> 
> Anyway the fault address 0xffffbd800000a040 is in the hypervisor's range,
> isn't it ?

No, the hypervisor range is 0xffff800000000000-0xffff880000000000.

Jan

