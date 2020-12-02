Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09762CC2AD
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 17:48:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42901.77212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkVII-0000Fh-3x; Wed, 02 Dec 2020 16:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42901.77212; Wed, 02 Dec 2020 16:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkVIH-0000F9-WD; Wed, 02 Dec 2020 16:47:54 +0000
Received: by outflank-mailman (input) for mailman id 42901;
 Wed, 02 Dec 2020 16:47:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkVIG-0000F3-Mv
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 16:47:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkVID-0006Ok-1l; Wed, 02 Dec 2020 16:47:49 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkVIC-0004ze-Ca; Wed, 02 Dec 2020 16:47:48 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=IgtC8QEvnHi7quh/t01nXLhSMnMFrS0sCPbUyz0O6V0=; b=GuSh0okzGKVc50oqOHJjXt1MOP
	JZB+egSu6BE1H+6kD1RpfhhaSxS2XGOTXZa1QDFXSmD3IlB5VKEvex5DqW9Y5n2PLcL3pgKTofElV
	PRjBCzOzwMfMABBZRo3K6OM+m6A+iWuowMILBb9H3qNHajEdd9QhVhYTg40FlSqU/JBU=;
Subject: Re: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <de2101687020d18172a2b153f8977a5116d0cd66.1606406359.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012011749550.1100@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <1912278a-13f4-885d-d1ca-cc130718d064@xen.org>
Date: Wed, 2 Dec 2020 16:47:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012011749550.1100@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 02/12/2020 02:51, Stefano Stabellini wrote:
> On Thu, 26 Nov 2020, Rahul Singh wrote:

>> +/* Alias to Xen device tree helpers */
>> +#define device_node dt_device_node
>> +#define of_phandle_args dt_phandle_args
>> +#define of_device_id dt_device_match
>> +#define of_match_node dt_match_node
>> +#define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np, pname, out))
>> +#define of_property_read_bool dt_property_read_bool
>> +#define of_parse_phandle_with_args dt_parse_phandle_with_args
> 
> Given all the changes to the file by the previous patches we are
> basically fully (or almost fully) adapting this code to Xen.
> 
> So at that point I wonder if we should just as well make these changes
> (e.g. s/of_phandle_args/dt_phandle_args/g) to the code too.

I have already accepted the fact that keeping Linux code as-is is nearly 
impossible without much workaround :). The benefits tends to also 
limited as we noticed for the SMMU driver.

I would like to point out that this may make quite difficult (if not 
impossible) to revert the previous patches which remove support for some 
features (e.g. atomic, MSI, ATS).

If we are going to adapt the code to Xen (I'd like to keep Linux code 
style though), then I think we should consider to keep code that may be 
useful in the near future (at least MSI, ATS).

> 
>> +#define FIELD_GET(_mask, _reg)          \
>> +    (typeof(_mask))(((_reg) & (_mask)) >> (__builtin_ffsll(_mask) - 1))
>> +
>> +#define WRITE_ONCE(x, val)                  \
>> +do {                                        \
>> +    *(volatile typeof(x) *)&(x) = (val);    \
>> +} while (0)
> 
> maybe we should define this in xen/include/xen/lib.h

I have attempted such discussion in the past and this resulted to more 
bikeshed than it is worth it. So I would suggest to re-implement 
WRITE_ONCE() as write_atomic() for now.

Cheers,

-- 
Julien Grall

