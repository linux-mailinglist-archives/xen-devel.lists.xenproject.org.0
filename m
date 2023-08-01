Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCFA76C009
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 00:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574560.899942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQxQA-00086e-Jq; Tue, 01 Aug 2023 22:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574560.899942; Tue, 01 Aug 2023 22:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQxQA-00084L-HB; Tue, 01 Aug 2023 22:00:50 +0000
Received: by outflank-mailman (input) for mailman id 574560;
 Tue, 01 Aug 2023 22:00:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qQxQ9-00084F-Mt
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 22:00:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQxQ8-0000oj-V7; Tue, 01 Aug 2023 22:00:48 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qQxQ8-0002a3-PG; Tue, 01 Aug 2023 22:00:48 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=gLfJupRwQ7HYE1cXcogQMMCy5YqnUZMWBbvO46IEjB0=; b=l2ksIYWLtQhr8tUB86lXcO3F0h
	M7I50l7QzaUmCi2JZLE1nx4qOMRMkDivIsuz7MxzgxlOLu6fKtU+XUTp1dLQOUnX0+qEjbVqre/Ea
	scyMRjWDk1LI8mSYNWY17VNzgG2Zx4OrtL8XqJTlP5LEsrLSoYoncIw2CQ68CQpdm2WQ=;
Message-ID: <ffbb1cfc-e99b-6d45-f123-f347c5897c88@xen.org>
Date: Tue, 1 Aug 2023 23:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-22-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 21/25] tools/xenstore: introduce read_node_nocopy()
In-Reply-To: <20230724110247.10520-22-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

Title: I can't find read_node_nocopy(). I found a read_node_const(). 
Which name did you intend to use?

On 24/07/2023 12:02, Juergen Gross wrote:
> +static int read_node_helper(struct connection *conn, struct node *node)
> +{
>   	/* Data is binary blob (usually ascii, no nul). */
> -	node->data = node->perms + hdr->num_perms;
> +	node->data = node->perms + node->hdr.num_perms;
>   	/* Children is strings, nul separated. */
>   	node->children = node->data + node->hdr.datalen;
>   
>   	if (domain_adjust_node_perms(node))
> -		goto error;
> +		return -1;

You are either returning 0 or -1 which is then only used in if ( ... ). 
Can we simply return a boolean (true for success, false for a failure)?

The rest LGTM.

>   
>   	/* If owner is gone reset currently accounted memory size. */
>   	if (node->acc.domid != get_node_owner(node))
>   		node->acc.memory = 0;
>   
>   	if (access_node(conn, node, NODE_ACCESS_READ, NULL))
> +		return -1;
> +
> +	return 0;
> +}

Cheers,

-- 
Julien Grall

