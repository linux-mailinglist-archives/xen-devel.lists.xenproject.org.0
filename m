Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84672B27F1C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 13:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083311.1442926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umsVa-0000lt-9V; Fri, 15 Aug 2025 11:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083311.1442926; Fri, 15 Aug 2025 11:22:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umsVa-0000jN-6Z; Fri, 15 Aug 2025 11:22:06 +0000
Received: by outflank-mailman (input) for mailman id 1083311;
 Fri, 15 Aug 2025 11:22:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umsVY-0000jA-8e
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 11:22:04 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bfa693d-79ca-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 13:21:54 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b9d41bfa35so1559636f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 04:21:54 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb7f02578dsm1511171f8f.62.2025.08.15.04.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 04:21:53 -0700 (PDT)
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
X-Inumbo-ID: 0bfa693d-79ca-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755256913; x=1755861713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g6YkzUBDYEfpcZ37KsMoLWm73oRdBRcB99+AtHrh2GU=;
        b=wWm+CyPXYTq1Zjgnj4u0hnzqpmfzeIljNlRgJTOw4nxQGn8lp16iTyd4DGB8H4fZJV
         GsmjbBXsiJr0wUAgXbWaap37yaV/SDqrdzgFnTp22vPl+l7dulb9vqxqgSmuesB0Xiu+
         RKoEOW0JPHDRJccyzw7pa6Vj1l5zrJGUk4x68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755256913; x=1755861713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6YkzUBDYEfpcZ37KsMoLWm73oRdBRcB99+AtHrh2GU=;
        b=a3GA5HI3ewWWoeONX6S6rkMCI4KXuhb7xstRW3Ytia49Ke9XpEFMrINg56ZbvjWr38
         xoAwNW/lXT4jm15fdf4SEA/M2E6E95ERV4tigHVJ+VR73D3JCuUR/0YYtsj+6hreRU4x
         dlAco5zxz2plJk+3gjVbtYRPPuEsJufbHhzqL9IkTdelqlNU0b0LYTLaMFA+V4lg/SqE
         2f6ADS4syEuQ1ibRwRQtBcoTnJNH0Xs/IWqgZ4II3yeXmNo0te60mYZZe3s+tvkwUITx
         EVKmROUvr43cnTSYLZBFRi4ypjYO//aWY1cA569oXKbtc8ruKRdD9oai0gEWaVenCHLu
         RBDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhogRsTMkQGEysCDM4ky/K9tRcUItjS0IzYvTN7w/mun2A5iSU4c6gudMDmDhxJUW89gnbsWUm97Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtBMu3lq4XNgAQjyc9gW+F2c1u2f+EyyLdFWJF9bsY2SHbLVaU
	i9onsJiP5xeR9NkvlIxqxlOmrEaYu8yPtob7JDbhrGxxPv7gosL5L7Sgo5TMaZdnaRc=
X-Gm-Gg: ASbGnctdNp57OSY/nL9ZZAd4i3Uo7KsfFRt5Jf4qItvmV9J5Ha0IRW3069rWJ5SqnrR
	DhxrPIDN0hi/qFEuG/SrsA7cSjGD3x1Tql2disAKsU+IzPglyVWppBi4hVBdUXXcJn+T4Q4xsOW
	yPc61Bq3x40HXxDIFP6GEe62IW5W/nNVfAdbhJJx3ak+4SrMMr8oQFZpZFFNv6l2Y+Xziksg55O
	76JXT+HYlbmAXKrRbIAu7C2e++KCCShbvWdse7P68YSoGDbt1hVni/nrbKyvqIjiPI9XurwwiAk
	058vtJ6NdkiHXI0nBUstXcwmOAn8F6hEFWtZwlms8tgVxSKuB12m6q3///BXznIsz1J9ilpzWVb
	LiygOiwzRnnyIAsDpichrpfMNJyI8YfEdV24IlWHhe528oU9nK2bbQqJRc6b863/nPQ8q
X-Google-Smtp-Source: AGHT+IFfkdHY8BsuzhT300ypF3WNgHFlTSYk7vVtZDaxyOBKH2RTblyZteQXSU6sFewxVk2b0v+X7w==
X-Received: by 2002:a05:600c:3513:b0:456:e39:ec1a with SMTP id 5b1f17b1804b1-45a21804c69mr12577105e9.14.1755256913434;
        Fri, 15 Aug 2025 04:21:53 -0700 (PDT)
Message-ID: <37206bd7-b455-499a-9632-f435ab87888e@citrix.com>
Date: Fri, 15 Aug 2025 12:21:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xsm/flask: add AVC pre-allocation boot parameter
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20250815102330.778749-1-Sergiy_Kibrik@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250815102330.778749-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2025 11:23 am, Sergiy Kibrik wrote:
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index a75b6c9301..9044827e78 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -238,6 +238,15 @@ loops for Queued Invalidation completions.**
>  Specify a maximum amount of available memory, to which Xen will clamp
>  the e820 table.
>  
> +### avc_prealloc
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Allocate XSM Access Vector Cache at boot. This forbids runtime dynamic
> +allocation of AVC nodes from Xen heap and changing AVC size via
> +FLASK_SETAVC_THRESHOLD hypercall.

I don't have any input on memory allocation side of things, but this
needs to be a sub-option under the existing flask=, and it looks like
you're going to need to turn it into a comma separated list.

Also, if you actually want to use Flask in a safety system, Flask needs
to become security supported in Xen.

~Andrew

