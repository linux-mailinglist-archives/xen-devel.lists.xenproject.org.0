Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834EC157B79
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 14:30:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j196f-0007F1-C0; Mon, 10 Feb 2020 13:28:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7/Y4=36=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1j196d-0007Ek-T0
 for xen-devel@lists.xen.org; Mon, 10 Feb 2020 13:28:07 +0000
X-Inumbo-ID: 2bfbdad0-4c09-11ea-b4bd-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2bfbdad0-4c09-11ea-b4bd-12813bfff9fa;
 Mon, 10 Feb 2020 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581341287;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=opbvteBDcQt8TMq05Xoco2FvwOxB7xQFs3oCBwqLCAg=;
 b=RGgk3lkRH2E0BmzV/lkt1ItWxNa8nr+rZW6tOVcY0n6sVWwd/CQvpsa9
 UFMx4ZPQDXLEmSVke90etWlEurcOcJq3rUE1virvYzkIB/pzgL2VnnbiM
 fWlcZ2D+Q1ogKIedkLZEWoaLBhtBm2FTOGxpMWAi9yRePKMyP3YB+laT4 Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v27w17BgUeGjtp/rl+JvfJKbl+EaZoEoDjOXy+AxgNKoUVuR3HsBp3/YwqB9C4hhsfHfEiE5R8
 Whp2yvSJsJIZGHYa4NCcKw23XExw6bKzW3EMqZcR6rU8AvrEaseHho+J2sSxsiS3elFH0s0Ja0
 soe8U2ZuKnE5dtm/45/ysKOJjCySAWU8mJCVOf8aabf41Wa/kPUnRQlQDPiBOOUdHjg0MfKRgb
 h5R+0CQLPMCQ0uAK1uf+ztaHPEZ1AYc+pLaw6b6CVKL34Mz9s6NHWfx0Vt1uvPZ6aSMvam2HSV
 csE=
X-SBRS: 2.7
X-MesageID: 12569220
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12569220"
To: David Miller <davem@davemloft.net>
References: <20200207142652.670-1-sergey.dyasli@citrix.com>
 <20200207142652.670-5-sergey.dyasli@citrix.com>
 <20200207.153630.1432371073271757175.davem@davemloft.net>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <db55bbec-e685-e3b6-638a-3d707d8892c0@citrix.com>
Date: Mon, 10 Feb 2020 13:27:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207.153630.1432371073271757175.davem@davemloft.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/4] xen/netback: fix grant copy across
 page boundary
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
Cc: jgross@suse.com,
 "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 wei.liu@kernel.org, sstabellini@kernel.org, ross.lagerwall@citrix.com,
 netdev@vger.kernel.org, george.dunlap@citrix.com, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, xen-devel@lists.xen.org, paul@xen.org,
 linux-mm@kvack.org, glider@google.com, aryabinin@virtuozzo.com,
 boris.ostrovsky@oracle.com, akpm@linux-foundation.org, dvyukov@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDIvMjAyMCAxNDozNiwgRGF2aWQgTWlsbGVyIHdyb3RlOgo+IEZyb206IFNlcmdleSBE
eWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPiBEYXRlOiBGcmksIDcgRmViIDIwMjAg
MTQ6MjY6NTIgKzAwMDAKPgo+PiBGcm9tOiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxA
Y2l0cml4LmNvbT4KPj4KPj4gV2hlbiBLQVNBTiAob3IgU0xVQl9ERUJVRykgaXMgdHVybmVkIG9u
LCB0aGVyZSBpcyBhIGhpZ2hlciBjaGFuY2UgdGhhdAo+PiBub24tcG93ZXItb2YtdHdvIGFsbG9j
YXRpb25zIGFyZSBub3QgYWxpZ25lZCB0byB0aGUgbmV4dCBwb3dlciBvZiAyIG9mCj4+IHRoZSBz
aXplLiBUaGVyZWZvcmUsIGhhbmRsZSBncmFudCBjb3BpZXMgdGhhdCBjcm9zcyBwYWdlIGJvdW5k
YXJpZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2Fs
bEBjaXRyaXguY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlh
c2xpQGNpdHJpeC5jb20+Cj4+IEFja2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4K
Pgo+IFRoaXMgaXMgcGFydCBvZiBhIGxhcmdlciBwYXRjaCBzZXJpZXMgdG8gd2hpY2ggbmV0ZGV2
IHdhcyBub3QgQ0M6J2QKPgo+IFdoZXJlIGlzIHRoaXMgcGF0Y2ggdGFyZ2V0dGVkIHRvIGJlIGFw
cGxpZWQ/Cj4KPiBEbyB5b3UgZXhwZWN0IGEgbmV0d29ya2luZyBBQ0sgb24gdGhpcz8KPgo+IFBs
ZWFzZSBkbyBub3Qgc3VibWl0IHBhdGNoZXMgaW4gc3VjaCBhbiBhbWJpZ3VvdXMgbWFubmVyIGxp
a2UgdGhpcwo+IGluIHRoZSBmdXR1cmUsIHRoYW5rIHlvdS4KClBsZWFzZSBzZWUgdGhlIGZvbGxv
d2luZyBmb3IgbW9yZSBjb250ZXh0OgoKICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LW1tLzIwMjAwMTIyMTQwNTEyLnp4dGxkNXNhbm9ocG1ndDJAZGViaWFuLwoKU29ycnkgZm9yIG5v
dCBwcm92aWRpbmcgZW5vdWdoIGNvbnRleHQgd2l0aCB0aGlzIHN1Ym1pc3Npb24uCgotLQpUaGFu
a3MsClNlcmdleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
