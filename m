Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDB830BA3B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 09:49:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80409.147119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6rN1-0002pW-Au; Tue, 02 Feb 2021 08:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80409.147119; Tue, 02 Feb 2021 08:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6rN1-0002p9-7a; Tue, 02 Feb 2021 08:49:11 +0000
Received: by outflank-mailman (input) for mailman id 80409;
 Tue, 02 Feb 2021 08:49:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6rMz-0002iY-GK
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 08:49:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a964888f-61c2-4ab4-bfcc-dda8f3237e8e;
 Tue, 02 Feb 2021 08:49:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE553AE89;
 Tue,  2 Feb 2021 08:49:06 +0000 (UTC)
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
X-Inumbo-ID: a964888f-61c2-4ab4-bfcc-dda8f3237e8e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612255746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fHxAoQG2as0o0ecdoloiK5EPBvhs1eUJHVM5PjMQWOs=;
	b=Lu3mSdcH0wyLm9Q/OktgcIxkRE/sKCjjGBQR5lMYyQ9inx1BQRdnBiO/OzEfoMbGk3U/Lx
	6D4Y+f2dJ5tBOmxsKrfRG1YH6d7n2WwEjORnuKGO7x7k3ckl22vGs8dbc8fWoBvwCpM4IT
	65Hanh7EOCZPkx0YYqcyOM57Oh9tnDA=
Subject: Re: [PATCH] xenstore: Fix all builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210201233513.30923-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5c957319-e0cd-4d9f-505b-cceb1a83bb00@suse.com>
Date: Tue, 2 Feb 2021 09:49:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201233513.30923-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.02.2021 00:35, Andrew Cooper wrote:
> This diff is easier viewed through `cat -A`
> 
>   diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstore/include/xenstore_state.h$
>   index 1bd443f61a..f7e4da2b2c 100644$
>   --- a/tools/xenstore/include/xenstore_state.h$
>   +++ b/tools/xenstore/include/xenstore_state.h$
>   @@ -21,7 +21,7 @@$
>    #ifndef XENSTORE_STATE_H$
>    #define XENSTORE_STATE_H$
>    $
>   -#if defined(__FreeBSD__) ||M-BM- defined(__NetBSD__)$
>   +#if defined(__FreeBSD__) || defined(__NetBSD__)$
>    #include <sys/endian.h>$
>    #else$
>    #include <endian.h>$
> 
> A non-breaking space isn't a valid C preprocessor token.
> 
> Fixes: ffbb8aa282de ("xenstore: fix build on {Net/Free}BSD")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I wonder why you didn't throw this in right away, without
waiting for any acks.

Jan

