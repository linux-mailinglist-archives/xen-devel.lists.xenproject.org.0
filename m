Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA3F4F9C1F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 19:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301739.514995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncssi-0000nU-6J; Fri, 08 Apr 2022 17:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301739.514995; Fri, 08 Apr 2022 17:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncssi-0000kg-2q; Fri, 08 Apr 2022 17:58:48 +0000
Received: by outflank-mailman (input) for mailman id 301739;
 Fri, 08 Apr 2022 17:58:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncssg-0000ka-27
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 17:58:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncsse-00089b-Re; Fri, 08 Apr 2022 17:58:44 +0000
Received: from [54.239.6.190] (helo=[192.168.16.176])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncsse-0002w8-LA; Fri, 08 Apr 2022 17:58:44 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=j0fTXeN5exj+eBF7M7XT5/D8jf/244X16JRS4r0n9Fk=; b=EmWMHhUBQniT/FXGjp0ORk3cdV
	MoczPCPtqmFZUJnJL9jm87vOAV3y26X7pcp2MpxdSmxkWrWUK3oWoLdihT9jbr0qogabSgB+TAQ5S
	p3bHbQTpSfR/A1iHN7hGC5a9E+V6t4Ypr44lYeX5xboXd5NtsFhrZ3XbPxCisqKpQw6o=;
Message-ID: <3c5a736d-3c38-a975-62d9-7c5623d89728@xen.org>
Date: Fri, 8 Apr 2022 18:58:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/2] xen: Populate xen.lds.h and make use of its macros
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220405091616.200270-1-michal.orzel@arm.com>
 <20220405091616.200270-3-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220405091616.200270-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 05/04/2022 10:16, Michal Orzel wrote:
>   #if defined(BUILD_ID)
> @@ -109,12 +104,7 @@ SECTIONS
>          *(.data.schedulers)
>          __end_schedulers_array = .;
>   
> -#ifdef CONFIG_HYPFS
> -       . = ALIGN(8);

This will be replaced with POINTER_ALIGN which is 4-byte on Arm32. 
AFAICT, there are no 64-bit value used in struct param_hypfs. So it 
should be fine.

That said, I think this is worth mentioning in the commit message.

The rest of this patch looks good to me.

Cheers,

-- 
Julien Grall

