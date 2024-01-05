Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF04825AF5
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 20:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662339.1032418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLpag-0000qj-7Z; Fri, 05 Jan 2024 19:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662339.1032418; Fri, 05 Jan 2024 19:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLpag-0000o9-4W; Fri, 05 Jan 2024 19:10:46 +0000
Received: by outflank-mailman (input) for mailman id 662339;
 Fri, 05 Jan 2024 19:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyKn=IP=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rLpaf-0000o3-4D
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 19:10:45 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f87d921-abfe-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 20:10:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E355F828586A;
 Fri,  5 Jan 2024 13:10:42 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id TqN90OMX73xP; Fri,  5 Jan 2024 13:10:42 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 410488285A05;
 Fri,  5 Jan 2024 13:10:42 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dYY72SbNQJzF; Fri,  5 Jan 2024 13:10:42 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id ABF38828586A;
 Fri,  5 Jan 2024 13:10:41 -0600 (CST)
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
X-Inumbo-ID: 1f87d921-abfe-11ee-98ef-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 410488285A05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1704481842; bh=ew8xSgvt4qKIKMB8n2rlFRAlMFQgtK9DfHRha/wXrDY=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=QG3xhQPnEVevFaBvi885ZT702IhIQQckjHzYWXvjHjF0rrQKDci3nqGqpnX6mghef
	 5jjLC5g+whSB2MVrkvhorflxYUOQWGhIsOOApElZweQjyi4DqSvVv8kjk3LwwpVB8Y
	 caK9PmfJQMhYIlTQI4TALS9cpKgLk8X2zyq1yArw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <c119c1df-0d35-4f35-92af-9245b31edcb0@raptorengineering.com>
Date: Fri, 5 Jan 2024 13:10:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <e49bae656ed6c0fe689703f78df4e815b955f5b2.1703072575.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <e49bae656ed6c0fe689703f78df4e815b955f5b2.1703072575.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 12/20/23 8:08 AM, Oleksii Kurochko wrote:
> Ifdef-ing inclusion of <asm/grant_table.h> allows to avoid
> generation of empty <asm/grant_table.h> for cases when
> CONFIG_GRANT_TABLE is not enabled.
> 
> The following changes were done for Arm:
> <asm/grant_table.h> should be included directly because it contains
> gnttab_dom0_frames() macros which is unique for Arm and is used in
> arch/arm/domain_build.c.
> <asm/grant_table.h> is #ifdef-ed with CONFIG_GRANT_TABLE in
> <xen/grant_table.h> so in case of !CONFIG_GRANT_TABLE gnttab_dom0_frames
> won't be available for use in arch/arm/domain_build.c.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

