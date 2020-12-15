Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BFE2DAC39
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 12:47:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53105.92679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp8nB-0000zN-Dd; Tue, 15 Dec 2020 11:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53105.92679; Tue, 15 Dec 2020 11:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp8nB-0000yy-9w; Tue, 15 Dec 2020 11:46:57 +0000
Received: by outflank-mailman (input) for mailman id 53105;
 Tue, 15 Dec 2020 11:46:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kp8nA-0000yt-M0
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 11:46:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c7695e8-3ac9-45f2-87ef-d39ae0952a22;
 Tue, 15 Dec 2020 11:46:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31166AE47;
 Tue, 15 Dec 2020 11:46:55 +0000 (UTC)
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
X-Inumbo-ID: 6c7695e8-3ac9-45f2-87ef-d39ae0952a22
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608032815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+SdqzB7SHYA0yvvwrceSWNi9LB3HOCaaAdfNrtqXBsk=;
	b=XLMwb8g2HuTM2hZslwYUXMJXySEX7rsBgtReNBTQsQeAHpvARXgfGXK94xPFLeklcEynQ1
	WfDz+AfvnHrmP3hNxYJ64l/BfMf/neURNYOvEDUCX5lrItmng92Q0wCQP57XIn3jYULk2N
	MMKIOsD2tNLbQDh0UbSg4GRGuU/p5cM=
Subject: Re: [PATCH] xen: Rework WARN_ON() to return whether a warning was
 triggered
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201215112610.1986-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5ac88e6-4e06-553d-2996-d2b027acd782@suse.com>
Date: Tue, 15 Dec 2020 12:46:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215112610.1986-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.12.2020 12:26, Julien Grall wrote:
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -23,7 +23,13 @@
>  #include <asm/bug.h>
>  
>  #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
> -#define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
> +#define WARN_ON(p)  ({                  \
> +    bool __ret_warn_on = (p);           \

Please can you avoid leading underscores here?

> +                                        \
> +    if ( unlikely(__ret_warn_on) )      \
> +        WARN();                         \
> +    unlikely(__ret_warn_on);            \
> +})

Is this latter unlikely() having any effect? So far I thought it
would need to be immediately inside a control construct or be an
operand to && or ||.

Jan

