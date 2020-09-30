Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A6427E683
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532.1749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZHO-00072Y-VV; Wed, 30 Sep 2020 10:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532.1749; Wed, 30 Sep 2020 10:24:10 +0000
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
	id 1kNZHO-000728-SJ; Wed, 30 Sep 2020 10:24:10 +0000
Received: by outflank-mailman (input) for mailman id 532;
 Wed, 30 Sep 2020 10:24:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKji=DH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kNZHN-000723-5P
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:24:09 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9081b61c-5935-48ae-9257-03be848eb208;
 Wed, 30 Sep 2020 10:24:07 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZKji=DH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kNZHN-000723-5P
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:24:09 +0000
X-Inumbo-ID: 9081b61c-5935-48ae-9257-03be848eb208
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9081b61c-5935-48ae-9257-03be848eb208;
	Wed, 30 Sep 2020 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601461447;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7RvsSyi7CugpAWDdul/RBNpyUr8qYrNbdJatwSLM4hQ=;
  b=hwE0ORirg+sG6pq2Ra2UpiCPhZmllepsbRyutcZe8HY37XlZxYmdAZBF
   5MlvskmX7j7q3eIbjXRVdYY4D58S9GOySOR/pwGOuv4gf5GosajYsxixY
   h0DZq7U9q46BUAZNyFNQWDPO+8/5L1g9XBwRFWVBPug4qP2FSN4vSmGE7
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SO+Hj/gcyShDo9ZmT7HMMAFGbVSH61c+z57vDSQZc0UUlqvQqQaqmYBmmOwBCKdyh5bTijmazW
 dJesaymQzry3sFRVKnXdfMrtQLLCEePAj/kHcQ2APzz18rNwVgtHluTZAXBCOq8y024VSldSDu
 po398JaIW06Q31aqK9ja8zJ9sVke58hkjzhv25H0JoXMBtqMth2hE0n1QYT1nSmiBAwpHHVgG8
 FwG8RHTm4E++T1hafc7Rh9YYFuX2kRTskRs3tCvdp9NYpc4O0NsebgUtVYOjGdUiJZ2XSVkJPh
 FDQ=
X-SBRS: None
X-MesageID: 27926046
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="27926046"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l95s4RclapUq88RElPUj5eoZJDksmzu4grwF8UADGgHtG7aLe9GhUm4WOAavx0f34pJ2AFWkLzOYrRNHlFoEbMj9KB9D7Vt5j4k5zGUcBXsssT6Dgf3mlFVT/3YTwD/Es3IJEGR9QquXutrOVzArsiA6bytRbU/gsgSaNa/jEWSM5+9Is14HV4W4N80gda8G6dC8WGdssrQMZYw64WLdohZrKSgOE92Yitdjcg/lRAMgXDGozYZ6zLBdoiwbXzTqWlawe30YLm/o4HUDQ4EGoVyjuJUUPU46v4qPevFNpLudw1SnEGw2i+T6aijZ1PXk5y3lSkAzFl59GZMeTmAKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RvsSyi7CugpAWDdul/RBNpyUr8qYrNbdJatwSLM4hQ=;
 b=CnbTpHmfP0pQdaRlLnSiqTIMFa4EpxFgE9/pHClfDBhC5ya4y+18qh1gZB7wnkujs92DCIN97Ka2wljWTkE9KRoZqnkkPXtV4h8lM0PIb1TRdC2+Jb46IXsRd99XuBHG9naI26p1ySV62Zs9KrJvlzGPSs1vQTy+1BXZeV2axm9ZL7sZfRIq0gvHMh2aoj9sqzTAMeq5I3VWSOZUDSMSEBtN1I9uV9lEvXilduVpm12+ve6O85dI57ouW527xEAslpB5hb00RkZ05GaZpUP1bLPY+kkM9ycE85tAlfPQ+hsRE+CzqKFH3DkcF4d28Bv6lJ77uqSz1sLjVLwqXRz+YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RvsSyi7CugpAWDdul/RBNpyUr8qYrNbdJatwSLM4hQ=;
 b=pEkIN96uNNtwcgGOMC3/G8JAO6QTH1wBX+6CeGqMLTLHwM9ynv/DOAZ0gNAVvD3HUIFL7N/6PXCsl4qe/Ue7xTVucYaP1XbdTFy/6DK0Gq0shLsHwLHxqo7mPxwcdKXCDqGHEQfE8V7XjvQj/nbcPWt81foDKfFag0eKoqSh40g=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Artem
 Mygaiev" <Artem_Mygaiev@epam.com>, "committers@xenproject.org"
	<committers@xenproject.org>, "julien@xen.org" <julien@xen.org>,
	"vicooodin@gmail.com" <vicooodin@gmail.com>, "viktor.mitin.19@gmail.com"
	<viktor.mitin.19@gmail.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Xen Coding style and clang-format
Thread-Topic: Xen Coding style and clang-format
Thread-Index: AQHWlwq4nKYEhMN38U+xmvwRsutq+amA8joAgAAHUgA=
Date: Wed, 30 Sep 2020 10:24:02 +0000
Message-ID: <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
 <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
In-Reply-To: <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c48b00d-9158-4a0e-8369-08d8652af41d
x-ms-traffictypediagnostic: BYAPR03MB3911:
x-microsoft-antispam-prvs: <BYAPR03MB3911C705E7907AC5EF8155E199330@BYAPR03MB3911.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eomyDZbqILOQnI5qIvXEM3jvwv0nFifQ7DEc+Bk5jA8zGCxuhUhX8CIAJND9B7XwJ69NL04MHhn0Uu7DllKAw+sUrzry+dKMYDW3yBGgu+O3Sz5sFn3daLnIvu2I6ec2Cm2OUF13yk3FPQWu7wg/yPRvmFrTb8Si1on+eVNHh39AnOpUFdR8llLHv6tQxBSh8wDiRN5OR2ifSGB5vKg5igtfPJbfekkM6bBcmXqHRN1chtD4q0/SJOon+kbRW924rkvq0EmOgrXG830AgklWo1QSAyGR/slRRpQIaLLP1KeHaOhNHU4TxhUE76Nwua3m8rKY0ToIt2oP/TrMIgxuHesYw0tMjDhk0ir1ohOu+VPBt4y4tmQbOjBkWfGL0Qyt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(86362001)(54906003)(33656002)(26005)(6486002)(4326008)(6506007)(53546011)(55236004)(8676002)(478600001)(8936002)(2906002)(186003)(6916009)(2616005)(91956017)(5660300002)(66476007)(66446008)(64756008)(66556008)(36756003)(76116006)(66946007)(71200400001)(6512007)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Im+9EO0a3IXkKF2ut/6TNS05wnU+2yU1yjLbc85tv9rcxmcxGu/IwgEPLSHfaozkXVrAwQBXzINVYNoZdtqe7QxjRP4m6dnr9+1VGCz1322O3bHBbKEHLRNIw9gGBx8b7cjEkKG/lBJ6Qc2/A9OwsLgppB/aRg79OyebgTx7RT+EzaJY0GGx2/spf2O+NE5x1iMQV016rRIU79PiTOvUStx5HJleQXiepuw6D8jd0bjlm8rwjOQY7RXjMiPA642sSUKk8vzIe8tsPBP8APpn7KU0o0EYCsjz87MrlaL3xDqfXgoFTVIK9zRiloYd9Bg0eqYki2RTQ8uDEUTtLe5zJlp5vDfXx062eugnbe00AMcRIw3W9JAdi048que/9YU8SG5OWKaKppn5LqAvpSQjzk+QYb+KgLYdzowfmkVd34FHTkobHqCu/YfY5b4N4m1OEWGYnWO0h8jRBtF6kWiLUhiKbIbv/qMV0BAmVjoV/h/oCravuA8eNwo9qq3zy/gSMsZr6Cg6U7CMgB4s727EQf/fVxNqye2cKIyYE38wPdmVNWQViO6A5S4/XxYK3JMYWVPLOMEUArAWf4Gfe6Nx/p9SAuBW3l1Bysxl2XZQCNZdtO16ibaet5BHvf/H7gE0fyJZ/0avonABA+dsVzcbFA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD9CC9BE0C5F854F8DDE5794E25DB513@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c48b00d-9158-4a0e-8369-08d8652af41d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 10:24:03.0352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IFz3U+L2JqzdTs+Wu3sdwFI0rst3x0UtQuPT/wP6kXwrCXmBWoC2Deq+n/FqRmgM9irT1Z/WvFQX95SqpbyrXpnNFDP0cF1muJXI7LF8FgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3911
X-OriginatorOrg: citrix.com

DQoNCj4gT24gU2VwIDMwLCAyMDIwLCBhdCAxMDo1NyBBTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDMwLjA5LjIwMjAgMTE6MTgsIEFuYXN0YXNpaWEg
THVraWFuZW5rbyB3cm90ZToNCj4+IEkgd291bGQgbGlrZSB0byBrbm93IHlvdXIgb3BpbmlvbiBv
biB0aGUgZm9sbG93aW5nIGNvZGluZyBzdHlsZSBjYXNlcy4NCj4+IFdoaWNoIG9wdGlvbiBkbyB5
b3UgdGhpbmsgaXMgY29ycmVjdD8NCj4+IDEpIEZ1bmN0aW9uIHByb3RvdHlwZSB3aGVuIHRoZSBz
dHJpbmcgbGVuZ3RoIGlzIGxvbmdlciB0aGFuIHRoZSBhbGxvd2VkDQo+PiBvbmUNCj4+IC1zdGF0
aWMgaW50IF9faW5pdA0KPj4gLWFjcGlfcGFyc2VfZ2ljX2NwdV9pbnRlcmZhY2Uoc3RydWN0IGFj
cGlfc3VidGFibGVfaGVhZGVyICpoZWFkZXIsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCB1bnNpZ25lZCBsb25nIGVuZCkNCj4+ICtzdGF0aWMgaW50IF9faW5pdCBhY3Bp
X3BhcnNlX2dpY19jcHVfaW50ZXJmYWNlKA0KPj4gKyAgICBzdHJ1Y3QgYWNwaV9zdWJ0YWJsZV9o
ZWFkZXIgKmhlYWRlciwgY29uc3QgdW5zaWduZWQgbG9uZyBlbmQpDQo+IA0KPiBCb3RoIHZhcmlh
bnRzIGFyZSBkZWVtZWQgdmFsaWQgc3R5bGUsIEkgdGhpbmsgKHNhbWUgYWxzbyBnb2VzIGZvcg0K
PiBmdW5jdGlvbiBjYWxscyB3aXRoIHRoaXMgc2FtZSBwcm9ibGVtKS4gSW4gZmFjdCB5b3UgbWl4
IHR3bw0KPiBkaWZmZXJlbnQgc3R5bGUgYXNwZWN0cyB0b2dldGhlciAocGxhY2VtZW50IG9mIHBh
cmFtZXRlcg0KPiBkZWNsYXJhdGlvbnMgYW5kIHBsYWNlbWVudCBvZiByZXR1cm4gdHlwZSBldGMp
IC0gZm9yIGVhY2gNCj4gaW5kaXZpZHVhbGx5IGJvdGggZm9ybXMgYXJlIGRlZW1lZCBhY2NlcHRh
YmxlLCBJIHRoaW5rLg0KDQpJZiB3ZeKAmXJlIGdvaW5nIHRvIGhhdmUgYSB0b29sIGdvIHRocm91
Z2ggYW5kIHJlcG9ydCAoY29ycmVjdD8pIGFsbCB0aGVzZSBjb2Rpbmcgc3R5bGUgdGhpbmdzLCBp
dOKAmXMgYW4gb3Bwb3J0dW5pdHkgdG8gdGhpbmsgaWYgd2Ugd2FudCB0byBhZGQgbmV3IGNvZGlu
ZyBzdHlsZSByZXF1aXJlbWVudHMgKG9yIGNoYW5nZSBleGlzdGluZyByZXF1aXJlbWVudHMpLg0K
DQogLUdlb3JnZQ==

