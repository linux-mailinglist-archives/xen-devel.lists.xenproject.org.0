Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FFD732147
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 23:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549891.858688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9u8H-0002zP-D9; Thu, 15 Jun 2023 21:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549891.858688; Thu, 15 Jun 2023 21:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9u8H-0002w8-9f; Thu, 15 Jun 2023 21:03:53 +0000
Received: by outflank-mailman (input) for mailman id 549891;
 Thu, 15 Jun 2023 21:03:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q9u8F-0002u4-36
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 21:03:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9u8E-0007Lh-V6; Thu, 15 Jun 2023 21:03:50 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.16.225]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9u8E-0003HR-PM; Thu, 15 Jun 2023 21:03:50 +0000
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
	bh=4lIIcwgkI0NoCd2u6GpHXGsiddOZrXBXEq5OOp2uMMM=; b=hlXTc7UnQgnANb5uxIADiyElfn
	piwIwe9KK7+G32fU6R5IqbBzDGDg32CDAHE7kRPJAIJhctDLCHPE7DSdvufHGAP3hBtCf75T8XIT/
	+KwR916739hRZSg+jl7IRnIp5Op2nSzQh+/XSVlmLGYGZbg1wYMIepgLV/HPvSLwepFQ=;
Message-ID: <ad36d727-0dd6-d6a2-863c-26b3298a3202@xen.org>
Date: Thu, 15 Jun 2023 22:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 13/16] tools/xenstore: replace xs_lib.c with a header
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-14-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530085418.5417-14-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:54, Juergen Gross wrote:
> Instead of including the same small C source in multiple binaries from
> 2 source directories, use a header file with inline functions as a
> replacement.
> 
> As some of the functions are exported by libxenstore, rename the inline
> functions from xs_*() do xenstore_*() and add xs_*() wrappers to
> libxenstore.
> 
> With that no sources required to build libxenstore are left in
> tools/xenstore, so the file COPYING can be removed now.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

