Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D84021544EF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 14:33:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izhFZ-0003bz-TK; Thu, 06 Feb 2020 13:31:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izhFY-0003bk-Ar
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 13:31:20 +0000
X-Inumbo-ID: f547cdfe-48e4-11ea-841d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f547cdfe-48e4-11ea-841d-bc764e2007e4;
 Thu, 06 Feb 2020 13:31:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 17B73B162;
 Thu,  6 Feb 2020 13:31:19 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6ef37772-81da-dfd0-01e7-c83998b2c2c4@suse.com>
Message-ID: <e77ce9c5-455a-56c4-32b2-01d73dea33c1@suse.com>
Date: Thu, 6 Feb 2020 14:31:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <6ef37772-81da-dfd0-01e7-c83998b2c2c4@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/2] VT-d: adjust logging of RMRRs
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
Cc: Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29uc2lzdGVudGx5IHVzZSBbLF0gcmFuZ2UgcmVwcmVzZW50YXRpb24sIHNocmluayBsZWFkaW5n
IGRvdWJsZSBibGFua3MKdG8gYSBzaW5nbGUgb25lLCBhbmQgc2xpZ2h0bHkgYWRqdXN0IHRleHQg
aW4gc29tZSBjYXNlcy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMKKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYwpAQCAtNTYxLDcgKzU2MSw3IEBAIHN0YXRp
YyBpbnQgcmVnaXN0ZXJfb25lX3JtcnIoc3RydWN0IGFjcGkKICAgICAgICAgewogICAgICAgICAg
ICAgZHByaW50ayhYRU5MT0dfV0FSTklORyBWVERQUkVGSVgsCiAgICAgICAgICAgICAgICAgICAg
ICIgTm9uLWV4aXN0ZW50IGRldmljZSAoJTA0eDolMDJ4OiUwMnguJXUpIGlzIHJlcG9ydGVkIgot
ICAgICAgICAgICAgICAgICAgICAiIGluIFJNUlIgKCUiUFJJeDY0IiwgJSJQUkl4NjQiKSdzIHNj
b3BlIVxuIiwKKyAgICAgICAgICAgICAgICAgICAgIiBpbiBSTVJSIFslIlBSSXg2NCIsJSJQUkl4
NjQiKV0ncyBzY29wZSFcbiIsCiAgICAgICAgICAgICAgICAgICAgIHJtcnJ1LT5zZWdtZW50LCBi
LCBkLCBmLAogICAgICAgICAgICAgICAgICAgICBybXJydS0+YmFzZV9hZGRyZXNzLCBybXJydS0+
ZW5kX2FkZHJlc3MpOwogICAgICAgICAgICAgaWdub3JlID0gdHJ1ZTsKQEAgLTU3Nyw4ICs1Nzcs
OCBAQCBzdGF0aWMgaW50IHJlZ2lzdGVyX29uZV9ybXJyKHN0cnVjdCBhY3BpCiAgICAgaWYgKCBp
Z25vcmUgKQogICAgIHsKICAgICAgICAgZHByaW50ayhYRU5MT0dfV0FSTklORyBWVERQUkVGSVgs
Ci0gICAgICAgICAgICAgICAgIiAgSWdub3JlIHRoZSBSTVJSICglIlBSSXg2NCIsICUiUFJJeDY0
IikgZHVlIHRvICIKLSAgICAgICAgICAgICAgICAiZGV2aWNlcyB1bmRlciBpdHMgc2NvcGUgYXJl
IG5vdCBQQ0kgZGlzY292ZXJhYmxlIVxuIiwKKyAgICAgICAgICAgICAgICAiIElnbm9yZSBSTVJS
IFslIlBSSXg2NCIsJSJQUkl4NjQiXSBhcyBubyBkZXZpY2UiCisgICAgICAgICAgICAgICAgIiB1
bmRlciBpdHMgc2NvcGUgaXMgUENJIGRpc2NvdmVyYWJsZSFcbiIsCiAgICAgICAgICAgICAgICAg
cm1ycnUtPmJhc2VfYWRkcmVzcywgcm1ycnUtPmVuZF9hZGRyZXNzKTsKICAgICAgICAgc2NvcGVf
ZGV2aWNlc19mcmVlKCZybXJydS0+c2NvcGUpOwogICAgICAgICB4ZnJlZShybXJydSk7CkBAIC01
ODYsNyArNTg2LDcgQEAgc3RhdGljIGludCByZWdpc3Rlcl9vbmVfcm1ycihzdHJ1Y3QgYWNwaQog
ICAgIGVsc2UgaWYgKCBybXJydS0+YmFzZV9hZGRyZXNzID4gcm1ycnUtPmVuZF9hZGRyZXNzICkK
ICAgICB7CiAgICAgICAgIGRwcmludGsoWEVOTE9HX1dBUk5JTkcgVlREUFJFRklYLAotICAgICAg
ICAgICAgICAgICIgIFRoZSBSTVJSICglIlBSSXg2NCIsICUiUFJJeDY0IikgaXMgaW5jb3JyZWN0
IVxuIiwKKyAgICAgICAgICAgICAgICAiIFJNUlIgWyUiUFJJeDY0IiwlIlBSSXg2NCJdIGlzIGlu
Y29ycmVjdCFcbiIsCiAgICAgICAgICAgICAgICAgcm1ycnUtPmJhc2VfYWRkcmVzcywgcm1ycnUt
PmVuZF9hZGRyZXNzKTsKICAgICAgICAgc2NvcGVfZGV2aWNlc19mcmVlKCZybXJydS0+c2NvcGUp
OwogICAgICAgICB4ZnJlZShybXJydSk7CkBAIC01OTUsOCArNTk1LDcgQEAgc3RhdGljIGludCBy
ZWdpc3Rlcl9vbmVfcm1ycihzdHJ1Y3QgYWNwaQogICAgIGVsc2UKICAgICB7CiAgICAgICAgIGlm
ICggaW9tbXVfdmVyYm9zZSApCi0gICAgICAgICAgICBkcHJpbnRrKFZURFBSRUZJWCwKLSAgICAg
ICAgICAgICAgICAgICAgIiAgUk1SUiByZWdpb246IGJhc2VfYWRkciAlIlBSSXg2NCIgZW5kX2Fk
ZHIgJSJQUkl4NjQiXG4iLAorICAgICAgICAgICAgZHByaW50ayhWVERQUkVGSVgsICIgUk1SUjog
WyUiUFJJeDY0IiwlIlBSSXg2NCJdXG4iLAogICAgICAgICAgICAgICAgICAgICBybXJydS0+YmFz
ZV9hZGRyZXNzLCBybXJydS0+ZW5kX2FkZHJlc3MpOwogICAgICAgICBhY3BpX3JlZ2lzdGVyX3Jt
cnJfdW5pdChybXJydSk7CiAgICAgfQpAQCAtNjM1LDcgKzYzNCw3IEBAIGFjcGlfcGFyc2Vfb25l
X3JtcnIoc3RydWN0IGFjcGlfZG1hcl9oZWEKICAgICAgKi8KICAgICBpZiAoICFlODIwX2FsbF9t
YXBwZWQoYmFzZV9hZGRyLCBlbmRfYWRkciArIDEsIFJBTV9UWVBFX1JFU0VSVkVEKSApCiAgICAg
ICAgIHByaW50ayhYRU5MT0dfV0FSTklORyBWVERQUkVGSVgKLSAgICAgICAgICAgICAgICIgIFJN
UlIgYWRkcmVzcyByYW5nZSAlIlBSSXg2NCIuLiUiUFJJeDY0IiBub3QgaW4gcmVzZXJ2ZWQgbWVt
b3J5OyIKKyAgICAgICAgICAgICAgICIgUk1SUiBbJSJQUkl4NjQiLCUiUFJJeDY0Il0gbm90IGlu
IHJlc2VydmVkIG1lbW9yeTsiCiAgICAgICAgICAgICAgICAiIG5lZWQgXCJpb21tdV9pbmNsdXNp
dmVfbWFwcGluZz0xXCI/XG4iLAogICAgICAgICAgICAgICAgIGJhc2VfYWRkciwgZW5kX2FkZHIp
OwogCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
