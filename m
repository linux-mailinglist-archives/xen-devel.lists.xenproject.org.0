Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2232D879319
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 12:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691789.1078148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk0QO-00064L-Cv; Tue, 12 Mar 2024 11:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691789.1078148; Tue, 12 Mar 2024 11:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk0QO-00062D-9d; Tue, 12 Mar 2024 11:36:04 +0000
Received: by outflank-mailman (input) for mailman id 691789;
 Tue, 12 Mar 2024 11:36:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krxI=KS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rk0QN-000627-4W
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 11:36:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3a6b649-e064-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 12:36:01 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A34884EE0C90;
 Tue, 12 Mar 2024 12:36:00 +0100 (CET)
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
X-Inumbo-ID: b3a6b649-e064-11ee-a1ee-f123f15fe8a2
MIME-Version: 1.0
Date: Tue, 12 Mar 2024 12:36:00 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] xen/compiler: deviate the inline macro for MISRA C
 Rule 20.4
In-Reply-To: <cf13d0d3-ac5a-483c-956b-12dad7af9cc8@suse.com>
References: <0e48f35eaa95bbba6c2b8219e412bfd6d9c82b52.1710241987.git.nicola.vetrini@bugseng.com>
 <cf13d0d3-ac5a-483c-956b-12dad7af9cc8@suse.com>
Message-ID: <8dca7b5f7fc564ddbd4a4e97bc9ae5ca@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-12 12:25, Jan Beulich wrote:
> On 12.03.2024 12:13, Nicola Vetrini wrote:
>> Rule 20.4 states: "A macro shall not be defined with the same name
>> as a keyword".
>> 
>> Defining this macro with the same name as the inline keyword
>> allows for additionally checking that out-of-lined static inline
>> functions end up in the correct section while minimizing churn and
>> has a positive impact on the overall safety. See [1] for additional
>> context on the motivation of this deviation.
>> 
>> No functional change.
>> 
>> [1] 
>> https://lore.kernel.org/xen-devel/adaa6d55-266d-4df8-8967-9340080d17e4@citrix.com/
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with ...
> 
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -322,6 +322,12 @@ Deviations related to MISRA C:2012 Rules:
>>           - /\* Fallthrough \*/
>>           - /\* Fallthrough. \*/
>> 
>> +   * - R20.4
>> +     -  The override of the keyword \"inline\" in xen/compiler.h is 
>> present so
>> +        that section contents checks pass when the compiler chooses 
>> not to
>> +        inline a particular function.
> 
> ... padding (1st line of this bullet point) and indentation (2nd and 
> 3rd
> lines) adjusted to what's used elsewhere, including e.g ...
> 

Yeah, sorry.

>> +     - Comment-based deviation.
>> +
>>     * - R20.7
>>       - Code violating Rule 20.7 is safe when macro parameters are 
>> used:
>>         (1) as function arguments;
> 
> ... here. Happy to do so while committing.
> 

Thanks,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

