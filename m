Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EA31BBD5D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 14:19:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTPCB-0001gk-QA; Tue, 28 Apr 2020 12:18:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTPC9-0001gf-ST
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 12:18:37 +0000
X-Inumbo-ID: 62d50170-894a-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62d50170-894a-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 12:18:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 50CE4AC5F;
 Tue, 28 Apr 2020 12:18:35 +0000 (UTC)
Subject: Re: [PATCH v4] x86: irq: Do not BUG_ON multiple unbind calls for
 shared pirqs
To: vrd@amazon.com
References: <20200306160254.8465-1-paul@xen.org>
 <58f00871-2fff-be69-299e-e2b9911e0723@suse.com>
 <000301d5f63a$df5f04a0$9e1d0de0$@xen.org>
 <0648e7ac-f5d7-4207-e2c6-8418681cca13@suse.com>
 <8bcd4d23-cb03-bb3e-360e-4213cd2d7b49@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e69ea420-d32d-0c6b-5bb8-e02f750bc11e@suse.com>
Date: Tue, 28 Apr 2020 14:18:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8bcd4d23-cb03-bb3e-360e-4213cd2d7b49@amazon.com>
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
Cc: 'Julien Grall' <julien@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Varad Gautam' <vrd@amazon.de>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.04.2020 13:58, vrd@amazon.com wrote:
> On 3/10/20 3:19 PM, Jan Beulich wrote:
>> On 09.03.2020 18:47, Paul Durrant wrote:
>>> Please suggest code if you think it ought to be done differentely. I tried.
>> How about this? It's admittedly more code, but imo less ad hoc.
>> I've smoke tested it, but I depend on you or Varad to check that
>> it actually addresses the reported issue.
>>
>> Jan
>>
>> x86/pass-through: avoid double IRQ unbind during domain cleanup
> 
> 
> I have tested that this patch prevents __pirq_guest_unbind on an already-unbound pirq
> during the continuation call for domain_kill -ERESTART, by using a modified xen that
> forces an -ERESTART from pirq_guest_unbind to create the continuation. It fixes the
> underlying issue.
> 
> Tested-by: Varad Gautam <vrd@amazon.de>

Thanks much; I'll formally submit the patch then.

Jan

