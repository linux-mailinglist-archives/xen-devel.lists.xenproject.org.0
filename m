Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9766DFE2D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 20:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520337.807838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmffD-0006Tp-PM; Wed, 12 Apr 2023 18:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520337.807838; Wed, 12 Apr 2023 18:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmffD-0006RJ-MD; Wed, 12 Apr 2023 18:57:51 +0000
Received: by outflank-mailman (input) for mailman id 520337;
 Wed, 12 Apr 2023 18:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mKmc=AD=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pmffC-0006RB-6b
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 18:57:50 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eac0b8dd-d963-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 20:57:48 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94a34a0fc1dso297428266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Apr 2023 11:57:48 -0700 (PDT)
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
X-Inumbo-ID: eac0b8dd-d963-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681325868; x=1683917868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mwuMRWTckpmHAxe9wcRRZwJ9PRGYotK6uPdDjaX47Hw=;
        b=UFvkjSNf07xqd6h81iyqZZVbdIKwVidmZpnv982GZosyT3wl3xhCoALO9/LDw45xnq
         0vzZ7KxG3EtKzQgOX3qdBV0FRh+Qoxi+WvK2hFMxIdDaAszhRqaKgcSYYnL50ZjlSM4n
         gQQkYf0xVtuA+P5lWQTrymgcX2CxMzrqm75TY/dEFCchTk8RsyB5djPO2M0olMCkXTtu
         NRu5ImExgJ6ZVZi0c5PAOCgjTSJxejwJHKI4ekw4imu8ReQYQfpmqNjfAGEzQNxewuyQ
         meemcXyNP1InerS5KRghmuEGZE0+/ABLAQA1gcBDnrDwER+q2cZ1eO0IlLQwb1yRLqHC
         PFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681325868; x=1683917868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwuMRWTckpmHAxe9wcRRZwJ9PRGYotK6uPdDjaX47Hw=;
        b=IDvjXLvadYmfSXRr8nFusoYhido4OKwQ5z3s6MSO3Wy2ouPoymhIkTYJ1wTDDHpLzP
         Mokc4Pszn9ep3AJb51bTXV0PZf8pjx+U6FEr6z8DyRiUMGjYQzun/4x5MmtUIkDO/lVi
         K4UUt0TesgqyAVZOzM28gnJ9SvI8kamtXAxMrjXKx2ZPoTVMsyLB1uBFGUa9j4bmtLGD
         Z3sshSeSDHfAsZhxnizAYlxrFIKr2Piu3OP3WbuhhkkRwLlUEvqVbSiyZ1y2TFlhmoHt
         BFY6Tqz/75CVWJsH6ivIZssxN2+wKhX5W7Dvf+Slfy5ZmoE+v9/bI0vZcKKT+nt4f6uu
         y4CQ==
X-Gm-Message-State: AAQBX9d4JWqonS2y10Cj6nAlaPP/0bvzryQNNUlZhpzrG58VSZeEeIG2
	Z76bkeaDCtnDxT4dspULVis7zxGO5MsTzgwAoGn8sw==
X-Google-Smtp-Source: AKy350b4Tq5Y77eGxUkuJXiU9YL7lKJFcM6uLvpeqBXHaxWzpKfedPmHYoMDes2bLhYp48y7W4tZfu4nqa5bO2ofXBQ=
X-Received: by 2002:a50:d71e:0:b0:504:9c1f:1c65 with SMTP id
 t30-20020a50d71e000000b005049c1f1c65mr6052761edi.6.1681325867781; Wed, 12 Apr
 2023 11:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230412185102.441523-1-dwmw2@infradead.org> <20230412185102.441523-6-dwmw2@infradead.org>
In-Reply-To: <20230412185102.441523-6-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 19:57:37 +0100
Message-ID: <CAFEAcA9staAPX2buXO0MWj2yzVU1n22xLx-PEvOa5Aa2xC4YWw@mail.gmail.com>
Subject: Re: [PATCH 5/5] hw/xen: Fix broken check for invalid state in xs_be_open()
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, no Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Apr 2023 at 19:52, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Coverity points out that if (!s && !s->impl) isn't really what we intended
> to do here. CID 1508131.
>
> Fixes: 032475127225 ("hw/xen: Add emulated implementation of XenStore operations")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

