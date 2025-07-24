Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A51A4B10212
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 09:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055353.1423766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqXW-0000OB-PH; Thu, 24 Jul 2025 07:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055353.1423766; Thu, 24 Jul 2025 07:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqXW-0000LV-Lv; Thu, 24 Jul 2025 07:38:54 +0000
Received: by outflank-mailman (input) for mailman id 1055353;
 Thu, 24 Jul 2025 07:38:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P3HE=2F=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ueqXV-0000LP-4z
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 07:38:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eae7462-6861-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 09:38:52 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 662214EE3C07;
 Thu, 24 Jul 2025 09:38:51 +0200 (CEST)
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
X-Inumbo-ID: 3eae7462-6861-11f0-a31e-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753342731;
	b=r5N932N29BmrEiiUDtUgJ9Y3cgT+swYrl15L8a3+JXv+5tz//j3o3K5gzS7KCsOjkv6F
	 AtZKpGlB3pp6JXC3T6xv4ObLKdkBWiKcv+189n22yWZenfNUQQPvG+itmhK73q+hTiXW9
	 7usRPv3T0Nm83Nk7MptIiKnX+RTjCvedSzuvzHa2Bcy0hovmg3vOPEtq39KRxHkfrQstY
	 mCh2h87iG/8aFyFtrtzKzesa+d+tU8wJ+KLj0vSXPDF6zgSR9zjmQnkvkILjEKM3qhL9G
	 PITXJDF/2qrrBpImFXADR741WmKSHHxHF/O1XVpKHs8j2EENHC7wPO4CkJtt177ojIf/n
	 +eHvggytJvSCzVMxA2ppWQkgldmHL98hWh0Vs6i3GKAPSvJEPi8P8W4UnHK0JLmMx2nUA
	 3TBUTNNLgUVqYHWIfaejKwFpcICfBBPzrrdormlG1r6qxFYAd9E/GSXKg23L3Af1rFYAI
	 jp80tWRB/XHVLKb61Z+jy6A9q4QeH9aM9IdFeNk/powSEi5OYnrIKfbeQaJZuOMGRHwFv
	 tCm9t2Tb/NvtHxopqxIPBAKqzouvXgXzfpDRdUfvLdBye4Iaibx8x8nCfnc+LwCk+gRV0
	 nVoJozcttZEkZZaf67I7NYCliTjyCS0e1jrIfeOo0zC30SJBo3rHqEv435XFc68=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753342731;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=1R2D3t3r1PRJdK2bnWN0nGkEYv4nX0dqtD02hnLM4Ec=;
	b=GyJH6k8O143Fz2bGSs9ucOfMDCFIlYl0hpNXiVT0/teNsdE21z/9QX4oXk4ngowVex20
	 c5VZyT18uJmOwf9/Y2jmj2KUzuD+7h2sOgJtpPGj4NqTwBhY9G+flDvQUUFGHa2RmQ60N
	 lCQWttfZ35sv1yo6i9EhC+TC8VVFTGB0cF1TBBl6/vX9eSXzuKgMv5P5i8Pf0tBiEjvfl
	 6pKgsPrmJxdkXOskB5zOGd+JQKg4I06JeVBOAD6Ai0SBc3WvhMbMhGT3WdKknZiMnCw7/
	 BZQOm58sceiIn7cS0rsRFGTcHiCGBpDwv5yEz90SeSOY/xQ7yqo/smtQdYt7ZShEEk0J8
	 zu/L37FcQyw2SIv7u0w1f/lIDMhrIKEmeFy50nRNStEIPz1ZQHK/7veNifRrSHwTjrwGC
	 DZ7cd7evLlfThm67k005CXPOsFAKOIeTPCX0h933rgpM39FAuWV4Rq+OdqPj0AJjaBtg6
	 BcxO4g+EqoWrmsCuM44n1pe1B7m4S8Bv4LCmpF0BOEAGbalQUZc5U4ppD15cDij0Pp3PK
	 dg9QUv4YrddPVUiHogEZlXIh9QMwB6SQoI46RopbkvnS5+NwV86QfDrURUoomlloRnRBK
	 klEydPctUF/UHipDTw20RsLdc0+fxfmHjU+hV7SA9MZGJqe17P+uUAWlKKG6aPI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753342731; bh=yy2e9c/OKNoJ5nmLfMQ077JkN/b6SYe9RGU08ndXwW0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vSva8xEmR3FcQ9GgheCUDb71HbznEGf0u66zrFEbR5jvuu7DekFaje0+oXhAILEqk
	 uKZCl96i7f9PKQ/UeiLPosipH18AeA13z0m5siIppIPzDOENXVUIVWoE8dWF9/KJaC
	 rlH0vLLHWPfrI8iamN3vxmj4UYVRvOod8lzPwiWJQ8gD4xsgO3pWNFt7VL6N4TGVik
	 ljpbwKEFXSnuK3mnHAhEpOq5BvvboEcxNioavlRC8nQv6o6cml7HPsBimsgT+DYLpg
	 ck3yW8B8y9ARhdZsddaowqjEBeAOl8ZedsxRMaSt6UjWu0ImyLDu5G6baz8Qyw1Do7
	 x1W3lEpPH7fPg==
MIME-Version: 1.0
Date: Thu, 24 Jul 2025 09:38:51 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation/eclair: tag guidelines D4.7, R21.18, R21.20 as
 clean
In-Reply-To: <f59636e1-c882-4aae-b2f2-4db707bfed13@epam.com>
References: <9045a2e3cae57995bb279f66de19e9a6beed3a5b.1753277988.git.dmytro_prokopchuk1@epam.com>
 <alpine.DEB.2.22.394.2507231324350.7043@ubuntu-linux-20-04-desktop>
 <f59636e1-c882-4aae-b2f2-4db707bfed13@epam.com>
Message-ID: <2ee7a8b99fb4e3c2fffad1b905a260c4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-24 00:19, Dmytro Prokopchuk1 wrote:
> On 7/23/25 23:24, Stefano Stabellini wrote:
>> On Wed, 23 Jul 2025, Dmytro Prokopchuk1 wrote:
>>> Update ECLAIR configuration to consider guidelines as clean
>>> so as to avoid regressions.
>>> 
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> 
>> Please provide a link to a clean pipeline. Assuming you have it:
>> 
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>> 

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> Yes, sure.
> Below is the pipeline link:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1943820512
> 
> Dmytro
>> 
>>> ---
>>>   automation/eclair_analysis/ECLAIR/tagging.ecl | 3 +++
>>>   1 file changed, 3 insertions(+)
>>> 
>>> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl 
>>> b/automation/eclair_analysis/ECLAIR/tagging.ecl
>>> index 879485b680..c79358bdae 100644
>>> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
>>> @@ -23,6 +23,7 @@
>>>   "MC3A2.D1.1||
>>>   MC3A2.D2.1||
>>>   MC3A2.D4.1||
>>> +MC3A2.D4.7||
>>>   MC3A2.D4.10||
>>>   MC3A2.D4.11||
>>>   MC3A2.D4.14||
>>> @@ -103,7 +104,9 @@ MC3A2.R21.10||
>>>   MC3A2.R21.11||
>>>   MC3A2.R21.12||
>>>   MC3A2.R21.13||
>>> +MC3A2.R21.18||
>>>   MC3A2.R21.19||
>>> +MC3A2.R21.20||
>>>   MC3A2.R21.21||
>>>   MC3A2.R22.1||
>>>   MC3A2.R22.2||
>>> --
>>> 2.43.0
>>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

