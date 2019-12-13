Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14BC11E897
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:43:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnyr-0002xm-LK; Fri, 13 Dec 2019 16:39:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8pyZ=2D=amazon.com=prvs=24328bf02=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ifnyp-0002xg-Sa
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:39:51 +0000
X-Inumbo-ID: 2f2c20f4-1dc7-11ea-8f83-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f2c20f4-1dc7-11ea-8f83-12813bfff9fa;
 Fri, 13 Dec 2019 16:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576255192; x=1607791192;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l5UveEjdT/QO2j8m/QO/WpdM9MmyJurDN25ZblnVW8A=;
 b=LlFbUEoIhmXs9JacCFEVKWfOLPEVORbu2rFz8BnkUFfhZowyb0Sf/TeE
 A/UnIlmAkky1syBoh5pbJfTrHo7Ly+3NvsdZ1iYoBkmgop0X7IRgW9kJA
 2UVMKrglyE3JHmw0yXWchNPY2xiAV6SGta5hPjcEmoom/qCTeRg/51Wvi s=;
IronPort-SDR: Gf97QlvgSqg3Ymr3w/YnkwuPnORNMJ9LJ6q+XCL1JyTgWLg+pUEDju7yYTo7iaRTpDa++p/zmv
 w43WIupMK9Gg==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; 
   d="scan'208";a="8388489"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 13 Dec 2019 16:39:51 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id AAC59A1812; Fri, 13 Dec 2019 16:39:49 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 16:39:48 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 16:39:48 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 13 Dec 2019 16:39:46 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 16:39:44 +0000
Message-ID: <20191213163944.32241-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3] public/io/netif.h: document a mechanism to
 advertise carrier state
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBhZGRzIGEgc3BlY2lmaWNhdGlvbiBmb3IgYSAnY2Fycmllcicgbm9kZSBpbiB4
ZW5zdG9yZSB0byBhbGxvdwphIGJhY2tlbmQgdG8gbm90aWZ5IGEgZnJvbnRlbmQgb2YgaXQncyB2
aXJ0dWFsIGNhcnJpZXIvbGluayBzdGF0ZS4gRS5nLgphIGJhY2tlbmQgdGhhdCBpcyB1bmFibGUg
dG8gZm9yd2FyZCBwYWNrZXRzIGZyb20gdGhlIGd1ZXN0IGJlY2F1c2UgaXQgaXMKbm90IGF0dGFj
aGVkIHRvIGEgYnJpZGdlIG1heSB3aXNoIHRvIGFkdmVydGlzZSAnbm8gY2FycmllcicuCgpXaGls
ZSBpbiB0aGUgYXJlYSBhbHNvIGZpeCBhbiBlcnJvbmVvdXMgYmFja2VuZCBwYXRoIGRlc2NyaXB0
aW9uLgoKTk9URTogVGhpcyBpcyBwdXJlbHkgYSBkb2N1bWVudGF0aW9uIHBhdGNoLiBObyBmdW5j
dGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0t
CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cgp2MzoK
IC0gRml4IGFub3RoZXIgdHlwbwoKdjI6CiAtIEZpeCB0ZXh0CiAtIEZpeCBwYXRoCi0tLQogeGVu
L2luY2x1ZGUvcHVibGljL2lvL25ldGlmLmggfCAxNiArKysrKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3B1YmxpYy9pby9uZXRpZi5oIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL25ldGlm
LmgKaW5kZXggMjQ1NDQ0OGJhYS4uOWZjZjkxYTJmZSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
cHVibGljL2lvL25ldGlmLmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL25ldGlmLmgKQEAg
LTE3MSw3ICsxNzEsNyBAQAogICogVGhlIGFiaWxpdHkgb2YgdGhlIGJhY2tlbmQgdG8gdXNlIGEg
Y29udHJvbCByaW5nIGlzIGFkdmVydGlzZWQgYnkKICAqIHNldHRpbmc6CiAgKgotICogL2xvY2Fs
L2RvbWFpbi9YL2JhY2tlbmQvPGRvbWlkPi88dmlmPi9mZWF0dXJlLWN0cmwtcmluZyA9ICIxIgor
ICogL2xvY2FsL2RvbWFpbi9YL2JhY2tlbmQvdmlmLzxkb21pZD4vPHZpZj4vZmVhdHVyZS1jdHJs
LXJpbmcgPSAiMSIKICAqCiAgKiBUaGUgZnJvbnRlbmQgcHJvdmlkZXMgYSBjb250cm9sIHJpbmcg
dG8gdGhlIGJhY2tlbmQgYnkgc2V0dGluZzoKICAqCkBAIC0xOTAsNiArMTkwLDIwIEBACiAgKiBv
cmRlciBhcyByZXF1ZXN0cy4KICAqLwogCisvKgorICogTGluayBzdGF0ZQorICogPT09PT09PT09
PQorICoKKyAqIFRoZSBiYWNrZW5kIGNhbiBhZHZlcnRpc2UgaXRzIGN1cnJlbnQgbGluayAoY2Fy
cmllcikgc3RhdGUgdG8gdGhlCisgKiBmcm9udGVuZCB1c2luZyB0aGUgL2xvY2FsL2RvbWFpbi9Y
L2JhY2tlbmQvdmlmLzxkb21pZD4vPHZpZj4vY2FycmllcgorICogbm9kZS4gSWYgdGhpcyBub2Rl
IGlzIG5vdCBwcmVzZW50LCB0aGVuIHRoZSBmcm9udGVuZCBzaG91bGQgYXNzdW1lIHRoYXQKKyAq
IHRoZSBsaW5rIGlzIHVwIChmb3IgY29tcGF0aWJpbGl0eSB3aXRoIGJhY2tlbmRzIHRoYXQgZG8g
bm90IGltcGxlbWVudAorICogdGhpcyBmZWF0dXJlKS4gSWYgdGhpcyBub2RlIGlzIHByZXNlbnQs
IHRoZW4gYSB2YWx1ZSBvZiAiMCIgc2hvdWxkIGJlCisgKiBpbnRlcnByZXRlZCBieSB0aGUgZnJv
bnRlbmQgYXMgdGhlIGxpbmsgYmVpbmcgZG93biAobm8gY2FycmllcikgYW5kIGEKKyAqIHZhbHVl
IG9mICIxIiBzaG91bGQgYmUgaW50ZXJwcmV0ZWQgYXMgdGhlIGxpbmsgYmVpbmcgdXAgKGNhcnJp
ZXIKKyAqIHByZXNlbnQpLgorICovCisKIC8qCiAgKiBIYXNoIHR5cGVzCiAgKiA9PT09PT09PT09
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
