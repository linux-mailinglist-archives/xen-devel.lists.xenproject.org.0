Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1FA417041
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 12:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195224.347851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiMY-0007gc-Hg; Fri, 24 Sep 2021 10:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195224.347851; Fri, 24 Sep 2021 10:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiMY-0007d9-DS; Fri, 24 Sep 2021 10:23:26 +0000
Received: by outflank-mailman (input) for mailman id 195224;
 Fri, 24 Sep 2021 10:23:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTiMW-0007d1-BN
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:23:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.76]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dfa70e6-fd26-463d-9999-78a6c18f15d7;
 Fri, 24 Sep 2021 10:23:22 +0000 (UTC)
Received: from AM6PR08CA0030.eurprd08.prod.outlook.com (2603:10a6:20b:c0::18)
 by PAXPR08MB7280.eurprd08.prod.outlook.com (2603:10a6:102:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 10:23:18 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::3) by AM6PR08CA0030.outlook.office365.com
 (2603:10a6:20b:c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 10:23:18 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 10:23:18 +0000
Received: ("Tessian outbound 0e48c0de19a3:v103");
 Fri, 24 Sep 2021 10:23:18 +0000
Received: from 95fe3d34ccf0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ECFA96C9-52B8-483A-86B7-48EE3F725349.1; 
 Fri, 24 Sep 2021 10:23:07 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95fe3d34ccf0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 10:23:07 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB5898.eurprd08.prod.outlook.com (2603:10a6:10:20c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 10:23:06 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 10:23:06 +0000
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
X-Inumbo-ID: 8dfa70e6-fd26-463d-9999-78a6c18f15d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7Ys0AlnPPVo+qE1SrJrFiZ+dpPJsmWm14CcFfyelW4=;
 b=NJ80COTnjLweLiDc9KMHhSQmlUSZ1PaWTmutBySCc2xOX/qzch9cfVfGOGlG3apOYFCZ07ubLLo+7At3k4qo5douRYppkxQpiWxe8ov73RZEOeIMjYzk+JB6XBctSUUw/jfCfbcub+2p+kjHsWNFBx15CLwtcL27xHrTP+9olrs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wl9yX3EswmhQ1GQzHRvkVl4gdAssJ+7rGNnJZS9s4h9WxySmsc9TrcpjOOYwfXAMNINR/lBLGKA+QOrYANs4G+IeGz3AzL9NWOm7EkQn+6hgrawovVg2CBU3nCvyd3fkOVCspfEFpor8jeNQqA3Bt+VlX71aXf4nSFmpFLu0qN5M4xYWPD2pPE0qZafPc52gCXiMp8ExoEQNEoTQPoqVPmCn806N65BuqC5dv+mC8/D60OlJvtHqDIxbypvOsU+uGLh0l8vHA2sw/fcgDlPC5m8qtWnT8x4sSnah3nokOAz70CKs3ZUyhm0AtYLxnkBeg6ehCz8lHzK2+ezg45HjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=f7Ys0AlnPPVo+qE1SrJrFiZ+dpPJsmWm14CcFfyelW4=;
 b=Yudf/yQqINIueVuj77ENZwjIMDEAvOXYqpDFWaR6Y2XhAnrxLlwNes9Nf5wm1+sh+UTtxO1/4GvaS98Gxajcw83rRabTe7xnjk9HtsHm9fYXKypjk6R57uRJzF5Cn/PmrlU/Idt5aMDluYqcaGaJrHbY0pWTO7ZCtQujyodu6mjSbz2FRvUC5rzYsvAEHUWXPW6CH8+aFpuNp0q9+Gk0OrVX9Uu0BjzpKkG0RCKBQirWxWdnNCsW/ZvwA1newFy8oIOptBOGtj6nq1gTHNaq4dNYD05CyXXmurYjM6dFG09Lw7ZogL59OEwpOtRVOJaliLlKrON0H4rTOAGsTccTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7Ys0AlnPPVo+qE1SrJrFiZ+dpPJsmWm14CcFfyelW4=;
 b=NJ80COTnjLweLiDc9KMHhSQmlUSZ1PaWTmutBySCc2xOX/qzch9cfVfGOGlG3apOYFCZ07ubLLo+7At3k4qo5douRYppkxQpiWxe8ov73RZEOeIMjYzk+JB6XBctSUUw/jfCfbcub+2p+kjHsWNFBx15CLwtcL27xHrTP+9olrs=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 33/37] xen/arm: keep guest still be NUMA unware
Thread-Topic: [PATCH 33/37] xen/arm: keep guest still be NUMA unware
Thread-Index: AQHXsHNOacjZjYh6d0ebH0gUeyb/WauyhQiAgAB2NnA=
Date: Fri, 24 Sep 2021 10:23:05 +0000
Message-ID:
 <DB9PR08MB6857A249AB6D5CD5B8FB62649EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-34-wei.chen@arm.com>
 <alpine.DEB.2.21.2109232018070.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109232018070.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7E134BADA0B60D4CBD9569D282241422.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1dd9c1a9-0ffe-4439-3b46-08d97f4553f4
x-ms-traffictypediagnostic: DBBPR08MB5898:|PAXPR08MB7280:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB72807991BB5B4D3FE0150AE09EA49@PAXPR08MB7280.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ++qj+Ie7ORBMAqkA7ppMa1/uv+xeuis2HPQAp540XBwgpNfp4GqjYcQC0/OxsKC5NxDLWHvac9BpIU/i9WlgOLzK2tbMf3ZuDWeYetQgFfPQwbuBq+HWMzoLiEpI/KP45fW1jMaYh08HojBEm0wEeg1Cv6mf6IhjTv9ZYLzquRuONYoSHLQ7glXSnP7rS7DZ3i4S8SkJDdrFDUMM5nqtzHzh4glX2ZbrxBw88ZxwU7zkC3WQ2aG0ZwOirrZz+obizJ47LpO5fV1+2lz1Ge4cXrPwi31ss+bkK7St9Ya0YP6ofZOhHcbP/rydpYn9B6HwGWxWo2+pEDiV3XQGLlfXZEPJcycVzl3aD0aPw3peUlKF7I9LAaGtoUqw53VYoqCvfcwc4DuPLHg5dJg6EFVoYzAnAfW4q4BRs/YqKoX4ue5y/TVhejkDpkdbzTnK3oahmfTGoiRkDgbakMYnZplRPgmhFaTnajsLA77CROLY+tO0trbUkwUZfoTJRPxD7nGMV8FH8iTC4ZkHpPL/09GNuI4DlupOyzjN8k4b2qJxUVLFcVXCyoUlAHNMLsA3X+SWi+FJKkIlwDKjAD2eBnCX30SSCiu9N+7fbBz8sDfUnBHsm/IXTU4bmD2hhkImH7guuC/pXptmH14snX9TDPr25mpQ1nAts4YWHsYTRjhmuZDYpwzM/n6Cosj9bbU5cOHVSYwemXZ4snW2ixjO+nhugw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(8676002)(66556008)(186003)(66476007)(76116006)(66446008)(38100700002)(8936002)(316002)(86362001)(55016002)(508600001)(66946007)(54906003)(83380400001)(52536014)(6916009)(122000001)(7696005)(71200400001)(4326008)(38070700005)(6506007)(33656002)(2906002)(26005)(9686003)(53546011)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5898
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	143c24ed-7264-4d09-7803-08d97f454c74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1E2YYqQpC5LdP8ENJvWpBPeuNGZ0aqE4g2MebPCwBvZg+m0kXF5UUyZQfuvAENmo4F5UymGzsptvdGv2lJgLaAfEa/4Rk5i98IB1iXrgrVqy8ZACGVzsTqCM5IIPTy9zFQFVf1yXi7BKt8qg/yA2mX4S04TycP2Dr95V/WNd35EnV/Bl2pSnKsHDoKuONBr0TVuFtF0CRxA/8TdsMjlo5NxJCG5stn8lcQbIRBSve1smXBsmO+T7U5REY9Pt9QRtudiB1mnnsj3UHFs1DnowA7RvrxtLpXNRn78YvDjYvz2AsrhqCyRH6ydfSQLwDoHLGjSLixGX/OGWy2mLjm6ksQnzlZiNFivLYLCuO7oHqEotTY3zYSwFwbYaFfZQJulDZMRQzzVSWu2hZ9+adlE+eA7Ej5cihO1Bu8P4K1gi/JFoW1sDsXgBtnn/cvmwOIWHS6YKEDhUtDZ92HRvZdIklXwq7AcsnAO+tcYln/uwl0n4L2syHR/IrnDDHh8TAxXRlJJSv7Q3B8pIYiUkBW5RPGiEjQwqltMDinbC+eiG9OaOH/4fQAdBvXMi8FyIfbQRPpH/9khHP975pq8wprDkU3NKoIIU4vCjMz7Yhne5zUi6jNIP/dbr9KUtdTto6OSkpZCOfdUOtysGC13piPIHiilud4TPpXt7stXC33n5KrRJWVFNnSfukkITPnODs7joJadFXnKx2ZquWA/lq1qLCA==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(70206006)(7696005)(8936002)(36860700001)(316002)(81166007)(508600001)(70586007)(82310400003)(52536014)(9686003)(26005)(4326008)(336012)(186003)(33656002)(86362001)(8676002)(6862004)(55016002)(6506007)(53546011)(5660300002)(356005)(2906002)(54906003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:23:18.6942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd9c1a9-0ffe-4439-3b46-08d97f4553f4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7280

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyMcTqOdTCMjTI1SAxMToxOQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3JnOw0K
PiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMzMvMzddIHhlbi9hcm06IGtlZXAgZ3Vlc3Qgc3RpbGwgYmUgTlVNQSB1bndh
cmUNCj4gDQo+IE9uIFRodSwgMjMgU2VwIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IFRoZSBO
VU1BIGluZm9ybWF0aW9uIHByb3ZpZGVkIGluIHRoZSBob3N0IERldmljZS1UcmVlDQo+ID4gYXJl
IG9ubHkgZm9yIFhlbi4gRm9yIGRvbTAsIHdlIHdhbnQgdG8gaGlkZSB0aGVtIGFzIHRoZXkNCj4g
PiBtYXkgYmUgZGlmZmVyZW50IChmb3Igbm93LCBkb20wIGlzIHN0aWxsIG5vdCBhd2FyZSBvZiBO
VU1BKQ0KPiA+IFRoZSBDUFUgYW5kIG1lbW9yeSBub2RlcyBhcmUgcmVjcmVhdGVkIGZyb20gc2Ny
YXRjaCBmb3IgdGhlDQo+ID4gZG9tYWluLiBTbyB3ZSBhbHJlYWR5IHNraXAgdGhlICJudW1hLW5v
ZGUtaWQiIHByb3BlcnR5IGZvcg0KPiA+IHRoZXNlIHR3byB0eXBlcyBvZiBub2Rlcy4NCj4gPg0K
PiA+IEhvd2V2ZXIsIHNvbWUgZGV2aWNlcyBsaWtlIFBDSWUgbWF5IGhhdmUgIm51bWEtbm9kZS1p
ZCINCj4gPiBwcm9wZXJ0eSB0b28uIFdlIGhhdmUgdG8gc2tpcCB0aGVtIGFzIHdlbGwuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgNiArKysrKysNCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+IGlu
ZGV4IGQyMzNkNjM0YzEuLjZlOTQ5MjIyMzggMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+
ID4gQEAgLTczNyw2ICs3MzcsMTAgQEAgc3RhdGljIGludCBfX2luaXQgd3JpdGVfcHJvcGVydGll
cyhzdHJ1Y3QgZG9tYWluICpkLA0KPiBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPiA+ICAg
ICAgICAgICAgICAgICAgY29udGludWU7DQo+ID4gICAgICAgICAgfQ0KPiA+DQo+ID4gKyAgICAg
ICAgLyogR3Vlc3QgaXMgbnVtYSB1bmF3YXJlIGluIGN1cnJlbnQgc3RhZ2UgKi8NCj4gDQo+IEkg
d291bGQgc2F5OiAiRG9tMCBpcyBjdXJyZW50bHkgTlVNQSB1bmF3YXJlIg0KPiANCj4gUmV2aWV3
ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gDQoN
Ckkgd2lsbCB1cGRhdGUgdGhlIGNvZGUgY29tbWVudCBpbiBuZXh0IHZlcnNpb24uDQpUaGFua3Mh
DQoNCj4gDQo+ID4gKyAgICAgICAgaWYgKCBkdF9wcm9wZXJ0eV9uYW1lX2lzX2VxdWFsKHByb3As
ICJudW1hLW5vZGUtaWQiKSApDQo+ID4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ICsNCj4g
PiAgICAgICAgICByZXMgPSBmZHRfcHJvcGVydHkoa2luZm8tPmZkdCwgcHJvcC0+bmFtZSwgcHJv
cF9kYXRhLCBwcm9wX2xlbik7DQo+ID4NCj4gPiAgICAgICAgICBpZiAoIHJlcyApDQo+ID4gQEAg
LTE2MDcsNiArMTYxMSw4IEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVjdCBk
b21haW4gKmQsDQo+IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+ID4gICAgICAgICAgRFRf
TUFUQ0hfVFlQRSgibWVtb3J5IiksDQo+ID4gICAgICAgICAgLyogVGhlIG1lbW9yeSBtYXBwZWQg
dGltZXIgaXMgbm90IHN1cHBvcnRlZCBieSBYZW4uICovDQo+ID4gICAgICAgICAgRFRfTUFUQ0hf
Q09NUEFUSUJMRSgiYXJtLGFybXY3LXRpbWVyLW1lbSIpLA0KPiA+ICsgICAgICAgIC8qIE51bWEg
aW5mbyBkb2Vzbid0IG5lZWQgdG8gYmUgZXhwb3NlZCB0byBEb21haW4tMCAqLw0KPiA+ICsgICAg
ICAgIERUX01BVENIX0NPTVBBVElCTEUoIm51bWEtZGlzdGFuY2UtbWFwLXYxIiksDQo+ID4gICAg
ICAgICAgeyAvKiBzZW50aW5lbCAqLyB9LA0KPiA+ICAgICAgfTsNCj4gPiAgICAgIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHRfZGV2aWNlX21hdGNoIHRpbWVyX21hdGNoZXNbXSBfX2luaXRjb25zdCA9
DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0K

