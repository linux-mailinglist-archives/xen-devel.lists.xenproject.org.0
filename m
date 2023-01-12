Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FD0668637
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 22:52:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476410.738565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG5Tp-0004fC-8S; Thu, 12 Jan 2023 21:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476410.738565; Thu, 12 Jan 2023 21:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG5Tp-0004bp-4q; Thu, 12 Jan 2023 21:51:25 +0000
Received: by outflank-mailman (input) for mailman id 476410;
 Thu, 12 Jan 2023 21:51:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYVK=5J=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1pG5Tn-0004bj-6w
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 21:51:23 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e934cf7-92c3-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 22:51:19 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id p24so21526718plw.11
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jan 2023 13:51:19 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0018bc4493005sm12607234plb.269.2023.01.12.13.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 13:51:17 -0800 (PST)
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
X-Inumbo-ID: 3e934cf7-92c3-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CWezmmHa6oj6qJtMomh+1hZZGWqGQrSyq0C7qN1MANE=;
        b=NrhE8GeB0gPtUpLJmL0nObCWCBwo04pER0QWC7YeN486f0tyfa3g3S7BtDUHlIbXFW
         zwrs+/K+DcCOmOq9CHZZri2ktplzmFfjR3ymQ4DGsJ6K3GoZmmlnw6aXM90nHdEUvKT6
         K3lDHI2HhmuViAyN/43XcHXcUD0CiNOTpAm0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWezmmHa6oj6qJtMomh+1hZZGWqGQrSyq0C7qN1MANE=;
        b=vkivjw+NIDq0yduZIFqA+Mjhb7co8dPMtWQU3A8zhU78+O4FqITOwhE4twm6t0dkjt
         +s0TFRPMUPO/Z1/e6i9PtxPHVyE4aKoLZNxOv38zpCy2UbzvGu+yovXSevdqIgsW4T4P
         KfUZJLSOnxySu1frhgK8fOBBLF1jAwhSkjhtKh+JITwrQeXjwfqKPYGebAY5iTvGl5ma
         OhAlDUKJJUSUEsPhTKU2g7RhmxfRxHXBr8EiiDnqm9EdeRWM75cY9tW2ej51mdxmSTrf
         xnVYGv1ztN6yiaWyfEtEdR9t3XgnkhMyZkXOGmimUsmz+S1CDUAV78KaSgLYYU7dtmlr
         6Hyg==
X-Gm-Message-State: AFqh2kqkLwe+NkSymyEogo68IcKeVzQvx0ArTnTKxQwAoD0IoIu8CDcP
	x+4+mmjTGhHKqxrrtjqrJb1urQ==
X-Google-Smtp-Source: AMrXdXvH368zgSN+CqWpi3idJyL7uyuYLfW6YfP3XhLcEJ233wBi4Eh2ch09l2nZrresK14l3RKZWQ==
X-Received: by 2002:a17:902:ba82:b0:189:86f0:70a2 with SMTP id k2-20020a170902ba8200b0018986f070a2mr37242231pls.43.1673560277885;
        Thu, 12 Jan 2023 13:51:17 -0800 (PST)
Date: Thu, 12 Jan 2023 13:51:16 -0800
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Joan Bruguera <joanbrugueram@gmail.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, mark.rutland@arm.com
Subject: Re: [RFC][PATCH 2/6] x86/power: Inline write_cr[04]()
Message-ID: <202301121351.B0CE02B@keescook>
References: <20230112143141.645645775@infradead.org>
 <20230112143825.644480983@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112143825.644480983@infradead.org>

On Thu, Jan 12, 2023 at 03:31:43PM +0100, Peter Zijlstra wrote:
> Since we can't do CALL/RET until GS is restored and CR[04] pinning is
> of dubious value in this code path, simply write the stored values.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

