Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D67F404817
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182901.330757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGko-0006gh-3j; Thu, 09 Sep 2021 09:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182901.330757; Thu, 09 Sep 2021 09:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGkn-0006eY-U5; Thu, 09 Sep 2021 09:53:57 +0000
Received: by outflank-mailman (input) for mailman id 182901;
 Thu, 09 Sep 2021 09:53:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+XH1=N7=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mOGkm-0006dM-67
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:53:56 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d82c19c7-1153-11ec-b1a9-12813bfff9fa;
 Thu, 09 Sep 2021 09:53:55 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-mnPkolytPYuKBlSgF8ashQ-1; Thu, 09 Sep 2021 05:53:52 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 u2-20020adfdd42000000b001579f5d6779so333841wrm.8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Sep 2021 02:53:52 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id a133sm1238458wme.5.2021.09.09.02.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 02:53:50 -0700 (PDT)
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
X-Inumbo-ID: d82c19c7-1153-11ec-b1a9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631181234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vwr+3pvdxH1NRlgdXk14JF+JyDx/qDTwNZRMxhXGyjE=;
	b=Kyvdfd6JPFtmbyo9bNjcveIEg8umASDrTRRJy7yU8PiIdRAnA7McDFqfofJWFzyvESpSlV
	MCXykKbBUW6uIQMHKml7OBVXbKOOeY5Mf4fQnQJkITZuEOMKG3povZs64OrFU+LmGdW7sZ
	iuC9x5iLbjUK2uym4VFs7hUCyB7C98U=
X-MC-Unique: mnPkolytPYuKBlSgF8ashQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vwr+3pvdxH1NRlgdXk14JF+JyDx/qDTwNZRMxhXGyjE=;
        b=h4j2yooyrGbmFOM6rDU83t0IyMaafF2zBCKX6kjxt6CcGcq0ka79t883dIDTkw98Bi
         buYHJeUSWzBgGlgqIw3CBCw8+g/Z0qA8HO66A5TJf0UQ6ex1sKESDl3pwji0wtBhaMV3
         FOVEo4pWzpwdghncR915s3/CQklxyvHOGvCIRr937q0t2h1j9e0pRGLIG+kvgw4Tt2HJ
         FyVyUCTNmG97AolzvbJXsJVkq72/2Zxj6Jcx5y/72S6vV3U2/pAslwTNt7En71BtluS3
         e7rYrnfbzC4G2SyXVdMWix4noZYAsjhKP/exA+ylEUHG2o6ELxT7Q+5HjHlggbd/jVmc
         hW+Q==
X-Gm-Message-State: AOAM532VIJJOytJBw/QIxXKMBmFZZa4p/p5of09+PQqNPDVr1xIpqFsx
	Ae+Kah0dloAnBHLpT9nHYbkNonRCsh9Wg2zc9fFUFF7RQucN3tar53O0wTE/T9QWuT0XQq3RzF5
	ZSI19MAD/VX+ybFe0IT1oNYyQWa/XwI460CUK8w65F58hjBFAUBsAEb+CLAiAQYC0uWgrffN83h
	lR
X-Received: by 2002:a7b:c441:: with SMTP id l1mr1908287wmi.69.1631181231085;
        Thu, 09 Sep 2021 02:53:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIkZfHni7JT96UiXXXKpQ6vrbvW/tTxBRZU6eZ7/YkCglB7MvuULXjbpqr0tqBjlH8EEPhiw==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr1908267wmi.69.1631181230881;
        Thu, 09 Sep 2021 02:53:50 -0700 (PDT)
Subject: Re: [RFC PATCH 03/10] block: Use qemu_security_policy_taint() API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-4-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <eea8a6d7-72b8-9fd6-07cf-b14ab6099833@redhat.com>
Date: Thu, 9 Sep 2021 11:53:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/9/21 1:20 AM, Philippe Mathieu-Daudé wrote:
> Add the BlockDriver::bdrv_taints_security_policy() handler.
> Drivers implementing it might taint the global QEMU security
> policy.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/block/block_int.h | 6 +++++-
>  block.c                   | 6 ++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index f1a54db0f8c..0ec0a5c06e9 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -169,7 +169,11 @@ struct BlockDriver {
>      int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
>                            Error **errp);
>      void (*bdrv_close)(BlockDriverState *bs);
> -
> +    /*
> +     * Return %true if the driver is withing QEMU security policy boundary,
> +     * %false otherwise. See: https://www.qemu.org/contribute/security-process/
> +     */
> +    bool (*bdrv_taints_security_policy)(BlockDriverState *bs);
>  
>      int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
>                                         Error **errp);
> diff --git a/block.c b/block.c
> index b2b66263f9a..696ba486001 100644
> --- a/block.c
> +++ b/block.c
> @@ -49,6 +49,7 @@
>  #include "qemu/timer.h"
>  #include "qemu/cutils.h"
>  #include "qemu/id.h"
> +#include "qemu-common.h"
>  #include "block/coroutines.h"
>  
>  #ifdef CONFIG_BSD
> @@ -1587,6 +1588,11 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
>          }
>      }
>  
> +    if (drv->bdrv_taints_security_policy) {
> +        qemu_security_policy_taint(drv->bdrv_taints_security_policy(bs),
> +                                   "Block protocol '%s'", drv->format_name);

Hmm I should check for phase_check(PHASE_MACHINE_READY)
and qemu_security_policy_is_strict() somehow, to refuse
adding unsafe drv at runtime instead of exiting...

> +    }
> +
>      return 0;
>  open_failed:
>      bs->drv = NULL;
> 


