Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5036F192989
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 14:22:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH5wr-0001IT-Ly; Wed, 25 Mar 2020 13:19:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH5wp-0001IO-Ms
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 13:19:55 +0000
X-Inumbo-ID: 50c774fa-6e9b-11ea-8608-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50c774fa-6e9b-11ea-8608-12813bfff9fa;
 Wed, 25 Mar 2020 13:19:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E431FAD2A;
 Wed, 25 Mar 2020 13:19:53 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200325105511.20882-1-jgross@suse.com>
 <20200325105511.20882-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51626ddf-7f59-73a6-f0df-300a39482b9f@suse.com>
Date: Wed, 25 Mar 2020 14:19:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200325105511.20882-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v7 2/5] xen/rcu: don't use
 stop_machine_run() for rcu_barrier()
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 11:55, Juergen Gross wrote:
> Today rcu_barrier() is calling stop_machine_run() to synchronize all
> physical cpus in order to ensure all pending rcu calls have finished
> when returning.
> 
> As stop_machine_run() is using tasklets this requires scheduling of
> idle vcpus on all cpus imposing the need to call rcu_barrier() on idle
> cpus only in case of core scheduling being active, as otherwise a
> scheduling deadlock would occur.
> 
> There is no need at all to do the syncing of the cpus in tasklets, as
> rcu activity is started in __do_softirq() called whenever softirq
> activity is allowed. So rcu_barrier() can easily be modified to use
> softirq for synchronization of the cpus no longer requiring any
> scheduling activity.
> 
> As there already is a rcu softirq reuse that for the synchronization.
> 
> Remove the barrier element from struct rcu_data as it isn't used.
> 
> Finally switch rcu_barrier() to return void as it now can never fail.
> 
> Partially-based-on-patch-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

