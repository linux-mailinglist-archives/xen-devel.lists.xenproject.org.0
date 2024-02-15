Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AA3856277
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 13:02:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681630.1060476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raaRt-0007bk-Ee; Thu, 15 Feb 2024 12:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681630.1060476; Thu, 15 Feb 2024 12:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raaRt-0007aD-Bf; Thu, 15 Feb 2024 12:02:41 +0000
Received: by outflank-mailman (input) for mailman id 681630;
 Thu, 15 Feb 2024 12:02:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1raaRr-0007a5-QH
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 12:02:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1raaRq-0005SM-7T; Thu, 15 Feb 2024 12:02:38 +0000
Received: from [15.248.3.91] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1raaRq-0005L9-00; Thu, 15 Feb 2024 12:02:38 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=aWcygKsX8KOLDbXVs29E6KNV+EnbpNffkJm7PT0ErVQ=; b=n00gR+Okuq0+MZo5GQGKLrepNO
	LB6/UGTw0TiEDuVgnT07QLCw6wBpkDskZG0xi2B2Vka4T5sPbWEeORNOqWp0a2Y74fikvXSiM7It+
	dc3ERUzdoOWCYdt9SdX5Ts9i4Ahomb7T1T9pqJ49JslMhVwsFjx0h5wedLk8I0G8N2og=;
Message-ID: <ce0f46ff-e7db-4c72-bab0-ea12e496ad8d@xen.org>
Date: Thu, 15 Feb 2024 12:02:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] keyhandler: drop regs parameter from
 handle_keyregs()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <5258d8a9-a7ef-4342-9b5c-fc0078139bb2@suse.com>
 <0bbe2028-946c-459f-b6cc-419869d22b35@xen.org>
 <bdba33b7-7fc2-4836-8b78-0d56edb30871@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bdba33b7-7fc2-4836-8b78-0d56edb30871@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/02/2024 09:13, Jan Beulich wrote:
> On 08.02.2024 23:09, Julien Grall wrote:
>> On 05/02/2024 13:28, Jan Beulich wrote:
>>> In preparation for further removal of regs parameters, drop it here. In
>>> the two places where it's actually needed, retrieve IRQ context if
>>> available, or else guest context.
>>>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> As an alternative to the new boolean parameter, I wonder if we couldn't
>>> special-case the idle vCPU case: It's only there where we would not have
>>> proper context retrievable via guest_cpu_user_regs().
>>
>> I am trying to understand the implication. Looking at the code, it seems
>> in the case where we pass NULL, we would expect to call
>> run_in_exception_handler().
> 
> Right, when NULL was passed so far, and when true is passed now, that's
> to indicate to invoke run_in_exception_handler().
> 
>> If I am not mistaken, at least for Arm, regs would not be the same as
>> guest_cpu_user_regs(). So I think your current approach is more correct.
>>
>> Did I miss anything?
> 
> Whether regs are the same isn't overly relevant here. The thing that's
> relevant is whether what would be logged actually makes sense. And
> invoking guest_cpu_user_regs() in idle vCPU context makes no sense.
> Whereas in other contexts its result is good enough to show the present
> state of the CPU; there's no real need in such a case to go through
> run_in_exception_handler().
> 
> The present approach therefore isn't necessarily "more correct", but it
> is closer to prior behavior.
> 
> The corner case that makes me prefer the presently chosen approach is
> when a CPU is in the middle of scheduling, especially considering x86's
> lazy switching (when current != this_cpu(curr_vcpu). The main reason to
> mention the alternative is because iirc Andrew had suggested to move
> more in that direction.

Thanks for the clarification. I don't have any strong preference either 
way. So I would be happy to go with your solution.

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

