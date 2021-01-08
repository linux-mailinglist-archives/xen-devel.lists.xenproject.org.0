Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A119F2EF2FD
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 14:25:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63420.112602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxrli-0006Eo-2X; Fri, 08 Jan 2021 13:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63420.112602; Fri, 08 Jan 2021 13:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxrlh-0006EP-VW; Fri, 08 Jan 2021 13:25:29 +0000
Received: by outflank-mailman (input) for mailman id 63420;
 Fri, 08 Jan 2021 13:25:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BSv=GL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kxrlg-0006EK-7U
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 13:25:28 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78d9947a-8cd1-46c2-ad9f-96ff8fd17790;
 Fri, 08 Jan 2021 13:25:26 +0000 (UTC)
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
X-Inumbo-ID: 78d9947a-8cd1-46c2-ad9f-96ff8fd17790
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610112326;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=2Ddpax/DOAl7mHcYdbsvUkKnmu8afYKJGQS4YRT8cGM=;
  b=WngSVxSzkppwpI7fsPwLfiAvRsPq7e55+hNhAUpUHpUH8YDu8mkD7wBl
   HnMjyTrpDeaPJFOYBlmKqnN7Tsr+3vCSApczBJMcNMS3WQ44ThZV1tk94
   tY4XgCu56HFyvZL2N8gMAbWH/jsdRji86hxeF4/sxYHKNl68AjV5VxL4J
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nZvesXQdyqVNehBsWZ9HZ3k6RriExTNZR+8g1MSVW7WMLRqMZIzFbynL2f3RETGJOikzxRZfKF
 LLQGamvrGSdEeB5avGbXwr7ArN08RW6/eHVAHNmD14/rinWk5mfk4/15QO0XNywNID8zXAcYSv
 mWet+y7a9M6sbxUdZoRuVlXKT3sMA1yp3sp1f2SJEpSrx2TdWFiQ4zpVLC2oj53VbiuwQx0JdB
 17NqR1F8RJoeG4Qy8mx4yeuF5ps+pDyFvrdU9bWb31K3JDCB2IVRyMDvzk60FsOC6UND5BZd3C
 dN0=
X-SBRS: 5.2
X-MesageID: 35064265
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,331,1602561600"; 
   d="scan'208";a="35064265"
Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: Jan Beulich <jbeulich@suse.com>
CC: <paul@xen.org>, <wl@xen.org>, <iwj@xenproject.org>,
	<anthony.perard@citrix.com>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <julien@xen.org>, <sstabellini@kernel.org>,
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <62d08bab-6de4-c190-7a8c-910693f16846@suse.com>
 <f3673d8c-4827-486a-8c72-760c9e314fd4@citrix.com>
 <4bb15f7f-8e36-1022-0f98-9ce56bd294e6@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <11bc2e42-5c00-2ede-e76e-f5c7af987b7d@citrix.com>
Date: Fri, 8 Jan 2021 13:25:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4bb15f7f-8e36-1022-0f98-9ce56bd294e6@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/01/2021 13:17, Jan Beulich wrote:
> On 08.01.2021 12:27, Igor Druzhinin wrote:
>> On 08/01/2021 09:19, Jan Beulich wrote:
>>> On 08.01.2021 01:46, Igor Druzhinin wrote:
>>>> --- a/tools/libs/light/libxl_x86.c
>>>> +++ b/tools/libs/light/libxl_x86.c
>>>> @@ -336,7 +336,7 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
>>>>          LOG(DETAIL, "%s group enabled", libxl_viridian_enlightenment_to_string(v));
>>>>  
>>>>      if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_BASE)) {
>>>> -        mask |= HVMPV_base_freq;
>>>> +        mask |= HVMPV_base_freq | HVMPV_no_vp_limit;
>>>
>>> Could you clarify the point of having the new control when at
>>> the guest config level there's no way to prevent it from
>>> getting enabled (short of disabling Viridian extensions
>>> altogether)?
>>
>> If you migrate in from a host without this code (previous version
>> of Xen)- you will keep the old behavior for the guest thus preserving
>> binary compatibility.
> 
> Keeping thing compatible like this is clearly a requirement. But
> is this enough? As soon as the guest reboots, it will see differing
> behavior, won't it?

Yes, that's what I was expecting - after reboot it should be fine.
Hence I put this option into the default set - I'd expect no limit to be
applied in the first place.

Igor 

