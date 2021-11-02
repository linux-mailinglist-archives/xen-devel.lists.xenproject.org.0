Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C70443028
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 15:18:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220286.381487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhubd-0004M5-Kz; Tue, 02 Nov 2021 14:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220286.381487; Tue, 02 Nov 2021 14:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhubd-0004JD-H8; Tue, 02 Nov 2021 14:17:41 +0000
Received: by outflank-mailman (input) for mailman id 220286;
 Tue, 02 Nov 2021 14:17:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mhubc-0004J7-Pq
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 14:17:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mhubb-0006p8-FJ; Tue, 02 Nov 2021 14:17:39 +0000
Received: from [54.239.6.184] (helo=[192.168.7.68])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mhubb-0004L9-8w; Tue, 02 Nov 2021 14:17:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=AmX5p9kiNwYr/igfoDJ/1uSLSnTcGjwJyV3ex+oxbbo=; b=HwiSZ6D3b43famqS+GeulNwnX4
	C6FhLBT4FXPVBBR5fRV6MfGPA5nJSfuq40s24HPaGkluWDhjeplUNHPncaEWwsmRQSZxL1bPN0/bD
	Vwc/EXa/gdXoUlZsFM2x8wkNmMuiPF+zp92mD+DT+ufSI9e9lDjPxwSoV8ZFHZ+szMDU=;
Message-ID: <418aed9e-adac-28dc-880b-c330c6ac7d34@xen.org>
Date: Tue, 2 Nov 2021 14:17:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com,
 Artem_Mygaiev@epam.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Michal Orzel <michal.orzel@arm.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
 <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
 <f1b49f6d-1c2a-97ff-59b3-f0b606857ed3@suse.com>
 <YYEl8h+WtSZwNPn7@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YYEl8h+WtSZwNPn7@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 02/11/2021 11:50, Roger Pau Monné wrote:
> On Tue, Nov 02, 2021 at 12:19:13PM +0100, Jan Beulich wrote:
>> On 26.10.2021 12:52, Roger Pau Monné wrote:
>>> On Thu, Sep 30, 2021 at 10:52:20AM +0300, Oleksandr Andrushchenko wrote:
>>>> --- a/xen/drivers/vpci/header.c
>>>> +++ b/xen/drivers/vpci/header.c
>>>> @@ -451,6 +451,32 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
>>>>           pci_conf_write16(pdev->sbdf, reg, cmd);
>>>>   }
>>>>   
>>>> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
>>>> +                            uint32_t cmd, void *data)
>>>> +{
>>>> +    /* TODO: Add proper emulation for all bits of the command register. */
>>>> +
>>>> +    if ( (cmd & PCI_COMMAND_INTX_DISABLE) == 0 )
>>>> +    {
>>>> +        /*
>>>> +         * Guest wants to enable INTx. It can't be enabled if:
>>>> +         *  - host has INTx disabled
>>>> +         *  - MSI/MSI-X enabled
>>>> +         */
>>>> +        if ( pdev->vpci->msi->enabled )
>>>> +            cmd |= PCI_COMMAND_INTX_DISABLE;
>>>> +        else
>>>> +        {
>>>> +            uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
>>>> +
>>>> +            if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
>>>> +                cmd |= PCI_COMMAND_INTX_DISABLE;
>>>> +        }
>>>
>>> This last part should be Arm specific. On other architectures we
>>> likely want the guest to modify INTx disable in order to select the
>>> interrupt delivery mode for the device.
>>
>> We cannot allow a guest to clear the bit when it has MSI / MSI-X
>> enabled - only one of the three is supposed to be active at a time.
>> (IOW similarly we cannot allow a guest to enable MSI / MSI-X when
>> the bit is clear.)
> 
> Sure, but this code is making the bit sticky, by not allowing
> INTX_DISABLE to be cleared once set. We do not want that behavior on
> x86, as a guest can decide to use MSI or INTx.

On Arm, I am aware of some hosbridges (e.g. Thunder-X) where legacy 
interrupts are not supported. Do such hostbridges exist x86?

Cheers,

-- 
Julien Grall

