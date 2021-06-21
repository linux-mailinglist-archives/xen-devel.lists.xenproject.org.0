Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7123F3AECDC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 17:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145591.267729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvMF8-0000qO-Te; Mon, 21 Jun 2021 15:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145591.267729; Mon, 21 Jun 2021 15:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvMF8-0000oZ-Q9; Mon, 21 Jun 2021 15:53:46 +0000
Received: by outflank-mailman (input) for mailman id 145591;
 Mon, 21 Jun 2021 15:53:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+afF=LP=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lvMF8-0000oT-1J
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 15:53:46 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b44c409-0a83-47dd-acba-1c5a01d65538;
 Mon, 21 Jun 2021 15:53:44 +0000 (UTC)
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
X-Inumbo-ID: 6b44c409-0a83-47dd-acba-1c5a01d65538
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624290824;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=N43ch99DbZIDDdSWa7kxrMjr29Vk4s1i1VrHju5TFdk=;
  b=OqLIw0ka0XdxTIR0DJg60b0s5addP/R/AEgIF+GjX2mQgwjc0MAGS8zx
   Sh8cW6IzjMYPoSkvtiME5igQrbrv6io1Vn+KWp9xZCLyY4+IOp5CvV/bC
   nh4whQ5HLWa7iR8zqhKZCze2BasUVFN+OzjNUdt9AsTAdw7QpeeH3y7NM
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6izfFzwsrWqRGaeVD1SePH1jmh9jKFVWW881cWSy5QTgBVNMXf+SNHRQeFzA6OtaI7LZJGhRzK
 er5wl5dU2787KAuUchM2JxENdhdtM9JYryTOGm1Z4PqhAtgXpU7GQON+bRIqeBvhq5AXoFd4Dl
 f5GcWaTpzoxzBSb1FSlzwwZ5bXEa4qZbcX8i3EPjFcXpL3oKR23E02ox20obYicYbS1U0LOq6V
 /4ArSjmqPg0OxHtY/upm5VrVF4Fpim4/5DhdWZNyA5oKoopMvzn7o4zol9lBO5TI0m2LOVy3W3
 Rx0=
X-SBRS: 5.1
X-MesageID: 46606871
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:c1ICt6qTDtnCVkKhjUX4YqAaV5uVL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXbsibNhfItKLzOWxFdAS7sSrbcKogeQVREWk9Qy6U
 4OSdkGNDSdNykYsS++2njDLz9C+qjFzEnLv5an854Fd2gDAMsAjzuRSDzraXGeLDM2WKbRf6
 Dsgvav0gDQH0j/Gf7LYUXtMdKzxeHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX262oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkFxnAjv0idvrD
 D/mWZnAy1B0QKJQohzm2q05+DU6kdo15Yl8y7CvZKsm72ieNtwMbs/uWsQSGqm16NnhqAh7E
 sD5RPoi7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4akWSOlHklYavoMRiKoLzPKt
 MeR/00JcwmBm+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNB6Vs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaNaDgDKFC0a
 gpdWko+lLaV3iefPFm7ac7hCwlGl/NLwgF4vsuk6SRlIeMN4bWDQ==
X-IronPort-AV: E=Sophos;i="5.83,289,1616472000"; 
   d="scan'208";a="46606871"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9hbQqG15TexcEbuMVEu1l6g2nJIduSSND3QVgyrSETpMUtxarS/SJkR7cc32pJVH2VoX1YL8kT3hcv10+vOdVKdmAVmaMgxiLG774sovk71PLHLytasrA7diGcefy/nH9fRfV7HIb6CY6Rh1Cgy+ga5ya+CpWs7UMveLfFm9kdBp0DuYu+nL9h7j0Gyr8/1R/4n8cAkj+gLYiPq4XYpsFuvqi7DCPek5YAC+7e9zLKIIJM0x/2zM1NSO40DJtrbcO+n1rX8QYPoU+F1m8UPnSnSeXQx7xYBe0FpIrTDn+oMySXO5DRBtAZOHUblh56NlDMWhv2bEeaMwPMozpYrEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N43ch99DbZIDDdSWa7kxrMjr29Vk4s1i1VrHju5TFdk=;
 b=nyH2YAcDWXJzPN/44PZrne3cDXWfxhLQJlw+du8Z8IX4sMMZ+erhcZWs8hVNL2/N3WzrKIZc5yj8qqOnjvCZFgAgbYE4rBtWmF/q9bvA2JAod69RMRmo4GM1t1afB9Kk29c/xXCWbg4XcYTEr4P+cKKf8HtXMVolXnpkkOIw9sBs4F0xqpXzVnp7iY+pV53dMhxNE2JYaubaICNeN5r6Bu3sXczOhdLjqgnVEtoxYlgaoNFEbD+L+A2Y18xd+a5D1C4obFGRRpYwQ152DJm/NpyNqIQudmAMQ8wy79bQBNotpxeBfmNNQDI9c9AErq6wWwze+3ggY10vvBMyXZ/ItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N43ch99DbZIDDdSWa7kxrMjr29Vk4s1i1VrHju5TFdk=;
 b=WXeW/qLV2qN4yc7iidAa27+5pizZYsRnySzbncEKgTqLDJVCSFRVx8Hl2cE4qnNr8ooVdierg5/pRE6UihoCxsZ/S7/kD8uYc4XsheEcFOGXVFMMwSEi4AkLL5W+owUt9MMeWU78+VN2TWTmefvpdO/GqjTkj54RyNCkbL3osJo=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 00/12] golang/xenlight: domain life cycle support
Thread-Topic: [RESEND PATCH 00/12] golang/xenlight: domain life cycle support
Thread-Index: AQHXUNyxCw9CepZKn023Zd4/zB8JpKseyXiA
Date: Mon, 21 Jun 2021 15:53:39 +0000
Message-ID: <AD0B1F68-3FAE-4F3C-BCF5-9623A76A0A9B@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f00a466f-d47a-4ca1-c87f-08d934ccbcbc
x-ms-traffictypediagnostic: PH0PR03MB5912:
x-microsoft-antispam-prvs: <PH0PR03MB591286B74235E635C0850AE4990A9@PH0PR03MB5912.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FhIyACGUrmAyScXUfFFhQlmjOAsUzZWybR1D0N4ASjGaRZzh1XJPajR5lKQIwbj3vl8/fkR5I2hk0hBar9SoBlVPxuYUuIzdkD9SVG9dbmHuhkTya1OwPyIctetCsUyTZpc3b7qNWX1lw9dt2BmD7Fu4oW8vW0zTraS4IBuDmkJY0G8T8isBGaUSdXo4bAWtv3tvjh+vh5l78MEUivHIiOkTMmkEaSkSiHL2XSGpqdy26cC7lIMZMR/bIteJKLQipj5ReMj14t/B+dFfwd2YccBf2XO476qlkAddtG80LPHTG36vmM9m9uE6/z5xW3eZRXcrm/w+IitLTHgESEPBRrd9L5MkaXlVpnUYiR/Reyk9SMQoM7862fdkhgypRRhXVpXl3he2lGdwjQIkwqvtOAqFiAHKWEosOiQz3ZNAeHhqV+CIE8Y/cDtKdQ1bqez3FLNWYchbEG2gNw9AskVeyxMmgE3wCkH6e4ZIi1Q5VTgOjzpGJAWVv+gsn5zTdJWYvSaT3HZy9Fw3Vk4N+UjxmxcmeASyJfUrSAGoHeFHlfg4AblWbBSL1PcsTSQoMCQyaczktfUy+fY7iO0I1sUlCRQiNxrQm+WVPr1tQgVJiR5b2xEWEK1ck/au4WNJ1kIpQY6UFvE+WmPH+UCF7tE82Uq6f7WJsxsMD4WQvqa3EZM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(36756003)(54906003)(33656002)(6512007)(2616005)(6486002)(5660300002)(8676002)(2906002)(8936002)(4326008)(186003)(316002)(6506007)(91956017)(478600001)(66476007)(76116006)(38100700002)(122000001)(86362001)(66446008)(64756008)(66556008)(6916009)(71200400001)(53546011)(66946007)(26005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejhtVFg3RlZCVklVc05CRDB2TWNKcVVWMmpZdXR5ZVVudzdRQUZzZXZ1eGtm?=
 =?utf-8?B?b0tDNjN0YmpLdS9odmpEQzN3U0NVSGllcW9HS1B1YkFzMkZ3a0ZnWUp6TmdE?=
 =?utf-8?B?SW5CTkJXbGJNVUc3YmR6cEgyaW1aVW1pLzBKUm9XMVhIcWdlSGRtRDBleFpF?=
 =?utf-8?B?S2JDcXJBYUhqUnZkTXdnYzc1bUhJTFowbnZ3SFlqOWNUcjJNMm4zSG8yc2dO?=
 =?utf-8?B?V2hUN0V1L0pUa0dRNGF2aWovbkU5ZHN5WkIzZVZnQUV4REFwZWRIUlNMekxN?=
 =?utf-8?B?Zy9OL0thWHRtV3VocXhiTlpqQzAya1pabkdLOVpwc3d3OGpUYmN3NGdVbVNU?=
 =?utf-8?B?aTdRYkdWem5UTUVzbDQwb0xVOGQ2Zkhhb1dUSDg0MW8wOWtGQ1l1UFF4cVA5?=
 =?utf-8?B?V3c1V1JKZ2Z0cHZLWDJkWS9oL1QvMmJoQWp4UkE2MlFodjNtblJaQ0FQTm1v?=
 =?utf-8?B?QnM2MlVYNW1veWxBSE5UMWhqMnNvdk5JbkhNOE4vazNCeHJuL1JIMko0Ty9N?=
 =?utf-8?B?UCtlTm5MTUN5Ung4bWoxem1Ka0IwQXEwRUxsWXQ2SGlNSW52R09mOXhCOEtH?=
 =?utf-8?B?TzdSR2JIRUZCZ2QzTDdUcGQrMmUvaWxGY1JkZUFhZm5ZVVNQaG5idHJVYUk3?=
 =?utf-8?B?OEdmU0hxOGFJUUc3TTY1YmhobDdybmxRQVNrSjBGSWtwT2lhNUkvNXREZ1pW?=
 =?utf-8?B?RzlJVXhWeUR0UmRJUERBcVg4VzVhMXNUaGM3b21ZU0dCdnBZUno0cmhoOFhm?=
 =?utf-8?B?dlpzcnlxVTh0VW9Ua09xWnBhV3hEZGQrSjVMV0Q2akZKNDRRMG9zSHNpT21o?=
 =?utf-8?B?NngxcTlPdkhwSGsvZTI2bHlVT0g3bENDbUxTWW1CRkk4bzk1ZURCTExwN1ZP?=
 =?utf-8?B?VHVxbmRycWJpZDlPVWVTa29tT0VzV29wbjZhSXlBSlRRVWVPZS9Xb2ZTYWE3?=
 =?utf-8?B?SzVDSENJV2R2ei9ZVmFIRVAzMFcxT25jNGpVbHJwQWhEbW9obEhDV3NWWE1o?=
 =?utf-8?B?dUZRTGUwdjFlZEp0Qm9RUm50MkJsb09hUDlWdzBaYU9EMVV5U1FCZTZtRVp4?=
 =?utf-8?B?dysvSmZhOEg1ZlZYN202WDBDZjhNM1hFaUZ3enNmR0pldlZIVy9lQjNMQnhw?=
 =?utf-8?B?ZVNkRGVnc0libnlVVWk0R0lwbzR2L0VWTDdBL1haZDZxaHR4SlNkUFVwM2ov?=
 =?utf-8?B?MjAwemJnZkY2TUZzWjJBblVuQ0NWekJxaDRhU0NZdU55QlBzUms0b2JLQVhG?=
 =?utf-8?B?MHY3cXhpcVd0djNPRkx4angyTmJWT1ZJeGR1OTRzRHJRamo4UWtyeW9yZlpI?=
 =?utf-8?B?SzhmSzNvTWNyZ1luSm9kSjc0VkFUQ2djeFphUFJxUW52N2dXbllMT2xyMmJM?=
 =?utf-8?B?RkgvbFFKdnBNc1ZuQUk2T0xnQk5SNEc3SzV0NGZsa1pqSyswZFpMbFdNSVhw?=
 =?utf-8?B?TUFBeXVrZDBNVmZmejI4LzhoNmE3YlZPZGFhQ2MwRS9ZcUtKZmhTYmk5cTRl?=
 =?utf-8?B?Y2k5S0h0ampWUTJXL2xVYUhkOFhsMTU3eHNpTVliMW1raUN1WW13VDFoWWps?=
 =?utf-8?B?VmZTVDhIUkNHNnNDMndHQ3RnN2hzbnV1ZDNMSy81N3pSclVDbWNmZVhtWHFO?=
 =?utf-8?B?L21odUYzZ05NcUlaSDk0REFITUlXdW1STWQ5MzF3SVpNQjNUWThYd2VsYjBt?=
 =?utf-8?B?cVZoRHJ0WS9SKy9LMnJLNkZpR0RvRmhvMHBlN0pTd2ppbWFKZ25PSUkrTVdB?=
 =?utf-8?Q?37KsVwwrKASQkc+21rtN4Iu8Ak7MeeRXAjOgahm?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8F94C9DD6072D44A073041BE170D77A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00a466f-d47a-4ca1-c87f-08d934ccbcbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 15:53:39.2713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXB+2SPPwbPxCF2MLtoI+1+EIK8sb/EZ3jL5TKqTfm5B+hWqd8/iaR0nfPYuVb5u+FU+UM7aZLxehusL5F8faI7ZjdmHOBl61ExPU/7Zhf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5912
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWF5IDI0LCAyMDIxLCBhdCA5OjM2IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IFRoZSBwcmltYXJ5IGdvYWwgb2YgdGhpcyBwYXRj
aCBzZXJpZXMgaXMgdG8gYWxsb3cgdXNlcnMgb2YgdGhlIHhlbmxpZ2h0DQo+IHBhY2thZ2UgdG8g
bWFuYWdlIGEgZnVsbCBkb21haW4gbGlmZSBjeWNsZS4gSW4gcGFydGljdWxhciwgaXQgcHJvdmlk
ZXMNCj4gc3VwcG9ydCBmb3IgcmVjZWl2aW5nIGRvbWFpbiBkZWF0aCBldmVudHMgc28gdGhhdCBk
b21haW4gc2h1dGRvd24sDQo+IHJlYm9vdCwgZGVzdHJveSwgZXRjLiBjYW4gYmUgaGFuZGxlZC4g
QW5kLCBpdCBhZGRyZXNzZXMgaXNzdWVzIGZvdW5kDQo+IHdoZW4gdXNpbmcgdGhlIHBhY2thZ2Ug
dG8gYm9vdCBkb21haW5zIHdpdGggdmFyaW91cyBjb25maWd1cmF0aW9ucy4NCj4gDQo+IFRoZXNl
IHBhdGNoZXMgYWRkcmVzcyBzZXZlcmFsIHRoaW5ncyAoZS5nLiBidWcgZml4ZXMsIGNvZGUgc3R5
bGUsDQo+IGNvbnZlbmllbmNlcywgbmV3IHdyYXBwZXIgZnVuY3Rpb25zKSwgYnV0IGFyZSBhbGwg
d29yayB0b3dhcmRzIHRoZSBmaW5hbA0KPiBnb2FsIG9mIGFsbG93aW5nIGEgcGFja2FnZSB1c2Vy
IHRvIG1hbmFnZSBhIGZ1bGwgZG9tYWluIGxpZmUgY3ljbGUuDQo+IA0KPiBOaWNrIFJvc2Jyb29r
ICgxMik6DQoNCk9LLCBJ4oCZdmUgY2hlY2tlZCBpbiB0aGUgZm9sbG93aW5nIHBhdGNoZXM6ICgx
LCAyLCA0LCA1LCA2LCA5LCAxMCwgMTEpOg0KDQo+ICBnb2xhbmcveGVubGlnaHQ6IHVwZGF0ZSBn
ZW5lcmF0ZWQgY29kZQ0KPiAgZ29sYW5nL3hlbmxpZ2h0OiBmaXggU3RyaW5nTGlzdCB0b0MgY29u
dmVyc2lvbg0KPiAgZ29sYW5nL3hlbmxpZ2h0OiBleHBvcnQga2V5ZWQgdW5pb24gaW50ZXJmYWNl
IHR5cGVzDQo+ICBnb2xhbmcveGVubGlnaHQ6IHVzZSBzdHJ1Y3QgcG9pbnRlcnMgaW4ga2V5ZWQg
dW5pb24gZmllbGRzDQo+ICBnb2xhbmcveGVubGlnaHQ6IHJlbmFtZSBDdHggcmVjZWl2ZXJzIHRv
IGN0eA0KDQo+ICBnb2xhbmcveGVubGlnaHQ6IGFkZCBEb21haW5EZXN0cm95IHdyYXBwZXINCj4g
IGdvbGFuZy94ZW5saWdodDogYWRkIFNlbmRUcmlnZ2VyIHdyYXBwZXINCj4gIGdvbGFuZy94ZW5s
aWdodDogZG8gbm90IG5lZ2F0ZSByZXQgd2hlbiBjb252ZXJ0aW5nIHRvIEVycm9yDQoNClRoZSBm
b2xsb3dpbmcgaGF2ZSBub3QgYmVlbiBjaGVja2VkIGluIGR1ZSBvdXRzYW5kaW5nIHJldmlldyBj
b21tZW50cyAocGF0Y2hlcyAzLCA3LCAxMiksIG9yIGJlY2F1c2UgdGhleSBkZXBlbmQgb24gYSBw
YXRjaCBub3QgYmVpbmcgY2hlY2tlZCBpbiAocGF0Y2ggOCk6DQoNCj4gIGdvbGFuZy94ZW5saWdo
dDogZml4IHN0cmluZyBjb252ZXJzaW9uIGluIGdlbmVyYXRlZCB0b0MgZnVuY3Rpb25zDQo+ICBn
b2xhbmcveGVubGlnaHQ6IGFkZCBsb2dnaW5nIGNvbnZlbmllbmNlcyBmb3Igd2l0aGluIHhlbmxp
Z2h0DQo+ICBnb2xhbmcveGVubGlnaHQ6IGFkZCBmdW5jdGlvbmFsIG9wdGlvbnMgdG8gY29uZmln
dXJlIENvbnRleHQNCj4gIGdvbGFuZy94ZW5saWdodDogYWRkIE5vdGlmeURvbWFpbkRlYXRoIG1l
dGhvZCB0byBDb250ZXh0DQoNClRoYW5rcywNCiAtR2VvcmdlDQoNCg==

