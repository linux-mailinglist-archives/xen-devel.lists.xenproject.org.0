Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E56807DA6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 02:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649512.1014078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB2vu-0006ht-LT; Thu, 07 Dec 2023 01:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649512.1014078; Thu, 07 Dec 2023 01:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB2vu-0006fA-HV; Thu, 07 Dec 2023 01:12:06 +0000
Received: by outflank-mailman (input) for mailman id 649512;
 Thu, 07 Dec 2023 01:12:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G8G3=HS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rB2vs-0006f3-OJ
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 01:12:04 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a03f3410-949d-11ee-98e6-6d05b1d4d9a1;
 Thu, 07 Dec 2023 02:12:03 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1701911513696921.4564397189365;
 Wed, 6 Dec 2023 17:11:53 -0800 (PST)
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
X-Inumbo-ID: a03f3410-949d-11ee-98e6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; t=1701911516; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EAM/403bycAwYcCF1d1GvSqqeNtF8MGXEQQWLvVnCS4FggIfBn47xqdeAsDdsMwj+M+5auyct89ZjmvBRzdnt0ugFohX82jKTHIU2Ao4kM1VbFs27FfA1a7TwCge+TrmHdrVX8akifb8U1jmGyOjDVk/2zhp7SmAPVitovyLAn4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1701911516; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lc4sgEPV98YA5hbtBolTVK0qx3NrWU6E3LxJDMRMCTs=; 
	b=bmOK+cEAP0WA69EX/cDeXcA7MP8xwfT1HcY2eW+8KAP4qibn0r35iWgEpJJsJHbQ6GZ1z2dW6PuC6pmB+g63gaucwfymAVjQCZU8HspBzo2H9w0teZ5E262RYJ8CkIEToanWZ91FiC8116fWLZew4gULGLT0TSGqllUorfrxXk4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1701911516;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Lc4sgEPV98YA5hbtBolTVK0qx3NrWU6E3LxJDMRMCTs=;
	b=YYz+b94Ery2I96esYR8ehAkAaNhizyJl80Z9Z4zQDYFAohaWq/bFPDYVSM52385E
	EASlskEkZAo4K5kv3/eqH4bn4Tz5Q8IpBo3obgbAX8tiy4Zcto2iwlTRFID9XdQ96re
	VfDD6bPYcNLKI+AgkOhhLFV5TU/CrFXj/sHeFQ8g=
Message-ID: <25a8a55b-f276-47c9-bec3-56f572f4dc73@apertussolutions.com>
Date: Wed, 6 Dec 2023 20:11:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "Huang, Honglei1"
 <Honglei1.Huang@amd.com>, "Zhang, Julia" <Julia.Zhang@amd.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-2-Jiqian.Chen@amd.com> <ZWX0U1tYooY70UJo@macbook>
 <BL1PR12MB58493CC28A32E3C9B3A1767FE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <14d2dd16-be21-4e9a-97eb-bb477af49e73@apertussolutions.com>
 <930da43f-0395-40cb-a79d-012c4e1acbcb@apertussolutions.com>
 <ZWihrmHpIrI_ccX4@macbook>
 <BL1PR12MB58494BAD4ECCDEB00EACCF9DE786A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZW2zp2emocdOn8_o@macbook>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <ZW2zp2emocdOn8_o@macbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



V/r,
Daniel P. Smith
Apertus Solutions, LLC

On 12/4/23 06:10, Roger Pau Monné wrote:
> On Mon, Dec 04, 2023 at 06:57:03AM +0000, Chen, Jiqian wrote:
>> Hi Daniel P. Smith,
>>
>> On 2023/11/30 22:52, Roger Pau Monné wrote:
>>> On Thu, Nov 30, 2023 at 07:39:38AM -0500, Daniel P. Smith wrote:
>>>> On 11/30/23 07:25, Daniel P. Smith wrote:
>>>>> On 11/30/23 01:22, Chen, Jiqian wrote:
>>>>>> Hi Roger and Daniel P. Smith,
>>>>>>
>>>>>> On 2023/11/28 22:08, Roger Pau Monné wrote:
>>>>>>> On Fri, Nov 24, 2023 at 06:41:34PM +0800, Jiqian Chen wrote:
>>>>>>>> When a device has been reset on dom0 side, the vpci on Xen
>>>>>>>> side won't get notification, so the cached state in vpci is
>>>>>>>> all out of date compare with the real device state.
>>>>>>>> To solve that problem, this patch add new hypercall to clear
>>>>>>>> all vpci device state. And when reset device happens on dom0
>>>>>>>> side, dom0 can call this hypercall to notify vpci.
>>>>>>>>
>>>>>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>>>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>>>>>> ---
>>>>>>>>    xen/arch/x86/hvm/hypercall.c  |  1 +
>>>>>>>>    xen/drivers/passthrough/pci.c | 21 +++++++++++++++++++++
>>>>>>>>    xen/drivers/pci/physdev.c     | 14 ++++++++++++++
>>>>>>>>    xen/drivers/vpci/vpci.c       |  9 +++++++++
>>>>>>>>    xen/include/public/physdev.h  |  2 ++
>>>>>>>>    xen/include/xen/pci.h         |  1 +
>>>>>>>>    xen/include/xen/vpci.h        |  6 ++++++
>>>>>>>>    7 files changed, 54 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/xen/arch/x86/hvm/hypercall.c
>>>>>>>> b/xen/arch/x86/hvm/hypercall.c
>>>>>>>> index eeb73e1aa5..6ad5b4d5f1 100644
>>>>>>>> --- a/xen/arch/x86/hvm/hypercall.c
>>>>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>>>>>>> @@ -84,6 +84,7 @@ long hvm_physdev_op(int cmd,
>>>>>>>> XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>>>>        case PHYSDEVOP_pci_mmcfg_reserved:
>>>>>>>>        case PHYSDEVOP_pci_device_add:
>>>>>>>>        case PHYSDEVOP_pci_device_remove:
>>>>>>>> +    case PHYSDEVOP_pci_device_state_reset:
>>>>>>>>        case PHYSDEVOP_dbgp_op:
>>>>>>>>            if ( !is_hardware_domain(currd) )
>>>>>>>>                return -ENOSYS;
>>>>>>>> diff --git a/xen/drivers/passthrough/pci.c
>>>>>>>> b/xen/drivers/passthrough/pci.c
>>>>>>>> index 04d00c7c37..f871715585 100644
>>>>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>>>>> @@ -824,6 +824,27 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>>>>>>>        return ret;
>>>>>>>>    }
>>>>>>>> +int pci_reset_device_state(u16 seg, u8 bus, u8 devfn)
>>>>>>>
>>>>>>> You could use pci_sbdf_t here instead of 3 parameters.
>>>>>> Will change in next version, thank you.
>>>>>>
>>>>>>>
>>>>>>> I'm however unsure whether we really need this helper just to fetch
>>>>>>> the pdev and call vpci_reset_device_state(), I think you could place
>>>>>>> this logic directly in pci_physdev_op().  Unless there are plans to
>>>>>>> use such logic outside of pci_physdev_op().
>>>>>> If I place the logic of pci_reset_device_state directly in
>>>>>> pci_physdev_op. I think I need to declare vpci_reset_device_state in
>>>>>> pci.h? If it is suitable, I will change in next version.
>>>>>>
>>>>>>>
>>>>>>>> +{
>>>>>>>> +    struct pci_dev *pdev;
>>>>>>>> +    int ret = -ENODEV;
>>>>>>>
>>>>>>> Some XSM check should be introduced fro this operation, as none of the
>>>>>>> existing ones is suitable.  See xsm_resource_unplug_pci() for example.
>>>>>>>
>>>>>>> xsm_resource_reset_state_pci() or some such I would assume.
>>>>>> I don't know what I should do in XSM function(assume it is
>>>>>> xsm_resource_reset_state_pci).
>>>>>> Hi Daniel P. Smith, could you please give me some suggestions?
>>>>>> Just to check the XSM_PRIV action?
>>>>>>
>>>>>
>>>>> Roger, thank you for seeing this and adding me in!
>>>>>
>>>>> Jiqian, I just wanted to let you know I have seen your post but I have
>>>>> been a little tied up this week. Just with the cursory look, I think
>>>>> Roger is suggesting a new XSM check/hook is warranted.
>>>>>
>>>>> If you would like to attempt at writing the dummy policy side, mimic
>>>>> xsm_resource_plug_pci in xen/include/xsm/dummy.h and
>>>>> xen/include/xsm/xsm.h, then I can look at handling the FLASK portion
>>>>> next week and provide it to you for inclusion into the series. If you
>>>>> are not comfortable with it, I can look at the whole thing next week.
>>>>> Just let me know what you would be comfortable with.
>>>>
>>>> Apologies, thinking about for a moment and was thinking the hook should be
>>>> called xsm_resource_config_pci. I would reset as a config operation and
>>>> there might be new ones in the future. I do not believe there is a need to
>>>> have fine grain access control down to individual config operation, thus
>>>> they could all be captured under this one hook. Roger, what are your
>>>> thoughts about this, in particular how you see vpci evolving?
>>>
>>> So the configuration space reset should only be done by the domain
>>> that's also capable of triggering the physical device reset, usually
>>> the hardware domain.  I don't think it's possible ATM to allow a
>>> domain different than the hardware domain to perform a PCI reset, as
>>> doing it requires unmediated access to the PCI config space.
>>>
>>> So resetting the vPCI state should either be limited to the hardware
>>> domain, or to a pci reset capability explicitly
>>> (xsm_resource_reset_pci or some such?).  Or maybe
>>> xsm_resource_config_pci if that denotes unmediated access to the PCI
>>> config space.
>>>
>>> Thanks, Roger.
>>
>> Is it like below that I need to add for XSM?
>> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
>> index e6ffa948f7..7a289ba5d8 100644
>> --- a/xen/xsm/dummy.c
>> +++ b/xen/xsm/dummy.c
>> @@ -91,6 +91,7 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
>>       .resource_plug_pci             = xsm_resource_plug_pci,
>>       .resource_unplug_pci           = xsm_resource_unplug_pci,
>>       .resource_setup_pci            = xsm_resource_setup_pci,
>> +    .resource_config_pci            = xsm_resource_config_pci,
> 
> Now that I look at it, using the existing xsm_resource_setup_pci might
> be enough, no need to introduce a xsm_resource_config_pci.

Ack.

