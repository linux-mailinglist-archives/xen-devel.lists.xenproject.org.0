Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B57802D44
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 09:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646594.1009005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4Ps-0006Zp-Ni; Mon, 04 Dec 2023 08:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646594.1009005; Mon, 04 Dec 2023 08:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA4Ps-0006Xl-Jh; Mon, 04 Dec 2023 08:35:00 +0000
Received: by outflank-mailman (input) for mailman id 646594;
 Mon, 04 Dec 2023 08:34:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJlD=HP=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rA4Pr-0006Xd-Ea
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 08:34:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 015ab69f-9280-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 09:34:57 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 97AD24EE073D;
 Mon,  4 Dec 2023 09:34:56 +0100 (CET)
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
X-Inumbo-ID: 015ab69f-9280-11ee-9b0f-b553b5be7939
Message-ID: <5683be1b-5eb9-44a7-89a7-70a71991f2f8@bugseng.com>
Date: Mon, 4 Dec 2023 09:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/3] automation/eclair: tag function calls to
 address violations of MISRA C:2012 Rule 13.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>
References: <cover.1700844359.git.simone.ballarin@bugseng.com>
 <fc3e04e5d0432b280110414136f0587a1433d9b0.1700844359.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2312011917030.110490@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2312011917030.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/12/23 04:19, Stefano Stabellini wrote:
> On Fri, 24 Nov 2023, Simone Ballarin wrote:
>> Rule 13.1: Initializer lists shall not contain persistent side effects
>>
>> Invocations of functions in initializer lists cause violations of rule
>> 13.1 if the called functions are not tagged with __attribute_pure__ or
>> __attribute_const__ as they can produce persistent side effects.
>>
>> Handling these violations with  attributes is not always possible: the
>> pure and const attributes may cause unwanted and potentially dangerous
>> optimisations.
>>
>> To avoid this problem ECLAIR allows using the same attributes in the
>> -call_properties setting. Additionally, it adds the noeffect attribute
>> with the following definition:
>> "like pure but can also read volatile variable not triggering side effects"
>>
>> These patch tags some functions used in initializer lists to address
>> violations of Rule 13.1.
>>
>> No functional changes.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Ideally we should also list them somewhere in a document, maybe
> docs/misra/deviations.rst? Or a new doc? It would be best if this info
> wouldn't only exist in call_properties.ecl.

They are not actually deviations, but information that can help
document the code: I suggest creating a new document.

Then, ECLAIR or any other tool will be able to retrieve these properties
directly from this new file.

If you agree I will do it in a separate patch.

> 
> But give that the below is OK:
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
>> ---
>> Changes in v2:
>> New patch partly based on "xen/arm: address violations of MISRA C:2012 Rule 13.1"
>> and "xen/include: add pure and const attributes". This new patch uses
>> ECL tagging instead of compiler attributes.
>> ---
>>   .../ECLAIR/call_properties.ecl                | 22 +++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/call_properties.ecl b/automation/eclair_analysis/ECLAIR/call_properties.ecl
>> index 3f7794bf8b..c2b2a6182e 100644
>> --- a/automation/eclair_analysis/ECLAIR/call_properties.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/call_properties.ecl
>> @@ -73,6 +73,17 @@
>>   -call_properties+={"macro(^va_start$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
>>   -call_properties+={"macro(^memcmp$)", {"pointee_write(1..2=never)", "taken()"}}
>>   -call_properties+={"macro(^memcpy$)", {"pointee_write(1=always&&2..=never)", "pointee_read(1=never&&2..=always)", "taken()"}}
>> +-call_properties+={"name(get_cpu_info)",{pure}}
>> +-call_properties+={"name(pdx_to_pfn)",{pure}}
>> +-call_properties+={"name(is_pci_passthrough_enabled)",{const}}
>> +-call_properties+={"name(get_cycles)", {"noeffect"}}
>> +-call_properties+={"name(msi_gflags)",{const}}
>> +-call_properties+={"name(hvm_save_size)",{pure}}
>> +-call_properties+={"name(cpu_has)",{pure}}
>> +-call_properties+={"name(boot_cpu_has)",{pure}}
>> +-call_properties+={"name(get_cpu_info)",{pure}}
>> +-call_properties+={"name(put_pte_flags)",{const}}
>> +-call_properties+={"name(is_pv_vcpu)",{pure}}
>>   
>>   -doc_begin="Property inferred as a consequence of the semantics of device_tree_get_reg"
>>   -call_properties+={"name(acquire_static_memory_bank)", {"pointee_write(4..=always)", "pointee_read(4..=never)", "taken()"}}
>> @@ -104,3 +115,14 @@ Furthermore, their uses do initialize the involved variables as needed by futher
>>   -call_properties+={"macro(^(__)?(raw_)?copy_from_(paddr|guest|compat)(_offset)?$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
>>   -call_properties+={"macro(^(__)?copy_to_(guest|compat)(_offset)?$)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
>>   -doc_end
>> +
>> +-doc_begin="Functions generated by build_atomic_read cannot be considered pure
>> +since the input pointer is volatile, but they do not produce any persistent side
>> +effect."
>> +-call_properties+={"^read_u(8|16|32|64|int)_atomic.*$", {noeffect}}
>> +-doc_end
>> +
>> +-doc_begin="Functions generated by TYPE_SAFE are const."
>> +-call_properties+={"^(mfn|gfn|pfn)_x\\(.*$",{const}}
>> +-call_properties+={"^_(mfn|gfn|pfn)\\(.*$",{const}}
>> +-doc_end
>> -- 
>> 2.34.1
>>

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


