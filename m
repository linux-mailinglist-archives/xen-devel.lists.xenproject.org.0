Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A251E0F2A
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 15:12:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdCtw-0001Ia-Jl; Mon, 25 May 2020 13:12:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdCtv-0001Hk-AP
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 13:12:19 +0000
X-Inumbo-ID: 5bf1b87c-9e89-11ea-aecf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bf1b87c-9e89-11ea-aecf-12813bfff9fa;
 Mon, 25 May 2020 13:12:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0CBA6B02E;
 Mon, 25 May 2020 13:12:19 +0000 (UTC)
Subject: Re: [PATCH v3 2/3] xen/sched: don't call sync_vcpu_execstate() in
 sched_unit_migrate_finish()
To: Dario Faggioli <dfaggioli@suse.com>
References: <20200514153614.2240-1-jgross@suse.com>
 <20200514153614.2240-3-jgross@suse.com>
 <a3acb930c5656524f6229592be5d542f0cb9da60.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b127c20f-1ae8-242f-8435-3165a728a451@suse.com>
Date: Mon, 25 May 2020 15:12:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a3acb930c5656524f6229592be5d542f0cb9da60.camel@suse.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.05.2020 09:18, Dario Faggioli wrote:
> On Thu, 2020-05-14 at 17:36 +0200, Juergen Gross wrote:
>> With support of core scheduling sched_unit_migrate_finish() gained a
>> call of sync_vcpu_execstate() as it was believed to be called as a
>> result of vcpu migration in any case.
>>
>> In case of migrating a vcpu away from a physical cpu for a short
>> period
>> of time ionly without ever being scheduled on the selected new cpu 
>           ^
> with this typo taken care of (I guess, upon commit)...
> 
>> this
>> might not be true, so drop the call and let the lazy state syncing do
>> its job.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
> Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Hmm, I'm puzzled: This had gone in a week and a half ago with your
R-b sent on the 15th.

Jan

