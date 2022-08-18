Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C31597FA2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 09:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389353.626211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOaP9-0005Ch-BB; Thu, 18 Aug 2022 07:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389353.626211; Thu, 18 Aug 2022 07:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOaP9-00059w-7v; Thu, 18 Aug 2022 07:57:27 +0000
Received: by outflank-mailman (input) for mailman id 389353;
 Thu, 18 Aug 2022 07:57:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOaP7-00059p-ME
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 07:57:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOaP4-0001kA-Vb; Thu, 18 Aug 2022 07:57:22 +0000
Received: from [54.239.6.188] (helo=[192.168.18.101])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOaP4-00051X-Ny; Thu, 18 Aug 2022 07:57:22 +0000
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
	bh=lcfGZRDFvfbTZ7AzGQohreX7bJMIJrH70wGRs/n+Ol8=; b=Is3/b0mLV+ObFw+S4BxEluonl2
	/ClUW2cPx8kHeI0jSm/cvPEDE9YIMaESmq7Hi/hQGKyKfuDTrgtLio+DMLa9A9ejnIIRBlcsSX8S2
	Fby5aIjEGO8IkUwl7/xbWVv5VQjCYJhZ5/4rz+bCJh2cWmAM1Rzx6JJjc89WK0NUyuUk=;
Message-ID: <5afa9c15-d7c5-2fb7-ed14-bd8839c4d42d@xen.org>
Date: Thu, 18 Aug 2022 08:57:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>, Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Peter Griffin <peter.griffin@linaro.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>
References: <20220817105720.111618-1-leo.yan@linaro.org>
 <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <Yv3rc7vNCmTrFdgB@leoy-yangtze.lan>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Yv3rc7vNCmTrFdgB@leoy-yangtze.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leo,

On 18/08/2022 08:34, Leo Yan wrote:
> On Wed, Aug 17, 2022 at 03:17:53PM +0200, Jan Beulich wrote:
>> Furthermore - what if Linux decided to change their structure? Or
>> is there a guarantee that they won't? Generally such structures
>> belong in the public interface, guaranteeing forward compatibility
>> even if Linux decided to change / extend theirs (at which point
>> consuming code there would need to do translation, but maybe using
>> a Xen-defined struct [plus translation in Linux] right away would
>> be best).
> 
> I saw Ard has helped to answer this question in his email.  As Ard
> said, the general way is to rely on Linux EFI stub to allocate the
> data structure for MEMRESERVE configuration table.
> 
> Given Xen uses pseudo EFI booting (the ACPI table is passed via DT), in
> short term I don't think Xen can support Linux EFI stub,

I agree that using Linux EFI stub will require more effort. I would also 
need to go through the mailing list archives (or maybe Stefano 
remember?) to understand why we decided against using the EFI stub.

> so we need to
> maintain this structure in Xen as well.

I have looked at the commit message. IIUC, if this table is not created 
then Kexec will not work. Is there anything else that would not work?

IOW, would Linux be unusable if we don't create MEMRESERVE?

> 
> This structure eventually will not change frequently, so I assume
> later we will have little effort for maintainence it
The problem is not really "maintainance" here. It is more that if Linux 
is updating the structure in a non-backward compatible way, then new
version of Linux would not boot on older Xen.

We would have similar probable with new Xen booting older Xen because 
the hypervisor doesn't know (and should not need to know) which OS is used.

In the nutshells, Xen should only use stable interface. If MEMRESERVE is 
really necessary then we should either switch to the Linux EFI stub or 
standardize MEMRESERVE.

Cheers,

-- 
Julien Grall

