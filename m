Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9503877E5E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 11:49:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691379.1077305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdD8-0001Sy-DQ; Mon, 11 Mar 2024 10:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691379.1077305; Mon, 11 Mar 2024 10:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdD8-0001RA-AK; Mon, 11 Mar 2024 10:48:50 +0000
Received: by outflank-mailman (input) for mailman id 691379;
 Mon, 11 Mar 2024 10:48:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SMQ=KR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rjdD7-0001R4-0x
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 10:48:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0306a8e-df94-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 11:48:47 +0100 (CET)
Received: from [157.138.166.139] (unknown [157.138.166.139])
 by support.bugseng.com (Postfix) with ESMTPSA id AAAB84EE0C90;
 Mon, 11 Mar 2024 11:48:46 +0100 (CET)
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
X-Inumbo-ID: f0306a8e-df94-11ee-afdc-a90da7624cb6
Message-ID: <fa1ba7ff-a020-4f6b-a24b-020a780fb753@bugseng.com>
Date: Mon, 11 Mar 2024 11:48:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/evtchn: address violations of MISRA C:2012 Rules
 16.3 and 16.4
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <3ec419e30227a8016c28e04524cd36a549aaddcf.1709898466.git.federico.serafini@bugseng.com>
 <ef3e2ce7-6798-4ade-a5d4-fadf017bbd43@suse.com>
 <602c2da1-d5ab-4120-ab19-37e75820d129@bugseng.com>
 <874fc4f8-f862-4fa7-b436-dd1420d010a7@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <874fc4f8-f862-4fa7-b436-dd1420d010a7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/24 10:51, Jan Beulich wrote:
> On 11.03.2024 10:02, Federico Serafini wrote:
>> On 11/03/24 08:40, Jan Beulich wrote:
>>> On 08.03.2024 12:51, Federico Serafini wrote:
>>>> --- a/xen/common/event_channel.c
>>>> +++ b/xen/common/event_channel.c
>>>> @@ -130,9 +130,12 @@ static bool virq_is_global(unsigned int virq)
>>>>    
>>>>        case VIRQ_ARCH_0 ... VIRQ_ARCH_7:
>>>>            return arch_virq_is_global(virq);
>>>> +
>>>> +    default:
>>>> +        ASSERT(virq < NR_VIRQS);
>>>> +        break;
>>>>        }
>>>>    
>>>> -    ASSERT(virq < NR_VIRQS);
>>>>        return true;
>>>>    }
>>>
>>> Just for my understanding: The ASSERT() is moved so the "default" would
>>> consist of more than just "break". Why is it that then the "return" isn't
>>> moved, too?
>>
>> No reason in particular.
>> If preferred, I can move it too.
> 
> I for one would prefer that, yes. But what's needed up front is that we
> decide what we want to do _consistently_ in all such cases.

The only reason I left the return at the end is because it is
slightly more compliant to advisory (and not accepted) Rule 15.5 that
says to place a single return at the end of the function and to not use
early returns.

> 
>>>> @@ -1672,6 +1676,9 @@ static void domain_dump_evtchn_info(struct domain *d)
>>>>            case ECS_VIRQ:
>>>>                printk(" v=%d", chn->u.virq);
>>>>                break;
>>>> +        default:
>>>> +            /* Nothing to do in other cases. */
>>>> +            break;
>>>>            }
>>>
>>> Yes this, just to mention it, while in line with what Misra demands is
>>> pretty meaningless imo: The absence of "default" says exactly what the
>>> comment now says. FTAOD - this is a comment towards the Misra guideline,
>>> not so much towards the specific change here.
>>
>> Both you and Stefano reviewed the code and agreed on the fact that doing
>> nothing for the default case is the right thing and now the code
>> explicitly says that without letting any doubts.
>> Furthermore, during the reviews it could happen that you notice a switch
>> where something needs to be done for the default case.
> 
> That shouldn't happen during review. Anyone proposing a patch to add such
> a comment wants to first have made sure the comment is actually applicable
> there. Otherwise we're in "mechanically add comments" territory, which I
> think we all agreed we want to avoid.

What I wanted to say is that adding the comment is not completely
meaningless: it makes the intention of the code explicit and such
intention is double/triple checked.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

