Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2123F8A4AA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 19:33:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxE9R-0006gX-Hy; Mon, 12 Aug 2019 17:30:33 +0000
Received: from [172.99.69.81] (helo=us1-rack-iad1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxE9Q-0006gO-LZ
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:30:32 +0000
X-Inumbo-ID: e0f4eee4-bd26-11e9-b94c-33c0d2efa14c
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e0f4eee4-bd26-11e9-b94c-33c0d2efa14c;
 Mon, 12 Aug 2019 17:30:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 138CA174E;
 Mon, 12 Aug 2019 10:30:29 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61EA93F706;
 Mon, 12 Aug 2019 10:30:28 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:29:53 +0100
Message-Id: <20190812173019.11956-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 02/28] xen/arm64: head: Remove 1:1 mapping as
 soon as it is not used
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIDE6MSBtYXBwaW5nIG1heSBjbGFzaCB3aXRoIG90aGVyIHBhcnRzIG9mIHRoZSBYZW4gdmly
dHVhbCBtZW1vcnkKbGF5b3V0LiBBdCB0aGUgbW9tZW50LCBYZW4gaXMgaGFuZGxpbmcgdGhlIGNs
YXNoIGJ5IG9ubHkgY3JlYXRpbmcgYQptYXBwaW5nIHRvIHRoZSBydW50aW1lIHZpcnR1YWwgYWRk
cmVzcyBiZWZvcmUgZW5hYmxpbmcgdGhlIE1NVS4KClRoZSByZXN0IG9mIHRoZSBtYXBwaW5ncyAo
c3VjaCBhcyB0aGUgZml4bWFwKSB3aWxsIGJlIG1hcHBlZCBhZnRlciB0aGUKTU1VIGlzIGVuYWJs
ZWQuIEhvd2V2ZXIsIHRoZSBjb2RlIGRvaW5nIHRoZSBtYXBwaW5nIGlzIG5vdCBzYWZlIGFzIGl0
CnJlcGxhY2UgbWFwcGluZyB3aXRob3V0IHVzaW5nIHRoZSBCcmVhay1CZWZvcmUtTWFrZSBzZXF1
ZW5jZS4KCkFzIHRoZSAxOjEgbWFwcGluZyBjYW4gYmUgYW55d2hlcmUgaW4gdGhlIG1lbW9yeSwg
aXQgaXMgZWFzaWVyIHRvIHJlbW92ZQphbGwgdGhlIGVudHJpZXMgYWRkZWQgYXMgc29vbiBhcyB0
aGUgMToxIG1hcHBpbmcgaXMgbm90IHVzZWQgcmF0aGVyIHRoYW4KYWRkaW5nIHRoZSBCcmVhay1C
ZWZvcmUtTWFrZSBzZXF1ZW5jZSBldmVyeXdoZXJlLgoKSXQgaXMgZGlmZmljdWx0IHRvIHRyYWNr
IHdoZXJlIGV4YWN0bHkgdGhlIDE6MSBtYXBwaW5nIHdhcyBjcmVhdGVkCndpdGhvdXQgYSBmdWxs
IHJld29yayBvZiBjcmVhdGVfcGFnZV90YWJsZXMoKS4gSW5zdGVhZCwgaW50cm9kdWNlIGEgbmV3
CmZ1bmN0aW9uIHJlbW92ZV9pZGVudGl0eV9tYXBwaW5nKCkgd2lsbCBsb29rIHdoZXJlIGlzIHRo
ZSB0b3AtbGV2ZWwgZW50cnkKZm9yIHRoZSAxOjEgbWFwcGluZyBhbmQgcmVtb3ZlIGl0LgoKVGhl
IG5ldyBmdW5jdGlvbiBpcyBvbmx5IGNhbGxlZCBmb3IgdGhlIGJvb3QgQ1BVLiBTZWNvbmRhcnkg
Q1BVcyB3aWxsCnN3aXRjaCBkaXJlY3RseSB0byB0aGUgcnVudGltZSBwYWdlLXRhYmxlcyBzbyB0
aGVyZSBhcmUgbm8gbmVlZCB0bwpyZW1vdmUgdGhlIDE6MSBtYXBwaW5nLiBOb3RlIHRoYXQgdGhp
cyBzdGlsbCBkb2Vzbid0IG1ha2UgdGhlIFNlY29uZGFyeQpDUFVzIHBhdGggc2FmZSBidXQgaXQg
aXMgbm90IG1ha2luZyBpdCB3b3JzdC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CgotLS0KICAgIEl0IGlzIHZlcnkgbGlrZWx5IHdlIHdpbGwgbmVl
ZCB0byByZS1pbnRyb2R1Y2UgdGhlIDE6MSBtYXBwaW5nIHRvIGNhdGVyCiAgICBzZWNvbmRhcnkg
Q1BVcyBib290IGFuZCBzdXNwZW5kL3Jlc3VtZS4gRm9yIG5vdywgdGhlIGF0dGVtcHQgaXMgdG8g
bWFrZQogICAgYm9vdCBDUFUgcGF0aCBmdWxseSBBcm0gQXJtIGNvbXBsaWFudC4KCiAgICBDaGFu
Z2VzIGluIHYzOgogICAgICAgIC0gQXZvaWQgaGFyZGNvZGluZyBzbG90cwoKICAgIENoYW5nZXMg
aW4gdjI6CiAgICAgICAgLSBzL0lEIG1hcC8xOjEgbWFwcGluZy8KICAgICAgICAtIFJlbmFtZSBy
ZW1vdmVfaWRfbWFwKCkgdG8gcmVtb3ZlX2lkZW50aXR5X21hcHBpbmcoKQogICAgICAgIC0gQWRk
IG1pc3Npbmcgc2lnbmVkLW9mZi1ieQotLS0KIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCA5
NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCmlu
ZGV4IDUwY2ZmMDg3NTYuLmVjMTM4YWFlM2UgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpAQCAtMzMsNiArMzMsMTEg
QEAKICNkZWZpbmUgUFRfREVWICAgIDB4ZTcxIC8qIG5HPTEgQUY9MSBTSD0xMCBBUD0wMSBOUz0x
IEFUVFI9MTAwIFQ9MCBQPTEgKi8KICNkZWZpbmUgUFRfREVWX0wzIDB4ZTczIC8qIG5HPTEgQUY9
MSBTSD0xMCBBUD0wMSBOUz0xIEFUVFI9MTAwIFQ9MSBQPTEgKi8KIAorLyogQ29udmVuaWVuY2Ug
ZGVmaW5lcyB0byBnZXQgc2xvdCB1c2VkIGJ5IFhlbiBtYXBwaW5nLiAqLworI2RlZmluZSBYRU5f
WkVST0VUSF9TTE9UICAgIHplcm9ldGhfdGFibGVfb2Zmc2V0KFhFTl9WSVJUX1NUQVJUKQorI2Rl
ZmluZSBYRU5fRklSU1RfU0xPVCAgICAgIGZpcnN0X3RhYmxlX29mZnNldChYRU5fVklSVF9TVEFS
VCkKKyNkZWZpbmUgWEVOX1NFQ09ORF9TTE9UICAgICBzZWNvbmRfdGFibGVfb2Zmc2V0KFhFTl9W
SVJUX1NUQVJUKQorCiAjZGVmaW5lIF9fSEVBRF9GTEFHX1BBR0VfU0laRSAgICgoUEFHRV9TSElG
VCAtIDEwKSAvIDIpCiAKICNkZWZpbmUgX19IRUFEX0ZMQUdfUEhZU19CQVNFICAgMQpAQCAtMzAx
LDYgKzMwNiwxMyBAQCByZWFsX3N0YXJ0X2VmaToKICAgICAgICAgbGRyICAgeDAsID1wcmltYXJ5
X3N3aXRjaGVkCiAgICAgICAgIGJyICAgIHgwCiBwcmltYXJ5X3N3aXRjaGVkOgorICAgICAgICAv
KgorICAgICAgICAgKiBUaGUgMToxIG1hcCBtYXkgY2xhc2ggd2l0aCBvdGhlciBwYXJ0cyBvZiB0
aGUgWGVuIHZpcnR1YWwgbWVtb3J5CisgICAgICAgICAqIGxheW91dC4gQXMgaXQgaXMgbm90IHVz
ZWQgYW55bW9yZSwgcmVtb3ZlIGl0IGNvbXBsZXRlbHkgdG8KKyAgICAgICAgICogYXZvaWQgaGF2
aW5nIHRvIHdvcnJ5IGFib3V0IHJlcGxhY2luZyBleGlzdGluZyBtYXBwaW5nCisgICAgICAgICAq
IGFmdGVyd2FyZHMuCisgICAgICAgICAqLworICAgICAgICBibCAgICByZW1vdmVfaWRlbnRpdHlf
bWFwcGluZwogICAgICAgICBibCAgICBzZXR1cF9maXhtYXAKICNpZmRlZiBDT05GSUdfRUFSTFlf
UFJJTlRLCiAgICAgICAgIC8qIFVzZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3MgdGhlIFVB
UlQuICovCkBAIC02MjYsMTAgKzYzOCw3MSBAQCBlbmFibGVfbW11OgogICAgICAgICByZXQKIEVO
RFBST0MoZW5hYmxlX21tdSkKIAorLyoKKyAqIFJlbW92ZSB0aGUgMToxIG1hcCBmb3IgdGhlIHBh
Z2UtdGFibGVzLiBJdCBpcyBub3QgZWFzeSB0byBrZWVwIHRyYWNrCisgKiB3aGVyZSB0aGUgMTox
IG1hcCB3YXMgbWFwcGVkLCBzbyB3ZSB3aWxsIGxvb2sgZm9yIHRoZSB0b3AtbGV2ZWwgZW50cnkK
KyAqIGV4Y2x1c2l2ZSB0byB0aGUgMToxIG1hcCBhbmQgcmVtb3ZlIGl0LgorICoKKyAqIElucHV0
czoKKyAqICAgeDE5OiBwYWRkcihzdGFydCkKKyAqCisgKiBDbG9iYmVycyB4MCAtIHgxCisgKi8K
K3JlbW92ZV9pZGVudGl0eV9tYXBwaW5nOgorICAgICAgICAvKgorICAgICAgICAgKiBGaW5kIHRo
ZSB6ZXJvZXRoIHNsb3QgdXNlZC4gUmVtb3ZlIHRoZSBlbnRyeSBmcm9tIHplcm9ldGgKKyAgICAg
ICAgICogdGFibGUgaWYgdGhlIHNsb3QgaXMgbm90IFhFTl9aRVJPRVRIX1NMT1QuIEZvciBzbG90
CisgICAgICAgICAqIFhFTl9aRVJPRVRIX1NMT1QsIHRoZSAxOjEgbWFwcGluZyB3YXMgZWl0aGVy
IGRvbmUgaW4gZmlyc3QKKyAgICAgICAgICogb3Igc2Vjb25kIHRhYmxlLgorICAgICAgICAgKi8K
KyAgICAgICAgbHNyICAgeDEsIHgxOSwgI1pFUk9FVEhfU0hJRlQgICAvKiB4MSA6PSB6ZXJvZXRo
IHNsb3QgKi8KKyAgICAgICAgY21wICAgeDEsICNYRU5fWkVST0VUSF9TTE9UCisgICAgICAgIGJl
cSAgIDFmCisgICAgICAgIC8qIEl0IGlzIG5vdCBpbiBzbG90IFhFTl9aRVJPRVRIX1NMT1QsIHJl
bW92ZSB0aGUgZW50cnkuICovCisgICAgICAgIGxkciAgIHgwLCA9Ym9vdF9wZ3RhYmxlICAgICAg
ICAgLyogeDAgOj0gcm9vdCB0YWJsZSAqLworICAgICAgICBzdHIgICB4enIsIFt4MCwgeDEsIGxz
bCAjM10KKyAgICAgICAgYiAgICAgaWRlbnRpdHlfbWFwcGluZ19yZW1vdmVkCisKKzE6CisgICAg
ICAgIC8qCisgICAgICAgICAqIEZpbmQgdGhlIGZpcnN0IHNsb3QgdXNlZC4gUmVtb3ZlIHRoZSBl
bnRyeSBmb3IgdGhlIGZpcnN0CisgICAgICAgICAqIHRhYmxlIGlmIHRoZSBzbG90IGlzIG5vdCBY
RU5fRklSU1RfU0xPVC4gRm9yIHNsb3QgWEVOX0ZJUlNUX1NMT1QsCisgICAgICAgICAqIHRoZSAx
OjEgbWFwcGluZyB3YXMgZG9uZSBpbiB0aGUgc2Vjb25kIHRhYmxlLgorICAgICAgICAgKi8KKyAg
ICAgICAgbHNyICAgeDEsIHgxOSwgI0ZJUlNUX1NISUZUCisgICAgICAgIGFuZCAgIHgxLCB4MSwg
I0xQQUVfRU5UUllfTUFTSyAgLyogeDEgOj0gZmlyc3Qgc2xvdCAqLworICAgICAgICBjbXAgICB4
MSwgI1hFTl9GSVJTVF9TTE9UCisgICAgICAgIGJlcSAgIDFmCisgICAgICAgIC8qIEl0IGlzIG5v
dCBpbiBzbG90IFhFTl9GSVJTVF9TTE9ULCByZW1vdmUgdGhlIGVudHJ5LiAqLworICAgICAgICBs
ZHIgICB4MCwgPWJvb3RfZmlyc3QgICAgICAgICAgIC8qIHgwIDo9IGZpcnN0IHRhYmxlICovCisg
ICAgICAgIHN0ciAgIHh6ciwgW3gwLCB4MSwgbHNsICMzXQorICAgICAgICBiICAgICBpZGVudGl0
eV9tYXBwaW5nX3JlbW92ZWQKKworMToKKyAgICAgICAgLyoKKyAgICAgICAgICogRmluZCB0aGUg
c2Vjb25kIHNsb3QgdXNlZC4gUmVtb3ZlIHRoZSBlbnRyeSBmb3IgdGhlIGZpcnN0CisgICAgICAg
ICAqIHRhYmxlIGlmIHRoZSBzbG90IGlzIG5vdCBYRU5fU0VDT05EX1NMT1QuIEZvciBzbG90IFhF
Tl9TRUNPTkRfU0xPVCwKKyAgICAgICAgICogaXQgbWVhbnMgdGhlIDE6MSBtYXBwaW5nIHdhcyBu
b3QgY3JlYXRlZC4KKyAgICAgICAgICovCisgICAgICAgIGxzciAgIHgxLCB4MTksICNTRUNPTkRf
U0hJRlQKKyAgICAgICAgYW5kICAgeDEsIHgxLCAjTFBBRV9FTlRSWV9NQVNLICAvKiB4MSA6PSBm
aXJzdCBzbG90ICovCisgICAgICAgIGNtcCAgIHgxLCAjWEVOX1NFQ09ORF9TTE9UCisgICAgICAg
IGJlcSAgIGlkZW50aXR5X21hcHBpbmdfcmVtb3ZlZAorICAgICAgICAvKiBJdCBpcyBub3QgaW4g
c2xvdCAxLCByZW1vdmUgdGhlIGVudHJ5ICovCisgICAgICAgIGxkciAgIHgwLCA9Ym9vdF9zZWNv
bmQgICAgICAgICAgLyogeDAgOj0gc2Vjb25kIHRhYmxlICovCisgICAgICAgIHN0ciAgIHh6ciwg
W3gwLCB4MSwgbHNsICMzXQorCitpZGVudGl0eV9tYXBwaW5nX3JlbW92ZWQ6CisgICAgICAgIC8q
IFNlZSBhc20tYXJtL2FybTY0L2ZsdXNodGxiLmggZm9yIHRoZSBleHBsYW5hdGlvbiBvZiB0aGUg
c2VxdWVuY2UuICovCisgICAgICAgIGRzYiAgIG5zaHN0CisgICAgICAgIHRsYmkgIGFsbGUyCisg
ICAgICAgIGRzYiAgIG5zaAorICAgICAgICBpc2IKKworICAgICAgICByZXQKK0VORFBST0MocmVt
b3ZlX2lkZW50aXR5X21hcHBpbmcpCisKIHNldHVwX2ZpeG1hcDoKLSAgICAgICAgLyogTm93IHdl
IGNhbiBpbnN0YWxsIHRoZSBmaXhtYXAgYW5kIGR0YiBtYXBwaW5ncywgc2luY2Ugd2UKLSAgICAg
ICAgICogZG9uJ3QgbmVlZCB0aGUgMToxIG1hcCBhbnkgbW9yZSAqLwotICAgICAgICBkc2IgICBz
eQogI2lmIGRlZmluZWQoQ09ORklHX0VBUkxZX1BSSU5USykgLyogRml4bWFwIGlzIG9ubHkgdXNl
ZCBieSBlYXJseSBwcmludGsgKi8KICAgICAgICAgLyogQWRkIFVBUlQgdG8gdGhlIGZpeG1hcCB0
YWJsZSAqLwogICAgICAgICBsZHIgICB4MSwgPXhlbl9maXhtYXAgICAgICAgIC8qIHgxIDo9IHZh
ZGRyICh4ZW5fZml4bWFwKSAqLwpAQCAtNjQ3LDE5ICs3MjAsMTAgQEAgc2V0dXBfZml4bWFwOgog
ICAgICAgICBsZHIgICB4MSwgPUZJWE1BUF9BRERSKDApCiAgICAgICAgIGxzciAgIHgxLCB4MSwg
IyhTRUNPTkRfU0hJRlQgLSAzKSAgIC8qIHgxIDo9IFNsb3QgZm9yIEZJWE1BUCgwKSAqLwogICAg
ICAgICBzdHIgICB4MiwgW3g0LCB4MV0gICAgICAgICAgIC8qIE1hcCBpdCBpbiB0aGUgZml4bWFw
J3Mgc2xvdCAqLwotI2VuZGlmCiAKLSAgICAgICAgLyoKLSAgICAgICAgICogRmx1c2ggdGhlIFRM
QiBpbiBjYXNlIHRoZSAxOjEgbWFwcGluZyBoYXBwZW5zIHRvIGNsYXNoIHdpdGgKLSAgICAgICAg
ICogdGhlIHZpcnR1YWwgYWRkcmVzc2VzIHVzZWQgYnkgdGhlIGZpeG1hcCBvciBEVEIuCi0gICAg
ICAgICAqLwotICAgICAgICBkc2IgICBzeSAgICAgICAgICAgICAgICAgICAgIC8qIEVuc3VyZSBh
bnkgcGFnZSB0YWJsZSB1cGRhdGVzIG1hZGUgYWJvdmUKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKiBoYXZlIG9jY3VycmVkLiAqLwotCi0gICAgICAgIGlzYgotICAgICAg
ICB0bGJpICBhbGxlMgotICAgICAgICBkc2IgICBzeSAgICAgICAgICAgICAgICAgICAgIC8qIEVu
c3VyZSBjb21wbGV0aW9uIG9mIFRMQiBmbHVzaCAqLwotICAgICAgICBpc2IKKyAgICAgICAgLyog
RW5zdXJlIGFueSBwYWdlIHRhYmxlIHVwZGF0ZXMgbWFkZSBhYm92ZSBoYXZlIG9jY3VycmVkLiAq
LworICAgICAgICBkc2IgICBuc2hzdAorI2VuZGlmCiAgICAgICAgIHJldAogRU5EUFJPQyhzZXR1
cF9maXhtYXApCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
