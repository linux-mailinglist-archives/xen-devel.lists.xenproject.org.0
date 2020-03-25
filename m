Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88BB192DCE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 17:07:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH8WX-0000f5-N9; Wed, 25 Mar 2020 16:04:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OrPJ=5K=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jH8WW-0000eu-1Y
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 16:04:56 +0000
X-Inumbo-ID: 5e1446ee-6eb2-11ea-92cf-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e1446ee-6eb2-11ea-92cf-bc764e2007e4;
 Wed, 25 Mar 2020 16:04:55 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id cf14so2997265edb.13
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 09:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IftgZPASVT/fQNEb+bZUVOpH4pcqeFi6AZZZQaBKKWk=;
 b=Cs6qiYvFba3ehxWoxOdVwmxL+BbEBx/O0828nV5q/HImc/5CVmamq4152N51KLjPqb
 52Vu0rtp44gRIux3SmDunsDnronyfTtp9WCptGxQ6zoGKMzZ7FJyHwS0+iP1UR0x190D
 C9Y6pCYOj+XXlDsd0L72zoItkQrBeqP9eyWUePaQJeTl3ur3k40Xxr3DI5psGnDE1G9r
 Uly2uJtyGl4Zvfhn6iCS37McK65m1WtfM+/pSwkhPBJQJibrbX2GZzUeBA4Wbvh4Hv6l
 S6ZgOUdTNtHi4n1g5t3xbh4z9zjzLIxzWygg2vU6jRd62pRyr99bxPTDAKEo6qlejZVf
 PH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IftgZPASVT/fQNEb+bZUVOpH4pcqeFi6AZZZQaBKKWk=;
 b=MkcY6zK73BqgZOyIZoWkTRsbcvS2IMs6zkiHOZf5IPLWQu/srUNn4IIXUoL7s8bRsP
 02QuDosVahb+8NGQEwMFdmV1AnqSDO9GrXJ232fu7aFS8j5wlevBfsBo5o/VL74ZXZuv
 6FtvEaAySsuAzxW5XXnbIRiwenZkBXSyVKGk+Gre8tlRWilIk8KKdU+8pCO/TNjpjRd0
 kz/wQ3+P3JRlkvQDFjV/v/0KEYNfXKihProeOHSo9a85GkQiYVXiA13SD/mAxyLQSXtv
 TcrUEeN9skk9sZP3fT3we+bBOmh0/NTsHrSBkNRbD08OGsLO9lZCw3Aw9glVJdtkwyic
 b/3w==
X-Gm-Message-State: ANhLgQ0U2gFMS6LuBqlQBUPhcgOUPlpGxRFmaTuAa6+kG4GzjoJpbq2h
 4czLybLXXJAzJdIMGoOmvNngTJsI2rI=
X-Google-Smtp-Source: ADFU+vsdx0/aPajwl/OTwSHxkjD1zn6spZywmK8TnO9URjr7aqETlqmRF1gYGEQ1ZOvIpz/Eb6qmMQ==
X-Received: by 2002:a17:906:3ec5:: with SMTP id
 d5mr3918324ejj.106.1585152294374; 
 Wed, 25 Mar 2020 09:04:54 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52])
 by smtp.gmail.com with ESMTPSA id t24sm1597760edy.94.2020.03.25.09.04.53
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 09:04:53 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id a25so3889765wrd.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2020 09:04:53 -0700 (PDT)
X-Received: by 2002:a5d:4847:: with SMTP id n7mr4384732wrs.182.1585152292794; 
 Wed, 25 Mar 2020 09:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <20200325154702.GD28601@Air-de-Roger>
In-Reply-To: <20200325154702.GD28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 25 Mar 2020 10:04:16 -0600
X-Gmail-Original-Message-ID: <CABfawhnAgP=xek+28z=8r7=eawSARKangCw4rW0My+YmSJpGpw@mail.gmail.com>
Message-ID: <CABfawhnAgP=xek+28z=8r7=eawSARKangCw4rW0My+YmSJpGpw@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Mar 25, 2020 at 9:47 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> Sorry it has taken me a while to get to this.

Thanks for the review, I'm addressing all the items you noticed in the
next revision.

Tamas

