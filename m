Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72961008DE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 17:06:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWjWb-0007wC-BC; Mon, 18 Nov 2019 16:05:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NjXz=ZK=arm.com=qais.yousef@srs-us1.protection.inumbo.net>)
 id 1iWjWa-0007w7-E4
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 16:05:12 +0000
X-Inumbo-ID: 2fe4a3d0-0a1d-11ea-b678-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2fe4a3d0-0a1d-11ea-b678-bc764e2007e4;
 Mon, 18 Nov 2019 16:05:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA4C0DA7;
 Mon, 18 Nov 2019 08:05:05 -0800 (PST)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EA623F703;
 Mon, 18 Nov 2019 08:04:59 -0800 (PST)
Date: Mon, 18 Nov 2019 16:04:56 +0000
From: Qais Yousef <qais.yousef@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20191118160456.emdpzbhse2jxliqo@e107158-lin.cambridge.arm.com>
References: <20191030153837.18107-1-qais.yousef@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030153837.18107-1-qais.yousef@arm.com>
User-Agent: NeoMutt/20171215
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Richard Fontana <rfontana@redhat.com>, Nadav Amit <namit@vmware.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Eiichi Tsukata <devel@etsukata.com>, Catalin Marinas <catalin.marinas@arm.com>,
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
 Sakari Ailus <sakari.ailus@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGhvbWFzCgpPbiAxMC8zMC8xOSAxNTozOCwgUWFpcyBZb3VzZWYgd3JvdGU6Cj4gVXNpbmcg
Y3B1X3VwL2Rvd24gZGlyZWN0bHkgdG8gYnJpbmcgY3B1cyBvbmxpbmUvb2ZmbGluZSBsb3NlcyBz
eW5jaHJvbml6YXRpb24KPiB3aXRoIHN5c2ZzIGFuZCBjb3VsZCBzdWZmZXIgZnJvbSBhIHJhY2Ug
c2ltaWxhciB0byB3aGF0IGlzIGRlc2NyaWJlZCBpbgo+IGNvbW1pdCBhNjcxN2MwMWRkYzIgKCJw
b3dlcnBjL3J0YXM6IHVzZSBkZXZpY2UgbW9kZWwgQVBJcyBhbmQgc2VyaWFsaXphdGlvbgo+IGR1
cmluZyBMUE0iKS4KPiAKPiBjcHVfdXAvZG93biBzZWVtIHRvIGJlIG1vcmUgb2YgYSBpbnRlcm5h
bCBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgZm9yIHRoZSBjcHUKPiBzdWJzeXN0ZW0gdG8gdXNlIHRv
IGJvb3QgdXAgY3B1cywgcGVyZm9ybSBzdXNwZW5kL3Jlc3VtZSBhbmQgbG93IGxldmVsIGhvdHBs
dWcKPiBvcGVyYXRpb25zLiBVc2VycyBvdXRzaWRlIG9mIHRoZSBjcHUgc3Vic3lzdGVtIHdvdWxk
IGJlIGJldHRlciB1c2luZyB0aGUgZGV2aWNlCj4gY29yZSBBUEkgdG8gYnJpbmcgYSBjcHUgb25s
aW5lL29mZmxpbmUgd2hpY2ggaXMgdGhlIGludGVyZmFjZSB1c2VkIHRvIGhvdHBsdWcKPiBtZW1v
cnkgYW5kIG90aGVyIHN5c3RlbSBkZXZpY2VzLgo+IAo+IFNldmVyYWwgdXNlcnMgaGF2ZSBhbHJl
YWR5IG1pZ3JhdGVkIHRvIHVzZSB0aGUgZGV2aWNlIGNvcmUgQVBJLCB0aGlzIHNlcmllcwo+IGNv
bnZlcnRzIHRoZSByZW1haW5pbmcgdXNlcnMgYW5kIGhpZGVzIGNwdV91cC9kb3duIGZyb20gaW50
ZXJuYWwgdXNlcnMgYXQgdGhlCj4gZW5kLgo+IAo+IEkgc3RpbGwgbmVlZCB0byB1cGRhdGUgdGhl
IGRvY3VtZW50YXRpb24gdG8gcmVtb3ZlIHJlZmVyZW5jZXMgdG8gY3B1X3VwL2Rvd24KPiBhbmQg
YWR2b2NhdGUgZm9yIGRldmljZV9vbmxpbmUvb2ZmbGluZSBpbnN0ZWFkIGlmIHRoaXMgc2VyaWVz
IHdpbGwgbWFrZSBpdHMgd2F5Cj4gdGhyb3VnaC4KPiAKPiBJIG5vdGljZWQgdGhpcyBwcm9ibGVt
IHdoaWxlIHdvcmtpbmcgb24gYSBoYWNrIHRvIGRpc2FibGUgb2ZmbGluaW5nCj4gYSBwYXJ0aWN1
bGFyIENQVSBidXQgbm90aWNlZCB0aGF0IHNldHRpbmcgdGhlIG9mZmxpbmVfZGlzYWJsZWQgYXR0
cmlidXRlIGluIHRoZQo+IGRldmljZSBzdHJ1Y3QgaXNuJ3QgZW5vdWdoIGJlY2F1c2UgdXNlcnMg
Y2FuIGVhc2lseSBieXBhc3MgdGhlIGRldmljZSBjb3JlLgo+IFdoaWxlIG15IGhhY2sgaXNuJ3Qg
YSB2YWxpZCB1c2UgY2FzZSBidXQgaXQgZGlkIGhpZ2hsaWdodCB0aGUgaW5jb25zaXN0ZW5jeSBp
bgo+IHRoZSB3YXkgY3B1cyBhcmUgYmVpbmcgb25saW5lZC9vZmZsaW5lZCBhbmQgdGhpcyBhdHRl
bXB0IGhvcGVmdWxseSBpbXByb3ZlcyBvbgo+IHRoaXMuCj4gCj4gVGhlIGZpcnN0IDYgcGF0Y2hl
cyBmaXhlcyBhcmNoIHVzZXJzLgo+IAo+IFRoZSBuZXh0IDUgcGF0Y2hlcyBmaXhlcyBnZW5lcmlj
IGNvZGUgdXNlcnMuIFBhcnRpY3VsYXJseSBjcmVhdGluZyBhIG5ldwo+IHNwZWNpYWwgZXhwb3J0
ZWQgQVBJIGZvciB0aGUgZGV2aWNlIGNvcmUgdG8gdXNlIGluc3RlYWQgb2YgY3B1X3VwL2Rvd24u
Cj4gTWF5YmUgd2UgY2FuIGRvIHNvbWV0aGluZyBtb3JlIHJlc3RyaWN0aXZlIHRoYW4gdGhhdC4K
PiAKPiBUaGUgbGFzdCBwYXRjaCByZW1vdmVzIGNwdV91cC9kb3duIGZyb20gY3B1LmggYW5kIHVu
ZXhwb3J0IHRoZSBmdW5jdGlvbnMuCj4gCj4gSW4gc29tZSBjYXNlcyB3aGVyZSB0aGUgdXNlIG9m
IGNwdV91cC9kb3duIHNlZW1lZCBsZWdpdGltYXRlLCBJIGVuY2Fwc3VsYXRlZAo+IHRoZSBsb2dp
YyBpbiBhIGhpZ2hlciBsZXZlbCAtIHNwZWNpYWwgcHVycG9zZWQgZnVuY3Rpb247IGFuZCBjb252
ZXJ0ZWQgdGhlIGNvZGUKPiB0byB1c2UgdGhhdCBpbnN0ZWFkLgo+IAo+IEkgZGlkIHJ1biB0aGUg
cmN1IHRvcnR1cmUsIGxvY2sgdG9ydHVyZSBhbmQgcHNjaSBjaGVja2VyIHRlc3RzIGFuZCBubyBw
cm9ibGVtCj4gd2FzIG5vdGljZWQuIEkgZGlkIHBlcmZvcm0gYnVpbGQgdGVzdHMgb24gYWxsIGFy
Y2ggYWZmZWN0ZWQgZXhjZXB0IGZvciBwYXJpc2MuCj4gCj4gSG9wZWZ1bGx5IEkgZ290IHRoZSBD
QyBsaXN0IHJpZ2h0IGZvciBhbGwgdGhlIHBhdGNoZXMuIEFwb2xvZ2llcyBpbiBhZHZhbmNlIGlm
Cj4gc29tZSBwZW9wbGUgd2VyZSBvbWl0dGVkIGZyb20gc29tZSBwYXRjaGVzIGJ1dCB0aGV5IHNo
b3VsZCBoYXZlIGJlZW4gQ0NlZC4KCkkgaGFkIHRvIG1ha2UgYW4gZWR1Y2F0ZWQgZ3Vlc3MgdGhh
dCB5b3UncmUgcHJvYmFibHkgdGhlICdtYWludGFpbmVyJyBvZiBjcHUKaG90cGx1ZyAtIGJ1dCB0
aGVyZSdzIG5vIGV4cGxpY2l0IGVudHJ5IHRoYXQgc2F5cyB0aGF0LiBQbGVhc2UgbGV0IG1lIGtu
b3cgaWYKSSBuZWVkIHRvIGJyaW5nIHRoZSBhdHRlbnRpb24gb2Ygb3RoZXJzIHRvby4KClRoZSBz
ZXJpZXMgZG8gaGF2ZSBmZXcgcm91Z2ggZWRnZXMgdG8gYWRkcmVzcywgYnV0IGl0J3MgcmVsYXRp
dmVseQpzdHJhaWdodGZvcndhcmQgYW5kIEkgdGhpbmsgZG9lcyBvZmZlciBhIG5pY2UgaW1wcm92
ZW1lbnQgaW4gdGhlIGZvcm0gb2YKY29uc29saWRhdGluZyB0aGUgQVBJIGZvciBicmluZ2luZyB1
cC9kb3duIGNwdXMgZnJvbSBleHRlcm5hbApzdWJzeXN0ZW1zL2RyaXZlcnMuIEJlc2lkZSBmaXgg
dGhlIGluY29uc2lzdGVuY3kgb2YgZGV2aWNlJ3MgY29yZSB2aWV3IG9mIHRoZQpzdGF0ZSBvZiB0
aGUgY3B1IHdoaWNoIGNhbiBoYXBwZW4gd2hlbiBjcHVfe3VwL2Rvd259IGFyZSBjYWxsZWQgZGly
ZWN0bHkuCgpUaGUgZG93bnNpZGUgSSBzZWUgaXMgdGhhdCB0aGUgZXh0ZXJuYWwgQVBJIHRvIGJy
aW5nIGNwdXMgdXAvZG93biBmb3IKc3VzcGVuZC9yZXN1bWUgYW5kIGF0IGJvb3Qgc2VlbSB0byBo
YXZlIGdyb3duIGEgYml0IG9yZ2FuaWNhbGx5IChJJ3ZlIGFkZGVkCmEgY291cGxlIGluIHRoaXMg
c2VyaWVzIHRvIGFkZHJlc3MgMiBkaXJlY3QgdXNlcnMgb2YgY3B1X3t1cCxkb3dufSkuIFdlIG1p
Z2h0Cm5lZWQgdG8gcmV0aGluayB0aGlzIEFQSSwgYnV0IEkgdGhpbmsgdGhpcyBpcyBvdXRzaWRl
IHRoZSBzY29wZSBvZiB0aGlzIHNlcmllcy4KCkFueSB0aG91Z2h0cy9mZWVkYmFjayB3b3VsZCBi
ZSBhcHByZWNpYXRlZC4KClRoYW5rcwoKLS0KUWFpcyBZb3VzZWYKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
