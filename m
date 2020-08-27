Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D507254349
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:14:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBEux-0003g0-Nn; Thu, 27 Aug 2020 10:14:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBEuw-0003fv-Uh
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:14:02 +0000
X-Inumbo-ID: 3fdee34e-a82a-459c-930a-10ad8bc50160
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3fdee34e-a82a-459c-930a-10ad8bc50160;
 Thu, 27 Aug 2020 10:14:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x9so4600582wmi.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pVLjcBUPcpyor9f2b3xxld1VKF1mQUHqjMC4Bnbs8b4=;
 b=qUr01pH4LTGvMS+Mlkdpipf/GjkS4JXYl3BxDBTHmHYfD2++mswg37GOvAYpkYV9v9
 RRnMlV2ukR1rbQeBHTzhtzCMMMOI72aKX0gxYXtrPZMD9d4qZAkSuh7NN4JidNYam6X0
 a0pW8AsGa9mZHk4MSvBBw+XkRfGZaluRYCch3Bpq5BUZ0IsFPNTIloMl3/hwOSanyKEX
 UVErILtbAKZlkR5ODg0fHV9/hA/X3IV4wBbpV6zuSPEeqbn6f8s1KdM1CDMM304AsMpt
 hM8SIDGx1CiJ/reQUqynfUA14dyEb48QtDyTeV/3trqesPdjjk3bBOepk6D9nvl50AmV
 FpvA==
X-Gm-Message-State: AOAM531lG9iQSifaddGrGQfx6TWw6ujNP2d01mgQ5fDKsLfFsbvsqagu
 Uizd7vyRhz53ubMy3RjHdkg=
X-Google-Smtp-Source: ABdhPJxnSqrb/NXUwIQHrgnRhLKq71aQFNVYlRCAQsqnqWQWCfk6GC+3H/id0cMDSK0Nz1ugHE6jtw==
X-Received: by 2002:a1c:80ce:: with SMTP id
 b197mr11585759wmd.118.1598523240733; 
 Thu, 27 Aug 2020 03:14:00 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v12sm4916603wri.47.2020.08.27.03.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:14:00 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:13:58 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH I v2 5/6] tools: define ROUNDUP() in
 tools/include/xen-tools/libs.h
Message-ID: <20200827101358.2yozest4b7fueo7v@liuwe-devbox-debian-v2>
References: <20200815130341.27147-1-jgross@suse.com>
 <20200815130341.27147-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200815130341.27147-6-jgross@suse.com>
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

On Sat, Aug 15, 2020 at 03:03:40PM +0200, Juergen Gross wrote:
> Today there are multiple copies of the ROUNDUP() macro in various
> sources and headers. Define it once in tools/include/xen-tools/libs.h.
> 
> Using xen-tools/libs.h enables removing copies of MIN() and MAX(), too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

