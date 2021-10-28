Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F4443E545
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 17:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218155.378473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg7RB-0003G6-V5; Thu, 28 Oct 2021 15:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218155.378473; Thu, 28 Oct 2021 15:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg7RB-0003EK-Ru; Thu, 28 Oct 2021 15:35:29 +0000
Received: by outflank-mailman (input) for mailman id 218155;
 Thu, 28 Oct 2021 15:35:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mg7RA-0003EE-NM
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 15:35:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg7R8-000219-PW; Thu, 28 Oct 2021 15:35:26 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.7.236.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg7R8-0002aP-JS; Thu, 28 Oct 2021 15:35:26 +0000
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
	bh=tm1fQqAazImqGUvQVkJgceZ7un+Txhyo0qJJW8MmxZ8=; b=glG4PC4tXyuA8Q3NSyF5K4HLrB
	ILNQNtzCed8T5pbJBdy8chnRjNv46Nw/OIWzublXA/31uXHZrTR9AqFA4JC7nQuGz/glqEnhsrBDc
	5tr13IYMoI6beUvYiMUNnMt9GyOkwztO0Uk/1Y7M+2cutidrJOt0M7/rLNORyC+JcR9U=;
Message-ID: <a74b52fb-6514-4187-17fe-b63236efa0ce@xen.org>
Date: Thu, 28 Oct 2021 16:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <65886734-7333-4469-fcc1-6916db708f13@xen.org>
 <b6bb02b6-6358-b5e0-1b80-7819aadabe10@epam.com>
 <6d8f1061-7aec-2c1a-aaf4-c30440c2797a@xen.org>
 <38da2edd-06a2-63d0-51ad-1284272c8da5@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <38da2edd-06a2-63d0-51ad-1284272c8da5@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 28/10/2021 16:27, Oleksandr Andrushchenko wrote:
> bridge as private and using info->gpa - GUEST_VPCI_ECAM_BASE...
> So, I would stay with simpler
> 
>       if ( bridge )
>          {
>              sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - bridge->cfg->phys_addr);
>              sbdf.seg = bridge->segment;
>          }
>          else
>              sbdf.sbdf = VPCI_ECAM_BDF(info->gpa - GUEST_VPCI_ECAM_BASE);

I am fine with that so long this is part of an helper (maybe 
vpci_sbdf_from_addr()) rather than duplicated.

Cheers,

-- 
Julien Grall

