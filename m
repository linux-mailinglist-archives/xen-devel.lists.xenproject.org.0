Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHxfNCn8jWm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:13:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E720B12F3F2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:13:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229424.1535375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZIq-0002JC-3z; Thu, 12 Feb 2026 16:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229424.1535375; Thu, 12 Feb 2026 16:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZIp-0002Hb-Vl; Thu, 12 Feb 2026 16:12:27 +0000
Received: by outflank-mailman (input) for mailman id 1229424;
 Thu, 12 Feb 2026 16:12:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Krcj=AQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vqZIn-0002HQ-KE
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:12:25 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b905d9f-082d-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 17:12:20 +0100 (CET)
Received: from DUZPR01CA0094.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::20) by AS8PR08MB5879.eurprd08.prod.outlook.com
 (2603:10a6:20b:293::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 16:12:16 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::ca) by DUZPR01CA0094.outlook.office365.com
 (2603:10a6:10:4bb::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 16:12:12 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Thu, 12 Feb 2026 16:12:16 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS2PR08MB8878.eurprd08.prod.outlook.com (2603:10a6:20b:5f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 16:11:13 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Thu, 12 Feb 2026
 16:11:13 +0000
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
X-Inumbo-ID: 9b905d9f-082d-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TSE+vUfG0epM7M+K4168Rilf9x9XPWBDDOYoFthTIWnbRdFPJB8nIc+Jl21Os7ss7M2rEwTDB+jplDm6/6UGJrQHhLE7bVNDpnGSDnxpAimdxUX1zQ+Am1IeKaNUkkHxxL2MiyLiwJnJlqwr3DW/3Qs4SS7GsJcfhNAQp9xmQw4gcaTNyq2W20YOqtiy5OPv6NArR0yxo6RN2dxZp00EAyVD5uLVNN7OgUhJ1vKlwbKU0rQ5eq0X3LubOKrYJXwBJUEtV3Sf3hThU1rjKAGbSJ8f8hNBrFe6kCVSvJKHof7/3Dnabh87I7q2oUGctoi/3emT3nZ2+TzxxLCR7Uq+DQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdeApeURvFvT/CvvTI4dLgaDQqmGRGBGTQ0aOhn9Tbg=;
 b=HgBPDVE579WzzePHFA1GOu2J4UavTUylhc35xHcwNeh5/tSfRWZtENrreOug/3VauiI0XXn0vLgzUsfQ9eNdhzzBdr72I5FZs2FTozt7/oLvykclXGik5kaA6EzvVPqsbNknkUuSmqGRPBT/vGN4iQekXpCBE2AAAhUlZ3csrMmlNejMDW8rFvdpMIYyjD1xdm+SYLVVYYfPCJci019W/VrXEj+187S2mnbNfVuRVWRaWz5o2NIwFsuwsj9cK8NMNU4WV1xrw1IJKGeFGjkDjZFfNCaaBkE2OZ796ne+zhAvRfwjt3XpNKXOlAJ1PV0sqWPPo/GPLGB4Nqrz7DbkMQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdeApeURvFvT/CvvTI4dLgaDQqmGRGBGTQ0aOhn9Tbg=;
 b=Td1yX5MsIqh+oFCDjja6T4X96ulTskfo97WD3GbUMO6ZWjJO0rPGgdLUnD1PvI2KiikDoPb+B3NxQWEiNDBH9Onz8EQDJjJi3AoySk29rusou0RQIxZG7qyHxsGatGlhK1XpWo+gXDJiyaaVxiifJJgKl0AVs/5P0nx6xGbFRso=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J87XbuBv+SR2JdE2R5p/VaB8VVZRoIVaUw5XNWAqe/AvAx77jTzKDd8aDgHwLin9ncTIbQc+7T4xLXWAy0jO4TLErstpYKOeMj6OpYj66/+IMPVr51knyujHcYUpnuUpQSd8bCclxMFkfWnxyUJlAJNCTyT5cVA72SJYdmGazkU8UHSZbNYv3i2nvA3y07cJbrbTv3svoXbyBUn/HgAld1sFD/4nxWdcWBiZ2pMwAtlBzRuMhZguyAVhQLCORzDttZK7doxwIty6pzAi68imyy8Tt94zNXq++HU4Da6oEpbkSvgu50JkOXgXedS/FLC2sHAyWKBWfuwL0/P9+qcMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdeApeURvFvT/CvvTI4dLgaDQqmGRGBGTQ0aOhn9Tbg=;
 b=meZ+sF6csGsSOCxDIAP92+VqVXaD9V0VGgpo/U0DO7CQX7X/hvgNp7M95FDZeDpOcLJ6Vq8kzuXW67PQGURHEEtXzzZ9NT2SPufz7PgHg3es+8wtHI8tQj6Bakb6C5u7wsfXamGzP539kpMuWfDTRQNMDws0Anv80/jb+cwW8s2o6ekUubwT7TQzmzPUpj+JwDp9R5RtUzO+1mM7Lz0oM2GIJI7gVcxMto44Eib7k+emxFq8Umv9NhsUmqsK+3GDTHI0ppbHhU2pHWm5PDIuSuRMYf7YbMlo7TmR9OIhuElThutgkn1Dgx5QUamgy6jVt76ANRwGS9SeJh4MZyw1Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdeApeURvFvT/CvvTI4dLgaDQqmGRGBGTQ0aOhn9Tbg=;
 b=Td1yX5MsIqh+oFCDjja6T4X96ulTskfo97WD3GbUMO6ZWjJO0rPGgdLUnD1PvI2KiikDoPb+B3NxQWEiNDBH9Onz8EQDJjJi3AoySk29rusou0RQIxZG7qyHxsGatGlhK1XpWo+gXDJiyaaVxiifJJgKl0AVs/5P0nx6xGbFRso=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH v2 04/12] xen/arm: ffa: Add FF-A 1.2 endpoint memory
 access descriptors
Thread-Topic: [PATCH v2 04/12] xen/arm: ffa: Add FF-A 1.2 endpoint memory
 access descriptors
Thread-Index: AQHcm3onha9BQEHE3UKvQ02zO96nTrV/I0IAgAAaJwA=
Date: Thu, 12 Feb 2026 16:11:13 +0000
Message-ID: <F4DB0616-EEAD-4CC8-982B-7E139E4AE2CB@arm.com>
References: <cover.1770826406.git.bertrand.marquis@arm.com>
 <8ddb97095d8f7f4140e660d2ff13ec2ccc82cc62.1770826406.git.bertrand.marquis@arm.com>
 <CAHUa44FMMVN2qR9f0AdbUguoWWJEyEY93YnCcGynHdpHLwqT1Q@mail.gmail.com>
In-Reply-To:
 <CAHUa44FMMVN2qR9f0AdbUguoWWJEyEY93YnCcGynHdpHLwqT1Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS2PR08MB8878:EE_|DB5PEPF00014B9A:EE_|AS8PR08MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: bb012ca8-ed5a-40be-9c95-08de6a517d78
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dGl4NmxFcC9wMU9Ba2VFR0VSQ2lDOHdtL01WKyt5YzA4aDhOd0JXZTFhUWR1?=
 =?utf-8?B?aEdjQWlvRi9YWVpyWnYyd1FLdHpxZzlXWTU1RStseWlqNG5KREEyeVNDMzRy?=
 =?utf-8?B?b0FKTUIyNXFncU9Gd0tPU1BrQUkraGVWRGJObnFUWjkwTDNPbnorMWpZeS9Q?=
 =?utf-8?B?R0xnK2ROT0duZGhzYXJjT0d5SXVmY096UGJUWUtGTEx2dkpuanM4S1Fpb3lL?=
 =?utf-8?B?bEduZ3JjTzlSYkVwMU1sL1NNbWdRSTljaW9QNDNua1lSQ1YxcXFiZW1QcTZS?=
 =?utf-8?B?UDdYSERrWWRoYys0Zlg4L043akJmOVNTZ0M3elF4Ky9rdVZ6c0t3UnBTOFJF?=
 =?utf-8?B?dzRvbmFBQURDai82bzIraktTckNnOXNydWpOTElwRi9XeTNBTDQyelRSWWN1?=
 =?utf-8?B?T3lpV0RaK2tXd3o5N005QU9kZWt6Z1RwMlNIQ0JVbHppQzVtczVzQUxJUjlY?=
 =?utf-8?B?R3ducHllU2NyalE3YmhuV3RmMDJKL1dlOFoxTVRPSWcyVXQwdm92NG5CQ2RZ?=
 =?utf-8?B?eUtXT1dyWG9lTkc5Mm94Z0hhbS84M2NZQ1ZBb242RlpaVFhSTXB2c1JYVDZB?=
 =?utf-8?B?R1FxQ2ZDbWxaNHB5ZjlOSGsraTd1VDNDd0RhemtCL1R5OXFISUNQSGpvZTRH?=
 =?utf-8?B?T3JYUDBYT2ZzU2ZDM3V2aUoveUhIMDQ0aGpEQmc1K2gwb3p4NEE1RHU1UzNP?=
 =?utf-8?B?RFBPQis4MUlVTWJtTVNmNm9ObnZEdEVSNVdJNHBNNW5UeFR1M0NoVmRoMGpV?=
 =?utf-8?B?cDJGYkFRTU0ySGpaRFd3dUwxaVpBZGVzUmp4RGhCSkowMzREdU93Rk0zeldw?=
 =?utf-8?B?aHFyRCt3VS93eXFQZjBIbzJUU2NXQUlrQ3h3RE9xWWhMa0JwY1hIR3E1RjZk?=
 =?utf-8?B?ZHdBakJNVkl5QXhFU2ZHakY0RWNTemsvZEw1TW1UNXQzSTB5VmxtMWMrM2Z1?=
 =?utf-8?B?VldNS2czRnBMMXZ4aVlubTBGanROUkZyS2U4TC95SUtrdjlpMmxrVzRiNzdw?=
 =?utf-8?B?YmNRKytHdHFOekZHdUg2d3ZaL3RlL2krVlZzSW5uZXVDeklSS3ZHbEVjMzlD?=
 =?utf-8?B?cXdlMEI1cVJnOUZ4MU1zZ3lKSmtxbWZTS3MvT0VzS3UzZWdFS0hDN01uRitD?=
 =?utf-8?B?WXd0VDY2bCtjUGtCRVFtb2NjcnVXNFNPbkpkSWpweTJxdDkxbHQ0aldCbm5F?=
 =?utf-8?B?Y1g5YzVXelU3a2tIME5OY1BOa0xDZkxMdGJFL1pwdmxTTDJYZkFZeHBhRDE2?=
 =?utf-8?B?SWhpdG0zcHV5MmN0ci9uT0toS0dzb1pxSmJCVkZsZHpNT0pORG5tSzU4S1N0?=
 =?utf-8?B?LzVYMnAwK0QrYnAvb2VBclhCVEk2ZUlNQ3Z5cExESGUxV2lYbmN0TGc1bjJM?=
 =?utf-8?B?dDE5d3dwVUlYUHJyNGo1aUJRRXAyRTFCcDFQMSt3aTJHaFpnSnQrOHhmYzUr?=
 =?utf-8?B?K3VyUTJueXhsdWFiVC9yQjlxcklOK2FkSkMwMTlDZjdFWjJRR0FNMEdETDVL?=
 =?utf-8?B?WEhNRUV4T05Pcmk0ay95QXk5aElsdGlBWktsdnFnUkgzelRRWEZkbTViR21i?=
 =?utf-8?B?VE5pSTl2NHY1RVRSOHVuRkd4VXVtQWpORzdFbEY1SXBFTkY2TVN0SFNhUG1k?=
 =?utf-8?B?eVFHZHRTODhjZVF6VVdZcVdaRmQ2RFU1NERBTFg2VS81b1BMQ1VjTVJDaEYy?=
 =?utf-8?B?WXN2eUJMZnFJVGF0RzZaQ08xWUhjbDBHMWxheWFmdnFnNWJxQThzOUQvQ1RT?=
 =?utf-8?B?dHUxMHkzWm1hdWZiRC9yTU1VM2RRVThEai9pRWU0TW5ZRko5UlI3T0lsU2h6?=
 =?utf-8?B?TW4rcUpEYmNaWitmTWxJTjQxRXVaZXlCTHdGb1U2T1JxMFRYZUlLWE5VejI3?=
 =?utf-8?B?ZE4wSWk4TkdRN0dZRFQ5bEF1NmJjSTAxOTZvYVJHREVkWmVCZkFYOXBDc1Jt?=
 =?utf-8?B?ZlRma05SaVk1a2lTYlZEQzBSL0JlbFlLcnRtS3pCOXhMV2hCNWMwcEkvLzRa?=
 =?utf-8?B?Q2VKTFIvR0lFRTZzWDI0RFdQT09DelJvam5wOEZwcmtOS1FCYjhFZ1NBRnVo?=
 =?utf-8?B?RGhBbWVXYW42NUtVd1d2REJpaWZEbUZEb3hKanYrRVN6ek1DRXQ2N0VtY3pT?=
 =?utf-8?B?cGFZc1F1NFZ5enhLZHhnVWFsb3BOQ2s2N0tVZHZHZ2NaWFY5NERCdkYrMHZs?=
 =?utf-8?Q?Fv1GkSWlJKg/0LGRuTsnsYQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <28234C1F9CC1CE42B1B85B7F43837E68@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8878
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a82cd6ee-2194-4cbd-e7dd-08de6a515813
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|14060799003|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d200WEM0d3FKN0ZmcGY1cm43bDBrY1JUdUh2ZkdabXdjT0ZleFVmMXRBcnIy?=
 =?utf-8?B?TWhPZWo2anNkbnFCR2RqUFR1azV3MERteHp6VldrWGs1MFIvVE0zTm9jRXND?=
 =?utf-8?B?OWdlMG9reHZsWEVEdU44STFVR21POVVpR0JYOThqa2FRc3JRMWp4cWFLcDYv?=
 =?utf-8?B?M0ZIS0VIQTZyd1ZTbDlNZisrY3dleWh2VzZRSXVyTWxmQzMrcUp4ZnFMNWFS?=
 =?utf-8?B?UWg5bW5WaE5pSDhyYjVIam9XZ3MyWGN1dGk0cUt0UHdzejYrWEpkcWUzVW5w?=
 =?utf-8?B?S1R0VFM3TTF0NDBaZm5lL012QUFhd2J4cENlaUo4UVJoR2s5QTlBTFdOd0tT?=
 =?utf-8?B?aVZrU3kzaXBud01wNDczRGtXUzFmN0l4bWlJdFdDSGpjS0hoQm90RVNKMnFB?=
 =?utf-8?B?WXJBZDF0US9ma3NTZXNvQTZNZDhkUm94T2UxN3pmTms0emJmNGNGYXY4a0lX?=
 =?utf-8?B?dXc1dG02SzlZKzZFSCs4cS91WjdnL2xsR0hrTGhKcmZkVGNDN04wNS8rcVRw?=
 =?utf-8?B?QW80SEh3a2h4WVZmSHJWOWwyMmxYSEhVdE92L08vZUJOakxmUVdSUk5JcTlU?=
 =?utf-8?B?TVBFQTY4Qk93eWhIY1BseWtDbHlrT3JqKzgvMW8vQzBUYmx4aDlKeGJ0R0JK?=
 =?utf-8?B?OFRkMHo4c2VySDdsaFBTT2dGTTNsTnFnTnNXNzBlVm91allKUnQvbTh2Qm9u?=
 =?utf-8?B?TGlITkxNOUZsR2Q3R2ZpYXY0S0p0dkZnYmk5OFZVTUE5M2F6MXlVOHpDV0F6?=
 =?utf-8?B?Y3pITTRzMGpoblRHa05sZ3M5QnVzTVRXU3V0MTkwdU8vdEZpbFlzVWRjalFK?=
 =?utf-8?B?dktXcVgzN3I2Rlk1YUlSY3h6MGdIbk9CZkhqT1czRWxyWG0vZEoyUUp6WFlX?=
 =?utf-8?B?ZkJ1ZU10V0N6N2FGNHZRNGpEeXVyNUc4dmlHSjdHZjVtUEJrSXNRcWZTWFgx?=
 =?utf-8?B?b3JXK3I0QTl2M3RlcUlyYnZRbUxxSkp6UUJhdnVwY3ZrZTZBNGwwVURvWHE4?=
 =?utf-8?B?RWdpcmtWaTRuQ2hsK0FreHRoeDdLUUtnZVA2NG4xcDUwUXBDTWFlMVBVckZ2?=
 =?utf-8?B?MEFJUTEvZXNCVlZpSUdPc1ZBVUNxTDBkQ3Z4eklVeS9EOXM2cldObndGclpO?=
 =?utf-8?B?OTNCek05VG0xUGdOTDE1aElhdkhNUk1qSmNMV2Z5S1RGTnRmb1VZZzRzNUFZ?=
 =?utf-8?B?N2NSb2p5OGMxcExuK20vZEEvbGMxR2wySS96VFVxdjBpdWdqYXJWTHpFQ2F0?=
 =?utf-8?B?RUZYdHRudEQ1RGpuWVZJMWx2WFZBQkJpRU9wNE12V01ab3hnUHpmTjdRYlhO?=
 =?utf-8?B?UFdZMW4xa3dkVWx6R2dxeHYxdlFpZ0R3RWFnZTZTSGpEVVIyRVptRmZKVVNG?=
 =?utf-8?B?UTZod1NOamxjUTJvOSsweCt1V0lKZTlKckFKVnJUTHI0cW0yYm5hQ283OGlz?=
 =?utf-8?B?UStISytQOFBwZXRuSzNMOU5xUnBBNDRuSEJYZDAyTlVDY1ZlbEhNOXdSRVlW?=
 =?utf-8?B?OWFuOHVMSDNYZWtrS3d3d3NXdmlySVQ5T2dudmxIQjJITTB3OTh2bkxuWDM0?=
 =?utf-8?B?eDEyRHovaVJHVitQdUxtUmhqM2VFbU1teHI2SitUTWZ6L0E5TFhRTjR6Mlh2?=
 =?utf-8?B?dXBWdG1oZFZsYmVJUjE1czhIQXVQdmFhNlU1SzZuYVU0TG1hdjRlWWpZM2ZB?=
 =?utf-8?B?aUUzV0sxRnByOVJiY2dyN3NSWmxyL3RmZDFMREg3KzN1WG5lb01KTUROVVNl?=
 =?utf-8?B?bTc1cFdBRUIvcWNTb1l0UGZGcXAvdlY4SjlwTTV5ODlnWlBackwwZTUxK1l0?=
 =?utf-8?B?VWFKZG1qeDBySmg0V0JpUUVGWWo3aUxvVFk5ZHBVbkRRWnk3N0tvWkRVL2ov?=
 =?utf-8?B?b0NBdUxqNDRxZFIzdkdVM3NOTU54U1JkaXpZbDd4MTArdGozb2k5UDh6ay9D?=
 =?utf-8?B?RGJ5UzlmK0xtWkV6Zk53K2Fyb0toTEJPQTB2WXZob0c2WnVraStPcGtFS3lG?=
 =?utf-8?B?QW5SNU8vUkE4MDRwYXVLU0VxV1owa3BCOHlTd3V6ZEFMUEZUZVNSTDFoUDRn?=
 =?utf-8?B?VlJTNzhBTS8veEx3TWdTREZmM293ZjhCeVhuRm1TL1FTN3Z6ZFJFOXNsVTNj?=
 =?utf-8?B?ejVIem5Yd2xKMUFtcFZtTXJvaXljNUQ2R0VoZEhZWUVVRkdqcU5lelNDVXh2?=
 =?utf-8?B?YlNlWXhpZTQvWFdudTdETENiMjduSTZpdXpUU01RQXh3dHgzT0NMbTZhTE9n?=
 =?utf-8?B?Q3pBYnBkSGpsbDY4OTRUTEFwcVJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(14060799003)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TdNfNFqEiUwjq6BHiP9uzvVSm0EW4zYX6LIR0kkZh4f7v+UjIZqhe1/U8fUoRhf1Zvd2hrnQUakSfiG0rIzzafa7Fmg/GtYePSxv6geVFIkRV8j63WAKuHD02U7FaHLOkUjc1BDzanviJdYHK4Uur+MsOT+2KrZcbpRT0r992TcTihzXqucK987HWp1cTSDFtFEDmzJhgCO/XU17F1kNNye7tGQd6c/FpRknQUOeCXN5ezOLHvb8ZHEKW/4FvlO3rdOx2rLif+W16K1SLnF11D/vInteSZwWa0amVHaWrjpFSxVM7cSdEENatdy43+3VUadqrNerxPhuyMNsWkQ7a3WQ2g+4eWAIJZDvEQ4zgoAKTPI1RKdT+B5PZ3GL2PNpqJE+AVaJUGCcQitafTWTQhkU1FTZkNwl+v0Diqt6ixwHYjh+YEseXWV44XaxmPkC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:12:16.2137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb012ca8-ed5a-40be-9c95-08de6a517d78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5879
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E720B12F3F2
X-Rspamd-Action: no action

SGkgSmVucywNCg0KPiBPbiAxMiBGZWIgMjAyNiwgYXQgMTU6MzcsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gV2VkLCBGZWIgMTEsIDIwMjYgYXQgNjoxNuKAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4g
PGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IEZGLUEgMS4yIGV4dGVu
ZHMgdGhlIGVuZHBvaW50IG1lbW9yeSBhY2Nlc3MgZGVzY3JpcHRvciAoRU1BRCkgZnJvbQ0KPj4g
MTYgdG8gMzIgYnl0ZXMsIGFkZGluZyBpbXBsZW1lbnRhdGlvbi1kZWZpbmVkIChJTVBERUYpIGZp
ZWxkcyBhbmQNCj4+IHJlc2VydmVkIHNwYWNlLiBUaGUgTUVNX1NIQVJFIHBhdGggY3VycmVudGx5
IGFzc3VtZXMgdGhlIDEuMSBFTUFEDQo+PiBzaXplIGFuZCByZWplY3RzIHRoZSAxLjIgbGF5b3V0
Lg0KPj4gDQo+PiBBZGQgRkYtQSAxLjIgRU1BRCBzdXBwb3J0IHRvIE1FTV9TSEFSRToNCj4+IC0g
ZGVmaW5lIGZmYV9tZW1fYWNjZXNzXzFfMiBhbmQgc3RvcmUgSU1QREVGIHBheWxvYWQgaW4gZmZh
X3NobV9tZW0NCj4+IC0gZW1pdCAxLjIgRU1BRHMgdG8gdGhlIFNQTUMgZm9yIEZGLUEgMS4yIGd1
ZXN0cywgZm9yd2FyZGluZyBJTVBERUYNCj4+IC0gcmVmYWN0b3IgaGVhZGVyIHBhcnNpbmcgaW50
byByZWFkX21lbV90cmFuc2FjdGlvbigpIGZvciAxLjAvMS4xKw0KPj4gLSBkZXRlY3QgRU1BRCBm
b3JtYXQgYnkgbWVtX2FjY2Vzc19zaXplIHRvIGFsbG93IDEuMSBvbiAxLjIgZ3Vlc3RzDQo+PiAN
Cj4+IEV4cG9ydCBmZmFfZndfdmVyc2lvbiB0byBidWlsZCBtZW1vcnkgZGVzY3JpcHRvcnMgYWNj
b3JkaW5nIHRvIHRoZQ0KPj4gZmlyd2FyZSB2ZXJzaW9uIHRvIHJlbGF5IHNoYXJlIG1lbW9yeSBy
ZXF1ZXN0cyBhbmQgcmVtb3ZlIHVudXNlZCBvZmZzZXQNCj4gDQo+IGZpcm13YXJlDQoNClJpZ2h0
LA0KDQo+IA0KPj4gbWFjcm9zLg0KPj4gDQo+PiBGdW5jdGlvbmFsIGltcGFjdDogTUVNX1NIQVJF
IHN1cHBvcnRzIEZGLUEgMS4yIEVNQURzLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFu
ZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiAtLS0NCj4+IENoYW5nZXMg
c2luY2UgdjE6DQo+PiAtIGV4cG9ydCBmZmFfZndfdmVyc2lvbiBhbmQgdXNlIGl0IHRvIGNvbnN0
cnVjdCBkZXNjcmlwdG9ycyBhY2NvcmRpbmcgdG8NCj4+ICBmaXJtd2FyZSB2ZXJzaW9uDQo+PiAt
IHJlbW92ZSB1bnVzZWQgb2Zmc2V0IG1hY3Jvcw0KPj4gLS0tDQo+PiB4ZW4vYXJjaC9hcm0vdGVl
L2ZmYS5jICAgICAgICAgfCAgIDIgKy0NCj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUu
aCB8ICAgMSArDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9zaG0uYyAgICAgfCAxMjEgKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+PiAzIGZpbGVzIGNoYW5nZWQsIDg3IGluc2Vy
dGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKQ0KPiANCj4gTG9va3MgZ29vZDoNCj4gUmV2aWV3ZWQt
Ynk6IEplbnMgV2lrbGFuZGVyIDxqZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPg0KDQpUaGFua3Mu
DQoNCk1heWJlIHRoYXQgb25lIGNhbiBiZSBmaXhlZCBvbiBjb21taXQuDQoNCkNoZWVycw0KQmVy
dHJhbmQNCg0K

