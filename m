Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886B380E83D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:53:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652885.1019010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzS8-00073C-U1; Tue, 12 Dec 2023 09:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652885.1019010; Tue, 12 Dec 2023 09:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzS8-00071B-RL; Tue, 12 Dec 2023 09:53:24 +0000
Received: by outflank-mailman (input) for mailman id 652885;
 Tue, 12 Dec 2023 09:53:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5yJ=HX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rCzS7-000715-OQ
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:53:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48c0b07a-98d4-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 10:53:21 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 48B9C4EE0737;
 Tue, 12 Dec 2023 10:53:21 +0100 (CET)
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
X-Inumbo-ID: 48c0b07a-98d4-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Tue, 12 Dec 2023 10:53:21 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/7] xen/shutdown: address MISRA C:2012 Rule 2.1
In-Reply-To: <b8aa0715-db0f-4832-9cd2-6bd2ca296853@suse.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <c0a8a12e39d688e101936d221af0f8eeefabe352.1702283415.git.nicola.vetrini@bugseng.com>
 <b8aa0715-db0f-4832-9cd2-6bd2ca296853@suse.com>
Message-ID: <984227ed9db13d3e22d95081b03a127a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-12 10:45, Jan Beulich wrote:
> On 11.12.2023 11:30, Nicola Vetrini wrote:
>> Given that 'hwdom_shutdown' is a noreturn function, unreachable
>> breaks can be eliminated to resolve violations of Rule 2.1.
>> On the occasion, the type of its parameter is changed to uint8_t.
> 
> I don't particularly mind that extra change, but it's entirely 
> unrelated
> here. We do such when we touch lines (or maybe adjacent lines) anyway,
> but here you had no need to touch either declaration or the header of
> the definition.
> 

Ok. I can make this a separate patch, since I'm already touching the 
function

>> --- a/xen/common/shutdown.c
>> +++ b/xen/common/shutdown.c
>> @@ -30,7 +30,7 @@ static void noreturn maybe_reboot(void)
>>      }
>>  }
>> 
>> -void hwdom_shutdown(u8 reason)
>> +void hwdom_shutdown(uint8_t reason)
>>  {
>>      switch ( reason )
>>      {
>> @@ -38,39 +38,32 @@ void hwdom_shutdown(u8 reason)
>>          printk("Hardware Dom%u halted: halting machine\n",
>>                 hardware_domain->domain_id);
>>          machine_halt();
>> -        break; /* not reached */
>> 
>>      case SHUTDOWN_crash:
>>          debugger_trap_immediate();
>>          printk("Hardware Dom%u crashed: ", 
>> hardware_domain->domain_id);
>>          kexec_crash(CRASHREASON_HWDOM);
>>          maybe_reboot();
>> -        break; /* not reached */
> 
> Given the function's name, I don't view this removal (and the similar 
> one
> further down) as acceptable. The function first needs renaming so that
> from its name one can no longer (wrongly) infer that it may reboot or 
> else
> return.
> 
> Jan

Something like "reboot_or_halt" would be okay?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

