Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3776B9C03DA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 12:25:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831679.1247024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90dd-0005H1-9V; Thu, 07 Nov 2024 11:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831679.1247024; Thu, 07 Nov 2024 11:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90dd-0005Ey-6X; Thu, 07 Nov 2024 11:25:21 +0000
Received: by outflank-mailman (input) for mailman id 831679;
 Thu, 07 Nov 2024 11:25:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GEtt=SC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t90db-0005Eq-Tg
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 11:25:19 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6c8052f-9cfa-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 12:25:16 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so1158357a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 03:25:16 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5d7e6sm681607a12.14.2024.11.07.03.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 03:25:15 -0800 (PST)
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
X-Inumbo-ID: f6c8052f-9cfa-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY2YzgwNTJmLTljZmEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTc4NzE2Ljk3ODUzNSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730978716; x=1731583516; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FJ60yPRzmDk5VmxE0O8k0mAmglukEGhdOXCCRQ1TMi8=;
        b=rp85oCGyL2Gl3wCNltv2PQ/MjCCClHXrN7xttk33AQl/3o8b81wcBQrMNEqAWZiffQ
         JU2P5a/PnVYe/Lx34TFjfrh+dchsdkAzPLraA1zfvOUhpryXGqPUqa6JCkx6/TgWPpXu
         3WlujBU3q5oTSloRURiQfqcnhidveFXeJBigo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730978716; x=1731583516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJ60yPRzmDk5VmxE0O8k0mAmglukEGhdOXCCRQ1TMi8=;
        b=bP1GYqaFihpTlc6qEWsn/8KcrTqwnDzKD8J/ENfO4n+tlYVT1ueZv5glEgIxssFSk9
         OQZIciAgC7hdxrFiGswBbJv9QL6WvyLvfVxM6BZyHmmMjLrZ/V+LszV5mu5SrXsJsR0y
         xx35vrQDNgwdo1f9gExlkTzCvG24rkWe+nUvAtz+bzwUV5JlvU3BgNYyGNMrSC9C58yI
         sK0I8PQREjhdGqg+3HLZgtUHVbtHgNGNaQiWOVixNHfHc3VnT7rqVkUZ8QH+tEEisT7n
         a0DJ+CQFqY0Px3bKX7ODIDW95dWkrbTvgz7C7NLbJPzjNwhR3Bvlc/jXG88JC9QdUHRN
         G6qA==
X-Gm-Message-State: AOJu0YwicCAuvOiKaflsg0vzC31OL55pDdlqPwgmQyrXjhiRbL2Ijb+F
	8RAVX/kyRbUBGSHLKi9f4+ZblgtVpjKaFcpIRO06G/GxuIG6jPFvoHgXqzKiE44=
X-Google-Smtp-Source: AGHT+IFv7NEuZNMKatpR7mQN5PCnEAsBdssq93gHSEYPIhMJZ8cAwbDu40lNO6dah4SMfvR1BHZ8mg==
X-Received: by 2002:a05:6402:13d0:b0:5ce:df56:4cb7 with SMTP id 4fb4d7f45d1cf-5cedf564cf2mr9033491a12.27.1730978716377;
        Thu, 07 Nov 2024 03:25:16 -0800 (PST)
Date: Thu, 7 Nov 2024 12:25:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/Kconfig: livepatch-build-tools requires debug
 information
Message-ID: <Zyyjmu9tm1KEGiqQ@macbook>
References: <20241107084927.37748-1-roger.pau@citrix.com>
 <66fd7b53-25f5-459b-8563-e33fccba90ef@citrix.com>
 <ZyyLAj6MZ3fvOFBC@macbook>
 <22c59035-67e3-4e43-bfe0-26675a93e9ae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22c59035-67e3-4e43-bfe0-26675a93e9ae@suse.com>

On Thu, Nov 07, 2024 at 10:48:21AM +0100, Jan Beulich wrote:
> On 07.11.2024 10:40, Roger Pau Monné wrote:
> > On Thu, Nov 07, 2024 at 09:21:26AM +0000, Andrew Cooper wrote:
> >> On 07/11/2024 8:49 am, Roger Pau Monne wrote:
> >>> The tools infrastructure used to build livepatches for Xen
> >>> (livepatch-build-tools) consumes some DWARF debug information present in
> >>> xen-syms to generate a livepatch (see livepatch-build script usage of readelf
> >>> -wi).
> >>>
> >>> The current Kconfig defaults however will enable LIVEPATCH without DEBUG_INFO
> >>> on release builds, thus providing a default Kconfig selection that's not
> >>> suitable for livepatch-build-tools even when LIVEPATCH support is enabled,
> >>> because it's missing the DWARF debug section.
> >>>
> >>> Fix by forcing the selection of DEBUG_INFO from LIVEPATCH.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Oops, yes.
> >>
> >> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>
> >> Fixes tag ?
> > 
> > Was borderline on adding one, but wasn't sure since it's strictly
> > livepatch-build-tools that requires the DWARF data, but custom made
> > livepatches (like the examples in tests) do not require such
> > information.
> 
> At which point: Is "select" really appropriate then? Wouldn't it be more
> logical then to change DEBUG_INFO's default to take LIVEPATCH into account
> (still permitting people to turn debug info off if they know they won't
> need it)?

At least right now the only way to build useful livepatches for Xen
(not dummy tests) is using livepatch-build-tools (that requires DWARF
sections).  My concern with using the Fixes tag was that I don't know
whether initially the DWARF info was needed or not, or maybe whether
people used a different tool rather than livepatch-build-tools.

I don't mind changing, but I also don't think an hypervisor built with
LIVEPATCH but without DEBUG_INFO is going to be useful to anyone given
the requirements of the tools we provide to build livepatches.

Thanks, Roger.

