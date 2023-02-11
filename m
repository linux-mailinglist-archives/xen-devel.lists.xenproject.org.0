Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF7692F9D
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 09:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493814.763843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQlfP-0005DE-Cd; Sat, 11 Feb 2023 08:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493814.763843; Sat, 11 Feb 2023 08:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQlfP-0005Ay-96; Sat, 11 Feb 2023 08:55:31 +0000
Received: by outflank-mailman (input) for mailman id 493814;
 Sat, 11 Feb 2023 08:55:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQlfN-0005As-T3
 for xen-devel@lists.xenproject.org; Sat, 11 Feb 2023 08:55:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQlfM-0001rd-Uk; Sat, 11 Feb 2023 08:55:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQlfM-0001Ot-KS; Sat, 11 Feb 2023 08:55:28 +0000
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
	bh=5G7KwCSiIP7XCMQmUXY3BXjgv/lGoB507b4BGIsiNpI=; b=sq/aJn0XssTrnsQTtqnJDFHtJE
	XDH8g7aLPDj1Qu/LS6HfE4OH2ZESYJVxW6LcPLumfIFr2mUv+KM8Gjvpwf+bfIoa3rc0X1jTGku+v
	cBQ7epbmxeSIFH/lvin2Xglu+IKi6RXWt0Yf3mVtuWvv+zHoc7eHvi6F1rZcZ60kdZqg=;
Message-ID: <781a1beb-8a62-9623-a239-54586fc82dd2@xen.org>
Date: Sat, 11 Feb 2023 08:55:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v3 1/9] xen/ns16550: Remove unneeded truncation check in the
 DT init code
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230208120529.22313-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan

On 08/02/2023 12:05, Ayan Kumar Halder wrote:
> In an earlier commit (7c1de0038895), "ns16550.io_size" was u32 and
> "io_size" was u64. Thus, the ASSERT() was needed to check if the values
> are the same.
> However, in a later commit (c9f8e0aee507), "ns16550.io_size" was changed
> to u64. Thus, the ASSERT() became redundant.
> 
> So, now as "io_size" and "uart->io_size" are both u64, there will be no
> truncation. Thus, one can remove the ASSERT() and extra assignment.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

