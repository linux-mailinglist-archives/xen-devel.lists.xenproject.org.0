Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F0474542
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 15:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246790.425598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx8uv-0006KK-K2; Tue, 14 Dec 2021 14:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246790.425598; Tue, 14 Dec 2021 14:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx8uv-0006I1-EO; Tue, 14 Dec 2021 14:36:33 +0000
Received: by outflank-mailman (input) for mailman id 246790;
 Tue, 14 Dec 2021 14:36:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q7Ra=Q7=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mx8uu-0006Ht-0M
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 14:36:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38da17e6-5ceb-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 15:36:29 +0100 (CET)
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
X-Inumbo-ID: 38da17e6-5ceb-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639492589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/0+e9Kdg+aIpKoqaM6bidD6aLWE/lEe9a5+cvl4+vyE=;
  b=Hz9nf+VSKS8V4igWTfGl8rDyozYjtCU2Zvw2a4VMV8TLB8MhBVHAnIuQ
   BbLRJG/utgOwzrbMEdcACqfFT0EwLB4cIEkI+PkhvlStoHfAH5x80kY/z
   8Ts1Cf0TGbNgvOyzQSfidHKecgYTShR84Nv1VLiT6oe6kA8Ob2x7lLWiH
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MGYQiKU6xxh+adcH0F47ohHqOlmYoQyo2gKxXFcOOo7z5YdrTarsvjyLGfl+h/jN8Oj5YW3/D3
 cS4o3W3mpqAkgKVdCH6WTmBZ6SCtF7lsvnm2ednjb+gesDhktISrvGHWuFWeCPMq8EuPPb9x1f
 uzBd7hUPxa7NsBaVDSAm2yxzNIP6YY/TWf8aEtV+G/yVlewprsjs/5x/dM4EolKyJcAZXhl51E
 sXcO+MYQhQ80PZglgryEcx5A65Dt1ikoYVYgiUjADWTtw89V5HrZkDRC0vRBUoHJuju1qlfUpV
 hi7seSAXVlyXbA53bMIXuC6V
X-SBRS: 5.1
X-MesageID: 59982327
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Kj/246jEhNbk/5iQ4uGKP0lJX161oxcKZh0ujC45NGQN5FlHY01je
 htvWzvXb/2DNDHwcop0a4myphxQ7cDQmtI3GQc+pSExQnwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rg29Qx3YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /18iKThEAQKNZaSiftAQwsJPGJ/IoFJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauPN
 ppDMmAwBPjGS0dEYXFGMLsxoOKpryb8URxylFKFn6VitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRAB4AM8eE4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc+ttK7xj6yKG8fTF/FuJFDkrDT9eRNNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D4gbQ4xawZRGp8crVnl
 CJb8yR5xLpRZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxY1aJ9cJGG2M
 R+7VeZtCHl7ZiTCgUhfOd3ZNijX5fK4SYSNug78MLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFMiT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI+cElJNhMb6epJl1VNk/sHm+HW0
 Gu6X0MEmlPziWeecVeBa2x5aaOpVpF69CppMSspNFeu+n4ifYfws/tPK8ppJeEqpL550Pp5b
 /gZYMHcUP5BfSvKpmYGZp7noY08KBny3VCSPzCoaSQUdoJ7Q1Cb4cftewbirXFcDie+ucYkj
 aen0wfXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEyalDWA1
 guQDRMJnsX3otc4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKkQoYs4d4FLo3n6sy68G2+u1fxwVgWn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0aBGkzbf2v05PUHm6XIl57GAS0hTY0GBhSE1wGGZ62/5L
 TPNYPIr1jE=
IronPort-HdrOrdr: A9a23:DKu/7aFIaW6Uk3ENpLqE6seALOsnbusQ8zAXP0AYc31om+ij5q
 eTdZUgpHvJYVkqNE3I9eruBEDEewK7yXcX2/h1AV7BZniEhILAFugLhuGO/9SjIVydygc079
 YYT0EUMr3N5DZB4/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="59982327"
Date: Tue, 14 Dec 2021 14:36:23 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/libs: Don't recursively expand MAJOR ?= $(shell
 ...)
Message-ID: <Ybir5x3AaHYqanwN@perard>
References: <20211213190449.4830-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211213190449.4830-1-andrew.cooper3@citrix.com>

On Mon, Dec 13, 2021 at 07:04:49PM +0000, Andrew Cooper wrote:
> ?= is a deferred assignment.  Switch to an alternative form which lets us use
> an immediate assignment.
> 
> Before, version.sh gets run anywhere between 46 and 88 times, with 50 on a
> `clean`.  After, 6 times, invariant of main rune, and whether it is an

Instead of just 6, you probably mean between 6 and 12 times,
"make clean; make; make", the last make would run version.sh 12 times.

> incremental build or not.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

