Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5cbxOugoy2n/EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6A53632A6
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268238.1557616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH9-0001kH-ER; Tue, 31 Mar 2026 01:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268238.1557616; Tue, 31 Mar 2026 01:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH8-0001WH-Ne; Tue, 31 Mar 2026 01:52:14 +0000
Received: by outflank-mailman (input) for mailman id 1268238;
 Tue, 31 Mar 2026 01:52:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OH5-0000th-ET
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OH4-00HCrd-Qa
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c4-e002-0a2a0a5209dd-0a2a450a9b40-8
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:10 +0200
Received: from [52.101.69.97]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28ca-1772-0a2a450a0019-34654561d17f-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:10 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:08 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:08 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otjT++I3sHDf5/sgY4BCllS3qwXmxDG1btJkWO8dMFBDMnNgvEN7rMiFMW3/sTRbcBnjHNrJw9R3ihaDQwSZGT0741SIFtdGR5CX8sv8kMxVebohdHANC3p+DRJ0XKCHyV7Gy2GI84QciutnYt1Po4cml6Bwb2SG/SzSBo7dHkjTGBnh0Xy9klY6HhsUAMmRCIMM9oSzmUNSUW5AynXivKfFDje4PoZV9neqE0W22y4AP9ClIaxg33Ewmzc0mTvSxtInWc1og4wZE0/w1WMk8V2HE/wr9BbJde4nxJc9VXHIhJTRjBE2pP89TLryf7cgh9d27k2fXRhMD176rJISmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXhNhmeBsAMGLXv0m9TJS6bdySQwdDw1TxpIXOUF0+Q=;
 b=KfzFOcr1975JS0mL5jQPNw08VQ6rjNpY2Jcu81M3HaaX30IvyQJyNtHIERouQEQ0k7x/fh7BLFzCbCtmMWBDnmKe7fifkzjw/393CGhYFarYEG5IlH/6MLodTFXHj2tFMqtJiDEVS57HTQZJvvjsSb9nJ+bQLdEezt590SHXFmSFXUK6HH50P0m98QNfga4wB9YsdtIKyjYgMzSonxsA/3PrAC4f7v2InIuflwvMQ8YBh2PRqKPgzqNDRImefHWKLCO+Q+d+xF9HrUqEqCMc2ydEMK6G4zZXFWkwr6o4HtrXEk1oVcnaHyX0mXIJDljcRuHY4KLVKWuVaDIQPMC//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXhNhmeBsAMGLXv0m9TJS6bdySQwdDw1TxpIXOUF0+Q=;
 b=HNVvmJHIKISmYyZejuoYnwXS55m7NBvgK9/ZRE4xnTagnne6aBBOynIlUBOsojNqs7ZeCMBp2cnHS6bkjS7ZYpBgdI5kEYbD4aay1CrCSJbI+irWig4YYrMIq1jsOruyfDqYTIgM8cQVCnRGijgg20+3Il+1mbue9uiaGfwiCD9R4XP5inDV6If4m0TuWX5BQ+jZVmJxdMLGRvFuk/jZBdO2ArCRV1onQTbx0VmSPuv9YTxYwQHhWmKV4XM1Lw+q52gsnrRm0qwsn3OTlFESqPf/Qwwa1o7fF8Vk7gw99UL/CXIXNpzPWi2utZZG8oO6r7UAuSo9qxJqSlyzzDwK7A==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v3 11/23] xen/arm: vsmmuv3: Attach Stage-1 configuration to
 SMMUv3 hardware
Thread-Topic: [PATCH v3 11/23] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
Thread-Index: AQHcwLD7gqsLwrZ2MUavkcfqF1wIOg==
Date: Tue, 31 Mar 2026 01:52:08 +0000
Message-ID:
 <059c718f5407b845b84ec53cdc3ff021296d8bf9.1774918270.git.milan_djokic@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|GVXPR03MB11035:EE_
x-ms-office365-filtering-correlation-id: 115bf563-7140-4672-4bb2-08de8ec81e67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 RUWsTWnTZUz/nzgk1/393tMrVPXFz9AWfnI83F1BCUPZw1EKd1Wvay41nd8M7CpaL8Cox1QJU+F3Auf42o12FsFd4muVAPKVor/NpJggojaah8Xe74NBnAGg9hwAdECNZDnv/IhmRuqHN1SrbE8Lq+RYyotPEZCp4Ykv7DI6KZd09VHMkg1UtoQFoPXA5J4+u1jdcDJKywp0pp1MHJdFFkFZWbDD+ZQAIH3eRyVDsgCVBsyzT+eJA+tCCvgiwtq4mrY7cQNkUohdn2Zpnb94MGsJSn0gHSbC4UbLOoiaZPDgcAoni5zjenBcw7PYpGdpKDgAtlevnr2P2P5f5uGeRfHuTyU/mXvRdsyIGetHCN+K02gBYGUe7e+5IrD3I4+1aBhwBqwPLihqMIGUhA2VACau3n0RM+zzism40Pt/uV6hD7EDPbxkaHmVigbdKi69zKNgVCdCwz1jrSoUNcOW4f/QKObGbFr1SyMpoICRFaJnLxXDhGMKXxiWraeqNsszC3MocWXJ3GNwuBLpFz3yg2nf5t0c59tj3PM+YAxD+mq7/iVnuBdhY64YfJsSgVSbbJjYs6X6KRlau/G0KEyo7o7UUUdyd31GbXvhAIogiS8IrwyTAW4YyZrzmRQgs3swexmc56Py62tktU59EmB42QG/yhbaEOjZQNf2Ad6RgR4DDID85AnpuGKKfuKF+UfUIC1ybbzVbInoBr/kakZ49Ip87FQvbui50MmsBGogs72NzkabZxhtnUAcBEKr7wuqNoFu8PpzDBJBidaHgVHfBXx8rh6XWWlnVRwoQaITtQw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?P4mYxPE12kqnYB/N5gXfhriyr552SrsOpZn69jnurGfM5hMB9AKvk4RY4D?=
 =?iso-8859-1?Q?/NTcWGvEPmC+S87h/AtGi5VHYGwi5dSP2k3QaKs6YT1EH762Ft8CXicYLC?=
 =?iso-8859-1?Q?ggLID5a0LBOLQhUYRzMBFUn9Fls+RWBDVGOaZ0POc9+YrFqv/SrC/+v5MC?=
 =?iso-8859-1?Q?OsZcyYt8pmPcN4yq33RDVHOnzVqeam4MR6T7XX2r9jE/0Yz6kGi4ZlgwUT?=
 =?iso-8859-1?Q?+YPtAQk3xFQKQHzZ626eLw8E4oFFraMp7sN4p5nxO8NHvke97C1iW473za?=
 =?iso-8859-1?Q?3NOBSSFR6bQlSrL0kR7t3gJoIDRKUhKD7kAsW55B8b4k38M8/Op4jnZAS2?=
 =?iso-8859-1?Q?g/uGPxi3oxAUYbu1VCep1Quyk2X9wOfEBOOJCt02IJbK7oEOemrzAIsxlC?=
 =?iso-8859-1?Q?XSbXtiIm/6FZ2DhviPG49VT++dTb8FyKJY3HwHhh+xBuMbAgqySW/7PXUZ?=
 =?iso-8859-1?Q?wOK7XCokF43AKBqe937XKE9hbSbPFE1gD1STbXeIXcIGSb/LOhj5G+YA2G?=
 =?iso-8859-1?Q?i6iOv4XQ0ygTA9GCoJKpRnk/RrzxIiZ7/2dsvzvapPBx2upw47RIcIiToW?=
 =?iso-8859-1?Q?ZQOsAYbAYD38Xdc+Valy7ecVzD2IjsTf+QFxULvSKWRc+4X6PQQgUsaYRb?=
 =?iso-8859-1?Q?KrzuktDBG+GYb3hJSwJBwLgdzMSDggyy5YqeL8MUDHwj/AGeDh9Xg4KMTI?=
 =?iso-8859-1?Q?eScMxRyy6jyPXpjTMsvtYysol8JI8+sZz06MMclTjZGV5W7IP8lFfCXOI0?=
 =?iso-8859-1?Q?nQ9K3sqEmE2TSx6XocVv0Gc4BWAmILibD0gwyAF+WdnYBvqvrWDyjiHcFJ?=
 =?iso-8859-1?Q?aHTmhiT2XG3A/7dudfyR2FyxjgDncAs36MxXV5/Neuj8Xz3qqv1erjgGpy?=
 =?iso-8859-1?Q?GLjKK36qR9gWE2ku1ddq7CNFWyxm1xrPDGBXhVIY512uQl/P1igGHbc3ue?=
 =?iso-8859-1?Q?PFjFX8/unUESL0FUyiA98k+pLbSzcKBOysr8tRmQG1L4+e/+xW+i+rj2bl?=
 =?iso-8859-1?Q?lbWp5SW5O5I5pMOaaTW9kr6gSLDUPlmXkfnPxQNn0bBZMHgTuKwe+m49B3?=
 =?iso-8859-1?Q?d1e42R7ZGibWAjQl/eRTQ4OdxQB9wvBFrXkPfF3f4+FOzKWBnEtSZUY0YT?=
 =?iso-8859-1?Q?0xc4z4PM5FIy3Cm50nm2oTLBsCk4KD6IMd81rjORVYxRUrrl4vA9d46MXe?=
 =?iso-8859-1?Q?wsp8RXkgmW7kQy75FV8Pge+8WFy33zDC4GMcitoIcs4VdoOPCmyPCIVa9x?=
 =?iso-8859-1?Q?MJ9oPk8AVggbMZtnAA6c5GkITAOXJDQJwTlTELYwhP3VXuWnjI4oiveuX9?=
 =?iso-8859-1?Q?jAZhSywIJ3FA8aIshyJbYf4WE8yuOPidlvo91iIo9Zq3OjsO+eNy1rLIID?=
 =?iso-8859-1?Q?jYDNWWoBEJ/PBExXUJ4Dq+mGMNPpDFb52sDFQCjGx/Rfx4WEs/53zQmCyC?=
 =?iso-8859-1?Q?1gz7+yK7Tqi8nShJkhU6BYe8lm4giQ7cyLasEyDvdvA20RFqMfpq3PevsQ?=
 =?iso-8859-1?Q?iQ5iu5T/wG3XkPhGIfjlTf+VVxGidQRPZ2i9zthtaSPbl01H/smeV6XQrc?=
 =?iso-8859-1?Q?ew7hZXXjsVG5t/lr+WbrjdBVKI+ttIsbPKOS71p9cMIeqgl25q2QKbEgBJ?=
 =?iso-8859-1?Q?hGlKGADoR329vmIPDE2BfSqof1Xyw0wovnMPhtVQi0SSVx6uvk9HakBCCS?=
 =?iso-8859-1?Q?EUDdoqo4r0ATkiHOTK5TfDLgrOwld+lO7xaxv9n9PgzAkyfbHyyYLVTvLx?=
 =?iso-8859-1?Q?FDAN1PRh1Y050Jo3lj100e2crmCFMMsSNnMaa9e9bRSytMubn6Za1XwKR6?=
 =?iso-8859-1?Q?8rGjElfUkDvBBvKq/hdJLNJsNIoQRP0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 115bf563-7140-4672-4bb2-08de8ec81e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:08.7684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t0RBCsIdtSEbhG4GJD4O+/1Kc2EJmvBhwOQz4VoLvdSK5rR9DUjeDwwpNOCm9gXUdpUIM49WsOuxfgGmbAzVXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-4011c0/1774921930-BFE9D900-8BB2AA39/0/0
X-purgate-type: clean
X-purgate-size: 7004
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3F6A53632A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Attach the Stage-1 configuration to device STE to support nested
translation for the guests.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/include/asm/iommu.h       |  7 +++
 xen/drivers/passthrough/arm/smmu-v3.c  | 79 ++++++++++++++++++++++++++
 xen/drivers/passthrough/arm/smmu-v3.h  |  1 +
 xen/drivers/passthrough/arm/vsmmu-v3.c | 18 ++++++
 xen/include/xen/iommu.h                |  6 ++
 5 files changed, 111 insertions(+)

diff --git a/xen/arch/arm/include/asm/iommu.h b/xen/arch/arm/include/asm/io=
mmu.h
index ad15477e24..56bc9314a7 100644
--- a/xen/arch/arm/include/asm/iommu.h
+++ b/xen/arch/arm/include/asm/iommu.h
@@ -20,6 +20,13 @@ struct arch_iommu
     void *priv;
 };
=20
+struct iommu_guest_config {
+    paddr_t     s1ctxptr;
+    uint8_t     config;
+    uint8_t     s1fmt;
+    uint8_t     s1cdmax;
+};
+
 const struct iommu_ops *iommu_get_ops(void);
 void iommu_set_ops(const struct iommu_ops *ops);
=20
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 87612df21d..cf8f638a49 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2810,6 +2810,37 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(c=
onst struct device *dev)
 	return NULL;
 }
=20
+static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
+				u32 sid)
+{
+	int i;
+	unsigned long flags;
+	struct iommu_domain *io_domain;
+	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_master *master;
+	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
+
+	/*
+	 * Loop through the &xen_domain->contexts to locate a context
+	 * assigned to this SMMU
+	 */
+	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
+		smmu_domain =3D to_smmu_domain(io_domain);
+
+		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
+			for (i =3D 0; i < master->num_streams; i++) {
+				if (sid !=3D master->streams[i].id)
+					continue;
+				spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+				return io_domain;
+			}
+		}
+		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+	}
+	return NULL;
+}
+
 static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
 				struct device *dev)
 {
@@ -3022,6 +3053,53 @@ static void arm_smmu_iommu_xen_domain_teardown(struc=
t domain *d)
 	xfree(xen_domain);
 }
=20
+static int arm_smmu_attach_guest_config(struct domain *d, u32 sid,
+		struct iommu_guest_config *cfg)
+{
+	int ret =3D -EINVAL;
+	unsigned long flags;
+	struct arm_smmu_master *master;
+	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
+	struct iommu_domain *io_domain =3D arm_smmu_get_domain_by_sid(d, sid);
+
+	if (!io_domain)
+		return -ENODEV;
+
+	smmu_domain =3D to_smmu_domain(io_domain);
+
+	spin_lock(&xen_domain->lock);
+
+	switch (cfg->config) {
+	case ARM_SMMU_DOMAIN_ABORT:
+		smmu_domain->abort =3D true;
+		break;
+	case ARM_SMMU_DOMAIN_BYPASS:
+		smmu_domain->abort =3D false;
+		break;
+	case ARM_SMMU_DOMAIN_NESTED:
+		/* Enable Nested stage translation. */
+		smmu_domain->stage =3D ARM_SMMU_DOMAIN_NESTED;
+		smmu_domain->s1_cfg.s1ctxptr =3D cfg->s1ctxptr;
+		smmu_domain->s1_cfg.s1fmt =3D cfg->s1fmt;
+		smmu_domain->s1_cfg.s1cdmax =3D cfg->s1cdmax;
+		smmu_domain->abort =3D false;
+		break;
+	default:
+		goto out;
+	}
+
+	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+	list_for_each_entry(master, &smmu_domain->devices, domain_head)
+		arm_smmu_install_ste_for_dev(master);
+	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+
+	ret =3D 0;
+out:
+	spin_unlock(&xen_domain->lock);
+	return ret;
+}
+
 static const struct iommu_ops arm_smmu_iommu_ops =3D {
 	.page_sizes		=3D PAGE_SIZE_4K,
 	.init			=3D arm_smmu_iommu_xen_domain_init,
@@ -3034,6 +3112,7 @@ static const struct iommu_ops arm_smmu_iommu_ops =3D =
{
 	.unmap_page		=3D arm_iommu_unmap_page,
 	.dt_xlate		=3D arm_smmu_dt_xlate,
 	.add_device		=3D arm_smmu_add_device,
+	.attach_guest_config =3D arm_smmu_attach_guest_config
 };
=20
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index fab4fd5a26..df3b7ec1b5 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -398,6 +398,7 @@ enum arm_smmu_domain_stage {
 	ARM_SMMU_DOMAIN_S2,
 	ARM_SMMU_DOMAIN_NESTED,
 	ARM_SMMU_DOMAIN_BYPASS,
+	ARM_SMMU_DOMAIN_ABORT,
 };
=20
 /* Xen specific code. */
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 39ed4dc577..6d3636b18b 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -224,8 +224,11 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu =
*smmu, uint64_t *cmdptr)
 {
     int ret;
     uint64_t ste[STRTAB_STE_DWORDS];
+    struct domain *d =3D smmu->d;
+    struct domain_iommu *hd =3D dom_iommu(d);
     struct arm_vsmmu_s1_trans_cfg s1_cfg =3D {0};
     uint32_t sid =3D smmu_cmd_get_sid(cmdptr[0]);
+    struct iommu_guest_config guest_cfg =3D {0};
=20
     ret =3D arm_vsmmu_find_ste(smmu, sid, ste);
     if ( ret )
@@ -235,6 +238,21 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu =
*smmu, uint64_t *cmdptr)
     if ( ret )
         return (ret =3D=3D -EAGAIN ) ? 0 : ret;
=20
+    guest_cfg.s1ctxptr =3D s1_cfg.s1ctxptr;
+    guest_cfg.s1fmt =3D s1_cfg.s1fmt;
+    guest_cfg.s1cdmax =3D s1_cfg.s1cdmax;
+
+    if ( s1_cfg.bypassed )
+        guest_cfg.config =3D ARM_SMMU_DOMAIN_BYPASS;
+    else if ( s1_cfg.aborted )
+        guest_cfg.config =3D ARM_SMMU_DOMAIN_ABORT;
+    else
+        guest_cfg.config =3D ARM_SMMU_DOMAIN_NESTED;
+
+    ret =3D hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
+    if ( ret )
+        return ret;
+
     return 0;
 }
=20
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 37c4a1dc82..19e59095c3 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -312,6 +312,7 @@ static inline int iommu_add_dt_pci_sideband_ids(struct =
pci_dev *pdev)
 #endif /* HAS_DEVICE_TREE_DISCOVERY */
=20
 struct page_info;
+struct iommu_guest_config;
=20
 /*
  * Any non-zero value returned from callbacks of this type will cause the
@@ -387,6 +388,11 @@ struct iommu_ops {
 #endif
     /* Inhibit all interrupt generation, to be used at shutdown. */
     void (*quiesce)(void);
+
+#ifdef CONFIG_ARM
+    int (*attach_guest_config)(struct domain *d, u32 sid,
+                               struct iommu_guest_config *cfg);
+#endif
 };
=20
 /*
--=20
2.43.0

