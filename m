Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D0731D30
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549743.858465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pL5-0002ND-Gw; Thu, 15 Jun 2023 15:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549743.858465; Thu, 15 Jun 2023 15:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pL5-0002Jv-Ds; Thu, 15 Jun 2023 15:56:47 +0000
Received: by outflank-mailman (input) for mailman id 549743;
 Thu, 15 Jun 2023 15:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrMH=CD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q9pL3-0002Jp-NH
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:56:45 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39546dd9-0b95-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 17:56:43 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3094910b150so7923084f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 08:56:43 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 cs6-20020a056000088600b0030ae849c70csm21409966wrb.37.2023.06.15.08.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 08:56:42 -0700 (PDT)
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
X-Inumbo-ID: 39546dd9-0b95-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686844603; x=1689436603;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zr4rFd+Ly2V6JooMMPLRSfzkA3i6Yeh7UUEOOrn55Ls=;
        b=RbUk1mPTNV3DsUHmhSSQXLObhGw191TZaMVy4ie0bKQLIU7mTqKBHbbSQRvo7irA0H
         +BBtkpOdtY9pAqAO1Tax/EeAYvPIbGAuX0Qxck1w8Mvyo+9csH9PXiI2RX1bN+Uxxoi1
         vqbB/UlUxT3g5/SgKxgWahFQ6XG4O5D0tPTy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686844603; x=1689436603;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zr4rFd+Ly2V6JooMMPLRSfzkA3i6Yeh7UUEOOrn55Ls=;
        b=WP/fqUmd5KP6wOcdHIOWIgMT1mfADqHty8/16Vc6IiEzEjHio8jklYPlYfU/xkALpF
         iydx4EQ3gr5pLyZ8mTNs7qQhQb4Ef+Jg0SvWqg4xx4u++wIZfLFgvWT9ZbxEkQGvBXvW
         iBuRz+d2wHbql6CYfF0GFdsO4CDZVFKq/3nFnLkjMlbwBLrmDNZOFSg0Fh+Wr1rbnYiE
         sZq2UQOzXoAWcB949hCy7Whn+haGW8W+I8WfUrWyXRpko0iA8IVeXnFKzySLXPH+bsT6
         gY/WLRKxqgZM8p1/qXOmFqkt14LEFK/a8dgpYC7O/D3CEq0pxpEsrCoHylZsItsbVrlT
         hhrg==
X-Gm-Message-State: AC+VfDwcL6G3gY0X/gBe73HC52CZWVoFg26fpQs8tBGp2fIzCj4DLMgO
	sG004e8gH8bUgMNXjhDCMSpJV2jLdJ8UiWdu92g=
X-Google-Smtp-Source: ACHHUZ5r9W81j6+Fx8RTTpn3JZ2H2d9UoCyUUkOE4mdGd2thP64oRaHDGqvM7kBpM0hW40xW8KL4VA==
X-Received: by 2002:a5d:678e:0:b0:30f:c2a3:6281 with SMTP id v14-20020a5d678e000000b0030fc2a36281mr8838498wru.64.1686844602837;
        Thu, 15 Jun 2023 08:56:42 -0700 (PDT)
Message-ID: <648b34ba.050a0220.770ef.1a02@mx.google.com>
X-Google-Original-Message-ID: <ZIs0t7+hZcQDWO7u@EMEAENGAAD19049.>
Date: Thu, 15 Jun 2023 16:56:39 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 0/5] Prevent attempting updates known to fail
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615154834.959-1-alejandro.vallejo@cloud.com>

On Thu, Jun 15, 2023 at 04:48:29PM +0100, Alejandro Vallejo wrote:
> v3:
>   * Lots of hunks moved around. Individually mentioned in each patch
>   * Removed a redundant check
>   * Ignore microcode interface if the revision is -1
>   * Perform the DIS_MCU_LOAD checks during init rather than apply time

You might think that looks a whole lot like the enumeration in v2, and
you'd be right :) . I sent this ahead of time and that's incorrect. The
actual summary is:

  * Lots of hunks moved around. Individually mentioned in each patch
  * MSR_ARCH_CAPS read in early_cpu_init()
  * Per-vendor functions used to encapsulate vendor-specific logic in
    early_microcode_init()
  * Inlined previous helper for realoading 7d0

It addresses most concerns raised, but the final look is a bit different
from what was reviewed before. I think it's a lot cleaner and allows future
per-vendor logic to be neatly integrated into their per-vendor files.

Alejandro

