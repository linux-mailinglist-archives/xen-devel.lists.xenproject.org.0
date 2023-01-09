Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3669C6623DD
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 12:11:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473509.734150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEq3Z-0007td-M6; Mon, 09 Jan 2023 11:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473509.734150; Mon, 09 Jan 2023 11:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEq3Z-0007rs-JN; Mon, 09 Jan 2023 11:11:09 +0000
Received: by outflank-mailman (input) for mailman id 473509;
 Mon, 09 Jan 2023 11:11:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEq3X-0007rP-DZ
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 11:11:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEq3W-0003AP-VX; Mon, 09 Jan 2023 11:11:06 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.1.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEq3W-0005QZ-Pg; Mon, 09 Jan 2023 11:11:06 +0000
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
	bh=jLnrsMX/pCyW46cSp4wgU/f2FHoQ8Rm/20It4O8+GC8=; b=qwUKTfCHQclWFAHe3ZmCwvqcBd
	06+n2WR1UnIaPq7+t1BJoKYHH3a0mg6mer6lsuNnPI50YnMqLyt8adP0KZhOBNybboLiF+W4nmcac
	42me4AxxdRKNlIQMkywhoQ/2aJ4JnV9Y5h4O7gJIEMWBbjjolMO7i6qCCptQqFMSUf+M=;
Message-ID: <5531505f-b04b-7b70-68da-18d804790c25@xen.org>
Date: Mon, 9 Jan 2023 11:11:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
 <d77e7617-5263-0072-4786-ba6144247a4b@xen.org>
 <0475c058d0655f5b7b245f19b20c5ef0f14b3618.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0475c058d0655f5b7b245f19b20c5ef0f14b3618.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 09/01/2023 09:04, Oleksii wrote:
> On Fri, 2023-01-06 at 13:40 +0000, Julien Grall wrote:
>> Hi,
>>
>> On 06/01/2023 13:14, Oleksii Kurochko wrote:
>>> The patch introduce sbi_putchar() SBI call which is necessary
>>> to implement initial early_printk
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>    xen/arch/riscv/Makefile          |  1 +
>>>    xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
>>>    xen/arch/riscv/sbi.c             | 44
>>> ++++++++++++++++++++++++++++++++
>>
>> IMHO, it would be better to implement sbi.c in assembly so you can
>> use
>> print in the console before you jump to C world.
>>
> I thought that we can live with C version as we set up stack from the
> start and then we can call early_printk() from assembly code too.
> Is it bad approach?

It depends on how early you want to call it. For Arm, we chose to use 
assembly because the C code may not be PIE (and even with PIE it may 
need some relocation work).

Andrew suggested that this may not be a problem with RISC-V. I have 
looked a bit more around and notice that the kernel is also calling some 
C function very early (like setup_vm()). But they ensure that the code 
is built with -mcmodel=medany.

It looks like you are already building Xen with this option. So all 
looks good for RISC-V. That said, I would suggest to check that 
__riscv_cmodel_medany is defined in files where you implement C function 
called from early assembly code.

Cheers,

-- 
Julien Grall

