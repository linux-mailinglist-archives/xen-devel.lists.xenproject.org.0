Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920461EB861
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:23:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg38i-0005iW-Fm; Tue, 02 Jun 2020 09:23:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVk0=7P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jg38g-0005iG-Ph
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:23:18 +0000
X-Inumbo-ID: b1448a64-a4b2-11ea-abb3-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1448a64-a4b2-11ea-abb3-12813bfff9fa;
 Tue, 02 Jun 2020 09:23:17 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u13so2188002wml.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 02:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ObTAJIfIjh3vYqUzrP8hxx5f7jiiEVpYKHOGoi58jGc=;
 b=GsvqhvGm4ZE1xA4IzY/fLVNsXoynT5UEF5W/M0lN4MhPc79hdJyKiH/Eq6kc2x6SaE
 BlmG9EJjELfjJkiHc+pki1yJp3qbZzNTeSGaLkz5htA21it9TZILtQWdwqxHEm/w95kR
 WE0n414ZTI77/EvePK0GHIqj/DNlEfupmB5jVRpaqhBISBlEO8gLfwBOxMNfYp9aFgbI
 IlgFXVbk/Ar2LLhcVTc/D0Sq3dZEy09xd06ARp7tC2dSmCRgNRHDhznbWn9NDYPNy/iV
 LDzkvf806jsfBlf4lzjE/qPQUzWtZpcTjsHcr2i45UptTa+GrrLe8pKrxmB5loa+0Bls
 dLfw==
X-Gm-Message-State: AOAM5333h/po61ION0Eo/fqoEZzR8Ap4CslBdGKAmIOsCaNW0EUHIaVk
 PVXhYyGjZw+vXGODewjX6hU=
X-Google-Smtp-Source: ABdhPJxFmvGs6GZb3i/SgrNBQ3jxIEWek+N2DOeQuJInSXa9c5Savoqeu0g/tBaHoGaX6yOtiRjfNg==
X-Received: by 2002:a1c:b656:: with SMTP id g83mr3213783wmf.27.1591089796967; 
 Tue, 02 Jun 2020 02:23:16 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id y80sm2838210wmc.34.2020.06.02.02.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 02:23:16 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:23:14 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.14] compilers/clang: always use _Static_assert with
 clang
Message-ID: <20200602092314.uydguwrje4bomktf@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200602091602.38422-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200602091602.38422-1-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 02, 2020 at 11:16:02AM +0200, Roger Pau Monne wrote:
> All versions of clang used by Xen support _Static_assert, so use it
> unconditionally when building Xen with clang.
> 
> No functional change expected.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Wei Liu <wl@xen.org>

> ---
> Not sure whether this fully qualifies as a bugfix, as the current
> behavior should also work fine under clang. Note that all versions of
> clang from 3.5 to trunk (11) seem to return __GNUC__ == 4 and
> __GNUC_MINOR__ == 2.

IMHO it wouldn't hurt to apply this patch since any breakage is easy to
catch.

> ---
>  xen/include/xen/lib.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
> index e5b0a007b8..076bcfb67d 100644
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -25,7 +25,9 @@
>  #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
>  #define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
>  
> -#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
> +/* All clang versions supported by Xen have _Static_assert. */
> +#if defined(__clang__) || \
> +    (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6))
>  /* Force a compilation error if condition is true */
>  #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
>  
> -- 
> 2.26.2
> 

