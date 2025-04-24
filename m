Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD00A9AAD9
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 12:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966169.1356478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7u87-0003s0-Df; Thu, 24 Apr 2025 10:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966169.1356478; Thu, 24 Apr 2025 10:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7u87-0003q9-Ac; Thu, 24 Apr 2025 10:48:31 +0000
Received: by outflank-mailman (input) for mailman id 966169;
 Thu, 24 Apr 2025 10:48:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnO2=XK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7u86-0003q3-35
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 10:48:30 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7c1bf31-20f9-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 12:48:28 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5e5c7d6b96fso1575196a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 03:48:28 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5f6ed9e0ba6sm944319a12.75.2025.04.24.03.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 03:48:27 -0700 (PDT)
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
X-Inumbo-ID: a7c1bf31-20f9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745491708; x=1746096508; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dwnp+/x85wRF3e/O/oqRpY4QG2HujtI1d8XPzHF+htc=;
        b=E8TIv6lUliSJKwW/jdMPY7itDDJPgrkEnh98pVwE9VTLLqfMpmMiWGWRBHo5H1szKx
         uXavjaRJD6V+8caf35uX5TAA0bmifUDCZkRkUFveN96VzNpE7qY9o0QgJiCa0zKmPD/5
         Hbda8YpxG8qbbBP4hA4e13FubOYWbPVUSP/Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491708; x=1746096508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwnp+/x85wRF3e/O/oqRpY4QG2HujtI1d8XPzHF+htc=;
        b=wkbnSjWDsUfzAgI9kq4dEkPKhipB8/Iho/jn5B4rCi4qZaB7e4+gji2dWYarIN9TZV
         e0IMLbgV0oNrfHRmxloRuqORmE+CgT82iApfBeaOj6N1DSuTRTbr2DrJ0pLn+SMM6TFf
         kUVCPqFFT0DhjPJaStd4ZIeyQiZ6qnA0MgVFvtOFLdAwLjxpOvqVljP0KFs7GEdu0MZ3
         FE5h25M+op1NbL/y+GfjRUIwZqRXgevwsaj158gX5HJafsaFFjYMWe4wvuT4S5YWRYKy
         4l+ETgQzTysXxOkut8m4q5d5NBiNf5/m8ava/vioNRJaJZNB0TxDRtHeTu4vIAZYPxFw
         I2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUeAEKBBAea0npczpLaEYq6bI2DLUeWVwEPN/cJwv7r0gUUz3/BTJRbiOnOW4aAcRzN6M+6Y7pknjA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCqzYB4sYVBbKEygF4Lv2UeHLWmjEYoRHXMND/+w5JYN+OqcMa
	DFMku8uHjHQusdt5SL/DY17q3wk8XKDWRy9T5f3TBu8DL1z08y+FStK2rhp+lMc=
X-Gm-Gg: ASbGncvSfvYhGbN6XCJzIw9upGjrGl6MiY0hEr7nL95euwm9jktqfhHHBTNAgSB2s2S
	D2eH/nulipoDZeSNjTvtAISkWsf5ZAHCrKAydbmsvQ7PqCirbMlSsmIoz28VWKqkO1jIp/GyAPA
	FsrgUJO/N2ExIomIdsf2dds/l+U1cWqsbUcG3eILOye2DRRaH3Bx5qnKOrOCWsnHa3yMOexpA2F
	bpcLsqtgXXWehINjAOO21Xwxj6TF29PMADqt1GRRWsJKQ2VVYnBpN2dtmgpYi2CWjTtuZulu5/B
	4TcS4ZlNx9jtA+r4enfwHV357gbaHE3+5+apMPsB9fZb1Q==
X-Google-Smtp-Source: AGHT+IGNgOjBgZPmgjbP5Tni1L9NX6HJ/gM5NkfcCsBrpFYXSLkv0+GUsS7ql9ysRMrGG9Tk2ADhXQ==
X-Received: by 2002:a05:6402:2708:b0:5e6:17e6:9510 with SMTP id 4fb4d7f45d1cf-5f6de1bf547mr2101777a12.6.1745491707817;
        Thu, 24 Apr 2025 03:48:27 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:48:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: "Lira, Victor M" <VictorM.Lira@amd.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Xenia.Ragiadakou@amd.com,
	Alejandro.GarciaVallejo@amd.com
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
Message-ID: <aAoW-kvpsWuPJwrC@macbook.lan>
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
 <Z--0USril0UIhR4R@macbook.lan>
 <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
 <Z_jFSb2-efexUNlL@macbook.lan>
 <9ed89e50-c645-407d-80b4-5b78cb6e36fa@amd.com>
 <Z_zGdE91KwlYxu_A@macbook.lan>
 <ce06ec74-1a73-4a02-87fc-3e829399cc77@amd.com>
 <aAnvRMgJxAskbCtE@macbook.lan>
 <aAoPNTsLjMMfsHvJ@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAoPNTsLjMMfsHvJ@mail-itl>

On Thu, Apr 24, 2025 at 12:15:17PM +0200, Marek Marczykowski-Górecki wrote:
> On Thu, Apr 24, 2025 at 09:59:00AM +0200, Roger Pau Monné wrote:
> > On Wed, Apr 23, 2025 at 04:51:16PM -0700, Lira, Victor M wrote:
> > > [    4.570354] Intel(R) 2.5G Ethernet Linux Driver
> > > 
> > > [    4.579535] Copyright(c) 2018 Intel Corporation.
> > > 
> > > [    4.588898] sky2: driver version 1.30
> > > 
> > > (XEN) [   21.644361] d0v3 unable to fixup memory read from 0xfe91000c size 4: -1
> > 
> > This fault is unexpected, according to the identity mappings done at
> > domain build time:
> > 
> > d0: identity mappings for IOMMU:
> >  [00000000a0, 00000000ff] RW
> >  [0000009bff, 0000009fff] RW
> >  [00000cabc9, 00000cc14c] RW
> >  [00000cc389, 00000cc389] RW
> >  [00000cc70a, 00000cd1fe] RW
> >  [00000ce000, 00000cffff] RW
> >  [00000fd000, 00000fd2ff] RW
> > 
> > The page at 0xfe910 should be covered by the last range above.  I
> > think we have a bug somewhere that unexpectedly unmaps that address.
> 
> You sure? 0xfe910 is outside of [00000fd000, 00000fd2ff].

Oh, did and off-by-one when copying, it should have been:

d0: identity mappings for IOMMU:
 [00000000a0, 00000000ff] RW
 [0000009bff, 0000009fff] RW
 [00000cabc9, 00000cc14c] RW
 [00000cc389, 00000cc389] RW
 [00000cc70a, 00000cd1fe] RW
 [00000ce000, 00000cffff] RW
 [00000fd000, 00000fd2ff] RW
 [00000fd304, 00000febff] RW

Where 0xfe910 is covered by the last range.

Regards, Roger.

