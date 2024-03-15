Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A6987CB18
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 11:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693726.1082159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl4RF-0007Hr-VO; Fri, 15 Mar 2024 10:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693726.1082159; Fri, 15 Mar 2024 10:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl4RF-0007Ff-S6; Fri, 15 Mar 2024 10:05:21 +0000
Received: by outflank-mailman (input) for mailman id 693726;
 Fri, 15 Mar 2024 10:05:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3A35=KV=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rl4RD-0007FY-Oy
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:05:19 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85f2a0c9-e2b3-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 11:05:17 +0100 (CET)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3c21ecc072cso860453b6e.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:05:17 -0700 (PDT)
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
X-Inumbo-ID: 85f2a0c9-e2b3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710497116; x=1711101916; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/3uSXayn9fsf2sZSvts+4sNQNELRmTpXC22EUK66Es=;
        b=IQj6xbeVNq8Wyjis/cN8jNDZYcjigNd/3+Xj3C7BB5C857K0CqLtDbxa2n8l/XrM0R
         mZA00+Jiv9FfxZO4p8bO/X7Rt43cKTbZoiGQxNPn11Lm8TNu+//IE9gEA9llh1QVJMiP
         f+chzrsNfl/DHrw6wGnvdlIm2kxW8FbuUb+I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710497116; x=1711101916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/3uSXayn9fsf2sZSvts+4sNQNELRmTpXC22EUK66Es=;
        b=JmNW0oKoCFibWj9N2V7QN6f6TefQsmY3EKuQZsIxZnleuELrifYgy7pvdEV0JaZbky
         X0H3uRbZM1zwlPjRXCW0oSVKQj6nC4+gnrAv5nCjXTwHVwu35/CcoIhPxYXIOcfcUNys
         DnpFZe111WCBF8NwiyIs5Lm6ez43NJgV9iCdO7PEFopknsfOmj/fobmNIEVpPajhpnEp
         nD0nQ7bQkLdfn9alQPmh2RYbDR2sU9aYDV7JDOg3d7obZRFf1qcfx4BUWEQebu4g/A4C
         sXCs/nlkLRWvbmVKAXus958JSFNq/1LFTpZuykeBOHra7FrBfywNA63QLMux76vlEok5
         Sb6Q==
X-Gm-Message-State: AOJu0YwgXMizRvtzoDh9CqJWIe03DSMEup9cPqwZ0vvA43bczMhzq7do
	wVgfCXP5TBOcMeLKnasKaQ9ZombTciw4a/KrQAlBCPT6aPZ14X0p+euvylywMR8XzUa8KT+6jnN
	qYwxNWfvymGdFyLqlovmH6wahCWoPiMWEDOhMhQ==
X-Google-Smtp-Source: AGHT+IHCdpS5avOL8rIDJIa1dcYa/tnydUQmdKQGQHINKQ05DDwFekmNEm7nr9L9+CWl0EpgCPXBqAYbz16You6aiA4=
X-Received: by 2002:a05:6871:7995:b0:21e:698f:5c87 with SMTP id
 pb21-20020a056871799500b0021e698f5c87mr4326791oac.50.1710497116421; Fri, 15
 Mar 2024 03:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240314173929.12040-1-julien@xen.org>
In-Reply-To: <20240314173929.12040-1-julien@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 15 Mar 2024 10:05:05 +0000
Message-ID: <CA+zSX=aBxfnm7fjrVf+0_oQn32MsEkZbWQ4MC+UDxSePea+NoQ@mail.gmail.com>
Subject: Re: [PATCH] SUPPORT.MD: Fix matrix generation after 43c416d0d819 and 77c39a53cf5b
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
	ayan.kumar.halder@amd.com, Julien Grall <jgrall@amazon.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 5:39=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> From: Julien Grall <jgrall@amazon.com>
>
> The script docs/support-matrix-generate throw the following error on the
> latest staging.

I wonder if it would be worth adding a follow-up patch to run that
script, maybe only when debug=3Dy, so it catches errors in development.

 -George

