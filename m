Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFCF14ECDA
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 14:04:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixVvj-0001P9-Ln; Fri, 31 Jan 2020 13:01:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EwZr=3U=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1ixVvh-0001Op-TV
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 13:01:49 +0000
X-Inumbo-ID: d48129a4-4429-11ea-8bc1-12813bfff9fa
Received: from relay.sw.ru (unknown [185.231.240.75])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d48129a4-4429-11ea-8bc1-12813bfff9fa;
 Fri, 31 Jan 2020 13:01:44 +0000 (UTC)
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ixVvH-0000zU-VQ; Fri, 31 Jan 2020 16:01:24 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 Jan 2020 16:01:09 +0300
Message-Id: <20200131130118.1716-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200131130118.1716-1-vsementsov@virtuozzo.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 02/11] error: auto propagated local_err
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laszlo Ersek <lersek@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 armbru@redhat.com, Max Reitz <mreitz@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVyZSBpcyBpbnRyb2R1Y2VkIEVSUlBfQVVUT19QUk9QQUdBVEUgbWFjcm8sIHRvIGJlIHVzZWQg
YXQgc3RhcnQgb2YKZnVuY3Rpb25zIHdpdGggYW4gZXJycCBPVVQgcGFyYW1ldGVyLgoKSXQgaGFz
IHRocmVlIGdvYWxzOgoKMS4gRml4IGlzc3VlIHdpdGggZXJyb3JfZmF0YWwgYW5kIGVycm9yX3By
ZXBlbmQvZXJyb3JfYXBwZW5kX2hpbnQ6IHVzZXIKY2FuJ3Qgc2VlIHRoaXMgYWRkaXRpb25hbCBp
bmZvcm1hdGlvbiwgYmVjYXVzZSBleGl0KCkgaGFwcGVucyBpbgplcnJvcl9zZXRnIGVhcmxpZXIg
dGhhbiBpbmZvcm1hdGlvbiBpcyBhZGRlZC4gW1JlcG9ydGVkIGJ5IEdyZWcgS3Vyel0KCjIuIEZp
eCBpc3N1ZSB3aXRoIGVycm9yX2Fib3J0IGFuZCBlcnJvcl9wcm9wYWdhdGU6IHdoZW4gd2Ugd3Jh
cAplcnJvcl9hYm9ydCBieSBsb2NhbF9lcnIrZXJyb3JfcHJvcGFnYXRlLCB0aGUgcmVzdWx0aW5n
IGNvcmVkdW1wIHdpbGwKcmVmZXIgdG8gZXJyb3JfcHJvcGFnYXRlIGFuZCBub3QgdG8gdGhlIHBs
YWNlIHdoZXJlIGVycm9yIGhhcHBlbmVkLgoodGhlIG1hY3JvIGl0c2VsZiBkb2Vzbid0IGZpeCB0
aGUgaXNzdWUsIGJ1dCBpdCBhbGxvd3MgdXMgdG8gWzMuXSBkcm9wCnRoZSBsb2NhbF9lcnIrZXJy
b3JfcHJvcGFnYXRlIHBhdHRlcm4sIHdoaWNoIHdpbGwgZGVmaW5pdGVseSBmaXggdGhlCmlzc3Vl
KSBbUmVwb3J0ZWQgYnkgS2V2aW4gV29sZl0KCjMuIERyb3AgbG9jYWxfZXJyK2Vycm9yX3Byb3Bh
Z2F0ZSBwYXR0ZXJuLCB3aGljaCBpcyB1c2VkIHRvIHdvcmthcm91bmQKdm9pZCBmdW5jdGlvbnMg
d2l0aCBlcnJwIHBhcmFtZXRlciwgd2hlbiBjYWxsZXIgd2FudHMgdG8ga25vdyByZXN1bHRpbmcK
c3RhdHVzLiAoTm90ZTogYWN0dWFsbHkgdGhlc2UgZnVuY3Rpb25zIGNvdWxkIGJlIG1lcmVseSB1
cGRhdGVkIHRvCnJldHVybiBpbnQgZXJyb3IgY29kZSkuCgpUbyBhY2hpZXZlIHRoZXNlIGdvYWxz
LCBsYXRlciBwYXRjaGVzIHdpbGwgYWRkIGludm9jYXRpb25zCm9mIHRoaXMgbWFjcm8gYXQgdGhl
IHN0YXJ0IG9mIGZ1bmN0aW9ucyB3aXRoIGVpdGhlciB1c2UKZXJyb3JfcHJlcGVuZC9lcnJvcl9h
cHBlbmRfaGludCAoc29sdmluZyAxKSBvciB3aGljaCB1c2UKbG9jYWxfZXJyK2Vycm9yX3Byb3Bh
Z2F0ZSB0byBjaGVjayBlcnJvcnMsIHN3aXRjaGluZyB0aG9zZQpmdW5jdGlvbnMgdG8gdXNlICpl
cnJwIGluc3RlYWQgKHNvbHZpbmcgMiBhbmQgMykuCgpTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBT
ZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+ClJldmlld2VkLWJ5
OiBHcmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPgpSZXZpZXdlZC1ieTogRXJpYyBCbGFrZSA8ZWJs
YWtlQHJlZGhhdC5jb20+Ci0tLQoKQ0M6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPgpD
QzogS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT4KQ0M6IE1heCBSZWl0eiA8bXJlaXR6QHJl
ZGhhdC5jb20+CkNDOiBHcmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPgpDQzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogQW50aG9ueSBQZXJhcmQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+CkNDOiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KQ0M6
IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KQ0M6ICJQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSIgPHBoaWxtZEByZWRoYXQuY29tPgpDQzogTGFzemxvIEVyc2VrIDxsZXJzZWtA
cmVkaGF0LmNvbT4KQ0M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDQzogU3Rl
ZmFuIEJlcmdlciA8c3RlZmFuYkBsaW51eC5pYm0uY29tPgpDQzogTWFya3VzIEFybWJydXN0ZXIg
PGFybWJydUByZWRoYXQuY29tPgpDQzogTWljaGFlbCBSb3RoIDxtZHJvdGhAbGludXgudm5ldC5p
Ym0uY29tPgpDQzogcWVtdS1ibG9ja0Bub25nbnUub3JnCkNDOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKCiBpbmNsdWRlL3FhcGkvZXJyb3IuaCB8IDgzICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgODIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvcWFwaS9lcnJvci5oIGIv
aW5jbHVkZS9xYXBpL2Vycm9yLmgKaW5kZXggZDM0OTg3MTQ4ZC4uYjk0NTJkNDgwNiAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9xYXBpL2Vycm9yLmgKKysrIGIvaW5jbHVkZS9xYXBpL2Vycm9yLmgKQEAg
LTc4LDcgKzc4LDcgQEAKICAqIENhbGwgYSBmdW5jdGlvbiB0cmVhdGluZyBlcnJvcnMgYXMgZmF0
YWw6CiAgKiAgICAgZm9vKGFyZywgJmVycm9yX2ZhdGFsKTsKICAqCi0gKiBSZWNlaXZlIGFuIGVy
cm9yIGFuZCBwYXNzIGl0IG9uIHRvIHRoZSBjYWxsZXI6CisgKiBSZWNlaXZlIGFuIGVycm9yIGFu
ZCBwYXNzIGl0IG9uIHRvIHRoZSBjYWxsZXIgKERFUFJFQ0FURUQqKToKICAqICAgICBFcnJvciAq
ZXJyID0gTlVMTDsKICAqICAgICBmb28oYXJnLCAmZXJyKTsKICAqICAgICBpZiAoZXJyKSB7CkBA
IC05OCw2ICs5OCw1MCBAQAogICogICAgIGZvbyhhcmcsIGVycnApOwogICogZm9yIHJlYWRhYmls
aXR5LgogICoKKyAqIERFUFJFQ0FURUQqIFRoaXMgcGF0dGVybiBpcyBkZXByZWNhdGVkIG5vdywg
dGhlIHVzZSBFUlJQX0FVVE9fUFJPUEFHQVRFIG1hY3JvCisgKiBpbnN0ZWFkIChkZWZpbmVkIGJl
bG93KS4KKyAqIEl0J3MgZGVwcmVjYXRlZCBiZWNhdXNlIG9mIHR3byB0aGluZ3M6CisgKgorICog
MS4gSXNzdWUgd2l0aCBlcnJvcl9hYm9ydCBhbmQgZXJyb3JfcHJvcGFnYXRlOiB3aGVuIHdlIHdy
YXAgZXJyb3JfYWJvcnQgYnkKKyAqIGxvY2FsX2VycitlcnJvcl9wcm9wYWdhdGUsIHRoZSByZXN1
bHRpbmcgY29yZWR1bXAgd2lsbCByZWZlciB0bworICogZXJyb3JfcHJvcGFnYXRlIGFuZCBub3Qg
dG8gdGhlIHBsYWNlIHdoZXJlIGVycm9yIGhhcHBlbmVkLgorICoKKyAqIDIuIEEgbG90IG9mIGV4
dHJhIGNvZGUgb2YgdGhlIHNhbWUgcGF0dGVybgorICoKKyAqIEhvdyB0byB1cGRhdGUgb2xkIGNv
ZGUgdG8gdXNlIEVSUlBfQVVUT19QUk9QQUdBVEU/CisgKgorICogQWxsIHlvdSBuZWVkIGlzIHRv
IGFkZCBFUlJQX0FVVE9fUFJPUEFHQVRFKCkgaW52b2NhdGlvbiBhdCBmdW5jdGlvbiBzdGFydCwK
KyAqIHRoYW4geW91IG1heSBzYWZlbHkgZGVyZWZlcmVuY2UgZXJycCB0byBjaGVjayBlcnJvcnMg
YW5kIGRvIG5vdCBuZWVkIGFueQorICogYWRkaXRpb25hbCBsb2NhbCBFcnJvciB2YXJpYWJsZXMg
b3IgY2FsbHMgdG8gZXJyb3JfcHJvcGFnYXRlKCkuCisgKgorICogRXhhbXBsZToKKyAqCisgKiBv
bGQgY29kZQorICoKKyAqICAgICB2b2lkIGZuKC4uLiwgRXJyb3IgKiplcnJwKSB7CisgKiAgICAg
ICAgIEVycm9yICplcnIgPSBOVUxMOworICogICAgICAgICBmb28oYXJnLCAmZXJyKTsKKyAqICAg
ICAgICAgaWYgKGVycikgeworICogICAgICAgICAgICAgaGFuZGxlIHRoZSBlcnJvci4uLgorICog
ICAgICAgICAgICAgZXJyb3JfcHJvcGFnYXRlKGVycnAsIGVycik7CisgKiAgICAgICAgICAgICBy
ZXR1cm47CisgKiAgICAgICAgIH0KKyAqICAgICAgICAgLi4uCisgKiAgICAgfQorICoKKyAqIHVw
ZGF0ZWQgY29kZQorICoKKyAqICAgICB2b2lkIGZuKC4uLiwgRXJyb3IgKiplcnJwKSB7CisgKiAg
ICAgICAgIEVSUlBfQVVUT19QUk9QQUdBVEUoKTsKKyAqICAgICAgICAgZm9vKGFyZywgZXJycCk7
CisgKiAgICAgICAgIGlmICgqZXJycCkgeworICogICAgICAgICAgICAgaGFuZGxlIHRoZSBlcnJv
ci4uLgorICogICAgICAgICAgICAgcmV0dXJuOworICogICAgICAgICB9CisgKiAgICAgICAgIC4u
LgorICogICAgIH0KKyAqCisgKgogICogUmVjZWl2ZSBhbmQgYWNjdW11bGF0ZSBtdWx0aXBsZSBl
cnJvcnMgKGZpcnN0IG9uZSB3aW5zKToKICAqICAgICBFcnJvciAqZXJyID0gTlVMTCwgKmxvY2Fs
X2VyciA9IE5VTEw7CiAgKiAgICAgZm9vKGFyZywgJmVycik7CkBAIC0zNDgsNiArMzkyLDQzIEBA
IHZvaWQgZXJyb3Jfc2V0X2ludGVybmFsKEVycm9yICoqZXJycCwKICAgICAgICAgICAgICAgICAg
ICAgICAgIEVycm9yQ2xhc3MgZXJyX2NsYXNzLCBjb25zdCBjaGFyICpmbXQsIC4uLikKICAgICBH
Q0NfRk1UX0FUVFIoNiwgNyk7CiAKK3R5cGVkZWYgc3RydWN0IEVycm9yUHJvcGFnYXRvciB7Cisg
ICAgRXJyb3IgKmxvY2FsX2VycjsKKyAgICBFcnJvciAqKmVycnA7Cit9IEVycm9yUHJvcGFnYXRv
cjsKKworc3RhdGljIGlubGluZSB2b2lkIGVycm9yX3Byb3BhZ2F0b3JfY2xlYW51cChFcnJvclBy
b3BhZ2F0b3IgKnByb3ApCit7CisgICAgZXJyb3JfcHJvcGFnYXRlKHByb3AtPmVycnAsIHByb3At
PmxvY2FsX2Vycik7Cit9CisKK0dfREVGSU5FX0FVVE9fQ0xFQU5VUF9DTEVBUl9GVU5DKEVycm9y
UHJvcGFnYXRvciwgZXJyb3JfcHJvcGFnYXRvcl9jbGVhbnVwKTsKKworLyoKKyAqIEVSUlBfQVVU
T19QUk9QQUdBVEUKKyAqCisgKiBUaGlzIG1hY3JvIGlzIGNyZWF0ZWQgdG8gYmUgdGhlIGZpcnN0
IGxpbmUgb2YgYSBmdW5jdGlvbiB3aGljaCB1c2UKKyAqIEVycm9yICoqZXJycCBwYXJhbWV0ZXIg
dG8gcmVwb3J0IGVycm9yLiBJdCdzIG5lZWRlZCBvbmx5IGluIGNhc2VzIHdoZXJlIHdlCisgKiB3
YW50IHRvIHVzZSBlcnJvcl9wcmVwZW5kLCBlcnJvcl9hcHBlbmRfaGludCBvciBkZXJlZmVyZW5j
ZSAqZXJycC4gSXQncworICogc3RpbGwgc2FmZSAoYnV0IHVzZWxlc3MpIGluIG90aGVyIGNhc2Vz
LgorICoKKyAqIElmIGVycnAgaXMgTlVMTCBvciBwb2ludHMgdG8gZXJyb3JfZmF0YWwsIGl0IGlz
IHJld3JpdHRlbiB0byBwb2ludCB0byBhCisgKiBsb2NhbCBFcnJvciBvYmplY3QsIHdoaWNoIHdp
bGwgYmUgYXV0b21hdGljYWxseSBwcm9wYWdhdGVkIHRvIHRoZSBvcmlnaW5hbAorICogZXJycCBv
biBmdW5jdGlvbiBleGl0IChzZWUgZXJyb3JfcHJvcGFnYXRvcl9jbGVhbnVwKS4KKyAqCisgKiBB
ZnRlciBpbnZvY2F0aW9uIG9mIHRoaXMgbWFjcm8gaXQgaXMgYWx3YXlzIHNhZmUgdG8gZGVyZWZl
cmVuY2UgZXJycAorICogKGFzIGl0J3Mgbm90IE5VTEwgYW55bW9yZSkgYW5kIHRvIGFkZCBpbmZv
cm1hdGlvbiBieSBlcnJvcl9wcmVwZW5kIG9yCisgKiBlcnJvcl9hcHBlbmRfaGludCAoYXMsIGlm
IGl0IHdhcyBlcnJvcl9mYXRhbCwgd2Ugc3dhcHBlZCBpdCB3aXRoIGEKKyAqIGxvY2FsX2Vycm9y
IHRvIGJlIHByb3BhZ2F0ZWQgb24gY2xlYW51cCkuCisgKgorICogTm90ZTogd2UgZG9uJ3Qgd3Jh
cCB0aGUgZXJyb3JfYWJvcnQgY2FzZSwgYXMgd2Ugd2FudCByZXN1bHRpbmcgY29yZWR1bXAKKyAq
IHRvIHBvaW50IHRvIHRoZSBwbGFjZSB3aGVyZSB0aGUgZXJyb3IgaGFwcGVuZWQsIG5vdCB0byBl
cnJvcl9wcm9wYWdhdGUuCisgKi8KKyNkZWZpbmUgRVJSUF9BVVRPX1BST1BBR0FURSgpICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICBnX2F1dG8oRXJyb3JQcm9wYWdhdG9y
KSBfYXV0b19lcnJwX3Byb3AgPSB7LmVycnAgPSBlcnJwfTsgIFwKKyAgICBlcnJwID0gKChlcnJw
ID09IE5VTEwgfHwgKmVycnAgPT0gZXJyb3JfZmF0YWwpICAgICAgICAgICAgIFwKKyAgICAgICAg
ICAgID8gJl9hdXRvX2VycnBfcHJvcC5sb2NhbF9lcnIgOiBlcnJwKQorCiAvKgogICogU3BlY2lh
bCBlcnJvciBkZXN0aW5hdGlvbiB0byBhYm9ydCBvbiBlcnJvci4KICAqIFNlZSBlcnJvcl9zZXRn
KCkgYW5kIGVycm9yX3Byb3BhZ2F0ZSgpIGZvciBkZXRhaWxzLgotLSAKMi4yMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
