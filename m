Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40741FAD95
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 12:10:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl8Y8-000725-1J; Tue, 16 Jun 2020 10:10:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl8Y6-000720-P4
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 10:10:34 +0000
X-Inumbo-ID: 9c2ee356-afb9-11ea-b8a5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c2ee356-afb9-11ea-b8a5-12813bfff9fa;
 Tue, 16 Jun 2020 10:10:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7645DAD60;
 Tue, 16 Jun 2020 10:10:34 +0000 (UTC)
Subject: Re: [RFC PATCH v1 2/6] sched: track time spent in hypervisor tasks
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-3-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7d3e1741-b8bc-b522-8d64-20ca9c14744b@suse.com>
Date: Tue, 16 Jun 2020 12:10:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612002205.174295-3-volodymyr_babchuk@epam.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.2020 02:22, Volodymyr Babchuk wrote:
> In most cases hypervisor code performs guest-related jobs. Tasks like
> hypercall handling or MMIO access emulation are done for calling vCPU
> so it is okay to charge time spent in hypervisor to the current vCPU.
> 
> But, there are also tasks that are not originated from guests. This
> includes things like TLB flushing or running tasklets. We don't want
> to track time spent in this tasks to a total scheduling unit run
> time. So we need to track time spent in such housekeeping tasks
> separately.
> 
> Those hypervisor tasks are run in do_softirq() function, so we'll
> install our hooks there.

I can see the point and desire, but it feels like you're moving from
one kind of unfairness to another: A softirq may very well be on
behalf of a specific vCPU, in which case not charging current should
lead to charging that specific one (which may still be current then).
Even more than for TLB flushes this may be relevant for the cases
where (on x86) we issue WBINVD on behalf of a guest.

Jan

