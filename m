Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C15890EA09
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 13:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743691.1150635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtoK-00047S-2s; Wed, 19 Jun 2024 11:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743691.1150635; Wed, 19 Jun 2024 11:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtoK-000451-0D; Wed, 19 Jun 2024 11:49:08 +0000
Received: by outflank-mailman (input) for mailman id 743691;
 Wed, 19 Jun 2024 11:49:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sJtoJ-00044v-0c
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 11:49:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sJtoH-00023M-Ci; Wed, 19 Jun 2024 11:49:05 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sJtoH-0002Jf-3h; Wed, 19 Jun 2024 11:49:05 +0000
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
	bh=UKkAlB3SFJ3I+sCkQThCeI/yDYr2MaKlnfJQ/w+dC+4=; b=1n5iyvtP+2We7sKT4gek0+GV4v
	AOUkGOMOtFy6ywFazgqSgEMheCcY+xDRJQ3is4vRhhFzQXTkjHRDMDVgGBKPTh2Cohw21calRl2v5
	7x7nCHa5gBwhYaDGM8UnyicICJdbR/QqdhT/LaJcLdPH2eDHDT7mTVRJ/wj731K/UiV4=;
Message-ID: <fb6809b3-ee14-4baa-b6fa-bd2171d61c4b@xen.org>
Date: Wed, 19 Jun 2024 12:49:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 Henry Wang <xin.wang2@amd.com>, Alec Kwapis <alec.kwapis@medtronic.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
 <20240524225522.2878481-2-stefano.stabellini@amd.com>
 <697aadfd-a8c1-4f1b-8806-6a5acbf343ba@xen.org>
 <b9c8e762af9ca04d9194fdaa0379f2fe9096af29.camel@gmail.com>
 <alpine.DEB.2.22.394.2406181734140.2572888@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2406181734140.2572888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 19/06/2024 01:37, Stefano Stabellini wrote:
> On Mon, 27 May 2024, Oleksii K. wrote:
>>> I don't think it is a big problem if this is not merged for the code
>>> freeze as this is technically a bug fix.
>>
>> Agree, this is not a problem as it is still looks to me as a bug fix.
>>
>> ~ Oleksii
> 
> Hi Oleksii, this version of the series was already all acked with minor
> NITs and you gave the go-ahead for this release as it is a bug fix. Due
> to 2 weeks of travels I only managed to commit the series now, sorry for
> the delay.

Unfortunately this series is breaking gitlab CI [1]. I understand the go 
ahead was given two weeks ago, but as we are now past the code freeze, I 
feel we should have had a pros/cons e-mail to assess whether it was 
worth the risk to merge it.

Now to the issues, I vaguely recall this series didn't require any 
change in Linux. Did I miss anything? If so, why are we breaking Linux?

For now, I will revert this series. Once we root cause the issue, we can 
re-assess whether the fix should be apply for 4.19.

Cheers,

[1] https://gitlab.com/xen-project/xen/-/pipelines/1338067978

-- 
Julien Grall

