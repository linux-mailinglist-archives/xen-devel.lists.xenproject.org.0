Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C73EC9B12
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 11:50:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFxhu-0001Hr-Us; Thu, 03 Oct 2019 09:47:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rm3c=X4=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iFxht-0001Hm-7z
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 09:47:33 +0000
X-Inumbo-ID: d13c87c2-e5c2-11e9-9722-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id d13c87c2-e5c2-11e9-9722-12813bfff9fa;
 Thu, 03 Oct 2019 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570096052;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=KDsmoZy09KVRS2b86IfOFjM8ik0kDuihZk7s6q6vXMY=;
 b=a9zhPovZHwZMMNks+BMOsaG1HiH3TAyHuKeeksw6CkKVQh2wCQM0Oxgw
 uKtD8RCVEaDemeBk7fvM60G3MrGlHmPL2wG5hc3AIicsIH0uBpImM4oXK
 EemxWft1VQBghn9nRk9OHFJvPx8lBJ50Siye9xHH8JPb/AOmAFTu+qm83 g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0FX/wldK9XFpRvkVmjVViq0eApTA762rBTs84DijjCS6p8v9bo4zi7fRvpODKZBkHvuF1JIEXr
 WHUyt7SJKKMfxHTeFmIhSjxOqHHkONJ1V/sA8TM1eUlrVYkbSs80+KRA6Y2ZcOp1sEmc5n2sAr
 l6ZtF5btfzeiP+BT3Vmi1wDCM1tik1lupNn6GmuLREUetezWWDvzDch+YTsV8RwiAH/Tda9bqk
 gp+KoUcKq3qFlMrg6Y4YJ9BC3/MJyA/oJE+p7ouhDsewX3eSdUU9SglRler0QjCQhGBLseTXzV
 +v0=
X-SBRS: 2.7
X-MesageID: 6412234
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,251,1566878400"; 
   d="scan'208";a="6412234"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20191002072745.24919-1-jgross@suse.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <b62b6f30-589b-e155-25a2-5000eb869ecb@citrix.com>
Date: Thu, 3 Oct 2019 10:47:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002072745.24919-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 00/20] xen: add core scheduling support
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCkxvb2tzIGxpa2Ugd2UndmUgaGl0IHRoZSBmaXJzdCBYZW4gY3Jhc2ggd2l0
aCBjb3JlIHNjaGVkdWxpbmcgcGF0Y2hlcyBhcHBsaWVkLgpUaGUgbG9nIGlzIGJlbG93LiBGcm9t
IG15IGFuYWx5c2lzIGl0IHNlZW1zIHRoYXQgQ1NDSEVEX1BDUFUgaXMgTlVMTC4KSSBzdXNwZWN0
IHRoaXMgaXMgY29ubmVjdGVkIHRvIGNvbW1pdCBiMDAwMGIxMjhhZGIKKCJzY2hlZDogcG9wdWxh
dGUgY3B1cG9vbDAgb25seSBhZnRlciBhbGwgY3B1cyBhcmUgdXAiKQoKQ291bGQgeW91IHRha2Ug
YSBsb29rLCBwbGVhc2U/CgooWEVOKSBbICAxNjQuNzc1MjA2XSBCcm91Z2h0IHVwIDQ0OCBDUFVz
CihYRU4pIFsgIDE2NC44Mjc5NzldIFRlc3RpbmcgTk1JIHdhdGNoZG9nIG9uIGFsbCBDUFVzOiBv
awooWEVOKSBbICAxNjguMDY0Njc4XSAtLS0tWyBYZW4tNC4xMy4wLTguMC4xMi1kICB4ODZfNjQg
IGRlYnVnPXkgICBOb3QgdGFpbnRlZCBdLS0tLQooWEVOKSBbICAxNjguMTI4ODIyXSBDUFU6ICAg
IDc5CihYRU4pIFsgIDE2OC4xOTEzOTRdIFJJUDogICAgZTAwODpbPGZmZmY4MmQwODAyNDY3ZGM+
XSBzZXRfdGltZXIrMHgzOS8weDFmNwooWEVOKSBbICAxNjguMjU1OTIxXSBSRkxBR1M6IDAwMDAw
MDAwMDAwMTAwMDIgICBDT05URVhUOiBoeXBlcnZpc29yCihYRU4pIFsgIDE2OC4zMTk3NTJdIHJh
eDogMDAwMDAwMDAwMDAwMDA0OCAgIHJieDogMDAwMDAwMDAwMDAwMDAyMCAgIHJjeDogZmZmZjgy
ZDA4MDViODAwOAooWEVOKSBbICAxNjguMzgyNTYzXSByZHg6IGZmZmY4NDYyZWZjZTdmZmYgICBy
c2k6IDAwMDAwMDI3MjFjMGFkODAgICByZGk6IDAwMDAwMDAwMDAwMDAwMjAKKFhFTikgWyAgMTY4
LjQ0NTE5NF0gcmJwOiBmZmZmODQ2MmVmY2U3ZGUwICAgcnNwOiBmZmZmODQ2MmVmY2U3ZGEwICAg
cjg6ICAwMDAwMDAwMDAwMDA4ZWVhCihYRU4pIFsgIDE2OC41MDc2MzBdIHI5OiAgMDAwMDAwMDAw
MDAwMDAwMCAgIHIxMDogMzMzMzMzMzMzMzMzMzMzMyAgIHIxMTogMDAwMDAwMDAwMDAwMDAwOAoo
WEVOKSBbICAxNjguNTY5ODQ5XSByMTI6IGZmZmY4MmQwODA0ODhmMjAgICByMTM6IDAwMDAwMDI3
MjE2ZGFkMDUgICByMTQ6IDAwMDAwMDI3MjE2N2JlZjYKKFhFTikgWyAgMTY4LjYzMTg3OV0gcjE1
OiAwMDAwMDAwMDAwMDAwMDA4ICAgY3IwOiAwMDAwMDAwMDgwMDUwMDNiICAgY3I0OiAwMDAwMDAw
MDAwMzUyNmUwCihYRU4pIFsgIDE2OC42OTM3NDNdIGNyMzogMDAwMDAwMDBhNWE5ZDAwMCAgIGNy
MjogMDAwMDAwMDAwMDAwMDA0OAooWEVOKSBbICAxNjguNzU0ODY4XSBmc2I6IDAwMDAwMDAwMDAw
MDAwMDAgICBnc2I6IDAwMDAwMDAwMDAwMDAwMDAgICBnc3M6IDAwMDAwMDAwMDAwMDAwMDAKKFhF
TikgWyAgMTY4LjgxNjMwNF0gZHM6IDAwMDAgICBlczogMDAwMCAgIGZzOiAwMDAwICAgZ3M6IDAw
MDAgICBzczogMDAwMCAgIGNzOiBlMDA4CihYRU4pIFsgIDE2OC44NzczOTBdIFhlbiBjb2RlIGFy
b3VuZCA8ZmZmZjgyZDA4MDI0NjdkYz4gKHNldF90aW1lcisweDM5LzB4MWY3KToKKFhFTikgWyAg
MTY4LjkzODExN10gIDQ4IDhkIDQ3IDI4IDQ4IDg5IDQ1IGMwIDw2Nj4gNDQgOGIgNjcgMjggNDUg
MGYgYjcgZTQgNDEgODEgZmMgZmYgZmYgMDAgMDAKKFhFTikgWyAgMTY5LjAxNTUyNV0gWGVuIHN0
YWNrIHRyYWNlIGZyb20gcnNwPWZmZmY4NDYyZWZjZTdkYTA6CihYRU4pIFsgIDE2OS4wNzU1Nzld
ICAgIDAwMDAwMDAwMDAwMDAwNDggMDAwMDAwMDAwMDAwMDI4NiBmZmZmODM4MmNkNjUwZjA4IDAw
MDAwMDAwMDAwMDAwNGYKKFhFTikgWyAgMTY5LjEzOTIwNV0gICAgZmZmZjgyZDA4MDQ4OGYyMCAw
MDAwMDAyNzIxNmRhZDA1IDAwMDAwMDI3MjE2N2JlZjYgMDAwMDAwMDAwMDAwMDAwOAooWEVOKSBb
ICAxNjkuMjAyNjYwXSAgICBmZmZmODQ2MmVmY2U3ZTAwIGZmZmY4MmQwODAyMmMxZjQgMDAwMDAw
MDAwMDAwMDA0ZiBmZmZmODM4MmNkNjUwZTcwCihYRU4pIFsgIDE2OS4yNjU5MjhdICAgIGZmZmY4
NDYyZWZjZTdlMjAgZmZmZjgyZDA4MDI0MWRmZSAwMDAwMDAyNzIxNjdiZWY2IGZmZmY4MzgyY2Q2
NTBmMDgKKFhFTikgWyAgMTY5LjMyOTAyMl0gICAgZmZmZjg0NjJlZmNlN2VhMCBmZmZmODJkMDgw
MmVkYTUyIGZmZmY4NDYyMDAwMDAwZmYgMDAwMDAwMjA4MDJhZTZhNQooWEVOKSBbICAxNjkuMzky
MDE1XSAgICBmZmZmODQ2MmVmY2U3ZTYwIGZmZmY4MmQwODAyYWU3ZDEgZmZmZjgyZDA4MDVjMDIw
MCAwMDAwMDAwMDAwMDAwMDAwCihYRU4pIFsgIDE2OS40NTUxMTldICAgIDAwMDAwMDAwMDAwMDAw
MDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAyNzgwIDAwMDAwMDAwMDAwMDI3ODAKKFhF
TikgWyAgMTY5LjUxODIzOF0gICAgZmZmZjgyZDA4MDViZGE4MCAwMDAwMDAwMDAwMDAwMDRmIGZm
ZmY4MmQwODA1YjcyNzAgMDAwMDAwMDAwMDAwMDA0ZgooWEVOKSBbICAxNjkuNTgxNDc3XSAgICBm
ZmZmODQ2MmVmY2U3ZWYwIGZmZmY4MmQwODAyNzkzOWUgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDA0
ZjAwMDAwMGM4CihYRU4pIFsgIDE2OS42NDQ1MDFdICAgIGZmZmY4MzgyY2Q2NGEwMDAgZmZmZjgz
ODJjZDY0YTAwMCBmZmZmODM4MmNkNTBhYjMwIDAwMDAwMDAwMDAwMDAwNGYKKFhFTikgWyAgMTY5
LjcwNzM2NV0gICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIGZmZmY4NDYyZWZj
ZTdlYzAgMDAwMDAwMDAwMDAwMDAwMAooWEVOKSBbICAxNjkuNzcwMDM2XSAgICAwMDAwMDAwMDAw
MDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAw
CihYRU4pIFsgIDE2OS44MzI1MTldICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAw
MCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgWyAgMTY5Ljg5NDgxM10g
ICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAw
MDAwMDAwMDAwMDAwMAooWEVOKSBbICAxNjkuOTU2OTE2XSAgICAwMDAwMDAwMDAwMDAwMDAwIDAw
MDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwCihYRU4pIFsg
IDE3MC4wMTg4MzFdICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgWyAgMTcwLjA4MDU3NF0gICAgMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAw
MDAwMAooWEVOKSBbICAxNzAuMTQyMTI0XSAgICAwMDAwZTAxMDAwMDAwMDRmIGZmZmY4MzgyY2Q2
NGEwMDAgMDAwMDAwYjI0ZDA4ZTAwMCAwMDAwMDAwMDAwMzUyNmUwCihYRU4pIFsgIDE3MC4yMDM1
MDhdICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDYwMTAwMDAwMDAw
IDAwMDAwMDAwMDAwMDAwMDAKKFhFTikgWyAgMTcwLjI2NDY5OF0gWGVuIGNhbGwgdHJhY2U6CihY
RU4pIFsgIDE3MC4zMjEzNTZdICAgIFs8ZmZmZjgyZDA4MDI0NjdkYz5dIHNldF90aW1lcisweDM5
LzB4MWY3CihYRU4pIFsgIDE3MC4zNzgxNTRdICAgIFs8ZmZmZjgyZDA4MDIyYzFmND5dIHNjaGVk
X2NyZWRpdC5jI2NzY2hlZF90aWNrX3Jlc3VtZSsweDU0LzB4NTkKKFhFTikgWyAgMTcwLjQzNTA0
OV0gICAgWzxmZmZmODJkMDgwMjQxZGZlPl0gc2NoZWRfdGlja19yZXN1bWUrMHg2Ny8weDg2CihY
RU4pIFsgIDE3MC40OTEzODNdICAgIFs8ZmZmZjgyZDA4MDJlZGE1Mj5dIG13YWl0LWlkbGUuYyNt
d2FpdF9pZGxlKzB4MzJiLzB4MzU3CihYRU4pIFsgIDE3MC41NDc1NzldICAgIFs8ZmZmZjgyZDA4
MDI3OTM5ZT5dIGRvbWFpbi5jI2lkbGVfbG9vcCsweGE2LzB4YzIKKFhFTikgWyAgMTcwLjYwMzMw
MV0KKFhFTikgWyAgMTcwLjY1NzUwOV0gUnVubmluZyBzdHViIHJlY292ZXJ5IHNlbGZ0ZXN0cy4u
LgooWEVOKSBbICAxNzAuNzAxNzg5XSBQYWdldGFibGUgd2FsayBmcm9tIDAwMDAwMDAwMDAwMDAw
NDg6CihYRU4pIFsgIDE3MC43NTU2MDNdIHRyYXBzLmM6MTU2NDogR1BGICgwMDAwKTogZmZmZjgy
ZDBiZmZmZjA0MSBbZmZmZjgyZDBiZmZmZjA0MV0gLT4gZmZmZjgyZDA4MDM4OTNmMgooWEVOKSBb
ICAxNzAuODAwMzY3XSAgTDRbMHgwMDBdID0gMDAwMDAwODJjZmI5YzA2MyBmZmZmZmZmZmZmZmZm
ZmZmCihYRU4pIFsgIDE3MC44NTQxNTBdIHRyYXBzLmM6NzU5OiBUcmFwIDEyOiBmZmZmODJkMGJm
ZmZmMDQwIFtmZmZmODJkMGJmZmZmMDQwXSAtPiBmZmZmODJkMDgwMzg5M2YyCihYRU4pIFsgIDE3
MC45MDA0OTNdICBMM1sweDAwMF0gPSAwMDAwMDA4MmNmYjliMDYzIGZmZmZmZmZmZmZmZmZmZmYK
KFhFTikgWyAgMTcwLjk1NDA2MF0gdHJhcHMuYzoxMDk4OiBUcmFwIDM6IGZmZmY4MmQwYmZmZmYw
NDEgW2ZmZmY4MmQwYmZmZmYwNDFdIC0+IGZmZmY4MmQwODAzODkzZjIKKFhFTikgWyAgMTcwLjk5
ODYzMV0gIEwyWzB4MDAwXSA9IDAwMDAwMDgyY2ZiOWEwNjMgZmZmZmZmZmZmZmZmZmZmZgooWEVO
KSBbICAxNzEuMDU4MTQwXSAgTDFbMHgwMDBdID0gMDAwMDAwMDAwMDAwMDAwMCBmZmZmZmZmZmZm
ZmZmZmZmCihYRU4pIFsgIDE3MS4xMzA3MzddCihYRU4pIFsgIDE3MS4xOTAxOTBdICoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKKFhFTikgWyAgMTcxLjI1NDI0MV0gUGFu
aWMgb24gQ1BVIDc5OgooWEVOKSBbICAxNzEuMzE1MDM0XSBGQVRBTCBQQUdFIEZBVUxUCihYRU4p
IFsgIDE3MS4zNzU3NDRdIFtlcnJvcl9jb2RlPTAwMDBdCihYRU4pIFsgIDE3MS40MzYxMjldIEZh
dWx0aW5nIGxpbmVhciBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDQ4CihYRU4pIFsgIDE3MS40OTkx
OThdICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
