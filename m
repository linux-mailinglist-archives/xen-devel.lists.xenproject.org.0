Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1E01A8CE3
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 22:52:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOSXY-0001CU-V2; Tue, 14 Apr 2020 20:52:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jlhC=56=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1jOSXX-0001CP-PM
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 20:52:15 +0000
X-Inumbo-ID: d1ff7f8a-7e91-11ea-b58d-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1ff7f8a-7e91-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 20:52:14 +0000 (UTC)
Subject: Re: [PATCH] sched/core: Fix bug when moving a domain between cpupools
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: <xen-devel@lists.xenproject.org>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200327193023.506-1-jeff.kubascik@dornerworks.com>
Message-ID: <40389937-6f8e-dff3-8af6-30a848fcb163@dornerworks.com>
Date: Tue, 14 Apr 2020 16:52:46 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200327193023.506-1-jeff.kubascik@dornerworks.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.27.0.12]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
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

Hello,

I wanted to follow up on this patch, as I have not seen any responses to it.

In my work on the ARINC653 scheduler, I have observed this bug write to memory
past the end of a private UNIT structure (and in my case, stomping on a TLSF
allocator header) when migrating a domain from an ARINC cpupool to a credit
cpupool. This occurs because (a) the private UNIT structure is smaller for the
ARINC cpupool and (b) the credit scheduler method csched_aff_cntl does some bit
setting/ clearing while the private UNIT pointer still points incorrectly to the
ARINC cpupool one.

On 3/27/2020 3:30 PM, Jeff Kubascik wrote:
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
> ---
> Hello,
> 
> I've been working on updating the arinc653 scheduler to support
> multicore for a few months now. In the process of testing, I came across
> this obscure bug in the core scheduler code that took me a few weeks to
> track down. This bug resulted in the credit scheduler writing past the
> end of the arinc653 private UNIT data structure into the TLSF allocator
> bhdr structure of the adjacent region. This required some deep diving
> into the TLSF allocator code to trace the bug back to this point.
> 
> Sincerely,
> Jeff Kubascik
> ---
>  xen/common/sched/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 7e8e7d2c39..ea572a345a 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -686,6 +686,7 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>          unsigned int unit_p = new_p;
>  
>          unitdata = unit->priv;
> +        unit->priv = unit_priv[unit_idx];
>  
>          for_each_sched_unit_vcpu ( unit, v )
>          {
> @@ -707,7 +708,6 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>           */
>          spin_unlock_irq(lock);
>  
> -        unit->priv = unit_priv[unit_idx];
>          if ( !d->is_dying )
>              sched_move_irqs(unit);
>  
> 

Sincerely,
Jeff Kubascik

