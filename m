Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4EC2C6419
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 12:53:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39222.72043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kicIp-0006sr-FJ; Fri, 27 Nov 2020 11:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39222.72043; Fri, 27 Nov 2020 11:52:39 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kicIp-0006sS-Bv; Fri, 27 Nov 2020 11:52:39 +0000
Received: by outflank-mailman (input) for mailman id 39222;
 Fri, 27 Nov 2020 11:52:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N/V=FB=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kicIo-0006sN-4q
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:52:38 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c27decad-27f3-4885-ad7c-850d7b55dc45;
 Fri, 27 Nov 2020 11:52:36 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3N/V=FB=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kicIo-0006sN-4q
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:52:38 +0000
X-Inumbo-ID: c27decad-27f3-4885-ad7c-850d7b55dc45
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c27decad-27f3-4885-ad7c-850d7b55dc45;
	Fri, 27 Nov 2020 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606477956;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=1hUheRcfQ2BE0EVK9CkZsSJd2nGjkBDnrBNC4ozpTdc=;
  b=Z+W0W7uE6VPij5D6vumMMH+x8/79pxjHM3h77X6io+HgmRMQHvAx0u2m
   Tq+JdGzJCsaNz5jjXfE5bIDA1xdB1jaj9rCrBJfv8PGygGVSHn/AuK2Zu
   63qo9kya2ojPld42/gD+PPBDlcDEEfEoGQUW/dcW2UhPPfaVs3Smt6gNQ
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9SBS035S2MePgGWMNwR2Rpx1zK9Lxuku8kmORCHCgId8JranaZU4clmeDseIqMCRB9XnxcObE3
 Z+ostc+8jzz7oAlMN4mjxHSzp/dVqsOX4iixZOroiPEDJCUlCblwp+b1c4VvnH5hLM5zSG5J8K
 Y8a65WdVX33JzZtax1lWckPOuA7/t5VgFUtDSGGHEogMXjbS8i3dB7b0/n1ZNldw9tZhiI8QFG
 X1cCOpGxxyV/AWWCMWq48VIdDRuFjavKri4pLwnuSqJx6GTshOM2+yr3/OOn5MsRUPH8JJfjjt
 qAA=
X-SBRS: None
X-MesageID: 32045698
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,374,1599537600"; 
   d="scan'208";a="32045698"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NG+fKncufNB0XET1WmnQLIiLe2sDF8gfThd6umIn/WOXjGgjK+iXQk3QcqKAHnzG4uaC8HUIaP+jwnGX2x47EeHK6/2uwtTSKZRVC6LVUm/2JL/JGYmeMNlAuYe7BSo17YgCdj/LGQU6lxPYC1vG0lys7zu8BSIpohvKm3Sc3UXGH3G1fLRZQ8HYp5u85Xv/t2/e0sKL6InQBmJbM4GY4so+jG0bVaqdxJeFPG4LaprYE/O3W+vyLJKQgQTS47FTTYqE2WJpc5YcIc5s7DXaP8TbkWf3D9nspyOZ2km8BcGrOMOQsYe0Bq4cX4j1cc/N6ei7hNHDol0PPN7OVVDA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hUheRcfQ2BE0EVK9CkZsSJd2nGjkBDnrBNC4ozpTdc=;
 b=E0spEj0a2wHSXKTVVmahQJxNbl8HGfQOaqI4FLntCKKQWMIGedAwAjl8/fKbj6STKZ1VxT5yhkHD4YMw4XIsP3Z7Bjqy4Dd046hbVTkLIj2FhGD0obIAIJQo14rgwiKfclXvX+v7/xHLjagWaxbyMX/5t1Y9m+Rn2IpQwLMaw5aH5V0qaBiWiz8/WGCTL/fFticikWyYfdIi0kbmeDEIlvDhLB8kLupnVKNKBkJebT6MDbmAltYwPXQx7ltIZxKseDmQGpI6rJELXSRkUC6v4/54tzXBvTutaTeo/jV/mgb+B4QEoRtgpDyMEqLkzUvAwQJvdjKviupJqylKyduo2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hUheRcfQ2BE0EVK9CkZsSJd2nGjkBDnrBNC4ozpTdc=;
 b=RCaHAvCiVGJuloNmd7XO2J8XhnuZHDFUrwZyco2O+lPrtalzLpCCmIBxPQAnVJqb57jOKg1rvbm+Oo788to8z2FFv0z75FLXn2+L6qAqPuoIWz708PJSYzXaQTVQUrpi5K9mf3cckN+VMRSS/1X8AlMGxQg0kcswauO5LYSKH6c=
From: George Dunlap <George.Dunlap@citrix.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>
CC: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com"
	<intel-xen@intel.com>, "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Sergey Dyasli
	<sergey.dyasli@citrix.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, "Kevin
 Pearson" <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, "Matt
 Spencer" <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com"
	<mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>,
	Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Ian Jackson
	<Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ash Wilding
	<ash.j.wilding@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>,
	=?utf-8?B?UGlvdHIgS3LDs2w=?= <piotr.krol@3mdeb.com>, Brendan Kerrigan
	<brendank310@gmail.com>, "Thierry Laurion (Insurgo)" <insurgo@riseup.net>
Subject: [ANNOUNCE] Call for agenda items for December 2020 Community Call @
 16:00 UTC 
Thread-Topic: [ANNOUNCE] Call for agenda items for December 2020 Community
 Call @ 16:00 UTC 
Thread-Index: AQHWxLPI3g+PARWmhEi8Mt/igt/QKw==
Date: Fri, 27 Nov 2020 11:52:30 +0000
Message-ID: <6A1AC739-EB53-4996-A99B-EE68358E70DB@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00fea6ff-e686-4233-0aa0-08d892caeb6b
x-ms-traffictypediagnostic: BYAPR03MB3509:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB35098AC4D242ACA0869EF1C599F80@BYAPR03MB3509.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cWf09v6TSVNSJbEPQrBhrJrjP9Gw8pCZ3cIaGF8G1OL7OZZoMwmIDLEvz0BOcw/MiI1w+ZGvmRau3VVGdoP1iDg0ba0rUqgg7SFXj2aUo371lFT96fOwF4YO5cM41oVEZLb39G0WpV22gJ72oOG1+PIMuCQkTqFJs/6WnmkBRQsanl2kHfuPTrwhi273l5po+ngyqMvT0LW1AZaTBfrsOMhUeNDT4xVETH2SDySTrEkGOudFp0YA2A+JPOU6SN6SCX/7evQF4hi3cLlKK+9KZI2uF2B15CrZJQzKOCnLo2R34jdw5gtk2qSsSsZzoCkZzSeoajN63Uv2Vi8VGci7eeuXc/S2Kcj3PlvWRT5VjPyvvhFMlMb1iN4eY6r4jIMaqqQFo4PLraIR1CuJRi4yJw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(76116006)(66476007)(71200400001)(66556008)(66446008)(2616005)(4743002)(91956017)(4326008)(86362001)(64756008)(6486002)(5660300002)(26005)(33656002)(186003)(7416002)(7406005)(66946007)(6506007)(55236004)(54906003)(478600001)(966005)(6512007)(83380400001)(8936002)(316002)(2906002)(8676002)(6916009)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?T2JacEZLdDlpbVNKbVlSdk14MGFTVVh1ZERaMjFuays4bER6cXdPb2x5STBq?=
 =?utf-8?B?TXB4R095dFBPWnoyODg5U0N4WjZtMy95eWtyUFEwVmk0bEJuU1h5Kzc1V0dX?=
 =?utf-8?B?WHl4WmUrM2ZjZFpnbmRCSTF3RTZmNW1PRUVMdCs3cVlDWHhHUkJ0U2orb05V?=
 =?utf-8?B?U2Y0eHRjNEowbVluWFZlc3N1d1lCWXYxcFlMVlRZcVNjNnV3TU85S29oWG4x?=
 =?utf-8?B?VkZubStMS3BiSGdIRWhSYkNkWmc1anBJS3VRZ2E4SnFRVW93S1ZZZ1QzYVhU?=
 =?utf-8?B?VUtwZHlqZzBTZy9iMHYyZnY5ZXhsT3hsVElna2h1cXo4UTZ6WTNaZkhhdjJZ?=
 =?utf-8?B?clBkcHVIUXVrbEJzWE9yd05CZThBMmU5RW9uWEYzY2hFQlpCc01hNDNYNkpL?=
 =?utf-8?B?VGtnUlF3WVdkR3ZpZDdFangxWVpzV1paZWdVd01VK1Y2ZTRvdEthSHdGR2FE?=
 =?utf-8?B?MEF1aGNSajVrQzFTczdsZFdiS1A1U21zNFgxZ01hdnhQUkt5Mk9zSVBGT3U3?=
 =?utf-8?B?Mk9sN3ArOXNqTC9ldHRlMnhTVWVwWlpuUFhnUXJaamZTQ1ZPMTlwMGZ5OHdC?=
 =?utf-8?B?R01zS1IyTGI4VnVZTERyVTZWTjZkWk9PUU1tWkxxMG96d3dvaUdONVJjV01E?=
 =?utf-8?B?cE03RTV3VXh3UDJSSFl5REdjODhSQWpWV0lZazZHUWFwRDVvWkpoWXE1d25V?=
 =?utf-8?B?aENsZGFpQTBIZEZDNi91WFgxbnY3SWZCcDR6Ry8vS25xcXF0b0NPdnZHeDFH?=
 =?utf-8?B?UFhGK0dMUUVEdGxublNPM3k1QUR2ajMyNE5BM1FLenVWV0orZmZwTWJ4MHR2?=
 =?utf-8?B?OExJL3NkYjNuRnZxQXV0eGQyYlF1VmVDYWNuTnR2NlQrVmI0eFVRUVlqUjBh?=
 =?utf-8?B?VU04UE1MNGNrWlBTVTgzTVE0eDc5U3hpSnBuTXIvb2QwV0hXY044dnhvL29v?=
 =?utf-8?B?SXovVVRTak9Ob0U5Wmp6eGpkWHNMMDFJdzU2bUZpbDRXN3ZYV1VOdUI0ZzA1?=
 =?utf-8?B?ak5Sd0hoZWpQamtpSDFIaFhOMmQrQTJGMndmV2cxMFVPU0JYS2l3RVFFY1Jv?=
 =?utf-8?B?QmRhNnVxWUo2ZHdMVzY1T2RiZkZSdnZnMjVHZDA2NGVEdTl6YmxOd3plUE1T?=
 =?utf-8?B?NkMrd3l3RVhSak1kNW9wbG9MTTZKUkRQa0pqUnI4SlNOTWtVMVExaWhRQUpM?=
 =?utf-8?B?TzRFSFg5OHJqTVBKQ2ZnbEZlVkRUaWVIejhXU0pYUmVJUlNmYTF3aTFLbFRL?=
 =?utf-8?B?QVJPbHVxYVhmc0FEOHYwb0ZDelRCUURaYVVpajNySmdVb29rdnBBM0t2QzNP?=
 =?utf-8?Q?gYOag0jDByOlOai6QGHMJVYdeUuwEg6o0q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DE7F32824F952489F920BEA9EEB66CF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fea6ff-e686-4233-0aa0-08d892caeb6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2020 11:52:30.1196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXpEk8eR9nBwd4DwNi377LnwPUIis1oSnLrCmI3VOyHmh+Vf0IoNNHO1fbLjZ9KnmkXe2eD/iYOpu0pMoJMaqJmDCKOGxSx1C2b8RaJ2kVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3509
X-OriginatorOrg: citrix.com

DQpIaSBhbGwsDQoNClRoZSBwcm9wb3NlZCBhZ2VuZGEgaXMgaW4gaHR0cHM6Ly9jcnlwdHBhZC5m
ci9wYWQvIy8yL3BhZC9lZGl0L09QTjU1clhhT25jdXB1V3VIeHRkZHpXSi8gYW5kIHlvdSBjYW4g
ZWRpdCB0byBhZGQgaXRlbXMuICBBbHRlcm5hdGl2ZWx5LCB5b3UgY2FuIHJlcGx5IHRvIHRoaXMg
bWFpbCBkaXJlY3RseS4NCg0KQWdlbmRhIGl0ZW1zIGFwcHJlY2lhdGVkIGEgZmV3IGRheXMgYmVm
b3JlIHRoZSBjYWxsOiBwbGVhc2UgcHV0IHlvdXIgbmFtZSBiZXNpZGVzIGl0ZW1zIGlmIHlvdSBl
ZGl0IHRoZSBkb2N1bWVudC4NCg0KTm90ZSB0aGUgZm9sbG93aW5nIGFkbWluaXN0cmF0aXZlIGNv
bnZlbnRpb25zIGZvciB0aGUgY2FsbDoNCiogVW5sZXNzLCBhZ3JlZWQgaW4gdGhlIHBlcnZpb3Vz
IG1lZXRpbmcgb3RoZXJ3aXNlLCB0aGUgY2FsbCBpcyBvbiB0aGUgMXN0IFRodXJzZGF5IG9mIGVh
Y2ggbW9udGggYXQgMTYwMCBCcml0aXNoIFRpbWUgKGVpdGhlciBHTVQgb3IgQlNUKQ0KKiBJIHVz
dWFsbHkgc2VuZCBvdXQgYSBtZWV0aW5nIHJlbWluZGVyIGEgZmV3IGRheXMgYmVmb3JlIHdpdGgg
YSBwcm92aXNpb25hbCBhZ2VuZGENCg0KKiBUbyBhbGxvdyB0aW1lIHRvIHN3aXRjaCBiZXR3ZWVu
IG1lZXRpbmdzLCB3ZSdsbCBwbGFuIG9uIHN0YXJ0aW5nIHRoZSBhZ2VuZGEgYXQgMTY6MDUgc2hh
cnAuICBBaW0gdG8gam9pbiBieSAxNjowMyBpZiBwb3NzaWJsZSB0byBhbGxvY2F0ZSB0aW1lIHRv
IHNvcnQgb3V0IHRlY2huaWNhbCBkaWZmaWN1bHRpZXMgJmMNCg0KKiBJZiB5b3Ugd2FudCB0byBi
ZSBDQydlZCBwbGVhc2UgYWRkIG9yIHJlbW92ZSB5b3Vyc2VsZiBmcm9tIHRoZSBzaWduLXVwLXNo
ZWV0IGF0IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9EOXZHemloUHh4QU9l
NlJGUHowc1JDZisvDQoNCkJlc3QgUmVnYXJkcw0KR2VvcmdlDQoNCg0KDQo9PSBEaWFsLWluIElu
Zm9ybWF0aW9uID09DQojIyBNZWV0aW5nIHRpbWUNCjE2OjAwIC0gMTc6MDAgVVRDDQpGdXJ0aGVy
IEludGVybmF0aW9uYWwgbWVldGluZyB0aW1lczogaHR0cHM6Ly93d3cudGltZWFuZGRhdGUuY29t
L3dvcmxkY2xvY2svbWVldGluZ2RldGFpbHMuaHRtbD95ZWFyPTIwMjAmbW9udGg9MTImZGF5PTMm
aG91cj0xNiZtaW49MCZzZWM9MCZwMT0xMjM0JnAyPTM3JnAzPTIyNCZwND0xNzkNCg0KDQojIyBE
aWFsIGluIGRldGFpbHMNCldlYjogaHR0cHM6Ly93d3cuZ290b21lZXQubWUvR2VvcmdlRHVubGFw
DQoNCllvdSBjYW4gYWxzbyBkaWFsIGluIHVzaW5nIHlvdXIgcGhvbmUuDQpBY2Nlc3MgQ29kZTog
MTY4LTY4Mi0xMDkNCg0KQ2hpbmEgKFRvbGwgRnJlZSk6IDQwMDggODExMDg0DQpHZXJtYW55OiAr
NDkgNjkyIDU3MzYgNzMxNw0KUG9sYW5kIChUb2xsIEZyZWUpOiAwMCA4MDAgMTEyNDc1OQ0KVWty
YWluZSAoVG9sbCBGcmVlKTogMCA4MDAgNTAgMTczMw0KVW5pdGVkIEtpbmdkb206ICs0NCAzMzAg
MjIxIDAwODgNClVuaXRlZCBTdGF0ZXM6ICsxICg1NzEpIDMxNy0zMTI5DQpTcGFpbjogKzM0IDkz
MiA3NSAyMDA0DQoNCg0KTW9yZSBwaG9uZSBudW1iZXJzDQpBdXN0cmFsaWE6ICs2MSAyIDkwODcg
MzYwNA0KQXVzdHJpYTogKzQzIDcgMjA4MSA1NDI3DQpBcmdlbnRpbmEgKFRvbGwgRnJlZSk6IDAg
ODAwIDQ0NCAzMzc1DQpCYWhyYWluIChUb2xsIEZyZWUpOiA4MDAgODEgMTExDQpCZWxhcnVzIChU
b2xsIEZyZWUpOiA4IDgyMCAwMDExIDA0MDANCkJlbGdpdW06ICszMiAyOCA5MyA3MDE4DQpCcmF6
aWwgKFRvbGwgRnJlZSk6IDAgODAwIDA0NyA0OTA2DQpCdWxnYXJpYSAoVG9sbCBGcmVlKTogMDA4
MDAgMTIwIDQ0MTcNCkNhbmFkYTogKzEgKDY0NykgNDk3LTkzOTENCkNoaWxlIChUb2xsIEZyZWUp
OiA4MDAgMzk1IDE1MA0KQ29sb21iaWEgKFRvbGwgRnJlZSk6IDAxIDgwMCA1MTggNDQ4Mw0KQ3pl
Y2ggUmVwdWJsaWMgKFRvbGwgRnJlZSk6IDgwMCA1MDA0NDgNCkRlbm1hcms6ICs0NSAzMiA3MiAw
MyA4Mg0KRmlubGFuZDogKzM1OCA5MjMgMTcgMDU2OA0KRnJhbmNlOiArMzMgMTcwIDk1MCA1OTQN
CkdyZWVjZSAoVG9sbCBGcmVlKTogMDAgODAwIDQ0MTQgMzgzOA0KSG9uZyBLb25nIChUb2xsIEZy
ZWUpOiAzMDcxMzE2OTkwNi04ODYtOTY1DQpIdW5nYXJ5IChUb2xsIEZyZWUpOiAoMDYpIDgwIDk4
NiAyNTUNCkljZWxhbmQgKFRvbGwgRnJlZSk6IDgwMCA3MjA0DQpJbmRpYSAoVG9sbCBGcmVlKTog
MTgwMDI2NjkyNzINCkluZG9uZXNpYSAoVG9sbCBGcmVlKTogMDA3IDgwMyAwMjAgNTM3NQ0KSXJl
bGFuZDogKzM1MyAxNSAzNjAgNzI4DQpJc3JhZWwgKFRvbGwgRnJlZSk6IDEgODA5IDQ1NCA4MzAN
Ckl0YWx5OiArMzkgMCAyNDcgOTIgMTMgMDENCkphcGFuIChUb2xsIEZyZWUpOiAwIDEyMCA2NjMg
ODAwDQpLb3JlYSwgUmVwdWJsaWMgb2YgKFRvbGwgRnJlZSk6IDAwNzk4IDE0IDIwNyA0OTE0DQpM
dXhlbWJvdXJnIChUb2xsIEZyZWUpOiA4MDAgODUxNTgNCk1hbGF5c2lhIChUb2xsIEZyZWUpOiAx
IDgwMCA4MSA2ODU0DQpNZXhpY28gKFRvbGwgRnJlZSk6IDAxIDgwMCA1MjIgMTEzMw0KTmV0aGVy
bGFuZHM6ICszMSAyMDcgOTQxIDM3Nw0KTmV3IFplYWxhbmQ6ICs2NCA5IDI4MCA2MzAyDQpOb3J3
YXk6ICs0NyAyMSA5MyAzNyA1MQ0KUGFuYW1hIChUb2xsIEZyZWUpOiAwMCA4MDAgMjI2IDc5MjgN
ClBlcnUgKFRvbGwgRnJlZSk6IDAgODAwIDc3MDIzDQpQaGlsaXBwaW5lcyAoVG9sbCBGcmVlKTog
MSA4MDAgMTExMCAxNjYxDQpQb3J0dWdhbCAoVG9sbCBGcmVlKTogODAwIDgxOSA1NzUNClJvbWFu
aWEgKFRvbGwgRnJlZSk6IDAgODAwIDQxMCAwMjkNClJ1c3NpYW4gRmVkZXJhdGlvbiAoVG9sbCBG
cmVlKTogOCA4MDAgMTAwIDYyMDMNClNhdWRpIEFyYWJpYSAoVG9sbCBGcmVlKTogODAwIDg0NCAz
NjMzDQpTaW5nYXBvcmUgKFRvbGwgRnJlZSk6IDE4MDA3MjMxMzIzDQpTb3V0aCBBZnJpY2EgKFRv
bGwgRnJlZSk6IDAgODAwIDU1NSA0NDcNClN3ZWRlbjogKzQ2IDg1MyA1MjcgODI3DQpTd2l0emVy
bGFuZDogKzQxIDIyNSA0NTk5IDc4DQpUYWl3YW4gKFRvbGwgRnJlZSk6IDAgODAwIDY2NiA4NTQN
ClRoYWlsYW5kIChUb2xsIEZyZWUpOiAwMDEgODAwIDAxMSAwMjMNClR1cmtleSAoVG9sbCBGcmVl
KTogMDAgODAwIDQ0ODggMjM2ODMNClVuaXRlZCBBcmFiIEVtaXJhdGVzIChUb2xsIEZyZWUpOiA4
MDAgMDQ0IDQwNDM5DQpVcnVndWF5IChUb2xsIEZyZWUpOiAwMDA0IDAxOSAxMDE4DQpWaWV0IE5h
bSAoVG9sbCBGcmVlKTogMTIyIDgwIDQ4MQ0K4oCL4oCL4oCL4oCL4oCL4oCL4oCLDQoNCkZpcnN0
IEdvVG9NZWV0aW5nPyBMZXQncyBkbyBhIHF1aWNrIHN5c3RlbSBjaGVjazoNCg0KaHR0cHM6Ly9s
aW5rLmdvdG9tZWV0aW5nLmNvbS9zeXN0ZW0tY2hlY2s=

