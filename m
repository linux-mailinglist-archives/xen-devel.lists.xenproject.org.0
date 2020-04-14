Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420CF1A788E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 12:39:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOIxc-0006jH-4m; Tue, 14 Apr 2020 10:38:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1gEY=56=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOIxa-0006jC-KG
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 10:38:30 +0000
X-Inumbo-ID: 14b175dc-7e3c-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14b175dc-7e3c-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cfI1M21/GnjXK7e4TZAloK4ojaKa+Or9W0AEaI7jEHY=; b=oeBmwK26o9ooEM69CP0N8baGM9
 oO49pd7iXvVZsOPIUGdL6MqJsaGLcw4cGXNcu0VXaT/q1WYqTE17f5n2xz8XzhIMnDEHsdjDYn4UX
 Wg6IsbqUYxoQc4WIiHQv/BYJrbYJyHmYYZty3phyPyZPQ1kGQyh1X+Y1jVP/FnTzF51o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOIxU-0007H2-F3; Tue, 14 Apr 2020 10:38:24 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOIxU-00024h-7q; Tue, 14 Apr 2020 10:38:24 +0000
Subject: Re: [PATCH v7 09/12] xen: add runtime parameter access support to
 hypfs
To: Jan Beulich <jbeulich@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-10-jgross@suse.com>
 <f08bdac6-122a-9289-3241-a0460a73c686@suse.com>
 <1a68e135-2761-0ccd-11fc-45344a84757d@suse.com>
 <bdd65308-e549-c2b2-0de9-fb220d03f087@xen.org>
 <82cfcac7-225f-204b-e8fc-cbd04f9652e9@suse.com>
 <06e72ae4-da0b-db3b-af43-0ba8970844dc@xen.org>
 <b393e524-85e8-dbfd-225d-fea87646c199@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5ee4101f-aea0-4ead-d1eb-c20bffccd467@xen.org>
Date: Tue, 14 Apr 2020 11:38:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b393e524-85e8-dbfd-225d-fea87646c199@suse.com>
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 14/04/2020 10:50, Jan Beulich wrote:
> On 14.04.2020 11:45, Julien Grall wrote:
>>
>>
>> On 14/04/2020 10:31, Jan Beulich wrote:
>>> On 14.04.2020 11:29, Julien Grall wrote:
>>>> On 03/04/2020 16:31, Jürgen Groß wrote:
>>>>> On 03.04.20 16:51, Jan Beulich wrote:
>>>>>> On 02.04.2020 17:46, Juergen Gross wrote:
>>>>>>> V7:
>>>>>>> - fine tune some parameter initializations (Jan Beulich)
>>>>>>> - call custom_runtime_set_var() after updating the value
>>>>>>> - modify alignment in Arm linker script to 4 (Jan Beulich)
>>>>>>
>>>>>> I didn't ask for this to be unilaterally 4 - I don't think this
>>>>>> would work on Arm64, seeing that there are pointers inside the
>>>>>> struct. This wants to be pointer size, i.e. 4 for Arm32 but 8
>>>>>> for Arm64.
>>>>
>>>> We don't allow unaligned access on Arm32, so if your structure happen to have a 64-bit value in it then you will get a crash at runtime.
>>>>
>>>> For safety, it should neither be POINTER_ALIGN or 4, but 8.
>>>> This is going to make your linker more robust.
>>>
>>> Would you mind explaining to me why POINTER_ALIGN would be wrong
>>> when the most strictly aligned field in a structure is a pointer?
>> Both are valid with one difference though. If tomorrow someone send
>> a patch to add a 64-bit in the structure, what are the chance one
>> won't notice the alignment change? It is quite high.
> 
> Hmm, adjustments altering structure alignment that affect linker
> script correctness should imo always be accompanied by checking
> what the linker scripts has for the specific structure.

I agree with this, however this is theory. In practice, a contributor 
may not have noticed it and the reviewer may have overlooked it. So I 
prefer to make my life easier if the trade off is limited.

> 
>> If you align the section to 8, then you make your code more robust
>> at the expense of possibly adding an extra 4-bytes in your binary.
> 
> Well, you're the maintainer for Arm, so you've got to judge. I'd
> view things the other way around.
For me, review and maintenance are burden that needs to be decreased and 
not increased.

> Yes, it's less likely for even
> larger alignment requirements to get introduced, but why not be
> careful about these too and, say, align everything to PAGE_SIZE?
> IOW - where do you draw the line in a non-arbitrary way?

Most of decisions are arbitrary, some are more than other (e.g style).

We are down to the cost of alignment vs cost of maintenance/review 
longer term.

ldr/str on arm32 will request the address to be aligned to the size 
accessed. This will at most be 8. So by switching to 8, you remove most 
of the common unalignment fault.

You could use an higher alignment (such as PAGE_SIZE), but such 
structures are pretty limited and mostly used by the hardware. So the 
chance is the alignment will be correct from scratch.

Cheers,

-- 
Julien Grall

