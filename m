Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311041A97F9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 11:08:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOe1o-0003MD-Tx; Wed, 15 Apr 2020 09:08:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HD5o=57=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jOe1n-0003M8-1O
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 09:08:15 +0000
X-Inumbo-ID: a309db5a-7ef8-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a309db5a-7ef8-11ea-b4f4-bc764e2007e4;
 Wed, 15 Apr 2020 09:08:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 792D0AE39;
 Wed, 15 Apr 2020 09:08:12 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH] sched/core: Fix bug when moving a domain
 between cpupools
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20200327193023.506-1-jeff.kubascik@dornerworks.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9969e5ea-1378-3439-c9a5-19fb9b5c91ac@suse.com>
Date: Wed, 15 Apr 2020 11:08:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327193023.506-1-jeff.kubascik@dornerworks.com>
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Nathan Studer <Nathan.Studer@dornerworks.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.03.20 20:30, Jeff Kubascik wrote:
> For each UNIT, sched_set_affinity is called before unit->priv is updated
> to the new cpupool private UNIT data structure. The issue is
> sched_set_affinity will call the adjust_affinity method of the cpupool.
> If defined, the new cpupool may use unit->priv (e.g. credit), which at
> this point still references the old cpupool private UNIT data structure.
> 
> This change fixes the bug by moving the switch of unit->priv earler in
> the function.
> 
> Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

