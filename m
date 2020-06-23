Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFBC204CF1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 10:49:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnecB-0002au-Hj; Tue, 23 Jun 2020 08:49:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O2Jt=AE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnec9-0002ap-Vs
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 08:49:10 +0000
X-Inumbo-ID: 66f20bee-b52e-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66f20bee-b52e-11ea-bb8b-bc764e2007e4;
 Tue, 23 Jun 2020 08:49:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E23AAE39;
 Tue, 23 Jun 2020 08:49:08 +0000 (UTC)
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
 <87576264-e7df-2590-f141-351d76baac7a@suse.com>
 <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
 <1880428355.11437172.1592845510789.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <287076b5-95d7-2ee9-dd1f-45d86546f978@suse.com>
Date: Tue, 23 Jun 2020 10:49:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1880428355.11437172.1592845510789.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "Kang,
 Luwei" <luwei.kang@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 19:05, Michał Leszczyński wrote:
>>>>>> +struct xen_hvm_vmtrace_op {
>>>>>> +    /* IN variable */
>>>>>> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
>>>>>> +    uint32_t cmd;
>>>>>> +/* Enable/disable external vmtrace for given domain */
>>>>>> +#define HVMOP_vmtrace_ipt_enable      1
>>>>>> +#define HVMOP_vmtrace_ipt_disable     2
>>>>>> +#define HVMOP_vmtrace_ipt_get_offset  3
>>>>>> +    domid_t domain;
>>>>>> +    uint32_t vcpu;
>>>>>> +    uint64_t size;
>>>>>> +
>>>>>> +    /* OUT variable */
>>>>>> +    uint64_t offset;
>>>>>
>>>>> If this is to be a tools-only interface, please use uint64_aligned_t.
>>>>>
>>>>
>>>> This type is not defined within hvm_op.h header. What should I do about it?
>>>
>>> It gets defined by xen.h, so should be available here. Its
>>> definitions live in a
>>>
>>> #if defined(__XEN__) || defined(__XEN_TOOLS__)
>>>
>>> section, which is what I did recommend to put your interface in
>>> as well. Unless you want this to be exposed to the guest itself,
>>> at which point further constraints would arise.
>>>
> 
> When I've putted it into #if defined(__XEN__) || defined(__XEN_TOOLS__)
> then it complains about uint64_aligned_compat_t type missing.

One the interface is tools-only, the requirement for compat
checking isn't as strict anymore. As you can see from domctl
and sysctl, there's no checking there, but to compensate we
use uint64_aligned_t instead (arranging for struct layouts to
match).

> I also can't spot any single instance of uint64_aligned_t within
> this file.

That's unrelated.

Jan

