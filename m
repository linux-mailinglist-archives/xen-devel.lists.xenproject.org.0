Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6FC6F0763
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 16:29:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527019.819161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps2cO-0002kU-G1; Thu, 27 Apr 2023 14:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527019.819161; Thu, 27 Apr 2023 14:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps2cO-0002in-Bo; Thu, 27 Apr 2023 14:29:08 +0000
Received: by outflank-mailman (input) for mailman id 527019;
 Thu, 27 Apr 2023 14:29:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S+EI=AS=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1ps2cN-0002ih-MH
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 14:29:07 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd7bc96e-e507-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 16:29:06 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-2f55ffdbaedso5487389f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Apr 2023 07:29:06 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f4-20020a0560001b0400b002ffbf2213d4sm18827769wrz.75.2023.04.27.07.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 07:29:04 -0700 (PDT)
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
X-Inumbo-ID: dd7bc96e-e507-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682605746; x=1685197746;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iCHoVKO38jPFFnKgVLFT/0YW6XWN64qCh8yFkzyuyQU=;
        b=k2Vor43M1aVCbW5lgeziT4Fv+k+5mp1zyPyP1un/khVxtko3PDVyYUvc5VXBP8i07u
         5y38y8Pf/+XFwKmMiF78fVBrQS8XTIbF27Cd/U5xV3bfHYxQICViRpCxf8zKz7xgvX5S
         LhvD4B6wtkjRy3HEhn92CimejNLYNGWmfHJXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682605746; x=1685197746;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCHoVKO38jPFFnKgVLFT/0YW6XWN64qCh8yFkzyuyQU=;
        b=NKNdTVZHOW+l3mED0WkRJWJk2ozdSGTEgmEWTkQc2Nnrwobw55NmN5h1wEpia5AM/0
         562sgZrlYUlnX9woRwY1uUf2UAtLfji9ycRKLMlrBQXyQDmDzbppslnFpu30Mx8Wlzgp
         FI+g/ROghosTnBp4EiWKzgJzo1eToad9f9NZrtXmAqzfDVfwaGH07wrcgkYeUd2zHFYm
         qVr1J3ynjTcuGZVBWAol8IDJq9jF3o83FVfDH0LeM5FwJx4eRxvn2775Ihont9yQ/0he
         X3fZ+GHMIum+6NB9Rn5pWPbT2G9FXyRMNBvpEqPxzfk0VdW4OVzDYeUQCJHjMh8upnTa
         JTHA==
X-Gm-Message-State: AC+VfDzWhZ8y8mmsYk/2PLYeTevziAwljhouYGCuvACPUaXzSGuhoegh
	M7jkw8Hk2LAIxeJLhi4k2ADBvg==
X-Google-Smtp-Source: ACHHUZ6O+94WEXVhDIr329qNmHlojWyFhlfQMjvTjLVyOlIGelUmhMu115E8nv6THqL4j/4Qhfj2rQ==
X-Received: by 2002:adf:f150:0:b0:2d2:d324:e44f with SMTP id y16-20020adff150000000b002d2d324e44fmr1546532wro.16.1682605745851;
        Thu, 27 Apr 2023 07:29:05 -0700 (PDT)
Message-ID: <644a86b0.050a0220.dd247.df2d@mx.google.com>
X-Google-Original-Message-ID: <ZEqGrrkWb9H8GYhH@EMEAENGAAD19049.>
Date: Thu, 27 Apr 2023 15:29:02 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Juergen Gross <jgross@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.org>
Subject: Re: [PATCH 4/7] tools: Make init-xenstore-domain use
 xc_domain_getinfolist()
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
 <20230426145932.3340-5-alejandro.vallejo@cloud.com>
 <18f4bd31-b26c-5cdc-5798-94ac8b7f282e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18f4bd31-b26c-5cdc-5798-94ac8b7f282e@suse.com>

Ah, I didn't notice that header. Sure, added locally on v2.

Cheers,
Alejandro

On Wed, Apr 26, 2023 at 05:20:01PM +0200, Juergen Gross wrote:
> Please include <xen-tools/common-macros.h> instead of defining ARRAY_SIZE().
> 
> With that changed:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> 
> Juergen






