Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70029366920
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114363.217956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZA0N-0000Ua-HE; Wed, 21 Apr 2021 10:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114363.217956; Wed, 21 Apr 2021 10:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZA0N-0000U9-Db; Wed, 21 Apr 2021 10:22:47 +0000
Received: by outflank-mailman (input) for mailman id 114363;
 Wed, 21 Apr 2021 10:22:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZA0M-0000T0-Hj
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:22:46 +0000
Received: from mail-wm1-f41.google.com (unknown [209.85.128.41])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1932f94-514e-4c28-9d0b-18d833f2eeeb;
 Wed, 21 Apr 2021 10:22:42 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 d200-20020a1c1dd10000b02901384767d4a5so977229wmd.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 03:22:42 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id m11sm2520061wri.44.2021.04.21.03.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:22:41 -0700 (PDT)
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
X-Inumbo-ID: a1932f94-514e-4c28-9d0b-18d833f2eeeb
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h0eA6GdNT9vFr9AdGHrEBfl5rQQT3TWK4Gjhx1Ao2sQ=;
        b=sSIu9HZyL6X0p01o9Ks6cQeKQYPJBTTr8gVKfMfsiPgNDDkBGZj6Je1zcAkZZ95dWB
         jGkQ8upn6/V0h8ZvpY1P7WJ3hQhmMmHl5CTh/57Ss5k+Gj1ViYYNQIYEuzdkUDeumS5k
         GMlYXziBE6RVezpn2hT5UvZ45z/6AG6eRrMUlX35oysdVeMNZWaZxVzECG01QRdVajGX
         aaoGZnbpQQ0Ee3/NEZELiDMuPxXRLxHdMFeLRkX2isQ/m3UKTemO6ljviHXEX4E3qYSn
         EzESKBnTTSEYdemhGDKTQKkRNZoV6edNlY0NQ5+JpzE4Fv3U5eUPgK9uKNe/fBc5sAE8
         F0IA==
X-Gm-Message-State: AOAM530e+coy+cz/HrIOQCJUcFiu1m03Co9ZopMnZoHBcd7WKHxpGsYf
	kVEx5IAPqNYodiXalVnOD+w=
X-Google-Smtp-Source: ABdhPJzH6lXi6OTNDURj1CgD6TvuUs2DrOKv/e46Wd0L+j+qvyBsGssqy1qGta8N6vmO1E2LWIFXcg==
X-Received: by 2002:a1c:1982:: with SMTP id 124mr2804746wmz.148.1619000561314;
        Wed, 21 Apr 2021 03:22:41 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:22:39 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 15/21] libs/guest: obtain a compatible cpu policy from
 two input ones
Message-ID: <20210421102239.tlesqrxsplk5vthm@liuwe-devbox-debian-v2>
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-16-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413140140.73690-16-roger.pau@citrix.com>

On Tue, Apr 13, 2021 at 04:01:33PM +0200, Roger Pau Monne wrote:
> Introduce a helper to obtain a compatible cpu policy based on two
> input cpu policies. Currently this is done by and'ing all CPUID leaves
> and MSR entries, except for MSR_ARCH_CAPABILITIES which has the RSBA
> bit or'ed.
> 

I thought canonical source for compatibility was to be put into the
hypervisor, thus all this functionality would be in the hypervisor. Am I
misremembering?

Wei.

