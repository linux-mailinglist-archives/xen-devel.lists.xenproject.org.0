Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BDC27003D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 16:52:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJHkF-0004Mj-87; Fri, 18 Sep 2020 14:52:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K9We=C3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kJHkE-0004Me-1T
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 14:52:14 +0000
X-Inumbo-ID: e9ef3f3c-7105-4851-bcf0-81019a4f6df6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9ef3f3c-7105-4851-bcf0-81019a4f6df6;
 Fri, 18 Sep 2020 14:52:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600440732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BU1V5/2tQ+QIYk4IXnkD7yyL2X6fdi1axGHggV3N2kg=;
 b=hkiIZnHDE5VKxm8kTN2gKr2LHKQ5TK7b6qfYef7VxKI29mmm9MLUarfMcACttKrrs7PinL
 hMfP/jEGDNGfOlTQDBBcHmFzJSXwOH/k5CcCblMrLX7qCYPL13csPOPbN7svyeo2UJCl1N
 LSi4LPtbfB0RlHv3vcotL4zH5F558ns=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87E1CB53D;
 Fri, 18 Sep 2020 14:52:46 +0000 (UTC)
Subject: Re: [PATCH v5 3/5] efi/boot.c: add handle_file_info()
To: Trammell Hudson <hudson@trmm.net>
References: <20200917154048.1140580-1-hudson@trmm.net>
 <20200917154048.1140580-4-hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e26cc4b-3b05-3811-34f4-a3f6d380bd18@suse.com>
Date: Fri, 18 Sep 2020 16:52:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917154048.1140580-4-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 17.09.2020 17:40, Trammell Hudson wrote:
> Add a separate function to display the address ranges used by
> the files and call `efi_arch_handle_module()` on the modules.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

You've lost the ack I gave, and ...

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -540,6 +540,22 @@ static char * __init split_string(char *s)
>      return NULL;
>  }
>  
> +static void __init handle_file_info(CHAR16 *name,
> +                                    const struct file *file, const char *options)

... with the const added here you ought to mention (in a post-
description remark perhaps) that this now depends on a not yet
applied patch on the list). Remember that reviewers and
committer may be different people, and even if the committer
participated in review, (s)he may have forgotten by the time
a patch is otherwise ready to go in.

And btw - briefly mentioning what changes you made compared to
the previous version (again in a post-description remark) helps
reviews quite a bit.

Jan

