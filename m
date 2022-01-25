Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D73F49B7AB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 16:32:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260481.450026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNnw-0003Bx-Sl; Tue, 25 Jan 2022 15:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260481.450026; Tue, 25 Jan 2022 15:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNnw-00039v-PZ; Tue, 25 Jan 2022 15:32:20 +0000
Received: by outflank-mailman (input) for mailman id 260481;
 Tue, 25 Jan 2022 15:32:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nCNnw-00039p-3L
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 15:32:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCNnv-0000LS-2q; Tue, 25 Jan 2022 15:32:19 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.30.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCNnu-00080I-O0; Tue, 25 Jan 2022 15:32:19 +0000
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
	bh=PDVAWR45MqEbBzz+7kGt4NMpMqyMyskmpLpMaxPXMUI=; b=5qKB8VdRXEVFl4Etn2HDoL/7KV
	U6A7qMyWJgsBMlS3pjaFTSH745+rmYJdSu0ua6W/sPbd64cx64eEfV5mUtwzBO8MD89oBAxwHh6gr
	hoI8RzmzdN4tGx5nWkM+6t1KrgBdMmrZNnTyxwQCWI1tu/FqVntDHFNF2EllrNviqmRQ=;
Message-ID: <8644d37a-49aa-8d9f-03ea-955d97a1cc28@xen.org>
Date: Tue, 25 Jan 2022 15:32:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] libxl: force netback to wait for hotplug execution before
 connecting
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, James Dingwall <james-xen@dingwall.me.uk>,
 Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>
References: <20220124160248.37861-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220124160248.37861-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 24/01/2022 16:02, Roger Pau Monne wrote:
> By writing an empty "hotplug-status" xenstore node in the backend path
> libxl can force Linux netback to wait for hotplug script execution
> before proceeding to the 'connected' state.

I was actually chasing the same issue today :).

> 
> This is required so that netback doesn't skip state 2 (InitWait) and

Technically netback never skip state 2 (otherwise it would always be 
reproducible). Instead, libxl may not be able to observe state 2 because 
receive a watch is asynchronous and doesn't contain the value of the 
node. So the backend may have moved to Connected before the state is read.

> thus blocks libxl waiting for such state in order to launch the
> hotplug script (see libxl__wait_device_connection).
> 
> Reported-by: James Dingwall <james-xen@dingwall.me.uk>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Tested-by: James Dingwall <james-xen@dingwall.me.uk>

I could easily reproduced by adding a sleep(1) before reading the key 
and use 'xl network-attach ...'.

Tested-by: Julien Grall <jgrall@amazon.com>

> ---
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Paul Durrant <paul@xen.org>
> ---
>   tools/libs/light/libxl_nic.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
> index 0b45469dca..0b9e70c9d1 100644
> --- a/tools/libs/light/libxl_nic.c
> +++ b/tools/libs/light/libxl_nic.c
> @@ -248,6 +248,13 @@ static int libxl__set_xenstore_nic(libxl__gc *gc, uint32_t domid,
>       flexarray_append(ro_front, "mtu");
>       flexarray_append(ro_front, GCSPRINTF("%u", nic->mtu));
>   
> +    /*
> +     * Force backend to wait for hotplug script execution before switching to
> +     * connected state.
> +     */
> +    flexarray_append(back, "hotplug-status");
> +    flexarray_append(back, "");
> +
>       return 0;
>   }
>   

Cheers,

-- 
Julien Grall

