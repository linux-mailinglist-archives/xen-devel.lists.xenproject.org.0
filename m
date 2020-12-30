Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56D32E7814
	for <lists+xen-devel@lfdr.de>; Wed, 30 Dec 2020 12:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60133.105442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuZgA-0003dC-3G; Wed, 30 Dec 2020 11:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60133.105442; Wed, 30 Dec 2020 11:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuZg9-0003cn-Vv; Wed, 30 Dec 2020 11:30:09 +0000
Received: by outflank-mailman (input) for mailman id 60133;
 Wed, 30 Dec 2020 11:30:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kuZg7-0003Yw-MN
 for xen-devel@lists.xenproject.org; Wed, 30 Dec 2020 11:30:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kuZg6-0005UV-6X; Wed, 30 Dec 2020 11:30:06 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kuZg5-000524-V1; Wed, 30 Dec 2020 11:30:06 +0000
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
	bh=paGfClgLfeY6QdBNt5V1TXaOr1iZj8mkYe/1tA0SSpA=; b=X/Qu7mGQxh0miuqFHOuRqFiMKx
	+CaecYmXbh7rdfdhe/VvTWgloyLdgh/QmuCpOVpq/Y2TD0GnZkjLXEnE3gHdPVOj4EyH79Kles2UK
	RqoeZ4LPEN1Q9TvTzKU2lGmmYSDYtjCkTiUV0cGHUQQjH9hGCItOX6KOlv1YohCH+AGY=;
Subject: Re: [openxt-dev] VirtIO-Argo initial development proposal
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rich Persaud <persaur@gmail.com>
Cc: Jean-Philippe Ouellet <jpo@vt.edu>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 openxt <openxt@googlegroups.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Julien Grall
 <jgrall@amazon.com>, James McKenzie <james@bromium.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.co.uk>
References: <DBCC8190-7228-483E-AE8A-09880B28F516@gmail.com>
 <20201229091730.owgpdeekb7pcex7t@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <eac811f4-51fd-9198-446a-230dc6915f62@xen.org>
Date: Wed, 30 Dec 2020 11:30:03 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201229091730.owgpdeekb7pcex7t@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 29/12/2020 09:17, Roger Pau Monné wrote:
> On Wed, Dec 23, 2020 at 04:32:01PM -0500, Rich Persaud wrote:
>> ﻿On Dec 17, 2020, at 07:13, Jean-Philippe Ouellet <jpo@vt.edu> wrote:
>>> ﻿On Wed, Dec 16, 2020 at 2:37 PM Christopher Clark
>>> <christopher.w.clark@gmail.com> wrote:
>>>> Hi all,
>>>>
>>>> I have written a page for the OpenXT wiki describing a proposal for
>>>> initial development towards the VirtIO-Argo transport driver, and the
>>>> related system components to support it, destined for OpenXT and
>>>> upstream projects:
>>>>
>>>> https://openxt.atlassian.net/wiki/spaces/~cclark/pages/1696169985/VirtIO-Argo+Development+Phase+1
> 
> Thanks for the detailed document, I've taken a look and there's indeed
> a lot of work to do listed there :). I have some suggestion and
> questions.
> 
> Overall I think it would be easier for VirtIO to take a new transport
> if it's not tied to a specific hypervisor. The way Argo is implemented
> right now is using hypercalls, which is a mechanism specific to Xen.
The concept of hypervisor call is not Xen specific. Any other hypervisor 
can easily implement them. At least this is the case on Arm because we 
have an instruction 'hvc' that acts the same way as a syscall but for 
the hypervisor.

What we would need to do is reserving a range for Argos. It should be 
possible to do it on Arm thanks to the SMCCC (see [1]).

I am not sure whether you have something similar on x86.

> IMO it might be easier to start by having an Argo interface using
> MSRs, that all hypervisors can implement, and then base the VirtIO
> implementation on top of that interface.
My concern is the interface would need to be arch-specific. Would you 
mind to explain what's the problem to implement something based on vmcall?

Cheers,

[1] 
https://developer.arm.com/architectures/system-architectures/software-standards/smccc

-- 
Julien Grall

