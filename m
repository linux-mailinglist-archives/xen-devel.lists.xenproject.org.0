Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC61C9305C2
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 15:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758477.1167957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSclb-000822-V5; Sat, 13 Jul 2024 13:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758477.1167957; Sat, 13 Jul 2024 13:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSclb-0007z5-S2; Sat, 13 Jul 2024 13:26:23 +0000
Received: by outflank-mailman (input) for mailman id 758477;
 Sat, 13 Jul 2024 13:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBzr=ON=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sSclZ-0007yv-Ro
 for xen-devel@lists.xenproject.org; Sat, 13 Jul 2024 13:26:21 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7de212f9-411b-11ef-bbfb-fd08da9f4363;
 Sat, 13 Jul 2024 15:26:20 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-36799fb93baso1591017f8f.0
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jul 2024 06:26:20 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77b0bsm20505315e9.1.2024.07.13.06.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 06:26:18 -0700 (PDT)
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
X-Inumbo-ID: 7de212f9-411b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720877180; x=1721481980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=scqJXYcQaLoYeJDnQsaF9SvQZm1QG3j6UO4fRo2x1dc=;
        b=XAMaaK223jLcImPaPq1jUaFqi5YAyLeYKur1jyB7NofqPVnjZOkJxIKlFivdAtpJpk
         sVsfMOgPZRrc6qeYKsKhsATXkUUM27t0EveUOVXLWGT+jjgP98rxChlYbTFzS8tDB6Xq
         L+nPjz0NI+OYc9reStTOoFnJV6XAhkTZ1ynB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720877180; x=1721481980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scqJXYcQaLoYeJDnQsaF9SvQZm1QG3j6UO4fRo2x1dc=;
        b=IBG7FxAFAM3Gz0SO+2kvlxaDPQ3nhnf1ARhANAOnNwHyg4nzGljl+Q0mQ/iam5pV4N
         dEyf2QokhH7mZc+FdYH4lbCcl+RzA92BNPHcvOrxFpcPeUVKdCX643sL2J/RCCtga4Jb
         dw8WxSud7Hwco2z7IqCLOnBowIa9fkW1seGOU4akkALfRRKVaMizRjMWVCMQnKXhFiW8
         dv3YxjQsIUSnOOyELsQ++Ofyx1FoqOejeW2N0pdw5mzzph8bQ+Xz1fFATN3tm6yOUls2
         sOqtoP+6r0lxGRHU0NnMcvvrnHTAgfYzQWZgDC/kYs7vbJ8A3XMdB4cW60Czzd9b9ejd
         YOiA==
X-Gm-Message-State: AOJu0YwmBIpm9H+QPDym2qQpA7aAxhM5mVulXrqHqH2ybFPM2ddvOG16
	MMTJjj4znMcQCZW6itRrVUtLCwo1AvCeR5l2Fdgm1UPvPntXQplT/flFjwSK3raPZfrKUfoV26g
	GQKU=
X-Google-Smtp-Source: AGHT+IG5k/D2E1wNlWwiYW3dFvc0O6hGPUnRhZzA6K+bWBy9O4jgYNeqcHNmBN67A+SCh80oaRZ5bA==
X-Received: by 2002:a5d:5cd2:0:b0:366:e7b5:3b49 with SMTP id ffacd0b85a97d-367cead164fmr8106666f8f.54.1720877179923;
        Sat, 13 Jul 2024 06:26:19 -0700 (PDT)
Message-ID: <8f8dac21-92fe-4760-8578-2fbfde2f2c14@citrix.com>
Date: Sat, 13 Jul 2024 14:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
To: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr>
 <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com>
 <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ok, so trimming down to the relevant pieces, we have:

On 11/07/2024 12:09 pm, Fonyuy-Asheri Caleb wrote:
> =========================================================================================================
> Source server xen-cpuid -p
> =========================================================================================================
> Raw policy: 32 leaves, 2 MSRs
> ...
>   00000001:ffffffff -> 000306f2:00100800:7ffefbff:bfebfbff
> ...
>   0000000d:00000000 -> 00000007:00000000:00000340:00000000
>   0000000d:00000001 -> 00000001:00000000:00000000:00000000
>   0000000d:00000002 -> 00000100:00000240:00000000:00000000

Haswell, with AVX, and ...

> PV Default policy: 31 leaves, 2 MSRs
> ...
>   0000000d:00000000 -> 00000007:00000000:00000340:00000000
>   0000000d:00000001 -> 00000001:00000000:00000000:00000000
>   0000000d:00000002 -> 00000100:00000240:00000000:00000000

... AVX available to PV guests.

On the target, something very different.  We have ...

> =========================================================================================================
> Target server xen-cpuid -p
> =========================================================================================================
> Raw policy: 39 leaves, 2 MSRs
> ...
>   00000001:ffffffff -> 00050654:00200800:7ffefbff:bfebfbff

Skylake. (Which is very much not a Haswell.)

>   0000000d:00000000 -> 000002ff:00000000:00000a88:00000000
>   0000000d:00000001 -> 0000000f:00000000:00000100:00000000
>   0000000d:00000002 -> 00000100:00000240:00000000:00000000
>   0000000d:00000003 -> 00000040:000003c0:00000000:00000000
>   0000000d:00000004 -> 00000040:00000400:00000000:00000000
>   0000000d:00000005 -> 00000040:00000440:00000000:00000000
>   0000000d:00000006 -> 00000200:00000480:00000000:00000000
>   0000000d:00000007 -> 00000400:00000680:00000000:00000000
>   0000000d:00000008 -> 00000080:00000000:00000001:00000000
>   0000000d:00000009 -> 00000008:00000a80:00000000:00000000

and AVX, MPX(x2), AVX512(x3), PROC_TRACE and PKRU.

> Host policy: 38 leaves, 2 MSRs
>  CPUID:
>   leaf     subleaf  -> eax      ebx      ecx      edx     
>   00000000:ffffffff -> 0000000d:756e6547:6c65746e:49656e69
>   00000001:ffffffff -> 00050654:00200800:47fee3ff:bfebfbff
>   00000002:ffffffff -> 76036301:00f0b5ff:00000000:00c30000
>   00000004:00000000 -> 3c004121:01c0003f:0000003f:00000000
>   00000004:00000001 -> 3c004122:01c0003f:0000003f:00000000
>   00000004:00000002 -> 3c004143:03c0003f:000003ff:00000000
>   00000004:00000003 -> 3c07c163:0280003f:00004fff:00000004
>   00000007:00000000 -> 00000000:029cffdb:00000008:bc002400
>   0000000d:00000000 -> 0000021b:00000000:00000a88:00000000
>   0000000d:00000001 -> 0000000f:00000000:00000000:00000000
>   0000000d:00000003 -> 00000040:000003c0:00000000:00000000
>   0000000d:00000004 -> 00000040:00000400:00000000:00000000
>   0000000d:00000009 -> 00000008:00000a80:00000000:00000000

Xen has only chosen to activate MPX(x2) and PKRU, and indeed...


> PV Default policy: 30 leaves, 2 MSRs
> ...
>   0000000d:00000000 -> 00000003:00000000:00000240:00000000
>   0000000d:00000001 -> 00000007:00000000:00000000:00000000

... PV guests get nothing, while you're trying to migrate in a guest
which...

> =========================================================================================================
> VM xen-cpuid -p $domid
> ---------------------------------------------------------------------------------------------------------
> Domain 3 policy: 31 leaves, 2 MSRs
> ...
>   0000000d:00000000 -> 00000007:00000000:00000340:00000000
>   0000000d:00000001 -> 00000001:00000000:00000000:00000000
>   0000000d:00000002 -> 00000100:00000240:00000000:00000000

... has AVX.

This explains why you're hitting the "guest size > xen size" check.

Migration should have failed earlier with a clearer message about the VM
having features not available on the target, but I suspect I know why it
didn't, and sadly its an item I've had on the todo list for a few years.

Perhaps the more important question, are you booting the skylake with
cpuid=no-avx on the command line by any chance?

~Andrew

