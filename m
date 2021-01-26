Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76498304305
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 16:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75223.135391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Qd0-0000KK-34; Tue, 26 Jan 2021 15:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75223.135391; Tue, 26 Jan 2021 15:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Qd0-0000Jd-02; Tue, 26 Jan 2021 15:51:38 +0000
Received: by outflank-mailman (input) for mailman id 75223;
 Tue, 26 Jan 2021 15:51:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZUTE=G5=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l4Qcy-0000JY-Q4
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 15:51:36 +0000
Received: from mail-wm1-f48.google.com (unknown [209.85.128.48])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 054c1af6-0ef4-47d5-8249-5bba80b69670;
 Tue, 26 Jan 2021 15:51:34 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id c127so3178781wmf.5
 for <xen-devel@lists.xenproject.org>; Tue, 26 Jan 2021 07:51:34 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id l14sm13597103wrq.87.2021.01.26.07.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 07:51:33 -0800 (PST)
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
X-Inumbo-ID: 054c1af6-0ef4-47d5-8249-5bba80b69670
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e2NWHFQ/Ld6hT+QyjdChfOpt6cYljTZExc/01RpGr+c=;
        b=izD5Bp6RhoyhK2siqPugnjOOHd4SLSXrVg/6DTRdsjiXCEt5W3DZzfxGjYStYozQp0
         weYk5oQoSEHODlddLzYWvSbd+bqdRTs3BAzSroUYZ3TbUwf5CWaQVjmtWZMh8MKdnFxG
         ujdvetHjcFrG7XDPbWizLg9nmkBLYlsf+dUYSyI5Uk/Cqeg46OjYJYiGj2KFt3FrU7gd
         F5xRqOvPLmPCbGMfhYMfl9mKLSJ90qhb0vOvUZ2Md0draH/kIgxG/+i7iUovUPzudoN1
         jDCiLOlp3obfC1o9RPi/Ff57lH1dNh6dusJRev68w/HbUuc/8375s5RBvq2b1xOqLnnx
         jrPA==
X-Gm-Message-State: AOAM532EZ4toGEwPnyeGg8IX7tekuh1eTOu9y48cpFK/v/cFmddVt4/E
	Eyc2hcwYGfGmBXnVUR3gDFg=
X-Google-Smtp-Source: ABdhPJzLIBjgHyQQVOodDway9aMCHdFYjQvhRY8Ll9Eq7x31IpvWqfm1RnsF6d38WgPF1MxBBW3Gmw==
X-Received: by 2002:a1c:b78b:: with SMTP id h133mr322673wmf.151.1611676294051;
        Tue, 26 Jan 2021 07:51:34 -0800 (PST)
Date: Tue, 26 Jan 2021 15:51:31 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/libs: honor build dependencies for recently moved
 subdirs
Message-ID: <20210126155131.y3xulgrtumpv6cg2@liuwe-devbox-debian-v2>
References: <42328c2a-0c4a-af4b-4fad-349e16bd45c3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42328c2a-0c4a-af4b-4fad-349e16bd45c3@suse.com>
User-Agent: NeoMutt/20180716

On Fri, Jan 22, 2021 at 04:14:30PM +0100, Jan Beulich wrote:
> While the lack of proper dependency tracking of #include-d files is
> wider than just the libs/ subtree, dealing with the problem universally
> there or  in tools/Rules.mk is too much of a risk at this point in the
> release cycle. Add the missing inclusion of $(DEPS_INCLUDE) only in the
> specific Makefile-s, after having checked that their prior Makefile-s
> had such includes.
> 
> Interestingly the $(DEPS_RM) use is present in tools/libs/libs.mk's
> clean target, so doesn't need taking care of in individual Makefile-s.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-acked-by: Ian Jackson <iwj@xenproject.org>

Acked-by: Wei Liu <wl@xen.org>

