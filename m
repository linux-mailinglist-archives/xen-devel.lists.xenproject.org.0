Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B63B18FBD
	for <lists+xen-devel@lfdr.de>; Sat,  2 Aug 2025 21:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068072.1432269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiHcT-00056u-6u; Sat, 02 Aug 2025 19:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068072.1432269; Sat, 02 Aug 2025 19:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiHcT-00054S-3X; Sat, 02 Aug 2025 19:10:13 +0000
Received: by outflank-mailman (input) for mailman id 1068072;
 Sat, 02 Aug 2025 19:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EIgm=2O=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uiHcR-00048f-EI
 for xen-devel@lists.xenproject.org; Sat, 02 Aug 2025 19:10:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eb3e514-6fd4-11f0-b897-0df219b8e170;
 Sat, 02 Aug 2025 21:10:09 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 3E2074EE0748;
 Sat,  2 Aug 2025 21:10:08 +0200 (CEST)
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
X-Inumbo-ID: 4eb3e514-6fd4-11f0-b897-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754161808;
	b=Hhxpm0HI6MojEjSGhmHl4qa6Q0BaiE2g0pVYP2GlNPJpdZv7svCoA1g6qAlfWmA3k5Hy
	 I+SxEsEHvhBoSltFsSyZJjWAHMkBniUT7rAj4XCmnCEv822iEA4/2K8E5BKNrxTSQYB64
	 y/nefQMMvJbhll3U1x80KcqoJxPBpBqLRYDX+ucxvewu2SBTrWmqcURBzD+n/zBw/l3xk
	 W77Dk1Cp22mLGHr9A+jk2pXzqc6YcHZelZlKRQIBxtWocaK2wSf1HNuKHw7/t4QeSaq1q
	 4A1xkAADUckIDZQcCNOnAtZrvMEXasBM2EgVdMPJqPIhrR1KGDRHufFaTk2n/BNzCre4b
	 qdqyzBXj0Q/cVI2lJacE2mCquv4qFJpcKC/esQXcemCmuIvK3PI5rVEgBaLQc65DZzCPj
	 PqPurCkhqpZDJMqaTH1RQMdRd0HXqQ9/d4W0OvmXJDVytBgATelgBAr+kQhA5sZxDT6Zi
	 izkZ+fSpoaNONcyL4YoTFEYOa/jCtsZ+lF+VfRsIDtGrhCNylo3+jvl+5q12jvuDWvvsF
	 J7B3lsSDHnI9D4kleFsnPZBRajhPIh2MyFAHd78WUbavkyUCG4HZtX7sS4fB88a+I41F8
	 PoyHNUN3YHpe1S3U+0Xd7DXmIdYeqfL9AuZA0p+qfNZmWmNxGoEsbp763f7MsFs=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754161808;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=88nOKc8o+VBGXlOwxgIr1tnB5w2iH0oea7Ab0M9yOQQ=;
	b=eyh43HmnW7YzQVbyiEIcTB6dYu0zn/K8E/nZiTcnyt9I3c3+P45bvZh2Dd+ZpqbEmHoF
	 h6vIsQd9mrZCaGyh+J5nNUC4jobPanJRoXfurwTEIycNyWPxjdzg34OHDr4cnt75p6zfq
	 SsL7K+SeVsKssBSD0jVCY/jU0ssnnI2CLDSCuqAVM9g7TY9iVX31/Dat/4EA9smDdLBnd
	 EsUUtEE07kENPkiE4mFZNLb6ousI59MFmIr9swNmysxrH9JaDQOORO4qFHN7MjQluSDj1
	 Rk2ED+lIfpZn+9pu23s2a2CGXWImmbBNe2PLPHMTDY6A8IF0No9/lftmGjqE0Nt2Lc+YR
	 EONYWsOGd3mg3Kn6A/veci5Uc7vPC84fJzasaiPaDnTFtDBBKwVi/h4cvlRTW6b0ewm98
	 JEUbjC9cqd2L0RJvqRUeoXRGRGEydF1wc0le58SSKP/PsgMdmarp1NvSgUgO4B1mQdkB9
	 eWkOS8KAoYxJE668BEh2UjLkLhDh6tPALokwcAkn22PWGFH5/yPw+yNRZ4USPyDVmyfkk
	 mHyPw7MSVh5FS6abpkVztSBGFfZMNkjsd4Nf9Wtv9vqFlOwVrd8F68BhKi7M9RQcsOLM3
	 99ARvErLp37jM+B1phWYNR1GgZRjnAATfckzgZRsGUV2cAVj4erv0noOr7l1BX4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754161808; bh=3zW3+kMHj8v/g7CQloeTL/9yWVXx4YDrLTSLqD+dl5E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PkmQoVw1o9gkfry9jvShK8+OjfPMWGbUhjSJiL2N4qgSW5MYOZMiu6fBlFWe41Wsg
	 D0r2IMTMI5lWpciiHnecEGycUM81ge50nG1DLDcWz2uXSystofF8KDToTXyI+1aVR6
	 MwMAud+wft6kaECtOTynchowWr72YUfLupUgWgsSf3+IYy+f8JF3JgeF65GCAUi7x7
	 yEdCJ6XWFEYUT+ItKlMNcRbIfdYPzzhfqWuDVneRuk6Zuqk3tx/9vXgE/dKSOk0d9u
	 J65Wt7veR7Nr1DUNKhqOS9CNhbnlLPzFyClPHxWYgKoIuAFPuwHJcNQfK4So1V7Rvm
	 zSDxsFdy22/EQ==
MIME-Version: 1.0
Date: Sat, 02 Aug 2025 21:10:08 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [RFC] Next steps for MISRA C Rule 17.7 in XEN
In-Reply-To: <6d622813-1617-4af3-876e-52a551518f68@epam.com>
References: <6d622813-1617-4af3-876e-52a551518f68@epam.com>
Message-ID: <42f485a1e32536f3d905c9564b6fdebb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-02 19:48, Dmytro Prokopchuk1 wrote:
> Hello folks!
> 
> There are a lot of MISRA C R17.7 violations in the XEN.
> This rule states: "The value returned by a function having non-void
> return type shall be used".
> 
> Actually, need to decide how to deal with these violations.
> Quick analyze shown that there are different cases in XEN code base.
> Like, for example:
> 
> the return value of function 
> `clean_and_invalidate_dcache_va_range(const
> void*, unsigned long)' (unit `xen/arch/arm/alternative.c' with target
> `xen/arch/arm/alternative.o') is unexpectedly ignored
> 

This thread [1] has some discussions around the cache invalidation 
helpers, so it may be useful to consider the points raised there in this 
discussion

[1] 
https://lore.kernel.org/xen-devel/cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com/

> The return value of this function 
> 'clean_and_invalidate_dcache_va_range'
> is checked only in one place. Probably, after deeper analyze the return
> value can be dropped and function prototype can be changed to
> 
> static inline void clean_and_invalidate_dcache_va_range
>      (const void *p, unsigned long size);
> 
> 
> Next case is vice versa:
> 
> the return value of function `vgic_reserve_virq(struct domain*,
> unsigned)' is unexpectedly ignored
> 
> There is only one place where the return value is not checked.
> Probably, in this place code may be changed to:
> 
>      (void)vgic_reserve_virq(d, irq);
> 
> 
> For the case with 'memset' function:
> 
> the return value of function `memset(void*, int, size_t)' is
> unexpectedly ignored
> 
> I guess it's better to create deviation, something like:
> 
> "The return value of the function memset(void *, int, size_t) is 
> ignored
> because the primary purpose of the function is to set a block of memory
> to a specific value, not to use the pointer returned by the function."
> 
> 
> But due to the large number of violations, it will be tricky to address
> all of them.
> I don't know, maybe the only right solution is to deviate all.
> 
> 
> Thanks!
> Dmytro.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

