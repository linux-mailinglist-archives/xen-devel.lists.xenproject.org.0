Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5262D5DD3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 15:33:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49361.87290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knN04-000519-Gj; Thu, 10 Dec 2020 14:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49361.87290; Thu, 10 Dec 2020 14:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knN04-00050k-DW; Thu, 10 Dec 2020 14:32:56 +0000
Received: by outflank-mailman (input) for mailman id 49361;
 Thu, 10 Dec 2020 14:32:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Anpp=FO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1knN02-00050f-D5
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:32:54 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 614244d8-b27b-4c1e-a11a-c37b5ae26ba0;
 Thu, 10 Dec 2020 14:32:53 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-cvAPxXi3PPiANXlANUmJMw-1; Thu, 10 Dec 2020 09:32:49 -0500
Received: by mail-wr1-f72.google.com with SMTP id p18so1988321wro.9
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 06:32:49 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z13sm9898753wmz.3.2020.12.10.06.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:32:47 -0800 (PST)
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
X-Inumbo-ID: 614244d8-b27b-4c1e-a11a-c37b5ae26ba0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607610773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rtNjAtow8SQkrLmz8+XRRA+YtRhz+KF6e43NFXvxDSI=;
	b=IW7tPMlmxQR+yENluLsy7ds+4O4Kpa2rm00nb1e2dPQ2WrjKDHQtXCilEQR20GCK8q36d0
	OzKai3LzdY7y0rsQtU/kW8+YOydsR/GTQRouG4q41UGrkADjxSDtk6XZnbrfg7b6RSd0qG
	ddT5RqSII1iMcRPgt86rE0HPWag78Rg=
X-MC-Unique: cvAPxXi3PPiANXlANUmJMw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rtNjAtow8SQkrLmz8+XRRA+YtRhz+KF6e43NFXvxDSI=;
        b=ZQTKNK8Ey7j9E0rhjzOQbsyxVyJg5L+Lpa1WQJUtLz9Q8AKlbk+VCtRR2ihZHVLI6t
         hTH+5TvBPfxI/q3Jh2Nt10m2gQuzHklgWP0a1ywhcYVbiBmUH8cKHK/hzMlpiuAcb5aX
         9BXdm/+VHZfm2l+/uCn8QAv3iEe9UEWo25G5auj9qA224m38HgU3vYg77fa55eLIwnEg
         jvdSLebOA+veb/iTdomx0FX5ZwjBSNOBT1fcWk8nY4qfh26VzePU6Ak4j/7NZ86tk5mj
         YMtVzYyvn27vitgsdgg0BVhTnU/SZaZjFBYJVaM18Qq0kpxPEBxTCizPawQfBJmcc4gw
         NTgw==
X-Gm-Message-State: AOAM531YQw7ZrZL6q+B601pDUso+HpFd766SO46ynrjVsqkWZY0AaiU4
	0Og+9CmHigbj7KlKeum/6i9C3Jj9DdCFuDrLlap8SVRcInBwjqq9bIefU4bBQB2ze3bjdTr22MH
	Yni+EEkw8BGF0GdU8HlT05sJpM+w=
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr8855716wmc.185.1607610768368;
        Thu, 10 Dec 2020 06:32:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvghq2Cu/Yzn0V6T8HyFCC4QgkWnmvztae8ydvZyqC4LvjfyNnoaYdKanep7mP2UKqi7czEA==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr8855692wmc.185.1607610768234;
        Thu, 10 Dec 2020 06:32:48 -0800 (PST)
Subject: Re: [PATCH v3 03/13] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-4-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
Date: Thu, 10 Dec 2020 15:32:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-4-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Since commit efc6c07 ("configure: Add a test for the minimum compiler
> version"), QEMU explicitely depends on GCC >= 4.8.
> 
> (clang >= 3.4 advertizes itself as GCC >= 4.2 compatible and supports
> __builtin_expect too)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index c76281f354..226ead6c90 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -44,10 +44,6 @@
>  #endif
>  
>  #ifndef likely
> -#if __GNUC__ < 3
> -#define __builtin_expect(x, n) (x)
> -#endif
> -
>  #define likely(x)   __builtin_expect(!!(x), 1)
>  #define unlikely(x)   __builtin_expect(!!(x), 0)
>  #endif
> 

Trying with GCC 10:
warning: implicit declaration of function ‘likely’
[-Wimplicit-function-declaration]

Clang 10:
warning: implicit declaration of function 'likely' is invalid in C99
[-Wimplicit-function-declaration]

Shouldn't it becleaner to test in the configure script or Meson that
likely() and unlikely() are not defined, and define them here
unconditionally?

Regards,

Phil.


