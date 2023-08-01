Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A207776BF54
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 23:34:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574545.899912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQx0J-0003Yv-8A; Tue, 01 Aug 2023 21:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574545.899912; Tue, 01 Aug 2023 21:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQx0J-0003Vo-5S; Tue, 01 Aug 2023 21:34:07 +0000
Received: by outflank-mailman (input) for mailman id 574545;
 Tue, 01 Aug 2023 21:34:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qQx0H-0003Vi-Sm
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 21:34:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQx0H-0000D3-70; Tue, 01 Aug 2023 21:34:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQx0H-0001X9-1w; Tue, 01 Aug 2023 21:34:05 +0000
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
	bh=tnhdVY1efL6wdvUGeDL7OkJOXxe7OXVl6sH5Tez9BSU=; b=a6TFJhlyi3VeShbff21naQM42C
	9xtV1nCaKXXrXo950RhzqFLzh2/8pFIqSo6OWGGiub9m2HWbgZsMVgSRec/8OgafqKbc6pviDpJC7
	O28TVkZITPT4ZC2YV9S2VPvSvDzHz3YD7HFTFyIkpkyd1/bhdv5WPXFT9uiLbRq8Dp1E=;
Message-ID: <dc888f49-0e9e-cce3-541e-9eb6cc6d599b@xen.org>
Date: Tue, 1 Aug 2023 22:34:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 19/25] tools/xenstore: use struct node_hdr in struct
 node
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-20-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230724110247.10520-20-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/07/2023 12:02, Juergen Gross wrote:
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index c72fc0c725..404ecd0c62 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -555,6 +555,12 @@ static void initialize_fds(int *p_sock_pollfd_idx, int *ptimeout)
>   	}
>   }
>   
> +static size_t calc_node_acc_size(struct node_hdr *hdr)

The parameter can be const.

> +{
> +	return sizeof(*hdr) + hdr->num_perms * sizeof(struct xs_permissions) +
> +	       hdr->datalen + hdr->childlen;
> +}
> +

[...]

> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
> index 9cb4c2f3eb..adf8a785fc 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -181,6 +181,7 @@ extern struct list_head connections;
>    */
>   struct node_hdr {
>   	uint64_t generation;
> +#define NO_GENERATION ~((uint64_t)0)
>   	uint16_t num_perms;
>   	uint16_t datalen;
>   	uint32_t childlen;
> @@ -197,6 +198,10 @@ struct node_account_data {
>   };
>   
>   struct node {
> +	/* Data direct for data base. */

I can't parse it. Did you mean 'from' rather than 'for'?

> +	struct node_hdr hdr;
> +
> +	/* Xenstore path. */
>   	const char *name;
>   	/* Name used to access data base. */
>   	const char *db_name;
> @@ -204,20 +209,13 @@ struct node {
>   	/* Parent (optional) */
>   	struct node *parent;
Cheers,

-- 
Julien Grall

