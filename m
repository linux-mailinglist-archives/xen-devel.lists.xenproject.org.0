Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C931D329D
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 16:21:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZEjQ-0008NB-T8; Thu, 14 May 2020 14:21:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WGWk=64=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jZEjP-0008Mw-Mr
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 14:21:03 +0000
X-Inumbo-ID: 23f6d11c-95ee-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23f6d11c-95ee-11ea-b9cf-bc764e2007e4;
 Thu, 14 May 2020 14:21:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CECB3AE52;
 Thu, 14 May 2020 14:21:04 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] xen/sched: don't call sync_vcpu_execstate() in
 sched_unit_migrate_finish()
To: Jan Beulich <jbeulich@suse.com>
References: <20200511112829.5500-1-jgross@suse.com>
 <20200511112829.5500-3-jgross@suse.com>
 <f01cca9f-ba49-75bd-72c6-d0c638ed5e15@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6b6912d3-1bb1-ac3d-7fc7-a8d2a2f2db9b@suse.com>
Date: Thu, 14 May 2020 16:21:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f01cca9f-ba49-75bd-72c6-d0c638ed5e15@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.20 15:57, Jan Beulich wrote:
> On 11.05.2020 13:28, Juergen Gross wrote:
>> With support of core scheduling sched_unit_migrate_finish() gained a
>> call of sync_vcpu_execstate() as it was believed to be called as a
>> result of vcpu migration in any case.
>>
>> In case of migrating a vcpu away from a physical cpu for a short period
>> of time only this might not be true, so drop the call and let the lazy
>> state syncing do its job.
> 
> Replying here instead of on the patch 3 thread (and I'm sorry
> for mixing up function names there): By saying "for a short
> period of time only", do you imply without ever getting scheduled
> on the new (temporary) CPU? If so, I think I understand this
> change now, but then this could do with saying here. If not, I'm
> afraid I'm still lost.

I'll change the commit message to:

... for a short period of time only without ever being scheduled on the
selected new cpu ...


Juergen

