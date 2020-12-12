Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927362D8705
	for <lists+xen-devel@lfdr.de>; Sat, 12 Dec 2020 15:01:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51179.90095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ko5SE-0002uW-BQ; Sat, 12 Dec 2020 14:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51179.90095; Sat, 12 Dec 2020 14:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ko5SE-0002u7-8I; Sat, 12 Dec 2020 14:00:58 +0000
Received: by outflank-mailman (input) for mailman id 51179;
 Sat, 12 Dec 2020 14:00:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=twOw=FQ=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1ko5SC-0002u2-4A
 for xen-devel@lists.xenproject.org; Sat, 12 Dec 2020 14:00:56 +0000
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fb17729-8f50-472c-bd9f-3f358ec2a00c;
 Sat, 12 Dec 2020 14:00:55 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id h16so12382703edt.7
 for <xen-devel@lists.xenproject.org>; Sat, 12 Dec 2020 06:00:54 -0800 (PST)
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
X-Inumbo-ID: 2fb17729-8f50-472c-bd9f-3f358ec2a00c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tzUsb1oAOgAwkhpFJliDtvmjm9NTDD2Shb+dSAyDTts=;
        b=n9AuUX2UaXmUg0AQdVSCooAu338lwKCj9TI2vXMFYlfT+MrTniTIB3Ov4IeJJ5EASR
         fbuhpAaxcZ3RGcMtOTpL0vuS7vQfIonVhunxKGjpdkHffC8pDVeLM+InDVDm6o6XpkbL
         P6mG/3LV2OG3XF25pE3QaRjGvYuLBCnnBACJy2Dm+Y04ZS8ugdVDQSP+lDYK/HgVSMgZ
         29A4LIoUdyE3oh2fqxw4yUP5njhz0KUSLA5tl6Um9hjkmo+W55NmseDlfeyJ7sFCzJt1
         CnKA/jTtQxx8LpkVLOx9uTfZIrZeUYOjPn0FxC1TP9zqMDzGn71l0mcZNCBuVxM6ZVxE
         Tk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tzUsb1oAOgAwkhpFJliDtvmjm9NTDD2Shb+dSAyDTts=;
        b=CVgijQYcVm2B710/mz9IMa+dgqbd8TXMjtrQahJzSZj/Lwv+tMy+IgB5xn6CsGYuzQ
         o/2Y3FIUSC1fLqwUu2R56KcV0Vyo34F5qW+ROevxnFgffSpoN2E5CdzFciFLpjfdBjOu
         JTt11XTBCJVSI2BqnQ8E1O2ziZfFCvjgbdrCEneTfzEtgA3aRAXe6qgste9hCMuHGyub
         b3fKMK5Crj52uH5yR/qToIqwpbX7r5kB0CNByZ5GHrvXSXzzmtL/a0cgYWFEzHK3KNO3
         2Qru1SrDqNkPa/Fpl5Oyr6K0Bj1fe78t7tV0TaaSoqcvoQAhHpVCT04omRqKSsTUOOIK
         llPQ==
X-Gm-Message-State: AOAM531al2L2Jqd9IVT1DPInztyj75aDjQggnANf8F1PjmtYfcPMs/vt
	h3hTXWpfd6wN+D8aymV/0WYF1WrcV5unwHS/YoNGJw==
X-Google-Smtp-Source: ABdhPJx7XdlDKAFWotIqaFdp3hZice5M/x2dBsqEs5YhnYm27HfNvYl5CAYYbew51YQQZuw/X321TEP+/lm/MX+yv4c=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr16509651edq.36.1607781654038;
 Sat, 12 Dec 2020 06:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com> <20201210134752.780923-12-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-12-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Dec 2020 14:00:42 +0000
Message-ID: <CAFEAcA_3eSKuAZj=pwV33csLdbVnsAhkm4ZNehinn7YYUkJ44A@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] compiler: remove GNUC check
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>, 
	Paul Durrant <paul@xen.org>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Dec 2020 at 13:50, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

