Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456611BDD71
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 15:22:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTmfp-0007w9-Qt; Wed, 29 Apr 2020 13:22:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2IrC=6N=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jTmfn-0007vs-Iu
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 13:22:47 +0000
X-Inumbo-ID: 843a31e6-8a1c-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 843a31e6-8a1c-11ea-b9cf-bc764e2007e4;
 Wed, 29 Apr 2020 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7+F1l2FcWfs/7ZNEI5erNsE7mfBro9fYkLosgj4p+jg=; b=G2fhviyLBXq7IGGaD1ga1JEv9I
 zWO2XJbDl+3C/RBf2c96nLCTgCb1lr1U+UlIDRsjzzicD5j/U0Up2nfYE+gaHYEnzNGPsnwC9WY/I
 nJunPrpd/yvumE+orsHsLixE7O4pPKgo/H0TVzgXlS2rz4ip5jcmlRBW9wuTi9quMPx8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jTmfj-0001kn-Vs; Wed, 29 Apr 2020 13:22:43 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jTmfj-0002tJ-M2; Wed, 29 Apr 2020 13:22:43 +0000
Subject: Re: [PATCH v2 4/4] x86: adjustments to guest handle treatment
To: Jan Beulich <jbeulich@suse.com>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
 <9108f918-ee44-0740-48e0-7e0b0c761e1b@xen.org>
 <2025316a-de36-91d9-521c-547af668f919@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b7cf3ad4-2537-9df8-7a8a-743cd0fe45c0@xen.org>
Date: Wed, 29 Apr 2020 14:22:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2025316a-de36-91d9-521c-547af668f919@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 22/04/2020 10:32, Jan Beulich wrote:
> On 22.04.2020 10:17, Julien Grall wrote:
>> On 21/04/2020 10:13, Jan Beulich wrote:
>>> First of all avoid excessive conversions. copy_{from,to}_guest(), for
>>> example, work fine with all of XEN_GUEST_HANDLE{,_64,_PARAM}().
>>>
>>> Further
>>> - do_physdev_op_compat() didn't use the param form for its parameter,
>>> - {hap,shadow}_track_dirty_vram() wrongly used the param form,
>>> - compat processor Px logic failed to check compatibility of native and
>>>     compat structures not further converted.
>>>
>>> As this eliminates all users of guest_handle_from_param() and as there's
>>> no real need to allow for conversions in both directions, drop the
>>> macros as well.
>>
>> I was kind of expecting both guest_handle_from_param() and
>> guest_handle_to_param() to be dropped together. May I ask why
>> you still need guest_handle_to_param()?
> 
> There are three (iirc) uses left which I don't really see how
> to sensibly replace. Take a look at the different callers of
> x86's vcpumask_to_pcpumask(), for example.

Oh, const_guest_handle_from_ptr() is returning a GUEST_HANDLE_PARAM. 
This is a bit odd but fair enough.

> 
>>> --- a/xen/include/xen/acpi.h
>>> +++ b/xen/include/xen/acpi.h
>>> @@ -184,8 +184,8 @@ static inline unsigned int acpi_get_csub
>>>    static inline void acpi_set_csubstate_limit(unsigned int new_limit) { return; }
>>>    #endif
>>>    -#ifdef XEN_GUEST_HANDLE_PARAM
>>> -int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE_PARAM(uint32));
>>> +#ifdef XEN_GUEST_HANDLE
>>> +int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE(uint32));
>>>    #endif
>>
>> Do we really need to keep the #ifdef here?
> 
> I think so, yes, or else the original one wouldn't have been
> needed either. (Consider the header getting included without
> any of the public headers having got included first.) Dropping
> (if it was possible) this would be an orthogonal change imo.

Fair point.

Cheers,

-- 
Julien Grall

