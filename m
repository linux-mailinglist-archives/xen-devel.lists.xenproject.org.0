Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77240ACEF19
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 14:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006768.1386003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9bm-0001JZ-G5; Thu, 05 Jun 2025 12:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006768.1386003; Thu, 05 Jun 2025 12:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9bm-0001Ga-Ch; Thu, 05 Jun 2025 12:22:10 +0000
Received: by outflank-mailman (input) for mailman id 1006768;
 Thu, 05 Jun 2025 12:22:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mrB3=YU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uN9bk-0001GS-Ke
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 12:22:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afddcf45-4207-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 14:22:03 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6C4CD4EE7C3E;
 Thu,  5 Jun 2025 14:22:02 +0200 (CEST)
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
X-Inumbo-ID: afddcf45-4207-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1749126122;
	b=oDKKHZNs4FijA0w/G4dB7gG5TSQdDLheCysK8IauhThrNrbJcMO0z9/VHqxt5Jsk1jDb
	 cq9o5dUbSrinJi7RriNIIESQHWY9VyOTPRtSWk1i+xDBiXALwVqTdMVLoZsDePTtSb1Ym
	 7BTPbGH7fpXUglOUpdd7uUOx4XfdL8o/C2g8DEwR43GY9l9AJtZhuCAw4+VhqKc7NMKXw
	 cyQwPqILNsv+NZOKJc7Hm3qp4kzj5hphgJhRlngP866ZWwrW9qwEAI3LNVqaCLmBeYaD5
	 1/YAvJOe1Pvj9Qki0FUjkZQULcXr5rOtP464WrfI54IIfWz74cMfmoVUlfEy5f8mBNHku
	 U9s3glglAKyaQ/yp2fZ8QRQ3cHnwVH5JzhmRDsfDLMT7Dk4SVKC5MHZ8vimQV4719GuZR
	 Raa9UmaLvMBjKSkBzR1I2QV8aaXCupUlSFZU/mw6PcK4EDs+3cDL9FPbchKHmHsAWXZSw
	 PwhJQZru4yNqN2yviZpAwqinT0Mji9e4YGBy2iZTrtbhw6jnxjVsNe6R2PDHpLUr+GlbH
	 JDreaYesG+Het98ekI/heCDWNSul65Rq3DnpxtK+53FlEKDPuWFHhDbqz/vi9jkA2UMTo
	 wUrRJVP7sswz6UGJx7sb3zE5+JdaGKMADrnPV6fLah79RNoBzeZKXChgRih2ibU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1749126122;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=arKwn2jSHhIDgNuO6bTEQtIBxWHLavABUBKp05SAwhk=;
	b=NbvXZYXMmN8cArXeO0HKK//wKkltklyRLq+xcW0Rmgp4/UxuHYTiSP4eQcSnw5O01p9Q
	 4X6WQmRnBIVy9jBkQ6jG1vzg1eM6pmCJMka6gRzJqo6rtpOwWjlxFQ6Pdo4wSbT97xUA0
	 AgSuvIfj1dKWSk8kMkBZzYoCrtj7IDsXpReLlWEO9oKchQCafbvr7cI4jfHRBf5Wwc9ww
	 jfOnmoGAYt2+8L/ELJxRtqXD60IEQ9CihNDBw1Mk6suNz7A9w3HLqT/8+9eRJOS3wummy
	 /fRhohEvxsvs3BNkY3rTtNRHQ5MaS0rOCWW7pv+N2V6i8mhMHG8v4if90H0U+qnmQfABt
	 WevhbN6s78ffdYsA8pAgq5eucAfRQ7iECHidiIsyptTJRar9UoZ6dGSgb0wh+0UHQJ+kv
	 0dg1DH76eMLxdwkGvtvBhQSes245NPUgNsH1CB+K+DauldpHgtc8W2FgKUkWelgqPZWby
	 Z6kOhSI0/gahT5RBveois9vXJ6h7CFlYR1zzmZ1MjGvhbQkWVtDu34/3gdaZgFX5soQWy
	 8g9HSJ5dQ3TLY3A3cCOZBDQgeahZTsa+FGSaEG+VmcaXkPDVzJ6NXOuLr9BhfiEJtK0yU
	 kiXoxoDAAF24Ru51QDs4pMSc+VaYeN4BCvlCO3ckAjhXP2pwYKEE8keAIjVW3gE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1749126122; bh=fR7HLwODY4rYRCY1LX1io5tG6HZXy8KY/aHAsXAOPWw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=w3DCAEKmTpJuDIDe+ipuvidZANa/DI16Spfo7AnYCvMUrbVLkq6w2QbJRKZlWCtss
	 uZfO3ThtUkmw07Mo23OWmaQjobxedrOU6r1JWjm8qOJEos6B2QZNmUWuowUxeoQKC+
	 sfgXa1Yl8eeL3UJ236V99Gk8281/3Xun9VRD66PZgQm5g1L+NyQTpY0N2roLaPsAzf
	 TbPOHSYagkafOkEvlThBTRfJEMsOJWhMNwpCYQdZMZOVzzSD0duTVi5lItHpxUhhcv
	 7cshZRtBGGKAXh67DML/u1eDS4dG6bDKAE/pII14eWs13bCZpK63ikmGlNF1C3kkyT
	 CW0ZJRq4fNwyA==
MIME-Version: 1.0
Date: Thu, 05 Jun 2025 14:22:02 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: victorm.lira@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=83=C2=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] xen/keyhandler: add missing noreturn attribute
In-Reply-To: <9e3a7b1b-7fbe-428b-888a-c18c95d8ee37@suse.com>
References: <20250604235034.1595881-1-victorm.lira@amd.com>
 <9e3a7b1b-7fbe-428b-888a-c18c95d8ee37@suse.com>
Message-ID: <b258936e289290321e9a8b2d23723fc2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-05 09:17, Jan Beulich wrote:
> On 05.06.2025 01:49, victorm.lira@amd.com wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 
>> Function `reboot_machine' does not return, but lacks the `noreturn' 
>> attribute,
>> therefore causing a violation of MISRA C Rule 2.1: "A project shall 
>> not contain
>> unreachable code".
> 
> Is this (uniformly) true? Looking at ...
> 
>> --- a/xen/common/keyhandler.c
>> +++ b/xen/common/keyhandler.c
>> @@ -251,7 +251,7 @@ static void cf_check dump_hwdom_registers(unsigned 
>> char key)
>>      }
>>  }
>> 
>> -static void cf_check reboot_machine(unsigned char key, bool unused)
>> +static void noreturn cf_check reboot_machine(unsigned char key, bool 
>> unused)
>>  {
>>      printk("'%c' pressed -> rebooting machine\n", key);
>>      machine_restart(0);
> 
> ... generated code here, I can see that the compiler is perfectly able 
> to
> leverage the noreturn that machine_restart() has, resulting in no
> unreachable code to be generated. That is - neither in source nor in
> binary there is any unreachable code. Therefore I'm having a hard time
> seeing what the violation is here.
> 
> That said, I certainly don't mind the addition of the (seemingly) 
> missing
> attribute. Otoh I wonder whether an attribute the removal of which has 
> no
> effect wouldn't count as "dead code" or alike, violating some other 
> rule.
> 

Inlining does not play a role in this case. Here reboot_machine() is 
marked as a violation because machine_restart() is noreturn and there is 
no other path upon which reboot_machine() may return, hence any function 
calling reboot_machine() could have portions that are inadvertently 
unreachable (as in never executed due to divergence) by not having the 
annotation. That said, in such trivial cases compilers are typically 
able to derive the property automatically, but they are not obliged to 
and, more importantly, the behavior may even differ with the same 
compiler using different optimization levels.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

