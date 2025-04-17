Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F48A92C09
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 22:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958519.1351330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5VY2-0006OJ-A1; Thu, 17 Apr 2025 20:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958519.1351330; Thu, 17 Apr 2025 20:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5VY2-0006Lz-6D; Thu, 17 Apr 2025 20:09:22 +0000
Received: by outflank-mailman (input) for mailman id 958519;
 Thu, 17 Apr 2025 20:09:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eBjY=XD=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1u5VY1-0006Lt-8Q
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 20:09:21 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cea5350f-1bc7-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 22:09:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8BF3A8288A39;
 Thu, 17 Apr 2025 15:09:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PAdD2sa3ORcN; Thu, 17 Apr 2025 15:09:00 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A812C8288A5D;
 Thu, 17 Apr 2025 15:09:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4fdyHXcg7Rsv; Thu, 17 Apr 2025 15:09:00 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 92D698288A39;
 Thu, 17 Apr 2025 15:08:59 -0500 (CDT)
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
X-Inumbo-ID: cea5350f-1bc7-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A812C8288A5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1744920540; bh=u7gXwxeW9u0uMUIBcLy+CuKLaWlMOcuQYu1sXpfcXCU=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=s6Lesknx3GLQ+fhSq22ntfBPnQRpF8fJCtoKpWxuuasteSVgvD4wN8u6rSruoHlfx
	 DyAsrXf7xU4RGIks3iwahNOrYPkGf0EIHACdRT2wQsnosQXORQ6b9MbfzNbQhjj3kv
	 r7rwE7kzYCzW9Z8TdPpLA2GCL2LKviniW8IZG4KE=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <44ebf015-388a-4e73-acc2-67e87c0626a3@raptorengineering.com>
Date: Thu, 17 Apr 2025 15:08:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/15] ppc: Drop asm/byteorder.h
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Lin Liu <lin.liu@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
 <20250416115900.2491661-14-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20250416115900.2491661-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 4/16/25 6:58 AM, Andrew Cooper wrote:
> With the common code moved fully onto xen/byteorder.h, clean up the dregs.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

For PPC:

Reviewed-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

