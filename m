Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6D6891208
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 04:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699236.1091953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq2wc-0005uw-Tm; Fri, 29 Mar 2024 03:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699236.1091953; Fri, 29 Mar 2024 03:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq2wc-0005tO-R0; Fri, 29 Mar 2024 03:30:18 +0000
Received: by outflank-mailman (input) for mailman id 699236;
 Fri, 29 Mar 2024 03:30:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipQJ=LD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rq2wb-0005tI-Sl
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 03:30:17 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20701.outbound.protection.outlook.com
 [2a01:111:f403:2407::701])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6d0a752-ed7c-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 04:30:13 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB7241.namprd12.prod.outlook.com (2603:10b6:930:5a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.39; Fri, 29 Mar
 2024 03:30:09 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa%6]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 03:30:09 +0000
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
X-Inumbo-ID: a6d0a752-ed7c-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXTF5y9Ba1JUFutFTZI0UvG3o6TC91tZB63qeKhPjdPYF1I+L98H7SZ8y1UJTBbg6wssPPWPcuGjdYbwUfr4xVWsPx21N0uWj63p3UbsPJMlybFJtf4XIe/NIF9quonhL/l5QEG30FsvUOgJe2Tal4XCPu1YQVQhulB+oWTWQD6qXz602KxFDMDZvB0qvRHQqzHgxF6uUoGzqC6OSIa2RDTJYhRTjYEtDEK/EiuP1d3Qal6wMwyw+SqSsMMAMIXOxXQsixqvGgrupejiNz+p/9kTXKX5IquAAb2Gt0UHS2S+LDS1Yld7nwXw8P/alaVmdFGEOzr1ns5v9jd4FRA5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwiNTHxaHbwZ4OFEbcYYoIQWloqK5FOrBoK86xtQ8m4=;
 b=SRcUncrmJf5I16xgvb5dqP3HWWVwkRkMlRMrbmG6jjSUbWO2nI4bnM9LFl8qiLwBMVytgDGD+okWYCB+8LmTgMYR/+7jOSzysMM2gP4ZvSqTQtg7e3FxjTuwY95xqHyRRf0/FYEblgP540f9jPdN9Ct7LdVSJMJySLKiHqR5YH6kKxDUFUg6nkC3B6liMpL2VSt9JQbyIjnFf9oChpEN24O6AgmmF2/8zVlkk2rFF8ZvASubuG0M4BF7lFnubkiAl7rFQ6aYgSHUaI3pl732zMJ6ylqugQrnxR2faZ2KDQ6GyuxSafx/unrovY0zjouPxHqIRGTYsxgSHvyn2hH8Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwiNTHxaHbwZ4OFEbcYYoIQWloqK5FOrBoK86xtQ8m4=;
 b=CFllYnUXoe74JyAqHHifBnxGVA5KM2hyixfSYPY67wvb1MwloL9f3Zr+j9anQSxj1osdlRzkB6AbTdbCEv00k15S7tv6Ekm/vIuB/VcBXpcvNGyJxe512qPP10oj2R9xZLi4QNsD3NLHgsVzqPPNDUFIf9/YAfnx667pt3VTRB0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Anthony PERARD <anthony.perard@cloud.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v6 4/5] libxl: Use gsi instead of irq for mapping
 pirq
Thread-Topic: [RFC XEN PATCH v6 4/5] libxl: Use gsi instead of irq for mapping
 pirq
Thread-Index: AQHagNoDtKajNm2Sn02wRhj0zSTb0rFNag6AgAEsdoA=
Date: Fri, 29 Mar 2024 03:30:09 +0000
Message-ID:
 <BL1PR12MB584999C4A3A566E87A534B64E73A2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240328063402.354496-1-Jiqian.Chen@amd.com>
 <20240328063402.354496-5-Jiqian.Chen@amd.com>
 <81c6e63f-b493-4bbd-a91a-ec0e04cc69e2@perard>
In-Reply-To: <81c6e63f-b493-4bbd-a91a-ec0e04cc69e2@perard>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA0PR12MB7674.namprd12.prod.outlook.com
 (15.20.7292.000)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB7241:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ussHcZexw+0eqdKh/S4h/QOiwPJlrP+cffVtaYOFETHgNz1TFJmEmt4gLy9eyljg9XIaPt3jwMoHkYcfPFFHizHngwAzocRxenbH1K2mRHX8/7UGwM9YNiXe2ZDD0Odf2lfZ/v8Dt5V5wBdjXNbB6DLQsKb0HGWtrzsel5yI2L9cx0Lb/gogfq/zKOQ9SB7jdpNmdj6djePyC+dLcOLC6UxDnTBHNQ8ehnHNx1/CjCmO3ZiVQRue2YDWOXNHu/BQQ9ktjQ16XoeOCoQakEVxDMnA4hYTAxl7kdnhH3+v5+1EG8h2wzNC99+g9rh+lto8Hc7aqFjyYVgSJQIDgik/cnjpC1w294FIWfMNSzty0A7uhxx1k6LrO32Mz3DaTcWvyP0o5Evmc+bu9XylWPxtyJfGPhUJZmP8a05b7AQgextl5lvEqaQG1/PufnffCL7rP7BdZKp1/vJd5FHeZ8M4dAYFHXTNy/4YID5TZ5+HXi8JUC+anxbwidRmOz9Lb+MON+lnrpSaVX8gqO31iQ7nzxBlFfGMSdfWuuso1n8iPSfG7Zoax8LUOwffizCHUJKTmud7SWEjDXoMzrc/pwN9J907QdfiqMFUSpoIr2+LTRnMECikogZ52ZbFqmE5dAOS+FSgG0CvvmlEwZQWc4oIHL60xEKrpEuWfZZP0GFgDd4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VW44MU5ZTWREdnNnZk9EZStRQVErUStsS1ozZGhFdXI2Mys4RmhiR29VS3JY?=
 =?utf-8?B?clNPM3NmVXAwNDVMN0VjZlllNlJ2UXRlditqYnZqNktSaVNsdlNkMXBPUjRw?=
 =?utf-8?B?bDM3UzJhN0VHNWtGWGNCSVVlR213MFJpYno5OUFTdCtVd1BTa1RLRnlJRnUz?=
 =?utf-8?B?MnNlcXJTVXVlMWVyRFVYMFhCY1lvQTNzM2dUTFV0a3hncTRyZ0NzcldZS3dm?=
 =?utf-8?B?V0YzZVEyM1lUdDFFa2FKOG1JV3BpaW1jUXpzcmhoSkdCclNXRllxUlFFYzdW?=
 =?utf-8?B?SEJxL2ZjaVF0dC9zRFhDL3FoWi92dDcxNjBZVWtVRURBTGppL3RCaC9kbkE5?=
 =?utf-8?B?KysxRUxpd2JOLzlpdytuR0M0bVBwV0EvZnVUbGQ0VmttbzJpRGVkNngyNmlJ?=
 =?utf-8?B?dkV3cXFEbzlxc3AzSTJGT0NTZEU2N2c0VE1XY29BallhVjdjSEJIMFQ3MlVv?=
 =?utf-8?B?dGZ3UjUzdGo3QjB0aVRZdE5DY1EvTlNQbElRUm1DQkVBS3A4UWIrREV4NFo4?=
 =?utf-8?B?TmtJZHRvM0NIblNxZHE5MUE0WEZOa0VSTEUzWVg2bU5kTkhyMmNNenhIU25C?=
 =?utf-8?B?c3BuNElUU3dleFlrNXJQNkMzR2NNUkd6STlqZUUwemJ1aVgvUFpmZjNLREFQ?=
 =?utf-8?B?Q0lnYTlZVDg5ay9yR1hvZWFTNnc2SEIzeGI0YmxkdXNvUWU5VlBPTDY1THp1?=
 =?utf-8?B?ZzJ0QTdCcjBkRlk1MjVTRldBTEpiRDFBQzJDM3lFZE4wL0gzbUZBMWt5NE9V?=
 =?utf-8?B?K1VvVkZpOENWeUNqYjgrOXo2QkZoL3Z0YnU0OXZGWk45VlVpRjZ0amNVajBG?=
 =?utf-8?B?c3JyTWZkYWVTM2ZwUldqeERDcjJib0o2ckJqK0kwYi9yY1ZXYUZJYVdqb0RM?=
 =?utf-8?B?ZnRUSndTK2Qxc3YyWTBrVk05M25kYktOUFVEZ0FNaEtYQnA4Uk9GNHN0Rm9v?=
 =?utf-8?B?WUtiUUVCYXpkdkthZ25GRFFDaGVDVjhndllhR25hWGg4NTQ0YXUxanE1U1lW?=
 =?utf-8?B?bW9zWm5KaHdkcVJmK3cwZk91aVVOYzk0ek05ZDAxZndhNk53blY2ZnZqbVNT?=
 =?utf-8?B?N2FraFV5N094WEoyb0VkNGtnbUFRMUZFT0JmQlBZZHlYdCt2ZVRYeGpLK3Z0?=
 =?utf-8?B?bThJZ3F3U2ErRlI5RnVqcEs5R2VGR1FoYUR6Z1dEaFRaWTRiellYMGtMWjZK?=
 =?utf-8?B?R2ZQbDBrVVRQbXRYNGxLeklTKzdtdUVHUkExaDIyZkNzNC9ZVHE4ME9UZVlj?=
 =?utf-8?B?QXJPMjdhMG9nYTBQOUhvS3h3TlpUTmlHb2UyZGUvMjZtcXFUeFFaNWhPUUpt?=
 =?utf-8?B?Y0VBOElsUjVuQmdSNnRMbm90dFZIaUF4VFhwbFJkZmJ4aERXWFprRTROTlZK?=
 =?utf-8?B?a2hsekptNkV6dWtWbGNyWmJiT1RRQnJYdFk3VVhzWVAzVHhyUHB1Zk9EWVNo?=
 =?utf-8?B?VHJUcXVHRmxyQ1ozVUlmOEZKcDgxUFFidkoxS2hzcHhaenJqclo4cHlqWDI0?=
 =?utf-8?B?R3RHbWdLd2hKNFMvV1FFREFFN1B2eE5kSHZhVHBkSmlZcVQ5WW1Odm14c1lF?=
 =?utf-8?B?NldMWWhuTHNCVDUzdFVvMCtOa2lUM0phK0dDNVd4bUp5TnNFeU9EbFpta0Fa?=
 =?utf-8?B?N29VRnB1ZWpVOFZvZEllT0I5RFVrWFR3MnVkaUJkVS9RNnQrU1cyWCtCOUxN?=
 =?utf-8?B?RjBTbmd6cEtiVWVQMzRFZmp2Wk1uYWlnZ3RqTDRQZDdQQUpYOXg4QVlzREx1?=
 =?utf-8?B?OElsdVNpZ2orYWR2UU1kajlQVGNZZVU5M3N3Z21PRThJempacVlYd3dOR3N3?=
 =?utf-8?B?enFjWXdmcUpqZ0xoQkRPRzBDMGVRYmZSajFXRHJkSGpMdzJZMitweENsa1I4?=
 =?utf-8?B?NDJ6b2ZvU1pxd04xWExUZW5uaFBMcjgxOFRxV0dycDB0L05hZDcrU1lQMXlh?=
 =?utf-8?B?Qk5TZ0x3RnNFazM2L0F2T1NFQ2hYeFF6M0xCWDExdllHNXBIQUp5Lzhtc2kz?=
 =?utf-8?B?Z0NiNnROZWdDU3kvaGR0V0V5L1JNV3FMYUoyWHBhNEtETFdneE1icmdoVHBN?=
 =?utf-8?B?cWxabE1LR2oyTTBKY1BSRjE0L1lRZFU2ek5rMk1MdUVNbXpWNDBQSG4ra2o4?=
 =?utf-8?Q?+mvs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <283BAC2A656A024B9BFB4E1A6DD37AC0@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47017b84-d131-42c3-202a-08dc4fa08926
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2024 03:30:09.3543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SWuO5Tq0hYwuYijYSG2fEWEKrbFu+vI49C1+mD0O8B9rT09Ipi0NkVB4DgY7ml1QdDyga66TcGd8j/HakVdpnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7241

DQpPbiAyMDI0LzMvMjkgMDE6MzIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAyOCwgMjAyNCBhdCAwMjozNDowMVBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IGRp
ZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jIGIvdG9vbHMvbGlicy9saWdo
dC9saWJ4bF9wY2kuYw0KPj4gaW5kZXggOTZjYjRkYTA3OTRlLi4yY2VjODNlMGI3MzQgMTAwNjQ0
DQo+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+PiArKysgYi90b29scy9s
aWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+PiBAQCAtMTQ3OCw4ICsxNDc4LDE0IEBAIHN0YXRpYyB2
b2lkIHBjaV9hZGRfZG1fZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+PiAgICAgIGZjbG9zZShmKTsN
Cj4+ICAgICAgaWYgKCFwY2lfc3VwcF9sZWdhY3lfaXJxKCkpDQo+PiAgICAgICAgICBnb3RvIG91
dF9ub19pcnE7DQo+PiAtICAgIHN5c2ZzX3BhdGggPSBHQ1NQUklOVEYoU1lTRlNfUENJX0RFViIv
IlBDSV9CREYiL2lycSIsIHBjaS0+ZG9tYWluLA0KPj4gKyAgICBzeXNmc19wYXRoID0gR0NTUFJJ
TlRGKFNZU0ZTX1BDSV9ERVYiLyJQQ0lfQkRGIi9nc2kiLCBwY2ktPmRvbWFpbiwNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaS0+YnVzLCBwY2ktPmRldiwgcGNpLT5mdW5j
KTsNCj4+ICsgICAgciA9IGFjY2VzcyhzeXNmc19wYXRoLCBGX09LKTsNCj4+ICsgICAgaWYgKHIg
JiYgZXJybm8gPT0gRU5PRU5UKSB7DQo+PiArICAgICAgICAvKiBUbyBjb21waXRhYmxlIHdpdGgg
b2xkIHZlcnNpb24gb2Yga2VybmVsLCBzdGlsbCBuZWVkIHRvIHVzZSBpcnEgKi8NCj4gDQo+IFRo
ZXJlJ3MgYSB0eXBvLCB0aGlzIHdvdWxkIGJlICJUbyBiZSBjb21wYXRpYmxlIC4uLiIuIEFsc28g
bWF5YmUNCj4gc29tZXRoaW5nIGxpa2UgIkZhbGxiYWNrIHRvICIvaXJxIiBmb3IgY29tcGF0aWJp
bGl0eSB3aXRoIG9sZCB2ZXJzaW9uIG9mDQo+IHRoZSBrZXJuZWwuIiBtaWdodCBzb3VuZCBiZXR0
ZXIuDQo+IA0KPj4gKyAgICAgICAgc3lzZnNfcGF0aCA9IEdDU1BSSU5URihTWVNGU19QQ0lfREVW
Ii8iUENJX0JERiIvaXJxIiwgcGNpLT5kb21haW4sDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBjaS0+YnVzLCBwY2ktPmRldiwgcGNpLT5mdW5jKTsNCj4+ICsgICAgfQ0KPj4g
ICAgICBmID0gZm9wZW4oc3lzZnNfcGF0aCwgInIiKTsNCj4+ICAgICAgaWYgKGYgPT0gTlVMTCkg
ew0KPj4gICAgICAgICAgTE9HRUQoRVJST1IsIGRvbWFpbmlkLCAiQ291bGRuJ3Qgb3BlbiAlcyIs
IHN5c2ZzX3BhdGgpOw0KPj4gQEAgLTIyMjksOSArMjIzNSwxNSBAQCBza2lwX2JhcjoNCj4+ICAg
ICAgaWYgKCFwY2lfc3VwcF9sZWdhY3lfaXJxKCkpDQo+PiAgICAgICAgICBnb3RvIHNraXBfbGVn
YWN5X2lycTsNCj4+ICANCj4+IC0gICAgc3lzZnNfcGF0aCA9IEdDU1BSSU5URihTWVNGU19QQ0lf
REVWIi8iUENJX0JERiIvaXJxIiwgcGNpLT5kb21haW4sDQo+PiArICAgIHN5c2ZzX3BhdGggPSBH
Q1NQUklOVEYoU1lTRlNfUENJX0RFViIvIlBDSV9CREYiL2dzaSIsIHBjaS0+ZG9tYWluLA0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaS0+YnVzLCBwY2ktPmRldiwgcGNpLT5mdW5j
KTsNCj4+ICANCj4+ICsgICAgcmMgPSBhY2Nlc3Moc3lzZnNfcGF0aCwgRl9PSyk7DQo+IA0KPiBQ
bGVhc2UsIGRvbid0IHVzZSB0aGUgdmFyaWFibGUgYHJjYCBoZXJlLCB0aGlzIG9uZSBpcyByZXNl
cnZlZCBmb3IgbGlieGwNCj4gZXJyb3IvcmV0dXJuIGNvZGUgaW4gbGlieGwuIEludHJvZHVjZSBg
aW50IHJgIGluc3RlYWQuDQo+IA0KPj4gKyAgICBpZiAocmMgJiYgZXJybm8gPT0gRU5PRU5UKSB7
DQo+PiArICAgICAgICAvKiBUbyBjb21waXRhYmxlIHdpdGggb2xkIHZlcnNpb24gb2Yga2VybmVs
LCBzdGlsbCBuZWVkIHRvIHVzZSBpcnEgKi8NCj4+ICsgICAgICAgIHN5c2ZzX3BhdGggPSBHQ1NQ
UklOVEYoU1lTRlNfUENJX0RFViIvIlBDSV9CREYiL2lycSIsIHBjaS0+ZG9tYWluLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2ktPmJ1cywgcGNpLT5kZXYsIHBjaS0+ZnVu
Yyk7DQo+PiArICAgIH0NCj4+ICAgICAgZiA9IGZvcGVuKHN5c2ZzX3BhdGgsICJyIik7DQo+PiAg
ICAgIGlmIChmID09IE5VTEwpIHsNCj4+ICAgICAgICAgIExPR0VEKEVSUk9SLCBkb21pZCwgIkNv
dWxkbid0IG9wZW4gJXMiLCBzeXNmc19wYXRoKTsNCj4gDQo+IFdpdGggdGhvc2UgdHdvIHRoaW5n
cyBmaXhlZDogUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPg0KVGhhbmsgeW91IHZlcnkgbXVjaCENCkkgd2lsbCBmaXggdGhvc2UgdHdvIGluIG5l
eHQgdmVyc2lvbi4NCg0KPiANCj4gVGhhbmtzLA0KPiANCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpK
aXFpYW4gQ2hlbi4NCg==

