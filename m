Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E24376826
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 17:37:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124086.234186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2XS-0005G7-EA; Fri, 07 May 2021 15:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124086.234186; Fri, 07 May 2021 15:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2XS-0005DW-B5; Fri, 07 May 2021 15:37:14 +0000
Received: by outflank-mailman (input) for mailman id 124086;
 Fri, 07 May 2021 15:37:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qbhn=KC=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1lf2XQ-0005DQ-No
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 15:37:12 +0000
Received: from mail-qv1-xf33.google.com (unknown [2607:f8b0:4864:20::f33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca09348a-3a89-4d8d-8ee0-490229ad5236;
 Fri, 07 May 2021 15:37:11 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id l19so4973779qvu.8
 for <xen-devel@lists.xenproject.org>; Fri, 07 May 2021 08:37:11 -0700 (PDT)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2])
 by smtp.gmail.com with ESMTPSA id p10sm4894437qkg.74.2021.05.07.08.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 08:37:10 -0700 (PDT)
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
X-Inumbo-ID: ca09348a-3a89-4d8d-8ee0-490229ad5236
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L8mlQNSwZyVckYDAuK46yfO+eT1ItLiJvvt/PtTX1Rg=;
        b=IxvhU0VoX0tyTZXrFG+FMr1aIeEbYajOX3D8HemhMMpC3kIgmzXDNEfaFc0eeueO7C
         8uWvVFX50/UFMbQFns+BU3V76KL4szsFbedqtZDpCSKtv4BSkXQ9aX+BXDDz+M6G360M
         6zkqrIX2Cq3+n6fCMA49Z+Jn9ODomFrfC15D2REsmquGM8h3IBY2XQBOkiEIi6wWZl8K
         Goqr1frf0X/3yORrU44XfvgbDg81XH65idLtrMAMIl5sS01OJdVpMDsEDxFwawE6o8hf
         Okouv1//YoGp8LLDo1vfpF3IYDFLjl+ZhRt1kHvMhv5UESQJDBY2xK1IyxmpyAHcWzHB
         7/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L8mlQNSwZyVckYDAuK46yfO+eT1ItLiJvvt/PtTX1Rg=;
        b=Yw6+KDO092DXMBRNWni32mTxlI/E2CRvhiqziI7kWc8eq65r5bYht3bp1ECsNHE4AO
         1EClozVZ7E0MllQXUNrMMLnvIgu5yyJjIg2y/SVwfZbgM0e67zZ9lx5sPSENYJSCfaDK
         ZS/UKJyrkQYiST5d8Xw4sYUqq1/WpIh0LQOoiXt/OalQjj1QlQV+aoD/98UYngro7XOQ
         W4FiHlDyU0qtF1DcSLQbmZ/QXySpA2bfktp09GDH396nGLBvV+eFpGOWQHLSY6Rw3cad
         Psuq6dbAnM7EWSs3UKGXQ9/NpMTuigatiJcCgQAMB1lkoqHYlrgfQtCzMhA1JLo9O42x
         O/yA==
X-Gm-Message-State: AOAM531yj/bEeHYvPVX78jVxcHp6mi6M642IO6cfg5WBTd4wte/EjP/v
	QLQbjv5ZEjCJ514iYdxgfrg=
X-Google-Smtp-Source: ABdhPJxTeTGuFqdflSAXGhDX0CP2eA7VHJwF41W67yovilbuxldH6oYzZzaevwdQ4VDGyW7XxU20Fw==
X-Received: by 2002:a05:6214:d4c:: with SMTP id 12mr795724qvr.2.1620401831732;
        Fri, 07 May 2021 08:37:11 -0700 (PDT)
Subject: Re: [PATCH 3/9] stubom: newlib: Enable C99 formats for %z
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-4-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Message-ID: <d6ce6e80-5d4b-12cf-518f-e495c894f29c@gmail.com>
Date: Fri, 7 May 2021 11:37:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210504124842.220445-4-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/4/21 8:48 AM, Jason Andryuk wrote:
> vtpmmgr was changed to print size_t with the %z modifier, but newlib
> isn't compiled with %z support.  So you get output like:
> 
> root seal: zu; sector of 13: zu
> root: zu v=zu
> itree: 36; sector of 112: zu
> group: zu v=zu id=zu md=zu
> group seal: zu; 5 in parent: zu; sector of 13: zu
> vtpm: zu+zu; sector of 48: zu
> 
> Enable the C99 formats in newlib so vtpmmgr prints the numeric values.
> 
> Fixes 9379af08ccc0 "stubdom: vtpmmgr: Correctly format size_t with %z
> when printing."
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> I haven't tried, but the other option would be to cast size_t and avoid
> %z.  Since this seems to be the only mini-os use of %z, that may be
> better than building a larger newlib.
> ---
>  stubdom/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 90d9ffcd9f..c6de5f68ae 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -105,7 +105,7 @@ cross-newlib: $(NEWLIB_STAMPFILE)
>  $(NEWLIB_STAMPFILE): mk-headers-$(XEN_TARGET_ARCH) newlib-$(NEWLIB_VERSION)
>  	mkdir -p newlib-$(XEN_TARGET_ARCH)
>  	( cd newlib-$(XEN_TARGET_ARCH) && \
> -	  CC_FOR_TARGET="$(CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) $(NEWLIB_CFLAGS)" AR_FOR_TARGET=$(AR) LD_FOR_TARGET=$(LD) RANLIB_FOR_TARGET=$(RANLIB) ../newlib-$(NEWLIB_VERSION)/configure --prefix=$(CROSS_PREFIX) --verbose --target=$(GNU_TARGET_ARCH)-xen-elf --enable-newlib-io-long-long --disable-multilib && \
> +	  CC_FOR_TARGET="$(CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) $(NEWLIB_CFLAGS)" AR_FOR_TARGET=$(AR) LD_FOR_TARGET=$(LD) RANLIB_FOR_TARGET=$(RANLIB) ../newlib-$(NEWLIB_VERSION)/configure --prefix=$(CROSS_PREFIX) --verbose --target=$(GNU_TARGET_ARCH)-xen-elf --enable-newlib-io-long-long --enable-newlib-io-c99-formats --disable-multilib && \
>  	  $(MAKE) DESTDIR= && \
>  	  $(MAKE) DESTDIR= install )
>  
> 


