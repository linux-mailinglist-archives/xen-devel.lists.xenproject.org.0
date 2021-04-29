Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB20236EAAD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 14:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119958.226804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc5xg-0006N7-99; Thu, 29 Apr 2021 12:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119958.226804; Thu, 29 Apr 2021 12:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc5xg-0006Mi-5r; Thu, 29 Apr 2021 12:40:08 +0000
Received: by outflank-mailman (input) for mailman id 119958;
 Thu, 29 Apr 2021 12:40:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc5xf-0006Ij-0U
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 12:40:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f436054e-f3a2-4fd5-bfd9-50f5ed6fd231;
 Thu, 29 Apr 2021 12:40:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70CFDB053;
 Thu, 29 Apr 2021 12:40:05 +0000 (UTC)
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
X-Inumbo-ID: f436054e-f3a2-4fd5-bfd9-50f5ed6fd231
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619700005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qBYCKE/qWo2Sh0FBRZ4Js/EXaubXOE97zpAKQJpjSfI=;
	b=ckJDYH8iOBHY+zDHIkX1kB2Ycn1aX/o5kzcMxTerehhqgwCdUBJxVCuZ/H8CARRe9hCBs2
	MXUQugYX8hvS1OVuyvSgx3TRMUjJM1QNMNK68MnvwF6xTsxH5gxCY3ndLfRazl/mgzertl
	Yga2qsgSkICBNWUKn6vUnl6iVhhegzQ=
Subject: Re: [PATCH] x86/ACPI: Fix build error when tboot is disabled
To: Costin Lupu <costin.lupu@cs.pub.ro>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <79df12ade0840338590f440cd064052a961fe23b.1619698239.git.costin.lupu@cs.pub.ro>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce98780e-5a32-9faf-832e-04eae6cdfbcb@suse.com>
Date: Thu, 29 Apr 2021 14:40:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <79df12ade0840338590f440cd064052a961fe23b.1619698239.git.costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.04.2021 14:11, Costin Lupu wrote:
> When tboot is disabled via menuconfig we get undefined reference error for
> g_tboot_shared. This patch fixes that by disabling the causing source code
> when tboot is disabled.

There must be more to this: Our shim config also builds with tboot
disabled, without running into any build issue. Furthermore ...

> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -407,6 +407,7 @@ static int acpi_get_wake_status(void)
>      return val;
>  }
>  
> +#ifdef CONFIG_TBOOT
>  static void tboot_sleep(u8 sleep_state)
>  {
>      uint32_t shutdown_type;
> @@ -451,18 +452,21 @@ static void tboot_sleep(u8 sleep_state)
>  
>      tboot_shutdown(shutdown_type);
>  }
> +#endif
>  
>  /* System is really put into sleep state by this stub */
>  acpi_status acpi_enter_sleep_state(u8 sleep_state)
>  {
>      acpi_status status;
>  
> +#ifdef CONFIG_TBOOT
>      if ( tboot_in_measured_env() )
>      {
>          tboot_sleep(sleep_state);
>          printk(XENLOG_ERR "TBOOT failed entering s3 state\n");
>          return_ACPI_STATUS(AE_ERROR);
>      }
> +#endif

... tboot_in_measured_env() already has a stub returning 0 when
!TBOOT (which is what I would have recommended instead of the
#ifdef-ary).

If there is a specific case where the compiler fails to DCE the
offending code, then you need to describe this in sufficient
detail.

Jan

