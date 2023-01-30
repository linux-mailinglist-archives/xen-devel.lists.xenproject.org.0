Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0C4680D53
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 13:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486965.754420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMT3Q-0008Ih-JM; Mon, 30 Jan 2023 12:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486965.754420; Mon, 30 Jan 2023 12:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMT3Q-0008Gv-GA; Mon, 30 Jan 2023 12:14:32 +0000
Received: by outflank-mailman (input) for mailman id 486965;
 Mon, 30 Jan 2023 12:14:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMT3P-0008Gp-6B
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 12:14:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMT3O-00086f-Vd; Mon, 30 Jan 2023 12:14:30 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.10.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMT3O-0007dt-Nh; Mon, 30 Jan 2023 12:14:30 +0000
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
	bh=OvXXU34ce5Mb0tZ0C8e9ecgmuP5zlLcUybBBTrKXRfk=; b=tbqjpoAVtSiXxUnghNatg7xnYD
	Eh0Sxq04sYQZvMbvt6K8n34H/CjDJXTjuo4kJYoqQaOOGE7mvOagqiu51SVPDe66mhETRg9MgH7ui
	b3G/rNkvrjtj36t2FjvJVTFN6fEtZ0h0CfBduV/0C1y8HQjmUyRfA7JV8WphOEq+SZHY=;
Message-ID: <2fc53558-ceb9-af6f-a349-961f0f17c83f@xen.org>
Date: Mon, 30 Jan 2023 12:14:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/3] xen/public: move xenstore related doc into 9pfs.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230130100813.3298-1-jgross@suse.com>
 <20230130100813.3298-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230130100813.3298-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/01/2023 10:08, Juergen Gross wrote:
> The Xenstore related documentation is currently to be found in
> docs/misc/9pfs.pandoc, instead of the related header file
> xen/include/public/io/9pfs.h like for most other paravirtualized
> device protocols.
> 
> There is a comment in the header pointing at the document, but the
> given file name is wrong. Additionally such headers are meant to be
> copied into consuming projects (Linux kernel, qemu, etc.), so pointing
> at a doc file in the Xen git repository isn't really helpful for the
> consumers of the header.
> 
> This situation is far from ideal, which is already being proved by the
> fact that neither qemu nor the Linux kernel are implementing the
> device attach/detach protocol correctly.
> 
> Change that by moving the Xenstore related 9pfs documentation from
> docs/misc/9pfs.pandoc into xen/include/public/io/9pfs.h.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - add reference to header in the pandoc document (Jan Beulich)
> V3:
> - fix flaw in the connection sequence
> V4:
> - split patch (Julien Grall)

Thanks for the split. I have checked before and after and they look the 
same to me.

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

