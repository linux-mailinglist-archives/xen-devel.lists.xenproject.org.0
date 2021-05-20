Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4618138AE64
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 14:35:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130951.245008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhtu-0000ha-A1; Thu, 20 May 2021 12:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130951.245008; Thu, 20 May 2021 12:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhtu-0000eE-5F; Thu, 20 May 2021 12:35:42 +0000
Received: by outflank-mailman (input) for mailman id 130951;
 Thu, 20 May 2021 12:35:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljhts-0000e7-Hr
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 12:35:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bcdae2e4-fadc-42ba-9fbe-e2363bc36753;
 Thu, 20 May 2021 12:35:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1741ABE8;
 Thu, 20 May 2021 12:35:38 +0000 (UTC)
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
X-Inumbo-ID: bcdae2e4-fadc-42ba-9fbe-e2363bc36753
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621514139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BBQQpskrfLGC7oDL2URbXUpCHF5nSRPkk5RgOsObezE=;
	b=J9iWCncbh4BHRAi5BxHjxXLPx3nSk0k73jdqsWW/s5Q1IIARfNVw6BmRrrSeS96vFmQu5B
	Rg+jnCJhwtO/O7X2yH/Wx+dFYkdaKrIZozq/L+IzoOiHz0S9Gu9hzETgt5HtAPDC5awS+u
	nhw8Egt7YCgBZKMgqUvWC6NHZKcHKOs=
Subject: Re: [PATCH v3 1/2] libelf: don't attempt to parse __xen_guest for PVH
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210520123012.89855-1-roger.pau@citrix.com>
 <20210520123012.89855-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <29ecaaaf-d096-e8af-fc6f-292ff2b3d5ae@suse.com>
Date: Thu, 20 May 2021 14:35:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210520123012.89855-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.05.2021 14:30, Roger Pau Monne wrote:
> The legacy __xen_guest section doesn't support the PHYS32_ENTRY
> elfnote, so it's pointless to attempt to parse the elfnotes from that
> section when called from an hvm container.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - New in this version.
> ---
>  xen/common/libelf/libelf-dominfo.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
> index 69c94b6f3bb..abea1011c18 100644
> --- a/xen/common/libelf/libelf-dominfo.c
> +++ b/xen/common/libelf/libelf-dominfo.c
> @@ -577,10 +577,8 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
>  
>      }
>  
> -    /*
> -     * Finally fall back to the __xen_guest section.
> -     */
> -    if ( xen_elfnotes == 0 )
> +    /* Finally fall back to the __xen_guest section for PV guests only. */
> +    if ( xen_elfnotes == 0 && !hvm )

Isn't this depending on the 2nd patch adding the function parameter?
IOW doesn't this break the build, even if just transiently? With the
respective hunk from patch 2 moved here
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

