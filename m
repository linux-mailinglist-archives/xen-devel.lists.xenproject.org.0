Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B916306374
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 19:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76344.137715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4pmr-0006bx-Px; Wed, 27 Jan 2021 18:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76344.137715; Wed, 27 Jan 2021 18:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4pmr-0006bY-MV; Wed, 27 Jan 2021 18:43:29 +0000
Received: by outflank-mailman (input) for mailman id 76344;
 Wed, 27 Jan 2021 18:43:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l4pmq-0006bT-PM
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 18:43:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4pmi-0004OH-2F; Wed, 27 Jan 2021 18:43:20 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4pmh-0002eG-Mv; Wed, 27 Jan 2021 18:43:19 +0000
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
	bh=3WrCkaccBBzLU7N1+q73GciX/egYm+vIOl6ZmsNRA7o=; b=e0cpcquBOnHFKFxWre0XGI+mnR
	hReRVbfQTavYtFnRMiBurQYoBekQAFdvGRxVOdrRfITwhiujNvCJZZp9Zx0OD6lGFCMtMiZpFRob3
	aarb1wNCkLIu7fFkgNpzmqeNvSNd4jVQ95eeHh8SOeaMuB8Qt8prb7g3A1NFBGzLn4UY=;
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr <olekstysh@gmail.com>, Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
 <CAJ=z9a1c+obN3KW_cMr7OH0112_gHSxnAoEJb9qW6R1J38QgQQ@mail.gmail.com>
 <20270711-36bc-6d7d-16cb-4572cace47ed@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <eb03f366-9405-c193-07be-fbeca29fca4c@xen.org>
Date: Wed, 27 Jan 2021 18:43:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20270711-36bc-6d7d-16cb-4572cace47ed@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 25/01/2021 23:40, Oleksandr wrote:
> 
> On 26.01.21 01:13, Julien Grall wrote:
>> Hi,
> 
> Hi Julien

Hi Oleksandr,

> 
>>
>> On Mon, 25 Jan 2021 at 19:09, Oleksandr Tyshchenko 
>> <olekstysh@gmail.com> wrote:
>>> ***
>>> Please note, this patch depends on the following which is
>>> on review:
>>> https://patchwork.kernel.org/patch/11816689/
>>> The effort (to get it upstreamed) was paused because of
>>> the security issue around that code (XSA-348).
>>> ***
>> I read this comment as "This series should be applied on top the patch
>> X". However, looking at your branch, I can't see the patch. What did I
>> miss?
> You didn't miss anything. Patch series doesn't contain it. I mentioned 
> about this patch in order not to forget about it
> and draw reviewer's attention. Looks like, the activity (to get it 
> upstreamed) hasn't been resumed yet and I don't know what we should do 
> with that dependency
> in the context of this series...

I will reply what I wrote on IRC privately :). I think this fine to 
defer it to after Xen 4.15 because IOREQ will be in tech preview.

Note that the bug can only be hit if the IOREQ server disappear behind 
your back. AFAICT, this is mostly an issue with device model running in 
non-trusted domain.

Cheers,

-- 
Julien Grall

