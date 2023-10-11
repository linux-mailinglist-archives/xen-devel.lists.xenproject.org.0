Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0C87C52D2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 14:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615461.956691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqXu4-0004Qh-Ow; Wed, 11 Oct 2023 12:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615461.956691; Wed, 11 Oct 2023 12:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqXu4-0004N2-LL; Wed, 11 Oct 2023 12:01:28 +0000
Received: by outflank-mailman (input) for mailman id 615461;
 Wed, 11 Oct 2023 12:01:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qqXu3-0004Mw-K2
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 12:01:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqXu1-0003Db-OR; Wed, 11 Oct 2023 12:01:25 +0000
Received: from [15.248.2.150] (helo=[10.24.67.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqXu1-00025n-I5; Wed, 11 Oct 2023 12:01:25 +0000
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
	bh=qqSP0ZTyDWrQsgxJ8GyxwYNDpNcZ6BVSzay1NGqucfc=; b=YUTsaQHf27wfDE9yEjHSDBizlQ
	Am830N9rAgStFbvetylJLy5yC6WiOtDXHdryW/3lmb8D9nDgQ92qHp/xsFWtG3Dk4hm0iK01LTvCZ
	fqFcXNgS1A8M3xu7P4UDp0gw/t2RTY6JQK7iRKRMEOSYaI37NLytD9m2VfHUeFgHMwFI=;
Message-ID: <66ac185e-eace-4933-b48a-e2fe035fcb8b@xen.org>
Date: Wed, 11 Oct 2023 13:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
 <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop>
 <9DD525D9-DB6D-4888-9266-FB45906A0E0F@arm.com>
 <alpine.DEB.2.22.394.2310051756360.2348112@ubuntu-linux-20-04-desktop>
 <C2DDFAB5-D943-4A24-9C14-AF35BE2A7C90@arm.com>
 <alpine.DEB.2.22.394.2310061741130.3431292@ubuntu-linux-20-04-desktop>
 <1ceb5aa0-d374-4357-964f-1341468d542e@xen.org>
 <alpine.DEB.2.22.394.2310091251080.3431292@ubuntu-linux-20-04-desktop>
 <8c3d7933-c139-49dd-8c62-2d4543176f8f@xen.org>
 <alpine.DEB.2.22.394.2310101635280.3431292@ubuntu-linux-20-04-desktop>
 <80f4df2b-a8b2-4494-94e0-47de55c01597@xen.org>
 <1766b5f3-490c-4bbe-902c-3970c28041a7@xen.org>
 <6BB62AEF-FCE1-412C-87DD-479319623092@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6BB62AEF-FCE1-412C-87DD-479319623092@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/10/2023 11:53, Luca Fancellu wrote:
> 
>>>>
>>>> Luca answered to a similar, more generic, question a few days ago about
>>>> Coverity: https://marc.info/?l=xen-devel&m=169657904027210
>>> Interesting.
>>>>
>>>> So even if we get cppcheck to work like that, we would lose Coverity
>>>> support.
>>> I think my suggestion was probably misunderstood. So let me clarify it. To cover multi-line, we could write the following in Xen:
>>> /* cppcheck tag next-3-lines */
>>> line 1
>>> line 2
>>> line 3
>>> AFAIU Eclair supports multi-line, so the tag would be transformed to there internal solution. For CPPCheck, this could be transformed to:
>>> /* cppcheck tag next-3 lines */
>>> line 1 /* generated cppcheck tag */
>>> line 2 /* generated cppcheck tag */
>>> line 3 /* generated cppcheck tag */
>>> Now, I understand that coverity doesn't support any of the two format. So the only solution would be to add the comment before each line which would impact the line numbers. This is not great, but I think this is acceptable as the context would likely help to find where this is coming from.
>>
>> Just to clarify, here I meant that for coverity, a script before the scan could convert to the multi-line version. So the line change only impact Coverity.
> 
> Hi Julien,
> 
> We’ve tried to avoid that because when the tool insert lines, the resultant report would give wrong lines numbers if any violation is reported after the
> insertion points. So there will be a mismatch between the codebase and the report findings from some point on in the file.

I know. Stefano already pointed that out. But as I wrote, I don't think 
this is a big problem as it only affecte one tool (Coverity) and one 
would still be able to find the exact place based on the context.

Cheers,

-- 
Julien Grall

