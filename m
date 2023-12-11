Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ED580DAFE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 20:39:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652512.1018402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCm7k-0002mR-Ee; Mon, 11 Dec 2023 19:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652512.1018402; Mon, 11 Dec 2023 19:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCm7k-0002kQ-C0; Mon, 11 Dec 2023 19:39:28 +0000
Received: by outflank-mailman (input) for mailman id 652512;
 Mon, 11 Dec 2023 19:39:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rCm7i-0002kK-LR
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 19:39:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCm7h-00048H-LM; Mon, 11 Dec 2023 19:39:25 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.158.169]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCm7h-0003W5-ET; Mon, 11 Dec 2023 19:39:25 +0000
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
	bh=/QPGNFXzOrUBBS5K6pyXWUiDlo9nIx3nWfqZrk8FDjU=; b=iqy1rBxYdlHfazGir9LIQSxHkl
	5KWl2yfUeAtZ1y7wqiGiOJF76Hmt8s0qm3R0phPUC8MyLmy5LLkZgGOTsJjf7KQIEleeUusc8uDiR
	Pc1GgvC0TKzjsOlipIeDi642Mf/HGn6YZ4bzG790wsoruWhfmf+ranatGKX3MVA7CPuw=;
Message-ID: <878320f3-acc9-47fe-8a61-fb0deb4e017c@xen.org>
Date: Mon, 11 Dec 2023 19:39:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Document a policy for when to deviate from
 specifications
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230918122817.6577-1-george.dunlap@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230918122817.6577-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi George,

Sorry for the late reply.

On 18/09/2023 13:28, George Dunlap wrote:
> There is an ongoing disagreement among maintainers for how Xen should
> handle deviations to specifications such as ACPI or EFI.
> 
> Write up an explicit policy, and include two worked-out examples from
> recent discussions.

NIT: For a more balanced arguments, it would have been good to have one 
example where Xen decides to not accept a deviationg from the spec.

Anyway...

> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

... your proposal makes sense to me. So with one typo below:

Acked-by: Julien Grall <jgrall@amazon.com>

> +## Calling EFI Reboot method
> +
> +One interpretation of the EFI spec is that operating systems should
> +call the EFI ResetSystem method in preference to the ACPI reboot
> +method.
> +
> +However, although the ResetSystem method is required by the EFI spec,
> +a large number of different systems doesn't actully work, at least

Typo: s/actully/actually/

> +when called by Xen: a large number of systems don't cleanly reboot
> +after calling the EFI REBOOT method, but rather crash or fail in some
> +other random way.

Cheers,

-- 
Julien Grall

