Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE9E7FC902
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 23:02:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643559.1003885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r869c-0001hN-VY; Tue, 28 Nov 2023 22:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643559.1003885; Tue, 28 Nov 2023 22:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r869c-0001eh-So; Tue, 28 Nov 2023 22:02:04 +0000
Received: by outflank-mailman (input) for mailman id 643559;
 Tue, 28 Nov 2023 22:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vht=HJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r869b-0001eP-6O
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 22:02:03 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c190780b-8e39-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 23:02:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4BA308285430;
 Tue, 28 Nov 2023 16:02:00 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id cmfLz0S_iBl6; Tue, 28 Nov 2023 16:01:59 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7785082857EA;
 Tue, 28 Nov 2023 16:01:59 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id crhUnAQZSb5j; Tue, 28 Nov 2023 16:01:59 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 971D08285430;
 Tue, 28 Nov 2023 16:01:58 -0600 (CST)
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
X-Inumbo-ID: c190780b-8e39-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 7785082857EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701208919; bh=saj2O1zbIZcNpKmqiuQUI2MYBmSAK1pzVp9tEFQCwWY=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=KjJs26auZC6wjxMdfvdp2S2vdq7CXd4X3jFQ6vw//t829aUGIcA2wLprZEBppAjar
	 s8JPhyZX824fNgJy7ON/rs2jvbLr1r0e7qXmL9luqS3UGCTdpdJW16ZRtmGwkfG59o
	 4JhmkAx8K2riBXxyw9Ikynba9nllqtsCz+1DKeC0=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <6faff72c-e848-4072-9357-b2e989424fa7@raptorengineering.com>
Date: Tue, 28 Nov 2023 16:01:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] xen/asm-generic: introduce generalized hardirq.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <4834c3e10a0dba429edb41c340065560ccf0d942.1701093907.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <4834c3e10a0dba429edb41c340065560ccf0d942.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> <asm/hardirq.h> is common through archs thereby it is moved
> to asm-generic.
> 
> Arm and PPC were switched to asm generic verstion of hardirq.h.
>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

