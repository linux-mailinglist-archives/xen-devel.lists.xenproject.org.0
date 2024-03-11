Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21ED8786F6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 19:04:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691570.1077664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjjz2-0006tN-1I; Mon, 11 Mar 2024 18:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691570.1077664; Mon, 11 Mar 2024 18:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjjz1-0006qd-UR; Mon, 11 Mar 2024 18:02:43 +0000
Received: by outflank-mailman (input) for mailman id 691570;
 Mon, 11 Mar 2024 18:02:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMC+=KR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rjjyz-0006pG-V8
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 18:02:41 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b9242a1-dfd1-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 19:02:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 14222828555B;
 Mon, 11 Mar 2024 13:02:37 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id XCY9OihA2phG; Mon, 11 Mar 2024 13:02:35 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 90A9B82857FB;
 Mon, 11 Mar 2024 13:02:35 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gAJ6IiuuItoI; Mon, 11 Mar 2024 13:02:35 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A2F7D828555B;
 Mon, 11 Mar 2024 13:02:34 -0500 (CDT)
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
X-Inumbo-ID: 8b9242a1-dfd1-11ee-afdc-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 90A9B82857FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710180155; bh=dra6heGfKnsJ4Y78kpmM0pD+JnxX6oVuc9Jy0sTLO5I=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=jRqWqZiUjaPLbzJfGTDrSc83S3aIHOF5L9W+5AAKqwunrFO5roB1MsEDHu1n8oyN1
	 WGtZlJXgYma7uKB/j6YvOM8ICJuMkprIiVSDW+JRktO/GpmD1wN1sExVSXuKlh3Jhi
	 wWtbr5WhvIAOt+6l7E+GpnAyxJilpyr3m5cdJxYM=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <f7ccc227-be6c-451b-8989-a7810b189c97@raptorengineering.com>
Date: Mon, 11 Mar 2024 13:02:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] xen/domain.h: Centrialize
 is_domain_direct_mapped()
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-3-xin.wang2@amd.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240308015435.4044339-3-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Henry,

On 3/7/24 7:54 PM, Henry Wang wrote:
> Currently direct mapped domain is only supported by the Arm
> architecture at the domain creation time by setting the CDF_directmap
> flag. There is not a need for every non-Arm architecture, i.e. x86,
> RISC-V and PPC, to define a stub is_domain_direct_mapped() in arch
> header.
> 
> Move is_domain_direct_mapped() to a centralized place at xen/domain.h
> and evaluate CDF_directmap for non-Arm architecture to 0.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>

Regardless of whether or not you decide to go with the centralized ifdef
approach suggested by Michal, consider the PPC parts:

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

