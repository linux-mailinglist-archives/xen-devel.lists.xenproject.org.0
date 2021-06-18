Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE273AD076
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 18:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144851.266558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHQ2-00057y-Mk; Fri, 18 Jun 2021 16:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144851.266558; Fri, 18 Jun 2021 16:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luHQ2-00054z-J5; Fri, 18 Jun 2021 16:32:34 +0000
Received: by outflank-mailman (input) for mailman id 144851;
 Fri, 18 Jun 2021 16:32:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luHQ1-00054t-23
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 16:32:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 015997d4-224b-4c9a-adee-030d2032845b;
 Fri, 18 Jun 2021 16:32:31 +0000 (UTC)
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
X-Inumbo-ID: 015997d4-224b-4c9a-adee-030d2032845b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624033951;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MZ6c8awNEGrWMtofaktIYlmJmZ3wfwjrlvmEp2hFHfk=;
  b=ZjLDR0XLCs0H3pSsHKb+8NZwpz0l+d70lbcpVU/E0eUZRHBUKayyw/Yl
   0V7qdkt0Zyo+cFdidk+fusYwdMvLYcuYrTvepxCzwfTg+1XS5cJti6VPi
   3tqWcGq5FcdDvvuloYXkbgJWfONcaQPJ6RzJVEchOJrEORJ5ZghgKR0KZ
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8woQerB6Sa97VYgc2L5hko8jmDVULX+TFSL9QGxYLgSMH+0KWufluHlQcnsjwtRi5YVI6Sf1o9
 +I2aX/1eav2gRKPqy49S9uJnuWDr5K0W6hP5lkUWItkJTfOGdbjX4wZu2o4Oq+GuyigbBwaQcJ
 mFxZHwKShKvkQnCyWnEe7MgqVwJcniyhR0Js66k/qL+cxzEbEuLIcu6xGSaYxyD632vvBVb/6L
 uTha98BBrTLCicTN6hymeJNXNtiIdFre9Lw0P7pVaMPTZ9YY4qtcjDqznFGhSe2+beG5fFsMTf
 wzw=
X-SBRS: 5.1
X-MesageID: 46462065
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VWzC2q9XaBA6DVfTPOduk+Fodb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYW4qKQ0dcdDpAtjlfZtFnaQFobX5To3SIzUO31HYb72KjLGSggEIfheeygcz79
 YZT0ETMqyTMbE+t7eG3ODaKadj/DDkytHSuQ629R4EJmsGC9AC0+46MHfgLqQffngbOXNTLu
 v62iMznUvYRZ1hVLXcOpBqZZmnm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4knEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXQISaCUmREXee
 v30k4d1vdImivsl6aO0EDQMjzboXATArnZuAWlaDXY0JHErXkBerR8bMpiA2rkAgwbzY5BOe
 twrhGknosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfJsRRx2xjIkLH4sJlOw1GkcKp
 glMCgc3ochTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNzd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDnRHXJ9up7pH
 3laiIXiYcfQTObNSS+5uwDzvmWehTJYd3E8LAo23FWgMyPeIbW
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46462065"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpLRzBRHUX/qOBt6Ibfyc2g2Znagn0nXiLyIVDnm/02ckUzdNt8V3AqlqF5DxORMWy4xwfFtP3wtB1AwfoKLpc8LuktPHea4DGNQW9/CjumbZdkRPPprVMyRQ7i4RVjB0MMroO8RBXJMHfG17vc3gj07nbWmwBPtBpDtaSWi85ye6BJFm3or17oYk3VqH/+hMoD4hZSdwa5ApqCWyQNc0VsMC4ZfRtfXKekBAzwDvES3Z2r1eu2uVVGOgAmUhAZQuzgRH7u48bNlpwpPmS2rrhC0wtiWrbl+gHBEdaISO+8P/9q/C86Gf0AGjeJuvtp5qQsUTAmZhHfJdl/HIb3s/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZ6c8awNEGrWMtofaktIYlmJmZ3wfwjrlvmEp2hFHfk=;
 b=eGYwDqomtEjhyiJ+U1uS8phiO6gmLkZ077Pt5GmHwdabHbQk3boUKJfEA8ak3emlLiTUNPQPXqh+VttxQHNCNPQK63wBeXitbN1dVNKnWVoyOi6zWoe7NK6WPkRo0Nfoft2hPgwLJs6PgdEu5xLmu6TvT4SwgyxqTqcUeUODd87iJqJ0kKERshkhGiUR+5Li7B2I6k92VX/SVqj9fSvXQLyI8z8jPsYNnuZu8kL3ltZQ/CrLC4XQGbWUTgwm1+RZLH3elhjL2YAn2QcnPgFNyIP7oxorvFuvJNzBK/zTfff6ot7mVYgpzkkQXr0VZn/R49YVFYBcWOZlp9Tf8DCraw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZ6c8awNEGrWMtofaktIYlmJmZ3wfwjrlvmEp2hFHfk=;
 b=hlmGFFY1Ik5c5BjmpnsVNjj9M5iO1G6f3dXpdwM/6HBpPDBRQsIhG65tAxOo427l5GwXsmVl9zx5jV17cjtHyQSgRYedI1bt1d1RwpY3cq9sHgDCmaBRSehOhrOiLeDBsJprmD4Hwi1xfnxCuxagYEZ+X+6TyLSDfVxUgMfc9xs=
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
Thread-Index: AQHXUNy8b62kbX7r3k+nzGZDJK+dZqsZ5r2AgAABRgCAACL1gIAAEdqA
Date: Fri, 18 Jun 2021 16:30:40 +0000
Message-ID: <41F44BB8-0C20-44CA-AD7D-895C886115D0@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <452aac2489990ac0195c62d8cb820fbe5786c466.1621887506.git.rosbrookn@ainfosec.com>
 <A96AD4DD-35CB-495F-A008-D72A5C2AF45D@citrix.com>
 <E74C0DF9-3EA4-4B79-8CE4-02F00EC9875C@citrix.com>
 <YMy7NVTpaIlT+KWJ@FED-nrosbr-BE.crux.rad.ainfosec.com>
In-Reply-To: <YMy7NVTpaIlT+KWJ@FED-nrosbr-BE.crux.rad.ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 303a97b9-28e0-4fd2-a194-08d932766934
x-ms-traffictypediagnostic: PH0PR03MB6368:
x-microsoft-antispam-prvs: <PH0PR03MB636862E042754C5C66B30447990D9@PH0PR03MB6368.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZLhGtMGWjzE+p0y0F+lkpfvV/P4PEZ34Q+og6XjhmMihC1z2MpUQOnLTOGuRDKKJftMuwadOJpOMycOxksQC+J0EUlaVKkzMwdryu7cXFfVqKaF/H/dLuKvlsB1W+wJvXgbCn32NCem4dkfnuyCQnFCWoUrCKzEA67xFio2tWQB1Fstty51AkJiSXXBdLsiSupSgWM5c3MAC7PLPT7z15Mtq0kqjOAvhZoL1jPmToH8Bz1OIRYDyVFgbkpQC7SeGCu4nUKVjWth33b3SHI2ZKOJdoVk6GH2j+bHgJEswVyhukxcNieBmQlvyC20bW60iEJWbwGr1vRCo8u/L526AFd0Kum45jUV87+/yN7qv/iXDPSm2Kdd3oDvdw/9HFefZr5KZ1pPUlq4b7b/+1mYKY2PJ88ENCRWdK7Y2JHzvem1/1n1gfb6vSZeD5ovYj1EbM8cuWYNAg/mq3Jn9sedWctOw+mcaMr3aR29llayuyIIFlQO68fwXVgl59TGTrkPNC4G8mc1BjpvN8haTjlkIuAU+HN3f3OZAACzfwd3D0JbnJeSQqtpXLJ0WH0wkPIOP/ZqSO5fJoWdCaTT3W/j8aVwHgB+c+pmDlIM/fmyGqxGTZK/wJNuxdtR5LEPQApZlHrdCo8MxGuTOw67lSAQC2vQ2bJ+toC0606DuKbLBux0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(66946007)(478600001)(66476007)(66556008)(76116006)(54906003)(91956017)(26005)(6916009)(2616005)(316002)(66446008)(8936002)(2906002)(5660300002)(64756008)(6512007)(38100700002)(122000001)(53546011)(186003)(8676002)(86362001)(33656002)(6486002)(36756003)(4326008)(71200400001)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXZGQm9RUTZGYUhHSGF2MnRWUmRDTGIrelBsL1NlNHVtQll3QWZaUEJkd0R4?=
 =?utf-8?B?S05FMU1oM240a0RzeWVBRldMeDR6L3B0ZWo5bFpJSGpIU1BHZGpkTmJwV1lM?=
 =?utf-8?B?bUV5NE55VjkybnJvUUM4VkFjL0VOaXRnWGNod2t5Z0xBajQvVWo5OVQ5MDNi?=
 =?utf-8?B?VlpiL09aeWN5N085M0NpclRFdlNmRzJuQWV6djRwMXpOWUg1QlFHdm0vck9r?=
 =?utf-8?B?ckVkRmlHZEhsdms4TzI0QW5XOW9QQUY2USt6QWxFY0dxSS9pdWhwcFoxczZF?=
 =?utf-8?B?T1pWeUFKVGRZc3lsYTJwZCtWN0lMdU9uVnllVzFPaXIxQkswUzhEMStxRjJI?=
 =?utf-8?B?cnNFSDRwM21aUkhKSWM4L01PNVNLQ1ZBTGFqcjQ3MWNCMk1PV3JRbGx0dnUw?=
 =?utf-8?B?VSs1dEIyTVNOT0NIWGhKazVpdldQbnBtZHFmZWhMK1BTU0ZsRldnUjhvdVAx?=
 =?utf-8?B?ajRCU3lmZkIwZmc1blBsMWVGU0NVWFdCN01zaVg4QVZHQSs2MmV4aklMdzNj?=
 =?utf-8?B?QnF5K3pIUmJLTG5mY1RBQ090R2pKSVVKWlRVMzVtR2g0cFU2VHR2SlRGKzJx?=
 =?utf-8?B?dWRLTlo2WFRQclc2SzlYakdWdTVjV01zWFEweFlWaG9GNHdLZzZWRzI0dEZz?=
 =?utf-8?B?eXR2aEkvYkpFUVN4WG8vcHdEeWExbUQ3TzVUY0g0TlEwaVVFR015RVR0UGsw?=
 =?utf-8?B?V3FXNkgrRCtwS3JiYmp6MUVSa0JqbG1pOFFxYmZjZUxJZVR2Z1lTZ3BMelBs?=
 =?utf-8?B?MGlaZjdHNTZ2ODhaak03cGVpVlF2T1hDd0w1aEJmTmNIYWNUUEdjeG5xSEp1?=
 =?utf-8?B?b0p0REtJMFpvNGNMdCtyMUZOQUZ5MVRJNHNCdG5ocXUwVFpvRjRyTVczZzU4?=
 =?utf-8?B?Z2orTXBHb2NZWTJvdEY0T09Ic3VKQzUwdWlRSVlUTnRtWEdWZGJWY1hiOVll?=
 =?utf-8?B?dGV4enUzWkZERE1ZU0E3a2NWV3Y0WjcyOHFnaWxTeFFoMzN1VDNZTTdlRUdk?=
 =?utf-8?B?NFVWdnlyd3RlaW90VCs3SS8yWXptcU80T2tDY3ZqbTRRSVU5bllFY3ZXWnpL?=
 =?utf-8?B?WUVWUUE3amtiaUxYYlBuUTlZVkVSMVJQcXFsVEZMcDMrQlJSaHJZMDhnZUho?=
 =?utf-8?B?cWpjRkN4UVBNUHFFMlpCL2oxTkdEa0RvcHRZR2lnRWdIWDNOYUpUS3R5eGNl?=
 =?utf-8?B?NlJxZVd0blkzRk1OcWtBU0h0emFuTW04YVp4SUNQM3VwdDdUSmdUd1cvZTlB?=
 =?utf-8?B?cHJxZmYxSUpTMC9rOGt3TjhtY1JYNmFCS2xPWkVyYzZwTUdNVHdwaGVNWEhr?=
 =?utf-8?B?S2pXUDZXWHlubGFxYTdhZTJKUjFEZEJVOHZ4cmhiZXlPUFpCZGVrblFVME81?=
 =?utf-8?B?OHFkZUpDM1lhM05VMXUyaGhtQitHZXlBdVkrYnNPVnl4dTdpL01ydVJwTVRV?=
 =?utf-8?B?bVV3RmV2MXdLTFJSMGM1SnluVUIySGxvRmRPS3c4OWQ5ZHJGWGszT1hGY09t?=
 =?utf-8?B?ZmRpMXMwY0cvVmJ4b2lQeitMbVBqcmZLVFBPTXZJSHpZditWeTJjL29BRDhM?=
 =?utf-8?B?eGpFQVZzYTFOMVViUEhqUU9uTUthcHJVd1B1U1l5a2pPOFMrWStzc01adWZG?=
 =?utf-8?B?RG94TCt4OVIyeUp2OWJiVTFvS1d4Vm9kM2EraXNJengwdWJlNnBKeHlJdFJS?=
 =?utf-8?B?SDNqRmhCWWNPaHRiM2QrRllqVmlUTmYrZlZBSFI4OGhYREZqRTJFSlVtdFk1?=
 =?utf-8?Q?oTgn6EE521UFVBvlCArgUosQ5itnvPOITeCvqmM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F79E20B4806C5643871B4122A4FEC86F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303a97b9-28e0-4fd2-a194-08d932766934
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 16:30:40.0938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fvcTcmC8lb9Cxjhp1txlekQCy6hXhNS33gOdCqhnpWBZaUtD1+fvTOHbH3cPT5rcaZp5CIT/TfacpJJD2o7CVyNYimncXxozILv1H9kGP3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6368
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSnVuIDE4LCAyMDIxLCBhdCA0OjI2IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgSnVuIDE4LCAyMDIxIGF0IDAxOjIx
OjQwUE0gKzAwMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9uIEp1biAx
OCwgMjAyMSwgYXQgMjoxNyBQTSwgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXgu
Y29tPiB3cm90ZToNCj4+PiANCj4+PiANCj4+PiANCj4+Pj4gT24gTWF5IDI0LCAyMDIxLCBhdCA5
OjM2IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AZ21haWwuY29tPiB3cm90ZToNCj4+Pj4g
DQo+Pj4+IEFkZCBzb21lIGxvZ2dpbmcgbWV0aG9kcyB0byBDb250ZXh0IHRvIHByb3ZpZGUgZWFz
eSB1c2Ugb2YgdGhlDQo+Pj4+IENvbnRlbnh0J3MgeGVudG9vbGxvZ19sb2dnZXIuIFRoZXNlIGFy
ZSBub3QgZXhwb3J0ZWQsIGJ1dCB0aGUgTG9nTGV2ZWwNCj4+Pj4gdHlwZSBpcyBzbyB0aGF0IGEg
bGF0ZXIgY29tbWl0IGNhbiBhbGxvdyB0aGUgQ29udGV4dCdzIGxvZyBsZXZlbCB0byBiZQ0KPj4+
PiBjb25maWd1cmFibGUuDQo+Pj4+IA0KPj4+PiBCZWN1YXNlIGNnbyBkb2VzIG5vdCBzdXBwb3J0
IGNhbGxpbmcgQyBmdW5jdGlvbnMgd2l0aCB2YXJpYWJsZQ0KPj4+PiBhcmd1bWVudHMsIGUuZy4g
eHRsX2xvZywgYWRkIGFuIHh0bF9sb2dfd3JhcCBmdW5jdGlvbiB0byB0aGUgY2dvIHByZWFtYmxl
DQo+Pj4+IHRoYXQgYWNjZXB0cyBhbiBhbHJlYWR5IGZvcm1hdHRlZCBzdHJpbmcsIGFuZCBoYW5k
bGUgdGhlIGZvcm1hdHRpbmcgaW4NCj4+Pj4gR28uDQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPg0KPj4+IA0KPj4+IExvb2tz
IGdvb2QuICBPbmUgY29tbWVudDoNCj4+IA0KPj4gRXIsIHNvcnJ5LCB0dXJucyBvdXQgSSBoYWQg
cmF0aGVyIG1vcmUgdGhhbiBvbmUgY29tbWVudC4gIEhlcmXigJlzIG9uZSBtb3JlOg0KPj4gDQo+
PiBJcyB0aGVyZSBhbnkgcGFydGljdWxhciByZWFzb24gbm90IHRvIGV4cG9ydCB0aGUgQ3R4Lkxv
Z1tYXSgpIGZ1bmN0aW9ucz8NCj4+IA0KPiBObyByZWFzb24gb3RoZXIgdGhhbiBJIHRlbmQgdG8g
b25seSBleHBvcnQgZnVuY3Rpb25zIHdoZW4gSSBrbm93IHRoZXkNCj4gbmVlZCB0byBiZSBleHBv
cnRlZC4gTXkgbW90aXZhdGlvbiBmb3IgYWRkaW5nIHRoZXNlIGF0IHRoZSB0aW1lIHdhcyB0bw0K
PiBoZWxwIGRlYnVnIGRldmVsb3BtZW50LiBXb3VsZCB5b3UgcHJlZmVyIHRvIGV4cG9ydCB0aGVt
IHRoZW4/DQoNCkkgZG9u4oCZdCBoYXZlIGEgc3VwZXItc3Ryb25nIHByZWZlcmVuY2UuICBJIHdh
cyBqdXN0IHRoaW5raW5nIHRoYXQgeGwgYW5kIGxpYnhsIGJvdGggdXNlIHRoZSBzYW1lIGxvZ2dl
ciwgc28gaXQgd291bGQgbWFrZSBzZW5zZSBmb3Igd2hhdGV2ZXIgd2FzIGJ1aWx0IG9uIHRvcCBv
ZiB4ZW5saWdodCB0byB1c2UgdGhlIHNhbWUgbG9nZ2VyLg0KDQpCdXQgSSBndWVzcyB3ZeKAmWQg
d2FudCB0aGUgZXhwb3J0ZWQgdmVyc2lvbiB0byBiZSBhYmxlIHRvIHBhc3MgaW4gaXRzIG93biDi
gJxjb250ZXh04oCdOyBzaW5jZSBpdOKAmXMgbW9yZSB3b3JrIHRoYW4ganVzdCBjYXBpdGFsaXpp
bmcgdGhlIG1ldGhvZCBuYW1lcywgSeKAmWQgc2F5IGdvIGFoZWFkIGFuZCBwb3N0cG9uZSB0aGF0
IGZvciBub3cuDQoNClRoYW5rcywNCiAtR2Vvcmdl

