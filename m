Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098F827E84F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 14:15:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.646.2169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNb0l-0003PQ-Qr; Wed, 30 Sep 2020 12:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646.2169; Wed, 30 Sep 2020 12:15:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNb0l-0003P1-Ne; Wed, 30 Sep 2020 12:15:07 +0000
Received: by outflank-mailman (input) for mailman id 646;
 Wed, 30 Sep 2020 12:15:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNb0k-0003Ow-9T
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:15:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d426c1cf-5a4b-4cb6-8a19-c673e6ce6bda;
 Wed, 30 Sep 2020 12:15:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DCB30AECD;
 Wed, 30 Sep 2020 12:15:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNb0k-0003Ow-9T
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:15:06 +0000
X-Inumbo-ID: d426c1cf-5a4b-4cb6-8a19-c673e6ce6bda
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d426c1cf-5a4b-4cb6-8a19-c673e6ce6bda;
	Wed, 30 Sep 2020 12:15:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601468103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8Y/hq2XyHTDNcuKq30RGP5D8JIRRS6DYNP8Qs0yMJA=;
	b=J3ZlkJOmMzijWZl6olj61HZ834mB9Fl+V8vhzRlnLG3sQKwcctR2Beg2R3jMVKry++YD9s
	7ObmdZ3eHNoRcg7FpZc/Bp9oAXHgwq9r1PlR7+fT5FZv9zMrEBrVjifl+tai+Z3h+KbmvS
	ZMSD91Ddfq1R6T5mXcnMct8ART6lzZU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DCB30AECD;
	Wed, 30 Sep 2020 12:15:02 +0000 (UTC)
Subject: Re: [PATCH v8 3/5] efi/boot.c: wrap PrintStr/PrintErr to allow const
 CHAR16* arguments
To: Trammell Hudson <hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, wl@xen.org
References: <20200930120011.1622924-1-hudson@trmm.net>
 <20200930120011.1622924-4-hudson@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <29fe9a2b-aeea-14a7-1ba9-99979f235373@suse.com>
Date: Wed, 30 Sep 2020 14:15:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930120011.1622924-4-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 14:00, Trammell Hudson wrote:
> This patch wraps the EFI OutputString() method so that they can be
> called with const arguments.  The OutputString method does not modify
> its argument, although the prototype is missing const, so it is necssary
> to cast away the const when calling it.
> 
> It also updates callers of PrintStr/PrintErr to remove unneeded un-const casts.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

This one got committed earlier today, sadly ...

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -151,10 +151,17 @@ static struct file __initdata cfg;
>  static struct file __initdata kernel;
>  static struct file __initdata ramdisk;
>  static struct file __initdata xsm;
> -static CHAR16 __initdata newline[] = L"\r\n";
> +static const CHAR16 __initconst newline[] = L"\r\n";
>  
> -#define PrintStr(s) StdOut->OutputString(StdOut, s)
> -#define PrintErr(s) StdErr->OutputString(StdErr, s)
> +static void __init PrintStr(const CHAR16 *s)
> +{
> +    StdOut->OutputString(StdOut, (CHAR16 *)s );

... without me noticing the stray blank here and ...

> +}
> +
> +static void __init PrintErr(const CHAR16 *s)
> +{
> +    StdErr->OutputString(StdErr, (CHAR16 *)s );

... here.

> @@ -540,7 +547,7 @@ static char * __init split_string(char *s)
>      return NULL;
>  }
>  
> -static void __init handle_file_info(CHAR16 *name,
> +static void __init handle_file_info(const CHAR16 *name,
>                                      const struct file *file, const char *options)
>  {
>      if ( file == &cfg )

Obviously I had to drop this hunk, which should now be folded
into patch 2. (If no other need for a v9 arises, I'll try to
remember to do so while committing that one.)

Jan

