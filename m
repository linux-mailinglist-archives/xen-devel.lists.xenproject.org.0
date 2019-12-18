Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C4B1249F2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 15:44:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihaVW-00048d-1x; Wed, 18 Dec 2019 14:40:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HzQX=2I=amazon.com=prvs=248bb817a=sjpark@srs-us1.protection.inumbo.net>)
 id 1ihaVU-00048X-8V
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:40:56 +0000
X-Inumbo-ID: 65536897-21a4-11ea-909c-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65536897-21a4-11ea-909c-12813bfff9fa;
 Wed, 18 Dec 2019 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576680056; x=1608216056;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=9TSSJzMeZCiqUiC9We6oHtvYEYmkGKrZqf9wv74O1kk=;
 b=LKCPFdM8L9ELfXuAxy28rY7jEv58Ih/qfPpLakySJ819YdpK6P3nNqVH
 bvfD89oUpdeKhyRoG8VxbVfBABW6l4+2TuITYjW8txUXCyHza6JiJm2VR
 uMa6urzdciwIuYNbJ2HBkbuRbi7doUUF7Q2KfdeZHVZGX62smeA3vwjZN Q=;
IronPort-SDR: jSc+E8xRrCSZQoSlNwzzxZ2Qt5foevig6NsIXRRGZopSepGBVga7+89uIb9r6bG12xVsPzG1Vv
 vCzkdB274h9w==
X-IronPort-AV: E=Sophos;i="5.69,329,1571702400"; 
   d="scan'208";a="9045548"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 18 Dec 2019 14:40:55 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id 65BBC1A94AC; Wed, 18 Dec 2019 14:40:53 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 18 Dec 2019 14:40:52 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.100) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 14:40:47 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
Date: Wed, 18 Dec 2019 15:40:25 +0100
Message-ID: <20191218144025.24277-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <ee6c4bae-0571-a18e-d408-0b69f8018329@suse.com> (raw)
X-Originating-IP: [10.43.160.100]
X-ClientProxiedBy: EX13D27UWA004.ant.amazon.com (10.43.160.43) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v12 2/5] xenbus/backend: Protect xenbus
 callback with lock
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
 SeongJae Park <sjpark@amazon.com>, konrad.wilk@oracle.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxOCBEZWMgMjAxOSAxNDozMDo0NCArMDEwMCAiSsO8cmdlbiBHcm/DnyIgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cgo+IE9uIDE4LjEyLjE5IDEzOjQyLCBTZW9uZ0phZSBQYXJrIHdy
b3RlOgo+ID4gT24gV2VkLCAxOCBEZWMgMjAxOSAxMzoyNzozNyArMDEwMCAiSsO8cmdlbiBHcm/D
nyIgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4gPiAKPiA+PiBPbiAxOC4xMi4xOSAxMTo0Miwg
U2VvbmdKYWUgUGFyayB3cm90ZToKPiA+Pj4gRnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFt
YXpvbi5kZT4KPiA+Pj4KPiA+Pj4gJ3JlY2xhaW1fbWVtb3J5JyBjYWxsYmFjayBjYW4gcmFjZSB3
aXRoIGEgZHJpdmVyIGNvZGUgYXMgdGhpcyBjYWxsYmFjawo+ID4+PiB3aWxsIGJlIGNhbGxlZCBm
cm9tIGFueSBtZW1vcnkgcHJlc3N1cmUgZGV0ZWN0ZWQgY29udGV4dC4gIFRvIGRlYWwgd2l0aAo+
ID4+PiB0aGUgY2FzZSwgdGhpcyBjb21taXQgYWRkcyBhIHNwaW5sb2NrIGluIHRoZSAneGVuYnVz
X2RldmljZScuICBXaGVuZXZlcgo+ID4+PiAncmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIGlzIGNh
bGxlZCwgdGhlIGxvY2sgb2YgdGhlIGRldmljZSB3aGljaCBwYXNzZWQKPiA+Pj4gdG8gdGhlIGNh
bGxiYWNrIGFzIGl0cyBhcmd1bWVudCBpcyBsb2NrZWQuICBUaHVzLCBkcml2ZXJzIHJlZ2lzdGVy
aW5nCj4gPj4+IHRoZWlyICdyZWNsYWltX21lbW9yeScgY2FsbGJhY2sgc2hvdWxkIHByb3RlY3Qg
dGhlIGRhdGEgdGhhdCBtaWdodCByYWNlCj4gPj4+IHdpdGggdGhlIGNhbGxiYWNrIHdpdGggdGhl
IGxvY2sgYnkgdGhlbXNlbHZlcy4KPiA+Pgo+ID4+IEFueSByZWFzb24geW91IGRvbid0IHRha2Ug
dGhlIGxvY2sgYXJvdW5kIHRoZSAucHJvYmUoKSBhbmQgLnJlbW92ZSgpCj4gPj4gY2FsbHMgb2Yg
dGhlIGJhY2tlbmQgKHhlbmJ1c19kZXZfcHJvYmUoKSBhbmQgeGVuYnVzX2Rldl9yZW1vdmUoKSk/
IFRoaXMKPiA+PiB3b3VsZCBlbGltaW5hdGUgdGhlIG5lZWQgdG8gZG8gdGhhdCBpbiBlYWNoIGJh
Y2tlbmQgaW5zdGVhZC4KPiA+IAo+ID4gRmlyc3Qgb2YgYWxsLCBJIHdvdWxkIGxpa2UgdG8ga2Vl
cCB0aGUgY3JpdGljYWwgc2VjdGlvbiBhcyBzbWFsbCBhcyBwb3NzaWJsZS4KPiA+IFdpdGggbXkg
c21hbGwgdGVzdCwgSSBjb3VsZCBzZWUgc2xpZ2h0bHkgaW5jcmVhc2luZyBtZW1vcnkgcHJlc3N1
cmUgYXMgdGhlCj4gPiBjcml0aWNhbCBzZWN0aW9uIGJlY29tZXMgd2lkZXIuICBBbHNvLCBzb21l
IGRyaXZlcnMgbWlnaHQgc2hhcmUgdGhlIGRhdGEgdGhlaXIKPiA+ICdyZWNsYWltX21lbW9yeScg
Y2FsbGJhY2sgdG91Y2hlcyB3aXRoIG90aGVyIGZ1bmN0aW9ucy4gIEkgdGhpbmsgb25seSB0aGUK
PiA+IGRyaXZlciBvd25lcnMgY2FuIGtub3cgd2hhdCBkYXRhIGlzIHNoYXJlZCBhbmQgd2hhdCBp
cyB0aGUgbWluaW11bSBjcml0aWNhbAo+ID4gc2VjdGlvbiB0byBwcm90ZWN0IGl0Lgo+IAo+IEJ1
dCB0aGlzIGtpbmQgb2Ygc2VyaWFsaXphdGlvbiBjYW4gc3RpbGwgYmUgYWRkZWQgb24gdG9wLgoK
SSdtIHN0aWxsIHdvcnJ5aW5nIGFib3V0IHRoZSB1bm5lY2Vzc2FyaWx5IGxhcmdlIGNyaXRpY2Fs
IHNlY3Rpb24sIGJ1dCBpdCBtaWdodApiZSBzbWFsbCBlbm91Z2ggdG8gYmUgaWdub3JlZC4gIElm
IG5vIG90aGVycyBoYXZlIHN0cm9uZyBvYmplY3Rpb24sIEkgd2lsbCB0YWtlCnRoZSBsb2NrIGFy
b3VuZCB0aGUgJy0+cHJvYmUoKScgYW5kICctPnJlbW92ZSgpJy4KCj4gCj4gQW5kIHdpdGggdGhl
IHRyeWxvY2sgaW4gdGhlIHJlY2xhaW0gcGF0aCBJIGJlbGlldmUgeW91IGNhbiBldmVuIGF2b2lk
Cj4gdGhlIGlycSB2YXJpYW50cyBvZiB0aGUgc3BpbmxvY2suIEJ1dCBJIG1pZ2h0IGJlIHdyb25n
LCBzbyB5b3Ugc2hvdWxkCj4gdHJ5IHRoYXQgd2l0aCBsb2NrZGVwIGVuYWJsZWQuIElmIGl0IGlz
IHdvcmtpbmcgdGhlcmUgaXMgbm8gaGFybSBkb25lCj4gd2hlbiBtYWtpbmcgdGhlIGNyaXRpY2Fs
IHNlY3Rpb24gbGFyZ2VyLCBhcyBtZW1vcnkgYWxsb2NhdGlvbnMgd2lsbAo+IHdvcmsgYXMgYmVm
b3JlLgoKWWVzLCB5b3UncmUgcmlnaHQuICBJIHdpbGwgdHJ5IHRlc3Qgd2l0aCBsb2NrZGVwLgoK
ClRoYW5rcywKU2VvbmdKYWUgUGFyawoKPiAKPiAKPiBKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
