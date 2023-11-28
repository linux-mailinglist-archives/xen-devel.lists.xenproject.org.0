Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5AD7FC914
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 23:09:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643573.1003923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r86GQ-0004Ai-8N; Tue, 28 Nov 2023 22:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643573.1003923; Tue, 28 Nov 2023 22:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r86GQ-00047U-59; Tue, 28 Nov 2023 22:09:06 +0000
Received: by outflank-mailman (input) for mailman id 643573;
 Tue, 28 Nov 2023 22:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vht=HJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r86GP-00047K-1q
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 22:09:05 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd7e82de-8e3a-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 23:09:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6282F82857FE;
 Tue, 28 Nov 2023 16:09:02 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3RYj9CoDEETd; Tue, 28 Nov 2023 16:09:01 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 60D5A8285803;
 Tue, 28 Nov 2023 16:09:01 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1frnGDYNcObo; Tue, 28 Nov 2023 16:09:01 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A425382857FE;
 Tue, 28 Nov 2023 16:09:00 -0600 (CST)
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
X-Inumbo-ID: bd7e82de-8e3a-11ee-98e3-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 60D5A8285803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701209341; bh=lCNBXPpzYwAYeqknWC19jPWni95npP7sGGp/o5XqRmM=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=iPQyolJ4+4rjjz6YoNroG3GKLolPa+OoA+9009WEwz9tXRDXDjRwDIXynLTjBr3GV
	 7XdIC3XubfmhniK4b5Ctu5rvAGdRnDy9/gnOiPMNqgDAyL8qbMGl7XaI0JnJW6wJ1L
	 /Xg1U4tAIvkeQoZr/mCCWq6HVZt9QNkGPqNbNypg=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <99676d3d-fb91-4196-91c2-bb1ca3158b73@raptorengineering.com>
Date: Tue, 28 Nov 2023 16:09:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/14] xen/asm-generic: introduce generic header
 altp2m.h
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
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <5e1846febdbc5b9ebfe61993231dbebc9457f083.1701093907.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <5e1846febdbc5b9ebfe61993231dbebc9457f083.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> <asm/alt2pm.h> is common between several archs so it is
> moved to asm-generic.
> 
> Arm and PPC were switched to asm-generic version of altp2m.h.
>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

