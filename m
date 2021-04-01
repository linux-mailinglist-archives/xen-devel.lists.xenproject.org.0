Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCA93515B6
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104569.200155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyav-0006fO-4k; Thu, 01 Apr 2021 14:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104569.200155; Thu, 01 Apr 2021 14:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyav-0006ez-1D; Thu, 01 Apr 2021 14:46:49 +0000
Received: by outflank-mailman (input) for mailman id 104569;
 Thu, 01 Apr 2021 14:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8z4=I6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRyau-0006eu-Fs
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:46:48 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffebad7c-9cee-42be-83ee-ac9693c9af7e;
 Thu, 01 Apr 2021 14:46:47 +0000 (UTC)
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
X-Inumbo-ID: ffebad7c-9cee-42be-83ee-ac9693c9af7e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617288407;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=T/X1/IcRwJR11b65tL6mpaHsmu4HvqDNJBrv71R5WXQ=;
  b=Ik0UuVo2xKYtP9/oeoi1dHvulmhGYhwqWqiEbhWmucnUokrffmG/Kxlz
   abgoCUbBV0zgJHsKmtCllQHfgWNXgDFVwOsUJZEsOViw8FjAD3amKOcnV
   K1V7RxWaSvZdbBd2W4KC1mTOJaCww7jb408K455q0YPlcpja8QZk4C6N3
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZUb06BzMYwzHpagEqqn7nzPo1bjRxfa7LkP/OPmqxqMJy0y6OkH1BrW6zHlxQPdUjRYQ6DBefm
 JS/ZC38YuIdRkevtAnBlXwCwptCyFUa66QUyQx6U0RZ3RDVnUqt8mIuk3p5W/LFlTPJYclGXX8
 RAK4eIjSg2HHLWNJVPHSyZZ0/Qus735k1lLXhPT66SJtZ9t1nQP5sG3oTlDQjO5H13hxjz5wpH
 k85WrzP9l2HmZk3yRxQl+4dYsGNDCvS5tJ1jt+eksFyiW35jqIJb/DjZ9bnMEwR/C/RgpPuJ1r
 PsI=
X-SBRS: 5.2
X-MesageID: 40845423
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9xzeuqtAftW/m4XEB6zo9t3F7skCdIMji2hD6mlwRA09T+Wzkc
 eykPMHkSLlkTp5YgBDpfmsMLSNKEmxybdb+o8UVI3NYCDDmE+FaL5v9pHjxTqIIVycysd42b
 17e6ZzTP3cZGIK6PrS2wWzH9Y+zNTvysnB7o2y815XQRhue+Vc6W5CajqzKUFqWBJAQaMwCZ
 v03LsimxObZX8VYs6nb0NlY8H/obTw+67OUFo6I1oO0k22ljWk9LTmVyeVxX4lIlRy6IZnzE
 yAuza83am4r/SnoyWssVP73tBqvJ/I8J9+HsCWzuANMy7rlQqkIL5sXLCPp1kO0ZmSwWdvrf
 2Jiy1lA95+8Df7e2e+oxfhnzPt1zsj8BbZuCSlqEqmnOi8fhUGMY56ob9hGyGpl3YIjZVA9I
 pw8ya8v4dcDB/MpwTRjuK4Li1Cpw6IhVIZvaopg2ZCVJZ2Us4qkaUvuH5wOK0tWB3385omFu
 4GNrCg2Mpr
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40845423"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UB38Yb5agjSFBCQ9Gmsp+da3qJ4QX9Ss1E3QAqaj1x95GcBheDQudcgWqaF8MRP31DlH4In7LKgSqKhYVk5GXUG+rOVPrzf9JauTv/i23v7ogBm/W8evwi6+alE5Cq0j4DRSVyJ8DdFyoJNTH7OnQZ5Gsk5LqUxc3+HxYuv6LlEPUcc8ORZGLPvq3Fa07lgY3jIbNS1ppsU6yZ7qzEOrYTkQvmNeFdSSaqGpETeRQo0Zkt9qhTXbzbK6Ww5ziqgPgG/M3NOt1LCy9N9ZRXDmh72ZPCGXpw/I/Y12eqG+hUWZTouxnh47ETlILkqHk21JXaooXmpMpIXzsMcYbARZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/X1/IcRwJR11b65tL6mpaHsmu4HvqDNJBrv71R5WXQ=;
 b=Id1bXDq3sVNWL5NjWb+fjk9Jgye5bmv/C2NZNBE+ZUFPDvgCorN0EuBLet5bBT69t6xvdugvNkYIwJKLAn4sPViN4BG2cc5dOhjddA8p/dIxlIO+XxtwV6bjfs0stJ6jZ7jHpegdwP/cMa98eIsCFYoEZ5ez8PAxP/ANLOR7WNjv8peZPaZtnP4pzb6bvhQH8Nfe3LvjSesEX3u0abI6f882mCRN5PWTOjqwzw29CLZx/tMQeD7sX2anWYm5Z9lRR+yAUaUE5chh5GJ4YuU/dsTdoSL9kR2B470o2dWnoPyyODzMIkABs2gv0gc1jVtu+KeMS7voEV8p9Wdz3R+v6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/X1/IcRwJR11b65tL6mpaHsmu4HvqDNJBrv71R5WXQ=;
 b=EYJnVnGDx36NhFh28hca3vMly03akcHcz6Aq65eXzeXgXTwJMB6bYayk3uMCYJyE2HlhDCM6jSnOh/UUc46pOMqrhNDJzPSbw/OY13zwKwkASWp81D6PWqmQ99ZvWzLKo4NO6djpROUiFQkLkJS/5x1Smz57FAqfqtYd1W3NGZ8=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, Ian Jackson
	<Ian.Jackson@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15 7/7] CHANGELOG.md: irq-max-guests
Thread-Topic: [PATCH for-4.15 7/7] CHANGELOG.md: irq-max-guests
Thread-Index: AQHXJvxUWijs3ZDWcU2QBjbhopWf8qqftWSAgAAITYA=
Date: Thu, 1 Apr 2021 14:46:43 +0000
Message-ID: <75E92685-8930-4518-8D8F-CF8CA8A2312A@citrix.com>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
 <20210401133827.362216-7-george.dunlap@citrix.com>
 <37b76a6d-e81b-1581-d89c-0d99a9d2eba9@suse.com>
In-Reply-To: <37b76a6d-e81b-1581-d89c-0d99a9d2eba9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66bbd925-85ac-475e-dfcb-08d8f51cf7c0
x-ms-traffictypediagnostic: PH0PR03MB5685:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB568553EAD8A4080621D418D2997B9@PH0PR03MB5685.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8c9S3cq8CsONJZaRg3SmoIr3bE2ua+ngV7EBRhAururpgVqxJ7Yc6O3iIVhfG6fx+TaUTlLT9IVrR14qqVZuxWSEl6lDR6DxNUBV4bBBQPhzxvhBGVp/621JIHP2/GT3pXUnsJU+7JcjWKYVSvycpIZbw/aFO9o9WaYiXJjjAP2TGc0+B2iScfxK0AzNg8kk3TcudgZayv3dkyryQoHDjH+MzzteokVzfZJuegA/u1KkQvhL08GBupKTCCi8tNC2ZuWTZDhcGh90cNNkQtEQB+xp58D7PEATKZL2+BoxiLGqthZT09PAYQPvghT0nQXttma2lYvLE0l31I9sqR5j2XmW/8pI5uLIrJgE11KW1pk0scjP3vCe01t8bEIGHreJC9zyXI4vp4k4I6vGREMywg+CDmCqzV7E1tXOiwhPDoRZaWkMp57O7Jq82i+F7FG1ruf6wRSpYud49kMnRIBLBSnhqU5fWzN0ACR9VTBIm5TkloYxL5bMghG2uiWnZ6oBGc0RJ62JC+ClRxRRDOp13gPNhBoaXY5tO0503WJmlVzWoGdM01sZEKWpfrbP7UjWksPAFwX53sRwnUtcI7j4r4VYLMSv31L57eEv8nKAmuUvFfzRvAH5LzUvC2NaNF1imEuLJhq7ZcGcDkCny5HE/H07AhPPK8PCiGZzmIMA8smFPhAeTKUkqxzFhMCztBUVBCBRYbofGVIOSG8e25IRk3XOfB8YZnw1xWnQkIS4GqX/Stq+nSPBB4oi6yUvTe8RNddR8kdJCYWlK+y/lTTFiqtPL7hX3Z1qUGBWYrtSbLX4qQKrBG7Qt9csu9vZV7Y3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(6512007)(33656002)(4326008)(2616005)(76116006)(186003)(6916009)(6506007)(6486002)(53546011)(71200400001)(478600001)(83380400001)(36756003)(8936002)(66476007)(54906003)(66946007)(316002)(2906002)(8676002)(66556008)(5660300002)(38100700001)(91956017)(66446008)(86362001)(26005)(64756008)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VWZKeWZjQlNreHVsVDB2Si9XbVRTK21BRUg3V1J6SDkzUHFCRHE3SzdFa1FW?=
 =?utf-8?B?QStIYjErQ0Nuc0Q5QjQyYmNhSXp2WXhTSVVCYjQ2T2w0ckNoZ0F4SFpqNE9V?=
 =?utf-8?B?NGNQYWwxSEh2TGhqcDFMT0p2cXJVa2FIZ3VBbjhHVmk3bnQwZzVjdFpxSDVq?=
 =?utf-8?B?dDNWblpBVWtLYkxqemN2bDZiTW1MaHY3c1NNcUtVRUxWQ1pvR05OaWwxYm9s?=
 =?utf-8?B?T0ZkclR2RlFEcUQzWWZTUXplSmNaQjBGK3JJcyttZGs4U1R1OThqYVMxaGx6?=
 =?utf-8?B?dCtkYy9JcmxTVWw5bW5UT2lKb2xGSmhyczAzUGhlR2owRzBhbnNHU21TazlS?=
 =?utf-8?B?VGVqRlByR2k2Y3BkV1lEaWJ4clF0SUpvbnVLSWpDVHc0K3V2VCtuRittQmZW?=
 =?utf-8?B?bW9tMGgyZnlOVDBjeTg3eGx1MUlYOTBoWERPVjIwYnNqQUNhZWZ5ZGgzeHhT?=
 =?utf-8?B?d01QWDJjQUtYTkJlVU0zQmQ4VEE1T1RkcjNZVzNFWjNCaldFSjFFbWRPaEVS?=
 =?utf-8?B?RzBHb0YwZmZidTl4WG1UUFJ0eUhZYjJ1STNMR3hLbWZUcUF2aHNpL0djdmdj?=
 =?utf-8?B?aHdIVXROc25oUWhWVWhCdVc0MkYwK0xIUXFuZEtyYnRFYWVtZFhkOElYL3Iv?=
 =?utf-8?B?T1h2K3hGN3JXN08ydlIrVFBXYTg4RjV3SWVEa2toaTIwMGRXZnB3Wnp6QTVo?=
 =?utf-8?B?R2dvR3JRbXF6RkpnMEx5Tk9MNXhZRXBhdWVnb0cvMVMzcE9CMGw2MnJYcVc2?=
 =?utf-8?B?RksvbkRueW9OUkIreHpkeEVqeDVaaTgxZmFBQTRCWDdLZjNpOWZpTGE4NFdx?=
 =?utf-8?B?S3R6ZjdEMzgyWStVdGF2eXI1MnBkQ1lSOXJvNkJ4VjRUeUZLQ3liQlVoSVEz?=
 =?utf-8?B?ZlVFYzVXd0NERFZHbTB2YzhjbzdXQVhBMXFoc2VueDhvNlpXOXZGZDQ1STg0?=
 =?utf-8?B?VnVERFpFOS9EM2JuQitHeDU4Uk9sdkF3b2pwcElsQllBVDVTelVNUjZ6TzRF?=
 =?utf-8?B?aFd6VlRWZ0dTcWdpUnB2K2VpUFJGdjgvTUgwdFdBTk1jaW9tSkZJTG5pa2M5?=
 =?utf-8?B?dzFoeUJMQmFVQUxLOGNVd3BzRWNaU29xM3I4ZGI4bUp4ZjcrZW1pRDNtV1Za?=
 =?utf-8?B?RXdaY24xSWRMSHZVME5xbU1pQXp4Z2ZvOGE3TkN6ejFzLzVCYS90bDFodFp1?=
 =?utf-8?B?bWN0aEZHU2FOMzVyc1dEbG0ySTE3M254ZXg1bDFzdVpzWGhibjUxNUFBa1BU?=
 =?utf-8?B?QlF0cFlRZkNjVFNGMTk3citSOEM2Vm5yTDkyd1JuNkVhdUxXMmhhZFVEQndT?=
 =?utf-8?B?elpXY3dtN0Z5OGM2M3FpQmViWHFLTHZmejF0bUROWVM3QlVVcXhyNmpqTDV6?=
 =?utf-8?B?SGJUK0FQOXRYejFqUVR1NEtLNElGSFJuRE5xUHZCUHdpa2NFbXY4YnNjK0RW?=
 =?utf-8?B?cjQ1MGtCQ0owV29ic0ZQbnFlOGpScWtaemlFUnc1cll6UlcyTUNmUnNtRkda?=
 =?utf-8?B?SXZySlVLV2JBK3hMZDluWkJZNkxEUXN1Qmx4VFA2TUp5QzNqbUpOWjdnRjdM?=
 =?utf-8?B?TzNwVlRtNHEzbDNXK1NFMC9sbkhpV0hZNzd5Vy9VWSs2enkzRHgwaGgrdGJs?=
 =?utf-8?B?UkQxS2JsbC9oNXpEekVWQ2JSOU9KaWNhWnRDaXFQa1pYTjJ1K0ZNbFJISDVa?=
 =?utf-8?B?RGQyS3B0bk1VSVZtdnNzSTVLUjlWVndpNWpZVkVvbWRDV1NQUnZ1dkJ1MmpL?=
 =?utf-8?B?WWNLZmFmVlRQTUkxQkhaMHNMSG4zNzkzL2NWTUQya2FqL3pkNUdzN0F6RXU5?=
 =?utf-8?B?MW54bFZHaDVSdDd5S3Nrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEC5E0C62F6133408AD26A791E8DBA50@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bbd925-85ac-475e-dfcb-08d8f51cf7c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 14:46:43.5903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YzzM5pWsivAToVgLu8UbcLxiPf0TzO1p0Oguu33kfb10YOUvEyWV5Y+aD0fsX4ycKD0j2++IKUhYg4bauND+rNhIqSKjDKVMRm7p3T/Bcf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5685
X-OriginatorOrg: citrix.com

DQoNCj4gT24gQXByIDEsIDIwMjEsIGF0IDM6MTcgUE0sIEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMS4wNC4yMDIxIDE1OjM4LCBHZW9yZ2UgRHVubGFw
IHdyb3RlOg0KPj4gLS0tIGEvQ0hBTkdFTE9HLm1kDQo+PiArKysgYi9DSEFOR0VMT0cubWQNCj4+
IEBAIC0zMyw2ICszMyw3IEBAIFRoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAgYSBDaGFuZ2Vs
b2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykNCj4+ICAtIFNvbWUgYWRk
aXRpb25hbCBhZmZvcmRhbmNlcyBpbiB2YXJpb3VzIHhsIHN1YmNvbW1hbmRzLg0KPj4gIC0gQWRk
ZWQgdGhlIGZvbGxvd2luZyBBUk0gZXJyYXRhOiBDb3J0ZXggQTUzICM4NDM0MTksIENvcnRleCBB
NTUgIzE1MzA5MjMsIENvcnRleCBBNzIgIzg1MzcwOSwgQ29ydGV4IEE3MyAjODU4OTIxLCBDb3J0
ZXggQTc2ICMxMjg2ODA3LCBOZW92ZXJzZS1OMSAjMTE2NTUyMg0KPj4gIC0gT24gZGV0ZWN0aW5n
IGEgaG9zdCBjcmFzaCwgc29tZSBkZWJ1ZyBrZXkgaGFuZGxlcnMgY2FuIGF1dG9tYXRpY2FsbHkg
dHJpZ2dlcmVkIHRvIGFpZCBpbiBkZWJ1Z2dpbmcNCj4+ICsgLSBJbmNyZWFzZSB0aGUgbWF4aW11
bSBudW1iZXIgb2YgZ3Vlc3RzIHdoaWNoIGNhbiBzaGFyZSBhIHNpbmdsZSBJUlEgZnJvbSA3IHRv
IDE2LCBhbmQgbWFrZSB0aGlzIGNvbmZpZ3VyYWJsZSB3aXRoIGlycS1tYXgtZ3Vlc3RzDQo+IA0K
PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBhbGJlaXQgSSBh
Z2FpbiB3b25kZXIgaWYgdGhpcyBpc24ndCB0b28gc21hbGwgLyBuaWNoZSBhIGNoYW5nZSB0byB3
YXJyYW50IGFuDQo+IGVudHJ5IGhlcmUuDQoNCkF0IGxlYXN0IGl04oCZcyBhIHVzZXItdmlzaWJs
ZSBjaGFuZ2UgdGhpcyB0aW1lLiA6LSkNCg0KSXQgd2FzIGluIGEgbGlzdCBvZiBwb3RlbnRpYWwg
aXRlbXMgcGFzc2VkIHRvIG15IGJ5IElhbjsgYXQgYW55IHJhdGUgSeKAmWxsIGxldCBoaW0gaGF2
ZSB0aGUgZmluYWwgc2F5ICh3aGVuIGhlIGNvbWVzIGJhY2sgVHVlc2RheSkuDQoNCiAtR2Vvcmdl

