Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A98735203
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 12:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550983.860243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBC8M-0006g4-Cm; Mon, 19 Jun 2023 10:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550983.860243; Mon, 19 Jun 2023 10:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBC8M-0006eP-9u; Mon, 19 Jun 2023 10:29:18 +0000
Received: by outflank-mailman (input) for mailman id 550983;
 Mon, 19 Jun 2023 10:29:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBC8K-0006e9-Cd
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 10:29:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBC8F-0001eQ-JZ; Mon, 19 Jun 2023 10:29:11 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.19.123]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBC8F-0000JR-Ax; Mon, 19 Jun 2023 10:29:11 +0000
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
	bh=UUW1bGuTn6aw1zfnEJ3G99WgUqvU4b5mr12cMg90wF4=; b=Ub873q7PGnCqwAWejRBGcLt5LR
	j2v0847uZDpfgWfenOle2dmdXZHcSq0BfqsK0c+UtheORkEtJqMUs8wZCZPjqaz7H+j1oJjDx4nMs
	Xu7zP4ruU4+tM3AG2GUtnw4MqKdv8iEywl9WBMm5+2ByHQiIBFnZWaIHS5699HO3Xmh0=;
Message-ID: <f3ce8d2b-834c-1df5-2fc3-27b0738d6612@xen.org>
Date: Mon, 19 Jun 2023 11:29:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 1/3] xen/arch/arm: fix violations of MISRA C:2012
 Rule 3.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, xen-devel@lists.xenproject.org
References: <cover.1687167502.git.nicola.vetrini@bugseng.com>
 <e2b7f377d1467833d9ae2cd897c962561e54fb02.1687167502.git.nicola.vetrini@bugseng.com>
 <51501199-80e6-e33f-e70a-7a36d26c1894@xen.org>
 <e6cf2ec6-070d-1c8a-9273-478cf5587d9c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e6cf2ec6-070d-1c8a-9273-478cf5587d9c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/06/2023 11:25, Jan Beulich wrote:
> On 19.06.2023 12:01, Julien Grall wrote:
>> On 19/06/2023 10:56, Nicola Vetrini wrote:
>>> In the files `xen/arch/arm/include/asm/arm(32|64)/flushtlb.h' there are a
>>> few occurrences of nested '//' character sequences inside C-style comment
>>> blocks, which violate Rule 3.1. The patch aims to resolve those by removing
>>> the nested comments.
>>
>> As I wrote in
>> https://lore.kernel.org/xen-devel/f3fc1848-68ca-37a1-add2-e100b4773190@xen.org/,
>> I am against replacing '//' with nothing. I have proposed to use ';'
>> because this is also a valid way to comment in assembly.
> 
> Are you sure about this? For gas most targets use ; as a statement separator,
> not as a comment character. Afaics arm-* and aarch64-* are no exception there.

GAS will not accept it. But the Arm compiler will [1]. This is good 
enough for me because I want to have a separator between the instruction 
and the comment.

Cheers,

[1] 
https://developer.arm.com/documentation/dui0473/m/structure-of-assembly-language-modules/syntax-of-source-lines-in-assembly-language

-- 
Julien Grall

