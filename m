Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DC328D16C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 17:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6299.16782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSMS3-00015E-Le; Tue, 13 Oct 2020 15:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6299.16782; Tue, 13 Oct 2020 15:42:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSMS3-00014p-IJ; Tue, 13 Oct 2020 15:42:59 +0000
Received: by outflank-mailman (input) for mailman id 6299;
 Tue, 13 Oct 2020 15:42:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSMS1-000144-UP
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:42:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0364843-20c5-45f0-a972-d547676dc813;
 Tue, 13 Oct 2020 15:42:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 193F9B2BB;
 Tue, 13 Oct 2020 15:42:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSMS1-000144-UP
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:42:57 +0000
X-Inumbo-ID: b0364843-20c5-45f0-a972-d547676dc813
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b0364843-20c5-45f0-a972-d547676dc813;
	Tue, 13 Oct 2020 15:42:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602603776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cnDjqizlFPZeibM01x0Xf5XBdXKAaJe7w2xKEueQdxs=;
	b=XPNk50KXGJLcYjKTQTkDRfgOPYsX+S6FC0Zkbg4OC2MSl+stqBjRze/p68V8LSi5orL/df
	U9o7cZo1on3Egu04W77qsiJ+E2Fx4pF6rt1wU+9gcfpZL0rneWrWw2e0CxxBp+YgrnNWMj
	ovAGNkf28JmJhlxqMqS4Z5U0+GE585g=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 193F9B2BB;
	Tue, 13 Oct 2020 15:42:56 +0000 (UTC)
Subject: Re: [PATCH v2 04/11] x86/vmsi: use the newly introduced EOI callbacks
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-5-roger.pau@citrix.com>
 <785f80d6-3a0a-6a58-fd9a-05d8ff87f6fe@suse.com>
 <20201013144724.GR19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9253f4a9-66f0-e796-da35-22456545edde@suse.com>
Date: Tue, 13 Oct 2020 17:42:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201013144724.GR19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.10.2020 16:47, Roger Pau Monné wrote:
> On Fri, Oct 02, 2020 at 05:25:34PM +0200, Jan Beulich wrote:
>> On 30.09.2020 12:41, Roger Pau Monne wrote:
>>> @@ -119,7 +126,8 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
>>>  
>>>      ASSERT(pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI);
>>>  
>>> -    vmsi_deliver(d, vector, dest, dest_mode, delivery_mode, trig_mode);
>>> +    vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode, trig_mode,
>>> +                          hvm_dpci_msi_eoi, NULL);
>>>  }
>>
>> While I agree with your reply to Paul regarding Dom0, I still think
>> the entire if() in hvm_dpci_msi_eoi() should be converted into a
>> conditional here. There's no point registering the callback if it's
>> not going to do anything.
>>
>> However, looking further, the "!hvm_domain_irq(d)->dpci &&
>> !is_hardware_domain(d)" can be simply dropped altogether, right away.
>> It's now fulfilled by the identical check at the top of
>> hvm_dirq_assist(), thus guarding the sole call site of this function.
>>
>> The !is_iommu_enabled(d) is slightly more involved to prove, but it
>> should also be possible to simply drop. What might help here is a
>> separate change to suppress opening of HVM_DPCI_SOFTIRQ when there's
>> no IOMMU in the system, as then it becomes obvious that this part of
>> the condition is guaranteed by hvm_do_IRQ_dpci(), being the only
>> site where the softirq can get raised (apart from the softirq
>> handler itself).
>>
>> To sum up - the call above can probably stay as is, but the callback
>> can be simplified as a result of the change.
> 
> Yes, I agree. Would you be fine with converting the check in the
> callback into an assert, or would you rather have it removed
> completely?

Either way is fine with me, I think.

Jan

