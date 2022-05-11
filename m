Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849A2522E77
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 10:34:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326599.549158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nohnk-00056a-0q; Wed, 11 May 2022 08:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326599.549158; Wed, 11 May 2022 08:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nohnj-00054P-T7; Wed, 11 May 2022 08:34:31 +0000
Received: by outflank-mailman (input) for mailman id 326599;
 Wed, 11 May 2022 08:34:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nohni-00054J-Vc
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 08:34:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nohni-00028O-OI; Wed, 11 May 2022 08:34:30 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nohni-00034p-Ij; Wed, 11 May 2022 08:34:30 +0000
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
	bh=xsFGJDTRelUy2YDMXuTA7EDuToFbqqWaQ7fvTGFMsjU=; b=mhC8Rt0SpsVYzQVkQYLThNJCf9
	V83CNNM/5AgLLujn33xl5uD4mxBg8ig/ivX5flSY9DUSN62hhLqP5LMNNgpl00ccxQcXDC1Rv9/lt
	jdVohaxGM8MmeJsMA9//tNsbV8M9wlexRv8gx+2h5WhayDe2nMw4KE1qlmculk8wGFIs=;
Message-ID: <82e54293-926e-b7ee-7091-a85a9db8f6c5@xen.org>
Date: Wed, 11 May 2022 09:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
To: =?UTF-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
 <SJ0PR03MB5405E449B19691A916EA3FE79DC89@SJ0PR03MB5405.namprd03.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <SJ0PR03MB5405E449B19691A916EA3FE79DC89@SJ0PR03MB5405.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Please configure your e-mail client to send in plain text.

On 11/05/2022 07:30, Lin Liu （刘林） wrote:
> Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
> On 10/05/2022 11:15, Lin Liu wrote:
>> Update to use byteswap to swap bytes.
>>
>> No functional change.
>>
>> Signed-off-by: Lin Liu <lin.liu@citrix.com>
>> ---
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Julien Grall <julien@xen.org>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>> Cc: George Dunlap <george.dunlap@citrix.com>
>> Cc: Jan Beulich <jbeulich@suse.com>
>> Cc: Wei Liu <wl@xen.org>
>> Changes in v3:
>> - Update xen/common/device_tree.c to use be32_to_cpu
>> - Keep const in type cast in unaligned.h
>> ---
>>    xen/common/device_tree.c           | 44 +++++++++++++++---------------
>>    xen/common/libelf/libelf-private.h |  6 ++--
>>    xen/common/xz/private.h            |  2 +-
>>    xen/include/xen/unaligned.h        | 24 ++++++++--------
>>    4 files changed, 38 insertions(+), 38 deletions(-)
>>
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index 4aae281e89..70d3be3be6 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -171,7 +171,7 @@ bool_t dt_property_read_u32(const struct dt_device_node *np,
>>        if ( !val || len < sizeof(*out_value) )
>>            return 0;
>>
>> -    *out_value = be32_to_cpup(val);
>> +    *out_value = be32_to_cpu(*val);
> 
>> This code has been taken from Linux and I would rather prefer to keep
>> the *cpup* helpers to avoid any changes when backporting.
> 
>> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
>> index 0a2b16d05d..16b2e6f5f0 100644
>> --- a/xen/include/xen/unaligned.h
>> +++ b/xen/include/xen/unaligned.h
>> @@ -20,62 +20,62 @@
>>
>>    static inline uint16_t get_unaligned_be16(const void *p)
>>    {
>> -     return be16_to_cpup(p);
>> +     return be16_to_cpu(*(const uint16_t *)p)
> 
>> I haven't checked the existing implementation of be16_to_cpup().
>> However, this new approach would allow the compiler to use a single load
>> instruction to read the 16-bit value from memory. So this change may
>> break on platform where unaligned access is forbidden (such as arm32).
> 
>>    }
>>
>>    static inline void put_unaligned_be16(uint16_t val, void *p)
>>    {
>> -     *(__force __be16*)p = cpu_to_be16(val);
>> +     *(__be16 *)p = cpu_to_be16(val);
> 
>>> Why did you drop the __force?
> 
> Google told me __force is used in linux kernel to suppress warning in sparse,
> https://stackoverflow.com/questions/53120610/what-does-the-attribute-force-do
> Is sparse also used in xen?

I am not aware of any use of Sparse in Xen, but it would technically be 
possible.

However, my point here is more that this change seems to be unrelated to 
what the patch is meant to do (i.e. switching to byteswap). So if it is 
unnecessary, then it should be dropped from this patch.

Cheers,

-- 
Julien Grall

