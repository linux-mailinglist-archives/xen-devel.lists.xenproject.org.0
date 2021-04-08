Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE3F358739
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 16:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107381.205283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUVhY-0001v2-7z; Thu, 08 Apr 2021 14:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107381.205283; Thu, 08 Apr 2021 14:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUVhY-0001ud-4T; Thu, 08 Apr 2021 14:32:08 +0000
Received: by outflank-mailman (input) for mailman id 107381;
 Thu, 08 Apr 2021 14:32:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUVhW-0001uW-Tl
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 14:32:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d06d7b27-0037-4351-9f92-b90a3c057ea0;
 Thu, 08 Apr 2021 14:32:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 768DBB49D;
 Thu,  8 Apr 2021 14:32:04 +0000 (UTC)
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
X-Inumbo-ID: d06d7b27-0037-4351-9f92-b90a3c057ea0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617892325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32e+c7Ksex1CseVidA3EDRgcwsU9vvrltZpKcXhBZ/M=;
	b=IosULcaKy5TYHMuE1L0M+A1WSX+a+M5QzJVsLty+D1w2Xq5lsUDtBOHUbASv93mIp+uejD
	wjAgyW1jNLcjLd8v2jsCrePDhs2lxN14kri01d7uFdCbGFHFqxNLndQE3yaT2yF9k+FKE1
	vhaDBp9Q+j/KCsm5Uym8fpUWhpChfgc=
Subject: Re: [PATCH v3 06/11] x86/hvm: allowing registering EOI callbacks for
 GSIs
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-7-roger.pau@citrix.com>
 <a57f0f75-341d-e6e1-823c-2083184a8f08@suse.com>
 <YG78hECMfLSB6Aao@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d088ae2-e8a7-7818-5ee8-5ed95ac260c1@suse.com>
Date: Thu, 8 Apr 2021 16:31:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YG78hECMfLSB6Aao@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.04.2021 14:52, Roger Pau Monné wrote:
> On Wed, Apr 07, 2021 at 05:51:14PM +0200, Jan Beulich wrote:
>> On 31.03.2021 12:32, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/irq.c
>>> +++ b/xen/arch/x86/hvm/irq.c
>>> +void hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
>>> +                                 struct hvm_gsi_eoi_callback *cb)
>>> +{
>>> +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
>>> +    const struct list_head *tmp;
>>> +
>>> +    if ( gsi >= hvm_irq->nr_gsis )
>>> +    {
>>> +        ASSERT_UNREACHABLE();
>>> +        return;
>>> +    }
>>> +
>>> +    write_lock(&hvm_irq->gsi_callbacks_lock);
>>> +    list_for_each ( tmp, &hvm_irq->gsi_callbacks[gsi] )
>>> +        if ( tmp == &cb->list )
>>> +        {
>>> +            list_del(&cb->list);
>>> +            break;
>>> +        }
>>> +    write_unlock(&hvm_irq->gsi_callbacks_lock);
>>> +}
>>
>> Perhaps somehow flag, at least in debug builds, if the callback
>> wasn#t found?
> 
> I've added a debug printf here to warn if the callback is not found,
> but I see it triggering because hpet_set_timer will call
> destroy_periodic_time and create_periodic_time and thus two calls will
> be made to hvm_gsi_unregister_callback. This is fine, but adding a
> message there gets too verbose, so I will drop it and leave the code
> as-is.
> 
> I don't see a problem with calling destroy_periodic_time multiple
> times even if the timer was not active, and that shouldn't result in a
> message being printed.

If destroy_periodic_time() is to remain the only caller, I guess I
agree. Other (future) callers may then need this function to gain
a return value indicating whether the callback was actually found.

Jan

