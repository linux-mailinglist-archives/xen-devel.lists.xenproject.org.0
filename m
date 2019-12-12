Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F2311D0F6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 16:26:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifQJN-0006o3-An; Thu, 12 Dec 2019 15:23:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EVwC=2C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ifQJL-0006ny-KI
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 15:23:27 +0000
X-Inumbo-ID: 56ea9438-1cf3-11ea-8d8c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56ea9438-1cf3-11ea-8d8c-12813bfff9fa;
 Thu, 12 Dec 2019 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576164205;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gYDKEote6nZzfFtY/B3Bt+4wk/QQ/K5SQUNQRMsAuMQ=;
 b=ZcTUWzLSvcFfsmLDpTv5jTuCGOcg8IsBcYAmtKB9skvorLs6Y+3rfm1d
 EnGpX4kwNskRTCS43BWBsrUVYDNK0H3ccjB4fmGP0G7+1urlY0AKlE632
 aciABWDMAd300FWFX005/JoMnoTdphfyqlhWoiFQONCMZKQYFEQu3XkDR c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZNyWCsM6N4/1gv+dV4ixDqV1rHhYuMm/H7nbvJT3hnqx/dL+UwTZMgz7Ce5hwJL4RZX2UnyI+y
 SJITAIwvJR3i/CjdodxZ49Lh4pWTcQC/SGRwMz8Hxd+u0bGCIvvI2am3YIGJyp4Ljcjb23n5yT
 +LblLtgyjvnRbFs8q21cjJ4jiMwTJ2Nm+Xvh6drEkrXUQTeUlBlHd1FrD6TqklMibsZSFzCUDw
 bqu8OPqOH0iwIlOZhbggjEEYDXU9oK0IUN5TH+exjyJ1PMOipAwy8PjM58PrtyJERFue9+SH8W
 teA=
X-SBRS: 2.7
X-MesageID: 10008666
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; d="scan'208";a="10008666"
Date: Thu, 12 Dec 2019 16:23:17 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sj38.park@gmail.com>
Message-ID: <20191212152317.GE11756@Air-de-Roger>
References: <20191212114247.GB11756@Air-de-Roger>
 <20191212133905.462-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212133905.462-1-sj38.park@gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v7 2/3] xen/blkback: Squeeze page pools if a
 memory pressure is detected
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
Cc: jgross@suse.com, axboe@kernel.dk, sjpark@amazon.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgMDI6Mzk6MDVQTSArMDEwMCwgU2VvbmdKYWUgUGFyayB3
cm90ZToKPiBPbiBUaHUsIDEyIERlYyAyMDE5IDEyOjQyOjQ3ICswMTAwICJSb2dlciBQYXUgTW9u
bsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gPiBPbiB0aGUgc2xvdyBibG9j
ayBkZXZpY2UKPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+IAo+ID4gPiAgICAg
bWF4X3BncyAgIE1pbiAgICAgICBNYXggICAgICAgTWVkaWFuICAgICBBdmcgICAgU3RkZGV2Cj4g
PiA+ICAgICAwICAgICAgICAgMzguNyAgICAgIDQ1LjggICAgICAzOC43ICAgICAgIDQwLjEyICAz
LjE3NTIxNjUKPiA+ID4gICAgIDEwMjQgICAgICAzOC43ICAgICAgNDUuOCAgICAgIDM4LjcgICAg
ICAgNDAuMTIgIDMuMTc1MjE2NQo+ID4gPiAgICAgTm8gZGlmZmVyZW5jZSBwcm92ZW4gYXQgOTUu
MCUgY29uZmlkZW5jZQo+ID4gPiAKPiA+ID4gT24gdGhlIGZhc3QgYmxvY2sgZGV2aWNlCj4gPiA+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiAKPiA+ID4gICAgIG1heF9wZ3MgICBNaW4g
ICAgICAgTWF4ICAgICAgIE1lZGlhbiAgICAgQXZnICAgIFN0ZGRldgo+ID4gPiAgICAgMCAgICAg
ICAgIDQxNyAgICAgICA0MjMgICAgICAgNDIwICAgICAgICA0MTkuNCAgMi41MDk5ODAxCj4gPiA+
ICAgICAxMDI0ICAgICAgNDE0ICAgICAgIDQyNSAgICAgICA0MTYgICAgICAgIDQxNy44ICA0LjQz
ODQ2ODIKPiA+ID4gICAgIE5vIGRpZmZlcmVuY2UgcHJvdmVuIGF0IDk1LjAlIGNvbmZpZGVuY2UK
PiA+IAo+ID4gVGhpcyBpcyBpbnRyaWd1aW5nLCBhcyBpdCBzZWVtcyB0byBwcm92ZSB0aGF0IHRo
ZSB1c2FnZSBvZiBhIGNhY2hlIG9mCj4gPiBmcmVlIHBhZ2VzIGlzIGlycmVsZXZhbnQgcGVyZm9y
bWFuY2Ugd2lzZS4KPiA+IAo+ID4gVGhlIHBvb2wgb2YgZnJlZSBwYWdlcyB3YXMgaW50cm9kdWNl
ZCBsb25nIGFnbywgYW5kIGl0J3MgcG9zc2libGUgdGhhdAo+ID4gcmVjZW50IGltcHJvdmVtZW50
cyB0byB0aGUgYmFsbG9vbiBkcml2ZXIgaGFkIG1hZGUgc3VjaCBwb29sIHVzZWxlc3MsCj4gPiBh
dCB3aGljaCBwb2ludCBpdCBjb3VsZCBiZSByZW1vdmVkIGluc3RlYWQgb2Ygd29ya2VkIGFyb3Vu
ZC4KPiAKPiBJIGd1ZXNzIHRoZSBncmFudCBwYWdlIGFsbG9jYXRpb24gb3ZlcmhlYWQgaW4gdGhp
cyB0ZXN0IHNjZW5hcmlvIGlzIHJlYWxseQo+IHNtYWxsLiAgSW4gYW4gYWJzZW5jZSBvZiBtZW1v
cnkgcHJlc3N1cmUsIGZyYWdtZW50YXRpb24sIGFuZCBOVU1BIGltYmFsYW5jZSwKPiB0aGUgbGF0
ZW5jeSBvZiB0aGUgcGFnZSBhbGxvY2F0aW9uICgnZ2V0X3BhZ2UoKScpIGlzIHZlcnkgc2hvcnQs
IGFzIGl0IHdpbGwKPiBzdWNjZXNzIGluIHRoZSBmYXN0IHBhdGguCgpUaGUgYWxsb2NhdGlvbiBv
ZiB0aGUgcG9vbCBvZiBmcmVlIHBhZ2VzIGludm9sdmVzIG1vcmUgdGhhbiBnZXRfcGFnZSwKaXQg
dXNlcyBnbnR0YWJfYWxsb2NfcGFnZXMgd2hpY2ggaW4gdGhlIHdvcnNlIGNhc2Ugd2lsbCBhbGxv
Y2F0ZSBhCnBhZ2UgYW5kIGJhbGxvb24gaXQgb3V0IGlzc3Vpbmcgb25lIGh5cGVyY2FsbC4KCj4g
RmV3IHllYXJzIGFnbywgSSBvbmNlIG1lYXN1cmVkIHRoZSBwYWdlIGFsbG9jYXRpb24gbGF0ZW5j
eSBvbiBteSBtYWNoaW5lLgo+IFJvdWdobHkgc3BlYWtpbmcsIGl0IHdhcyBhYm91dCAxdXMgaW4g
YmVzdCBjYXNlLCAxMDB1cyBpbiB3b3JzdCBjYXNlLCBhbmQgNXVzCj4gaW4gYXZlcmFnZS4gIFBs
ZWFzZSBrZWVwIGluIG1pbmQgdGhhdCB0aGUgbWVhc3VyZW1lbnQgd2FzIG5vdCBkZXNpZ25lZCBh
bmQKPiBwZXJmb3JtZWQgaW4gc2VyaW91cyB3YXkuICBUaHVzIHRoZSByZXN1bHRzIGNvdWxkIGhh
dmUgcHJvZmlsZSBvdmVyaGVhZCBpbiBpdCwKPiB0aG91Z2guICBXaGlsZSBrZWVwaW5nIHRoYXQg
aW4gbWluZCwgbGV0J3Mgc2ltcGx5IGJlbGlldmUgdGhlIG51bWJlciBhbmQgaWdub3JlCj4gdGhl
IGxhdGVuY3kgb2YgdGhlIGJsb2NrIGxheWVyLCBibGtiYWNrIGl0c2VsZiAoaW5jbHVkaW5nIHRo
ZSBncmFudAo+IG1hcHBpbmcpLCBhbmQgYW55dGhpbmcgZWxzZSBpbmNsdWRpbmcgY29udGV4dCBz
d2l0Y2gsIGNhY2hlIG1pc3MsIGJ1dCB0aGUKPiBhbGxvY2F0aW9uLiAgSW4gb3RoZXIgd29yZHMs
IHN1cHBvc2UgdGhhdCB0aGUgZ3JhbnQgcGFnZSBhbGxvY2F0aW9uIGlzIG9ubHkgb25lCj4gc291
cmNlIG9mIHRoZSBvdmVyaGVhZC4gIEl0IHdpbGwgYmUgYWJsZSB0byBhY2hpZXZlIDEgbWlsbGlv
biBJT1BTICg0S0IgKgo+IDFNSU9QUyA9IDQgR0IvcykgaW4gdGhlIGJlc3QgY2FzZSwgMjAwIHRo
b3VzYW5kIElPUFMgKDgwMCBNQi9zKSBpbiBhdmVyYWdlLCBhbmQKPiAxMCB0aG91c2FuZCBJT1BT
ICg0MCBNQi9zKSBpbiB3b3JzdCBjYXNlLiAgQmFzZWQgb24gdGhpcyBjb2Fyc2UgY2FsY3VsYXRp
b24sIEkKPiB0aGluayB0aGUgdGVzdCByZXN1bHRzIGlzIHJlYXNvbmFibGUuCj4gCj4gVGhpcyBh
bHNvIG1lYW5zIHRoYXQgdGhlIGVmZmVjdCBvZiB0aGUgYmxrYmFjaydzIGZyZWUgcGFnZXMgcG9v
bCBtaWdodCBiZQo+IHZpc2libGUgdW5kZXIgcGFnZSBhbGxvY2F0aW9uIGZhc3QgcGF0aCBmYWls
dXJlIHNpdHVhdGlvbi4gIE5ldmVydGhlbGVzcywgaXQKPiB3b3VsZCBiZSBhbHNvIGhhcmQgdG8g
bWVhc3VyZSB0aGF0IGluIG1pY3JvIGxldmVsIHVubGVzcyB0aGUgbWVhc3VyZW1lbnQgaXMKPiB3
ZWxsIGRlc2lnbmVkIGFuZCBjb250cm9sbGVkLgo+IAo+ID4gCj4gPiBEbyB5b3UgdGhpbmsgeW91
IGNvdWxkIHBlcmZvcm0gc29tZSBtb3JlIHRlc3RzIChhcyBwb2ludGVkIG91dCBhYm92ZQo+ID4g
YWdhaW5zdCB0aGUgYmxvY2sgZGV2aWNlIHRvIHNraXAgdGhlIGZzIG92ZXJoZWFkKSBhbmQgcmVw
b3J0IGJhY2sgdGhlCj4gPiByZXN1bHRzPwo+IAo+IFRvIGJlIGhvbmVzdCwgSSdtIG5vdCBzdXJl
IHdoZXRoZXIgYWRkaXRpb25hbCB0ZXN0cyBhcmUgcmVhbGx5IG5lY2Vzc2FyeSwKPiBiZWNhdXNl
IEkgdGhpbmsgdGhlIGBkZGAgdGVzdCBhbmQgdGhlIHJlc3VsdHMgZXhwbGFuYXRpb24gYWxyZWFk
eSBtYWtlcyBzb21lCj4gc2Vuc2UgYW5kIHByb3ZpZGUgdGhlIG1pbmltYWwgcHJvb2Ygb2YgdGhl
IGNvbmNlcHQuICBBbHNvLCB0aGlzIGNoYW5nZSBpcyBhCj4gZmFsbGJhY2sgZm9yIHRoZSBtZW1v
cnkgcHJlc3N1cmUgc2l0dWF0aW9uLCB3aGljaCBpcyBhbiBlcnJvciBwYXRoIGluIHNvbWUKPiBw
b2ludCBvZiB2aWV3LiAgU3VjaCBlcnJvcm5lb3VzIHNpdHVhdGlvbiBtaWdodCBub3QgaGFwcGVu
IGZyZXF1ZW50bHkgYW5kIGlmCj4gdGhlIHNpdHVhdGlvbiBpcyBub3Qgc29sdmVkIGluIHNob3J0
IHRpbWUsIHNvbWV0aGluZyBtdWNoIHdvcnNlIChlLmcuLCBPT00ga2lsbAo+IG9mIHRoZSB1c2Vy
IHNwYWNlIHhlbiBjb250cm9sIHByb2Nlc3NlcykgdGhhbiB0ZW1wb3JhbCBJL08gcGVyZm9ybWFu
Y2UKPiBkZWdyYWRhdGlvbiBjb3VsZCBoYXBwZW4uICBUaHVzLCBJJ20gbm90IHN1cmUgd2hldGhl
ciBzdWNoIGRldGFpbGVkIHBlcmZvcm1hbmNlCj4gbWVhc3VyZW1lbnQgaXMgbmVjZXNzYXJ5IGZv
ciB0aGlzIHJhcmUgZXJyb3IgaGFuZGxpbmcgY2hhbmdlLgoKUmlnaHQsIG15IG1haW4gY29uY2Vy
biBpcyB0aGF0IHdlIHNlZW0gdG8gYmUgYWRkaW5nIGR1Y2sgdGFwZSBzbwp0aGluZ3MgZG9uJ3Qg
ZmFsbCBhcGFydCwgYnV0IGlmIHN1Y2ggY2FjaGUgaXMgcmVhbGx5IG5vdCBiZW5lZmljaWFsCmZy
b20gYSBwZXJmb3JtYW5jZSBQb1YgSSB3b3VsZCByYXRoZXIgc2VlIGl0IGdvIGF3YXkgdGhhbiBh
ZGRpbmcgbW9yZQpzdHVmZiB0byBpdCBpbiBvcmRlciB0byB3b3JrYXJvdW5kIGNvcm5lciBjYXNl
cyBsaWtlIG1lbW9yeQpzdGFydmF0aW9uLgoKQW55d2F5LCBJIGd1ZXNzIHdlIGNhbiB0YWtlIHN1
Y2ggY2hhbmdlLCBidXQgbG9uZyB0ZXJtIHdlIG5lZWQgdG8gbG9vawppbnRvIGZpeGluZyBncmFu
dHMgdG8gbm90IHVzZSBiYWxsb29uZWQgcGFnZXMsIGFuZCBmaWd1cmUgb3V0IGlmIHRoZQpibGti
YWNrIGZyZWUgcGFnZSBjYWNoZSBpcyByZWFsbHkgdXNlZnVsIG9yIG5vdC4KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
