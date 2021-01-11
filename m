Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237062F1008
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 11:26:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64748.114438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyuOB-0007LO-2D; Mon, 11 Jan 2021 10:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64748.114438; Mon, 11 Jan 2021 10:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyuOA-0007Kz-VZ; Mon, 11 Jan 2021 10:25:30 +0000
Received: by outflank-mailman (input) for mailman id 64748;
 Mon, 11 Jan 2021 10:25:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kyuO9-0007Ku-Ad
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 10:25:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyuO8-0001Sv-JK; Mon, 11 Jan 2021 10:25:28 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyuO8-0004gZ-Bh; Mon, 11 Jan 2021 10:25:28 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=i6ySu0MC4Ssvl955hQ3BBEnxxT3ZYkNm1l3nSml2kbE=; b=WbC+CR9qVwM7QJ9XULrUhiJRA3
	5gC+8ef3BhD4tfTebpbjX/4vFyTIvUWE9sxm3hHbgPNWCQp3yo35dfl78ri9gON559HpPRAFaOEz0
	u2DZzAJj01DwaCSIHteMSyIGsvy/6LbumFLvVFWtemGkGi+4S4yX5R/RxyCbpKhRuLOc=;
Subject: Re: [PATCH v2] xen/arm: do not read MVFR2 when is not defined
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, bertrand.marquis@arm.com
Cc: Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Andr=c3=a9_Przywara?=
 <andre.przywara@arm.com>
References: <20210108192243.25889-1-sstabellini@kernel.org>
 <f90e40ee-b042-6cc5-a08d-aef41a279527@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <dce8bed2-db66-b032-06a9-86c8f80d26aa@xen.org>
Date: Mon, 11 Jan 2021 10:25:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f90e40ee-b042-6cc5-a08d-aef41a279527@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/01/2021 08:49, Jan Beulich wrote:
> On 08.01.2021 20:22, Stefano Stabellini wrote:
>> MVFR2 is not available on ARMv7. It is available on ARMv8 aarch32 and
>> aarch64. If Xen reads MVFR2 on ARMv7 it could crash.
>>
>> Avoid the issue by doing the following:
>>
>> - define MVFR2_MAYBE_UNDEFINED on arm32
>> - if MVFR2_MAYBE_UNDEFINED, do not attempt to read MVFR2 in Xen
>> - keep the 3rd register_t in struct cpuinfo_arm.mvfr on arm32 so that a
>>    guest read to the register returns '0' instead of crashing the guest.
>>
>> '0' is an appropriate value to return to the guest because it is defined
>> as "no support for miscellaneous features".
>>
>> Aarch64 Xen is not affected by this patch.
> 
> But it looks to also be affected by ...

AFAICT, the smoke test passed on Laxton0 (AMD Seattle) [1] over the 
week-end.

>> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
> 
> ... this, faulting (according to osstest logs) early during boot on

The xen-unstable flight [2] ran on Rochester0 (Cavium Thunder-X). So 
this has something to do with the platform.

The main difference is AMD Seattle supports AArch32 while Cavium 
Thunder-X doesn't.

> 000000000025D314	mrs	x1, id_pfr2_el1
This register contains information for the AArch32 state.

AFAICT, the Arm Arm back to at least ARM DDI 0487A.j (published in 2016) 
described the encoding as Read-Only. So I am not sure why we receive an 
UNDEF here, the more it looks like ID_PFR{0, 1}_EL1 were correctly accessed.

Andre, Bertrand, do you have any clue?

However, most of the AArch32 ID registers are UNKNOWN on platform not 
implementing AArch32. So we may want to conditionally skip the access to 
AArch32 state.

Cheers,

[1] 
http://logs.test-lab.xenproject.org/osstest/logs/158293/test-arm64-arm64-xl-xsm/info.html

> 
> Jan
> 

[1]


-- 
Julien Grall

