Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0975F7B1BAB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 14:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609553.948676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlpiV-0004l6-LI; Thu, 28 Sep 2023 12:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609553.948676; Thu, 28 Sep 2023 12:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlpiV-0004jD-Ia; Thu, 28 Sep 2023 12:02:03 +0000
Received: by outflank-mailman (input) for mailman id 609553;
 Thu, 28 Sep 2023 12:02:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRba=FM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qlpiT-0004is-Ub
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 12:02:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d415c4b9-5df6-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 14:01:59 +0200 (CEST)
Received: from [192.168.1.9] (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id E74664EE0739;
 Thu, 28 Sep 2023 14:01:58 +0200 (CEST)
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
X-Inumbo-ID: d415c4b9-5df6-11ee-9b0d-b553b5be7939
Message-ID: <26488bd1-551e-40f2-a9ac-577df69d5325@bugseng.com>
Date: Thu, 28 Sep 2023 14:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v6 2/7] x86/hvm: address violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Gianluca Luparini <gianluca.luparini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694532795.git.simone.ballarin@bugseng.com>
 <1231f5eeebf6f2e30b91780e92dc4d6015cefdb7.1694532795.git.simone.ballarin@bugseng.com>
 <40606e79-65b4-f344-1d4f-19c8946a67e2@suse.com>
 <0d75770b-cb95-434b-b3fe-32431c2e1b15@bugseng.com>
 <50bfcf5e-d232-08e7-ec8b-38682359035d@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <50bfcf5e-d232-08e7-ec8b-38682359035d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/23 14:01, Jan Beulich wrote:
> On 28.09.2023 13:11, Simone Ballarin wrote:
>> On 13/09/23 11:44, Jan Beulich wrote:
>>> On 12.09.2023 17:38, Simone Ballarin wrote:
>>>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
>>>> headline states:
>>>> "A 'u' or 'U' suffix shall be applied to all integer constants
>>>> that are represented in an unsigned type".
>>>>
>>>> Add the 'U' suffix to integers literals with unsigned type.
>>>>
>>>> For the sake of uniformity, the following change is made:
>>>> - add 'U' suffixes to 'mask16' in 'stdvga.c'
>>>>
>>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>>> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>>
>>> Comparing with v5 - are the two tags in the correct order? And is there
>>> a From: Gianluca missing now? Apart from that I'm now okay with the
>>> changes presented here.
>>
>> The commit is new and it has been obtained splitting a previous commit
>> made by Luparini. Currently Luparini is not working on that, for this
>> reason I'm the author of the new commit.
>>
>> I thought that the first signed-off tag should be the commit author,
>> this is the reason why I've changed the order.
> 
> If this patch is a the result of splitting an earlier larger one, then
> the question still is who made the (initial part of the) changes that
> are now in here. If it was all you, then I don't see why there's a 2nd
> SoB. If part came from Gianluca's earlier work, then imo the first SoB
> still ought to be his.
> 
> Jan
> 

Ok.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


