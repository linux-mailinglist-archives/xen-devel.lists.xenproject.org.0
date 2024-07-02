Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1548391F09E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 09:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752017.1160158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOYPH-0000FA-Mg; Tue, 02 Jul 2024 07:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752017.1160158; Tue, 02 Jul 2024 07:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOYPH-0000Dg-JW; Tue, 02 Jul 2024 07:58:31 +0000
Received: by outflank-mailman (input) for mailman id 752017;
 Tue, 02 Jul 2024 07:58:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=73HO=OC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sOYPG-0000Da-F1
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 07:58:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de77210a-3848-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 09:58:29 +0200 (CEST)
Received: from [192.168.99.204] (unknown [91.85.33.231])
 by support.bugseng.com (Postfix) with ESMTPSA id 426824EE0738;
 Tue,  2 Jul 2024 09:58:28 +0200 (CEST)
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
X-Inumbo-ID: de77210a-3848-11ef-958a-bbd156597b9e
Message-ID: <b9a53e02-1bdc-465a-bb3f-cb7f477737d0@bugseng.com>
Date: Tue, 2 Jul 2024 09:58:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 08/12] x86/vpt: address a violation of MISRA C Rule
 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719383180.git.federico.serafini@bugseng.com>
 <453ef39f5a2a1871d8b0c74d921ed6a413b179b4.1719383180.git.federico.serafini@bugseng.com>
 <6237453c-b07d-4aad-af33-099b4cc37838@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <6237453c-b07d-4aad-af33-099b4cc37838@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/24 10:49, Jan Beulich wrote:
> On 26.06.2024 11:28, Federico Serafini wrote:
>> --- a/xen/arch/x86/hvm/vpt.c
>> +++ b/xen/arch/x86/hvm/vpt.c
>> @@ -118,9 +118,11 @@ static int pt_irq_masked(struct periodic_time *pt)
>>               return 0;
>>   
>>           gsi = hvm_isa_irq_to_gsi(pt->irq);
>> +
>> +        /* Fallthrough to check if the interrupt is masked on the IO APIC. */
>> +        fallthrough;
>>       }
>>   
>> -    /* Fallthrough to check if the interrupt is masked on the IO APIC. */
>>       case PTSRC_ioapic:
>>       {
>>           int mask = vioapic_get_mask(v->domain, gsi);
> 
> See question on patch 7. Plus the blank line may want purging here along
> with the comment, to be consistent with what you're doing elsewhere.

When in doubt, I think it is better to clarify rather than not,
however, if no one has anything to say, I will follow your instruction.

--
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

