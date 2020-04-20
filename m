Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40C31B0CF9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 15:41:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQWfQ-0001U5-Kk; Mon, 20 Apr 2020 13:40:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pMKz=6E=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1jQWfP-0001Tw-9Z
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:40:55 +0000
X-Inumbo-ID: 8ea3e878-830c-11ea-9e09-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ea3e878-830c-11ea-9e09-bc764e2007e4;
 Mon, 20 Apr 2020 13:40:54 +0000 (UTC)
Subject: Re: Re: [Xen-devel] [PATCH] sched/core: Fix bug when moving a domain
 between cpupools
To: Dario Faggioli <dfaggioli@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, <xen-devel@lists.xenproject.org>, George Dunlap
 <george.dunlap@citrix.com>
References: <20200327193023.506-1-jeff.kubascik@dornerworks.com>
 <9969e5ea-1378-3439-c9a5-19fb9b5c91ac@suse.com>
 <f3e7c6bfc2203119b2dfc36bd1fb9167b4fbfb2c.camel@suse.com>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <a72b2571-65b0-bd6a-2bd5-2ce7a0667648@dornerworks.com>
Date: Mon, 20 Apr 2020 09:42:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f3e7c6bfc2203119b2dfc36bd1fb9167b4fbfb2c.camel@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Thank you Juergen and Dario!

On 4/16/2020 12:09 PM, Dario Faggioli wrote:
> On Wed, 2020-04-15 at 11:08 +0200, Jürgen Groß wrote:
>> On 27.03.20 20:30, Jeff Kubascik wrote:
>>> For each UNIT, sched_set_affinity is called before unit->priv is
>>> updated
>>> to the new cpupool private UNIT data structure. The issue is
>>> sched_set_affinity will call the adjust_affinity method of the
>>> cpupool.
>>> If defined, the new cpupool may use unit->priv (e.g. credit), which
>>> at
>>> this point still references the old cpupool private UNIT data
>>> structure.
>>>
>>> This change fixes the bug by moving the switch of unit->priv earler
>>> in
>>> the function.
>>>
>>> Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>
> Acked-by: Dario Faggioli <dfaggioli@suse.com>
> 
> Sorry it took a while. And thanks Juergen for also having a look.
> 
> Regards
> 

Sincerely,
Jeff Kubascik

