Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4640818978
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 15:12:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656863.1025358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFapW-0004du-EU; Tue, 19 Dec 2023 14:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656863.1025358; Tue, 19 Dec 2023 14:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFapW-0004cA-BM; Tue, 19 Dec 2023 14:12:18 +0000
Received: by outflank-mailman (input) for mailman id 656863;
 Tue, 19 Dec 2023 14:12:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFapV-0004bz-6J
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 14:12:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFapR-0002U3-G9; Tue, 19 Dec 2023 14:12:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFapR-0000R8-AU; Tue, 19 Dec 2023 14:12:13 +0000
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
	bh=5/aYn7f0tgM9L/G0Ss1EykobyOsngjASwlLsoeZwwZU=; b=K1oSAmmanfYx6eG+I+jKiYxeGo
	Kiyabfnze6CMtOxdGnzxPpnynbRMK/RnF74H143+TtG87hZc0nw8tBT3pL/6jMusGcR3g6pW6If9i
	YIrQ+E5YHS9LDp4YV4C90HXAgZ8n2BtG4wfDviZaIQNyQ6SWU/6Oj8Fc+Gvyx36oCW0c=;
Message-ID: <ea17d6e0-9980-4bcc-9d3a-60273d6386a9@xen.org>
Date: Tue, 19 Dec 2023 14:12:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
 <7a149ad7-0363-4f4a-9de5-76be382e774c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7a149ad7-0363-4f4a-9de5-76be382e774c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/12/2023 13:57, Jan Beulich wrote:
> On 19.12.2023 14:48, Mykyta Poturai wrote:
>> This patch adds the ability for the device emulator to inject MSI
>> interrupts into guests. This is done by adding a new DM op to the device
>> model library.
>>
>> It is not possible to reuse already existing inject_msi DM op, because
>> it does not have a devid parameter, which is required for translation of
>> MSIs to interrupt numbers on ARM.
> 
> Yet then ...
> 
>> @@ -112,6 +113,20 @@ int dm_op(const struct dmop_args *op_args)
>>           break;
>>       }
>>   
>> +    case XEN_DMOP_arm_inject_msi:
>> +    {
>> +        const struct xen_dm_op_arm_inject_msi *data =
>> +            &op.u.arm_inject_msi;
>> +
>> +        if ( d->arch.vgic.its == NULL )
>> +        {
>> +            rc = -EINVAL;
>> +            break;
>> +        }
>> +        vgic_its_trigger_msi(d, d->arch.vgic.its, data->devid, data->data);
>> +        break;
>> +
>> +    }
> 
> ... you're not using the addr field at all, which therefore could likely
> hold the devid data (encoded to really represent some form of address,
> or stored directly - much depends on what purpose the address serves on
> Arm for MSI).

For real HW, the address would point to an ITS doorbell. All access will 
be tagged by the HW with the DeviceID. This is then used with the data 
(an event ID) to look up the associated interrupt.

I think for Xen on Arm, we want 'addr' to be the SBDF. This could then 
be used to find the associated vITS and device ID.

Ideally, this is an interface that will be agnostic to the MSI 
controller (someone need to check if the model I suggested above works 
with the GICv2m).

Cheers,

-- 
Julien Grall

