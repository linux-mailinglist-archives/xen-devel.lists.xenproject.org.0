Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C1E93FD80
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 20:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767073.1177646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYVHA-0001by-Mo; Mon, 29 Jul 2024 18:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767073.1177646; Mon, 29 Jul 2024 18:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYVHA-0001Zc-KB; Mon, 29 Jul 2024 18:39:16 +0000
Received: by outflank-mailman (input) for mailman id 767073;
 Mon, 29 Jul 2024 18:39:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sYVHA-0001ZW-0T
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 18:39:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sYVH9-0004Pq-3O; Mon, 29 Jul 2024 18:39:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sYVH8-00013v-Qg; Mon, 29 Jul 2024 18:39:14 +0000
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
	bh=spdveYf6IxIQtWNvnvXw4Hpp/onsxjok8NUfRpDyDIM=; b=BXpV2P4y22pkITBtWj5p9W0ngC
	1tMjREjJ30TJgI6ChaHnKM8mErAqsReMi1dF4n/bWzUayo1rSMVzvUFku2svJIdpTblPc0a9JtOw6
	Jf79UU6cglaJN8yyOnv/syktiO9TExRuQimJlpB2lCn53zpjpZF5VB1y0URXs9HWPJx8=;
Message-ID: <2cfb4a5c-dff8-4202-80dd-c546d5d6bc6d@xen.org>
Date: Mon, 29 Jul 2024 19:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Stack checking on Arm
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240729142421.137283-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/07/2024 15:24, Stewart Hildebrand wrote:
> This series introduces stack check instrumentation on Arm. This is
> helpful for safety certification efforts. I'm sending this in an RFC
> state because I wanted to gather opinions on the approach of using
> -finstrument-functions.

This looks ok for an initial approach. I wonder if longer term we want 
to implement stack guards on Arm. We would need to allocate an extra 
"virtual" page per stack that would be unmapped.

The advantage is this could be used also in production and doesn't rely 
on any support from the processor.

Any thoughts?

Cheers,

-- 
Julien Grall

