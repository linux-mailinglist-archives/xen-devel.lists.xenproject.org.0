Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D176DFE11
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 20:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520333.807828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfcs-0005su-CR; Wed, 12 Apr 2023 18:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520333.807828; Wed, 12 Apr 2023 18:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfcs-0005rA-9Q; Wed, 12 Apr 2023 18:55:26 +0000
Received: by outflank-mailman (input) for mailman id 520333;
 Wed, 12 Apr 2023 18:55:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mKmc=AD=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pmfcr-0005r2-1b
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 18:55:25 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94c16079-d963-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 20:55:24 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-94a342ef3beso236757466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Apr 2023 11:55:24 -0700 (PDT)
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
X-Inumbo-ID: 94c16079-d963-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681325723; x=1683917723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4pWJbzUQpY8EmvUozfn2vkGqj1/INMaAK1x13wucOs=;
        b=toMZkIj6jmJNXgvJM2iCJhd+tD4KlpE79RuzB12bmf2Vf6UYUICXsSC75ScnWgNUlp
         tNF09+6k1wHrTegGkF+f3yr7jQ460DjY/5MoH1XJXhPYVXFBWkltlvFLbpRHOS3TyzEy
         qNV0aH3PtcM/Ao9OvaQ6Lgo5RbfjMqNgHeaqznU2zrfidOotrI8elhxFU891tmc2KMWm
         IbeT3qpoGz+4emMfmcmeYbAj4t+ZGsD76hNBskqsfWYLEaDfiMkLgGmwEd5OsO+TXFF+
         CIhidmHbcloULT6o0kItJmZYi1RglGW+MqFbeYMRkHQkYwjGDoJKusElTRbKQhNnEAZr
         tcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681325723; x=1683917723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4pWJbzUQpY8EmvUozfn2vkGqj1/INMaAK1x13wucOs=;
        b=GL6hqq4UzbbhwAvUdlXLKto0Wy/hAKVhUiV4lv4e7w1kPeuKk3mWsA3UY5JqquUFzD
         jBOkmJV50vgdGET050kfNRlvDBRSkApZBebh13U45dfGEkxubApiGHh+JPYQ1dVlI/Gd
         J/LVUtUhM5ktfofjivFW/ZvS841ZsW4aAcmpNAj/nga9qTFgOLRhoVgsvHBwTqMydckU
         R/lvrewev5d5FIH20ihT/LxOAlEnDkxAYl+FGRKW0KOgVtANWlpKKd41XshuEySp3pWJ
         IwgW6GN0Xh5rghxcWfRNmsZtELNp5ez/xJK3VZdGZF+aUtcpwbHRTiya/VMoyOYccxoM
         JaUA==
X-Gm-Message-State: AAQBX9dJ9oRx8hAkLHbNCkuDLJE+KgEm1oF0NvdFEqN2ar5B4vbyPyDZ
	GSeMqJairJj7tFYyb/+1yiCB+mmb7lFBDI7P/8/OXg==
X-Google-Smtp-Source: AKy350brHiGejy7/I5Am1Uiea2aUHJKtqkhZKfRHYEYkw1NA/RSGTtjpBQnE8UYQsaFjrtq6Yg3S62pCjzMkAKOp+BA=
X-Received: by 2002:a50:9f65:0:b0:505:521:7880 with SMTP id
 b92-20020a509f65000000b0050505217880mr1384308edf.6.1681325723523; Wed, 12 Apr
 2023 11:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230412185102.441523-1-dwmw2@infradead.org>
In-Reply-To: <20230412185102.441523-1-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 19:55:12 +0100
Message-ID: <CAFEAcA9G0KpkOivD8fBvEQwGcTsUQz53z5W53YcjcHmZGPHkmQ@mail.gmail.com>
Subject: Re: [PATCH for-8.0 0/5] Xen emulation build/Coverity fixes
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
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Apr 2023 at 19:52, David Woodhouse <dwmw2@infradead.org> wrote:
>
> Some Coverity fixes and minor cleanups. And most notably, dropping
> support for Xen libraries older than 4.7.1.
>
> I believe there are two issues that remain to be fixed. The x32 build
> fails, and I've seen patches which attempt to detect x32 and disable
> the Xen emulation. Along with assertions that we just shouldn't care.
> I don't have a strong opinion either way but it seems to be in hand.
>
> The other is the question of what Xen *actually* does if you try to
> unmap an IRQ_MSI_EMU PIRQ. I don't think Linux guests try that, and
> I'm fairly sure Windows doesn't even use MSI=E2=86=92PIRQ mappings in the
> first place, and I doubt any other guests care either. I'd like to
> establish the 'correct' behaviour and implement it, ideally before
> the 8.0 release, but it's going to take me a few days more.
>
> David Woodhouse (5):
>       hw/xen: Simplify emulated Xen platform init
>       hw/xen: Fix memory leak in libxenstore_open() for Xen
>       xen: Drop support for Xen versions below 4.7.1
>       hw/xen: Fix double-free in xen_console store_con_info()
>       hw/xen: Fix broken check for invalid state in xs_be_open()
>

This is highly unlikely to make 8.0 at this point, FYI.
If there's anything in this you think is super-critical we
might be able to sneak it in.

thanks
-- PMM

