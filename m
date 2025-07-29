Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0296B14CC6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 13:11:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062495.1428208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiFC-0008Uf-3P; Tue, 29 Jul 2025 11:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062495.1428208; Tue, 29 Jul 2025 11:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiFC-0008T7-0R; Tue, 29 Jul 2025 11:11:42 +0000
Received: by outflank-mailman (input) for mailman id 1062495;
 Tue, 29 Jul 2025 11:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AlSl=2K=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ugi7H-0002qP-Kp
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 11:03:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8ebcfe4-6c6b-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 13:03:30 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D760D4EE3C07;
 Tue, 29 Jul 2025 13:03:28 +0200 (CEST)
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
X-Inumbo-ID: a8ebcfe4-6c6b-11f0-b895-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753787009;
	b=RrJL9NuT2NPtPqU3kotySFpAdi7pVbw1WwiK/CkwEieHirrqZ//nmRJrTIFZL1NhSyEm
	 qsqxPpzluVDq6wXRnAbQ96u00U+x7qwGABEwtFLWMdxFQq1B4XVEg+9HaSuYOBOgYrcwT
	 j54PS6bGdMzNg6J2EmHOtBxUkm58jpWLmkV8hdL7BXyTfnGgcPlsADxE8q2rGT2i5xGCe
	 rtEtmRGQ3b5Rfs+pqISaIqE2IATmo0fxce93MgNSieAWeHDQKuWR+t739rkJItAzUEjVO
	 Qt4CU1bFqyUMEEMHOs9U9Yjk+0kgFtMHPaDrXXTf8pPqdLwKL53FZySPsKGqWrw/lZ9H0
	 8q5eLXLTZJpR4zwTGDQW5KNqw5HbrRM9E2BpLKycOEe+8n6II1lVa5j9ziUO2Q4LxJzIf
	 Qw1LuMuY6GHZop82eHpFwQHVpZ4YDW33NEh5KpAmA7H2wlm9QWpEKo4Ry+0T4yQlLClOJ
	 WGqIWGFeV/5th0TBzVuB4x7MnNqeyN7KCH9ir+/VMaAtyUQvZ5qT9xZd7JVv48D0pOL3p
	 Kc82Ioma1QFUFHHHuciAlRD5VTlo+/2h4lbqvuPNK+8z+r8BatjTXpIvRU3HXjQKHFlqT
	 gPs/0t9KUDYRB50eA3PdcwozqBBG9FxsWuSvrEeVq/y3zdW8HTm28MtXusD6E1k=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753787009;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=CH3bbWy2R9ZAzZjDVTUUaA2Mv3rrlPVf8rn0MNUUQSc=;
	b=JfqUHtbthcN+ruGYMemamUCl7zqz08BwhUe7UyP+76/z3WdMt/9uHq1u6NqRhP+6/FDq
	 QNdGy4v9yMc4g+K5UQ0sXgNzyyD6aezHzsZKLO+vmhBXjspCNyF22+8IxAP5QaRPvn8d8
	 xV1wQTxt/PNFu4pw6R0vYh2hy7QdwvV411JmreIcG9pFW/y5Zw8XDnGVjAEObPVGvSpT1
	 c4McmkRnnVyJrKWZwHtgRw9lU1NatjGsiZRvrTACJ/jZG83/nFOZqUDmKppKTSLh3mPLI
	 kFLspGLrqRWZpJz8O0LbWdGNjWPSqxOkl8PMa8Ff+wwTpzWDyrO89zDQ6PwbHjku9wtws
	 bFOPzFeVW+jC76Lxx5Ief7fi0igNpFd8vN7Zv5eBnXbx7VfUxm8C3BYvfVSzITnCXfwMA
	 czVQIc/NuxqRYtszZkyqV05sBLp8SBo1qFIkcXdqqjieWdsZnbb0mwKdjYGWk0HWppWvG
	 DjSq8v0OPU//vBlqoeTIrtUTzKNpOT9BntxmhEDnQL0noFx9y8j+URYhmct2GmGhILxCJ
	 ZlELdNJMjF9kUlm7wKyEWbParwAhQ4lv5obtErhK2Inf+UsgcBEjGoTrHoGgT6DdeVsLB
	 6ceOMejlQwaxnAgH+vL/2DkuEVmiAd1e5yv4rxJtWBt2VsIIjesY1d8LIQvem9o=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753787009; bh=cVHk0AFFkx+s0a811u625hkYHhZecaRMPuuLSJzEVJE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jXBukPJZGs9ysaFRUn+vRw0nVw/X/TrjgD2TCMZVVwgMXboc0kjrXjcGsc9j64GXs
	 FIOh2BC8HGbLGZMDZKEFV87fuulKb4WNjDhl5F+BtE0cS/72ivYDlTdGfXDId+yyCp
	 XhK+2MDUTMriqGN8oJz/ksClTExZ64Ss4GF6pIhhMNYTGjIxacGZnNS46kTFtIMM3i
	 tgHJp1BYXqd2aSa5nndvHhISleZF3SeJ4bLxFhDvIYiqEyeTBsk3JpbJrqNWbyG0Vp
	 YEsdb6u6e4t6bqH02v486MGNu5Tf+bpr2bBBgGEEr589ZSp6IWtZfGO9fHi8DM9ZAx
	 DPcvjxBSDeKCg==
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 13:03:28 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Subject: Re: [PATCH] misra: deviate explicit cast for Rule 11.1
In-Reply-To: <4708ddca-2079-491d-9b1a-031ab66988b1@suse.com>
References: <181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro_prokopchuk1@epam.com>
 <093601d7-691a-48ee-a0f4-2e86a0f2015e@suse.com>
 <43bea8dd-fbd3-4a64-ad9c-aac5813c15a9@citrix.com>
 <f1fa4da171fd7b6dbfed06cff3d4771b@bugseng.com>
 <a5781ddf-d353-470b-a072-1e0b4e6931dd@epam.com>
 <efcda932-633b-4140-b869-e22d552b3aea@epam.com>
 <aa6c034443b495fdf13eaf88487a94b1@bugseng.com>
 <4708ddca-2079-491d-9b1a-031ab66988b1@suse.com>
Message-ID: <27339ca431805871d8adf2f9659e2057@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-29 09:26, Jan Beulich wrote:
> On 28.07.2025 21:17, Nicola Vetrini wrote:
>> On 2025-07-28 20:58, Dmytro Prokopchuk1 wrote:
>>> It works.
>>> The violation "non-compliant cast: implicit cast from 
>>> `void(*)(void*)'
>>> to `void(*)(void*)'" is gone.
>>> 
>> 
>> Great. Now what would be really useful is a way to abstract this more
>> nicely (I was able to write this only by looking at the AST). However
>> noreturn is probably about the only attribute that has a repercussion 
>> on
>> the decl and is safe to cast away, unless I'm mistaken.
> 
> Not sure what you mean by "repercussion" here, and hence my remark may 
> be
> entirely meaningless, but: const and pure are also examples of
> attributes which are safe to cast away, aiui. In fact, given the sheer
> number of attributes, I would be surprised if there weren't more.
> 

Not all attributes influence compatibility of declarations. noreturn is 
a bit special in the sense that gcc and clang don't quite agree on the 
semantics of its various forms, where we follow clang's perspective. See 
https://github.com/llvm/llvm-project/issues/113511 for instance, in 
particular

> So I think the only way in which Clang's behavior is diverging from 
> GCC's here is that we don't support an implicit conversion between 
> pointer-to-function and pointer-to-noreturn function. This should 
> presumably behave somewhat like the implicit conversion between pointer 
> to-function and pointer-to-noexcept-function except that it can 
> apparently be performed implicitly in either direction.

But in any case my remark was more about the future than current plans, 
so there should be no bug here.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

