Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743D8300551
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 15:26:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72805.131160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2xOP-0002cg-FR; Fri, 22 Jan 2021 14:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72805.131160; Fri, 22 Jan 2021 14:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2xOP-0002cH-CC; Fri, 22 Jan 2021 14:26:29 +0000
Received: by outflank-mailman (input) for mailman id 72805;
 Fri, 22 Jan 2021 14:26:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2xOO-0002cC-Ir
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 14:26:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2xON-0000sI-SF; Fri, 22 Jan 2021 14:26:27 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2xON-0002lF-My; Fri, 22 Jan 2021 14:26:27 +0000
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
	MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=VXXEjxUWc27YXPt6Dcbx+wV2yohvxAT/qwCO9fqBp4c=; b=uNPrPGwru47X2OtwqEi25kCu5b
	/T+wIyevLmGHENH8n5j25kMaJX0rVhvmAhdTjp+GuS85hiYXnWaMGazr5pR45r4Cuq5pjLKMTGI8a
	XfpyevRyohULX53x43I7nSlQFSQf56CjFkVfS/WADhqFmoZxGeATIvuEcjJS6lGT38mY=;
Subject: Re: Null scheduler and vwfi native problem
To: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
From: Julien Grall <julien@xen.org>
Message-ID: <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
Date: Fri, 22 Jan 2021 14:26:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Anders,

On 22/01/2021 08:06, Anders Törnqvist wrote:
> On 1/22/21 12:35 AM, Dario Faggioli wrote:
>> On Thu, 2021-01-21 at 19:40 +0000, Julien Grall wrote:
> - booting with "sched=null vwfi=native" but not doing the IRQ 
> passthrough that you mentioned above
> "xl destroy" gives
> (XEN) End of domain_destroy function
> 
> Then a "xl create" says nothing but the domain has not started correct. 
> "xl list" look like this for the domain:
> mydomu                                   2   512     1 ------       0.0

This is odd. I would have expected ``xl create`` to fail if something 
went wrong with the domain creation.

The list of dash, suggests that the domain is:
    - Not running
    - Not blocked (i.e cannot run)
    - Not paused
    - Not shutdown

So this suggest the NULL scheduler didn't schedule the vCPU. Would it be 
possible to describe your setup:
   - How many pCPUs?
   - How many vCPUs did you give to dom0?
   - What was the number of the vCPUs given to the previous guest?

One possibility is the NULL scheduler doesn't release the pCPUs until 
the domain is fully destroyed. So if there is no pCPU free, it wouldn't 
be able to schedule the new domain.

However, I would have expected the NULL scheduler to refuse the domain 
to create if there is no pCPU available.

@Dario, @Stefano, do you know when the NULL scheduler decides to 
allocate the pCPU?

Cheers,

-- 
Julien Grall

