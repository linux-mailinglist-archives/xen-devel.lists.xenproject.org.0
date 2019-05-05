Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2914211
	for <lists+xen-devel@lfdr.de>; Sun,  5 May 2019 21:15:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNMZP-0002QN-3c; Sun, 05 May 2019 19:13:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U2sm=TF=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1hNMZM-0002QI-Ua
 for xen-devel@lists.xenproject.org; Sun, 05 May 2019 19:13:04 +0000
X-Inumbo-ID: cc1a9394-6f69-11e9-be35-d358d9198799
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc1a9394-6f69-11e9-be35-d358d9198799;
 Sun, 05 May 2019 19:13:00 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 381AC206DF;
 Sun,  5 May 2019 19:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557083579;
 bh=vFRleH5x3XYIjIaPO4Mdt89X8FFdmsfdaCjM+ZfIqLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kFTP1rZGukRBFgJTmJg4OBBHtq9UuvpfpWszjrmZyEUqsQGiJNtapxDFs94sWPUHS
 CyOoAMbcMgWppgcu1SF+7XgwqTcASCOoPMMoONcPTBbmsmEEEcpeWYX26QGj9vj3ef
 +6ACtal3eByCJwnZfCJBZ8VMTmMD+rh1+fIFEKMk=
Date: Sun, 5 May 2019 15:12:58 -0400
From: Sasha Levin <sashal@kernel.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20190505191258.GB1747@sasha-vm>
References: <20190503150401.15904-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190503150401.15904-1-roger.pau@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] xen-blkfront: switch kcalloc to kvcalloc
 for large array allocation
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
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDU6MDQ6MDFQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+VGhlcmUncyBubyByZWFzb24gdG8gcmVxdWVzdCBwaHlzaWNhbGx5IGNvbnRpZ3Vv
dXMgbWVtb3J5IGZvciB0aG9zZQo+YWxsb2NhdGlvbnMuCj4KPlJlcG9ydGVkLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4KPlNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+LS0tCgpZb3UgcmVhbGx5IGRvbid0IHdhbnQg
dGhpcyBzY2lzc29yIGxpbmUgaGVyZSwgZ2l0IHdpbGwgdHJpbSBhbGwgeW91cgptZXNzYWdlIGNv
bnRlbnQgYmVsb3cgaXQuCgotLQpUaGFua3MsClNhc2hhCgo+Q2M6IEJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj5DYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgo+Q2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
PkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj5DYzog
SmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPgo+Q2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+Q2M6IGxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZwo+Q2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKPi0tLQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
