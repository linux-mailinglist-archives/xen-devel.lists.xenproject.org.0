Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000AC2F60CA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 13:12:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66970.119179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l01Tw-0004Au-Sk; Thu, 14 Jan 2021 12:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66970.119179; Thu, 14 Jan 2021 12:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l01Tw-0004AV-Ok; Thu, 14 Jan 2021 12:12:04 +0000
Received: by outflank-mailman (input) for mailman id 66970;
 Thu, 14 Jan 2021 12:12:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l01Tv-0004AQ-BU
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 12:12:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8172ece-69c3-4589-b913-5b652948a9af;
 Thu, 14 Jan 2021 12:12:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0BF21B7A4;
 Thu, 14 Jan 2021 12:12:01 +0000 (UTC)
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
X-Inumbo-ID: b8172ece-69c3-4589-b913-5b652948a9af
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610626321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3uikZFs5CGBEAcMoH/aXlodX+AAKfVXCI9Cvsh94HqA=;
	b=YLKvbN7rFyRn27iR3o9ZBbQ8MO56MyMzRoWOVxEg/BpQJZsJWLUINiOrt+NSPAccW0jMWO
	B3tpTgrihgH+KWX8WiFEvPgzcof86nblxO2I8fNW6amXVSwh8Kfy1A23cS2nAkzPqFKVTt
	I7a8Ap1nyqvXk9YObLOdxXx9HIyfGRs=
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 "Tian, Kevin" <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <20dd6c2a-a576-e4ff-53da-88de97c803ed@suse.com>
 <8da05add-656c-0e18-793b-38ac468b6ed7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <06ffa0bd-311b-eaca-701d-289aabe8e6a4@suse.com>
Date: Thu, 14 Jan 2021 13:12:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8da05add-656c-0e18-793b-38ac468b6ed7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.01.2021 12:56, Andrew Cooper wrote:
> On 14/01/2021 11:48, Jan Beulich wrote:
>> On 13.01.2021 14:11, Roger Pau Monné wrote:
>>> On Wed, Jan 13, 2021 at 06:21:03AM +0000, Tian, Kevin wrote:
>>>>> From: Roger Pau Monne <roger.pau@citrix.com>
>>>>> As with previous patches, I'm having a hard time figuring out why this
>>>>> was required in the first place. I see no reason for Xen to be
>>>>> deasserting the guest virtual line. There's a comment:
>>>>>
>>>>> /*
>>>>>  * Set a timer to see if the guest can finish the interrupt or not. For
>>>>>  * example, the guest OS may unmask the PIC during boot, before the
>>>>>  * guest driver is loaded. hvm_pci_intx_assert() may succeed, but the
>>>>>  * guest will never deal with the irq, then the physical interrupt line
>>>>>  * will never be deasserted.
>>>>>  */
>>>>>
>>>>> Did this happen because the device was passed through in a bogus state
>>>>> where it would generate interrupts without the guest requesting
>>>> It could be a case where two devices share the same interrupt line and
>>>> are assigned to different domains. In this case, the interrupt activity of 
>>>> two devices interfere with each other.
>>> This would also seem to be problematic if the device decides to use
>>> MSI instead of INTx, but due to the shared nature of the INTx line we
>>> would continue to inject INTx (generated from another device not
>>> passed through to the guest) to the guest even if the device has
>>> switched to MSI.
>> I'm having trouble with this: How does the INTx line matter when
>> a device is using MSI? I don't see why we should inject INTx when
>> the guest has configured a device for MSI; if we do, this would
>> indeed look like a bug (but aiui we bind either the MSI IRQ or
>> the pin based one, but not both).
> 
> When MSI is configured, a spec-complient device shouldn't raise INTx. 
> But there are plenty of quirks in practice, and ample opportunity for
> races, considering that in a Xen system, there are at least 3 entities
> in the system fighting over control of the device.
> 
> I suspect the problem is "what happens when Xen gets an INTx".  We don't
> know which device it came from, and therefore we can't even attempt to
> filter out the devices we suspect are using MSI, in an attempt to avoid
> raising the line with every domain.

The domain using MSI won't have the INTx IRQ bound, so won't be
notified of the INTx instance at all. What is likely to happen
is that the other domain(s) sharing the same INTx IRQ would get
notified, but won't find anything to do. Which in turn may lead
to the EOI timer getting engaged, and hence IRQs over this line
getting throttled.

Jan

