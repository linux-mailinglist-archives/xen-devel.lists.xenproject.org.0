Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281456D87A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 03:38:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoHnB-0006Ej-CP; Fri, 19 Jul 2019 01:34:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/KBD=VQ=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hoHn9-0006Ed-6W
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 01:34:35 +0000
X-Inumbo-ID: 5c0e4be2-a9c5-11e9-8980-bc764e045a96
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5c0e4be2-a9c5-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 01:34:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 18:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,280,1559545200"; d="scan'208";a="367534004"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2019 18:34:31 -0700
Date: Fri, 19 Jul 2019 09:38:41 +0800
From: Chao Gao <chao.gao@intel.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190719013839.GA8955@gao-cwp>
References: <1562133373-19208-1-git-send-email-chao.gao@intel.com>
 <20190703160317.GM13449@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703160317.GM13449@perard.uk.xensource.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v2] libxl_qmp: wait for completion of device
 removal
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDU6MDM6MTdQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj5PbiBXZWQsIEp1bCAwMywgMjAxOSBhdCAwMTo1NjoxM1BNICswODAwLCBDaGFvIEdh
byB3cm90ZToKPj4gVG8gcmVtb3ZlIGEgZGV2aWNlIGZyb20gYSBkb21haW4sIGEgcW1wIGNvbW1h
bmQgaXMgc2VudCB0byBxZW11LiBCdXQgaXQgaXMKPj4gaGFuZGxlZCBieSBxZW11IGFzeWNocm9u
b3VzbHkuIEV2ZW4gdGhlIHFtcCBjb21tYW5kIGlzIGNsYWltZWQgdG8gYmUgZG9uZSwKPj4gdGhl
IGFjdHVhbCBoYW5kbGluZyBpbiBxZW11IHNpZGUgbWF5IGhhcHBlbiBsYXRlci4KPj4gVGhpcyBi
ZWhhdmlvciBicmluZ3MgdHdvIHF1ZXN0aW9uczoKPj4gMS4gQXR0YWNoaW5nIGEgZGV2aWNlIGJh
Y2sgdG8gYSBkb21haW4gcmlnaHQgYWZ0ZXIgZGV0YWNoaW5nIHRoZSBkZXZpY2UgZnJvbQo+PiB0
aGF0IGRvbWFpbiB3b3VsZCBmYWlsIHdpdGggZXJyb3I6Cj4+IAo+PiBsaWJ4bDogZXJyb3I6IGxp
YnhsX3FtcC5jOjM0MTpxbXBfaGFuZGxlX2Vycm9yX3Jlc3BvbnNlOiBEb21haW4gMTpyZWNlaXZl
ZCBhbgo+PiBlcnJvciBtZXNzYWdlIGZyb20gUU1QIHNlcnZlcjogRHVwbGljYXRlIElEICdwY2kt
cHQtNjBfMDAuMCcgZm9yIGRldmljZQo+PiAKPj4gMi4gQWNjZXNzZXMgdG8gUENJIGNvbmZpZ3Vy
YXRpb24gc3BhY2UgaW4gUWVtdSBtYXkgb3ZlcmxhcCB3aXRoIGxhdGVyIGRldmljZQo+PiByZXNl
dCBpc3N1ZWQgYnkgJ3hsJyBvciBieSBwY2liYWNrLgo+PiAKPj4gSW4gb3JkZXIgdG8gYXZvaWQg
bWVudGlvbmVkIHF1ZXN0aW9ucywgd2FpdCBmb3IgdGhlIGNvbXBsZXRpb24gb2YgZGV2aWNlCj4+
IHJlbW92YWwgYnkgcXVlcnlpbmcgYWxsIHBjaSBkZXZpY2VzIHVzaW5nIHFtcCBjb21tYW5kIGFu
ZCBlbnN1cmluZyB0aGUgdGFyZ2V0Cj4+IGRldmljZSBpc24ndCBsaXN0ZWQuIE9ubHkgcmV0cnkg
NSB0aW1lcyB0byBhdm9pZCAneGwnIHBvdGVudGlhbGx5IGJlaW5nIGJsb2NrZWQKPj4gYnkgcWVt
dS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Cj4+
IC0tLQo+PiBDaGFuZ2VzIGluIHYyOgo+PiAgLSBCcmVhayBvdXQgZWFybHkgaWYgd2UgZm91bmQg
YW4gZXJyb3IgZHVyaW5nIHF1ZXJ5aW5nIHBjaSBkZXZpY2VzLgo+PiAgLSBQcmludCBhIG1lc3Nh
Z2UgdG8gd2FybiBhZG1pbiB0aGF0IGRldmljZSByZW1vdmFsIG1heSBub3QgYmUgZG9uZQo+PiAg
ICBpbiBkZXZpY2UgbW9kZWwncyBzaWRlLgo+Cj5SZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4KCkNvdWxkIHdlIG1lcmdlIHRoaXMgcGF0Y2g/
IG9yIG5lZWQgY29tbWVudHMgZnJvbSBzb21lb25lIGVsc2U/CgpUaGFua3MKQ2hhbwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
