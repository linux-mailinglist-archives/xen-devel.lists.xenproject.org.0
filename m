Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097326A70BB
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 17:22:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504152.776717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXPD8-0002ry-44; Wed, 01 Mar 2023 16:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504152.776717; Wed, 01 Mar 2023 16:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXPD8-0002py-0I; Wed, 01 Mar 2023 16:21:46 +0000
Received: by outflank-mailman (input) for mailman id 504152;
 Wed, 01 Mar 2023 16:21:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pXPD6-0002ps-O4
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 16:21:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXPD6-0003pV-F2; Wed, 01 Mar 2023 16:21:44 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.13.48]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXPD6-00078e-8E; Wed, 01 Mar 2023 16:21:44 +0000
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
	bh=9nV7buBEDaYRTac08yym+8twp8QN/ilTKKsAIOkpwP0=; b=6KzfB0ZAa/APSMGx/DgnhK0zeS
	n6eWd3R2a9gUHM+xFKOiAfRaPLi3T6Lk5R4Ul0C/oLPxaF8gu33b8RfBL33Qg91k6XPsnlVcykhe1
	i8fqiaHCqZrv4ojVVkwvHBzxyccOhyRDoonWt38g42yDjLK5Q4V+ttNhATTsbXI8+NII=;
Message-ID: <370809af-75e6-546a-53e4-71a76444f367@xen.org>
Date: Wed, 1 Mar 2023 16:21:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen/arm: align *(.proc.info) in the linker script
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <74973920d8722df3ce533979314564f331acf16e.1677687247.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <74973920d8722df3ce533979314564f331acf16e.1677687247.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 01/03/2023 16:14, Oleksii Kurochko wrote:
> During testing of bug.h's macros generic implementation yocto-qemuarm
> job crashed with data abort:

The commit message is lacking some information. You are telling us that 
there is an error when building with your series, but this doesn't tell 
me why this is the correct fix.

This is also why I asked to have the xen binary because I want to check 
whether this was a latent bug in Xen or your series effectively 
introduce a bug.

Note that regardless what I just wrote this is a good idea to align 
__proc_info_start. I will try to have a closer look later and propose a 
commit message and/or any action for your other series.

Cheers,

-- 
Julien Grall

