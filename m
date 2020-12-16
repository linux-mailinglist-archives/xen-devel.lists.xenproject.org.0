Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593212DC3BB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 17:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55320.96411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpZLk-0002tA-3W; Wed, 16 Dec 2020 16:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55320.96411; Wed, 16 Dec 2020 16:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpZLk-0002sl-00; Wed, 16 Dec 2020 16:08:24 +0000
Received: by outflank-mailman (input) for mailman id 55320;
 Wed, 16 Dec 2020 16:08:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZEz=FU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpZLi-0002sg-IV
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 16:08:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0f2a1fe-9111-45d2-bee5-daef275fa2f3;
 Wed, 16 Dec 2020 16:08:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC6B6AC7B;
 Wed, 16 Dec 2020 16:08:20 +0000 (UTC)
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
X-Inumbo-ID: d0f2a1fe-9111-45d2-bee5-daef275fa2f3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608134900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsRCeq+rPE4IAYzCn2gq/2a9pbnYQYIqEpJ9q37JRlo=;
	b=uio/ASaCVb4BdCdy6QTxE2elZTOdujvuRtg6Vfgl6CuxoKXb1SxHuUzRxSm9Q3hIlrvbph
	t8P/6uWX6/7iuNIjJe5TssDH2mmgNReOu/1B80SgElwSwqOOxVEP1rN6GR/Ux01Jh1HffI
	3EeHvbT0G8KStEnPsIvyD6lMtxiL8Lc=
Subject: Re: [PATCH v3 2/8] xen/hypfs: switch write function handles to const
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bdd553b4-968a-ff71-4bac-2824f86ba869@suse.com>
Date: Wed, 16 Dec 2020 17:08:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201209160956.32456-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 17:09, Juergen Gross wrote:
> --- a/xen/include/xen/guest_access.h
> +++ b/xen/include/xen/guest_access.h
> @@ -26,6 +26,11 @@
>      type *_x = (hnd).p;                         \
>      (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
>  })
> +/* Same for casting to a const type. */
> +#define guest_handle_const_cast(hnd, type) ({       \
> +    const type *_x = (const type *)((hnd).p);       \
> +    (XEN_GUEST_HANDLE_PARAM(const_##type)) { _x };  \
> +})

Afaict this allow casting from e.g. uint to const_ulong. We
don't want to permit this (i.e. if really needed one is to
go through two steps). I think all it takes is dropping the
cast:

#define guest_handle_const_cast(hnd, type) ({      \
    const type *_x = (hnd).p;                      \
    (XEN_GUEST_HANDLE_PARAM(const_##type)) { _x }; \
})

With this
Reviewed-by: Jan Beulich <jbeulich@suse.com>
and I'd be okay making the adjustment while committing
(provided it works and I didn't overlook anything).

Jan

