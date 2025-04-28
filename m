Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ED2A9F93C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 21:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971004.1359511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9TtP-0000eX-8e; Mon, 28 Apr 2025 19:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971004.1359511; Mon, 28 Apr 2025 19:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9TtP-0000bP-5b; Mon, 28 Apr 2025 19:11:51 +0000
Received: by outflank-mailman (input) for mailman id 971004;
 Mon, 28 Apr 2025 19:11:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ud9o=XO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u9TtN-0000bH-Hv
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 19:11:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f403:2612::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a16878a2-2464-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 21:11:47 +0200 (CEST)
Received: from DU2PR04CA0161.eurprd04.prod.outlook.com (2603:10a6:10:2b0::16)
 by PA4PR08MB7434.eurprd08.prod.outlook.com (2603:10a6:102:2a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 19:11:41 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::6) by DU2PR04CA0161.outlook.office365.com
 (2603:10a6:10:2b0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Mon,
 28 Apr 2025 19:11:41 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Mon, 28 Apr 2025 19:11:41 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 GV2PR08MB8097.eurprd08.prod.outlook.com (2603:10a6:150:75::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.31; Mon, 28 Apr 2025 19:11:06 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 19:11:06 +0000
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
X-Inumbo-ID: a16878a2-2464-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xcCnlJcH9gW4bzzcwRd3WJLwNHfqrSpnBUpG641UDl6UBVzCH/H3Krg3h1FFBAOgAKFyFYL4/gYsIdKASg2RVXH7B0jMEQM83Op5Nx+X1HX0d5GsTrYqQhGxHDKhes8lqIgyn9yGT4mtMUZFtlz6ER4b+lEQ7nxBurUCAJNM/9SLJgRSwE20bbam0l+YvjomXxOfEj/2MAbpi7s3J3F1dennxaK8/ndrrqtRFmeb9C3hvNprAUSj/joJc0BX2T0488xD6IbOrnSGwynKzbSSFyjt0ptyvLvGAr6E9hPwOzEak55PJCNmVXThyS0slVzP9300/Kp7OSa7AvvmeAnHrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HseMuBUfqlWWSPOghP252rN34H3643z5JiS/QPYM9y4=;
 b=LE4l9Xt8GVU1UAoArw24M7YpxeSH9vxfJ4n5Stg6zYWDqBhDm/QsEWyo8aL09lf0WFaisN57klBIHKXj6p2KnrktzJM8eLANfbiZ8jNvigpJcaMjasbSR6P7B11HQr1I/8jNtKC40xqBSyEINp7Q6d0MAOJ1MwLBRfL3ASKIqAE3CymkR5xA3GuqeSzoG0TG7/zbU90JCDkroXf2xGBnFGV4zI8BaIzw6D8C2+g+dQxBUiKGdX4DVR+lf6vSb8h5fsBoHolDjyB1vj2N13t5BOE7eEjGdHHtQ4ZIT/THUNvNbE1dZ65FgsYzCkk+uAbei/go0cQ4DHPhkMvose/8Hg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HseMuBUfqlWWSPOghP252rN34H3643z5JiS/QPYM9y4=;
 b=QqNh1nTNyeuS2cXTZGqN0/oju9V/3OCKPKwjwfFfsjBLj9aZcmiigiH1hvNY7AynnPb/bC2ZaghxiC2mNWWuSlV6NtnuOg8Mp0xuBT7b7D8f+DHIxv9tiud9GgrJaGDBbPC9hGGxGdzMLrD+6klEUA7CrxAg1/Ax/5LL944yTcs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcOEiWEYbPanz/6kQ7fGtzQkx8Az/awND4JhP0yMruBwSYEBmf4HQY7gYyFFqKKrCce8BEbtP2DC/iiPRuhJ4ygho39bxK6wfyqgomLY59F3u80/dhv41WKN6MKvqGYSXOYRNGG6AT5fAgo6KrDKziiF1k/Q/b8qXBHfbI7ku6wrzo7lNB9OmwjXdf7Q/myANj7HjZzApkAxKTwDhtnYI75kbiWGXh8WnQllo4NEvrSpc7BO1ZERc8k8l3npvK5+K10UeLUPkGm1Tua1EmHFz5E+aI3Z6JOscVMxWTaFtYEBaXbZKaUKxB2E9URxj5Ia6V4K0/Mm2F1vjPx5Wa2P6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HseMuBUfqlWWSPOghP252rN34H3643z5JiS/QPYM9y4=;
 b=tnRpw0/0nMo3Rj+G2IXtLscspHiRVUthiGVVAO7kxBoVt8TzKmNL6gyuK/Zbj+nxyifk95uBeAdBuFIcOnqfZebxrm8RJ3WNSy0wJL0jQmCF8XZwQFLITtFQwkSoJ3pnsvspEWmVvJA/+kMOkGEnUqsBr4kMPr+x+fbrDxjOUdGC3BM6fuvF6cKpDmcJCQiIg5+tx44O7m6R0x4NRnuMGUWLwYwXKswVt3YeE3uYYqm+vjxeB6s9/3UyjT5QtxZqy7r4FKaQukjMqpGf6qZJXjgh9d2wvDv3dmvbnf0sMu40C4HFrDW1mR2Vugy20eXFypYyPE17jiOgJhdk9ZMK7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HseMuBUfqlWWSPOghP252rN34H3643z5JiS/QPYM9y4=;
 b=QqNh1nTNyeuS2cXTZGqN0/oju9V/3OCKPKwjwfFfsjBLj9aZcmiigiH1hvNY7AynnPb/bC2ZaghxiC2mNWWuSlV6NtnuOg8Mp0xuBT7b7D8f+DHIxv9tiud9GgrJaGDBbPC9hGGxGdzMLrD+6klEUA7CrxAg1/Ax/5LL944yTcs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Thread-Topic: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Thread-Index: AQHbr7FEzJkzCX7IxEuG28e/+R7zurOo3KoAgAt3HYCAABnBAIAFFYYA
Date: Mon, 28 Apr 2025 19:11:06 +0000
Message-ID: <0301958D-EC51-4084-9FCB-69E47376704A@arm.com>
References: <20250417155511.1854081-1-ayan.kumar.halder@amd.com>
 <306e5414-1552-4605-86d6-b23b89d00bc9@xen.org>
 <cebb0020-531f-467c-bc81-54d2ba1aa8e0@amd.com>
 <f2a55c19-4a8b-44a3-be9e-bdf3fb554b7d@xen.org>
In-Reply-To: <f2a55c19-4a8b-44a3-be9e-bdf3fb554b7d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|GV2PR08MB8097:EE_|DB3PEPF00008860:EE_|PA4PR08MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: b49fe040-f9f4-4217-b48a-08dd86888221
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OVVLYzNRWjZ0OEd1V1N6Y2NLdTVja1d4dGdmcHhDUDloWU5ueUI3ZWN0cEVD?=
 =?utf-8?B?Y2U5UWZSZzI2cTZNbXFyQmFLSld4cHlGajJ6TUdYZ3BQMzFHeUIxbWJlU080?=
 =?utf-8?B?RUN5dFBRZzFTYXN1WGdMTStvR0dvbEx1aFRnMEF4bm5LN1hSUXFrVmdDdzIy?=
 =?utf-8?B?L3FVV1E2ajE5RjJCZ1pYUVJscHZoaUdMMEEvamZ4RGlmWnVtTnlTaFZrZ2I3?=
 =?utf-8?B?RmU4TmFqa3NVbnR5MXl3dmJKVTZjdmJGeVpIUVlPSCtqbGlnNW53SStGN2lV?=
 =?utf-8?B?ekFzNml0eDVmclRwWW1CVGN4U0lhMTR4QlIwaXFjRW1SclhWWFk0c2VHbVIr?=
 =?utf-8?B?VTJzOXZBN0ozVmFHaDRHR3ArMW82UnVwdUlpVUdaN0IreW51SUtNVlNaeWx1?=
 =?utf-8?B?MTJzNkVnNGw3QWdVd3NRUHR3QmtUMXBkd3p3a1AxdElpbmt5WXl3RUJ1dU12?=
 =?utf-8?B?bTk3T0ZXOFh6aitNY0dRNW1MWWtWQ1l3WUhPWXFWZ2NLRzNiU1JoVTFpZzFZ?=
 =?utf-8?B?ZHJqY3cxcXJoWWQ4SjJ1T2dVcThaZ2ZZMm1NS3JiWnBXNFRxbnNlNUJ2Uldt?=
 =?utf-8?B?RHVTVzJraEpCSkpEZ21oVXN6YUJ4QmhIR2hqQWI5elRaRUMrN2Fid2pYRVJ5?=
 =?utf-8?B?aWs3aWo0enVrUlEraG4zdHNwZGJraGlJZG5sU3RUT3JTNTlQcTNxaGRibmZz?=
 =?utf-8?B?NDlEeFp1MVNUUHNVVlZieGVWRTNIU040M1QrNXJXbE15RlE4dldpSFlxZXNB?=
 =?utf-8?B?VmVsZWx0Z2hWNjhmUVdJK0xwblpMZytqU1hwSlJjaVlyS2g1SXp2eWxnR3NZ?=
 =?utf-8?B?c05ESEZNeEFYZDlTVC9ETFJLcTR2TGxtc1FUTzhnVEFuVGd5MTVpWlk3dWlV?=
 =?utf-8?B?Yk44djUzOEVMQ1BOeURWdGJmOFNzckorQTF1Z09zMGNGNWRiR1BSVWFpa0I2?=
 =?utf-8?B?eEtzc1hwcmVNOFlPWUd1MHdPMzNuUTNSekhpeDdaWW55K1h3V01DL1NFd2Jv?=
 =?utf-8?B?UHQwVEZPbVhQSFM1WEF4MW5YUDBWSjFGc1lRWTRuM1ZkK2hjOWw5eDRlN3NH?=
 =?utf-8?B?M2E5RmN3L21QQnVvQmpjTTcyYkZYR2JjeEpndE10Njc4SVhGRGY0d2xhaDA0?=
 =?utf-8?B?VTV0SUM5ZDI4NVVLcXpMdkhaSUM4SXdmamZIS3lBdTEyd1d2VlN6eVB2MDZO?=
 =?utf-8?B?NHFpdnVoUU91ZGVNZk1nL0tXQmJhL1gvM0ovdFJTSTMrTk1YTXRTdmpYeVdV?=
 =?utf-8?B?WmgzaThIK2xRakV5S2RwRytCcjV5YXlMWkg2QXJrbS9xbXAxbW5scVh6a2tu?=
 =?utf-8?B?TGdUMlhVNThsTEMzTlVXNmd5ek5KWWRPZ0hNRzJpc2ZleEl1MEVPZFVEMExB?=
 =?utf-8?B?c3NoRjVSOTRKeWNqVmlvM2ZGMHJBYy95RUpNNm00RHhvL1dkbGduQnRqbEJY?=
 =?utf-8?B?WnVWVm1uQzNJRFEyMEs1WlVEVDNKZFA4RTRyc1JteGNseGZETGVhNDRLc0tV?=
 =?utf-8?B?L3hTRFk3UVpQSHVwY0Rjc1pLbDQ3VlREaXNrRmZHeVlmY2R3UjQxaFJwOVIx?=
 =?utf-8?B?UGsyMkhySUVlNHVnSXVwVnpmclIzSEJTdjdtZ0hzZld3WU9JWTJvbFdXZUZh?=
 =?utf-8?B?bTRIL0o2ck9zYXByUjNwV0NNMWVkSm9xeDc1SGRGMVpXcTlsMmlXcE1pVFh4?=
 =?utf-8?B?bTRCWTZrKzNhWVNjNnN5dkRBZnd5QWxZZlkrOTBCN2JTMWlKclJNOUJSNW1o?=
 =?utf-8?B?aHdkSnV2RXJ0NCt3N0o4c2wxRHpVRnNrbHNabVFicGdzdGFsMmYxVUM5dnhD?=
 =?utf-8?B?N2pmVzdOdGM5R09CZjUzT3NtZjBLRFhrQTRMVTQwR2VYR1ZhR3RNTlJOVmY5?=
 =?utf-8?B?Ukd6OGFNM2RwanpiUE1mM1lRSjliVGo1VTRtK1drbDg0bzFVd0xlVFVpQnZL?=
 =?utf-8?B?ZmJ0TFY2SEhteHBqdWhGQ2tzY0VDaml6TWlHcVdBRVpGbTJjZGQ0enlNMS9p?=
 =?utf-8?B?T0cxUjd4cldnPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <75CEB62E6DBE844FBCED74BC776682F1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8097
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	742e8f5d-15ce-4ac7-c89b-08dd86886d61
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|376014|35042699022|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDIybDFFdldSdWpqcmZjcnpNZWxKczhES1llc2RwOTVPeVBMcVRKeWxMQTRj?=
 =?utf-8?B?aWNYS3BwOERSZW1LSnUwamNUczI2bzFnM0tTSVJpTnNnZ3E2OXBBdXhTUXVa?=
 =?utf-8?B?OG5VU2ErNXhlYXVsb3VCS01RWkcyRWZ6WEdQWiswUTBIdjg2NE44NlF4S2x6?=
 =?utf-8?B?NlpFNk1GNSsxUlFrczU1SXMzWVpxaWpIY2RIMnR1U1F0enBYWXlVbk5FV0gx?=
 =?utf-8?B?TjBjV2JqZDg5M0N0M25aN1ZxR2UrMkJ4cndzUTRzU0p5RkpmbHo5ZUhTWkxz?=
 =?utf-8?B?Ym5nMktYcWc5ZnVERGlmak1Ycy9LTzl3aUhFaEhsV2d4c2pOaEQreHVLNTZF?=
 =?utf-8?B?MXYvZFFlTTAyM1dQWkhlbHJtZXBzcmQ2cFBXeUdZWFRUMmlOZXZRaVZVdTA1?=
 =?utf-8?B?ZWhVenlMaHV5aGpTWXVqWUxtRVhTYW40S0VwNTFPMlUvRm9NaGZabVJFVXVi?=
 =?utf-8?B?V1ZjTGI5WnBsbzlRM3UwSDhTcEJwMFM5Yks5RVdoOENIR2cxNVprZ0NiUWxw?=
 =?utf-8?B?S1RaMzl6K3o3RDBtL21ENHZDNmlBQ1l0RjhpU1BwYlI1RW5vcHRLZmREeDBh?=
 =?utf-8?B?UGJQUTFvRlNwRTZDUUVSVjhhUUpkbFFQd2FDUW9NYXlZd0VwWTFaNVpnem5I?=
 =?utf-8?B?VTJXTk9jY1RHSzZaMmd5OUgxTVRJUGNKNmRLbHpNYnZuL2VuTXVWZjVJNVVm?=
 =?utf-8?B?QlJyMURqQjc3WmJFR09FcE5veU5LZmprZ1BmM2UzQ2dmREMzK2RLY21TVDZ5?=
 =?utf-8?B?bVlDS2xYb0xZdnNtTHZIUk1OdzV3L1dlN2JGRDZkQ3JrWnN3SnBlMFR3MGVo?=
 =?utf-8?B?NStrVXdFN2U0TThENE16TlR2V3kzb251RmtOUjZQdkRjdnJtWDNLN1BaOU9F?=
 =?utf-8?B?S25QWWo4V1dUN1NmNzlkWFNGNFZZWFozSzB6cWN1RDlGSHU2UnUwWG5XWmNK?=
 =?utf-8?B?alJxd2szZExNZmU2eExQT2dKSDZhUytxR3NqVVZMTGU5a3RmQjU0UmZIUUNw?=
 =?utf-8?B?dWg3Z0J5ZUFlbE5hOCt2UncwR3E0eDVNMThGSElnQnlETTk0em9ZVDE3ckJ4?=
 =?utf-8?B?Mkt2ZE1rcUdwNzBuMmtoNFdiUUVFZ2I2TG1wS1AxREsyY1RadURJTzBJbXBs?=
 =?utf-8?B?QlVsSGxpempmZURyOUhwRG1ML2JWNWJRQnJsRjlHL2FNTkV4ZWFPMER4V1k4?=
 =?utf-8?B?eTF3Z1ZXZXVDQmE4OHdaY0V4aFk0NC9KM3dYWjBSYVAyemJtUy93enBJdDBs?=
 =?utf-8?B?M2IrVnA3anJKdEJRUDlnUDF6WXJRWXFib093ZkZKUU1EMm1ZeWcxYVNidktt?=
 =?utf-8?B?ck5sVHNBT0g2bDkya0tKWERwMHQ3R0t2YVVFKzhDQjJucnVDV2FkVGF2RDhv?=
 =?utf-8?B?Y05oRGJ2RHdFUkdyS2x4RG1EaUNLV1U1d0J4aVFpMEFYY0luOUtlM2lwd214?=
 =?utf-8?B?MWNYZ2VaUzlHOVN2MDNXZm5ZU3hIMWZXd2pwRVVRSnp1RUlpUy9IbkkzbGJN?=
 =?utf-8?B?bWhtTzdEZlFPVy95RkIydTQwNVV1ck1LamNCekNaUlNDaFFRZ1ZJTG55SGNQ?=
 =?utf-8?B?K2I1T25YdnJzd1pGWTV2UEhubzdQQlJ4R25Zemd2ZzZPa0lEZFdIcHVCWVpF?=
 =?utf-8?B?d2xWMDZRQXZFTGJneFNGRHlPU0J3NGFIdERzSlBZcDlIUFduZm13TS9IRXVH?=
 =?utf-8?B?blJuVlN6ZUJKNTNQM1dzd2FkY1NocU5nWTlqRGU0YlZxMUI5OW1sS1VsNURK?=
 =?utf-8?B?R3VjNVRqd0U4WUJZOVpBdy93N09sN09KNnovelF5OTVqVGowdFRNSTZRNUU3?=
 =?utf-8?B?a0xmNmxuekhETlB6MjM1Q0lVQjBJYVowMjRaOFJpLzlYRzNTMFlSbFRFYW1i?=
 =?utf-8?B?aVQrRHlwVER3MG9XQnlyTFI0ZnNadkpWTGdCandvWmtwMVkwOXhiUDdiU1N3?=
 =?utf-8?B?cWZ2b21ZWUROdFVtUFFsRERWQXByNmhUT3lIL24xMkxKS2dCU1ZSWG5CMXNE?=
 =?utf-8?B?MHlJUUw0czQvZkhmVTlwbkt0N0w5bVc5S2M5TFFyU1FWVUplVEttRlg0SFpB?=
 =?utf-8?Q?j6282b?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(376014)(35042699022)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 19:11:41.2383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b49fe040-f9f4-4217-b48a-08dd86888221
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7434

DQoNCj4gT24gMjUgQXByIDIwMjUsIGF0IDE0OjMyLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEF5YW4NCj4gDQo+IE9uIDI1LzA0LzIwMjUgMTM6MDAsIEF5
YW4gS3VtYXIgSGFsZGVyIHdyb3RlOg0KPj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgbnM6MTsg
ICAgIC8qIFJlc2VydmVkIDAgYnkgaGFyZHdhcmUgKi8NCj4+Pj4gKyAgICAgICAgdW5zaWduZWQg
aW50IHJlczA6MTsgICAvKiBSZXNlcnZlZCAwIGJ5IGhhcmR3YXJlICovDQo+PiBUaGVuLCB3ZSBj
YW4gY2hhbmdlIHRoaXMgb24gQXJtMzIgYXMgd2VsbC4NCj4+Pj4gKyAgICAgICAgdW5zaWduZWQg
aW50IGxpbWl0OjI2OyAgLyogTGltaXQgQWRkcmVzcyAqLw0KPj4+IA0KPj4+IE5JVDogQ2FuIHdl
IGFsaWduIHRoZSBjb21tZW50cz8NCj4+IEFjay4NCj4+PiANCj4+Pj4gKyAgICB9IHJlZzsNCj4+
Pj4gKyAgICB1aW50MzJfdCBiaXRzOw0KPj4+PiArfSBwcmxhcl90Ow0KPj4+PiArDQo+Pj4+ICsv
KiBQcm90ZWN0aW9uIFJlZ2lvbiAqLw0KPj4+PiArdHlwZWRlZiBzdHJ1Y3Qgew0KPj4+PiArICAg
IHByYmFyX3QgcHJiYXI7DQo+Pj4+ICsgICAgcHJsYXJfdCBwcmxhcjsNCj4+Pj4gKyAgICB1aW50
NjRfdCBwMm1fdHlwZTsgICAgICAgICAgLyogVXNlZCB0byBzdG9yZSBwMm0gdHlwZXMuICovDQo+
Pj4+ICt9IHByX3Q7DQo+Pj4gDQo+Pj4gVGhpcyBsb29rcyB0byBiZSBjb21tb24gd2l0aCBhcm02
NC4gSWYgc28sIEkgd291bGQgcHJlZmVyIGlmIHRoZSBzdHJ1Y3R1cmUgaXMgaW4gYSBjb21tb24g
aGVhZGVyLg0KPj4gTm8sIGluIGFybTY0IHRoaXMgaXMNCj4+IHR5cGVkZWYgc3RydWN0IHsNCj4+
ICAgICAgcHJiYXJfdCBwcmJhcjsNCj4+ICAgICAgcHJsYXJfdCBwcmxhcjsNCj4+IH0gcHJfdDsN
Cj4+IFRoZSByZWFzb24gYmVpbmcgQXJtNjQgdXNlcyB1bnVzZWQgYml0cyAoaWUgJ3BhZCcpIHRv
IHN0b3JlIHRoZSB0eXBlLg0KPiANCj4gSG1tbS4uLiBUaGV5IGFyZSBiaXRzIGZyb20gdGhlIHN5
c3RlbSByZWdpc3RlciAocHJiYXIpLCByaWdodD8gSWYgc28sIHlvdSBjYW4ndCB1c2UgdGhlbSBm
b3Igc3RvcmluZyB0aGUgcDJtX3R5cGUgYXMgQUZBSUNUIHRoZXkgYXJlIFJFUzAuDQo+IA0KPiBZ
b3UgY291bGQgcG9zc2libHkgbWFzayB0aGUgYml0cyBiZWZvcmUgd3JpdGluZyB0aGVtLg0KDQpU
aGlzIHdhcyB0aGUgYXBwcm9hY2ggdGFrZW4gaW4gdGhlIEFybTY0LCBJIHRoaW5rIHRoZSByZWFz
b24gd2FzIGJlY2F1c2UgaW4gdGhpcyB3YXkgdGhlIG92ZXJhbGwgbWF4aW11bSBzdHJ1Y3R1cmUg
d2FzIGxlc3MgdGhhbiBhIHBhZ2UNCmFuZCBpdCB3YXMgZWFzaWVyIHRvIG1hbmFnZSBzb21ldGhp
bmcsIEnigJlsbCBzZWUgaWYgSSBjYW4gZmluZCB3aGF0LCBJIHRoaW5rIGl0IHdhcyByZWxhdGVk
IHRvIHAybS4uLg0KDQo+IEJ1dCB0aGVuLCBpdCB3aWxsIGJlY29tZSByaXNreSBpZiB0aGUgZmll
bGRzIGFyZSBkZWZpbmVkLg0KPiANCj4gQWxzbywgdGhlIG51bWJlciBvZiBNUFUgcmVnaW9ucyBp
cyBmYWlybHkgc21hbGwuIFNvLCBJIGRvbid0IHRoaW5rIGl0IGlzIHdvcnRoIGl0IHRvIHN0b3Jl
IHAybV90eXBlLg0KPiANCj4gUmVnYXJkbGVzcyB0aGF0LCBJIHRoaW5rIGl0IHdvdWxkIGJlIGJl
dHRlciB0byBkZWZlciB0aGUgaW50cm9kdWN0aW9uIG9mIHAybV90eXBlIHVudGlsIGd1ZXN0IHN1
cHBvcnQgaXMgYWRkZWQuIFNvIGl0IHdpbGwgYmUgZWFzaWVyIHRvIHVuZGVyc3RhbmQgaG93IHRo
aXMgaXMgZ29pbmcgdG8gYmUgdXNlZCBhbmQgdGhlIHNpemUgKGZvciBpbnN0YW5jZSwgSSBkb3Vi
dCA2NC1iaXQgaXMgbmVjZXNzYXJ5Li4uKS4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBK
dWxpZW4gR3JhbGwNCj4gDQoNCg==

