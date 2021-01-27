Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA53305F9E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 16:30:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76149.137276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4mlZ-0000sw-5G; Wed, 27 Jan 2021 15:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76149.137276; Wed, 27 Jan 2021 15:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4mlZ-0000sX-28; Wed, 27 Jan 2021 15:29:57 +0000
Received: by outflank-mailman (input) for mailman id 76149;
 Wed, 27 Jan 2021 15:29:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l4mlY-0000sS-3M
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:29:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4mlT-0000P3-Uz; Wed, 27 Jan 2021 15:29:51 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4mlT-0000Ii-HD; Wed, 27 Jan 2021 15:29:51 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=rOz+o8+EJu76lnbak+JNk3miNYFzwHZMDeekM/0WcT4=; b=yzBWG9+tPMo9aVYxwxCdpc+tHR
	2Q1MOjyulJ/NW8foUuS0bOo46simVv0NpjNf2Y1JjMF2laCtgyYpi1/WadN7RMG/kC2BcMnXcVEPe
	26+5GCktDoIR1vAkuCpw7tnElyLsyqfA88pVKOKYm8uqJ85+fiseZ88T1oGdj9mJ69z4=;
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
To: Jan Beulich <jbeulich@suse.com>, Oleksandr <olekstysh@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, famzheng@amazon.com,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <161160798888.13183.15031685460985886988@c667a6b167f6>
 <alpine.DEB.2.21.2101251255430.20638@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2YpESuHGfZXoRTGj5mxhwar37Na3eYkX90QffYKf1r1Q@mail.gmail.com>
 <a277d66a-0bb4-22ea-badb-c3f415a5d09f@gmail.com>
 <e305357a-2c2c-7e48-7cdf-9bce97db6b4c@gmail.com>
 <6c5b6c07-8efa-be88-3885-a7c55d4ec400@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5343d245-3dea-fb4e-147e-cfa7b9b0c227@xen.org>
Date: Wed, 27 Jan 2021 15:29:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <6c5b6c07-8efa-be88-3885-a7c55d4ec400@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 27/01/2021 10:51, Jan Beulich wrote:
> On 27.01.2021 11:13, Oleksandr wrote:
>> On 26.01.21 02:14, Oleksandr wrote:
>>> On 26.01.21 01:20, Julien Grall wrote:
>>>> On Mon, 25 Jan 2021 at 20:56, Stefano Stabellini
>>>> <sstabellini@kernel.org> wrote:
>>>>> This seems to be an arm randconfig failure:
>>>>>
>>>>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/246632953
>>>>> https://gitlab.com/xen-project/patchew/xen/-/jobs/985455044
>>>> Thanks! The error is:
>>>>
>>>> #'target_mem_ref' not supported by expression#'memory.c: In function
> 
> Btw, I found the first part of this line pretty confusing, to a
> degree that when seeing it initially I thought this must be some
> odd tool producing the odd error. But perhaps this is just
> unfortunate output ordering from different tools running in
> parallel.

This message is actually coming from GCC. There are quite a few reports 
online.

Although, I am not sure whether this was intended.

> 
>>>> 'do_memory_op':
>>>> memory.c:1210:18: error:  may be used uninitialized in this function
>>>> [-Werror=maybe-uninitialized]
>>>>    1210 |             rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>>>>         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>    1211 | _mfn(mfn_list[i]));
>>>>         | ~~~~~~~~~~~~~~~~~~
>>>>
>>>> I found a few references online of the error message, but it is not
>>>> clear what it means. From a quick look at Oleksandr's branch, I also
>>>> can't spot anything unitialized. Any ideas?
>>> It seems that error happens if *both* CONFIG_GRANT_TABLE and
>>> CONFIG_IOREQ_SERVER are disabled. Looks like that mfn_list is
>>> initialized either in acquire_grant_table() or in acquire_ioreq_server().
>>> If these options disabled then corresponding helpers are just stubs,
>>> so indeed that mfn_list gets uninitialized. But, I am not sure why gcc
>>> complains about it as set_foreign_p2m_entry() is *not* going to be
>>> called in that case???
>>
>> This weird build error goes away if I simply add:
>>
>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>> index 33296e6..d1bd57b 100644
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1136,7 +1136,7 @@ static int acquire_resource(
>>         * moment since they are small, but if they need to grow in future
>>         * use-cases then per-CPU arrays or heap allocations may be required.
>>         */
>> -    xen_pfn_t mfn_list[32];
>> +    xen_pfn_t mfn_list[32] = {0};
>>        int rc;
>>
>>        if ( !arch_acquire_resource_check(currd) )
>>
>>
>> Shall I make the corresponding patch?
> 
> I'd prefer if we could find another solution, avoiding this
> pointless writing of 256 bytes of zeros (and really to be on the
> safe side I think it should rather be ~0 that gets put in there).
> Could you check whether clearing the array along the lines of
> this
> 
>      default:
>          memset(mfn_list, ~0, sizeof(mfn_list));
>          rc = -EOPNOTSUPP;
>          break;
> 
> helps (avoiding the writes in all normal cases)? Of course this
> wouldn't be a guarantee that another compiler (version) won't
> warn yet again. But the only other alternative I can think of
> without having the writes on the common path would be something
> along the lines of older Linux'es uninitialized_var(). Maybe
> someone else has a better idea ...

So GCC is complaining specifically about mfn_list[0]. For instance, I 
wrote the following:

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 33296e65cb04..81b4645047e7 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1139,6 +1139,8 @@ static int acquire_resource(
      xen_pfn_t mfn_list[32];
      int rc;

+    mfn_list[0] = 0;
+
      if ( !arch_acquire_resource_check(currd) )
          return -EACCES;

It will silence GCC. But the follwing will not:

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 33296e65cb04..cf558a6b9fa4 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1139,6 +1139,8 @@ static int acquire_resource(
      xen_pfn_t mfn_list[32];
      int rc;

+    mfn_list[1] = 0;
+
      if ( !arch_acquire_resource_check(currd) )
          return -EACCES;

I also try to set mfn_list[0] to 0 in different part of the switch. It 
doesn't help, if I add it in the default. But it does, if I put in the 
grant table path.

So it looks like the grant table path is the issue.

I can confirm that your solution will silenece GCC, but I am a bit worry 
that this may only hide a different bug because the failure seems to be 
widespread on arm (gitlab reported the error with GCC 9.2.1 and I have 
managed to reproduced on GCC 7.5.0).

Given this is a randconfig where CONFIG_GRANT_TABLE is disabled (we 
technically don't grant table disabled), I would rather take a bit more 
time to understand the problem rather than rushing it.

Cheers,

-- 
Julien Grall

