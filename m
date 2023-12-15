Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B6814F99
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 19:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655312.1023026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEClX-0005Ru-RE; Fri, 15 Dec 2023 18:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655312.1023026; Fri, 15 Dec 2023 18:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEClX-0005QA-Od; Fri, 15 Dec 2023 18:18:27 +0000
Received: by outflank-mailman (input) for mailman id 655312;
 Fri, 15 Dec 2023 18:18:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rEClW-0005Q4-Nu
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 18:18:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rEClV-00042p-K1; Fri, 15 Dec 2023 18:18:25 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.3.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rEClV-0000yV-Dq; Fri, 15 Dec 2023 18:18:25 +0000
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
	bh=26x2uNLuz37IfKdR7s5+/RWOsOtwTlwVQz6SGBOEY5U=; b=5XOJe7aSlpeNika1Szi6zXvc8f
	gZQrmGmMslxwDLSRj/ZsiECM8rqXAB75kvnvJHYKzY6gJu7DWpfvJa1GqqeBWILUmWjFTU9e0tD4l
	8BAf3oCn3FbwYQc5Qv63LDOESh34/MIMFT+t3BihMcVBcev9aFEJxphwn0clskZaMyIM=;
Message-ID: <724bf769-709b-4489-aab3-85d5abe2abbf@xen.org>
Date: Fri, 15 Dec 2023 18:18:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
 <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
 <240c97ed-ce27-406d-84ad-68b72e999294@xen.org>
 <5ad1c008182bc9f23e1b37b0d6e35e4c@bugseng.com>
 <2b4eec7c-3657-4542-96b9-56b272e8723b@xen.org>
 <alpine.DEB.2.22.394.2312141418160.3175268@ubuntu-linux-20-04-desktop>
 <add58ef45d9cb970c2447f22443f50c8@bugseng.com>
 <c70f5399c36e364f06c525eed3058789@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c70f5399c36e364f06c525eed3058789@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/12/2023 14:08, Nicola Vetrini wrote:
>>> Yes, I would go with 3., replace advance_pc with domain_crash. Assuming
>>> that it would also solve the violation in ECLAIR.
>>
>> It needs to be prefixed with an ASSERT_UNREACHABLE(), though, because 
>> it's still a violation if there is no execution path leading to 
>> domain_crash(), but other than that it seems the safest choice.
> 
> Assuming there are no objections to going forward with this proposal, 
> would you mind telling me how can I do the proper domain_crash call. 
> Most of the examples get a "struct domain *" from a parameter or from 
> the macro "current", so I was thinking of
> 
> domain_crash(current->domain);
> 
> but I'm not so sure about this, as there are no other uses in vcpreg.c. 

That would be correct. All the helpers in vcpreg.c are meant to work on 
the current vCPU.

> You can also submit the patch yourself, if you prefer.

I am not entirely sure about which justification you want to use for 
MISRA. So here the diff:

diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 39aeda9dab62..485b3cb63c86 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -708,7 +708,13 @@ void do_cp10(struct cpu_user_regs *regs, const 
union hsr hsr)
          return;
      }

-    advance_pc(regs, hsr);
+    /*
+     * All the cases in the switch should return. If this is not the
+     * case, then something went wrong and it is best to crash the
+     * domain.
+     */
+    ASSERT_UNREACHABLE();
+    domain_crash(current->domain);
  }

  void do_cp(struct cpu_user_regs *regs, const union hsr hsr)

Cheers,

-- 
Julien Grall

