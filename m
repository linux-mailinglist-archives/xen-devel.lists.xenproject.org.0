Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC029CF44
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 10:43:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13449.34116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXhzR-0007el-W1; Wed, 28 Oct 2020 09:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13449.34116; Wed, 28 Oct 2020 09:43:33 +0000
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
	id 1kXhzR-0007eM-R0; Wed, 28 Oct 2020 09:43:33 +0000
Received: by outflank-mailman (input) for mailman id 13449;
 Wed, 28 Oct 2020 09:43:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LslW=ED=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kXhzQ-0007eH-59
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:43:32 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52c65e87-5bb4-482c-b5f2-e3752ee3c0fb;
 Wed, 28 Oct 2020 09:43:30 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LslW=ED=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kXhzQ-0007eH-59
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 09:43:32 +0000
X-Inumbo-ID: 52c65e87-5bb4-482c-b5f2-e3752ee3c0fb
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 52c65e87-5bb4-482c-b5f2-e3752ee3c0fb;
	Wed, 28 Oct 2020 09:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603878210;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=O4RYG2lbV+VmbSfi+1QhZafhH9q9sQLvL4b+ZywryoM=;
  b=N1nd5cSZxfQC8d3f+tdiZivB+hU6pK57SGdF0jcvlDsrArtbQwU1T+ja
   u5Le3FAZuiuwiJ63o9Ow3z0jXE+dNsdOiw4OdKCCLuWEn/z+/+ZjF8xq1
   9j6u+I43w0nVmgXcmbjbU53/BFXnPzE44YRuyCiHx4hxk8LEt0essCUYo
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ijaz0sh9MrHa1LWvW8HjU0wA0PLbsrczsBrm0tcB6NxxNXomZpfp3Yl3QeszbzCGavcYX15X8I
 gtrieAueYReX6lxbDJAMu7SU2eh+Zf2CQf5YkLxzF9N2XaRVMw0/i09c7Ru0l73e5C01RfPgId
 Mvjt4SJnh1S1WyAFIUTKON1p0MY9QHzjcRcZ+kWB/Ppf/qO0jgHGdw9dYVE+ITDoiso47vUmgx
 0IYW4+IItAO/HG52b8byZwLMXB7cb5KM+ss8Ib91O46rADymd7s+F0KF7Qpz0ME5B5wCADrbRI
 WU0=
X-SBRS: None
X-MesageID: 30004068
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,426,1596513600"; 
   d="scan'208";a="30004068"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6Wr2vAiE78cZ0ODJ+kE+O0iwwQJEN+C/SPDwB5bQzwVc/nvvIf6VwF8vY8wu3NSslsHvD8GvgzysS9RBgJo912MRhBYBi2EMQUK9yXrfX2OwuiCDWLgL6uvfP/kpE+0ed3XBeY3XxuWoFvoj8c3QfR9anX90ooAUTjb4PtTAc3WiD1skC2ID9jslibJhPZ2rfV982aafzsK4B1Le+O06XhHL8Ra7ASjBd3RIDmlFWHLCYIH6fMu2TbjbrzdGQgGQ31n5I8Yh1EeUUTB3SATAZyCigx4TCM22L4Cv2EkH/RGlrONGVmwIqfb4grw/owrkn/0udtpt65tqlWb0jP4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4RYG2lbV+VmbSfi+1QhZafhH9q9sQLvL4b+ZywryoM=;
 b=L31DMdX8701CB6zQN5g2zgdW0CJPyFp8RDvALoYPsJb+LYeZ1GzvDXfvnAT8HVINQFOKl4+HHn9Lv7YYD1WdgYLLNs3Ay6j9OvF2WF05xqRbpjqBGEcilGmdxJ/7zFx3gBEWI01We445iM0BpFQ3sPe09Rf5Z2ExT5pBFt56qeOkjgGtWCGks5lxJyPDPXVaWV/1FbvmKjkUt5or1as9DxTY+15KIb2qS+Y7vCRgRvAp6Qrkbhivtoq/1cZsWqPVLAmNIe++b9KO8maNRueaWWJtavcVw3+gDg0k9hOf5QSBGdBCiuva60mwauXGS7PvYOUvnzMat4xIpWSIFlgbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4RYG2lbV+VmbSfi+1QhZafhH9q9sQLvL4b+ZywryoM=;
 b=K2zHOVAjBqRFJas/lIVdt3npIa2bDqgTZQ2zIhWnnUXg3tjMxf9BMD0iaLUAqlbbCXxihseNGlqS8hV6awurqO9eByQyMyZsUK8Hp6H3tlEB7VDwdvn/zmzh6zwwZxKYclye5kIqDS6CO54a7ZMivnozx8lYxYaFHCT3Tj6Wwmw=
From: George Dunlap <George.Dunlap@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
Thread-Topic: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
Thread-Index: AQHWq7QzrIonuj7b9kK48A0ZtEUXrqmsDfmAgACngICAABCpgA==
Date: Wed, 28 Oct 2020 09:43:21 +0000
Message-ID: <80E82B52-EE04-440D-8AC7-8B0E7E833FE4@citrix.com>
References: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
 <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2010271540110.12247@sstabellini-ThinkPad-T480s>
 <759F39C4-F834-4BFC-B897-714612AEACD8@arm.com>
In-Reply-To: <759F39C4-F834-4BFC-B897-714612AEACD8@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b86ce64-8338-4aa5-27de-08d87b25e857
x-ms-traffictypediagnostic: BYAPR03MB4520:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB4520CED6497A0118E9BE064A99170@BYAPR03MB4520.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eKMok+O5Ui+MfS3wa3NJ2aEOqW1VNjNNnQBZLv0OEBHRLg/na2xES4ybbNxkB0XEB4MXZ37dGYLivBcZ+ayIeFiBvN6c2/NdjNpxVYntqDkr6Oh7eTFYZwZTUFqZEZJB9drXMBx8ZtFjloqRXoPDAO6CbfYWSFIUf5JVBnw5TGCsa9Dm3dq2KUA+oS2iDmEzTV7c8kfjASdM7UnK2hx0HHLSqbDccUeIi4aUX3wGVgf0aygv5X9LhEXpU4p8do+XD44jUGshZSOAnKHLm2ie4H7HLuxdjTaSlai9mJd+rT45qojJXsE73bFoy2wFnGngp14K8rIorueFBbvm2EYMaQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(8936002)(26005)(5660300002)(186003)(66946007)(2906002)(6486002)(36756003)(54906003)(91956017)(76116006)(8676002)(2616005)(66476007)(66556008)(66446008)(316002)(64756008)(4326008)(83380400001)(6506007)(53546011)(55236004)(6916009)(478600001)(71200400001)(86362001)(33656002)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: VeM4SpYHmyV+TxkMoOiVSk+ch0Zvx0FFiuSgw7FYLVVntvkM6N9QtnqUzPeVXe9vTAVVCMMGkyjdzme3A7mss083fl+XC0+AfI9otoK4zNy28eIjRQjhPoT95ulyfJiOMAS2El8sqlO/iQcJGmzrqcEEZZSIxQSDCb0MRN13zUZFIiFUHMn1g862mSOV1JDODJjF5vBv/5xuHnRMxEy4wHRTkhNIk4Yu8rtzNn8adfwzeb9KvdoKMsykV+iK1iRUrmvowf9JYtqHjcmVRL/vgva9SHxmamDKx/tyz+CqiKbW4uK+xyezNOV2janZxMXXORG+E+6FGCGyQLuzz488RaPsEQfTG6Y7xS1UdnDIFWyfAUVucIKlnQjzMZlbVgu2W5DxeHMXCOMEnDKiTco2G7shYpm32Fe0mLZDjjf32RCA5JqCLCIBHOTTih3bKaimDLopzmmCTas93sgSLqnq+9xohwLxy+0vLN8Fe5ODxGBGwBhWBUwOYQZTaGOzhlow5EOIc8yWHkG9SP8FO/Vnn0o/tGCEn5dZwDDiz/L/AezfAGdWkXDv2b48kOm33k7IqVkQXzSGmWw5VH5Uk+ravFFdPvDUUz9PbcRycHvlXCUM6xeq0uHLJEx9KWIi+HlWzWRZWj7DYOsb8bhuWgZr2g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C9D075C27FD454B84E40189C56FB110@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b86ce64-8338-4aa5-27de-08d87b25e857
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 09:43:21.4118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t3AmvsEu7LBnHrKwAoASA6U1ccq0I3d+gDWJ52X5RPgcoL9C0gsL7lwxPyglTEs6yW0wO6YSxNOWX8zOb3fkajUtpoALcitmmLKPX5BrmdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4520
X-OriginatorOrg: citrix.com

DQoNCj4gT24gT2N0IDI4LCAyMDIwLCBhdCA4OjQzIEFNLCBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gMjcgT2N0IDIw
MjAsIGF0IDIyOjQ0LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
IHdyb3RlOg0KPj4gDQo+PiBPbiBNb24sIDI2IE9jdCAyMDIwLCBCZXJ0cmFuZCBNYXJxdWlzIHdy
b3RlOg0KPj4+IFdoZW4gYSBDb3J0ZXggQTU3IHByb2Nlc3NvciBpcyBhZmZlY3RlZCBieSBDUFUg
ZXJyYXRhIDgzMjA3NSwgYSBndWVzdA0KPj4+IG5vdCBpbXBsZW1lbnRpbmcgdGhlIHdvcmthcm91
bmQgZm9yIGl0IGNvdWxkIGRlYWRsb2NrIHRoZSBzeXN0ZW0uDQo+Pj4gQWRkIGEgd2FybmluZyBk
dXJpbmcgYm9vdCBpbmZvcm1pbmcgdGhlIHVzZXIgdGhhdCBvbmx5IHRydXN0ZWQgZ3Vlc3RzDQo+
Pj4gc2hvdWxkIGJlIGV4ZWN1dGVkIG9uIHRoZSBzeXN0ZW0uDQo+Pj4gQW4gZXF1aXZhbGVudCB3
YXJuaW5nIGlzIGFscmVhZHkgZ2l2ZW4gdG8gdGhlIHVzZXIgYnkgS1ZNIG9uIGNvcmVzDQo+Pj4g
YWZmZWN0ZWQgYnkgdGhpcyBlcnJhdGEuDQo+Pj4gDQo+Pj4gQWxzbyB0YWludCB0aGUgaHlwZXJ2
aXNvciBhcyB1bnNlY3VyZSB3aGVuIHRoaXMgZXJyYXRhIGFwcGxpZXMgYW5kDQo+Pj4gbWVudGlv
biBDb3J0ZXggQTU3IHIwcDAgLSByMXAyIGFzIG5vdCBzZWN1cml0eSBzdXBwb3J0ZWQgaW4gU1VQ
UE9SVC5tZA0KPj4+IA0KPj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRy
YW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+PiAtLS0NCj4+PiBTVVBQT1JULm1kICAgICAgICAgICAg
ICAgfCAgMSArDQo+Pj4geGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jIHwgMTMgKysrKysrKysrKysr
Kw0KPj4+IDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPj4+IA0KPj4+IGRpZmYg
LS1naXQgYS9TVVBQT1JULm1kIGIvU1VQUE9SVC5tZA0KPj4+IGluZGV4IDVmYmU1ZmM0NDQuLmY3
YTNiMDQ2YjAgMTAwNjQ0DQo+Pj4gLS0tIGEvU1VQUE9SVC5tZA0KPj4+ICsrKyBiL1NVUFBPUlQu
bWQNCj4+PiBAQCAtMzgsNiArMzgsNyBAQCBzdXBwb3J0ZWQgaW4gdGhpcyBkb2N1bWVudC4NCj4+
PiAjIyMgQVJNIHY4DQo+Pj4gDQo+Pj4gICAgU3RhdHVzOiBTdXBwb3J0ZWQNCj4+PiArICAgIFN0
YXR1cywgQ29ydGV4IEE1NyByMHAwIC0gcjFwMiwgbm90IHNlY3VyaXR5IHN1cHBvcnRlZCAoRXJy
YXRhIDgzMjA3NSkNCg0KSSB0aGluayB0aGlzIHNob3VsZCBiZToNCg0KODzigJQNCg0KICAgIFN0
YXR1cywgQ29ydGV4IEE1NyByMHAwLXIxcDE6IFN1cHBvcnRlZCwgbm90IHNlY3VyaXR5IHN1cHBv
cnRlZA0KDQpGb3IgdGhlIENvcnRleCBBNTcgcjBwMCAtIHIxcDEsIHNlZSBFcnJhdGEgODMyMDc1
Lg0KDQrigJQ+OA0KDQogLUdlb3JnZQ0KDQo=

