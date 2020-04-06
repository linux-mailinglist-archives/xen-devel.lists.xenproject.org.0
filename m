Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E458819F3A4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 12:37:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLP83-0006MF-K5; Mon, 06 Apr 2020 10:37:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=glNc=5W=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLP81-0006MA-Ha
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 10:37:17 +0000
X-Inumbo-ID: 950acc1b-77f2-11ea-bfdd-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 950acc1b-77f2-11ea-bfdd-12813bfff9fa;
 Mon, 06 Apr 2020 10:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b/baU/L0piSeiuYqWPSUAgTbQcqIbDeLoRYBEkry69s=; b=qCWmgxARXJOuHGVDSP4wovB/9f
 4ogD9orKYRvY9iVkUwZGAj6IDjWndEnJTpJea9Y1hLsBfI0CEtW6XxMo36cLeZPV1MNqbMJKi8iCP
 XVdiEz+UY8KqMgHtG4xqwZDX71mqSLCM/pVHuvlBfmPr/tc20BWP7/bcUGtteDX/mfiQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLP7y-0007DZ-Qi; Mon, 06 Apr 2020 10:37:14 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLP7y-0003QW-K1; Mon, 06 Apr 2020 10:37:14 +0000
Subject: Re: [PATCH v2] tools/libxl: make default of max event channels
 dependant on vcpus
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20200406082704.13994-1-jgross@suse.com>
 <afc7e988-3b51-bbee-cba8-af30a7605dc4@xen.org>
 <d1b095db-064e-bccf-b55d-d85fecb3045a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <26161282-7bad-5888-16c9-634647e6fde8@xen.org>
Date: Mon, 6 Apr 2020 11:37:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d1b095db-064e-bccf-b55d-d85fecb3045a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi Juergen,

On 06/04/2020 11:17, Jürgen Groß wrote:
> On 06.04.20 11:24, Julien Grall wrote:
>> Hi Jurgen,
>>
>> On 06/04/2020 09:27, Juergen Gross wrote:
>>> Since Xen 4.4 the maximum number of event channels for a guest is
>>> defaulting to 1023. For large guests with lots of vcpus this is not
>>> enough, as e.g. the Linux kernel uses 7 event channels per vcpu,
>>> limiting the guest to about 140 vcpus.
>>
>> Large guests on which arch? Which type of guests?
> 
> I'm pretty sure this applies to x86 only. I'm not aware of event
> channels being used on ARM for IPIs.

How about the guest types?

> 
>>
>>> Instead of requiring to specify the allowed number of event channels
>>> via the "event_channels" domain config option, make the default
>>> depend on the maximum number of vcpus of the guest. This will require
>>> to use the "event_channels" domain config option in fewer cases as
>>> before.
>>>
>>> As different guests will have differing needs the calculation of the
>>> maximum number of event channels can be a rough estimate only,
>>> currently based on the Linux kernel requirements.
>>
>> I am not overly happy to extend the default numbers of event channels 
>> for everyone based on Linux behavior on a given setup. Yes you have 
>> more guests that would be able to run, but at the expense of allowing 
>> a guest to use more xen memory.
> 
> The resulting number would be larger than today only for guests with
> more than 96 vcpus. So I don't think the additional amount of memory
> is really that problematic.
This is not a very forward looking argument. For Arm, we limit to 128 
vCPUs at the moment but it would be possible to support many more (I 
think our vGIC implementation support up to 4096 vCPUs).

So even if your change impacts a small subset, each architectures should 
be able to make the decision on the limit and not imposed by x86 Linux PV.

> 
>>
>> For instance, I don't think this limit increase is necessary on Arm.
>>
>>> Nevertheless it is
>>> much better than the static upper limit of today as more guests will
>>> boot just fine with the new approach.
>>>
>>> In order not to regress current configs use 1023 as the minimum
>>> default setting.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V2:
>>> - use max() instead of min()
>>> - clarify commit message a little bit
>>> ---
>>>   tools/libxl/libxl_create.c | 2 +-
>>
>> The documentation should be updated.
> 
> Oh, indeed.
> 
>>
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
>>> index e7cb2dbc2b..c025b21894 100644
>>> --- a/tools/libxl/libxl_create.c
>>> +++ b/tools/libxl/libxl_create.c
>>> @@ -226,7 +226,7 @@ int libxl__domain_build_info_setdefault(libxl__gc 
>>> *gc,
>>>               b_info->iomem[i].gfn = b_info->iomem[i].start;
>>>       if (!b_info->event_channels)
>>> -        b_info->event_channels = 1023;
>>> +        b_info->event_channels = max(1023, b_info->max_vcpus * 8 + 
>>> 255);
>>
>> What is the 255 for?
> 
> Just some headroom for e.g. pv devices.

That should really be explained in the commit message and a comment.

Cheers,

-- 
Julien Grall

