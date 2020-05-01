Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A41C11F4
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 14:18:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUUc4-00042x-2d; Fri, 01 May 2020 12:17:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQub=6P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jUUc2-00042s-MV
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 12:17:50 +0000
X-Inumbo-ID: c591095a-8ba5-11ea-9b01-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c591095a-8ba5-11ea-9b01-12813bfff9fa;
 Fri, 01 May 2020 12:17:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x18so11352193wrq.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 05:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=liMYuUxId91gL59cBzKMthRPQOfyR4BgWxxNuFgvwkk=;
 b=nRruK9uEzHn/DE5JRtu2I8Xwcf8sJWYR2iXky6DP4GN7t5w1aAk3osBiulO0ggs8fc
 BpcuhUMQON2Hgb0DbKkqxkIkJrL7Vr+svYFBzWS+H12++CHSf+sKcs21dHgZN5U28UYn
 WRXfCotLF9VZIg8HH71ZX8gxSvaif8Uh1KF7MQrn+uEx8pFgXQkIBce6HSLw1TI9E7Nn
 ZD3btS+8D7Ha2ZJ8B9VrIdhT/OMdE0wkpkJOP/NSXYij/awdNZew2065XXdavtpfXin2
 5CldJM3NnbvR2nRvDYEyGlOZkUXTVNgiarvPN/w+5+VLwrG340FiYLI6YGqBEpDj0sum
 jXFg==
X-Gm-Message-State: AGi0PuYrFaBp/y3vpRzcC6nS4c3jGGuuioZQUc4R2iOQJmqIw40IL5hY
 ppYgbwWjYYV8C6MBgZfwlis=
X-Google-Smtp-Source: APiQypILDFJz8N0xxelSBx2skcFO/uDfxdcAdzwAB3F4fBcu0c3DUkud3Yt4tS5q/eoqH9XkSJQfkQ==
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr3822774wrm.404.1588335468547; 
 Fri, 01 May 2020 05:17:48 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u30sm4320515wru.13.2020.05.01.05.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 05:17:48 -0700 (PDT)
Date: Fri, 1 May 2020 12:17:46 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/HyperV: correct hv_hcall_page for xen.efi build
Message-ID: <20200501121746.7t6xtvtu2w5l5oxb@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <c45d6098-a4e1-b565-4180-cc6da433dc57@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c45d6098-a4e1-b565-4180-cc6da433dc57@suse.com>
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
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 12:24:15PM +0200, Jan Beulich wrote:
> Along the lines of what the not reverted part of 3c4b2eef4941 ("x86:
> refine link time stub area related assertion") did, we need to transform
> the absolute HV_HCALL_PAGE into the image base relative hv_hcall_page
> (or else there'd be no need for two distinct symbols). Otherwise
> mkreloc, as used for generating the base relocations of xen.efi, will
> spit out warnings like "Difference at .text:0009b74f is 0xc0000000
> (expected 0x40000000)". As long as the offending relocations are PC
> relative ones, the generated binary is correct afaict, but if there ever
> was the absolute address stored, xen.efi would miss a fixup for it.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Wei Liu <wl@xen.org>

> ---
> Build tested only (and generated binary inspected) - Wei, please check
> that this doesn't break things.
> 

I don't have time to verify this in next couple of weeks, but I will
surely notice if there is a breakage.

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -327,7 +327,7 @@ SECTIONS
>  #endif
>  
>  #ifdef CONFIG_HYPERV_GUEST
> -  hv_hcall_page = ABSOLUTE(HV_HCALL_PAGE);
> +  hv_hcall_page = ABSOLUTE(HV_HCALL_PAGE - XEN_VIRT_START + __XEN_VIRT_START);
>  #endif
>  
>    /* Sections to be discarded */

