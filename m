Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E329100D2B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 21:32:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWneM-0007eK-0Y; Mon, 18 Nov 2019 20:29:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ULox=ZK=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1iWneK-0007eD-J0
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 20:29:28 +0000
X-Inumbo-ID: 1d15302e-0a42-11ea-adbe-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d15302e-0a42-11ea-adbe-bc764e2007e4;
 Mon, 18 Nov 2019 20:29:26 +0000 (UTC)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iWncA-0004H1-Vg; Mon, 18 Nov 2019 21:27:15 +0100
Date: Mon, 18 Nov 2019 21:27:12 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Qais Yousef <qais.yousef@arm.com>
In-Reply-To: <20191118160456.emdpzbhse2jxliqo@e107158-lin.cambridge.arm.com>
Message-ID: <alpine.DEB.2.21.1911182126260.27603@nanos.tec.linutronix.de>
References: <20191030153837.18107-1-qais.yousef@arm.com>
 <20191118160456.emdpzbhse2jxliqo@e107158-lin.cambridge.arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Subject: Re: [Xen-devel] [PATCH 00/12] Convert cpu_up/down to
 device_online/offline
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org,
 linux-ia64@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Richard Fontana <rfontana@redhat.com>, Nadav Amit <namit@vmware.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Eiichi Tsukata <devel@etsukata.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 xen-devel@lists.xenproject.org, Fenghua Yu <fenghua.yu@intel.com>,
 Juergen Gross <jgross@suse.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Pavankumar Kondeti <pkondeti@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, Steve Capper <steve.capper@arm.com>,
 Jiri Kosina <jkosina@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, Armijn Hemel <armijn@tjaldur.nl>,
 James Morse <james.morse@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxOCBOb3YgMjAxOSwgUWFpcyBZb3VzZWYgd3JvdGU6Cj4gSSBoYWQgdG8gbWFrZSBh
biBlZHVjYXRlZCBndWVzcyB0aGF0IHlvdSdyZSBwcm9iYWJseSB0aGUgJ21haW50YWluZXInIG9m
IGNwdQo+IGhvdHBsdWcgLSBidXQgdGhlcmUncyBubyBleHBsaWNpdCBlbnRyeSB0aGF0IHNheXMg
dGhhdC4gUGxlYXNlIGxldCBtZSBrbm93IGlmCj4gSSBuZWVkIHRvIGJyaW5nIHRoZSBhdHRlbnRp
b24gb2Ygb3RoZXJzIHRvby4KCjopCiAKPiBUaGUgc2VyaWVzIGRvIGhhdmUgZmV3IHJvdWdoIGVk
Z2VzIHRvIGFkZHJlc3MsIGJ1dCBpdCdzIHJlbGF0aXZlbHkKPiBzdHJhaWdodGZvcndhcmQgYW5k
IEkgdGhpbmsgZG9lcyBvZmZlciBhIG5pY2UgaW1wcm92ZW1lbnQgaW4gdGhlIGZvcm0gb2YKPiBj
b25zb2xpZGF0aW5nIHRoZSBBUEkgZm9yIGJyaW5naW5nIHVwL2Rvd24gY3B1cyBmcm9tIGV4dGVy
bmFsCj4gc3Vic3lzdGVtcy9kcml2ZXJzLiBCZXNpZGUgZml4IHRoZSBpbmNvbnNpc3RlbmN5IG9m
IGRldmljZSdzIGNvcmUgdmlldyBvZiB0aGUKPiBzdGF0ZSBvZiB0aGUgY3B1IHdoaWNoIGNhbiBo
YXBwZW4gd2hlbiBjcHVfe3VwL2Rvd259IGFyZSBjYWxsZWQgZGlyZWN0bHkuCj4gCj4gVGhlIGRv
d25zaWRlIEkgc2VlIGlzIHRoYXQgdGhlIGV4dGVybmFsIEFQSSB0byBicmluZyBjcHVzIHVwL2Rv
d24gZm9yCj4gc3VzcGVuZC9yZXN1bWUgYW5kIGF0IGJvb3Qgc2VlbSB0byBoYXZlIGdyb3duIGEg
Yml0IG9yZ2FuaWNhbGx5IChJJ3ZlIGFkZGVkCj4gYSBjb3VwbGUgaW4gdGhpcyBzZXJpZXMgdG8g
YWRkcmVzcyAyIGRpcmVjdCB1c2VycyBvZiBjcHVfe3VwLGRvd259KS4gV2UgbWlnaHQKPiBuZWVk
IHRvIHJldGhpbmsgdGhpcyBBUEksIGJ1dCBJIHRoaW5rIHRoaXMgaXMgb3V0c2lkZSB0aGUgc2Nv
cGUgb2YgdGhpcyBzZXJpZXMuCj4gCj4gQW55IHRob3VnaHRzL2ZlZWRiYWNrIHdvdWxkIGJlIGFw
cHJlY2lhdGVkLgoKTGV0IG1lIGhhdmUgYSBsb29rLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
