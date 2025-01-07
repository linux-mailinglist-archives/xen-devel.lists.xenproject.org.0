Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EBFA044D0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 16:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866551.1277847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBdx-0006qL-Np; Tue, 07 Jan 2025 15:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866551.1277847; Tue, 07 Jan 2025 15:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBdx-0006of-K1; Tue, 07 Jan 2025 15:37:21 +0000
Received: by outflank-mailman (input) for mailman id 866551;
 Tue, 07 Jan 2025 15:37:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aJXC=T7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVBdv-0006oU-MX
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 15:37:19 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47487c52-cd0d-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 16:37:18 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso159080815e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 07:37:18 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366e210cecsm565458225e9.2.2025.01.07.07.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 07:37:17 -0800 (PST)
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
X-Inumbo-ID: 47487c52-cd0d-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736264238; x=1736869038; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Nn49KIz/Kqr+XOf+BeSA+uccHMjMolWvltQhZ9YK2M=;
        b=LJa9x9kgRqI1sLFm56XF7jDXj1lz4JbYK3z8zdS6xwqPyvbSX0L8CjnCYOAKjFibwH
         8jdPYkWNep9yKnah6lO01sz/MX2NnOyTjUtetlNMPchsYJe0zYi4C2Y1k5rUVXvjqAhF
         mGu6vNDGSHvHjU0mBhyC8H8tL4NaYZHBEwoSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736264238; x=1736869038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Nn49KIz/Kqr+XOf+BeSA+uccHMjMolWvltQhZ9YK2M=;
        b=vc97yHs82Fkyx4Rd3MpchLWuxef4AHH+pRL52oRQLsMnt0x/xrf7Cm+wNZJ2rGt15q
         2ITr2gj+ZgheXzNlI7HVXqtM0RD2rMfS29IBibUyRGy0+dFNqMaCX7J3fJEOrxjINeWI
         hf2O7UbNvbHmQJJwYnQl7xkkzAtjqyIPeFd3h5DAPS+h2VYSinIaUYR37Xll5+Ga+2be
         DxRM4DHTWpjYaxns6M1zhvn3psqy6O29g7QG2U2L4y96NgHfAXFa/Bh82bpsYfGlseLV
         mcxcAXAUrhNSF+MYKfpP0LXVQWTTrorp8iMUVStwJAgBRtXOxUtEgWotL8v1baOqfSaK
         DnTA==
X-Forwarded-Encrypted: i=1; AJvYcCVP4s7O+pgWmsX3hok3eON1kCkSblVi9vYd5HJZtUe4wCbwyhOZKHZHzagnVSNROU4GMiwyUi6mynQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2IUdIMjOzur2RbOrdv4vybFtGr2dNr+ZY+3QzGqEAJJxnu2Nz
	oluWf5AapHotUqqAoNJw6lhezfNXEK19LobJnvnDvEs59lbWbfCmRNdciGoQRYBDJeRzAA53Vtl
	hPdFmzw==
X-Gm-Gg: ASbGncukMU5g9B61/SdoAC9I8tw5GBT0NzvmhxM+SiskhkfLbAOnh+p6+NooGw3ReIp
	UOJ/3S5iqxMdYYyDty6HGEKFIeY+BN2kGF4oFHNYztGFs6I/NuDiXZn/TE5BT3G3tBWIhroA6bu
	wIXOoYic69c/36wrN6GgTpMVX4sWERkk43KGzUE3CAJD06A/8wXXLvn6/rKTz8bWcKTOVVXEDJk
	IgD3HmKyTdBUAg2Txp1bVf45kJ++KlLpdYQvJM/N/4xbLKI4IHFgZgd9nlA3kci13F7/Hd6w7Ca
	X4dY1GZRGHU2FRcmlXHq
X-Google-Smtp-Source: AGHT+IEct/ZjsymJxr4n+LpeUUp4aAFbkh0FOwDPzGlhkn7Dzvp5Vt2FkkzCbtqxcKqZLzZeN9b+LA==
X-Received: by 2002:a05:600c:1f8f:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-4368a8b6a2emr442067425e9.18.1736264238205;
        Tue, 07 Jan 2025 07:37:18 -0800 (PST)
Message-ID: <8db5b675-385f-4ea7-a2e9-7a8a54d96f72@citrix.com>
Date: Tue, 7 Jan 2025 15:37:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: correct put_fpu()'s segment selector handling
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <81428267-e963-4403-989d-d96fb0b59ffc@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <81428267-e963-4403-989d-d96fb0b59ffc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/01/2025 2:33 pm, Jan Beulich wrote:
> All selector fields under ctxt->regs are (normally) poisoned in the HVM
> case, and the four ones besides CS and SS are potentially stale for PV.
> Avoid using them in the hypervisor incarnation of the emulator, when
> trying to cover for a missing ->read_segment() hook.
>
> To make sure there's always a valid ->read_segment() handler for all HVM
> cases, add a respective function to shadow code, even if it is not
> expected for FPU insns to be used to update page tables.
>
> Fixes: 0711b59b858a ("x86emul: correct FPU code/data pointers and opcode handling")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The code comment may want adjusting in the course of FRED work.

It compiles when displacing my temporary patch in the FRED branch.  I've
not got the ABI compatibility in userspace working yet, but
regs->{ds,es,fs,gs} will be staying, so the #else case should be fine
(assuming they're populated properly).

So, tentatively, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

That said, I think it would be nicer to see about excluding the FPU in
these cases.  Both cases lacking read_segment() hooks are pagetable
emulation, and I'd say it's more likely to be code corruption than there
actually being x87 instructions in the middle of a dual 32bit PAE update.

~Andrew

