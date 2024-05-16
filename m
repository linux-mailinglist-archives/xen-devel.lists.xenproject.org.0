Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FF18C71D4
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 09:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722827.1127155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7VBw-0001Vn-Jj; Thu, 16 May 2024 07:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722827.1127155; Thu, 16 May 2024 07:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7VBw-0001So-Gx; Thu, 16 May 2024 07:06:16 +0000
Received: by outflank-mailman (input) for mailman id 722827;
 Thu, 16 May 2024 07:06:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jc0F=MT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s7VBu-0001Si-Up
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 07:06:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c76db7f8-1352-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 09:06:12 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4C9C74EE0739;
 Thu, 16 May 2024 09:06:12 +0200 (CEST)
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
X-Inumbo-ID: c76db7f8-1352-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Thu, 16 May 2024 09:06:12 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 2/4] x86/hvm: address violations of MISRA C Rule 20.7
In-Reply-To: <alpine.DEB.2.22.394.2405151618170.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com>
 <6d14b3283005cf1a30c4fa24f9841586a41e2b1b.1715757982.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2405151618170.2544314@ubuntu-linux-20-04-desktop>
Message-ID: <b78517fce0f119200e07863ce9eac152@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-05-16 01:18, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that 
>> all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
>> ---
>>  xen/arch/x86/hvm/mtrr.c             | 2 +-
>>  xen/arch/x86/hvm/rtc.c              | 2 +-
>>  xen/arch/x86/include/asm/hvm/save.h | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
>> index 32f74c1db03b..1079851f70ed 100644
>> --- a/xen/arch/x86/hvm/mtrr.c
>> +++ b/xen/arch/x86/hvm/mtrr.c
>> @@ -16,7 +16,7 @@
>>  #include <public/hvm/e820.h>
>> 
>>  /* Get page attribute fields (PAn) from PAT MSR. */
>> -#define pat_cr_2_paf(pat_cr,n)  ((((uint64_t)pat_cr) >> ((n)<<3)) & 
>> 0xff)
>> +#define pat_cr_2_paf(pat_cr, n)  ((((uint64_t)(pat_cr)) >> ((n) << 
>> 3)) & 0xff)
> 
> just a cosmetic change
> 

No. The point here is that pat_cr could in principle be something like 1 
+ 2, which without parentheses may not expand as intended (in this case 
because of the nearby cast). Then there's also the style fix on n

> 
>>  /* Effective mm type lookup table, according to MTRR and PAT. */
>>  static const uint8_t mm_type_tbl[MTRR_NUM_TYPES][X86_NUM_MT] = {
>> diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
>> index 4bb1c7505534..72c7bdbfcd02 100644
>> --- a/xen/arch/x86/hvm/rtc.c
>> +++ b/xen/arch/x86/hvm/rtc.c
>> @@ -45,7 +45,7 @@
>>  #define vrtc_domain(x) (container_of(x, struct pl_time, 
>> vrtc)->domain)
>>  #define vrtc_vcpu(x)   (pt_global_vcpu_target(vrtc_domain(x)))
>>  #define epoch_year     1900
>> -#define get_year(x)    (x + epoch_year)
>> +#define get_year(x)    ((x) + epoch_year)
>> 
>>  enum rtc_mode {
>>     rtc_mode_no_ack,
>> diff --git a/xen/arch/x86/include/asm/hvm/save.h 
>> b/xen/arch/x86/include/asm/hvm/save.h
>> index 8149aa113cb4..ec8de029319d 100644
>> --- a/xen/arch/x86/include/asm/hvm/save.h
>> +++ b/xen/arch/x86/include/asm/hvm/save.h
>> @@ -50,7 +50,7 @@ int _hvm_check_entry(struct hvm_domain_context *h,
>>                            HVM_SAVE_LENGTH(x), true) == 0 )      \
>>      {                                                           \
>>          ptr = &(h)->data[(h)->cur];                             \
>> -        h->cur += HVM_SAVE_LENGTH(x);                           \
>> +        (h)->cur += HVM_SAVE_LENGTH(x);                         \
>>      }                                                           \
>>      ptr; })
>> 
>> --
>> 2.34.1
>> 

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

