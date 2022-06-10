Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90AE5462C7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346307.572079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbHj-00064G-5Y; Fri, 10 Jun 2022 09:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346307.572079; Fri, 10 Jun 2022 09:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbHj-00061n-1j; Fri, 10 Jun 2022 09:50:31 +0000
Received: by outflank-mailman (input) for mailman id 346307;
 Fri, 10 Jun 2022 09:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7j0Q=WR=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nzbHh-00061h-QF
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:50:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c1d24801-e8a2-11ec-8179-c7c2a468b362;
 Fri, 10 Jun 2022 11:50:28 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 534881576;
 Fri, 10 Jun 2022 02:50:27 -0700 (PDT)
Received: from [10.57.4.71] (unknown [10.57.4.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AF653F73B;
 Fri, 10 Jun 2022 02:50:25 -0700 (PDT)
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
X-Inumbo-ID: c1d24801-e8a2-11ec-8179-c7c2a468b362
Message-ID: <322b83f3-830c-f330-5656-59d21da965c6@arm.com>
Date: Fri, 10 Jun 2022 11:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] xen/console: Fix incorrect format tags for struct tm
 members
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220610083358.101412-1-michal.orzel@arm.com>
 <20220610083358.101412-4-michal.orzel@arm.com>
 <b84abd29-2856-a173-55b4-4e642d8a6ee5@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <b84abd29-2856-a173-55b4-4e642d8a6ee5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 10.06.2022 11:44, Jan Beulich wrote:
> On 10.06.2022 10:33, Michal Orzel wrote:
>> All the members of struct tm are defined as integers but the format tags
>> used in console driver for snprintf wrongly expect unsigned values. Fix
>> the tags to expect integers.
> 
> Perhaps do things the other way around - convert field types to unsigned
> unless negative values can be stored there? This would match our general
> aim of using unsigned types when only non-negative values can be held in
> variables / parameters / fields.
> 

The reason why I did not do this is to be coherent with Linux kernel (include/linux/time.h).
I believe the time.h code in Xen comes from Linux.

So if the Linux time.h defines these fields as integers and uses proper %d format specifiers (unlike Xen),
I think my solution is better.

> Jan
Cheers,
Michal

