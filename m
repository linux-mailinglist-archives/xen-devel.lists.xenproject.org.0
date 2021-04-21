Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF13668F5
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:14:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114291.217785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9rm-0006Tt-OX; Wed, 21 Apr 2021 10:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114291.217785; Wed, 21 Apr 2021 10:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9rm-0006TL-K4; Wed, 21 Apr 2021 10:13:54 +0000
Received: by outflank-mailman (input) for mailman id 114291;
 Wed, 21 Apr 2021 10:13:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZ9rl-0006Su-2F
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:13:53 +0000
Received: from mail-wr1-f52.google.com (unknown [209.85.221.52])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69e04633-7b2c-4fb0-854b-42973b2e766a;
 Wed, 21 Apr 2021 10:13:52 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id p6so34073823wrn.9
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 03:13:52 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id y11sm2551034wro.37.2021.04.21.03.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:13:51 -0700 (PDT)
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
X-Inumbo-ID: 69e04633-7b2c-4fb0-854b-42973b2e766a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qh88f1sYoOIILpQ5xBo0VNix8BB1dAFRP3vPA9Q5P3U=;
        b=LBvXy+ndMZJgF/uUWB/bTVaOyeXCpx8jafxrCb8ArjB53R8MVrLuf3Ar0Liod11B0P
         LsjnHpK3O1WamMco2LooPtkhvK5oZMmRI4lW7vD4N2lOtnqQwYc0XkFJz5cweRAJ3Xoj
         4ioJcP07S7YVj1qG/aaO6n6Gook1522k9rnIrpeoGUsLKVgvpRd6sOrsqpV1uknjbt2J
         6iBbXuLne2CInUxNBIh3NLqQ6HpzQjvwp2jMdOHcPhCANJSDX7PJ4fV5LB7HffvX0dDm
         iuSM1e09VCf28EykcIEuPBZFQK2kLVdyI/85QtQp2x1GzoO8wT9TxeTYRaTGZKljeIWM
         doYQ==
X-Gm-Message-State: AOAM533DoLXONg4Uf2bAhB+HCSC/YzMuaGgZQyO7OXfrLbbezcvWwZvh
	gLT/ViX1wdoqJsuFCNk9B0c=
X-Google-Smtp-Source: ABdhPJy2JeJETv1SAvnbOhorQsKJ945mSeeZgubJK48u+SDj/bZLuSALbpwYOWvmQ8xsILyWZMKaEA==
X-Received: by 2002:a5d:5444:: with SMTP id w4mr25596810wrv.202.1619000031657;
        Wed, 21 Apr 2021 03:13:51 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:13:50 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/6] tools/libs/guest: fix max_pfn setting in map_p2m()
Message-ID: <20210421101350.a4w7vkismmceewwr@liuwe-devbox-debian-v2>
References: <20210412152236.1975-1-jgross@suse.com>
 <20210412152236.1975-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412152236.1975-2-jgross@suse.com>

On Mon, Apr 12, 2021 at 05:22:31PM +0200, Juergen Gross wrote:
> When setting the highest pfn used in the guest, don't subtract 1 from
> the value read from the shared_info data. The value read already is
> the correct pfn.
> 
> Fixes: 91e204d37f449 ("libxc: try to find last used pfn when migrating")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

