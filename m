Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFB13515B5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:45:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104566.200141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyZg-0006Yn-Oj; Thu, 01 Apr 2021 14:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104566.200141; Thu, 01 Apr 2021 14:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyZg-0006YO-Lf; Thu, 01 Apr 2021 14:45:32 +0000
Received: by outflank-mailman (input) for mailman id 104566;
 Thu, 01 Apr 2021 14:45:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8z4=I6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRyZf-0006YJ-78
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:45:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9de1d262-dbe7-48b7-a6b9-abc347d03faf;
 Thu, 01 Apr 2021 14:45:30 +0000 (UTC)
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
X-Inumbo-ID: 9de1d262-dbe7-48b7-a6b9-abc347d03faf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617288330;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+SMCs+kCKLmK4bYTHtUZXrRzZSCtcl8QipRQvnQOyGU=;
  b=YmXiZRu2fK7s4gSFEGHQDwxqZr4iaaUnw3zTQubYugKmsDKPlLHcze/S
   a+sQxSBBDLnjtA2PtvaL6hfoKEj/T/jy9OjJVT0M92lXDv3TF5IIU4LWI
   yCjo5tqWjDRpc6mo8Op6Jn6P3NJs/I7+Qk45xIC+BbWDIhTgk7MK0KXtX
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uuWrwnbwGXfdGk8aKpRbwoiGe2/X46ihQTz+w1ZsoXp75cdAfpNd36WwGhbmoyWA3pptt8jZ9y
 cn61V0LhG2qa0w1pIHZDgQFDmf+0n6vOCX1UiuKc3+pORo9ZVTqd9LUg3sFusaO81ookd/fbd6
 vBh2XlDJwuOKKfbHIogTTMPWbzpChlnR+HEKISeWUreuRPc1MUSGuBnZ2WZG6mHcGHtOLLS9Cy
 QPEr8jbBOjRGMuC2g8a2jnp8S/ndDKs8+rkqlt0JZScyvhjkm0tHbFVHPa+cjo4MY+5yIWG5Wp
 wVA=
X-SBRS: 5.2
X-MesageID: 41083903
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IP1c4qMh5oL3w8BcT8P155DYdL4zR+YMi2QD/UZ3VBBTb4ikh9
 mj9c5rtyPcpT4NVBgb9eyoF7KHRRrnm6Jdxak0EfOcUBL9uG2uRbsSjrfK5zH7ASXx+qp8+M
 5bAs1DIeb9B1R7ksr2iTPQe71LreWvy6ywgPeb8nEFd2FXQppt8htjDUKjGlB2LTM2YaYRLo
 aW5cZMulObGEg/U8LTPBY4dtmGmvmOvKijWAUBCgIs9U2wgSjA0s+cLzGomio7Fxt0hYwv63
 TBjmXCl8OemsD+9zuZ/1WW045bg5/I08JZAtOBh4wuJjLghh3AXvUYZ5Sy+A0Q5MmUrGoxnM
 KJiBInNcZ+5jfqcma5rQCF4Xia7B8er0LHjWW+vEGmm+jFfVsBerZ8rLMcTz/w0WZlmNlg2q
 NG0lm4mvNsfGr9tRW42vzhbT0vrUavvX8++NRj9UB3YM8iTJdqgcgh8FhOEJEGdRiKlbwaLA
 ==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="41083903"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkDRfJfiVW1EGZ0UDGaH71Bg2DFnQxPf7Vbz9DlcWM2EkfFke50+mRi9NIJnCNzC2/JbGl1B6K167qLZoqGalb6gzp+NQPDF4Py0lX03V2oKaR2xxqHpUfJpDgCo8RF7lWfzTXvXxM5E5b/GQquQDb3ba7K/DeeyWKWysEbsplR7xZlRTD8M36UQcVi2AkN6VNbfk0SiYlbpA/1TQq3YL62+PSNzvWJQSVIBS1UtsluK4s97mPM20nhD8QNHPXkUbF252eXWy+T9XAk7G/uFLd4sYjKzcTAub9oQgmREvVj4Km05RIikURTc3M35tGoTg4Afc1thVjOhbSh2x1cjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SMCs+kCKLmK4bYTHtUZXrRzZSCtcl8QipRQvnQOyGU=;
 b=mYGxnGVDi7Hu/uKgAHWG/H/Ld7lbioOEdsXwWcGYs1WRDKBjon4Vj5APPIuVFUHH4hWWnXjHqFBN2QLaPirGqDu9EruQlrB9f70xjJiu9aoM0h7SOL4SmqBkTBHvzlybLHGf9lzHNQOh0uKqWpnpFZJifyuD0FQxL/QFVW8/GL8DImodFcreu9yai6QKkgdonpytb823UZXuasr5Km7X9sA/wQhlO/oqr7dfChGSGmN3xf2WhliWxndkXgi9WFMxxF+Wgg9xSH7q8JeOzST5EW45obMOc7B4s94td96XaPE7A/2zZyc+/OHTcZvEyt4ynqDsWzTkgmT5aXr0nEKsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SMCs+kCKLmK4bYTHtUZXrRzZSCtcl8QipRQvnQOyGU=;
 b=eqL62Frk9qa1UobjV+7HBVZu9VGITn75zZQrSkIGH726eHzT5ytHJC9heVCLMzIArS1d8MvsnElRUdCziRtpPCTEuXnT03QWPbaX6XFTVxayPbN/1F84Eap/8H7TQ1pE445GrJBRnZNykivm7Ed1UExskm4w22U1wjGZq/ulqMQ=
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson
	<Ian.Jackson@citrix.com>
Subject: Re: [PATCH for-4.15 6/7] CHANGELOG.md: Various entries, mostly
 xenstore
Thread-Topic: [PATCH for-4.15 6/7] CHANGELOG.md: Various entries, mostly
 xenstore
Thread-Index: AQHXJvxUtSxo6M4mo0iX7TVVNapv+6qfsM2AgAADtYCAAACaAIAACDkA
Date: Thu, 1 Apr 2021 14:45:26 +0000
Message-ID: <D6FF9EC7-DEEF-44B8-82D4-69879562F496@citrix.com>
References: <20210401133827.362216-1-george.dunlap@citrix.com>
 <20210401133827.362216-6-george.dunlap@citrix.com>
 <97d317fb-16d7-a14e-e74e-62fa83159838@citrix.com>
 <07553207-90AA-4AD4-A5C2-C8F36411DDCB@citrix.com>
 <d3941c9c-cef2-5521-7028-2fde1f727ae3@citrix.com>
In-Reply-To: <d3941c9c-cef2-5521-7028-2fde1f727ae3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1dd0628-3755-4797-f32c-08d8f51cc9d5
x-ms-traffictypediagnostic: PH0PR03MB5734:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB573496E988B1AA523D8C1AD8997B9@PH0PR03MB5734.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PY3Dpr8cgLQ9YSvNbUlZUxgMv1lyNMW0FohnV9QeTKBtr6HKS9oBaMSiVk+fAvEHWCicTy4nCuB312Dtf9f3SXZpkM0PCVDpo/8QtquFlTbCuZpHtKiazGW47Gk/y/Nm/kywQ5GnrOFQY6P9C74N1Kl0COkp2lIJq/zeDLKHDcvb0fOxa5llcQJXMbk/+fZdgBVYXuMcjF4vU5C+Jp7wa6nwWu9zHfN5YTPGh1BamjjdRNsgxH6jiGQKaRE3mxSxLPww5uBCMOa6iLki54hmJHh9hbmUE2ptCTu1RvsWllkLevKHmgBBrMQLK0LGMlP9302tohESNMOkmmB6PQOcLK+MoQVXHlaZXpqzigPfwx3GWx+gO9hewtydf5iGsytbwRssBAMy0S4Y4E8Xhk0G/bdYAWaSjF3VtwBnOVMWLkRmwYsIQ/HmuDGpPHI+W9aAHwVwu9v5b7K2zO1Wzhzi7NqjmDXLJVYhXhCV0j50kOcU/ezupnLS02i9GmowRtIWPYxC85mQH+S/ezYcfzV5eQmrUKCgJZ0FadKvUmv67VQOgovGHWeK549kSKjMZvhEoa1NxTEyI4XkYgVZGz9cC97pRYOCAqGK/4R/KbGJA6XF4mc1pp+F7m03S8ycIB/OXR83zOOp2poUCPwaRtWyHzLMpgjCPHvYjX3ZVAJKK7tHbjxRgpx05nbQK7IJyycDYNenvR/sbbMW1V7lu+23C75V9C8tQNktekNHab3ctXdcRmIUSsOXIsCs9AHuOA02TQYWznXIM882J6wdIo8OvsjEgqeZ4Nwf/QenzXmg8+4Nmupba3skAIwrxontJiAv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(64756008)(6862004)(66946007)(83380400001)(107886003)(66556008)(66446008)(66476007)(4326008)(54906003)(76116006)(6512007)(91956017)(38100700001)(2616005)(86362001)(2906002)(6486002)(33656002)(36756003)(71200400001)(186003)(316002)(37006003)(478600001)(8936002)(53546011)(8676002)(6506007)(966005)(5660300002)(26005)(6636002)(207903002)(219803003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Si81Sjc2R1JzcGl0YUJpbHhBWnY1ZXhsZllKRWVJbWhkaHBJMU44NC9KTXMv?=
 =?utf-8?B?WTRnYkJPbHkxYU8vVVc1QmRlRkIwWjMyZHcvVXE5TzF2WHlNeDVmSmpZb3g0?=
 =?utf-8?B?RW5uWVVEZXBlMWNEdXR6bGhLazF0MzBPSktEREVRNE84SzdSOTd2d1lKUTBj?=
 =?utf-8?B?MVJJd2ZmZVM1VW5XNGhDcW1tdnVEMEJmbHhKbjZqY1dnYkZJZXgzV0ZVRHRT?=
 =?utf-8?B?dk5oWmh3T292OEJ5VFZ3bVNqZ0dERUFtSnhVVmx1Yy9Ub0RaL3JsWkIxdEpm?=
 =?utf-8?B?bTdGdU5RektLNE5ta21RTEx3bkNrZ0hDNXhjYkpZKzdiYWYrNVNSbVZhUlBK?=
 =?utf-8?B?T1dOME8yN3lUZmQzdDI3a1NwLzJiVzZvNU40MTZTWXZlMDNnZXVhbFcvNGlN?=
 =?utf-8?B?RWVaMUNsckJ1R21nMzJoZ1VrdlFTaU8wSVMyUk1UdVJVOFBRZFYxeXNlRTR6?=
 =?utf-8?B?M0dEVk5iZ29jTkN4eEpqVWtBa1Q2WlZNSWJKbzZBU0RiUlZTVE4wWEJkZFIy?=
 =?utf-8?B?M1RiNlNodEgxNHMyUXIxOS9mYjJhOHMwa2JQM0NtZkdTMDFUY2hSZGV2SWgx?=
 =?utf-8?B?Y29sZXpHMWhsbFJRSVpyemZnK0lKQjlOOGRWeGdaUjJ5S2FiTXZtNHJNa2w0?=
 =?utf-8?B?Tm1abEI1WEJJVTA3a2h1LzBUS2ZGV2t1WTliTzJvU1ZXekVuc1QrT292aFFx?=
 =?utf-8?B?Y2ZPRHArZEo4THVZNGZKVU1HWUZTZjBweHBZUE5XTUl0b25QNURRYnNKaFF3?=
 =?utf-8?B?YnRvUVUwRHNNd0lJTlM0MTJFd2JOWGYrTEc1RnJDL3JGcmxwUjBoWlBmQlBm?=
 =?utf-8?B?UXlzYkN4bUpiNHFvNGdHU1BRQXdIdnRHcnhWMTVFajZLNDF3K2RpWldnMzN0?=
 =?utf-8?B?blFFSndKK0t4SWxhV0JsMnJmc1hxNlM3eHYwbWhqRktFdDQ3NGw5K015YkFD?=
 =?utf-8?B?c0lHMmp6QVdtcHlPdUZvbEQvaDhqMjBKUUV1Si9EZEZ5RklGekMrNzNjRGJB?=
 =?utf-8?B?S0xJemFKaVkrSVAzUElBcVZkMzhDWmlHN0FxZmdubmdWcSs2S2RvSXM5T3Z2?=
 =?utf-8?B?NGZQaytGQUhNQ1VRdlZBWEpXSjdzUnZMM2Y1VTFPaVQzRXlhYlBueDlWc0Nw?=
 =?utf-8?B?UVdISVJkVkFhVmtENDBwa280ZFcvVUt0aVgyTEI4MEx3U1dZaUd6bmdYMmVS?=
 =?utf-8?B?TzMybzZ5L3lQNzZNYTZCcG5XZlc3Umg2dmwyWGkvN1hBOStRdGFsOWNrUCtP?=
 =?utf-8?B?ZitqaVVYWUk3Q212eTYxd3JzNy9CSks4OVpyLzhWcldkZXJDRnRYYXJiOEtn?=
 =?utf-8?B?RHp3clY0VE5mSWxXUnhIdWhUMHZ2R2NYbHc4UkpZbURqbnowVDBWUFpDSUdF?=
 =?utf-8?B?WGg0NmVtS2F4NXBxbnE3YUM3c1hkbUxnSGRmZWs2UWtlQVBzZnk0ZVZXL2N1?=
 =?utf-8?B?T1o4VDRDbFZUU0dYYUFBZ1NBcXF1LzM0dTB3aUhCcVkyeHpPem5JTzZkVmx5?=
 =?utf-8?B?aHR4T01vZUk4M3crdVdkd1k5TmRDSHdlZzhqL1JEVlI3bWJHYTVrYkJqbHZ2?=
 =?utf-8?B?VDh2Yi9jNmFXOVcrWTlUcVFmODArNXdtd1pST3VqUzBOc0wxV2lraEhXczJs?=
 =?utf-8?B?V1BvcTd5VHpRQVBPQjAya25OUnJjUmxER0l6eTd5REl6OEk4N3NCTi9hck5I?=
 =?utf-8?B?UlhaQ3JWM3pmWkdZT2hJcUMrU3hRWStXMFpkZmRubFRKR0doaStDdEhTL2lJ?=
 =?utf-8?B?Q1Z6dW03TnZZdUc2L09mY0hVTUVBVkFyZWhkOFRCZUhRSWJHelAvNlJ6emJ4?=
 =?utf-8?B?d0RKbTVoRTJCV0w5b3NrZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94467862BD31964D849F4B0CAEF668BF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1dd0628-3755-4797-f32c-08d8f51cc9d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 14:45:26.6339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NibM+MqUfHMPYtXG6cMMLYVWsGhf2L38BRlXKSzP1XZJaQB4rkXzw3QbH82kmCPnvWvsBk0q0Es7VEMvOy2pZLH9oun9RPRXpNaxBBa6l8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5734
X-OriginatorOrg: citrix.com

DQoNCj4gT24gQXByIDEsIDIwMjEsIGF0IDM6MTYgUE0sIEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gMDEvMDQvMjAyMSAxNToxMywgR2Vv
cmdlIER1bmxhcCB3cm90ZToNCj4+IA0KPj4+IE9uIEFwciAxLCAyMDIxLCBhdCAzOjAwIFBNLCBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4+PiANCj4+
PiBPbiAwMS8wNC8yMDIxIDE0OjM4LCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4+PiAuLi5ncm91
cGVkIGJ5IHN1Ym1pdHRlcnMgLyBtYWludGFpbmVycw0KPj4+PiANCj4+Pj4gU2lnbmVkLW9mZi1i
eTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KPj4+PiAtLS0NCj4+
Pj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4gQ0M6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+Pj4gQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBjaXRyaXguY29tPg0KPj4+PiAtLS0NCj4+Pj4gQ0hBTkdFTE9HLm1kIHwgMyArKysNCj4+Pj4g
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBh
L0NIQU5HRUxPRy5tZCBiL0NIQU5HRUxPRy5tZA0KPj4+PiBpbmRleCAyZjI2Y2Q1Yzg3Li45YzI3
MmEwMTEzIDEwMDY0NA0KPj4+PiAtLS0gYS9DSEFOR0VMT0cubWQNCj4+Pj4gKysrIGIvQ0hBTkdF
TE9HLm1kDQo+Pj4+IEBAIC0yOCw4ICsyOCwxMSBAQCBUaGUgZm9ybWF0IGlzIGJhc2VkIG9uIFtL
ZWVwIGEgQ2hhbmdlbG9nXShodHRwczovL2tlZXBhY2hhbmdlbG9nLmNvbS9lbi8xLjAuMC8pDQo+
Pj4+IC0gRmFjdG9yZWQgb3V0IEhWTS1zcGVjaWZpYyBzaGFkb3cgY29kZSwgaW1wcm92aW5nIGNv
ZGUgY2xhcml0eSBhbmQgcmVkdWNpbmcgdGhlIHNpemUgb2YgUFYtb25seSBoeXBlcnZpc29yIGJ1
aWxkcw0KPj4+PiAtIEFkZGVkIFhFTl9TQ1JJUFRfRElSIGNvbmZpZ3VyYXRpb24gb3B0aW9uIHRv
IHNwZWNpZnkgbG9jYXRpb24gZm9yIFhlbiBzY3JpcHRzLCByYXRoZXIgdGhhbiBoYXJkLWNvZGlu
ZyAvZXRjL3hlbi9zY3JpcHRzDQo+Pj4+IC0geGVubmV0OiBEb2N1bWVudGVkIGEgd2F5IGZvciB0
aGUgYmFja2VuZCAob3IgdG9vbHN0YWNrKSB0byBzcGVjaWZ5IE1UVSB0byB0aGUgZnJvbnRlbmQN
Cj4+Pj4gKyAtIEZpeCBwZXJtaXNzaW9ucyBmb3Igd2F0Y2hlcyBvbiBAaW50cm9kdWNlRG9tYWlu
IGFuZCBAcmVsZWFzZURvbWFpbjogQnkgZGVmYXVsdCwgb25seSBwcml2aWxlZ2VkIGRvbWFpbnMg
Y2FuIHNldCB3YXRjaGVzOyBidXQgc3BlY2lmaWMgZG9tYWlucyBjYW4gYmUgZ2l2ZW4gcGVybWlz
c2lvbiBpbiBvcmRlciB0byBhbGxvdyBkaXNhZ2dyZWdhdGlvbi4NCj4+PiBUaGlzIGlzIFhTQS0x
MTUsIGFuZCBpc24ndCBzb21ldGhpbmcgbmV3IGluIDQuMTUgdnMgNC4xNC4gIChJIHRoaW5rPykN
Cj4+IFhTQS0xMTUgd2VudCBwdWJsaWMgZHVyaW5nIHRoZSA0LjE1IGRldmVsb3BtZW50IHdpbmRv
dy4NCj4+IA0KPj4gU28gb24gdGhlIG9uZSBoYW5kLCBpdOKAmXMgY2VydGFpbmx5IGVmZm9ydCB0
aGF0IGhhcHBlbmVkIGR1cmluZyB0aGUgd2luZG93LCB3aGljaCBpdCB3b3VsZCBiZSBnb29kIHRv
IGhpZ2hsaWdodC4gICBPbiB0aGUgb3RoZXIgaGFuZCwgaXQgd2FzIGJhY2twb3J0ZWQgdG8gYWxs
IHNlY3VyaXR5IHN1cHBvcnRlZCB0cmVlcyAoPyksIHNvIGl04oCZcyBub3Qgc29tZXRoaW5nIHlv
dSBuZWVkIHRvIHVwZGF0ZSB0byA0LjE1IHRvIGdldC4NCj4+IA0KPj4gSG9uZXN0bHkgbm90IHN1
cmUgdGhlIGJlc3QgdGhpbmcgdG8gc3VnZ2VzdCBoZXJlLg0KPiANCj4gV2UgZWl0aGVyIHdhbnQg
YWxsIFhTQXMgZGlzY3Vzc2VkLCBvciBub25lIG9mIHRoZW0uICBQb3NzaWJseSBhcyBzaW1wbGUN
Cj4gYXMgInRoZSBmb2xsb3dpbmcgWFNBcyB7Li4ufSB3aGVyZSBkZXZlbG9wZWQgYW5kIHJlbGVh
c2VkIiA/DQoNCkkgZG9u4oCZdCB0aGluayB0aGF04oCZcyB0cnVlLiAgVGhlIHZhc3QgbWFqb3Jp
dHkgb2Ygb3VyIFhTQXMgYXJlLCDigJxNYWtlIGl0IHdvcmsgdGhlIHdheSBldmVyeW9uZSBhbHJl
YWR5IHRob3VnaHQgaXQgd29ya2Vk4oCdLiAgVGhpcyBpcyBhIHVzZXItdmlzaWJsZSBjaGFuZ2Ug
aW4gYmVoYXZpb3IuDQoNCkxpa2UgSSBzYWlkLCBJIGRvIHNlZSB5b3VyIHBvaW50OyBub3Qgc3Vy
ZSB3aGF0IEkgdGhpbmsgdGhlIGJlc3QgdGhpbmcgaXMgdG8gZG8uDQoNCj4gSSByZWNhbGwgTGFy
cyBtYWtpbmcgdGhpcyBwYXJ0IG9mIHRoZSByZWxlYXNlIG5vdGVzIGluIHRoZSBwYXN0Lg0KDQpM
YXJzIGluY2x1ZGVkIGFuIFhTQSByZXBvcnQgb24gdGhlIHhlbnByb2plY3Qub3JnIGRvd25sb2Fk
IHBhZ2UgZm9yIHBvaW50IHJlbGVhc2VzLCBub3QgZnVsbCByZWxlYXNlczsgc29tZXRoaW5nIEni
gJl2ZSBjYXJyaWVkIG9uIGRvaW5nLiAgZS5nLjoNCg0KaHR0cHM6Ly94ZW5wcm9qZWN0Lm9yZy9k
b3dubG9hZHMveGVuLXByb2plY3QtYXJjaGl2ZXMveGVuLXByb2plY3QtNC0xMy1zZXJpZXMveGVu
LXByb2plY3QtNC0xMy0zLw0KDQogLUdlb3JnZQ0KDQoNCg==

