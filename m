Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C102375A7EC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 09:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566404.885173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMODM-00053P-0B; Thu, 20 Jul 2023 07:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566404.885173; Thu, 20 Jul 2023 07:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMODL-000513-Tm; Thu, 20 Jul 2023 07:36:43 +0000
Received: by outflank-mailman (input) for mailman id 566404;
 Thu, 20 Jul 2023 07:36:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2HW=DG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qMODL-00050c-Er
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 07:36:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bd7805b-26d0-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 09:36:42 +0200 (CEST)
Received: from [192.168.1.101] (unknown [37.162.143.190])
 by support.bugseng.com (Postfix) with ESMTPSA id CAC844EE0C89;
 Thu, 20 Jul 2023 09:36:41 +0200 (CEST)
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
X-Inumbo-ID: 2bd7805b-26d0-11ee-b23a-6b7b168915f2
Message-ID: <c09a3d2c-efe7-8071-84ba-1e27883e079a@bugseng.com>
Date: Thu, 20 Jul 2023 09:36:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] x86/HVM: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <589e9c2ef5f13bf0c035b63f7b2e24fbbb878543.1689773180.git.federico.serafini@bugseng.com>
 <2ffe60a1-83dd-c027-6924-029b36b9a4eb@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <2ffe60a1-83dd-c027-6924-029b36b9a4eb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/07/23 09:13, Jan Beulich wrote:
> On 19.07.2023 15:52, Federico Serafini wrote:
>> --- a/xen/arch/x86/hvm/rtc.c
>> +++ b/xen/arch/x86/hvm/rtc.c
>> @@ -559,17 +559,17 @@ static inline int from_bcd(RTCState *s, int a)
>>   
>>   /* Hours in 12 hour mode are in 1-12 range, not 0-11.
>>    * So we need convert it before using it*/
>> -static inline int convert_hour(RTCState *s, int raw)
>> +static inline int convert_hour(RTCState *s, int hour)
>>   {
>> -    int hour = from_bcd(s, raw & 0x7f);
>> +    int ret = from_bcd(s, hour & 0x7f);
>>   
>>       if (!(s->hw.cmos_data[RTC_REG_B] & RTC_24H))
>>       {
>> -        hour %= 12;
>> -        if (raw & 0x80)
>> -            hour += 12;
>> +        ret %= 12;
>> +        if (hour & 0x80)
>> +            ret += 12;
>>       }
>> -    return hour;
>> +    return ret;
>>   }
> 
> I've just sent an alternative correction for this.
> 
> Jan

I will send a v3 removing my changes to this function.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

