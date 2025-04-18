Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B362A9400E
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 00:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959550.1351885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5uY5-0008Mt-Sv; Fri, 18 Apr 2025 22:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959550.1351885; Fri, 18 Apr 2025 22:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5uY5-0008Ke-QF; Fri, 18 Apr 2025 22:51:05 +0000
Received: by outflank-mailman (input) for mailman id 959550;
 Fri, 18 Apr 2025 22:51:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u5uY4-0008KY-Hf
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 22:51:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u5uY4-006U3f-0W;
 Fri, 18 Apr 2025 22:51:04 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u5uY3-001Ajk-20;
 Fri, 18 Apr 2025 22:51:03 +0000
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
	bh=GYl0LF6TbQRhdVlZUEofv6vEkP+8e1v8dM4edRTI5M8=; b=UjQXMBeZz1ymc8nC03vkvpnK/z
	RbksqpeXlq3YxcLD3VPLV4XNvGV7sefYYXMPO4MS1jt0+Cx7ug4b+BGr8hykjJOBpW7E4Gp8c+uNN
	Yznp5Qg0+OA3JqpFWJ8JK07rekwnL84v3j9HOcgW2g9Jw4jIyD7oTb9Tkw0WeK2HWAbA=;
Message-ID: <43ce15d8-bf94-4b3c-9c2e-d1121476056f@xen.org>
Date: Sat, 19 Apr 2025 07:50:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenstored: Remove setjmp.h
Content-Language: en-GB
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250418205933.542150-1-jason.andryuk@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250418205933.542150-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jason,

On 19/04/2025 05:59, Jason Andryuk wrote:
> Use of setjmp/longjmp as removed in 2006, but the include remained.
> Remove it now.
> 
> Fixes: 1bac3b49cd ("Import the current version of talloc...")

The subject truncation is ok however for the commit ID, we are expecting 
12 characters (see docs/process/sending-patches.pandoc).


> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

With the remark above addressed (can be fixed on commit):

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
> I truncated the Fixes above.  The full line is:
> Fixes: 1bac3b49cd ("Import the current version of talloc from the Samba 3 source base.  This gives us greater confidence that our talloc implementation is "known good".  Remove the OOM handling from consider_message: talloc_set_fail_handler is no longer supported.")
 > --->   tools/xenstored/core.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> index 91b2530e5c..835402af81 100644
> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -35,7 +35,6 @@
>   #include <getopt.h>
>   #include <signal.h>
>   #include <assert.h>
> -#include <setjmp.h>
>   
>   #include <xenevtchn.h>
>   #include <xen-tools/xenstore-common.h>

Cheers,

-- 
Julien Grall


