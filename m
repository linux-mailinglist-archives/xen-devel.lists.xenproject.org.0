Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4089B10B187
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 15:42:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZyRj-0003bT-PM; Wed, 27 Nov 2019 14:37:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J2FP=ZT=amazon.com=prvs=227ebe4de=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZyRi-0003bO-9E
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 14:37:34 +0000
X-Inumbo-ID: 729cf10c-1123-11ea-a3b6-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 729cf10c-1123-11ea-a3b6-12813bfff9fa;
 Wed, 27 Nov 2019 14:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574865454; x=1606401454;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y7Lv8wpURqz03YGWCNPu7MtpXPApqrQcKety1HZdCBY=;
 b=tZuTn4cWz8ucLR2p/U04ijWoaFWKsiftFlxhymleekQ2ig6vkPDiG9kx
 8c6o6dN1ldhbHJkCw1mCd3v+VIRJ2io/GgLXn/4T8M5IokSsp2nMpr89J
 dBWK64Wq+pabnz4H8ZqsQN6j8zdS/qyk61MfOI3iRDrQOTZKsuL6nLgcK o=;
IronPort-SDR: 4qxX2yTwbldkh03PpL67CZFOWLPvwyxUI+khJ8Y295Sux9xMx1Qd8eXmjQUXE6z7+kNoc8onx9
 /Kglq34mpMNQ==
X-IronPort-AV: E=Sophos;i="5.69,249,1571702400"; d="scan'208";a="10222821"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 27 Nov 2019 14:37:21 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id B6C98A27D6; Wed, 27 Nov 2019 14:37:16 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 14:37:15 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 14:37:14 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 27 Nov 2019 14:37:12 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 27 Nov 2019 14:37:11 +0000
Message-ID: <20191127143711.4377-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2] Rationalize max_grant_frames and
 max_maptrack_frames handling
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKWGVuIHVzZWQg
dG8gaGF2ZSBzaW5nbGUsIHN5c3RlbS13aWRlIGxpbWl0cyBmb3IgdGhlIG51bWJlciBvZiBncmFu
dApmcmFtZXMgYW5kIG1hcHRyYWNrIGZyYW1lcyBhIGd1ZXN0IHdhcyBhbGxvd2VkIHRvIGNyZWF0
ZS4gSW5jcmVhc2luZwpvciBkZWNyZWFzaW5nIHRoaXMgc2luZ2xlIGxpbWl0IG9uIHRoZSBYZW4g
Y29tbWFuZC1saW5lIHdvdWxkIGNoYW5nZQp0aGUgbGltaXQgZm9yIGFsbCBndWVzdHMgb24gdGhl
IHN5c3RlbS4KCkxhdGVyLCBwZXItZG9tYWluIGxpbWl0cyBmb3IgdGhlc2UgdmFsdWVzIHdhcyBj
cmVhdGVkLiBUaGUgc3lzdGVtLXdpZGUKbGltaXRzIGJlY2FtZSBzdHJpY3QgbGltaXRzOiBkb21h
aW5zIGNvdWxkIG5vdCBiZSBjcmVhdGVkIHdpdGggaGlnaGVyCmxpbWl0cywgYnV0IGNvdWxkIGJl
IGNyZWF0ZWQgd2l0aCBsb3dlciBsaW1pdHMuIEhvd2V2ZXIsIHRoYXQgY2hhbmdlCmFsc28gaW50
cm9kdWNlZCBhIHJhbmdlIG9mIGRpZmZlcmVudCAiZGVmYXVsdCIgdmFsdWVzIGludG8gdmFyaW91
cwpwbGFjZXMgaW4gdGhlIHRvb2xzdGFjazoKCi0gVGhlIHB5dGhvbiBsaWJ4YyBiaW5kaW5ncyBo
YXJkLWNvZGVkIHRoZXNlIHZhbHVlcyB0byAzMiBhbmQgMTAyNCwKICByZXNwZWN0aXZlbHkKLSBU
aGUgbGlieGwgZGVmYXVsdCB2YWx1ZXMgYXJlIDMyIGFuZCAxMDI0IHJlc3BlY3RpdmVseS4KLSB4
bCB3aWxsIHVzZSB0aGUgbGlieGwgZGVmYXVsdCBmb3IgbWFwdHJhY2ssIGJ1dCBkb2VzIGl0cyBv
d24gZGVmYXVsdAogIGNhbGN1bGF0aW9uIGZvciBncmFudCBmcmFtZXM6IGVpdGhlciAzMiBvciA2
NCwgYmFzZWQgb24gdGhlIG1heAogIHBvc3NpYmxlIG1mbi4KClRoZXNlIGRlZmF1bHRzIGludGVy
YWN0IHBvb3JseSB3aXRoIHRoZSBoeXBlcnZpc29yIGNvbW1hbmQtbGluZSBsaW1pdDoKCi0gVGhl
IGh5cGVydmlzb3IgY29tbWFuZC1saW5lIGxpbWl0IGNhbm5vdCBiZSB1c2VkIHRvIHJhaXNlIHRo
ZSBsaW1pdAogIGZvciBhbGwgZ3Vlc3RzIGFueW1vcmUsIGFzIHRoZSBkZWZhdWx0IGluIHRoZSB0
b29sc3RhY2sgd2lsbAogIGVmZmVjdGl2ZWx5IG92ZXJyaWRlIHRoaXMuCi0gSWYgeW91IHVzZSB0
aGUgaHlwZXJ2aXNvciBjb21tYW5kLWxpbmUgbGltaXQgdG8gKnJlZHVjZSogdGhlIGxpbWl0LAog
IHRoZW4gdGhlICJkZWZhdWx0IiB2YWx1ZXMgZ2VuZXJhdGVkIGJ5IHRoZSB0b29sc3RhY2sgYXJl
IHRvbyBoaWdoLAogIGFuZCBhbGwgZ3Vlc3QgY3JlYXRpb25zIHdpbGwgZmFpbC4KCkluIG90aGVy
IHdvcmRzLCB0aGUgdG9vbHN0YWNrIGRlZmF1bHRzIHJlcXVpcmUgYW55IGNoYW5nZSB0byBiZQpl
ZmZlY3RlZCBieSBoYXZpbmcgdGhlIGFkbWluIGV4cGxpY2l0bHkgc3BlY2lmeSBhIG5ldyB2YWx1
ZSBpbiBldmVyeQpndWVzdC4KCkluIG9yZGVyIHRvIGFkZHJlc3MgdGhpcywgaGF2ZSBncmFudF90
YWJsZV9pbml0IHRyZWF0IG5lZ2F0aXZlIHZhbHVlcwpmb3IgbWF4X2dyYW50X2ZyYW1lcyBhbmQg
bWF4X21hcHRyYWNrX2ZyYW1lcyBhcyBpbnN0cnVjdGlvbnMgdG8gdXNlIHRoZQpzeXN0ZW0td2lk
ZSBkZWZhdWx0LCBhbmQgaGF2ZSBhbGwgdGhlIGFib3ZlIHRvb2xzdGFja3MgZGVmYXVsdCB0byBw
YXNzaW5nCi0xIHVubGVzcyBhIGRpZmZlcmVudCB2YWx1ZSBpcyBleHBsaWNpdGx5IGNvbmZpZ3Vy
ZWQuCgpUaGlzIHJlc3RvcmVzIHRoZSBvbGQgYmVoYXZpb3IgaW4gdGhhdCBjaGFuZ2luZyB0aGUg
aHlwZXJ2aXNvciBjb21tYW5kLWxpbmUKb3B0aW9uIGNhbiBjaGFuZ2UgdGhlIGJlaGF2aW9yIGZv
ciBhbGwgZ3Vlc3RzLCB3aGlsZSByZXRhaW5pbmcgdGhlIGFiaWxpdHkKdG8gc2V0IHBlci1ndWVz
dCB2YWx1ZXMuICBJdCBhbHNvIHJlbW92ZXMgdGhlIGJ1ZyB0aGF0IHJlZHVjaW5nIHRoZQpzeXN0
ZW0td2lkZSBtYXggd2lsbCBjYXVzZSBhbGwgZG9tYWlucyB3aXRob3V0IGV4cGxpY2l0IGxpbWl0
cyB0byBmYWlsLgoKTk9URTogVGhlIE9jYW1sIGJpbmRpbmdzIHJlcXVpcmUgdGhlIGNhbGxlciB0
byBhbHdheXMgc3BlY2lmeSBhIHZhbHVlLCBhbmQKICAgICAgdGhlIGNvZGUgdG8gc3RhcnQgYSB4
ZW5zdG9yZWQgc3R1YmRvbWFpbiBoYXJkLWNvZGVzIHRoZXNlIHRvIDQgYW5kCiAgICAgIDEyOCBy
ZXNwZWN0aXZlbHk7IHRoaXMgYmVoYXZvdXIgd2lsbCBub3QgYmUgbW9kaWZpZWQuCgpTaWduZWQt
b2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+ClNpZ25lZC1v
ZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KLS0tCkNjOiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2Vvcmdl
IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ2M6IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgpDYzogIk1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSIgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+CkNjOiBWb2xvZHlteXIgQmFiY2h1
ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+CkNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKdjI6CiAtIHJlLXdvcmtlZCBHZW9yZ2UncyBvcmlnaW5hbCBj
b21taXQgbWFzc2FnZSBhIGxpdHRsZQogLSBmaXhlZCB0aGUgdGV4dCBpbiB4bC5jb25mLjUucG9k
CiAtIHVzZSAtMSBhcyB0aGUgc2VudGluZWwgdmFsdWUgZm9yICdkZWZhdWx0JyBhbmQgPCAwIGZv
ciBjaGVja2luZyBpdAotLS0KIGRvY3MvbWFuL3hsLmNvbmYuNS5wb2QgICAgICAgICAgICB8ICA2
ICsrKystLQogdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgICAgICAgIHwgIDQgKystLQogdG9v
bHMvbGlieGwvbGlieGxfdHlwZXMuaWRsICAgICAgIHwgIDQgKystLQogdG9vbHMvcHl0aG9uL3hl
bi9sb3dsZXZlbC94Yy94Yy5jIHwgIDQgKystLQogdG9vbHMveGwveGwuYyAgICAgICAgICAgICAg
ICAgICAgIHwgIDggLS0tLS0tLS0KIHRvb2xzL3hsL3hsX3BhcnNlLmMgICAgICAgICAgICAgICB8
ICAzICsrLQogeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9h
cmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAgICB8ICA0ICsrLS0KIHhlbi9jb21tb24vZ3JhbnRf
dGFibGUuYyAgICAgICAgICB8IDEwICsrKysrKysrLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy9kb21j
dGwuaCAgICAgICB8IDEwICsrKysrKy0tLS0KIHhlbi9pbmNsdWRlL3hlbi9ncmFudF90YWJsZS5o
ICAgICB8ICA4ICsrKystLS0tCiAxMSBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAz
MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5jb25mLjUucG9kIGIvZG9j
cy9tYW4veGwuY29uZi41LnBvZAppbmRleCA5NjIxNDRlMzhlLi4yMDdhYjNlNzdhIDEwMDY0NAot
LS0gYS9kb2NzL21hbi94bC5jb25mLjUucG9kCisrKyBiL2RvY3MvbWFuL3hsLmNvbmYuNS5wb2QK
QEAgLTgxLDEzICs4MSwxNSBAQCBEZWZhdWx0OiBDPC92YXIvbG9jay94bD4KIAogU2V0cyB0aGUg
ZGVmYXVsdCB2YWx1ZSBmb3IgdGhlIEM8bWF4X2dyYW50X2ZyYW1lcz4gZG9tYWluIGNvbmZpZyB2
YWx1ZS4KIAotRGVmYXVsdDogQzwzMj4gb24gaG9zdHMgdXAgdG8gMTZUQiBvZiBtZW1vcnksIEM8
NjQ+IG9uIGhvc3RzIGxhcmdlciB0aGFuIDE2VEIKK0RlZmF1bHQ6IHZhbHVlIG9mIFhlbiBjb21t
YW5kIGxpbmUgQjxnbnR0YWJfbWF4X2ZyYW1lcz4gcGFyYW1ldGVyIChvciBpdHMKK2RlZmF1bHQg
dmFsdWUgaWYgdW5zcGVjaWZpZWQpLgogCiA9aXRlbSBCPG1heF9tYXB0cmFja19mcmFtZXM9TlVN
QkVSPgogCiBTZXRzIHRoZSBkZWZhdWx0IHZhbHVlIGZvciB0aGUgQzxtYXhfbWFwdHJhY2tfZnJh
bWVzPiBkb21haW4gY29uZmlnIHZhbHVlLgogCi1EZWZhdWx0OiBDPDEwMjQ+CitEZWZhdWx0OiB2
YWx1ZSBvZiBYZW4gY29tbWFuZCBsaW5lIEI8Z250dGFiX21heF9tYXB0cmFja19mcmFtZXM+Citw
YXJhbWV0ZXIgKG9yIGl0cyBkZWZhdWx0IHZhbHVlIGlmIHVuc3BlY2lmaWVkKS4KIAogPWl0ZW0g
Qjx2aWYuZGVmYXVsdC5zY3JpcHQ9IlBBVEgiPgogCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9s
aWJ4bC5oIGIvdG9vbHMvbGlieGwvbGlieGwuaAppbmRleCA0OWI1NmZhMWEzLi5hMmE1ZDMyMWM1
IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhs
LmgKQEAgLTM2NCw4ICszNjQsOCBAQAogICovCiAjZGVmaW5lIExJQlhMX0hBVkVfQlVJTERJTkZP
X0dSQU5UX0xJTUlUUyAxCiAKLSNkZWZpbmUgTElCWExfTUFYX0dSQU5UX0ZSQU1FU19ERUZBVUxU
IDMyCi0jZGVmaW5lIExJQlhMX01BWF9NQVBUUkFDS19GUkFNRVNfREVGQVVMVCAxMDI0CisjZGVm
aW5lIExJQlhMX01BWF9HUkFOVF9GUkFNRVNfREVGQVVMVCAtMQorI2RlZmluZSBMSUJYTF9NQVhf
TUFQVFJBQ0tfRlJBTUVTX0RFRkFVTFQgLTEKIAogLyoKICAqIExJQlhMX0hBVkVfQlVJTERJTkZP
XyogaW5kaWNhdGVzIHRoYXQgbGlieGxfZG9tYWluX2J1aWxkX2luZm8gaGFzCmRpZmYgLS1naXQg
YS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5p
ZGwKaW5kZXggMDU0NmQ3ODY1YS4uNjNlMjliYjJmYiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfdHlwZXMuaWRsCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbApAQCAtNTEx
LDggKzUxMSw4IEBAIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvID0gU3RydWN0KCJkb21haW5fYnVp
bGRfaW5mbyIsWwogCiAgICAgKCJ2bnVtYV9ub2RlcyIsIEFycmF5KGxpYnhsX3Zub2RlX2luZm8s
ICJudW1fdm51bWFfbm9kZXMiKSksCiAKLSAgICAoIm1heF9ncmFudF9mcmFtZXMiLCAgICB1aW50
MzIsIHsnaW5pdF92YWwnOiAnTElCWExfTUFYX0dSQU5UX0ZSQU1FU19ERUZBVUxUJ30pLAotICAg
ICgibWF4X21hcHRyYWNrX2ZyYW1lcyIsIHVpbnQzMiwgeydpbml0X3ZhbCc6ICdMSUJYTF9NQVhf
TUFQVFJBQ0tfRlJBTUVTX0RFRkFVTFQnfSksCisgICAgKCJtYXhfZ3JhbnRfZnJhbWVzIiwgICAg
aW50ZWdlciwgeydpbml0X3ZhbCc6ICdMSUJYTF9NQVhfR1JBTlRfRlJBTUVTX0RFRkFVTFQnfSks
CisgICAgKCJtYXhfbWFwdHJhY2tfZnJhbWVzIiwgaW50ZWdlciwgeydpbml0X3ZhbCc6ICdMSUJY
TF9NQVhfTUFQVFJBQ0tfRlJBTUVTX0RFRkFVTFQnfSksCiAgICAgCiAgICAgKCJkZXZpY2VfbW9k
ZWxfdmVyc2lvbiIsIGxpYnhsX2RldmljZV9tb2RlbF92ZXJzaW9uKSwKICAgICAoImRldmljZV9t
b2RlbF9zdHViZG9tYWluIiwgbGlieGxfZGVmYm9vbCksCmRpZmYgLS1naXQgYS90b29scy9weXRo
b24veGVuL2xvd2xldmVsL3hjL3hjLmMgYi90b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hj
LmMKaW5kZXggNDRkMzYwNjE0MS4uYTc1MWU4NTkxMCAxMDA2NDQKLS0tIGEvdG9vbHMvcHl0aG9u
L3hlbi9sb3dsZXZlbC94Yy94Yy5jCisrKyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMv
eGMuYwpAQCAtMTI3LDggKzEyNyw4IEBAIHN0YXRpYyBQeU9iamVjdCAqcHl4Y19kb21haW5fY3Jl
YXRlKFhjT2JqZWN0ICpzZWxmLAogICAgICAgICB9LAogICAgICAgICAubWF4X3ZjcHVzID0gMSwK
ICAgICAgICAgLm1heF9ldnRjaG5fcG9ydCA9IC0xLCAvKiBObyBsaW1pdC4gKi8KLSAgICAgICAg
Lm1heF9ncmFudF9mcmFtZXMgPSAzMiwKLSAgICAgICAgLm1heF9tYXB0cmFja19mcmFtZXMgPSAx
MDI0LAorICAgICAgICAubWF4X2dyYW50X2ZyYW1lcyA9IC0xLAorICAgICAgICAubWF4X21hcHRy
YWNrX2ZyYW1lcyA9IC0xLAogICAgIH07CiAKICAgICBzdGF0aWMgY2hhciAqa3dkX2xpc3RbXSA9
IHsgImRvbWlkIiwgInNzaWRyZWYiLCAiaGFuZGxlIiwgImZsYWdzIiwKZGlmZiAtLWdpdCBhL3Rv
b2xzL3hsL3hsLmMgYi90b29scy94bC94bC5jCmluZGV4IGRkZDI5YjNmMWIuLjA4ZjMxY2M5MGUg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hsLmMKKysrIGIvdG9vbHMveGwveGwuYwpAQCAtOTYsNyAr
OTYsNiBAQCBzdGF0aWMgdm9pZCBwYXJzZV9nbG9iYWxfY29uZmlnKGNvbnN0IGNoYXIgKmNvbmZp
Z2ZpbGUsCiAgICAgWExVX0NvbmZpZyAqY29uZmlnOwogICAgIGludCBlOwogICAgIGNvbnN0IGNo
YXIgKmJ1ZjsKLSAgICBsaWJ4bF9waHlzaW5mbyBwaHlzaW5mbzsKIAogICAgIGNvbmZpZyA9IHhs
dV9jZmdfaW5pdChzdGRlcnIsIGNvbmZpZ2ZpbGUpOwogICAgIGlmICghY29uZmlnKSB7CkBAIC0x
OTksMTMgKzE5OCw2IEBAIHN0YXRpYyB2b2lkIHBhcnNlX2dsb2JhbF9jb25maWcoY29uc3QgY2hh
ciAqY29uZmlnZmlsZSwKIAogICAgIGlmICgheGx1X2NmZ19nZXRfbG9uZyAoY29uZmlnLCAibWF4
X2dyYW50X2ZyYW1lcyIsICZsLCAwKSkKICAgICAgICAgbWF4X2dyYW50X2ZyYW1lcyA9IGw7Ci0g
ICAgZWxzZSB7Ci0gICAgICAgIGxpYnhsX3BoeXNpbmZvX2luaXQoJnBoeXNpbmZvKTsKLSAgICAg
ICAgbWF4X2dyYW50X2ZyYW1lcyA9IChsaWJ4bF9nZXRfcGh5c2luZm8oY3R4LCAmcGh5c2luZm8p
ICE9IDAgfHwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAhKHBoeXNpbmZvLm1heF9wb3Nz
aWJsZV9tZm4gPj4gMzIpKQotICAgICAgICAgICAgICAgICAgICAgICAgICAgPyAzMiA6IDY0Owot
ICAgICAgICBsaWJ4bF9waHlzaW5mb19kaXNwb3NlKCZwaHlzaW5mbyk7Ci0gICAgfQogICAgIGlm
ICgheGx1X2NmZ19nZXRfbG9uZyAoY29uZmlnLCAibWF4X21hcHRyYWNrX2ZyYW1lcyIsICZsLCAw
KSkKICAgICAgICAgbWF4X21hcHRyYWNrX2ZyYW1lcyA9IGw7CiAKZGlmZiAtLWdpdCBhL3Rvb2xz
L3hsL3hsX3BhcnNlLmMgYi90b29scy94bC94bF9wYXJzZS5jCmluZGV4IDExMmY4ZWUwMjYuLjc1
NTQwNDhmMGIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMKKysrIGIvdG9vbHMveGwv
eGxfcGFyc2UuYwpAQCAtMTQxNSw5ICsxNDE1LDEwIEBAIHZvaWQgcGFyc2VfY29uZmlnX2RhdGEo
Y29uc3QgY2hhciAqY29uZmlnX3NvdXJjZSwKICAgICAgICAgYl9pbmZvLT5tYXhfZ3JhbnRfZnJh
bWVzID0gbDsKICAgICBlbHNlCiAgICAgICAgIGJfaW5mby0+bWF4X2dyYW50X2ZyYW1lcyA9IG1h
eF9ncmFudF9mcmFtZXM7CisKICAgICBpZiAoIXhsdV9jZmdfZ2V0X2xvbmcgKGNvbmZpZywgIm1h
eF9tYXB0cmFja19mcmFtZXMiLCAmbCwgMCkpCiAgICAgICAgIGJfaW5mby0+bWF4X21hcHRyYWNr
X2ZyYW1lcyA9IGw7Ci0gICAgZWxzZSBpZiAobWF4X21hcHRyYWNrX2ZyYW1lcyAhPSAtMSkKKyAg
ICBlbHNlCiAgICAgICAgIGJfaW5mby0+bWF4X21hcHRyYWNrX2ZyYW1lcyA9IG1heF9tYXB0cmFj
a19mcmFtZXM7CiAKICAgICBsaWJ4bF9kZWZib29sX3NldCgmYl9pbmZvLT5jbGFpbV9tb2RlLCBj
bGFpbV9tb2RlKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gv
YXJtL3NldHVwLmMKaW5kZXggNTFkMzIxMDZiNy4uM2M4OTljZDRhMCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL3NldHVwLmMKKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKQEAgLTc4OSw3ICs3
ODksNyBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zm
c2V0LAogICAgICAgICAuZmxhZ3MgPSBYRU5fRE9NQ1RMX0NERl9odm0gfCBYRU5fRE9NQ1RMX0NE
Rl9oYXAsCiAgICAgICAgIC5tYXhfZXZ0Y2huX3BvcnQgPSAtMSwKICAgICAgICAgLm1heF9ncmFu
dF9mcmFtZXMgPSBnbnR0YWJfZG9tMF9mcmFtZXMoKSwKLSAgICAgICAgLm1heF9tYXB0cmFja19m
cmFtZXMgPSBvcHRfbWF4X21hcHRyYWNrX2ZyYW1lcywKKyAgICAgICAgLm1heF9tYXB0cmFja19m
cmFtZXMgPSAtMSwKICAgICB9OwogICAgIGludCByYzsKIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwppbmRleCAwMGVlODdiZGU1Li43ZDI3
ZjM2MDUzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJjaC94
ODYvc2V0dXAuYwpAQCAtNjk3LDggKzY5Nyw4IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3Rh
cnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCiAgICAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRl
ZG9tYWluIGRvbTBfY2ZnID0gewogICAgICAgICAuZmxhZ3MgPSBJU19FTkFCTEVEKENPTkZJR19U
Qk9PVCkgPyBYRU5fRE9NQ1RMX0NERl9zM19pbnRlZ3JpdHkgOiAwLAogICAgICAgICAubWF4X2V2
dGNobl9wb3J0ID0gLTEsCi0gICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gb3B0X21heF9ncmFu
dF9mcmFtZXMsCi0gICAgICAgIC5tYXhfbWFwdHJhY2tfZnJhbWVzID0gb3B0X21heF9tYXB0cmFj
a19mcmFtZXMsCisgICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gLTEsCisgICAgICAgIC5tYXhf
bWFwdHJhY2tfZnJhbWVzID0gLTEsCiAgICAgfTsKIAogICAgIC8qIENyaXRpY2FsIHJlZ2lvbiB3
aXRob3V0IElEVCBvciBUU1MuICBBbnkgZmF1bHQgaXMgZGVhZGx5ISAqLwpkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCmluZGV4
IGIzNGQ1MjBmNmQuLjY5NzJjZWYxZGUgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFi
bGUuYworKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKQEAgLTE4MzcsMTIgKzE4MzcsMTgg
QEAgYWN0aXZlX2FsbG9jX2ZhaWxlZDoKICAgICByZXR1cm4gLUVOT01FTTsKIH0KIAotaW50IGdy
YW50X3RhYmxlX2luaXQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IG1heF9ncmFudF9m
cmFtZXMsCi0gICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbWF4X21hcHRyYWNrX2Zy
YW1lcykKK2ludCBncmFudF90YWJsZV9pbml0KHN0cnVjdCBkb21haW4gKmQsIGludCBtYXhfZ3Jh
bnRfZnJhbWVzLAorICAgICAgICAgICAgICAgICAgICAgaW50IG1heF9tYXB0cmFja19mcmFtZXMp
CiB7CiAgICAgc3RydWN0IGdyYW50X3RhYmxlICpndDsKICAgICBpbnQgcmV0ID0gLUVOT01FTTsK
IAorICAgIC8qIERlZmF1bHQgdG8gbWF4aW11bSB2YWx1ZSBpZiBubyB2YWx1ZSB3YXMgc3BlY2lm
aWVkICovCisgICAgaWYgKCBtYXhfZ3JhbnRfZnJhbWVzIDwgMCApCisgICAgICAgIG1heF9ncmFu
dF9mcmFtZXMgPSBvcHRfbWF4X2dyYW50X2ZyYW1lczsKKyAgICBpZiAoIG1heF9tYXB0cmFja19m
cmFtZXMgPCAwICkKKyAgICAgICAgbWF4X21hcHRyYWNrX2ZyYW1lcyA9IG9wdF9tYXhfbWFwdHJh
Y2tfZnJhbWVzOworCiAgICAgaWYgKCBtYXhfZ3JhbnRfZnJhbWVzIDwgSU5JVElBTF9OUl9HUkFO
VF9GUkFNRVMgfHwKICAgICAgICAgIG1heF9ncmFudF9mcmFtZXMgPiBvcHRfbWF4X2dyYW50X2Zy
YW1lcyB8fAogICAgICAgICAgbWF4X21hcHRyYWNrX2ZyYW1lcyA+IG9wdF9tYXhfbWFwdHJhY2tf
ZnJhbWVzICkKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCBiL3hlbi9p
bmNsdWRlL3B1YmxpYy9kb21jdGwuaAppbmRleCA5ZjJjZmQ2MDJjLi5lMzEzZGE0OTlmIDEwMDY0
NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKKysrIGIveGVuL2luY2x1ZGUvcHVi
bGljL2RvbWN0bC5oCkBAIC04MiwxMyArODIsMTUgQEAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRl
ZG9tYWluIHsKICAgICB1aW50MzJfdCBpb21tdV9vcHRzOwogCiAgICAgLyoKLSAgICAgKiBWYXJp
b3VzIGRvbWFpbiBsaW1pdHMsIHdoaWNoIGltcGFjdCB0aGUgcXVhbnRpdHkgb2YgcmVzb3VyY2Vz
IChnbG9iYWwKLSAgICAgKiBtYXBwaW5nIHNwYWNlLCB4ZW5oZWFwLCBldGMpIGEgZ3Vlc3QgbWF5
IGNvbnN1bWUuCisgICAgICogVmFyaW91cyBkb21haW4gbGltaXRzLCB3aGljaCBpbXBhY3QgdGhl
IHF1YW50aXR5IG9mIHJlc291cmNlcworICAgICAqIChnbG9iYWwgbWFwcGluZyBzcGFjZSwgeGVu
aGVhcCwgZXRjKSBhIGd1ZXN0IG1heSBjb25zdW1lLiAgRm9yCisgICAgICogbWF4X2dyYW50X2Zy
YW1lcyBhbmQgbWF4X21hcHRyYWNrX2ZyYW1lcywgPCAwIG1lYW5zICJ1c2UgdGhlCisgICAgICog
ZGVmYXVsdCBtYXhpbXVtIHZhbHVlIGluIHRoZSBoeXBlcnZpc29yIi4KICAgICAgKi8KICAgICB1
aW50MzJfdCBtYXhfdmNwdXM7CiAgICAgdWludDMyX3QgbWF4X2V2dGNobl9wb3J0OwotICAgIHVp
bnQzMl90IG1heF9ncmFudF9mcmFtZXM7Ci0gICAgdWludDMyX3QgbWF4X21hcHRyYWNrX2ZyYW1l
czsKKyAgICBpbnQzMl90IG1heF9ncmFudF9mcmFtZXM7CisgICAgaW50MzJfdCBtYXhfbWFwdHJh
Y2tfZnJhbWVzOwogCiAgICAgc3RydWN0IHhlbl9hcmNoX2RvbWFpbmNvbmZpZyBhcmNoOwogfTsK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9ncmFudF90YWJsZS5oIGIveGVuL2luY2x1ZGUv
eGVuL2dyYW50X3RhYmxlLmgKaW5kZXggNmY5MzQ1ZDllZi4uMzQ4ODZiYjZmOCAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUveGVuL2dyYW50X3RhYmxlLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2dy
YW50X3RhYmxlLmgKQEAgLTM2LDggKzM2LDggQEAgZXh0ZXJuIHVuc2lnbmVkIGludCBvcHRfbWF4
X2dyYW50X2ZyYW1lczsKIGV4dGVybiB1bnNpZ25lZCBpbnQgb3B0X21heF9tYXB0cmFja19mcmFt
ZXM7CiAKIC8qIENyZWF0ZS9kZXN0cm95IHBlci1kb21haW4gZ3JhbnQgdGFibGUgY29udGV4dC4g
Ki8KLWludCBncmFudF90YWJsZV9pbml0KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBt
YXhfZ3JhbnRfZnJhbWVzLAotICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG1heF9t
YXB0cmFja19mcmFtZXMpOworaW50IGdyYW50X3RhYmxlX2luaXQoc3RydWN0IGRvbWFpbiAqZCwg
aW50IG1heF9ncmFudF9mcmFtZXMsCisgICAgICAgICAgICAgICAgICAgICBpbnQgbWF4X21hcHRy
YWNrX2ZyYW1lcyk7CiB2b2lkIGdyYW50X3RhYmxlX2Rlc3Ryb3koCiAgICAgc3RydWN0IGRvbWFp
biAqZCk7CiB2b2lkIGdyYW50X3RhYmxlX2luaXRfdmNwdShzdHJ1Y3QgdmNwdSAqdik7CkBAIC02
OCw4ICs2OCw4IEBAIGludCBnbnR0YWJfZ2V0X3N0YXR1c19mcmFtZShzdHJ1Y3QgZG9tYWluICpk
LCB1bnNpZ25lZCBsb25nIGlkeCwKICNkZWZpbmUgb3B0X21heF9tYXB0cmFja19mcmFtZXMgMAog
CiBzdGF0aWMgaW5saW5lIGludCBncmFudF90YWJsZV9pbml0KHN0cnVjdCBkb21haW4gKmQsCi0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYXhfZ3JhbnRf
ZnJhbWVzLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
bWF4X21hcHRyYWNrX2ZyYW1lcykKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50IG1heF9ncmFudF9mcmFtZXMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGludCBtYXhfbWFwdHJhY2tfZnJhbWVzKQogewogICAgIHJldHVybiAwOwogfQotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
