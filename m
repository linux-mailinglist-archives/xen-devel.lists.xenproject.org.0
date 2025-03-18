Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93458A67032
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:48:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918845.1323474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuTYL-0005R9-OO; Tue, 18 Mar 2025 09:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918845.1323474; Tue, 18 Mar 2025 09:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuTYL-0005PL-Lb; Tue, 18 Mar 2025 09:48:05 +0000
Received: by outflank-mailman (input) for mailman id 918845;
 Tue, 18 Mar 2025 09:48:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuTYK-0005PD-Ij
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:48:04 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14f0756b-03de-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 10:48:02 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-225b5448519so100068065ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 02:48:02 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6bbe771sm90231275ad.186.2025.03.18.02.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 02:48:00 -0700 (PDT)
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
X-Inumbo-ID: 14f0756b-03de-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742291281; x=1742896081; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fdcUEyAX0rb/OD+Y5h1IpeqQ9dAZ73cbGc1KKaed2gU=;
        b=nefR122Z090BUV0Bg/U2dTTi9U8PSn2ocn56CqWqO4pX+eaQu69h1UpH8ku6OspgWQ
         9YMXyTMC5c3iyjZlEE9hOV5FHzig5cFSm6/1fO8IFzOBdAM9lUFkc9RQjECxP4SxvuXV
         juQEPIRCUDmAlgFc3Lgaa5aHRdDUC6CHn1NYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742291281; x=1742896081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdcUEyAX0rb/OD+Y5h1IpeqQ9dAZ73cbGc1KKaed2gU=;
        b=o3tUkv//CJI2AX7UB4mm7K4xzlKlEoB5lJxdRiz7nNhh0BpY/R1IxwP1l88ZDQDbAh
         COk3HL92qg/DPJDHA2UqXMANuITkXEQYdoI436sLaNfehrYMdoGcDPNEdMsCZihOJ+9A
         w9rcRPIry8tqfiWdIWOtWqhMauArWo79OMmbdDgNSz6S8pFtmgZDTZjmgaAUhq7jw4Tz
         CJ53S1ic/9bz1Vio07wFW3ue1eNZ3OX5Rige1rTmi6rOdHXUIUztf3Uz4RJUxkWbBjui
         BE36K91mcwW1Z04uzEYs7QwiuF2bZ50F2gNrRmi+zKaQeDa9rFXRrMnlDMZ16sFa2Nht
         8+wA==
X-Gm-Message-State: AOJu0YwOq/hZW/HhqSuvMsl6jkPhuB/UCg9uar4RAET8StdClDWjD78+
	as2bFut5QVycMAQBGYpzgRSgEAbBJ0ezjp63XzO0WUCQVYtjX5qwsuCI7JU/nRE=
X-Gm-Gg: ASbGncsywyZwtqNVRL4Prcrw+Kc8+BWWkpDz2fMhvtzESNOZtYTesl/lAWuObvgzqmF
	a7hpAwdJBzcoYuX7yGSgUySKp5lfodz6nS+HXVAXD1U9MvG/UfwzhLOwMxUcLSRt4FtkqJK5Q3x
	yOKFvIUF/eInPADM8TzZLF/05GuaZ2rRBWP7N+27M6KMkXX921IqmKBtvSLJNo6ApPOFEN4X668
	e3Flx0xOfcz2KGlBnuziO981J1T3sBGjYslitloQCz8qvhGFLBHL+/l9UZeFzWBFkWia0Ld8auC
	fZx/sm+RrfvLZLsWGJ7zosqbsubOO74tKpMxWjlSB0J6OrQJGqwJWWw=
X-Google-Smtp-Source: AGHT+IFTRBU6RaQa/nxXXzoI7eaFRG9KULOaOjnta0Zvly3+mXgayq2wc6qFnI15GqHzjLGS8mdBVA==
X-Received: by 2002:a17:903:fa6:b0:224:194c:694c with SMTP id d9443c01a7336-225e0a8f166mr199582625ad.28.1742291281186;
        Tue, 18 Mar 2025 02:48:01 -0700 (PDT)
Date: Tue, 18 Mar 2025 10:47:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH 8/8] automation/cirrus-ci: add smoke tests for the
 FreeBSD builds
Message-ID: <Z9lBTCXN_Jb1XsSh@macbook.local>
References: <20250317121616.40687-1-roger.pau@citrix.com>
 <20250317121616.40687-9-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2503171708070.3477110@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2503171708070.3477110@ubuntu-linux-20-04-desktop>

On Mon, Mar 17, 2025 at 05:09:25PM -0700, Stefano Stabellini wrote:
> On Mon, 17 Mar 2025, Roger Pau Monne wrote:
> > Introduce a basic set of smoke tests using the XTF selftest image, and run
> > them on QEMU.  Use the matrix keyword to create a different task for each
> > XTF flavor on each FreeBSD build.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I've used the current version of FreeBSD to run the tests, but it might be
> > safer to use the latest production (release) version instead.
> 
> It is better to avoid using "current" (I called it "latest" in my
> previous email) if it is rolling. Otherwise, it is OK.

Yes, will adjust to use production instead of current and resend the
tail of the series.

> Other than that, it is great.

Thanks.  Afterwards I would like to add a specific UBSAN enabled
build, and do some more testing with it.  I found clang UBSAN more
complete than gcc (specially with the UB pointer arithmetic checks).

Roger.

