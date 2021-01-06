Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B82EC572
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 22:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62691.111133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxFyf-0006C3-Tt; Wed, 06 Jan 2021 21:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62691.111133; Wed, 06 Jan 2021 21:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxFyf-0006Be-QQ; Wed, 06 Jan 2021 21:04:21 +0000
Received: by outflank-mailman (input) for mailman id 62691;
 Wed, 06 Jan 2021 21:04:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4R3a=GJ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kxFyd-0006BZ-KM
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 21:04:19 +0000
Received: from mail-wm1-f52.google.com (unknown [209.85.128.52])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09eb2dfb-6d11-4b2f-8063-f2303dd7ffb9;
 Wed, 06 Jan 2021 21:04:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id k10so3506294wmi.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jan 2021 13:04:18 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g192sm4372348wme.48.2021.01.06.13.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 13:04:17 -0800 (PST)
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
X-Inumbo-ID: 09eb2dfb-6d11-4b2f-8063-f2303dd7ffb9
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IPHAjxJYvVumeooNXWV5jSCBsRC5djCS28LETZ93NX8=;
        b=SDsDwtBRYBw7dLoHCjPmRJBpa6IePkEJaL26+mQ3tWO/ne+7y3DVC+WWs7PbjYghnX
         cZYZo/SQIpA/guZDrc986QH3VRKRqEoocLSM29PBmFczsW+CqACl6gK6XONZXTy0mDAq
         U3nWqTDHuJkff8lxlaEOLpo4cs/Lh83285YOWjwistg+gldyC1aD674JIE39H01iUTcc
         ciVzDAIPyinstXq9HMMyJ7MkT1fLyJpZRykqBBiddUUWvBw1GgTspK7bOzcRkCtUBYM8
         c0AKNEaSr0lCLA55i+PcGHX9fJlqhLugdnnVdU2ct1Kdx3ubA9uEQVX1kPRC5VsPwWlK
         zWXw==
X-Gm-Message-State: AOAM5318SkESxjLqF8/BxVY8zbn2lt2w9DzsAzvoxaMbBvOQ55u8I4XA
	kQFhOukbbTJ971JUNuh6ImE=
X-Google-Smtp-Source: ABdhPJywwAsz5Pua2+VYBAz+fbxDJ4pNGWHLAdKq/L3oenshUW7zk4tRJLWAJlLCoyyTcNxc0XgI0g==
X-Received: by 2002:a05:600c:250:: with SMTP id 16mr5337273wmj.6.1609967058037;
        Wed, 06 Jan 2021 13:04:18 -0800 (PST)
Date: Wed, 6 Jan 2021 21:04:16 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] x86/dpci: EOI interrupt regardless of it's masking status
Message-ID: <20210106210416.ekexubhrak74qoq2@liuwe-devbox-debian-v2>
References: <20210105183143.94547-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105183143.94547-1-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716

Typo in subject line ("it's").

