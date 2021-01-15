Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9482F7693
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 11:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67908.121411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0MHh-0006in-62; Fri, 15 Jan 2021 10:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67908.121411; Fri, 15 Jan 2021 10:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0MHh-0006iO-2E; Fri, 15 Jan 2021 10:24:49 +0000
Received: by outflank-mailman (input) for mailman id 67908;
 Fri, 15 Jan 2021 10:24:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0MHf-0006iJ-9U
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 10:24:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 085cfa15-5eb3-4f94-b827-7d4ee5837b78;
 Fri, 15 Jan 2021 10:24:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FE61AA6F;
 Fri, 15 Jan 2021 10:24:45 +0000 (UTC)
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
X-Inumbo-ID: 085cfa15-5eb3-4f94-b827-7d4ee5837b78
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610706285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxGI4LpKKv9h1nktyGol+T7Ql3lR2HnO68Pe/GzGSPk=;
	b=BgnnH2Z5sgtyK8CzA3u+G0ofGg/Srl1Ih07Gz6TCSs0YDKu+Ev5e6+u1YhQokqVYzoFI26
	jPepyJJ7IF0JiK1Y1O7yu3KZkvUU+vilAfB5mD4ZFLekpSEnczxWxuZ2dppz0gWw69y4hg
	tUN8+j5LQYKbAoanC9kwQgKNiWx0DwU=
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <20dd6c2a-a576-e4ff-53da-88de97c803ed@suse.com>
 <20210114125447.ob453h3avcug7pkc@Air-de-Roger>
 <730c73f8-d495-e887-44f3-2f19150c7fc9@suse.com>
 <20210114172259.zqxmhlipwkk2taxn@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <21bb9351-d972-d457-447f-afb18155c0f0@suse.com>
Date: Fri, 15 Jan 2021 11:24:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210114172259.zqxmhlipwkk2taxn@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.01.2021 18:22, Roger Pau Monné wrote:
> On Thu, Jan 14, 2021 at 02:30:15PM +0100, Jan Beulich wrote:
>> On 14.01.2021 13:54, Roger Pau Monné wrote:
>>> On Thu, Jan 14, 2021 at 12:48:59PM +0100, Jan Beulich wrote:
>>>> On 13.01.2021 14:11, Roger Pau Monné wrote:
>>>>> On Wed, Jan 13, 2021 at 06:21:03AM +0000, Tian, Kevin wrote:
>>>>>>> From: Roger Pau Monne <roger.pau@citrix.com>
>>>>>>> As with previous patches, I'm having a hard time figuring out why this
>>>>>>> was required in the first place. I see no reason for Xen to be
>>>>>>> deasserting the guest virtual line. There's a comment:
>>>>>>>
>>>>>>> /*
>>>>>>>  * Set a timer to see if the guest can finish the interrupt or not. For
>>>>>>>  * example, the guest OS may unmask the PIC during boot, before the
>>>>>>>  * guest driver is loaded. hvm_pci_intx_assert() may succeed, but the
>>>>>>>  * guest will never deal with the irq, then the physical interrupt line
>>>>>>>  * will never be deasserted.
>>>>>>>  */
>>>>>>>
>>>>>>> Did this happen because the device was passed through in a bogus state
>>>>>>> where it would generate interrupts without the guest requesting
>>>>>>
>>>>>> It could be a case where two devices share the same interrupt line and
>>>>>> are assigned to different domains. In this case, the interrupt activity of 
>>>>>> two devices interfere with each other.
>>>>>
>>>>> This would also seem to be problematic if the device decides to use
>>>>> MSI instead of INTx, but due to the shared nature of the INTx line we
>>>>> would continue to inject INTx (generated from another device not
>>>>> passed through to the guest) to the guest even if the device has
>>>>> switched to MSI.
>>>>
>>>> I'm having trouble with this: How does the INTx line matter when
>>>> a device is using MSI? I don't see why we should inject INTx when
>>>> the guest has configured a device for MSI; if we do, this would
>>>> indeed look like a bug (but aiui we bind either the MSI IRQ or
>>>> the pin based one, but not both).
>>>
>>> If the IRQ is shared between multiple devices Xen could continue to
>>> receive interrupts on that IRQ, and thus inject them to the guest?
>>> Even if the device passed through to that specific guest has switched
>>> to use MSI.
>>>
>>> Maybe I'm missing something, but I don't see QEMU removing the INTx
>>> PIRQ binding when MSI(-X) is enabled for a guest device passed
>>> through.
>>
>> This would then match my "would indeed look like a bug". I don't see
>> why this mapping would need keeping once MSI is in use. (In fact it
>> probably shouldn't be the act of enabling MSI where this gets
>> removed, but the setting of PCI_COMMAND_INTX_DISABLE by the guest.)
> 
> We would also need to assert that no other passthrough device on the
> guest is using that same irq bounding, or else we would wedge
> interrupts for that other device.

Oh, right - this sadly is one of the various things that aren't
properly ref-counted.

Jan

