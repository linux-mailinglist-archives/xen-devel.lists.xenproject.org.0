Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332C888EB93
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 17:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698661.1090641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpWPZ-00061V-TD; Wed, 27 Mar 2024 16:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698661.1090641; Wed, 27 Mar 2024 16:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpWPZ-0005zu-Ph; Wed, 27 Mar 2024 16:46:01 +0000
Received: by outflank-mailman (input) for mailman id 698661;
 Wed, 27 Mar 2024 16:46:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lksO=LB=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rpWPY-0005zo-Bg
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 16:46:00 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ba72bb4-ec59-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 17:45:56 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3417a3151c5so4648361f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 09:45:56 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 en7-20020a056000420700b0034174875850sm14015642wrb.70.2024.03.27.09.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 09:45:55 -0700 (PDT)
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
X-Inumbo-ID: 7ba72bb4-ec59-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711557956; x=1712162756; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zBErRmkltSguH2d0/UJYPB7aHlGXWYjo+/5oLZJOopI=;
        b=JsO0UDcHeUZoTtdSOQ7P1Jsq75JkCtoI0QXYxmgEFxrMfZvIIM3DScymX8uJEEno1K
         YsCa4s6hqAMm/QmmAGRDHMy590cRP9z/BE6r4uKau37qkJU+iYDNPgVWKaN63DeBJA3R
         VN2iW1QQRZjyUdE4m4TQ21LJHeRU82t03dMuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711557956; x=1712162756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBErRmkltSguH2d0/UJYPB7aHlGXWYjo+/5oLZJOopI=;
        b=EMv3hvRfHkSv06qx8Uv+6lXvfo5lsklkM2mt/wguPWFAG/Qd+wCgDwFdjxCejrUMMZ
         ozCL7mRYv8dfJU56V1kjkFmm6hw7ZXaKQtJrNGJOxjaV2/KJ/ymFXW3cFHL8lwWI6Cqt
         aco8cPqLoWbQB8hV8qJNRuPKWu9GC3fEKdFuz8EdtVqsv7N2oEp89G9XhXyTD4qoMvEP
         cSFAVAI1Rd5r3WXXi3BBh/hLbqj1kZEEBHK2WFqJ2beLHiSK4aDgOkxqZ8mn6D+I5mQS
         0ljau2E7EVGZnyZs9sGQqDaLrPdommpmtYD9ZWzIU7Ds1nOj1ftPBjfWVW9NKd021DfU
         PQfw==
X-Forwarded-Encrypted: i=1; AJvYcCWxJ8bJatZhqryHOqncAICstjuj5Y7Ug2tc81DicHlVEdqB0PoOiFZoiMgQUXMGKZwWj9kyhM7jtxC8M1AnAjq0vjg1T45d9x66KqbyZww=
X-Gm-Message-State: AOJu0YztGMX33EAU+vUD43zSdxc8QJhKe/Ex4qp70hUrGuXYS2ZIf6OD
	JJ8yN66iMhHsLgqHctdr97AxCcHkkp3oWuBLKdlcB4rjeG5EziIVazcwgXvvLoQ=
X-Google-Smtp-Source: AGHT+IGpIy3vGf4ZXnW5ibtGUcB1DXYHc9NeWjaOzQq8JTFfd0ipLrHkEfSGQkvsU8UA2GxqISwyxw==
X-Received: by 2002:a05:6000:92c:b0:342:86e9:b3c7 with SMTP id cx12-20020a056000092c00b0034286e9b3c7mr76883wrb.37.1711557956127;
        Wed, 27 Mar 2024 09:45:56 -0700 (PDT)
Date: Wed, 27 Mar 2024 16:45:54 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH-for-9.0 v2 13/19] hw/xen: Remove use of
 'target_ulong' in handle_ioreq()
Message-ID: <3a2da257-87f7-4d3f-9ef2-8450bc7b2742@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-14-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-14-philmd@linaro.org>

On Tue, Nov 14, 2023 at 03:38:09PM +0100, Philippe Mathieu-Daudé wrote:
> Per commit f17068c1c7 ("xen-hvm: reorganize xen-hvm and move common
> function to xen-hvm-common"), handle_ioreq() is expected to be
> target-agnostic. However it uses 'target_ulong', which is a target
> specific definition.
> 
> Per xen/include/public/hvm/ioreq.h header:
> 
>   struct ioreq {
>     uint64_t addr;          /* physical address */
>     uint64_t data;          /* data (or paddr of data) */
>     uint32_t count;         /* for rep prefixes */
>     uint32_t size;          /* size in bytes */
>     uint32_t vp_eport;      /* evtchn for notifications to/from device model */
>     uint16_t _pad0;
>     uint8_t state:4;
>     uint8_t data_is_ptr:1;  /* if 1, data above is the guest paddr
>                              * of the real data to use. */
>     uint8_t dir:1;          /* 1=read, 0=write */
>     uint8_t df:1;
>     uint8_t _pad1:1;
>     uint8_t type;           /* I/O type */
>   };
>   typedef struct ioreq ioreq_t;
> 
> If 'data' is not a pointer, it is a u64.
> 
> - In PIO / VMWARE_PORT modes, only 32-bit are used.
> 
> - In MMIO COPY mode, memory is accessed by chunks of 64-bit

Looks like it could also be 8, 16, or 32 as well, depending on
req->size.

> - In PCI_CONFIG mode, access is u8 or u16 or u32.
> 
> - None of TIMEOFFSET / INVALIDATE use 'req'.
> 
> - Fallback is only used in x86 for VMWARE_PORT.
> 
> Masking the upper bits of 'data' to keep 'req->size' low bits
> is irrelevant of the target word size. Remove the word size
> check and always extract the relevant bits.

When building QEMU for Xen, we tend to build the target "i386-softmmu",
which looks like to have target_ulong == uint32_t. So the `data`
clamping would only apply to size 8 and 16. The clamping with
target_ulong was introduce long time ago, here:
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=b4a663b87df3954557434a2d31bff7f6b2706ec1
and they were more IOREQ types.
So my guess is it isn't relevant anymore, but extending the clamping to
32-bits request should be fine, when using qemu-system-i386 that is, as
it is already be done if one use qemu-system-x86_64.

So I think the patch is fine, and the tests I've ran so far worked fine.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

