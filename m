Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185E774748E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558464.872586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhPo-0003Ol-K5; Tue, 04 Jul 2023 14:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558464.872586; Tue, 04 Jul 2023 14:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhPo-0003MJ-HO; Tue, 04 Jul 2023 14:54:04 +0000
Received: by outflank-mailman (input) for mailman id 558464;
 Tue, 04 Jul 2023 14:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbHz=CW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qGhPn-0003AZ-NQ
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:54:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cc564cb-1a7a-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 16:54:01 +0200 (CEST)
Received: from [192.168.1.198] (unknown [151.37.153.202])
 by support.bugseng.com (Postfix) with ESMTPSA id 678D24EE0739;
 Tue,  4 Jul 2023 16:53:58 +0200 (CEST)
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
X-Inumbo-ID: 9cc564cb-1a7a-11ee-8611-37d641c3527e
Message-ID: <d73da8f3-2a76-7c4d-dc7e-82a86bfec3ea@bugseng.com>
Date: Tue, 4 Jul 2023 16:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH v6] xen/include: avoid using a compiler extension for
 BUILD_BUG_ON_ZERO
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <0b0d9a5614daac653b3bfbcfaa29a9b4c11286bb.1687793572.git.nicola.vetrini@bugseng.com>
 <df8a0c82-5f07-6a9b-e24d-7550387fca27@suse.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <df8a0c82-5f07-6a9b-e24d-7550387fca27@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/07/23 16:24, Jan Beulich wrote:
> On 26.06.2023 17:37, Nicola Vetrini wrote:
>> Redefine BUILD_BUG_ON_ZERO to avoid using a compiler extension
>> that gives an acceptable semantics to C99 undefined behavior 58
>> ("A structure or union is defined as containing no named members
>> (6.7.2.1)").
>>
>> The first definition includes an additional named field of type
>> char.
>>
>> The chosen ill-formed construct for the second definition is a struct
>> with a named bitfield of width 0 when the condition is true,
>> which prevents the UB without using the compiler extension while keeping
>> the semantic of the construct.
>>
>> The choice of the bitwise AND operation to bring the result to 0
>> when cond is false boils down to possibly better portability.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> The code change looks okay to me now, but I'd like to double check
> towards the testing you did with this change: While it is clear that
> you will have checked that the tree builds with the adjustments, I
> expect that would have been with a compiler supporting _Static_assert.
> Did you also check with an older compiler, using the alternative
> implementation? Plus did you also check both constructs for actually
> triggering when the supplied condition turns out to be true?
> 
> Jan
> 

Besides using the build pipelines in gitlab, I checked just the macro on 
Compiler Explorer using gcc 4.4.7 and clang 16 
(https://godbolt.org/z/1d6vznxcW) and the construct is behaving as expected.

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

