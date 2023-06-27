Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A8474020E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 19:21:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556210.868550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qECNm-00077b-DZ; Tue, 27 Jun 2023 17:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556210.868550; Tue, 27 Jun 2023 17:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qECNm-000757-AG; Tue, 27 Jun 2023 17:21:38 +0000
Received: by outflank-mailman (input) for mailman id 556210;
 Tue, 27 Jun 2023 17:21:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qECNl-00074z-2F
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 17:21:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qECNj-0000FW-V1; Tue, 27 Jun 2023 17:21:35 +0000
Received: from ip-185-104-136-31.ptr.icomera.net ([185.104.136.31]
 helo=[192.168.2.131]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qECNj-0000Gk-LV; Tue, 27 Jun 2023 17:21:35 +0000
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
	bh=0JtjPygEMgH67KBCAB/ahS1Nf4A3HVPZj0xHyEJdLLs=; b=AvTPm9SZi5uq3wXvcQIJIu065O
	Jdekbr6xtLV2iSXyLXDg0kRlLxgHtH7cUy51idFBsr0ij6mSoJ7mwJTThLBO/xgMSaCv5Mzf0cpr5
	iPz+1fBc2x2WjWdBd2a662IaXZr8JKiQU4z6onw74zDG8m7sZF2sYOlDJbd+ngNQMKbg=;
Message-ID: <0e086551-eb0c-743b-5daa-9576c219e041@xen.org>
Date: Tue, 27 Jun 2023 18:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] tools/python: Fix memory leak on error path
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 wei.chen@arm.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230608135913.560413-1-luca.fancellu@arm.com>
 <20230608135913.560413-2-luca.fancellu@arm.com> <ZJnT8rdnMT5lrR0A@mail-itl>
 <ZJrWImht4GZXvLCv@mail-itl>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZJrWImht4GZXvLCv@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Marek,

On 27/06/2023 13:29, Marek Marczykowski-Górecki wrote:
> On Mon, Jun 26, 2023 at 08:07:46PM +0200, Marek Marczykowski-Górecki wrote:
>> On Thu, Jun 08, 2023 at 02:59:13PM +0100, Luca Fancellu wrote:
>>> Commit 56a7aaa16bfe introduced a memory leak on the error path for a
>>> Py_BuildValue built object that on some newly introduced error path
>>> has not the correct reference count handling, fix that by decrementing
>>> the refcount in these path.
>>>
>>> Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Oh, and BTW, in relation to the discussion on the summit about
> committing process, the buggy version was committed without my ack,
> after waiting for my review for about two weeks.

I was the committer for the series. In this case, this was not a case of 
committing because I thought the patch was uncontroversial. Instead, 
this was a lack of my side to properly check the acks on the patch. 
Sorry for that.

In general, as I mentioned during the design session, I don't commit 
with missing acks without explicitly saying so on the mailing list and 
this is often after consulting with others on IRC.

On a similar topic. So far, checking the ack is a manual process for me. 
So this is not entirely an error-free process (in particular for patch 
requiring multiple maintainers acks). I would love to have a script that 
could tell me if a patch is fully approved and/or what acks are missing.

Cheers,

-- 
Julien Grall

