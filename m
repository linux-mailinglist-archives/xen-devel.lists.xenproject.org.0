Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEED64185D
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 19:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452700.710470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1WtC-00061a-Vf; Sat, 03 Dec 2022 18:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452700.710470; Sat, 03 Dec 2022 18:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1WtC-0005zM-Su; Sat, 03 Dec 2022 18:05:26 +0000
Received: by outflank-mailman (input) for mailman id 452700;
 Sat, 03 Dec 2022 18:05:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1WtA-0005zG-Tc
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 18:05:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1WtA-00087I-28; Sat, 03 Dec 2022 18:05:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1Wt9-00050d-RE; Sat, 03 Dec 2022 18:05:23 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=HBJHwd4eXimrdHKa4bDKbQysTBhT8BawdrXgltdwQu0=; b=5P8zcAOA9rZI4WWtM1PK7MTeA8
	eZdhFClRvfRLhdlkt1QfixE8OJEAQxirYDf5+wjntHYhr2mt40WWC3eWDAN7G9Qy4znfkJBl5WxJR
	UqJ3URzbnwndSHDTUCOifDPTxYpcW6WNcagJ4+BTCrqA+29xGpkZgXLlUwvKoYg+V9h8=;
Message-ID: <adc5e471-5fe4-73cc-267f-196f5aed52b9@xen.org>
Date: Sat, 3 Dec 2022 18:05:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org
References: <20221201173121.33865-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v1] xen/Arm: Remove the extra assignment
In-Reply-To: <20221201173121.33865-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

Title: It suggests that this is modifying arch/arm whereas you are 
updating the Arm part of the ns16550 driver.

In addition to that, from a reader PoV, it is more important to emphase 
on the fact the truncation check is removed rather than the extra 
assignment.

So I would suggest the following title:

xen/ns16550: Remove unneeded truncation check in the DT init code

On 01/12/2022 17:31, Ayan Kumar Halder wrote:
> As "io_size" and "uart->io_size" are both u64, so there will be no truncation.
> Thus, one can remove the ASSERT() and extra assignment.
> 
> In an earlier commit (7c1de0038895cbc75ebd0caffc5b0f3f03c5ad51),

Please use 12-digit hash and provide the commit title.

> "ns16550.io_size" was u32 and "io_size" was u64. Thus, the ASSERT() was needed
> to check if the values are the same.
> However, in a later commit (c9f8e0aee507bec25104ca5535fde38efae6c6bc),

Ditto.

> "ns16550.io_size" was changed to u64. Thus, the ASSERT() became redundant.

Those two paragraphs explaining your reasoning why the truncation check 
is removed. So I think they should be moved first. Then you can add the 
initial paragraph to explain the resolution.

However... I wonder whether it would not be better to switch 'io_size' 
to paddr_t because, as you said earlier one, on 32-bit ARMv8-R the 
address is 32-bit. Therefore:
  1. it sounds pointless to store the size using 64-bit
  2. the truncation check still make sense (maybe hardened) in the 
32-bit ARMv8-R to catch buggy DT.

Cheers,

-- 
Julien Grall

