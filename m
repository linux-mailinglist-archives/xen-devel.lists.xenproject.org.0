Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11446869CB8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 17:48:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686270.1068094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf0bw-00077h-JP; Tue, 27 Feb 2024 16:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686270.1068094; Tue, 27 Feb 2024 16:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf0bw-00075L-Fb; Tue, 27 Feb 2024 16:47:20 +0000
Received: by outflank-mailman (input) for mailman id 686270;
 Tue, 27 Feb 2024 16:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1D7=KE=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rf0bu-00075F-Om
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 16:47:18 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddb1516c-d58f-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 17:47:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 813E382855C7;
 Tue, 27 Feb 2024 10:47:16 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1kkwr_FxUiRv; Tue, 27 Feb 2024 10:47:15 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0C45B82856C4;
 Tue, 27 Feb 2024 10:47:15 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id C-yOD_MQEb8v; Tue, 27 Feb 2024 10:47:14 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6123C82855C7;
 Tue, 27 Feb 2024 10:47:14 -0600 (CST)
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
X-Inumbo-ID: ddb1516c-d58f-11ee-afd6-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0C45B82856C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1709052435; bh=BRkDsG3bTz7IfsDQLF6YdjxxW9JxgbwPIfTDzGmy4Vc=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=COqxvmP0PAmUV4NAI6wO6PyUhkVFBz2iU29ebkO+hYHFdMbXI5OKFVd3JBp3nOxZv
	 bKwdckzg4sCqj3Yx7cXG5a6QfySCjGR/iFwJeoFKSFgU+NnmH/vwZvB27UqyYgx0bY
	 rq8S3Nu0Y3LUkqlsQRQbE2ifpVyUZ8zdAoSKNQ4Y=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <3bacf6df-cb9f-4435-ae0a-6a228bc03aa8@raptorengineering.com>
Date: Tue, 27 Feb 2024 10:47:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/lib: introduce generic find next bit operations
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <fea2e65768457adcfedbfcc294004b1d5c2e86ea.1707495704.git.oleksii.kurochko@gmail.com>
 <0d10bc590e3b6574eea35f72f324c509b4824d69.camel@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <0d10bc590e3b6574eea35f72f324c509b4824d69.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 2/20/24 9:20 AM, Oleksii wrote:
> Hi Shawn,
> 

> Could you please take a look at the patch and PPC-related changes (
> xen/arch/ppc/include/asm/bitops.h )?
>

Hi Oleksii,

Sorry for the delay. This all looks good to me:

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

> Thanks in advance.
> 
> ~ Oleksii

Thanks,
Shawn

