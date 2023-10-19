Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519707CF185
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 09:44:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618950.963320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNhf-000775-07; Thu, 19 Oct 2023 07:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618950.963320; Thu, 19 Oct 2023 07:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtNhe-00073O-Td; Thu, 19 Oct 2023 07:44:22 +0000
Received: by outflank-mailman (input) for mailman id 618950;
 Thu, 19 Oct 2023 07:44:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=in48=GB=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qtNhe-00072w-14
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 07:44:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5095b24e-6e53-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 09:44:21 +0200 (CEST)
Received: from [192.168.1.9] (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id 40C364EE0739;
 Thu, 19 Oct 2023 09:44:20 +0200 (CEST)
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
X-Inumbo-ID: 5095b24e-6e53-11ee-98d5-6d05b1d4d9a1
Message-ID: <a31140c6-4c2f-4c86-affd-baf0a51a0bb7@bugseng.com>
Date: Thu, 19 Oct 2023 09:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/4] automation/eclair: add deviations and call
 properties.
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <8f426cc761c734d457a74416dd5b83fd10128c26.1697638210.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2310181756410.965337@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2310181756410.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/23 02:57, Stefano Stabellini wrote:
> On Wed, 18 Oct 2023, Simone Ballarin wrote:
>> Deviate violations of MISRA C:2012 Rule 13.1 caused by
>> functions vcpu_runnable and __bad_atomic_size. These functions
>> contain side-effects such as debugging logs, assertions and
>> failures that cannot cause unexpected behaviors.
>>
>> Add "noeffect" call property to functions read_u.*_atomic and
>> get_cycles.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> However one comment below
> 
> 
>> ---
>>   .../eclair_analysis/ECLAIR/call_properties.ecl      | 10 ++++++++++
>>   automation/eclair_analysis/ECLAIR/deviations.ecl    | 13 +++++++++++++
>>   docs/misra/deviations.rst                           | 11 +++++++++++
>>   3 files changed, 34 insertions(+)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/call_properties.ecl b/automation/eclair_analysis/ECLAIR/call_properties.ecl
>> index 3f7794bf8b..f410a6aa58 100644
>> --- a/automation/eclair_analysis/ECLAIR/call_properties.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/call_properties.ecl
>> @@ -104,3 +104,13 @@ Furthermore, their uses do initialize the involved variables as needed by futher
>>   -call_properties+={"macro(^(__)?(raw_)?copy_from_(paddr|guest|compat)(_offset)?$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
>>   -call_properties+={"macro(^(__)?copy_to_(guest|compat)(_offset)?$)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
>>   -doc_end
>> +
>> +-doc_begin="Functions generated by build_atomic_read cannot be considered pure
>> +since the input pointer is volatile."
>> +-call_properties+={"^read_u(8|16|32|64|int)_atomic.*$", {"noeffect"}}
>> +-doc_end
>> +
>> +-doc_begin="get_cycles does not perform visible side-effects "
>> +-call_property+={"name(get_cycles)", {"noeffect"}}
>> +-doc_end
>> +
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index fa56e5c00a..b80ccea7bc 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -233,6 +233,19 @@ this."
>>   -config=MC3R1.R10.1,etypes+={safe,
>>     "stmt(operator(and||or||xor||not||and_assign||or_assign||xor_assign))",
>>     "any()"}
>> +#
>> +# Series 13.
>> +#
>> +
>> +-doc_begin="Function __bad_atomic_size is intended to generate a linkage error
>> +if invoked. Calling it in intentionally unreachable switch cases is safe even
>> +in a initializer list."
>> +-config=MC3R1.R13.1,reports+={safe, "first_area(^.*__bad_atomic_size.*$)"}
>> +-doc_end
>> +
>> +-doc_begin="Function vcpu_runnable contains pragmas and other side-effects for
>> +debugging purposes, their invocation is safe even in a initializer list."
>> +-config=MC3R1.R13.1,reports+={safe, "first_area(^.*vcpu_runnable.*$)"}
>>   -doc_end
>>   
>>   -doc_begin="See Section \"4.5 Integers\" of \"GCC_MANUAL\", where it says that
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index 8511a18925..2fcdb8da58 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -192,6 +192,17 @@ Deviations related to MISRA C:2012 Rules:
>>          See automation/eclair_analysis/deviations.ecl for the full explanation.
>>        - Tagged as `safe` for ECLAIR.
>>   
>> +   * - R13.1
>> +     - Function __bad_atomic_size is intended to generate a linkage error if
>> +       invoked. Calling it in intentionally unreachable switch cases is
>> +       safe even in a initializer list.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>> +   * - R13.1
>> +     - Function vcpu_runnable contains pragmas and other side-effects for
>> +       debugging purposes, their invocation is safe even in a initializer list.
>> +     - Tagged as `safe` for ECLAIR.
> 
> 
> Would it be possible to use SAF instead? If not, this is fine.

Yes, but I do not suggest using SAF comments in these cases.
The SAF should be placed before every non-compliant invocation and not 
only in the declaration, this could cause a lot of SAF comments instead
of a simple deviation.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


