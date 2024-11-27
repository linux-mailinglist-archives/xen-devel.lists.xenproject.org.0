Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051D99DA41E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 09:44:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844537.1260034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGDer-0006BJ-FC; Wed, 27 Nov 2024 08:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844537.1260034; Wed, 27 Nov 2024 08:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGDer-00069o-CF; Wed, 27 Nov 2024 08:44:25 +0000
Received: by outflank-mailman (input) for mailman id 844537;
 Wed, 27 Nov 2024 08:44:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p/Ub=SW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tGDeq-00069i-Di
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 08:44:24 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb6e9cd2-ac9b-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 09:44:20 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa55171d73cso104940166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 00:44:20 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b5c621dsm675173066b.205.2024.11.27.00.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 00:44:18 -0800 (PST)
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
X-Inumbo-ID: cb6e9cd2-ac9b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNiNmU5Y2QyLWFjOWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjk3MDYwLjY1MTk5Mywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732697060; x=1733301860; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VSmPktWq4mIMkqnELRn+ZMLmjAalzVk99B0FpFPEyW0=;
        b=DSpswVYq1DGRZ/cTDEniGVSR1b3ouObP5Gc5OglewFKx6wV+WWN0stu0RaLZmggOh0
         7pvarw2LeFhxYLTDyECjgeyaNDpPhIAXiVCRfFbwWYZ+buJy19qqDdivBlegSN3N/k4i
         6AlHEP/mCek1KGDfWM8ZQfejbfAV/AVq6nJT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732697060; x=1733301860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VSmPktWq4mIMkqnELRn+ZMLmjAalzVk99B0FpFPEyW0=;
        b=HzkzAzwYYQu3KA+LvN8iDwC5LmmZh/rbINH1xTjejN5rdDoUABKCTBZKUAVQ15ziXS
         qvVDB0TQHKCJFNRtUwTFuMyGpyMQdFL+xHLVOzfEJ3bq8qYYzTluE0rlnPyJYA4SWknt
         XujBNf0V/SzJvIpzNqbKeO/eOnM5PUq9NA5yw2XJaAaUBE/J46680cl4JjCZGoM50O/0
         +Y6SgzqZ4fsKqSeUSkfd+SiPUdwpPZ0l+1A/zdEJIczaXERyqCnhuL5hYFa7WnigYuDy
         FDLBpX75bYuoVtjge1q7nDy45xiY0UKsqSU0oEnbBk88SKBsChXipGPqwyl+8dVYYtTP
         k53g==
X-Gm-Message-State: AOJu0YxHieX+SppcG+rPrhi41EkzIwKGSvXvHVLemMi/MUkerismjamm
	9OYbUURDBvTU/7iJ5DE0BVyMxzLBTFhLquHFQUyZ/qgGvFHAw467rOYjSUnVZA8=
X-Gm-Gg: ASbGncugVlMsym5FQ2OSzVlvW3A0ftQybTBd3yTUyXxekyq3VzKgGlmRsjPJ/VydNnS
	trNs+PreGzSxUMk5Da/WRJn83k4Qvbd867e+NTIr1vsJh6T+go2qR130K68dN0RnwB6stYLO6t3
	Mi6biEtdC2kJXsB31OlAIF+63BlYBlHo/5GqW2H7snrzbMMJuAwMBezuzUyWZOgZ7kwfU9zsFJH
	PUidJSZ/kg54B4SXKDgm4OyTr1merSw4oFdLcMmgL729TsvNozsd1M9AyE=
X-Google-Smtp-Source: AGHT+IGgc8XaxwnroXjNBDSqOxXT6f6ChhFWwLeWiFevE4cTuBcRLA/1KkV9+BFShoh5qJOCMP7Xqg==
X-Received: by 2002:a17:907:7711:b0:a9a:eeb:b26a with SMTP id a640c23a62f3a-aa57fa9996dmr233121766b.1.1732697059268;
        Wed, 27 Nov 2024 00:44:19 -0800 (PST)
Date: Wed, 27 Nov 2024 09:44:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v1] x86/APIC: Read Error Status Register correctly
Message-ID: <Z0bb4t5AIm_NJkFE@macbook>
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>

On Tue, Nov 26, 2024 at 05:06:15PM +0000, Javi Merino wrote:
> The logic to read the APIC_ESR was copied from linux in a commit from
> 2002: 4676bbf96dc8 (bitkeeper revision
> 1.2 (3ddb79c9KusG02eh7i-uXkgY0IksKA), 2002-11-20).  In linux 3.14,
> this logic was fixed to follow the Intel SDM (see commit
> 60283df7ac26 (x86/apic: Read Error Status Register correctly,
> 2014-01-14) in the linux kernel).  The Intel(r) 64 and IA-32
> Architectures Software Develover's Manual currently says
> in Volume 3, Section 12.5.3:
> 
>   Before attempt to read from the ESR, software should first write to
>   it. (The value written does not affect the values read subsequently;
>   only zero may be written in x2APIC mode.) This write clears any
>   previously logged errors and updates the ESR with any errors
>   detected since the last write to the ESR. This write also rearms the
>   APIC error interrupt triggering mechanism.
> 
> Update error_interrupt() to remove the first read and follow the Intel
> manual.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Not sure whether the plan is to squash your commit and Andrews.

Thanks, Roger.

