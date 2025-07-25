Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9964CB1202E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 16:34:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057987.1425678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJV7-0003hf-7N; Fri, 25 Jul 2025 14:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057987.1425678; Fri, 25 Jul 2025 14:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufJV7-0003fF-42; Fri, 25 Jul 2025 14:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1057987;
 Fri, 25 Jul 2025 14:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JNL5=2G=canonical.com=nick.rosbrook@srs-se1.protection.inumbo.net>)
 id 1ufJV5-0003f9-AA
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 14:34:19 +0000
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 709e6349-6964-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 16:34:17 +0200 (CEST)
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4B3223F46D
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 14:34:15 +0000 (UTC)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-5314bbc6fcbso578822e0c.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 07:34:15 -0700 (PDT)
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
X-Inumbo-ID: 709e6349-6964-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753454055;
	bh=wvQD11I8GsIspxU9qvyaFztMmJwBgId9s5E6dXdxVA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=WLm1zXFySgVKy2M7I/o+l6hVbPgvy6Q0ph5tffjOdC8vl/DWm13HyPxJ/STZ0Zl0R
	 dDLnzjFNpJLpi1YGaQeggdJGu4WBFyVuSACKrD3ax/f4NtfRJdqu20yznzqPmFN7Fo
	 ns5U5DUgid5YwcrixNlcg6bJL7103aJi9Ntgf33M5XVjDUgmoqRNZyW5Hpv24/9Jsb
	 KNsC3aLUvI/EL0r5ErWM/TDx3vez18QcU4hhkKCY50Jd1osDiiisGz0ua9+W3EHl9j
	 ueZPLeK+fkIj/BTzR1MU+N9HXty0Pvocc5uWXex6OacqjvCvVL4t6OmkP8RLEqYM0M
	 oEQuquECvLg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753454051; x=1754058851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvQD11I8GsIspxU9qvyaFztMmJwBgId9s5E6dXdxVA8=;
        b=Fya5gOM8cMirFl+6ndjw4DPVeAMtAcJ9LydFIFQgA40JDVTnr6RUkfagsPhEXBlSbt
         4fXoKobJlpOVZG1JmzPxFznbq5W/aKXdCxdP8hhmvKCG4sFe6sKypOw10iJRmeMLgqMr
         5uymrpXV5EPYhkV5YUOf6Bg7hRP4vjP/P0Qx4UZpxecinq98b/EC7YHltp4yfUr8KRID
         CSP//lymKzRfE17MF7polsTXTauLCLGDFYWRNumQfAbkjZBhGQTFMXc1XjLRjEp6rjlr
         e0fKDMAuDbBsyLw75l0urJxf7CTYCiz7iuGXhdYsfHdAZwAgS1gXXERpY83ahS1WD03d
         FLdQ==
X-Gm-Message-State: AOJu0YyB+5JWe5yoQnGq5hn9JgESZ/gIit2FpDKF+dkCRiHNaXfQzTZ1
	hOL8SjBo/o4ryMgku3Z/H6D8Rq2igvmD4EsmsqRLWRNyaU2Xy8EaOURqvdOf+QKuyZV5sW/+DSi
	e4FYYdbZuKfMA8t8kk5sT2YxDowgb9yYNTGCCSaQVEfS3wJFuNNl21WYpbOFbeYRrR8U6CD9TW8
	oZP/6bVDOBc7CCmmiKg3tcbnZsDXccTskIbomEpwgZ1RWYuZVZjLqvwGNF3YY=
X-Gm-Gg: ASbGncv3LZQNf/Bg3aEuGerQtzxVuZlH35oo5LK3UB2jS2+39ZhkHRpqJoZfUFyv/z2
	xLIdxUjSosTQ73Ywpon4dqLIiXAGVYmURANFduuho3SF7Zv7xJkT/kKaj12PjzYkweNydMWGNXx
	3dzacfu3XO620lSIh0VMw=
X-Received: by 2002:a05:6122:1d47:b0:529:f50:7904 with SMTP id 71dfb90a1353d-538db5b612cmr866667e0c.9.1753454050968;
        Fri, 25 Jul 2025 07:34:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkdIVG7fCHdCEeOBCP5Ii0tf+bF9RNuqgtgw32ZVEvTYmwfWyaYMEoNwjm9d06m5i6lZomfkuJH7LC9KwpagA=
X-Received: by 2002:a05:6122:1d47:b0:529:f50:7904 with SMTP id
 71dfb90a1353d-538db5b612cmr866565e0c.9.1753454050066; Fri, 25 Jul 2025
 07:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250725131928.19286-1-jgross@suse.com> <20250725131928.19286-8-jgross@suse.com>
In-Reply-To: <20250725131928.19286-8-jgross@suse.com>
From: Nick Rosbrook <nick.rosbrook@canonical.com>
Date: Fri, 25 Jul 2025 10:33:59 -0400
X-Gm-Features: Ac12FXwTy4KATpwpWaVj9FLGB8Q9Frq6wH9kcfyjpETdsbBBChF1T0JK48sAU0Y
Message-ID: <CAEN5XSFWiMxeSJsVUcS0dmm7jPyQktOcVr2DKK4F9FgK0M=fEg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] tools: allow to limit xenstore features via guest config
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
	Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>, 
	Jason Andryuk <jason.andryuk@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 9:20=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Add a guest config parameter "xenstore_feature_mask" allowing to limit
> the Xenstore features the guest can see and use. This can be needed in
> order to allow migrating a guest to a host running a Xenstore version
> providing less features than the source host.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> V2:
> - fix typo (Jason Andryuk)
> ---
>  docs/man/xl.cfg.5.pod.in             | 36 ++++++++++++++++++++++++++++
>  tools/golang/xenlight/helpers.gen.go |  2 ++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/include/libxl.h                |  6 +++++
>  tools/libs/light/libxl_dom.c         | 12 ++++++++++
>  tools/libs/light/libxl_types.idl     |  1 +
>  tools/xl/xl_parse.c                  |  3 +++
>  7 files changed, 61 insertions(+)
>

For tools/golang:

Acked-by: Nick Rosbrook <enr0n@ubuntu.com>

