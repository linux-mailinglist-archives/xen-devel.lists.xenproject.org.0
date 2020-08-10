Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5905240191
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 06:37:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4zY6-0001Sy-EY; Mon, 10 Aug 2020 04:36:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k4zY4-0001St-IB
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 04:36:36 +0000
X-Inumbo-ID: 9a1e2a81-7f90-4ad3-b82e-16ed8e1a936e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a1e2a81-7f90-4ad3-b82e-16ed8e1a936e;
 Mon, 10 Aug 2020 04:36:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11E5CABE2;
 Mon, 10 Aug 2020 04:36:54 +0000 (UTC)
Subject: Re: [PATCH v3 1/7] x86/xen: remove 32-bit Xen PV guest support
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20200807083826.16794-1-jgross@suse.com>
 <20200807083826.16794-2-jgross@suse.com>
 <893bc936-81bf-1e86-8423-a61fbfb5dc02@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8dc06c59-54a5-8716-5e26-ec1442aaadd4@suse.com>
Date: Mon, 10 Aug 2020 06:36:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <893bc936-81bf-1e86-8423-a61fbfb5dc02@oracle.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.08.20 04:01, Boris Ostrovsky wrote:
> On 8/7/20 4:38 AM, Juergen Gross wrote:
>>   
>>   void __init xen_reserve_top(void)
>>   {
>> -#ifdef CONFIG_X86_32
>> -	unsigned long top = HYPERVISOR_VIRT_START;
>> -	struct xen_platform_parameters pp;
>> -
>> -	if (HYPERVISOR_xen_version(XENVER_platform_parameters, &pp) == 0)
>> -		top = pp.virt_start;
>> -
>> -	reserve_top_address(-top);
>> -#endif	/* CONFIG_X86_32 */
>>   }
>>   
> 
> 
> We should be able now to get rid of xen_reserve_top() altogether.

Oh, yes.

> 
> 
> Other than that
> 
> 
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Thanks,

Juergen

