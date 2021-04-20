Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2605365C56
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 17:39:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113873.216962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsSk-0002Bt-3p; Tue, 20 Apr 2021 15:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113873.216962; Tue, 20 Apr 2021 15:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsSj-0002BR-W1; Tue, 20 Apr 2021 15:38:53 +0000
Received: by outflank-mailman (input) for mailman id 113873;
 Tue, 20 Apr 2021 15:38:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYsSj-0002BK-78
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 15:38:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c199bc92-0343-449d-8e32-d5ffdbe2c021;
 Tue, 20 Apr 2021 15:38:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 548BEB4B1;
 Tue, 20 Apr 2021 15:38:51 +0000 (UTC)
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
X-Inumbo-ID: c199bc92-0343-449d-8e32-d5ffdbe2c021
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618933131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mfLjm2j9FW4so4YGfWs4EIYY+t4828KXFSH+UBDo71g=;
	b=KWzq66zdocOCIMlMS1TbbFWndVyetzgri6EeWJjUrBWB9g1sbHmS12lYwcQ9vG5eBU/uwd
	fwuGH6FCtQ6xc4Yym2NYFhlcpihlzSmdx6I/fAg30aVl+C3YHlrym/vtw374/kjf65wahJ
	Fntb8U+EdmDR8fVpwbYbyBDmlrVk4fY=
Subject: Re: [PATCH v2] VT-d: Don't assume register-based invalidation is
 always supported
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Chao Gao <chao.gao@intel.com>
References: <20200401200606.48752-1-chao.gao@intel.com>
 <YH7uX7RqqIS4zdBt@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3afbdba8-b25c-985c-6c5f-20077cb37d3f@suse.com>
Date: Tue, 20 Apr 2021 17:38:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YH7uX7RqqIS4zdBt@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 17:08, Roger Pau Monné wrote:
> On Thu, Apr 02, 2020 at 04:06:06AM +0800, Chao Gao wrote:
>> --- a/xen/drivers/passthrough/vtd/qinval.c
>> +++ b/xen/drivers/passthrough/vtd/qinval.c
>> @@ -442,6 +442,23 @@ int enable_qinval(struct vtd_iommu *iommu)
>>      return 0;
>>  }
>>  
>> +static int vtd_flush_context_noop(struct vtd_iommu *iommu, uint16_t did,
>> +                                  uint16_t source_id, uint8_t function_mask,
>> +                                  uint64_t type, bool flush_non_present_entry)
>> +{
>> +    dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: Cannot flush CONTEXT.\n");
>> +    return -EIO;
>> +}
>> +
>> +static int vtd_flush_iotlb_noop(struct vtd_iommu *iommu, uint16_t did,
>> +                                uint64_t addr, unsigned int size_order,
>> +                                uint64_t type, bool flush_non_present_entry,
>> +                                bool flush_dev_iotlb)
>> +{
>> +    dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: Cannot flush IOTLB.\n");
>> +    return -EIO;
>> +}
> 
> I think I would add an ASSERT_UNREACHABLE() to both noop handlers
> above, as I would expect trying to use them without the proper mode
> being configured would point to an error elsewhere?

If such an assertion triggered e.g. during S3 suspend/resume, it may
lead to the box simply not doing anything useful, without there being
any way to know what went wrong. If instead the system at least
managed to resume, the log message could be observed.

Jan

