Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BCA35BA43
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 08:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108806.207593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVqKf-0003mg-5Z; Mon, 12 Apr 2021 06:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108806.207593; Mon, 12 Apr 2021 06:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVqKf-0003mH-1j; Mon, 12 Apr 2021 06:46:01 +0000
Received: by outflank-mailman (input) for mailman id 108806;
 Mon, 12 Apr 2021 06:46:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqkM=JJ=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lVqKe-0003mC-2A
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 06:46:00 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cd3c1913-bcbc-4ddb-8ec2-adc024b06e12;
 Mon, 12 Apr 2021 06:45:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EEAA1FB;
 Sun, 11 Apr 2021 23:45:58 -0700 (PDT)
Received: from [10.57.12.29] (unknown [10.57.12.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C3983F73B;
 Sun, 11 Apr 2021 23:45:57 -0700 (PDT)
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
X-Inumbo-ID: cd3c1913-bcbc-4ddb-8ec2-adc024b06e12
Subject: Re: [PATCH v2] xen/arm: kernel: Propagate the error if we fail to
 decompress the kernel
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>
References: <20210406191554.12012-1-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <591603c5-ebcb-e9d6-74a0-bed921458a69@arm.com>
Date: Mon, 12 Apr 2021 08:45:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406191554.12012-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.04.2021 21:15, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, we are ignoring any error from perform_gunzip() and replacing
> the compressed kernel with the "uncompressed" kernel.
> 
> If there is a gzip failure, then it means that the output buffer may
> contain garbagge. So it can result to various sort of behavior that may
> be difficult to root cause.
> 
> In case of failure, free the output buffer and propagate the error.
> We also need to adjust the return check for kernel_compress() as
> perform_gunzip() may return a positive value.
> 
> Take the opportunity to adjust the code style for the check.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - Fix build
> ---

Reviewed-by: Michal Orzel <michal.orzel@arm.com>

