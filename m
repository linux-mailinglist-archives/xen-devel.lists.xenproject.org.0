Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1E51F5B89
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 20:54:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj5rh-0005CQ-QM; Wed, 10 Jun 2020 18:54:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWXx=7X=mvista.com=cminyard@srs-us1.protection.inumbo.net>)
 id 1jj5rg-0005CL-Lj
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 18:54:20 +0000
X-Inumbo-ID: c94f6594-ab4b-11ea-bca7-bc764e2007e4
Received: from mail-oi1-x233.google.com (unknown [2607:f8b0:4864:20::233])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c94f6594-ab4b-11ea-bca7-bc764e2007e4;
 Wed, 10 Jun 2020 18:54:17 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id j189so3027689oih.10
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 11:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:subject:message-id:reply-to:mime-version
 :content-disposition:user-agent;
 bh=qc/OfoZtFHoHNSDxvAltCZBY+UjDohB6V1B587JdG9E=;
 b=dNY/KSzWhUA+L5A0lpkFrWfQgn5TgKCWn897IvR/DN2+KgWJakgZTDcsJdbsu0x5gR
 /HFO/QqbZtzhtk+gv3Ev4QOiB4/E0NUP/Utz2JbD2ODYby5P+edvEu8FmVjrSe/Ruk1S
 6EOfHxL2sp3lVoYmMsEJRDb0JWthOvlpWpyDzu2JGwmB+/n9K3pEWNQW8hkwT9wblO9g
 PxG4p9sCYqQzYOp2u0IegfL/x8TE046mS+44dbn5GURf7h0+FCOS4+AL9RaSbClf1j2m
 ACmJ8TBScXLEueF7sfhGT3cBW3Yj1Eazq0dBXWK+EtyNXMhTyOneSDYWoAl+QxO0MlSo
 21aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:reply-to
 :mime-version:content-disposition:user-agent;
 bh=qc/OfoZtFHoHNSDxvAltCZBY+UjDohB6V1B587JdG9E=;
 b=hX0HyccUigjyk8wqWXk2YYfP7XpyltBdcZ9OnbUl0JzqP9C8MtVYM2l9C+htAYSM82
 waLqGQDTbynVU7NdjlD8f+GNhEBuWLfVah1CGyK4YrCpZuHS0j+5wjhpsCeU79wIKjz4
 SeCZ4lUXzmEziauDhaFyF391gNjjRv7rANT/4PpI1KZnF49YcrsAgkz9ZUXcuNI1cHwZ
 V2gH9LsBbsgj8b9CQdkKzWqS9kW0Hf/oX9t21a9s2KyqjlLbAbTtKEwAop1BjHd70XCh
 PjGWKrH0tEBBhGNF+ZX4tdcdwMNcdkuFo/yfyh4I8SZuBlcEO+uzu1fuyTopy0r8Wphf
 M0QQ==
X-Gm-Message-State: AOAM530mcrYYJXQpKqctikRKE1l8Txq9PaTPsTzZ9BtEnr4FbM7PQwd9
 lCmC41hY/NsoVUobxCySGkVjXWrH0tE=
X-Google-Smtp-Source: ABdhPJwm+YuITJ95oR873g1fKYSwIDC8Ew2zEHXEAreCkghF6CrJPc7rj1fL+Y1Hm4mY39/hhSMymA==
X-Received: by 2002:aca:5395:: with SMTP id h143mr3710599oib.126.1591815257173; 
 Wed, 10 Jun 2020 11:54:17 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:814:e40e:3b2b:9d19])
 by smtp.gmail.com with ESMTPSA id s69sm177967otb.4.2020.06.10.11.54.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 11:54:16 -0700 (PDT)
Date: Wed, 10 Jun 2020 13:54:15 -0500
From: Corey Minyard <cminyard@mvista.com>
To: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, roman@zededa.com,
 tamas@tklengyel.com
Subject: Xen on Pi4: Xen doesn't work with overlays from Raspberry Pi 5.4
 kernel
Message-ID: <20200610185415.GG7231@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: cminyard@mvista.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I had been working on Xen on the Pi4 by throwing kernels I compiled onto
existing sd cards, and this was working fine.  I finally got to a full
yocto build of the system, and it didn't boot.

In fact, Xen didn't print anything at all, and nothing happens that
might suggest it's booting without any console output.

I traced the issue down to the vc4-fkms-v3d dtoverly.  With everything
else the same, the 4.19 version of that overlay works, and the 5.4
version does not work.  It also didn't work if I completely removed the
overlay.  The base device trees are the same between the two kernels.

Looking at the overlay changes between the versions and Xen source, I
can't trace down anything that would cause an issue.  Has anyone seen
this issue of have any ideas?

-corey

