Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B52543AC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:25:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBF64-0004si-Rc; Thu, 27 Aug 2020 10:25:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBF63-0004sd-Q6
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:25:31 +0000
X-Inumbo-ID: f349080f-c41e-40cf-ba51-ac2c4d0e2ae3
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f349080f-c41e-40cf-ba51-ac2c4d0e2ae3;
 Thu, 27 Aug 2020 10:25:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a5so4836116wrm.6
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6Nipp4EUFRscpJ3aI2rDiRtHysyiXp8sStkFcH+42jQ=;
 b=P6cXPyE7jhCQ6OGts8kDC/eBYp6VLO/e9ROl9BBSYEz6ZbYXmULCu4B+HhU5tepcSR
 deIvkyUAs0xgYZ94jYxjYE4aD0OhgjifJr9HsjKX3G/LVKX1a2XSj9T3qxVhMiLL8gVJ
 jebe1+x7o86bjzIvwxH6CsC2SbmQQTV0FfxWCPYttXNo+5RMcVZkpmdR0xZLvFg7Tsrl
 9X8adqAei36r0mT55P6hubOjP6eKftEOaHTIIymEX+dbU4fTkg7Zp+EhfmENX6ILrNgg
 TLioafPV/4GaWUX78rK0m9SxdutLF2hWkMMQH4phJa/9GT6la4KE1adeeIFcX+K9JtCk
 Dl6w==
X-Gm-Message-State: AOAM531TJnxB363aBbDtqowhpHBatoqZbqh33k0/kGkbOr9TDqA+N2P1
 2qbn12dBIVqBbgDObdWNDmc=
X-Google-Smtp-Source: ABdhPJzUwjYlEn0OZGj5WfhydKj8d7wF+61NDL6lUDbPQdCWnv0Za2tHInu6YvQzLwu6SYFYFsqO3g==
X-Received: by 2002:adf:ba52:: with SMTP id t18mr19372395wrg.26.1598523930156; 
 Thu, 27 Aug 2020 03:25:30 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u205sm4483064wmu.6.2020.08.27.03.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:25:29 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:25:28 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 03/38] tools: add a copy of library headers in
 tools/include
Message-ID: <20200827102528.5kvv2gsnbgdh6w3j@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-4-jgross@suse.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Aug 23, 2020 at 11:34:44AM +0200, Juergen Gross wrote:
> The headers.chk target in tools/Rules.mk tries to compile all headers
> stand alone for testing them not to include any internal header.
> 
> Unfortunately the headers tested against are not complete, as any
> header for a Xen library is not included in the include path of the
> test compile run, resulting in a failure in case any of the tested
> headers in including an official Xen library header.
> 

Oops...

> Fix that by copying the official headers located in
> tools/libs/*/include to tools/include.
> 
> In order to support libraries with header name other than xen<lib>.h
> or with multiple headers add a LIBHEADER make variable a lib specific
> Makefile can set in that case.
> 
> Move the headers.chk target from Rules.mk to libs.mk as it is used
> for libraries in tools/libs only.
> 
> Add NO_HEADERS_CHK variable to skip checking headers as this will be
> needed e.g. for libxenctrl.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

