Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA811952A9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 09:13:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHk4w-0001JL-K3; Fri, 27 Mar 2020 08:10:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fmA7=5M=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jHk4v-0001JG-MF
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 08:10:57 +0000
X-Inumbo-ID: 7c10dfb2-7002-11ea-8920-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c10dfb2-7002-11ea-8920-12813bfff9fa;
 Fri, 27 Mar 2020 08:10:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 45BD5ADBB;
 Fri, 27 Mar 2020 08:10:55 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <20200326091918.12388-1-jgross@suse.com>
 <20200326091918.12388-4-jgross@suse.com>
 <260d0f20-a424-3708-3ab7-6d8c89247a2a@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7a9cff0b-4c8f-899a-3fae-8a703bc90125@suse.com>
Date: Fri, 27 Mar 2020 09:10:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <260d0f20-a424-3708-3ab7-6d8c89247a2a@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH v8 3/5] xen: don't process rcu callbacks
 when holding a rcu_read_lock()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.03.20 00:24, Igor Druzhinin wrote:
> On 26/03/2020 09:19, Juergen Gross wrote:
>> Some keyhandlers are calling process_pending_softirqs() while holding
>> a rcu_read_lock(). This is wrong, as process_pending_softirqs() might
>> activate rcu calls which should not happen inside a rcu_read_lock().
>>
>> For that purpose modify process_pending_softirqs() to not allow rcu
>> callback processing when a rcu_read_lock() is being held.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> V3:
>> - add RCU_SOFTIRQ to ignore in process_pending_softirqs_norcu()
>>    (Roger Pau Monné)
>>
>> V5:
>> - block rcu processing depending on rch_read_lock() being held or not
>>    (Jan Beulich)
> 
> Juergen,
> 
> Our BVT revealed a likely problem with this commit in that form.
> Since 12509bbeb9e ("rwlocks: call preempt_disable() when taking a rwlock")
> preemption is disabled after taking cpu_maps which will block RCU
> callback processing inside rcu_barrier itself. This will result in

Why would that block RCU callback processing?

RCU callbacks should be blocked only if a rcu lock is being held.

Did I miss something in my patches?

> all system hang on boot after 540d4d60378 ("cpu: sync any remaining
> RCU callbacks before CPU up/down").


Juergen

