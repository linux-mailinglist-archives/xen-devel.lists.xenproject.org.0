Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4178CC7D7
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 22:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727880.1132567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9svB-0001ZW-97; Wed, 22 May 2024 20:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727880.1132567; Wed, 22 May 2024 20:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9svB-0001Xe-68; Wed, 22 May 2024 20:50:49 +0000
Received: by outflank-mailman (input) for mailman id 727880;
 Wed, 22 May 2024 20:50:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s9svA-0001XY-5w
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 20:50:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s9sv9-0005Kl-BX; Wed, 22 May 2024 20:50:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s9sv9-0005CC-5L; Wed, 22 May 2024 20:50:47 +0000
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
	bh=1b2wjNCaQ2OsGn5kNNZLj+IsWpe90RhjcKkH3BspCCc=; b=Gg3r/7UG5gdJr8ruNZOGmYwWTF
	Y7s+6bUpHmhF4UubPOn/FDsTkLDz+nS+Mn5e5c0ppHsdWMeJiv9mYVZhlmnfcrOCJCBRnlP2THSS+
	2nXCvOQFmVVItW+kuOB/vV0qCxm9PH+RMgibjxvhpQEobhLKcpedLaNWT+LELyZs6jpQ=;
Message-ID: <fb426cc8-fda9-4e21-983d-37649499e0e4@xen.org>
Date: Wed, 22 May 2024 21:50:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [for-4.19] Re: [XEN PATCH v3] arm/mem_access: add conditional build
 of mem_access.c
Content-Language: en-GB
To: Tamas K Lengyel <tamas@tklengyel.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
 <CABfawh=7jZmtseCm9yaZUcKkK7i+yYiudVDvTFeF6bax_1+BjA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CABfawh=7jZmtseCm9yaZUcKkK7i+yYiudVDvTFeF6bax_1+BjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Adding Oleksii as the release manager.

On 22/05/2024 19:27, Tamas K Lengyel wrote:
> On Fri, May 10, 2024 at 8:32 AM Alessandro Zucchelli
> <alessandro.zucchelli@bugseng.com> wrote:
>>
>> In order to comply to MISRA C:2012 Rule 8.4 for ARM the following
>> changes are done:
>> revert preprocessor conditional changes to xen/mem_access.h which
>> had it build unconditionally, add conditional build for xen/mem_access.c
>> as well and provide stubs in asm/mem_access.h for the users of this
>> header.
>>
>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> 
> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

Oleksii, would you be happy if this patch is committed for 4.19?

BTW, do you want to be release-ack every bug until the hard code freeze? 
Or would you be fine to levea the decision to the maintainers?

Cheers,

-- 
Julien Grall

