Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE6610C84
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 10:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431801.684395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooL9S-0000FD-4r; Fri, 28 Oct 2022 08:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431801.684395; Fri, 28 Oct 2022 08:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooL9S-0000Cu-0A; Fri, 28 Oct 2022 08:55:42 +0000
Received: by outflank-mailman (input) for mailman id 431801;
 Fri, 28 Oct 2022 08:55:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ooL9Q-0000Ch-DZ
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 08:55:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooL9Q-0007IP-1i; Fri, 28 Oct 2022 08:55:40 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.25.146]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooL9P-0002oa-Pr; Fri, 28 Oct 2022 08:55:39 +0000
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
	bh=AkHKQZ6aXnwWexnNXhlbp/uq1TzfvSB/NTILqeB2Z0U=; b=eM9BqNlg8ivVMKladcMPlX53Tl
	Uyuf/brA3Lz4UvdhANUKBImtCzDTFzpfYj2QVi/Prpv1OZGYsTv9dp8xz+UIwyJeIHnpWDb1XBGbW
	cWgXL5nPbvTct8AfYT8IMDKy+JxNPTNazDzDZVeYVhwV6XZf0syMXX+Hilwfhy/2ZzR0=;
Message-ID: <ef4cf2ac-7b79-e0c2-6e29-b24154c9379f@xen.org>
Date: Fri, 28 Oct 2022 09:55:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: =?UTF-8?B?W2Zvci00LjE3XcKgUmU6IFtYRU4gdjFdIHhlbi9hcm06IHZHSUN2Mzog?=
 =?UTF-8?Q?Restore_the_interrupt_state_correctly?=
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Ayan Kumar Halder <ayankuma@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 stefanos@xilinx.com, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 Henry.Wang@arm.com
References: <20221027190913.65413-1-ayankuma@amd.com>
 <20221027215316.768881c9@slackpad.lan>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221027215316.768881c9@slackpad.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/10/2022 21:53, Andre Przywara wrote:
> On Thu, 27 Oct 2022 20:09:13 +0100
> Ayan Kumar Halder <ayankuma@amd.com> wrote:
> 
> Hi,
> 
>> As "spin_lock_irqsave(&v->arch.vgic.lock, flags)" saves the current interrupt
>> state in "flags", "spin_unlock_irqrestore(&v->arch.vgic.lock, flags)" should be
>> used to restore the saved interrupt state.
>>
>> Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and property tables")
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> 
> Thanks for fixing this!
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Henry, this is fixing a bug in the ITS. The feature is at the moment 
experiement and the code is not used by other subystem, so technically 
not necessary for 4.17. But if you still accept any bug fix (I know we 
are close to the release), then I would like to request to include. It 
should be risk free.

Cheers,

Cheers,

-- 
Julien Grall

