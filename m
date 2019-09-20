Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA4B8EA5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 12:50:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBGRp-0002b7-0u; Fri, 20 Sep 2019 10:47:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBGRn-0002b0-Jr
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 10:47:31 +0000
X-Inumbo-ID: 0b215744-db94-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b215744-db94-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 10:47:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7DBACAEF6;
 Fri, 20 Sep 2019 10:47:29 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-4-roger.pau@citrix.com>
 <46b8e9bdb412439d83d619234ce69ae7@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ef75ef6a-7447-d8ff-96a2-d946cf8a972f@suse.com>
Date: Fri, 20 Sep 2019 12:47:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <46b8e9bdb412439d83d619234ce69ae7@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 03/11] ioreq: switch selection and
 forwarding to use ioservid_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim\(Xen.org\)" <tim@xen.org>,
 GeorgeDunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDkuMjAxOSAxNDozMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+PiBTZW50OiAwMyBTZXB0ZW1iZXIgMjAxOSAxNzoxNAo+PiBUbzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCj4+IENjOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcgo+
PiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4KPj4gSmFja3NvbiA8SWFu
LkphY2tzb25AY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBUaW0gKFhlbi5vcmcpIDx0
aW1AeGVuLm9yZz47Cj4+IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+
IFN1YmplY3Q6IFtQQVRDSCB2MiAwMy8xMV0gaW9yZXE6IHN3aXRjaCBzZWxlY3Rpb24gYW5kIGZv
cndhcmRpbmcgdG8gdXNlIGlvc2VydmlkX3QKPj4KPj4gaHZtX3NlbGVjdF9pb3JlcV9zZXJ2ZXIg
YW5kIGh2bV9zZW5kX2lvcmVxIHdoZXJlIGJvdGggdXNpbmcKPj4gaHZtX2lvcmVxX3NlcnZlciBk
aXJlY3RseSwgc3dpdGNoIHRvIHVzZSBpb3NlcnZpZF90IGluIG9yZGVyIHRvIHNlbGVjdAo+PiBh
bmQgZm9yd2FyZCBpb3JlcXMuCj4+Cj4+IFRoaXMgaXMgYSBwcmVwYXJhdG9yeSBjaGFuZ2UsIHNp
bmNlIGZ1dHVyZSBwYXRjaGVzIHdpbGwgdXNlIHRoZSBpb3JlcQo+PiBzZXJ2ZXIgaWQgaW4gb3Jk
ZXIgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGludGVybmFsIGFuZCBleHRlcm5hbAo+PiBpb3Jl
cSBzZXJ2ZXJzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KPiAKPiAuLi4gd2l0aCBvbmUgc3VnZ2VzdGlvbi4KPiAKPiBbc25pcF0K
Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vZG1fb3AuaCBiL3hlbi9pbmNs
dWRlL3B1YmxpYy9odm0vZG1fb3AuaAo+PiBpbmRleCBkM2I1NTRkMDE5Li44NzI1Y2MyMGQzIDEw
MDY0NAo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2RtX29wLmgKPj4gKysrIGIveGVu
L2luY2x1ZGUvcHVibGljL2h2bS9kbV9vcC5oCj4+IEBAIC01NCw2ICs1NCw3IEBACj4+ICAgKi8K
Pj4KPj4gIHR5cGVkZWYgdWludDE2X3QgaW9zZXJ2aWRfdDsKPj4gKyNkZWZpbmUgWEVOX0lOVkFM
SURfSU9TRVJWSUQgMHhmZmZmCj4+Cj4gCj4gUGVyaGFwcyB1c2UgKGlvc2VydmlkX3QpfjAgcmF0
aGVyIHRoYW4gaGFyZGNvZGluZz8KCkFuZCB0aGVuIChzdWl0YWJseSBwYXJlbnRoZXNpemVkKSBh
cHBsaWNhYmxlIHBhcnRzCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
