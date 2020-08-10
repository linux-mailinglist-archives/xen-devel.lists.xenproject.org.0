Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C047240190
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 06:37:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4zZ3-0001Zf-2O; Mon, 10 Aug 2020 04:37:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BFG=BU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k4zZ1-0001ZX-UP
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 04:37:35 +0000
X-Inumbo-ID: d015c87b-02de-4088-aa5e-20b7ad5c27b6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d015c87b-02de-4088-aa5e-20b7ad5c27b6;
 Mon, 10 Aug 2020 04:37:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57B1FABE2;
 Mon, 10 Aug 2020 04:37:54 +0000 (UTC)
Subject: Re: [PATCH v3 3/7] x86/xen: drop tests for highmem in pv code
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20200807083826.16794-1-jgross@suse.com>
 <20200807083826.16794-4-jgross@suse.com>
 <60f40558-a3a8-2c1e-2c32-09f93bfca724@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a7ba056c-bbf0-5855-e0c3-fd835e1d6792@suse.com>
Date: Mon, 10 Aug 2020 06:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <60f40558-a3a8-2c1e-2c32-09f93bfca724@oracle.com>
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

On 09.08.20 04:22, Boris Ostrovsky wrote:
> On 8/7/20 4:38 AM, Juergen Gross wrote:
>> With support for 32-bit pv guests gone pure pv-code no longer needs to
>> test for highmem. Dropping those tests removes the need for flushing
>> in some places.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> 
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> 
> 
> with a suggestion
> 
> 
>> ---
>>   arch/x86/xen/enlighten_pv.c |  11 ++-
>>   arch/x86/xen/mmu_pv.c       | 138 ++++++++++++++----------------------
>>   2 files changed, 57 insertions(+), 92 deletions(-)
>>
>> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
>> index 7d90b3da8bb4..9fec952f84f3 100644
>> --- a/arch/x86/xen/enlighten_pv.c
>> +++ b/arch/x86/xen/enlighten_pv.c
>> @@ -347,6 +347,7 @@ static void set_aliased_prot(void *v, pgprot_t prot)
>>   	unsigned long pfn;
>>   	struct page *page;
>>   	unsigned char dummy;
>> +	void *av;
> 
> 
> to rename this to va since you are modifying those lines anyway.

Yes.


Juergen

