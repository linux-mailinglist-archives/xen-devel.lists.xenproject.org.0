Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DC1550FAB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 07:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352382.579134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o39rk-0006u2-Ev; Mon, 20 Jun 2022 05:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352382.579134; Mon, 20 Jun 2022 05:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o39rk-0006s3-By; Mon, 20 Jun 2022 05:22:24 +0000
Received: by outflank-mailman (input) for mailman id 352382;
 Mon, 20 Jun 2022 05:22:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6bZF=W3=leemhuis.info=regressions@srs-se1.protection.inumbo.net>)
 id 1o39ri-0006rx-7c
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 05:22:22 +0000
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [2a01:488:42:1000:50ed:8234::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5579259-f058-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 07:22:20 +0200 (CEST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1o39re-0008H9-Uu; Mon, 20 Jun 2022 07:22:19 +0200
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f5579259-f058-11ec-b725-ed86ccbb4733
Message-ID: <effc0c6a-9e4d-b503-e4ba-6c8d2da72699@leemhuis.info>
Date: Mon, 20 Jun 2022 07:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] x86/pat: fix x86_has_pat_wp()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>
Cc: jbeulich@suse.com, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-2-jgross@suse.com>
 <fb0eadee-1d45-f414-eda4-a87f01eeb57a@suse.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <fb0eadee-1d45-f414-eda4-a87f01eeb57a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1655702540;0c7ec7dc;
X-HE-SMSGID: 1o39re-0008H9-Uu

On 14.06.22 17:09, Juergen Gross wrote:
> On 03.05.22 15:22, Juergen Gross wrote:
>> x86_has_pat_wp() is using a wrong test, as it relies on the normal
>> PAT configuration used by the kernel. In case the PAT MSR has been
>> setup by another entity (e.g. BIOS or Xen hypervisor) it might return
>> false even if the PAT configuration is allowing WP mappings.
>>
>> Fixes: 1f6f655e01ad ("x86/mm: Add a x86_has_pat_wp() helper")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   arch/x86/mm/init.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
>> index d8cfce221275..71e182ebced3 100644
>> --- a/arch/x86/mm/init.c
>> +++ b/arch/x86/mm/init.c
>> @@ -80,7 +80,8 @@ static uint8_t __pte2cachemode_tbl[8] = {
>>   /* Check that the write-protect PAT entry is set for write-protect */
>>   bool x86_has_pat_wp(void)
>>   {
>> -    return __pte2cachemode_tbl[_PAGE_CACHE_MODE_WP] ==
>> _PAGE_CACHE_MODE_WP;
>> +    return
>> __pte2cachemode_tbl[__cachemode2pte_tbl[_PAGE_CACHE_MODE_WP]] ==
>> +           _PAGE_CACHE_MODE_WP;
>>   }
>>     enum page_cache_mode pgprot2cachemode(pgprot_t pgprot)
> 
> x86 maintainers, please consider taking this patch, as it is fixing
> a real bug. Patch 2 of this series can be dropped IMO.

Juergen, can you help me out here please. Patch 2 afaics was supposed to
fix this regression I'm tracking:
https://lore.kernel.org/regressions/YnHK1Z3o99eMXsVK@mail-itl/

Is Patch 1 alone enough to fix it? Or is there a different fix for it?
Or is there some other solution to finally fix that regressions that
ideally should have been fixed weeks ago already?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

