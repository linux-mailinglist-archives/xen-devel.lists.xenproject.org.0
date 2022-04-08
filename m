Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A135E4F96A9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 15:29:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301586.514777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncog0-00007D-W7; Fri, 08 Apr 2022 13:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301586.514777; Fri, 08 Apr 2022 13:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncog0-0008Vj-T1; Fri, 08 Apr 2022 13:29:24 +0000
Received: by outflank-mailman (input) for mailman id 301586;
 Fri, 08 Apr 2022 13:29:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wmu2=US=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1ncofy-0007Q5-S5
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 13:29:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6588c95-b73f-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 15:29:22 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 13:29:20 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::389f:e6eb:a7a2:61b6%8]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 13:29:20 +0000
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
X-Inumbo-ID: e6588c95-b73f-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAlvv+3oE8eLD2B4J5dVFAwlckiAotrIkUwaNBVYhqwfEcp0NYunJIZMPP83XGe0W4FHu2S/ycVx1lqwIcr3qEkGDGWay6PN4/uIyfuuNib+tJAJEEWjoS7tgyyfuynfyFnvSrsW/tCmsLzVIHR27qsDIs6bEFATHN4HKXwGrd9AWahrXSeTTsark25ra6zbSvfC+/S7vs7Cz0B6I3PcRPkZpetWGLqzCGvLQ/2Xkr73wQ2eASTWUZUhxHWQnoa2r3yk4U+cqB8V6kti1DZwyJVOYNfwxNcZ3h/qWoc/rvhwmKk3DZPq1wcd/oART+zXACd7HMq49CKj9EiLf3JPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPOee9pnMGqVU9xIGltswGcbvk4wTGHaAUduAbIrVyQ=;
 b=RuzZjdgkB3BEKw4IWjwiBb7LQ9ookyo27KfNSOWbxtUMpRRDdvHG6wnYk7o/Cs754Kkeg8cMgKMNTzfJ0YaNcZZf1K/pTV7hDP1nmv8jgLCw3aXLqA8x9RUioyyJxn9FlvZK26YqUm/IxHazPkp7ovwlmHp/K/mZ2WkWEV7nm7GJZOUeiigGE7Gr+88bdE07caKSmCZ9k2DOoNafiRvNBAKWqg2/b/peIZ8Vru0NjoDyGGC0hJRl6DLtLgm5sQI87hMfpIWfpoEB+alH1h2gcSFJtSWN7O9CbDwhpwpATvi7GBrSjwkFOmogFWkMhHo36DWkm2LKXdoofCIgbBKVYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPOee9pnMGqVU9xIGltswGcbvk4wTGHaAUduAbIrVyQ=;
 b=LHGgX3Z7Wf26wFmRCUULRTAAStxHGQoHdpnbVQhil529ZPx7sMeVSSrRaZwoTM5df3GtT9/HASPXvpRsTREkmKMit5zqOx2vtHFY5yWg/7f6vf5qNaqH9+6oQ63vaIgmyH1VwCBVBaMZY+RJEM0uG2RuCwtv0OklZYxzAkhuQbM=
From: Peng Fan <peng.fan@nxp.com>
To: Michal Orzel <michal.orzel@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"van.freenix@gmail.com" <van.freenix@gmail.com>
Subject: RE: [PATCH V3 2/2] xen/arm: Add i.MX lpuart early printk support
Thread-Topic: [PATCH V3 2/2] xen/arm: Add i.MX lpuart early printk support
Thread-Index: AQHYSiOqexdlapMzRU6Bt2qQ3HStYazl0OeAgAAz44A=
Date: Fri, 8 Apr 2022 13:29:20 +0000
Message-ID:
 <DU0PR04MB9417803BB8B28A9A1DDCB29488E99@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220407024418.9827-1-peng.fan@oss.nxp.com>
 <20220407024418.9827-3-peng.fan@oss.nxp.com>
 <363333de-0ec9-dff7-09c3-426530657a43@arm.com>
In-Reply-To: <363333de-0ec9-dff7-09c3-426530657a43@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2364cc53-d527-4e8b-9fbe-08da1963ca05
x-ms-traffictypediagnostic: AM7PR04MB6949:EE_
x-microsoft-antispam-prvs:
 <AM7PR04MB694967206EAA14166AE43CAD88E99@AM7PR04MB6949.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fahjMYiEFaY34JLEpfgIskoR2W/icZ4OtbPxioHvhSoD7DE75/dPy0gg/G7wHkSRDs7F4AtK+y/heoTeMuDV58RDP34SD4yhGG7fMGTp3c+V77gOSvg9uH8UjcC63cG5GswKBH8EDRq7gVzs++c3s9yCH7LdhREiPpMOQRZDwT9aw+2XwzGPZOuukWxwvIfGsP1HprU/dDbolUCrIbFiD805iXFiNTk8+iSxHl3ehOQoMFoCwO6z4hODk7bG44XP1GSLoSq+sNtdRElyjpCFwq1qKy+CqBxqce+rIGev8VpJfj+ORoasmqUKTdsZKkB3I6T5h/4vf+4s6JNk/4Ha2bECVkZuewDbFUtD4+ozDPhxNhYTR5b2UjXc+2BQOxrbR9qaWBFEBsUumiMF9xmvo/Wh8KeGqGXQj4TY4XmoVoCd4uFGxcmIllErL01E2jCU9FuG1ynimS0j2P46ysGo7/5t031HS7b/DOp1jRNksVFPhm9FwOWk/4/A18z5L9Cuf7XzACJGNVLITx38qzPv7uwBAh5hIxHDCgfYJff4KWESozx/jB1gOdWPQcn/O4vUZmQPcRsfRYzdjRL0kLUCiSK5OXysAoVdMsZSD36SzNV7TUFOfUo5wcKXQSlGRhE1oyjG8n9ndlPv2mb5OCVVpDdoNswJmJ+lINiCbzUoG8ta542UJd5XpBC+oOCsKjvRFB7YFDM0B7Qp7/vKHkE/cw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(9686003)(7696005)(53546011)(44832011)(52536014)(110136005)(6506007)(4326008)(508600001)(33656002)(71200400001)(2906002)(83380400001)(54906003)(76116006)(55016003)(38070700005)(5660300002)(86362001)(7416002)(38100700002)(186003)(26005)(64756008)(66446008)(122000001)(66556008)(316002)(66946007)(66476007)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUQrQXZwQTdnSmpzbklJWi9YMDRzU2FCWUFKdmFSQ1Ryd09FNUJncVA4emNR?=
 =?utf-8?B?NkRTVWNXeUpMelA1b1ZYRU5FVXl5TXhtcnNhRndxVkxobDNLUTZGQ1NmN1RS?=
 =?utf-8?B?RUVpalRwRHgvY0xvT1Zxa0tQY0hyek1kZjFDUnJOZUxsSEYwK053VG5OSEY0?=
 =?utf-8?B?Y3Y5NnBhTGU2MTF4WUVXVWR5bnpYY0cwcm5MY05kcmgvV2tCK0h6eExlUGpF?=
 =?utf-8?B?bUkwZnVsYkFKVkpCdVBqSnBXZzNaNGgrN3d3Si81OHlwVUNPMzFYZ0gvdVA1?=
 =?utf-8?B?NGY0UWt3L0FKL3NzdTdkVVpCbDZ0eWFob2VpR05wR0RSOUl1dVMwMWsrK0RZ?=
 =?utf-8?B?OU45UitZMUtOT0dCMHZhbzVpMWg5TkxQa3ZMWkRmeDQrNUhEZ25LbWxtU2lV?=
 =?utf-8?B?R1lJSStoaWJ0TGtUZDZLRkxabDNMNHhCTjZkenY2U1VDaXhOMTJiSHF6bHd1?=
 =?utf-8?B?TDNJMjZnNEkxcElzVjgxdnFMWStvWkRwNXphdE12SVBXNVFGMDZDd1EwWUFM?=
 =?utf-8?B?Y0lZa09UVWlIY3NpM3NyTFdKOWI2U3VUUmx6djhjaHJibXhSWVZkNmViK2sy?=
 =?utf-8?B?YzBPdGZYdTE5ekRrU1h0Umg0WFNFeDdKcGF3S09vb0p1Y3dvNW1ORlNvRGF4?=
 =?utf-8?B?bUVJTFZZTWdpcFpTRko5MWFubmFWWHZGVmJvdXlRbGtIbm1lWHRwRmpnWlBk?=
 =?utf-8?B?YVAxaXMwTHpBNnNzTEtkOWRrNVdjZU5Zc3dpY01MV3hqTnNYRTZGTFB4ZlFl?=
 =?utf-8?B?bEVSMXY5bDFscjRpNlRvNXZMT2xoY3BKQnN4WFJvaVlOa2NOeHREVU9PQ0xw?=
 =?utf-8?B?TkMrM3B1SHZKb0IxZlMxOFZ2Q2ZtTHR5bjI4amRZMzVKdUFRNUszN2ZIZmVG?=
 =?utf-8?B?Rm05Z0E0aDFLeWx4Z2ZPdXdGZnVPUkJDbVhhZUlkbm11T3QxWmF3V3hVUzg5?=
 =?utf-8?B?UDhnNXAvT0dCcUZIYVhjQklqamJXbGFnNEhTR29PMVRUTis1MlZZMGJKOFVL?=
 =?utf-8?B?ZWtFbG9KdnZhNCtqWmkwalNXUnV5SjNUSjgzdDJhdlpoVW8zU2RRalV0ODJ5?=
 =?utf-8?B?QkErb3FjdlA5WHdKVnJ1UGg3TnEyaGFZRDVGQzlUTzJ0c1JVUmliL0VKUmRp?=
 =?utf-8?B?TFhHNU5aMlI2cGk0RURwSGRSTC9WQzI2NVR0TDJCbVhaaEh4bW9UNHFGS1Vw?=
 =?utf-8?B?K251WDdoSzhodERQeUFtbjliK3BFZzFlTXBxYmVWRVkrMkZWbDBycE5FV3FR?=
 =?utf-8?B?UjBDU0JzczJKSURDbzJ4TGxpY3lJQzM5NUxGM3NHTDNlRXd2TTg0UFVnNGlC?=
 =?utf-8?B?WHpqUzh4WE5Nd0ljMnVTcjhnSFNtdE50ZUR1Z2d0S0dnSjVoS0VTTWxjK1Jr?=
 =?utf-8?B?aWZBMzdmTW94R3dkOVQxR0FpUXN2emFjS0FhSnlKbEs1bzZIMkw0bzB4L0FH?=
 =?utf-8?B?bklqMnNmMTdwS0ZVMVZiZGc4QW94UFdpejhKODVmVWlsdllEVUxCNzN3bEhQ?=
 =?utf-8?B?TGtjSnNQSk9rT2QvWWVWUy9BWENJZHpwZW9iQWFWUEpqOUhZa2o3Mi9XcHlW?=
 =?utf-8?B?YmlrTklSWklaMjBwQk9yQko2ZVJDeGp0aXRtbFlOY3lLcWRoN2MyRjJpZ1gx?=
 =?utf-8?B?a1hYKzg0T3RUMHJxdWlnMW5xcFBuV2JncVRFSDF5U2ozTFFuZ0JsbDg0TGZu?=
 =?utf-8?B?NzFiUVZLY2NkUXNxQkU2ek13L3ZNWGpONTlmcE82d3NaR2VmUVpHS1IwN0Uw?=
 =?utf-8?B?KzIwaVcwTHdobEhRRVJPQ0dsQVlTS3BkQkxQRDBCUSt1WUFEbmcwVklBcWVY?=
 =?utf-8?B?cWZocFRnb3NadzFMOXpFUTdQK1FwZXMzYnlVKzh2NG83dVNnVThkNTlTL2xL?=
 =?utf-8?B?bDc2VUh0S09CcU81L2FqMW5aeGh5ZGZZWnVScnE2UDRPZFRleS9FOXIrUVlE?=
 =?utf-8?B?Y0FXNURzSjdCZFVIMFlDWnZzSlZXbnlBditoVW84djVVc0pTL2gyWWpVeUwv?=
 =?utf-8?B?MjhEckE0czg4OUZKTnZ3bWxMMFBtZzVycmJmWlB4YmdkVko4cFlUenhQNE1u?=
 =?utf-8?B?NTl4cGRjd1F2Mmh3YUJDMjkzTldQNG40SVorOThpbC8ycDh6b2RXdmo1YklX?=
 =?utf-8?B?VEQwSEFDZUt0aG84ZTRHcjdEekNycjk1TzBjS2ozMzU2cVZtK1BFeFBqTGJo?=
 =?utf-8?B?ZXdDYWRXK29zbFIxTlNtRnhCLzB3SnN3Y1VNVWRCamdpdndDWG8xSzg5NGNy?=
 =?utf-8?B?NHYyTDFRc1loVmhlamJIbXpSWFFTK0xYaGltM0x3WW42OEhlWXNpSW5id3VS?=
 =?utf-8?B?aVppY2VCdmM3Z1FVR3RaTzA4OFhkQkxyall6Z3YxenZqOWZBdk8vQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2364cc53-d527-4e8b-9fbe-08da1963ca05
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 13:29:20.7544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fpmjocHuhkccSkPTcwcem3rnMHZH7FQ4tgGwrlXfouPVAtWxEOIEYEmtmsgxz+Prm4BLyzYu3abKHJhCv6Nf1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCBbbWFpbHRvOm1pY2hhbC5vcnplbEBhcm0uY29tXQ0KPiBTZW50OiAyMDIy5bm0NOac
iDjml6UgMTg6MjMNCj4gVG86IFBlbmcgRmFuIChPU1MpIDxwZW5nLmZhbkBvc3MubnhwLmNvbT47
IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7DQo+IGp1bGllbkB4ZW4ub3JnOyBWb2xvZHlteXJfQmFi
Y2h1a0BlcGFtLmNvbTsNCj4gYmVydHJhbmQubWFycXVpc0Bhcm0uY29tDQo+IENjOiBhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tOyBnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb207DQo+IGpiZXVsaWNo
QHN1c2UuY29tOyB3bEB4ZW4ub3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+
IHZhbi5mcmVlbml4QGdtYWlsLmNvbTsgUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggVjMgMi8yXSB4ZW4vYXJtOiBBZGQgaS5NWCBscHVhcnQgZWFybHkg
cHJpbnRrIHN1cHBvcnQNCj4gDQo+IEhpIFBlbmcsDQo+IA0KPiBPbiAwNy4wNC4yMDIyIDA0OjQ0
LCBQZW5nIEZhbiAoT1NTKSB3cm90ZToNCj4gPiBGcm9tOiBQZW5nIEZhbiA8cGVuZy5mYW5Abnhw
LmNvbT4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29t
Pg0KPiA+IC0tLQ0KPiA+ICB4ZW4vYXJjaC9hcm0vS2NvbmZpZy5kZWJ1ZyAgICAgICAgICAgICAg
fCAxNCArKysrKysrDQo+ID4gIHhlbi9hcmNoL2FybS9hcm02NC9kZWJ1Zy1pbXgtbHB1YXJ0Lmlu
YyB8IDUyDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgeGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2lteC1scHVhcnQuaCAgIHwgMjIgKysrKystLS0tLS0NCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlDQo+
ID4gMTAwNjQ0IHhlbi9hcmNoL2FybS9hcm02NC9kZWJ1Zy1pbXgtbHB1YXJ0LmluYw0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9pbXgtbHB1YXJ0LmgNCj4g
PiBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9pbXgtbHB1YXJ0LmgNCj4gPiBpbmRleCAxMTE2
NDBlZGI0Li4yNmUyY2YwMjQ5IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9pbXgtbHB1YXJ0LmgNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vaW14
LWxwdWFydC5oDQo+ID4gQEAgLTMwLDEwICszMCwxMCBAQA0KPiA+ICAjZGVmaW5lIFVBUlRGSUZP
ICAgICAgICAgICgweDI4KQ0KPiA+ICAjZGVmaW5lIFVBUlRXQVRFUiAgICAgICAgICgweDJjKQ0K
PiA+DQo+ID4gLSNkZWZpbmUgVUFSVFNUQVRfVERSRSAgICAgQklUKDIzKQ0KPiA+IC0jZGVmaW5l
IFVBUlRTVEFUX1RDICAgICAgIEJJVCgyMikNCj4gPiAtI2RlZmluZSBVQVJUU1RBVF9SRFJGICAg
ICBCSVQoMjEpDQo+ID4gLSNkZWZpbmUgVUFSVFNUQVRfT1IgICAgICAgQklUKDE5KQ0KPiA+ICsj
ZGVmaW5lIFVBUlRTVEFUX1REUkUgICAgIEJJVCgyMywgVUwpDQo+ID4gKyNkZWZpbmUgVUFSVFNU
QVRfVEMgICAgICAgQklUKDIyLCBVTCkNCj4gPiArI2RlZmluZSBVQVJUU1RBVF9SRFJGICAgICBC
SVQoMjEsIFVMKQ0KPiA+ICsjZGVmaW5lIFVBUlRTVEFUX09SICAgICAgIEJJVCgxOSwgVUwpDQo+
ID4NCj4gPiAgI2RlZmluZSBVQVJUQkFVRF9PU1JfU0hJRlQgKDI0KQ0KPiA+ICAjZGVmaW5lIFVB
UlRCQVVEX09TUl9NQVNLICgweDFmKQ0KPiA+IEBAIC00MiwxMyArNDIsMTMgQEANCj4gPiAgI2Rl
ZmluZSBVQVJUQkFVRF9URE1BRSAgICAoMHgwMDgwMDAwMCkNCj4gPiAgI2RlZmluZSBVQVJUQkFV
RF9SRE1BRSAgICAoMHgwMDIwMDAwMCkNCj4gPg0KPiA+IC0jZGVmaW5lIFVBUlRDVFJMX1RJRSAg
ICAgIEJJVCgyMykNCj4gPiAtI2RlZmluZSBVQVJUQ1RSTF9UQ0lFICAgICBCSVQoMjIpDQo+ID4g
LSNkZWZpbmUgVUFSVENUUkxfUklFICAgICAgQklUKDIxKQ0KPiA+IC0jZGVmaW5lIFVBUlRDVFJM
X0lMSUUgICAgIEJJVCgyMCkNCj4gPiAtI2RlZmluZSBVQVJUQ1RSTF9URSAgICAgICBCSVQoMTkp
DQo+ID4gLSNkZWZpbmUgVUFSVENUUkxfUkUgICAgICAgQklUKDE4KQ0KPiA+IC0jZGVmaW5lIFVB
UlRDVFJMX00gICAgICAgIEJJVCg0KQ0KPiA+ICsjZGVmaW5lIFVBUlRDVFJMX1RJRSAgICAgIEJJ
VCgyMywgVUwpDQo+ID4gKyNkZWZpbmUgVUFSVENUUkxfVENJRSAgICAgQklUKDIyLCBVTCkNCj4g
PiArI2RlZmluZSBVQVJUQ1RSTF9SSUUgICAgICBCSVQoMjEsIFVMKQ0KPiA+ICsjZGVmaW5lIFVB
UlRDVFJMX0lMSUUgICAgIEJJVCgyMCwgVUwpDQo+ID4gKyNkZWZpbmUgVUFSVENUUkxfVEUgICAg
ICAgQklUKDE5LCBVTCkNCj4gPiArI2RlZmluZSBVQVJUQ1RSTF9SRSAgICAgICBCSVQoMTgsIFVM
KQ0KPiA+ICsjZGVmaW5lIFVBUlRDVFJMX00gICAgICAgIEJJVCg0LCBVTCkNCj4gPg0KPiA+ICAj
ZGVmaW5lIFVBUlRXQVRFUl9SWENOVF9PRkYgICAgIDI0DQo+ID4NCj4gDQo+IEkgZmluZCBpdCBh
IGJpdCBzdHJhbmdlIHRoYXQgeW91IGZpeCB0aGUgaGVhZGVyIGZpbGUgaW4gdGhlIHBhdGNoIDIv
MiB3aGlsZSBwYXRjaA0KPiAxLzIgaW50cm9kdWNlcyBpdC4gQ291bGQgeW91IGRvIHRoZXNlIGZp
eGVzIGluIHRoZSBwYXRjaCB3aGVyZSB5b3UgY3JlYXRlIHRoaXMNCj4gZmlsZT8NCg0KT29wcy4g
SSBtaXNzZWQgdG8gbWVyZ2UgdGhhdCBCSVQgZml4IGludG8gcGF0Y2ggMS4gSnVzdCBzZW5kIG91
dCBWNC4NCg0KVGhhbmtzLA0KUGVuZy4NCg0KPiANCj4gQ2hlZXJzLA0KPiBNaWNoYWwNCg==

