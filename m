Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EA730B9DE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 09:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80403.147096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6r39-0000Wp-BN; Tue, 02 Feb 2021 08:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80403.147096; Tue, 02 Feb 2021 08:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6r39-0000WQ-89; Tue, 02 Feb 2021 08:28:39 +0000
Received: by outflank-mailman (input) for mailman id 80403;
 Tue, 02 Feb 2021 08:28:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6r37-0000WL-Na
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 08:28:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7997f814-da3c-488b-b126-aa9a9420ac75;
 Tue, 02 Feb 2021 08:28:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D609DAF13;
 Tue,  2 Feb 2021 08:28:35 +0000 (UTC)
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
X-Inumbo-ID: 7997f814-da3c-488b-b126-aa9a9420ac75
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612254516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zA32hojje5gaJd4Wl5W98aGCHXdaqpWoeZBN3Vk/yg4=;
	b=S6g9WwToMRAilnLtwKdaAx7sQ56qJn+mpW/mEYpb9UY2ttXfT46C4hNHyyXeXs8Hl1+8Bh
	Mkvfw5EwnGLdzKYZVkxfOwD1npr38kp9TwOtRcdEMrC3WBI9ZuCOzgaPrt8q0soGQMsjB2
	t0iXhgAw/MAat7K2CC7i2F1V50uthmw=
Subject: Re: [PATCH] memory: fix build with COVERAGE but !HVM
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <84a05b9e-a0c3-7860-4a59-a591a873b884@suse.com>
 <a2fff2f5-70d2-19f2-b7d3-01e4db50f709@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c26ae312-2e08-6266-ea0d-a7a6c901f866@suse.com>
Date: Tue, 2 Feb 2021 09:28:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a2fff2f5-70d2-19f2-b7d3-01e4db50f709@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.02.2021 19:26, Andrew Cooper wrote:
> On 01/02/2021 16:20, Jan Beulich wrote:
>> Xen is heavily relying on the DCE stage to remove unused code so the
>> linker doesn't throw an error because a function is not implemented
>> yet we defined a prototype for it.
>>
>> On some GCC versions (such as 9.4 provided by Debian sid), the compiler
>> DCE stage will not manage to figure that out for
>> xenmem_add_to_physmap_batch():
>>
>> ld: ld: prelink.o: in function `xenmem_add_to_physmap_batch':
>> /xen/xen/common/memory.c:942: undefined reference to `xenmem_add_to_physmap_one'
>> /xen/xen/common/memory.c:942:(.text+0x22145): relocation truncated
>> to fit: R_X86_64_PLT32 against undefined symbol `xenmem_add_to_physmap_one'
>> prelink-efi.o: in function `xenmem_add_to_physmap_batch':
>> /xen/xen/common/memory.c:942: undefined reference to `xenmem_add_to_physmap_one'
>> make[2]: *** [Makefile:215: /root/xen/xen/xen.efi] Error 1
>> make[2]: *** Waiting for unfinished jobs....
>> ld: /xen/xen/.xen-syms.0: hidden symbol `xenmem_add_to_physmap_one' isn't defined
>> ld: final link failed: bad value
>>
>> It is not entirely clear why the compiler DCE is not detecting the
>> unused code. However, cloning the check introduced by the commit below
>> into xenmem_add_to_physmap_batch() does the trick.
>>
>> No functional change intended.
>>
>> Fixes: d4f699a0df6c ("x86/mm: p2m_add_foreign() is HVM-only")
>> Reported-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
>> ---
>> Julien, since I reused most of your patch'es description, I've kept your
>> S-o-b. Please let me know if you want me to drop it.
>>
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -904,6 +904,19 @@ static int xenmem_add_to_physmap_batch(s
>>  {
>>      union add_to_physmap_extra extra = {};
>>  
>> +    /*
>> +     * While, unlike xenmem_add_to_physmap(), this function is static, there
>> +     * still have been cases observed where xatp_permission_check(), invoked
>> +     * by our caller, doesn't lead to elimination of this entire function when
>> +     * the compile time evaluation of paging_mode_translate(d) is false. Guard
>> +     * against this be replicating the same check here.
>> +     */
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>,

Thanks.

> but I feel this
> comment can be far more precise/concise.
> 
> /* In some configurations, (!HVM, COVERAGE), the
> xenmem_add_to_physmap_one() call doesn't succumb to
> dead-code-elimination.  Duplicate the short-circut from
> xatp_permission_check() to try and help the compiler out. */

I'm perfectly fine to take this one. I have to admit though that
I first needed to look up "succumb" ...

Jan

