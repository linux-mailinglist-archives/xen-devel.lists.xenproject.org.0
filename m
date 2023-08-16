Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F2D77DD65
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 11:36:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584226.914713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWCwo-0007OB-Py; Wed, 16 Aug 2023 09:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584226.914713; Wed, 16 Aug 2023 09:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWCwo-0007MW-NE; Wed, 16 Aug 2023 09:36:14 +0000
Received: by outflank-mailman (input) for mailman id 584226;
 Wed, 16 Aug 2023 09:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hz6+=EB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qWCwm-0007EU-Um
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 09:36:12 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 566fb63d-3c18-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 11:36:12 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-317b31203c7so5788148f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 02:36:12 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e4-20020adfef04000000b003196dba130asm13710767wro.106.2023.08.16.02.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 02:36:11 -0700 (PDT)
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
X-Inumbo-ID: 566fb63d-3c18-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1692178571; x=1692783371;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=85acf0tv8If4NzPXTcNTNX4BUZ85h9wocFZzaqY6RxU=;
        b=N1kxQESRfW2otpudCNa1jK2DI14AWjkryy49y5Sk7e4D71n1X1z79MFzhw7PFzda/U
         WJCTvwStCEotT56F435xsSbbXLyzEDBDxaJt/mDQN62RV7vvgBIFS0tds9SDDCPa1yPk
         5sf3jXdl/oUEK26HLwbNBQvsH+MWEBLs4UmOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692178571; x=1692783371;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85acf0tv8If4NzPXTcNTNX4BUZ85h9wocFZzaqY6RxU=;
        b=Lp+Sl8v3r4RrAoztXbI7Ko3vx8JFGfLpMvYl1hOmi+PDECLysFUMH2wi+pg3elhM+x
         PM2Nqwx1jYVL3+2BfQx6QJEkf6gL46FYKbYsPn8lfltIt90WWzN9Bp9rUHwUU8qtdCYZ
         qmO5DflFJV1KCkw+7P2T8wQsEO6arTD+kaCgIb54oomrn8l7tbPHzT69AwB5MfEtYfji
         FH5RGD0boi8ywRz6FGWQAkXSwka0QDoSAr/d8eFbdXEKxEZcANgZ8gE0N3koM73XphkQ
         ZURxzm6W4SyLUNQmaDAdJESzJa8klg0gbxFnax8MAB8fVKyD/VEMeRNF+gPv/dN9qh2R
         8raw==
X-Gm-Message-State: AOJu0YxhOYa0P9RuZ0k6onDS8PLstsIWCEsZpouQQfjL13k0ssIPCwPS
	y8KAdZPXM86I0sijZSskm2LrrdMeua+uYUJDCCk=
X-Google-Smtp-Source: AGHT+IFzT7wFccTylEQt//fB/1f5U4l2Q0xffiDlP9kM5ENuQbpSxbud9nGE31xBubCSp/W2IwZMcw==
X-Received: by 2002:a5d:456c:0:b0:313:f235:cd17 with SMTP id a12-20020a5d456c000000b00313f235cd17mr1040511wrc.40.1692178571648;
        Wed, 16 Aug 2023 02:36:11 -0700 (PDT)
Message-ID: <64dc988b.df0a0220.d6d82.abb3@mx.google.com>
X-Google-Original-Message-ID: <ZNyYiXAlWkqoKDRR@EMEAENGAAD19049.>
Date: Wed, 16 Aug 2023 10:36:09 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 0/4]  Make PDX compression optional
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808130220.27891-1-alejandro.vallejo@cloud.com>

On Tue, Aug 08, 2023 at 02:02:16PM +0100, Alejandro Vallejo wrote:
> Currently there's a CONFIG_HAS_PDX Kconfig option, but it's impossible to
> disable it because the whole codebase performs unconditional
> compression/decompression operations on addresses. This has the
> unfortunate side effect that systems without a need for compression still
> have to pay the performance impact of juggling bits on every pfn<->pdx
> conversion (this requires reading several global variables). This series
> attempts to:
> 
>   * Leave the state of pdx and pdx compression documented
>   * Factor out compression so it _can_ be removed through Kconfig
>   * Make it so compression is disabled on x86 and enabled on both Aarch32
>     and Aarch64 by default.
> 
> Series summary:
> 
> Patch 1 Moves hard-coded compression-related logic to helper functions
> Patch 2 Refactors all instances of regions being validated for pdx
>         compression conformance so it's done through a helper
> Patch 3 Non-functional reorder in order to simplify the patch 8 diff
> Patch 4 Adds new Kconfig option to compile out PDX compression and removes
>         the old CONFIG_HAS_PDX, as it was non removable
> 
> Already committed:
> 
> v1/patch 1 documents the current general understanding of the pdx concept and
>            pdx compression in particular
> v1/patch 3 Marks the pdx compression globals as ro_after_init
> v2/patch 1 Documents the differences between arm32 and arm64 directmaps
> 
> Alejandro Vallejo (4):
>   mm: Factor out the pdx compression logic in ma/va converters
>   mm/pdx: Standardize region validation wrt pdx compression
>   pdx: Reorder pdx.[ch]
>   pdx: Add CONFIG_PDX_COMPRESSION as a common Kconfig option

@Jan: Just making sure, are you generally ok with this series as-is?

Thanks,
Alejandro

