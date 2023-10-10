Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 746187BF8F7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 12:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614666.955890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqAGJ-0008Lq-4G; Tue, 10 Oct 2023 10:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614666.955890; Tue, 10 Oct 2023 10:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqAGJ-0008IU-1N; Tue, 10 Oct 2023 10:46:51 +0000
Received: by outflank-mailman (input) for mailman id 614666;
 Tue, 10 Oct 2023 10:46:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qqAGH-0008IO-2o
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 10:46:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqAGF-0005t9-EE; Tue, 10 Oct 2023 10:46:47 +0000
Received: from [15.248.2.156] (helo=[10.24.67.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqAGF-0007D7-67; Tue, 10 Oct 2023 10:46:47 +0000
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
	bh=eXzjVBJ2/RWdMueLaDXCPBM2R1nCFROGqqSAeP3URPM=; b=q2NK/X1zdX+1akpOSOWZm1ChZ5
	SwjN+wJ1V9WJVR0dNOngjxwPY1N8BgfzcEoO+8BqlOcYuUqQaHebyKt0i7JmYzwbIDzWL3qp0in8z
	DBVkrI2Na+ALMQCesqdonSUqx2ALH0MM7AqjztWwD/hDCqDa8OkxKOpF39DdCXFxSt8o=;
Message-ID: <8c3d7933-c139-49dd-8c62-2d4543176f8f@xen.org>
Date: Tue, 10 Oct 2023 11:46:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
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
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2310091251080.3431292@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/10/2023 23:19, Stefano Stabellini wrote:
>>
>> I am not sure this is better. This is a long line to read. But this is a
>> personal opinion.
>>
>> On the technical side, can we easily teach a tool to format this kind of
>> exception? If not, then this should not be an exception we should implement.
> 
> I am not sure I understand what you mean by "can we easily teach a tool
> to format this kind of exception". Do you mean whether we can teach a
> tool to interpret a multiline statement as a single statement?

Sorry for the wording was not clear. I was referring to tools formatting 
the code (e.g. clang-format). Hopefully, at some point, we will finally 
have a way to automatically format the code. So we need a coding style 
that can be easily be checked.

It is not clear to me whether your proposed exception would work. We may 
have to allow longer lines (and this has drawback).

> /* cppcheck tag */
> line1
> /* cppcheck tag */
> line2
> /* cppcheck tag */
> line3
> 
> and that would end up changing the line numbers in the source files so
> the cppcheck report wouldn't match with the original line numbers any
> longer

Would cppcheck accepts tag at the end of the line? If so, the following 
would not modify the line count:

/* cppcheck tag */
line1 /* added cppcheck tag */
line2 /* added cppcheck tag */
line3 /* added cppcheck tag */

Cheers,

-- 
Julien Grall

