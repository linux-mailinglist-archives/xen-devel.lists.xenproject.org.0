Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9402B2740F5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 13:35:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKga6-0006h3-Cs; Tue, 22 Sep 2020 11:35:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1J9w=C7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kKga4-0006gp-Q4
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 11:35:32 +0000
X-Inumbo-ID: ee172ecd-46db-47b2-8f62-df6725d0ef78
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee172ecd-46db-47b2-8f62-df6725d0ef78;
 Tue, 22 Sep 2020 11:35:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600774530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8xKyn37igCwVdW/X/CBmTomDtKCHpuashkMdG2jkb4c=;
 b=NTjrurU/+zwFRQtn4hfGYg2GOko6dC0SeUB1QZtnNa696pUrSKZKZgYVa5HxMkhxO4U8oL
 oOvogVfpTUYSvHszpbI59Xoup8VEs6dfyakD7OOTWNwduP1XAeRLB+kZMPVVcUxxN3ckj9
 zGzn/HVDMrBuie6uMe1/nvylnsgDZLk=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D52CAE1C;
 Tue, 22 Sep 2020 11:36:07 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] xen-blkback: add a parameter for disabling of
 persistent grants
To: SeongJae Park <sjpark@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: konrad.wilk@oracle.com, SeongJae Park <sjpark@amazon.de>,
 axboe@kernel.dk, aliguori@amazon.com, amit@kernel.org, mheyne@amazon.de,
 pdurrant@amazon.co.uk, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20200922112638.14238-1-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <33a8d880-d8ce-0cf7-d115-ca6938889f27@suse.com>
Date: Tue, 22 Sep 2020 13:35:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922112638.14238-1-sjpark@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.09.20 13:26, SeongJae Park wrote:
> On Tue, 22 Sep 2020 13:12:59 +0200 "Roger Pau Monné" <roger.pau@citrix.com> wrote:
> 
>> On Tue, Sep 22, 2020 at 12:52:07PM +0200, SeongJae Park wrote:
>>> From: SeongJae Park <sjpark@amazon.de>
>>>
>>> Persistent grants feature provides high scalability.  On some small
>>> systems, however, it could incur data copy overheads[1] and thus it is
>>> required to be disabled.  But, there is no option to disable it.  For
>>> the reason, this commit adds a module parameter for disabling of the
>>> feature.
>>>
>>> [1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability
>>>
>>> Signed-off-by: Anthony Liguori <aliguori@amazon.com>
>>> Signed-off-by: SeongJae Park <sjpark@amazon.de>
>>> ---
>>>   .../ABI/testing/sysfs-driver-xen-blkback      |  9 ++++++
>>>   drivers/block/xen-blkback/xenbus.c            | 28 ++++++++++++++-----
>>>   2 files changed, 30 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
>>> index ecb7942ff146..ac2947b98950 100644
>>> --- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
>>> +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
>>> @@ -35,3 +35,12 @@ Description:
>>>                   controls the duration in milliseconds that blkback will not
>>>                   cache any page not backed by a grant mapping.
>>>                   The default is 10ms.
>>> +
>>> +What:           /sys/module/xen_blkback/parameters/feature_persistent
>>> +Date:           September 2020
>>> +KernelVersion:  5.10
>>> +Contact:        SeongJae Park <sjpark@amazon.de>
>>> +Description:
>>> +                Whether to enable the persistent grants feature or not.  Note
>>> +                that this option only takes effect on newly created backends.
>>> +                The default is Y (enable).
>>> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
>>> index b9aa5d1ac10b..8a95ddd08b13 100644
>>> --- a/drivers/block/xen-blkback/xenbus.c
>>> +++ b/drivers/block/xen-blkback/xenbus.c
>>> @@ -879,6 +879,12 @@ static void reclaim_memory(struct xenbus_device *dev)
>>>   
>>>   /* ** Connection ** */
>>>   
>>> +/* Enable the persistent grants feature. */
>>> +static bool feature_persistent = true;
>>> +module_param(feature_persistent, bool, 0644);
>>> +MODULE_PARM_DESC(feature_persistent,
>>> +		"Enables the persistent grants feature");
>>> +
>>>   /*
>>>    * Write the physical details regarding the block device to the store, and
>>>    * switch to Connected state.
>>> @@ -906,11 +912,15 @@ static void connect(struct backend_info *be)
>>>   
>>>   	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
>>>   
>>> -	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u", 1);
>>> -	if (err) {
>>> -		xenbus_dev_fatal(dev, err, "writing %s/feature-persistent",
>>> -				 dev->nodename);
>>> -		goto abort;
>>> +	if (feature_persistent) {
>>> +		err = xenbus_printf(xbt, dev->nodename, "feature-persistent",
>>> +				"%u", feature_persistent);
>>> +		if (err) {
>>> +			xenbus_dev_fatal(dev, err,
>>> +					"writing %s/feature-persistent",
>>> +					dev->nodename);
>>> +			goto abort;
>>> +		}
>>>   	}
>>>   
>>>   	err = xenbus_printf(xbt, dev->nodename, "sectors", "%llu",
>>> @@ -1093,8 +1103,12 @@ static int connect_ring(struct backend_info *be)
>>>   		xenbus_dev_fatal(dev, err, "unknown fe protocol %s", protocol);
>>>   		return -ENOSYS;
>>>   	}
>>> -	pers_grants = xenbus_read_unsigned(dev->otherend, "feature-persistent",
>>> -					   0);
>>> +	if (feature_persistent)
>>> +		pers_grants = xenbus_read_unsigned(dev->otherend,
>>> +				"feature-persistent", 0);
>>> +	else
>>> +		pers_grants = 0;
>>> +
>>
>> Sorry for not realizing earlier, but looking at it again I think you
>> need to cache the value of feature_persistent when it's first used in
>> the blkback state data, so that it's consistent.
>>
>> What would happen for example with the following flow (assume a
>> persistent grants enabled frontend):
>>
>> feature_persistent = false
>>
>> connect(...)
>> feature-persistent is not written to xenstore
>>
>> User changes feature_persistent = true
>>
>> connect_ring(...)
>> pers_grants = true, because feature-persistent is set unconditionally
>> by the frontend and feature_persistent variable is now true.
>>
>> Then blkback will try to use persistent grants and the whole
>> connection will malfunction because the frontend won't.
> 
> Ah, you're right.  I should also catch this before but didn't, sorry.
> 
>>
>> The other option is to prevent changing the variable when there are
>> blkback instances already running.
> 
> I think storing the option value in xenstore would be simpler.  That said, if
> you prefer this way, please let me know.

No, Xenstore isn't the right place for that. This is a local
implementation detail of blkback and shouldn't be exported to Xenstore.


Juergen

