Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE6D75385
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 18:06:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqgBy-0004FL-Bm; Thu, 25 Jul 2019 16:02:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nNzW=VW=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1hqgBw-0004FG-HF
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 16:02:04 +0000
X-Inumbo-ID: 8a77d002-aef5-11e9-a19c-9b678288bcdd
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a77d002-aef5-11e9-a19c-9b678288bcdd;
 Thu, 25 Jul 2019 16:02:03 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7RdrQ/HK05PmAeSWQM/JhZGF+bjy0s/IlkRdXhpOA3kbIKFZ/zScmWVzEki/QZx17T2t22nvKE
 +mN/fBM3xeNT9vuLw2f7fS3cHxiM4lBJUti9IY2uIuHZxw0IndE2TdGje7iV39UYqiGjzqpmpH
 u8TmCrfH3n3EqK2Bhey7Z7ME4f7t6iwkc7/RmnxIRokL9pKM9YutFzIokML1oUmTeo33eEh9AR
 OhV/z1YY6a9HaTb/Cm36z2KGkFxzlkMih+uCWLzJsCxvzhoFMKCUNQR8oBeJRcLNGkdtUXY5Px
 b8k=
X-SBRS: 2.7
X-MesageID: 3469202
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,307,1559534400"; 
   d="scan'208";a="3469202"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20190528103313.1343-1-jgross@suse.com>
 <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <d59b12d2-9846-606a-baa5-c068dbe7f560@citrix.com>
Date: Thu, 25 Jul 2019 17:01:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
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
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Robert
 VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCkkndmUgZm91bmQgYW5vdGhlciByZWdyZXNzaW9uIHRoYXQgaGFwcGVucyBv
bmx5IHdpdGggc2NoZWQtZ3Jhbj1jb3JlLgpDZW50T1MgNS4xMSAoUFYsIENQVXM6IDMyOyBSQU06
IDZHQikga2VybmVsIGhhbmdzIGR1cmluZyBzdXNwZW5kIGF0dGVtcHQuClRoZSBsYXN0IGtlcm5l
bCBtZXNzYWdlcyBhcmU6CgogICAgQ1BVIDEgb2ZmbGluZTogUmVtb3ZlIFJ4IHRocmVhZAogICAg
Q1BVIDIgb2ZmbGluZTogUmVtb3ZlIFJ4IHRocmVhZAoKS2VybmVsOiBMaW51eCBsb2NhbGhvc3Qg
Mi42LjE4LTM5OC5lbDV4ZW4gIzEgU01QIFR1ZSBTZXAgMTYgMjE6MzE6NTAgRURUIDIwMTQgeDg2
XzY0IHg4Nl82NCB4ODZfNjQgR05VL0xpbnV4Cgp4bCB0b3Agc2hvd3MgMTAwJSBDUFUgdXRpbGl6
YXRpb24gZm9yIHRoZSBoYW5nZWQgVk0uIEFuZCBoZXJlJ3MgaXRzIHN0YXRlOgoKKFhFTikgWyAx
OTA3Ljk3NjM1Nl0gKioqIER1bXBpbmcgQ1BVMTQgZ3Vlc3Qgc3RhdGUgKGQxdjApOiAqKioKCihY
RU4pIFsgMTkwNy45ODI1NThdIC0tLS1bIFhlbi00LjEzLjAtOC4wLjYtZCAgeDg2XzY0ICBkZWJ1
Zz15ICAgTm90IHRhaW50ZWQgXS0tLS0KCihYRU4pIFsgMTkwNy45OTA3MDRdIENQVTogICAgMTQK
CihYRU4pIFsgMTkwNy45OTM5MDFdIFJJUDogICAgZTAzMzpbPGZmZmZmZmZmODAyNjRhN2I+XQoK
KFhFTikgWyAxOTA3Ljk5OTMzM10gUkZMQUdTOiAwMDAwMDAwMDAwMDAwMjg2ICAgRU06IDEgICBD
T05URVhUOiBwdiBndWVzdCAoZDF2MCkKCihYRU4pIFsgMTkwOC4wMDcyODJdIHJheDogMDAwMDAw
MDAwMDAwMDAwMSAgIHJieDogZmZmZmZmZmY4MDUyMmI4MCAgIHJjeDogMDAwMDAwMDAwMDAwMDAw
MAoKKFhFTikgWyAxOTA4LjAxNjIwM10gcmR4OiBmZmZmZmZmZjgwNTIyYjkwICAgcnNpOiAwMDAw
MDAwMDAwMDAwMDc5ICAgcmRpOiBmZmZmZmZmZjgwNTJhOTgwCgooWEVOKSBbIDE5MDguMDI1MTIx
XSByYnA6IGZmZmZmZmZmODA1MjI5ODAgICByc3A6IGZmZmY4ODAxNzEwNmRjZjggICByODogIGZm
ZmY4ODAxNzEwNmMwMDAKCihYRU4pIFsgMTkwOC4wMzQwNDBdIHI5OiAgMDAwMDAwMDAwMDAwMDAw
MCAgIHIxMDogMDAwMDAwMDAwMDAwMDAwMCAgIHIxMTogZmZmZjg4MDE3NmZhZDhjMAoKKFhFTikg
WyAxOTA4LjA0Mjk2Ml0gcjEyOiAwMDAwMDAwMDAwMDAwMDAxICAgcjEzOiAwMDAwMDAwMDAwMDAw
MDAwICAgcjE0OiBmZmZmZmZmZjgwNTIyOTgwCgooWEVOKSBbIDE5MDguMDUxODgxXSByMTU6IDAw
MDAwMDAwMDAwMDAwMDMgICBjcjA6IDAwMDAwMDAwODAwNTAwM2IgICBjcjQ6IDAwMDAwMDAwMDAx
NDI2NjAKCihYRU4pIFsgMTkwOC4wNjA4MDBdIGNyMzogMDAwMDAwODAxZDhjMDAwMCAgIGNyMjog
MDAwMDJiNTQwMDk3MDAwMAoKKFhFTikgWyAxOTA4LjA2NzM5M10gZnNiOiAwMDAwMDAwMDAwMDAw
MDAwICAgZ3NiOiBmZmZmZmZmZjgwNjM5MDAwICAgZ3NzOiAwMDAwMDAwMDAwMDAwMDAwCgooWEVO
KSBbIDE5MDguMDc2MzExXSBkczogMDAwMCAgIGVzOiAwMDAwICAgZnM6IDAwMDAgICBnczogMDAw
MCAgIHNzOiBlMDJiICAgY3M6IGUwMzMKCihYRU4pIFsgMTkwOC4wODQ2NTBdIEd1ZXN0IHN0YWNr
IHRyYWNlIGZyb20gcnNwPWZmZmY4ODAxNzEwNmRjZjg6CgooWEVOKSBbIDE5MDguMDkxMTQ3XSAg
ICBmZmZmZmZmZjgwMmMzZGQ0IDAwMDAwMDAwMDExNjg0NjAgZmZmZmZmZmY4MDUyMmI5MCAwMDAw
MDAwMDAwMDAwMDc5CgooWEVOKSBbIDE5MDguMTAwMTY0XSAgICBmZmZmZmZmZjgwNTIyYjgwIGZm
ZmZmZmZmODA1MjI5ODAgMDAwMDAwMDAwMDAwMDAwMSAwMDAwMDAwMDAwMDAwMDAwCgooWEVOKSBb
IDE5MDguMTA5MTc5XSAgICAwMDAwMDAwMDAwMDAwMDAzIDAwMDAwMDAwMDAwMDAwMDMgZmZmZmZm
ZmY4MDJjNDA0MSBmZmZmODgwMTdkNjhiMDQwCgooWEVOKSBbIDE5MDguMTE4MTk3XSAgICAwMDAw
MDAwMDAwMDAwMDAzIDAwMDAwMDAwMDAwMDAwMDMgMDAwMDAwMDAwMDAwMDAwNyAwMDAwMDAwMDAw
MDAwMDAzCgooWEVOKSBbIDE5MDguMTI3MjEzXSAgICAwMDAwMDAwMGZmZmZmZmVhIGZmZmZmZmZm
ODAyOWYwYWQgZmZmZmZmZmY4MDJjNDA5MiBmZmZmZmZmZjgwNTBmZjkwCgooWEVOKSBbIDE5MDgu
MTM2MjI5XSAgICBmZmZmZmZmZjgwMjY4MTExIDAwMDAwMDAwMDAwMDAwMDMgMDAwMDAwMDAwMDAw
MDAwMCBmZmZmODgwMTdkNjhiMDQwCgooWEVOKSBbIDE5MDguMTQ1MjQ1XSAgICBmZmZmZmZmZjgw
MmE0MDhiIDAwMDAwMDAwMDAwMDAwMDAgZmZmZjg4MDAwMTFkMzg2MCBmZmZmZmZmZmZmZmZmZmY3
CgooWEVOKSBbIDE5MDguMTU0MjYzXSAgICBmZmZmZmZmZmZmZmZmZmZmIGZmZmZmZmZmZmZmZmZm
ZmYgN2ZmZmZmZmZmZmZmZmZmZiAwMDAwMDAwMDAwMDAwMDAxCgooWEVOKSBbIDE5MDguMTYzMjc4
XSAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAw
MDAwMDAwMDAwMDAwMDAwCgooWEVOKSBbIDE5MDguMTcyMjk2XSAgICAwMDAwMDAwMDAwMDAwMDAz
IDAwMDAwMDAwMDAwMDAwMDMgMDAwMDAwMDAwMDAwMDAwMCBmZmZmODgwMTdmNWViY2UwCgooWEVO
KSBbIDE5MDguMTgxMzEyXSAgICAwMDAwMDAwMDAwMDAwMDAwIGZmZmY4ODAxN2Y1ZWJjZDAgZmZm
ZmZmZmY4MDNiZTFhNiAwMDAwMDAwMDAwMDAwMDAxCgooWEVOKSBbIDE5MDguMTkwMzI4XSAgICAw
MDAwMDAwMDAwMDAwMDAwIGZmZmZmZmZmODAzYmU5ZGQgZmZmZmZmZmY4MDNiZWE0MyBmZmZmODgw
MTcxMDZkZWIwCgooWEVOKSBbIDE5MDguMTk5MzQ1XSAgICBmZmZmZmZmZjgwMjg5NDk1IDAwMDAw
MDAzMDAwMDAwMDAgZmZmZjg4MDE3ZjVlYmNlMCBmZmZmODgwMTdmNWViY2U4CgooWEVOKSBbIDE5
MDguMjA4MzYyXSAgICAwMDAwMDAwMDAwMDAwMDAwIGZmZmY4ODAxN2Y1ZWJjZDAgZmZmZmZmZmY4
MDI5ZjBhZCBmZmZmODgwMTcxMDZkZWUwCgooWEVOKSBbIDE5MDguMjE3Mzc5XSAgICAwMDAwMDAw
MDAwMDAwMDAwIGZmZmY4ODAxN2Y1ZWJjZTAgMDAwMDAwMDAwMDAwMDAwMCBmZmZmODgwMTdmNWVi
Y2QwCgooWEVOKSBbIDE5MDguMjI2Mzk2XSAgICBmZmZmZmZmZjgwMjlmMGFkIDAwMDAwMDAwMDAw
MDAwMDAgZmZmZmZmZmY4MDIzM2VlNCAwMDAwMDAwMDAwMDAwMDAwCgooWEVOKSBbIDE5MDguMjM1
NDEzXSAgICBmZmZmODgwMTdkODY4N2YwIGZmZmZmZmZmZmZmZmZmZmYgZmZmZmZmZmZmZmZmZmZm
ZiBmZmZmZmZmZmZmZmZmZmZmCgooWEVOKSBbIDE5MDguMjQ0NDI3XSAgICA3ZmZmZmZmZmZmZmZm
ZmZmIGZmZmZmZmZmZmZmZmZmZmYgZmZmZjg4MDAwMTFkMzg2MCBmZmZmODgwMTdmNWViY2QwCgoo
WEVOKSBbIDE5MDguMjUzNDQ0XSAgICBmZmZmODgwMTdmNWViYzc4IGZmZmY4ODAxN2Y1Y2U2YzAg
ZmZmZmZmZmY4MDI2MGIyYyAwMDAwMDAwMDAwMDAwMDAwCgooWEVOKSBbIDE5MDguMjYyNDYxXSAg
ICBmZmZmZmZmZjgwMjlmMGFkIGZmZmY4ODAxN2Y1ZWJjZDAgMDAwMDAwMDAwMDAwMDAwMCBmZmZm
ODgwMTdmNWNlNmMwCgoKClRoYW5rcywKU2VyZ2V5CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
