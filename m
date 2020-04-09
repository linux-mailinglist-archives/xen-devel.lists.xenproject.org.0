Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2461A345F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 14:51:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMWds-0004Q0-Ia; Thu, 09 Apr 2020 12:50:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jMWdr-0004Pv-7J
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 12:50:47 +0000
X-Inumbo-ID: bafb0ba4-7a60-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bafb0ba4-7a60-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 12:50:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E2908AE30;
 Thu,  9 Apr 2020 12:50:44 +0000 (UTC)
Subject: Re: [PATCH] sched: fix scheduler_disable() with core scheduling
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
References: <20200409094137.13836-1-sergey.dyasli@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8db96ff6-53e3-8c01-0737-5181ccc348ab@suse.com>
Date: Thu, 9 Apr 2020 14:50:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409094137.13836-1-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.04.20 11:41, Sergey Dyasli wrote:
> In core-scheduling mode, Xen might crash when entering ACPI S5 state.
> This happens in sched_slave() during is_idle_unit(next) check because
> next->vcpu_list is stale and points to an already freed memory.
> 
> This situation happens shortly after scheduler_disable() is called if
> some CPU is still inside sched_slave() softirq. Current logic simply
> returns prev->next_task from sched_wait_rendezvous_in() which causes
> the described crash because next_task->vcpu_list has become invalid.
> 
> Fix the crash by returning NULL from sched_wait_rendezvous_in() in
> the case when scheduler_disable() has been called.
> 
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

Good catch!

Have you seen any further problems (e.g. with cpu on/offlining) with
this patch applied?

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

