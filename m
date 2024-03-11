Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD079877C30
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:02:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691298.1077205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbYD-00075q-GI; Mon, 11 Mar 2024 09:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691298.1077205; Mon, 11 Mar 2024 09:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbYD-00073r-DL; Mon, 11 Mar 2024 09:02:29 +0000
Received: by outflank-mailman (input) for mailman id 691298;
 Mon, 11 Mar 2024 09:02:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SMQ=KR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rjbYC-00073Z-AS
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:02:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 146594af-df86-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:02:25 +0100 (CET)
Received: from [172.20.10.8] (unknown [37.163.170.24])
 by support.bugseng.com (Postfix) with ESMTPSA id B67174EE0C90;
 Mon, 11 Mar 2024 10:02:23 +0100 (CET)
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
X-Inumbo-ID: 146594af-df86-11ee-a1ee-f123f15fe8a2
Message-ID: <602c2da1-d5ab-4120-ab19-37e75820d129@bugseng.com>
Date: Mon, 11 Mar 2024 10:02:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/evtchn: address violations of MISRA C:2012 Rules
 16.3 and 16.4
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <3ec419e30227a8016c28e04524cd36a549aaddcf.1709898466.git.federico.serafini@bugseng.com>
 <ef3e2ce7-6798-4ade-a5d4-fadf017bbd43@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <ef3e2ce7-6798-4ade-a5d4-fadf017bbd43@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/24 08:40, Jan Beulich wrote:
> On 08.03.2024 12:51, Federico Serafini wrote:
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -130,9 +130,12 @@ static bool virq_is_global(unsigned int virq)
>>   
>>       case VIRQ_ARCH_0 ... VIRQ_ARCH_7:
>>           return arch_virq_is_global(virq);
>> +
>> +    default:
>> +        ASSERT(virq < NR_VIRQS);
>> +        break;
>>       }
>>   
>> -    ASSERT(virq < NR_VIRQS);
>>       return true;
>>   }
> 
> Just for my understanding: The ASSERT() is moved so the "default" would
> consist of more than just "break". Why is it that then the "return" isn't
> moved, too?

No reason in particular.
If preferred, I can move it too.

> 
>> @@ -846,6 +849,7 @@ int evtchn_send(struct domain *ld, unsigned int lport)
>>           break;
>>       default:
>>           ret = -EINVAL;
>> +        break;
>>       }
> 
> I certainly agree here.
> 
>> @@ -1672,6 +1676,9 @@ static void domain_dump_evtchn_info(struct domain *d)
>>           case ECS_VIRQ:
>>               printk(" v=%d", chn->u.virq);
>>               break;
>> +        default:
>> +            /* Nothing to do in other cases. */
>> +            break;
>>           }
> 
> Yes this, just to mention it, while in line with what Misra demands is
> pretty meaningless imo: The absence of "default" says exactly what the
> comment now says. FTAOD - this is a comment towards the Misra guideline,
> not so much towards the specific change here.

Both you and Stefano reviewed the code and agreed on the fact that doing
nothing for the default case is the right thing and now the code
explicitly says that without letting any doubts.
Furthermore, during the reviews it could happen that you notice a switch
where something needs to be done for the default case.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

