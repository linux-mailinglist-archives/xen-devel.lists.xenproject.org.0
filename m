Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F005A3E181
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 17:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893999.1302823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl9pH-0003bD-38; Thu, 20 Feb 2025 16:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893999.1302823; Thu, 20 Feb 2025 16:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl9pH-0003Yh-0S; Thu, 20 Feb 2025 16:55:03 +0000
Received: by outflank-mailman (input) for mailman id 893999;
 Thu, 20 Feb 2025 16:55:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tl9pF-0003Yb-AA
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 16:55:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tl9pF-00Cbq1-03;
 Thu, 20 Feb 2025 16:55:00 +0000
Received: from [15.248.2.30] (helo=[10.24.66.14])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tl9pE-008ecA-1T;
 Thu, 20 Feb 2025 16:55:00 +0000
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
	bh=IrufcwuvhdcLevayH63RpDgeRnVcnABxho21w8W7nmo=; b=rrwze0ZM6T7MvnmmSzGat5D5oS
	YcXclMBJO0FzPrnGzgDj8aYpMyxSaSnCMp7QCFDo2dWnwPpGxiCwaZHonlzkgTd19iDJ73B+KKEau
	Duh9U/HiBnj8mKrcrvTkqsN4Tz7c2XHplIPTi+7e3wT5CO+5+6A1cKgnLRKyq+qx2kbI=;
Message-ID: <ac7be3e8-9c9f-4cdc-831d-085c09e80bc7@xen.org>
Date: Thu, 20 Feb 2025 16:54:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/dom0less: support for vcpu affinity
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, dpsmith@apertussolutions.com,
 xenia.ragiadakou@amd.com
References: <alpine.DEB.2.22.394.2502191814490.1791669@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2502191814490.1791669@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 20/02/2025 02:18, Stefano Stabellini wrote:
> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> 
> Add vcpu affinity to the dom0less bindings. Example:
> 
>      dom1 {
>              ...
>              cpus = <4>;
>              vcpu0 {
>                     compatible = "xen,vcpu";
>                     id = <0>;
>                     hard-affinity = "4-7";
>              };
>              vcpu1 {
>                     compatible = "xen,vcpu";
>                     id = <1>;
>                     hard-affinity = "0-3,5";
>              };
>              vcpu2 {
>                     compatible = "xen,vcpu";
>                     id = <2>;
>                     hard-affinity = "1,6";
>              };
>              ...
> 
> Note that the property hard-affinity is optional. It is possible to add
> other properties in the future not only to specify soft affinity, but
> also to provide more precise methods for configuring affinity. For
> instance, on ARM the MPIDR could be use to specify the pCPU. For now, it
> is left to the future.
> 
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


