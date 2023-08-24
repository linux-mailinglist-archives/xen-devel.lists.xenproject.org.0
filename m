Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FCE786D7C
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 13:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589969.922052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ8FO-0008PE-Uk; Thu, 24 Aug 2023 11:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589969.922052; Thu, 24 Aug 2023 11:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ8FO-0008N5-R0; Thu, 24 Aug 2023 11:11:30 +0000
Received: by outflank-mailman (input) for mailman id 589969;
 Thu, 24 Aug 2023 11:11:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EWrD=EJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qZ8FM-0008Mz-OV
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 11:11:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5ea3d11-426e-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 13:11:23 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 2B2AB4EE0737;
 Thu, 24 Aug 2023 13:11:23 +0200 (CEST)
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
X-Inumbo-ID: f5ea3d11-426e-11ee-9b0c-b553b5be7939
MIME-Version: 1.0
Date: Thu, 24 Aug 2023 13:11:23 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2] arm64/vfp: address MISRA C:2012 Dir 4.3
In-Reply-To: <941f9188-6d59-12a6-9868-daa39b51687a@amd.com>
References: <140f450d4f4f88096158e54522fc2734367a90cb.1692807017.git.nicola.vetrini@bugseng.com>
 <941f9188-6d59-12a6-9868-daa39b51687a@amd.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <387d99d2066e1f07b7d5d04ff54a0ac9@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 24/08/2023 10:01, Michal Orzel wrote:
> Hi Nicola,
> 
> On 24/08/2023 09:37, Nicola Vetrini wrote:
>> 
>> 
>> Directive 4.3 prescribes the following:
>> "Assembly language shall be encapsulated and isolated",
>> on the grounds of improved readability and ease of maintenance.
>> 
>> A static inline function is the chosen encapsulation mechanism.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Changes in v2:
>> - Switched to a static inline function
>> ---
>>  xen/arch/arm/arm64/vfp.c | 78 
>> ++++++++++++++++++++++------------------
>>  1 file changed, 44 insertions(+), 34 deletions(-)
>> 
>> diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
>> index 2d0d7c2e6ddb..5c884380ee42 100644
>> --- a/xen/arch/arm/arm64/vfp.c
>> +++ b/xen/arch/arm/arm64/vfp.c
>> @@ -4,6 +4,48 @@
>>  #include <asm/vfp.h>
>>  #include <asm/arm64/sve.h>
>> 
>> +static inline void save_state(uint64_t *fpregs)
>> +{
>> +    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
>> +                 "stp q2, q3, [%1, #16 * 2]\n\t"
>> +                 "stp q4, q5, [%1, #16 * 4]\n\t"
>> +                 "stp q6, q7, [%1, #16 * 6]\n\t"
>> +                 "stp q8, q9, [%1, #16 * 8]\n\t"
>> +                 "stp q10, q11, [%1, #16 * 10]\n\t"
>> +                 "stp q12, q13, [%1, #16 * 12]\n\t"
>> +                 "stp q14, q15, [%1, #16 * 14]\n\t"
>> +                 "stp q16, q17, [%1, #16 * 16]\n\t"
>> +                 "stp q18, q19, [%1, #16 * 18]\n\t"
>> +                 "stp q20, q21, [%1, #16 * 20]\n\t"
>> +                 "stp q22, q23, [%1, #16 * 22]\n\t"
>> +                 "stp q24, q25, [%1, #16 * 24]\n\t"
>> +                 "stp q26, q27, [%1, #16 * 26]\n\t"
>> +                 "stp q28, q29, [%1, #16 * 28]\n\t"
>> +                 "stp q30, q31, [%1, #16 * 30]\n\t"
>> +                 : "=Q" (*fpregs) : "r" (fpregs));
>> +}
>> +
>> +static inline void restore_state(uint64_t *fpregs)
> This can be const as you are loading data from fpregs into registers
> 

I wonder whether this would make a difference, given that the return 
type is void.
It's fine either way, tough.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

