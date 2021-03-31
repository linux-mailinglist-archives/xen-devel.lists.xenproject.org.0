Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D6434FDBF
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:04:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103821.197984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRXhk-0001nw-S9; Wed, 31 Mar 2021 10:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103821.197984; Wed, 31 Mar 2021 10:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRXhk-0001nW-Nq; Wed, 31 Mar 2021 10:04:04 +0000
Received: by outflank-mailman (input) for mailman id 103821;
 Wed, 31 Mar 2021 10:04:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NSS5=I5=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRXhi-0001nR-Mu
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:04:02 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 146fda41-ddc4-43e3-862d-8b7d8cc7a013;
 Wed, 31 Mar 2021 10:04:01 +0000 (UTC)
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
X-Inumbo-ID: 146fda41-ddc4-43e3-862d-8b7d8cc7a013
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617185041;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=s3Iudod1Yov6Fu0koWZ8vq7cE3y7ENAg8o8CGRUxzEA=;
  b=M3ULQ8M3I6nd7K0DnQ12UrcjZ3jACAc5fihTPf7qzXT0Gb/Ta8WZ4s84
   7d5PGOk6ypyjyFTWx0J+r2NAU4OfLTKGlrGMIFgHV92C/UaRSbNl+oEgX
   1LAR5QeXM1Ai6nUCbNRqQLgF09IuLm1mFPxa6XSzYM+eANEqNjgO+0f7l
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xAjDQw0Kh3wJ1Z77ni6oRFB4oqgT523frFpxMEfjhdYoHgo04zkzOdWDXoOx/a4DS62q1aGajd
 ReNXIaQHn6evHM1zxip2wrimloSRiBKXxcCdQhlilRqze919kpF84zL2zUOeeZTXAK7h6pkeHI
 W+laR36DobEtO91km+BHyPj+ft8FGiHdLcYYBfJiP8vcORLcPcO84xDwpE1PKrtC1TLdqtFhO8
 mjdIqWn5u52KPpAyHBCfeon6w2NyFtZck3sdUvNObtAbKgTxSDhNrLlZSmaKiCWz/3ntREvzRu
 tto=
X-SBRS: 5.2
X-MesageID: 41992517
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Slwpbqs+cpgoYgxNjveNgbLQ7skCrIMji2hD6mlwRA09T+Wxi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybde544NMbC+GDT3oWfAFvAG0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyAocf74zNTQRpxa6dmhj0JaDqzNkFtXgFJCd4YOf
 OnhvZvnDardXQJYsnTPBBsM9TrnNHXiIngJScPGh9P0mKzpAm14733GQXw5GZ8bxpzx94ZkF
 TtokjCyYiI99q6zRLd0GG71eUtpPLRjuFtKebJpswcKjDHghulaoJ7S9S5zU0IidDq0nkGup
 3hpAohItRS5hrqDx2IiCqo4SbM+nIP7GLv0lCRi3eLm72HeBsKT/BvqKgcVzmx0TtFgPhMlJ
 hl8kjcir9sSTTHpyj578igbWATqmOE5UAMvMRWs2ZSSuIlGdhshL1axmx5OrEaEhn37Yg2ed
 Med/301bJtfVSWY2uxhBgI/PWcGnA6HhKxSkMfoMCi0z9PgHBjz0cDrfZv50s9yA==
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="41992517"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUbY+cVPqVKx9UW8CtbW2z+iZ1fhaVf++A+/gFlG+qvXHXcZZpcC3Gum3NKLkIy3m2xjmK2MRdJqzlYUk43tQ66dZPJxPgKQ6wyYt2d7eHQZkW33yUSG9Qr8IVBLfORJf9c2RAdDsP6xC3A5s+5k2D/mM1Gcur6QuvX2RcVrrKN07Yl5WLn1+YrPG2+SpB3KMpFUH1+bnQmBA12YAWBHssLsSBQK+n7fPIZG8/xMOjUh50VRyccXc/89y5i8bu+U5ZEN/NFXkFiqDBjvZF4KWFtdBc7d+zme2ssN6WGDjCxHZWBiczURLgRZP4qMdNDqY1OFjkb4AQGOXP0utHCJaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3Iudod1Yov6Fu0koWZ8vq7cE3y7ENAg8o8CGRUxzEA=;
 b=PZm31+PR+HWDec9JL4vzrzhPnODl6r22OX9XnCDrBAho+fE3EwHq72r8k4MMG8+ScZnI1khaak25rjNhY8Iq655XZx5gQGntVL3vjeQGfwIYqxHI0s52iLB/RIG/d9sH3G8hoCCucZkh8nUAyGfsfUQWW9097+XxpgoLiA/68qZAPieS4Ym/JhC2ZE80Rp1bkRc8L7QBbTEgtolbrwyVv7lQAZ7hwZiUciOm5lMG7aM+6HOmr4rUKWzCuy404BpuJK/IarTUtRgYUCk+HSe5tkLR+YrTPNt3JHqFfjN6f4Bvms9xiJ2Km+GMRXis99f0CFo9L+0raSeDCtExaaWb6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3Iudod1Yov6Fu0koWZ8vq7cE3y7ENAg8o8CGRUxzEA=;
 b=Ytj0A/gYqb/gGEkn8nYtCDX5ifvjdqFcjNkHtrEYAzGXzKGwxMZWPXGYV+Duk693noN8GxWUFWn74WmOuHlc/Lq3JGlAUbKnwxyjdv5g19dC9dkWVtD/gYfDDk/PlRutVhPXl83x5uQU55u7Ivb/Ja5YqdzHDKT1P3Bnp9tNfVs=
From: George Dunlap <George.Dunlap@citrix.com>
To: Stefano Garzarella <sgarzare@redhat.com>
CC: John Simpson <ttr9droid@gmail.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: An error due to installation that require binutils package
Thread-Topic: An error due to installation that require binutils package
Thread-Index: AQHXI9X14mfwFU+FmkCbmbb49fg6DaqaymQAgACFsICAAS28AIABZNOA
Date: Wed, 31 Mar 2021 10:03:55 +0000
Message-ID: <2BBB0D5A-87FA-49A7-AA75-08CB20078D49@citrix.com>
References: <CAKqicRBsCxFY=A=RD6kHaZa7bFag+hmUkwAJc-LSYy8XvsbGPg@mail.gmail.com>
 <889B1827-1FEB-4AC0-9002-278337D19ED5@citrix.com>
 <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
 <20210330124646.jl4re5srmbzhkipm@steredhat>
In-Reply-To: <20210330124646.jl4re5srmbzhkipm@steredhat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cd4a1b6-d456-46a1-0705-08d8f42c4b56
x-ms-traffictypediagnostic: PH0PR03MB5701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5701D3488C3519B29A3B3DAC997C9@PH0PR03MB5701.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g58+KGVfE5BSbh5JjZOSThokSCN0sh1CunP698BmuAmDkIwr3VFphc69/arK9h6qGWAoPlz/8IaiFsWjxYUrdnTJvlh3IQAs/ttnOv/BIZbxyvvhauFs24p/FS5yWgoj3VytmYuJXOQovhCxvggJ4/6A1ABpiAujH05ZqKViE2yLbSjCdztyPs+rCcFDVWIYMLueMVBXoTmNGv1/Dbap8/hxgT9OrYNr/iWCGKdH2z9WF7N6qQ0y4LywbBHiAFSvelJoE+MLzH+Do22q4FyX1CKVvClk9br2szljsNwh5G5fQ3U48UFh7BRTBoag7K8jEwpALl7rRP/LZa8H6npeT/iGWbYf6xsxkFRKt5CPCTTxHTkaVKKTTjcQ6GmcY9YxePe/+tUdl5Sq7hPWz6Ibfi5W1CpvyRwKXn7ltLydfjB0f2GFUCoRJgbx1bNCXxi2AL/wp4rcgcoxV1FIeX5f49Lh4lfeYNQhRPZA1L0RA3pgYtZF/7Zc/Kg9ZMjmUDZL8XeqVqhni7RjeAN3NlmLOwbSjMlCv2VB/MC2lVC7UuLw1p4sHXJfPUnTB1vFl1Fbzd86J2cgat48FwEm9m8g3JHRZQCOX/dpyUvneZTrHFYf4sDLpN6WlI+Xj+0nwRQVjaVg1sDXrdx1Ee4XcltbAB0axuegFXaoSe4dcSb2fimdaX7wMtSWnzwJeUWyiUQIExbzvgsd+F9dsZBc5Qqfdu0bwG+CIPze3RiuqThgXwkAvlcZ4C4BkxGJcS9YdrHKL8oXjYhZ/e5XrOMwfKsafA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(76116006)(66946007)(91956017)(66446008)(66476007)(64756008)(66556008)(54906003)(86362001)(8676002)(316002)(8936002)(478600001)(6486002)(6916009)(6506007)(186003)(2906002)(5660300002)(966005)(33656002)(38100700001)(4744005)(6512007)(4326008)(36756003)(26005)(53546011)(2616005)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y3dOb3BkU1k5ejZBTDVvcXVRVTlTdkh1OVo3RC9pcVJqVm83aVNxTmFtMDdp?=
 =?utf-8?B?MklpZVFLVVp4VGFSMEZPd0crNWZnSEVsbWlFVmcvc3hGVzJwYkhUTGdIV1dV?=
 =?utf-8?B?Y1pJYkhoT3JSbXBDaTJzZHpRUnh6bjAzUnJTT0psNlJlRENQVmZmZitTWE93?=
 =?utf-8?B?QTNFeDdCSFh2MXJuMjlYR3ErVXhaU1lORTV2dkNUbElJRE9BczZqVkluT0JS?=
 =?utf-8?B?R0R4b0xLUmhCb1k1RDBpOEpKS1ZJWW1LWFZYMlJVWXdkQURHbDFhcEpFOWR0?=
 =?utf-8?B?WUR5cnhnQ0xrWUJaSmVLRjl1TnByN2JWS3ZPNEV5V3JuM3V4dFZCRDBEQnFz?=
 =?utf-8?B?SjRsb1RpdUJuRXlqVGVaOFJIR2tHZERURHJZRUc4THF5S25jVmt5bjMrTEJN?=
 =?utf-8?B?czBpaHJpSVRINUV6ZDRHK1JXN2tqMEFXcVdaWjZNbTFCU2pKQmw5YnZ2Rkhu?=
 =?utf-8?B?QWlzOHkzdHRGSEMzWVNvRjhpclJaM2N6VjhXemd6VmxjTDRZS2hvZUxQZVRM?=
 =?utf-8?B?VjlSMkNBT1RWNG9XV3JKZS9yYjJUMjBxdk5uWTkydlltUUQxL1oxT01LZUdC?=
 =?utf-8?B?dStFZXBQVDhKOGVsNUZGS1kycm9ydENrOGFRR2hqaiszQ3hnQXhJT29RNTBu?=
 =?utf-8?B?eld2N2JQbi9qdm14OW1ZdndyUmVnUUNjNWRGeGJjejVuQjFYOG1xU1hJU1dV?=
 =?utf-8?B?Z3RBaGZxMUVlUm5LVkNhU04ySzVPOVVzVCtnOXB0bWg1bVJ5NUpZMmVhZHBR?=
 =?utf-8?B?M3RpNG1nMnNXVlVsaVNpYUdBRHdWQVllQmdqdlU1dlVhL053alphcyt3QVVP?=
 =?utf-8?B?NXJEaUlLWVJHVHpmMFd6ekI3czhsVHROMEZTZ1hBb09VbU9pVkZIZktaVmVS?=
 =?utf-8?B?SmJZeHRiYWthVkkrSHlNampJN3VNMmkwbWRwVmRiY2ltSTkrQ0FPbGVyUnBC?=
 =?utf-8?B?Qm1ZZzYwK3NvaVJiWkhiVEp0NmFxTDRhMDhsL0JVOFpReDlCTWp5YU5paDZu?=
 =?utf-8?B?QzZrT0VnWEllalRlTS8yMmR4VnpLWjdjMEN1aFV4R0EzeVhMaG9LYlBRZnl5?=
 =?utf-8?B?MmRYNEFaSFY1MGo1WFc3Q01PNVlqbDU5bHlmUTNFMHJGMzNwWFpTVzArMUc2?=
 =?utf-8?B?dXFjZlBGRVFlbWQ4V2hkMFdXb0ZWSFAzWTdvaWdIaSt2WHdSeE85TE5jUzVJ?=
 =?utf-8?B?ZFJmV0h1WitLYXRUV1poWmsvSytFZEw5cDhDSmQvVGhyRTJjTzhvOFdNU3lL?=
 =?utf-8?B?MFhLWUZRM1dVZGVqbXNjN29IMnNBaERFRm50a2k3M2s0blNNd1lBeFJrRDNM?=
 =?utf-8?B?WEN1RXV6RFA5cXJtdTd6dVRkc2paN0dleldPWFdTZUdoNWhxSUdKZC9Tdmtu?=
 =?utf-8?B?cWkrTFBJUDUwdHZFS1ZYYlpLSnBPNGZvaGVjakx4WUVtVUR4Y1VMdm1Cd2hX?=
 =?utf-8?B?U1pnSFg3eStFd2JlZVlCckVpazlaMWVzNEkvc2EzZkU0KzFxY2xwaE9UeE0y?=
 =?utf-8?B?RlpqWkY2S2ovM3dJL1BrVk1wQUNLSUpRUFhBeXhCQ0RIeGdFdUJQZGQ5aisy?=
 =?utf-8?B?UWVSZUFjTzlNTExjanc4NWJ6amszaE85N1ZYUGZrbjZhMUJIR2l2N1l5ZHkv?=
 =?utf-8?B?UXNONklpLy9pbkpYU3RiVVloL0xPQW4rM3c2RU1TUHdyUjlJM3FZMDg4dk9C?=
 =?utf-8?B?dE55WmczSDBnWTV2YXBkRlMxUEM2ak82bVBCWmp6aGZPWWkzZ3R6REZOVnpL?=
 =?utf-8?B?eVUxRFBTd0w4U0FST2s1SUo4dlVHTS9idWRab0xFRE4rUkJNZ2NrcTlzZUhL?=
 =?utf-8?B?ZUM1aGxXNDk1Y05zaGFMUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD23ED65FB69674587C620ACEADAC540@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd4a1b6-d456-46a1-0705-08d8f42c4b56
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 10:03:55.0671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MzihS9mK0YNAoT+MaOTg5y+4OzXG65eAtvNjfvezG+0qe+fyxZLVxmeyG9Isz1iBhAoqo1vhjcq5RbaRmvasMsR2nkOiGX9RPeQjY7QAzP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5701
X-OriginatorOrg: citrix.com

W0Ryb3BwaW5nIHNvbWUgaXJyZWxldmFudCBjY+KAmXNdDQoNCj4gT24gTWFyIDMwLCAyMDIxLCBh
dCAxOjQ2IFBNLCBTdGVmYW5vIEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+IHdyb3Rl
Og0KPiANCj4gSGkgSm9obiwNCj4gDQo+IE9uIE1vbiwgTWFyIDI5LCAyMDIxIGF0IDA5OjQ2OjQ5
UE0gKzAzMDAsIEpvaG4gU2ltcHNvbiB3cm90ZToNCj4+IEhlbGxvLA0KPj4gDQo+PiBLaW5kbHkg
YXNrIHlvdSB0byBoYXZlIGEgbG9vayBhdCB0aGlzIGJ1Zy4NCj4+IFRoYW5rIHlvdSBmb3IgeW91
ciByZXBsaWVzLg0KPiANCj4gSXQncyBhbHJlYWR5IGZpeGVkIGluIFFFTVUgdXBzdHJlYW0gYW5k
IHRoZSBmaXggd2lsbCBiZSByZWxlYXNlZCB3aXRoIHRoZSA2LjAgdmVyc2lvbiBuZXh0IG1vbnRo
ICh0aGUgcmMwIGlzIGFscmVhZHkgYXZhaWxhYmxlKToNCj4gaHR0cHM6Ly9naXRsYWIuY29tL3Fl
bXUtcHJvamVjdC9xZW11Ly0vY29tbWl0L2JiZDJkNWE4MTIwNzcxZWM1OWI4NmE4MGExZjUxODg0
ZTBhMjZlNTMNCj4gDQo+IEkgZ3Vlc3MgeGVuLTQuMTQuMSBpcyB1c2luZyBhbiBvbGRlciB2ZXJz
aW9uLCBzbyBpZiB5b3Ugd2FudCB5b3UgY2FuIGJhY2twb3J0IHRoYXQgcGF0Y2ggaW4geW91ciB2
ZXJzaW9uLCB0aGUgY2hhbmdlIHNob3VsZCBiZSBzaW1wbGUuDQoNCkFudGhvbnksDQoNCklzIHRo
aXMgdGhlIGtpbmQgb2YgdGhpbmcgd2UgY291bGQgLyBzaG91bGQgY2hlcnJ5LXBpY2sgb250byBv
dXIgcWVtdS11cHN0cmVhbSBicmFuY2hlcyAoYm90aCA0LjE0IGFuZCA0LjE1KT8NCg0KIC1HZW9y
Z2UNCg0K

