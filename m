Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62094FB3BE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 08:30:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302687.516386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndnYZ-00016t-I9; Mon, 11 Apr 2022 06:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302687.516386; Mon, 11 Apr 2022 06:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndnYZ-00013w-Ej; Mon, 11 Apr 2022 06:29:47 +0000
Received: by outflank-mailman (input) for mailman id 302687;
 Mon, 11 Apr 2022 06:29:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hqm=UV=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1ndnYY-00013q-UW
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 06:29:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c76a47dc-b960-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 08:29:45 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B702ED1;
 Sun, 10 Apr 2022 23:29:45 -0700 (PDT)
Received: from [10.57.8.177] (unknown [10.57.8.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F72B3F70D;
 Sun, 10 Apr 2022 23:29:42 -0700 (PDT)
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
X-Inumbo-ID: c76a47dc-b960-11ec-8fbc-03012f2f19d4
Message-ID: <0a790014-a6c1-1012-664c-a7ae742ec82e@arm.com>
Date: Mon, 11 Apr 2022 08:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220405091616.200270-1-michal.orzel@arm.com>
 <20220405091616.200270-3-michal.orzel@arm.com>
 <3c5a736d-3c38-a975-62d9-7c5623d89728@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <3c5a736d-3c38-a975-62d9-7c5623d89728@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Julien,

On 08.04.2022 19:58, Julien Grall wrote:
> Hi Michal,
> 
> On 05/04/2022 10:16, Michal Orzel wrote:
>>   #if defined(BUILD_ID)
>> @@ -109,12 +104,7 @@ SECTIONS
>>          *(.data.schedulers)
>>          __end_schedulers_array = .;
>>   -#ifdef CONFIG_HYPFS
>> -       . = ALIGN(8);
> 
> This will be replaced with POINTER_ALIGN which is 4-byte on Arm32. AFAICT, there are no 64-bit value used in struct param_hypfs. So it should be fine.
> 
> That said, I think this is worth mentioning in the commit message.
> 
> The rest of this patch looks good to me.
> 
> Cheers,
> 
Ok, I will update the commit and repush the series.

Thanks,
Michal

