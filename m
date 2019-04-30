Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BA1F00C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 07:41:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLLTC-0002do-E7; Tue, 30 Apr 2019 05:38:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xnvC=TA=sina.com=hdanton@srs-us1.protection.inumbo.net>)
 id 1hLLTA-0002dj-RR
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 05:38:20 +0000
X-Inumbo-ID: 27f36ddb-6b0a-11e9-843c-bc764e045a96
Received: from mail3-167.sinamail.sina.com.cn (unknown [202.108.3.167])
 by us1-rack-dfw2.inumbo.com (Halon) with SMTP
 id 27f36ddb-6b0a-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 05:38:18 +0000 (UTC)
Received: from unknown (HELO [IPv6:::ffff:192.168.199.155])([222.131.69.26])
 by sina.com with ESMTP
 id 5CC7DF2200002E56; Tue, 30 Apr 2019 13:37:39 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 313802396799
MIME-Version: 1.0
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Hillf Danton <hdanton@sina.com>
Date: Tue, 30 Apr 2019 13:37:35 +0800
Importance: normal
X-Priority: 3
Subject: [Xen-devel] [patch 2/2] xen/arm: Use p2m entry with lock protection
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
Cc: "Stefano Stabellini <sstabellini@kernel.org>" <sstabellini@kernel.org>
Content-Type: multipart/mixed; boundary="===============4862755700851381925=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-Id: <E1hLLTC-0002do-E7@lists.xenproject.org>


--===============4862755700851381925==
Content-Type: multipart/alternative;
	boundary="_8C2FE19F-456B-4BA5-A051-B4146492086D_"


--_8C2FE19F-456B-4BA5-A051-B4146492086D_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

A new local variable is introduced for accessing p2m entry with lock protec=
tion.

Cc: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Hillf Danton <hdanton@sina.com>
---

--- a/arch/arm/xen/p2m.c	2019-04-30 12:32:05.363768200 +0800
+++ b/arch/arm/xen/p2m.c	2019-04-30 12:58:19.854334100 +0800
@@ -70,8 +70,9 @@ unsigned long __pfn_to_mfn(unsigned long
		entry =3D rb_entry(n, struct xen_p2m_entry, rbnode_phys);
		if (entry->pfn <=3D pfn &&
				entry->pfn + entry->nr_pages > pfn) {
+			unsigned long mfn =3D entry->mfn + (pfn - entry->pfn);
			read_unlock_irqrestore(&p2m_lock, irqflags);
-			return entry->mfn + (pfn - entry->pfn);
+			return mfn;
		}
		if (pfn < entry->pfn)
			n =3D n->rb_left;
--


--_8C2FE19F-456B-4BA5-A051-B4146492086D_
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="utf-8"

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj48aGVhZD48bWV0YSBodHRwLWVxdWl2PUNv
bnRlbnQtVHlwZSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjxtZXRhIG5hbWU9
R2VuZXJhdG9yIGNvbnRlbnQ9Ik1pY3Jvc29mdCBXb3JkIDE1IChmaWx0ZXJlZCBtZWRpdW0pIj48
c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFjZQ0KCXtmb250LWZh
bWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0O30NCkBm
b250LWZhY2UNCgl7Zm9udC1mYW1pbHk6RGVuZ1hpYW47DQoJcGFub3NlLTE6MiAxIDYgMCAzIDEg
MSAxIDEgMTt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkRlbmdYaWFuOw0KCXBhbm9zZS0x
OjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9y
bWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBjbTsNCgltYXJnaW4t
Ym90dG9tOi4wMDAxcHQ7DQoJdGV4dC1hbGlnbjpqdXN0aWZ5Ow0KCXRleHQtanVzdGlmeTppbnRl
ci1pZGVvZ3JhcGg7DQoJZm9udC1zaXplOjEwLjVwdDsNCglmb250LWZhbWlseTpEZW5nWGlhbjt9
DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTt9DQovKiBQYWdl
IERlZmluaXRpb25zICovDQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo2MTIuMHB0IDc5Mi4w
cHQ7DQoJbWFyZ2luOjcyLjBwdCA5MC4wcHQgNzIuMHB0IDkwLjBwdDt9DQpkaXYuV29yZFNlY3Rp
b24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+PC9oZWFkPjxib2R5IGxhbmc9
WkgtQ04+PGRpdiBjbGFzcz1Xb3JkU2VjdGlvbjE+PHAgY2xhc3M9TXNvTm9ybWFsPjxzcGFuIGxh
bmc9RU4tVVM+QSBuZXcgbG9jYWwgdmFyaWFibGUgaXMgaW50cm9kdWNlZCBmb3IgYWNjZXNzaW5n
IHAybSBlbnRyeSB3aXRoIGxvY2sgcHJvdGVjdGlvbi48L3NwYW4+PC9wPjxwIGNsYXNzPU1zb05v
cm1hbD48c3BhbiBsYW5nPUVOLVVTPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFz
cz1Nc29Ob3JtYWw+PHNwYW4gbGFuZz1FTi1VUz5DYzogU3RlZmFubyBTdGFiZWxsaW5pICZsdDtz
c3RhYmVsbGluaUBrZXJuZWwub3JnJmd0Ozwvc3Bhbj48L3A+PHAgY2xhc3M9TXNvTm9ybWFsPjxz
cGFuIGxhbmc9RU4tVVM+U2lnbmVkLW9mZi1ieTogSGlsbGYgRGFudG9uICZsdDtoZGFudG9uQHNp
bmEuY29tJmd0Ozwvc3Bhbj48L3A+PHAgY2xhc3M9TXNvTm9ybWFsPjxzcGFuIGxhbmc9RU4tVVM+
LS0tPC9zcGFuPjwvcD48cCBjbGFzcz1Nc29Ob3JtYWw+PHNwYW4gbGFuZz1FTi1VUz48bzpwPiZu
YnNwOzwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9TXNvTm9ybWFsPjxzcGFuIGxhbmc9RU4tVVM+
LS0tIGEvYXJjaC9hcm0veGVuL3AybS5jIDIwMTktMDQtMzAgMTI6MzI6MDUuMzYzNzY4MjAwICsw
ODAwPC9zcGFuPjwvcD48cCBjbGFzcz1Nc29Ob3JtYWw+PHNwYW4gbGFuZz1FTi1VUz4rKysgYi9h
cmNoL2FybS94ZW4vcDJtLmPCoMKgwqAgMjAxOS0wNC0zMCAxMjo1ODoxOS44NTQzMzQxMDAgKzA4
MDA8L3NwYW4+PC9wPjxwIGNsYXNzPU1zb05vcm1hbD48c3BhbiBsYW5nPUVOLVVTPkBAIC03MCw4
ICs3MCw5IEBAIHVuc2lnbmVkIGxvbmcgX19wZm5fdG9fbWZuKHVuc2lnbmVkIGxvbmc8L3NwYW4+
PC9wPjxwIGNsYXNzPU1zb05vcm1hbD48c3BhbiBsYW5nPUVOLVVTPsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBlbnRyeSA9IHJiX2VudHJ5KG4sIHN0cnVjdCB4ZW5fcDJtX2VudHJ5LCByYm5vZGVf
cGh5cyk7PC9zcGFuPjwvcD48cCBjbGFzcz1Nc29Ob3JtYWw+PHNwYW4gbGFuZz1FTi1VUz7CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVudHJ5LSZndDtwZm4gJmx0Oz0gcGZuICZhbXA7JmFt
cDs8L3NwYW4+PC9wPjxwIGNsYXNzPU1zb05vcm1hbD48c3BhbiBsYW5nPUVOLVVTPsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW50cnktJmd0O3Bm
biArIGVudHJ5LSZndDtucl9wYWdlcyAmZ3Q7IHBmbikgezwvc3Bhbj48L3A+PHAgY2xhc3M9TXNv
Tm9ybWFsPjxzcGFuIGxhbmc9RU4tVVM+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdW5zaWduZWQgbG9uZyBtZm4gPSBlbnRyeS0mZ3Q7bWZuICsgKHBmbiAtIGVudHJ5LSZndDtw
Zm4pOzwvc3Bhbj48L3A+PHAgY2xhc3M9TXNvTm9ybWFsPjxzcGFuIGxhbmc9RU4tVVM+wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVhZF91bmxvY2tfaXJxcmVzdG9yZSgm
YW1wO3AybV9sb2NrLCBpcnFmbGFncyk7PC9zcGFuPjwvcD48cCBjbGFzcz1Nc29Ob3JtYWw+PHNw
YW4gbGFuZz1FTi1VUz4twqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
ZW50cnktJmd0O21mbiArIChwZm4gLSBlbnRyeS0mZ3Q7cGZuKTs8L3NwYW4+PC9wPjxwIGNsYXNz
PU1zb05vcm1hbD48c3BhbiBsYW5nPUVOLVVTPivCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqDC
oMKgwqAgcmV0dXJuIG1mbjs8L3NwYW4+PC9wPjxwIGNsYXNzPU1zb05vcm1hbD48c3BhbiBsYW5n
PUVOLVVTPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9PC9zcGFuPjwvcD48cCBjbGFzcz1Nc29O
b3JtYWw+PHNwYW4gbGFuZz1FTi1VUz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHBmbiAm
bHQ7IGVudHJ5LSZndDtwZm4pPC9zcGFuPjwvcD48cCBjbGFzcz1Nc29Ob3JtYWw+PHNwYW4gbGFu
Zz1FTi1VUz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuID0gbi0mZ3Q7
cmJfbGVmdDs8L3NwYW4+PC9wPjxwIGNsYXNzPU1zb05vcm1hbD48c3BhbiBsYW5nPUVOLVVTPi0t
PC9zcGFuPjxzcGFuIGxhbmc9RU4tVVMgc3R5bGU9J2ZvbnQtc2l6ZToxMi4wcHQnPjxvOnA+PC9v
OnA+PC9zcGFuPjwvcD48cCBjbGFzcz1Nc29Ob3JtYWw+PHNwYW4gbGFuZz1FTi1VUz48bzpwPiZu
YnNwOzwvbzpwPjwvc3Bhbj48L3A+PC9kaXY+PC9ib2R5PjwvaHRtbD4=

--_8C2FE19F-456B-4BA5-A051-B4146492086D_--




--===============4862755700851381925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4862755700851381925==--



