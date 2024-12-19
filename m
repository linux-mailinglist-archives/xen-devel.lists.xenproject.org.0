Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943AF9F81CA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 18:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861396.1273319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOKJa-0007yb-O5; Thu, 19 Dec 2024 17:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861396.1273319; Thu, 19 Dec 2024 17:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOKJa-0007wh-LJ; Thu, 19 Dec 2024 17:27:58 +0000
Received: by outflank-mailman (input) for mailman id 861396;
 Thu, 19 Dec 2024 17:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHfq=TM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tOKJZ-0007wb-1d
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 17:27:57 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93a0fd07-be2e-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 18:27:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0065982856FB;
 Thu, 19 Dec 2024 11:27:51 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id w19iV3ARoQ8o; Thu, 19 Dec 2024 11:27:51 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2459E8287A8A;
 Thu, 19 Dec 2024 11:27:51 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ESi0HsPSzz4d; Thu, 19 Dec 2024 11:27:50 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6FD9882856FB;
 Thu, 19 Dec 2024 11:27:50 -0600 (CST)
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
X-Inumbo-ID: 93a0fd07-be2e-11ef-99a3-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2459E8287A8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1734629271; bh=M9wrowq2CUkU5CCHyLBb1ZE4jWfNKjh++NAz4V33aNg=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=M3b7N24l795DrVVJ1Ab3+ipY3VCuOmBl4c9x9PI4NYq78wTyvE3P4jesUjCHU4s3t
	 mrxySO1vwQPZ5p5QKlpTYV/pfIofWChpScfm1DkvGwXt2uk0gSWkV+kk5/SJOyB2Dj
	 HmWt6VRw925F5aJjipJxtJvLQxB/odxdfSY65E1k=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <eccc4602-73fb-41a5-a82c-2ff3950134c3@raptorengineering.com>
Date: Thu, 19 Dec 2024 11:27:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: Untangle credit2 vs cpu_nr_siblings()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Juergen Gross <jgross@suse.com>
References: <20241218124900.60886-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20241218124900.60886-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 12/18/24 6:49 AM, Andrew Cooper wrote:
> Credit2 has no buisness including asm/cpufeature.h or asm/processor.h.
> 
> This was caused by a bad original abstraction, and an even less wise attempt
> to fix the build on my behalf.  It is also the sole reason why PPC and RISC-V
> need cpufeature.h header.
> 
> Worst of all, cpu_data[cpu].x86_num_siblings doesn't even have the same
> meaning between vendors on x86 CPUS.
> 
> Implement cpu_nr_siblings() locally in credit2.c, leaving behind a TODO.  Drop
> the stub from each architecture.
> 
> Fixes: 8e2aa76dc167 ("xen: credit2: limit the max number of CPUs in a runqueue")
> Fixes: ad33a573c009 ("xen/credit2: Fix build following c/s 8e2aa76dc (take 2)")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

