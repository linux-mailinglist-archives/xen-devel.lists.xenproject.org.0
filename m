Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AF766DFCD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 15:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479467.743338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmXW-0005yw-Ph; Tue, 17 Jan 2023 14:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479467.743338; Tue, 17 Jan 2023 14:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmXW-0005wx-Mo; Tue, 17 Jan 2023 14:02:14 +0000
Received: by outflank-mailman (input) for mailman id 479467;
 Tue, 17 Jan 2023 14:02:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHmXV-0005wb-N9
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 14:02:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmXV-0001Ju-0w; Tue, 17 Jan 2023 14:02:13 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmXU-0007w8-Rl; Tue, 17 Jan 2023 14:02:12 +0000
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
	bh=/X8jrnSsy3ohe3W7ubaG0ogIm+jS9rlJkZ3O3/ly00k=; b=FJiJgtMXsM3kIuu6Z4Q7Yu6xFs
	kO+uRBPTBWrFnkGjTFYay+5n8kgpiX+qUw3EXcexpitdjMsTV6AJ3leiAmi/vmYjecBsQBNTVGDSk
	6ca031F821aaANBVBbXPgrLt+5KinUjge+qFFXRYu5rH+jQt27COIKdhpwCALznuLO0s=;
Message-ID: <a944a5ea-0e9f-add6-cbe7-8b06054c637a@xen.org>
Date: Tue, 17 Jan 2023 14:02:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 04/17] tools/xenstore: introduce dummy nodes for
 special watch paths
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-5-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117091124.22170-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 17/01/2023 09:11, Juergen Gross wrote:
> +static void fire_special_watches(const char *name)
> +{
> +	void *ctx = talloc_new(NULL);
> +	struct node *node;
> +
> +	if (!ctx)
> +		return;
> +
> +	node = read_node(NULL, ctx, name);
> +
> +	if (node)
> +		fire_watches(NULL, ctx, name, node, true, NULL);
> +	else
> +		syslog(LOG_ERR, "special node %s not found\n", name);

NIT: How about using log() so it is also printed in the trace log? This 
would be handy to avoid having to check multiple log files.

With or without:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

