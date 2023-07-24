Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A875ED7F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 10:27:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568479.887806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqu0-0000Li-PO; Mon, 24 Jul 2023 08:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568479.887806; Mon, 24 Jul 2023 08:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqu0-0000Jw-Lj; Mon, 24 Jul 2023 08:26:48 +0000
Received: by outflank-mailman (input) for mailman id 568479;
 Mon, 24 Jul 2023 08:26:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOzI=DK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qNqtz-0000Jl-9T
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 08:26:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2d2a9c0-29fb-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 10:26:44 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.162.132.135])
 by support.bugseng.com (Postfix) with ESMTPSA id D073A4EE0737;
 Mon, 24 Jul 2023 10:26:43 +0200 (CEST)
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
X-Inumbo-ID: d2d2a9c0-29fb-11ee-8612-37d641c3527e
Message-ID: <5d0392e4-92f3-c660-7c34-e86a070e45e7@bugseng.com>
Date: Mon, 24 Jul 2023 10:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] efi: mechanical renaming to address MISRA C:2012 Rule
 5.3
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <4da442b03ba783b4db0e56614bed43ce882a32ae.1689953085.git.nicola.vetrini@bugseng.com>
 <00ee1297-f5d5-b51b-0039-4ae10668b0e3@suse.com>
Content-Language: en-US
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <00ee1297-f5d5-b51b-0039-4ae10668b0e3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/23 10:07, Jan Beulich wrote:
> On 21.07.2023 17:26, Nicola Vetrini wrote:
>> Rule 5.3 has the following headline:
>> "An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope"
>>
>> The function parameters renamed in this patch are hiding a variable defined
>> in an enclosing scope or a function identifier.
> 
> I think this sentence should be limited to the part which actually applies.
> 

Yes, I'll fix this.

>> The following rename is made:
>> - s/cfg/config/
>> to distinguish from the variable 'cfg', which is hidden by the parameter inside
>> the modified functions.
> 
> Hmm. I have to admit that I don't like this. The two functions in question
> always have "&cfg" passed to them. So using the same name is, well, kind of
> intentional. If we really need to change the code, I guess we may want to
> consider dropping the parameter and always-same arguments (albeit the
> choice to have this parameter was also intentional).
> 
> Another route would be to truly generalize the parameters by naming them
> "file", like other functions have it.
> 

Temporarily the second option seems the best, since further refactorings 
can be discussed properly later. I chose 'config' because it seemed to 
carry the same information as in the original source, but I'm open to 
other names such as "file" (though I'll test this before submitting a v2 
to avoid unintentionally adding violations).

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

