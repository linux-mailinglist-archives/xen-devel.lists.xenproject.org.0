Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCD7AA0501
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 09:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971611.1359981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9fjs-00021F-0c; Tue, 29 Apr 2025 07:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971611.1359981; Tue, 29 Apr 2025 07:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9fjr-0001zn-U4; Tue, 29 Apr 2025 07:50:47 +0000
Received: by outflank-mailman (input) for mailman id 971611;
 Tue, 29 Apr 2025 07:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xSZn=XP=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u9fjq-0001zf-0y
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 07:50:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e7a6fd0-24ce-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 09:50:29 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id F0C294EE7DBB;
 Tue, 29 Apr 2025 09:50:28 +0200 (CEST)
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
X-Inumbo-ID: 9e7a6fd0-24ce-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1745913029;
	b=wYLfzK+NGu6oI0rPoXMmmmyqpfvxxMSUSL7lDVkE16OdZX18yY8Gw8nVE+quOVaSKxU/
	 OKBHDCTyQyrSathGcG7S5p4JZvl7kh6A00I1SpWDL2//QD7Dl9Fc2LiBeY2FYPoDneMfw
	 QsKGW8K11Yp+PPIUt8v79Gcwry5GFz6aNfIcJY016uPZZU9kQFPCIo3KpyE6XYzwRPBs2
	 bkFDLi8vy6HNu7X21sUIvhKqk/Mq7mF6VXjTj/yZoHIXeIBOEV97NOZj93xe4TEKkD2ul
	 oyXd9kzPyRED6FEwwzJAsDH9bfp/2blqW4pG545gteyRE5CGMzaSSR/cB9f7WdzOzhFBo
	 MEcgPxF+U4ntaoO+XT5/M0ghvNIVl34mlp+ippWe081cNctVGhQDtQusI1RVkxuYrpS+P
	 MaYNJneMiILPYtO+lbQKXBJHqClCFnNPKQghvyITifoSp9RYiNKqVToN3zbI6VVJuuHy+
	 pguCZdesxfLL3G04Ffl1xcb0NVZ4+HQdL5ryvtwOJnITwIuGDM4O021TrSA6OayC0xtAu
	 3FkFb5b671Ud7kJ/mldej9JyWUy0Xk7Pz1eH4l3VTA3gwK++EfQkXqqa8kkeQMDkq/4Qr
	 qLzf6ntzaEtlvfuFY7hIFiuG3lbCw9kWWbsp8t+JxScx8FKZiC6B5C/ihKZRhJg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1745913029;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=dfQkVeQtYBR6c6mjprnMsWp4BBYQ4wtaicbiZTIhdfM=;
	b=mnr/JRtoy8qWTc9/eRIwhBW9smNqhgDdW/a8amCLEOQy0RNbI3/PXtbChXif3bg3pp/U
	 Gh5WozrdZAKoqtnK74EU8gBrpMPFbYqYC0XYddTBSdlYitIhz9jJURO/TUuiR47geA6rk
	 xev2ByxZFVkcS8JKXtJWmb5hC4DlIZPEy1zCfOgUGM+695jWq3mmGtuhC98ykUtlVP0GR
	 WG3YpLt9tA/8rw2GatEqm7dW1bf8pyZRsm8IbmJHt0qZH9zWzNB6o1YC3jaMWf9M80v5D
	 tpt3BFmvnORDvFwlBumbtmhAdnKaAuQ/o1XK2tO4ZXxZ53bQK8Ma7wvfTNNg+mx8Dv78z
	 dVpkO/QMzq1NSUzVg45ml1OI4iIL8Fo7oTK8bLY+Ka7r1yo/UQcqixxnV445zgKrzRk+L
	 yrwWZRfYHrHmfWpLbU5L8wWbamaXoO/axNoWYOu3XWNhpBs362WUgieD2VTl/ifMzkINI
	 JAsFcH6KSJ4Qs4iQ092oiMsFEdQxWNRm8FfOCg9mjm49Wxzl760DTVX8h5KHEwyrsYDSe
	 +wcYhV70/L+0DOXLT8TsALarrnNfaxUC3sHNsEaBOByg4kpqYqD4RTZ3pymRig/rsrVNV
	 jRyqA1erDa4vQWxD8lBSUqeit8ZcP5/ohWa4CCXfUYNUJvz7beWfSsOCG35xIOg=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1745913029; bh=MNT792OGS7D4sRl6D+yIBxg/CLXU9bB9FPndNVr1uIs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FW4Glfufex+S7rP7yEUuasDkRgplwu3OKqKvqkQw/iwzFoEmTZdNwg/u4EDhbs694
	 OLLWcd9+u3s1VTVV8k4dziebFmLdrJvrUWERj1EDVM99gCGEhJaiuxPsrtWSkDukl7
	 9fLACpp9epEuZ6M5F4KYGWAUDzvXbm0GzOC0bp4xwi+qmzxROK0QQMcH7AdBkDIChv
	 +B3C91v2BX/DAccOaXAF2jaHXE0tfuwAjk+G5cwZT6ozKgwiTd++DF22mr+re4S+4z
	 tYoGF+8Uqxw0VJjuV2mYUyCW6ucqJP5xL84t5OCs3zdIyOJm3EgrayJF9eJO5va6wX
	 g4X4ZNKO57DXg==
MIME-Version: 1.0
Date: Tue, 29 Apr 2025 09:50:28 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, victorm.lira@amd.com,
 Federico Serafini <federico.serafini@bugseng.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/2] xen/page_alloc: address violation of Rule 14.3
In-Reply-To: <f2b6396c-c933-4fb9-ba4b-c90170540955@suse.com>
References: <5f2e316aae4667d1fe851e68552eb881c4d5a015.1745625477.git.victorm.lira@amd.com>
 <3146fbf3-2ff1-48a4-b05b-37477a9a5cc5@suse.com>
 <alpine.DEB.2.22.394.2504281551530.785180@ubuntu-linux-20-04-desktop>
 <f2b6396c-c933-4fb9-ba4b-c90170540955@suse.com>
Message-ID: <975094a1494f45d188e09f47d89ef6c9@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-29 08:14, Jan Beulich wrote:
> On 29.04.2025 01:21, Stefano Stabellini wrote:
>> On Mon, 28 Apr 2025, Jan Beulich wrote:
>>> On 26.04.2025 02:00, victorm.lira@amd.com wrote:
>>>> From: Federico Serafini <federico.serafini@bugseng.com>
>>>> 
>>>> MISRA C Rule 14.3 states that "Controlling expressions shall not be
>>>> invariant".
>>>> 
>>>> Add a SAF comment to deviate the rule for build configurations 
>>>> without
>>>> CONFIG_LLC_COLORING enabled.
>>> 
>>> I was surprised by this supposedly being the only violation. And 
>>> indeed it
>>> wasn't very hard to find more. For example, we have a number of
>>> "while ( num_online_cpus() > 1 && ... )", which become compile-time
>>> constant (false) when NR_CPUS=1.
>> 
>> Uhm, I did run a special scan for this and I can confirm no other
>> violations are detected.
> 
> Because of it being only one single configuration that's being scanned. 
> I did
> point out before that this is a problem for anyone wanting to certify 
> the
> hypervisor in a (perhaps just slightly) different configuration.
> 
>>>> --- a/xen/common/page_alloc.c
>>>> +++ b/xen/common/page_alloc.c
>>>> @@ -2038,6 +2038,7 @@ static struct page_info 
>>>> *alloc_color_heap_page(unsigned int memflags,
>>>> 
>>>>      spin_lock(&heap_lock);
>>>> 
>>>> +    /* SAF-14-safe MISRA C R14.3 condition always false without 
>>>> LLC_COLORING */
>>>>      for ( i = 0; i < domain_num_llc_colors(d); i++ )
>>>>      {
>>>>          unsigned long free = free_colored_pages[domain_llc_color(d, 
>>>> i)];
>>> 
>>> Hmm, this way the deviation applies even when LLC_COLORING=y.
>> 
>> Yes but in the LLC_COLORING=y case it is harmless. Do you have 
>> something
>> else in mind?
> 
> What if, perhaps by mistake, domain_num_llc_colors() becomes constant 0 
> in
> yet another configuration? (I don't expect this would work, but in 
> principle
> the comment ought to be inside an #ifdef.)
> 
>>> As to the comment wording - looks like we're pretty inconsistent with 
>>> that
>>> right now. I, for one, don't think the Misra rule needs (re)stating 
>>> there;
>>> the SAF index points at all the data that's needed if one cares about 
>>> the
>>> specifics of the deviation.
>> 
>> Do you prefer:
>> 
>> /* SAF-14-safe */
> 
> That's too short. All I'm asking for is to drop the (imprecise) rule
> reference. Noticing only now: It being imprecise may make the comment 
> go
> stale if we move to a newer Misra spec, as the rule number may be 
> different
> then.
> 

There is a guarantee by the MISRA committee to never reuse rule ids, and 
the SAF mechanism offers a centralized place where the actual rule ID 
for each tool is specified, so I don't foresee problems in that regard. 
In practical terms, I think it is very unlikely that this rule will 
change in any way (e.g. it is identical up until MISRA C:2025, published 
in March).

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

