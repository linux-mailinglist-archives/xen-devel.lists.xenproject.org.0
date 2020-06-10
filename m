Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486F1F5AD5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 19:56:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj4wd-00089g-A2; Wed, 10 Jun 2020 17:55:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pg3b=7X=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jj4wb-00089b-QN
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 17:55:21 +0000
X-Inumbo-ID: 8cab3e37-ab43-11ea-b489-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8cab3e37-ab43-11ea-b489-12813bfff9fa;
 Wed, 10 Jun 2020 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UIlZ2rCWAh8yT4IfFSBZfAoUNNIXV8ICfJlH0tseq+I=; b=Yk0n0AJhh2jjqQGcSWwZqOvMZk
 cCctRMKChqnov/0W8dAPAvmmAu7EskQnKFklHhd5aVU3yxp6v19HIR5sm4+RTz6/HPg61r3RRnJ3Y
 ajIFzODDZT0hfgnlPNZ8cUo0gKiTx2/Qazs0eyKOOnU9Up3wyiE4RKFHedQ1JMQOfvZY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jj4wY-0004ri-BV; Wed, 10 Jun 2020 17:55:18 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jj4wY-00005u-4I; Wed, 10 Jun 2020 17:55:18 +0000
Subject: Re: [PATCH for-4.14] xen/hypfs: fix loglvl parameter setting
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200609154546.4531-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4a3c4e5e-1fbd-5017-1e3e-64052ae2410a@xen.org>
Date: Wed, 10 Jun 2020 18:55:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609154546.4531-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,

On 09/06/2020 16:45, Juergen Gross wrote:
> Writing the runtime parameters loglvl or guest_loglvl omits setting the
> new length of the resulting parameter value.
> 
> Reported-by: George Dunlap <george.dunlap@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Although one unrelated comment below.

> ---
>   xen/drivers/char/console.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 56e24821b2..861ad53a8f 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -241,14 +241,25 @@ static int _parse_loglvl(const char *s, int *lower, int *upper, char *val)
>   
>   static int parse_loglvl(const char *s)
>   {
> -    return _parse_loglvl(s, &xenlog_lower_thresh, &xenlog_upper_thresh,
> -                         xenlog_val);
> +    int ret;
> +
> +    ret = _parse_loglvl(s, &xenlog_lower_thresh, &xenlog_upper_thresh,
> +                        xenlog_val);
> +    custom_runtime_set_var(param_2_parfs(parse_loglvl), xenlog_val);

Mixing function and variable name is pretty confusing. It took me 
sometimes to go through the macro maze to figure out what's happening.

It might be worth thinking to document more the custom_runtime_* interface.

Cheers,

-- 
Julien Grall

