Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C797D8FA9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 09:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624245.972648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHBF-00050Q-Mo; Fri, 27 Oct 2023 07:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624245.972648; Fri, 27 Oct 2023 07:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwHBF-0004yi-KB; Fri, 27 Oct 2023 07:22:53 +0000
Received: by outflank-mailman (input) for mailman id 624245;
 Fri, 27 Oct 2023 07:22:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HqTC=GJ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qwHBE-0004No-Cn
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 07:22:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a342a706-7499-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 09:22:51 +0200 (CEST)
Received: from [192.168.1.15] (host-95-247-204-25.retail.telecomitalia.it
 [95.247.204.25])
 by support.bugseng.com (Postfix) with ESMTPSA id C7CA14EE073E;
 Fri, 27 Oct 2023 09:22:50 +0200 (CEST)
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
X-Inumbo-ID: a342a706-7499-11ee-98d6-6d05b1d4d9a1
Message-ID: <274fcb9f-93af-45e0-bb33-8152d740cb7e@bugseng.com>
Date: Fri, 27 Oct 2023 09:22:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/set_{c,p}x_pminfo: address violations od MISRA
 C:2012 Rule 8.3
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>
References: <88499ca9a61b59d13d90f6c5f77cbb2e124d850e.1698322083.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310261559470.271731@ubuntu-linux-20-04-desktop>
 <1795ba80-803a-7ed0-73fa-7d6e06691bad@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <1795ba80-803a-7ed0-73fa-7d6e06691bad@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/10/23 09:07, Jan Beulich wrote:
> On 27.10.2023 01:00, Stefano Stabellini wrote:
>> On Thu, 26 Oct 2023, Federico Serafini wrote:
>>> @@ -675,16 +673,16 @@ static int __init cpufreq_cmdline_parse(const char *s, const char *e)
>>>   static int cf_check cpu_callback(
>>>       struct notifier_block *nfb, unsigned long action, void *hcpu)
>>>   {
>>> -    unsigned int cpu = (unsigned long)hcpu;
>>> +    unsigned int acpi_id = (unsigned long)hcpu;
>>>   
>>>       switch ( action )
>>>       {
>>>       case CPU_DOWN_FAILED:
>>>       case CPU_ONLINE:
>>> -        (void)cpufreq_add_cpu(cpu);
>>> +        (void)cpufreq_add_cpu(acpi_id);
>>>           break;
>>>       case CPU_DOWN_PREPARE:
>>> -        (void)cpufreq_del_cpu(cpu);
>>> +        (void)cpufreq_del_cpu(acpi_id);
>>>           break;
>>>       default:
>>>           break;
>>
>> I take you made these changes to cpu_callback for consistency, not
>> because they are required? Everything else makes sense so:
> 
> I'm sorry, but no, these changes are not only not required, they're
> outright wrong. CPU callbacks never talk in terms of ACPI IDs. The
> two functions called also aren't otherwise altered in this patch,
> and both take "unsigned int cpu".
> 
> Jan
> 
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 

These changes were not intended, I'm sorry.
I'll submit a v2. I also noticed that there are a few places left
where the coding style can still be improved.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

