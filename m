Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC5780AE5
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 13:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586087.917307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxRS-0006Xe-Ab; Fri, 18 Aug 2023 11:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586087.917307; Fri, 18 Aug 2023 11:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxRS-0006VQ-7f; Fri, 18 Aug 2023 11:14:58 +0000
Received: by outflank-mailman (input) for mailman id 586087;
 Fri, 18 Aug 2023 11:14:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWxRQ-0006VK-MN
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 11:14:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxRQ-0007LM-2X; Fri, 18 Aug 2023 11:14:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxRP-0003oo-Tw; Fri, 18 Aug 2023 11:14:56 +0000
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
	bh=vkyk5z0RrPuXlI9VjUFgYqFqtIe3CTXpNWtpxkguEQ0=; b=HYd5R8RaVJPsPw0qrNQr5YrXAe
	pspDASf8wSf8Zi97ztF2V4Crqa1OqEiCTyY6QdJ3TcABUa0WQSPY+xitrHhvc66ywjBcZf/UDgX+Y
	CZKFZgmbAcwy3/w7KvYf5wBnXxI3h0LWCE2SeBhVGUPlLms4ak9XTgJrXIyq7aNfghuc=;
Message-ID: <9cecb6cf-de9b-4180-a5f6-68498c559d81@xen.org>
Date: Fri, 18 Aug 2023 12:14:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/19] tools/xenstore: rework get_node()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-17-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-17-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:47, Juergen Gross wrote:
> Today get_node_canonicalized() is the only caller of get_node().
> 
> In order to prepare introducing a get_node() variant returning a
> pointer to const struct node, do the following restructuring:
> 
> - move the call of read_node() from get_node() into
>    get_node_canonicalized()
> 
> - rename get_node() to get_node_chk_perm()
> 
> - rename get_node_canonicalized() to get_node()
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

