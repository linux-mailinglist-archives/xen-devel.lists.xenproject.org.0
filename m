Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5A276E2A7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 10:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576068.901797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTTY-0003Vm-Ce; Thu, 03 Aug 2023 08:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576068.901797; Thu, 03 Aug 2023 08:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRTTY-0003TJ-7w; Thu, 03 Aug 2023 08:14:28 +0000
Received: by outflank-mailman (input) for mailman id 576068;
 Thu, 03 Aug 2023 08:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PRme=DU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRTTX-0003TD-7L
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 08:14:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1e12223-31d5-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 10:14:24 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 1A1644EE0737;
 Thu,  3 Aug 2023 10:14:24 +0200 (CEST)
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
X-Inumbo-ID: c1e12223-31d5-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Thu, 03 Aug 2023 10:14:24 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH 2/4] x86/mtrr: address MISRA C:2012 Rule 5.3
In-Reply-To: <alpine.DEB.2.22.394.2308021847190.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690969271.git.nicola.vetrini@bugseng.com>
 <16fa23ecb465442c566a18af0a569092075eef26.1690969271.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308021847190.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <56d5b07a4194e5036ef92dcb56072851@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2023 03:51, Stefano Stabellini wrote:
> On Wed, 2 Aug 2023, Nicola Vetrini wrote:
>> Rename variables to avoid shadowing and thus address
>> MISRA C:2012 Rule 5.3:
>> "An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope"
>> 
>> No functional changes.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> This one clashes with xen/arch/x86/include/asm/mtrr.h:struct mtrr_state
> right?
> 

Yes, indeed. You can also check this when in doubt at
https://saas.eclairit.com, but I do agree that mentioning it directly in 
the commit
would make review easier.

> 
>> ---
>>  xen/arch/x86/hvm/mtrr.c | 32 ++++++++++++++++----------------
>>  1 file changed, 16 insertions(+), 16 deletions(-)
>> 
>> diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
>> index 29f3fb1607..d504d1e43b 100644
>> --- a/xen/arch/x86/hvm/mtrr.c
>> +++ b/xen/arch/x86/hvm/mtrr.c
>> @@ -687,13 +687,13 @@ int hvm_set_mem_pinned_cacheattr(struct domain 
>> *d, uint64_t gfn_start,
>> 
>>  static int cf_check hvm_save_mtrr_msr(struct vcpu *v, 
>> hvm_domain_context_t *h)
>>  {
>> -    const struct mtrr_state *mtrr_state = &v->arch.hvm.mtrr;
>> +    const struct mtrr_state *mtrr = &v->arch.hvm.mtrr;
> 
> I can see in hvm_vcpu_cacheattr_init, mtrr_get_type and other places
> that we use:
> 
>   const struct mtrr_state *m
> 
> maybe that's better? I'll let Jan comment.
> 
> Anyway, the patch looks correct to me.
> 
> 

I though about it, and it seemed too generic, so in the end I decided 
for mtrr, but
as always with names, I'm open to alternative suggestions.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

