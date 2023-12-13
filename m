Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0769811B87
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 18:49:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654180.1020879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDTLg-0004Zk-Tv; Wed, 13 Dec 2023 17:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654180.1020879; Wed, 13 Dec 2023 17:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDTLg-0004WP-RM; Wed, 13 Dec 2023 17:48:44 +0000
Received: by outflank-mailman (input) for mailman id 654180;
 Wed, 13 Dec 2023 17:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dGiJ=HY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rDTLf-0004WJ-49
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 17:48:43 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8ecc523-99df-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 18:48:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 766D48285C08;
 Wed, 13 Dec 2023 11:48:38 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9_cRjjXmkFdQ; Wed, 13 Dec 2023 11:48:37 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C54188286742;
 Wed, 13 Dec 2023 11:48:37 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2v3Wc3PL1UK6; Wed, 13 Dec 2023 11:48:37 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0EBE58285C08;
 Wed, 13 Dec 2023 11:48:36 -0600 (CST)
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
X-Inumbo-ID: d8ecc523-99df-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C54188286742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1702489717; bh=XHWr/Jq5yO3apLnqolWFwaAIJe6r/wXh2WJLN012qGw=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Mie0+7c2GF/K5cfbaKuLZPcRpEZ9QFQ5DoZoWxhNuRTYUfhUjvc4XM+1Feimwk7c+
	 6cZ1K0ztYVRenf0yTcvPVjTRuudpxEhHYoFVLzlErVBS1n31DGiKEe/CoWgBEweLxk
	 znAwPb8eaxPDivYyy4Ez2kSzai9zfWIacUeIQaTY=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <c322568b-81ea-4f81-a8db-415fa2bc763f@raptorengineering.com>
Date: Wed, 13 Dec 2023 11:48:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smp: move cpu_is_offline() definition
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <6505090e-8961-47ca-9726-0271c25bf2f8@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <6505090e-8961-47ca-9726-0271c25bf2f8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 12/13/23 5:26 AM, Jan Beulich wrote:
> It's all the same for the 3 arch-es which have it, and RISC-V would
> introduce a 4th instance. Put it in xen/smp.h instead, while still
> permitting asm/smp.h to define a custom variant if need be.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

