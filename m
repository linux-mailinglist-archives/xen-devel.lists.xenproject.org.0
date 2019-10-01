Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19960C2B77
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 03:01:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF6TR-0001af-09; Tue, 01 Oct 2019 00:57:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iF6TP-0001aY-A1
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 00:57:03 +0000
X-Inumbo-ID: 6132228a-e3e6-11e9-b588-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 6132228a-e3e6-11e9-b588-bc764e2007e4;
 Tue, 01 Oct 2019 00:57:02 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C384620815;
 Tue,  1 Oct 2019 00:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569891422;
 bh=YtbGCTJFAP7M2ldWYEYA+OEhhMT3RxJ4jKu6zKxLAgo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=LaX3xoxxgCqZTpNQto81wxvn8k3DUnb326+7aSMuhjo0SfKa2RZGv0WoO/DM7rK31
 wwd3s7Txic+ll9cd1IARr1aAFAhDpjrtByxOL6PO42YkgAC57pZDAcN0ex75aPTzV+
 dmfl6atx+5dks6SGdSMyFtqTxydhP7e25nZfiFkQ=
Date: Mon, 30 Sep 2019 17:57:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <3a7baeaa-6276-a9f0-b876-d44996dd9f3f@citrix.com>
Message-ID: <alpine.DEB.2.21.1909301755030.2594@sstabellini-ThinkPad-T480s>
References: <20190930184425.13756-1-julien.grall@arm.com>
 <3a7baeaa-6276-a9f0-b876-d44996dd9f3f@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2106190020-1569891422=:2594"
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm32: head: Fix build when
 using GAS 2.25.0
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2106190020-1569891422=:2594
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 30 Sep 2019, Andrew Cooper wrote:
> On 30/09/2019 19:44, Julien Grall wrote:
> > GAS 2.25.0 throws multiple errors when building arm32/head.S:
> >
> > arm32/head.S: Assembler messages:
> > arm32/head.S:452: Error: invalid constant (f7f) after fixup
> > arm32/head.S:453: Error: invalid constant (f7f) after fixup
> > arm32/head.S:495: Error: invalid constant (f7f) after fixup
> > arm32/head.S:510: Error: invalid constant (f7f) after fixup
> > arm32/head.S:514: Error: invalid constant (f7f) after fixup
> > arm32/head.S:516: Error: invalid constant (f7f) after fixup
> > arm32/head.S:633: Error: invalid constant (f7f) after fixup
> >
> > This makes sense because the instruction mov is only able to deal with a
> > specific set of immediate (see "modified immediate constants in ARM
> > instructions"). For any 16-bit immediate, the instruction movw should be
> > used.
> >
> > It looks like newer version of GAS will seemly switch to movw if the
> > immediate does not fit in the immediate encoding for mov. But we should
> > not rely on this. So switch to movw.
> >
> > Fixes: 23dfe48d10 ("xen/arm32: head: Introduce macros to create table and mapping entry")
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Julien Grall <julien.grall@arm.com>
> 
> FWIW, Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>, only insofar
> as it fixing the build.  I haven't booted the resulting binary.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Given that this is a straightforward build fix, and due to timezone
differences, I have committed it (after verifying it fixes the build
myself). I hope that Juergen approves.
--8323329-2106190020-1569891422=:2594
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2106190020-1569891422=:2594--

