Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C4A64DC50
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 14:33:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463401.721560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5oMH-0008Hc-88; Thu, 15 Dec 2022 13:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463401.721560; Thu, 15 Dec 2022 13:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5oMH-0008Fl-5D; Thu, 15 Dec 2022 13:33:09 +0000
Received: by outflank-mailman (input) for mailman id 463401;
 Thu, 15 Dec 2022 13:33:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lTo=4N=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p5oMG-0008Dy-42
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 13:33:08 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02181b45-7c7d-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 14:33:07 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id u5so10461718pjy.5
 for <xen-devel@lists.xenproject.org>; Thu, 15 Dec 2022 05:33:07 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 r4-20020a170902be0400b001899007a721sm3782338pls.193.2022.12.15.05.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 05:33:05 -0800 (PST)
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
X-Inumbo-ID: 02181b45-7c7d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ERNcPpaHt27A3KXsgnjyvyM7JRvNOPf3IOcl1pzqcX4=;
        b=fTRmd3s570/f/V79vpsNkME8j5jTRtNt9SA9kfy9zH03jyUVEPyCRkYFtClocfuboA
         mzCymNERW2H9vNhy9G0o1lw5lTdd2aZaMWndeU/n+VouxoojzSms7uF2oSdzR8YGtHrl
         nSsr9DaPOsUF5AhOHocqg6OL4/CITOVFKN0xqdql9+CS2NQegniYUINhaqYxmV1LxHAp
         mTio0BPDmyUswD7gDziJhgBQueX1QohrF8I7i0/ppn1f7juK6b8ZXW8oeZ4Kc4qap9e2
         BEJEeqmFVb4YzhdDtqcwEL4HX2Q8HTO48qTF3WMfXvOvH7racRkM/ZbSmn8pLHZQOAOv
         B35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERNcPpaHt27A3KXsgnjyvyM7JRvNOPf3IOcl1pzqcX4=;
        b=IqnnyBayEEMtuZUgdVsCZknIQkgplYn9exFUdXcPaKhAs20JcXUeqHJ1C6PhcsrlhR
         j1UA4q6IoG4x/Z12SQmZ/TI0PxsSkMhFamgHsD3Zza3e0mvZxZJzh4klnipGncafC5zs
         GwIZnq+8rnzq7UEA7blUHgPYPCJfYHIeS4S1xaZ8UTK2eD19ZXlDETjcY7fPSPKoPTqW
         Kar0VTWwxKfN8VD9X9+C9ow1hNiGGplniSheRWeqTVXmwkGICw0VMkciGluf+DwY5FIJ
         1do5P/SpQ8YG+Xg9vrL5ffkwcGDrJsTdVu24Efx5sunj/7sEeiz0CyMJi000LRgLJ4lA
         A7TQ==
X-Gm-Message-State: ANoB5plMeK0vTBd9gNvXxeGn0Tgu1UrqEpvt4EnaMuJFRu8DUSV3U+vT
	MYHCiceUNDHZmrptEs/d2euTdg==
X-Google-Smtp-Source: AA0mqf61KLlQmhbaBCqx23LwD1qRqCHiTl8rty9zgehenSp7V4SZnFBSvKXTnVOL+/1iKRE/6UV4eg==
X-Received: by 2002:a17:903:20d4:b0:18f:aa96:d4a5 with SMTP id i20-20020a17090320d400b0018faa96d4a5mr12370745plb.69.1671111186011;
        Thu, 15 Dec 2022 05:33:06 -0800 (PST)
Date: Thu, 15 Dec 2022 19:03:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [xen-unstable-smoke test] 175226: regressions - FAIL
Message-ID: <20221215133303.hlgm2hkzge3jh6zr@vireshk-i7>
References: <osstest-175226-mainreport@xen.org>
 <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>

On 15-12-22, 08:34, Julien Grall wrote:
> This build breakage was introduced by "libxl: add support for generic virtio
> device". %lu will likely want to be switched to PRIx64.
> 
> Viresh, we need to unblock OSStest (our CI) as soon as possible. So can you
> look at it and confirm the rest of the tools build on arm32?

I am trying 32 bit build for the first time today and still haven't
got it fully working. I have sent a patch though which shall fix
this issue, will keep on getting the 32 bit build up and running.

-- 
viresh

