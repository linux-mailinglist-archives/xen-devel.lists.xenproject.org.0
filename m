Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B7C3ACBC2
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144614.266151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEFk-0005my-8U; Fri, 18 Jun 2021 13:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144614.266151; Fri, 18 Jun 2021 13:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEFk-0005l6-4b; Fri, 18 Jun 2021 13:09:44 +0000
Received: by outflank-mailman (input) for mailman id 144614;
 Fri, 18 Jun 2021 13:09:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dwN=LM=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1luEFj-0005l0-1b
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:09:43 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 189e44b3-6b62-449d-9c03-d3c152698728;
 Fri, 18 Jun 2021 13:09:42 +0000 (UTC)
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
X-Inumbo-ID: 189e44b3-6b62-449d-9c03-d3c152698728
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624021781;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=vxbhuTFtjVEcv91IEwFJSsJ5fZxpbROKbd6fvx6vsvQ=;
  b=Q7Oootcdc3oWU8bXV0E2ZVZdiBtMynXcr9xdTKrGuTyuI117JMiMBRYg
   8I0bveKIOEgAACD0Vyc7iKVss2SVr2NLm8M4hmRrtQwXrZ6jbRv76p/iY
   u65+lodUUokBb6Ff/qmHo0zpWZfI6G+WtRTn/w9Y1tOxrOrGV4ZetKUnn
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NYezggnu40RfmUJCsV1d4YtKdTjJiheEt1fWtwjvWGUGc0nLLTLRs8VnORJoOTFIrm9yScwvJy
 Vv1LAGpFjq8MIzD/qUuXoLGPR54XyQgyiSYM6HdVHy28sBdx2b8FJFalDg/LstSjWllQGgtS3P
 e7eZGGRTpDdUwnss1tOM/TTDpZxL2cO0dlYR3oz9Jd0O7JkRO8bUbVRkrx8CeY4iAi6Q+U46iS
 sZIfSSnBTgcMsDy9VZ5RTraBgKI/qSoaNC9597NiDN/Gokt3Se2lLHN0X+99aJa3AYmjHBWDR4
 kLk=
X-SBRS: 5.1
X-MesageID: 46825587
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:hMQPZq89wIyo90fcP75uk+C7I+orL9Y04lQ7vn2ZKCY0TiX8ra
 uTdZsguCMc5Ax6ZJhCo7G90de7Lk80nKQdibX5Vo3PYOCJggWVEL0=
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208,217";a="46825587"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcZmemX2GVaumkco8Mk5kYU7A7qPmVJLv63YI/sZMznhkB8tDaPt0M4Tpl9Tpdog4SfpJYs8McpKCZ139KwaYFWKZfkAul5oQRFzVNrsJBxjEIRjrAckA84WF4w14gmzp+dq+12L36CYAsTdPkiDoDQfxwwCxE8Huud0IdhxDhmy3zA4Th5zUY4waE9NoWQtxO292J2NjKTTp2rwkXkFWCXXaTS9dQQtiKJykLl/gu/UGKAnPuKF0vj+xcydM9HBQSG8yI2uTJgEtbQj72Jj0mVq9uHNDik7L+qZ4GLzFATITzxxSzW1MoYueiZ+/Taz+pWe6uJxczIDGlhHfR24ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxbhuTFtjVEcv91IEwFJSsJ5fZxpbROKbd6fvx6vsvQ=;
 b=YUW5XIWAtA3J7e1y7zlNc9BWuhUZFIX+bLe/3wRcWCFBNRPH/poY7/Ie5HBP4oJbHRE2+/5l8CHwdO6pOTZaSWoBlhMkt8CXcKbuSZL0/8rk7EM0FXW0XNtA39BPdN9FLlIgaWny4IQXMzMimmmVl6eS6Sv4jpXiHAW/w6CSbbHrDjD8rJhsB7YN92BjvN16c32Ai5nC12lQ005jbmHHYjKAh0L/Yq/9Lhd0p5/gj5pyNOkC4GilmOuEv3lUNhr418pmDIeAPNh9aqwIZAprP6rcWAzkLNe2R6f+h5IG6vc7FGF6vsnPY65EQpqfRWFmR977lvBpE5bMvkn1YpKpQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxbhuTFtjVEcv91IEwFJSsJ5fZxpbROKbd6fvx6vsvQ=;
 b=NnvVJ22ZtEjRTgcV8zqWHcSdzAwOVwhu74I2zShzSxRVx3atNqtfUIgjFmpSZM0XKmy4J+8JR7RmE4AcrvJzycDEUQXz76/CN1TIHXJY45CUPgSeRr9ODBTD1w0KMOyXQXaaIOmGKy1MDzFHeThbidDvU4DhF4BGiY4yhzoxTAM=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "David
 Scott" <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] tools/ocaml/libs/xc: add OCaml stubs to query CPU policy
Thread-Topic: [PATCH] tools/ocaml/libs/xc: add OCaml stubs to query CPU policy
Thread-Index: AQHXZC8pa/DYoLcU2065VvJ6EZGJjqsZvgMA
Date: Fri, 18 Jun 2021 13:09:38 +0000
Message-ID: <70BA77FE-045D-4F67-A61E-030CFAACC8B1@citrix.com>
References: <5fdb7b4cdee69af8e2b9d77b56b1027a8799cf04.1624012999.git.edvin.torok@citrix.com>
In-Reply-To: <5fdb7b4cdee69af8e2b9d77b56b1027a8799cf04.1624012999.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38e9881a-c103-49bd-d5a3-08d9325a5434
x-ms-traffictypediagnostic: CO2PR03MB2213:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR03MB2213C1225367C061AD357D54F60D9@CO2PR03MB2213.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rnm73tac0HwlwSKem7+KFZJ2iE0L9HjyOks6nf6s5NJJtSOt2gEZho0v7a72a5EdPuuSWtunPIS0Xf8XwNOg1QJW6NUNRm+M7SvkglfID0W81aogpaUOSynpVwR42DhhR7h6nt/Tp5QyXqJwWOMNy+XpcK53S7i7UopXT1pM4VQ9u/B0Y/CJ0g7Z3BwtbMVgY8UWgo4VVadymdnA5A06JOiQK6pOHfFz+Aj8HMQQ/E1QvBghnfWGdmMDpQgtTCLzWSMgHThogGX/5Xd3E9HWzM/QGS1/tNtMmpVtSF2wFlWFVLNW8EuS8aItL707W2vl2jozh+wS7ZXqg0dv6PmyrpxL3mHAFcL4HpyPwe/Z8U6xgUm31cGONL0lyN7vVyS0D/3I9TygYZKKMsHWWA7oivGUKbxWE0IMNt7ugLeZrAwF1JKlhYoVMOBnmj+rwsC1KiCum6f/JEGlHCIMSitEnPonmq6Ie0cfQVBXi6U5E4nkAaY01yxf5LR8kFa+30c/IJlRt7ICqS6R4rjd2RtRSJLP6VOWzWx5dQvz4VoscjoEcZYMwmoOUs/W4Zv9v2hpNiyiKZ3mbpQSTiZDyWxrCyUAIPIXgkQ2Foc4TO6kmYUonWJnKBZZYBoaZSaa66B1b5wyGds4SRc72D/VS8tT6A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6380.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(8676002)(54906003)(64756008)(66446008)(36756003)(66556008)(66476007)(76116006)(91956017)(37006003)(6506007)(5660300002)(316002)(66946007)(2906002)(26005)(478600001)(71200400001)(6636002)(8936002)(6862004)(2616005)(66574015)(33656002)(6512007)(186003)(122000001)(86362001)(4326008)(38100700002)(83380400001)(53546011)(44832011)(107886003)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWY2NXY1ejViVnpERUJQdWVvUkp5OUNHQTlJNlVEWWxEamxmTFpHNnkrQzl3?=
 =?utf-8?B?UW40TWFCMDFYZ0Ewb1huVTVGN2RGWWFsQmlaVnN6U1ZzeEswRUo2Zy9PeVRn?=
 =?utf-8?B?cFhkVGdOZjlFcUVRbEIvRWFtL0cyUHpCVEM2MW5vS2ZrRGpDZGNLRVR2REhh?=
 =?utf-8?B?YnFocWFUMUVZUHErMWVVTHFUaUtwSjlJVXRlUEY5UllCdXdpSnllRmZtUWIv?=
 =?utf-8?B?Q25lRVFWcElEMDFJTStUcWpRVG5Ub1Jhc0srMk5ldEVhbUxCNXVWVVF3cndD?=
 =?utf-8?B?a3YrMVo4WjVsOTNWblRMd0VGSWdsSysxSVZBWHJiZHdoVDM5UG41NmN5RUZQ?=
 =?utf-8?B?K2d3ZW5xZ01IMC9qUjlvb3RMNUZsYnRDSzV3NlpjaDJKS0gzRTJyd2lnd1NP?=
 =?utf-8?B?S29URXVXN3FFN2tHZXBjQnQ5aExHUzJWMXlzRHJ5bmdOR2hSMlJoT2hGUzVi?=
 =?utf-8?B?MlEyK1lUSkZWazYxc2pJTTh3cWd0aURoaGppaFcwSVdWMlVBOEJ3VE1NNjJn?=
 =?utf-8?B?US9XY3d2S3dkSE1DZklUYjNPbmdDdXBUczBaS3ZJUFNnRWYvSk4zMlVscVFZ?=
 =?utf-8?B?eGI2c2NhM0hCQTNsYVdBN1J2d05VeFhzRkp2VmJWQ29WWWo2SVE4NXlmWHlK?=
 =?utf-8?B?VEVGYUNlWm55L05meldqZk9TNGx6a3FNZnRrb3A1dkkvY1dpVkVoenRUenAv?=
 =?utf-8?B?ZnQzd0plbS9maUNWeS9yU1J3T2JVemVnTW5iWFk4djd6Y1BnTFlVUzkwWUlG?=
 =?utf-8?B?dmNWOTlLQXg0RlUvRjNUUFd1Q2w2SlgwbnE2WXFrMmhkMW9WMkFMRkpoQncz?=
 =?utf-8?B?VTJjOVlzaVNRYlYwR3RsOWtON3ExRFdUNWVJclgxYThJT1U5WlBSdjIvL21C?=
 =?utf-8?B?OFRZM0luUUdaOUhZQllPV09TT2tsMjlhT3c0T21CTSs5eGM1VE1nM25jTnEz?=
 =?utf-8?B?REFSSldGaEVDQzdyaFluOGw2ZVptdVVYaGpRT2NseHpKM3ZDUWZvOXMwazVv?=
 =?utf-8?B?K0EvYXZmQktXZTBzQjltYjViaFRDRlVZc2RFTmxLYm45bUdFRDBQSUF5bnNS?=
 =?utf-8?B?ZkRmNE9Ndlp2cUZ6dHBWRS9HRnZReGFjUWRRYitERmQ1WVhuZEdybXcwanVn?=
 =?utf-8?B?cjlycDQzZnlpRmIzMDZEMUZ2S3pPa3M2RFdmQzZQVGFsNjhoQmE5SkpuN1U5?=
 =?utf-8?B?WGpObWhFc2RWSHBWVlI2cHRlbjlsVkhWa0tNeHladkhEdkNLcW9Pd0p1T0xi?=
 =?utf-8?B?TzU0YnY0NCtzd0pDclFGWDVVeDAxWG5vUmx5OURxbVRiK1ZjMWpoOFI4ckdv?=
 =?utf-8?B?UlBhb1Vsa21OMUNBeE5qbVY4TWNpM1JqVWZRVkVKbEtPeUh4Z041cENNbmtF?=
 =?utf-8?B?ZERGeFVkdkFuZWh6UzVsOS84c0oyZFpoNG9mdXk3N3VwYUNmS3ZyUFRRNmt6?=
 =?utf-8?B?ZFpiK3hvYnhCam9IV3F0ZEpPODA3ZDRjRTJNL2pNbkhKd3NKRXMrcmRkRWlm?=
 =?utf-8?B?RGJpWEYvbEtVT01rVEtGMmFHc1VidlR3NzZ4UURyZTRacldnRTZMWjFTY3NM?=
 =?utf-8?B?YTdTdXBRd0VsTm5HYXRpNUJFVWF3K21qU0txN3U2VG1vd2tLamJ3c1N5Q2JE?=
 =?utf-8?B?d2NaYnArMGZ1NXZrRHVqaGcwbnBKRWFKQlVBSmZKb2xZNXhYeXl4UllBdHY1?=
 =?utf-8?B?T1FNWHhiZkN5cHczTDFIMDZRRm94c3dpWFBLYnozMFdVR0JNaktTTHlUczUr?=
 =?utf-8?Q?MWsM6wMIIpKDmRB/gXLZtnolHjw3xQfyFT9fBsp?=
Content-Type: multipart/alternative;
	boundary="_000_70BA77FE045D4F67A61E030CFAACC8B1citrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6380.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e9881a-c103-49bd-d5a3-08d9325a5434
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 13:09:38.9465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tNBxTWuzcVIkTXVu9uLlnkV/CfNiz+mu14g29pjj3mNYcejNCxcdXsuzABKzQ8ofE1DFd4Nk5Nk2SI4pQN/ZMFb6pMyBysSeECruSSSc1d0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2213
X-OriginatorOrg: citrix.com

--_000_70BA77FE045D4F67A61E030CFAACC8B1citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDE4IEp1biAyMDIxLCBhdCAxMTo0NSwgRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tA
Y2l0cml4LmNvbTxtYWlsdG86ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4+IHdyb3RlOg0KDQpJbnRy
b2R1Y2VzIGZvbGxvd2luZyBmdW5jdGlvbnMgaW4gWGVuY3RybCBhbmQgYXNzb2NpYXRlZCB0eXBl
czoNCmdldF9zeXN0ZW1fY3B1X3BvbGljeQ0KY3B1X3BvbGljeV90b19mZWF0dXJlc2V0LA0Kc3Ry
aW5nX29mX3hlbl9jcHVfcG9saWN5X2luZGV4DQoNClRoZXNlIGFyZSB3cmFwcGVycyBhcm91bmQg
dGhlIGV4aXN0aW5nIEMgZnVuY3Rpb25zIGluIHhlbmN0cmwuaCwNCnRoYXQgd2lsbCBiZSB1c2Vk
IGJ5IHhlbm9wc2QgaW5pdGlhbGx5Lg0KDQotV25vLWRlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVu
dCBpcyBkaXNhYmxlZCB0byBhbGxvdyBtaXhpbmcNCmRlY2xhcmF0aW9ucyBhbmQgY29kZSB0byBz
aW1wbGlmeSB3cml0aW5nIHRoZSBzdHVicw0KYnkgdXNpbmcgdmFyaWFibGUgbGVuZ3RoIGFycmF5
cyBvbiB0aGUgc3RhY2sgaW5zdGVhZCBvZg0KYWxsb2NhdGluZy9mcmVlaW5nIG1lbW9yeQ0KKHdo
aWNoIHdvdWxkIHJlcXVpcmUgYWRkaXRpb25hbCBlcnJvci1oYW5kbGluZyBsb2dpYykuDQoNClNp
Z25lZC1vZmYtYnk6IEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9rQGNpdHJpeC5jb208bWFpbHRv
OmVkdmluLnRvcm9rQGNpdHJpeC5jb20+Pg0KLS0tDQp0b29scy9vY2FtbC9saWJzL3hjL01ha2Vm
aWxlICAgICAgICB8ICAgMiArLQ0KdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sICAgICAg
fCAgMzcgKysrKysrDQp0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpICAgICB8ICA3MSAr
KysrKysrKysrDQp0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyB8IDE5NSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo0IGZpbGVzIGNoYW5nZWQsIDMwNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQoNCkFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3Rp
YW4ubGluZGlnQGNpdHJpeC5jb208bWFpbHRvOmNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4+
DQoNCg0KK3N0YXRpYyBDQU1McHJpbSB2YWx1ZSBWYWxfbGVhdmVzKGNvbnN0IHhlbl9jcHVpZF9s
ZWFmX3QgKmxlYXZlcywgdWludDMyX3QgbnJfbGVhdmVzKQ0KK3sNCisgICAgQ0FNTHBhcmFtMCgp
Ow0KKyAgICBDQU1MbG9jYWwxKHJlc3VsdCk7DQorICAgIHVpbnQzMl90IGk7DQorDQorICAgIHJl
c3VsdCA9IGNhbWxfYWxsb2MobnJfbGVhdmVzLCAwKTsNCisgICAgZm9yIChpPTA7aTxucl9sZWF2
ZXM7aSsrKQ0KKyAgICAgICAgU3RvcmVfZmllbGQocmVzdWx0LCBpLCBWYWxfY3B1aWRfbGVhZigm
bGVhdmVzW2ldKSk7DQorDQorICAgIENBTUxyZXR1cm4ocmVzdWx0KTsNCit9DQoNCklzICBjYW1s
X2FsbG9jKG5yX2xlYXZlcywgMCkgdGhlIHJpZ2h0IGFsbG9jYXRpb24/IFRoZSAwIGlzIHRoZSB0
YWcuIFRoZXJlIGlzIGFub3RoZXIgaW5zdGFuY2Ugb2YgdGhpcyBiZWxvdy4gV2hhdCBpcyB0aGUg
dHlwZSBvZiB0aGUgcmV0dXJuZWQgdmFsdWUgZnJvbSBhbiBPQ2FtbCBwZXJzcGVjdGl2ZT8NCg0K
4oCUIEMNCg0K

--_000_70BA77FE045D4F67A61E030CFAACC8B1citrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <99DD4989C7A55D49841E7CCE41A09631@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IDE4IEp1biAyMDIxLCBhdCAxMTo0NSwgRWR3aW4gVMO2csO2ayAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmVkdmluLnRvcm9rQGNpdHJpeC5jb20iIGNsYXNzPSIiPmVkdmluLnRvcm9rQGNpdHJpeC5jb208
L2E+Jmd0OyB3cm90ZTo8L2Rpdj4NCjxiciBjbGFzcz0iQXBwbGUtaW50ZXJjaGFuZ2UtbmV3bGlu
ZSI+DQo8ZGl2IGNsYXNzPSIiPg0KPGRpdiBjbGFzcz0iIj5JbnRyb2R1Y2VzIGZvbGxvd2luZyBm
dW5jdGlvbnMgaW4gWGVuY3RybCBhbmQgYXNzb2NpYXRlZCB0eXBlczo8YnIgY2xhc3M9IiI+DQpn
ZXRfc3lzdGVtX2NwdV9wb2xpY3k8YnIgY2xhc3M9IiI+DQpjcHVfcG9saWN5X3RvX2ZlYXR1cmVz
ZXQsPGJyIGNsYXNzPSIiPg0Kc3RyaW5nX29mX3hlbl9jcHVfcG9saWN5X2luZGV4PGJyIGNsYXNz
PSIiPg0KPGJyIGNsYXNzPSIiPg0KVGhlc2UgYXJlIHdyYXBwZXJzIGFyb3VuZCB0aGUgZXhpc3Rp
bmcgQyBmdW5jdGlvbnMgaW4geGVuY3RybC5oLDxiciBjbGFzcz0iIj4NCnRoYXQgd2lsbCBiZSB1
c2VkIGJ5IHhlbm9wc2QgaW5pdGlhbGx5LjxiciBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCi1X
bm8tZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50IGlzIGRpc2FibGVkIHRvIGFsbG93IG1peGlu
ZzxiciBjbGFzcz0iIj4NCmRlY2xhcmF0aW9ucyBhbmQgY29kZSB0byBzaW1wbGlmeSB3cml0aW5n
IHRoZSBzdHViczxiciBjbGFzcz0iIj4NCmJ5IHVzaW5nIHZhcmlhYmxlIGxlbmd0aCBhcnJheXMg
b24gdGhlIHN0YWNrIGluc3RlYWQgb2Y8YnIgY2xhc3M9IiI+DQphbGxvY2F0aW5nL2ZyZWVpbmcg
bWVtb3J5PGJyIGNsYXNzPSIiPg0KKHdoaWNoIHdvdWxkIHJlcXVpcmUgYWRkaXRpb25hbCBlcnJv
ci1oYW5kbGluZyBsb2dpYykuPGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0KU2lnbmVkLW9m
Zi1ieTogRWR3aW4gVMO2csO2ayAmbHQ7PGEgaHJlZj0ibWFpbHRvOmVkdmluLnRvcm9rQGNpdHJp
eC5jb20iIGNsYXNzPSIiPmVkdmluLnRvcm9rQGNpdHJpeC5jb208L2E+Jmd0OzxiciBjbGFzcz0i
Ij4NCi0tLTxiciBjbGFzcz0iIj4NCnRvb2xzL29jYW1sL2xpYnMveGMvTWFrZWZpbGUgJm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7fCAmbmJzcDsmbmJzcDsyICstPGJy
IGNsYXNzPSIiPg0KdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sICZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwO3wgJm5ic3A7MzcgKysrKysrPGJyIGNsYXNzPSIiPg0KdG9vbHMvb2Nh
bWwvbGlicy94Yy94ZW5jdHJsLm1saSAmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDt8ICZuYnNwOzcx
ICsrKysrKysrKys8YnIgY2xhc3M9IiI+DQp0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1
YnMuYyB8IDE5NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrPGJyIGNsYXNzPSIiPg0KNCBm
aWxlcyBjaGFuZ2VkLCAzMDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKTxiciBjbGFzcz0i
Ij4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8ZGl2PjxiciBjbGFzcz0iIj4NCjwv
ZGl2Pg0KPGRpdj4NCjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250LXN0cmV0Y2g6IG5vcm1h
bDsgZm9udC1zaXplOiAxMXB4OyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogTWVu
bG87IiBjbGFzcz0iIj4NCjxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBuby1j
b21tb24tbGlnYXR1cmVzIiBjbGFzcz0iIj5BY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyAmbHQ7
PGEgaHJlZj0ibWFpbHRvOmNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbSIgY2xhc3M9IiI+Y2hy
aXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPC9hPiZndDs8L3NwYW4+PC9kaXY+DQo8L2Rpdj4NCjxi
ciBjbGFzcz0iIj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNsYXNzPSIiPg0KPGRpdiBjbGFz
cz0iIj4NCjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KK3N0YXRpYyBDQU1McHJpbSB2YWx1
ZSBWYWxfbGVhdmVzKGNvbnN0IHhlbl9jcHVpZF9sZWFmX3QgKmxlYXZlcywgdWludDMyX3QgbnJf
bGVhdmVzKTxiciBjbGFzcz0iIj4NCit7PGJyIGNsYXNzPSIiPg0KKyAmbmJzcDsmbmJzcDsmbmJz
cDtDQU1McGFyYW0wKCk7PGJyIGNsYXNzPSIiPg0KKyAmbmJzcDsmbmJzcDsmbmJzcDtDQU1MbG9j
YWwxKHJlc3VsdCk7PGJyIGNsYXNzPSIiPg0KKyAmbmJzcDsmbmJzcDsmbmJzcDt1aW50MzJfdCBp
OzxiciBjbGFzcz0iIj4NCis8YnIgY2xhc3M9IiI+DQorICZuYnNwOyZuYnNwOyZuYnNwO3Jlc3Vs
dCA9IGNhbWxfYWxsb2MobnJfbGVhdmVzLCAwKTs8YnIgY2xhc3M9IiI+DQorICZuYnNwOyZuYnNw
OyZuYnNwO2ZvciAoaT0wO2kmbHQ7bnJfbGVhdmVzO2krKyk8YnIgY2xhc3M9IiI+DQorICZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO1N0b3JlX2ZpZWxkKHJlc3VsdCwg
aSwgVmFsX2NwdWlkX2xlYWYoJmFtcDtsZWF2ZXNbaV0pKTs8YnIgY2xhc3M9IiI+DQorPGJyIGNs
YXNzPSIiPg0KKyAmbmJzcDsmbmJzcDsmbmJzcDtDQU1McmV0dXJuKHJlc3VsdCk7PGJyIGNsYXNz
PSIiPg0KK308YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGJy
IGNsYXNzPSIiPg0KPC9kaXY+DQo8ZGl2PklzICZuYnNwO2NhbWxfYWxsb2MobnJfbGVhdmVzLCAw
KSB0aGUgcmlnaHQgYWxsb2NhdGlvbj8gVGhlIDAgaXMgdGhlIHRhZy4gVGhlcmUgaXMgYW5vdGhl
ciBpbnN0YW5jZSBvZiB0aGlzIGJlbG93LiBXaGF0IGlzIHRoZSB0eXBlIG9mIHRoZSByZXR1cm5l
ZCB2YWx1ZSBmcm9tIGFuIE9DYW1sIHBlcnNwZWN0aXZlPzwvZGl2Pg0KPGRpdj48YnIgY2xhc3M9
IiI+DQo8L2Rpdj4NCjxkaXY+4oCUIEM8L2Rpdj4NCjxiciBjbGFzcz0iIj4NCjwvYm9keT4NCjwv
aHRtbD4NCg==

--_000_70BA77FE045D4F67A61E030CFAACC8B1citrixcom_--

