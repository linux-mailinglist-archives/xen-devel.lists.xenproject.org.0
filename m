Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8335C2D118E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 14:14:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46521.82552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGLC-000441-G2; Mon, 07 Dec 2020 13:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46521.82552; Mon, 07 Dec 2020 13:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGLC-00043c-Co; Mon, 07 Dec 2020 13:14:10 +0000
Received: by outflank-mailman (input) for mailman id 46521;
 Mon, 07 Dec 2020 13:14:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmGLB-00043X-05
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 13:14:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 873f223c-2466-4295-b409-3b3d045abf8c;
 Mon, 07 Dec 2020 13:14:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA082B230;
 Mon,  7 Dec 2020 13:14:05 +0000 (UTC)
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
X-Inumbo-ID: 873f223c-2466-4295-b409-3b3d045abf8c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607346846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ozoHlERTnRf1v54W16lmh/TxgYpprdxVJriZr/tiJeQ=;
	b=mtEMjVnMiYVAZMsC35ssNYGcYZGq4YLp7Z9E5UmPhCWOveoyQa8kvNLkmmWSk9fpznECFH
	yCP8Lodc8u/Lf4P5krI2lXfup0Y08ERrsemYvPKIe6sL+dtwgKlzsGo0JYZ+0iwsk4H+XS
	NbYjp+8ovBdCvg9mrY+NqEX8P6dcUwU=
Subject: Re: [PATCH v3] x86/vmap: handle superpages in vmap_to_mfn()
To: Hongyan Xia <hx242@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <8e7a12064c68a1743dd3bd8c38feae2abea24071.1607345364.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8cccd3c1-04a3-3fcf-df6f-d33fb27dfe4e@suse.com>
Date: Mon, 7 Dec 2020 14:14:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <8e7a12064c68a1743dd3bd8c38feae2abea24071.1607345364.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.12.2020 13:49, Hongyan Xia wrote:
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -175,6 +175,7 @@ bool scrub_free_pages(void);
>  } while ( false )
>  #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>  
> +mfn_t xen_map_to_mfn(unsigned long va);
>  /* Map machine page range in Xen virtual address space. */
>  int map_pages_to_xen(
>      unsigned long virt,
> 

This really would have wanted to be below the sibling functions
and then, following suit, have a one line comment. Will adjust
while committing; sorry to be picky.

Jan

