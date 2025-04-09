Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9567A822AA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943886.1342492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Szl-0007M5-Ol; Wed, 09 Apr 2025 10:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943886.1342492; Wed, 09 Apr 2025 10:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Szl-0007Kd-Lr; Wed, 09 Apr 2025 10:49:25 +0000
Received: by outflank-mailman (input) for mailman id 943886;
 Wed, 09 Apr 2025 10:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ii2m=W3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u2Szj-0007KQ-MN
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:49:23 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b9b732a-1530-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 12:49:22 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e6ff035e9aso12661882a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 03:49:22 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5f2fbd476e4sm608030a12.80.2025.04.09.03.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 03:49:21 -0700 (PDT)
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
X-Inumbo-ID: 4b9b732a-1530-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744195761; x=1744800561; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18fe14lWgm3b6suv92FF6hDNOIYwQe/KXdOqIDUa3io=;
        b=akA3s9CjRTNY2cyKKozHV+e3r+TUAMtj5UE3lDE8Yp1lMY7TjdnIwmpT6FN98Is1LI
         b+X6QYoL+kULPxWHBNzKo23eLWiMbFFphsDgKU0AoxRa/WM8b2PznrPHuEmNGk9O2lOn
         XUo4pu0Gm2PpdS/evapjYUyIw1QZzzZOzD+oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195761; x=1744800561;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18fe14lWgm3b6suv92FF6hDNOIYwQe/KXdOqIDUa3io=;
        b=HApIda2QDwtbRLtBC/Iv93r+Sr5b9uP9151NLIkCljkZBukdgETJDdQ1Y8MCT0Hnxi
         ZS8Yptz8XvFn1uES2EiUV+mSbQmWMFKFda+akKCFZKJFY1npGROvwauSLJb+Zx/CumqI
         Ykqv92yt40lxW93ZSMgjrLd1AT7ywyTJcwnOT5+CR66XpA5x4pf5YltRHEr4RNHWYj88
         qkuHw+tfHa2jZ7Fnki/LSnK3fNQWF3vVzLdnqW9MylMR3cN2lZjB2WaEJrhwg0NAF2qZ
         rqAgaFSWcKRyQhqjUi5F+RpqM7AOXXphH64mbW0MAIJpx8Blf7SI38bqSutsadJfgcdO
         gULw==
X-Gm-Message-State: AOJu0YxKGhgIxgQMCoP0k6Qf5QXLgU1UUtS9orKMLh+4qxdDgY9FGV0O
	ZOrBP7Y16n+u4GGig3rE78gFba9WMZXm6QiRLcQDXr+6plhdG6CmR4Yz0t3L9ec=
X-Gm-Gg: ASbGncvAzWLE2F11J4RgTLfd//kiOij2uq8dJzaQ7cg+cnDCTtdb6Vv4eXJXlF/nx8i
	aSDHe7UiF3ejiTdlCussBBkHKiRIZqSauoULKEIH+L+rF6zvlDAzGIsa3h1lGYx/64q5fLpVixS
	/PdACJXjxCXlo0DkpqN4buIcB32+uoHGruShYUJ+pmRFYvnvfVJByMcTns46ngnsNs7mCcyoSzj
	OUM2dIJcQoyvXx8DRmTD0D4/ZxvLRhGhYOPuXP0Xk78gYN1xqRd+bl4Lk/vUSisyMCuEtVsXVVl
	fY7qajWJhZ8XqEg09y86sDynLXHZy1OhITKFr32OEQ3Y6g==
X-Google-Smtp-Source: AGHT+IGW7Nv9j9Atc/CKG/s72ovHcp2Dia4PRCpBn0tEz/RCNBSmhuvy+EBiJ/lnxnqVK191zdgAOA==
X-Received: by 2002:a17:907:3f9b:b0:ac7:33d0:db1 with SMTP id a640c23a62f3a-aca9b676857mr220501566b.13.1744195761437;
        Wed, 09 Apr 2025 03:49:21 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:49:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/ucode: Extend warning about disabling digest check
 too
Message-ID: <Z_ZQsOL_jajU4SrV@macbook.lan>
References: <20250409103836.1986139-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409103836.1986139-1-andrew.cooper3@citrix.com>

On Wed, Apr 09, 2025 at 11:38:36AM +0100, Andrew Cooper wrote:
> This was missed by accident.
> 
> Fixes: b63951467e96 ("x86/ucode: Extend AMD digest checks to cover Zen5 CPUs")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

