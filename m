Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ADD105958
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 19:16:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXqxP-0003ik-BV; Thu, 21 Nov 2019 18:13:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPri=ZN=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iXqxO-0003iR-FV
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 18:13:30 +0000
X-Inumbo-ID: 97bea9d2-0c8a-11ea-b678-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97bea9d2-0c8a-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 18:13:18 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n21so4259191ljg.12
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 10:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PCT5CX2D/qI3pj3Q/bbzvWBes5x8xliwvVl0q/Ba/Tg=;
 b=RXzx9/Q10nU8klt3oKsRUxLIG5R5KarKEtAKJMNb1twNbA9W+mXzGpgh8IZCGAFkGh
 aQ3H4tOrNHBdlmo6/4L3UauiKdNmN7YkLxRGM2Rv4JKB5hiWaOlInFOFGlrgW68utS8q
 jQNavALO3meB2btwVFBzIQqUEcfEmKORhT7hDTMpBI433RgK1xoxNEw0WJtPbB/JlsnK
 x5HSQpfTu89ffLLVF8Tdve54QDEXeuAiTVz9d/2fyENHTn1zC1OgIGjnDjnV5bJjJ2gS
 C6RxwsE3wTY09VIlcQ7OZzl/kserPoApUvNq6alu0s3ozJbB4E+CM6DteqcNTekNwWq2
 LZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PCT5CX2D/qI3pj3Q/bbzvWBes5x8xliwvVl0q/Ba/Tg=;
 b=MAD2xkyTcixpqSXcsZgy+wHrGwuKRaEfei+n85Zvmx/CKcXFh5nU+FDlr/qZK57xjf
 KXDfnlX+K03glHroBiRr8UuQygLW6JjG6XQkjM6XwG6gVq2wbYY18Tgxh97kwUyNgLjd
 ZlFVKKaElPwkdvTVQG4iL2bvQ6txeHBHi0zoQJdqs+tKxpaw+qn7i4fbKymZH/xHYya7
 BY7acol5ZP4ypNOB8jZ2THTsf162tTOTzh6yWwetlsOmXvJo0+02bEtVv6+tzZsU1HUA
 z9tnLTwvLVeBMfpdMNziZi0hQia3xitQqVhHSGcz+9Ogaxwnsff44me0I75Kap+J2s+W
 hHHw==
X-Gm-Message-State: APjAAAXlK1dDqsVo+7TIGQ2aHbW1Ou69HKNNOyrMB7E6lvdQnXW4MFl/
 64Qv300qwChGtw4zejGm8+6WHP1U3E8ULg==
X-Google-Smtp-Source: APXvYqz2pPFC0s4d1oCnWRNXJO76vmvLqFx5iHpyrJWTCfOg8+z3RY0bGTqAcZLO58g8uRLZCQPKhg==
X-Received: by 2002:a2e:97d3:: with SMTP id m19mr8804136ljj.56.1574359997197; 
 Thu, 21 Nov 2019 10:13:17 -0800 (PST)
Received: from al1-pc.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id v12sm1855473lfb.47.2019.11.21.10.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 10:13:16 -0800 (PST)
From: Oleksandr Grytsov <al1img@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 21 Nov 2019 20:13:00 +0200
Message-Id: <20191121181300.6497-4-al1img@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191121181300.6497-1-al1img@gmail.com>
References: <20191121181300.6497-1-al1img@gmail.com>
Subject: [Xen-devel] [PATCH v2 3/3] libxl: make default path to add/remove
 all PV devices
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
Cc: anthony.perard@citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 ian.jackson@eu.citrix.com, wl@xen.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKQWRk
aW5nL3JlbW92aW5nIGRldmljZSBpcyBoYW5kbGVkIGZvciBzcGVjaWZpYyBkZXZpY2VzIG9ubHk6
IFZCRCwgVklGLApRRElTSy4gVGhpcyBjb21taXQgYWRkcyBkZWZhdWx0IGNhc2UgdG8gaGFuZGxl
IGFkZGluZy9yZW1vdmluZyBmb3IgYWxsIFBWCmRldmljZXMgYnkgZGVmYXVsdCwgZXhjZXB0IFFE
SVNLIGRldmljZSwgd2hpY2ggcmVxdWlyZXMgc3BlY2lhbCBoYW5kbGluZy4KSWYgYW55IG90aGVy
IGRldmljZSBpcyByZXF1aXJlZCBhIHNwZWNpYWwgaGFuZGxpbmcgaXQgc2hvdWxkIGJlIGRvbmUg
YnkKaW1wbGVtZW50aW5nIHNlcGFyYXRlIGNhc2UgKHNpbWlsYXIgdG8gUURJU0sgZGV2aWNlKS4g
VGhlIGRlZmF1bHQKYmVoYXZpb3VyIGZvciBhZGRpbmcgZGV2aWNlIGlzIHRvIHdhaXQgd2hlbiB0
aGUgYmFja2VuZCBnb2VzIHRvClhlbmJ1c1N0YXRlSW5pdFdhaXQgYW5kIHRoZSBkZWZhdWx0IGJl
aGF2aW91ciBvbiByZW1vdmluZyBkZXZpY2UgaXMgdG8Kc3RhcnQgZ2VuZXJpYyBkZXZpY2UgcmVt
b3ZlIHByb2NlZHVyZS4KCkFsc28gdGhpcyBjb21taXQgZml4ZXMgcmVtb3ZpbmcgZ3Vlc3QgZnVu
Y3Rpb246IGJlZm9yZSB0aGUgZ3Vlc3Qgd2FzCnJlbW92ZWQgd2hlbiBhbGwgVklGIGFuZCBWQkQg
ZGV2aWNlcyBhcmUgcmVtb3ZlZC4gVGhlIGZpeCByZW1vdmVzCmd1ZXN0IHdoZW4gYWxsIGNyZWF0
ZWQgZGV2aWNlcyBhcmUgcmVtb3ZlZC4gVGhpcyBpcyBkb25lIGJ5IGNoZWNraW5nIHRoZQpndWVz
dCBkZXZpY2UgbGlzdCBpbnN0ZWFkIG9mIGNoZWNraW5nIG51bV92aWZzIGFuZCBudW1fdmJkcy4g
bnVtX3ZpZnMgYW5kCm51bV92YmRzIHZhcmlhYmxlcyBhcmUgcmVtb3ZlZCBhcyByZWR1bmRhbnQg
aW4gdGhpcyBjYXNlLgoKU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5k
cl9ncnl0c292QGVwYW0uY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jIHwgNjMg
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
NCBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4
bC9saWJ4bF9kZXZpY2UuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jCmluZGV4IDE0MDJi
NjFhODEuLjlkMDVkMmZkMTMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5j
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jCkBAIC0xNDc3LDcgKzE0NzcsNyBAQCB0
eXBlZGVmIHN0cnVjdCBsaWJ4bF9fZGRvbWFpbl9kZXZpY2UgewogICovCiB0eXBlZGVmIHN0cnVj
dCBsaWJ4bF9fZGRvbWFpbl9ndWVzdCB7CiAgICAgdWludDMyX3QgZG9taWQ7Ci0gICAgaW50IG51
bV92aWZzLCBudW1fdmJkcywgbnVtX3FkaXNrczsKKyAgICBpbnQgbnVtX3FkaXNrczsKICAgICBM
SUJYTF9TTElTVF9IRUFEKCwgc3RydWN0IGxpYnhsX19kZG9tYWluX2RldmljZSkgZGV2aWNlczsK
ICAgICBMSUJYTF9TTElTVF9FTlRSWShzdHJ1Y3QgbGlieGxfX2Rkb21haW5fZ3Vlc3QpIG5leHQ7
CiB9IGxpYnhsX19kZG9tYWluX2d1ZXN0OwpAQCAtMTUzMCw4ICsxNTMwLDcgQEAgc3RhdGljIHZv
aWQgY2hlY2tfYW5kX21heWJlX3JlbW92ZV9ndWVzdChsaWJ4bF9fZ2MgKmdjLAogewogICAgIGFz
c2VydChkZG9tYWluKTsKIAotICAgIGlmIChkZ3Vlc3QgIT0gTlVMTCAmJgotICAgICAgICBkZ3Vl
c3QtPm51bV92aWZzICsgZGd1ZXN0LT5udW1fdmJkcyArIGRndWVzdC0+bnVtX3FkaXNrcyA9PSAw
KSB7CisgICAgaWYgKGRndWVzdCAhPSBOVUxMICYmIExJQlhMX1NMSVNUX0ZJUlNUKCZkZ3Vlc3Qt
PmRldmljZXMpID09IE5VTEwpIHsKICAgICAgICAgTElCWExfU0xJU1RfUkVNT1ZFKCZkZG9tYWlu
LT5ndWVzdHMsIGRndWVzdCwgbGlieGxfX2Rkb21haW5fZ3Vlc3QsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBuZXh0KTsKICAgICAgICAgTE9HRChERUJVRywgZGd1ZXN0LT5kb21pZCwgIlJl
bW92ZWQgZG9tYWluIGZyb20gdGhlIGxpc3Qgb2YgYWN0aXZlIGd1ZXN0cyIpOwpAQCAtMTU3MSwy
NCArMTU3MCw2IEBAIHN0YXRpYyBpbnQgYWRkX2RldmljZShsaWJ4bF9fZWdjICplZ2MsIGxpYnhs
X19hbyAqYW8sCiAgICAgICAgICBsaWJ4bF9fZGV2aWNlX2JhY2tlbmRfcGF0aChnYywgZGV2KSk7
CiAKICAgICBzd2l0Y2goZGV2LT5iYWNrZW5kX2tpbmQpIHsKLSAgICBjYXNlIExJQlhMX19ERVZJ
Q0VfS0lORF9WQkQ6Ci0gICAgY2FzZSBMSUJYTF9fREVWSUNFX0tJTkRfVklGOgotICAgICAgICBp
ZiAoZGV2LT5iYWNrZW5kX2tpbmQgPT0gTElCWExfX0RFVklDRV9LSU5EX1ZCRCkgZGd1ZXN0LT5u
dW1fdmJkcysrOwotICAgICAgICBpZiAoZGV2LT5iYWNrZW5kX2tpbmQgPT0gTElCWExfX0RFVklD
RV9LSU5EX1ZJRikgZGd1ZXN0LT5udW1fdmlmcysrOwotCi0gICAgICAgIEdDTkVXKGFvZGV2KTsK
LSAgICAgICAgbGlieGxfX3ByZXBhcmVfYW9fZGV2aWNlKGFvLCBhb2Rldik7Ci0gICAgICAgIC8q
Ci0gICAgICAgICAqIENsb25lIHRoZSBsaWJ4bF9fZGV2aWNlIHRvIGF2b2lkIHJhY2VzIGlmIHJl
bW92ZV9kZXZpY2UgaXMgY2FsbGVkCi0gICAgICAgICAqIGJlZm9yZSB0aGUgZGV2aWNlIGFkZGl0
aW9uIGhhcyBmaW5pc2hlZC4KLSAgICAgICAgICovCi0gICAgICAgIEdDTkVXKGFvZGV2LT5kZXYp
OwotICAgICAgICAqYW9kZXYtPmRldiA9ICpkZXY7Ci0gICAgICAgIGFvZGV2LT5hY3Rpb24gPSBM
SUJYTF9fREVWSUNFX0FDVElPTl9BREQ7Ci0gICAgICAgIGFvZGV2LT5jYWxsYmFjayA9IGRldmlj
ZV9jb21wbGV0ZTsKLSAgICAgICAgbGlieGxfX3dhaXRfZGV2aWNlX2Nvbm5lY3Rpb24oZWdjLCBh
b2Rldik7Ci0KLSAgICAgICAgYnJlYWs7CiAgICAgY2FzZSBMSUJYTF9fREVWSUNFX0tJTkRfUURJ
U0s6CiAgICAgICAgIGlmIChkZ3Vlc3QtPm51bV9xZGlza3MgPT0gMCkgewogICAgICAgICAgICAg
R0NORVcoZG1zcyk7CkBAIC0xNTk5LDEwICsxNTgwLDE5IEBAIHN0YXRpYyBpbnQgYWRkX2Rldmlj
ZShsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19hbyAqYW8sCiAgICAgICAgICAgICBsaWJ4bF9fc3Bh
d25fcWRpc2tfYmFja2VuZChlZ2MsIGRtc3MpOwogICAgICAgICB9CiAgICAgICAgIGRndWVzdC0+
bnVtX3FkaXNrcysrOwotCiAgICAgICAgIGJyZWFrOwogICAgIGRlZmF1bHQ6Ci0gICAgICAgIHJj
ID0gMTsKKyAgICAgICAgR0NORVcoYW9kZXYpOworICAgICAgICBsaWJ4bF9fcHJlcGFyZV9hb19k
ZXZpY2UoYW8sIGFvZGV2KTsKKyAgICAgICAgLyoKKyAgICAgICAgICogQ2xvbmUgdGhlIGxpYnhs
X19kZXZpY2UgdG8gYXZvaWQgcmFjZXMgaWYgcmVtb3ZlX2RldmljZSBpcyBjYWxsZWQKKyAgICAg
ICAgICogYmVmb3JlIHRoZSBkZXZpY2UgYWRkaXRpb24gaGFzIGZpbmlzaGVkLgorICAgICAgICAg
Ki8KKyAgICAgICAgR0NORVcoYW9kZXYtPmRldik7CisgICAgICAgICphb2Rldi0+ZGV2ID0gKmRl
djsKKyAgICAgICAgYW9kZXYtPmFjdGlvbiA9IExJQlhMX19ERVZJQ0VfQUNUSU9OX0FERDsKKyAg
ICAgICAgYW9kZXYtPmNhbGxiYWNrID0gZGV2aWNlX2NvbXBsZXRlOworICAgICAgICBsaWJ4bF9f
d2FpdF9kZXZpY2VfY29ubmVjdGlvbihlZ2MsIGFvZGV2KTsKICAgICAgICAgYnJlYWs7CiAgICAg
fQogCkBAIC0xNjE5LDExICsxNjA5LDE3IEBAIHN0YXRpYyBpbnQgcmVtb3ZlX2RldmljZShsaWJ4
bF9fZWdjICplZ2MsIGxpYnhsX19hbyAqYW8sCiAgICAgaW50IHJjID0gMDsKIAogICAgIHN3aXRj
aChkZGV2LT5kZXYtPmJhY2tlbmRfa2luZCkgewotICAgIGNhc2UgTElCWExfX0RFVklDRV9LSU5E
X1ZCRDoKLSAgICBjYXNlIExJQlhMX19ERVZJQ0VfS0lORF9WSUY6Ci0gICAgICAgIGlmIChkZXYt
PmJhY2tlbmRfa2luZCA9PSBMSUJYTF9fREVWSUNFX0tJTkRfVkJEKSBkZ3Vlc3QtPm51bV92YmRz
LS07Ci0gICAgICAgIGlmIChkZXYtPmJhY2tlbmRfa2luZCA9PSBMSUJYTF9fREVWSUNFX0tJTkRf
VklGKSBkZ3Vlc3QtPm51bV92aWZzLS07Ci0KKyAgICBjYXNlIExJQlhMX19ERVZJQ0VfS0lORF9R
RElTSzoKKyAgICAgICAgaWYgKC0tZGd1ZXN0LT5udW1fcWRpc2tzID09IDApIHsKKyAgICAgICAg
ICAgIHJjID0gbGlieGxfX2Rlc3Ryb3lfcWRpc2tfYmFja2VuZChnYywgZGV2LT5kb21pZCk7Cisg
ICAgICAgICAgICBpZiAocmMpCisgICAgICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAgIH0K
KyAgICAgICAgbGlieGxfX2RldmljZV9kZXN0cm95KGdjLCBkZXYpOworICAgICAgICAvKiBSZXR1
cm4gPiAwLCBubyBhbyBoYXMgYmVlbiBkaXNwYXRjaGVkICovCisgICAgICAgIHJjID0gMTsKKyAg
ICAgICAgYnJlYWs7CisgICAgZGVmYXVsdDoKICAgICAgICAgR0NORVcoYW9kZXYpOwogICAgICAg
ICBsaWJ4bF9fcHJlcGFyZV9hb19kZXZpY2UoYW8sIGFvZGV2KTsKICAgICAgICAgLyoKQEAgLTE2
MzYsMTcgKzE2MzIsNiBAQCBzdGF0aWMgaW50IHJlbW92ZV9kZXZpY2UobGlieGxfX2VnYyAqZWdj
LCBsaWJ4bF9fYW8gKmFvLAogICAgICAgICBhb2Rldi0+Y2FsbGJhY2sgPSBkZXZpY2VfY29tcGxl
dGU7CiAgICAgICAgIGxpYnhsX19pbml0aWF0ZV9kZXZpY2VfZ2VuZXJpY19yZW1vdmUoZWdjLCBh
b2Rldik7CiAgICAgICAgIGJyZWFrOwotICAgIGNhc2UgTElCWExfX0RFVklDRV9LSU5EX1FESVNL
OgotICAgICAgICBpZiAoLS1kZ3Vlc3QtPm51bV9xZGlza3MgPT0gMCkgewotICAgICAgICAgICAg
cmMgPSBsaWJ4bF9fZGVzdHJveV9xZGlza19iYWNrZW5kKGdjLCBkZXYtPmRvbWlkKTsKLSAgICAg
ICAgICAgIGlmIChyYykKLSAgICAgICAgICAgICAgICBnb3RvIG91dDsKLSAgICAgICAgfQotICAg
ICAgICBsaWJ4bF9fZGV2aWNlX2Rlc3Ryb3koZ2MsIGRldik7Ci0gICAgICAgIC8qIEZhbGwgdGhy
b3VnaCB0byByZXR1cm4gPiAwLCBubyBhbyBoYXMgYmVlbiBkaXNwYXRjaGVkICovCi0gICAgZGVm
YXVsdDoKLSAgICAgICAgcmMgPSAxOwotICAgICAgICBicmVhazsKICAgICB9CiAKICAgICAvKgot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
