Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F578203C55
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 18:17:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnP83-0008Hm-4O; Mon, 22 Jun 2020 16:17:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnP81-0008Hh-A3
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 16:17:01 +0000
X-Inumbo-ID: ccabafca-b4a3-11ea-bea8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccabafca-b4a3-11ea-bea8-12813bfff9fa;
 Mon, 22 Jun 2020 16:16:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9AEDBB616;
 Mon, 22 Jun 2020 16:16:58 +0000 (UTC)
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
 <4e040500-0532-2231-f5b7-c61e97a0a0c5@suse.com>
 <800738193.11403725.1592836530558.JavaMail.zimbra@cert.pl>
 <87576264-e7df-2590-f141-351d76baac7a@suse.com>
 <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b7dd58f-2dc1-32bc-3add-d896631734a4@suse.com>
Date: Mon, 22 Jun 2020 18:16:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1130937743.11428389.1592841763323.JavaMail.zimbra@cert.pl>
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
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 18:02, Michał Leszczyński wrote:
> ----- 22 cze 2020 o 17:22, Jan Beulich jbeulich@suse.com napisał(a):
>> On 22.06.2020 16:35, Michał Leszczyński wrote:
>>> ----- 22 cze 2020 o 15:25, Jan Beulich jbeulich@suse.com napisał(a):
>>>> Is any of what you do in this switch() actually legitimate without
>>>> hvm_set_vmtrace_pt_size() having got called for the guest? From
>>>> remarks elsewhere I imply you expect the param that you currently
>>>> use to be set upon domain creation time, but at the very least the
>>>> potentially big buffer should imo not get allocated up front, but
>>>> only when tracing is to actually be enabled.
>>>
>>> Wait... so you want to allocate these buffers in runtime?
>>> Previously we were talking that there is too much runtime logic
>>> and these enable/disable hypercalls should be stripped to absolute
>>> minimum.
>>
>> Basic arrangements can be made at domain creation time. I don't
>> think though that it would be a good use of memory if you
>> allocated perhaps many gigabytes of memory just for possibly
>> wanting to enable tracing on a guest.
>>
> 
> From our previous conversations I thought that you want to have
> as much logic moved to the domain creation as possible.
> 
> Thus, a parameter "vmtrace_pt_size" was introduced. By default it's
> zero (= disabled), if you set it to a non-zero value, then trace buffers
> of given size will be allocated for the domain and you have possibility
> to use ipt_enable/ipt_disable at any moment.
> 
> This way the runtime logic is as thin as possible. I assume user knows
> in advance whether he/she would want to use external monitoring with IPT
> or not.

Andrew - I think you requested movement to domain_create(). Could
you clarify if indeed you mean to also allocate the big buffers
this early?

> It's also not "many gigabytes". In most use cases a buffer of 16/32/64 MB
> would suffice, I think.

But that one such buffer per vCPU, isn't it? Plus these buffers
need to be physically contiguous, which is an additional possibly
severe constraint.

Jan

