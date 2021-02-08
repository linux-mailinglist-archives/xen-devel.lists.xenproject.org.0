Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5DF313113
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 12:40:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82802.153034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l94u7-0008K2-Cn; Mon, 08 Feb 2021 11:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82802.153034; Mon, 08 Feb 2021 11:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l94u7-0008JX-9U; Mon, 08 Feb 2021 11:40:31 +0000
Received: by outflank-mailman (input) for mailman id 82802;
 Mon, 08 Feb 2021 11:40:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l94u5-0008JS-I8
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 11:40:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l94u2-0002aq-Ul; Mon, 08 Feb 2021 11:40:26 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l94u2-0000zS-Lb; Mon, 08 Feb 2021 11:40:26 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=zGrVRyh4Bb806FG6nBatBhxLklpw43eAz07n9qXefLM=; b=xB+0y4mG9nGyv+K0rMSe7assdJ
	Blahn0VgEg8Z2h3s3tSzkEDkVSLPk8YVcpox5SrzLQSMtLCND17pUY4746K1Rf/aCyLYeX05a6aBV
	LBMzMH6iJ7qhPg76qhe4KgSgnpBFn1GsWh29UzJj56x7WqovrDEFuHAPIWCJKjCGwgRQ=;
Subject: Re: [PATCH 7/7] xen/evtchn: read producer index only once
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-8-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8032d8a9-b28f-95e1-a5a8-e955ada4dc0a@xen.org>
Date: Mon, 8 Feb 2021 11:40:24 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210206104932.29064-8-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 06/02/2021 10:49, Juergen Gross wrote:
> In evtchn_read() use READ_ONCE() for reading the producer index in
> order to avoid the compiler generating multiple accesses.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   drivers/xen/evtchn.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
> index 421382c73d88..f6b199b597bf 100644
> --- a/drivers/xen/evtchn.c
> +++ b/drivers/xen/evtchn.c
> @@ -211,7 +211,7 @@ static ssize_t evtchn_read(struct file *file, char __user *buf,
>   			goto unlock_out;
>   
>   		c = u->ring_cons;
> -		p = u->ring_prod;
> +		p = READ_ONCE(u->ring_prod);
For consistency, don't you also need the write side in 
evtchn_interrupt() to use WRITE_ONCE()?

>   		if (c != p)
>   			break;
>   
> 

-- 
Julien Grall

