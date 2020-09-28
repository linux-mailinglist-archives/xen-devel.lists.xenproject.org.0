Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5044E27ADF2
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:37:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsOz-0008Py-9a; Mon, 28 Sep 2020 12:37:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMsOx-0008Pt-M4
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:37:07 +0000
X-Inumbo-ID: 8bfeb680-fe10-46b9-b47d-d73c69eb87f6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bfeb680-fe10-46b9-b47d-d73c69eb87f6;
 Mon, 28 Sep 2020 12:37:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601296625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALI/bVqxcFxqwe+6MiozBE+7uB7q2Arej7E2zjNpdTw=;
 b=aykcfLUfdxK3PJPSI98o6i0WDUSXfMl57FdvpLCwcXNXzsL1V+1zSeY7mIK02HwP1dkzgT
 UTWQvfS3p5zMgBCYCFj5/2ith445OTZNz0Ont9YTfMKitU5Knf5uBOHAnReCj2K6A79mtz
 vqEpb2Jb9oy9c+9fJC/Cc4TwpkI2LEc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53A5FAC83;
 Mon, 28 Sep 2020 12:37:05 +0000 (UTC)
Subject: Re: [PATCH v2 2/6] x86: reduce CET-SS related #ifdef-ary
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <d8561c46-a6df-3f64-78df-f84c649a99b4@suse.com>
Message-ID: <4120e048-5314-afba-d921-9f4651a61eaa@suse.com>
Date: Mon, 28 Sep 2020 14:37:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d8561c46-a6df-3f64-78df-f84c649a99b4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.09.2020 14:30, Jan Beulich wrote:
> Commit b586a81b7a90 ("x86/CET: Fix build following c/s 43b98e7190") had
> to introduce a number of #ifdef-s to make the build work with older tool
> chains. Introduce an assembler macro covering for tool chains not
> knowing of CET-SS, allowing some conditionals where just SETSSBSY is the
> problem to be dropped again.
> 
> No change to generated code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Now that I've done this I'm no longer sure which direction is better to
> follow: On one hand this introduces dead code (even if just NOPs) into
> CET-SS-disabled builds.

A possible compromise here might be to ...

> --- a/xen/include/asm-x86/asm-defns.h
> +++ b/xen/include/asm-x86/asm-defns.h
> @@ -7,3 +7,9 @@
>      .byte 0x0f, 0x01, 0xcb
>  .endm
>  #endif
> +
> +#ifndef CONFIG_HAS_AS_CET_SS
> +.macro setssbsy
> +    .byte 0xf3, 0x0f, 0x01, 0xe8
> +.endm
> +#endif

... comment out this macro's body. If we went this route, incssp
and wrssp could be dealt with in similar ways, to allow dropping
further #ifdef-s.

Jan

