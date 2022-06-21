Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ECD552D4C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 10:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353067.579976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3ZUS-00059C-QL; Tue, 21 Jun 2022 08:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353067.579976; Tue, 21 Jun 2022 08:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3ZUS-00056T-Lg; Tue, 21 Jun 2022 08:44:04 +0000
Received: by outflank-mailman (input) for mailman id 353067;
 Tue, 21 Jun 2022 08:44:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L66N=W4=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3ZUR-0004kn-8t
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 08:44:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4c2c4069-f13e-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 10:44:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEE221596;
 Tue, 21 Jun 2022 01:44:00 -0700 (PDT)
Received: from [10.57.35.142] (unknown [10.57.35.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 092BF3F5A1;
 Tue, 21 Jun 2022 01:43:58 -0700 (PDT)
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
X-Inumbo-ID: 4c2c4069-f13e-11ec-b725-ed86ccbb4733
Message-ID: <44179ffe-e3c4-d9ea-80fe-67cf7d946a34@arm.com>
Date: Tue, 21 Jun 2022 10:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/9] include/public: Use explicitly specified types
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-6-michal.orzel@arm.com>
 <e91f6bd2-271c-12c1-ee7e-bea3d74c8beb@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <e91f6bd2-271c-12c1-ee7e-bea3d74c8beb@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 20.06.2022 11:54, Julien Grall wrote:
> Hi Michal,
> 
> On 20/06/2022 08:02, Michal Orzel wrote:
>> According to MISRA C 2012 Rule 8.1, types shall be explicitly
>> specified. Fix all the findings reported by cppcheck with misra addon
>> by substituting implicit type 'unsigned' to explicit 'unsigned int'.
>>
>> Bump sysctl interface version.
> 
> The sysctl version should only be bumped if the ABI has changed. AFAICT switching from "unsigned" to "unsigned" will not modify it, so I don't think this is necessary.

Sure, I can remove that in v2 but first I'd like to wait at least for xsm patch to be reviewed.
Also as these patches are not dependent from each other, do you think it is worth respinning the reviewed ones?

Cheers,
Michal

