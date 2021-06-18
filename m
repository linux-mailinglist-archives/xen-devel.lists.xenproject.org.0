Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C25673AD078
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:33:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144857.266580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHQY-0005th-AA; Fri, 18 Jun 2021 16:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144857.266580; Fri, 18 Jun 2021 16:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHQY-0005ri-6E; Fri, 18 Jun 2021 16:33:06 +0000
Received: by outflank-mailman (input) for mailman id 144857;
 Fri, 18 Jun 2021 16:33:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luHQW-0005r8-VX
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:33:04 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03b75236-8ee2-4819-85ce-96ec09fe55dd;
 Fri, 18 Jun 2021 16:33:04 +0000 (UTC)
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
X-Inumbo-ID: 03b75236-8ee2-4819-85ce-96ec09fe55dd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624033984;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sK7m/7GEPqI2fInlZG4KEFlh1SRJzOjGxVQkcb/DqDg=;
  b=TD50OQvTXnMg0S8RflJ7K/K0Nki9L6xTpLyQhFsS3OMrbx+Mc5kBGtgF
   jjJ+aPON65NIRWpTS6gnkto+iGDtFiNg/ecHDe0hGNtlzoTEeHAk7TEU/
   sT+3DzGiyESNAXFYkQuEUzTX28qhb8PED/4hXUlfuead4XHURAXC1/FLg
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dkCWcdbJ/uI4O2FNERgiwDNoi0K1mK2xQI9/rnbnvWGdbISkhpfh0Tvd1MaGkwtTNZnfMvvCfK
 avhgXmsiPLELJNRGQd1ajTJ2rFTUfXBMRbsfz3vphAOCqhCcltGF5xP8bLF+eW6jawFMN9+j18
 1XR+1TQ99/dosOfndO6GMz+uE8nLpHF85OQEzYM5n1zeGzz2tekjlNtDLEuB3yn5Vx6oMMK9/Y
 Hs7oAHTG7qn67NYGCSADuAUu8INGdML1a9IcpL1LstiaGqR/X8VckHJhkvdOq/4ZBZA7YwfaOD
 +5c=
X-SBRS: 5.1
X-MesageID: 46546462
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9B0GwK156b/FepVPm3vo4gqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46546462"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkBII2Ykiv1yYBW3M7Xz6D9kJKFORpYyVoda3tEpZwkFO9a2b721YJC4F4v/rmlTIawJuhoEP8ribH1Teu2nXwiLY97WPSYEphAKuVPlk4M1yYHn/I2jIask5RfNXaa1SMktUC3ZMcMxajM7CeTgjjQwVsbpbnhUeIVRU+aiAAYc7rmXaCXK1JMGOtk9KaKYwgMgTADLc6D8iIhVCoFSFcl2miackDIrCkWVuwzpmE5acsYs3e77HDcm9L9rhOGtjjvcIkmNkd/2CXgdD+VL1H6wwIKxvvrAvYvSzCIgbM0cNUCw0jJ0eBCfSn4V8AHqWC8svFNK2/gtPyTVCNTNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK7m/7GEPqI2fInlZG4KEFlh1SRJzOjGxVQkcb/DqDg=;
 b=ktGY+5ZShfTxeOFE1njOOzMcXdupa5EDPeAdcS99K9D7t8snee5/pUOjnVmsSKfOVXN4VF+wRmAEFmhC7RwIY6ppJIV9nXMSb32/CrPU0o9NwQYb+aYNHnIGvr4ElrBnoxZJ7OQKvnbj5hmw8YrVOBXPQ9zT0fqF/SEVwf91ZStUO7vcFhKpheesqk9EtiTEdlI1AQedXH5HMgRgoyTTS1bkOPgCP/h0m8ztIEEQqGDWR4wrdo/KAoLjVeqj9GfNHSjMfgvtYLvOodgwdL9Ixgf57NC+mLATkZ2iKKXwgP7n02Wio/Ame9uaGS/ReTc3II7g4maCS6LuQQ9nAsmhBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK7m/7GEPqI2fInlZG4KEFlh1SRJzOjGxVQkcb/DqDg=;
 b=ZwlxWk+oWu0CfeUq/4W7tIfyMF6s2lrcJHxTLsgjrcWqtW7JrhdbCdfQVygzb6ryRVlD3aJzc9o90BvQMxpJ1uKmemuyC2hn5P9//ItjW7gbPAjwUZzdxFyBPmxmPHp6psxGBzKUf2euZ6J2RCsNAoZo9jIGEXM1Eu4NKKIIEMo=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: "xen-devel@lists.xenproject.prg" <xen-devel@lists.xenproject.prg>,
	xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 07/12] golang/xenlight: add logging conveniences
 for within xenlight
Thread-Topic: [RESEND PATCH 07/12] golang/xenlight: add logging conveniences
 for within xenlight
Thread-Index: AQHXUNy8b62kbX7r3k+nzGZDJK+dZqsZ5r2AgAAhsQCAABOrAA==
Date: Fri, 18 Jun 2021 16:28:04 +0000
Message-ID: <8E549F61-EE34-465C-B109-72A3B37164D6@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <452aac2489990ac0195c62d8cb820fbe5786c466.1621887506.git.rosbrookn@ainfosec.com>
 <A96AD4DD-35CB-495F-A008-D72A5C2AF45D@citrix.com>
 <YMy5FKP7OHHVWXXq@FED-nrosbr-BE.crux.rad.ainfosec.com>
In-Reply-To: <YMy5FKP7OHHVWXXq@FED-nrosbr-BE.crux.rad.ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e6e51a6-ee72-4763-682a-08d932760c88
x-ms-traffictypediagnostic: PH0PR03MB6250:
x-microsoft-antispam-prvs: <PH0PR03MB62505BA88564B4C10AB198B4990D9@PH0PR03MB6250.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4FNhnRXPVeFhjOngl08mf6INUj3EmcJGsvcW5lyutjp5cov1SKhXE+bGP+zOi+Tb6R5dTlVxtx0xiP39xSnuEfMA/1gVbmVGLE8uLvDK8eESah1vLtUT1N6Ugj5B0RbBHc7pPlXg5EwcADtUj4Sx2mQ5jvVXWqkBqXK0m3SwowuOIbdq2RaF7O4qQhkOwsATuaAVGXY0FJyVzznOAAQOm3uMcrPBDaGK+z+jVIkkOPXW3eAp8Bj5IpTlNZaePbuxh1LVF5W/zQ4b6kPb77aJZ1eM6mwqTSd4QiZN9F07k6VhjuOm/MfpWjNhWgd6jCYoETfL0RN85koz9i2Uq5ceckuW0BAVQh5wq5+yVzOkVCWu3KzLiZotLYKmQhLdq4UvBSg9g5G1Wkt0fEvPrgRces6zBBNH/8ndGO6n+7MLggcWOucL/FRGuSyMhZKentj96sJBsfSdEExhJ7nSPgMkT7mrMZgRBKpoTX2O39CVMFEx38uNB97J8oxNMcXAru5Cb6/zinL6RPUp9lMPDQtPJA3dQ3ioWpAH0bLombtF8qig4ROp0jVCKrrEBBGqgSNUi47JY8Jv1mKWhwXOcAURKVVNFxgcKX3cDE7WLgI+Fb9VT2Ok59Ea+aGy/ZLGVj5FRzGNQCWj9lRRkedmCU4aqIK6cbpROjn239NC3pJ817U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(4744005)(6916009)(478600001)(5660300002)(38100700002)(4326008)(186003)(33656002)(26005)(6486002)(54906003)(8936002)(8676002)(2616005)(316002)(53546011)(66946007)(66446008)(66476007)(64756008)(66556008)(76116006)(91956017)(36756003)(71200400001)(6512007)(122000001)(6506007)(2906002)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkQySU43SzJSQS8wWDE5UnJ4YjhIQWdZY1JPc0dGeDgyY01NTkJOR2dEL28y?=
 =?utf-8?B?ZUNhU3BYMTRDeTBYSS9qazB1ZW4xZjRzVFN6eVpQKzdML04vTUY4YlZGY1dz?=
 =?utf-8?B?T3FHbUVKZ3prLzREZmlsU2FZTkJtd3lMdHI5cW5hUHpxVUxkVnc1K1Baaks3?=
 =?utf-8?B?WmRJL2ppc2k4Mk9PT0FjQjVwWndKeUozdi90QlpBK2FPSXJMbzBWOENJTGFX?=
 =?utf-8?B?NjFObDYyMGl6U1BFVkxjbHArb2RpczBKZGdrM2lCMEUwY2Q4Skx1QWJmL3J4?=
 =?utf-8?B?WFlqVFI5b05xcG1qejh6M3c2NkpYNUZlTDB2UkNQZHAvTTlYYVZ1KzBIVXV2?=
 =?utf-8?B?OEwxUFFVekczcGJmaldDYzhkR1p4Z2NZc1JSSElnakxlb2JJU1VBVnZsNzY0?=
 =?utf-8?B?SFlmd3BZaVphdlJOV2orMTc1bXBoQmlLWURPOTNid0ZHT2lIUUZXcHNiS2ps?=
 =?utf-8?B?QWp6d0oydHRLeGNnbU0va0g5c0g2OFJGN1VqS2ZUNzBodHBiL1Fhc2lNclNI?=
 =?utf-8?B?M2FCYkFUL3Z3K012NkNGMjNhUHJiT3BwSFZPR0MxdXA4bE1ZcXBiUTlqcmpk?=
 =?utf-8?B?dDBaZmdUUEtiM3orc09XSEt5U1hITCtFRFBVbmxtb0xFYlBFempkVm85Znlx?=
 =?utf-8?B?WllQYmRmY0I3a1ZZMmdpWmN1TjVtS0I4aDFlNVlmck51aEk1dzJaMi8wZlhH?=
 =?utf-8?B?cmxZV2pNNzFtejdWRWprcFlZU0FxT2x5VjVhbkMrUWxiOTRHWll5QXpwVXl3?=
 =?utf-8?B?Q0FPeW1oUHh5VENoVm1tdWUyTHp3em1pSCtHSjZCdmtaM2hYL1RMU1ZrQUlk?=
 =?utf-8?B?dVplUFk1dWhOV3pOeGVPQ1BPZkpvM1V0QklMU21aUWlLc2I1dTYzZ3pzL1Ux?=
 =?utf-8?B?aFJmNWZxZGxyeWlrVU5ucEpMV1RZc1V6UE5lblN3dXluQTdKc0hZejEvS1VT?=
 =?utf-8?B?aWRremkxK2ZYK0NLWFB2b0RMN3ZIb0xsQ1JiYW0wSmxWVVlBcUNJSzAwNkk0?=
 =?utf-8?B?d29hOTVXdzFTZU9yeHoxV2VZQVZJS1FqSzZMT0xjSWF1YXBpTWI5RC9ZVk96?=
 =?utf-8?B?ZmFxU3RTVVV5c0hWWE1MNlB3eXJNYS9waGxhWXpNb0tIc1R3ditXTXU1Y1dK?=
 =?utf-8?B?bGdwRnVWZnNRMkljY1IvQUdZaWNPbUtKTVNMWjBhRTV3S3Ewc1pMNXMyaUpm?=
 =?utf-8?B?V1dBTHBVOTB0MENGVjdJYUw3bExaeURlY3QyZmtLYUhMY1BkNW1UaWtMa1NY?=
 =?utf-8?B?YWZqM0JTZ3JETTZJOXVaRkJYVnErWjV6Q2ZSQTBiMUV2UE9PZ2k1WHVZRFR5?=
 =?utf-8?B?bnI2cnVSS0FqOHBKSGpITXZldFh3YkJGZVRCYW8rTkU1U1FkWnZLeDg4VndF?=
 =?utf-8?B?blpkd2Y2NHhFOUkvWHRXdTN2Z25yMjg4T2lNSFFwcDdtcmpEcjBzVVk3TmdI?=
 =?utf-8?B?NmpieW5Sb1k5ZXJiUmJZa3NIR2Q5OUdCYnFNT2hpeFpMTElDbUtpUWg3VDlY?=
 =?utf-8?B?c3A4ejFJUTl5UHgyOTBoMXJRYVFDZlNBWmMrMCsvOWZJL3hQRFE3RHlzME5p?=
 =?utf-8?B?UVp3cVJzMzZWejhmK28rZGxjM3lTOEdnTHQ3SXdvL1BWVzhvREs0ZDdTL1hJ?=
 =?utf-8?B?REk5cFJyK1cxTHJNclVhTjN1ZFNMaGxUTzFtY1pUZ1dLSXdSL1hvVzZycXoy?=
 =?utf-8?B?SzhTbXg4V24wTHZpQm1SUXJEZjRRd3NUNDQwSHZzRzVuSXpPWTlDeDN0YWVr?=
 =?utf-8?Q?EKp6qzd8tSQnUfyrv2UirydebFiYSYJo2YTqC1g?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D960EC29876EAE4A91CE0D17BF244229@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6e51a6-ee72-4763-682a-08d932760c88
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 16:28:04.6904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VgjRuqrJp/D4bXRVNp0Hs2iR49eqgkG64kPxssqhjzLCAtQwFMVHZFK8whIYZ727eWX/menoLh5tXM/wjTMlVNqCsdOJEiSJO4mZfpUsM3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6250
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSnVuIDE4LCAyMDIxLCBhdCA0OjE3IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgSnVuIDE4LCAyMDIxIGF0IDAxOjE3
OjA3UE0gKzAwMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+PiBBbHNvLCBpcyDigJh4ZW5saWdo
dOKAmSBpbmZvcm1hdGl2ZSBlbm91Z2g/ICBJIGhhdmVu4oCZdCBsb29rZWQgYXQgdGhlIG90aGVy
IOKAnGNvbnRleHTigJ0gc3RyaW5nczsgd291bGQg4oCcZ28teGVubGlnaHTigJ0gb3Igc29tZXRo
aW5nIGJlIGJldHRlcj8NCj4+IA0KPiANCj4gSSBiZWxpZXZlIGxpYnhsIHVzZXMgImxpYnhsLiIg
SSB3b3VsZCBiZSBmaW5lIHdpdGggImdvLXhlbmxpZ2h0IiBpZiB5b3UNCj4gcHJlZmVyIHRoYXQu
IA0KDQpJIHRoaW5rIHNvLCBqdXN0IHNvIHRoZXJl4oCZcyBubyBjb25mdXNpb24gaWYgc29tZW9u
ZSBkZWNpZGVzIHRvIHdyaXRlIFB5dGhvbiAvIFJ1c3QgLyBMdWEgLyB3aGF0ZXZlciBiaW5kaW5n
cy4NCg0KVGhhbmtzLA0KIC1HZW9yZ2U=

