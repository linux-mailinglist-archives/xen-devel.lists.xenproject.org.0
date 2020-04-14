Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98371A77C7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 11:51:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOIDS-0002nz-SV; Tue, 14 Apr 2020 09:50:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOIDR-0002nu-Ow
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 09:50:49 +0000
X-Inumbo-ID: 68ba6d66-7e35-11ea-8912-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68ba6d66-7e35-11ea-8912-12813bfff9fa;
 Tue, 14 Apr 2020 09:50:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8D3E1AD9F;
 Tue, 14 Apr 2020 09:50:42 +0000 (UTC)
Subject: Re: [PATCH v7 09/12] xen: add runtime parameter access support to
 hypfs
To: Julien Grall <julien@xen.org>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-10-jgross@suse.com>
 <f08bdac6-122a-9289-3241-a0460a73c686@suse.com>
 <1a68e135-2761-0ccd-11fc-45344a84757d@suse.com>
 <bdd65308-e549-c2b2-0de9-fb220d03f087@xen.org>
 <82cfcac7-225f-204b-e8fc-cbd04f9652e9@suse.com>
 <06e72ae4-da0b-db3b-af43-0ba8970844dc@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b393e524-85e8-dbfd-225d-fea87646c199@suse.com>
Date: Tue, 14 Apr 2020 11:50:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <06e72ae4-da0b-db3b-af43-0ba8970844dc@xen.org>
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
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.04.2020 11:45, Julien Grall wrote:
> 
> 
> On 14/04/2020 10:31, Jan Beulich wrote:
>> On 14.04.2020 11:29, Julien Grall wrote:
>>> On 03/04/2020 16:31, Jürgen Groß wrote:
>>>> On 03.04.20 16:51, Jan Beulich wrote:
>>>>> On 02.04.2020 17:46, Juergen Gross wrote:
>>>>>> V7:
>>>>>> - fine tune some parameter initializations (Jan Beulich)
>>>>>> - call custom_runtime_set_var() after updating the value
>>>>>> - modify alignment in Arm linker script to 4 (Jan Beulich)
>>>>>
>>>>> I didn't ask for this to be unilaterally 4 - I don't think this
>>>>> would work on Arm64, seeing that there are pointers inside the
>>>>> struct. This wants to be pointer size, i.e. 4 for Arm32 but 8
>>>>> for Arm64.
>>>
>>> We don't allow unaligned access on Arm32, so if your structure happen to have a 64-bit value in it then you will get a crash at runtime.
>>>
>>> For safety, it should neither be POINTER_ALIGN or 4, but 8.
>>> This is going to make your linker more robust.
>>
>> Would you mind explaining to me why POINTER_ALIGN would be wrong
>> when the most strictly aligned field in a structure is a pointer?
> Both are valid with one difference though. If tomorrow someone send
> a patch to add a 64-bit in the structure, what are the chance one
> won't notice the alignment change? It is quite high.

Hmm, adjustments altering structure alignment that affect linker
script correctness should imo always be accompanied by checking
what the linker scripts has for the specific structure.

> If you align the section to 8, then you make your code more robust
> at the expense of possibly adding an extra 4-bytes in your binary.

Well, you're the maintainer for Arm, so you've got to judge. I'd
view things the other way around. Yes, it's less likely for even
larger alignment requirements to get introduced, but why not be
careful about these too and, say, align everything to PAGE_SIZE?
IOW - where do you draw the line in a non-arbitrary way?

Jan

