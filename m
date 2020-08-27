Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC35E2540F5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 10:35:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBDNE-0002r2-MI; Thu, 27 Aug 2020 08:35:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i4js=CF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBDND-0002qx-Bl
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 08:35:07 +0000
X-Inumbo-ID: 51300ac8-b3fd-44a3-9381-04a570460354
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51300ac8-b3fd-44a3-9381-04a570460354;
 Thu, 27 Aug 2020 08:35:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8EEA9AD46;
 Thu, 27 Aug 2020 08:35:37 +0000 (UTC)
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
To: Julien Grall <julien@xen.org>, Simon Leiner <simon@leiner.me>,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
 <20200825093153.35500-2-simon@leiner.me>
 <eb1c9e1a-d8b5-cfd5-4575-3ae47f99ad44@xen.org>
 <61f11689-8d6b-0407-b76d-ec5c3a57be4c@suse.com>
 <3a1cad1b-3d78-e5b0-0f68-70c245dbcc1a@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <18229211-c7b5-21bc-f3a9-4a9a1974094e@suse.com>
Date: Thu, 27 Aug 2020 10:35:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3a1cad1b-3d78-e5b0-0f68-70c245dbcc1a@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.08.20 10:24, Julien Grall wrote:
> 
> 
> On 27/08/2020 06:21, Jürgen Groß wrote:
>> On 26.08.20 20:37, Julien Grall wrote:
>> "Usually" is a bit gross here. The only generic call site I could find
>> is xenbus_grant_ring(). All other instances (I counted 22) are not
>> generic at all.
>>
>>> will only catch one instance and it means we would have to fix the 
>>> first instance and then re-run to catch the others.
>>>
>>> So I think we want to switch to WARN_ON() here.
>>
>> No, please don't. In case there would be a frequent path the result
>> would be a basically unusable system due to massive console clobbering.
> 
> Right, but if that's really happenning then you have a much bigger 
> problem on your platform because the address returned will be invalid.
> 
> So I still don't see the advantage of WARN_ON_ONCE() here.

Depends of the (potential) source of the warnings. I think we can agree
that e.g. a problem in the pv network stack is rather improbable, as it
would have been detected long ago.

If, however, the problem is being introduced by one of the rather new
pv-drivers (like sound, pvcalls, 9pfs) it is perfectly fine to assume
the overall system is still functional even without those drivers
working correctly. Having a message storm from those sources is still
quite undesirable IMO and doesn't really help.


Juergen

