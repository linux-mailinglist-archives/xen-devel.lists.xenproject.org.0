Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A36A95E4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 12:17:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505880.778864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3P7-00082W-JV; Fri, 03 Mar 2023 11:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505880.778864; Fri, 03 Mar 2023 11:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3P7-00080B-Gi; Fri, 03 Mar 2023 11:16:49 +0000
Received: by outflank-mailman (input) for mailman id 505880;
 Fri, 03 Mar 2023 11:16:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OdA=63=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pY3P5-000805-MY
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 11:16:47 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1c8184f-b9b4-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 12:16:46 +0100 (CET)
Received: by mail-pg1-x532.google.com with SMTP id 130so1246078pgg.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 03:16:46 -0800 (PST)
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
X-Inumbo-ID: e1c8184f-b9b4-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677842204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HpqkAhmyA0LdyZSyhNu9CgDOyvGP61IIvcQNWKvMTAY=;
        b=aPuwdCNtlGGPCx32OtbizzAVK4IYwHotCm8vUf8rH71gCgSTi1Zcq6Ws8tRaL1SKR2
         qHQx4dPQGal5Mp01cA6yIhckJT5y0sDY/56m8Lkyg/mZJMEvcnV988KI15KI5u6L+IRM
         h+iELKli65iCRvcgLCo/zay4wFtlM4nv5Jr+dKavsDrx73Cy/z5r5CszWSk7BN5jbqoe
         cV8M2NxSGEj949OnkHmqKa248lgc2klZK4amqtvMC0R95XHJEVU4zXax0Zjrm7Rio91E
         Uw1owcNYZT9V8Mn4FhEJHKN6dtpI1WDU3Go5X6Cqo5qi3WxQC0vRJPf39b08ndKFcJMI
         yXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677842204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpqkAhmyA0LdyZSyhNu9CgDOyvGP61IIvcQNWKvMTAY=;
        b=aYPeFv6uC6197ccub4cEFLGEFcV2+IfDNVAMd8CyKwSTRouU1ewY14S4GNrbLhANwy
         8pxWgwtbHeWz0fI/3HM6gjBcQzqfvMwpn6/KRWQQIuCGmU5ynUXQE4DU/r0CRFiXbPhh
         T7EVnYKkCj/Y9U4iGESabMdzO6RPNt38PTqcb8XMUcN1r+/LKg3ioRezyrp/HqW7/RFv
         LaAoIgy1Qsskg6mjVNJ5xWRq858Zsybhci8uqLmJwuEHn782M8pDx3hDRZWHvEK2T39a
         U4srJ745BzUJtS7txWOhjpqfJ2wT+3ZQ0Isy+0u7BE9A+XtxVRUaJc3ayoosLhh8X1dP
         tz7Q==
X-Gm-Message-State: AO0yUKXqhVLSxBppPojl758T7hVcUwJIog4YqfJNCmK9GJ2d0HvexlUV
	2fyQnGTe3SgvkdJMwtVSWno4M6aiQiOHNJorxjdKcg==
X-Google-Smtp-Source: AK7set9CNauIHkidY86e9p0+4D48SNNhrsSEwa5fbYw0YUBRN8Nx2srPULT6bjJ68MYMjGEsg/cbJriR7JHdxPs40sc=
X-Received: by 2002:a63:f705:0:b0:503:7cc9:3f8d with SMTP id
 x5-20020a63f705000000b005037cc93f8dmr378922pgh.9.1677842204397; Fri, 03 Mar
 2023 03:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20230302163106.465559-1-thuth@redhat.com> <20230302163106.465559-5-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-5-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 11:16:32 +0000
Message-ID: <CAFEAcA8JZqKnSN98PoO684zS1ZADj_KkaWO2QMk3w9uXk2cdMg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Daniel Berrange <berrange@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com, 
	Richard Henderson <richard.henderson@linaro.org>, xen-devel@lists.xenproject.org, 
	Reinoud Zandijk <reinoud@netbsd.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Mar 2023 at 16:31, Thomas Huth <thuth@redhat.com> wrote:
>
> qemu-system-aarch64 is a proper superset of qemu-system-arm,
> and the latter was mainly still required for 32-bit KVM support.
> But this 32-bit KVM arm support has been dropped in the Linux
> kernel a couple of years ago already, so we don't really need
> qemu-system-arm anymore, thus deprecated it now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index a30aa8dfdf..21ce70b5c9 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
>  on x86_64 hosts. Thus users are recommended to reconfigure their systems
>  to use the ``qemu-system-x86_64`` binary instead.
>
> +``qemu-system-arm`` binary (since 8.0)
> +''''''''''''''''''''''''''''''''''''''
> +
> +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``.

I think this is not quite true -- at the moment if you want
"every feature we implement, 32-bit" the only way to get
that is 'qemu-system-arm -cpu max'. The '-cpu max' on
qemu-system-aarch64 is 64-bit, and we don't implement for TCG
the "-cpu max,aarch64=off" syntax that we do for KVM that would
let the user say "no 64-bit support".

thanks
-- PMM

