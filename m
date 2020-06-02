Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5478C1EB85F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:22:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg37l-0005ZK-U6; Tue, 02 Jun 2020 09:22:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVk0=7P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jg37k-0005ZB-2S
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:22:20 +0000
X-Inumbo-ID: 8e90c79e-a4b2-11ea-81bc-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e90c79e-a4b2-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 09:22:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t18so2615061wru.6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 02:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=tBdBgDV0rZWSymEOBaGzVwieg/DhEZ+F/kAr9Qw8t/U=;
 b=JFxI9JKGug2rHLwNms7V9ZWIre1/qO0qsHolY7jpCqyrFqPlGSE0rc5jz1ypGhDqpY
 yzKrORl+cXrO+F8fKjwUvy6GiQ9IUKria9zLRmnhnJNtxebVDjxkwx3hn7rZdohwdR7q
 agI/slUbt8NZXo1J8og1OSjUnAPbIBXxXTm1LK9WfBx/dnBmRsoepqr0GjBxpyOicUPd
 KhMiyUveVlXaAl5LB5YutEZldtECBaK/JZ3OwXcnhHyxmVlwBnml0Kkn9S2TrqMp3Nlx
 nrdQK6e0r6fwusDNGhhViaAmuwAgYNFFAoRNP1METatUsJDWM2eulnMAqhR34FaLTVkX
 wT6w==
X-Gm-Message-State: AOAM533OOi2shQ5ptJruTfish0pmhuXVAD4oVuYIMGbC//YKVpQ1SvM+
 5f0jZOEpxsAzNZOXVUxV3+M=
X-Google-Smtp-Source: ABdhPJy6X+gcAcNWktzplCq3ncZUQABJZ+EfmamoqzrLWe/nW4ZZE8mEPZCOqlF6JVNOWFdSljittw==
X-Received: by 2002:adf:e7ce:: with SMTP id e14mr27502326wrn.217.1591089738754; 
 Tue, 02 Jun 2020 02:22:18 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h15sm2664383wrt.73.2020.06.02.02.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 02:22:18 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:22:17 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.14] x86/cpu: fix build with clang 3.5
Message-ID: <20200602092217.uxcpjhv2gz6we47h@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200602090536.38064-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200602090536.38064-1-roger.pau@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 02, 2020 at 11:05:36AM +0200, Roger Pau Monne wrote:
> Clang 3.5 complains with:
> 
> common.c:794:24: error: statement expression not allowed at file scope
>                       i < ARRAY_SIZE(this_cpu(tss_page).ist_ssp); ++i )
>                                      ^
> /build/xen/include/asm/percpu.h:14:7: note: expanded from macro 'this_cpu'
>     (*RELOC_HIDE(&per_cpu__##var, get_cpu_info()->per_cpu_offset))
>       ^
> /build/xen/include/xen/compiler.h:104:3: note: expanded from macro 'RELOC_HIDE'
>   ({ unsigned long __ptr;                       \
>   ^
> /build/xen/include/xen/lib.h:68:69: note: expanded from macro 'ARRAY_SIZE'
> #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))
>                                                                     ^
> /build/xen/include/xen/compiler.h:85:57: note: expanded from macro '__must_be_array'
>   BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(&a[0])))
>                                                         ^
> /build/xen/include/xen/lib.h:39:57: note: expanded from macro 'BUILD_BUG_ON_ZERO'
> #define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
>                                                         ^
> 
> Workaround this by defining the tss_page as a local variable. Adjust
> other users of the per-cpu tss_page to also use the newly introduced
> local variable.
> 
> No functional change expected.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Wei Liu <wl@xen.org>

