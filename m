Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E424E2D7264
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 09:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50224.88805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kneGY-00050o-9l; Fri, 11 Dec 2020 08:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50224.88805; Fri, 11 Dec 2020 08:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kneGY-00050P-62; Fri, 11 Dec 2020 08:59:06 +0000
Received: by outflank-mailman (input) for mailman id 50224;
 Fri, 11 Dec 2020 08:59:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9HZb=FP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kneGW-0004zc-KT
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 08:59:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbc167af-a1d5-4605-9898-55368be07aab;
 Fri, 11 Dec 2020 08:58:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20D7AACBD;
 Fri, 11 Dec 2020 08:58:55 +0000 (UTC)
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
X-Inumbo-ID: dbc167af-a1d5-4605-9898-55368be07aab
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607677135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPnSiuGj9ULrNN2R6pZ+vGFndCcen1k29TTiIOfk5s0=;
	b=YIqKRN5LcOeGyyMkGW22KyiSgKQ+ZGMbaZKUlN2aq15eiP2w8ujsFIedeFm0PMIkItukNY
	ERbH2HjfuoVlbcwv5wJefGtbJ8HwwBroo6xQ6J6Jts6jI71Q8LWRBmP9GI0BUMb/nSZ7vg
	RlsbgQq8Ah8COmXvA1CfE2xOatEwGuo=
Subject: Re: dom0 PV looping on search_pre_exception_table()
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
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
Message-ID: <2c345ef9-1f05-f883-d294-7ac1b3851f08@suse.com>
Date: Fri, 11 Dec 2020 09:58:54 +0100
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

Could you please revert 9ff970564764 ("x86/mm: drop guest_get_eff_l1e()")?
I think there was a thinko there in that the change can't be split from
the bigger one which was part of the originally planned set for XSA-286.
We mustn't avoid the switching of page tables as long as
guest_get_eff{,_kern}_l1e() makes use of the linear page tables.

Jan

