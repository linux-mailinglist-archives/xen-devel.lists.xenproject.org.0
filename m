Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E34467799
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237564.412020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7wj-0005j0-0s; Fri, 03 Dec 2021 12:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237564.412020; Fri, 03 Dec 2021 12:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7wi-0005gj-U6; Fri, 03 Dec 2021 12:45:48 +0000
Received: by outflank-mailman (input) for mailman id 237564;
 Fri, 03 Dec 2021 12:45:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mt7wh-0005gd-SQ
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:45:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mt7wg-0004Mv-VF; Fri, 03 Dec 2021 12:45:46 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.21.218]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mt7wg-0000WU-Oa; Fri, 03 Dec 2021 12:45:46 +0000
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
	bh=oEPU0l2cxa7JpNUJKmbJilk4BczgfWAitWF/QkcCq44=; b=UD8jWhUSvjGzy9foe4ZW1f/i06
	MtX0jaG387C4+4a3LK7ZpHVb795uFQ3hcUWAlrh8gkqOFUdAuReEkkEyx9RjVysCFMA1eimzYBWH/
	8sWeqPxBkTxToz+/LbtFcQngJjGH4SQTjWYzCVbhg3nNNw/5uD+X/370efHRs2w9uE9g=;
Message-ID: <d7951950-e5e3-01b6-c9ee-9fb3f3657b81@xen.org>
Date: Fri, 3 Dec 2021 12:45:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] docs/efi: Fix wrong compatible in dts example
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20211202150517.53029-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211202150517.53029-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

I have committed the patch with a couple of changes.

On 02/12/2021 15:05, Luca Fancellu wrote:
> The example in section "UEFI boot and dom0less on ARM" has
> a wrong compatible for the DTB passthrough, it is "ramdisk"
> instead of "device-tree".
> This patch fixes the example.

I have re-wrapped the commit message to 72-characters rather than 
58-characters.

> 
> Fixes: a1743fc3a9 ("arm/efi: Use dom0less configuration when using EFI boot")

The sha1 should be 12-characters for Fixes tag. You can configure git to 
ouput one for you. See [1] for more details.

> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgralL@amazon.com>

> ---
> Question: Does it makes sense to backport it to 4.16?

I think so. I would tend to read the same documentation as the version
of Xen I am using. Documentation patches are also not considered risky.

Stefano can you add it in your backport list?

[1] https://xenbits.xen.org/docs/unstable/process/tags.html

-- 
Julien Grall

