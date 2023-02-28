Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B42286A54FC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 10:00:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503137.775296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvq3-0003KS-1v; Tue, 28 Feb 2023 08:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503137.775296; Tue, 28 Feb 2023 08:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvq2-0003Hp-V7; Tue, 28 Feb 2023 08:59:58 +0000
Received: by outflank-mailman (input) for mailman id 503137;
 Tue, 28 Feb 2023 08:59:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bF4M=6Y=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pWvq1-0003Hh-Gb
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 08:59:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 444c6785-b746-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 09:59:55 +0100 (CET)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-JdkdCTXaPuyBe5pGTO3r-A-1; Tue, 28 Feb 2023 03:59:50 -0500
Received: by mail-ed1-f71.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so12665203edc.9
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 00:59:50 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 ha14-20020a170906a88e00b008c405ebc32esm4229508ejb.28.2023.02.28.00.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:59:48 -0800 (PST)
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
X-Inumbo-ID: 444c6785-b746-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677574793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gh14Q5XVK57GCqNInt9dvGWviONbEUABlkLCEvFo+1A=;
	b=AaVUWEiihEs1K2QiNVXGFjjsoiK+3Tm6kFC7fiZ3f1lNi1RQ4CUlkEQpRif//e6/AC+KjP
	3K00v5ewZzibU0pRoaRCPfWWQkQtiUQ1Fsb8unpJD2H1EMzuuy/oKLiKiKz7POW8CsasVc
	xT4PxaVNmtxmFC6qv9Z3uWC4B6DdYww=
X-MC-Unique: JdkdCTXaPuyBe5pGTO3r-A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677574789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gh14Q5XVK57GCqNInt9dvGWviONbEUABlkLCEvFo+1A=;
        b=mL0GxDhTICz/XaWs+SS21LXSHHRPVWNn3cXqGZeuf0ECZWBVpq4Ap/n/HtgwN3v6Vo
         Ol7A8TAhtAEDdvmpw2z76ua44TPSnobDT3BMADycBM4LlccD2upvtn34HGMm8n1E0TPM
         HnBcHw8LVnJdnbQdf0p6+ZZ1i9xe9GKTnPB9YbdvCC843WSy9JaG/luxNHEm3o8rpWOt
         Sn05s0TXdqfENNZEZbquV+qub7f4dvvj3yTAYgMD5jJR4qrdhtVpQM4mnFkMeJ2QVChK
         Eiic7gK+jSeUrEWBEQX6Y15qjZjKv2C7SgkDvTL2tJNGyPi0o8Q+DqHGP0m07oAjU/cd
         TrxQ==
X-Gm-Message-State: AO0yUKXihplNSxrJrH1+iO/6tvP327LFmNmVzzT7tzKkEkoJ+dqdjWaS
	UqzxX5Fs71+oJM+XPgcP5QlcH3xR9oxoDGAYrDIavZWBVod58jsS8MbN+BgQsDowWu9egyiVJ6z
	AXEyB99gPHwujw5Cwh/oxfStI7Ds=
X-Received: by 2002:a17:906:264d:b0:8b1:79d0:bc58 with SMTP id i13-20020a170906264d00b008b179d0bc58mr1697110ejc.16.1677574789519;
        Tue, 28 Feb 2023 00:59:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+fUW5AwCYmimNt17fLi6VkNVMvM8T0LSvQi1PwptV14D5OBhXq8nQB0YakRdPxskPQaBqfcQ==
X-Received: by 2002:a17:906:264d:b0:8b1:79d0:bc58 with SMTP id i13-20020a170906264d00b008b179d0bc58mr1697089ejc.16.1677574789259;
        Tue, 28 Feb 2023 00:59:49 -0800 (PST)
Date: Tue, 28 Feb 2023 03:59:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com, xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228035917-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
MIME-Version: 1.0
In-Reply-To: <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 27, 2023 at 10:21:14AM -1000, Richard Henderson wrote:
> On 2/27/23 10:12, Michael S. Tsirkin wrote:
> > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > I feel like we should have separate deprecation entries for the
> > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > although they're related they are independant features with
> > > differing impact. eg removing qemu-system-i386 affects all
> > > host architectures, not merely 32-bit x86 host, so I think we
> > > can explain the impact more clearly if we separate them.
> > 
> > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > a superset.
> > 
> > Removing support for building on 32 bit systems seems like a pity - it's
> > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > and the maintainance overhead is quite small.
> 
> It's not that small.  It only works for single-threaded system mode.  It
> silently does not honor atomicity for user-only mode, which is perhaps worse
> not working at all.

We should probably block multi-threading on 32 bit then.

-- 
MST


