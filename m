Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F5278B0CA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 14:43:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591510.923913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qabZ6-0006ma-Dg; Mon, 28 Aug 2023 12:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591510.923913; Mon, 28 Aug 2023 12:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qabZ6-0006kC-Az; Mon, 28 Aug 2023 12:41:56 +0000
Received: by outflank-mailman (input) for mailman id 591510;
 Mon, 28 Aug 2023 12:41:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qabZ5-0006k6-FN
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 12:41:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42da1cea-45a0-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 14:41:51 +0200 (CEST)
Received: from [192.168.1.9] (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 244D94EE0738;
 Mon, 28 Aug 2023 14:41:50 +0200 (CEST)
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
X-Inumbo-ID: 42da1cea-45a0-11ee-9b0c-b553b5be7939
Message-ID: <1aa50466-cad9-088d-a5d0-05396d866dbf@bugseng.com>
Date: Mon, 28 Aug 2023 14:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 00/13] xen: address violations of MISRA C:2012 Rule
 7.3
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <fd594b48-365e-0bee-aaa6-f413fc93267f@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <fd594b48-365e-0bee-aaa6-f413fc93267f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/08/23 10:15, Jan Beulich wrote:
> On 03.08.2023 12:22, Simone Ballarin wrote:
>> This series aims to address some violations ofMISRA C:2012 Rule 7.3:
>> "The lowercase character 'l' shall not be used in a literal suffix".
>>
>> This patch replaces "l" suffixes with "L", to comply with the rule.
>> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
>>
>> Gianluca Luparini (13):
>>    AMD/IOMMU: address violations of MISRA C:2012 Rule 7.3
>>    x86/svm: address violations of MISRA C:2012 Rule 7.3
>>    xen/arm: address violations of MISRA C:2012 Rule 7.3
>>    x86/IOMMU: address violations of MISRA C:2012 Rule 7.3
>>    xen/ioreq: address violations of MISRA C:2012 Rule 7.3
>>    xen/mem_access: address violations of MISRA C:2012 Rule 7.3
>>    xen/vpci: address violations of MISRA C:2012 Rule 7.3
>>    xen/hvm: address violations of MISRA C:2012 Rule 7.3
>>    x86/mm: address violations of MISRA C:2012 Rule 7.3
>>    x86/viridian: address violations of MISRA C:2012 Rule 7.3
>>    xen/x86: address violations of MISRA C:2012 Rule 7.3
>>    xen/common: address violations of MISRA C:2012 Rule 7.3
>>    xen: address violations of MISRA C:2012 Rule 7.3
> 
> Since about half the patches are still pending due to missing acks,
> just to mention it: It's normally the submitter who is to chase them.
> 
> Jan
> 

This is the list of the pending patches:
- 10/13 x86/viridian: address violations of MISRA C:2012 Rule 7.3
- 08/13 xen/hvm: address violations of MISRA C:2012 Rule 7.3
- 05/13 xen/ioreq: address violations of MISRA C:2012 Rule 7.3

The maintainer for that files are Paul Durrant and Wei Liu.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


