Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A384879ED6
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 23:34:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692208.1079089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkAh2-00055v-Dc; Tue, 12 Mar 2024 22:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692208.1079089; Tue, 12 Mar 2024 22:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkAh2-00054P-Ay; Tue, 12 Mar 2024 22:33:56 +0000
Received: by outflank-mailman (input) for mailman id 692208;
 Tue, 12 Mar 2024 22:33:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rkAh1-00054J-6F
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 22:33:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkAh0-0005Ml-PI; Tue, 12 Mar 2024 22:33:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.154])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkAh0-0000WU-Hp; Tue, 12 Mar 2024 22:33:54 +0000
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
	bh=Xuqs4VS19SCppjtBHqwvkqmRQwOhWsFXBhEAXtiEhf0=; b=63yNCjM3XFWBczoNSxA7VgrUi6
	tzuVLw+ZNRVxFOh6J2LuKEMhKpgsYjAcgdpi7kLo8ui4eifKOLKnjHkUoxXFqs33R5zIWwOp5XzB4
	hBhekkT7LxRwDBO0YdlAajcIWdWa4WxlR0u8jLpreJJ3/0LTOW7VeI+v3MPszr99TgRE=;
Message-ID: <a60c8977-8a62-475f-a392-8f0c75bcd6c7@xen.org>
Date: Tue, 12 Mar 2024 22:33:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v6 3/3] xen/arm: arm32: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20240307123943.1991755-1-ayan.kumar.halder@amd.com>
 <20240307123943.1991755-4-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240307123943.1991755-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 07/03/2024 12:39, Ayan Kumar Halder wrote:
> When user enables HVC_DCC config option in Linux, it invokes access to debug
> transfer register (i.e. DBGDTRTXINT). As this register is not emulated, Xen
> injects an undefined exception to the guest and Linux crashes.
> 
> To prevent this crash, introduce a partial emulation of DBGDTR[TR]XINT (these
> registers share the same encoding) as RAZ/WI and DBGDSCRINT as TXfull.
> 
> Refer ARM DDI 0487J.a ID042523, G8.3.19, DBGDTRTXint:
> "If TXfull is set to 1, set DTRTX to UNKNOWN".
> 
> As a pre-requisite, DBGOSLSR should be emulated in the same way as its AArch64
> variant (i.e. OSLSR_EL1). This is to ensure that DBGOSLSR.OSLK is 0, which
> allows us to skip the emulation of DBGDSCREXT (TXfull is treated as UNK/SBZP)
> and focus on DBGDSCRINT. DBGOSLSR.OSLM[1] is set to 1 to mantain consistency
> with Arm64.
> 
> Take the opportunity to fix the minimum EL for DBGDSCRINT, which should be 0.

NIT: Strictly speaking Arm32 is using PL (Priviledge) rather than EL 
(Exception Level) to describe each level :).

Anyway,

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

