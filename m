Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D632F79E406
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 11:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601136.937046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMQR-0006tz-0x; Wed, 13 Sep 2023 09:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601136.937046; Wed, 13 Sep 2023 09:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMQQ-0006r4-UY; Wed, 13 Sep 2023 09:44:46 +0000
Received: by outflank-mailman (input) for mailman id 601136;
 Wed, 13 Sep 2023 09:44:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjWf=E5=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qgMQQ-0006mG-AE
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 09:44:46 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b6ee277-521a-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 11:44:44 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ff8f2630e3so11326847e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 02:44:44 -0700 (PDT)
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
X-Inumbo-ID: 2b6ee277-521a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694598284; x=1695203084; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wgM/mjSUV3pDjlWeWJZ3kIQ9I4q2NLESCJ71jwDgVk=;
        b=ObXTc5wy4Yg8AED2r/79Bpy9m8grT9p3+kE2UiEdHhEkuWMHuyH8IJ8V12ZfRNN8GQ
         OGFImEEnRN+CZ1NdALqqNE8BwJZEHmdnZuQsKrfgtlRkKp8dZ16HNtoN0BQLFdhOaCrt
         2pGtNccBV+iKM+puiXHnVDBViAH83cjaCDgZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694598284; x=1695203084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wgM/mjSUV3pDjlWeWJZ3kIQ9I4q2NLESCJ71jwDgVk=;
        b=N2Yja4pi3BwW83uvHLjA/PtxqNixT+vH5k/rUPpozx3PiI/iFachFi97mA7oDOmP1G
         FWVbmaBXAuwmqkORuQW1QrfVE1xQ0ONfAJqfrPCGObT2bsW+6q1qup3mYsXEOT3V/kw+
         /yO9+jrN/5BnF+y44CWhzc5zXuRhQ/gK1idDGBMiVdj8GgIh+c4Ep+XjOHcftpdfV2g6
         NFHLzgjrscIGQuJjQF+Ixel/ipqXq7LmRAj5zWrZb4/aEpwapjRloiJLTL6BKK0wUCAe
         wS6VKGaDE0i9kqA6z8/fdx3n0NGwo2gkBdZw2srKj9IMBOmOLxJcONbkxSbwmXaPIXLD
         M/Yg==
X-Gm-Message-State: AOJu0YyIx4w1kuRHQRJ16C8Ep7c3znZSr+qIMFhG2mHThXjYUaCpi72D
	dLWD5wpWhGqIX/zhsBDxrBvO6gYWp4vbaa5ZzJepBQ==
X-Google-Smtp-Source: AGHT+IEe1uodH+3IyQtr92Z1k22THrOk5yUMvsqZ+SRyioLWNXxyQs1M3vDNxAp70KwMocTBSQOTzUNoW7aFaa6tu6Q=
X-Received: by 2002:a2e:9c4a:0:b0:2bc:bb01:bfe6 with SMTP id
 t10-20020a2e9c4a000000b002bcbb01bfe6mr1914692ljj.21.1694598284125; Wed, 13
 Sep 2023 02:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <a17ba988-2850-fced-d225-97e1d11f6576@suse.com>
In-Reply-To: <a17ba988-2850-fced-d225-97e1d11f6576@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 13 Sep 2023 10:44:33 +0100
Message-ID: <CA+zSX=aCwR5gxk3jyPDoWRvoFAAjORWigtrbaO9ow5EvmT_tZg@mail.gmail.com>
Subject: Re: [PATCH] timer: fix NR_CPUS=1 build with gcc13
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 8:32=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Gcc13 apparently infers from "if ( old_cpu < new_cpu )" that "new_cpu"
> is >=3D 1, and then (on x86) complains about "per_cpu(timers, new_cpu)"
> exceeding __per_cpu_offset[]'s bounds (being an array of 1 in such a
> configuration). Make the code conditional upon there being at least 2
> CPUs configured (otherwise there simply is nothing to migrate [to]).

Hmm, without digging into it, migrate_timer() doesn't seem like very
robust code: It doesn't check to make sure that new_cpu is valid, nor
does it give the option of returning an error if anything fails.
Making migrate_timer() just do nothing on 1-cpu systems seems will
remove the warning, but not really make things safer.

Is this a super hot path?  Would it make more sense to add `||
(new_cpu > CONFIG_NR_CPUS)` to the early-return  conditional at the
top of the first `for (; ; )` loop?

I guess if we don't expect it ever to be called, it might be better to
get rid of the code entirely; but maybe in that case we should add
something like the following?

```
#else
    WARN_ONCE("migrate_timer: Request to move to %u on a single-core
system!", new_cpu);
    ASSERT_UNREACHABLE();
#endif
```

Thoughts?

 -George

