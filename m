Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930D97698E5
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 16:02:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573091.897451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTTI-0007IK-7J; Mon, 31 Jul 2023 14:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573091.897451; Mon, 31 Jul 2023 14:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTTI-0007Fs-4E; Mon, 31 Jul 2023 14:02:04 +0000
Received: by outflank-mailman (input) for mailman id 573091;
 Mon, 31 Jul 2023 14:02:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qQTTG-0007Fm-LV
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 14:02:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQTTF-0001JV-KR; Mon, 31 Jul 2023 14:02:01 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.23.92]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQTTF-0001Yl-Dr; Mon, 31 Jul 2023 14:02:01 +0000
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
	bh=AaRZq78J1LGlxBz2JCYYPuqbN93fPOMLas1+HWp6Cq4=; b=l6zlASC53G+QFdPxEx64UR2+Pj
	gEPSPgawLCTELuJ3r49GS6g6y66OMz+uq/N4RKZ0VLZdFs6a5YJIdAnR81OVJ9F6xONSVUuQp+SKf
	2syTHEbNYFS/yXW8M7Qsvo9+2UnmnSsjn/G0Fs+UNNst3xvJ9gyEVkN6NUxRF8KExTtA=;
Message-ID: <8165e7b1-4eef-7b13-32f3-05ff38837100@xen.org>
Date: Mon, 31 Jul 2023 15:01:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/4] arm/efi: address MISRA C:2012 Rule 5.3
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1690810346.git.nicola.vetrini@bugseng.com>
 <c153e4fbe19510ba1244024e7a4b8897c86afd3a.1690810346.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c153e4fbe19510ba1244024e7a4b8897c86afd3a.1690810346.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/07/2023 14:35, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The parameter 'fdt' in static function within this file is removed,
> as they served no purpose and shadowed the homonymous variable.

I am not convinced this is a good idea to keep 'fdt' as static variable 
around because the name is too generic. Also in the future we may be 
able to remove the global static variable.

This means that most of this patch will be reverted.

So as I wrote on Matrix, I would rather prefer if the global variable is 
renamed to 'fdt_efi'.

Cheers,

-- 
Julien Grall

