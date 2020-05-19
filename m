Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398181D9B5C
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:34:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb4Fv-0001Tt-TE; Tue, 19 May 2020 15:34:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jb4Fu-0001Te-S2
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:34:10 +0000
X-Inumbo-ID: 2f029626-99e6-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f029626-99e6-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 15:34:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BCD4EAD88;
 Tue, 19 May 2020 15:34:11 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] common/domain: add a domain context record for
 shared_info...
To: paul@xen.org
References: <20200514104416.16657-1-paul@xen.org>
 <20200514104416.16657-5-paul@xen.org>
 <bbebc62f-8066-a60e-5717-58e46cd2d172@suse.com>
 <000a01d62df1$28e876e0$7ab964a0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <035bded3-9542-31e1-aacf-515be43b8536@suse.com>
Date: Tue, 19 May 2020 17:34:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <000a01d62df1$28e876e0$7ab964a0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.05.2020 17:21, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 19 May 2020 15:08
>>
>> On 14.05.2020 12:44, Paul Durrant wrote:
>>> --- a/xen/include/public/save.h
>>> +++ b/xen/include/public/save.h
>>> @@ -73,7 +73,16 @@ struct domain_save_header {
>>>  };
>>>  DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
>>>
>>> -#define DOMAIN_SAVE_CODE_MAX 1
>>> +struct domain_shared_info_context {
>>> +    uint8_t has_32bit_shinfo;
>>> +    uint8_t pad[3];
>>
>> 32-(or 16-)bit flags, with just a single bit used for the purpose?
>>
> 
> I debated that. Given this is xen/tools-only would a bit-field be acceptable?

Looking at domctl.h and sysctl.h, the only instance I can find is a
live-patching struct, and I'd suppose the addition of bitfields there
was missed in the hasty review back then. While it might be
acceptable, I'd recommend against it. It'll bite us the latest with
a port to an arch where endianness is not fixed, and hence may vary
between hypercall caller and callee. The standard way of using
#define-s looks more future proof.

Jan

