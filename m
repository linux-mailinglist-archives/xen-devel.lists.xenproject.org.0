Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC631E8101
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:54:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegOl-0002S6-Nq; Fri, 29 May 2020 14:54:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ub4=7L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jegOk-0002S1-Du
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:54:14 +0000
X-Inumbo-ID: 42c4807e-a1bc-11ea-a8cc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42c4807e-a1bc-11ea-a8cc-12813bfff9fa;
 Fri, 29 May 2020 14:54:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A4976AC24;
 Fri, 29 May 2020 14:54:12 +0000 (UTC)
Subject: Re: [PATCH v2 3/7] xen: cpupool: add a back-pointer from a scheduler
 to its pool
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <159070133878.12060.13318432301910522647.stgit@Palanthas>
 <159070137738.12060.10928971799525755388.stgit@Palanthas>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <01541fda-c7dc-1eac-7184-970244eaf505@suse.com>
Date: Fri, 29 May 2020 16:54:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <159070137738.12060.10928971799525755388.stgit@Palanthas>
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
Cc: George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.20 23:29, Dario Faggioli wrote:
> If we need to know within which pool a particular scheduler
> is working, we can do that by querying the cpupool pointer
> of any of the sched_resource-s (i.e., ~ any of the CPUs)
> assigned to the scheduler itself.
> 
> Basically, we pick any sched_resource that we know uses that
> scheduler, and we check its *cpupool pointer. If we really
> know that the resource uses the scheduler, this is fine, as
> it also means the resource is inside the pool we are
> looking for.
> 
> But, of course, we can do that for a pool/scheduler that has

s/can/can't/ ?

> not any been given any sched_resource yet (or if we do not
> know whether or not it has any sched_resource).
> 
> To overcome such limitation, add a back pointer from the
> scheduler, to its own pool.
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

