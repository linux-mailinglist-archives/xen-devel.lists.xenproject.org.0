Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6A3762355
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 22:30:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569929.891145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOel-00045n-CF; Tue, 25 Jul 2023 20:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569929.891145; Tue, 25 Jul 2023 20:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOel-00043G-8X; Tue, 25 Jul 2023 20:29:19 +0000
Received: by outflank-mailman (input) for mailman id 569929;
 Tue, 25 Jul 2023 20:29:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Iib=DL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qOOej-000438-QS
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 20:29:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df1260b3-2b29-11ee-b240-6b7b168915f2;
 Tue, 25 Jul 2023 22:28:53 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.163.26.148])
 by support.bugseng.com (Postfix) with ESMTPSA id D4C994EE0738;
 Tue, 25 Jul 2023 22:28:50 +0200 (CEST)
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
X-Inumbo-ID: df1260b3-2b29-11ee-b240-6b7b168915f2
Message-ID: <5332da19-a9d8-f9fb-62b3-b1dbdf7982dc@bugseng.com>
Date: Tue, 25 Jul 2023 22:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] xen/spinlock: mechanically rename parameter name
 'debug'
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <87c0f41e43a1c95ef7d8923c77a2072eb9baee96.1690276551.git.nicola.vetrini@bugseng.com>
 <120ed841-5e0f-e27b-9937-5599dc75d84a@suse.com>
 <alpine.DEB.2.22.394.2307251235090.3118466@ubuntu-linux-20-04-desktop>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <alpine.DEB.2.22.394.2307251235090.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/07/23 21:37, Stefano Stabellini wrote:
> On Tue, 25 Jul 2023, Jan Beulich wrote:
>> On 25.07.2023 11:17, Nicola Vetrini wrote:
>>> Rule 5.3 has the following headline:
>>> "An identifier declared in an inner scope shall not hide an
>>> identifier declared in an outer scope"
>>>
>>> To avoid any confusion resulting from the parameter 'debug'
>>> hiding the homonymous function declared at
>>> 'xen/arch/x86/include/asm/processor.h:428'
>>> the rename of parameters s/debug/lkdbg/ is performed.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> Changes in v2:
>>> - s/dbg/lkdbg/
>>
>> But only in some of the cases. E.g. ...
>>
>>> -static void check_barrier(union lock_debug *debug)
>>> +static void check_barrier(union lock_debug *dbg)
>>
>> ... not here (there are a few more).
> 
> I agree with Jan: these are all union lock_debug parameters, so it would
> make sense to me to use lkdbg everywhere in this patch.

Yes, indeed, that's unintentional. Can this be done on commit or should 
I send a v3?

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

