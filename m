Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAA673D85A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 09:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555351.867063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDgUF-0007bn-1G; Mon, 26 Jun 2023 07:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555351.867063; Mon, 26 Jun 2023 07:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDgUE-0007Zg-Ur; Mon, 26 Jun 2023 07:18:10 +0000
Received: by outflank-mailman (input) for mailman id 555351;
 Mon, 26 Jun 2023 07:18:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDgUE-0007Za-4s
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 07:18:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDgU8-0001Ue-I1; Mon, 26 Jun 2023 07:18:04 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDgU8-0003rT-AB; Mon, 26 Jun 2023 07:18:04 +0000
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
	bh=rBFUNpTn+eg7DnGJiuKQyKC1bmZAODhZpG6KTDB5WXM=; b=wmzL2C9pW93LjifP1OGDrvbnUn
	d0B9EW/jbKSMNANcUWBi4wPu71DoNsAJJpvlm4DrTVDrQpb9+Hxx7L6lnzpmy+OMv+NfWshb4J87G
	0Qe9Gaq4OnyAC8ZseOaph1DKvvUdczpNoP4KfNpi8pZzXuxJACPYBFk1W8cjcZrov1W0=;
Message-ID: <0e9fdd98-2f3b-edd0-d337-d30dc3284fd1@xen.org>
Date: Mon, 26 Jun 2023 08:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 0/9] xen/arm: Enable UBSAN support
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Luca.Fancellu@arm.com, michal.orzel@amd.com, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20230625204907.57291-1-julien@xen.org>
 <2f916d99-6c1b-eb3d-e40e-6c881dbf4185@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2f916d99-6c1b-eb3d-e40e-6c881dbf4185@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ The rest)

Hi Jan,

On 26/06/2023 06:45, Jan Beulich wrote:
> On 25.06.2023 22:48, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Hi all,
>>
>> At the moment, we are not able to enable UBSAN on Arm because the
>> final binary will be over the maximum size of Xen we currently support
>> (i.e. 2MB).
>>
>> This patch series aim to lift the restrictions and also
>> enable UBSAN. Lastly, at the end of the series, there is the first
>> issue found by USBAN.
>>
>> There are a few of others. One will be fixed by the MISRA work
>> in [1] and the other is a bit tricky. One the splat is (the
>> others seems to be for similar reasons)
>>
>> (XEN) ================================================================================
>> (XEN) UBSAN: Undefined behaviour in common/sched/credit2.c:2437:5
>> (XEN) member access within misaligned address 43feefbc for type 'struct csched2_runqueue_data'
>> (XEN) which requires 8 byte alignment
>> (XEN) Xen WARN at common/ubsan/ubsan.c:172
>>
>> This is on 32-bit and UBSAN seems to complain about the check in
>> list_for_each_entry. I haven't yet dived into the issue yet.
> 
> At a guess this is because the list head struct, living in
> struct csched2_private, has only 32-bit alignment, while on the
> last loop iteration pos doesn't hold a real struct
> csched2_runqueue_data * (which ought to b 64-bit aligned, but
> isn't in the special case of having reached the list head again).
> If I'm not mistaken rwlock_t is 12 bytes for Arm32, which would
> match with the address above ending in c, assuming that xmalloc()
> returns at least 16-byte-aligned space on Arm32 as well. If so,
> in this particular case some rearrangement of struct
> csched2_private ought to help, but as you say this is a more
> general issue and hence likely wants addressing in a generic way.

Your analysis is correct. So far I have only seen the splats in the 
credit2 code. But it feels a little be odd to fix only there.

Our list implementation is based on the Linux one. I checked a recent 
version but I couldn't find any hints that they may have fixed the issue.

For a more generic fix, I was thinking to force the alignment of the 
list head to 8-bytes. This is not perfect but would cover most of the 
use-cases where list head is used.

Cheers,

-- 
Julien Grall

