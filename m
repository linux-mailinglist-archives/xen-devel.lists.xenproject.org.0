Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC21C6D72
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 11:45:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWGcI-0000Dy-UJ; Wed, 06 May 2020 09:45:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C64T=6U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jWGcH-0000Ds-HV
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 09:45:25 +0000
X-Inumbo-ID: 4f0981a5-8f7e-11ea-9e2b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f0981a5-8f7e-11ea-9e2b-12813bfff9fa;
 Wed, 06 May 2020 09:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YTAfR6Ikyr6Y/khl6iA0fhEplgR7Z4Y3RkEVfoPbqoc=; b=xUO5jh5Sf1YvzpbCKj3LhpcP/v
 uL/FE1O91wnQZSLOnzvgowv11WruYb65ppD5L2WXUSH04qSg/IFE8U8ICQ/ymw3yIv7YP8dDR/Cwb
 TKDTEIQ0q3/9HeAo3+B2YaNaKi4lPyMwNGwiIlyEuY8+ENIIrdHpWM0KvGf7LuKR/q5c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jWGcG-0000wh-AV; Wed, 06 May 2020 09:45:24 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jWGcG-0000VQ-3g; Wed, 06 May 2020 09:45:24 +0000
Subject: Re: [PATCH v2 4/4] x86: adjustments to guest handle treatment
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
 <20200422082610.GA28601@Air-de-Roger>
 <0b43670b-cc0b-0b0b-ef24-4734de35d4b7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6eaa1d25-7a91-d2ef-db01-20c5cb5101c4@xen.org>
Date: Wed, 6 May 2020 10:45:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0b43670b-cc0b-0b0b-ef24-4734de35d4b7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 05/05/2020 07:26, Jan Beulich wrote:
> On 22.04.2020 10:26, Roger Pau Monné wrote:
>> On Tue, Apr 21, 2020 at 11:13:23AM +0200, Jan Beulich wrote:
>>> First of all avoid excessive conversions. copy_{from,to}_guest(), for
>>> example, work fine with all of XEN_GUEST_HANDLE{,_64,_PARAM}().
>>>
>>> Further
>>> - do_physdev_op_compat() didn't use the param form for its parameter,
>>> - {hap,shadow}_track_dirty_vram() wrongly used the param form,
>>> - compat processor Px logic failed to check compatibility of native and
>>>    compat structures not further converted.
>>>
>>> As this eliminates all users of guest_handle_from_param() and as there's
>>> no real need to allow for conversions in both directions, drop the
>>> macros as well.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> [...]
>>> --- a/xen/drivers/acpi/pmstat.c
>>> +++ b/xen/drivers/acpi/pmstat.c
>>> @@ -492,7 +492,7 @@ int do_pm_op(struct xen_sysctl_pm_op *op
>>>       return ret;
>>>   }
>>>   
>>> -int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE_PARAM(uint32) pdc)
>>> +int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
>>
>> Nit: switch to uint32_t while there?
>>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Unless I hear objections, I'm intending to commit this then in a
> day or two with the suggested change made and the R-b given. Of
> course a formally required ack for the Arm side dropping of
> guest_handle_from_param() would still be nice ...

I missed the small change on Arm sorry:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

