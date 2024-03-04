Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19D4870778
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 17:46:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688464.1072604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBSg-00081P-2G; Mon, 04 Mar 2024 16:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688464.1072604; Mon, 04 Mar 2024 16:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBSf-0007ys-VN; Mon, 04 Mar 2024 16:46:45 +0000
Received: by outflank-mailman (input) for mailman id 688464;
 Mon, 04 Mar 2024 16:46:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rhBSf-0007yd-5Q
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 16:46:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhBSZ-0003VU-C1; Mon, 04 Mar 2024 16:46:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhBSZ-0002yb-6T; Mon, 04 Mar 2024 16:46:39 +0000
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
	bh=V7Ujo7GmuwqZz0sSemhtsATPgA/frtSwwN4i/1VZBcs=; b=rjFBC2iSRQwwrJbD1Jnc5pw4q0
	27GhCUAbtQGbMBYFLdAfVkdi0BwUKDWffH/iVs3zpU4HUY6qbvM32iNo0rkjWOvy2xjgQdu0Wzxvw
	DTwbiODtxjblOU4KBtph34VOhxeDlzGuNGGfRtfPGinqXc323o8++EwV1tJWWUaREYNU=;
Message-ID: <5c06c437-b62c-4bee-8694-1be597887718@xen.org>
Date: Mon, 4 Mar 2024 16:46:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
 <c9f92495-2c00-443f-bffd-1b09cb8a8c84@xen.org>
 <d343c58c-2a3a-45a9-8d67-64d1506d973c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d343c58c-2a3a-45a9-8d67-64d1506d973c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/03/2024 16:41, Jan Beulich wrote:
> On 04.03.2024 17:31, Julien Grall wrote:
>> On 04/03/2024 16:10, Andrew Cooper wrote:
>>> It is daft to require all architectures to provide empty implementations of
>>> this functionality.
>>
>> Oleksii recenlty sent a similar patch [1]. This was pushed back because
>> from naming, it sounds like the helpers ought to be non-empty on every
>> architecture.
>>
>> It would be best if asm-generic provides a safe version of the helpers.
>> So my preference is to not have this patch. This can of course change if
>> I see an explanation why it is empty on Arm (I believe it should contain
>> csdb) and other arch would want the same.
> 
> Except that there's no new asm-generic/ header here (as opposed to how
> Oleksii had it). Imo avoiding the need for empty stubs is okay this way,
> when introducing an asm-generic/ header would not have been. Of course
> if Arm wants to put something there rather sooner than later, then
> perhaps the functions better wouldn't be removed from there, just to then
> be put back pretty soon.

I am confused. I agree the patch is slightly different, but I thought 
the fundamental problem was the block_speculation() implementation may 
not be safe everywhere. And it was best to let each architecture decide 
how they want to implement (vs Xen decide for us the default).

Reading the original thread, I thought you had agreed with that 
statement. Did I misinterpret?

Cheers,

-- 
Julien Grall

