Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7DE79F082
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 19:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601516.937528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgTrF-0000Lt-VD; Wed, 13 Sep 2023 17:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601516.937528; Wed, 13 Sep 2023 17:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgTrF-0000J7-SD; Wed, 13 Sep 2023 17:40:57 +0000
Received: by outflank-mailman (input) for mailman id 601516;
 Wed, 13 Sep 2023 17:40:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qgTrD-0000J1-TD
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 17:40:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgTrB-0004c2-QG; Wed, 13 Sep 2023 17:40:53 +0000
Received: from [15.248.2.159] (helo=[10.24.67.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgTrB-0007QR-Jb; Wed, 13 Sep 2023 17:40:53 +0000
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
	bh=npT2dt5PXOm/3skYvTdj+c04tmQDm/HsMaioDNAsZbw=; b=EqO7Wd2zgLwRr9wJk18cOtXJWp
	tiT7TXC16qUoABBfQFRtMm1GuX4Qk9lWbUZbMNDfLYfpm3nnxsyPM6BFd6XxBvE5MWetgbek0nhhH
	Fo+L65PONGWPCJygXQOaJTUadNRJKzemIlcTu54pu1WA06dunTHxQsqg6NuwVm62Me/w=;
Message-ID: <7921332e-1c0f-4586-b309-5cd5a19af069@xen.org>
Date: Wed, 13 Sep 2023 18:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.18?] x86: support data operand independent timing
 mode
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
References: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
 <29A9BF11-7ECF-4C3E-9D5E-9D44E63A297A@arm.com>
 <497c7d09-e5ef-96dc-5740-9163a94a79bf@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <497c7d09-e5ef-96dc-5740-9163a94a79bf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/09/2023 07:21, Jan Beulich wrote:
> On 12.09.2023 02:48, Henry Wang wrote:
>>> On Sep 11, 2023, at 23:01, Jan Beulich <jbeulich@suse.com> wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -788,6 +788,14 @@ Specify the size of the console debug tr
>>> additionally a trace buffer of the specified size is allocated per cpu.
>>> The debug trace feature is only enabled in debugging builds of Xen.
>>>
>>> +### dit (x86)
>>> +> `= <boolean>`
>>> +
>>> +> Default: `CONFIG_DIT_DEFAULT`
>>> +
>>> +Specify whether Xen and guests should operate in Data Independent Timing
>>> +mode.
>>> +
>>
>> Since a new cmdline interface is added, I am wondering would such
>> addtion deserves a CHANGELOG entry?
> 
> I'm open to opinions, albeit not so much because of the added command line
> option.

I think it would make sense to add an entry to say the user can now 
decide the operation mode for DIT.

Cheers,

-- 
Julien Grall

