Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6C24877EC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 14:04:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254443.436273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5ov2-0007nZ-Cx; Fri, 07 Jan 2022 13:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254443.436273; Fri, 07 Jan 2022 13:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5ov2-0007lT-8O; Fri, 07 Jan 2022 13:04:32 +0000
Received: by outflank-mailman (input) for mailman id 254443;
 Fri, 07 Jan 2022 13:04:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wJVr=RX=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1n5ov0-0007jy-JS
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 13:04:30 +0000
Received: from smarthost01a.sbp.mail.zen.net.uk
 (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52e74e83-6fba-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 14:04:20 +0100 (CET)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01a.sbp.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>) id 1n5ouo-0005wL-BT
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 13:04:18 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.92)
 (envelope-from <dvrabel@cantab.net>)
 id 1n5ouf-0003kI-BL; Fri, 07 Jan 2022 13:04:17 +0000
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
X-Inumbo-ID: 52e74e83-6fba-11ec-9ce5-af14b9085ebd
Message-ID: <96e1610b-96a2-b1d7-6c77-b6edaecac4d6@cantab.net>
Date: Fri, 7 Jan 2022 13:04:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220106155442.160258-1-dvrabel@amazon.co.uk>
 <a67bf5fe-ed29-0767-f8ff-eea4a07db1d6@suse.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <a67bf5fe-ed29-0767-f8ff-eea4a07db1d6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH] x86/hvm: save/restore per-VCPU event channel upcall
 vector
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01a-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41

On 06/01/2022 16:48, Jan Beulich wrote:
> On 06.01.2022 16:54, David Vrabel wrote:
>> The Windows XENBUS driver sets the per-VCPU LAPIC vector for event
>> channel interrupts using the HVMOP_set_evtchn_upcall_vector hypercall
>> (rather than using a vector-type callback in the CALLBACK_IRQ HVM
>> parameter since the vectors might be different for different VCPUs).
>>
>> This state needs to be saved/restored or a restored guest may not be
>> able to get an event channel interrupts.
>>
>> Note that the Windows XENBUS driver workarounds this by reissuing the
>> hypercall when resuming after a migration, but this workaround would
>> not be possible in an guest transparent live migration or a live
>> update.
> 
> Why would this be needed only for this one form of "via"? And how do
> you guarantee no observable change in behavior for existing guests?
> It would seem to me that this information is something to be saved /
> restored _only_ during transparent migration, as aware guests may
> deliberately defer re-registration.

I was under the impression that the HVM parameters (including 
CALLBACK_IRQ) were saved/restored so the intent here was to save/restore 
all event channel delivery mechanism state consistently but it seems I 
was confused by some internal work that's not upstream yet.

So, I agree, this patch on it's own doesn't make sense.

I've sent a patch reserving another save record ID instead.

>> +static int hvm_load_evtchn_upcall_vector(
>> +    struct domain *d, hvm_domain_context_t *h)
>> +{
>> +    unsigned int vcpuid;
>> +    struct vcpu *v;
>> +    struct hvm_evtchn_upcall_vector upcall;
>> +
>> +    vcpuid = hvm_load_instance(h);
>> +    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
>> +        return -EINVAL;
>> +
>> +    if ( hvm_load_entry(EVTCHN_UPCALL_VECTOR, h, &upcall) != 0 )
>> +        return -EINVAL;
>> +
>> +    hvm_set_evtchn_upcall_vector(v, upcall.vector);
>> +
>> +    return 0;
>> +}
> 
> Don't you need to also set callback_via_type accordingly?

The callback_via_type is ignored if a per-vcpu upcall vector is set.

You can use a mix of a CALLBACK_IRQ defined upcalls on some VCPUs, and a 
HVMOP_set_evtchn_upcall_vector defined one on others, so setting the 
per-domain type wouldn't work.

I'm not sure why you would do this, but the ABI (as implemented, if not 
intentionally) allows it...

David

