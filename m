Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88355ACDB82
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 11:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005315.1384814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMkt6-0008QJ-H8; Wed, 04 Jun 2025 09:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005315.1384814; Wed, 04 Jun 2025 09:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMkt6-0008O4-EK; Wed, 04 Jun 2025 09:58:24 +0000
Received: by outflank-mailman (input) for mailman id 1005315;
 Wed, 04 Jun 2025 09:58:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nSCj=YT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uMkt5-0008Ny-2X
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 09:58:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 722e3f82-412a-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 11:58:21 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 3C1C24EE7C3E;
 Wed,  4 Jun 2025 11:58:20 +0200 (CEST)
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
X-Inumbo-ID: 722e3f82-412a-11f0-a300-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1749031100;
	b=0h5m+whCgad6zUSdf+EGt3dF1C3l0YfGYLA2b2q6s9kAJtcPmp6Myfk56rHO3yeP4pVa
	 n4XG+1hv5Uuk4cNCZJwocvplIARjZuQV8rR9zual4koYT1OkFRTYeAYpSIwXz34FThnel
	 FBpKxf5qiZ23+t4a7Jy5bARKpRbLr+yXIzs9dYYdPzUMEJIYmq1FvkwosQUbJ/I1180ZT
	 JensKnroUXmP3AW6Tp3FbD7vz6mYDgiPCQvcwK6Zrs/AA8mZ8oQCC2yUCU3h/YSfffw5+
	 PTEnFYRc640OwSjYTBCotv2KsGT8A33FMvayW9Pu+0NQDBuKY0WiomK5vpj9SXL8OXDLx
	 8vFLIe+hGUzRCKpxdkjlPauIJFgsfyyLCPYnPeGi8ZN8DaVHyROygduVAdmJn0Mt3kGFJ
	 ebZPhEWBuJMCuQsO6VAMf16L1xjuyU0vm+Zcc+Z2Fs3ehQ3U10RjR039JJkvVUl/tYIn1
	 aKrSfCMBIGq1cABrN4ihiALgoxMgQ3NXPzBLe4vnKHGsx63eAUYh5P4yMhAXJKcnNAEfS
	 YWVhc8Z0XWeHdphavFLoSfjwkmdEDyHwj8DCiGtekd5vCYbvp483paNUEqCe7cLrz7/66
	 MD2FpOn6qkyt8TgvoxMCuBudDzSFI8m3SHpCdpi0SmWSJPtRu+7nt5RvGNpgOSM=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1749031100;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=vG5hMSRJvNT1puUMge3SKwnwpuribeb27xPAyDjR0Zk=;
	b=hMPOr+6lneJou6xhLDOD/9iBlBs2shFO6wUjSg9fB8v51VGb9TeP2YPsnFsxPagAP1xm
	 wyI5efABjdLfORwrtNq3wRCya4wHa3FLYrA0RVqVai/5gN7BCs72iWLaRYWb8kBLApOrQ
	 vX4K0wX8/5zmRuIXCwtdlSlVhz/HioKcW/wBXc2ai7LAMi7B5V+DpeE1EeKh9mzLdqQh1
	 5qkG2qj5jAEWNGfFLTfCIWFAIyuJm34CN0jXcmXVk5h3mbtGoM9HqcHxncsoH6gj+dJXX
	 nglVG57asbZ3JcCO2Tgb5yjQNf6COmnYiQ3wK93JADAcdaCoPyNhWy2s1v1Jdb1Ie6bMR
	 SBYdpecebIwjV5MIHsc9uFSmcokh8iXCwcoiGR0JUk9P+mtqsD6Eb4C0Vqnu9eE27Ag87
	 tKUmiXJLcHsTXTlQtih9U8NKBOc59ZawwAOJuO8kkgodjmZCM9/unJY18kRr13z3euXRl
	 AMXZ4UtqkNEH6U1PjkDJuzYY4ocvOwghBt6SIV82dOZIiICMs4GwOjHpJAT3fFAbBDUGY
	 wVCtDazFlyPzrHc0Mpqqnn72AkZl3DQZwiV6N4FEP4fluDTM+A3vjE2gu+FBjCAPmiws6
	 LCCbfcH2yB6rEwHaNrq8rKBiUg9WdGBV2UBWm91DFiNj4JrH2EgdV3nONzn/5kk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1749031100; bh=lC7U2eX4blnbA7jZiKjj2/myvrfqSXkLqBhAk6Vethw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pT3VXb6ifH2JkQsZdXtnKaCzL6XF+tTkx0hAb6fVP1j4xeqGetWULLQmXYmbnTJpd
	 8zvsB5kbbMcSp8u6krOgihiCXhPE7ios5xnM8cLBJf9ao1kAU4N1NnFP0qgLXvf/sy
	 m1DZxbSt8HAI/kQFdiR9ojqvLAz5RZBpV/Ylf1pJkX96xuKIF9iZ1snBYOpTVz/Xpt
	 nLwChtPfkEiOjAU3imW4mVfCbZomulJ8b0/uNjfvdx5PfxA3udTVB2aSTDfXN3uWjU
	 RK236IqzHmRqrvDgh76682IBPQXoGIGt3+3x1Y6aLGu4Bx0+8fYuwTUzstJ0YgyNKw
	 qSjma78NRlW2w==
MIME-Version: 1.0
Date: Wed, 04 Jun 2025 11:58:20 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV: make mmio_ro_emulated_write() static
In-Reply-To: <aEARj_GYTZrPrXl_@macbook.local>
References: <5dadf381-0f97-4362-93ed-aa5b01d73d88@suse.com>
 <aEARj_GYTZrPrXl_@macbook.local>
Message-ID: <a1a31f4bc252bd8509e7ad9962adfa0f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-06-04 11:27, Roger Pau Monné wrote:
> On Wed, Jun 04, 2025 at 11:22:00AM +0200, Jan Beulich wrote:
>> It being non-static and it not having a declaration (anymore) violates
>> one or more Misra rules, iirc.
>> 
>> Fixes: ff3e5dfa7c2d ("x86/mm: move mmio_ro_emulated_write() to PV only 
>> file")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> We are not checking for those rules in Eclair I think?  Otherwise this
> won't have passed the CI testing.  Or maybe we are just checking
> builds with !CONFIG_PV?
> 
> Thanks, Roger.

That seems to be the case on x86. On Arm64 there is no override for 
CONFIG_PV [1], but perhaps that is unset by default? I'm not opposed to 
having more variants under analysis, but that is not something I can 
decide on individually.

Thanks,
  Nicola

[1] 
https://gitlab.com/xen-project/hardware/xen/-/blob/staging/automation/gitlab-ci/analyze.yaml?ref_type=heads

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

