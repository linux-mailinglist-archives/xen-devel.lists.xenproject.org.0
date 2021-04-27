Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076AB36C10B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 10:36:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118107.224087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbJCB-0000zM-E8; Tue, 27 Apr 2021 08:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118107.224087; Tue, 27 Apr 2021 08:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbJCB-0000yx-An; Tue, 27 Apr 2021 08:35:51 +0000
Received: by outflank-mailman (input) for mailman id 118107;
 Tue, 27 Apr 2021 08:35:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbJCA-0000ys-KB
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 08:35:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e716c9e-8ce6-4e62-a500-5bfe7e6b153f;
 Tue, 27 Apr 2021 08:35:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5C9AB007;
 Tue, 27 Apr 2021 08:35:48 +0000 (UTC)
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
X-Inumbo-ID: 3e716c9e-8ce6-4e62-a500-5bfe7e6b153f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619512548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6JO7X/cz5eg8beGmPKE/svwlRrvFNg2TXGXMs5rnfos=;
	b=J9H0zW28bfXIe842IgKqhSXFQrr9sWcTuZRhEYSxispjyLgV7joWkxBrRsNCxMO3DuUsfV
	4LM/o+TunHv/Nw1IZEclz5Hx6Oa+NXhFm4XduJI/C+7SlYJOXoGTov7drg87MXxn4ll3fi
	zh+kGXKV6fKmJgNbtXxOXLCsI/tNoA0=
Subject: Ping: [Bugfix PATCH for-4.15] xen: credit2: fix per-entity load
 tracking when continuing running
To: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <161615605709.5036.4052641880659992679.stgit@Wayrath>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a3f31cde-f1e5-e643-28bc-cdb2b36f372d@suse.com>
Date: Tue, 27 Apr 2021 10:35:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <161615605709.5036.4052641880659992679.stgit@Wayrath>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.03.2021 13:14, Dario Faggioli wrote:
> If we schedule, and the current vCPU continues to run, its statistical
> load is not properly updated, resulting in something like this, even if
> all the 8 vCPUs are 100% busy:
> 
> (XEN) Runqueue 0:
> (XEN) [...]
> (XEN)   aveload            = 2097152 (~800%)
> (XEN) [...]
> (XEN)   Domain: 0 w 256 c 0 v 8
> (XEN)     1: [0.0] flags=2 cpu=4 credit=9996885 [w=256] load=35 (~0%)
> (XEN)     2: [0.1] flags=2 cpu=2 credit=9993725 [w=256] load=796 (~0%)
> (XEN)     3: [0.2] flags=2 cpu=1 credit=9995885 [w=256] load=883 (~0%)
> (XEN)     4: [0.3] flags=2 cpu=5 credit=9998833 [w=256] load=487 (~0%)
> (XEN)     5: [0.4] flags=2 cpu=6 credit=9998942 [w=256] load=1595 (~0%)
> (XEN)     6: [0.5] flags=2 cpu=0 credit=9994669 [w=256] load=22 (~0%)
> (XEN)     7: [0.6] flags=2 cpu=7 credit=9997706 [w=256] load=0 (~0%)
> (XEN)     8: [0.7] flags=2 cpu=3 credit=9992440 [w=256] load=0 (~0%)
> 
> As we can see, the average load of the runqueue as a whole is, instead,
> computed properly.
> 
> This issue would, in theory, potentially affect Credit2 load balancing
> logic. In practice, however, the problem only manifests (at least with
> these characteristics) when there is only 1 runqueue active in the
> cpupool, which also means there is no need to do any load-balancing.
> 
> Hence its real impact is pretty much limited to wrong per-vCPU load
> percentages, when looking at the output of the 'r' debug-key.
> 
> With this patch, the load is updated and displayed correctly:
> 
> (XEN) Runqueue 0:
> (XEN) [...]
> (XEN)   aveload            = 2097152 (~800%)
> (XEN) [...]
> (XEN) Domain info:
> (XEN)   Domain: 0 w 256 c 0 v 8
> (XEN)     1: [0.0] flags=2 cpu=4 credit=9995584 [w=256] load=262144 (~100%)
> (XEN)     2: [0.1] flags=2 cpu=6 credit=9992992 [w=256] load=262144 (~100%)
> (XEN)     3: [0.2] flags=2 cpu=3 credit=9998918 [w=256] load=262118 (~99%)
> (XEN)     4: [0.3] flags=2 cpu=5 credit=9996867 [w=256] load=262144 (~100%)
> (XEN)     5: [0.4] flags=2 cpu=1 credit=9998912 [w=256] load=262144 (~100%)
> (XEN)     6: [0.5] flags=2 cpu=2 credit=9997842 [w=256] load=262144 (~100%)
> (XEN)     7: [0.6] flags=2 cpu=7 credit=9994623 [w=256] load=262144 (~100%)
> (XEN)     8: [0.7] flags=2 cpu=0 credit=9991815 [w=256] load=262144 (~100%)
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Ian Jackson <iwj@xenproject.org>
> ---
> Despite the limited effect, it's a bug. So:
> - it should be backported;
> - I think it should be included in 4.15. The risk is pretty low, for
>   the same reasons already explained when describing its limited impact.

I'm a little puzzled to find this is still in my waiting-to-go-in
folder, for not having had an ack (or otherwise). George?

Jan

> ---
>  xen/common/sched/credit2.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index eb5e5a78c5..b3b5de94cf 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -3646,6 +3646,8 @@ static void csched2_schedule(
>              runq_remove(snext);
>              __set_bit(__CSFLAG_scheduled, &snext->flags);
>          }
> +        else
> +            update_load(ops, rqd, snext, 0, now);
>  
>          /* Clear the idle mask if necessary */
>          if ( cpumask_test_cpu(sched_cpu, &rqd->idle) )
> 
> 
> 


