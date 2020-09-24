Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460392777C9
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 19:28:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLV2l-0005U8-Dq; Thu, 24 Sep 2020 17:28:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W6+g=DB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kLV2j-0005Ty-Lo
 for xen-devel@lists.xen.org; Thu, 24 Sep 2020 17:28:29 +0000
X-Inumbo-ID: 01f994b5-78c9-4197-b27c-a4b94596d805
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01f994b5-78c9-4197-b27c-a4b94596d805;
 Thu, 24 Sep 2020 17:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqMAuwYWfGhbGgNoDGG3aWGfVElI/lKuNynL1n00ONg=;
 b=yh9zH2PluPSd8lIAzP9SLy1n+1Lmcd4x56MVsXhL4aVHbCmBItSa0h/8xxofcxG8NWUDXsMcYtK3CalCh5MWuC0M3rrIfZiAqMcgSwBidz2C3EKD1NyW5YzXdA6ix838K8LlDyae0kKRmadM+WIlt0bn9RnjYA3XohVWWlI26vM=
Received: from AM6P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::26)
 by DB8PR08MB4170.eurprd08.prod.outlook.com (2603:10a6:10:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 17:28:26 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::c9) by AM6P191CA0013.outlook.office365.com
 (2603:10a6:209:8b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend
 Transport; Thu, 24 Sep 2020 17:28:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 17:28:25 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Thu, 24 Sep 2020 17:28:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32b926db178310aa
X-CR-MTA-TID: 64aa7808
Received: from 50e18be90cb7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60982E4A-5B96-4325-8C91-5F10216366C1.1; 
 Thu, 24 Sep 2020 17:28:19 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50e18be90cb7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Sep 2020 17:28:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMxv9gaXS9HTiRN/gAYi6TXy+u7MaJhKBq8TVG14LA7s7EhOY8mTwpL0KNRVD53YoMQDOrvtP8WnO9tVrj2oLWy0YP7w2Mx3/lot33INmDUbjOgML64oJGekq+3uJtpr5h/0+fz80nzKX17qvJzZjpuP76/J8lXN2LOw8smbzotQINMiYyUnxLUWE4Eh/RyTNFndNTGWIv15O3W4DqMjQv2ZgB3qzqrgjgRDdNfUQTDUgkOPuTHSRlqxdfUt/UlcUKnFTST0wsCC9901O5iWsdO9BAwBeBAbiamU+0uZ563JDOvndyNFRHavpLDHm3PwBMMIow/Auw5PTvmd0Z3pMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqMAuwYWfGhbGgNoDGG3aWGfVElI/lKuNynL1n00ONg=;
 b=bzlymkFcpSxE/49umsbD39nEkWA+sFRkTRSP4IVrevERuPhB08l+DllGzOvVuVKzLO/DXA9ZZYMVXgceGYi/Ezm8cueP3droaY1hILgh95JJWGPOavY2ufWeigxh/HItMeqKkzuD8wQ8gU2153LdeMNY+u80wfXAPD/+Op84uR7WPthUVlJdm4cgmgdBfDXuXizxYk81JiYYUAVzD1mHVYeMxRUmrgjOCDmfZKWihZD/JGR+I0x312/FQ0MTXNX2ajcxnUAQVfzXMD6JLy4QbYZbVqBENyrdLWwpbXgIsG5k8via73jhiByAIzAxHyOfhw7WbfikfI8s8eGCubmZZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqMAuwYWfGhbGgNoDGG3aWGfVElI/lKuNynL1n00ONg=;
 b=yh9zH2PluPSd8lIAzP9SLy1n+1Lmcd4x56MVsXhL4aVHbCmBItSa0h/8xxofcxG8NWUDXsMcYtK3CalCh5MWuC0M3rrIfZiAqMcgSwBidz2C3EKD1NyW5YzXdA6ix838K8LlDyae0kKRmadM+WIlt0bn9RnjYA3XohVWWlI26vM=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5324.eurprd08.prod.outlook.com (2603:10a6:10:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13; Thu, 24 Sep
 2020 17:28:18 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.020; Thu, 24 Sep 2020
 17:28:18 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <stefanos@xilinx.com>, George Dunlap <George.Dunlap@citrix.com>,
 "jgross@suse.com" <jgross@suse.com>, nd <nd@arm.com>
Subject: Re: Runstate hypercall and Linux KPTI issues
Thread-Topic: Runstate hypercall and Linux KPTI issues
Thread-Index: AQHWh3jMy0NFQnBtL0aR33AwNuevPKlh5ViAgAABPYCAAAI3gIAArnsAgBWJPACAAAC6AA==
Date: Thu, 24 Sep 2020 17:28:18 +0000
Message-ID: <47F63A35-6CA6-402C-ADA1-C12D17D11B95@arm.com>
References: <1844689F-814F-48AE-8179-95B0EE4E734C@arm.com>
 <8b9d8bc8-254e-01db-6ba3-ec41bc9cd2c7@suse.com>
 <2AD6A14F-AA25-464D-9E9E-6067F2F43F29@arm.com>
 <b7c7b1c5-c7c0-d7c9-b300-9a26e3b73746@suse.com>
 <alpine.DEB.2.21.2009100914300.28991@sstabellini-ThinkPad-T480s>
 <FB96958A-E432-4C42-9DD5-8F4DCB715100@arm.com>
In-Reply-To: <FB96958A-E432-4C42-9DD5-8F4DCB715100@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c68bf32d-7162-4576-a9aa-08d860af3ea3
x-ms-traffictypediagnostic: DB8PR08MB5324:|DB8PR08MB4170:
X-Microsoft-Antispam-PRVS: <DB8PR08MB4170E2DFA86F514B3130C7D69D390@DB8PR08MB4170.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8z4p3gAbhdWsCHU4d4F0FKLvqwsNTXgzNAfFW/T7dkCxFmVQQ4fHwr/01y9itkY5gQIl3EUOtzKwGII2HyeJM3BRd+ju424eZu+w4OqWonlEE1IxJrBbkDgEVsqXjjjAgV5Xn/zVToarR5Fm4STqa18FyrgPPS7ay7TnMxk24c/FH/2n6JHkBX679skQlwur7SV/YPhpQaPNw1TuWL6aJLbfj2pvAhItMH3T/YircYaSxd+HPQD8Qz6p7xKLUivzG+ty9B3N1BFwNRWC9BnR3SvKVT2ZjZB9eF0CxcD6aLMBQbwGTyQaCSxZRoMfhZUg
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(66476007)(4326008)(26005)(54906003)(36756003)(64756008)(2616005)(6506007)(66556008)(6486002)(186003)(66446008)(53546011)(2906002)(5660300002)(71200400001)(316002)(86362001)(66946007)(91956017)(33656002)(83380400001)(8676002)(6512007)(76116006)(6916009)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: XkQ3KGY4DX4T16STUSaGtpu/ziDJmcw0C8L99Q8+bNvwiHLALAHwkG/LkluUhiLVFIk+FDPhhcCjjXRDphJEmRZPuoDFVjA9VElJFtkwJjN7aXeyJd67aet50MESOiZfJmCOklewvLZrtO83W91UOBSPvhkXfUVXZD6yPpO7HL9CLoaQOIzmIldpG/0OdhRo3CLC5zIYdF6HMYDE5UII8d8gmFt3PPl/UO258RhBvwHb0v4/JXOsKAHHskxViwvLCrZt8rvcdoJjf379fXxBlB1A2ARy9yyzSCl3qLWTI6wZnp80BD7LbmYAA802bSo/Cr+/QET3Tb0UPaNpvBlyllBqCbwphxytWWXnFPx1356r6nnlS9poDCXTPAMI4qrBcslrXMeUFS20V/sp4i8Qji/d3KJ/dlWKJkcbHSMwd4un1BXSVpTgOiV8uPW88nlb0+CbcCTi85j02RaYcPFAr9yTqHi6di7ahAINVOPnu6URStr8YllEjB34Q4yWjqgM7agP+kIkCdVmScIWlT1or1T3X1/AOjNyWDE6TnWTuu392DXSTzs5yhPe23trToJw3sA87DSQxym2BkERPxlT5c1DL8qeOB6p7b6I584G2GL4vwILnuB/FsU1AZlJsQTTXaajVbIgWDJqPfTSJNMAPA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4372980C698D340B27511290CC8F509@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5324
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1e722c5a-1423-49f1-10ac-08d860af3a52
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DVRw6KryYgX9sH0A5MEZqwclSu8lAsDcPuRByBuEocRQa3aWkJjnPx2GoJBtyqQjHww4cwAgb8kLU6UeXHrFeD03jo/FKGcajAnCSzEN8RQfF6F1oxEXANHT0lEY7OxfXj3MkXDWma9oQ0LvZ+0Z+gaX08L022iVVxvERr8qmBio5jJxNaE/gYtjQ7/bK5zEE3ssSfDisc8T8kfSFeGn6BZUCtRnZEedE2bP0+eyNqAuuTNsznwjIUTZ1OuoDxPHAxvKVuBNJrNFbo3d8/6Lkdhxev5CEvvZRiu21atwQUQae7nTfKFxToiqMyeJapz5OW2Xr7Rs92iGmkf5v6+i0hgGOYoqwe2mSh8jKwT54afCAi7B+eI2E7jzgqlwRDhejcwo04nMYKsizlk91M37igDPsvIvIvmkxr0JS6nYg6gQTIhJl/Ncl5Jbtroe+te+
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(82740400003)(2616005)(2906002)(70206006)(70586007)(82310400003)(356005)(478600001)(6486002)(5660300002)(336012)(47076004)(316002)(8936002)(33656002)(83380400001)(36756003)(86362001)(6512007)(186003)(26005)(36906005)(8676002)(4326008)(81166007)(54906003)(53546011)(6862004)(6506007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 17:28:25.8871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c68bf32d-7162-4576-a9aa-08d860af3ea3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4170
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjQgU2VwIDIwMjAsIGF0IDE4OjI1LCBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFu
ZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBTb3JyeSBmb3IgdGhl
IGRlbGF5Lg0KPiANCj4+IE9uIDExIFNlcCAyMDIwLCBhdCAwMTozMywgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+IA0KPj4gT24gVGh1LCAxMCBT
ZXAgMjAyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gLSBzaG91bGQgd2UgYmFja3BvcnQg
dGhlIHN1cHBvcnQgZm9yIHRoaXMgaHlwZXJjYWxsIGluIG9sZGVyIGtlcm5lbCByZWxlYXNlcyA/
DQo+Pj4+PiANCj4+Pj4+IEl0J3MgYSBidWcgZml4IHRvIEtQVEksIGFuZCBhcyBzdWNoIG91Z2h0
IHRvIGJlIGF0IGxlYXN0IGVsaWdpYmxlIGZvcg0KPj4+Pj4gY29uc2lkZXJpbmcgZG9pbmcgc28/
DQo+Pj4+IA0KPj4+PiBUaGF0IHdpbGwgbWVhbiBhbHNvIGJhY2twb3J0IGluIExpbnV4LiBXaGF0
IHNob3VsZCBiZSB0aGUgc2NvcGUgPw0KPj4+IA0KPj4+IEFsbCBsb25ndGVybSBhbmQgc3RhYmxl
IHRyZWVzIHdoaWNoIGFyZSBhZmZlY3RlZCwgYXMgSSB0aGluayBpcyB1c3VhbC4NCj4+IA0KPj4g
RnJvbSBhIExpbnV4IHBlcnNwZWN0aXZlLCB3ZSBzaG91bGQgZml4IHRoaXMgYXMgc29vbiBhcyBw
b3NzaWJsZTogd2UNCj4+IHNob3VsZCBiYWNrcG9ydCBhIHBhdGNoIHRvIG1ha2UgdGhlIHVzYWdl
IG9mIHRoZSBydW5zdGF0ZSBoeXBlcmNhbGwNCj4+IGNvbmRpdGlvbmFsIG9uIEtQVEkgYmVpbmcg
ZGlzYWJsZWQgb24gQVJNLg0KPj4gDQo+PiBUaGVuLCB3aGVuIGF2YWlsYWJsZSBpbiBYZW4sIHdl
IHNob3VsZCBiYWNrcG9ydCB0aGUgdXNhZ2Ugb2YgdGhlIG5ldw0KPj4gaHlwZXJjYWxsIHdpdGgg
YSBjaGVjayB0byBkZXRlY3QgaWYgaXQgaXMgYXZhaWxhYmxlIC0tIGRvIG5vdCBhc3N1bWUgaXQN
Cj4+IGlzIGF2YWlsYWJsZSwgdXNlcnMgbWlnaHQgbm90IHVwZGF0ZSBYZW4sIGJ1dCBtaWdodCB1
cGRhdGUgTGludXguDQo+PiANCj4+IFdlIGhhdmUgdG8gZG8gdGhpcyBpbiB0d28gc3RhZ2VzIGZv
ciBhIGNvdXBsZSBvZiByZWFzb25zLiBJdCBpcyBiZXN0IG5vdA0KPj4gdG8gd2FpdCBmb3IgWGVu
LXNpZGUgY2hhbmdlcyB0byBmaXggTGludXggYW55IGxvbmdlci4gQW5kIGFsc28sIGEgTGludXgN
Cj4+IGZpeCBpcyBiZXN0IGltcGxlbWVudGVkIGluZGVwZW5kZW50bHkgYW55d2F5OiBMaW51eCBz
aG91bGQgYmVuZWZpdCBmcm9tDQo+PiB0aGUgWGVuIGltcHJvdmVtZW50cyB3aGVuIGF2YWlsYWJs
ZSBidXQgbm90IHJlbHkgb24gdGhlaXIgcHJlc2VuY2UgdG8NCj4+IHdvcmsuDQo+IA0KPiBJIGZ1
bGx5IGFncmVlIHdpdGggdGhhdCBhbmQgdGhpcyBzaG91bGQgc29sdmUgdGhlIHNob3J0IHRlcm0g
aXNzdWUuDQo+IA0KPiBJbiB0aGUgbG9uZyB0ZXJtIHRoZSBuZXcgaHlwZXJjYWxsIHNlZW1zIHRv
IGJlIHRoZSBvbmx5IHNvbHV0aW9uIGJ1dA0KPiBpdCBpcyBub3QgYSBzbWFsbCBjaGFuZ2UgYW5k
IEkgd2lsbCBub3QgaGF2ZSB0aW1lIHRvIHdvcmsgb24gdGhpcyBpbiB0aGUNCj4gbmVhciBmdXR1
cmUuDQo+IA0KPiBDaGVlcnMNCj4gQmVydHJhbmQNCj4gDQoNClNvcnJ5IGZvciB0aGUgbm90aWNl
LCBpdCBzZWVtcyBvdXIgbWFpbCBzZXJ2ZXIgaXMgYWRkaW5nIGl0IHJhbmRvbWx54oCmDQoNCkJl
cnRyYW5kDQoNCj4gDQo+IA0KPiANCj4gSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9m
IHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkg
YWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9z
ZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9z
ZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsg
eW91Lg0KPiANCg0K

