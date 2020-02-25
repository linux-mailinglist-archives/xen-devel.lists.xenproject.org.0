Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE0F16EEE3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 20:21:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6fih-00077o-LX; Tue, 25 Feb 2020 19:18:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nw84=4N=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1j6fif-00077j-Gc
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 19:18:13 +0000
X-Inumbo-ID: 8f13714a-5803-11ea-aba8-bc764e2007e4
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f13714a-5803-11ea-aba8-bc764e2007e4;
 Tue, 25 Feb 2020 19:18:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 11:18:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; d="scan'208";a="237776373"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.187.145])
 by orsmga003.jf.intel.com with ESMTP; 25 Feb 2020 11:18:07 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 25 Feb 2020 11:17:54 -0800
Message-Id: <cover.1582658216.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v10 0/3] VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBzZXJpZXMgaW1wbGVtZW50cyBWTSBmb3JraW5nIGZvciBJbnRlbCBIVk0g
Z3Vlc3RzIHRvIGFsbG93IGZvcgp0aGUgZmFzdCBjcmVhdGlvbiBvZiBpZGVudGljYWwgVk1zIHdp
dGhvdXQgdGhlIGFzc29zY2lhdGVkIGhpZ2ggc3RhcnR1cCBjb3N0cwpvZiBib290aW5nIG9yIHJl
c3RvcmluZyB0aGUgVk0gZnJvbSBhIHNhdmVmaWxlLgoKSklSQSBpc3N1ZTogaHR0cHM6Ly94ZW5w
cm9qZWN0LmF0bGFzc2lhbi5uZXQvYnJvd3NlL1hFTi04OQoKVGhlIGZvcmsgb3BlcmF0aW9uIGlz
IGltcGxlbWVudGVkIGFzIHBhcnQgb2YgdGhlICJ4bCBmb3JrLXZtIiBjb21tYW5kOgogICAgeGwg
Zm9yay12bSAtQyA8Y29uZmlnPiAtUSA8cWVtdS1zYXZlLWZpbGU+IC1tIDxtYXgtdmNwdXM+IDxw
YXJlbnRfZG9taWQ+CiAgICAKQnkgZGVmYXVsdCBhIGZ1bGx5IGZ1bmN0aW9uYWwgZm9yayBpcyBj
cmVhdGVkLiBUaGUgdXNlciBpcyBpbiBjaGFyZ2UgaG93ZXZlciB0bwpjcmVhdGUgdGhlIGFwcHJv
cHJpYXRlIGNvbmZpZyBmaWxlIGZvciB0aGUgZm9yayBhbmQgdG8gZ2VuZXJhdGUgdGhlIFFFTVUg
c2F2ZQpmaWxlIGJlZm9yZSB0aGUgZm9yay12bSBjYWxsIGlzIG1hZGUuIFRoZSBjb25maWcgZmls
ZSBuZWVkcyB0byBnaXZlIHRoZQpmb3JrIGEgbmV3IG5hbWUgYXQgbWluaW11bSBidXQgb3RoZXIg
c2V0dGluZ3MgbWF5IGFsc28gcmVxdWlyZSBjaGFuZ2VzLiBDZXJ0YWluCnNldHRpbmdzIGluIHRo
ZSBjb25maWcgZmlsZSBvZiBib3RoIHRoZSBwYXJlbnQgYW5kIHRoZSBmb3JrIGhhdmUgdG8gYmUg
c2V0IHRvCmRlZmF1bHQuIERldGFpbHMgYXJlIGRvY3VtZW50ZWQuCgpUaGUgaW50ZXJmYWNlIGFs
c28gYWxsb3dzIHRvIHNwbGl0IHRoZSBmb3JraW5nIGludG8gdHdvIHN0ZXBzOgogICAgeGwgZm9y
ay12bSAtLWxhdW5jaC1kbSBubyBcCiAgICAgICAgICAgICAgIC1tIDxtYXgtdmNwdXM+IFwKICAg
ICAgICAgICAgICAgLXAgPHBhcmVudF9kb21pZD4KICAgIHhsIGZvcmstdm0gLS1sYXVuY2gtZG0g
bGF0ZSBcCiAgICAgICAgICAgICAgIC1DIDxjb25maWdfZmlsZV9mb3JfZm9yaz4gXAogICAgICAg
ICAgICAgICAtUSA8cWVtdV9zYXZlX2ZpbGU+IFwKICAgICAgICAgICAgICAgPGZvcmtfZG9taWQ+
CgpUaGUgc3BsaXQgY3JlYXRpb24gbW9kZWwgaXMgdXNlZnVsIHdoZW4gdGhlIFZNIG5lZWRzIHRv
IGJlIGNyZWF0ZWQgYXMgZmFzdCBhcwpwb3NzaWJsZS4gVGhlIGZvcmtlZCBWTSBjYW4gYmUgdW5w
YXVzZWQgd2l0aG91dCB0aGUgZGV2aWNlIG1vZGVsIGJlaW5nIGxhdW5jaGVkCnRvIGJlIG1vbml0
b3JlZCBhbmQgYWNjZXNzZWQgdmlhIFZNSS4gTm90ZSBob3dldmVyIHRoYXQgd2l0aG91dCBpdHMg
ZGV2aWNlCm1vZGVsIHJ1bm5pbmcgKGRlcGVuZGluZyBvbiB3aGF0IGlzIGV4ZWN1dGluZyBpbiB0
aGUgVk0pIGl0IGlzIGJvdW5kIHRvCm1pc2JlaGF2ZSBvciBldmVuIGNyYXNoIHdoZW4gaXRzIHRy
eWluZyB0byBhY2Nlc3MgZGV2aWNlcyB0aGF0IHdvdWxkIGJlCmVtdWxhdGVkIGJ5IFFFTVUuIFdl
IGFudGljaXBhdGUgdGhhdCBmb3IgY2VydGFpbiB1c2UtY2FzZXMgdGhpcyB3b3VsZCBiZSBhbgph
Y2NlcHRhYmxlIHNpdHVhdGlvbiwgaW4gY2FzZSBmb3IgZXhhbXBsZSB3aGVuIGZ1enppbmcgaXMg
cGVyZm9ybWVkIG9mIGNvZGUKc2VnbWVudHMgdGhhdCBkb24ndCBhY2Nlc3Mgc3VjaCBkZXZpY2Vz
LgoKTGF1bmNoaW5nIHRoZSBkZXZpY2UgbW9kZWwgcmVxdWlyZXMgdGhlIFFFTVUgWGVuIHNhdmVm
aWxlIHRvIGJlIGdlbmVyYXRlZAptYW51YWxseSBmcm9tIHRoZSBwYXJlbnQgVk0uIFRoaXMgY2Fu
IGJlIGFjY29tcGxpc2hlZCBzaW1wbHkgYnkgY29ubmVjdGluZyB0bwppdHMgUU1QIHNvY2tldCBh
bmQgaXNzdWluZyB0aGUgInhlbi1zYXZlLWRldmljZXMtc3RhdGUiIGNvbW1hbmQuIEZvciBleGFt
cGxlCnVzaW5nIHRoZSBzdGFuZGFyZCB0b29sIHNvY2F0IHRoZXNlIGNvbW1hbmRzIGNhbiBiZSB1
c2VkIHRvIGdlbmVyYXRlIHRoZSBmaWxlOgogICAgc29jYXQgLSBVTklYLUNPTk5FQ1Q6L3Zhci9y
dW4veGVuL3FtcC1saWJ4bC08cGFyZW50X2RvbWlkPgogICAgeyAiZXhlY3V0ZSI6ICJxbXBfY2Fw
YWJpbGl0aWVzIiB9CiAgICB7ICJleGVjdXRlIjogInhlbi1zYXZlLWRldmljZXMtc3RhdGUiLCBc
CiAgICAgICAgImFyZ3VtZW50cyI6IHsgImZpbGVuYW1lIjogIi9wYXRoL3RvL3NhdmUvcWVtdV9z
dGF0ZSIsIFwKICAgICAgICAgICAgICAgICAgICAgICAgImxpdmUiOiBmYWxzZX0gfQoKQXQgcnVu
dGltZSB0aGUgZm9ya2VkIFZNIHN0YXJ0cyBydW5uaW5nIHdpdGggYW4gZW1wdHkgcDJtIHdoaWNo
IGdldHMgbGF6aWx5CnBvcHVsYXRlZCB3aGVuIHRoZSBWTSBnZW5lcmF0ZXMgRVBUIGZhdWx0cywg
c2ltaWxhciB0byBob3cgYWx0cDJtIHZpZXdzIGFyZQpwb3B1bGF0ZWQuIElmIHRoZSBtZW1vcnkg
YWNjZXNzIGlzIGEgcmVhZC1vbmx5IGFjY2VzcywgdGhlIHAybSBlbnRyeSBpcwpwb3B1bGF0ZWQg
d2l0aCBhIG1lbW9yeSBzaGFyZWQgZW50cnkgd2l0aCBpdHMgcGFyZW50LiBGb3Igd3JpdGUgbWVt
b3J5IGFjY2Vzc2VzCm9yIGluIGNhc2UgbWVtb3J5IHNoYXJpbmcgd2Fzbid0IHBvc3NpYmxlIChm
b3IgZXhhbXBsZSBpbiBjYXNlIGEgcmVmZXJlbmNlIGlzCmhlbGQgYnkgYSB0aGlyZCBwYXJ0eSks
IGEgbmV3IHBhZ2UgaXMgYWxsb2NhdGVkIGFuZCB0aGUgcGFnZSBjb250ZW50cyBhcmUKY29waWVk
IG92ZXIgZnJvbSB0aGUgcGFyZW50IFZNLiBGb3JrcyBjYW4gYmUgZnVydGhlciBmb3JrZWQgaWYg
bmVlZGVkLCB0aHVzCmFsbG93aW5nIGZvciBmdXJ0aGVyIG1lbW9yeSBzYXZpbmdzLgoKQSBWTSBm
b3JrIHJlc2V0IGh5cGVyY2FsbCBpcyBhbHNvIGFkZGVkIHRoYXQgYWxsb3dzIHRoZSBmb3JrIHRv
IGJlIHJlc2V0IHRvIHRoZQpzdGF0ZSBpdCB3YXMganVzdCBhZnRlciBhIGZvcmssIGFsc28gYWNj
ZXNzaWJsZSB2aWEgeGw6CiAgICB4bCBmb3JrLXZtIC0tZm9yay1yZXNldCAtcCA8Zm9ya19kb21p
ZD4KClRoaXMgaXMgYW4gb3B0aW1pemF0aW9uIGZvciBjYXNlcyB3aGVyZSB0aGUgZm9ya3MgYXJl
IHZlcnkgc2hvcnQtbGl2ZWQgYW5kIHJ1bgp3aXRob3V0IGEgZGV2aWNlIG1vZGVsLCBzbyByZXNl
dHRpbmcgc2F2ZXMgc29tZSB0aW1lIGNvbXBhcmVkIHRvIGNyZWF0aW5nIGEKYnJhbmQgbmV3IGZv
cmsgcHJvdmlkZWQgdGhlIGZvcmsgaGFzIG5vdCBhcXVpcmVkIGEgbG90IG9mIG1lbW9yeS4gSWYg
dGhlIGZvcmsKaGFzIGEgbG90IG9mIG1lbW9yeSBkZWR1cGxpY2F0ZWQgaXQgaXMgbGlrZWx5IGdv
aW5nIHRvIGJlIGZhc3RlciB0byBjcmVhdGUgYQpuZXcgZm9yayBmcm9tIHNjcmF0Y2ggYW5kIGFz
eW5jaHJvbm91c2x5IGRlc3Ryb3lpbmcgdGhlIG9sZCBvbmUuCgpUaGUgc2VyaWVzIGhhcyBiZWVu
IHRlc3RlZCB3aXRoIFdpbmRvd3MgVk1zIGFuZCBmdW5jdGlvbnMgYXMgZXhwZWN0ZWQuIExpbnV4
ClZNcyB3aGVuIGZvcmtlZCBmcm9tIGEgcnVubmluZyBWTSB3aWxsIGhhdmUgYSBmcm96ZW4gVk5D
IHNjcmVlbi4gTGludXggVk1zIGF0CnRoaXMgdGltZSBjYW4gb25seSBiZSBmb3JrZWQgd2l0aCBh
IHdvcmtpbmcgZGV2aWNlIG1vZGVsIHdoZW4gdGhlIHBhcmVudCBWTSB3YXMKcmVzdG9yZWQgZnJv
bSBhIHNuYXBzaG90IHVzaW5nICJ4bCByZXN0b3JlIC1wIi4gVGhpcyBpcyBhIGtub3duIGxpbWl0
YXRpb24uCgpGb3JraW5nIHRpbWUgaGFzIGJlZW4gbWVhc3VyZWQgdG8gYmUgMC4wMDA3cywgZGV2
aWNlIG1vZGVsIGxhdW5jaCB0byBiZSBhcm91bmQKMXMgZGVwZW5kaW5nIGxhcmdlbHkgb24gdGhl
IG51bWJlciBvZiBkZXZpY2VzIGJlaW5nIGVtdWxhdGVkLiBGb3JrIHJlc2V0cyBoYXZlCmJlZW4g
bWVhc3VyZWQgdG8gYmUgMC4wMDAxcyB1bmRlciB0aGUgb3B0aW1hbCBjaXJjdW1zdGFuY2VzLgoK
TmV3IGluIHYxMDoKICAgIFJlYmFzZWQgb24gc3RhZ2luZyBhbmQgbWlub3IgZml4ZXMgZm9yIHRo
aW5ncyBwb2ludGVkIG91dCBieSBSb2dlcgogICAgQWxsb2NhdGUgcGFnZXMgZm9yIHZjcHVfaW5m
byBpZiB1c2VkIGJ5IHBhcmVudAogICAgRG9jdW1lbnQgbGltaXRhdGlvbiBvZiBndWVzdCBzZXR0
aW5ncyB0aGF0IGhhdmUgdG8gYmUgc2V0IHRvIGRlZmF1bHQKICAgIFJlcXVpcmUgbWF4LXZjcHVz
IHRvIGJlIHNwZWNpZmllZCBieSB0b29sc3RhY2stc2lkZQogICAgQ29kZSBtb3ZlbWVudCBpbiB0
b29sc3RhY2sgJiBjb21waWxlIHRlc3RlZCBvbiBBUk0KICAgIEltcGxlbWVudCBoeXBlcmNhbGwg
Y29udGludWF0aW9uIGZvciByZXNldCBvcGVyYXRpb24KClBhdGNoIDEtMiBpbXBsZW1lbnRzIHRo
ZSBWTSBmb3JrICYgcmVzZXQgb3BlcmF0aW9uIGh5cGVydmlzb3Igc2lkZSBiaXRzCgpQYXRjaCAz
IGFkZHMgdGhlIHRvb2xzdGFjay1zaWRlIGNvZGUgaW1wbGVtZW50aW5nIFZNIGZvcmtpbmcgYW5k
IHJlc2V0CgpUYW1hcyBLIExlbmd5ZWwgKDMpOgogIHhlbi9tZW1fc2hhcmluZzogVk0gZm9ya2lu
ZwogIHg4Ni9tZW1fc2hhcmluZzogcmVzZXQgYSBmb3JrCiAgeGVuL3Rvb2xzOiBWTSBmb3JraW5n
IHRvb2xzdGFjayBzaWRlCgogZG9jcy9tYW4veGwuMS5wb2QuaW4gICAgICAgICAgICAgIHwgIDQ0
ICsrKysKIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oICAgICB8ICAxMyArCiB0b29scy9s
aWJ4Yy94Y19tZW1zaHIuYyAgICAgICAgICAgfCAgMjIgKysKIHRvb2xzL2xpYnhsL2xpYnhsLmgg
ICAgICAgICAgICAgICB8ICAxMSArCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgICAgICAg
fCAzNjEgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMg
ICAgICAgICAgICB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgICAgICAgICAgIHwg
IDQzICsrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggICAgICB8ICAgNyArCiB0b29s
cy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgICAgICAgfCAgIDEgKwogdG9vbHMvbGlieGwvbGlieGxf
eDg2LmMgICAgICAgICAgIHwgIDQxICsrKwogdG9vbHMveGwvTWFrZWZpbGUgICAgICAgICAgICAg
ICAgIHwgICAyICstCiB0b29scy94bC94bC5oICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKwog
dG9vbHMveGwveGxfY21kdGFibGUuYyAgICAgICAgICAgIHwgIDE1ICsrCiB0b29scy94bC94bF9m
b3Jrdm0uYyAgICAgICAgICAgICAgfCAxNDcgKysrKysrKysrKysKIHRvb2xzL3hsL3hsX3ZtY29u
dHJvbC5jICAgICAgICAgICB8ICAxNCArCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAg
ICAgfCAgMTEgKwogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgICAgIHwgICA0ICstCiB4
ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jICAgICAgICAgfCAgIDMgKy0KIHhlbi9hcmNoL3g4Ni9t
bS9tZW1fc2hhcmluZy5jICAgICB8IDQxMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgICAgICAgICB8ICAgOSArLQogeGVuL2NvbW1vbi9k
b21haW4uYyAgICAgICAgICAgICAgIHwgICAzICsKIHhlbi9pbmNsdWRlL2FzbS14ODYvaGFwLmgg
ICAgICAgICB8ICAgMSArCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaCAgICAgfCAgIDIg
KwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oIHwgIDE3ICsrCiB4ZW4vaW5jbHVk
ZS9wdWJsaWMvbWVtb3J5LmggICAgICAgfCAgIDkgKwogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmgg
ICAgICAgICAgIHwgICA1ICsKIDI2IGZpbGVzIGNoYW5nZWQsIDEwMzIgaW5zZXJ0aW9ucygrKSwg
MTcxIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3hsL3hsX2Zvcmt2bS5j
CgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
