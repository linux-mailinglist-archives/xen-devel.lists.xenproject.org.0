Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAC51E1ACD
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 07:49:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdSRe-0007aE-7f; Tue, 26 May 2020 05:48:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdSRd-0007a9-I9
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 05:48:09 +0000
X-Inumbo-ID: 78cfd92a-9f14-11ea-af6e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78cfd92a-9f14-11ea-af6e-12813bfff9fa;
 Tue, 26 May 2020 05:48:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8C2C6ACED;
 Tue, 26 May 2020 05:48:08 +0000 (UTC)
Subject: Re: [PATCH] x86: avoid HPET use also on certain Coffee Lake H
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <26a90632-bb76-a24b-aef1-4c068b610c6a@suse.com>
 <de2ca5b7-5fe1-27e5-b6e6-08e695258f1f@suse.com>
 <5f5483cc-a8e8-51a3-6c47-5b061ff97108@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6fdaf1fc-8c3d-fff9-fb65-174caad5afeb@suse.com>
Date: Tue, 26 May 2020 07:47:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5f5483cc-a8e8-51a3-6c47-5b061ff97108@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.05.2020 19:30, Andrew Cooper wrote:
> On 25/05/2020 16:23, Jan Beulich wrote:
>> On 25.05.2020 17:18, Jan Beulich wrote:
>>> Linux commit f8edbde885bbcab6a2b4a1b5ca614e6ccb807577 says
>>>
>>> "Coffee Lake H SoC has similar behavior as Coffee Lake, skewed HPET
>>>  timer once the SoCs entered PC10."
>>>
>>> Again follow this for Xen as well, noting though that even the
>>> pre-existing PCI ID refers to a H-processor line variant (the 6-core
>>> one). It is also suspicious that the datasheet names 0x3e10 for the
>>> 4-core variant, while the Linux commit specifies 0x3e20, which I haven't
>>> been able to locate in any datasheet yet.
> 
> 3e20 is the host bridge ID for CFL-R (Gen 9) Core i9 (8c/16t) as found
> in the Dell XPS 15 7590 amongst other things.
> 
> As such, it is a generation later than CFL.

Ah, and I should have checked again before submitting - the pretty new
rev 003 datasheet actually includes all three IDs now. I've adjusted
description and code comments accordingly.

>>>  To be on the safe side, add
>>> both until clarification can be provided by Intel.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Given the nature of issue (a power efficiently "feature" rather than a
> bug), it will likely affect everything in a couple of generations worth
> of CPUs.
> 
> The issue may not actually affect Xen yet, because I don't expect we've
> got S0ix working yet.  It is only a problem on entry to S0i2/3 where the
> HPET is halted.

While looking into this a while ago I cam across this as well, but I
couldn't deduce whether entering PC10 is indeed possible _only_ this
way.

Jan

