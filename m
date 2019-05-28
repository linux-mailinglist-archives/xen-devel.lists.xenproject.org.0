Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131692C456
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:35:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZQ1-0004XC-FG; Tue, 28 May 2019 10:33:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQ0-0004X2-5h
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:20 +0000
X-Inumbo-ID: 012daa16-8134-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 012daa16-8134-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 10:33:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 88C92AFDD;
 Tue, 28 May 2019 10:33:16 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:32:16 +0200
Message-Id: <20190528103313.1343-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 03/60] xen/sched: let sched_switch_sched()
 return new lock address
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5zdGVhZCBvZiBzZXR0aW5nIHRoZSBzY2hlZHVsZXIgcGVyY3B1IGxvY2sgYWRkcmVzcyBpbiBl
YWNoIG9mIHRoZQpzd2l0Y2hfc2NoZWQgaW5zdGFuY2VzIG9mIHRoZSBkaWZmZXJlbnQgc2NoZWR1
bGVycyBkbyB0aGF0IGluCnNjaGVkdWxlX2NwdV9zd2l0Y2goKSB3aGljaCBpcyB0aGUgc2luZ2xl
IGNhbGxlciBvZiB0aGF0IGZ1bmN0aW9uLgpGb3IgdGhhdCBwdXJwb3NlIGxldCBzY2hlZF9zd2l0
Y2hfc2NoZWQoKSBqdXN0IHJldHVybiB0aGUgbmV3IGxvY2sKYWRkcmVzcy4KClRoaXMgYWxsb3dz
IHRvIHNldCB0aGUgbmV3IHN0cnVjdCBzY2hlZHVsZXIgYW5kIHN0cnVjdCBzY2hlZHVsZV9kYXRh
CnZhbHVlcyBpbiB0aGUgcGVyY3B1IGFyZWEgaW4gc2NoZWR1bGVfY3B1X3N3aXRjaCgpIGluc3Rl
YWQgb2YgdGhlCnNjaGVkdWxlcnMsIHRvby4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMgfCAxNCAr
Ky0tLS0tLS0tLS0tLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYyAgIHwgMTMgKystLS0tLS0t
LS0tLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgIHwgMTUgKysrLS0tLS0tLS0tLS0tCiB4
ZW4vY29tbW9uL3NjaGVkX251bGwuYyAgICAgfCAxNiArKysrLS0tLS0tLS0tLS0tCiB4ZW4vY29t
bW9uL3NjaGVkX3J0LmMgICAgICAgfCAxMiArKy0tLS0tLS0tLS0KIHhlbi9jb21tb24vc2NoZWR1
bGUuYyAgICAgICB8IDE4ICsrKysrKysrKysrKysrKy0tLQogeGVuL2luY2x1ZGUveGVuL3NjaGVk
LWlmLmggIHwgIDkgKysrKystLS0tCiA3IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyks
IDY0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMu
YyBiL3hlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYwppbmRleCBhNGM2ZDAwYjgxLi43MmI5ODhl
YTVmIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMKKysrIGIveGVuL2Nv
bW1vbi9zY2hlZF9hcmluYzY1My5jCkBAIC02MzAsNyArNjMwLDcgQEAgYTY1M3NjaGVkX3BpY2tf
Y3B1KGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHZjcHUgKnZjKQogICogQHBh
cmFtIHBkYXRhICAgICBzY2hlZHVsZXIgc3BlY2lmaWMgUENQVSBkYXRhICh3ZSBkb24ndCBoYXZl
IGFueSkKICAqIEBwYXJhbSB2ZGF0YSAgICAgc2NoZWR1bGVyIHNwZWNpZmljIFZDUFUgZGF0YSBv
ZiB0aGUgaWRsZSB2Y3B1CiAgKi8KLXN0YXRpYyB2b2lkCitzdGF0aWMgc3BpbmxvY2tfdCAqCiBh
NjUzX3N3aXRjaF9zY2hlZChzdHJ1Y3Qgc2NoZWR1bGVyICpuZXdfb3BzLCB1bnNpZ25lZCBpbnQg
Y3B1LAogICAgICAgICAgICAgICAgICAgdm9pZCAqcGRhdGEsIHZvaWQgKnZkYXRhKQogewpAQCAt
NjQxLDE3ICs2NDEsNyBAQCBhNjUzX3N3aXRjaF9zY2hlZChzdHJ1Y3Qgc2NoZWR1bGVyICpuZXdf
b3BzLCB1bnNpZ25lZCBpbnQgY3B1LAogCiAgICAgaWRsZV92Y3B1W2NwdV0tPnNjaGVkX3ByaXYg
PSB2ZGF0YTsKIAotICAgIHBlcl9jcHUoc2NoZWR1bGVyLCBjcHUpID0gbmV3X29wczsKLSAgICBw
ZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSkuc2NoZWRfcHJpdiA9IE5VTEw7IC8qIG5vIHBkYXRh
ICovCi0KLSAgICAvKgotICAgICAqIChSZT8pcm91dGUgdGhlIGxvY2sgdG8gaXRzIGRlZmF1bHQg
bG9jYXRpb24uIFdlIGFjdHVhbGx5IGRvIG5vdCB1c2UKLSAgICAgKiBpdCwgYnV0IGlmIHdlIGxl
YXZlIGl0IHBvaW50aW5nIHRvIHdoZXJlIGl0IGRvZXMgbm93IChpLmUuLCB0aGUKLSAgICAgKiBy
dW5xdWV1ZSBsb2NrIGZvciB0aGlzIFBDUFUgaW4gdGhlIGRlZmF1bHQgc2NoZWR1bGVyKSwgd2Un
ZCBiZQotICAgICAqIGNhdXNpbmcgdW5uZWNlc3NhcnkgY29udGVudGlvbiBvbiB0aGF0IGxvY2sg
KGluIGNhc2VzIHdoZXJlIGl0IGlzCi0gICAgICogc2hhcmVkIGFtb25nIG11bHRpcGxlIFBDUFVz
LCBsaWtlIGluIENyZWRpdDIgYW5kIFJURFMpLgotICAgICAqLwotICAgIHNkLT5zY2hlZHVsZV9s
b2NrID0gJnNkLT5fbG9jazsKKyAgICByZXR1cm4gJnNkLT5fbG9jazsKIH0KIAogLyoqCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVk
aXQuYwppbmRleCA3YjdmYWNiYWNlLi42MjFjNDA4ZWQwIDEwMDY0NAotLS0gYS94ZW4vY29tbW9u
L3NjaGVkX2NyZWRpdC5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKQEAgLTYzMSw3
ICs2MzEsNyBAQCBjc2NoZWRfaW5pdF9wZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMs
IHZvaWQgKnBkYXRhLCBpbnQgY3B1KQogfQogCiAvKiBDaGFuZ2UgdGhlIHNjaGVkdWxlciBvZiBj
cHUgdG8gdXMgKENyZWRpdCkuICovCi1zdGF0aWMgdm9pZAorc3RhdGljIHNwaW5sb2NrX3QgKgog
Y3NjaGVkX3N3aXRjaF9zY2hlZChzdHJ1Y3Qgc2NoZWR1bGVyICpuZXdfb3BzLCB1bnNpZ25lZCBp
bnQgY3B1LAogICAgICAgICAgICAgICAgICAgICB2b2lkICpwZGF0YSwgdm9pZCAqdmRhdGEpCiB7
CkBAIC02NTMsMTYgKzY1Myw3IEBAIGNzY2hlZF9zd2l0Y2hfc2NoZWQoc3RydWN0IHNjaGVkdWxl
ciAqbmV3X29wcywgdW5zaWduZWQgaW50IGNwdSwKICAgICBpbml0X3BkYXRhKHBydiwgcGRhdGEs
IGNwdSk7CiAgICAgc3Bpbl91bmxvY2soJnBydi0+bG9jayk7CiAKLSAgICBwZXJfY3B1KHNjaGVk
dWxlciwgY3B1KSA9IG5ld19vcHM7Ci0gICAgcGVyX2NwdShzY2hlZHVsZV9kYXRhLCBjcHUpLnNj
aGVkX3ByaXYgPSBwZGF0YTsKLQotICAgIC8qCi0gICAgICogKFJlPylyb3V0ZSB0aGUgbG9jayB0
byB0aGUgcGVyIHBDUFUgbG9jayBhcyAvbGFzdC8gdGhpbmcuIEluIGZhY3QsCi0gICAgICogaWYg
aXQgaXMgZnJlZSAoYW5kIGl0IGNhbiBiZSkgd2Ugd2FudCB0aGF0IGFueW9uZSB0aGF0IG1hbmFn
ZXMKLSAgICAgKiB0YWtpbmcgaXQsIGZpbmRzIGFsbCB0aGUgaW5pdGlhbGl6YXRpb25zIHdlJ3Zl
IGRvbmUgYWJvdmUgaW4gcGxhY2UuCi0gICAgICovCi0gICAgc21wX21iKCk7Ci0gICAgc2QtPnNj
aGVkdWxlX2xvY2sgPSAmc2QtPl9sb2NrOworICAgIHJldHVybiAmc2QtPl9sb2NrOwogfQogCiAj
aWZuZGVmIE5ERUJVRwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgYi94
ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwppbmRleCA5YzFjM2I0ZTA4Li44ZTQzODFkOGE3IDEw
MDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYworKysgYi94ZW4vY29tbW9uL3Nj
aGVkX2NyZWRpdDIuYwpAQCAtMzg1NSw3ICszODU1LDcgQEAgY3NjaGVkMl9pbml0X3BkYXRhKGNv
bnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgdm9pZCAqcGRhdGEsIGludCBjcHUpCiB9CiAKIC8q
IENoYW5nZSB0aGUgc2NoZWR1bGVyIG9mIGNwdSB0byB1cyAoQ3JlZGl0MikuICovCi1zdGF0aWMg
dm9pZAorc3RhdGljIHNwaW5sb2NrX3QgKgogY3NjaGVkMl9zd2l0Y2hfc2NoZWQoc3RydWN0IHNj
aGVkdWxlciAqbmV3X29wcywgdW5zaWduZWQgaW50IGNwdSwKICAgICAgICAgICAgICAgICAgICAg
IHZvaWQgKnBkYXRhLCB2b2lkICp2ZGF0YSkKIHsKQEAgLTM4ODgsMTggKzM4ODgsOSBAQCBjc2No
ZWQyX3N3aXRjaF9zY2hlZChzdHJ1Y3Qgc2NoZWR1bGVyICpuZXdfb3BzLCB1bnNpZ25lZCBpbnQg
Y3B1LAogICAgICAqLwogICAgIEFTU0VSVChwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSkuc2No
ZWR1bGVfbG9jayAhPSAmcHJ2LT5ycWRbcnFpXS5sb2NrKTsKIAotICAgIHBlcl9jcHUoc2NoZWR1
bGVyLCBjcHUpID0gbmV3X29wczsKLSAgICBwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSkuc2No
ZWRfcHJpdiA9IHBkYXRhOwotCi0gICAgLyoKLSAgICAgKiAoUmU/KXJvdXRlIHRoZSBsb2NrIHRv
IHRoZSBwZXIgcENQVSBsb2NrIGFzIC9sYXN0LyB0aGluZy4gSW4gZmFjdCwKLSAgICAgKiBpZiBp
dCBpcyBmcmVlIChhbmQgaXQgY2FuIGJlKSB3ZSB3YW50IHRoYXQgYW55b25lIHRoYXQgbWFuYWdl
cwotICAgICAqIHRha2luZyBpdCwgZmluZCBhbGwgdGhlIGluaXRpYWxpemF0aW9ucyB3ZSd2ZSBk
b25lIGFib3ZlIGluIHBsYWNlLgotICAgICAqLwotICAgIHNtcF9tYigpOwotICAgIHBlcl9jcHUo
c2NoZWR1bGVfZGF0YSwgY3B1KS5zY2hlZHVsZV9sb2NrID0gJnBydi0+cnFkW3JxaV0ubG9jazsK
LQogICAgIHdyaXRlX3VubG9jaygmcHJ2LT5sb2NrKTsKKworICAgIHJldHVybiAmcHJ2LT5ycWRb
cnFpXS5sb2NrOwogfQogCiBzdGF0aWMgdm9pZApkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hl
ZF9udWxsLmMgYi94ZW4vY29tbW9uL3NjaGVkX251bGwuYwppbmRleCBhNTlkYmIyNjkyLi4xMDQy
N2IzN2FiIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX251bGwuYworKysgYi94ZW4vY29t
bW9uL3NjaGVkX251bGwuYwpAQCAtMzgxLDggKzM4MSw5IEBAIHN0YXRpYyB2b2lkIHZjcHVfZGVh
c3NpZ24oc3RydWN0IG51bGxfcHJpdmF0ZSAqcHJ2LCBzdHJ1Y3QgdmNwdSAqdiwKIH0KIAogLyog
Q2hhbmdlIHRoZSBzY2hlZHVsZXIgb2YgY3B1IHRvIHVzIChudWxsKS4gKi8KLXN0YXRpYyB2b2lk
IG51bGxfc3dpdGNoX3NjaGVkKHN0cnVjdCBzY2hlZHVsZXIgKm5ld19vcHMsIHVuc2lnbmVkIGlu
dCBjcHUsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpwZGF0YSwgdm9pZCAq
dmRhdGEpCitzdGF0aWMgc3BpbmxvY2tfdCAqbnVsbF9zd2l0Y2hfc2NoZWQoc3RydWN0IHNjaGVk
dWxlciAqbmV3X29wcywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgY3B1LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQg
KnBkYXRhLCB2b2lkICp2ZGF0YSkKIHsKICAgICBzdHJ1Y3Qgc2NoZWR1bGVfZGF0YSAqc2QgPSAm
cGVyX2NwdShzY2hlZHVsZV9kYXRhLCBjcHUpOwogICAgIHN0cnVjdCBudWxsX3ByaXZhdGUgKnBy
diA9IG51bGxfcHJpdihuZXdfb3BzKTsKQEAgLTQwMSwxNiArNDAyLDcgQEAgc3RhdGljIHZvaWQg
bnVsbF9zd2l0Y2hfc2NoZWQoc3RydWN0IHNjaGVkdWxlciAqbmV3X29wcywgdW5zaWduZWQgaW50
IGNwdSwKIAogICAgIGluaXRfcGRhdGEocHJ2LCBjcHUpOwogCi0gICAgcGVyX2NwdShzY2hlZHVs
ZXIsIGNwdSkgPSBuZXdfb3BzOwotICAgIHBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KS5zY2hl
ZF9wcml2ID0gcGRhdGE7Ci0KLSAgICAvKgotICAgICAqIChSZT8pcm91dGUgdGhlIGxvY2sgdG8g
dGhlIHBlciBwQ1BVIGxvY2sgYXMgL2xhc3QvIHRoaW5nLiBJbiBmYWN0LAotICAgICAqIGlmIGl0
IGlzIGZyZWUgKGFuZCBpdCBjYW4gYmUpIHdlIHdhbnQgdGhhdCBhbnlvbmUgdGhhdCBtYW5hZ2Vz
Ci0gICAgICogdGFraW5nIGl0LCBmaW5kcyBhbGwgdGhlIGluaXRpYWxpemF0aW9ucyB3ZSd2ZSBk
b25lIGFib3ZlIGluIHBsYWNlLgotICAgICAqLwotICAgIHNtcF9tYigpOwotICAgIHNkLT5zY2hl
ZHVsZV9sb2NrID0gJnNkLT5fbG9jazsKKyAgICByZXR1cm4gJnNkLT5fbG9jazsKIH0KIAogc3Rh
dGljIHZvaWQgbnVsbF92Y3B1X2luc2VydChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0
cnVjdCB2Y3B1ICp2KQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9ydC5jIGIveGVuL2Nv
bW1vbi9zY2hlZF9ydC5jCmluZGV4IGYxYjgxZjAzNzMuLjBhY2ZjM2Q3MDIgMTAwNjQ0Ci0tLSBh
L3hlbi9jb21tb24vc2NoZWRfcnQuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX3J0LmMKQEAgLTcy
OSw3ICs3MjksNyBAQCBydF9pbml0X3BkYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywg
dm9pZCAqcGRhdGEsIGludCBjcHUpCiB9CiAKIC8qIENoYW5nZSB0aGUgc2NoZWR1bGVyIG9mIGNw
dSB0byB1cyAoUlREUykuICovCi1zdGF0aWMgdm9pZAorc3RhdGljIHNwaW5sb2NrX3QgKgogcnRf
c3dpdGNoX3NjaGVkKHN0cnVjdCBzY2hlZHVsZXIgKm5ld19vcHMsIHVuc2lnbmVkIGludCBjcHUs
CiAgICAgICAgICAgICAgICAgdm9pZCAqcGRhdGEsIHZvaWQgKnZkYXRhKQogewpAQCAtNzYxLDE2
ICs3NjEsOCBAQCBydF9zd2l0Y2hfc2NoZWQoc3RydWN0IHNjaGVkdWxlciAqbmV3X29wcywgdW5z
aWduZWQgaW50IGNwdSwKICAgICB9CiAKICAgICBpZGxlX3ZjcHVbY3B1XS0+c2NoZWRfcHJpdiA9
IHZkYXRhOwotICAgIHBlcl9jcHUoc2NoZWR1bGVyLCBjcHUpID0gbmV3X29wczsKLSAgICBwZXJf
Y3B1KHNjaGVkdWxlX2RhdGEsIGNwdSkuc2NoZWRfcHJpdiA9IE5VTEw7IC8qIG5vIHBkYXRhICov
CiAKLSAgICAvKgotICAgICAqIChSZT8pcm91dGUgdGhlIGxvY2sgdG8gdGhlIHBlciBwQ1BVIGxv
Y2sgYXMgL2xhc3QvIHRoaW5nLiBJbiBmYWN0LAotICAgICAqIGlmIGl0IGlzIGZyZWUgKGFuZCBp
dCBjYW4gYmUpIHdlIHdhbnQgdGhhdCBhbnlvbmUgdGhhdCBtYW5hZ2VzCi0gICAgICogdGFraW5n
IGl0LCBmaW5kIGFsbCB0aGUgaW5pdGlhbGl6YXRpb25zIHdlJ3ZlIGRvbmUgYWJvdmUgaW4gcGxh
Y2UuCi0gICAgICovCi0gICAgc21wX21iKCk7Ci0gICAgcGVyX2NwdShzY2hlZHVsZV9kYXRhLCBj
cHUpLnNjaGVkdWxlX2xvY2sgPSAmcHJ2LT5sb2NrOworICAgIHJldHVybiAmcHJ2LT5sb2NrOwog
fQogCiBzdGF0aWMgdm9pZApkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVu
L2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDRkYTk3MGM1NDMuLjZkYzk2YjNjZDQgMTAwNjQ0Ci0t
LSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAg
LTE4MTIsNyArMTgxMiw4IEBAIGludCBzY2hlZHVsZV9jcHVfc3dpdGNoKHVuc2lnbmVkIGludCBj
cHUsIHN0cnVjdCBjcHVwb29sICpjKQogICAgIHN0cnVjdCBzY2hlZHVsZXIgKm9sZF9vcHMgPSBw
ZXJfY3B1KHNjaGVkdWxlciwgY3B1KTsKICAgICBzdHJ1Y3Qgc2NoZWR1bGVyICpuZXdfb3BzID0g
KGMgPT0gTlVMTCkgPyAmb3BzIDogYy0+c2NoZWQ7CiAgICAgc3RydWN0IGNwdXBvb2wgKm9sZF9w
b29sID0gcGVyX2NwdShjcHVwb29sLCBjcHUpOwotICAgIHNwaW5sb2NrX3QgKiBvbGRfbG9jazsK
KyAgICBzdHJ1Y3Qgc2NoZWR1bGVfZGF0YSAqc2QgPSAmcGVyX2NwdShzY2hlZHVsZV9kYXRhLCBj
cHUpOworICAgIHNwaW5sb2NrX3QgKm9sZF9sb2NrLCAqbmV3X2xvY2s7CiAKICAgICAvKgogICAg
ICAqIHBDUFVzIG9ubHkgbW92ZSBmcm9tIGEgdmFsaWQgY3B1cG9vbCB0byBmcmVlIChpLmUuLCBv
dXQgb2YgYW55IHBvb2wpLApAQCAtMTg3MCw4ICsxODcxLDE5IEBAIGludCBzY2hlZHVsZV9jcHVf
c3dpdGNoKHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBjcHVwb29sICpjKQogICAgIG9sZF9sb2Nr
ID0gcGNwdV9zY2hlZHVsZV9sb2NrX2lycShjcHUpOwogCiAgICAgdnByaXZfb2xkID0gaWRsZS0+
c2NoZWRfcHJpdjsKLSAgICBwcHJpdl9vbGQgPSBwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSku
c2NoZWRfcHJpdjsKLSAgICBzY2hlZF9zd2l0Y2hfc2NoZWQobmV3X29wcywgY3B1LCBwcHJpdiwg
dnByaXYpOworICAgIHBwcml2X29sZCA9IHNkLT5zY2hlZF9wcml2OworICAgIG5ld19sb2NrID0g
c2NoZWRfc3dpdGNoX3NjaGVkKG5ld19vcHMsIGNwdSwgcHByaXYsIHZwcml2KTsKKworICAgIHBl
cl9jcHUoc2NoZWR1bGVyLCBjcHUpID0gbmV3X29wczsKKyAgICBzZC0+c2NoZWRfcHJpdiA9IHBw
cml2OworCisgICAgLyoKKyAgICAgKiAoUmU/KXJvdXRlIHRoZSBsb2NrIHRvIHRoZSBwZXIgcENQ
VSBsb2NrIGFzIC9sYXN0LyB0aGluZy4gSW4gZmFjdCwKKyAgICAgKiBpZiBpdCBpcyBmcmVlIChh
bmQgaXQgY2FuIGJlKSB3ZSB3YW50IHRoYXQgYW55b25lIHRoYXQgbWFuYWdlcworICAgICAqIHRh
a2luZyBpdCwgZmluZHMgYWxsIHRoZSBpbml0aWFsaXphdGlvbnMgd2UndmUgZG9uZSBhYm92ZSBp
biBwbGFjZS4KKyAgICAgKi8KKyAgICBzbXBfbWIoKTsKKyAgICBzZC0+c2NoZWR1bGVfbG9jayA9
IG5ld19sb2NrOwogCiAgICAgLyogX05vdF8gcGNwdV9zY2hlZHVsZV91bmxvY2soKTogc2NoZWR1
bGVfbG9jayBtYXkgaGF2ZSBjaGFuZ2VkISAqLwogICAgIHNwaW5fdW5sb2NrX2lycShvbGRfbG9j
ayk7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaCBiL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC1pZi5oCmluZGV4IGIzYzNlMTg5ZDkuLmI4ZTJiMmU0OWUgMTAwNjQ0Ci0tLSBh
L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1p
Zi5oCkBAIC0xNTMsNyArMTUzLDcgQEAgc3RydWN0IHNjaGVkdWxlciB7CiAgICAgLyogSWRlbXBv
dGVudC4gKi8KICAgICB2b2lkICAgICAgICAgKCpmcmVlX2RvbWRhdGEpICAgKGNvbnN0IHN0cnVj
dCBzY2hlZHVsZXIgKiwgdm9pZCAqKTsKIAotICAgIHZvaWQgICAgICAgICAoKnN3aXRjaF9zY2hl
ZCkgICAoc3RydWN0IHNjaGVkdWxlciAqLCB1bnNpZ25lZCBpbnQsCisgICAgc3BpbmxvY2tfdCAq
ICgqc3dpdGNoX3NjaGVkKSAgIChzdHJ1Y3Qgc2NoZWR1bGVyICosIHVuc2lnbmVkIGludCwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKiwgdm9pZCAqKTsKIAogICAg
IC8qIEFjdGl2YXRlIC8gZGVhY3RpdmF0ZSB2Y3B1cyBpbiBhIGNwdSBwb29sICovCkBAIC0xOTUs
MTAgKzE5NSwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZGVpbml0KHN0cnVjdCBzY2hl
ZHVsZXIgKnMpCiAgICAgcy0+ZGVpbml0KHMpOwogfQogCi1zdGF0aWMgaW5saW5lIHZvaWQgc2No
ZWRfc3dpdGNoX3NjaGVkKHN0cnVjdCBzY2hlZHVsZXIgKnMsIHVuc2lnbmVkIGludCBjcHUsCi0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnBkYXRhLCB2b2lkICp2
ZGF0YSkKK3N0YXRpYyBpbmxpbmUgc3BpbmxvY2tfdCAqc2NoZWRfc3dpdGNoX3NjaGVkKHN0cnVj
dCBzY2hlZHVsZXIgKnMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgY3B1LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdm9pZCAqcGRhdGEsIHZvaWQgKnZkYXRhKQogewotICAgIHMtPnN3aXRjaF9z
Y2hlZChzLCBjcHUsIHBkYXRhLCB2ZGF0YSk7CisgICAgcmV0dXJuIHMtPnN3aXRjaF9zY2hlZChz
LCBjcHUsIHBkYXRhLCB2ZGF0YSk7CiB9CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF9kdW1w
X3NldHRpbmdzKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKnMpCi0tIAoyLjE2LjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
