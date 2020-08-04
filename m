Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B8623BD5D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 17:42:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2z4i-0003pO-7j; Tue, 04 Aug 2020 15:42:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2z4g-0003pF-J4
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 15:41:58 +0000
X-Inumbo-ID: d41fc4ad-5b12-4d88-b393-3257ce407432
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d41fc4ad-5b12-4d88-b393-3257ce407432;
 Tue, 04 Aug 2020 15:41:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0C02ACB7;
 Tue,  4 Aug 2020 15:42:12 +0000 (UTC)
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Julien Grall <julien@xen.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
 <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <34907525-1f6e-5413-1017-51cefe0dfcbc@suse.com>
Date: Tue, 4 Aug 2020 17:41:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 paul@xen.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 Oleksandr <olekstysh@gmail.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jun Nakajima' <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 15:52, Julien Grall wrote:
> On 04/08/2020 12:10, Oleksandr wrote:
>> On 04.08.20 10:45, Paul Durrant wrote:
>>>> +static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
>>>> +{
>>>> +    return ioreq->state == STATE_IOREQ_READY &&
>>>> +           !ioreq->data_is_ptr &&
>>>> +           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != 
>>>> IOREQ_WRITE);
>>>> +}
>>> I don't think having this in common code is correct. The short-cut of 
>>> not completing PIO reads seems somewhat x86 specific. 
> 
> Hmmm, looking at the code, I think it doesn't wait for PIO writes to 
> complete (not read). Did I miss anything?

The point of the check isn't to determine whether to wait, but
what to do after having waited. Reads need a retry round through
the emulator (to store the result in the designated place),
while writes don't have such a requirement (and hence guest
execution can continue immediately in the general case).

Jan

