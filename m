Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEE4ABBBB1
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 12:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989720.1373704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGyCp-0000vn-Nw; Mon, 19 May 2025 10:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989720.1373704; Mon, 19 May 2025 10:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGyCp-0000sx-Kk; Mon, 19 May 2025 10:58:51 +0000
Received: by outflank-mailman (input) for mailman id 989720;
 Mon, 19 May 2025 10:58:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG9i=YD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uGyCp-0000sr-0x
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 10:58:51 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3de2c507-34a0-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 12:58:48 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad56e993ae9so169466666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 03:58:48 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad52d06ad94sm573403066b.38.2025.05.19.03.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:47 -0700 (PDT)
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
X-Inumbo-ID: 3de2c507-34a0-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747652328; x=1748257128; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aus8QzFM/GlRkV4zkxFxtT1REF5/OEDyA0BmHNUNl+I=;
        b=Dd/cvKrnhWuTzM5jSuSifjTZ/hCkBBV9SxIb6T27eixIVlbHEBhyc/raUfyuEBMiLl
         o5y/g+9oL4QTyWKBu5a/kWxDnXAQl7Lmn5OsANs9vbznLvKrGKk0MY5ISj2pwdxbAE2b
         PmuhP9adJyKK1PZsotYFYE/Bf66yFLxlotZvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652328; x=1748257128;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aus8QzFM/GlRkV4zkxFxtT1REF5/OEDyA0BmHNUNl+I=;
        b=Yo/9tzZKS8UDJ3bVZm4LACaoJHNxk5CasJGPPDHm83KsIw+6fJsioQLS47qJGsf6YQ
         eFBaetrpz9dKewiMABwmLE04WT3hQAVHv0l3GJx3YciiT9ES5nkhYrZWPu7RNJn1TUAm
         cXJDyFWWxeBI6tkSi1sTepDDbl/2XWRD+zutpn7Qxj3mQ9G29TQKXgHnYVzX9YX5bhdk
         pFu/FVVmtR6bVAi18YMmG3JE4It0uubTd8SQ9Y8qq1lIfsJGZCUBgg+02JtyVjTrmg+x
         cX4lynv1V1eAx5i/mvH+0u3utY/BBEKY4QxcLBo44u7YE8ksLqIeaxod5StWsXGPXU8I
         ss7w==
X-Forwarded-Encrypted: i=1; AJvYcCXo9Xvwb9uWyZUaxvG58A1zFtXfUK2lMEm8QsCPtYSuZ88J7bP93CPeeQT/m8t/sg99kCPsoTKfenE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywu+1eThMgIsxeWFWtgIm4Wb738t3j4GsGkROG6BTaCDZwYzIpB
	79/O9nAQDDUYyoZEWThR/WbTojUkrZ3C4bc9KY2R8sVG88ZeyJtfuHGNRCAKibTw5ww=
X-Gm-Gg: ASbGncubRgAkUuLA4ptdauUCZKOkTMwK2qAISjcFH8zru+TZ0XlX1OoXSvR1dlngoEQ
	h7H26xI6yyWxVqGuGCrisDpJwdV3siE1cEifhbgHp2+Bo8V4H1WV/dYswXVakeUFBAGUHkF3hRY
	rWkTyUs4Sb0doBFRindZQRSDuHCh0AO+0G/elcGXsZJjxIlm8mnXjlawVB30e4l/y2OEqSIuwVg
	+Z3NFLgSPsYFmgnYe/Ek8eUBxPdffXmVdaDTy8bc2oJZrR/UHMWCtb5tnRFYLe5nm34tpOCklb3
	ot2/QKHEwba89rfoPhuLJ7slHzGRp7CDj6ENNgwsirqk4Ns50A5kiUL0L0465Fgt7QBqFhBJ0yd
	gStQOcpbwZHVM3ZMmU2HYmfE5Ugm9h0n7FV4=
X-Google-Smtp-Source: AGHT+IHr9pJwSczcYze+lMInsgg4UNiZ2dxMKjeV0iHqgkSSIYbp/GWgx91563eG6RU1OeglEmV0Tg==
X-Received: by 2002:a17:907:94d2:b0:ad4:d135:cf68 with SMTP id a640c23a62f3a-ad536f9d8c3mr998103766b.59.1747652328135;
        Mon, 19 May 2025 03:58:48 -0700 (PDT)
Date: Mon, 19 May 2025 12:58:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/6] x86/hvm: limit memory type cache flush to running
 domains
Message-ID: <aCsO5oGeWi98keYV@Mac.lan>
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-6-roger.pau@citrix.com>
 <8bf8072f-c379-416a-9d7d-912db7084e67@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bf8072f-c379-416a-9d7d-912db7084e67@suse.com>

On Sun, May 18, 2025 at 01:38:02PM +0200, Jan Beulich wrote:
> On 16.05.2025 11:45, Roger Pau Monne wrote:
> > Avoid the cache flush if the domain is not yet running.  There shouldn't be
> > any cached data resulting from domain accesses that need flushing, as the
> > domain hasn't run yet.
> 
> This again plays into what we started discussing already: There may still be
> data in caches due to Xen or toolsstack behavior. Imo to compensate we'd need
> to do one flush right before unleashing the domain. Yet of course this makes
> sense only when we make sure to not have (cachable) mapping in Xen for any of
> the affected ranges. Hence, with that not presently being the case, ...
> 
> > No change in domain observable behavior intended.
> 
> ... I agree here, thus ...
> 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> The situation may want discussing a bit more in the description, though,
> which would make me feel less uneasy about that R-b.

I've added:

"There can be data in the caches as a result of Xen and/or toolstack
behavior.  Ideally we would do a cache flush strictly before starting the
domain, however doing so only makes sense once we can guarantee there are
no leftover mappings of the affected ranges with cacheable attributes,
otherwise the CPU can speculatively populate the cache with data from those
ranges."

Thanks, Roger.

