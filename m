Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7317654CB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 15:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571105.894144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP0ug-0000WK-Vx; Thu, 27 Jul 2023 13:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571105.894144; Thu, 27 Jul 2023 13:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP0ug-0000UC-TD; Thu, 27 Jul 2023 13:20:18 +0000
Received: by outflank-mailman (input) for mailman id 571105;
 Thu, 27 Jul 2023 13:20:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dT6+=DN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qP0uf-0000U6-8P
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 13:20:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52e0ef1a-2c80-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 15:20:15 +0200 (CEST)
Received: from [192.168.1.101] (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id 09C9D4EE073F;
 Thu, 27 Jul 2023 15:20:13 +0200 (CEST)
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
X-Inumbo-ID: 52e0ef1a-2c80-11ee-b248-6b7b168915f2
Message-ID: <211aa6d4-d219-e429-030c-8f8b2fba815a@bugseng.com>
Date: Thu, 27 Jul 2023 15:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 2/3] xen/arm: irq: address violations of MISRA C: 2012
 Rules 8.2 and 8.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1690217195.git.federico.serafini@bugseng.com>
 <a62e88a9c29cf7866c251968b5a5b6865aff4a2a.1690217195.git.federico.serafini@bugseng.com>
 <a81326f4-e018-b461-ebec-9ef2ff5dc4df@suse.com>
 <alpine.DEB.2.22.394.2307251226180.3118466@ubuntu-linux-20-04-desktop>
 <31b72cda-2ef0-2f3c-4e83-948d7b763f19@bugseng.com>
 <f479517d-10db-4723-65a2-38c85f72d96e@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <f479517d-10db-4723-65a2-38c85f72d96e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/07/23 13:27, Jan Beulich wrote:
> On 27.07.2023 13:02, Federico Serafini wrote:
>>
>> I have ready a patch for violations of rules 8.2 and 8.3 in
>> xen/include/xen/iommu.h.
>> I am talking about this, in this IRQ thread, because I think the
>> following two options also apply for an eventual v2 patch for the IRQ
>> module, until a decision about rule 8.2 and function pointers is taken:
>>
>> 1) Split patches and submit only the changes *not* involving function
>>      pointers.
>> 2) In the meantime that you make a decision,
>>      I submit patches thus addressing the existing violations.
>>
>> I personally prefer the second one, but please let me know what you
>> think.
> 
> It's not entirely clear to me what 2 means, as I wouldn't expect you
> intend to deal with "violations" which we may decide aren't any in
> out world.
> 
> Jan

In point 2) I would like to act as if the rule 8.2 had been approved 
without any deviation, I think this will lead to a smaller number of 
patches and a smaller amount of text attached to each modified function.
If you are concerned about inconsistency between the resulting commit
messages and your future decision then we can go for option 1).

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

