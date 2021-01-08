Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04452EF198
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 12:49:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63383.112554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxqGO-0004Ow-NN; Fri, 08 Jan 2021 11:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63383.112554; Fri, 08 Jan 2021 11:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxqGO-0004OW-K6; Fri, 08 Jan 2021 11:49:04 +0000
Received: by outflank-mailman (input) for mailman id 63383;
 Fri, 08 Jan 2021 11:49:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BSv=GL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kxqGN-0004OR-9T
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 11:49:03 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5eb6b7e9-8114-475a-b90d-f917b7000d9e;
 Fri, 08 Jan 2021 11:49:01 +0000 (UTC)
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
X-Inumbo-ID: 5eb6b7e9-8114-475a-b90d-f917b7000d9e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610106541;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Lw6xJ3EOe4yQkU7OSIPaWEoWlssyzYqe0dZa3g0POvY=;
  b=akZKc36v9FPN8edQ5y1EMaFIZfZSG2qeck4eVDQGhLjpx2kFBKIvixjl
   2G+wO7aO/yRgtse62E9QJX6xP77uHrKGFOAwWBK08+YkUMsgbra/J9oDE
   aIJxu53iodYyEki8i4UwTktLSxUp+9WP/bV1e0r39Yzd8TM/W429oFxvw
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: r0FpoxFVuciz0f6luJDqK66WXPnXt9hGejPRELKPA5g3/YwSUxMN4N+t9ano1cUvzj+HDKi0+J
 97dRV+epAyLx2fFHauWyI5xzNaOrgIQXNsKAobx+2e5LXMXc/l24WTCUALntaW3jT5NEk7yVoU
 /0GD0/dKGVCSux+hx18HCpeSnJjYCFU9Xk+0893NAz3UpsRXo0k1gkVISZul5aWSJggrWbTs9V
 tgSuYdFfaATM+NSChL2oZEbNkjIRgU0R35orGv7+0nTdE9Y0FWsuBSLqCAmC8P4DkswWs4OxHe
 qLY=
X-SBRS: 5.2
X-MesageID: 35058485
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,330,1602561600"; 
   d="scan'208";a="35058485"
Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <iwj@xenproject.org>, <anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <roger.pau@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <009d01d6e598$bfdd0110$3f970330$@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <fdd4cabd-f538-3b00-7ffb-4b4a9aedeb69@citrix.com>
Date: Fri, 8 Jan 2021 11:48:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <009d01d6e598$bfdd0110$3f970330$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/01/2021 08:32, Paul Durrant wrote:
>> -----Original Message-----
>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>> Sent: 08 January 2021 00:47
>> To: xen-devel@lists.xenproject.org
>> Cc: paul@xen.org; wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com;
>> andrew.cooper3@citrix.com; george.dunlap@citrix.com; jbeulich@suse.com; julien@xen.org;
>> sstabellini@kernel.org; roger.pau@citrix.com; Igor Druzhinin <igor.druzhinin@citrix.com>
>> Subject: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
>>
>> TLFS 7.8.1 stipulates that "a virtual processor index must be less than
>> the maximum number of virtual processors per partition" that "can be obtained
>> through CPUID leaf 0x40000005". Furthermore, "Requirements for Implementing
>> the Microsoft Hypervisor Interface" defines that starting from Windows Server
>> 2012, which allowed more than 64 CPUs to be brought up, this leaf can now
>> contain a value -1 basically assuming the hypervisor has no restriction while
>> 0 (that we currently expose) means the default restriction is still present.
>>
>> Along with previous changes exposing ExProcessorMasks this allows a recent
>> Windows VM with Viridian extension enabled to have more than 64 vCPUs without
>> going into immediate BSOD.
>>
> 
> This is very odd as I was happily testing with a 128 vCPU VM once ExProcessorMasks was implemented... no need for the extra leaf.
> The documentation for 0x40000005 states " Describes the scale limits supported in the current hypervisor implementation. If any
> value is zero, the hypervisor does not expose the corresponding information". It does not say (in section 7.8.1 or elsewhere AFAICT)
> what implications that has for VP_INDEX.

The text says that VP_INDEX "must" be below that limit - that is clear enough
for me.

I admit I have not tested with ExProssorMasks exposed but I disabled TLB flush
and IPI extensions before that - Windows is mysterious in it's handling of
this logic. Let me align all of the changes and perform some clean cut testing.

> In " Requirements for Implementing the Microsoft Hypervisor Interface" I don't see anything saying what the semantics of not
> implementing leaf 0x40000005 are, only that if implementing it then -1 must be used to break the 64 VP limit.

Yes, that's exactly the info this change is based on.

> It also says that
> reporting -1 in 0x40000005 means that 40000004.EAX bits 1 and 2 *must* be clear, which is clearly not true if ExProcessorMasks is
> enabled. That document is dated June 13th 2012 so I think it should be taken with a pinch of salt.

True - I assumed that for them to work ExProcessorMasks is necessary then.

Igor

