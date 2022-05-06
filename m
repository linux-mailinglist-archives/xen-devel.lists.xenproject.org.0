Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E8451DD74
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 18:18:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323346.544939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn0dj-00055E-W8; Fri, 06 May 2022 16:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323346.544939; Fri, 06 May 2022 16:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn0dj-00052z-TM; Fri, 06 May 2022 16:17:11 +0000
Received: by outflank-mailman (input) for mailman id 323346;
 Fri, 06 May 2022 16:17:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nn0di-00052t-62
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 16:17:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nn0dh-0002Yq-F8; Fri, 06 May 2022 16:17:09 +0000
Received: from [54.239.6.185] (helo=[192.168.5.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nn0dh-0004f2-8S; Fri, 06 May 2022 16:17:09 +0000
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
	bh=4PsJ2p8gl2WRLAkuRh83cgXpd+XbhZBgagZHQm4qswo=; b=mQacDNdgs+8dxE2FZ6j6gJ61fm
	hqUPczqLF9K4Z2m2rFFwKk7N0+5Wp1p502rT0+GCw6EoBkJlSTVltHo4m5v3Ds420w4TXqlLZCgbO
	IRpPR6vCn0WyAP16Z/O04+HSSyeonoyaioNnDF2Sao3m0sOS0l/9IFhghEeqsYowSRtg=;
Message-ID: <96d997d5-d4ea-3db4-c331-0813a0af3907@xen.org>
Date: Fri, 6 May 2022 17:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] xen: io: Fix race between sending an I/O and domain
 shutdown
To: paul@xen.org, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220505175131.81457-1-julien@xen.org>
 <2bbdb007-1a28-67ea-0801-fa471bb6e416@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2bbdb007-1a28-67ea-0801-fa471bb6e416@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/05/2022 15:09, Durrant, Paul wrote:
> On 05/05/2022 18:51, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Xen provides hypercalls to shutdown (SCHEDOP_shutdown{,_code}) and
>> resume a domain (XEN_DOMCTL_resumedomain). They can be used for 
>> checkpoint
>> where the expectation is the domain should continue as nothing happened
>> afterwards.
>>
>> hvmemul_do_io() and handle_pio() will act differently if the return
>> code of hvm_send_ioreq() (resp. hvmemul_do_pio_buffer()) is 
>> X86EMUL_RETRY.
>>
>> In this case, the I/O state will be reset to STATE_IOREQ_NONE (i.e
>> no I/O is pending) and/or the PC will not be advanced.
>>
>> If the shutdown request happens right after the I/O was sent to the
>> IOREQ, then emulation code will end up to re-execute the instruction
>> and therefore forward again the same I/O (at least when reading IO port).
>>
>> This would be problem if the access has a side-effect. A dumb example,
>> is a device implementing a counter which is incremented by one for every
>> access. When running shutdown/resume in a loop, the value read by the
>> OS may not be the old value + 1.
>>
>> Add an extra boolean in the structure hvm_vcpu_io to indicate whether
>> the I/O was suspend. This is then used in place of checking the domain
>> is shutting down in hvmemul_do_io() and handle_pio() as they should
>> act on suspend (i.e. vcpu_start_shutdown_deferral() returns false) rather
>> than shutdown.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks! I have committed it.

Cheers,

-- 
Julien Grall

