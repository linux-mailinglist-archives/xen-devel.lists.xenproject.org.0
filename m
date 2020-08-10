Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E8240193
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 06:37:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4zYU-0001Vs-OH; Mon, 10 Aug 2020 04:37:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k4zYT-0001V9-En
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 04:37:01 +0000
X-Inumbo-ID: 27ce598d-ce4b-4ee0-a72b-100320c92d83
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27ce598d-ce4b-4ee0-a72b-100320c92d83;
 Mon, 10 Aug 2020 04:37:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAF34ABE2;
 Mon, 10 Aug 2020 04:37:19 +0000 (UTC)
Subject: Re: [PATCH v3 2/7] x86/xen: eliminate xen-asm_64.S
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20200807083826.16794-1-jgross@suse.com>
 <20200807083826.16794-3-jgross@suse.com>
 <b0c1c8cf-7a7e-33be-2b83-7895bcb9c36b@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7358d7c4-37a6-c304-e569-bd7069884681@suse.com>
Date: Mon, 10 Aug 2020 06:36:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b0c1c8cf-7a7e-33be-2b83-7895bcb9c36b@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.08.20 04:04, Boris Ostrovsky wrote:
> On 8/7/20 4:38 AM, Juergen Gross wrote:
>> With 32-bit pv-guest support removed xen-asm_64.S can be merged with
>> xen-asm.S
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> 
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> 
> 
> except for
> 
> 
>> diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
>> index c59d077510bf..d1272a63f097 100644
>> --- a/arch/x86/xen/xen-asm.S
>> +++ b/arch/x86/xen/xen-asm.S
>> @@ -6,12 +6,19 @@
>>    * operations here; the indirect forms are better handled in C.
>>    */
>>   
>> +#include <asm/errno.h>
>>   #include <asm/asm-offsets.h>
>>   #include <asm/percpu.h>
>>   #include <asm/processor-flags.h>
>> +#include <asm/segment.h>
>> +#include <asm/thread_info.h>
>> +#include <asm/asm.h>
>>   #include <asm/frame.h>
>>   #include <asm/asm.h>
> 
> 
> asm/asm.h included twice now.

Right, will drop that.


Juergen

