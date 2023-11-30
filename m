Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF03D7FEF0D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 13:25:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644598.1005800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8g6W-0002Jj-SQ; Thu, 30 Nov 2023 12:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644598.1005800; Thu, 30 Nov 2023 12:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8g6W-0002Gt-P4; Thu, 30 Nov 2023 12:25:16 +0000
Received: by outflank-mailman (input) for mailman id 644598;
 Thu, 30 Nov 2023 12:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cc+B=HL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1r8g6V-0002Gl-UI
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 12:25:16 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8219ab5b-8f7b-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 13:25:13 +0100 (CET)
Received: from [10.10.1.94] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1701347107310525.4389985845953;
 Thu, 30 Nov 2023 04:25:07 -0800 (PST)
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
X-Inumbo-ID: 8219ab5b-8f7b-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1701347108; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kO2K1rIsIKwUXeaDQTnmz0CyXLeP7NS6+MUHGbKfmuS/O6erApdCbzAxylZhQfvooblxNttG+UyOJ8Um6M8cwJx0xaOQACRPIbM/7D1Wmsos4FYMUMdkdE66Kw63k18iHYXkw6XFDzbuLGHsqNRWnWqmIS/gae1MbhKt9hS3H3A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1701347108; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xOxn5xyE4S+AqJoqAyjd4VnJDGClj7lClMain6qvbOI=; 
	b=A2NZYY0NX8NfpHn10Y5ZrH0s9nms2Gpqyj9zcdiERPqD1xX9zC0oBmV/GIurNUioa+t9xbYcDaVeTurE963nHy3yzaJR9nRVkp28eIalw39csbOAXKkIRVt137QUmTNentNTiYz1n1Rlr9G83Wv4Gfvnl/n6U2k6xa2mh8h0x/0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1701347108;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xOxn5xyE4S+AqJoqAyjd4VnJDGClj7lClMain6qvbOI=;
	b=X4MUN5vryIMIWXQgYUeQkB8bZ8ZuHwF38mQAZmRXMBqEmwkeVd52lXx5GDhXJM14
	h00B++V7m/WVKIj3HXHNj/lZS7564urUxZ5oyn4WAV/wfGniUXDoJ0sR+PqX5Nxqx7J
	NPUikiEERtKrrCUxRbrujpxAfzZXOdnsrxlN6rfU=
Message-ID: <14d2dd16-be21-4e9a-97eb-bb477af49e73@apertussolutions.com>
Date: Thu, 30 Nov 2023 07:25:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Content-Language: en-US
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <BL1PR12MB58493CC28A32E3C9B3A1767FE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/30/23 01:22, Chen, Jiqian wrote:
> Hi Roger and Daniel P. Smith,
> 
> On 2023/11/28 22:08, Roger Pau Monné wrote:
>> On Fri, Nov 24, 2023 at 06:41:34PM +0800, Jiqian Chen wrote:
>>> When a device has been reset on dom0 side, the vpci on Xen
>>> side won't get notification, so the cached state in vpci is
>>> all out of date compare with the real device state.
>>> To solve that problem, this patch add new hypercall to clear
>>> all vpci device state. And when reset device happens on dom0
>>> side, dom0 can call this hypercall to notify vpci.
>>>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> ---
>>>   xen/arch/x86/hvm/hypercall.c  |  1 +
>>>   xen/drivers/passthrough/pci.c | 21 +++++++++++++++++++++
>>>   xen/drivers/pci/physdev.c     | 14 ++++++++++++++
>>>   xen/drivers/vpci/vpci.c       |  9 +++++++++
>>>   xen/include/public/physdev.h  |  2 ++
>>>   xen/include/xen/pci.h         |  1 +
>>>   xen/include/xen/vpci.h        |  6 ++++++
>>>   7 files changed, 54 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
>>> index eeb73e1aa5..6ad5b4d5f1 100644
>>> --- a/xen/arch/x86/hvm/hypercall.c
>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>> @@ -84,6 +84,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>       case PHYSDEVOP_pci_mmcfg_reserved:
>>>       case PHYSDEVOP_pci_device_add:
>>>       case PHYSDEVOP_pci_device_remove:
>>> +    case PHYSDEVOP_pci_device_state_reset:
>>>       case PHYSDEVOP_dbgp_op:
>>>           if ( !is_hardware_domain(currd) )
>>>               return -ENOSYS;
>>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>>> index 04d00c7c37..f871715585 100644
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -824,6 +824,27 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>>       return ret;
>>>   }
>>>   
>>> +int pci_reset_device_state(u16 seg, u8 bus, u8 devfn)
>>
>> You could use pci_sbdf_t here instead of 3 parameters.
> Will change in next version, thank you.
> 
>>
>> I'm however unsure whether we really need this helper just to fetch
>> the pdev and call vpci_reset_device_state(), I think you could place
>> this logic directly in pci_physdev_op().  Unless there are plans to
>> use such logic outside of pci_physdev_op().
> If I place the logic of pci_reset_device_state directly in pci_physdev_op. I think I need to declare vpci_reset_device_state in pci.h? If it is suitable, I will change in next version.
> 
>>
>>> +{
>>> +    struct pci_dev *pdev;
>>> +    int ret = -ENODEV;
>>
>> Some XSM check should be introduced fro this operation, as none of the
>> existing ones is suitable.  See xsm_resource_unplug_pci() for example.
>>
>> xsm_resource_reset_state_pci() or some such I would assume.
> I don't know what I should do in XSM function(assume it is xsm_resource_reset_state_pci).
> Hi Daniel P. Smith, could you please give me some suggestions?
> Just to check the XSM_PRIV action?
> 

Roger, thank you for seeing this and adding me in!

Jiqian, I just wanted to let you know I have seen your post but I have 
been a little tied up this week. Just with the cursory look, I think 
Roger is suggesting a new XSM check/hook is warranted.

If you would like to attempt at writing the dummy policy side, mimic 
xsm_resource_plug_pci in xen/include/xsm/dummy.h and 
xen/include/xsm/xsm.h, then I can look at handling the FLASK portion 
next week and provide it to you for inclusion into the series. If you 
are not comfortable with it, I can look at the whole thing next week. 
Just let me know what you would be comfortable with.

v/r,
dps

