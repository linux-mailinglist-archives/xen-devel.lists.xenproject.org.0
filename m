Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBA96526BA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 20:03:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467267.726310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7hsH-0004ZC-7i; Tue, 20 Dec 2022 19:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467267.726310; Tue, 20 Dec 2022 19:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7hsH-0004X7-4m; Tue, 20 Dec 2022 19:02:01 +0000
Received: by outflank-mailman (input) for mailman id 467267;
 Tue, 20 Dec 2022 19:01:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7hsF-0004X1-27
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 19:01:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7hsD-0001XH-RS; Tue, 20 Dec 2022 19:01:57 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7hsD-0005FD-Lb; Tue, 20 Dec 2022 19:01:57 +0000
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
	bh=yF2gxX3+jtzDBkX7qBbRGR2i5XxlvcplZ8LVXDtzOvw=; b=w+HKfA+s0/HwwjrqIihisMev3s
	cxzUESNbqsDvTLZZRJ/9KkeXB38Jkjlfrzua9hXcKA0RvVXi8KLvzQujmFSXRkK3ca2VDfpzT7R2E
	ux/y4TibTYtKNwO4p5GeCzJEnWvgLa3gHrh2ajCHDBY9CEsecpTw7EweV7iTOsKqOl5k=;
Message-ID: <831c0e75-1a23-6210-9f5b-7212a6763dc3@xen.org>
Date: Tue, 20 Dec 2022 19:01:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 04/19] tools/xenstore: remove all watches when a domain
 has stopped
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-5-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221213160045.28170-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 13/12/2022 16:00, Juergen Gross wrote:
> When a domain has been released by Xen tools, remove all its
> registered watches. This avoids sending watch events to the dead domain
> when all the nodes related to it are being removed by the Xen tools.

AFAICT, the only user of the command in the tree is softreset. Would you 
be able to check this is still working as expected?

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - move call to do_release() (Julien Grall)
> ---
>   tools/xenstore/xenstored_domain.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index aa86892fed..e669c89e94 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -740,6 +740,9 @@ int do_release(const void *ctx, struct connection *conn,
>   	if (IS_ERR(domain))
>   		return -PTR_ERR(domain);
>   
> +	/* Avoid triggering watch events when the domain's nodes are deleted. */
> +	conn_delete_all_watches(domain->conn);
> +
>   	talloc_free(domain->conn);
>   
>   	send_ack(conn, XS_RELEASE);

Cheers,

-- 
Julien Grall

