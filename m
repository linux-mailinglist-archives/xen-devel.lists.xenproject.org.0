Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A425787A3E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 14:35:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw44b-0003Sr-Sl; Fri, 09 Aug 2019 12:32:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw44a-0003Sd-KK
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 12:32:44 +0000
X-Inumbo-ID: c7ebe786-baa1-11e9-9105-c3d2e809dbf9
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7ebe786-baa1-11e9-9105-c3d2e809dbf9;
 Fri, 09 Aug 2019 12:32:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8B6E7AECB;
 Fri,  9 Aug 2019 12:32:41 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d1ae0cb5-2dfb-7984-62ec-19f7f5a5abaf@suse.com>
Message-ID: <307c0b92-040a-14d1-eef0-3235c0498751@suse.com>
Date: Fri, 9 Aug 2019 14:32:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d1ae0cb5-2dfb-7984-62ec-19f7f5a5abaf@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v4 2/2] x86/xpti: Don't leak TSS-adjacent percpu
 data via Meltdown
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRoZSBYUFRJ
IHdvcmsgcmVzdHJpY3RlZCB0aGUgdmlzaWJpbGl0eSBvZiBtb3N0IG9mIG1lbW9yeSwgYnV0IG1p
c3NlZCBhIGZldwphc3BlY3RzIHdoZW4gaXQgY2FtZSB0byB0aGUgVFNTLgoKR2l2ZW4gdGhhdCB0
aGUgVFNTIGlzIGp1c3QgYW4gb2JqZWN0IGluIHBlcmNwdSBkYXRhLCB0aGUgNGsgbWFwcGluZyBm
b3IgaXQKY3JlYXRlZCBpbiBzZXR1cF9jcHVfcm9vdF9wZ3QoKSBtYXBzIGFkamFjZW50IHBlcmNw
dSBkYXRhLCBtYWtpbmcgaXQgYWxsCmxlYWthYmxlIHZpYSBNZWx0ZG93biwgZXZlbiB3aGVuIFhQ
VEkgaXMgaW4gdXNlLgoKRnVydGhlcm1vcmUsIG5vIGNhcmUgaXMgdGFrZW4gdG8gY2hlY2sgdGhh
dCB0aGUgVFNTIGRvZXNuJ3QgY3Jvc3MgYSBwYWdlCmJvdW5kYXJ5LiAgQXMgaXQgdHVybnMgb3V0
LCBzdHJ1Y3QgdHNzX3N0cnVjdCBpcyBhbGlnbmVkIG9uIGl0cyBzaXplIHdoaWNoCmRvZXMgcHJl
dmVudCBpdCBzdHJhZGRsaW5nIGEgcGFnZSBib3VuZGFyeS4KCk1vdmUgdGhlIFRTUyBpbnRvIHRo
ZSBwYWdlIGFsaWduZWQgcGVyY3B1IGFyZWEsIHNvIG5vIGFkamFjZW50IGRhdGEgY2FuIGJlCmxl
YWtlZC4gIE1vdmUgdGhlIGRlZmluaXRpb24gZnJvbSBzZXR1cC5jIHRvIHRyYXBzLmMsIHdoaWNo
IGlzIGEgbW9yZQphcHByb3ByaWF0ZSBwbGFjZSBmb3IgaXQgdG8gbGl2ZS4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpJbnRyb2R1Y2Ug
LyB1c2Ugc3RydWN0IHRzc19wYWdlLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgotLS0KVEJEOiBFc3BlY2lhbGx5IHdpdGggaG93IHRoZSBwcmV2aW91cyBw
YXRjaCBub3cgd29ya3MgSSdtIHVuY29udmluY2VkIG9mCiAgICAgIHRoZSB1dGlsaXR5IG9mIHRo
ZSBsaW5rZXIgc2NyaXB0IGFsaWdubWVudCBjaGVjay4gSXQgaW4gcGFydGljdWxhcgogICAgICBk
b2Vzbid0IGNoZWNrIHRoZSBwcm9wZXJ0eSB3ZSdyZSBhZnRlciBpbiB0aGlzIHBhdGNoLCBpLmUu
IHRoZSBmYWN0CiAgICAgIHRoYXQgdGhlcmUncyBub3RoaW5nIGVsc2UgaW4gdGhlIHNhbWUgcGFn
ZS4KTkI6IFNhZGx5IGdldF9wZXJfY3B1X3ZhcigpIGNhbid0IGFsc28gYmUgdXNlZCBvbiB0aGUg
ImxlZnQiIHNpZGUgb2YgYQogICAgICNkZWZpbmUuCi0tLQp2NDoKICAqIEludHJvZHVjZSAvIHVz
ZSBzdHJ1Y3QgdHNzX3BhZ2UuCgp2MzoKICAqIERyb3AgdGhlIHJlbWFyayBhYm91dCBDRVQuICBJ
dCBpcyBubyBsb25nZXIgYWNjdXJhdGUgaW4gdGhlIGxhdGVzdCB2ZXJzaW9uCiAgICBvZiB0aGUg
Q0VUIHNwZWMuCgp2MjoKICAqIFJlYmFzZSBvdmVyIGNoYW5nZXMgdG8gaW5jbHVkZSBfX2FsaWdu
ZWQoKSB3aXRoaW4KICAgIERFRklORV9QRVJfQ1BVX1BBR0VfQUxJR05FRCgpCiAgKiBEcm9wIG5v
dy11bnVzZWQgeGVuL3BlcmNwdS5oIGZyb20gc2V0dXAuYwoKLS0tIGEveGVuL2FyY2gveDg2L3Nl
dHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTE2LDcgKzE2LDYgQEAKICAjaW5j
bHVkZSA8eGVuL2RvbWFpbl9wYWdlLmg+CiAgI2luY2x1ZGUgPHhlbi92ZXJzaW9uLmg+CiAgI2lu
Y2x1ZGUgPHhlbi9nZGJzdHViLmg+Ci0jaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgogICNpbmNsdWRl
IDx4ZW4vaHlwZXJjYWxsLmg+CiAgI2luY2x1ZGUgPHhlbi9rZXloYW5kbGVyLmg+CiAgI2luY2x1
ZGUgPHhlbi9udW1hLmg+CkBAIC0xMDAsOCArOTksNiBAQCB1bnNpZ25lZCBsb25nIF9fcmVhZF9t
b3N0bHkgeGVuX3BoeXNfc3RhCiAgCiAgdW5zaWduZWQgbG9uZyBfX3JlYWRfbW9zdGx5IHhlbl92
aXJ0X2VuZDsKICAKLURFRklORV9QRVJfQ1BVKHN0cnVjdCB0c3Nfc3RydWN0LCBpbml0X3Rzcyk7
Ci0KICBjaGFyIF9fc2VjdGlvbigiLmJzcy5zdGFja19hbGlnbmVkIikgX19hbGlnbmVkKFNUQUNL
X1NJWkUpCiAgICAgIGNwdTBfc3RhY2tbU1RBQ0tfU0laRV07CiAgCi0tLSBhL3hlbi9hcmNoL3g4
Ni90cmFwcy5jCisrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCkBAIC0xMDgsNiArMTA4LDEyIEBA
IGlkdF9lbnRyeV90IF9fc2VjdGlvbigiLmJzcy5wYWdlX2FsaWduZWQKICAvKiBQb2ludGVyIHRv
IHRoZSBJRFQgb2YgZXZlcnkgQ1BVLiAqLwogIGlkdF9lbnRyeV90ICppZHRfdGFibGVzW05SX0NQ
VVNdIF9fcmVhZF9tb3N0bHk7CiAgCisvKgorICogVGhlIFRTUyBpcyBzbWFsbGVyIHRoYW4gYSBw
YWdlLCBidXQgd2UgZ2l2ZSBpdCBhIGZ1bGwgcGFnZSB0byBhdm9pZAorICogYWRqYWNlbnQgcGVy
LWNwdSBkYXRhIGxlYWtpbmcgdmlhIE1lbHRkb3duIHdoZW4gWFBUSSBpcyBpbiB1c2UuCisgKi8K
K0RFRklORV9QRVJfQ1BVX1BBR0VfQUxJR05FRChzdHJ1Y3QgdHNzX3BhZ2UsIGluaXRfdHNzX3Bh
Z2UpOworCiAgYm9vbCAoKmlvZW11bF9oYW5kbGVfcXVpcmspKAogICAgICB1OCBvcGNvZGUsIGNo
YXIgKmlvX2VtdWxfc3R1Yiwgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpOwogIAotLS0gYS94
ZW4vYXJjaC94ODYveGVuLmxkcy5TCisrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKQEAgLTM2
OCw2ICszNjgsOCBAQCBBU1NFUlQoSVNfQUxJR05FRChfXzJNX3J3ZGF0YV9lbmQsICAgU0VDCiAg
CiAgQVNTRVJUKElTX0FMSUdORUQoY3B1MF9zdGFjaywgU1RBQ0tfU0laRSksICJjcHUwX3N0YWNr
IG1pc2FsaWduZWQiKQogIAorQVNTRVJUKElTX0FMSUdORUQocGVyX2NwdV9faW5pdF90c3NfcGFn
ZSwgUEFHRV9TSVpFKSwgInBlcl9jcHUoaW5pdF90c3MpIG1pc2FsaWduZWQiKQorCiAgQVNTRVJU
KElTX0FMSUdORUQoX19pbml0X2JlZ2luLCBQQUdFX1NJWkUpLCAiX19pbml0X2JlZ2luIG1pc2Fs
aWduZWQiKQogIEFTU0VSVChJU19BTElHTkVEKF9faW5pdF9lbmQsICAgUEFHRV9TSVpFKSwgIl9f
aW5pdF9lbmQgbWlzYWxpZ25lZCIpCiAgCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vz
c29yLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaApAQCAtNDExLDcgKzQx
MSw3IEBAIHN0YXRpYyBhbHdheXNfaW5saW5lIHZvaWQgX19td2FpdCh1bnNpZ24KICAjZGVmaW5l
IElPQk1QX0JZVEVTICAgICAgICAgICAgIDgxOTIKICAjZGVmaW5lIElPQk1QX0lOVkFMSURfT0ZG
U0VUICAgIDB4ODAwMAogIAotc3RydWN0IF9fcGFja2VkIF9fY2FjaGVsaW5lX2FsaWduZWQgdHNz
X3N0cnVjdCB7CitzdHJ1Y3QgX19wYWNrZWQgdHNzX3N0cnVjdCB7CiAgICAgIHVpbnQzMl90IDoz
MjsKICAgICAgdWludDY0X3QgcnNwMCwgcnNwMSwgcnNwMjsKICAgICAgdWludDY0X3QgOjY0OwpA
QCAtNDI1LDYgKzQyNSwxMSBAQCBzdHJ1Y3QgX19wYWNrZWQgX19jYWNoZWxpbmVfYWxpZ25lZCB0
c3NfCiAgICAgIC8qIFBhZHMgdGhlIFRTUyB0byBiZSBjYWNoZWxpbmUtYWxpZ25lZCAodG90YWwg
c2l6ZSBpcyAweDgwKS4gKi8KICAgICAgdWludDhfdCBfX2NhY2hlbGluZV9maWxsZXJbMjRdOwog
IH07CitzdHJ1Y3QgdHNzX3BhZ2UgeworICAgIHN0cnVjdCB0c3Nfc3RydWN0IF9fYWxpZ25lZChQ
QUdFX1NJWkUpIHRzczsKK307CitERUNMQVJFX1BFUl9DUFUoc3RydWN0IHRzc19wYWdlLCBpbml0
X3Rzc19wYWdlKTsKKyNkZWZpbmUgcGVyX2NwdV9faW5pdF90c3MgZ2V0X3Blcl9jcHVfdmFyKGlu
aXRfdHNzX3BhZ2UudHNzKQogIAogICNkZWZpbmUgSVNUX05PTkUgMFVMCiAgI2RlZmluZSBJU1Rf
REYgICAxVUwKQEAgLTQ2Myw3ICs0NjgsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZGlzYWJsZV9l
YWNoX2lzdChpZHRfCiAgZXh0ZXJuIGlkdF9lbnRyeV90IGlkdF90YWJsZVtdOwogIGV4dGVybiBp
ZHRfZW50cnlfdCAqaWR0X3RhYmxlc1tdOwogIAotREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCB0c3Nf
c3RydWN0LCBpbml0X3Rzcyk7CiAgREVDTEFSRV9QRVJfQ1BVKHJvb3RfcGdlbnRyeV90ICosIHJv
b3RfcGd0KTsKICAKICBleHRlcm4gdm9pZCB3cml0ZV9wdGJhc2Uoc3RydWN0IHZjcHUgKnYpOwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
