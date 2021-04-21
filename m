Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6A03669E6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 13:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114422.218064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZB1D-00071u-I1; Wed, 21 Apr 2021 11:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114422.218064; Wed, 21 Apr 2021 11:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZB1D-00071V-EK; Wed, 21 Apr 2021 11:27:43 +0000
Received: by outflank-mailman (input) for mailman id 114422;
 Wed, 21 Apr 2021 11:27:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GBrH=JS=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1lZB1B-00071O-Vh
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 11:27:42 +0000
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d454bfeb-765d-4557-a325-045a386713c7;
 Wed, 21 Apr 2021 11:27:38 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 04:27:37 -0700
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.149])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 04:27:34 -0700
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
X-Inumbo-ID: d454bfeb-765d-4557-a325-045a386713c7
IronPort-SDR: dkP4CujPo8m3EDoMPhnSk0wxHOBoBnRbUhFadslQNnwYnwDkvAu/5YnEeWTQHB2sYpTsiOMiaM
 DgbOsZqGECCw==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="195795685"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="195795685"
IronPort-SDR: UJ+V1J7VEi4Ck0kzCz/h0TNN0sLaGhQSkmlTCfmoS72BrgmSKiPHjRlX5AAFSjj3KDY/g5RnvB
 9Xzj7OiRSKxQ==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="420958858"
Date: Wed, 21 Apr 2021 19:31:44 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2] VT-d: Don't assume register-based invalidation is
 always supported
Message-ID: <20210421113143.GA19384@gao-cwp>
References: <20200401200606.48752-1-chao.gao@intel.com>
 <YH7uX7RqqIS4zdBt@Air-de-Roger>
 <3afbdba8-b25c-985c-6c5f-20077cb37d3f@suse.com>
 <YH7+i/JVnmZGTHOF@Air-de-Roger>
 <9276b757-a340-b0f3-3427-13b7bc5dcb9e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9276b757-a340-b0f3-3427-13b7bc5dcb9e@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Wed, Apr 21, 2021 at 11:23:13AM +0200, Jan Beulich wrote:
>On 20.04.2021 18:17, Roger Pau Monné wrote:
>> On Tue, Apr 20, 2021 at 05:38:51PM +0200, Jan Beulich wrote:
>>> On 20.04.2021 17:08, Roger Pau Monné wrote:
>>>> On Thu, Apr 02, 2020 at 04:06:06AM +0800, Chao Gao wrote:
>>>>> --- a/xen/drivers/passthrough/vtd/qinval.c
>>>>> +++ b/xen/drivers/passthrough/vtd/qinval.c
>>>>> @@ -442,6 +442,23 @@ int enable_qinval(struct vtd_iommu *iommu)
>>>>>      return 0;
>>>>>  }
>>>>>  
>>>>> +static int vtd_flush_context_noop(struct vtd_iommu *iommu, uint16_t did,
>>>>> +                                  uint16_t source_id, uint8_t function_mask,
>>>>> +                                  uint64_t type, bool flush_non_present_entry)
>>>>> +{
>>>>> +    dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: Cannot flush CONTEXT.\n");
>>>>> +    return -EIO;
>>>>> +}
>>>>> +
>>>>> +static int vtd_flush_iotlb_noop(struct vtd_iommu *iommu, uint16_t did,
>>>>> +                                uint64_t addr, unsigned int size_order,
>>>>> +                                uint64_t type, bool flush_non_present_entry,
>>>>> +                                bool flush_dev_iotlb)
>>>>> +{
>>>>> +    dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: Cannot flush IOTLB.\n");
>>>>> +    return -EIO;
>>>>> +}
>>>>
>>>> I think I would add an ASSERT_UNREACHABLE() to both noop handlers
>>>> above, as I would expect trying to use them without the proper mode
>>>> being configured would point to an error elsewhere?
>>>
>>> If such an assertion triggered e.g. during S3 suspend/resume, it may
>>> lead to the box simply not doing anything useful, without there being
>>> any way to know what went wrong. If instead the system at least
>>> managed to resume, the log message could be observed.
>> 
>> Oh, OK then. I'm simply worried that people might ignore such one line
>> messages, maybe add a WARN?
>
>Hmm, yes, perhaps - would allow seeing right away where the call
>came from. Chao, I'd again be fine to flip the dprintk()-s to
>WARN()-s while committing. But of course only provided you and
>Kevin (as the maintainer) agree.

Sure, please go ahead.

Thanks
Chao

