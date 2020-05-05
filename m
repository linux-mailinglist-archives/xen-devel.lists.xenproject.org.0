Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D331C4E4F
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 08:26:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVr24-0002n0-On; Tue, 05 May 2020 06:26:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVr23-0002mv-UC
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 06:26:19 +0000
X-Inumbo-ID: 538d687b-8e99-11ea-9d8c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 538d687b-8e99-11ea-9d8c-12813bfff9fa;
 Tue, 05 May 2020 06:26:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 020FAAB8F;
 Tue,  5 May 2020 06:26:19 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] x86: adjustments to guest handle treatment
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
 <20200422082610.GA28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b43670b-cc0b-0b0b-ef24-4734de35d4b7@suse.com>
Date: Tue, 5 May 2020 08:26:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422082610.GA28601@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 22.04.2020 10:26, Roger Pau Monné wrote:
> On Tue, Apr 21, 2020 at 11:13:23AM +0200, Jan Beulich wrote:
>> First of all avoid excessive conversions. copy_{from,to}_guest(), for
>> example, work fine with all of XEN_GUEST_HANDLE{,_64,_PARAM}().
>>
>> Further
>> - do_physdev_op_compat() didn't use the param form for its parameter,
>> - {hap,shadow}_track_dirty_vram() wrongly used the param form,
>> - compat processor Px logic failed to check compatibility of native and
>>   compat structures not further converted.
>>
>> As this eliminates all users of guest_handle_from_param() and as there's
>> no real need to allow for conversions in both directions, drop the
>> macros as well.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>[...]
>> --- a/xen/drivers/acpi/pmstat.c
>> +++ b/xen/drivers/acpi/pmstat.c
>> @@ -492,7 +492,7 @@ int do_pm_op(struct xen_sysctl_pm_op *op
>>      return ret;
>>  }
>>  
>> -int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE_PARAM(uint32) pdc)
>> +int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
> 
> Nit: switch to uint32_t while there?
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Unless I hear objections, I'm intending to commit this then in a
day or two with the suggested change made and the R-b given. Of
course a formally required ack for the Arm side dropping of
guest_handle_from_param() would still be nice ...

Jan

