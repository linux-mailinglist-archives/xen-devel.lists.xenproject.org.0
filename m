Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C447EAEDCA2
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 14:22:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029119.1402867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWDWD-0000vk-CP; Mon, 30 Jun 2025 12:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029119.1402867; Mon, 30 Jun 2025 12:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWDWD-0000tn-8W; Mon, 30 Jun 2025 12:21:53 +0000
Received: by outflank-mailman (input) for mailman id 1029119;
 Mon, 30 Jun 2025 12:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3E/H=ZN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uWDWB-0000th-PG
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 12:21:51 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cceace91-55ac-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 14:21:51 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-453647147c6so47842895e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 05:21:51 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538233c4acsm161332475e9.1.2025.06.30.05.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 05:21:50 -0700 (PDT)
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
X-Inumbo-ID: cceace91-55ac-11f0-a312-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751286110; x=1751890910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z8f+hd9kPFk/vvLhPYl067xUnHuLLUSWmVD76ZBQOXU=;
        b=EYSNxViHyrCBHh7H+lEKYH+L1mH8NgpTXPaUhpmVxGD/ZcWizswrrZAPs1GbIPtNhL
         cGgo98Q/1UUN4NhndIpODvD56KR4UPsd7U6wgCDMN6aQnBUKghKTjtD3pgbGvcGGxyum
         NeJZBlD2d9BTtdpa+Ma6KnVMQT3UEaDoErdso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751286110; x=1751890910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8f+hd9kPFk/vvLhPYl067xUnHuLLUSWmVD76ZBQOXU=;
        b=BW/38BwYuFt60fe4x1OioEXIFLZ8OUjKfcG/EEvUEkvExVMsPT7p5llYDO8InThdnT
         7YVZwYOC9Op8Da0RwON+2VTEBNlYdIjrDvqhiBczZXJANJPxphKsaS8Hm+KcQyjndDlZ
         W1KXTzXLhonsma+WFluNAZlnYKiGvCD5iQGF+YKsBKueMXceSp2jKV3qRNX9m1s+s60A
         VfjID84Yxbyaz670KhxqPXDMxy4DKBifarvXup4EutACVPG3mwqnkp6qqiuIrtr79WIz
         NmC2Xas8SM8WntLC68W9dQbG741j6uywkfo1RVPJ9VmmSes8CZACnOe7ZA9DhfBDK+BV
         L3UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX7xMUR7ayrgpQlHPr/Y1+3KeMqU0TMbcT3TngmksOP2sqPhs/hD07zYq9bNXm/VH0+yldmvhPj7E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRZdATk6dbRXsEwLheXRwqhbb4ZylV6PNt/IhnRs5nnHQQ9DLx
	dmA5TnKCHoKM5x+9aGiHZ2sOBT8PSr/jh9tLOY5RLN+4uHeqJznA9iG4wbultTSO1+Q5i1lnrOT
	sBiSOUFPGhA==
X-Gm-Gg: ASbGnctJtUi1Wsk3vQldNLOWwWs04M053EZ42IGlo5s+/wVEER00W3cXTgqT515WHpQ
	0QnBH3lTIJ1fXctMTD1GBy1ItCQ+eK4VzgI9e+XDWjQ6K+Ohx41LAL3LydXi6SIilcQcCkHK2R4
	LWtlIHSTdNc1XHhmVcHhgtCd4CpqNJanD3SYFI9vH8Ufp4wlpLsc8A6oiPgGroF68M5vMwXSqZN
	hc6Dm8ghFxq2pVWuMZ9hYdVNBgGlVc0cg6R2c++4l7H4STYxFHzmXhUS5nZwwDYIPo1mEqoZCLC
	l7sb2emKKKWC89X0nAhzPgMYsfxqzP7Xhuh3CiOW4W/fVTUfYxNuGLUoyvYkGBJohOHS74dQBNP
	9ixL6cTswiPvo9YifkTjq25Rff7E=
X-Google-Smtp-Source: AGHT+IF4dmJYoN/fFm85UW+ys+1C3BJsj5B6zGKnsjaP+Cq2R0GqJcVMPEdUtaMA56oPFxAwtVa7IA==
X-Received: by 2002:a05:600c:4f13:b0:453:2433:1c5b with SMTP id 5b1f17b1804b1-4538ee15a9emr133309415e9.5.1751286110407;
        Mon, 30 Jun 2025 05:21:50 -0700 (PDT)
Message-ID: <bdc2a10a-db0f-4787-81fe-d152bb76b88e@citrix.com>
Date: Mon, 30 Jun 2025 13:21:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/EFI: restrict use of --dynamicbase
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <a4343e2b-7bbd-4dca-8bcd-d30caf7555cf@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a4343e2b-7bbd-4dca-8bcd-d30caf7555cf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2025 1:45 pm, Jan Beulich wrote:
> At least GNU ld 2.35 takes this option to (also) mean what newer
> versions have controllable by --enable-reloc-section. From there being
> no relocations in check.efi (as we don't pass the option there) we infer
> that we need to involve mkreloc, we'd end up with two sets of
> relocations, which clearly isn't going to work. Furthermore the
> relocations ld emits in this case also aren't usable: For bsp_idt[] we
> end up with PE_BASE_RELOC_LOW ones, which efi_arch_relocate_image()
> (deliberately) doesn't know how to deal with. (Related to that is also
> why we check the number of relocations produced: The linker simply
> didn't get this right there, yet.)
>
> We also can't add the option to what we use when linking check.efi: That
> ld version then would produce relocations, but 4 of them (instead of the
> expected two). That would make us pass --disable-reloc-section, which
> however only ld 2.36 and newer understand.
>
> For such older binutils versions we therefore need to accept the slight
> inconsistency in DLL characteristics that the earlier commit meant to
> eliminate.
>
> Fixes: f2148773b8ac ("x86/EFI: sanitize DLL characteristics in binary")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

