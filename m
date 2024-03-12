Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E272E879EA4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 23:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692204.1079080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkAbF-0003Dt-Qa; Tue, 12 Mar 2024 22:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692204.1079080; Tue, 12 Mar 2024 22:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkAbF-0003B5-NZ; Tue, 12 Mar 2024 22:27:57 +0000
Received: by outflank-mailman (input) for mailman id 692204;
 Tue, 12 Mar 2024 22:27:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rkAbD-0003Ax-Vr
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 22:27:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkAbD-0005Gt-NP; Tue, 12 Mar 2024 22:27:55 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.154])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkAbD-0000C1-GY; Tue, 12 Mar 2024 22:27:55 +0000
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
	bh=wx58u5A4dqH0TFASEF8vCfseQWDddu8UgJ4sVMAUW0Y=; b=hW7mg9nxE6iU21lYxctot0duvY
	of0NzY2xP//e9/LMUJ+hgNfHbbtV480GtGwlaDPVKnNwNJGsBqPwrJflmdBrb1P/BEgJw+iZx4+TF
	M6pQ3SZXC/jNmJTWIKN2zXe376RSWWG43xRyfVcUrcaabiMI7Hg3gFUR2CJWGyt/0EPM=;
Message-ID: <ede601d8-804b-46d5-955f-eea895b269ba@xen.org>
Date: Tue, 12 Mar 2024 22:27:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v6 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20240307123943.1991755-1-ayan.kumar.halder@amd.com>
 <20240307123943.1991755-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240307123943.1991755-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 07/03/2024 12:39, Ayan Kumar Halder wrote:
> From: Michal Orzel <michal.orzel@amd.com>
> 
> Currently, if user enables HVC_DCC config option in Linux, it invokes access
> to debug data transfer registers (i.e. DBGDTRTX_EL0 on arm64, DBGDTRTXINT on
> arm32). As these registers are not emulated, Xen injects an undefined
> exception to the guest and Linux crashes.
> 
> To prevent this crash, introduce a partial emulation of DBGDTR[TR]X_EL0
> (these registers share the same encoding) as RAZ/WI and MDCCSR_EL0 as TXfull.
> 
> Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".
> 
> Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
> using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() ---> hvc_dcc_check(),
> and returns -ENODEV in case TXfull bit is still set after writing a test
> character. This way we prevent the guest from making use of HVC DCC as a
> console.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

