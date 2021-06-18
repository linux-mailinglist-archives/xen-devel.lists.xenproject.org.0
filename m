Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8F53AD1E0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 20:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144945.266727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luIya-00064Y-JU; Fri, 18 Jun 2021 18:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144945.266727; Fri, 18 Jun 2021 18:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luIya-000621-GI; Fri, 18 Jun 2021 18:12:20 +0000
Received: by outflank-mailman (input) for mailman id 144945;
 Fri, 18 Jun 2021 18:12:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luIyZ-00061v-L8
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 18:12:19 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efd74c3c-c37e-4fdf-af98-c206d14e8993;
 Fri, 18 Jun 2021 18:12:18 +0000 (UTC)
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
X-Inumbo-ID: efd74c3c-c37e-4fdf-af98-c206d14e8993
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624039937;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xOlEkVzRwxXh1MTcfFjDKTK8VFesmToA0glAgk6iTn0=;
  b=NPRzf8Ej51yxaVN3WH4wGj+bhzYC7KDf+VPyxS9Ft0oBbjCUFPZv+/PV
   8sm1wkV2+fHCBQyzdFFcZYIdyPN6EX8grbLQiCGgbIh8lIXAHUpud1XmQ
   mUvhqxFR6BkG4UCWgIyUba1t+fP+kHfq25dZbj607+nw2s9pESurMIKrT
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UFPVzFUhIcoa/KSGOzMXK8efDs0nvwEmNODyCHCDlMSWMDFchXOgcL0awgTJF4k8Y/85C+oHs/
 pah0GR3owMFWc5Z0xO1+kJrUdXiR4jq1jmbRYMJHd/5R9CU9HSNItz/WHiEjFdkt++KoKS/Cqe
 SyEHFR/LK7HLTETuhKvPoWo9fIxl9NCypp5e/xi8gXzjOWSqmLDrgOPzRi0lsbBSPjFd1V9ErU
 i4Nnp35za62P6hcFSSZd1ULC0+UUfqPFVJWx3vQVeicjvwrhA1MS9tUi6hlQU4eSBCHJI6SDW6
 wDk=
X-SBRS: 5.1
X-MesageID: 46851490
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:N0T/WKAXpsIks73lHegSsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEEZKUmstKKdkrNhQYtKOzOW+FdATbsSo7cKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj6Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrT3GeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZhzU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUlZ1TChkFwnAic0idtrD
 D+mWZ4Ay210QKIQoiBm2qr5+An6kd015at8y7DvZKpm72HeNtzMbs+uWseSGqE16NohqAN7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0UbWOPAIUh3LD30XklWKvoJhiKo7zP0d
 Mee/309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv0kso5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHrYndJNvaMaDg6aFC16
 gpfGkowFLaSnief/Fmhqc7gCwlaF/NKQgF5PsulKREhg==
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46851490"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD8DBc4FFPzxN2crfT3/YSEzhSQKYkOYxLfE4bBbJfDxh4nT7JnVLVKZBWmy3xbcfZ8AD+CU8f7B52D+mEI6zHrZFE5A4wATagergQ1bnm5t2Nnabe1e3tH5ZMGmQ31EU97BTo/TpSyWX0HPeVMaM45f/wqdX9uHi+kSscyVXlyFjmbopJI6idI8DR5C+uV6nH+BaQArvDjwbRdPYs0UAYO1SQx4ce/h53zOyim0kLjyzj9Tx9aBU9yquuZI7RKysxXns6k3X7jimF5wZ5C++GygEf6oUUzhW46fGVgVIkTir0PewO8jL0Jza2USMkK9253rjckyyXawxaI36RQMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOlEkVzRwxXh1MTcfFjDKTK8VFesmToA0glAgk6iTn0=;
 b=Iu+6q8mRM1SFADjFfIDSy6yIbPUJQeJSKeQwS2Csskjd0dyabTNq3ZXuzdsqt0svcbC1wjuUVXeeoVALdhwHfsBdlziBLoJ+TPYdEY6IuGIqdXKn3UYRlYfIdlRhk54sXEARVIvWDxKj2RfD2482ieiAPQRPTKIgASJk1pxgQgZWZ71lkyuy9lLx/xZ/ZHuX8nC7QLBeuH9fOFUQjTMnoVPmcqN1NGrN1nPgak3+T7AL4BfBFt2ibLo0af93/eA1ke4a1DNJvV8+tJZUy7S2XBnCLwMCdIMCBLE+PRcPcE8QXsQAgOoGQ/oMIw0mgOH0mnITeQ8R4A2yuvck8CVsZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOlEkVzRwxXh1MTcfFjDKTK8VFesmToA0glAgk6iTn0=;
 b=OhVIBYbs9PTGczZC8pVxL7BCwgIFfwJe4lfYmx6HFdMgRPsSkrO36KENOHt0Pzlxeq1S+SkBUrNPQEjppUHFNDKLBMdj8gZKHkevVr9XoWsBgj+0wZUKUWWMkQBLo63ewszV6eiSX9vewtkYymGH6AR1lH7Z91wRrQ9FRaruWc8=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 08/12] golang/xenlight: add functional options to
 configure Context
Thread-Topic: [RESEND PATCH 08/12] golang/xenlight: add functional options to
 configure Context
Thread-Index: AQHXUNzBxrtRVA/FskCGl/j6ZWY3UKsZ/xcAgAAG0ICAABOXAIAAC7AAgAAUAoA=
Date: Fri, 18 Jun 2021 18:12:11 +0000
Message-ID: <EF3300BF-5BE2-4C35-B196-D94224619629@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <dc5cd6728e8477c9eb3ba75a55c7128da46a86ef.1621887506.git.rosbrookn@ainfosec.com>
 <EF069373-26FC-4151-9CD9-6B8C48D9AEB0@citrix.com>
 <YMy29arbPMnPI/+W@FED-nrosbr-BE.crux.rad.ainfosec.com>
 <8727719E-9548-40CF-A186-14E2ECA3801D@citrix.com>
 <YMzRMlaHapLn7msf@FED-nrosbr-BE.crux.rad.ainfosec.com>
In-Reply-To: <YMzRMlaHapLn7msf@FED-nrosbr-BE.crux.rad.ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab484d54-6136-4489-e95a-08d93284983c
x-ms-traffictypediagnostic: PH0PR03MB6349:
x-microsoft-antispam-prvs: <PH0PR03MB6349F80C5174766FE163A06C990D9@PH0PR03MB6349.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RWxDS5Q/gypYsTkkbq/xtJ+SM00xw0Tu07ClMV8dCquyyWacidZ+5FKNq5YECeKHWiXp2g6QOPRxFffqXXNyhlafL110eCkcExPzWDoKGz99VwYItf+fANNIIziAPD2dDRuGbZ5aFonjjy81GNwtjjW/Y1mmKJ0lqmggrF+qEZ+6tCMxzGOWs3jHHItRszYb2+l4o+GX6y/v5+ESM6Dceq7RyqkziVAjkAjHF5k8zppnrORmd9GT3VuMsND9F8C/0DWA+R/T0H7GWrCdUr4pWgmVEdQB0cAjQ4eFJagZM57WUmWSONj4M7y4kRjMr/mI5Xd1YAH562SYYi3+zmxRG8DYqxb9VlzLqn8r5TZxz/z61XWZsn9787kiPtyBwfmehOTHrtbnxrfyW2UZV1+PpmRk3RTeyncOPY3WoDgdLaTaIx9hdoJRZBDPmf44Deuvp+nqGc7fPmIZ1zDOwQdZwMfFNms8j8zkIuV+YgJX3BmLswJJEcI/XpsBOiwC81iE+9k0/cFUaSHluFxwgMVR/OXpzPGqEpJpuD7muwFem8uPg7KzDd4S7oyT+ghZZKFlBorivBMuO/0M5SeTl4yQMeVT6upHAWz3C5AxReWHD/KEMuQqqCpJMNHSsZdFgmzy1Ux0mBrHa8VS/iEjcPQdx2iXDa8aqObZHJYOi8oBqa42Fhth5OrLrzwN84P6oA4wvC0j4RrUrWDri8fWwxmYOHNh6OEPUZ66laF/oWx9edkdZ6BORrz81htkl8J3B8cvRH37gZ6bKM+XJ9QfrGu+/ENUuc7y8WorDO8dmSKaS5U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(66946007)(54906003)(83380400001)(66476007)(66446008)(2616005)(478600001)(76116006)(91956017)(4326008)(66556008)(64756008)(38100700002)(122000001)(966005)(71200400001)(2906002)(8676002)(5660300002)(53546011)(6512007)(36756003)(6506007)(186003)(6916009)(316002)(8936002)(33656002)(6486002)(86362001)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STJNaC82VUJSSnNqWExlaE9HYXUvaTJhY0I5b3VkODlDbXZFL0R5TVpuL3RU?=
 =?utf-8?B?TjdXdmhvejlXVlhZVzBaUU0vVDlLYUFnUTdWb1I3VWZ4eUp3M1k1Zno5MVVv?=
 =?utf-8?B?bmFRWklBL2U5d2FiayttWEZkQUdkNkoxSmQ1L0VkUDJVWDVienlKSkRXQnR1?=
 =?utf-8?B?dm1hSjE3NVFLd3R2TUd3TElTL01RY3FSUDVSMWhIOEQ0bnNqL25PUUV4OVY3?=
 =?utf-8?B?N3NMVjFPTE5JR3VBQkg5SzhCM01CcjdwQmFDVkVRbUp4Y2ZTOUJGQXprNUZx?=
 =?utf-8?B?U0F4N0tma2JNVWQ1UGhibzhBUDlYNE1zbEpKZkFWQy9ZS05Qc2ZRTTNIRjZG?=
 =?utf-8?B?U0RjaDl1enRFTVh1UGVpamxKTWtORGs0aUMzUHRpZjlFNThveUNyMEZIaEo1?=
 =?utf-8?B?QkloSWRZUUpYc3lxSms5OW9DSGVGcVdpYk8xdDRKVm9UNyt4YWxXc1Joc2VE?=
 =?utf-8?B?dTEwQnBGbFlrei9YcXcvUlJWbmc5YlF4L001Q0doREhZRmNRYlV0a2g3Mk9Y?=
 =?utf-8?B?akV6Qm9va3pzeDVSam5YM1pjdzE4NmJ2Z0p0ZER6bitPemIvVkJaa0xvczUr?=
 =?utf-8?B?RFdHZFEzNUxGc2t4WFlraU5ZM1BuR2R1MGU5QUVoVnNyZytRL3RKYTJYY0pZ?=
 =?utf-8?B?eWk0RC91WUZpUkRYeFlzQ1E1VElKTzVTNEtiYWVvb2lnOHJhcC9OMlpHcVpo?=
 =?utf-8?B?ZldpY0ZJc3JFa3JNRnNSUDdoV1JqcTlrWXpwdDl4K1BWWWhOWWR3WjZvYVNS?=
 =?utf-8?B?bmR5UThjNm81bVg3bEpqSk9RWEpTT2RZeTNaWkxVQUwvLzQ3TktFWWRBbHpP?=
 =?utf-8?B?ZGZ4aURVM2YzeUVVQ3lnYVF2NmdENEo1OWRhajEzbGpIc2FhZ00rclVTNVUy?=
 =?utf-8?B?THdTaHlVdVRFZkNydndBVUZQTjNhbVJMNHZTWXladXBaZ3NuRzFOVGpwajZ4?=
 =?utf-8?B?Rk5Gc1hvcWZwTk5Gd1N3NzdlbUpHbXN5YzlHSGUvZG83MUx5c0FUVDhSNDB3?=
 =?utf-8?B?cVcraSt2SkZZWms3SjBvcWJocHBEakxhdS9Md3locFI2UlFwWGdnWW5kdUhH?=
 =?utf-8?B?WnhZNXR0eHlQZkh6Yy9XeTRDQ1JyQ3Q1KzloMmRMc0RGSDQzTmFQN1FGODZ2?=
 =?utf-8?B?dUNpT0VhdmNFVDJBYWZFUVR5SWJkYlpOMkhyM3VFWjdjWGt3V2hJcDNvaXQz?=
 =?utf-8?B?MXR1clllNkNzRVRjSlB6Z1RYU3ZTN0NPc0RHcW0wNEpaeEpwS0pjMmZzejB4?=
 =?utf-8?B?em9rR1RabjlRV1JLM1NaS2dKd28xN2tQT0orU2h3SmYyV1VwTk5tOWxCMjR3?=
 =?utf-8?B?d2lsSzFLWjF6ZjVkd2l6MTJHYjFqdnRaNGZLUko2TWQwejdtZXZVVWFOankz?=
 =?utf-8?B?QVpBRXJJZEozUVhycTF3TVlHNVBCbFJkK01PeVFLc205aktEa1lGUkh0Zkgr?=
 =?utf-8?B?ZWR3dENBSXQzb0ZZRFg0bHM2aER2b1ZFRTgzZ3BUbit5T2M2Ulg3REl4WVA1?=
 =?utf-8?B?K2ppOVdqOUxERTdaK1F6bHBDemFjZlpmdDE5WUtBSysvQ3FJTTZacFVxdUl0?=
 =?utf-8?B?ZCtXSlVTM2pJNG9aY241U1V4a3lPdSsxVmI5d3dhU3BwcTBkUmRoN2Z4Q1pi?=
 =?utf-8?B?Q2FDN1hTajdMTUFPTklXeUUwdHoyZ2wrV1RtaU9SemNCQ0RVWGtwSWhackNs?=
 =?utf-8?B?bHlSTmNGREVJMWRSU01BMXIxOVFvQnNSU2JqUC92MXVBT0lLeWtueWErUnp4?=
 =?utf-8?Q?f3qNeVsXpOCJsLhbh7FgphQG+NmweODGgSoaQKr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2EE1C0FB248FFF43A459D385FF3750C1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab484d54-6136-4489-e95a-08d93284983c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 18:12:11.9940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JZ6cv1RCyaUQXqqzc1Cn+StaGuI4rKn6H3vbmusJOi2Tc7G0tkHkJpBD5BQL3hEZAasyblshZqGrV/tthzahPDQRgJrbQl9yAI+R8j/vaKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6349
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSnVuIDE4LCAyMDIxLCBhdCA2OjAwIFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgSnVuIDE4LCAyMDIxIGF0IDA0OjE4
OjQ0UE0gKzAwMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9uIEp1biAx
OCwgMjAyMSwgYXQgNDowOCBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGdtYWlsLmNvbT4g
d3JvdGU6DQo+Pj4gDQo+Pj4gT24gRnJpLCBKdW4gMTgsIDIwMjEgYXQgMDI6NDQ6MTVQTSArMDAw
MCwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+Pj4gT24gTWF5IDI0LCAy
MDIxLCBhdCA5OjM2IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AZ21haWwuY29tPiB3cm90
ZToNCj4+Pj4+IA0KPj4+Pj4gQWRkIGEgQ29udGV4dE9wdGlvbiB0eXBlIHRvIHN1cHBvcnQgZnVu
Y3Rpb25hbCBvcHRpb25zIGluIE5ld0NvbnRleHQuDQo+Pj4+PiBUaGVuLCBhZGQgYSB2YXJpYWRp
YyBDb250ZXh0T3B0aW9uIHBhcmFtZXRlciB0byBOZXdDb250ZXh0LCB3aGljaCBhbGxvd3MNCj4+
Pj4+IGNhbGxlcnMgdG8gc3BlY2lmeSAwIG9yIG1vcmUgY29uZmlndXJhdGlvbiBvcHRpb25zLg0K
Pj4+Pj4gDQo+Pj4+PiBGb3Igbm93LCBqdXN0IGFkZCB0aGUgV2l0aExvZ0xldmVsIG9wdGlvbiBz
byB0aGF0IGNhbGxlcnMgY2FuIHNldCB0aGUNCj4+Pj4+IGxvZyBsZXZlbCBvZiB0aGUgQ29udGV4
dCdzIHhlbnRvb2xsb2dfbG9nZ2VyLiBGdXR1cmUgY29uZmlndXJhdGlvbg0KPj4+Pj4gb3B0aW9u
cyBjYW4gYmUgY3JlYXRlZCBieSBhZGRpbmcgYW4gYXBwcm9wcmlhdGUgZmllbGQgdG8gdGhlDQo+
Pj4+PiBjb250ZXh0T3B0aW9ucyBzdHJ1Y3QgYW5kIGNyZWF0aW5nIGEgV2l0aDxPcHRpb25OYW1l
PiBmdW5jdGlvbiB0byByZXR1cm4NCj4+Pj4+IGEgQ29udGV4dE9wdGlvbg0KPj4+Pj4gDQo+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPg0K
Pj4+Pj4gLS0tDQo+Pj4+PiB0b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCA0NCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+Pj4+PiAxIGZpbGUgY2hhbmdlZCwgNDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pj4+IA0KPj4+Pj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdo
dC94ZW5saWdodC5nbw0KPj4+Pj4gaW5kZXggZjY4ZDdiNmU5Ny4uNjVmOTNhYmUzMiAxMDA2NDQN
Cj4+Pj4+IC0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbw0KPj4+Pj4gKysr
IGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvDQo+Pj4+PiBAQCAtMTM2LDcgKzEz
Niw3IEBAIGZ1bmMgc2lnY2hsZEhhbmRsZXIoY3R4ICpDb250ZXh0KSB7DQo+Pj4+PiB9DQo+Pj4+
PiANCj4+Pj4+IC8vIE5ld0NvbnRleHQgcmV0dXJucyBhIG5ldyBDb250ZXh0Lg0KPj4+Pj4gLWZ1
bmMgTmV3Q29udGV4dCgpIChjdHggKkNvbnRleHQsIGVyciBlcnJvcikgew0KPj4+Pj4gK2Z1bmMg
TmV3Q29udGV4dChvcHRzIC4uLkNvbnRleHRPcHRpb24pIChjdHggKkNvbnRleHQsIGVyciBlcnJv
cikgew0KPj4+Pj4gCWN0eCA9ICZDb250ZXh0e30NCj4+Pj4+IA0KPj4+Pj4gCWRlZmVyIGZ1bmMo
KSB7DQo+Pj4+PiBAQCAtMTQ2LDggKzE0NiwxOSBAQCBmdW5jIE5ld0NvbnRleHQoKSAoY3R4ICpD
b250ZXh0LCBlcnIgZXJyb3IpIHsNCj4+Pj4+IAkJfQ0KPj4+Pj4gCX0oKQ0KPj4+Pj4gDQo+Pj4+
PiArCS8vIFNldCB0aGUgZGVmYXVsdCBjb250ZXh0IG9wdGlvbnMuIFRoZXNlIGZpZWxkcyBtYXkN
Cj4+Pj4+ICsJLy8gYmUgbW9kaWZpZWQgYnkgdGhlIHByb3ZpZGVkIG9wdHMuDQo+Pj4+PiArCWNv
cHRzIDo9ICZjb250ZXh0T3B0aW9uc3sNCj4+Pj4+ICsJCWxvZ0xldmVsOiBMb2dMZXZlbEVycm9y
LA0KPj4+Pj4gKwl9DQo+Pj4+PiArDQo+Pj4+PiArCWZvciBfLCBvcHQgOj0gcmFuZ2Ugb3B0cyB7
DQo+Pj4+PiArCQlvcHQuYXBwbHkoY29wdHMpDQo+Pj4+PiArCX0NCj4+Pj4+ICsNCj4+Pj4+IAkv
LyBDcmVhdGUgYSBsb2dnZXINCj4+Pj4+IC0JY3R4LmxvZ2dlciA9IEMueHRsX2NyZWF0ZWxvZ2dl
cl9zdGRpb3N0cmVhbShDLnN0ZGVyciwgQy5YVExfRVJST1IsIDApDQo+Pj4+PiArCWN0eC5sb2dn
ZXIgPSBDLnh0bF9jcmVhdGVsb2dnZXJfc3RkaW9zdHJlYW0oQy5zdGRlcnIsDQo+Pj4+PiArCQlD
LnhlbnRvb2xsb2dfbGV2ZWwoY29wdHMubG9nTGV2ZWwpLCAwKQ0KPj4+Pj4gDQo+Pj4+PiAJLy8g
QWxsb2NhdGUgYSBjb250ZXh0DQo+Pj4+PiAJcmV0IDo9IEMubGlieGxfY3R4X2FsbG9jKCZjdHgu
Y3R4LCBDLkxJQlhMX1ZFUlNJT04sIDAsDQo+Pj4+PiBAQCAtMjAxLDYgKzIxMiwzNSBAQCBmdW5j
IChjdHggKkNvbnRleHQpIENsb3NlKCkgZXJyb3Igew0KPj4+Pj4gCXJldHVybiBuaWwNCj4+Pj4+
IH0NCj4+Pj4+IA0KPj4+Pj4gK3R5cGUgY29udGV4dE9wdGlvbnMgc3RydWN0IHsNCj4+Pj4+ICsJ
bG9nTGV2ZWwgTG9nTGV2ZWwNCj4+Pj4+ICt9DQo+Pj4+PiArDQo+Pj4+PiArLy8gQ29udGV4dE9w
dGlvbiBpcyB1c2VkIHRvIGNvbmZpZ3VyZSBvcHRpb25zIGZvciBhIENvbnRleHQuDQo+Pj4+PiAr
dHlwZSBDb250ZXh0T3B0aW9uIGludGVyZmFjZSB7DQo+Pj4+PiArCWFwcGx5KCpjb250ZXh0T3B0
aW9ucykNCj4+Pj4+ICt9DQo+Pj4+PiArDQo+Pj4+PiArdHlwZSBmdW5jQ29udGV4dE9wdGlvbiBz
dHJ1Y3Qgew0KPj4+Pj4gKwlmIGZ1bmMoKmNvbnRleHRPcHRpb25zKQ0KPj4+Pj4gK30NCj4+Pj4+
ICsNCj4+Pj4+ICtmdW5jIChmY28gKmZ1bmNDb250ZXh0T3B0aW9uKSBhcHBseShjICpjb250ZXh0
T3B0aW9ucykgew0KPj4+Pj4gKwlmY28uZihjKQ0KPj4+Pj4gK30NCj4+Pj4gDQo+Pj4+IFdoeSBh
bGwgdGhpcyBjb252b2x1dGlvbiB3aXRoIGludGVyZmFjZXMgYW5kIHN1Y2gsIHJhdGhlciB0aGFu
IGp1c3QgZGVmaW5pbmcgQ29udGV4dE9wdGlvbiBhcyBhIGZ1bmN0aW9uIHBvaW50ZXI/ICBJcyBp
dCBqdXN0IHRvIGtlZXAgY29udGV4dE9wdGlvbnMgb3V0IG9mIHRoZSBkb2N1bWVudGF0aW9uIHBh
Z2U/DQo+Pj4gDQo+Pj4gUGFydCBvZiB0aGUgbW90aXZhdGlvbiBmb3IgdXNpbmcgZnVuY3Rpb25h
bCBvcHRpb25zIGlzIHRvIGFic3RyYWN0IHRoZQ0KPj4+ICJvcHRpb25zIiBzdHJ1Y3QsIHllcy4g
VGhpcyBhbGxvd3MgaW50ZXJuYWwgZGVmYXVsdHMgdG8gYmUgYXBwbGllZCBtb3JlDQo+Pj4gZWFz
aWx5IC0tIGlmIHlvdSByZXF1aXJlIGUuZy4gYSBDb250ZXh0T3B0aW9ucyBzdHJ1Y3QgdG8gYmUg
cGFzc2VkIGJ5DQo+Pj4gdGhlIGNhbGxlciwgaG93IGRvIHlvdSBrbm93IGlmIHRoZXkgaW50ZW5k
ZWQgdG8gb3ZlcnJpZGUgYSBkZWZhdWx0LCBvcg0KPj4+IGlmIHRoZXkganVzdCBkaWRuJ3Qgc2V0
IHRoZSBmaWVsZD8gQWRkaXRpb25hbGx5LCB1c2luZyB0aGUgQ29udGV4dE9wdGlvbg0KPj4+IGFz
IGFuIGludGVyZmFjZSBhbGxvd3MgdmFyaWFkaWMgYXJndW1lbnRzLCB3aGljaCBhcmUganVzdCBj
b252ZW5pZW50IGZvcg0KPj4+IEFQSSB1c2VycyAtLSB0aGUgc2FtZSBOZXdDb250ZXh0IGZ1bmN0
aW9uIGNhbiBiZSB1c2VkIHdoZXRoZXIgeW91IG5lZWQNCj4+PiB0byBwYXNzIDMgb3B0aW9ucyBv
ciAwLg0KPj4+IA0KPj4+IFRoZSByZWFzb24gd2UgdXNlIENvbnRleHRPcHRpb24gYXMgYW4gaW50
ZXJmYWNlLCByYXRoZXIgdGhhbiBmdW5jdGlvbg0KPj4+IHBvaW50ZXIgb2Ygc29ydHMgaXMgZm9y
IGZsZXhpYmlsaXR5IGluIHRoZSBzaWduYXR1cmVzIG9mIENvbnRleHRPcHRpb24NCj4+PiBpbXBs
ZW1lbnRhdGlvbnMuIEUuZy4sIHdlIGNvdWxkIGhhdmUNCj4+PiANCj4+PiBmdW5jIFdpdGhMb2dM
ZXZlbChsdmwgTG9nTGV2ZWwpIENvbnRleHRPcHRpb24NCj4+PiBmdW5jIFdpdGhMb2dDb250ZXh0
KHMgc3RyaW5nKSBDb250ZXh0T3B0aW9uDQo+Pj4gZnVuYyBXaXRoRm9vQW5kQmFyKHMgc3RyaW5n
LCBuIGludCkgQ29udGV4dE9wdGlvbg0KPj4+IA0KPj4+IFNlZSBbMV0gZm9yIG1vcmUgYmFja2dy
b3VuZCBvbiB0aGlzIHBhdHRlcm4uDQo+Pj4gDQo+Pj4gVGhhbmtzLA0KPj4+IE5SDQo+Pj4gDQo+
Pj4gWzFdIGh0dHBzOi8vZGF2ZS5jaGVuZXkubmV0LzIwMTQvMTAvMTcvZnVuY3Rpb25hbC1vcHRp
b25zLWZvci1mcmllbmRseS1hcGlzDQo+PiANCj4+IFllcywgSSBmcmVxdWVudGx5IHVzZSBhIHBh
dHRlcm4gbGlrZSB0aGUgb25lIGRlc2NyaWJlZCBpbiB0aGF0IGJsb2cgcG9zdCBteXNlbGYuIEJ1
dCB0aGF0IGJsb2cgcG9zdCBkb2VzbuKAmXQgdXNlIGludGVyZmFjZXMg4oCUIHRoZSBmaW5hbCBz
bGlkZSBhY3R1YWxseSBoYXMgdGhlIOKAnG9wdGlvbiBmdW5jdGlvbuKAnSB0eXBlIGFzIGFuIG9w
ZW4tY29kZWQgZnVuY3Rpb24gcG9pbnRlciB0eXBlLg0KPj4gDQo+PiBTbyBteSBxdWVzdGlvbiB3
YXMsIHdoeSBub3QgZG8gc29tZXRoaW5nIGxpa2UgdGhpczoNCj4+IA0KPj4gdHlwZSBDb250ZXh0
T3B0aW9uIGZ1bmMoKmNvbnRleHRPcHRpb25zKSBlcnJvcg0KPj4gDQo+PiBmdW5jIFdpdGhMb2dM
ZXZlbChsZXZlbCBMb2dMZXZlbCkgQ29udGV4dE9wdGlvbiB7DQo+PiAgcmV0dXJuIGZ1bmMoY28g
KmNvbnRleHRPcHRpb25zKSB7DQo+PiAgICBjby5sb2dMZXZlbCA9IGxldmVsDQo+PiAgfQ0KPj4g
fQ0KPj4gDQo+PiBBVE0gdGhlIG9ubHkgYWR2YW50YWdlIEkgY2FuIHNlZSBvZiBkZWZpbmluZyBD
b250ZXh0T3B0aW9uIGFzIGFuIGludGVyZmFjZSByYXRoZXIgdGhhbiBhcyBhIGZ1bmN0aW9uIHBv
aW50ZXIgaXMgdGhhdCB0aGUgZ29kb2MgZm9yIENvbnRleHRPcHRpb24gd291bGQgbG9vayBsaWtl
Og0KPj4gDQo+PiB0eXBlIENvbnRleHRPcHRpb24gaW50ZXJmYWNlIHsNCj4+ICAgLy8gY29udGFp
bnMgZmlsdGVyZWQgb3IgdW5leHBvcnRlZCBmaWVsZHMNCj4+IH0NCj4+IA0KPj4gUmF0aGVyIHRo
YW4NCj4+IA0KPj4gdHlwZSBDb250ZXh0T3B0aW9uIGZ1bmMoKmNvbnRleHRPcHRpb25zKSBlcnJv
cg0KPj4gDQo+PiBXaGljaCBzaG93cyB5b3UgdGhlIG5hbWUgb2YgdGhlIHVuZXhwb3J0ZWQgZmll
bGQuDQo+PiANCj4+IElzIHRoZXJlIGFub3RoZXIgcmVhc29uIEkgbWlzc2VkPw0KPiANCj4gVGVj
aG5pY2FsbHkgaXQgZG9lcyBhbGxvdyBtb3JlIGZsZXhpYmlsaXR5IGluIGltcGxlbWVudGluZw0K
PiBDb250ZXh0T3B0aW9uLCBlLmcuIHlvdSBjb3VsZCBkby4uLg0KPiANCj4gZnVuYyAobHZsIExv
Z0xldmVsKSBhcHBseShjbyAqY29udGV4dE9wdGlvbnMpIHsgY28ubG9nTGV2ZWwgPSBsdmwgfQ0K
PiANCj4gLi4uYW5kIHRoZW4gcGFzcyBhIExvZ0xldmVsIGRpcmVjdGx5IGFzIGEgQ29udGV4dE9w
dGlvbi4gQnV0IGdlbmVyYWxseQ0KPiBldmVyeW9uZSBpbXBsZW1lbnRzIHRoZXNlIHRoaW5ncyBh
cyBmdW5jcy4NCj4gDQo+IEkgd2lsbCBhZG1pdCB0aGF0IHdoZW4gaXQgY29tZXMgdG8gbXkgY2hv
aWNlIG9mIHVzaW5nIHRoZSBpbnRlcmZhY2UNCj4gdmVyc2lvbiBpbnN0ZWFkIG9mIGZ1bmN0aW9u
IHBvaW50ZXJzLCBJIGFtIGp1c3QgbW9yZSBmYW1pbGlhciB3aXRoIHRoZQ0KPiBmb3JtZXIgYW5k
IGVuY291bnRlciBpdCBtb3JlIG9mdGVuIGluIG90aGVyIEdvIHBhY2thZ2VzIEkgdXNlLg0KDQpP
Sy4gIEl0IHNlZW1zIGEgYml0IHdlaXJkIHRvIG1lLCBidXQgdGhhdOKAmXMgbm90IHJlYWxseSBh
IGdvb2QgcmVhc29uIHRvIGJsb2NrIGl0LiA6LSkgSSBqdXN0IHdhbnRlZCB0byBtYWtlIHN1cmUg
SSB1bmRlcnN0b29kIHdoeSBpdCB3YXMgYmVpbmcgY2hvc2VuLg0KDQpBY2tlZC1ieTogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg==

