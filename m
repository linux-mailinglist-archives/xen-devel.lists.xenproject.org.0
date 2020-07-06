Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371E32155E1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 12:54:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsOkQ-0006zk-Il; Mon, 06 Jul 2020 10:53:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D7Mw=AR=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jsOkP-0006zf-Bd
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 10:53:17 +0000
X-Inumbo-ID: e552e786-bf76-11ea-8c61-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e552e786-bf76-11ea-8c61-12813bfff9fa;
 Mon, 06 Jul 2020 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ASS/EyAWJ4zMVNhcFNnYTPSeGf5qD5vkk3McVKOf1nY=; b=YoG4SA6QLxbC9Vy79cxbjqRVvl
 vbLzRL1xrBhHxIROM8qXGSkWmQoXVcpbQWyR6bFB8qStg2JsvFGyJFG+JyuHzFMN7qCwmX9x4qaap
 CJ5FRAg1mfz8nNIZrv4FIbtfIGJWSmLMbO1DKQmnJThZ7U72QZ2taTnHKw4y6A78GB7o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jsOkK-0004A1-KH; Mon, 06 Jul 2020 10:53:12 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jsOkK-0003Gy-Aj; Mon, 06 Jul 2020 10:53:12 +0000
Subject: Re: [PATCH v5 05/11] tools/libxl: add vmtrace_pt_size parameter
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 xen-devel@lists.xenproject.org
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <cover.1593974333.git.michal.leszczynski@cert.pl>
 <f7e3c91789a7763b997918b6ebb987be670f9ce5.1593974333.git.michal.leszczynski@cert.pl>
 <1763045628.19744689.1593975740414.JavaMail.zimbra@cert.pl>
From: Julien Grall <julien@xen.org>
Message-ID: <f4b72fb1-2dfb-def7-6dbd-4908ceb497aa@xen.org>
Date: Mon, 6 Jul 2020 11:53:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1763045628.19744689.1593975740414.JavaMail.zimbra@cert.pl>
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
Cc: luwei kang <luwei.kang@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 tamas lengyel <tamas.lengyel@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 05/07/2020 20:02, Michał Leszczyński wrote:
> ----- 5 lip 2020 o 20:54, Michał Leszczyński michal.leszczynski@cert.pl napisał(a):
> 
>> From: Michal Leszczynski <michal.leszczynski@cert.pl>
>>
>> Allow to specify the size of per-vCPU trace buffer upon
>> domain creation. This is zero by default (meaning: not enabled).
>>
>> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
>> ---
>> docs/man/xl.cfg.5.pod.in             | 11 +++++++++++
>> tools/golang/xenlight/helpers.gen.go |  2 ++
>> tools/golang/xenlight/types.gen.go   |  1 +
>> tools/libxl/libxl.h                  |  8 ++++++++
>> tools/libxl/libxl_create.c           |  1 +
>> tools/libxl/libxl_types.idl          |  2 ++
>> tools/xl/xl_parse.c                  | 22 ++++++++++++++++++++++
>> 7 files changed, 47 insertions(+)
>>
>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>> index 0532739c1f..670759f6bd 100644
>> --- a/docs/man/xl.cfg.5.pod.in
>> +++ b/docs/man/xl.cfg.5.pod.in
>> @@ -278,6 +278,17 @@ memory=8096 will report significantly less memory available
>> for use
>> than a system with maxmem=8096 memory=8096 due to the memory overhead
>> of having to track the unused pages.
>>
>> +=item B<processor_trace_buffer_size=BYTES>
>> +
>> +Specifies the size of processor trace buffer that would be allocated
>> +for each vCPU belonging to this domain. Disabled (i.e.
>> +B<processor_trace_buffer_size=0> by default. This must be set to
>> +non-zero value in order to be able to use processor tracing features
>> +with this domain.
>> +
>> +B<NOTE>: The size value must be between 4 kB and 4 GB and it must
>> +be also a power of 2.

This seems to suggest that 4 kB is allowed. But looking at the code 
below, you are forbidding the value.

[...]

> As there were many different ideas about how the naming scheme should be
> and what kinds of values should be passed where, I would like to discuss
> this particular topic. Right now we have it pretty confusing:
> 
> * user sets "processor_trace_buffer_size" option in xl.cfg
> * domain creation hypercall uses "vmtrace_pt_order" (derived from above)

You don't only use the order in the hypercall but also the public 
interface of libxl.

> * hypervisor side stores "vmtrace_pt_size" (converted back to bytes)

My preference would be to use the size everywhere, but if one still 
prefer to use the order in the hypercall then the libxl interface should 
use the size.

See my comment in v4 for the rationale.

Cheers,

-- 
Julien Grall

