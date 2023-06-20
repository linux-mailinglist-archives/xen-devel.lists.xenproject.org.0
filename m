Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9B736DFF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 15:56:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551887.861646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBbqD-0002qu-AU; Tue, 20 Jun 2023 13:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551887.861646; Tue, 20 Jun 2023 13:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBbqD-0002oW-7j; Tue, 20 Jun 2023 13:56:17 +0000
Received: by outflank-mailman (input) for mailman id 551887;
 Tue, 20 Jun 2023 13:56:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8C9p=CI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qBbqB-0002oQ-Q6
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 13:56:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38156054-0f72-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 15:56:14 +0200 (CEST)
Received: from [192.168.1.198] (unknown [151.35.196.239])
 by support.bugseng.com (Postfix) with ESMTPSA id 32FA64EE0737;
 Tue, 20 Jun 2023 15:56:12 +0200 (CEST)
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
X-Inumbo-ID: 38156054-0f72-11ee-b234-6b7b168915f2
Message-ID: <92bc3c0d-787b-6f11-ecb1-36cab6b80911@bugseng.com>
Date: Tue, 20 Jun 2023 15:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH v2 1/3] xen/arch/arm: fix violations of MISRA C:2012
 Rule 3.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1687167502.git.nicola.vetrini@bugseng.com>
 <e2b7f377d1467833d9ae2cd897c962561e54fb02.1687167502.git.nicola.vetrini@bugseng.com>
 <51501199-80e6-e33f-e70a-7a36d26c1894@xen.org>
 <e6cf2ec6-070d-1c8a-9273-478cf5587d9c@suse.com>
 <f3ce8d2b-834c-1df5-2fc3-27b0738d6612@xen.org>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <f3ce8d2b-834c-1df5-2fc3-27b0738d6612@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/06/23 12:29, Julien Grall wrote:
> Hi,
> 
> On 19/06/2023 11:25, Jan Beulich wrote:
>> On 19.06.2023 12:01, Julien Grall wrote:
>>> On 19/06/2023 10:56, Nicola Vetrini wrote:
>>>> In the files `xen/arch/arm/include/asm/arm(32|64)/flushtlb.h' there 
>>>> are a
>>>> few occurrences of nested '//' character sequences inside C-style 
>>>> comment
>>>> blocks, which violate Rule 3.1. The patch aims to resolve those by 
>>>> removing
>>>> the nested comments.
>>>
>>> As I wrote in
>>> https://lore.kernel.org/xen-devel/f3fc1848-68ca-37a1-add2-e100b4773190@xen.org/,
>>> I am against replacing '//' with nothing. I have proposed to use ';'
>>> because this is also a valid way to comment in assembly.
>>
>> Are you sure about this? For gas most targets use ; as a statement 
>> separator,
>> not as a comment character. Afaics arm-* and aarch64-* are no 
>> exception there.
> 
> GAS will not accept it. But the Arm compiler will [1]. This is good 
> enough for me because I want to have a separator between the instruction 
> and the comment.
> 
> Cheers,
> 
> [1] 
> https://developer.arm.com/documentation/dui0473/m/structure-of-assembly-language-modules/syntax-of-source-lines-in-assembly-language
> 

If no one has any objection about this I'll add the ';' comment delimiter.

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

