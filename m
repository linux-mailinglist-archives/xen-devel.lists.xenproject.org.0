Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B6772C0A8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 12:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546994.854145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fAf-0005UW-AY; Mon, 12 Jun 2023 10:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546994.854145; Mon, 12 Jun 2023 10:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fAf-0005RE-6Z; Mon, 12 Jun 2023 10:53:13 +0000
Received: by outflank-mailman (input) for mailman id 546994;
 Mon, 12 Jun 2023 10:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1Pn=CA=rasmusvillemoes.dk=linux@srs-se1.protection.inumbo.net>)
 id 1q8fAd-0005R8-K2
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 10:53:11 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 522a82ca-090f-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 12:53:10 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51491b87565so7328723a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 03:53:10 -0700 (PDT)
Received: from [172.16.11.116] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id
 g20-20020aa7c854000000b005169cd0edffsm4876752edt.35.2023.06.12.03.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 03:53:09 -0700 (PDT)
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
X-Inumbo-ID: 522a82ca-090f-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686567190; x=1689159190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8SLBrnwbHCvnK+EhlE8eJ/+pq9MyO6Q+aOHOn+73hw8=;
        b=I4Jo53AtXKUAWujuX6TPrsPzylsWLanXZel9thkXkSIXOVui0kQwzZh7YdgZmor2Jt
         tf80rFrTpAgnDS6xkg4Y4x6JU6myT/iURXuMuHmCcitBuH5EU/XswWhVMDm6BPH7P2nw
         YALTxnobGGv+uPJIXW5C/Hq8IwS3T/UAFliuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686567190; x=1689159190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8SLBrnwbHCvnK+EhlE8eJ/+pq9MyO6Q+aOHOn+73hw8=;
        b=ijBFudamE4GlFErK9EnUKvQ0kGCZeAzBlyg09oneYmFOsWjRSqXxkqU+x/bDAFoSGM
         DMY4eeLQx1q5frjK1IpTP8L1+upiC2+BPTZ1wKS0cNutcokwmqRVNQ0ZtEF6CHzgixpq
         qPxJDXYdfnIyCzdqcHmlRL6/IwJYWtAd8Turo2dJqenntvh1wp/blXX7MHVl3zMu6tKy
         k/OnrAUdJZRl+NlcTXHlwp14GNQ5ujMuv0w0WXaOiBrVky4pzKEMchz8ZSbJnPYTg/qd
         zo5xR8qlzhNDshRvmCtZ9n0VY8x/jw+X0gMrQ+7HPge2KAu7LN1J2fqDI6j7lRgE/zfV
         7g6A==
X-Gm-Message-State: AC+VfDy9mmIIodPTNci/BFhhy6S+z2P9odvT4z5xty0F6Gc2Fv9yde63
	UGLN+wNAI/XJVQw7hXivTOse0Q==
X-Google-Smtp-Source: ACHHUZ7U3uNm5on+y8jIMuDZ1cfGc9aiIN8XESopyRzBAdqMM/RLAE//onmpwNxNuERJC8T8wQeJ7A==
X-Received: by 2002:aa7:d40e:0:b0:510:8ee2:2b05 with SMTP id z14-20020aa7d40e000000b005108ee22b05mr5081219edq.38.1686567189783;
        Mon, 12 Jun 2023 03:53:09 -0700 (PDT)
Message-ID: <96b45245-bdd8-119d-e7a9-44eb36be0f97@rasmusvillemoes.dk>
Date: Mon, 12 Jun 2023 12:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/4] vsscanf(): Integer overflow is a conversion
 failure
Content-Language: en-US, da
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Lee Jones <lee@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20230610204044.3653-1-demi@invisiblethingslab.com>
 <20230610204044.3653-3-demi@invisiblethingslab.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20230610204044.3653-3-demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/06/2023 22.40, Demi Marie Obenour wrote:
> sscanf() and friends currently ignore integer overflow, but this is a
> bad idea.  It is much better to detect integer overflow errors and
> consider this a conversion failure.

Perhaps. And maybe I even agree. But not like this:

>  	while (*fmt) {
>  		/* skip any white space in format */
> @@ -3464,6 +3474,9 @@ int vsscanf(const char *buf, const char *fmt, va_list args)
>  			break;
>  		++fmt;
>  
> +		allow_overflow = *fmt == '!';
> +		fmt += (int)allow_overflow;
> +

You can't do that. Or, at least, you won't be able to actually use %!d
anywhere, because the compiler will yell at you:

lib/vsprintf.c: In function ‘foobar’:
lib/vsprintf.c:3727:26: error: unknown conversion type character ‘!’ in
format [-Werror=format=]
 3727 |  ret = sscanf("12345", "%!d", &val);
      |                          ^

So NAK.

Also, when you make significant changes to the sscanf implementation,
I'd expect the diffstat for the patch series to contain lib/test_scanf.c.

Rasmus

