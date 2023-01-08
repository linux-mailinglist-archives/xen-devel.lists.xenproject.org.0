Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3BE661573
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jan 2023 14:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473166.733657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEVZK-0005l9-EE; Sun, 08 Jan 2023 13:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473166.733657; Sun, 08 Jan 2023 13:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEVZK-0005iu-Bf; Sun, 08 Jan 2023 13:18:34 +0000
Received: by outflank-mailman (input) for mailman id 473166;
 Sun, 08 Jan 2023 13:18:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEVZI-0005io-HX
 for xen-devel@lists.xenproject.org; Sun, 08 Jan 2023 13:18:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEVZI-00078g-2f; Sun, 08 Jan 2023 13:18:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEVZH-0005zV-Sb; Sun, 08 Jan 2023 13:18:31 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=7Q80rUEM6UxqVUpefjUUaTM3iolJdTQeW1ClY4I1A7c=; b=e9nO+s2xyHRlP92vbvMs1CwT6U
	Yfh6KjEdObwHMUbxKytiCXjfPh6L8j7H6RnNWXzecDxXrpnHcGghA/aka58VMwEfdwt8cmmQC4gv8
	UUbuqlUFGsrQjZb6R9XZOA6CdkyVYURLQ2cVzWOC54pvs7r4ll6HQF/ryvBS+h4pJkwo=;
Message-ID: <3de0f1fe-19a8-8cfe-4a50-f8905f64bdd6@xen.org>
Date: Sun, 8 Jan 2023 13:18:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-14-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 13/13] xen: make static shared memory supported in
 SUPPORT.md
In-Reply-To: <20221115025235.1378931-14-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 15/11/2022 02:52, Penny Zheng wrote:
> After patching previous commits, we could make feature of "static shared memory"

Are you referring to the patch in this series? If so, they seem to had 
new features which I don't think are necessary to mark the "static 
shared memory".

Instead, "static shared memory" could be marked as supported if we 
believe that the new code has no security hole.

Looking below, the STATIC_SHM depends on STATIC_MEMORY which is 
currently unsupported. So it seems a bit strange to mark one supported 
but not the other.

Now, in order to support them, we need to make sure that the XENMEM_* 
operations are working as intended. I know there are some works that 
were done in the past, but I can't exactly remember if we fixed 
everything. So what happen if the domain (consider the case where the 
domain is directmapped or not):
   1) Remove the page?
   2) Remove the page twice? (Only in the directmap case)
   3) Request to map the page?

Cheers,

-- 
Julien Grall

