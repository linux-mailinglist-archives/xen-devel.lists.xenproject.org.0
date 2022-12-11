Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1D649545
	for <lists+xen-devel@lfdr.de>; Sun, 11 Dec 2022 18:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458945.716631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4Q1B-0000yD-Ps; Sun, 11 Dec 2022 17:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458945.716631; Sun, 11 Dec 2022 17:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4Q1B-0000w3-N9; Sun, 11 Dec 2022 17:21:37 +0000
Received: by outflank-mailman (input) for mailman id 458945;
 Sun, 11 Dec 2022 17:21:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4Q1A-0000vx-0N
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 17:21:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4Q19-0007hY-49; Sun, 11 Dec 2022 17:21:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4Q18-0006lh-Tx; Sun, 11 Dec 2022 17:21:35 +0000
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
	bh=H/iUM+dHj9pfWizdpbgipRHoRh3+HyQTjC/wlsfE548=; b=VdCdUamnRbCa3z5iFnG++kXvrl
	BELeC7QHHcGzGZRBe74Aefr2aRCNGU3xOkRBFtGVaK8jOxmLojM/nfecA5E55DDHgzBlyJHxYK0Qt
	m2XwjPkCyau/g4GrS50DMtxLTWuRaucSZameObVMcNeM8rvZ9a0nQ60E75W4GPs6cXLw=;
Message-ID: <3f20770a-229b-9195-40f4-3210b8940095@xen.org>
Date: Sun, 11 Dec 2022 17:21:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20201223163442.8840-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 23/12/2020 16:34, Andrew Cooper wrote:
> This was not the christmas hacking project that I was planning to do, but it
> has had some exciting results.
> 
> After some discussion on an earlier thread, Tamas has successfully got fuzzing
> of Xen working via kfx, and this series is a prototype for providing better
> testing infrastructure.
> 
> And to prove a point, this series has already found a memory leak in ARM's
> dom0less smoke test.

You mention this series recently on the ML. So I decided to give a try 
and manage to reproduce your "memory leak".

I put it in quote because the problem is not Arm and instead your code. 
If you look at the implementation of _dzalloc() you are using 
_xmalloc(). So the memory is not guaranteed to be zeroed after been 
allocation.

This is breaking the expectation of the callers. What you want is using 
"_xzalloc()'.

Cheers,

-- 
Julien Grall

