Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC702475697
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 11:41:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247321.426450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxRiP-0007sK-52; Wed, 15 Dec 2021 10:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247321.426450; Wed, 15 Dec 2021 10:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxRiP-0007qW-1w; Wed, 15 Dec 2021 10:40:53 +0000
Received: by outflank-mailman (input) for mailman id 247321;
 Wed, 15 Dec 2021 10:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4xGT=RA=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1mxRiN-0007qN-EK
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 10:40:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 77b091e3-5d93-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 11:40:49 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92CE56D;
 Wed, 15 Dec 2021 02:40:48 -0800 (PST)
Received: from [10.57.5.111] (unknown [10.57.5.111])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7520C3F5A1;
 Wed, 15 Dec 2021 02:40:47 -0800 (PST)
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
X-Inumbo-ID: 77b091e3-5d93-11ec-9e60-abaf8a552007
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
 <b7a53384-39cb-f368-f39b-9b560336226b@xen.org>
 <6ab797ce-86dc-2c32-1cd0-417fab7516c7@suse.com>
 <73913bdf-7449-34fb-b86b-662774cb3e62@xen.org>
 <865fb3a7-76fc-24da-e07d-c6e59e3e1abe@arm.com>
 <3aae0020-938e-d5fe-7d7f-d5d1c8335a24@xen.org>
 <447b6c54-7d0c-132f-6202-c1ae7fb16e5d@arm.com>
 <871bda7e-3f94-a5bd-3caa-16b0c8f6d693@suse.com>
 <87080c9d-803d-608a-1c5a-2102f014d2bc@xen.org>
 <1fcc18d4-70ce-12d1-6d54-ae82e511a4d7@xen.org>
 <040a1871-08ee-00e9-b46f-ca4854e8a541@arm.com>
 <82557218-539b-204a-a1a7-7c796a2baa8a@suse.com>
 <9dc003f8-4dd0-282f-61ce-6ca74c543f20@arm.com>
 <6e54f971-84c3-3635-12c8-643b619b2b53@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <219d27fe-4e77-59f5-b559-4bc70c2a0399@arm.com>
Date: Wed, 15 Dec 2021 11:40:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6e54f971-84c3-3635-12c8-643b619b2b53@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 15.12.2021 11:32, Jan Beulich wrote:
> (Re-sending an abridged version, as apparently spam filters didn't like
> the original message with more retained context; I'll have to see whether
> this one also isn't liked. Sorry.)
> 
> On 15.12.2021 10:48, Michal Orzel wrote:
>> This patch and the problem it solves is about clearing top 32bits of all gp registers so not only x0,x1.
> 
> That's well understood. Yet for everything still in registers simply
> using mov ahead of the respective push (as you had it) is still
> preferable imo.
> 
> Jan
> 

In that case let's wait for Julien's opinion to decide whether I should get back to the previous
solution with mov or to the stack solution.

Cheers,
Michal

