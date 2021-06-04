Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2864639B99F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 15:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136837.253591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp9f6-0007Nr-I9; Fri, 04 Jun 2021 13:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136837.253591; Fri, 04 Jun 2021 13:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp9f6-0007Lg-ES; Fri, 04 Jun 2021 13:14:56 +0000
Received: by outflank-mailman (input) for mailman id 136837;
 Fri, 04 Jun 2021 13:14:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=md+M=K6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lp9f5-0007LK-Dh
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 13:14:55 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c41df7b8-db8c-4255-98f8-afb3425fe811;
 Fri, 04 Jun 2021 13:14:54 +0000 (UTC)
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
X-Inumbo-ID: c41df7b8-db8c-4255-98f8-afb3425fe811
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622812493;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nZPLkxmv1q81OmzcdiJPjiQmdZprjLsJrdGSBk7iHtk=;
  b=WBx8uDmkbfIdrxZqF8b6+jfLUGcioTLJFOAGfE50HahoFTntaiyiyLFc
   rMh0v3oZWKQpFWjTYrszhSh/Ii3IU/mO4EeYmpt/AVmEr4rV2fKcKAzD9
   cH/N060+Jj2uJyoV5H1p6MqE8qy7/Na/LVGvq8CwN6HmhLYhyvrPbvoG+
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tIEtPflWbvNo4okbVSKQbsTxG/iF8PzCCfzMlpvCMXzuiM31gCfLglhAReFLN+iAA/T7GetC73
 /zvDbtSJBhPItQit6YFTd8AWnpBViNMzCHnEXDlvKk/OKOzOOMaLmAUKWVgGVMnwosCRwsgYKv
 P51mQJbyIjNzBrQoMO/4lFivrdAFMCPS4XMQhQgK8vVZ9wgaLBjxhO5ILevP+of9kJtQBOcDfn
 5nYELo28M3qtEL6tPj45ZDA9Wr5jDCB6Z/BgKMa5sjIChP1OkxroZngSdqNw5inmwNlMEZbOfX
 eTw=
X-SBRS: 5.1
X-MesageID: 46957222
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rGHuXKq1ROCnUGgtYNues8YaV5viL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXbsibNhfItKLzOWx1dAS7sSrbcKogeQVREWk9Q96U
 4OSdkHNDSdNykZsS++2njELz9C+qjFzEnLv5ak854Fd2gDAMsMj3YbNu/YKDwNeOAvP+tlKH
 P23Lshm9PUQwVvUi3NPAhiYwGsnayvqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+eemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aSSARcR4Z
 3xSiUbToJOAkDqDziISNzWqlHdOQMVmjjfIJmj8CDeSILCNWgH4oF69Pxkm1PimjsdVZdHof
 52NiuixulqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MEiFNM8KuZxIMvW0vFtLA
 BVNrCX2B+WSyLtU5nThBgi/DVtZAV6Iv6ieDlMhiW46UkjoJlJ9TpQ+CVEpAZ0yHsUcegy2w
 3rCNUbqI1z
X-IronPort-AV: E=Sophos;i="5.83,248,1616472000"; 
   d="scan'208";a="46957222"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKTOSZKuF8vfIQQk8Y0m8Vqj6Kd18UGYqj4s+N6VoeZj4qTgfLFrMFqo/FvmBp4NOdo1odK1JJ1PeKOobR/HOPquMD1fq7D5VNe66d1K42w6NbIK/mr8d/RA7xBcgAwB5GDcGb25I20VOviZBPb3V+LRYT9aCT5bWXUlLt96OMwBcGrpNPO3hWQaAdUK994gKVyxN7NEyVvVnQ3LnzAI61uS/MJZzkKtjj4XwxSbfq2bYzrw9/X6H6IkKqt18oqu1yGjBm0ohbDmHEWpfM/Z+gSbVYOojnf80oU7faK/VoDjI+rdlScMpxSfH6pSnlEFAHJCX9h0vOj3ac7ztLsMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZPLkxmv1q81OmzcdiJPjiQmdZprjLsJrdGSBk7iHtk=;
 b=ByePTsnGmQBLw6dWMfo+Z//OvYPUQnqj420kzP2isVYS70J8ExVVdapCxl13JN4w9r5BXmSp24w3SSmRaKqNS1migeoEoI1/xZZEkt+ABdOzMcDeecsEQ/T1WYYfra5F3gKJI+3m86FVLpRfptZSNTAwr6pV6rJ28L5T1KOpnLCZ1ywPO747ZzjcT8QI12AcFDZhRbe5mXmmQ0uoTzxHIfyshT+QU/G+JicBGjSjkUGimlDGyGM45q0MDroefXklaIOSiTdtt19bROEUGYNSGff4SZap9YoGbZpu8kHP/Tpm+jT6EK6mMOkpAeSHVeqRqRDl7m8xW26AHOrVIAv5Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZPLkxmv1q81OmzcdiJPjiQmdZprjLsJrdGSBk7iHtk=;
 b=ZWIuy8Ozkh2khG8spyOQpXwEuo66uKswm4xMfottJWxH6lM4cspqd9npGCSZnrq7xVYp+H5WZse4zihPjaNmdeQzPyNkF49cvKyoMPd2ePvY66BavMpb02boEQTWkyhbVIVdh2zCCZMgyPiHOcpV/uR/c0BfaZ0GZyncfe6wbUU=
From: George Dunlap <George.Dunlap@citrix.com>
To: "security@xenproject" <security@xenproject.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Jann Horn <jannh@google.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] SUPPORT.md: Un-shimmed 32-bit PV guests are no longer
 supported
Thread-Topic: [PATCH v2] SUPPORT.md: Un-shimmed 32-bit PV guests are no longer
 supported
Thread-Index: AQHXQnYPkkGqZKBnHUKbkbouhpf7JKsEAkQA
Date: Fri, 4 Jun 2021 13:14:50 +0000
Message-ID: <91F55D14-00F6-4609-AEF6-2BA3D73408D2@citrix.com>
References: <20210506124752.65844-1-george.dunlap@citrix.com>
In-Reply-To: <20210506124752.65844-1-george.dunlap@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e83dd725-b2ff-48da-89ca-08d9275abbd9
x-ms-traffictypediagnostic: PH0PR03MB5816:
x-microsoft-antispam-prvs: <PH0PR03MB5816D632C56EF6E4BEAE9931993B9@PH0PR03MB5816.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GlW9McuVWImw/GMX1jGFbKlG9BqPT0UXV1JpxPdOQmPnTuMjAvSdvfC2uLkF7I4eEPaCOgT7XhbRMz/7RH1r7htRTCR/377xeNQxfoz4AkC/Gr9Iix7SIzbT4IzFjkdgb436Oa44QfyaWE76Nk2MEvEu6B204awLQPBGHwnY7IPB2RdKQCgcKwKscMW/FmRnTQB64uJ0fJUjb9ZTKgWMeIem6LvJm5KG5kcniPowwPR20JwSkyBXWHzTim6v2Lrw929wdf98NjDxEAcICVWSRjtvq+aHkV1U8gYSVdYegDbJDr7UHzhPZ4ahrPv8oUOI1A5GMX0MhA/j0xrU2M4Bj7adQWnVnhDDUfadF65XCH5BKMYT3T3IwBVNJhn2LLLh7RRVuFWY4CtQPESVm1ELoK/PxAYz6V3QmVJBJjt45pQDSFdwBzPqja+Y41UxtKe4fJgrqXXErNrOohees6yDqAzRbgKQeoAJZOeLhHbHdJzEKOvNnKGP0JjWbR2dMP/mDQUUHMGlogojxIO4w8W49oXwje1LDZHKU8aR5hwGHFupN1m02kEHMYrID1XwMAvKQm0zahSYbsvseuL893Sclme9MZtPpBgSJTKHTCZa2Yq0YekY4du6Ur+oQuXeTrxuTa+Q60PZOL7Cz1Tt/HLc0w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(5660300002)(36756003)(6486002)(2906002)(122000001)(2616005)(4326008)(26005)(53546011)(6506007)(4744005)(8676002)(86362001)(316002)(478600001)(6512007)(91956017)(66446008)(64756008)(66556008)(66476007)(33656002)(54906003)(66946007)(71200400001)(6916009)(38100700002)(8936002)(186003)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RHkxQ0lkVnBkMkZaVE40RUFhZXdXSjhhZDlJdTZ2RXk3WnJxSWlrbDRwYUJm?=
 =?utf-8?B?aks3eDB2THNKQ2hRYnp0V2xCZEFoNzhqSEt0cGtHUzA5YXg3RHBya2JSRDVP?=
 =?utf-8?B?WXg3cnY1RC9XNmxDWFM5cGQzY284STlySjdQS1pyMkdxRjB2UHptVkZ0QjJZ?=
 =?utf-8?B?VTFQd1ZkR3d1QVdxUklKUlZoM3FRMWhLOXNpMGdEdllVblUyVlFZbnRzcEM2?=
 =?utf-8?B?b01CaWhKdGdVZUVvdTR2MHU2VDR2b1FJeTd5SzJnZEhqT3hYd2ZMUUlYNnpQ?=
 =?utf-8?B?OGI0UmxGSW1rd1Z1UnB1dCtkNkkrY09CZExCTjUrd1R4bHJRNXNkcVk3RVg2?=
 =?utf-8?B?a2F6bGtMUUoxY1J6V1dHYmNiZ2VES0ZDUWxKUjRKMG5RZVNEK3plUDFuZ2tC?=
 =?utf-8?B?Q3FqeXNPSk9aRG41S21zVmF2TjBadW5HVm1HTDArTk1YUnBaYWZ5RVhMQ1E2?=
 =?utf-8?B?K1RzSWRWbjJ2cUdFVStOWGdZMk9Cakt5M2l6Wk94aE9NSDFLRmpFWGhUeEhp?=
 =?utf-8?B?d3hCNVV1elFjU0o5YzBZRnhuN0dQSlhwNlVnQUdLWUk1bTI0cUY5cGtvUUJO?=
 =?utf-8?B?b1hkaytKakhkL3lSeGRFVUF3Qk5YL1BSdVdlZUp2eFBVY2hZUG1LaFVNNGtY?=
 =?utf-8?B?VHl1RUtyMlpDa0tESzI5dEpDclZmaXZmS2VDaHZldFlCUWVaaUpuT1NneG04?=
 =?utf-8?B?bzZnZzFuRGR4OHpWOWFzQllJS1NFWnlEamRJOFRRMWI1cjB6T29lMms2K3lh?=
 =?utf-8?B?ekpWRFFMckh4bTRwS0U5ZW5WYU9GNHptekpkUE5ISitTRi9XOHFuc2NJeWg1?=
 =?utf-8?B?Z3Jpa1Q1eGhIRmpXSncrcXhHK0VLUDhBaVlvTTE5ZVNrcUI5Zmx0RGVacURS?=
 =?utf-8?B?WXRoajZyY1ZRcGdwQmVKRlVkWVdyU1BmU0lLcW1mYit2aURPNkpCckZzVjZa?=
 =?utf-8?B?ZHRwRXluNXl1N3VsbVJaSTl0cTNSb0NDdmJRTzkwZzU3R1V2RmNGb0tUMHJP?=
 =?utf-8?B?Ukt6TmR0SU5lSGNuV0lWbVd4ckhqdER3UHYxSTVLWFZic0M3andEbEJ1WlJu?=
 =?utf-8?B?RzZqbldLVEsyUld0NW9USlZGTUl4RDZ3c3dBbyswUmlIZyt4ekpDVC9KbSs4?=
 =?utf-8?B?RFlYTUxES3AvQmM2b0F3VzI5bDU5Zlp4UTVHbStOd0R6bUJzaWQ3eGxRbUFt?=
 =?utf-8?B?cXg1ZmhYZ0pKWUlrWVBnOHFoOXZpclRiNzlIS0RiNnZ2R3h3RThZQ3RnR2NY?=
 =?utf-8?B?Sm5JajQxWU1pdW1iMFZpdXNVMVJmNnJzMXNNampGTDV5TUwzRTFWM29XUWVD?=
 =?utf-8?B?Q2ZhMFhmeGtCZ0lQYzVBZGYyaHJjS3V6VGFqRTduTVd1dkNxMkhtR1VENkw1?=
 =?utf-8?B?eTU3UHJvSGlJUnBWbmhzZ2Q4cTRBajN1bTR2ellkWmxZU3Q1VTRSVnRxZXlG?=
 =?utf-8?B?eEZDdEVCWVErb21oRVRNVkRxRUNEZjc1OHZ3VmVBUnFxdWF3c0UvellBRENY?=
 =?utf-8?B?U0VXRUFRZEh0clp1ZnkvemtiTENBQ2hRZHZYV2pucUtsZTNsVXU1bmhYOENJ?=
 =?utf-8?B?cWhKK2lNSWRTVkFhYTZBVDZXSVhmMVJFT2JHMjRkRHdlUU94QmJDVk5vQWh5?=
 =?utf-8?B?eUNZN2ljQlY0U3FPLzZWaHdISGpZaTlHWFVkZ0hRMjkrOXZUSUZvREZQNDZQ?=
 =?utf-8?B?b1F0WjIyOXBlSmZYNDhKcHFrWWhYMVBTQmloMUxVb1hwRm5RVVQrQitVWVVp?=
 =?utf-8?B?L3NPWEk1WEpJWmdEKzdxcEQ5SmNmTEE1K2JFQUxaV295aUpqb0duN3I5QXFa?=
 =?utf-8?B?aG8waG9MYjFMazJhaFNKZz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA849F3B4B6FC3498D2B06EFE36B0292@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83dd725-b2ff-48da-89ca-08d9275abbd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 13:14:50.0815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9++swgrR0+4H1eN44PFquwx7wQfcVQ4Pxc6iRGWL8eFN9c0B5rKL9lOI7o2Rm6OZ5auNa4GXv+tQeCYi76pCHTpN/2s0mEo1/TgEAFG/zaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5816
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWF5IDYsIDIwMjEsIGF0IDE6NDcgUE0sIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgc3VwcG9ydCBzdGF0dXMgb2YgMzIt
Yml0IGd1ZXN0cyBkb2Vzbid0IHNlZW0gcGFydGljdWxhcmx5IHVzZWZ1bC4NCj4gDQo+IFdpdGgg
aXQgY2hhbmdlZCB0byBmdWxseSB1bnN1cHBvcnRlZCBvdXRzaWRlIG9mIFBWLXNoaW0sIGFkanVz
dCB0aGUgUFYzMg0KPiBLY29uZmlnIGRlZmF1bHQgYWNjb3JkaW5nbHkuDQo+IA0KPiBSZXBvcnRl
ZC1ieTogSmFubiBIb3JuIDxqYW5uaEBnb29nbGUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gLS0tDQo+IHYyOg0KPiAtIGFkZCBpbiBL
Y29uZmlnIGZyb20gYWR2aXNvcnksIHBvcnRlZCBvdmVyIGMvcyBkMjNkNzkyNDc4ZA0KDQpUaGVy
ZSBoYXZlbuKAmXQgYmVlbiBhbnkgb2JqZWN0aW9ucyB0byB0aGlzIHBhdGNoLCBvbmx5IHN1Z2dl
c3RlZCBhZGRpdGlvbmFsIGFjdGlvbnMgdGFrZW4uICBVbmxlc3Mgc29tZW9uZSBvYmplY3RzIGJ5
IEVPRCB0b2RheSBJ4oCZbSBnb2luZyB0byBjaGVjayBpdCBpbi4NCg0KIC1HZW9yZ2UNCg0K

