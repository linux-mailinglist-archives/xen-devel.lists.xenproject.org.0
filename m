Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E992A0841
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 15:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15925.39167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYVgd-0002jx-Hu; Fri, 30 Oct 2020 14:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15925.39167; Fri, 30 Oct 2020 14:47:27 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYVgd-0002jY-Er; Fri, 30 Oct 2020 14:47:27 +0000
Received: by outflank-mailman (input) for mailman id 15925;
 Fri, 30 Oct 2020 14:47:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q/70=EF=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kYVgb-0002jS-Lm
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:47:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddd8f756-6e23-43a8-b918-45850768653f;
 Fri, 30 Oct 2020 14:47:24 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=q/70=EF=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kYVgb-0002jS-Lm
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 14:47:25 +0000
X-Inumbo-ID: ddd8f756-6e23-43a8-b918-45850768653f
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ddd8f756-6e23-43a8-b918-45850768653f;
	Fri, 30 Oct 2020 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604069244;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=LRMNgs/eXbppdKHgQhDOZFDGxQUAb7X6YI6ArOMqyuo=;
  b=RSrHLWSSVe0R4h1BtcSv63++vn4uJBrvMd27mSLXvrtp/NRHZ33gpXEx
   E2zvuVSsd1Gow7+Z/+e8tvxv01RkjA2LNZhPYaAj2bXkGIPCxZZLAkhdm
   Sk+IK5IRHfpoZdRcA1oFgr4tYiZZZWFR6+pva8EnsysOfJByCzfH0rjNg
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MqvrxFv9HQgo/ktAZQGydIerdTH0Scwf/UXHqINhLKSEW3tPl9A5dAiLCWUqMDgkSvfgB8fuGN
 Yo6FTgOXf71IE9P0sinTvzZdppH0U8bHdg3ZkSx6Hq3wMXVmv/laEuByvWyz39OyOjYRNmjyZ9
 FTuBEbIeVflhM/BnSoOfjM2wGdIWdkvAEzyWhTTJZNnxq6qfh47ttoj2BYQFgmt1iY1h0dGOsa
 KUR/KuddjTZ/YGyVauFFqlyVqh4RdbFQMT2FQm2rIwv13sP9ahG1NofCjbX2CFlByrGHIMsaZJ
 5Bo=
X-SBRS: None
X-MesageID: 31256108
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,433,1596513600"; 
   d="scan'208";a="31256108"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRNuzlwrOINxiJ0+HDT18KgnYtKjGM8DAvaFstbE5Dc8VM/l06iveBBL9dmhdOjRXnq5OjOjUxNavf0B6qfsHRZyz7gOFjYs593z1squeL6KK523dgXqf3ImzCdn59uZ+30PxTIRFuzkbKtgwnvlPwAMLm73Lk1YXZhAlT0MIRyyIpFRtpNLqg+AXQA+W6e3LLOOOsGMsAj6gU8dawhKM/3UsmsXQWJzgsWLA78+WSwjYth/B3waodHyXZlmJWrfre6gLu+FtLgmFLc4z2UFSAei7/WMpedTsg9/ifsv3BlU+24HRSJdTUgdMHSp2zRF7OOsz269u+snADTLBmmTiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRMNgs/eXbppdKHgQhDOZFDGxQUAb7X6YI6ArOMqyuo=;
 b=BzxKGZzQ002bQqCEvrF1ojaSN1YDhH9uY9i/5UBb5BXavi0cjSq/ujDmaJC+uFBb7AqiulRhfF0PL5IV47Ahl3qx8qOywiZ22P5A9RNVXqgdal3IA0tskfdSsoujb2MsgQM7Q1JbQCDvwVut58wW27D77gegJNFz5Csera294UqxvSKTuuY2rRV+RSc3i5mHovG1EoAy4gMOMf2AClpz0E9ZzF4OEXI1JYCxN7sQxK+InB09foqAufW+JdEMjqi5DKtjPs1NqUZwT4rKc3lkvX3+oZwNCZHQm4aZjAuhLQmUlCMYlX8YUQOPSb4we8TGRC2tSUq8uNdxfRTVpiWn3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRMNgs/eXbppdKHgQhDOZFDGxQUAb7X6YI6ArOMqyuo=;
 b=cwyvX0PhtBzWC8JOQ0+MekpW/x2vdx5lXdzQGNbha/TzwSz39K/TdMXlDaJvItrvP0Ds382CKCQPLKqbK3nBmNhmfRShTVuFRjd5RVcOgQ1+H5eOwX7mblNRBCLu24OOxLMXJYE9foFx8HzAWdjpR+KEuoXMabvL8OSvOCF3shQ=
From: George Dunlap <George.Dunlap@citrix.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com"
	<intel-xen@intel.com>, "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Sergey Dyasli
	<sergey.dyasli@citrix.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, "Kevin
 Pearson" <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, "Matt
 Spencer" <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com"
	<mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>,
	Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Ian Jackson
	<Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [ANNOUNCE] Call for agenda items for 5 November 2020 Community Call @
 16:00 UTC 
Thread-Topic: [ANNOUNCE] Call for agenda items for 5 November 2020 Community
 Call @ 16:00 UTC 
Thread-Index: AQHWrsuQhaTNtF6CbkCG4+SMRWU1EQ==
Date: Fri, 30 Oct 2020 14:47:17 +0000
Message-ID: <948CC2D7-B53D-48CD-879B-6C0DDE0B1EE2@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8604ef73-571d-4ed6-e389-08d87ce2b2d1
x-ms-traffictypediagnostic: BY5PR03MB5187:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR03MB51878C436EA19F7627B316DD99150@BY5PR03MB5187.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bkldxx+QYEdJcmc+OeuIFhhOp0PfCjInG09KI8zdxv1TbMRkbfUGSe4s8gpBxuasJTnQ+fZayKqk7fRHCili7hRSsm6bPxKPYnyMiIQfVDfX/K4y/rXbZ9BUe6/sh1YeYfRmFr0E7nvk4Q7xLyyL+4KIduMfTOH2tA7HHcNZ/fPnnvTv09YtbsgMEC7DPdOzglRLQ71Z5BDedzf9kb6muutLF+kwHmF6DUJLtxHGMtt8tU3/iQDthtJgF04dWuKYJjCVuFK7h8w6BFsB0cWiq87LwrUCst4ec2EujjNhVlH2TLmF3l3yPLjNpLbM4Xjfn0fUpnahn0VhRCrk15PwRWfK/Vt3ubnKWDmvLz0qQ2iqvU/uW2DaSg3/u62EFtg6iapWAWrWO1IR8mrQJ3a8WQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(5660300002)(26005)(7416002)(86362001)(54906003)(36756003)(7406005)(83380400001)(316002)(66476007)(66556008)(64756008)(66446008)(76116006)(91956017)(71200400001)(66946007)(33656002)(6486002)(4743002)(8676002)(2616005)(55236004)(966005)(186003)(6916009)(6512007)(4326008)(478600001)(6506007)(2906002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: DCn116mn4ZHc6sWwPv30ed5UVcEH+BJeajaxxf59p1gTXZVI5dU6MqlKdx/UQejpfGOvwaY+bXPwOPg6wuCQJ0JD+kN46g57tXAjWqw9rzP+0k9LYVW3QhcI90EFPmd+KCbimn/wxvE7SA8QdVfW3QEAC0MOsgJk1teSPk1EURne0+MvDw8zRpqdzOGdPkdRn5a67ATKjym59hWHavKXZyXXa3ob8BoXwzTVWCxR8oymEChzDAmyyFz6cNt9n1V+X7zEII+IMFpe0EAs3XTZVcyRkuHZ7sx25+bGiPv7GUvEfyciqgJMXuGA3GlfGam3nkpLx0On52SesDlvo8Esg8cJ+SzR5TX6J1TohOPnB6sM+mRr9XpSBL2o90wLYFJlLVCoN9zIHL11ptgkcw0FHU8IPBaB8yuXUGxbgVdqMs2gsX9Iior2mWPerP4zSNVVDhcmgDVrDPXP4o8KqqniK3AsVGYP2DIavXmQcMG/wkV5QctuTBkQtrOWTaPoS1twrLwcOqdZ01RofHO0n8Ts2lsfzBibn0K0oUngBNu8kLNQ4ShhOAcwPHlp+HV771G3ugN8hXdqSf3csJnEFswOgqlmCTbjKqniXq5cB0C/1CiNnQRDRcuEmEDmY6Q99sUztUBCVB+et/C5NBqE0EpVvg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <804A991DAC219848AFDD510AD6646DF7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8604ef73-571d-4ed6-e389-08d87ce2b2d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 14:47:17.6158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2yHHHfUEvJT5wPig/j9Ho+iFrf0FSvdUUW2oNDjEgsOmhmMWDXbId2GW2PPz2Ou6G2rr/t35KdRsoBlZAF/2ka2C/IexvxqvxNshWbSNAvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5187
X-OriginatorOrg: citrix.com

SGkgYWxsLA0KDQpUaGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluIGh0dHBzOi8vY3J5cHRwYWQuZnIv
cGFkLyMvMi9wYWQvZWRpdC9rLTBBaitTeGI1U2xpTFdyRlJCd3g0OVYvIGFuZCB5b3UgY2FuIGVk
aXQgdG8gYWRkIGl0ZW1zLiAgQWx0ZXJuYXRpdmVseSwgeW91IGNhbiByZXBseSB0byB0aGlzIG1h
aWwgZGlyZWN0bHkuDQoNCkFnZW5kYSBpdGVtcyBhcHByZWNpYXRlZCBhIGZldyBkYXlzIGJlZm9y
ZSB0aGUgY2FsbDogcGxlYXNlIHB1dCB5b3VyIG5hbWUgYmVzaWRlcyBpdGVtcyBpZiB5b3UgZWRp
dCB0aGUgZG9jdW1lbnQuDQoNCk5vdGUgdGhlIGZvbGxvd2luZyBhZG1pbmlzdHJhdGl2ZSBjb252
ZW50aW9ucyBmb3IgdGhlIGNhbGw6DQoqIFVubGVzcywgYWdyZWVkIGluIHRoZSBwZXJ2aW91cyBt
ZWV0aW5nIG90aGVyd2lzZSwgdGhlIGNhbGwgaXMgb24gdGhlIDFzdCBUaHVyc2RheSBvZiBlYWNo
IG1vbnRoIGF0IDE2MDAgQnJpdGlzaCBUaW1lIChlaXRoZXIgR01UIG9yIEJTVCkNCiogSSB1c3Vh
bGx5IHNlbmQgb3V0IGEgbWVldGluZyByZW1pbmRlciBhIGZldyBkYXlzIGJlZm9yZSB3aXRoIGEg
cHJvdmlzaW9uYWwgYWdlbmRhDQoNCiogVG8gYWxsb3cgdGltZSB0byBzd2l0Y2ggYmV0d2VlbiBt
ZWV0aW5ncywgd2UnbGwgcGxhbiBvbiBzdGFydGluZyB0aGUgYWdlbmRhIGF0IDE2OjA1IHNoYXJw
LiAgQWltIHRvIGpvaW4gYnkgMTY6MDMgaWYgcG9zc2libGUgdG8gYWxsb2NhdGUgdGltZSB0byBz
b3J0IG91dCB0ZWNobmljYWwgZGlmZmljdWx0aWVzICZjDQoNCiogSWYgeW91IHdhbnQgdG8gYmUg
Q0MnZWQgcGxlYXNlIGFkZCBvciByZW1vdmUgeW91cnNlbGYgZnJvbSB0aGUgc2lnbi11cC1zaGVl
dCBhdCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQvRDl2R3ppaFB4eEFPZTZS
RlB6MHNSQ2YrLw0KDQpCZXN0IFJlZ2FyZHMNCkdlb3JnZQ0KDQoNCg0KPT0gRGlhbC1pbiBJbmZv
cm1hdGlvbiA9PQ0KIyMgTWVldGluZyB0aW1lDQoxNjowMCAtIDE3OjAwIFVUQw0KRnVydGhlciBJ
bnRlcm5hdGlvbmFsIG1lZXRpbmcgdGltZXM6IGh0dHBzOi8vd3d3LnRpbWVhbmRkYXRlLmNvbS93
b3JsZGNsb2NrL21lZXRpbmdkZXRhaWxzLmh0bWw/eWVhcj0yMDIwJm1vbnRoPTExJmRheT01Jmhv
dXI9MTYmbWluPTAmc2VjPTAmcDE9MTIzNCZwMj0zNyZwMz0yMjQmcDQ9MTc5DQoNCg0KIyMgRGlh
bCBpbiBkZXRhaWxzDQpXZWI6IGh0dHBzOi8vd3d3LmdvdG9tZWV0Lm1lL0dlb3JnZUR1bmxhcA0K
DQpZb3UgY2FuIGFsc28gZGlhbCBpbiB1c2luZyB5b3VyIHBob25lLg0KQWNjZXNzIENvZGU6IDE2
OC02ODItMTA5DQoNCkNoaW5hIChUb2xsIEZyZWUpOiA0MDA4IDgxMTA4NA0KR2VybWFueTogKzQ5
IDY5MiA1NzM2IDczMTcNClBvbGFuZCAoVG9sbCBGcmVlKTogMDAgODAwIDExMjQ3NTkNClVrcmFp
bmUgKFRvbGwgRnJlZSk6IDAgODAwIDUwIDE3MzMNClVuaXRlZCBLaW5nZG9tOiArNDQgMzMwIDIy
MSAwMDg4DQpVbml0ZWQgU3RhdGVzOiArMSAoNTcxKSAzMTctMzEyOQ0KU3BhaW46ICszNCA5MzIg
NzUgMjAwNA0KDQoNCk1vcmUgcGhvbmUgbnVtYmVycw0KQXVzdHJhbGlhOiArNjEgMiA5MDg3IDM2
MDQNCkF1c3RyaWE6ICs0MyA3IDIwODEgNTQyNw0KQXJnZW50aW5hIChUb2xsIEZyZWUpOiAwIDgw
MCA0NDQgMzM3NQ0KQmFocmFpbiAoVG9sbCBGcmVlKTogODAwIDgxIDExMQ0KQmVsYXJ1cyAoVG9s
bCBGcmVlKTogOCA4MjAgMDAxMSAwNDAwDQpCZWxnaXVtOiArMzIgMjggOTMgNzAxOA0KQnJhemls
IChUb2xsIEZyZWUpOiAwIDgwMCAwNDcgNDkwNg0KQnVsZ2FyaWEgKFRvbGwgRnJlZSk6IDAwODAw
IDEyMCA0NDE3DQpDYW5hZGE6ICsxICg2NDcpIDQ5Ny05MzkxDQpDaGlsZSAoVG9sbCBGcmVlKTog
ODAwIDM5NSAxNTANCkNvbG9tYmlhIChUb2xsIEZyZWUpOiAwMSA4MDAgNTE4IDQ0ODMNCkN6ZWNo
IFJlcHVibGljIChUb2xsIEZyZWUpOiA4MDAgNTAwNDQ4DQpEZW5tYXJrOiArNDUgMzIgNzIgMDMg
ODINCkZpbmxhbmQ6ICszNTggOTIzIDE3IDA1NjgNCkZyYW5jZTogKzMzIDE3MCA5NTAgNTk0DQpH
cmVlY2UgKFRvbGwgRnJlZSk6IDAwIDgwMCA0NDE0IDM4MzgNCkhvbmcgS29uZyAoVG9sbCBGcmVl
KTogMzA3MTMxNjk5MDYtODg2LTk2NQ0KSHVuZ2FyeSAoVG9sbCBGcmVlKTogKDA2KSA4MCA5ODYg
MjU1DQpJY2VsYW5kIChUb2xsIEZyZWUpOiA4MDAgNzIwNA0KSW5kaWEgKFRvbGwgRnJlZSk6IDE4
MDAyNjY5MjcyDQpJbmRvbmVzaWEgKFRvbGwgRnJlZSk6IDAwNyA4MDMgMDIwIDUzNzUNCklyZWxh
bmQ6ICszNTMgMTUgMzYwIDcyOA0KSXNyYWVsIChUb2xsIEZyZWUpOiAxIDgwOSA0NTQgODMwDQpJ
dGFseTogKzM5IDAgMjQ3IDkyIDEzIDAxDQpKYXBhbiAoVG9sbCBGcmVlKTogMCAxMjAgNjYzIDgw
MA0KS29yZWEsIFJlcHVibGljIG9mIChUb2xsIEZyZWUpOiAwMDc5OCAxNCAyMDcgNDkxNA0KTHV4
ZW1ib3VyZyAoVG9sbCBGcmVlKTogODAwIDg1MTU4DQpNYWxheXNpYSAoVG9sbCBGcmVlKTogMSA4
MDAgODEgNjg1NA0KTWV4aWNvIChUb2xsIEZyZWUpOiAwMSA4MDAgNTIyIDExMzMNCk5ldGhlcmxh
bmRzOiArMzEgMjA3IDk0MSAzNzcNCk5ldyBaZWFsYW5kOiArNjQgOSAyODAgNjMwMg0KTm9yd2F5
OiArNDcgMjEgOTMgMzcgNTENClBhbmFtYSAoVG9sbCBGcmVlKTogMDAgODAwIDIyNiA3OTI4DQpQ
ZXJ1IChUb2xsIEZyZWUpOiAwIDgwMCA3NzAyMw0KUGhpbGlwcGluZXMgKFRvbGwgRnJlZSk6IDEg
ODAwIDExMTAgMTY2MQ0KUG9ydHVnYWwgKFRvbGwgRnJlZSk6IDgwMCA4MTkgNTc1DQpSb21hbmlh
IChUb2xsIEZyZWUpOiAwIDgwMCA0MTAgMDI5DQpSdXNzaWFuIEZlZGVyYXRpb24gKFRvbGwgRnJl
ZSk6IDggODAwIDEwMCA2MjAzDQpTYXVkaSBBcmFiaWEgKFRvbGwgRnJlZSk6IDgwMCA4NDQgMzYz
Mw0KU2luZ2Fwb3JlIChUb2xsIEZyZWUpOiAxODAwNzIzMTMyMw0KU291dGggQWZyaWNhIChUb2xs
IEZyZWUpOiAwIDgwMCA1NTUgNDQ3DQpTd2VkZW46ICs0NiA4NTMgNTI3IDgyNw0KU3dpdHplcmxh
bmQ6ICs0MSAyMjUgNDU5OSA3OA0KVGFpd2FuIChUb2xsIEZyZWUpOiAwIDgwMCA2NjYgODU0DQpU
aGFpbGFuZCAoVG9sbCBGcmVlKTogMDAxIDgwMCAwMTEgMDIzDQpUdXJrZXkgKFRvbGwgRnJlZSk6
IDAwIDgwMCA0NDg4IDIzNjgzDQpVbml0ZWQgQXJhYiBFbWlyYXRlcyAoVG9sbCBGcmVlKTogODAw
IDA0NCA0MDQzOQ0KVXJ1Z3VheSAoVG9sbCBGcmVlKTogMDAwNCAwMTkgMTAxOA0KVmlldCBOYW0g
KFRvbGwgRnJlZSk6IDEyMiA4MCA0ODENCuKAi+KAi+KAi+KAi+KAi+KAi+KAiw0KDQpGaXJzdCBH
b1RvTWVldGluZz8gTGV0J3MgZG8gYSBxdWljayBzeXN0ZW0gY2hlY2s6DQoNCmh0dHBzOi8vbGlu
ay5nb3RvbWVldGluZy5jb20vc3lzdGVtLWNoZWNr

