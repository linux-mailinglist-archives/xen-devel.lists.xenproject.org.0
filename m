Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAA276E460
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 11:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576143.901957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUf4-0003aH-K4; Thu, 03 Aug 2023 09:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576143.901957; Thu, 03 Aug 2023 09:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUf4-0003Xk-G8; Thu, 03 Aug 2023 09:30:26 +0000
Received: by outflank-mailman (input) for mailman id 576143;
 Thu, 03 Aug 2023 09:30:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PRme=DU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRUf2-0003Xe-BL
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 09:30:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e6316d3-31e0-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 11:30:22 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A6EBA4EE0737;
 Thu,  3 Aug 2023 11:30:21 +0200 (CEST)
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
X-Inumbo-ID: 5e6316d3-31e0-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Thu, 03 Aug 2023 11:30:21 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
 <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 11/11] x86/mm: Add assertion to address MISRA C:2012
 Rule 2.1
In-Reply-To: <0ba36273-33ad-753c-06a5-be117b6658e0@suse.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <91b2f2c9e728c1f19f7baab301299d995a074279.1690985045.git.nicola.vetrini@bugseng.com>
 <0ba36273-33ad-753c-06a5-be117b6658e0@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <d506555fb3653322703f50d8756f3560@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2023 11:20, Jan Beulich wrote:
> On 02.08.2023 16:38, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -4879,6 +4879,7 @@ long arch_memory_op(unsigned long cmd, 
>> XEN_GUEST_HANDLE_PARAM(void) arg)
>>          return subarch_memory_op(cmd, arg);
>>      }
>> 
>> +    ASSERT_UNREACHABLE();
>>      return 0;
>>  }
> 
> I'd prefer to instead switch earlier "return 0" to "break".

Ok

> 
>> --- a/xen/arch/x86/mm/p2m-pod.c
>> +++ b/xen/arch/x86/mm/p2m-pod.c
>> @@ -1045,6 +1045,7 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const 
>> gfn_t *gfns, unsigned int count
>>      }
>> 
>>      return;
>> +    ASSERT_UNREACHABLE();
>> 
>>  out_unmap:
>>      /*
> 
> In the description you say "before", but here you add something _after_
> "return". What's the deal?
> 
> Jan

In this case the unreachable part is that after the label (looking at it 
now, I should have
put the assert after the label to make it clear), because earlier all 
jumps to
'out_unmap' are like this:

   ASSERT_UNREACHABLE();
   domain_crash(d);
   goto out_unmap;

As I understood it, this is a defensive coding measure, preventing pages 
to remain mapped if,
for some reason the above code actually executes. Am I correct?

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

