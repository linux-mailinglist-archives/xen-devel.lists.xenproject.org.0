Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031D427E1EB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 08:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.444.1365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNW3Q-0002CN-Vk; Wed, 30 Sep 2020 06:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444.1365; Wed, 30 Sep 2020 06:57:32 +0000
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
	id 1kNW3Q-0002By-S5; Wed, 30 Sep 2020 06:57:32 +0000
Received: by outflank-mailman (input) for mailman id 444;
 Wed, 30 Sep 2020 06:57:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNW3P-0002Bs-Qu
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:57:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46c37291-699d-4922-a357-4b5128d33784;
 Wed, 30 Sep 2020 06:57:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3DE13ABF4;
 Wed, 30 Sep 2020 06:57:30 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FBlW=DH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNW3P-0002Bs-Qu
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 06:57:31 +0000
X-Inumbo-ID: 46c37291-699d-4922-a357-4b5128d33784
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 46c37291-699d-4922-a357-4b5128d33784;
	Wed, 30 Sep 2020 06:57:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601449050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lHOMGo7v+50h4ISmiKzFe5j/m8JWPvwGehUfd+6bHyo=;
	b=TV/B7YQSpVJPXSLOz+DwLO3wdP/iytBL/V7X65tZ/XXaDe2aENKdSm2WFfxA5IaqE1ioZD
	NV/xZ5AoeXrrVJUT27yf8VX/TBrPR/AQ24/hs+JxkzA1Shl/lgLWFcMaBTNxnU6d9i7UtR
	QAKtcBKXWBPDxT9UlYjbNXIIsU+3QMo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3DE13ABF4;
	Wed, 30 Sep 2020 06:57:30 +0000 (UTC)
Subject: Re: [PATCH v7 3/5] efi/boot.c: wrap PrintStr/PrintErr to allow const
 CHAR16* arguments
To: Trammell Hudson <hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, wl@xen.org
References: <20200929181717.1596965-1-hudson@trmm.net>
 <20200929181717.1596965-4-hudson@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <efeb1ce7-9950-0607-1e71-480826c7a0aa@suse.com>
Date: Wed, 30 Sep 2020 08:57:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929181717.1596965-4-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.09.2020 20:17, Trammell Hudson wrote:
> This patch wraps the EFI OutputString() method so that they can be
> called with const arguments.  The OutputString method does not modify
> its argument, although the prototype is missing const, so it is necssary
> to cast away the const when calling it.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -151,10 +151,16 @@ static struct file __initdata cfg;
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
> +}
> +static void __init PrintErr(const CHAR16 *s)

... a blank line added here and ...

> @@ -275,7 +281,7 @@ static bool __init match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2)
>  void __init noreturn blexit(const CHAR16 *str)
>  {
>      if ( str )
> -        PrintStr((CHAR16 *)str);
> +        PrintStr(str);

... the similar change to PrintErrMesg() also made. I'll be happy
to do both while committing.

Jan

