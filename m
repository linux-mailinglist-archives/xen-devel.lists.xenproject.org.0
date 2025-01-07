Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BCDA04401
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 16:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866424.1277759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBJW-0006gf-TR; Tue, 07 Jan 2025 15:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866424.1277759; Tue, 07 Jan 2025 15:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBJW-0006dm-Qf; Tue, 07 Jan 2025 15:16:14 +0000
Received: by outflank-mailman (input) for mailman id 866424;
 Tue, 07 Jan 2025 15:16:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X79W=T7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVBJV-0006de-Jl
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 15:16:13 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5354713e-cd0a-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 16:16:10 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so1759170866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 07:16:10 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aae8b7de1cesm2226676966b.23.2025.01.07.07.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 07:16:09 -0800 (PST)
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
X-Inumbo-ID: 5354713e-cd0a-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736262970; x=1736867770; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=19MYg6VBapyTtJhDJKd1kEjrCdtMUutELvteACPDNAQ=;
        b=jVlxGVNb68dN5o7MTGCm4jxh6nLK/l7phxnv2RoUhnESghgG+R4dTpNcNo7UoUMbVx
         BYA+QSGbRgaB+/tUA2RV7Jr1hVjxnIx15rXoavDsXA9U5pZvNjwoLxD4O4HJuUoRDDW4
         iSrnjFxY/rB4pMBH59eSbYpMeME3ytUDcsKv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736262970; x=1736867770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19MYg6VBapyTtJhDJKd1kEjrCdtMUutELvteACPDNAQ=;
        b=vbAcoRznKDW2UyLvHUW5ahCb9fsJLUuOYlUQJkeIsw5uu+RelItOLDIq0aSz2kIa5r
         9CMsBq1BPmyKCLZcxjspgnSrSR6coCXJbqw7UwnhTXWP03QCgVi7uk18lowOeavwFxXQ
         f//O6uQiTw3LmtrVDGofscoh/4JPvjp2lhEb9pd1pbNFw8duA6s5+meqvFv2j3sUiaP7
         Q91FBxGj9DC8cpmkn3W8RTiERsht+4re8xSPAhiVQCBY4ntIEh794fDSRKsSQvOeaLhU
         6A60xInTdK3bMPXnYm1ykgV3xAYqDRs4aDwVJAvU+fX3JX6tNTxswZsRkwf10rtfr9R5
         wTFg==
X-Forwarded-Encrypted: i=1; AJvYcCXO88xe7Yo7KA1LA9Sl8iWTQPxR+niFdzq/BY3kAIVvyFfZ9VSJkHJ5SFO9LLM6H48qnlPWazeCJL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymjRuzt2rXN4iHPLoJXtT157dJxhHhQMFGZHpOcBuFVH/D08FJ
	/9eBUyEE8S0j6LKsy5aEONh6b2/qJxGp1/DNiLHWrYCQkYzn0QrbK/244JnNQl4=
X-Gm-Gg: ASbGncssT8oA3BkFfjcuK1IX+YUVMyQhKv+pEJu9AvCKp1K6Cfj95hx4nXjazZs6YUM
	OG5voh1KoiVE7IN/fsFyHvGl+RyXscej5cla8/fOKJe9IIyjp6c58OdiI22+xt5oayebrjU0OtB
	F/BXQrWY/vzDC0DxebeG42H+ZXYW+B2PHDkE+OyfBhTwfNxfcTjz/1/y0kJ1HXkEFfZbN+0DyAf
	ds8i1P9avJD9sy0wqU9a91DF2slCbyNZLKDi2KFCKGIopNbR7tJL4TtqNgABw==
X-Google-Smtp-Source: AGHT+IGrEKuSubA8nkux3Dm2/lK5HTqmw/lLF8zOXEElWvtG6rCCfQsYxLHcUqLvPxJjO9TYFRVjVA==
X-Received: by 2002:a05:6402:1590:b0:5d0:d818:559d with SMTP id 4fb4d7f45d1cf-5d81dda6576mr156160493a12.11.1736262969910;
        Tue, 07 Jan 2025 07:16:09 -0800 (PST)
Date: Tue, 7 Jan 2025 16:16:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 33/35] x86/domain: implement domain_has_vuart()
Message-ID: <Z31FONoeaHVRHVxY@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-33-e9aa923127eb@ford.com>
 <Z1wnUzDCPDzHKr6o@macbook.local>
 <Tz4Idf7hUa85arksVC6UYYRNbhinY-0wHXqxIInbLCWGNiGZSEIvGNGLmICNLmHK5o7m6MUMhnUlrJX10WO1XHhyRSgCX7Gknz0xBGZJiD8=@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Tz4Idf7hUa85arksVC6UYYRNbhinY-0wHXqxIInbLCWGNiGZSEIvGNGLmICNLmHK5o7m6MUMhnUlrJX10WO1XHhyRSgCX7Gknz0xBGZJiD8=@proton.me>

On Sat, Jan 04, 2025 at 05:19:07AM +0000, Denis Mukhin wrote:
> On Friday, December 13th, 2024 at 4:23 AM, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > Albeit PVH is kind of HVM.
> 
> PVH does not have vPIC so there's some more work to enable vUART
> for PVH on x86: emulator currently supports only ISA IRQs.

But it does support vIO-APIC (as it's used for hardware PVH domain),
so serial interrupts could still be delivered using the vIO-APIC if
the guest has correctly configured the pin?

Thanks, Roger.

