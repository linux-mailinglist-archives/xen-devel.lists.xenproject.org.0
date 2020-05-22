Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F86B1DE60E
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 14:00:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc6Lp-0004zc-4w; Fri, 22 May 2020 12:00:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc6Ln-0004zV-CR
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 12:00:31 +0000
X-Inumbo-ID: d4fda464-9c23-11ea-abbb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4fda464-9c23-11ea-abbb-12813bfff9fa;
 Fri, 22 May 2020 12:00:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D7841AD46;
 Fri, 22 May 2020 12:00:31 +0000 (UTC)
Subject: Re: [PATCH] x86: refine guest_mode()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7b62d06c-1369-2857-81c0-45e2434357f4@suse.com>
 <1704f4f6-7e77-971c-2c94-4f6a6719c34a@citrix.com>
 <5bbe6425-396c-d934-b5af-53b594a4afbc@suse.com>
 <16939982-3ccc-f848-0694-61b154dca89a@citrix.com>
 <5ce12c86-c894-4a2c-9fa6-1c2a6007ca28@suse.com>
 <20200518145101.GV54375@Air-de-Roger>
 <d58ec87e-a871-2e65-4a69-b73a168a6afa@suse.com>
 <20200520151326.GM54375@Air-de-Roger>
 <38d546f9-8043-8d94-8298-8fd035078a8a@suse.com>
 <20200522104844.GY54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a31bd761-54eb-56b8-7c60-93202d26e7d0@suse.com>
Date: Fri, 22 May 2020 14:00:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522104844.GY54375@Air-de-Roger>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.05.2020 12:48, Roger Pau Monné wrote:
> On Fri, May 22, 2020 at 11:52:42AM +0200, Jan Beulich wrote:
>> On 20.05.2020 17:13, Roger Pau Monné wrote:
>>> OK, so I think I'm starting to understand this all. Sorry it's taken
>>> me so long. So it's my understanding that diff != 0 can only happen in
>>> Xen context, or when in an IST that has a different stack (ie: MCE, NMI
>>> or DF according to current.h) and running in PV mode?
>>>
>>> Wouldn't in then be fine to use (r)->cs & 3 to check we are in guest
>>> mode if diff != 0? I see a lot of other places where cs & 3 is already
>>> used to that effect AFAICT (like entry.S).
>>
>> Technically this would be correct afaics, but the idea with all this
>> is (or should I say "looks to be"?) to have the checks be as tight as
>> possible, to make sure we don't mistakenly consider something "guest
>> mode" which really isn't. IOW your suggestion would be fine with me
>> if we could exclude bugs anywhere in the code. But since this isn't
>> realistic, I consider your suggestion to be relaxing things by too
>> much.
> 
> OK, so I take that (long time) we might also want to change the cs & 3
> checks from entry.S to check against __HYPERVISOR_CS explicitly?

I didn't think so, no (not the least because of there not being any
guarantee afaik that EFI runtime calls couldn't play with segment
registers; they shouldn't, yes, but there's a lot of other "should"
many don't obey to). Those are guaranteed PV-only code paths. The
main issue here is that ->cs cannot be relied upon when a frame
points at HVM state.

Jan

