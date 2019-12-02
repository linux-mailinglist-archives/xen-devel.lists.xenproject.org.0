Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3407B10E988
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 12:33:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibjuA-00039a-4A; Mon, 02 Dec 2019 11:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=84di=ZY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ibju8-00039V-QB
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 11:30:12 +0000
X-Inumbo-ID: 19dfa226-14f7-11ea-83b8-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19dfa226-14f7-11ea-83b8-bc764e2007e4;
 Mon, 02 Dec 2019 11:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575286212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LgrI7imZTHW5E5wP8a35fEjqQd4LZ1IPO5hV5N7ABPU=;
 b=ZHPzxViBaOH1ubPkMLuLc0ZcILlqzKYCD6rkjkPpOWenusoADGKSh1jA
 gswKCqdY0ao9Ax6XY9UcmoPEWe+dUr/vVoGBY2tNHHmWbRzAt/Q60JvSZ
 3f2FIOAgazAtjEhrd0O7oc2hN58ZZiwjGsvRIf64B7+lA4yGTuJrROkhs 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RWCm50YdpxNH5YE8UOTPKWS02/GuzG/PCwCgBwfHwKXokkiO7FUcLDphf0noXeqL9C4MMAaFgA
 OebWBJMVuuL7Qmrxh8zMi9kmDgwrWSLBX4rvsG+GScog9ObcDHqLxs+6c3n8pIkuV0KrD2ABu7
 1TBSPUsSHDmJuleducBubbib4fgn8p5Ur3CQG94sq08EmaE7Dt07r7Y2K/ftzYmh9yphPVOUoS
 luDMki+X2A9WdTCrmkN2JgzFUHmYFhuBluDFs9EGuUjz5hlnZ6S3VfhLz/EKM/nTlwacooX8Lu
 Ctw=
X-SBRS: 2.7
X-MesageID: 9173521
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,268,1571716800"; 
   d="scan'208";a="9173521"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 2 Dec 2019 12:29:46 +0100
Message-ID: <20191202112946.25461-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] x86: re-order clang no integrated
 assembler tests
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug
 Goldstein <cardoe@cardoe.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHRlc3RzIHRvIGNoZWNrIHdoZXRoZXIgdGhlIGludGVncmF0ZWQgYXNzZW1ibGVyIGlzIGNh
cGFibGUgb2YKYnVpbGRpbmcgWGVuIHNob3VsZCBiZSBwZXJmb3JtZWQgYmVmb3JlIHRlc3Rpbmcg
YW55IGFzc2VtYmxlcgpmZWF0dXJlcywgb3IgZWxzZSB0aGUgZmVhdHVyZSBzcGVjaWZpYyB0ZXN0
cyB3b3VsZCBiZSBzdGFsZSBpZiB0aGUKaW50ZWdyYXRlZCBhc3NlbWJsZXIgaXMgZGlzYWJsZWQg
YWZ0ZXJ3YXJkcy4KCkZpeGVzOiBlZjI4NmY2Nzc4N2EgKCd4ODY6IG1vdmUgYW5kIGZpeCBjbGFu
ZyAuc2tpcCBjaGVjaycpClJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpSZXBvcnRlZC1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2Uu
Y29tPgpzaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KLS0tCkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gv
eDg2L1J1bGVzLm1rIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5tayBiL3hlbi9hcmNoL3g4Ni9SdWxlcy5t
awppbmRleCBhM2M1ZWI5ZGU3Li45MmZkYmU5ZDY4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
UnVsZXMubWsKKysrIGIveGVuL2FyY2gveDg2L1J1bGVzLm1rCkBAIC0xMiw2ICsxMiwzMCBAQCBD
RkxBR1MgKz0gJy1EX19PQkpFQ1RfTEFCRUxfXz0kKHN1YnN0IC8sJCQsJChzdWJzdCAtLF8sJChz
dWJzdCAkKEJBU0VESVIpLywsJChDVQogIyBQcmV2ZW50IGZsb2F0aW5nLXBvaW50IHZhcmlhYmxl
cyBmcm9tIGNyZWVwaW5nIGludG8gWGVuLgogQ0ZMQUdTICs9IC1tc29mdC1mbG9hdAogCitpZmVx
ICgkKGNsYW5nKSx5KQorIyBOb3RlOiBBbnkgdGVzdCB3aGljaCBhZGRzIC1uby1pbnRlZ3JhdGVk
LWFzIHdpbGwgY2F1c2Ugc3Vic2VxdWVudCB0ZXN0cyB0bworIyBzdWNjZWVkLCBhbmQgbm90IHRy
aWdnZXIgZnVydGhlciBhZGRpdGlvbnMuCisjCisjIFRoZSB0ZXN0cyB0byBzZWxlY3Qgd2hldGhl
ciB0aGUgaW50ZWdyYXRlZCBhc3NlbWJsZXIgaXMgdXNhYmxlIG5lZWQgdG8gaGFwcGVuCisjIGJl
Zm9yZSB0ZXN0aW5nIGFueSBhc3NlbWJsZXIgZmVhdHVyZXMsIG9yIGVsc2UgdGhlIHJlc3VsdCBv
ZiB0aGUgdGVzdHMgd291bGQKKyMgYmUgc3RhbGUgaWYgdGhlIGludGVncmF0ZWQgYXNzZW1ibGVy
IGlzIG5vdCB1c2VkLgorCisjIE9sZGVyIGNsYW5nJ3MgYnVpbHQtaW4gYXNzZW1ibGVyIGRvZXNu
J3QgdW5kZXJzdGFuZCAuc2tpcCB3aXRoIGxhYmVsczoKKyMgaHR0cHM6Ly9idWdzLmxsdm0ub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yNzM2OQorJChjYWxsIGFzLW9wdGlvbi1hZGQsQ0ZMQUdTLENDLCIu
TDA6IC5MMTogLnNraXAgKC5MMSAtIC5MMCkiLCxcCisgICAgICAgICAgICAgICAgICAgICAtbm8t
aW50ZWdyYXRlZC1hcykKKworIyBDaGVjayB3aGV0aGVyIGNsYW5nIGFzbSgpLXMgc3VwcG9ydCAu
aW5jbHVkZS4KKyQoY2FsbCBhcy1vcHRpb24tYWRkLENGTEFHUyxDQywiLmluY2x1ZGUgXCJhc20v
aW5kaXJlY3RfdGh1bmtfYXNtLmhcIiIsLFwKKyAgICAgICAgICAgICAgICAgICAgIC1uby1pbnRl
Z3JhdGVkLWFzKQorCisjIENoZWNrIHdoZXRoZXIgY2xhbmcga2VlcHMgLm1hY3JvLXMgYmV0d2Vl
biBhc20oKS1zOgorIyBodHRwczovL2J1Z3MubGx2bS5vcmcvc2hvd19idWcuY2dpP2lkPTM2MTEw
CiskKGNhbGwgYXMtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsXAorICAgICAgICAgICAgICAgICAgICAg
Ii5tYWNybyBGT087LmVuZG0iJCQoY2xvc2UpOyBhc20gdm9sYXRpbGUgJCQob3BlbikiLm1hY3Jv
IEZPTzsuZW5kbSIsXAorICAgICAgICAgICAgICAgICAgICAgLW5vLWludGVncmF0ZWQtYXMpCitl
bmRpZgorCiAkKGNhbGwgY2Mtb3B0aW9ucy1hZGQsQ0ZMQUdTLENDLCQoRU1CRURERURfRVhUUkFf
Q0ZMQUdTKSkKICQoY2FsbCBjYy1vcHRpb24tYWRkLENGTEFHUyxDQywtV25lc3RlZC1leHRlcm5z
KQogJChjYWxsIGFzLW9wdGlvbi1hZGQsQ0ZMQUdTLENDLCJ2bWNhbGwiLC1ESEFWRV9BU19WTVgp
CkBAIC03MCwyMiArOTQsMyBAQCBlbmRpZgogIyBTZXQgdXAgdGhlIGFzc2VtYmxlciBpbmNsdWRl
IHBhdGggcHJvcGVybHkgZm9yIG9sZGVyIHRvb2xjaGFpbnMuCiBDRkxBR1MgKz0gLVdhLC1JJChC
QVNFRElSKS9pbmNsdWRlCiAKLWlmZXEgKCQoY2xhbmcpLHkpCi0jIE5vdGU6IEFueSB0ZXN0IHdo
aWNoIGFkZHMgLW5vLWludGVncmF0ZWQtYXMgd2lsbCBjYXVzZSBzdWJzZXF1ZW50IHRlc3RzIHRv
Ci0jIHN1Y2NlZWQsIGFuZCBub3QgdHJpZ2dlciBmdXJ0aGVyIGFkZGl0aW9ucy4KLQotIyBPbGRl
ciBjbGFuZydzIGJ1aWx0LWluIGFzc2VtYmxlciBkb2Vzbid0IHVuZGVyc3RhbmQgLnNraXAgd2l0
aCBsYWJlbHM6Ci0jIGh0dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjczNjkK
LSQoY2FsbCBhcy1vcHRpb24tYWRkLENGTEFHUyxDQywiLkwwOiAuTDE6IC5za2lwICguTDEgLSAu
TDApIiwsXAotICAgICAgICAgICAgICAgICAgICAgLW5vLWludGVncmF0ZWQtYXMpCi0KLSMgQ2hl
Y2sgd2hldGhlciBjbGFuZyBhc20oKS1zIHN1cHBvcnQgLmluY2x1ZGUuCi0kKGNhbGwgYXMtb3B0
aW9uLWFkZCxDRkxBR1MsQ0MsIi5pbmNsdWRlIFwiYXNtL2luZGlyZWN0X3RodW5rX2FzbS5oXCIi
LCxcCi0gICAgICAgICAgICAgICAgICAgICAtbm8taW50ZWdyYXRlZC1hcykKLQotIyBDaGVjayB3
aGV0aGVyIGNsYW5nIGtlZXBzIC5tYWNyby1zIGJldHdlZW4gYXNtKCktczoKLSMgaHR0cHM6Ly9i
dWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9pZD0zNjExMAotJChjYWxsIGFzLW9wdGlvbi1hZGQs
Q0ZMQUdTLENDLFwKLSAgICAgICAgICAgICAgICAgICAgICIubWFjcm8gRk9POy5lbmRtIiQkKGNs
b3NlKTsgYXNtIHZvbGF0aWxlICQkKG9wZW4pIi5tYWNybyBGT087LmVuZG0iLFwKLSAgICAgICAg
ICAgICAgICAgICAgIC1uby1pbnRlZ3JhdGVkLWFzKQotZW5kaWYKLS0gCjIuMjQuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
