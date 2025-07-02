Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96270AF65B4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 00:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031607.1405422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX6OC-0007E2-8l; Wed, 02 Jul 2025 22:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031607.1405422; Wed, 02 Jul 2025 22:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX6OC-0007Bi-5T; Wed, 02 Jul 2025 22:57:16 +0000
Received: by outflank-mailman (input) for mailman id 1031607;
 Wed, 02 Jul 2025 22:57:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uX6OA-0007Bc-Mi
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 22:57:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uX6O9-00EuiX-2z;
 Wed, 02 Jul 2025 22:57:13 +0000
Received: from [2a02:8012:3a1:0:d050:4cf0:af44:4b0]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uX6O9-009dfs-24;
 Wed, 02 Jul 2025 22:57:13 +0000
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
	bh=ai7n2TDzQ3WaFp+3OyJzYLXzek+cApjdAv7V7PVT9bA=; b=D0hA8sZMMYGkcwbwp+w97/DWAY
	IrC7KRSaBTvmajB46lB0OkCpo7bYg6zuriSuQiZbx5tbj7MtMZLVbHJ2JWJHzjdQG1lQzoQDxqKq9
	sSdReNE6sV3QJ2cboY4s9NzDRILsl5/0T0ol41LJUidKM2jy3UOyykEYT/p8oI58+Oi0=;
Message-ID: <7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org>
Date: Wed, 2 Jul 2025 23:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1751020456.git.mykola_kvach@epam.com>
 <072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola_kvach@epam.com>
 <066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org>
 <CAGeoDV-Zze2LtAdofS5EENkANH46SGU3+kqHkTB-k33MBmBXLQ@mail.gmail.com>
 <3cf697b8-9c23-4e24-980e-3f9696692bb4@xen.org>
 <CAGeoDV8_bB6Yrr0eLmUM562Q1CEsGuHXe7S5f6-yYwwwLdiXkg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAGeoDV8_bB6Yrr0eLmUM562Q1CEsGuHXe7S5f6-yYwwwLdiXkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mykola,

On 02/07/2025 23:27, Mykola Kvach wrote:
> On Wed, Jul 2, 2025 at 3:28 PM Julien Grall <julien@xen.org> wrote:
>> Why should we return an error? This is valid for a 64-bit domain to use
>> SMC32 convention.
> 
> I mean — in that case, is it possible that the upper 32 bits are set to
> non-zero values without it being an explicit error from the guest?
> 
> In my code, the macro used to extract 64-bit values (on 64-bit Xen, of
> course) just copies values from the Xn registers directly.
> 
> According to the SMC Calling Convention specification:
> "System Software on ARM Platforms" (ARM DEN 0028A), we must use Wn
> for SMC32 parameters in AArch64.

The version A is more than 12 years old. You want to use the latest 
version. From the SMCCC DEN0028G [1] section 3.1 (Register use in 
AArch64 SMC and HVC calls):

"
The working size of the register is identified by its name:
• Xn: All 64-bits are used.
• Wn: The least significant 32-bits are used, and the most significant 
32-bits are zero. Implementations must
ignore the most significant bits.
"

So...

> 
> AFAIK, writing to Wn zeroes the top 32 bits of Xn. So, if the guest
> is properly using 32-bit values for arguments, the upper bits will already
> be zeroed.

... while the guest should write 0 in the top 32-bit, we should not 
reject not reject non-zero values nor do nothing. Instead we should 
ignore the top bits.

Also, per the Arm Arm (ARM DDI 0487J.a) page D1-5406, it is 
implementation defined on whether the top 32-bits are zeroed when the 
previous exception context was AArch32. Xen will zero them on entry to 
avoid any surprise (see [2]), but that's only guarantee if this is a 
32-bit domain (running either on 64-bit or 32-bit Xen) as SMC can only 
be called from EL1.

As a side note, KVM is also ignoring the top 32-bits (see [3]).

Cheers,

[1] https://developer.arm.com/documentation/den0028/gbet0/?lang=en
[2] 
https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=32365f3476ac4655f2f26111cd7879912808cd77
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kvm/psci.c#n223

-- 
Julien Grall


