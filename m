Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DDA22C439
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 13:19:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyvhw-00010Y-IT; Fri, 24 Jul 2020 11:17:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F0Jp=BD=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1jyvhu-00010T-Gx
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 11:17:42 +0000
X-Inumbo-ID: 49aabd7c-cd9f-11ea-87f9-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49aabd7c-cd9f-11ea-87f9-bc764e2007e4;
 Fri, 24 Jul 2020 11:17:41 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id q4so3533600edv.13
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2020 04:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CduvMxd8TuIJJcT2tc7SBVPIeE3Pd6WKLSswo4MzA0o=;
 b=B5V/hcqX4OmsnJPvmWv9x6m87bCMcsIpyrWz+UxCFEW6Qw7vMgTU/CyhTwBDn02+Kj
 TUcjck+ll0GmOwwtPqN4TxsSj5IKzte6eJSST6QeGd+Z4ZaeTHkjwB4Ajr5m09OvGTZm
 YHbcr59wiXGwVHGygldyB2ChYSZ5CWpsCy0v5Nh/qKx+uKzm2SDlZDMTtHeK+mgxeMdH
 hguBD7rqoLZfIQifHHw4yYRijvqpNSXpluxZSMf/SHtgx4+/oLi9b/eMdGxff460WBrW
 d4VJDtkProiF1C2t3hs2xTGMdGIPOVdX6pzlwNKD+lWfqPVswzGazJWO1WpM4t969JDw
 GIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CduvMxd8TuIJJcT2tc7SBVPIeE3Pd6WKLSswo4MzA0o=;
 b=ssEgSLsQu8Qd/RYxdpGXMA9E0BpEwAD3Y6FZPdZ0cBXhS/Icl0SyhdmqR3s8VYpaEw
 5179qZaH2Mgcjgn4R7duHNlRVsnpnlVupi2q21Y9ThvzdHY1s0dd9p9t99eDuEA0O0FZ
 ApaxvnjL2WjcnDxwIaZOFSZXVRB7ayQCKGbmUSFPjyg8/SpZP41nwMR1WVnimING9i6B
 hC3nWeQdSPzcZXxLC9mBPDW+TJezaxv+C7YRY4X2qFW0U54LaPfxxHT7xlzyKYUPliIP
 cTZSK8yfSyHFYtUrJt8sAP+PkROGMp8IVT95rmSWk32bRBq4tJRsAmDjzBllk3YQ8SNv
 cY0g==
X-Gm-Message-State: AOAM532BXmbRbvxtfKzFnNBfCubkitFc5ZnVx+Y8VSs+NZymLClA41Ud
 RcYOP9JyR7oMlLI6S0yNqFeXOCI/U9V3l7r89j8=
X-Google-Smtp-Source: ABdhPJzJo79xX5ypw8BgYr2BQYqRaOCSZMPH980+X7RknWCCKR/FUDUSllL3i9q9Y0Y6X741WlcReHWwuIEnVc3W5rY=
X-Received: by 2002:a50:eac5:: with SMTP id u5mr8676711edp.6.1595589460340;
 Fri, 24 Jul 2020 04:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <CA+wirGqXMoRkS-aJmfFLipUv8SdY5LKV1aMrF0yKRJQaMvzs6Q@mail.gmail.com>
 <1c5cee83-295e-cc02-d018-b53ddc6e3590@xen.org>
In-Reply-To: <1c5cee83-295e-cc02-d018-b53ddc6e3590@xen.org>
From: Amit Tomer <amittomer25@gmail.com>
Date: Fri, 24 Jul 2020 16:47:03 +0530
Message-ID: <CABHD4K87aqCxsaW+j7uiM3kWQeHjSb+zQEs2p-SuYu83V-g38Q@mail.gmail.com>
Subject: Re: dom0 LInux 5.8-rc5 kernel failing to initialize cooling maps for
 Allwinner H6 SoC
To: Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alejandro <alejandro.gonzalez.correo@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

> I remember this discussion. The problem was that the PMU is using
> per-CPU interrupts. Xen is not yet able to handle PPIs as they often
> requires more context to be saved/restored (in this case the PMU context).
>
> There was a proposal to look if a device is using PPIs and just remove
> them from the Device-Tree. Unfortunately, I haven't seen any official
> submission for this patch.

But we have this patch that remove devices using PPIs
http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=9b1a31922ac066ef0dffe36ebd6a6ba016567d69

Thanks
-Amit

