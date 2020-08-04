Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679BD23B603
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 09:49:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2rh9-0000k0-HX; Tue, 04 Aug 2020 07:49:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUrY=BO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k2rh8-0000jt-14
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 07:49:10 +0000
X-Inumbo-ID: fa5017a2-d626-11ea-9134-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa5017a2-d626-11ea-9134-bc764e2007e4;
 Tue, 04 Aug 2020 07:49:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a15so36421158wrh.10
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 00:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=YqRYaJb9Wy0HCA8xWccMhgRMKlPD8YVuiEuu/3WoXgs=;
 b=s0zQR/ioyw7NHKZhJ2YLIuq4vpAdzCgV/U5n/lDMOby0QfJmaM2YfI12Ljc5qntAxc
 WCzk5Au34L5uzyWa2ErWenRp2pnRGi0KQaAQ+1z/2SfVq4kGo3e/cbg/fDZFS9QlYJVD
 jN+icfR9MumsmkfYdSzuoFwlyfFum1oyKFQTUnnei1JN4my9k6adyUTwntznI6a/+yf3
 xS7M6KvWp8YC+2+BieJpmxWt2fIZ4NBSKswJnuIqrwuxmFktQQthbAIu/Mo2lblk2TtH
 UdyKX/ConTg9MjBBV/F+0LRU83Z+tKJRXFHOqnKHBi6Z/K3jM8hLgchtsc3QOhiAKv5+
 h0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=YqRYaJb9Wy0HCA8xWccMhgRMKlPD8YVuiEuu/3WoXgs=;
 b=V0uoYt4Oi5Jc32lXetebX2xRyHODOs+9GSVnou8HsnCTF4nUGQ8i8ziZrWDbCMpQgo
 hivniJ849NAYpdnSftNO3CqpQxPgVuM3I2FPMI2rlolJkDGaJDQWhCAl9A2lwTGSgTCX
 dUWvQMGLoG3VHGt4SY2F56iEpM/d9ibU42EaAELyDXz/lEM9BA2dsY8FsOvfkJKHfEaB
 MJP9/MAvMr+huQSosTA3KeIm3CWGAH+ElBI11K2WzT0QCWdDDwGN7gfwiQlr2zV30wVI
 OyzbnTEc7GcdH3MMKljyDg0yUKnyKAQ4n1V1W/lgTZWzSK1+3P7WyNVTKUgRxaHpQVFH
 CdzA==
X-Gm-Message-State: AOAM530A9l6NK9NKObTK3GX6BCkH6zy9NPNUat/7hFQO8FLyR/cbMwKd
 Mqz1qj0iHJlnNzoi3rK4oy8=
X-Google-Smtp-Source: ABdhPJzOKccdVqUf09R6wonOyqQnsdTBxus57FS4lTYt2riPb7ByKqLpCgSVUqq/63uhfrcQSuO8aQ==
X-Received: by 2002:adf:f247:: with SMTP id b7mr19529274wrp.128.1596527348378; 
 Tue, 04 Aug 2020 00:49:08 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:9005:cf07:3ece:ca77])
 by smtp.gmail.com with ESMTPSA id k4sm32012456wrd.72.2020.08.04.00.49.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 00:49:07 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
 <xen-devel@lists.xenproject.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
Subject: RE: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
Date: Tue, 4 Aug 2020 08:49:06 +0100
Message-ID: <001101d66a33$bba44670$32ecd350$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIHYXuU00Oy15gaFT3m+7M9vTQs4QI4vgcsqLPeFZA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Oleksandr Tyshchenko
> Sent: 03 August 2020 19:21
> To: xen-devel@lists.xenproject.org
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>;
> Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Julien Grall
> <julien.grall@arm.com>; Jan Beulich <jbeulich@suse.com>; Daniel De Graaf <dgdegra@tycho.nsa.gov>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Subject: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for IOREQ/DM features
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch makes possible to forward Guest MMIO accesses
> to a device emulator on Arm and enables that support for
> Arm64.
> 
> Also update XSM code a bit to let DM op be used on Arm.
> New arch DM op will be introduced in the follow-up patch.
> 
> Please note, at the moment build on Arm32 is broken
> (see cmpxchg usage in hvm_send_buffered_ioreq()) if someone
> wants to enable CONFIG_IOREQ_SERVER due to the lack of
> cmpxchg_64 support on Arm32.
> 
> Please note, this is a split/cleanup of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  tools/libxc/xc_dom_arm.c        |  25 +++++++---
>  xen/arch/arm/Kconfig            |   1 +
>  xen/arch/arm/Makefile           |   2 +
>  xen/arch/arm/dm.c               |  34 +++++++++++++
>  xen/arch/arm/domain.c           |   9 ++++
>  xen/arch/arm/hvm.c              |  46 +++++++++++++++++-
>  xen/arch/arm/io.c               |  67 +++++++++++++++++++++++++-
>  xen/arch/arm/ioreq.c            |  86 +++++++++++++++++++++++++++++++++
>  xen/arch/arm/traps.c            |  17 +++++++
>  xen/common/memory.c             |   5 +-
>  xen/include/asm-arm/domain.h    |  80 +++++++++++++++++++++++++++++++
>  xen/include/asm-arm/hvm/ioreq.h | 103 ++++++++++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/mmio.h      |   1 +
>  xen/include/asm-arm/p2m.h       |   7 +--
>  xen/include/xsm/dummy.h         |   4 +-
>  xen/include/xsm/xsm.h           |   6 +--
>  xen/xsm/dummy.c                 |   2 +-
>  xen/xsm/flask/hooks.c           |   5 +-
>  18 files changed, 476 insertions(+), 24 deletions(-)
>  create mode 100644 xen/arch/arm/dm.c
>  create mode 100644 xen/arch/arm/ioreq.c
>  create mode 100644 xen/include/asm-arm/hvm/ioreq.h
> 
> diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xc_dom_arm.c
> index 931404c..b5fc066 100644
> --- a/tools/libxc/xc_dom_arm.c
> +++ b/tools/libxc/xc_dom_arm.c
> @@ -26,11 +26,19 @@
>  #include "xg_private.h"
>  #include "xc_dom.h"
> 
> -#define NR_MAGIC_PAGES 4
> +
>  #define CONSOLE_PFN_OFFSET 0
>  #define XENSTORE_PFN_OFFSET 1
>  #define MEMACCESS_PFN_OFFSET 2
>  #define VUART_PFN_OFFSET 3
> +#define IOREQ_SERVER_PFN_OFFSET 4
> +
> +#define NR_IOREQ_SERVER_PAGES 8
> +#define NR_MAGIC_PAGES (4 + NR_IOREQ_SERVER_PAGES)
> +
> +#define GUEST_MAGIC_BASE_PFN (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT)
> +
> +#define special_pfn(x)  (GUEST_MAGIC_BASE_PFN + (x))

Why introduce 'magic pages' for Arm? It's quite a horrible hack that we have begun to do away with by adding resource mapping.

  Paul


