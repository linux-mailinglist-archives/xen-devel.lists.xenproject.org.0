Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E5C8BB990
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 08:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716790.1119001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s38bi-0003Vm-4X; Sat, 04 May 2024 06:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716790.1119001; Sat, 04 May 2024 06:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s38bi-0003TY-1Z; Sat, 04 May 2024 06:10:50 +0000
Received: by outflank-mailman (input) for mailman id 716790;
 Sat, 04 May 2024 06:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xoDN=MH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1s38bg-0003TN-4o
 for xen-devel@lists.xenproject.org; Sat, 04 May 2024 06:10:48 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b577af3-09dd-11ef-909c-e314d9c70b13;
 Sat, 04 May 2024 08:10:45 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a598e483ad1so58335866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 23:10:45 -0700 (PDT)
Received: from ?IPV6:2003:e5:8738:9a00:3771:d6c0:aec6:f5ea?
 (p200300e587389a003771d6c0aec6f5ea.dip0.t-ipconnect.de.
 [2003:e5:8738:9a00:3771:d6c0:aec6:f5ea])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a170906155900b00a599a2d9a45sm1285840ejd.100.2024.05.03.23.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 23:10:44 -0700 (PDT)
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
X-Inumbo-ID: 0b577af3-09dd-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714803045; x=1715407845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A9eVR4zjjIY9w/PGSyA1izYw0Cg97sL4VqSLqb3KGSk=;
        b=DzAfV0Gi5XcFoJ3DLeRG3s8IJmRU/uAToJjrgMvUgfLMFMFMqjL4Wza2PEOlUVZmad
         pGTVxiKPc7FX7gMRqVbF4uMaqwGnppGu8P/4DRslYYnU+N891JpFZ7eWiYy+UZuoH6IE
         hfl6lJgt2mw8j8NWywJBt5uyZKCnbflWIHcZAuNjurtgUAs0E1DvU81iyAM/Sa/L5BIo
         W6CSc6hiGRgaWnQpzApVFKqW3baWd6xAl5eavvUxV53mGXktehXLD7RVaAZW7EChx1Sy
         ygmD8XEUpH6kJmu58J2kezkdk4EFc7ifQwK2TlKjQUk09EZ/NBhYoLnombL6VgfZdHzO
         eddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714803045; x=1715407845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A9eVR4zjjIY9w/PGSyA1izYw0Cg97sL4VqSLqb3KGSk=;
        b=mRps+No7mhG5vLkGCUgoWGmig0if+viUExE/U20BslfDfAb8kZT2CMQb3KxrepDArx
         3y9dXsZ6Jl4NzIwSBeu5aFiF51CbeZ0LFeY9tB2ViTsrmVxoAz6PvgiL/PLWLlfhhLmb
         5/Nn3e8BFmT83K+TALOfKqZKnCpfndksjUFmXvG2Ifh2fzacfv0D0iSZ04uTOlBycP7g
         sxGy5QaOmqAbFPG5dROCo9/2jvHHKuzCUWgqHtQjqycWgLR7GMdxJGgz3IDYj95oiwoP
         0e0043lx4kbAwxofoi4kQLDiVhSjWiAZzFh37WkjuJL1sdp+kYVIQzrAljnMXPTtAm/g
         Dwfg==
X-Forwarded-Encrypted: i=1; AJvYcCVN3hc2JinrzjVUIHsrw/28+N9k0qEu3ZIGa0LJN95f3utcfcMXmGHYHxN8i+FFsgbLIa7CTIaTtQMbH3rW7KD86gM5vnvcrdnKj+NaBNw=
X-Gm-Message-State: AOJu0YxJzvuPACir6UpQJjrmcI//5yrrbHwxnGNg8STWZaMntWyhtLeY
	NyJmpXNmJmMw+9maOKvznHZWAstzE6PQRlBhEk4VUNWkoYgJ6I7YfhlY0Wd7m2I=
X-Google-Smtp-Source: AGHT+IE4kQTNWDOqbQEf0p1ZwrWBtTOiHje/SA4hzjOZkyx3uzQ2WsaOTTwKwVInTsqBxPEe3laobg==
X-Received: by 2002:a17:906:2b09:b0:a51:d23e:c53 with SMTP id a9-20020a1709062b0900b00a51d23e0c53mr3108363ejg.31.1714803045058;
        Fri, 03 May 2024 23:10:45 -0700 (PDT)
Message-ID: <db1b1151-ab02-4fc0-b28d-2a28e5fcd78f@suse.com>
Date: Sat, 4 May 2024 08:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxs: Open /dev/xen/xenbus fds as O_CLOEXEC
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Anthony PERARD <anthony@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20240504011614.1645851-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240504011614.1645851-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04.05.24 03:16, Andrew Cooper wrote:
> The header description for xs_open() goes as far as to suggest that the fd is
> O_CLOEXEC, but it isn't actually.
> 
> `xl devd` has been observed leaking /dev/xen/xenbus into children.
> 
> Link: https://github.com/QubesOS/qubes-issues/issues/8292
> Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With the style breakage below fixed:

Reviewed-by: Juergen Gross <jgross@suse.com>

> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Entirely speculative patch based on a Matrix report
> ---
>   tools/libs/store/xs.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index 140b9a28395e..1f74fb3c44a2 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -54,6 +54,10 @@ struct xs_stored_msg {
>   #include <dlfcn.h>
>   #endif
>   
> +#ifndef O_CLOEXEC
> +#define O_CLOEXEC 0
> +#endif
> +
>   struct xs_handle {
>   	/* Communications channel to xenstore daemon. */
>   	int fd;
> @@ -227,7 +231,7 @@ static int get_socket(const char *connect_to)
>   static int get_dev(const char *connect_to)
>   {
>   	/* We cannot open read-only because requests are writes */
> -	return open(connect_to, O_RDWR);
> +	return open(connect_to, O_RDWR|O_CLOEXEC);

Nit: spaces around the "|", please.


Juergen

>   }
>   
>   static int all_restrict_cb(Xentoolcore__Active_Handle *ah, domid_t domid) {
> 
> base-commit: feb9158a620040846d76981acbe8ea9e2255a07b


