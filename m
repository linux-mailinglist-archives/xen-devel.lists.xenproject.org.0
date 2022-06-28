Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A6E55E551
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 16:26:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357141.585581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6CAl-0002o6-Py; Tue, 28 Jun 2022 14:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357141.585581; Tue, 28 Jun 2022 14:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6CAl-0002m8-MY; Tue, 28 Jun 2022 14:26:35 +0000
Received: by outflank-mailman (input) for mailman id 357141;
 Tue, 28 Jun 2022 14:26:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6CAj-0002ly-NQ
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 14:26:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6CAj-0000Pt-Bf; Tue, 28 Jun 2022 14:26:33 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.2.252]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6CAj-0005ra-57; Tue, 28 Jun 2022 14:26:33 +0000
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
	bh=YBp3rjCoK/7YhduO4MDknePhI7n5ZJucvRKCk30BpwU=; b=7D4XBBMVSZCCF568nzM+frKAj2
	lS21T2IkwlOU2iXIm4RP2+Mupw4KsxFEteUlvgoyXZ3IVYDzmNbEDGK/6mwArRH+TqnNYD+njIXDa
	W06iRfWhJtFJv8DhWtEDojBSQf53MG/PgRc9yRNl6aedE4UnIUR6wvr0fgvqaS08HpII=;
Message-ID: <dbdf3bb2-edc6-e622-f17a-8819f6fcb43d@xen.org>
Date: Tue, 28 Jun 2022 15:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
 <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
 <DC011AED-F74B-4055-8DEE-6FFC6FC5215C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DC011AED-F74B-4055-8DEE-6FFC6FC5215C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/06/2022 14:53, Rahul Singh wrote:
> Hi Julien

Hi Rahul,

>> On 23 Jun 2022, at 4:30 pm, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 23/06/2022 16:10, Rahul Singh wrote:
>>> Hi Julien,
>>>> On 22 Jun 2022, at 4:05 pm, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 22/06/2022 15:38, Rahul Singh wrote:
>>>>> Guest can request the Xen to close the event channels. Ignore the
>>>>> request from guest to close the static channels as static event channels
>>>>> should not be closed.
>>>>
>>>> Why do you want to prevent the guest to close static ports? The problem I can see is...
>>> As a static event channel should be available during the lifetime of the guest we want to prevent
>>> the guest to close the static ports.
>> I don't think it is Xen job to prevent a guest to close a static port. If the guest decide to do it, then it will just break itself and not Xen.
> 
> It is okay for the guest to close a port, port is not allocated by the guest in case of a static event channel.
As I wrote before, the OS will need to know that the port is statically 
allocated when initializing the port (we don't want to call the 
hypercall to bind the event channel). By extend, the OS should be able 
to know that when closing it and skip the hypercall.

> Xen has nothing to do for close the static event channel and just return 0.

Xen would not need to be modified if the OS was doing the right (i.e. no 
calling close).

So it is still unclear why papering over the issue in Xen is the best 
solution.

Cheers,

-- 
Julien Grall

