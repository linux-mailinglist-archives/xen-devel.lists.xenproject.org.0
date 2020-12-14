Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38E62D9638
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 11:20:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52096.91153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kokxz-0002qL-Ve; Mon, 14 Dec 2020 10:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52096.91153; Mon, 14 Dec 2020 10:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kokxz-0002pw-SE; Mon, 14 Dec 2020 10:20:31 +0000
Received: by outflank-mailman (input) for mailman id 52096;
 Mon, 14 Dec 2020 10:20:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cKns=FS=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kokxx-0002po-Hf
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 10:20:29 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1f0ca9d2-b0e9-4233-9ccd-2f953a2c85c6;
 Mon, 14 Dec 2020 10:20:28 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-8QHRx1grOmGir5UfEw_xSg-1; Mon, 14 Dec 2020 05:20:26 -0500
Received: by mail-wm1-f72.google.com with SMTP id g198so3243840wme.7
 for <xen-devel@lists.xenproject.org>; Mon, 14 Dec 2020 02:20:26 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id r2sm31320917wrn.83.2020.12.14.02.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 02:20:24 -0800 (PST)
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
X-Inumbo-ID: 1f0ca9d2-b0e9-4233-9ccd-2f953a2c85c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607941228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKJuWEjZ7HEqn+md8jv6dUOfhVZW6quQNiqaNPkOsHc=;
	b=T5PxpI14sCZ1XsiI3RPPOiiU3L9q5vn69dpEIkHiuS0X/jHDrNKwJnbpyCWbN+Au/8LesD
	pTBGQZj9fQ3acRrH4cDXrXOOQB0LWEHqf70y18LsyorLShTawKywkFK7FUAQZ/uO7Fnh3v
	87XUbPaakiZyITQZ0vkKMuvC8yta5E0=
X-MC-Unique: 8QHRx1grOmGir5UfEw_xSg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VKJuWEjZ7HEqn+md8jv6dUOfhVZW6quQNiqaNPkOsHc=;
        b=q4spFrjo2UEmVMdM0Ygyjjd6ZrwN/G+kylKwWHUpVsJ30mISIVMqtqJblkRBNkMizd
         PrcqrXnUelLNNsT4eSSEUY4Ch2rMg88iVXHi2CHKCkg4YzAtvrw3507U1GwQaNB11ga7
         eeMRnxOiycHTBMLVLBd9Kk18+9ZGs89Jtwyu5PCIYB13w69J12Z5gW4fP+z9NP0MIww9
         UmHDQG+JMEIjJWnGtfPRaL//b9UMwUEMn6ZiuWm6fh/W0BssAbbK85EGTX0STQL05Pmw
         o/yXT6EOZc0zsxOKk9Tg5D0gn1ZR1Bet8drXWrFXhw6fXUWRvYb3oeqwLHyZyIFPIz2D
         5REQ==
X-Gm-Message-State: AOAM530fZqkWzMyij7CkBvSBGv6b7fRYT7Mc2pOEON7z/msZ598TLRJm
	LnG9OklAvPy4Gc1fEC/LqIUBMRD8r4/agIrKx1fvF6/rZycjG8Ze8W1HXCnDTbF74jHXu8KzQfl
	8n4gaMQo76Chf5WRW2AyguecUuuQ=
X-Received: by 2002:a1c:f017:: with SMTP id a23mr26187757wmb.56.1607941225266;
        Mon, 14 Dec 2020 02:20:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzf3/oGm0fU19mZH+puOGsoNRp7IG0cdANi1T7twa2ceqU7+cBZmSBiH5yH7AKXpx6CW0C0kg==
X-Received: by 2002:a1c:f017:: with SMTP id a23mr26187738wmb.56.1607941225059;
        Mon, 14 Dec 2020 02:20:25 -0800 (PST)
Subject: Re: [PATCH v3 00/13] Remove GCC < 4.8 checks
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 philmd@redhat.com
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9df914a2-cf0a-6cf5-76ee-502a75873825@redhat.com>
Date: Mon, 14 Dec 2020 11:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/12/20 14:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> Since commit efc6c07 ("configure: Add a test for the minimum compiler version"),
> QEMU explicitely depends on GCC >= 4.8.
> 
> v3:
>   - drop first patch replacing QEMU_GNUC_PREREQ with G_GNUC_CHECK_VERSION
>   - add last patch to remove QEMU_GNUC_PREREQ
>   - tweak commit messages to replace clang 3.8 with clang 3.4
>   - fix some extra coding style
>   - collect r-b/a-b tags
> 
> v2:
>   - include reviewed Philippe earlier series
>   - drop problematic patch to replace GCC_FMT_ATTR, but tweak the check to be clang
>   - replace QEMU_GNUC_PREREQ with G_GNUC_CHECK_VERSION
>   - split changes
>   - add patches to drop __GNUC__ checks (clang advertizes itself as 4.2.1, unless
>     -fgnuc-version=0)
> 
> Marc-André Lureau (11):
>    compiler.h: remove GCC < 3 __builtin_expect fallback
>    qemu-plugin.h: remove GCC < 4
>    tests: remove GCC < 4 fallbacks
>    virtiofsd: replace _Static_assert with QEMU_BUILD_BUG_ON
>    compiler.h: explicit case for Clang printf attribute
>    audio: remove GNUC & MSVC check
>    poison: remove GNUC check
>    xen: remove GNUC check
>    compiler: remove GNUC check
>    linux-user: remove GNUC check
>    compiler.h: remove QEMU_GNUC_PREREQ
> 
> Philippe Mathieu-Daudé (2):
>    qemu/atomic: Drop special case for unsupported compiler
>    accel/tcg: Remove special case for GCC < 4.6
> 
>   include/exec/poison.h              |  2 --
>   include/hw/xen/interface/io/ring.h |  9 ------
>   include/qemu/atomic.h              | 17 -----------
>   include/qemu/compiler.h            | 45 ++++++++----------------------
>   include/qemu/qemu-plugin.h         |  9 ++----
>   scripts/cocci-macro-file.h         |  1 -
>   tools/virtiofsd/fuse_common.h      | 11 +-------
>   accel/tcg/cpu-exec.c               |  2 +-
>   audio/audio.c                      |  8 +-----
>   linux-user/strace.c                |  4 ---
>   tests/tcg/arm/fcvt.c               |  8 ++----
>   11 files changed, 20 insertions(+), 96 deletions(-)
> 

Queued, thanks.

Paolo


