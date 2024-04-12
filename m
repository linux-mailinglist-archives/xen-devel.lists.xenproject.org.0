Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D38A23F2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 04:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704298.1100626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv73i-0007eE-5Q; Fri, 12 Apr 2024 02:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704298.1100626; Fri, 12 Apr 2024 02:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv73i-0007bu-2l; Fri, 12 Apr 2024 02:54:34 +0000
Received: by outflank-mailman (input) for mailman id 704298;
 Fri, 12 Apr 2024 02:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvpr=LR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rv73g-0007bo-HV
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 02:54:32 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc166f71-f877-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 04:54:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B00A482857EB;
 Thu, 11 Apr 2024 21:54:30 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id pKwhZFWZ4LTZ; Thu, 11 Apr 2024 21:54:30 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2957A8285AEB;
 Thu, 11 Apr 2024 21:54:30 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UDeHOqSZKikb; Thu, 11 Apr 2024 21:54:30 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 4E07C82857EB;
 Thu, 11 Apr 2024 21:54:29 -0500 (CDT)
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
X-Inumbo-ID: fc166f71-f877-11ee-b908-491648fe20b8
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2957A8285AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712890470; bh=RFCy+kUgL16Cfff9QKCvL+io/ai/B2MnHFp292omjbE=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=cIIHiP0fMSL7sYZBuMeqBDVNDwFsbjUoKvsw21ESinwkWAkd28KXOryPlr0LRFhSK
	 PhO9mSLuz3spn+K4YXu4HH8r5xqtKcm47ZQl6NS3UopRMVkMbC5Hd7dhqVpbBeufmV
	 sPUVLDzS2tVFNQtJ0bJ6eCXfjTs16A1PA26j4o/A=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <9a08fc6c-dfe5-43a0-adf5-2407e41d0718@raptorengineering.com>
Date: Thu, 11 Apr 2024 21:54:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
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
 <3a3550a2-743f-4fda-8b15-70545d820f56@xen.org>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <3a3550a2-743f-4fda-8b15-70545d820f56@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 3/21/24 12:53 PM, Julien Grall wrote:
> Hi,
> 
> On 14/03/2024 22:15, Shawn Anastasio wrote:
>> diff --git a/xen/common/device-tree/Makefile
>> b/xen/common/device-tree/Makefile
>> new file mode 100644
>> index 0000000000..c97b2bd88c
>> --- /dev/null
>> +++ b/xen/common/device-tree/Makefile
>> @@ -0,0 +1 @@
>> +obj-y += bootinfo.o
> 
> AFAICT everything in the new file is in init. So if you decide to keep
> it (see my comment on patch #6), then this should be "bootinfo.init.o"
> so the build system can check that all functions/data will live in init.
> 

Good catch, this can definitely be built as a .init.o. Will do in v4.

> Cheers,

Thanks,
Shawn

