Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D419019F367
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 12:18:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLOp8-0004ep-Pc; Mon, 06 Apr 2020 10:17:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jLOp7-0004ek-N7
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 10:17:45 +0000
X-Inumbo-ID: dabc0007-77ef-11ea-bfdc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dabc0007-77ef-11ea-bfdc-12813bfff9fa;
 Mon, 06 Apr 2020 10:17:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7AE66AC11;
 Mon,  6 Apr 2020 10:17:42 +0000 (UTC)
Subject: Re: [PATCH v2] tools/libxl: make default of max event channels
 dependant on vcpus
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200406082704.13994-1-jgross@suse.com>
 <afc7e988-3b51-bbee-cba8-af30a7605dc4@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d1b095db-064e-bccf-b55d-d85fecb3045a@suse.com>
Date: Mon, 6 Apr 2020 12:17:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <afc7e988-3b51-bbee-cba8-af30a7605dc4@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.04.20 11:24, Julien Grall wrote:
> Hi Jurgen,
> 
> On 06/04/2020 09:27, Juergen Gross wrote:
>> Since Xen 4.4 the maximum number of event channels for a guest is
>> defaulting to 1023. For large guests with lots of vcpus this is not
>> enough, as e.g. the Linux kernel uses 7 event channels per vcpu,
>> limiting the guest to about 140 vcpus.
> 
> Large guests on which arch? Which type of guests?

I'm pretty sure this applies to x86 only. I'm not aware of event
channels being used on ARM for IPIs.

> 
>> Instead of requiring to specify the allowed number of event channels
>> via the "event_channels" domain config option, make the default
>> depend on the maximum number of vcpus of the guest. This will require
>> to use the "event_channels" domain config option in fewer cases as
>> before.
>>
>> As different guests will have differing needs the calculation of the
>> maximum number of event channels can be a rough estimate only,
>> currently based on the Linux kernel requirements.
> 
> I am not overly happy to extend the default numbers of event channels 
> for everyone based on Linux behavior on a given setup. Yes you have more 
> guests that would be able to run, but at the expense of allowing a guest 
> to use more xen memory.

The resulting number would be larger than today only for guests with
more than 96 vcpus. So I don't think the additional amount of memory
is really that problematic.

> 
> For instance, I don't think this limit increase is necessary on Arm.
> 
>> Nevertheless it is
>> much better than the static upper limit of today as more guests will
>> boot just fine with the new approach.
>>
>> In order not to regress current configs use 1023 as the minimum
>> default setting.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - use max() instead of min()
>> - clarify commit message a little bit
>> ---
>>   tools/libxl/libxl_create.c | 2 +-
> 
> The documentation should be updated.

Oh, indeed.

> 
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
>> index e7cb2dbc2b..c025b21894 100644
>> --- a/tools/libxl/libxl_create.c
>> +++ b/tools/libxl/libxl_create.c
>> @@ -226,7 +226,7 @@ int libxl__domain_build_info_setdefault(libxl__gc 
>> *gc,
>>               b_info->iomem[i].gfn = b_info->iomem[i].start;
>>       if (!b_info->event_channels)
>> -        b_info->event_channels = 1023;
>> +        b_info->event_channels = max(1023, b_info->max_vcpus * 8 + 255);
> 
> What is the 255 for?

Just some headroom for e.g. pv devices.


Juergen

