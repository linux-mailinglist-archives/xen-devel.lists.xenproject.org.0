Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A324D929EB5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 11:11:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755199.1163482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkP1-0007AD-DF; Mon, 08 Jul 2024 09:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755199.1163482; Mon, 08 Jul 2024 09:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkP1-00077c-Ae; Mon, 08 Jul 2024 09:11:19 +0000
Received: by outflank-mailman (input) for mailman id 755199;
 Mon, 08 Jul 2024 09:11:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xFgZ=OI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sQkOz-00077U-JR
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 09:11:17 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 080bd97d-3d0a-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 11:11:16 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42662c21289so8709335e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 02:11:16 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1dd97bsm151250825e9.15.2024.07.08.02.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 02:11:15 -0700 (PDT)
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
X-Inumbo-ID: 080bd97d-3d0a-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720429876; x=1721034676; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GnB5HIk7cp+v8DIacqG7l0x/DLFvtsxiT3Ug1mZ4Wrk=;
        b=TztAxM4i92rvHBXWqPk3bYgyMgDq4fWqwpcWfLBT1U/uo4/smzUARPw+OzQ2jlBaSq
         XAw+7Bmvqep37FEFvdArzd/kqNEBujPEA4eboOycYOxvgYccKkLCRuuRv6k3m98wggm+
         77BzTzwGtbmOy4Qg50QLkxvtbnZ9XF6jEwkoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720429876; x=1721034676;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnB5HIk7cp+v8DIacqG7l0x/DLFvtsxiT3Ug1mZ4Wrk=;
        b=qodda9csLN38WpYdS73+TlzW0t70Wo83QkrZiqPblLJLTVCnmlYpFjWcbpamzOGLDA
         cp18DnOTqp+EdZfbDBjHuAoAJQIKIiWrshrJXENBqd3iyLrdCr2urqCofmPSsdeU4V/W
         cMIEdKvVXh6lqXjXu5dSaRflUkGPdRoaROvQrzanNY5IYDheAB2FWlaNAk4h25440fG2
         nuoQeC3lu6mxkcrjmit3P9yxEpIxgo8SsQlbNhvcEg1iMVqFtaObyX7iuVxIsXYeUgGg
         toQhnY5kIoQ+8cc+dj5HzAWL5/DnTerJWVJD8cFxHLRD++CBBwTYKpiu31c8+IIKKFau
         pkhQ==
X-Gm-Message-State: AOJu0Yy/eZuLnA2kwRsfAveBD8tlF0hw4cwNbIssV6VeIG1fUWx0xe8G
	ocFjjBhJSOeBkJgnR4bLmjjbMSwdi1Q4yCi4Flo8jIqasSxQyG/Frz61muw7/G0=
X-Google-Smtp-Source: AGHT+IEnDrh9GcytZhFhW2/ShylcYDqJYL/GK1BFxdeFfiafWA/ghxmVwrR7GtrZwmT65JrtWd6QeA==
X-Received: by 2002:a05:600c:4988:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-4266308e447mr26752585e9.26.1720429876081;
        Mon, 08 Jul 2024 02:11:16 -0700 (PDT)
Date: Mon, 8 Jul 2024 11:11:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 1/6] build: Regenerate ./configure with Autoconf
 2.71
Message-ID: <ZoutMipld6GtGSmV@macbook.local>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
 <20240705152037.1920276-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240705152037.1920276-2-andrew.cooper3@citrix.com>

On Fri, Jul 05, 2024 at 04:20:32PM +0100, Andrew Cooper wrote:
> This is the version now found in Debian Bookworm.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

