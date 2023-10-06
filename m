Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449717BB8DE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 15:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613618.954257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokgM-0003tx-DT; Fri, 06 Oct 2023 13:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613618.954257; Fri, 06 Oct 2023 13:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokgM-0003pl-AV; Fri, 06 Oct 2023 13:15:54 +0000
Received: by outflank-mailman (input) for mailman id 613618;
 Fri, 06 Oct 2023 13:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kIW7=FU=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1qokgL-0003pf-CR
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 13:15:53 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7815190b-644a-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 15:15:50 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-405505b07dfso19698035e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Oct 2023 06:15:50 -0700 (PDT)
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
X-Inumbo-ID: 7815190b-644a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696598149; x=1697202949; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6u3No+tEtAczGHwk0FS59fcQbsVL06vZXyJIYRaE8Tk=;
        b=Ka3dAip90Ytl6nG3QvSbDlKqYF6Ycw2mACB9kEwr0PhR3Fh4+lqpr9x6Er+jP0uIUR
         oYQ0+PW1luu8s4IZ2un2D3asksJMIKLqHHELZqU0f/vnV3/3u8qeQwr2u6pS3iFKHjIi
         KNkkGUO8+3cvzzPnuP+de3pm8fzfH5vzg6G5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696598149; x=1697202949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6u3No+tEtAczGHwk0FS59fcQbsVL06vZXyJIYRaE8Tk=;
        b=l2pPGCoakxVZuBExjGC0g/TZHcGhOZj5VuebQkv5L01efFX4wN0weMe8JT2+tOySG6
         17uiTh32lacufgpuZutxW6e/HpX7xMKLkkGm+E9ZgKL/Q09U+rZRaC1eViaD7J3N/EZB
         elFfHhTSskNW345OmDFTRsHQxDA0Ml1Aai7BPlDYU0BTBbJE+/U8ugxnnsh3YkXwBEwx
         V1vZZamcfJAk6xUF9iML8I1JYCfAwulErCGV1hM2txoDH9OQRerEI6IuRauBESlBa2UJ
         vbcH05eCkjeLsyYjQx/5I7avJtDwoRggmXZL5R55Prf/Tnc8ItkwxO164NMoLC2qGz0o
         V3lQ==
X-Gm-Message-State: AOJu0YzVxS97FeD914Pcqv2lqBxFMSOdjwGPtfK/SrpnDTuclMj3N7Hc
	qElrm9CHhZ/o1Sfe54DRu9F2yzcySbbxSgDpjMXy
X-Google-Smtp-Source: AGHT+IEhVvOcQOtLTbsHnMfSpeq7GltoUpxG99Rgayd8nZ8RlSHyh7d1e0syV2RPhnErDHz48fOjez/pJ/HH9GmkPGM=
X-Received: by 2002:a05:600c:3795:b0:401:b92f:eec5 with SMTP id
 o21-20020a05600c379500b00401b92feec5mr4056905wmr.9.1696598149645; Fri, 06 Oct
 2023 06:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231005140831.89117-1-roger.pau@citrix.com>
In-Reply-To: <20231005140831.89117-1-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 6 Oct 2023 14:15:38 +0100
Message-ID: <CAG7k0Er8cVKHF2NwogmXtuN57iYb0rGoQH4aZgg7boy2Hv4-fw@mail.gmail.com>
Subject: Re: [PATCH] xen-netback: use default TX queue size for vifs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>, 
	Paul Durrant <paul@xen.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ian Campbell <Ian.Campbell@citrix.com>, Ben Hutchings <bhutchings@solarflare.com>, 
	xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 3:08=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.co=
m> wrote:
>
> Do not set netback interfaces (vifs) default TX queue size to the ring si=
ze.
> The TX queue size is not related to the ring size, and using the ring siz=
e (32)
> as the queue size can lead to packet drops.  Note the TX side of the vif
> interface in the netback domain is the one receiving packets to be inject=
ed
> to the guest.
>
> Do not explicitly set the TX queue length to any value when creating the
> interface, and instead use the system default.  Note that the queue lengt=
h can
> also be adjusted at runtime.
>
> Fixes: f942dc2552b8 ('xen network backend driver')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

