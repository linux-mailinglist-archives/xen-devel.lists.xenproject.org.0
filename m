Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LcVEezsiWlpEQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:19:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89378110283
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225429.1531929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpS6X-0004Us-L8; Mon, 09 Feb 2026 14:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225429.1531929; Mon, 09 Feb 2026 14:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpS6X-0004Td-HD; Mon, 09 Feb 2026 14:19:09 +0000
Received: by outflank-mailman (input) for mailman id 1225429;
 Mon, 09 Feb 2026 14:19:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpS6V-0004TX-NY
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:19:07 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49eaf249-05c2-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 15:19:05 +0100 (CET)
Received: from AS8PR07CA0060.eurprd07.prod.outlook.com (2603:10a6:20b:459::33)
 by PR3PR08MB5692.eurprd08.prod.outlook.com (2603:10a6:102:8a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:18:53 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:459:cafe::cd) by AS8PR07CA0060.outlook.office365.com
 (2603:10a6:20b:459::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.5 via Frontend Transport; Mon, 9
 Feb 2026 14:18:51 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 14:18:53 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAWPR08MB9735.eurprd08.prod.outlook.com (2603:10a6:102:2ee::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:17:48 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:17:48 +0000
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
X-Inumbo-ID: 49eaf249-05c2-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VV56wUj/OWm9agyincvbd01UsqmtWdBb62c1GyYLD0/WrwO6pcYx8AxIgT3q36aysxW1N/yPfQ0oOIUhjLYYNaVhQ1GS1WQ7f4EFDiytFgG8vLgInoAisrl6+2F2n0UEx12HUgeL/apXcktZN8lzymgUe8PHzPjeL8M/KYpxXDyhHCVJQGI1iF3W/6s2AJEzE9ZfPbjeBNXqM/tApgmU8LpHjN846lpSeEDnUNF7Z5HA5o5PIB4cOB3wHfnD0YzW/mC2UD6/tMy875VJ3tjNlaBn3AatnMilpG1E0rBhFfc9ihCQQGIwUDCg9z3Wjo30ab50T6PWIPogluURgs2b0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FY6s0oaPakqRkFg4kYZmzJ9ep/wbnuKyO39KzOwjjlg=;
 b=D6dlLuSZHgSWTU38umTyb1DCs0SoB8ClPgm+EYgD8aCZ28R4FQEdJsxizyQ7qwEs497deWnyann/SYFL+Rt8yWaza7eKlWD8D3tM5CSOAw+uM+VP+HdqDkHu9uy79YkqdLjOGiJtP5f0t8+bfv7igzlkWx/H7bW+HOwzYwROV4sK/Lvpyz17dSPcTXK5dVo+K2gPIOH3RQ98kjoHHS9od5nj9u3/U53cT2ZEReWsWNjD4TfE6BoVMFk0ikIWr/jwv9Op5bI7xNTGdT9WVQOO29wWTlLNhRZxzNB82HX9+0dI5sksRPFJRLQbvNu+6DpGeGXMbG56ApOaDQZIvtZa+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FY6s0oaPakqRkFg4kYZmzJ9ep/wbnuKyO39KzOwjjlg=;
 b=HSYzY6e4ir/iQe2B5a6T5qRCxDPjLEXMb3J3z/fYFH68rmSpe30bp8NJfr8PRTxs5XPRv5jBxE2CiH9BE6YadH/TTPzUPecJ2kTcq9fZnipsma/Wf4TuCMQvJ/28tp83ito0LeFuWNQEFMwaGy6kq6liVjiCC/rJh3C2P+H+2HY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFCvLtnKyWBRF0+PZTmqLhhM2WoXEXynMMyqhCw7YG/9Q3Z1mqiLZxElTj/il3ptPvyFDXGtOs5RWJpWvdAXvvHzz1/g9nbnvbQgxXhM/xLxk8OnlZv53Akgw/O4AzZxkE0peDdYxG8nYGpwrGMnVz9n9uAwVbWohtnkJqFGqii1de1duJB8oG0djO80uJfglRn7h5c6MuAJ4p2R87OUddkgfPQ/OUiLEftwurbdXDCAPMNAJ+VUmWxSliE4vT1wmuDFtZnhahTSV15YK3Y6RXqWbh1GqA5eK8Jh/F+hS2gxp/lOexYLD4dXa84q9x0CppOuS1qx/LwdAlHRUI5riw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FY6s0oaPakqRkFg4kYZmzJ9ep/wbnuKyO39KzOwjjlg=;
 b=NYqiYGgisrhGggMAb2yff9O6y/3lMSWlJUOh/lJqiwyVNvisYJPXPyRmtECzl412n7IWInvv1S5rD7LBrFUKqI2D0o2E6ktGATYCvYEEXZRtfLzNQsYT+8waEX6BfgEFVgaWo5NJVAEkbJ5SjJd/mYCyxq+Oiq8HQJlvnaemWdkEMxOHckHzx1Of9B27DafqUzotVJlmTZ1Yp390n+1xjtG5kuTjeWxhE3O7dBdCrZT2KNS6ePDCB90qulmXuI047qCIsn7OnMXtxpmh4i3jzSYlE6Hw42R4K4vyg4zVtgeUewZrGZoFIEDHW6uPtpdT7blcj7P0dtLUe/0EAxQ5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FY6s0oaPakqRkFg4kYZmzJ9ep/wbnuKyO39KzOwjjlg=;
 b=HSYzY6e4ir/iQe2B5a6T5qRCxDPjLEXMb3J3z/fYFH68rmSpe30bp8NJfr8PRTxs5XPRv5jBxE2CiH9BE6YadH/TTPzUPecJ2kTcq9fZnipsma/Wf4TuCMQvJ/28tp83ito0LeFuWNQEFMwaGy6kq6liVjiCC/rJh3C2P+H+2HY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5] xen: Add Darwin.mk
Thread-Topic: [PATCH v5] xen: Add Darwin.mk
Thread-Index:
 AQHcmbF131JHt0VrQEG2yzDmCYz1i7V6XACAgAAB1gCAAAHIAIAAALSAgAAIw4CAAAE2gA==
Date: Mon, 9 Feb 2026 14:17:48 +0000
Message-ID: <965DA116-8B66-45CC-BEFC-AE5840849EA4@arm.com>
References:
 <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
 <aYngg_ym18d0G-fX@Mac.lan> <28A169D0-4454-4D60-B811-72FE377A4318@arm.com>
 <aYnjjHlbaYjr2VqV@Mac.lan> <6B8E025C-3235-4289-948A-B26992D0C4C2@arm.com>
 <daa99e9b-068f-4e77-872d-69e93067447f@suse.com>
In-Reply-To: <daa99e9b-068f-4e77-872d-69e93067447f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAWPR08MB9735:EE_|AM2PEPF0001C710:EE_|PR3PR08MB5692:EE_
X-MS-Office365-Filtering-Correlation-Id: 4182c521-d292-4626-2377-08de67e6274f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZUZUUDBVMTQyUkoxNitPMVpHNHhwS3Z2ZitpdXB3ejg4cUlxdU03NnprMWhh?=
 =?utf-8?B?M3NHOEorMHhhVWhOeW1tejJ6V1k0VXlsNm9WdUVyVWNrVnVQeGF2VVEraEJW?=
 =?utf-8?B?dEI1c3VjZ2xxU09vWkNiNmR6U0l5N0RYbFB4RHNMZFNjM1A2NVBocnk3UElC?=
 =?utf-8?B?UVlYakczckx5Q1NnVWdxMVNZZFVuR3BEZDFISmxxTDV3YTA4RjZPU1dxcytH?=
 =?utf-8?B?QW5ZZ3hiaEhOYXhjVHY1Rnl5aHYvZFFHRis4SlNFcmgrVlZONGZsdFYxYUhz?=
 =?utf-8?B?eEQ3cTFxWkROc1hHWVlhNitsZzd1WUFPSzZnYjZwLzRReVVHbmYzNVUySHg2?=
 =?utf-8?B?d1NnVEFFVlJLY2Z0azhDM2FVaFF4ZzdhUkxiN3BrcG81dm9DQmRBWjVQdGlN?=
 =?utf-8?B?cm9QU2JpZno3SzlKRzlXaWVSZVFOR21vbTBJb29HenpZYm5jcVZqK2xXcGR3?=
 =?utf-8?B?bzRmejBQUEJaQ1ZsQU5DSjljZDVWUlhHSGdRTWxaamNBRW51K3RlNEx5UzJ6?=
 =?utf-8?B?OVk0OUFIVmY0VTNJU3NxSW5ISDlWZXA4SGZHTkFGRVdJck94RkI0eS82UWVV?=
 =?utf-8?B?WGhtUTRFeVJXQ2hWMmlxU0RwUmUxU2IwTG8reUVXV09JalJiZ21XR0hXMDEy?=
 =?utf-8?B?dnN0NTJ6SlJkdUZTOXNBdUZTOFk4R2ZsRFBTUXJNbVEyNVNOY2Z6UEpIZlk3?=
 =?utf-8?B?T1pKYWZQallkSVZ5Y1VFMk5XMGIvUDV2Y0pBbllvRlBpQnllWWREWXFkZUR3?=
 =?utf-8?B?eisrM3l1eVErbndXVGZNSmk0RlVhem1zb3dUTWVhU3EwOGs5bHd3UW8vMTV4?=
 =?utf-8?B?aDF5WmJVV210MEJDaFRTMGRnZGhWWldpSkxIYVdDU3pNc0F3Q0RmK1VJTVRz?=
 =?utf-8?B?bXM0Wk82MjBkY1pnS2xqNnpBYTBEcVIyc3Noa1hGM2VUdE55U1o4T0pXZGVW?=
 =?utf-8?B?TWV4dDdzRjJTQUhaQ3ZtaGh6M0YrVllvOHh2QWNySUl2SjhDc2s5QkNSSmJF?=
 =?utf-8?B?Mm96bDJDbmdLU1Iwck1RSjUyMDBoNTlIRTNpbTJMb29Fbkg3SnFNcGQ5UXp2?=
 =?utf-8?B?UUEycldqcmNEM0FWY21PTlBRS21FSjg1bXZpWVR0ZWdFQVNac0x4Tms3VFdm?=
 =?utf-8?B?a1YzQUZMclBkUCtpb2pyRGtmdE5VK3lBajY0SWh2UXpMV0VNdEFlbnZtRVFX?=
 =?utf-8?B?UEFPdkxMSzJLeGtBZm01N0ZFWlduUm9DMytxbWZtUTUxQ2MxUFlSSFREbU84?=
 =?utf-8?B?S2c2MlhHUjErVXBKbVdtYS9EWTZvdC9lMi9uZG1obTdacmFkcUdjN2ZQRUFW?=
 =?utf-8?B?UUhwNHNpOUZpRmV0cDE0M1BvZG1EUjk3QXR3NUVaWjlGM1ByK1JMRE1kTVBE?=
 =?utf-8?B?azJKTUExRUZXYjh1REVrRXNnc3ZubDR6amRjZXN4cm9uby95RVMxWkxaNno1?=
 =?utf-8?B?K3hHYzJQS1dnMTEvOXVwOGU5aXNMUzQ0TkNUaEpqK3BvTHI2eU5RYVo0TDBI?=
 =?utf-8?B?MUlLNGRxYllLVXpZOEdQeVJCWFlrZk5EdGdnTC9qOVp3bzIvOVJvRndzbkhR?=
 =?utf-8?B?c0M5ZHFZUTBIY09NK3VFdU9NS0NJYVEwemNSZmovelVOME1XTWhURVhhY2FG?=
 =?utf-8?B?MFZ0alZUZjRJSWJUbzAyTFVQTHpBN0x2OE9Vb3ViTnh6WjNPR0J5cldFUjg3?=
 =?utf-8?B?UXdPYmxBSUlrenAxOXByNTExRkwrUWxkd0FJQ0JBZUZzdnFWNkF4dUYxV2x4?=
 =?utf-8?B?MnVlK1lVVkhGYmcvNGJZWXRTdjlTc3piN0Q2STVFRXNucWdobTNEZklqd2pV?=
 =?utf-8?B?alRtUTd2ZVIxanplOGw2TFlnZkErdnJ6QklRQkU1U0hBYjhGem5VcW5wUU54?=
 =?utf-8?B?eFRJYnMyMW1XclVlZkJsK09JVXhKY3NxdTF4NHpjem5pVkZqWUp5ZHJPQmll?=
 =?utf-8?B?WUhOQnowL3hOUDBJMHgva3c2MllOMlpVaGpMN3BzUWRLdWVxY0JoYnZNNDl4?=
 =?utf-8?B?VjcwTExFL2ZnQ3JwdExrMURPWVNTYlpGcHppSXViOGxBRmY5amN3R2kwY2xs?=
 =?utf-8?B?NlJsb2dkYWlpYXpMRkYxWVNhT0UwbUFZbWVhTUN0WUdnWFQ2aDluT0NkWVd2?=
 =?utf-8?B?QmRTODhvU3pVbUNIS1lhSHlZaVYwT2NFM3pqQzRTOXVlL3ZPeXMyUnVVOWRa?=
 =?utf-8?Q?v9t8uf2bPMRKX7SiCeJO8M4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <71A1B86294EAFB43B913EDB6CF602020@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9735
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3940bfb-fd79-41a4-1d37-08de67e6008e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|1800799024|35042699022|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWdSRnhsSUVhWXROUW9US1AxVkV4RWJBYVMweFpkQjRoTTIrSVhmUnZsQzQ1?=
 =?utf-8?B?SkRpQ0I0QWJKRWlZODUyK0ZtU1d3RFBqUlNhUmNjbGRQSXRhencvVFRGM1E0?=
 =?utf-8?B?bDJpS2d4SlJWU0tsdC9hdVZCSDVYeDhuQm1VNS9FQmdOK0czN0V1MWZBU0tn?=
 =?utf-8?B?VEpDcDB1bFNjVzk4SXBzN2ExSjdlYWgwbk9CdDlRLy9BWmd6OWswd050N3Zn?=
 =?utf-8?B?YjBoQUxHWFQ5b3BGZHJpR0ZjK3pmTVgrWkpKN2c1QlFpSFYwcXVkaDZDOHJo?=
 =?utf-8?B?VzhhTndueWNDYkVEdlQvWEl3NXE2aUZZQmhVaVNmbzJ5NHBJeHFzMEN3YjRv?=
 =?utf-8?B?YXlRREszK0c5eDBmcVB5WE5VQ0lPdE83VzZXQVVGWkIyM2tQRkZRd3VNT29p?=
 =?utf-8?B?NXJFOG00RVhibDlxYloyTE85TEYzTXJIVlZJSTNMUzMzZHcyaTFRUHVCRmFQ?=
 =?utf-8?B?d20rUnFTMGJ5anV3L1NoMEc1eEJPcXI3MWFGM1pUNEk2ZGtBOEFtNmJEQjV4?=
 =?utf-8?B?MTRjUTZleXhjWGd2OXlsTzBxOS90WmQ1MW0zaitvdmVuOFp4dkQ1T0l3d1hW?=
 =?utf-8?B?QWQ5QU5sTjdaTFYvTHFEZHF6WVZxYW45eHBGd2QwZVZabFZOb1FOeVZMSURp?=
 =?utf-8?B?Zk1hWExIVXViNkFIM0wxSXdQYTBPTk96V2t4Q3VMRFBidFkwZkdnamFvZWhw?=
 =?utf-8?B?TkxMOCtvL2pxTlJXdlBUK3lFQitCRUNjWm52SU5XTy9MSjFNRnJGZ3AvVGhX?=
 =?utf-8?B?R05PN3hnd3VibUhBeVVDT21YdWgyWk1BcVJMeGdiVDN1VGJLdFZwQzcvQ0Uw?=
 =?utf-8?B?Zmc4WlkzQXI2Z1J4b3ZXbER4MENNM0MrN3RoTlFVbmV5RVNjaHlKVFNydUk0?=
 =?utf-8?B?WEljWXM5RWtBcjRLbkNIQWp0Q2dXK1RyMVJEb09sSkE0ME0wUlFaQ29IV2hB?=
 =?utf-8?B?TDVGb3lVdTk4eVRxSUpVREc0aVRxRU1ER1gyOVNtdjJtaGFsYThKQlJEb09a?=
 =?utf-8?B?NDAzeXArcTFWKzJacE9VQWl6Mm8zVzh1NkVCMXFBblN3b2tDcldmWGQ5bHNG?=
 =?utf-8?B?R1dHS0ZQTmVlWU9udjA4UGlJRWlWRTRFV01CRmtvMm1TZEVDUmZ0a3huM0I3?=
 =?utf-8?B?dmsrR25oMkJpRGpBSlNFOTk1RWxmcVpxVUxrZ0hnajJMRWtLU3NSRFY2WlJh?=
 =?utf-8?B?L3cvQ2JSZ0JMc1JrTk1RNmNST0tXeDNqN2JSRDBpWGFlcVduVnNKQnJjNiti?=
 =?utf-8?B?eEFJYlN6OFRXMmdYd3NUTDVxL3NXeXY5WFhRUTArSHN0cm5tdWZDRUY1OEhB?=
 =?utf-8?B?dC9neGV0eitSV2RtYm01djZ1RnBpQmlQZjNIOEgra1RiNEJRNHVXOWs4UnlX?=
 =?utf-8?B?ZldwbUhlVjZTK2lHRmw0cWllRTdERURwN1VpOElWa0ozbGZ3MkpzaWR0OFo5?=
 =?utf-8?B?bHdmeDF2clZMVG5nVnhQVVN1cGRsWkVIbjhaRVYxZHd2eUdDeGxNdGhRWllu?=
 =?utf-8?B?c2FkNjlvbW5DQnFoWFhpOW9yTlRaTkxVVUVyTlRKbXRXVE5lTzJOUUsrY1B1?=
 =?utf-8?B?MWhOV1A0UUM1d3doRVo1MTBIVVhaSGdEeGV3bDV2dUpwZUlQZHJKeGtic3Zq?=
 =?utf-8?B?ZG84QXdCY3FsWC90MldUbnNlcytVcjFoWVdWUVVjU1N5ZHRNNDY0aTBoLzN0?=
 =?utf-8?B?UlFlWlJnQjNWK1FkdFkrbVQ3UFpTeVorRWJpRHlIM3FMWkRmM3dsSnRlMUdS?=
 =?utf-8?B?NFBlTmlwRm44UUptSHYwVWdrek9xdWl1YTBWTzdEdjdjQXczUnR4b2FxeE5O?=
 =?utf-8?B?azJxT2RXZXJLRkFmcmxadlBad2x5WHFKNEtVT2lBQUd3MUlqTDM0MFV4blNy?=
 =?utf-8?B?MHJjTzBFS080eWZwSUllNmxUSmxCUHZNUDgrQ01IRzljYTJUK0dKMXNtMTV5?=
 =?utf-8?B?bkhpazdvYzZaRm92cWZIeHhtK0xPZ2pKUTFFSEpxVGhzY1JOMnNFa25YZklP?=
 =?utf-8?B?ZS9DTi8yeWp3eTNhaHN2Z2h3UE42L0JITWEyYTQ4cXNDWlZ0L0VCL2lSSHlK?=
 =?utf-8?B?dnJXSUNyYnVTNVpHNkNnelBrQmhLWXpXbFBKVitja1lGUE9GNW5RbHV3MDc2?=
 =?utf-8?B?OHdSVkpHT3lYbkp5NE4xWS8zMlgvMVpsSFJzbzZvWkUyamFNRW9OVHh0dWdz?=
 =?utf-8?B?Qjl0ODV5SXROTzAxK0FzVjFRbjFpT2t0N2dyVFQxSkpnbytjbHlXbHJDN0hX?=
 =?utf-8?B?MXpoeWthUFJyRmZockdtVVd6T09RPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(35042699022)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7eYzwdUbvIZxqAsWUK40fGj2UhYVulhQqiMZux8/job72tGbXksziPTMSqlRzVMeMlMOFu8qdqJqiclLel5XhURjVe81lxH8t8/txewWUNHzt84fztoO0PlZi2UsjYuc9hybfNOv6VP/y9Y9IHIfPxt6ENAOA+0qQuduvrR9pbG0p6R08KzUSXY43QLvvj2n9+c6kTGgniUT60nHQZlxKLtU4MVpFxI6eOKIpvKKCb4o8iNz7UZLzc6xlVuzQCxmhNmhfMUYjOs2BdaqEnZMzFnuA5rki0q7cXH/WviFV6CyhdUSwUr2KbHKaJvVtvLe4wpv6k2+nvNeWX/9IKZK2RoIfjjndEG/J8yHW91elxdqREXgk85/+GxHrsauk+SvEZIhu0Eh3zfRz78kxBw+/4zpQgs0H1yzI3Rwch0dkz4ceLrE7fg1pnKDGMMfMnSE
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:18:53.2010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4182c521-d292-4626-2377-08de67e6274f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5692
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim,stdgnu.mk:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 89378110283
X-Rspamd-Action: no action

SGkgSmFuLA0KDQo+IE9uIDkgRmViIDIwMjYsIGF0IDE1OjEzLCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDkuMDIuMjAyNiAxNDo0MiwgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+PiBPbiA5IEZlYiAyMDI2LCBhdCAxNDozOSwgUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+IE9uIE1vbiwgRmViIDA5LCAy
MDI2IGF0IDAxOjMzOjEzUE0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+PiBP
biA5IEZlYiAyMDI2LCBhdCAxNDoyNiwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+IHdyb3RlOg0KPj4+Pj4gT24gTW9uLCBGZWIgMDksIDIwMjYgYXQgMTE6NDY6NDRBTSAr
MDEwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+PiBYZW4gZG9lcyBub3QgcHJvdmlk
ZSBhIERhcndpbiBidWlsZCBjb25maWd1cmF0aW9uIHVzZWFibGUgb24gTWFjIE9TLg0KPj4+Pj4+
IEl0IGlzIHBvc3NpYmxlIHRvIGJ1aWxkIFhlbiBIeXBlcnZpc29yICh0b29scyBhcmUgbm90IHN1
cHBvcnRlZCkgd2l0aCBhDQo+Pj4+Pj4gdG9vbGNoYWluIGFibGUgdG8gcHJvZHVjZSBFTEYgYmlu
YXJpZXMgKEdDQyBvciBvdGhlcnMpLg0KPj4+Pj4+IA0KPj4+Pj4+IEFkZCBjb25maWcvRGFyd2lu
Lm1rIHRvIGluY2x1ZGUgU3RkR05VLm1rIGFuZCBmb3JjZQ0KPj4+Pj4+IFhFTl9DT01QSUxFX0FS
Q0g9dW5rbm93biwgZW5zdXJpbmcgRGFyd2luIGJ1aWxkcyBhbHdheXMgZm9sbG93DQo+Pj4+Pj4g
dGhlIGNyb3NzLWNvbXBpbGUgcGF0aCBzbyBjb21waWxpbmcgb24gTWFjIE9TIGlzIGFsd2F5cyBo
YW5kbGVkIGFzIGENCj4+Pj4+PiBjcm9zcyBjb21waWxhdGlvbiBjYXNlLg0KPj4+Pj4+IA0KPj4+
Pj4+IE9ubHkgY29tcGlsaW5nIHRoZSBoeXBlcnZpc29yIGhhcyBiZWVuIHRlc3RlZCAhDQo+Pj4+
Pj4gDQo+Pj4+Pj4gQW4gZXhhbXBsZSBvZiBob3cgdG8gYnVpbGQgdGhlIGh5cGVydmlzb3IgZm9y
IGFybTY0IG9uIE1hYyBPUw0KPj4+Pj4+ICh0b29scyBjYW5ub3QgYmUgYnVpbGQgZm9yIG5vdykg
dXNpbmcgYSBjb21waWxlciBmcm9tIGJyZXc6DQo+Pj4+Pj4gLSBicmV3IGluc3RhbGwgYWFyY2g2
NC1lbGYtZ2NjIGFhcmNoNjQtZWxmLWJpbnV0aWxzDQo+Pj4+Pj4gLSBtYWtlIFhFTl9UQVJHRVRf
QVJDSD1hcm02NCBDUk9TU19DT01QSUxFPWFhcmNoNjQtZWxmLSBIT1NUQ0M9Y2xhbmcNCj4+Pj4+
IA0KPj4+Pj4gVGhpcyBuZWVkcyAneGVuJyB0YXJnZXQgcGFzc2VkLg0KPj4+PiANCj4+Pj4gV2l0
aG91dCBhbnkgdGFyZ2V0LCB4ZW4gaXMgYnVpbHQgYnkgZGVmYXVsdCBzbyBpIGtlcHQgdGhlIHNp
bXBsZXN0IHBvc3NpYmxlIGNvbW1hbmQNCj4+Pj4gQnV0IEkgYW0gb2sgd2l0aCBhZGRpbmcgeGVu
DQo+Pj4gDQo+Pj4gV2l0aCB0aGUgYGNkIHhlbmAgb21pdHRlZCwgd29uJ3QgdGhhdCBhbHNvIGF0
dGVtcHQgdG8gYnVpbGQgdGhlIHRvb2xzDQo+Pj4gdGhlbj8NCj4+IA0KPj4gVGhpcyBpcyBzdXBw
b3NlZCB0byBiZSBjYWxsZWQgaW4gdGhlIHhlbiBzdWItZGlyZWN0b3J5IG5vdCBpbiB0aGUgbWFp
biBkaXJlY3RvcnkuDQo+PiANCj4+IE5vdyBpIGdldCB3aHkgeW91IHdhbnRlZCB0aGUgeGVuIChh
bmQgaGVuY2Ugd2h5IHRoZXJlIHdhcyB0aGUgY2QgeGVuIGJlZm9yZSkNCj4+IA0KPj4gTWF5YmUg
aGF2aW5nIC1DIHhlbiB3b3VsZCBiZSBhIGJldHRlciBpZGVhLCBidWlsZGluZyBmcm9tIG1haW4g
TWFrZWZpbGUgY291bGQNCj4+IGJyaW5nIG90aGVyIHNpZGUgZWZmZWN0cyBpIGd1ZXNzLg0KPiAN
Cj4gSGFwcHkgdG8gYWRkICItQyB4ZW4iIHdoaWxlIGNvbW1pdHRpbmcsIGlmIHRoYXQncyB3aGF0
IHdlIG5vdyBoYXZlIHNldHRsZWQNCj4gdXBvbj8NCg0KWWVzIEkgdGhpbmsgdGhpcyB3aWxsIG1h
a2UgaXQgY2xlYXJlciBhbmQgb2J2aW91cyB0aGF0IHdlIG9ubHkgb3BlcmF0ZSBpbiB0aGUgaHlw
ZXJ2aXNvcg0Kc3ViLWRpcmVjdG9yeS4NCg0KVGhhbmtzDQpCZXJ0cmFuZA0KDQo+IA0KPiBKYW4N
Cg0K

