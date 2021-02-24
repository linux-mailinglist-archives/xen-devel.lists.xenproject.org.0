Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3B5323AC9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 11:52:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89256.167992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lErlg-0002gw-Ba; Wed, 24 Feb 2021 10:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89256.167992; Wed, 24 Feb 2021 10:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lErlg-0002gX-8T; Wed, 24 Feb 2021 10:51:44 +0000
Received: by outflank-mailman (input) for mailman id 89256;
 Wed, 24 Feb 2021 10:51:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lErle-0002gS-9M
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:51:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24af6dfb-e8e0-41ea-83b0-6506239e35a5;
 Wed, 24 Feb 2021 10:51:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43812ADE5;
 Wed, 24 Feb 2021 10:51:40 +0000 (UTC)
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
X-Inumbo-ID: 24af6dfb-e8e0-41ea-83b0-6506239e35a5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614163900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BaPCh8nL9HBojeUkSfe+yQ4ioJVg4Tz4ByDCmiXQWhA=;
	b=iJTHSeKuCbZNndJiSSyglDGjkQZmqsecJDQ6GVlN875mK2sqZiyBf/SgxkN44dCwojsKsZ
	p+kE9ncjU7VG8XkkeWFONW1JHR6mS2XA2pGSgtsbtnSrpEflHzmAF7gJ6TTZZ6tas1Fm/c
	gswTU71JHk8TPHedGLLjF7BM0+H0iKQ=
Subject: Re: [PATCH 2/2] hvmloader: do not include system headers for type
 declarations
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20210224102641.89455-1-roger.pau@citrix.com>
 <20210224102641.89455-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fb677f29-2b21-aaf1-1127-6774fb8e91e9@suse.com>
Date: Wed, 24 Feb 2021 11:51:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224102641.89455-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.02.2021 11:26, Roger Pau Monne wrote:
> --- /dev/null
> +++ b/tools/firmware/hvmloader/types.h
> @@ -0,0 +1,47 @@
> +#ifndef _HVMLOADER_TYPES_H_
> +#define _HVMLOADER_TYPES_H_
> +
> +typedef unsigned char uint8_t;
> +typedef signed char int8_t;
> +
> +typedef unsigned short uint16_t;
> +typedef signed short int16_t;
> +
> +typedef unsigned int uint32_t;
> +typedef signed int int32_t;
> +
> +typedef unsigned long long uint64_t;
> +typedef signed long long int64_t;

I wonder if we weren't better of not making assumptions on
short / int / long long, and instead use
__attribute__((__mode__(...))) or, if available, the compiler
provided __{,U}INT*_TYPE__.

> +#define INT8_MIN        (-0x7f-1)
> +#define INT16_MIN       (-0x7fff-1)
> +#define INT32_MIN       (-0x7fffffff-1)
> +#define INT64_MIN       (-0x7fffffffffffffffll-1)
> +
> +#define INT8_MAX        0x7f
> +#define INT16_MAX       0x7fff
> +#define INT32_MAX       0x7fffffff
> +#define INT64_MAX       0x7fffffffffffffffll
> +
> +#define UINT8_MAX       0xff
> +#define UINT16_MAX      0xffff
> +#define UINT32_MAX      0xffffffffu
> +#define UINT64_MAX      0xffffffffffffffffull

At least if going the above outlined route, I think we'd then
also be better off not #define-ing any of these which we don't
really use. Afaics it's really only UINTPTR_MAX which needs
providing.

> +typedef uint32_t size_t;

Like the hypervisor, we should prefer using __SIZE_TYPE__
when available.

> +typedef uint32_t uintptr_t;

Again - use __UINTPTR_TYPE__ or, like Xen,
__attribute__((__mode__(__pointer__))).

> +#define bool _Bool
> +#define true 1
> +#define false 0
> +#define __bool_true_false_are_defined   1
> +
> +typedef __builtin_va_list va_list;
> +#define va_copy(dest, src)    __builtin_va_copy((dest), (src))
> +#define va_start(ap, last)    __builtin_va_start((ap), (last))

Nit: Perhaps better omit the unnecessary inner parentheses?

Jan

