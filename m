Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07388601C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 18:54:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696566.1087602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMbl-0003DF-9L; Thu, 21 Mar 2024 17:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696566.1087602; Thu, 21 Mar 2024 17:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMbl-0003AH-6Z; Thu, 21 Mar 2024 17:53:41 +0000
Received: by outflank-mailman (input) for mailman id 696566;
 Thu, 21 Mar 2024 17:53:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rnMbj-0003AB-Sz
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 17:53:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnMbj-000762-0W; Thu, 21 Mar 2024 17:53:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnMbi-00080B-QS; Thu, 21 Mar 2024 17:53:38 +0000
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
	bh=OeQPtn3PHVS5XG851Lm6+5d9UE8MUvnCNC6e7BaEiQo=; b=ZCr/rUdyD8KXABiqxhcly71a4d
	IG/emCoRQ1ALU86zMEwEl7priW4FUjmFX2QMetKcIReMfwuwJhlXDLsoyNIsEfhsXNOCCfoIvbnq5
	zqW6oYQ7aij9BtepDtw52U+UhKJx24cumSiRsOpOmQ/tFnipaPSZ7Ag0yax/m7jaHFFs=;
Message-ID: <3a3550a2-743f-4fda-8b15-70545d820f56@xen.org>
Date: Thu, 21 Mar 2024 17:53:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <039524d4157dddb2faf6887739a727f6e993b53f.1710443965.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <039524d4157dddb2faf6887739a727f6e993b53f.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/03/2024 22:15, Shawn Anastasio wrote:
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> new file mode 100644
> index 0000000000..c97b2bd88c
> --- /dev/null
> +++ b/xen/common/device-tree/Makefile
> @@ -0,0 +1 @@
> +obj-y += bootinfo.o

AFAICT everything in the new file is in init. So if you decide to keep 
it (see my comment on patch #6), then this should be "bootinfo.init.o" 
so the build system can check that all functions/data will live in init.

Cheers,

-- 
Julien Grall

