Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FC988EC9C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 18:27:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698675.1090671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpX3N-0005If-Ed; Wed, 27 Mar 2024 17:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698675.1090671; Wed, 27 Mar 2024 17:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpX3N-0005GU-Bp; Wed, 27 Mar 2024 17:27:09 +0000
Received: by outflank-mailman (input) for mailman id 698675;
 Wed, 27 Mar 2024 17:27:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lksO=LB=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rpX3M-0005GM-1n
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 17:27:08 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b7686ef-ec5f-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 18:27:06 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33ecb04e018so4966993f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 10:27:06 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fa7-20020a056000258700b00341c6b53358sm10953709wrb.66.2024.03.27.10.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 10:27:05 -0700 (PDT)
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
X-Inumbo-ID: 3b7686ef-ec5f-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711560425; x=1712165225; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LOeWq64vcMpyC+dfgqU4qcoJI/qjRuI1jSd1ZXO7Aa8=;
        b=Nffd0mviZlZzbUG0Gj33WOX2O+GBHtaI2dY2EIqp+m8IFTwcQdZ43rukG4E/pGIDrY
         1MKPTBDmOsUoTXGIeRfBhW6Gy7K2RklkiWdivwkndcTu02LOh9R2i/1LF7981dww0ulV
         QbABuP03pvBFVvIENC55OvksgkjIp6+W+jf3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711560425; x=1712165225;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOeWq64vcMpyC+dfgqU4qcoJI/qjRuI1jSd1ZXO7Aa8=;
        b=ki7saFEtxeGYOaJQJyI+vO6CMUUwe9tjjNSMWc0wze1Qs5+qkbxlI12TH4LN0yPK7P
         3A3rt9hNIB3gBxoE2cHQbu0RWqNlZ6bswgjrDjfttl6ev+V7fwcG51UIalzH6CwjZepv
         Xfb6uBm0JtYP4pRhkDPjcnSnh6j4rJ9iJfdJdwu/4RyKth7wiThYNXI91LDIOB4ErrVs
         dbIx8ihCkEbesQvP9uDrbKLgKJIF3IVvguIBX9wEZ9sk/wUwV8ExGxqF+Grc0P9GT/dw
         uS3jIHW8+FzJKqxSP9yJCGQxd53uvu6u8DVizYnGmyGQTUznItnm1pfxuY40dAGD1wf5
         H/yA==
X-Forwarded-Encrypted: i=1; AJvYcCWDvwliFgIc8QvdCNELAXiLzPPNokrq22Zt3mt229vQ172r8VPGTc+3ou9Pk+HeoLZXqD220XQg8q2bSO/e0fAHoWBIS3CCkbeF0hWF2z0=
X-Gm-Message-State: AOJu0YzGWkft1a+XpKoqGBe+xAG8/hQJFgs/IbodR77j1f6hJq+wzr3k
	DeTJFNI0k91GUnl2O3lKUSeo5ZG6K7MuPAsahK5vpSAecETYoEsVRqgA3UCkM7E=
X-Google-Smtp-Source: AGHT+IHr9JM+c5QDCOdkTDoDNItACvq5s9onzO3m1fxTIw9ef9+p/5BHroxQSnJUYc67vBX8mZewQg==
X-Received: by 2002:adf:eccc:0:b0:341:d64e:4966 with SMTP id s12-20020adfeccc000000b00341d64e4966mr424121wro.61.1711560425465;
        Wed, 27 Mar 2024 10:27:05 -0700 (PDT)
Date: Wed, 27 Mar 2024 17:27:04 +0000
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
Subject: Re: [PATCH-for-9.0 v2 16/19] hw/xen/xen_pt: Add missing license
Message-ID: <71182998-214b-4e38-8420-79edb92ec09c@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-17-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-17-philmd@linaro.org>

On Tue, Nov 14, 2023 at 03:38:12PM +0100, Philippe Mathieu-Daudé wrote:
> Commit eaab4d60d3 ("Introduce Xen PCI Passthrough, qdevice")
> introduced both xen_pt.[ch], but only added the license to
> xen_pt.c. Use the same license for xen_pt.h.
> 
> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Fine by me. Looks like there was a license header before:
https://xenbits.xen.org/gitweb/?p=qemu-xen-unstable.git;a=blob;f=hw/pass-through.h;h=0b5822414e24d199a064abccc4d378dcaf569bd6;hb=HEAD
I don't know why I didn't copied it over here.

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

