Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412FB88C52E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 15:32:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698108.1089456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp7qE-0007ha-Ns; Tue, 26 Mar 2024 14:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698108.1089456; Tue, 26 Mar 2024 14:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp7qE-0007ez-KG; Tue, 26 Mar 2024 14:31:54 +0000
Received: by outflank-mailman (input) for mailman id 698108;
 Tue, 26 Mar 2024 14:31:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2PUu=LA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rp7qD-0007er-SX
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 14:31:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9690cc16-eb7d-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 15:31:52 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5946D4EE0739;
 Tue, 26 Mar 2024 15:31:52 +0100 (CET)
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
X-Inumbo-ID: 9690cc16-eb7d-11ee-afe3-a90da7624cb6
MIME-Version: 1.0
Date: Tue, 26 Mar 2024 15:31:52 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 10/11] x86/hvm: address violations of Rule 20.7
In-Reply-To: <1c7475d7-b4ac-492f-8abd-2ab3b60c2a29@suse.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <ba509584faf3e8c95bc39e0a68a52380330412f3.1711118582.git.nicola.vetrini@bugseng.com>
 <1c7475d7-b4ac-492f-8abd-2ab3b60c2a29@suse.com>
Message-ID: <59c7cf8e513f07680703b2c90449a50c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-26 11:13, Jan Beulich wrote:
> On 22.03.2024 17:01, Nicola Vetrini wrote:
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
> Acked-by: Jan Beulich <jbeulich@suse.com>
> albeit preferably with ...
> 
>> --- a/xen/arch/x86/include/asm/hvm/save.h
>> +++ b/xen/arch/x86/include/asm/hvm/save.h
>> @@ -128,9 +128,9 @@ static int __init cf_check 
>> __hvm_register_##_x##_save_and_restore(void)   \
>>  {                                                                     
>>     \
>>      hvm_register_savevm(HVM_SAVE_CODE(_x),                            
>>     \
>>                          #_x,                                          
>>     \
>> -                        &_save,                                       
>>     \
>> +                        &(_save),                                     
>>     \
>>                          check,                                        
>>     \
>> -                        &_load,                                       
>>     \
>> +                        &(_load),                                     
>>     \
> 
> ... the &s dropped rather than parentheses added, as we already have it
> for (the recently added) "check".
> 
> Jan

Sounds good

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

