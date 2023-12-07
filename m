Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24F807E29
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 03:02:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649522.1014097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB3hg-0006ym-JZ; Thu, 07 Dec 2023 02:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649522.1014097; Thu, 07 Dec 2023 02:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB3hg-0006x1-Gf; Thu, 07 Dec 2023 02:01:28 +0000
Received: by outflank-mailman (input) for mailman id 649522;
 Thu, 07 Dec 2023 02:01:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G8G3=HS=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rB3hf-0006wv-DI
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 02:01:27 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85be978d-94a4-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 03:01:25 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1701914470116589.447177774002;
 Wed, 6 Dec 2023 18:01:10 -0800 (PST)
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
X-Inumbo-ID: 85be978d-94a4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1701914472; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Kqrc9EwbPh5h7rvC9rOVh7fgNVkXdWBUCRMvAc583iVAp8TnUCDzXmIookAew1GwkJdaraKkYeBezaMdxy+fB7DnJyeCXe11KGu5Hby8pGpf4C0EafOyulwuseebWby15eLRl3RVn5N0yx4tXtMJd6VRzHC0hutdJ14gqMs9Ylg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1701914472; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VLbM0dadOyLi60RciybOuwW0AEniZ9Gvc8FzEZOI7eM=; 
	b=k7PIPb6R9g/i+SvhoJfjhPXLxLv1bGTbb01GHZP4/q4SXQpLWIMe996u6BzQPHJTbkvBUMrttUvuXhtCr0zj6VTdWJef6z/7v9ykVGkS9Ys5HalyRboHvbSKm2gRDGvEvh3/cZncUtj2PeoUMuNcd6t7TKZ6uVHhEtKyUXykAIE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1701914472;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VLbM0dadOyLi60RciybOuwW0AEniZ9Gvc8FzEZOI7eM=;
	b=pcTp9Tnm7vjxhUwPUlqL1tMboiNzU/mmzmOEuu2bP9lQuRHHcCBonD9gfx5vU9cw
	x7RV27Q3JMD5Ag6sjxtP1djYDMNu140AKRc+3oz+UvlIQQMKkUlmfh903aSl0pdeX1H
	Jf3RCMyZAtd37kiX3tlEpZHreHA69rHbBrmaPI1Q=
Message-ID: <a6400750-fd17-4452-a60d-bd9307825548@apertussolutions.com>
Date: Wed, 6 Dec 2023 21:01:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/ppc: Enable Boot Allocator
To: Julien Grall <julien@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
 <5ed3351f7824a5d0a1ff29c17cb55b2608f28109.1701384928.git.sanastasio@raptorengineering.com>
 <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/1/23 15:56, Julien Grall wrote:
> (+ Arm and RISC-V folks)
> 
> Hi Shawn,
> 
> On 01/12/2023 20:59, Shawn Anastasio wrote:
>> Adapt arm's earlyfdt parsing code to ppc64 and enable Xen's early boot
>> allocator. Routines for parsing arm-specific devicetree nodes (e.g.
>> multiboot) were excluded, reducing the overall footprint of code that
>> was copied.
> 
> I expect RISC-V to want similar code. I am not really thrilled in the 
> idea of having 3 similar copy of the parsing. So can we extract the 
> common bits (or harmonize it) so it can be shared?

That is actually 4, Hyperlaunch already did a common version for our usage.

> Maybe Oleksii has already a version doing that.
> 
> Cheers,
> 



V/r,
Daniel P. Smith
Apertus Solutions, LLC


