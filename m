Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E8F7D9AF5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 16:15:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624512.973093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwNbv-0008VB-9k; Fri, 27 Oct 2023 14:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624512.973093; Fri, 27 Oct 2023 14:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwNbv-0008St-5h; Fri, 27 Oct 2023 14:14:51 +0000
Received: by outflank-mailman (input) for mailman id 624512;
 Fri, 27 Oct 2023 14:14:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjPi=GJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qwNbu-0008Sn-KV
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 14:14:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f97e3e3-74d3-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 16:14:48 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id BD97C4EE073E;
 Fri, 27 Oct 2023 16:14:47 +0200 (CEST)
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
X-Inumbo-ID: 2f97e3e3-74d3-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Fri, 27 Oct 2023 16:14:47 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v4] xen: Add deviations for MISRA C:2012
 Rule 7.1
In-Reply-To: <f3ecae05-6fb0-79a7-c3ec-ed2093a8f40e@suse.com>
References: <9bc37dc81744283ca3b92ce3ffad373740122288.1698308237.git.nicola.vetrini@bugseng.com>
 <f3ecae05-6fb0-79a7-c3ec-ed2093a8f40e@suse.com>
Message-ID: <ddb64697b6c9977c36fef81670292896@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/2023 10:38, Jan Beulich wrote:
> On 26.10.2023 10:18, Nicola Vetrini wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -85,10 +85,12 @@ conform to the directive."
>>  # Series 7.
>>  #
>> 
>> --doc_begin="Usage of the following constants is safe, since they are 
>> given as-is
>> -in the inflate algorithm specification and there is therefore no risk 
>> of them
>> -being interpreted as decimal constants."
>> --config=MC3R1.R7.1,literals={safe, 
>> "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
>> +-doc_begin="It is safe to use certain octal constants the way they 
>> are defined in
>> +specifications, manuals, and algorithm descriptions."
>> +-file_tag+={x86_svm_h, "^xen/arch/x86/hvm/svm/svm\\.h$"}
>> +-file_tag+={x86_emulate_c, "^xen/arch/x86/hvm/svm/emulate\\.c$"}
>> +-config=MC3R1.R7.1,reports+={safe, 
>> "any_area(any_loc(any_exp(file(x86_svm_h)&&macro(^INSTR_ENC$))))"}
>> +-config=MC3R1.R7.1,reports+={safe, 
>> "any_area(text(^.*octal-ok.*$)&&any_loc(any_exp(file(x86_emulate_c)&&macro(^MASK_EXTR$))))"}
> 
> Is the matching of file name and MASK_EXTR() still appropriate with ...
> 
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -90,6 +90,13 @@ Deviations related to MISRA C:2012 Rules:
>>           - __emulate_2op and __emulate_2op_nobyte
>>           - read_debugreg and write_debugreg
>> 
>> +   * - R7.1
>> +     - It is safe to use certain octal constants the way they are 
>> defined
>> +       in specifications, manuals, and algorithm descriptions. Such 
>> places
>> +       are marked safe with a /\* octal-ok \*/ in-code comment, or 
>> with a SAF
>> +       comment (see safe.json).
>> +     - Tagged as `safe` for ECLAIR.
> 
> ... this description? I would have expected the key now solely is an
> "octal-ok" comment?
> 
> Jan

You have a point. I'll send a quick v5 that fully reflects the 
description.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

