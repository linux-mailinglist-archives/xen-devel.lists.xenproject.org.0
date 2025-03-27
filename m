Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A5CA72BFF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 10:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928737.1331403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txj6A-0006sG-7z; Thu, 27 Mar 2025 09:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928737.1331403; Thu, 27 Mar 2025 09:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txj6A-0006r3-4r; Thu, 27 Mar 2025 09:00:26 +0000
Received: by outflank-mailman (input) for mailman id 928737;
 Thu, 27 Mar 2025 09:00:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txj68-0006qx-8n
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 09:00:24 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8707f34-0ae9-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 10:00:19 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac6ed4ab410so111794266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 02:00:19 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5ebccfb049csm11036342a12.42.2025.03.27.02.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 02:00:18 -0700 (PDT)
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
X-Inumbo-ID: e8707f34-0ae9-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743066019; x=1743670819; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L2jgDOvPwmBkenNWZjM8NoOIHmfh1BQmSjH3lIERFBM=;
        b=vLEkkz/TW7MUX93qgd6E5BvH21sFqFjlXY1HVNz6K91SHhQMA/vhNHJf8tYyZFUyAv
         kF6cggq6P/0aQ0gIreFfqe37OrWK3TIPH96T0gBlN0IG/ng/xoCY5r7GbzPlXXr3hXgv
         dczaOoPuYMf2OQVLRMouLFUQadBYx8fud23Ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743066019; x=1743670819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2jgDOvPwmBkenNWZjM8NoOIHmfh1BQmSjH3lIERFBM=;
        b=TcwFOTF3v0w7UvRFdAz6BogumDDs8qYXGn/MHyUtMyQHcbt9R/LnbPkKTm6b5H5sRo
         ER12piNNcL6fL3tUJxPSvXZzWU4PSe4/jONpAS04gOi5ySfSPIIDfJTReMkjeM8/bXOF
         9P5s8zVUBFMPsu5+AIkKKoQzlbSx7wu61PcbnJ4XkLxBBxAjhxxUobb810f3dEpKgR5x
         nnxS0WNYCm4zGeL33Q8NT9WM7+0t7gei3WpwSjcoARD9WCm/d2owfdVgYWNIZl7kldPx
         AM0Mkf2TCX86C02AVc1xHxKhM/LqcwkSQAasLWsU/3sTUTkw7no6fSZZv2hjvV+WlTwX
         abdw==
X-Gm-Message-State: AOJu0YzaHw9hHKlE3vAUPQqheFRmxNqN3f56dbddv+ZVlKjSGhEXbMab
	BdkfS0SJvRh6Na0uqTS9OHJTJjsYi9YS58aSLkQtXVx79U/l6qgoKMLPV63h33zPVbKXQUuUXCN
	4
X-Gm-Gg: ASbGncvDVfcBdMb50FJWBUyhvi2g0Rd8L6IS1DxaOV6PojTNwtHH1Fpr18xJK/bc7BN
	YSv0/ZPGVrdvhmaPKmJ6K9Jasxv0++XILU1ETtAOanznlgBvdcjC78ra1TaBScbkZQAq/u7u768
	mC+jjj3YyoMcau0DiiL1p8olHdAYbCZshNCzAiev9R3bQkWpkGBXxdSRDi3SHypn7X8PvETubBM
	thY4ef1hhYWZbUt140I817BGvQcDyui8zTpt99WKCRhALo4wbl/sbE3lp9K9KG/kQt7puJ6b0gd
	l4/IaZMGpY5FH0UEXbZK0pQq8t65ttLwkE0teLfTNgUKUregmA==
X-Google-Smtp-Source: AGHT+IHuea3Lnyi+pm77wHtv7sp2DeHAn/DPNJ4gr7I/cqFIyK/6GLFojOUWxgyf96N5I/S2H2gNQg==
X-Received: by 2002:a17:906:6a20:b0:ac6:b243:e480 with SMTP id a640c23a62f3a-ac6fb0fd669mr226362966b.42.1743066018664;
        Thu, 27 Mar 2025 02:00:18 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:00:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/P2M: synchronize fast and slow paths of
 p2m_get_page_from_gfn()
Message-ID: <Z-UToaPviR7b73iG@macbook.local>
References: <b590b590-764a-4dfe-9e13-975122790329@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b590b590-764a-4dfe-9e13-975122790329@suse.com>

On Tue, Mar 25, 2025 at 08:17:04AM +0100, Jan Beulich wrote:
> Handling of both grants and foreign pages was different between the two
> paths.
> 
> While permitting access to grants would be desirable, doing so would
> require more involved handling; undo that for the time being. In
> particular the page reference obtained would prevent the owning domain
> from changing e.g. the page's type (after the grantee has released the
> last reference of the grant). Instead perhaps another reference on the
> grant would need obtaining. Which in turn would require determining
> which grant that was.
> 
> Foreign pages in any event need permitting on both paths.

I've been wondering about this, and AFAICT the PV equivalent of this
function (the tail of get_page_from_gfn()) is much more limited in
that it just allows access to domain owned RAM or MMIO that has a
backing page (I expect mostly for the low 1MB?).

However for HVM domains we allow to take references to foreign mapped
pages and taking references to MMIO pages is not permitted.

Should the tail of get_page_from_gfn() also be adjusted to make use of
the newly introduced get_page_from_mfn_and_type(), thus unifying the
logic for both PV and HVM?

Could possibly be done in a separate change, I'm just trying to
understand why we have this seemingly different handling for PV vs
HVM.

Thanks, Roger.

