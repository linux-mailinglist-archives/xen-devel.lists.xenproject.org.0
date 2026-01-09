Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C3FD0A5AF
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 14:19:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198786.1515616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCOJ-00083h-PV; Fri, 09 Jan 2026 13:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198786.1515616; Fri, 09 Jan 2026 13:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCOJ-00081g-MO; Fri, 09 Jan 2026 13:18:59 +0000
Received: by outflank-mailman (input) for mailman id 1198786;
 Fri, 09 Jan 2026 13:18:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DueL=7O=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1veCOI-000818-O5
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 13:18:58 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c03da016-ed5d-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 14:18:57 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-34b3f61fd0cso362338a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 05:18:57 -0800 (PST)
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
X-Inumbo-ID: c03da016-ed5d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767964735; x=1768569535; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6t/Cifft840y39/XW/BuBtpWahZrOOLTBzsSlfmHR0A=;
        b=VGiHgJbXauEiZpRQO6gVCCPNhvcvuXMUI/7wIi6i9soRcdJWYlfDbNtiL3F3dPNK3j
         4CUgFVyTz9RTSVBQgLO5qYRyi7lnDiJ0M8OlaIUFocSrdDEcdnhMTZbVeSQg0N8/WpvY
         YrXsJw8qShx2y9e/gmCpe+Z6qEKZeosxXXWNAy13VEzgO6DFJqabRsI1bCnAnv3AO5Uu
         aeQeitnbNB18OhCs0aXF6REXSnbnXi6dUeFTMyIbwUN3+VYSktFnk9sXlX/OFjXvRo2t
         3hUmZtN9d+WyQkCayyHGfkDi4dSJNuZEQWiwBzr5eBI5yMpEddXSc/es0nn6E/qCGAOk
         K4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767964735; x=1768569535;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6t/Cifft840y39/XW/BuBtpWahZrOOLTBzsSlfmHR0A=;
        b=YXKhowGpA5RDwLEmLEUURNjtUmNSGC77i1asQ+Zsjx0NgbkCBD+H2rNuQLyfPhLCFR
         OxcgNBoPsipIV/1SzH4sWzlrohblKL4764igafVaGtLdNFO9z1uvCjOh+41FGfl6I+Oz
         klZgHoXc2t0gNQJ4DgaNAVfKyPKC6IwNLOzjW7woMG7k0+PY+BNX26eNT+LN3Uwm5BOs
         Sm1w5VxTfVypVoIfZeR023YvMnKYenvGvJYMSeF0MrqoumHjhv+re/EL492+aECT0Wck
         gu900VqE7Q4PnEKDIEWAHx1TgtgNKI7WG0N6hiTL3VtAID9oD3vL94DT/Zbgl5+jldtN
         3qKA==
X-Gm-Message-State: AOJu0YxFtbx2W5ccKtBd4mArMKaw5ZcqSdZ+I6Hb7wryEURJQ4ZC5aHB
	xVqrFIP7+5Fq2Wm/L4LdAsiPkXbaKgpvQQTZzvNLYbnOabEQiIclnbfguqwaiWGee2YbewTVIAl
	Pm8L/OT8pG6fQJUx6DY1bvw3QXDb3l7C29lv2
X-Gm-Gg: AY/fxX6wa9VjXhZZyDQ94Z3tKrXpYIacwH2w8IGl8kx7bb5MGdc5xTeEbR0oTysOeiA
	N2x76PnI+5mOwPBEF9oHaXf9CChb/MqZnMFUfNKYfKeTvYdjL+8zglq8X+Dp+DowiAr7HF6ftdz
	Z2FsfZWS2sA7XR38R7h9k/ZY3tqfY7FS3lWkYizHcZxgdo3i6XAefi2ZF1P9UObCIq3t3z2f/5z
	9OOx5dsRq/u73vu74G932606XCIHozTsmqyVfALruCI+Jnt2fQ16HiMghuxjyLShQjvOw==
X-Google-Smtp-Source: AGHT+IFeG+dsvCu7XX24D82/I7/EiIOCEOo/OauQX6CsH8jNzGC0MTpI75x6b5PbqfAp145zFtliFDV3te4TvZTWQGs=
X-Received: by 2002:a17:90b:57c4:b0:340:e0f3:8212 with SMTP id
 98e67ed59e1d1-34f68c37a6cmr7136299a91.8.1767964735277; Fri, 09 Jan 2026
 05:18:55 -0800 (PST)
MIME-Version: 1.0
References: <CAKBKdXiuu7Hg8h444XR2WfAAvDj=j+x1V5HPs=FpHaZ6jBJM9g@mail.gmail.com>
In-Reply-To: <CAKBKdXiuu7Hg8h444XR2WfAAvDj=j+x1V5HPs=FpHaZ6jBJM9g@mail.gmail.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Fri, 9 Jan 2026 21:18:44 +0800
X-Gm-Features: AQt7F2rk9apY19ZvSxCEjWj15kV9F4fFjn1GJzm8i4_AvOyIdPbyfmr261u9LaE
Message-ID: <CAKBKdXjHVtRCgVQmVC1jea+KVc8LN8FOZpoA4zJTAfbdU_1pdA@mail.gmail.com>
Subject: Re: Resuming with superpages broke VMI/altp2m workflow
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

I forgot to point out that when booting with "hap_1gb=0 hap_2mb=0" the
issue disappears with RELEASE-4.21.0 and my VMI tool is working fine.

P.

