Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8694E275E95
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 19:27:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL8Y6-0006pF-KF; Wed, 23 Sep 2020 17:27:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VqP=DA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kL8Y5-0006p9-JI
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 17:27:21 +0000
X-Inumbo-ID: 6a0b055e-9434-4033-9b22-e614369248c4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a0b055e-9434-4033-9b22-e614369248c4;
 Wed, 23 Sep 2020 17:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=TciFdIuLPFop/gUvzB8lr6tGROe6wdiWBDumc1SUA1c=; b=Y3rjq8hAncFegn2ojeP6B4ksLN
 4IyRz5My8Ooo7cAXsh8PTLvxo8g0nTCk3J21fCGenQxzmFGKLCsOLR5u9Pr0qfRsg52xRMzcyIsB/
 qqTCTvIZ//W4YheWtuiMnWzI7TJDde9hxqku55bvxqpzKfG7Qhlz519qNxcP2YgIVQJA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL8Y0-0008Fc-30; Wed, 23 Sep 2020 17:27:16 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL8Xz-0004oD-Rm; Wed, 23 Sep 2020 17:27:15 +0000
Subject: Re: [PATCH V1 03/16] xen/ioreq: Make x86's
 hvm_ioreq_needs_completion() common
To: Jan Beulich <jbeulich@suse.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-4-git-send-email-olekstysh@gmail.com>
 <2d6bbc2c-dc4b-f873-ed70-87b29f53620c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <016e9fe9-1dd4-a4e5-3e03-6d61949a74f6@xen.org>
Date: Wed, 23 Sep 2020 18:27:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2d6bbc2c-dc4b-f873-ed70-87b29f53620c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 14/09/2020 15:59, Jan Beulich wrote:
> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -35,6 +35,13 @@ static inline struct hvm_ioreq_server *get_ioreq_server(const struct domain *d,
>>       return GET_IOREQ_SERVER(d, id);
>>   }
>>   
>> +static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
>> +{
>> +    return ioreq->state == STATE_IOREQ_READY &&
>> +           !ioreq->data_is_ptr &&
>> +           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
>> +}
> 
> While the PIO aspect has been discussed to some length, what about
> the data_is_ptr concept? I didn't think there were Arm insns fitting
> this? Instead I thought some other Arm-specific adjustments to the
> protocol might be needed. At which point the question of course would
> be in how far ioreq_t as a whole really fits Arm in its current shape.

I would rather not try to re-invent ioreq_t for Arm if we don't need to. 
This is only going to increase the amount of arch specific code in a 
device emulator that really ought to be agnostic.

At the moment, I think it is fine to have "unused" field on Arm as long 
as they contain the right value.

So I would rather keep the check in common code as well.

Cheers,

-- 
Julien Grall

