Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA12C113C6D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 08:35:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iclb2-0006Yv-OV; Thu, 05 Dec 2019 07:30:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iclb0-0006Yo-U8
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 07:30:42 +0000
X-Inumbo-ID: 23b76d1d-1731-11ea-8214-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23b76d1d-1731-11ea-8214-12813bfff9fa;
 Thu, 05 Dec 2019 07:30:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 77CAAB25B;
 Thu,  5 Dec 2019 07:30:41 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <521c23e1-9d89-8f26-572c-1b6f6bc3cbaa@suse.com>
Message-ID: <bc2f836d-5283-2707-1488-53c4234ec873@suse.com>
Date: Thu, 5 Dec 2019 08:30:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <521c23e1-9d89-8f26-572c-1b6f6bc3cbaa@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/3] lz4: pull out constant tables
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUmFzbXVzIFZpbGxlbW9lcyA8bGludXhAcmFzbXVzdmlsbGVtb2VzLmRrPgoKVGhlcmUn
cyBubyByZWFzb24gdG8gYWxsb2NhdGUgdGhlIGRlY3szMiw2NH10YWJsZSBvbiB0aGUgc3RhY2s7
IGl0Cmp1c3Qgd2FzdGVzIGEgYnVuY2ggb2YgaW5zdHJ1Y3Rpb25zIHNldHRpbmcgdGhlbSB1cCBh
bmQsIG9mIGNvdXJzZSwKYWxzbyBjb25zdW1lcyBxdWl0ZSBhIGJpdCBvZiBzdGFjay4gVXNpbmcg
c2l6ZV90IGZvciBzdWNoIHNtYWxsCmludGVnZXJzIGlzIGEgbGl0dGxlIGV4Y2Vzc2l2ZS4KCiQg
c2NyaXB0cy9ibG9hdC1vLW1ldGVyIC90bXAvYnVpbHQtaW4ubyBsaWIvYnVpbHQtaW4ubwphZGQv
cmVtb3ZlOiAyLzIgZ3Jvdy9zaHJpbms6IDIvMCB1cC9kb3duOiAxMzA0Ly0xNTQ4ICgtMjQ0KQpm
dW5jdGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbGQgICAgIG5ldyAg
IGRlbHRhCmx6NF9kZWNvbXByZXNzX3Vua25vd25vdXRwdXRzaXplICAgICAgICAgICAgICA1NSAg
ICAgNzE4ICAgICs2NjMKbHo0X2RlY29tcHJlc3MgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDU1ICAgICA2MzIgICAgKzU3NwpkZWM2NHRhYmxlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0gICAgICAzMiAgICAgKzMyCmRlYzMydGFibGUgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLSAgICAgIDMyICAgICArMzIKbHo0X3VuY29tcHJlc3MgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgNzQ3ICAgICAgIC0gICAgLTc0NwpsejRfdW5jb21w
cmVzc191bmtub3dub3V0cHV0c2l6ZSAgICAgICAgICAgICA4MDEgICAgICAgLSAgICAtODAxCgpU
aGUgbm93IGlubGluZWQgbHo0X3VuY29tcHJlc3MgZnVuY3Rpb25zIHVzZWQgdG8gaGF2ZSBhIHN0
YWNrCmZvb3RwcmludCBvZiAxNzYgYnl0ZXMgKGFjY29yZGluZyB0byAtZnN0YWNrLXVzYWdlKTsg
dGhlaXIgaW5saW5lZXMKaGF2ZSBpbmNyZWFzZWQgdGhlaXIgc3RhY2sgdXNlIGZyb20gMzIgYnl0
ZXMgdG8gNDggYW5kIDgwIGJ5dGVzLApyZXNwZWN0aXZlbHkuCgpTaWduZWQtb2ZmLWJ5OiBSYXNt
dXMgVmlsbGVtb2VzIDxsaW51eEByYXNtdXN2aWxsZW1vZXMuZGs+CltMaW51eCBjb21taXQgYmVh
MmI1OTJmZDE4ZWI4ZmZhM2ZjNGFkMzgwNjEwNjMyZDAzYTM4Zl0KClVzZSB7LHV9aW50OF90IGlu
c3RlYWQgb2YgcGxhaW4gImludCIgZm9yIHRoZSB0YWJsZXMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vY29tbW9uL2x6NC9kZWNvbXBy
ZXNzLmMKKysrIGIveGVuL2NvbW1vbi9sejQvZGVjb21wcmVzcy5jCkBAIC0zOSw2ICszOSwxMSBA
QAogCiAjaW5jbHVkZSAiZGVmcy5oIgogCitzdGF0aWMgY29uc3QgdWludDhfdCBkZWMzMnRhYmxl
W10gPSB7MCwgMywgMiwgMywgMCwgMCwgMCwgMH07CisjaWYgTFo0X0FSQ0g2NAorc3RhdGljIGNv
bnN0IGludDhfdCBkZWM2NHRhYmxlW10gPSB7MCwgMCwgMCwgLTEsIDAsIDEsIDIsIDN9OworI2Vu
ZGlmCisKICNpZiBkZWZpbmVkKF9fWEVOX18pIHx8IGRlZmluZWQoX19NSU5JT1NfXykKIAogc3Rh
dGljIGludCBJTklUIGx6NF91bmNvbXByZXNzKGNvbnN0IHVuc2lnbmVkIGNoYXIgKnNvdXJjZSwg
dW5zaWduZWQgY2hhciAqZGVzdCwKQEAgLTUxLDEwICs1Niw2IEBAIHN0YXRpYyBpbnQgSU5JVCBs
ejRfdW5jb21wcmVzcyhjb25zdCB1bnMKIAlCWVRFICpjcHk7CiAJdW5zaWduZWQgdG9rZW47CiAJ
c2l6ZV90IGxlbmd0aDsKLQlzaXplX3QgZGVjMzJ0YWJsZVtdID0gezAsIDMsIDIsIDMsIDAsIDAs
IDAsIDB9OwotI2lmIExaNF9BUkNINjQKLQlzaXplX3QgZGVjNjR0YWJsZVtdID0gezAsIDAsIDAs
IC0xLCAwLCAxLCAyLCAzfTsKLSNlbmRpZgogCiAJd2hpbGUgKDEpIHsKIApAQCAtMTA5LDcgKzEx
MCw3IEBAIHN0YXRpYyBpbnQgSU5JVCBsejRfdW5jb21wcmVzcyhjb25zdCB1bnMKIAkJLyogY29w
eSByZXBlYXRlZCBzZXF1ZW5jZSAqLwogCQlpZiAodW5saWtlbHkoKG9wIC0gcmVmKSA8IFNURVBT
SVpFKSkgewogI2lmIExaNF9BUkNINjQKLQkJCXNpemVfdCBkZWM2NCA9IGRlYzY0dGFibGVbb3Ag
LSByZWZdOworCQkJaW50IGRlYzY0ID0gZGVjNjR0YWJsZVtvcCAtIHJlZl07CiAjZWxzZQogCQkJ
Y29uc3QgaW50IGRlYzY0ID0gMDsKICNlbmRpZgpAQCAtMTc1LDExICsxNzYsNiBAQCBzdGF0aWMg
aW50IGx6NF91bmNvbXByZXNzX3Vua25vd25vdXRwdXRzCiAJQllURSAqIGNvbnN0IG9lbmQgPSBv
cCArIG1heG91dHB1dHNpemU7CiAJQllURSAqY3B5OwogCi0Jc2l6ZV90IGRlYzMydGFibGVbXSA9
IHswLCAzLCAyLCAzLCAwLCAwLCAwLCAwfTsKLSNpZiBMWjRfQVJDSDY0Ci0Jc2l6ZV90IGRlYzY0
dGFibGVbXSA9IHswLCAwLCAwLCAtMSwgMCwgMSwgMiwgM307Ci0jZW5kaWYKLQogCS8qIE1haW4g
TG9vcCAqLwogCXdoaWxlIChpcCA8IGllbmQpIHsKIApAQCAtMjQ1LDcgKzI0MSw3IEBAIHN0YXRp
YyBpbnQgbHo0X3VuY29tcHJlc3NfdW5rbm93bm91dHB1dHMKIAkJLyogY29weSByZXBlYXRlZCBz
ZXF1ZW5jZSAqLwogCQlpZiAodW5saWtlbHkoKG9wIC0gcmVmKSA8IFNURVBTSVpFKSkgewogI2lm
IExaNF9BUkNINjQKLQkJCXNpemVfdCBkZWM2NCA9IGRlYzY0dGFibGVbb3AgLSByZWZdOworCQkJ
aW50IGRlYzY0ID0gZGVjNjR0YWJsZVtvcCAtIHJlZl07CiAjZWxzZQogCQkJY29uc3QgaW50IGRl
YzY0ID0gMDsKICNlbmRpZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
