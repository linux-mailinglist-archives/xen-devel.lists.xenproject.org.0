Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A7D19F42F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 13:11:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPew-0002SQ-Oo; Mon, 06 Apr 2020 11:11:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8YOW=5W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLPev-0002SL-Mr
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 11:11:17 +0000
X-Inumbo-ID: 55ab008a-77f7-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55ab008a-77f7-11ea-b4f4-bc764e2007e4;
 Mon, 06 Apr 2020 11:11:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89554ADE8;
 Mon,  6 Apr 2020 11:11:15 +0000 (UTC)
Subject: Re: [PATCH v2] tools/libxl: make default of max event channels
 dependant on vcpus [and 1 more messages]
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200406082704.13994-1-jgross@suse.com>
 <afc7e988-3b51-bbee-cba8-af30a7605dc4@xen.org>
 <d1b095db-064e-bccf-b55d-d85fecb3045a@suse.com>
 <24203.2251.628483.557280@mariner.uk.xensource.com>
 <fd09220a-7470-4679-ce16-f4553579171b@xen.org>
 <26161282-7bad-5888-16c9-634647e6fde8@xen.org>
 <8a6f6e41-9395-6c68-eae9-4c1aeb7d96e2@suse.com>
 <24203.2546.728186.463143@mariner.uk.xensource.com>
 <24203.2996.819908.965198@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <799396b3-0304-e149-cc3f-45c5a46c7c0c@suse.com>
Date: Mon, 6 Apr 2020 13:11:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <24203.2996.819908.965198@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.04.2020 13:00, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH v2] tools/libxl: make default of max event channels dependant on vcpus"):
>> There are no correlation between event channels and vCPUs. The number of 
>> event channels only depends on the number of frontend you have in your 
>> guest. So...
>>
>> Hi Ian,
>>
>> On 06/04/2020 11:47, Ian Jackson wrote:
>>> If ARM folks want to have a different formula for the default then
>>> that is of course fine but I wonder whether this might do ARMk more
>>> harm than good in this case.
>>
>> ... 1023 event channels is going to be plenty enough for most of the use 
>> cases.
> 
> OK, thanks for the quick reply.
> 
> So, Jürgen, I think everyone will be happy with this:

I don't think I will be - my prior comment still holds on there not
being any grounds to use a specific OS kernel's (and to be precise
a specific OS kernel version's) requirements for determining
defaults. If there was to be such a dependency, then OS kernel
[variant] should be part of the inputs to such a (set of) formula(s).

Jan

> Ian Jackson writes ("Re: [PATCH v2] tools/libxl: make default of max event channels dependant on vcpus"):
>> I guess you should make two patches 1. duplicate the existing formula
>> (no functional change) 2. change the x86 formula.
>>
>> I would ack the first and be guided by x86 folks for the 2nd.
> 
> Ian.
> 


