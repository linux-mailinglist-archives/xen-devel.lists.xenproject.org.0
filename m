Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A85FF29410B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 19:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9737.25655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUv3H-0002sM-KH; Tue, 20 Oct 2020 17:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9737.25655; Tue, 20 Oct 2020 17:03:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUv3H-0002rx-GL; Tue, 20 Oct 2020 17:03:59 +0000
Received: by outflank-mailman (input) for mailman id 9737;
 Tue, 20 Oct 2020 17:03:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kUv3F-0002rs-Ve
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 17:03:58 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29440690-6e8f-4eee-b653-7a69fd20a5f8;
 Tue, 20 Oct 2020 17:03:57 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUv3C-0008Ts-Fo; Tue, 20 Oct 2020 17:03:54 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUv3C-00068R-61; Tue, 20 Oct 2020 17:03:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kUv3F-0002rs-Ve
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 17:03:58 +0000
X-Inumbo-ID: 29440690-6e8f-4eee-b653-7a69fd20a5f8
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 29440690-6e8f-4eee-b653-7a69fd20a5f8;
	Tue, 20 Oct 2020 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=d+ED780SRrgtW5AzBF5UzDm/edLZ4md3isLRUfT2hzc=; b=EYB12XpSHayXTI6m7WUrNxBK6D
	0mgHAVceGy7B74diSAL1m+drgAj9RgT53uMixZKh6eOiUjGP+NbkUvfaqYHrjMFY7F8/pBtTFM588
	XUnzj7PkD+ul8Pg8ENV3ss6GAh4R7y0am4NRVY2eSSWW8pZNiWMIWWLWeeIVpk66cxu0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUv3C-0008Ts-Fo; Tue, 20 Oct 2020 17:03:54 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUv3C-00068R-61; Tue, 20 Oct 2020 17:03:54 +0000
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
Date: Tue, 20 Oct 2020 18:03:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

Thank you for the contribution. Lets make sure this attempt to SMMUv3 
support in Xen will be more successful than the other one :).

I haven't reviewed the code yet, but I wanted to provide feedback on the 
commit message.

On 20/10/2020 16:25, Rahul Singh wrote:
> Add support for ARM architected SMMUv3 implementations. It is based on
> the Linux SMMUv3 driver.
> 
> Major differences between the Linux driver are as follows:
> 1. Only Stage-2 translation is supported as compared to the Linux driver
>     that supports both Stage-1 and Stage-2 translations.
> 2. Use P2M  page table instead of creating one as SMMUv3 has the
>     capability to share the page tables with the CPU.
> 3. Tasklets is used in place of threaded IRQ's in Linux for event queue
>     and priority queue IRQ handling.

Tasklets are not a replacement for threaded IRQ. In particular, they 
will have priority over anything else (IOW nothing will run on the pCPU 
until they are done).

Do you know why Linux is using thread. Is it because of long running 
operations?

> 4. Latest version of the Linux SMMUv3 code implements the commands queue
>     access functions based on atomic operations implemented in Linux.

Can you provide more details?

>     Atomic functions used by the commands queue access functions is not
>     implemented in XEN therefore we decided to port the earlier version
>     of the code. Once the proper atomic operations will be available in XEN
>     the driver can be updated.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/drivers/passthrough/Kconfig       |   10 +
>   xen/drivers/passthrough/arm/Makefile  |    1 +
>   xen/drivers/passthrough/arm/smmu-v3.c | 2847 +++++++++++++++++++++++++
>   3 files changed, 2858 insertions(+)

This is quite significant patch to review. Is there any way to get it 
split (maybe a verbatim Linux copy + Xen modification)?

Cheers,

-- 
Julien Grall

