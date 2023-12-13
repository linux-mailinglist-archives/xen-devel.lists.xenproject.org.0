Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C021B811CF2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 19:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654224.1020898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDU9F-00062R-2M; Wed, 13 Dec 2023 18:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654224.1020898; Wed, 13 Dec 2023 18:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDU9E-00060D-Uy; Wed, 13 Dec 2023 18:39:56 +0000
Received: by outflank-mailman (input) for mailman id 654224;
 Wed, 13 Dec 2023 18:39:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rDU9D-000607-U6
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 18:39:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDU9C-0007Rr-H1; Wed, 13 Dec 2023 18:39:54 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.3.12])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDU9C-0001Bt-7U; Wed, 13 Dec 2023 18:39:54 +0000
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
	bh=apno7CYjLugo2KBC2//ahYVix5uiGUGPPAD6UEzuJVo=; b=OWSuTya0+fnDogskGHlZifKv2e
	QTSc2Cln5GKu2He4R7Lb5kcIzSMcdyIHbnDLShcwI/zhEpXTxD5tkNW/wmzSJcxgCO1GP5EmG+psJ
	Kixbip4Dv7hnhWkVMQGEe68/0CyuywY+SX7HfsHmalQKmBo/wVPH0a9Ow/saJAbwgEa8=;
Message-ID: <5306d465-9cf6-4e3f-86ea-0dacbd30062e@xen.org>
Date: Wed, 13 Dec 2023 18:39:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smp: move cpu_is_offline() definition
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <6505090e-8961-47ca-9726-0271c25bf2f8@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6505090e-8961-47ca-9726-0271c25bf2f8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/12/2023 11:26, Jan Beulich wrote:
> It's all the same for the 3 arch-es which have it, and RISC-V would
> introduce a 4th instance. Put it in xen/smp.h instead, while still
> permitting asm/smp.h to define a custom variant if need be.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

