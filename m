Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CF237A989
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 16:38:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125768.236726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgTVO-0000Hj-5D; Tue, 11 May 2021 14:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125768.236726; Tue, 11 May 2021 14:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgTVO-0000FI-27; Tue, 11 May 2021 14:37:02 +0000
Received: by outflank-mailman (input) for mailman id 125768;
 Tue, 11 May 2021 14:35:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+NX=KG=ieee.org=elder@srs-us1.protection.inumbo.net>)
 id 1lgTUN-0000EF-9O
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 14:35:59 +0000
Received: from mail-oi1-x236.google.com (unknown [2607:f8b0:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abef1768-cc19-49ce-99fe-3e5d7e882f8e;
 Tue, 11 May 2021 14:35:57 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id u16so19215946oiu.7
 for <xen-devel@lists.xenproject.org>; Tue, 11 May 2021 07:35:57 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id 2sm3341540ota.67.2021.05.11.07.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 07:35:56 -0700 (PDT)
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
X-Inumbo-ID: abef1768-cc19-49ce-99fe-3e5d7e882f8e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ETXAFKWQdH8/eG9YgJ2MyXQqUI4w0G+a8+7kidOetNw=;
        b=D+8UcMkB2GUwjj2F27jdDoxAVAL9rdC9MdMoJFlDBNeHzfe67XWP/sw3xSweHhjvu0
         L7zFyh43n9/fy4cUZSlUsyNvNqDkT2TqDuEFXFN77WQ7UwdcaxgaJydbt2h0Tqt9neqT
         2ljICDLxSDdscBg19eDiJRfFGl65YBejwUIvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ETXAFKWQdH8/eG9YgJ2MyXQqUI4w0G+a8+7kidOetNw=;
        b=Wn5WeQk0UpbpxuCI4FeB5/Pigw+ZoiMSUuyDy7RQt37Yb1S5cRhhmoH59wo9jJvHGk
         yfijFUG3KGLrDLMhskjETgKdPFgiKW5qdfYkbQzfpo1w5gKLo1lEU8aWrvgZKDlwZm+W
         eLR9oqAwTDi6Xjl8QiTAB5ipq7t8xjYecJMJ7q1w4wpeN2CZbNpDlJktrOhz/W4aHSP9
         GAJf6zrpUyDqgsWn2E/L+2oCy83nKhY6LNto/dI2UURxVPHsgbqpI9WAh1/uO36IAxT6
         UHXk/A/FkrhqCdyyLx0SP6r3vJY3XERdP83LTlwlXRFrx2Q3A6W55sPXXcqBKGM0uimi
         2nhw==
X-Gm-Message-State: AOAM532NwSTatw/ibhP4sYPQfpQ2nqXAT5V2kHwqeHBlpI+Z+WUgiSdE
	87u0A4E6kXkzc03ekBHlIuxoKnOVpx28Aj4F
X-Google-Smtp-Source: ABdhPJyvp7T0CdewBKkqMXtDA5ThSmqkKCGgPnZJ05uagz+Vq5z9FBuvh4nrA0ZkdxuooO6UIklVPg==
X-Received: by 2002:aca:53d8:: with SMTP id h207mr3883260oib.177.1620743757147;
        Tue, 11 May 2021 07:35:57 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] kernel.h: Split out panic and oops helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20210511074137.33666-1-andriy.shevchenko@linux.intel.com>
From: Alex Elder <elder@ieee.org>
Cc: linux-xtensa@linux-xtensa.org, openipmi-developer@lists.sourceforge.net,
 linux-clk@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-hyperv@vger.kernel.org,
 coresight@lists.linaro.org, linux-leds@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-arch@vger.kernel.org,
 kexec@lists.infradead.org, rcu@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org
Message-ID: <c6fa5d2c-84e2-2046-19f0-66cf5dd72077@ieee.org>
Date: Tue, 11 May 2021 09:35:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210511074137.33666-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/11/21 2:41 AM, Andy Shevchenko wrote:
> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.
> 
> There are several purposes of doing this:
> - dropping dependency in bug.h
> - dropping a loop by moving out panic_notifier.h
> - unload kernel.h from something which has its own domain
> 
> At the same time convert users tree-wide to use new headers, although
> for the time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Kees Cook <keescook@chromium.org>
> Acked-by: Wei Liu <wei.liu@kernel.org>
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Co-developed-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> Acked-by: Luis Chamberlain <mcgrof@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Acked-by: Helge Deller <deller@gmx.de> # parisc
> ---
> v3: rebased on top of v5.13-rc1, collected a few more tags
> 
> Note WRT Andrew's SoB tag above: I have added it since part of the cases
> I took from him. Andrew, feel free to amend or tell me how you want me
> to do.
> 

Acked-by: Alex Elder <elder@kernel.org>

. . .

> diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
> index a5f7a79a1923..34b68dc43886 100644
> --- a/drivers/net/ipa/ipa_smp2p.c
> +++ b/drivers/net/ipa/ipa_smp2p.c
> @@ -8,6 +8,7 @@
>   #include <linux/device.h>
>   #include <linux/interrupt.h>
>   #include <linux/notifier.h>
> +#include <linux/panic_notifier.h>
>   #include <linux/soc/qcom/smem.h>
>   #include <linux/soc/qcom/smem_state.h>
>   

. . .

