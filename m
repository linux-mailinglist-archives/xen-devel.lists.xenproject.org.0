Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3872AA815
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 18:15:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5uNe-0004un-Ka; Thu, 05 Sep 2019 16:13:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L9s7=XA=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i5uNc-0004uX-SV
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 16:13:04 +0000
X-Inumbo-ID: 0a0a8c56-cff8-11e9-b76c-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a0a8c56-cff8-11e9-b76c-bc764e2007e4;
 Thu, 05 Sep 2019 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567699984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=azRUgYy0BJ4fWNB2fHydc1AoId0Yrr9+He3uFq5Ie7I=;
 b=IY76afxX4YGCPQ8q1RoPrdk4/+tvr524S8yDZl2FWtgvIQYg1JU9nh3L
 aSOybSb0wwVcXaZJHNTriuTaiHJuGsvbWNEQdTpuxzGLUPhlir9adQhm1
 h8gBafCsWQtyVzhl5EwP1P1YsMt9IaieeF/JYRnFiQyIu3f1r/wdP2wO4 M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8DFVANVAy9qwZ28nKPDtTSsopxJaolemMFu0xOnbpPmEAGjoOLC3Zbw+yU9tUiEQVoZWOexZus
 RfqRZmT6EHwMYHmYU4dLZYBsc9eqY4qztjevV1vLilpx98jUUnK/QCECsIwuEXmtOj9pbDs0eF
 z2/8Wuu4QTtiSTRn4zC9sdKkIGzLHwbL96ipwAe9hM4l+HmECQ4yDIF0qaSWMrzaaqgUPwym0f
 lTquxMJxnfj/HO1XjkvnZW4NbuSn88pNa/wVE85Cfdl+YaNuJBDMTQ9Tyj0391GMHBadvtOTdB
 ttw=
X-SBRS: 2.7
X-MesageID: 5420265
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; d="scan'208,217";a="5420265"
From: Lars Kurth <lars.kurth@citrix.com>
To: Rich Persaud <persaur@gmail.com>
Thread-Topic: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
Thread-Index: AQHVYynAq4l5UVCYY0OMdHHMFzgkkqccPIMAgABQNwCAAAYLAIAAExSA///2PACAAAU8AIAAEaWAgABXD4CAACh0AA==
Date: Thu, 5 Sep 2019 16:12:58 +0000
Message-ID: <0C0A0230-3254-4ADD-9E42-F72D985C2770@citrix.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
 <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
 <FA118783-4079-460A-95F8-B628F3320637@citrix.com>
 <95800deb-8c7f-aaef-8ff2-8a4f87e6b5e6@citrix.com>
 <9ee33b16-9ae7-1f17-1755-c7d03c352a21@suse.com>
 <0E76424D-57EB-4792-BA82-121E69506314@citrix.com>
 <1D4888CA-5C9F-4181-BF86-396CBEF4D548@gmail.com>
In-Reply-To: <1D4888CA-5C9F-4181-BF86-396CBEF4D548@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
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
Cc: Rian Quinn <rianquinn@gmail.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 John Ji <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 BrianWoods <brian.woods@amd.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Tamas
 KLengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 Janakarajan Natarajan <jnataraj@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Roger Pau
 Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============4626820420740588893=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4626820420740588893==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_0C0A023032544ADD9E42F72D985C2770citrixcom_"

--_000_0C0A023032544ADD9E42F72D985C2770citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IFdlIGNhbiBkZWZlciB0aGUgeGVuc3RvcmVsZXNzIG5hbWUgc2VydmljZSB0b3BpYyB0byB0
aGUgT2N0b2JlciBtb250aGx5IGNhbGwuDQo+DQo+IEZvciB0b2RheSdzIGNhbGwsIGNhbiB3ZSBk
aXNjdXNzIHRoZSBwcmV2aW91c2x5IHBvc3RlZCBoaWdoLWxldmVsIGRlc2lnbiBmb3IgdW5pZmlj
YXRpb24gb2YgdGhlIGRvbUIgUkZDIHdpdGggZG9tMGxlc3MsIGFzICJkb21CIG1vZGUiIGZvcg0K
PiBkaXNhZ2dyZWdhdGlvbiBvZiBYZW4ncyBkb20wPw0KPg0KPiAtIGRvbUIgbW9kZSBmb3IgZG9t
MGxlc3MgKEp1bHkgMjAxOSk6ICBodHRwczovL2xpc3RzLmd0Lm5ldC94ZW4vZGV2ZWwvNTU3Nzgy
DQo+IC0gZG9tQiBSRkMgKEp1bmUgMjAxOCk6ICBodHRwczovL2xpc3RzLmd0Lm5ldC94ZW4vZGV2
ZWwvNTE5MzY3DQoNCkkgaGFkIHNlZW4gdGhpcyB0b28gbGF0ZS4gQXBvbG9naWVzDQpMYXJzDQo=

--_000_0C0A023032544ADD9E42F72D985C2770citrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <D044D4B28A6153498541F27BD068B030@citrix.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGNtOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQph
OnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5
Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnAuTXNv
TGlzdFBhcmFncmFwaCwgbGkuTXNvTGlzdFBhcmFncmFwaCwgZGl2Lk1zb0xpc3RQYXJhZ3JhcGgN
Cgl7bXNvLXN0eWxlLXByaW9yaXR5OjM0Ow0KCW1hcmdpbi10b3A6MGNtOw0KCW1hcmdpbi1yaWdo
dDowY207DQoJbWFyZ2luLWJvdHRvbTowY207DQoJbWFyZ2luLWxlZnQ6MzYuMHB0Ow0KCW1hcmdp
bi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxp
YnJpIixzYW5zLXNlcmlmO30NCnAubXNvbm9ybWFsMCwgbGkubXNvbm9ybWFsMCwgZGl2Lm1zb25v
cm1hbDANCgl7bXNvLXN0eWxlLW5hbWU6bXNvbm9ybWFsOw0KCW1zby1tYXJnaW4tdG9wLWFsdDph
dXRvOw0KCW1hcmdpbi1yaWdodDowY207DQoJbXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG87DQoJ
bWFyZ2luLWxlZnQ6MGNtOw0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGli
cmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTgNCgl7bXNvLXN0eWxlLXR5cGU6cGVy
c29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6
d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25s
eTsNCglmb250LXNpemU6MTAuMHB0O30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjYxMi4w
cHQgNzkyLjBwdDsNCgltYXJnaW46NzIuMHB0IDcyLjBwdCA3Mi4wcHQgNzIuMHB0O30NCmRpdi5X
b3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4N
Cjxib2R5IGxhbmc9IkVOLUdCIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIj4NCjxkaXYgY2xh
c3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpw
PjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mZ3Q7IFdlIGNhbiBkZWZlciB0aGUg
eGVuc3RvcmVsZXNzIG5hbWUgc2VydmljZSB0b3BpYyB0byB0aGUgT2N0b2JlciBtb250aGx5IGNh
bGwuPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4m
Z3Q7PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj4mZ3Q7IEZvciB0b2RheSdzIGNhbGwsIGNhbiB3ZSBkaXNjdXNzIHRoZSBwcmV2aW91c2x5
IHBvc3RlZCBoaWdoLWxldmVsIGRlc2lnbiBmb3IgdW5pZmljYXRpb24gb2YgdGhlIGRvbUIgUkZD
IHdpdGggZG9tMGxlc3MsIGFzICZxdW90O2RvbUIgbW9kZSZxdW90OyBmb3INCjxicj4NCiZndDsg
ZGlzYWdncmVnYXRpb24gb2YgWGVuJ3MgZG9tMD88bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDs8bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2
Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgLSBkb21CIG1vZGUgZm9yIGRvbTBs
ZXNzIChKdWx5IDIwMTkpOiAmbmJzcDs8YSBocmVmPSJodHRwczovL2xpc3RzLmd0Lm5ldC94ZW4v
ZGV2ZWwvNTU3NzgyIj5odHRwczovL2xpc3RzLmd0Lm5ldC94ZW4vZGV2ZWwvNTU3NzgyPC9hPjxv
OnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PiZndDsgLSBkb21CIFJGQyAoSnVuZSAyMDE4KTogJm5ic3A7PGEgaHJlZj0iaHR0cHM6Ly9saXN0
cy5ndC5uZXQveGVuL2RldmVsLzUxOTM2NyI+aHR0cHM6Ly9saXN0cy5ndC5uZXQveGVuL2RldmVs
LzUxOTM2NzwvYT48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij5JIGhhZCBzZWVuIHRoaXMgdG9vIGxhdGUuIEFwb2xvZ2llczxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+TGFyczxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwv
Ym9keT4NCjwvaHRtbD4NCg==

--_000_0C0A023032544ADD9E42F72D985C2770citrixcom_--


--===============4626820420740588893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4626820420740588893==--

