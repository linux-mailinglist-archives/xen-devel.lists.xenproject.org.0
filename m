Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF14A7E735
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 18:50:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940646.1340347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pft-0003XI-13; Mon, 07 Apr 2025 16:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940646.1340347; Mon, 07 Apr 2025 16:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pfs-0003Us-UJ; Mon, 07 Apr 2025 16:50:16 +0000
Received: by outflank-mailman (input) for mailman id 940646;
 Mon, 07 Apr 2025 16:50:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEnO=WZ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1u1pfr-0003Um-GY
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 16:50:15 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ed50e5c-13d0-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 18:50:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A84BB8287EB3;
 Mon,  7 Apr 2025 11:50:10 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2oy5let_N4tN; Mon,  7 Apr 2025 11:50:09 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4490782887A7;
 Mon,  7 Apr 2025 11:50:09 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LP8R2MEbONjM; Mon,  7 Apr 2025 11:50:09 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A20FA8288626;
 Mon,  7 Apr 2025 11:50:08 -0500 (CDT)
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
X-Inumbo-ID: 5ed50e5c-13d0-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4490782887A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1744044609; bh=sWPZZ0ZeEYif/8bLlu46ZcL63k4Gx9DA0sYhhKt6TYw=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=XtHatR+EX8/+/IwPWb0uK5PQ1N1E+anqRB1BGBJBv0mY32ZMclwwRLAN4CfoP37gP
	 gxpXlD6R9dHwoJX98jE8LsAqhYG4YJAUyEWjw8NBs4cdyjDbYyJ3SapjtztiSoHF3y
	 C/jVXF2AJw2R4DtcnRvMeQvR7VF/sqSmOzbyL94w=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <44c3c6a8-12a6-4ad7-b6ef-dd8926606fb0@raptorengineering.com>
Date: Mon, 7 Apr 2025 11:50:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Drop .fixup section from non-x86 architectures
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250403110003.1461522-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20250403110003.1461522-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 4/3/25 6:00 AM, Andrew Cooper wrote:
> The fixup section is only used by x86, and we're working to remove it there
> too.  Logic in the fixup section is unconnected to it's origin site, and
> interferes with backtraces/etc.
> 
> Remove the section from the architectures which don't use it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

