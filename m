Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953BBBDA85D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 17:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142929.1476824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8hOt-0006ci-Nv; Tue, 14 Oct 2025 15:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142929.1476824; Tue, 14 Oct 2025 15:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8hOt-0006aZ-LG; Tue, 14 Oct 2025 15:57:23 +0000
Received: by outflank-mailman (input) for mailman id 1142929;
 Tue, 14 Oct 2025 15:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xUX=4X=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v8hOs-0006aT-6E
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 15:57:22 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 751ffade-a916-11f0-980a-7dc792cee155;
 Tue, 14 Oct 2025 17:57:17 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so9055295e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Oct 2025 08:57:16 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d3desm24387496f8f.7.2025.10.14.08.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 08:57:15 -0700 (PDT)
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
X-Inumbo-ID: 751ffade-a916-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760457436; x=1761062236; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=31jo0ageX4O5yWbi5Zla4GVnwA5qspZErOKBpOgrl5g=;
        b=hHSkJQ7nepuR4ztwK/11I4pTgvF5GYsUqk9q5gjZX6k2b7SaA37A/8AzOMbEHNftl2
         WI88vJbvsNNSjXM0CHHoeECaLCIUfhAEWwYQmEGRZTHct9u0NODbtJA1nJz8gADt/uyn
         r4Reo6DCp+V2hEMv/N88Fsfta1hY4NnZ0zrDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760457436; x=1761062236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31jo0ageX4O5yWbi5Zla4GVnwA5qspZErOKBpOgrl5g=;
        b=W9B2LWrmSXfzDQBx+xbXCoaXU13WgJE0JiO+0BkZaYiCyZ+2+C/zVAOlK3XHuvE7fC
         KR180z/YVoB4Lc/vjFZ8lvgPKxWcFW8a9tL/nDzj3xwN7OhLVvgxmQMeRVuqx+L8+7S6
         twIbaUyTPpT51m9Z8TdplVlprArZQuRBftlAmJPlyCi9Qe9uPxM9OW8NLwxRwk9IXI+6
         cH6TVSiOX/o1p/NpEC5IHFtnjGE9NcDiLNfnW2rlXZyQEITUZuOj9jHuiCWd44MOp8DY
         OWlLBoHSPTRXSDnNNEJQuJuyynH+PdeAbYlrXI/tx2NoXqbL8SByn7zjRBSlxS96p2Yg
         2cEQ==
X-Gm-Message-State: AOJu0YyYLwMWtmHuyhoYNpuD+t4Lcfc/16lvjuEmCaRiI7DaaH3TE6z1
	oUAB+6QqfcegpyP9eLq09CmDnGq5UYU5X5hFw1CTvU2Gb28+/NlrL/LowfaT1jKfWyw=
X-Gm-Gg: ASbGncvv1D8Uw0296lHva9BFpvCa/fehq6qcmxMcQxFi6C50PuuFiSehUg+BXvVwtBU
	pGnDQIsscvgEMAldtca/CTv/bhahaRAX1VYbdKaVaC6nzd2ZaIiloHXr3k96lw5OEajDnAJ4hAD
	0nDnXvLwbRnXlfKgRRwe17FW9YvkMAp/6g7Xu68AkUScU1ZU9HyOrqYUi13qV4MLu6IqZjkTtkg
	7MNhjxAUk2ocWbSM7qoqy3rSW37FKoaAnMepX/Z8GNrqZDTP+95v7S4uKNxoIdy71V1po/ttrlN
	248EDEkal3Z59mkaVQ1Wh2rCJlHXRRmUYvNqssj4qLtRsRthwRi+1gflp4gNL7hc2V6naQ87Buj
	xWKe6NOImpJ3TnV5kziHJ/LOUTyyZHUBwvEY0beqwfcBXVxAUPNbpiufzls4/03LuKxDkQVQkkx
	R2Q0g=
X-Google-Smtp-Source: AGHT+IFA6yEAfvUuGwOKeR0y/hv4rbm3M0J/LhfbGineThZxSRwFR7MCJww/bk4QrY/P8Tqi5E/QFw==
X-Received: by 2002:a05:600c:154a:b0:46f:b327:f20d with SMTP id 5b1f17b1804b1-46fb327f2aamr117199075e9.26.1760457436243;
        Tue, 14 Oct 2025 08:57:16 -0700 (PDT)
Message-ID: <7a206259-3eb7-4b0c-8437-78579931e56b@citrix.com>
Date: Tue, 14 Oct 2025 16:57:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 v2] efi: Protect against unnecessary image
 unloading
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20251014130648.2540082-1-andrew.cooper3@citrix.com>
 <aO5QMFtLpC819kbZ@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aO5QMFtLpC819kbZ@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/10/2025 2:29 pm, Marek Marczykowski-Górecki wrote:
> On Tue, Oct 14, 2025 at 02:06:48PM +0100, Andrew Cooper wrote:
>> From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
>>
>> Commit 59a1d6d3ea1e introduced Shim's LoadImage protocol and unloads the
>> image after loading it (for verification purposes) regardless of the
>> returned status. The protocol API implies this is the correct behaviour
>> but we should add a check to protect against the unlikely case this
>> frees any memory in use.
>>
>> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Thanks.

> with one comment below (I'm okay with the patch either way)
>
>>      EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>>      EFI_STATUS status;
>>      bool verified = false;
>> @@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
>>              verified = true;
>>  
>>          /*
>> -         * Always unload the image.  We only needed LoadImage() to perform
>> -         * verification anyway, and in the case of a failure there may still
>> -         * be cleanup needing to be performed.
>> +         * If the kernel was loaded, unload it. We only needed LoadImage() to
>> +         * perform verification anyway, and in the case of a failure there may
>> +         * still be cleanup needing to be performed.
>>           */
>> -        shim_loader->UnloadImage(loaded_kernel);
>> +        if ( !EFI_ERROR(status) || (status == EFI_SECURITY_VIOLATION) )
> So, just in case of double-buggy firmware, check loaded_kernel here too?

So to be clear, you're asking for:

loaded_kernel && (!EFI_ERROR(status) || (status == EFI_SECURITY_VIOLATION))

here?  Yeah, can fix that up on commit.

~Andrew

