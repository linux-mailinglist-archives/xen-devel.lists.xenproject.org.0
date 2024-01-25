Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CD283CAF7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 19:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671723.1045223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4SZ-0001oA-0U; Thu, 25 Jan 2024 18:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671723.1045223; Thu, 25 Jan 2024 18:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4SY-0001li-UB; Thu, 25 Jan 2024 18:28:18 +0000
Received: by outflank-mailman (input) for mailman id 671723;
 Thu, 25 Jan 2024 18:28:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rT4SX-0001lc-4r
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 18:28:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4SV-0002AW-Uo; Thu, 25 Jan 2024 18:28:15 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.5.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4SV-0007Vo-NP; Thu, 25 Jan 2024 18:28:15 +0000
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
	bh=dLatqXr+T4H8QRyAXhC2bYtpdxKpdsdYE4FNCs38yNk=; b=U34RWfoYPaQw1hw8SMwb6ZNVaF
	gVHuxESCsxVCEY/B7QYvWRcoasyqWw/4mEmiPDjBbCkti5/fB4QCnTVgB2xp5OoWm5ZToYlRJQaHq
	JXOyBNhEEcSgC6EM1G+VPNvteDcopkET5aBsyO+HLW/e/01ZJl2107KXIDkiacgeHWSw=;
Message-ID: <2e788726-2216-48f2-ad9b-b4dca963bdd9@xen.org>
Date: Thu, 25 Jan 2024 18:28:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] xen/arm: add Xen cache colors command line
 parameter
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org, Luca Miccio <lucmiccio@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-13-carlo.nonato@minervasys.tech>
 <7e69b9de-8156-4944-87be-207ad79f2df9@xen.org>
 <alpine.DEB.2.22.394.2401051449260.3675@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2401051449260.3675@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 05/01/2024 23:09, Stefano Stabellini wrote:
> On Fri, 5 Jan 2024, Julien Grall wrote:
>> Hi,
>>
>> On 02/01/2024 09:51, Carlo Nonato wrote:
>>> From: Luca Miccio <lucmiccio@gmail.com>
>>>
>>> This commit adds a new command line parameter to configure Xen cache colors.
>>> These colors can be dumped with the cache coloring info debug-key.
>>>
>>> By default, Xen uses the first color.
>>> Benchmarking the VM interrupt response time provides an estimation of
>>> LLC usage by Xen's most latency-critical runtime task. Results on Arm
>>> Cortex-A53 on Xilinx Zynq UltraScale+ XCZU9EG show that one color, which
>>> reserves 64 KiB of L2, is enough to attain best responsiveness.
>>
>> Would you be able to share some numbers? This is quite helpful if in the
>> future we need to revise the default.
> 
> Here are the numbers for Xen 1 color vs Xen 2 colors.
> 
> We are measuring IRQ lantecy using a baremetal app (a unikernel) that
> has 0.5 us latency on native without interference.
> 
> Running the same application on Xen with 3 interference agents (3 other
> VMs that keep thrashing the cache):
> 
> - Xen 1 color latency:  3.1 us
> - Xen 2 color2 latency: 3.1 us

Thanks for sharing the numbers. Would it be possible to include them in 
the commit message?

Cheers,

-- 
Julien Grall

