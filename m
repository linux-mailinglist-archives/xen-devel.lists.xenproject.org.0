Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2A27AB1F0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 14:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606850.944895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjf3f-0006Zz-MD; Fri, 22 Sep 2023 12:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606850.944895; Fri, 22 Sep 2023 12:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjf3f-0006Xw-JC; Fri, 22 Sep 2023 12:14:55 +0000
Received: by outflank-mailman (input) for mailman id 606850;
 Fri, 22 Sep 2023 12:14:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Esjf=FG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qjf3f-0006Xq-2N
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 12:14:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a260fbc2-5941-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 14:14:52 +0200 (CEST)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 397024EE0739;
 Fri, 22 Sep 2023 14:14:52 +0200 (CEST)
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
X-Inumbo-ID: a260fbc2-5941-11ee-9b0d-b553b5be7939
Message-ID: <8e3a44d4-e8ba-1750-4602-ca5e510a043e@bugseng.com>
Date: Fri, 22 Sep 2023 14:14:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen/emul-i8254: address a violation of MISRA C:2012
 Rule 8.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <be245ab9b3805cdb1ba93695b95eeab24d432d6a.1695308350.git.federico.serafini@bugseng.com>
 <0801b6f4-85d8-d10b-1f03-18201641e8f2@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <0801b6f4-85d8-d10b-1f03-18201641e8f2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/09/23 10:29, Jan Beulich wrote:
> On 21.09.2023 17:05, Federico Serafini wrote:
>> Make function declaration and definition consistent.
>> No fuctional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   xen/arch/x86/emul-i8254.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
>> index 41ec4a1ef1..c48a3606a2 100644
>> --- a/xen/arch/x86/emul-i8254.c
>> +++ b/xen/arch/x86/emul-i8254.c
>> @@ -572,7 +572,7 @@ static uint32_t speaker_ioport_read(
>>   }
>>   
>>   static int cf_check handle_speaker_io(
>> -    int dir, unsigned int port, uint32_t bytes, uint32_t *val)
>> +    int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>>   {
>>       struct PITState *vpit = vcpu_vpit(current);
>>   
> 
> While okay-ish, could I talk you into addressing the problem at its root,
> by eliminating the two forward declarations? Afaict all it takes is to
> move pit_init() down past the two functions it takes the address of. (Of
> course at that point it may want considering whether to keep
> pit_{,de}init() and pit_reset() close together.)
> 
> Jan
>

It seems to me a good alternative, I'll send a v2.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

