Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795522D772F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 14:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50629.89340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knivN-0005VC-SV; Fri, 11 Dec 2020 13:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50629.89340; Fri, 11 Dec 2020 13:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knivN-0005Un-OE; Fri, 11 Dec 2020 13:57:33 +0000
Received: by outflank-mailman (input) for mailman id 50629;
 Fri, 11 Dec 2020 13:57:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1knivL-0005Ui-Rw
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 13:57:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knivK-0006nl-Q2; Fri, 11 Dec 2020 13:57:30 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knivK-0004OD-JE; Fri, 11 Dec 2020 13:57:30 +0000
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
	bh=8u4AlIr54MyFnBOLLT1YxcwplyAh8qmp63OX2KUl6xA=; b=AWp6dcRI+8Dk1si+csAZ/wR2L5
	7Z/GarNkPRZaPA9d0/LK+k0xtFcCia3tYwZvhi1Md8sc8HHTH20oWtmCQ1v0ZzTLmT/w+/AHDbpge
	TT6kRRxFH1LpKveK48CHZRka4s2SHQZIj5EKGtyJLHKjkD223xDM8ImQhSVDyP5NwurQ=;
Subject: Re: [PATCH v3 8/8] xen/arm: smmuv3: Remove linux compatibility
 functions.
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <c38df3122a9e74e2324936c8bd36d372cdc3009a.1607617848.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <aa6fbfa5-3afa-776e-287c-177932fd4764@xen.org>
Date: Fri, 11 Dec 2020 13:57:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c38df3122a9e74e2324936c8bd36d372cdc3009a.1607617848.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 10/12/2020 16:57, Rahul Singh wrote:
> Replace all Linux compatible device tree handling function with the XEN
> functions.

Right, but they were introduced in the previous patch. I dislike the 
idea to add code for removing afterwards (in some cases you actually do 
the renaming directly...).

So I would rather move this patch before patch #7 so we don't undo what 
we just did.

Cheers,

-- 
Julien Grall

