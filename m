Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1960F7F1D33
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 20:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637165.992941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r59mm-00058i-18; Mon, 20 Nov 2023 19:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637165.992941; Mon, 20 Nov 2023 19:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r59ml-00056v-UQ; Mon, 20 Nov 2023 19:18:19 +0000
Received: by outflank-mailman (input) for mailman id 637165;
 Mon, 20 Nov 2023 19:18:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r59mk-00055L-3o
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 19:18:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r59mj-0005oz-Ux; Mon, 20 Nov 2023 19:18:17 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.18.184]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r59mj-0001SP-Oc; Mon, 20 Nov 2023 19:18:17 +0000
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
	bh=jo+ueBqGTAYWIiofWBvW2q/gkJqLh3UTeecc3I580lg=; b=MCH321xxsGmp5BV2jWxnO8qyj1
	kHVnGBA64eqXkwsvd/kvoyXwPz9iL1CiS3V80dzMJxp461w7Bbf4eyOHKUWuEeCj3T9YsJJSKncIi
	lH7kuVzkPWHMvB/eXYwu68Asjma+uxDnJJZ9BokeOyjFE2hmVK76OhYxkL504xfY8hzw=;
Message-ID: <1a726005-ba0e-426b-9b65-5975a924cad5@xen.org>
Date: Mon, 20 Nov 2023 19:18:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/treewide: Switch bool_t to bool
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231120145623.167383-1-andrew.cooper3@citrix.com>
 <20231120145623.167383-3-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231120145623.167383-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 20/11/2023 14:56, Andrew Cooper wrote:
> @@ -1662,7 +1662,7 @@ int dt_device_get_irq(const struct dt_device_node *device, unsigned int index,
>       return dt_irq_translate(&raw, out_irq);
>   }
>   
> -bool_t dt_device_is_available(const struct dt_device_node *device)
> +bool dt_device_is_available(const struct dt_device_node *device)
>   {
>       const char *status;
>       u32 statlen;
> @@ -1680,7 +1680,7 @@ bool_t dt_device_is_available(const struct dt_device_node *device)
>       return 0;

Just because it is in context, shouldn't this now be 'return false'? 
There might be others, but they can be modified afterwards (this patch 
is already large).

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

