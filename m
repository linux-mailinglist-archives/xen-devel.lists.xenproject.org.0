Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA85879E89
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 23:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692202.1079070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkAYv-0002gS-Dy; Tue, 12 Mar 2024 22:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692202.1079070; Tue, 12 Mar 2024 22:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkAYv-0002eJ-B5; Tue, 12 Mar 2024 22:25:33 +0000
Received: by outflank-mailman (input) for mailman id 692202;
 Tue, 12 Mar 2024 22:25:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rkAYu-0002eD-AU
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 22:25:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkAYt-0005DF-Uv; Tue, 12 Mar 2024 22:25:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.154])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkAYt-00007Y-ND; Tue, 12 Mar 2024 22:25:31 +0000
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
	bh=DNwqCg0GGxDtiDmugP+jNfX9AiORp/9MrBQGtaKlE2g=; b=RbddF8P0iLDekAlUzRm/vv1q64
	QGL9tLnl3MH8S+OLckfysDK/TIfeEf6Xuh8D+dv8CDnGWqr4L6YD/TOb7U0OtXU5x7oxgwpkcEaNt
	OO/VwbOkdA7wXZugIUFikVkKNb7lr3I1/HW+8WhFHhJcyxBLPyjbIvVroVmob80y2nN8=;
Message-ID: <20531f63-d342-4ce5-88fb-01b7431ebd96@xen.org>
Date: Tue, 12 Mar 2024 22:25:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v6 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20240307123943.1991755-1-ayan.kumar.halder@amd.com>
 <20240307123943.1991755-2-ayan.kumar.halder@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240307123943.1991755-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/03/2024 12:39, Ayan Kumar Halder wrote:
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 7eb6875cfa..b49da114ab 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -102,6 +102,15 @@ Extension to the GICv3 interrupt controller to support MSI.
>   
>       Status: Experimental
>   
> +### ARM/Partial Emulation
> +
> +Enable partial emulation of registers, otherwise considered unimplemented,
> +that would normally trigger a fault injection.
> +
> +    Status: Supported, with caveats
> +
> +Only the following system registers are security supported:

This reads slightly odd. I would have have expected a few more registers 
afterwards. I would have considered to move this sentence to patch #2 or 
maybe N/A. Anyway, that's not too important (the patch doesn't make 
sense without the next one). So:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

