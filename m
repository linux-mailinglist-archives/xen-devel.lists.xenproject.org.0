Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCF17DDDE
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 11:46:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBFtK-0002sB-Rl; Mon, 09 Mar 2020 10:44:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBFtJ-0002rD-F5
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 10:44:09 +0000
X-Inumbo-ID: e7b0fe5a-61f2-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7b0fe5a-61f2-11ea-b52f-bc764e2007e4;
 Mon, 09 Mar 2020 10:44:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 408F0B3D6;
 Mon,  9 Mar 2020 10:44:08 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a8fc7299-4632-b32a-939d-b2e8354cf296@suse.com>
Message-ID: <7c8f0108-0d51-91bb-86b3-dd5ea6e0a269@suse.com>
Date: Mon, 9 Mar 2020 11:44:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a8fc7299-4632-b32a-939d-b2e8354cf296@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 4/5] IOMMU: iommu_qinval is x86-only
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gZmFjdCBpdCdzIFZULWQgc3BlY2lmaWMsIGJ1dCB3ZSBkb24ndCBoYXZlIGEgd2F5IHlldCB0
byBidWlsZCBjb2RlCmZvciBqdXN0IG9uZSB2ZW5kb3IuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKQEAgLTMzLDcgKzMz
LDYgQEAgYm9vbF90IF9fcmVhZF9tb3N0bHkgZm9yY2VfaW9tbXU7CiBib29sX3QgX19yZWFkX21v
c3RseSBpb21tdV92ZXJib3NlOwogYm9vbCBfX3JlYWRfbW9zdGx5IGlvbW11X3F1YXJhbnRpbmUg
PSB0cnVlOwogYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfc25vb3AgPSAxOwotYm9vbF90IF9f
cmVhZF9tb3N0bHkgaW9tbXVfcWludmFsID0gMTsKIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11
X2NyYXNoX2Rpc2FibGU7CiAKIHN0YXRpYyBib29sIF9faHdkb21faW5pdGRhdGEgaW9tbXVfaHdk
b21fbm9uZTsKQEAgLTc1LDEzICs3NCwxMyBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9pb21t
dV9wYXJhbShjb25zCiAjaWZkZWYgQ09ORklHX1g4NgogICAgICAgICBlbHNlIGlmICggKHZhbCA9
IHBhcnNlX2Jvb2xlYW4oImlnZngiLCBzLCBzcykpID49IDAgKQogICAgICAgICAgICAgaW9tbXVf
aWdmeCA9IHZhbDsKKyAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJxaW52
YWwiLCBzLCBzcykpID49IDAgKQorICAgICAgICAgICAgaW9tbXVfcWludmFsID0gdmFsOwogI2Vu
ZGlmCiAgICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigidmVyYm9zZSIsIHMs
IHNzKSkgPj0gMCApCiAgICAgICAgICAgICBpb21tdV92ZXJib3NlID0gdmFsOwogICAgICAgICBl
bHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oInNub29wIiwgcywgc3MpKSA+PSAwICkKICAg
ICAgICAgICAgIGlvbW11X3Nub29wID0gdmFsOwotICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBh
cnNlX2Jvb2xlYW4oInFpbnZhbCIsIHMsIHNzKSkgPj0gMCApCi0gICAgICAgICAgICBpb21tdV9x
aW52YWwgPSB2YWw7CiAjaWZuZGVmIGlvbW11X2ludHJlbWFwCiAgICAgICAgIGVsc2UgaWYgKCAo
dmFsID0gcGFyc2VfYm9vbGVhbigiaW50cmVtYXAiLCBzLCBzcykpID49IDAgKQogICAgICAgICAg
ICAgaW9tbXVfaW50cmVtYXAgPSB2YWwgPyBpb21tdV9pbnRyZW1hcF9mdWxsIDogaW9tbXVfaW50
cmVtYXBfb2ZmOwotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYworKysg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwpAQCAtNTEsNiArNTEsNyBAQCBz
dHJ1Y3QgbWFwcGVkX3JtcnIgewogYm9vbCBfX3JlYWRfbW9zdGx5IHVudHJ1c3RlZF9tc2k7CiAK
IGJvb2wgX19yZWFkX21vc3RseSBpb21tdV9pZ2Z4ID0gdHJ1ZTsKK2Jvb2wgX19yZWFkX21vc3Rs
eSBpb21tdV9xaW52YWwgPSB0cnVlOwogCiBpbnQgbnJfaW9tbXVzOwogCi0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9pb21tdS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCkBAIC01NCw3ICs1
NCw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbF90IGRmbl9lcShkZm5fdCB4LCBkZm4KIAogZXh0ZXJu
IGJvb2xfdCBpb21tdV9lbmFibGUsIGlvbW11X2VuYWJsZWQ7CiBleHRlcm4gYm9vbCBmb3JjZV9p
b21tdSwgaW9tbXVfcXVhcmFudGluZSwgaW9tbXVfdmVyYm9zZTsKLWV4dGVybiBib29sX3QgaW9t
bXVfc25vb3AsIGlvbW11X3FpbnZhbDsKK2V4dGVybiBib29sX3QgaW9tbXVfc25vb3A7CiAKICNp
ZmRlZiBDT05GSUdfWDg2CiBleHRlcm4gZW51bSBfX3BhY2tlZCBpb21tdV9pbnRyZW1hcCB7CkBA
IC03MCw3ICs3MCw3IEBAIGV4dGVybiBlbnVtIF9fcGFja2VkIGlvbW11X2ludHJlbWFwIHsKICAg
IGlvbW11X2ludHJlbWFwX3Jlc3RyaWN0ZWQsCiAgICBpb21tdV9pbnRyZW1hcF9mdWxsLAogfSBp
b21tdV9pbnRyZW1hcDsKLWV4dGVybiBib29sIGlvbW11X2lnZng7CitleHRlcm4gYm9vbCBpb21t
dV9pZ2Z4LCBpb21tdV9xaW52YWw7CiAjZWxzZQogIyBkZWZpbmUgaW9tbXVfaW50cmVtYXAgZmFs
c2UKICNlbmRpZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
