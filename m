Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55CC4B2911
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 16:26:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270549.464870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIXof-0001iB-Fw; Fri, 11 Feb 2022 15:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270549.464870; Fri, 11 Feb 2022 15:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIXof-0001g0-AB; Fri, 11 Feb 2022 15:26:33 +0000
Received: by outflank-mailman (input) for mailman id 270549;
 Fri, 11 Feb 2022 15:26:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nIXod-0001fp-DO
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 15:26:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nIXoc-0002Eq-Vh; Fri, 11 Feb 2022 15:26:30 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.30.126]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nIXoc-0001eR-Pr; Fri, 11 Feb 2022 15:26:30 +0000
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
	bh=KTSoUtgjwSy7gl6uk/Mujrv4cOe4EP/gFFPDHqVbYj0=; b=cEMn2gtqhXpzWVySrQJURQiovT
	Ozr1I5dupZhL6jadjnIAuj9XxFWip5nnZOqtqXV/IonXlRCYeRsyskFD7SeXXYQKEBFlaALypnMVW
	8UccRuIjgZ2aHHxtukuhJP4aadW3z9Cy9/BPKDqSE0trd94ae69xrPXXAIZEpU7esumU=;
Message-ID: <81a2f978-9337-2e58-c8b2-86dc7defc2ec@xen.org>
Date: Fri, 11 Feb 2022 15:26:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC PATCH] arm/vgic-v3: provide custom callbacks for
 pend_lpi_tree radix tree
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220211150042.11972-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220211150042.11972-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 11/02/2022 15:00, Luca Fancellu wrote:
> pend_lpi_tree is a radix tree used to store pending irqs, the tree is
> protected by a lock for read/write operations.
> 
> Currently the radix tree default function to free items uses the
> RCU mechanism, calling call_rcu and deferring the operation.
> 
> However every access to the structure is protected by the lock so we
> can avoid using the default free function that, by using RCU,
> increases memory usage and impacts the predictability of the system.

I understand goal but looking at the implementation of 
vgic_v3_lpi_to_pending() (Copied below for convenience). We would 
release the lock as soon as the look-up finish, yet the element is returned.

static struct pending_irq *vgic_v3_lpi_to_pending(struct domain *d,
                                                   unsigned int lpi)
{
     struct pending_irq *pirq;

     read_lock(&d->arch.vgic.pend_lpi_tree_lock);
     pirq = radix_tree_lookup(&d->arch.vgic.pend_lpi_tree, lpi);
     read_unlock(&d->arch.vgic.pend_lpi_tree_lock);

     return pirq;
}

So the lock will not protect us against removal. If you want to drop the 
RCU, you will need to ensure the structure pending_irq is suitably 
protected. I haven't check whether there are other locks that may suit 
us here.

Cheers,

-- 
Julien Grall

