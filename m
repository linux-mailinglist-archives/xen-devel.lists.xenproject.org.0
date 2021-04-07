Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D0A3569E9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 12:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106606.203853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU5b4-0002xG-OM; Wed, 07 Apr 2021 10:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106606.203853; Wed, 07 Apr 2021 10:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU5b4-0002wr-Kt; Wed, 07 Apr 2021 10:39:42 +0000
Received: by outflank-mailman (input) for mailman id 106606;
 Wed, 07 Apr 2021 10:39:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU5b3-0002wm-JT
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 10:39:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aef715d6-6f27-4666-968b-5216d1c66c36;
 Wed, 07 Apr 2021 10:39:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 975B8B121;
 Wed,  7 Apr 2021 10:39:39 +0000 (UTC)
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
X-Inumbo-ID: aef715d6-6f27-4666-968b-5216d1c66c36
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617791979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmzeUKaM7jluEFAU+2gUICT9L6pW6MmGEPiXK3fkEsI=;
	b=oAYX+gNzZYjNLOmUvUnemAJjDEHvaBtkFGZ9hCwD4mnr7HyvM35aDzd5IcySLMy32DMvj5
	L+rpalq2mr2+HB6oVGBomI92q7vFAX7V+5/+X6ryfZ7191z0tg48Efw+S2pXe2R0aSq3Kh
	BedostC3r4yaxm+NerNUsJWKObv+1FI=
Subject: Re: [PATCH 2/2] xen/gunzip: Allow perform_gunzip() to be called
 multiple times
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210402152105.29387-1-julien@xen.org>
 <20210402152105.29387-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2caf0bed-9a31-64a8-e764-2ed222f2e828@suse.com>
Date: Wed, 7 Apr 2021 12:39:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210402152105.29387-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.04.2021 17:21, Julien Grall wrote:
> --- a/xen/common/inflate.c
> +++ b/xen/common/inflate.c
> @@ -238,6 +238,12 @@ STATIC const ush mask_bits[] = {
>  static unsigned long INITDATA malloc_ptr;
>  static int INITDATA malloc_count;
>  
> +static void init_allocator(void)
> +{
> +    malloc_ptr = free_mem_ptr;
> +    malloc_count = 0;
> +}
> +
>  static void *INIT malloc(int size)
>  {
>      void *p;

I'm sorry for noticing this only now, but I'm afraid this may break
the build in certain environments / configurations. Iirc clang is
relatively likely to not inline functions in debug builds even when
they're used just once. Yet when the new function doesn't end up
getting inlined, it needs INIT added or else the cmd_obj_init_o
checking would find a non-empty .text section. (If there's no actual
build breakage anywhere, I can also address this in my to-be-re-based
"gunzip: drop INIT{,DATA} and STATIC", which is intended to go in as
soon as the tree is fully open again.)

Jan

