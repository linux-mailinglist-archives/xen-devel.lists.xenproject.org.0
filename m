Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7F4B174BA
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066032.1431435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVr0-0008D2-6J; Thu, 31 Jul 2025 16:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066032.1431435; Thu, 31 Jul 2025 16:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVr0-0008AI-2A; Thu, 31 Jul 2025 16:10:02 +0000
Received: by outflank-mailman (input) for mailman id 1066032;
 Thu, 31 Jul 2025 16:10:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xYFp=2M=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uhVqz-00082p-4a
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 16:10:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce92c0ca-6e28-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 18:09:59 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id BD10F4EE3C02;
 Thu, 31 Jul 2025 18:09:57 +0200 (CEST)
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
X-Inumbo-ID: ce92c0ca-6e28-11f0-b895-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753978198;
	b=orN3FtAMCfrY5evuDNG6dlIiNVCZt6qyg26gQIzKuWlf+XKr58PkNCytkS2oEBVASb4Y
	 upj/qOvc1kGNEzeh40RzyYFR951Xpg0uDDarVgOCIlcoLu3UdztR8Zm908PYMwB4V3b/M
	 nqnwoUU4+m4OhfEUNiQVxhjLJF00/q6hR6PnBOJ09THvEBCZL6J7lqLc4bzsU+SE+9JyU
	 9/dxCiHp00ZYCK1h/5zZ10Ve0xYdhtjgtmOrMY1O7m+vBgSygxJgTVuka0lKFfaHjngnB
	 6YjnwKRdJF6YcgFK2p36mCFP5AixBEFSl5rXwGC23cdlu6AED8SG0KLq9cTZA5aK5lOI5
	 u28yfpZGatNUiWoTxn4Xsmnh1DYQdMxrB1wD/0tdLcBrVSR/clsfqw4I2d6UxEd7LOL0u
	 0i+hNptVguKWOMDkGt8H1GMm0GLnpxI9E5tSUZVmky/7ylzTFICfSiasJyXyl56uIahgL
	 xk4/XU0mWf7Iv4ESyL3Iomx7Jt7thbvUH4dX+aQbiicWMDOKe7q+V6IbtjdZya6Yb/oci
	 AVxayxHEIQsuCHpwqKLf9V4hfCGoKSZYep6Qbt528mOrA587namEKkZnbvLWfDGo3VJ06
	 qaIeWjun5Qt3c8/FIohxKk+hrgr5Njhik0fZATFvXpD5aBaW4YvGYQDY84zY0Yw=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753978198;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=NFAmfO++jaBaaSF8ptPpb12ixK59ZYs1HyzRGK4j40w=;
	b=zlSvO4nvP20ZvFnXSEj9NE1R61maoGzRx9S/JAJ4XuAvvJHj/DnazaTi0BSGcvEe9oSI
	 Y6syT8ialysce+91KOmXHp19Jx82X/YqIrSOkhGNiufokf/zp1WDnBeBwy1fvbLQEQZbu
	 vNeBdCtFYBex6lJJfuAQY/FB8SCYSgO+dNBIkkZqUDR7y1e4zr1OKfvThJBVM7IofAimE
	 BTaBASfaz2WRKCu907i+sBcZ+maqocoHgoPDiLPGyMQrGpsDzO982P9Tp7UPTclLxVr7V
	 QRbX3hYs2prH7di1ChRQ3B5zWSq1HObQST/CSPKOj2YxzkVlpkQu4xLlptjWTdhBye0O4
	 KF1tpitCl4ujcMRfJgrhzU82EZDK1pokA0yb8ztzUgoME0gpnpatGogPUCEf5lKb/zoBi
	 qzgGF2RTOsLsbuZSg/exrX4W80i/apEWTVIitJOQZnIptcPTsFgUtJJc+lNxVgt2FOMQV
	 ig6ODh8Pp+qv5E09t29HvYJuZuu1wdgTCi8/fNpm71K74f8Du1isTflx1tZPACJao59OA
	 dk1f79P/q1g9sztUi81GJAR9RjHYLGKPgfWoag6Fcw/mNLJ9Slb8b5poJOHNAuPb3W7sb
	 3ybPFeskg+L1nClzGvmwwzph2ix0LxlIeAQEFs1behfu83On5Kx4hPymdqqC3dY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753978198; bh=PQgqOGgD7fqxbyNruFTKq+UY5QPyhvZ1gHc/xkjkhLE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t2yzI1dp4V1VelU01ryEUfPsegJbFIddw3VzFwbA+ysZJIdH43sycQ6+eRy0llIVV
	 sajCoG1dJXty8/uN0Wo5SjT2AMGBKsZ6Q9ziUbgM/KvqhjUlWzzDvI8EIbajggy3x8
	 bVDkX2n++SVUGpWTXFP6Ozy2d38+sQGKfoDLgRtkNFKBteEhrkpz2BiXY2PrP679gu
	 MlhqYlqbKA7cjslClbpiKgg0K79amjtLIdGusUmLw2T2wk3aQAWIqnBc7P/cvRHQ1o
	 OZAPVAb22QfdOQgM2EhhaVi6rwcitsqTmp4TU5knaADy1lH0dyIw2jLAFtJ2gNhCpH
	 Q9Jk7LiSE3O/Q==
MIME-Version: 1.0
Date: Thu, 31 Jul 2025 18:09:57 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Dmytro Prokopchuk1
 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
In-Reply-To: <9952fc5c-b95a-4879-a442-12e491438e08@citrix.com>
References: <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
 <470a04e6-f8c1-4937-8478-0f80107d562d@citrix.com>
 <898e1c2a-7684-489b-84cd-254b2ee53e5d@suse.com>
 <9952fc5c-b95a-4879-a442-12e491438e08@citrix.com>
Message-ID: <689178480a418f04158d623e3cedd4bd@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-31 18:05, Andrew Cooper wrote:
> On 31/07/2025 4:58 pm, Jan Beulich wrote:
>> On 31.07.2025 17:37, Andrew Cooper wrote:
>>> On 31/07/2025 4:16 pm, Dmytro Prokopchuk1 wrote:
>>>> MISRA Rule 13.1: Initializer lists shall not contain persistent side
>>>> effects.
>>>> 
>>>> The violations occur because both the `GVA_INFO` and `TRACE_TIME` 
>>>> macro
>>>> expansions include expressions with persistent side effects 
>>>> introduced
>>>> via inline assembly.
>>>> 
>>>> In the case of `GVA_INFO`, the issue stems from the initializer list
>>>> containing a direct call to `current`, which evaluates to
>>>> `this_cpu(curr_vcpu)` and involves persistent side effects via the
>>>> `asm` statement. To resolve this, the side-effect-producing 
>>>> expression
>>>> is computed in a separate statement prior to the macro 
>>>> initialization:
>>>> 
>>>>     struct vcpu *current_vcpu = current;
>>>> 
>>>> The computed value is passed into the `GVA_INFO(current_vcpu)` 
>>>> macro,
>>>> ensuring that the initializer is clean and free of such side 
>>>> effects.
>>>> 
>>>> Similarly, the `TRACE_TIME` macro violates this rule when accessing
>>>> expressions like `current->vcpu_id` and 
>>>> `current->domain->domain_id`,
>>>> which also depend on `current` and inline assembly. To fix this, the
>>>> value of `current` is assigned to a temporary variable:
>>>> 
>>>>     struct vcpu *v = current;
>>>> 
>>>> This temporary variable is then used to access `domain_id` and 
>>>> `vcpu_id`.
>>>> This ensures that the arguments passed to the `TRACE_TIME` macro are
>>>> simple expressions free of persistent side effects.
>>>> 
>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>> The macro `current` specifically does not (and must not) have side
>>> effects.  It is expected to behave like a plain `struct vcpu 
>>> *current;`
>>> variable, and what Eclair is noticing is the thread-local machinery
>>> under this_cpu() (or in x86's case, get_current()).
>>> 
>>> In ARM's case, it's literally reading the hardware thread pointer
>>> register.  Can anything be done to tell Eclair that `this_cpu()`
>>> specifically does not have side effects?
>>> 
>>> The only reason that GVA_INFO() and TRACE_TIME() are picked out is
>>> because they both contain embedded structure initialisation, and this 
>>> is
>>> is actually an example where trying to comply with MISRA interferes 
>>> with
>>> what is otherwise a standard pattern in Xen.
>> Irrespective of what you say, some of the changes here were 
>> eliminating
>> multiple adjacent uses of current, which - iirc - often the compiler
>> can't fold via CSE.
> 
> Where we have mixed usage, sure.  (I'm sure I've got a branch somewhere
> trying to add some more pure/const around to try and help out here, but
> I can't find it, and don't recall it being a major improvement either.)
> 
> The real problem here is that there are a *very few* number of contexts
> where Eclair refuses to tolerate the use of `current` citing side
> effects, despite there being no side effects.
> 
> That is the thing that breaks the principle of least surprise, and we
> ought to fix it by making Eclair happy with `current` everywhere, 
> rather
> than force people to learn that 2 macros can't have a `current` in 
> their
> parameter list.
> 

I'll take a look. Likely yes, by adding a handful of properties. There 
are subtleties, though.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

