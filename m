Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574762CB7E5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 09:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42488.76413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkNyX-00006A-QQ; Wed, 02 Dec 2020 08:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42488.76413; Wed, 02 Dec 2020 08:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkNyX-00005k-Md; Wed, 02 Dec 2020 08:59:01 +0000
Received: by outflank-mailman (input) for mailman id 42488;
 Wed, 02 Dec 2020 08:59:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkNyW-00005f-GH
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 08:59:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2abb743c-6879-4ff1-86ae-dac99a2c597e;
 Wed, 02 Dec 2020 08:58:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AFA5EAC2E;
 Wed,  2 Dec 2020 08:58:58 +0000 (UTC)
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
X-Inumbo-ID: 2abb743c-6879-4ff1-86ae-dac99a2c597e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606899538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgDcdo3kxp9iMlIVlrHmxSpNRhD+3tvODEGKA7L2EgI=;
	b=hlD9DY3VIbOLY5VGAh0tw2YqjCupVPZ+eDuPhi6wAk5vQG0MAEY2X8QKXL+b6oMTkdmk7s
	eVquVu488AWlcMk/zS4DgPZ3gvCfi5vFmd3BL1N70rWraYPFFkV4kL2M3WQGPcElrOVd7z
	OZYldNTZ2RHh4Bm3iC73NE6rYfQXx08=
Subject: Re: [PATCH v2 06/17] xen/cpupool: use ERR_PTR() for returning error
 cause from cpupool_create()
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-7-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08f377a7-7862-0597-fe42-98851dc3db37@suse.com>
Date: Wed, 2 Dec 2020 09:58:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201082128.15239-7-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 09:21, Juergen Gross wrote:
> Instead of a pointer to an error variable as parameter just use
> ERR_PTR() to return the cause of an error in cpupool_create().
> 
> This propagates to scheduler_alloc(), too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one small question:

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -3233,26 +3233,25 @@ struct scheduler *scheduler_get_default(void)
>      return &ops;
>  }
>  
> -struct scheduler *scheduler_alloc(unsigned int sched_id, int *perr)
> +struct scheduler *scheduler_alloc(unsigned int sched_id)
>  {
>      int i;
> +    int ret;

I guess you didn't merge this with i's declaration because of a
plan/hope for i to be converted to unsigned int?

Jan

