Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA50197A07A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 13:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799421.1209399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqA9J-0007SE-2H; Mon, 16 Sep 2024 11:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799421.1209399; Mon, 16 Sep 2024 11:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqA9I-0007QA-VR; Mon, 16 Sep 2024 11:44:08 +0000
Received: by outflank-mailman (input) for mailman id 799421;
 Mon, 16 Sep 2024 11:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sqA9H-0007Q4-RE
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 11:44:07 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa31567d-7420-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 13:44:05 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5356bb5522bso3742941e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 04:44:05 -0700 (PDT)
Received: from [10.9.6.216] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb5f2b6sm2465891a12.52.2024.09.16.04.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 04:44:04 -0700 (PDT)
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
X-Inumbo-ID: fa31567d-7420-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726487045; x=1727091845; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQqXuDe6mGLH2VNblBqNH+AaH9+bJb+TIfg3M+skl7Q=;
        b=T8Rkv9JOAwAtVwlaZE/MFnB30DRgnz6OM/r0SndArU2ocxVNZn+Pucakog2fYK4NIb
         D55KV0JpAnXVsrh2dzwdZmZ1KuV5/u7R+iT7A9rGCYgdwpk7PwfJURvF7TIj+tXwynsh
         FMRoi5m1+8ChM4gd7qqmWn0ohfOWKPhShqKqB34BdkWcJqKkvXLh65Q/De80cfmboTmd
         Wa+VYa3sMxmz3ub0jtb8xkDA8SfncPJXBkRhT3ZQ2xAJyfnVRaDldSizAfE2C2Nufgm6
         1RomJSgEKH+8AGbHXN9gBP8TvhqvJjAQFd5ssvjeWMUgA0bPozuqh1JPURbmxsEmYweG
         EVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726487045; x=1727091845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQqXuDe6mGLH2VNblBqNH+AaH9+bJb+TIfg3M+skl7Q=;
        b=I9U9oQykwk9vYH/4VqxdoFQcWxKZaaP9xmNckdVJU+PUtQlNGeUA/aLy4biO3NNzxJ
         i1rldypfkyt38x3gR4Wq2rq0lirA6MoOtRzbllPXo68LxZ7pnv4HAwH7Y82wYTAKki3w
         gxXf6kKSkNH2RgnKxAhLx8rTC07b/whpYpFsA6XsnPVvUeLMdKlbDlOOWbRjc6qnrk8b
         abHZdMQ3t3HISNzWwVKk/9Y0OljspZnkaaWq6zMOF0h3V3AhDnJ0XpJlH04bvF+44zRa
         M5YMcdVhIpQC77bKH8gm66v8n2as23J4sBw2aTR6wcLjGR5T7B64xwxGvAGuuEZelQ2W
         vTMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUehG00dZJdmGJUJjFOSOe8HTbQrn2LWj8N+kIT0SCKL44gwxJjt846ynLzoyQMVuHmx+2hpqCKpNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvgiZElv/0eJOuMcCOjR4B7uwpopouvtncrdBXqnh4jUeTHcFF
	ETBtpMHE5euwChfcG0GubL6emleTFSb3anfdEberVps5/xaj+QtxYypxBkghlw==
X-Google-Smtp-Source: AGHT+IExMeqX79CgsKl2isI3C7REhyxqdVJ9ht9yDvZW6gNYF0gCvbaEQQ95FZsIP0t65+f35M+TOg==
X-Received: by 2002:a05:6512:3b8e:b0:52e:7448:e137 with SMTP id 2adb3069b0e04-5367feba027mr5927262e87.6.1726487044939;
        Mon, 16 Sep 2024 04:44:04 -0700 (PDT)
Message-ID: <815a7f82-019a-46b4-b5a3-84a7235c19a6@suse.com>
Date: Mon, 16 Sep 2024 13:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: efibind: Fix typo in comment
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240916093557.67850-1-frediano.ziglio@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240916093557.67850-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2024 11:35, Frediano Ziglio wrote:
> --- a/xen/arch/x86/include/asm/x86_64/efibind.h
> +++ b/xen/arch/x86/include/asm/x86_64/efibind.h
> @@ -176,7 +176,7 @@ typedef uint64_t   UINTN;
>      #elif __clang__ || __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)
>          #define EFIAPI __attribute__((__ms_abi__))  // Force Microsoft ABI
>      #else
> -        #define EFIAPI          // Substitute expresion to force C calling convention
> +        #define EFIAPI          // Substitute expression to force C calling convention
>      #endif
>  #endif

This is an imported header iirc, where I would recommend against
doing such cosmetic changes on our side without them having been
done to the original.

Jan

