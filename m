Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56464D4554
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 12:07:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288291.488913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSGcs-0000mz-NS; Thu, 10 Mar 2022 11:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288291.488913; Thu, 10 Mar 2022 11:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSGcs-0000kv-JN; Thu, 10 Mar 2022 11:06:34 +0000
Received: by outflank-mailman (input) for mailman id 288291;
 Thu, 10 Mar 2022 11:06:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nSGcq-0000kp-Jf
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 11:06:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSGco-0007Qp-NZ; Thu, 10 Mar 2022 11:06:30 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.239.19])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSGco-0006K8-H1; Thu, 10 Mar 2022 11:06:30 +0000
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
	bh=V0aEpWnF4IApBhYe/KTRmsvoxHs6cR73b700XIxpcVY=; b=PeBmRkqFDbOsenoU9466KzQrvj
	ez6mbxpTfWecxCbwxgOSRppIUJGJtVRDLDk8hyPvwFh5sPojbuF476Usm0vyIRsfxc3kA/IIj0hqA
	WivTA1askua+IZOYAHANOEmVdYWlrc0HRbappHKhM42MjCFOnI/t2A9JPP/UqT1Ts++w=;
Message-ID: <3c7b7e00-1134-2ce3-26e7-b3d11782daaa@xen.org>
Date: Thu, 10 Mar 2022 11:06:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: preparations for 4.16.1
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com>
 <4fe170af-9120-0203-bed9-895380a2ff0a@xen.org>
 <4DE5BBE4-F228-4584-81AD-D0A41858FDB9@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4DE5BBE4-F228-4584-81AD-D0A41858FDB9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/03/2022 10:02, Bertrand Marquis wrote:
> Hi,

Hi Bertrand,

>> On 10 Mar 2022, at 09:04, Julien Grall <julien@xen.org> wrote:
>> On 10/03/2022 08:57, Jan Beulich wrote:
>>> the release is due in a few weeks time.
>>> Please point out backports you find missing from the respective staging
>>> branch, but which you consider relevant. One I have queued already, but
>>> which I'd like to put in only once the pending fix to it ("x86: avoid
>>> SORT_BY_INIT_PRIORITY with old GNU ld") has also landed in staging, is
>>> 4b7fd8153ddf x86: fold sections in final binaries
>>
>> For arm, I would like to propose backporting:
>>
>> 32365f3476: xen/arm64: Zero the top 32 bits of gp registers on entry...
>>
> 
> Agree (not changing the fact that Stefano should confirm)
> 
> I would like the following one to also be considered:
> f3999bc: arm/efi: Handle Xen bootargs from both xen.cfg and DT
> f1f38e2: xen/arm: increase memory banks number define value

I am fine with both.

Cheers,

-- 
Julien Grall

