Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2527319D1C8
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 10:06:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKHLT-0005Q5-4b; Fri, 03 Apr 2020 08:06:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKHLS-0005Q0-1G
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 08:06:30 +0000
X-Inumbo-ID: 051daaf4-7582-11ea-bcc1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 051daaf4-7582-11ea-bcc1-12813bfff9fa;
 Fri, 03 Apr 2020 08:06:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3A14BAC2C;
 Fri,  3 Apr 2020 08:06:27 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] x86/cpuidle: Cannon Lake adjustments
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <e39d4326-57d1-a4b5-3081-76b5160644ae@suse.com>
 <afe81b7e-4895-89ee-49dd-b6c0130923a1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8813266d-cb33-0bb7-16d1-d1bf54142d2b@suse.com>
Date: Fri, 3 Apr 2020 10:06:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <afe81b7e-4895-89ee-49dd-b6c0130923a1@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

On 02.04.2020 16:58, Andrew Cooper wrote:
> On 02/04/2020 09:22, Jan Beulich wrote:
>> As requested in reply to v1, this is now a pair of patches with
>> the expectation that only patch 1 would be acked and go in.
>>
>> 1: drop Cannon Lake support
>> 2: support Cannon Lake (again)
> 
> Dropping Cannon Lake support is only of any incremental benefit if we
> drop it from everywhere, and I didn't mean to block this single patch on it.

How would dropping it from everywhere in one go be any better?
I would see a benefit then only if we added code to refuse
booting there.

> Consider either A-by.

I'm sorry to ask, but "either" here is unclear to me: Do you
mean both of the above, or "the first one here or the original
v1 one"? I don't see a point committing this in two pieces, if
the combination of both is fine by you as well.

> However, it would be helpful to consider what we could do for better
> KCONFIG-able CPU support.

Yes, sure. Future work.

> Some downstreams have a separate build for each platform, and some go as
> far as cramming Xen into the boot SPI ROM, so space saving is a very
> important aspect.

Yes.

> On a different front, being able to compile out support for CPUs without
> VMX unrestricted mode, or without CMPXCHG16B would be helpful.

Yes.

> I would certainly like to get CONFIG_{INTEL,AMD} usable even if only so
> randconfig can help keep our interfaces clean.

And yes again.

Jan

