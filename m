Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7329C1A2EBF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 07:17:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMPYP-0006GX-67; Thu, 09 Apr 2020 05:16:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y/8s=5Y=gmail.com=neilsikka@srs-us1.protection.inumbo.net>)
 id 1jMHY1-0001zP-2h
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 20:43:45 +0000
X-Inumbo-ID: a319340c-79d9-11ea-83d8-bc764e2007e4
Received: from mail-ed1-x529.google.com (unknown [2a00:1450:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a319340c-79d9-11ea-83d8-bc764e2007e4;
 Wed, 08 Apr 2020 20:43:44 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id cw6so10436472edb.9
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2020 13:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Bben0FhFH556SaeVe3u+5c8WrOFDEewcwW5ZzLIk32U=;
 b=AKXRSbMLnEka5p/M3davmok66tukIpm4ifVtvKoARUvZNamYhgA69j266ZWK+jmbim
 MBFwdLUPmYR5UkzW7MgMZi1rxrnxmvIbaLtDIOnKCTG8orstVMKFuqNPUfJ7XLo/Mmr2
 GLj4VwBE4kZwa946yPKhKZd70tR/0vl0NrBBTeECQt/TGJgEOQOTPJftPSKyMR9NH5jW
 6GeDwWgWpsH3oyFDQBplpgb4dvbYUFV7PlaOmWt4Rpx0O6bZOcXNcTHkzwwjR4IG2Bu4
 BiuOyWYMCOGKUBGagXqs9DL3BKMn9BND0+JTAtuLtmJChBYjaok5a20ZHrbemB2ONd4S
 faug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Bben0FhFH556SaeVe3u+5c8WrOFDEewcwW5ZzLIk32U=;
 b=EYewf/ssLm8nAAz+P0YYMYnBNuOE2lSA0rLWZUGwFHVqEHmzzPYlqKjPZ8KG+sx6Dq
 GMHphoEWPiVeIAs4sVzNlMpfSADT3wW7Oc41ZXGGJ4XBTTtEJI2k08FvqelnAgnA4nxM
 l9u4ycE5tuHARv8ytmrwyBvY1zSJLi/EYH+LLquAcs66PXSGV3ePwIl6I6pYP83wATWC
 00MeagpTQ8oLUB0YGyIiIGOWrfWjDJcBGl15zoiXF3n/hhNV79SRUhO9Z/3xn7L3MoHU
 cTXmOc7bpcZ8G2jaH2m11b1t1NSkqxGdbklO0ChUqdip48qqGXtx4dMLrT2bXxvUwlrv
 dJMA==
X-Gm-Message-State: AGi0PuaKRN+TQv6mf06tv80QwOhlNKwaZfySwv4XBeJoAkeTIbc6WsEg
 BxfulVFBy2NFppQTHkFGp6JX1YnO75GiR60g1vGezuNZlKk=
X-Google-Smtp-Source: APiQypLVSadprimQJ+cw5n0dtPJz4OpOb9sbRu9s9iKE6JUUEr+O6J/DGMOzDoBdDEMe2hIdQlgSDJS81vTyTsBxobQ=
X-Received: by 2002:a17:906:365a:: with SMTP id
 r26mr8316749ejb.343.1586378623071; 
 Wed, 08 Apr 2020 13:43:43 -0700 (PDT)
MIME-Version: 1.0
From: Neil Sikka <neilsikka@gmail.com>
Date: Wed, 8 Apr 2020 16:43:32 -0400
Message-ID: <CAHPMNWdvuZFuSMsr3ZQ8U0PZ3mB+Uq3hYryu+DtJsB1UV4bi_w@mail.gmail.com>
Subject: xen-network-common.sh MAC address assignment
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 09 Apr 2020 05:16:39 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

Hello,
Why does git commit f400f2993b52e820d0da24a2e49a8fdfab0d2827, make
xen-network-common.sh set a static MAC address for the virtual device
as shown below?

ip link set dev ${dev} address fe:ff:ff:ff:ff:ff || true

I see the high order byte is 0xFE, which has the broadcast flag unset,
thereby signifying a unicast MAC address (as stated in the comment
right before this line). But shouldnt the device have a random MAC
address? Is there any reason why a hardcoded MAC is assigned? FYI, in
rewriting this script with a randomized MAC, my VM cannot communicate
with my host, so this might have something to do with my problem.

Thanks.

-- 
My Blog: http://www.neilscomputerblog.blogspot.com/
Twitter: @neilsikka

