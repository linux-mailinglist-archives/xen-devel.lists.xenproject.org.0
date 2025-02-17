Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49A1A3898B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890693.1299831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4BB-0001J2-6L; Mon, 17 Feb 2025 16:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890693.1299831; Mon, 17 Feb 2025 16:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4BB-0001GA-3g; Mon, 17 Feb 2025 16:41:09 +0000
Received: by outflank-mailman (input) for mailman id 890693;
 Mon, 17 Feb 2025 16:41:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk4B9-0001G4-T6
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:41:07 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb270513-ed4d-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 17:41:05 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4396a24118dso30671745e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 08:41:05 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4398ad9e1d7sm18428635e9.19.2025.02.17.08.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 08:41:04 -0800 (PST)
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
X-Inumbo-ID: fb270513-ed4d-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739810465; x=1740415265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/9uFx1MCrCkKXb2+yPRL4a0TYb40/qKo1iWn9p/F5hY=;
        b=YNmq/rsUxzFxTq9xTjO8Uy+sY4YVhZ1Co78VyL4k4c+U4jZL+SD+KYKOGVNxZSddvU
         8hrJ8V5pnQCT2CkSPKtKK2mil5aoubN1itgtcdt+HRe5Oj5iLE8ZwWB1qRWUocLcy3Ks
         Atooe8u2zqChoOMDd4WyYsLLqcL/Ac07B8SGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810465; x=1740415265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9uFx1MCrCkKXb2+yPRL4a0TYb40/qKo1iWn9p/F5hY=;
        b=b6aiYsMZkRivTNU1+z022yXjsJPE9L1vSKlq0zkMgck5/CuOvL0lt9zTIrY+ITHbxT
         3VLP1kpZsJ0fu47EbHBcSCz79F2F0ehAp5aWwWuIwmX0D7TclG8FXwv5apM6Zf8asHom
         wJ0iY3+X69+2pfkIu1qqKwwjXPs7F9LUeW9kpuXd3e5d/z6gPFXt46G0BL14etFl3a7z
         JZff6Mw3VJMXn4OXSo7hw7KhHGi8bN3ADsj2bGCxcwVb4VhLBy5bDChlMdkQyCdJWUIa
         x/8yux2bqgNBBg3EXcORnB9wktBhbRobgdLGG4wj3w73FpiCXnQUecqfr6pphzIlxHiT
         9egQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7c7+axqI5McZqafZcz2S682O55TWbf2kPYzjikx5kothnAHBfmX1yRdSVPG+ZmecZ9qHZ6ZQCjH8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5u6ZYqHeZxJR4gqy87G/eB1+n9rEX7zY+A1c7VK09JW4b8JHu
	TGNFSfmDne8C9+q8poflF1k/7gGE9ZNOWjqdyjiq+jMngyG/lza9Ish4gD/eHMU=
X-Gm-Gg: ASbGnctDlatQZApAQBbesTrFNPtK5leOIdJ8OsupcxvXeYisgKj7AWq+grXCpFVGush
	epebz+C61JXYWjGaXeq24DLz3JdHBEMZbYjgQ2lXe0iEZbBojpHJF+9WDi3hVOkttToG/w7GSub
	hNdc4IvjL4nqazYe+jr+3I+1tM0Cdd+JIVVJqiFW4sywvbkRzqVkNHfiwZawkmd704SraOlAxZy
	+DzM1P4TJ0PLqg7UMjr4xLPiYd8FpLKeDenolP/6F/YOJiDmQ21fKRb09KZteH7KE0J7F5X9ZbG
	u0OUgEKTVVMhx5+04UGHiRnOvLzgXKt/Y3lRI3Nj4Phna5wlNgBQiLs=
X-Google-Smtp-Source: AGHT+IFXaiZRkyVGySzwXq4m6VQPxp21RvMO2vo9prRBdm8AJBTkW9Zk+yrEfRJ4a7V/TW4HzssgeA==
X-Received: by 2002:a05:600c:1f85:b0:439:5da7:8e0 with SMTP id 5b1f17b1804b1-4396e6c9389mr109339745e9.16.1739810464875;
        Mon, 17 Feb 2025 08:41:04 -0800 (PST)
Message-ID: <ddfee078-409e-4253-9d51-b2f512b41e63@citrix.com>
Date: Mon, 17 Feb 2025 16:41:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <77eb149c-bb1e-4f77-85ba-c44b173a5c1e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <77eb149c-bb1e-4f77-85ba-c44b173a5c1e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2025 4:31 pm, Jan Beulich wrote:
> On 17.02.2025 17:26, Frediano Ziglio wrote:
>> --- a/xen/common/efi/efi-common.mk
>> +++ b/xen/common/efi/efi-common.mk
>> @@ -2,6 +2,7 @@ EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
>>  EFIOBJ-$(CONFIG_COMPAT) += compat.o
>>  
>>  CFLAGS-y += -fshort-wchar
>> +CFLAGS-y += -fno-jump-tables
>>  CFLAGS-y += -iquote $(srctree)/common/efi
>>  CFLAGS-y += -iquote $(srcdir)
> Do source files other than boot.c really need this? Do any other files outside
> of efi/ maybe also need this (iirc this point was made along with the v5 comment
> you got)?

Every TU reachable from efi_multiboot2() needs this, because all of
those have logic executed at an incorrect virtual address.

~Andrew

