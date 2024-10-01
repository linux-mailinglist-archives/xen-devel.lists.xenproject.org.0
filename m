Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E867B98B8DC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 12:03:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807944.1219699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZjB-0003yW-UD; Tue, 01 Oct 2024 10:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807944.1219699; Tue, 01 Oct 2024 10:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZjB-0003wW-RU; Tue, 01 Oct 2024 10:03:33 +0000
Received: by outflank-mailman (input) for mailman id 807944;
 Tue, 01 Oct 2024 10:03:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1svZjA-0003wK-Po
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 10:03:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svZjA-000822-HQ; Tue, 01 Oct 2024 10:03:32 +0000
Received: from [15.248.2.236] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svZjA-0000Tc-Bu; Tue, 01 Oct 2024 10:03:32 +0000
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
	bh=KzG84CFHhf8ImG3UXuRJ3MleZT8ENtynsbFHdWvpbm0=; b=X1LUMknm7KChah647BHjB94muh
	qkb+rshGRO8ok6vRK7/UHZR9S6XE1sndNG2vvCrWEm6KGGL7mWdze9DLAm7pPf43c1vLXn5U033GT
	NJIcYhQL1kq0xt5FVNBS8eD/rBMr49MXl7LdOSFnji1nu0kWiqAC8u9NS0cJxlvszDOE=;
Message-ID: <ed4c51f6-9412-4698-9408-feb88e2cd5da@xen.org>
Date: Tue, 1 Oct 2024 11:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] SUPPORT.md: Describe SCMI-SMC layer feature
Content-Language: en-GB
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-8-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240930114715.642978-8-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Describe the layer which enables SCMI over SMC calls forwarding
> to EL3 FW if issued by Dom0. 

s/Dom0/Hardware domain/ and everywhere else below.

> If the SCMI firmware node is not
> found in Dom0's DT during initialization, it fails silently
> as it's not mandatory.

You are looking for the node in the host's DT.

> 
> The SCMI SMCs trapping at EL2 now lets Dom0 perform SCMI ops for
> interacting with system-level resources almost as if it would be
> running natively.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> ---
>   SUPPORT.md | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 23dd7e6424..d8ffddfc44 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -927,6 +927,14 @@ Add/Remove device tree nodes using a device tree overlay binary (.dtbo).
>   
>       Status: Tech Preview
>   
> +### Arm: SCMI over SMC calls forwarding to EL3 Firmware
> +
> +Enable SCMI calls using SMC as doorbell mechanism and Shared Memory for
> +transport ("arm,scmi-smc" compatible only) to reach EL3 Firmware if issued
> +by Dom0. Some platforms use SCMI for access to system-level resources.
> +
> +    Status: Supported

Bertrand, can you confirm this should be ok to support it (includingn 
security support)?

Cheers,

-- 
Julien Grall


