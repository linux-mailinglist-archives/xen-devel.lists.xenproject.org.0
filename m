Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D986A2AF4
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 18:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501815.773566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVxyu-0001Y7-Go; Sat, 25 Feb 2023 17:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501815.773566; Sat, 25 Feb 2023 17:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVxyu-0001WM-E3; Sat, 25 Feb 2023 17:05:08 +0000
Received: by outflank-mailman (input) for mailman id 501815;
 Sat, 25 Feb 2023 17:05:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pVxyt-0001WG-4h
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 17:05:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVxys-0004cT-Hq; Sat, 25 Feb 2023 17:05:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVxys-0000PO-C4; Sat, 25 Feb 2023 17:05:06 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=ToKuXvN+MLavtIaVPHGL4aJSFfhrxeHwMVpbdLjZeA4=; b=5AWEe19cksB1e0cA3c1CdaJskT
	onaREs5EGnEbUvVl6i1CoSlXZ8Wru8RD861ubAmvcSLvBm1jn9U2vnFV4N3GrSL6MHLYWQiYcbQ+Y
	VCUUi3liXK5JddUZWrshVOCSC4J+zOSevJ+OxFEPr8VlhOl38qse17Nd2IwGHDIiWKOQ=;
Message-ID: <ae96eb36-aeba-86f0-3b72-a8b62f4dce60@xen.org>
Date: Sat, 25 Feb 2023 17:05:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic implementation
 of bug.h
From: Julien Grall <julien@xen.org>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
In-Reply-To: <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/02/2023 16:49, Julien Grall wrote:
> Hi Oleksii,
> 
> On 24/02/2023 11:31, Oleksii Kurochko wrote:
>> The following changes were made:
>> * make GENERIC_BUG_FRAME mandatory for ARM
> 
> I have asked in patch #1 but will ask it again because I think this 
> should be recorded in the commit message. Can you outline why it is not 
> possible to completely switch to the generic version?

I have just tried to remove it on arm64 and it seems to work. This was 
only tested with GCC 10 though. But given the generic version is not not 
using the %c modifier, then I wouldn't expect any issue.

Cheers,

-- 
Julien Grall

