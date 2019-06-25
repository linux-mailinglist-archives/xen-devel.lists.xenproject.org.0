Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A7554EF3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 14:34:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfkbp-0000V9-SV; Tue, 25 Jun 2019 12:31:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VmCq=UY=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1hfkbn-0000V1-Ok
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 12:31:35 +0000
X-Inumbo-ID: 2acc3c08-9745-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2acc3c08-9745-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 12:31:33 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PCNxQP153610
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2019 12:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to :
 subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=FerxN8DhRh2lmUJR/ccjN85jl3V6DXZVnqqiCOWFWnQ=;
 b=pun7vh9iioD/EQu8BJRsNalJHV6IE1J60pwsprjRsNIHNBuEuubURp/Nm5hvdhJMEykd
 0jWFNYncTYy/Dg9c7r1LdLC5qkpAGOgrdyJ43tQlRzgKNPfv2yfQJBPRji6Ue2j/6bNc
 sU13vc6k/UDnsuk/ZsvSL1EkRCee+MQZiiDvtBNgrvK2/0GzEQI8wB4ekQdSb+zcSlmI
 cBC+fMuC6zPsNxcJ2Lr44UAQmr5zCsfpGd5ZtTbHyougggTlP3M5Su0KZS31cS8F7I69
 QyxLK/qrWd7sGcz446R1dFvS8wcIcheP0Sk1gSEnL3RNUT+vLQAGDLmtAHOcSVfXrliE BA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2t9c9pm154-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2019 12:31:33 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PCVO00079944
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2019 12:31:32 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2tat7c75wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2019 12:31:32 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5PCVVch011159
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2019 12:31:31 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Jun 2019 05:31:30 -0700
Date: Tue, 25 Jun 2019 15:31:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: xen-devel@lists.xenproject.org
Message-ID: <20190625123121.GA6674@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=691
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906250099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=743 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250099
Subject: [Xen-devel] [bug report] xen-pcifront: Xen PCI frontend driver.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgWGVuIGRldnMsCgpJIGdldCB0aGUgZm9sbG93aW5nIHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6
CgoJZHJpdmVycy9wY2kveGVuLXBjaWZyb250LmM6MTA3IHNjaGVkdWxlX3BjaWZyb250X2Flcl9v
cCgpCgl3YXJuOiBwYXNzaW5nIGNhc3RlZCBwb2ludGVyICcmcGRldi0+c2hfaW5mby0+ZmxhZ3Mn
IHRvICd0ZXN0X2JpdCgpJyAzMiB2cyA2NC4KCmRyaXZlcnMvcGNpL3hlbi1wY2lmcm9udC5jCiAg
IDEwNSAgc3RhdGljIGlubGluZSB2b2lkIHNjaGVkdWxlX3BjaWZyb250X2Flcl9vcChzdHJ1Y3Qg
cGNpZnJvbnRfZGV2aWNlICpwZGV2KQogICAxMDYgIHsKICAgMTA3ICAgICAgICAgIGlmICh0ZXN0
X2JpdChfWEVOX1BDSUJfYWN0aXZlLCAodW5zaWduZWQgbG9uZyAqKSZwZGV2LT5zaF9pbmZvLT5m
bGFncykKCi0+ZmxhZ3MgaXMgYSB1MzIgc28gdGhpcyBjYXN0IG9ubHkgd29ya3Mgb24gbGl0dGxl
IGVuZGlhbiBzeXN0ZW1zLiAgSQpkb24ndCBrbm93IGlmIHRoYXQgbWF0dGVycyBhdCBhbGwuICBU
aGlzIGRyaXZlciBoYXMgYSBidW5jaCBvZiBzaW1pbGFyCmlzc3Vlcy4gIElzIFhlbiB4ODYgb25s
eT8gIEl0J3MgcHJldHR5IG5vcm1hbCBmb3IgSW50ZWwgY29kZSB0byByZWx5IG9uCmxpdHRsZSBl
bmRpYW5uZXNzLi4uCgogICAxMDggICAgICAgICAgICAgICAgICAmJiAhdGVzdF9hbmRfc2V0X2Jp
dChfUERFVkJfb3BfYWN0aXZlLCAmcGRldi0+ZmxhZ3MpKSB7CiAgIDEwOSAgICAgICAgICAgICAg
ICAgIGRldl9kYmcoJnBkZXYtPnhkZXYtPmRldiwgInNjaGVkdWxlIGFlciBmcm9udGVuZCBqb2Jc
biIpOwogICAxMTAgICAgICAgICAgICAgICAgICBzY2hlZHVsZV93b3JrKCZwZGV2LT5vcF93b3Jr
KTsKICAgMTExICAgICAgICAgIH0KICAgMTEyICB9Cgpkcml2ZXJzL3BjaS94ZW4tcGNpZnJvbnQu
YzoxMDcgc2NoZWR1bGVfcGNpZnJvbnRfYWVyX29wKCkgd2FybjogcGFzc2luZyBjYXN0ZWQgcG9p
bnRlciAnJnBkZXYtPnNoX2luZm8tPmZsYWdzJyB0byAndGVzdF9iaXQoKScgMzIgdnMgNjQuCmRy
aXZlcnMvcGNpL3hlbi1wY2lmcm9udC5jOjEyOSBkb19wY2lfb3AoKSB3YXJuOiBwYXNzaW5nIGNh
c3RlZCBwb2ludGVyICcmcGRldi0+c2hfaW5mby0+ZmxhZ3MnIHRvICdzZXRfYml0KCknIDMyIHZz
IDY0Lgpkcml2ZXJzL3BjaS94ZW4tcGNpZnJvbnQuYzoxNDIgZG9fcGNpX29wKCkgd2FybjogcGFz
c2luZyBjYXN0ZWQgcG9pbnRlciAnJnBkZXYtPnNoX2luZm8tPmZsYWdzJyB0byAndGVzdF9iaXQo
KScgMzIgdnMgNjQuCmRyaXZlcnMvcGNpL3hlbi1wY2lmcm9udC5jOjE1MCBkb19wY2lfb3AoKSB3
YXJuOiBwYXNzaW5nIGNhc3RlZCBwb2ludGVyICcmcGRldi0+c2hfaW5mby0+ZmxhZ3MnIHRvICdj
bGVhcl9iaXQoKScgMzIgdnMgNjQuCmRyaXZlcnMvcGNpL3hlbi1wY2lmcm9udC5jOjE2MiBkb19w
Y2lfb3AoKSB3YXJuOiBwYXNzaW5nIGNhc3RlZCBwb2ludGVyICcmcGRldi0+c2hfaW5mby0+Zmxh
Z3MnIHRvICd0ZXN0X2JpdCgpJyAzMiB2cyA2NC4KZHJpdmVycy9wY2kveGVuLXBjaWZyb250LmM6
NjcwIHBjaWZyb250X2RvX2FlcigpIHdhcm46IHBhc3NpbmcgY2FzdGVkIHBvaW50ZXIgJyZwZGV2
LT5zaF9pbmZvLT5mbGFncycgdG8gJ2NsZWFyX2JpdCgpJyAzMiB2cyA2NC4KZHJpdmVycy94ZW4v
bWNlbG9nLmM6MjA5IHhlbl9tY2VfbG9nKCkgd2FybjogcGFzc2luZyBjYXN0ZWQgcG9pbnRlciAn
Jnhlbl9tY2Vsb2cuZmxhZ3MnIHRvICdzZXRfYml0KCknIDMyIHZzIDY0Lgpkcml2ZXJzL3hlbi9w
cml2Y21kLmM6MzUwIG1tYXBfYmF0Y2hfZm4oKSB3YXJuOiBwYXNzaW5nIGNhc3RlZCBwb2ludGVy
ICdnZm5wJyB0byAneGVuX3JlbWFwX2RvbWFpbl9nZm5fYXJyYXkoKScgNjQgdnMgMzIuCmRyaXZl
cnMveGVuL3ByaXZjbWQuYzo4MjcgcHJpdmNtZF9pb2N0bF9tbWFwX3Jlc291cmNlKCkgd2Fybjog
cGFzc2luZyBjYXN0ZWQgcG9pbnRlciAncGZucycgdG8gJ3hlbl9yZW1hcF9kb21haW5fbWZuX2Fy
cmF5KCknIDY0IHZzIDMyLgpkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9jb25mX3NwYWNlLmM6MTcy
IHhlbl9wY2lia19jb25maWdfcmVhZCgpIHdhcm46IHBhc3NpbmcgY2FzdGVkIHBvaW50ZXIgJyZ2
YWx1ZScgdG8gJ3BjaV9yZWFkX2NvbmZpZ193b3JkKCknIDMyIHZzIDE2Lgpkcml2ZXJzL3hlbi94
ZW4tcGNpYmFjay9jb25mX3NwYWNlLmM6NTcgY29uZl9zcGFjZV9yZWFkKCkgd2FybjogcGFzc2lu
ZyBjYXN0ZWQgcG9pbnRlciAndmFsdWUnIHRvICdmaWVsZC0+dS53LnJlYWQoKScgMzIgdnMgMTYu
CmRyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaWJhY2tfb3BzLmM6MzEwIHhlbl9wY2lia190ZXN0
X2FuZF9zY2hlZHVsZV9vcCgpIHdhcm46IHBhc3NpbmcgY2FzdGVkIHBvaW50ZXIgJyZwZGV2LT5z
aF9pbmZvLT5mbGFncycgdG8gJ3Rlc3RfYml0KCknIDMyIHZzIDY0Lgpkcml2ZXJzL3hlbi94ZW4t
cGNpYmFjay9wY2liYWNrX29wcy5jOjMxNiB4ZW5fcGNpYmtfdGVzdF9hbmRfc2NoZWR1bGVfb3Ao
KSB3YXJuOiBwYXNzaW5nIGNhc3RlZCBwb2ludGVyICcmcGRldi0+c2hfaW5mby0+ZmxhZ3MnIHRv
ICd0ZXN0X2JpdCgpJyAzMiB2cyA2NC4KZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpYmFja19v
cHMuYzozOTYgeGVuX3BjaWJrX2RvX29wKCkgd2FybjogcGFzc2luZyBjYXN0ZWQgcG9pbnRlciAn
JnBkZXYtPnNoX2luZm8tPmZsYWdzJyB0byAnY2xlYXJfYml0KCknIDMyIHZzIDY0Lgpkcml2ZXJz
L3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jOjczMSBjb21tb25fcHJvY2VzcygpIHdhcm46IHBh
c3NpbmcgY2FzdGVkIHBvaW50ZXIgJyZzaF9pbmZvLT5mbGFncycgdG8gJ3NldF9iaXQoKScgMzIg
dnMgNjQuCmRyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmM6NzM2IGNvbW1vbl9wcm9j
ZXNzKCkgd2FybjogcGFzc2luZyBjYXN0ZWQgcG9pbnRlciAnJnNoX2luZm8tPmZsYWdzJyB0byAn
dGVzdF9iaXQoKScgMzIgdnMgNjQuCmRyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmM6
NzQxIGNvbW1vbl9wcm9jZXNzKCkgd2FybjogcGFzc2luZyBjYXN0ZWQgcG9pbnRlciAnJnNoX2lu
Zm8tPmZsYWdzJyB0byAndGVzdF9iaXQoKScgMzIgdnMgNjQuCmRyaXZlcnMveGVuL3hlbi1wY2li
YWNrL3BjaV9zdHViLmM6NzQ1IGNvbW1vbl9wcm9jZXNzKCkgd2FybjogcGFzc2luZyBjYXN0ZWQg
cG9pbnRlciAnJnNoX2luZm8tPmZsYWdzJyB0byAnY2xlYXJfYml0KCknIDMyIHZzIDY0Lgpkcml2
ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jOjc1MyBjb21tb25fcHJvY2VzcygpIHdhcm46
IHBhc3NpbmcgY2FzdGVkIHBvaW50ZXIgJyZzaF9pbmZvLT5mbGFncycgdG8gJ3Rlc3RfYml0KCkn
IDMyIHZzIDY0Lgpkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jOjc5OSB4ZW5fcGNp
Ymtfc2xvdF9yZXNldCgpIHdhcm46IHBhc3NpbmcgY2FzdGVkIHBvaW50ZXIgJyZwc2Rldi0+cGRl
di0+c2hfaW5mby0+ZmxhZ3MnIHRvICd0ZXN0X2JpdCgpJyAzMiB2cyA2NC4KZHJpdmVycy94ZW4v
eGVuLXBjaWJhY2svcGNpX3N0dWIuYzo4NTcgeGVuX3BjaWJrX21taW9fZW5hYmxlZCgpIHdhcm46
IHBhc3NpbmcgY2FzdGVkIHBvaW50ZXIgJyZwc2Rldi0+cGRldi0+c2hfaW5mby0+ZmxhZ3MnIHRv
ICd0ZXN0X2JpdCgpJyAzMiB2cyA2NC4KZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIu
Yzo5MTYgeGVuX3BjaWJrX2Vycm9yX2RldGVjdGVkKCkgd2FybjogcGFzc2luZyBjYXN0ZWQgcG9p
bnRlciAnJnBzZGV2LT5wZGV2LT5zaF9pbmZvLT5mbGFncycgdG8gJ3Rlc3RfYml0KCknIDMyIHZz
IDY0Lgpkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jOjk2OSB4ZW5fcGNpYmtfZXJy
b3JfcmVzdW1lKCkgd2FybjogcGFzc2luZyBjYXN0ZWQgcG9pbnRlciAnJnBzZGV2LT5wZGV2LT5z
aF9pbmZvLT5mbGFncycgdG8gJ3Rlc3RfYml0KCknIDMyIHZzIDY0LgoKcmVnYXJkcywKZGFuIGNh
cnBlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
