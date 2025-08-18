Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED46EB2A25C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 14:56:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086042.1444274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzPU-0005lo-5b; Mon, 18 Aug 2025 12:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086042.1444274; Mon, 18 Aug 2025 12:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzPU-0005kY-1D; Mon, 18 Aug 2025 12:56:24 +0000
Received: by outflank-mailman (input) for mailman id 1086042;
 Mon, 18 Aug 2025 12:56:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=czvt=26=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1unzPS-0005kS-1W
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 12:56:22 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc35683b-7c32-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 14:56:20 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by VI1PR03MB9899.eurprd03.prod.outlook.com (2603:10a6:800:1c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 12:56:15 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 12:56:15 +0000
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
X-Inumbo-ID: bc35683b-7c32-11f0-a32a-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJXbSCYKQIpgsgx0Ragt9fmXwpAqyrq3e5Q6nqzSA5mdTp9gZn4Vab8XbDHD4R3Z7Uj89JaY7BzrFXu/5T0SAEDK7l2JEMgNZRYAFCrvFa2HLnPW2rkqSTPShYlcRvGYRjp/qO0GO1tQ/GHyq8AS94iH1MBy9x45Ttm3mNLcBRO5cCz7Fto3VDDXOXDMzWSzTzarSK9mjBGxYwiq/8k5rNPhOAQ5x949wU5x/p0sGK900xz44tEv14X/n6U1yTnKmPyE896AWYeDBoClyEpBxsqCTS+AqM78B1PBgTnYP43N4mgjVERF66ixxmFrdwH28irkUq1fVHgb+ol3XbDn6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3PkTjPlHqleawYudLmsGxHkeJOc73PULHhrG4Irv20=;
 b=oURakob7QP7YDn5LWKoCUlddM2qJcYdqCi4oM0XLSgtFH5gC5p/DisKb8WIzV5pT62d9M2tnbXn2RXILZA8i/Uqn7Yd7D3JUQlhyjAQz54t+k0i+DvLkNB/fMfTveyYanU+vOw1B1Y1HfqyvhGCjUe92fhknWuONtr46gEw7fKJdivJyWWSGA65gxuvYGiBn2PMxCgLDz1y4JSh8KHR3vEOxYQcBgVw0jvQRzCShn3x7Um/jWuoEsmOBgJueKcpnQxfHw8FmGGeteT7t2l3/ERQ2T41pSHOzt6WWoLbsk4AtNg3ry7+iDb86+ztHEZLUbCvYgiDjDVsBQ8qzl7vYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3PkTjPlHqleawYudLmsGxHkeJOc73PULHhrG4Irv20=;
 b=B65pXLVxBjslTYur1kfr/af8P9jo9a87SyG3bkUgSSLFQH2jr5wuHla9N/UYeILElm6PapIRWxDx1xGLQgFUgtesWA8BIOxItLspIw3rd2QWeIXtWlcY/s6Zj/b7SEY7jl680Q6ryYW6n/EauUW1TKRZOcX9/hQN5yQvKf4SC8mAJtKhTASE0HHyGZUwVFU90zC3tag97+SmkjlgG3myQo9TtXwhH7C1aP4YP9A+tCSkweYkxzJeQ0JIjoowUqHTnBAEcbg6b89diPOcP1Tkqb6XOHE5xICVtFrUhIeue8fngk/Xbj2UO6HTw1XcryE9vzsFZp69iteRK6+t0e/H+w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>
Subject: Re: [RFC] Next steps for MISRA C Rule 17.7 in XEN
Thread-Topic: [RFC] Next steps for MISRA C Rule 17.7 in XEN
Thread-Index: AQHcA9WdQBGGn1ngVkiEBTFhozxERLRSJHeAgBZS0gA=
Date: Mon, 18 Aug 2025 12:56:14 +0000
Message-ID: <c3bb91c6-ca74-4fab-8ca8-cd5ffed3f954@epam.com>
References: <6d622813-1617-4af3-876e-52a551518f68@epam.com>
 <9d71cc11-884d-4924-9de9-e3396801158a@suse.com>
In-Reply-To: <9d71cc11-884d-4924-9de9-e3396801158a@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|VI1PR03MB9899:EE_
x-ms-office365-filtering-correlation-id: a5259a45-d788-45f2-049c-08ddde569da6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S2ZZaVVQOTAyWkxlSTRBMDd6NDhBQVZoMjhOM0ZaVGViRjJjOWpRK1hzNE5Y?=
 =?utf-8?B?anpSbHBGaWZpc203L2oxM0FlNnZjMVNtNlRLbGFmNHExQTJBWEoxKzhLVUg4?=
 =?utf-8?B?aUgxNXlGbGFJWWN1dHZ0WngxV1F6bHE1LzlKM042QXAxM0NaZmQxSm8xaUZk?=
 =?utf-8?B?d1JQZXhlaGZyd01Ud0N3WmNLbnJGbEo1Q1h0VkUrcmM2dGs1VW9ibDJ6dmdp?=
 =?utf-8?B?TWduNGRwV1NGYnM1cHR6bEFNN2FGeGlnRVM1azFzM0hLeWV0V25oaXZGMTNW?=
 =?utf-8?B?Q2FNUHREVVgzN3BkL2tWWXYyTDhjY1VIVE9tbmhScTFvSUJHdDUvRlRVVWJK?=
 =?utf-8?B?RkNyZU5hN2FrbHpTNXkzK0xISkR3YzR5UWVlS0VFSlE5T2pEZVNLcXNKVVND?=
 =?utf-8?B?aHQzK29QWlpLNkU0T1E3U3hsMFA5bmZOYWxyUmQ3b09uWWM4d2d1YUIwNkhl?=
 =?utf-8?B?dkZVWGNNUzNDb3NLcUdjWHhzMTh0RTJjTkRYZUFZbEdCSVpFWndCRk84R0Vw?=
 =?utf-8?B?S3ZrRjZHTTBDS0pEVWtLNWp0Z1JnMGZjMzdnWU9sWlpnU2V5TU5VTVl0MURQ?=
 =?utf-8?B?NXFrZG40RjZpMjNDR3RGbGZqbHdIQ3VLajcxNFp6UDlCK0hxU1QvTmZkdDdv?=
 =?utf-8?B?R3lnSlFwcEZ0a2hLM3I2dzRFbkJscmh3UXoxT2luM2xOeFI5dHBUa2dZUWFJ?=
 =?utf-8?B?V1ptR1JQVis1V0RLaGFDNVdjZlZmYlJOZXBpSXU0TGV2YVNZUlVVM3JWazFj?=
 =?utf-8?B?Tjdla3hhOTJTcWRVeVVjZ0RDSHZvZm5JVklaZE1nTG1yY1I4U0xLdnI0Z0Jv?=
 =?utf-8?B?STFRdnZZMW5YQTA4bHJUcmt2bnhUcm1lRFVDWXF3T2IwbUFlN2hUZWl1Qlpk?=
 =?utf-8?B?ZlFIRzF4MXdBV1Z6MERLSERqVjZIZVN6WENTc2luRWFLUkZpRkVZOGZpbDNJ?=
 =?utf-8?B?VlUzNzA1RDgvbGpGWjBpREZUbUNVMFpQc2dZdk56Wm80MHdnejkxOGpOR1cx?=
 =?utf-8?B?OXRmREwxSGN4NEJNd3k4NnE2ZVN0cFZyV0xGVGlhNm1ValZWVmdoZHc1dnB2?=
 =?utf-8?B?dHJ1RW1SSjhIQ1JER0RCNGFJYkt6NVYzcEIzQ2lpNy9wWWExMWR6b0I1dE9Q?=
 =?utf-8?B?UGpIbDBVbkJWTzVOTG1CSkI2UEVYV08ySGVLU1ZzZzhsMUE2akZibGQxWm5j?=
 =?utf-8?B?L0REcmJHQUFGMTZ5UzNHUHczRHZRZkZFTHpqREx6ZFNXZm5BRUJjSHNyRTV3?=
 =?utf-8?B?NXJlOGFTcXI0ekR5a2FmS2d6UU5VTmx0UzBiQUNxUmFTU09SQmJzTEdYdkFm?=
 =?utf-8?B?S094emJjSG1Fa1Rud1FZUllEZUJ3Y0YwZHdQeG02U2ZOTkZmdDNma25QYWd1?=
 =?utf-8?B?OHlOMk5GM0h1Q24yYmpIcUVzMFYxTTVXcHNERHNTRFhzdjlzYThuMnlwWTNk?=
 =?utf-8?B?cjJQeml5VUtWVWV3MFVXbktoVE5MV1BIQ1hzRUNoQzUzN2FLNFVGcFRYZjVE?=
 =?utf-8?B?QjR1KzB5YWU0N2dLMDhCNzFnV2labzZyZGM2MXVhZ1VieUE2WUM5TFVabXEy?=
 =?utf-8?B?K0FHZHpPNzM1TjVZanRsL1pjcDdmOVhudXVROE5BWFAvcE9lU0NDdnE0M3ZP?=
 =?utf-8?B?cU5BUUFDcFFrdUFPVkhwT0hUNjhFWFhack9GWUpjOTU0cGl1Y052WjVtVDNp?=
 =?utf-8?B?akF6eGhkMHdnc0VkR0VJQnRhUjZZRUxUQWZtUVVNemN2Uk8rYlFVQkRmd1pv?=
 =?utf-8?B?NW9iMWhQU0ZPRy9mVk1KcDlCY21oRG1pdzJweU0rYk45OGVsczJJY29OY3lQ?=
 =?utf-8?B?dWFmSjJYYm1VaXE3MjlpajExQ21wZ1lZWU44UGJ1cldvcnV6bncvc29sQ2JB?=
 =?utf-8?B?c0N2YXplQXJKNFFyek0xdVoxN2VhcHVHODZUSzc5UTk4Y25qMkZlZ0J6WXEz?=
 =?utf-8?B?dTFUOGV4d01aaWJjWEFoODFFMWhFM0toaXJIalJjbFdiRkkzZjNJRlcvNE0v?=
 =?utf-8?B?OGNLLzA2MlJ3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vi9sYldLN0t1ckRRUnlkVXV5QUc3TkRWZDd5Vlo4Qm5wVU91Qk13bGt1L0RO?=
 =?utf-8?B?Y2hyQXNhaTF0NG80K3h2bitUa0JHdU1KUnVOUkp1bFJ3R2FGS3d3TUpqK05P?=
 =?utf-8?B?K2pEVVp0U2VuN3VPbnJGVXhRenYrL2wwM0FDYnhPQTVEVWZDR0J6VU5YN1ZC?=
 =?utf-8?B?UVZ2c3JFbDFLaUZpbVUwL2FLa3ZLVUR1MFM0UkpzaUhzYUdpa2VHWkhIQkI4?=
 =?utf-8?B?YTBld1YyNGFyaUwxaUF2QXBBQXlyNzBJT0JQOHZvWi9hVzk0V0tRQU1MU00v?=
 =?utf-8?B?TE9HSVM4T1MzdG1uZmUrbkNjaDYvYmR6Ymp1dTNtVE1QZDlLRHFGbzJVU3Nq?=
 =?utf-8?B?RXFuVGF6NGRIbHNQQmtDMW5ySVhrZkRqQzhtVUs0c1hucW9RZUpka01uWnYw?=
 =?utf-8?B?VU9NNmF3QWdCSGZWODZPaE1hRzM0eldWSG1uN1RGUnpNcnM5WjlvUzAzL3BI?=
 =?utf-8?B?dU01dnJONzlkMnZMWUVweFZRT2t0RWtoR2NXMHM1V0JwV0xzQm8zTUFQNk1h?=
 =?utf-8?B?RFJwQm1KSzNsZVZTVVgwenlMWFN5ZmkwN3BDMkUzMlJZYm12OGZ6OFF6ODdz?=
 =?utf-8?B?ckRTeVFJZGpSK3dYOXFBTGVFbld0bXRZOGYvaEJxcTZaMkRlVjFVeDdNRHdD?=
 =?utf-8?B?ZFVSeGs2ZVJlbmZrdTJtR09GUWlzaWZLWDhYMzBkemVrTVJGUS95bWl3amwx?=
 =?utf-8?B?Y2E1ZmpTUlVRU3RhMk9sMjJvTm44TTQ1UDRIK2NvbjJnSFovWkxpSUxDUFA2?=
 =?utf-8?B?VE1zRFdFVFd5cW9wODloM1pPMTZxTkE3QzRReVhaNnFHRkM5ZW5vbVkxVWJC?=
 =?utf-8?B?VEJhWXhTSVlqOHNPd1E0WXU0S2h0R0JjMENKN3k5VVNmNnBGTkFXN2E3Sys0?=
 =?utf-8?B?b2FUQWJkS3MxK2dEZzZUUUFlQzUwcGlUZjZBQmYzOXNPRmlFQldiRHUyT3RR?=
 =?utf-8?B?K3N3MUo4U0JTN04yKzRwcFhKQnBKbGp3dWc3R1JnOGFTNEY2YWFLWlpmOEhY?=
 =?utf-8?B?MWxuWklwOU9qKzNsRjRveVNCbUpXMmdjS2RQTUEvVTJQVGhub1FTNDMyMHJw?=
 =?utf-8?B?MHVudVZxRGd4YnArNy9SWjZGbnNnSG1MNUJoWnE1SmoxUHhhaG00RHJFT1Vh?=
 =?utf-8?B?UVFHTlpvSUNCbXBoWTZOeGtYc0dlTHI2WVp4bng0NXhWT0VXSDc0d2dCS3JL?=
 =?utf-8?B?VXJNS3g0NFJYNDBCemF5RlNEalNEdEk5azVzczZMR1E3dzBsdXVPSGpZNnhm?=
 =?utf-8?B?QjU5bDcrOEpXVkNKTGJvZEdwS0xrbDZMTGJ6ZGk0MkVTMkxnVkUrZXVSUVVo?=
 =?utf-8?B?andNM2o4am5FalNUUExINmxGR0pKbW84cEdFOGt5QmczN1d3bGdDeTkyYWNN?=
 =?utf-8?B?RHN0K1FLWU9ZZThsa2FjTG4rdnBJaytNSEROb2diWDI0ZmhFSWh4SGl2UEtU?=
 =?utf-8?B?ZVk0bnRROVgwUFMwMnNoS2RmSHdrbjdwMHA4cm5aM1J4b013cDFZR20vV3NB?=
 =?utf-8?B?a0w0N2RyQzJGU0lFUFk3dkhDTTA5VnA1ZlhHc3Q4UkttWmJTUnRFZTNaNENo?=
 =?utf-8?B?V21UY2RORXNSK0JURVhCdjBZK0d1d01CUnNQbUJpWi9XZkhMaDJveEdSUUFu?=
 =?utf-8?B?YkZ6cFo0bThKWmtUN2F5RTgwUlJUeTRLUEZUc045V01XT1ZQS0x6ZU9lQkdi?=
 =?utf-8?B?TmRHVTNGUU1neVJ2SzFOOFZ6bTRsVHdFZTlXNm1PeEJzLzhGK0ZpVmJrek01?=
 =?utf-8?B?UzZSb3dnSzVyMUdrcmVRdGwvYk9oWXJMbXRJUzJmTDJtS0xSY1lhVTRSc3JZ?=
 =?utf-8?B?QU9jRmdVWU9zRS9lVzEzcDlBUzNHc1B1Z00zK0tPQmh1NUh2OEpMWGZJUmhk?=
 =?utf-8?B?WnJIQUxSUHNIeDNobUNDa1JZM1dVSmFIUUxCUDZBS1Bsc2pJMTZRZWdHYWVr?=
 =?utf-8?B?TUpaaWZ3MGN0ZDhnRGFOWWtFRHRRdFdYbklsVFpweTlVYW9Ld1dvRnU4ajNX?=
 =?utf-8?B?L29JdldLSngybW1vNEZUOW11amtPUFR6MXIveXA1OGFiZkFpemhQQVByZHpV?=
 =?utf-8?B?SGowQjJiNklUQXo4Wkd6U0FVWjRxWVFxR0ZwR29RUzVtNVhDdXQxU1MxWW1O?=
 =?utf-8?B?eURDYitBbU5xck5tWGZTYllIZlg3U29vNE4zVVNQRlBiQVRLZlJkK0pSR1U4?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA56BF02F477A748B5813B233930D9A9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5259a45-d788-45f2-049c-08ddde569da6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 12:56:14.9453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GIZJgT5ajlqJjqQ9ZWSSL8cfwQ6U0w9gt+nfMtU088Lm6omnoYFTOUZgj0dNm44aGEt//8sI+rFJmGNN3fVjHD5xp2ufS3getLy6x65ds2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9899

DQoNCk9uIDgvNC8yNSAxMTowMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAyLjA4LjIwMjUg
MTk6NDgsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+IFRoZXJlIGFyZSBhIGxvdCBvZiBN
SVNSQSBDIFIxNy43IHZpb2xhdGlvbnMgaW4gdGhlIFhFTi4NCj4+IFRoaXMgcnVsZSBzdGF0ZXM6
ICJUaGUgdmFsdWUgcmV0dXJuZWQgYnkgYSBmdW5jdGlvbiBoYXZpbmcgbm9uLXZvaWQNCj4+IHJl
dHVybiB0eXBlIHNoYWxsIGJlIHVzZWQiLg0KPj4NCj4+IEFjdHVhbGx5LCBuZWVkIHRvIGRlY2lk
ZSBob3cgdG8gZGVhbCB3aXRoIHRoZXNlIHZpb2xhdGlvbnMuDQo+PiBRdWljayBhbmFseXplIHNo
b3duIHRoYXQgdGhlcmUgYXJlIGRpZmZlcmVudCBjYXNlcyBpbiBYRU4gY29kZSBiYXNlLg0KPiAN
Cj4gTG9uZyBhZ28sIHdoZW4gd2UgZGlzY3Vzc2VkIHRoZSBydWxlcyBpbiBhIG1haW5seSBhYnN0
cmFjdCB3YXksIHRoZXJlIGFscmVhZHkNCj4gd2FzIHF1aXRlIGEgYml0IG9mIGRpc2N1c3Npb24g
YXJvdW5kIHRoaXMuIFN0ZWZhbm8gLSBJIHdvbmRlciBpZiB5b3UgaGFkDQo+IHRha2VuIChhbmQg
aGF2ZSBrZXB0KSBub3RlcyBiYWNrIGF0IHRoZSB0aW1lPw0KPiANCj4gSmFuDQoNCkhpIFN0ZWZh
bm8uDQoNClRoaXMgaXMgYSBraW5kIHJlbWluZGVyLg0KVGhhbmsgeW91Lg==

