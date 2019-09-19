Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF41B8288
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 22:37:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB381-0005gt-9w; Thu, 19 Sep 2019 20:34:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pDhf=XO=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1iB37z-0005gm-50
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 20:34:11 +0000
X-Inumbo-ID: d57c6592-db1c-11e9-978d-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d57c6592-db1c-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 20:34:10 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l21so4953351lje.4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6grpKTdDHfrbCxCmgX04tALzM2BaTcUONJxBFtS7/lc=;
 b=S3FWlmtalm02jQyJlhwBVUyRbo4LVnG04lBW17Zh/rM24U46hU9edZ8kfmA06+aF9P
 OCDHQuGS85M+r15ZS8w8p2AuuOaxpYBIEy7/K399Ohz2kO+HjNMiBSjs53Jhs8Tayd30
 RhVK3wUpwCIOZyzj1b4OwhDrWT6ry27EnqdWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6grpKTdDHfrbCxCmgX04tALzM2BaTcUONJxBFtS7/lc=;
 b=kdAq3z0ks2d8h1ayY8uaEwnsPti9JeAcvsz2BXhr6twPcYCoy47Hhud8+gjQ6IpRd2
 9rueq5Bri26b+frwJxXYbbI5kDuiXUVsAOknAVvzbSoxFwCFcrThUWOxr5e5GMVbgmx0
 fZfFS5olCKPcs+3WrBNq0bcrQW63nYNOyo+IGf/bRklcf/yHDJ79k2ep3N5nyE5r+pps
 o19fPs7+tk7tOCNnm/pW9tL/TjW1N5958O6Bp/4HxPgg3roog7FEyF0UgCPLZ8gBnVbB
 3Xsl3fG9XYbvlUkyzdnlr0VuJjdXuPqxg2IWD8ovrwYD2jTaDdM1TCTmbRZzaRedGbyr
 kKfQ==
X-Gm-Message-State: APjAAAX4a1JvQJsBdU1xUnUNG2tbRk626xxS9VNebIRb4noXP9H6BCls
 Qm0s9jb8yZR5okKjlUlyYf94N3oZnTo=
X-Google-Smtp-Source: APXvYqyfo6T3BFVSA0nZ4nTzN33GJVmEs9f38vVD1DKSIfYfubDkHKYhtD7oEbmGfwQmEM1xWKtCRg==
X-Received: by 2002:a2e:1b56:: with SMTP id b83mr6483359ljb.107.1568925248613; 
 Thu, 19 Sep 2019 13:34:08 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id x15sm2050286lff.54.2019.09.19.13.34.07
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 13:34:07 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id r134so3325378lff.12
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2019 13:34:07 -0700 (PDT)
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr6102537lfp.61.1568925247160; 
 Thu, 19 Sep 2019 13:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190918152748.GA21241@infradead.org>
In-Reply-To: <20190918152748.GA21241@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Sep 2019 13:33:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjXF63BKNJH=GtnnoJmXZHEnRwjgeu4foJQvFYYBm9HHA@mail.gmail.com>
Message-ID: <CAHk-=wjXF63BKNJH=GtnnoJmXZHEnRwjgeu4foJQvFYYBm9HHA@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>
Subject: Re: [Xen-devel] [GIT PULL] dma-mapping updates for 5.4
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
Cc: xen-devel@lists.xenproject.org, iommu <iommu@lists.linux-foundation.org>,
 linux-mmc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgODoyNyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gcGxlYXNlIHB1bGwgdGhlIGRtYS1tYXBwaW5nIHVwZGF0
ZXMgZm9yIDUuNC4KClB1bGxlZC4KCj4gSW4gYWRkaXRpb24gdG8gdGhlIHVzdWFsIEtjb25maWcg
Y29uZmxpY3Mgd2hlcmUgeW91IGp1c3Qgd2FudCB0byBrZWVwCj4gYm90aCBlZGl0cyB0aGVyZSBh
cmUgYSBmZXcgbW9yZSBpbnRlcmVzdGluZyBtZXJnZSBpc3N1ZXMgdGhpcyB0aW1lOgo+Cj4gIC0g
bW9zdCBpbXBvcnRhbmx5IHBvd2VycGMgYW5kIG1pY3JvYmxhemUgYWRkIG5ldyBjYWxsZXJzIG9m
Cj4gICAgZG1hX2F0b21pY19wb29sX2luaXQsIHdoaWxlIHRoaXMgdHJlZSBtYXJrcyB0aGUgZnVu
Y3Rpb24gc3RhdGljCj4gICAgYW5kIGNhbGxzIGl0IGZyb20gYSBjb21tb24gcG9zdGNvcmVfaW5p
dGNhbGwoKS4gIFRoZSB0cml2aWFsCj4gICAgZnVuY3Rpb25zIGFkZGVkIGluIHBvd2VycGMgYW5k
IG1pY3JvYmxhemUgYWRkaW5nIHRoZSBjYWxscwo+ICAgIG5lZWQgdG8gYmUgcmVtb3ZlZCBmb3Ig
dGhlIGNvZGUgdG8gY29tcGlsZS4gIFRoaXMgd2lsbCBub3Qgc2hvdyB1cAo+ICAgIGFzIGEgbWVy
Z2UgY29uZmxpY3QgYW5kIG5lZWRzIHRvIGJlIGRlYWx0IHdpdGggbWFudWFsbHkhCgpTbyBJIGhh
dmVuJ3QgZ290dGVuIHRoZSBwb3dlcnBjIG9yIG1pY3JvYmxhemUgcHVsbCByZXF1ZXN0cyB5ZXQs
IHNvCkknbSBub3QgYWJsZSB0byBmaXggdGhhdCBwYXJ0IHVwIHlldC4KCkludGVhZCwgSSdtIGNj
J2luZyBNaWNoYWVsIEVsbGVybWFuIGFuZCBNaWNoYWwgU2ltZWsgdG8gYXNrIHRoZW0gdG8KcmVt
aW5kIG1lIHdoZW4gdGhleSBfZG9fIHNlbmQgdGhvc2UgcHVsbCByZXF1ZXN0cywgc2luY2Ugb3Ro
ZXJ3aXNlIEkKbWF5IHdlbGwgZm9yZ2V0IGFuZCBtaXNzIGl0LiBXaXRob3V0IGFuIGFjdHVhbCBk
YXRhIGNvbmZsaWN0LCBhbmQKc2luY2UgdGhpcyB3b24ndCBzaG93IHVwIGluIG15IGJ1aWxkIHRl
c3RzIGVpdGhlciwgaXQgd291bGQgYmUgdmVyeQplYXN5IGZvciBtZSB0byBmb3JnZXQuCgpNaWNo
YVtlXWwsIGNhbiB5b3UgYm90aCBwbGVhc2UgbWFrZSBzdXJlIHRvIHJlbWluZCBtZT8KCiAgICAg
ICAgICAgICBMaW51cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
