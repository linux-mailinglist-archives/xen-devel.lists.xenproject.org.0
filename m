Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D57F973E08
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 19:05:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795913.1205392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so4Hl-0000mz-Gn; Tue, 10 Sep 2024 17:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795913.1205392; Tue, 10 Sep 2024 17:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so4Hl-0000lT-Dr; Tue, 10 Sep 2024 17:04:13 +0000
Received: by outflank-mailman (input) for mailman id 795913;
 Tue, 10 Sep 2024 17:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZWlv=QI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1so4Hk-0000lL-GP
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 17:04:12 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2f9056e-6f96-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 19:04:11 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso559218966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 10:04:11 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c62485sm502432766b.104.2024.09.10.10.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 10:04:09 -0700 (PDT)
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
X-Inumbo-ID: b2f9056e-6f96-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725987850; x=1726592650; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gqKpj1D4BsqX6UqtkgDfvd8c3DIdd29Sclhg15cKvaI=;
        b=hFp5zvvqbGQLqt0LKjVcpbvqv4foaX/Bc6/9Zr04+4DppbpP9AiXlVd0ImYSftSPoL
         aIG1U4iHpT3LU/e1GjSeVOblJe8dUsNtm7NMjqcUyXFYwrd5Ct4y6i06MInTmIkEy0qa
         /f3VHJcOX1XN6Y0BPzXG2C331UYKsfpOhDZeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987850; x=1726592650;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqKpj1D4BsqX6UqtkgDfvd8c3DIdd29Sclhg15cKvaI=;
        b=v/BZJ29zU/ULUygv0ZlAap6nb+zXE10FksxcK6rFa/6bEJ76FDWAYVZG0rrY3KYCpb
         nusXYS4GrF6ZDUHCWM2rw7fpH527O/B2OGTsexhdCrHXfbKc5wtgHFbhaZMgshl0hXLc
         iPf/Tu2hEYQHUlrynKxYVkPpwIk+pNm+WINbUeH2qajZi4YN95fwANOYYDad7ANE86Ti
         jDGY1vgegbpdP2jMZQAjmTxY+L5JT+nXA3anrvNtesX1drkT+a3YG4P4cGEcTIbx4M9M
         or2B0TdE6Oj7xZ2jO/hnGA+6JVYIkYdW88S9PLUJhTZsI99wRxIm8OjGIZHtPfSZZ36j
         iHqA==
X-Forwarded-Encrypted: i=1; AJvYcCUBUImUBh0svHFjn84j/f4nXIoDfjWwDv8cnRiDZmAHnr4SeBBPtjbYGJBbzGexhegxDgZSzpavohY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhBcPLCk6aAts+SKXLJZEQcRPoms7lnmcahq29cGrIGslqJ0s9
	rWIz9sggizTkDr1AWdIgC9MjhOoF+vuV46WqeZ3HUtAEjrrX6PouNdrTYEv3kpk=
X-Google-Smtp-Source: AGHT+IETU9Jv4JXIoSluQZtbb5vM5+A1WrEAqT+OWSK5radHBTApywrVR7r9WVP0TWgirjbdeDj2Zw==
X-Received: by 2002:a17:907:c27:b0:a7a:9a78:4b5a with SMTP id a640c23a62f3a-a8ffad9da29mr153041966b.52.1725987849587;
        Tue, 10 Sep 2024 10:04:09 -0700 (PDT)
Message-ID: <7ef812a0-2990-4bda-85e3-6b999d1d1ff8@citrix.com>
Date: Tue, 10 Sep 2024 18:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] x86/HVM: drop stdvga caching mode
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/09/2024 3:38 pm, Jan Beulich wrote:
> It's been unused for nearly 9 years. By the end of the series stdvga.c's
> sole purpose will be to make sure VRAM writes use the bufio ioreq path.
>
> 1: drop stdvga's "cache" struct member
> 2: drop stdvga's "stdvga" struct member
> 3: remove unused MMIO handling code
> 4: drop stdvga's "gr[]" struct member
> 5: drop stdvga's "sr[]" struct member
> 6: drop stdvga's "{g,s}r_index" struct members
> 7: drop stdvga's "vram_page[]" struct member
>
> Of course all of these could be folded into a single patch, but I think
> going piecemeal makes more clear that the individual parts are indeed
> unused.

I far prefer a series split like this, than a single patch with 7 moving
parts.

Also, this is certainly in the right direction.

$ ../scripts/bloat-o-meter -c xen-syms-before xen-syms-after
add/remove: 0/6 grow/shrink: 0/7 up/down: 0/-2640 (-2640)
Function                                     old     new   delta
hvm_domain_destroy                           250     242      -8
hvm_load                                     548     532     -16
hvm_domain_initialise                       1050    1034     -16
stdvga_deinit                                 67       -     -67
stdvga_mem_accept                            236     166     -70
stdvga_mem_offset.isra                       103       -    -103
stdvga_intercept_pio                         158       -    -158
stdvga_init                                  223      52    -171
stdvga_outb.isra                             240       -    -240
stdvga_mem_write                             430     105    -325
stdvga_mem_readb                             396       -    -396
stdvga_mem_read                              423      17    -406
stdvga_mem_writeb                            664       -    -664
add/remove: 0/3 grow/shrink: 0/0 up/down: 0/-81 (-81)
Data                                         old     new   delta
sr_mask                                        8       -      -8
gr_mask                                        9       -      -9
mask16                                        64       -     -64

Interestingly `nm` identifies these as 'd' (initialised data) rather
than 'n' or 'r' (read-only data), but they are between _{s,e}rodata.

~Andrew

