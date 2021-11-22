Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA14593DC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 18:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229026.396369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpCwE-0006vr-Dz; Mon, 22 Nov 2021 17:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229026.396369; Mon, 22 Nov 2021 17:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpCwE-0006tF-An; Mon, 22 Nov 2021 17:17:06 +0000
Received: by outflank-mailman (input) for mailman id 229026;
 Mon, 22 Nov 2021 17:17:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpCwC-0006t9-H2
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 17:17:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpCwC-0004XA-15; Mon, 22 Nov 2021 17:17:04 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.28.80]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpCwB-0000Wj-Qm; Mon, 22 Nov 2021 17:17:03 +0000
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
	bh=ZvcLHIKqXFA32CFJwsthtRKvG6Ih2xu2CaSQxZi1LYA=; b=foVl3zbfXARx+5FDPWq6VPH5nj
	SPB1r5/lSfRm3rCLndvnlXvSOtOiBfmZ/M7JusI2hB0VKkM50dmvMAmqfHBv3sU+T58D7tEdLksLK
	u+yaEoD9KSpdcJGJ0TeTIiCmHNuOS+KmERQTeaIzUA7rfAzU4V7KaM5597QXpBb/q4+o=;
Message-ID: <9f8e424d-ad1c-2d32-a470-68b275adf22c@xen.org>
Date: Mon, 22 Nov 2021 17:17:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-3-andr2000@gmail.com>
 <86cabc8a-cbf2-84d4-4162-7d5591d127c5@xen.org>
 <de155886-d039-4c45-0407-47f38f8cd75d@epam.com>
 <ab95fc39-d1b2-be80-8245-85161a8271e1@xen.org>
 <072848c8-54da-cb73-3b8a-0c35826cc812@epam.com>
 <e66c4189-acdf-c32f-4b50-51c8aaab4efd@xen.org>
 <315b1308-5adc-c4f3-6150-1060dbac5f4f@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <315b1308-5adc-c4f3-6150-1060dbac5f4f@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/11/2021 16:23, Oleksandr Andrushchenko wrote:
> On 22.11.21 17:29, Julien Grall wrote:
>> I would prefer to go with my way. This can be refined in the future if we find Device-Tree that matches what you wrote.
> Ok, so just to make it clear:
>   >a PCI device would always be described as a child of the hostbridges. So I would rework the 'if' to also check if the parent type is not "pci"

That's correct. Thank you!

Cheers,

-- 
Julien Grall

