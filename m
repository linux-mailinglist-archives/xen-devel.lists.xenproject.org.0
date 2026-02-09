Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DKIOLYIimluFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:17:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BC11126FA
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225710.1532268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTx5-0005fg-1e; Mon, 09 Feb 2026 16:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225710.1532268; Mon, 09 Feb 2026 16:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTx4-0005dF-VD; Mon, 09 Feb 2026 16:17:30 +0000
Received: by outflank-mailman (input) for mailman id 1225710;
 Mon, 09 Feb 2026 16:17:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpTx3-0005c4-IL
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:17:29 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d360c615-05d2-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:17:28 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA2PR03MB5769.namprd03.prod.outlook.com (2603:10b6:806:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 16:17:24 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 16:17:24 +0000
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
X-Inumbo-ID: d360c615-05d2-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFeK6NVp3fBk8psVoNhMu1K3zu3usMxjtgBGomXP3Whx/KPCYPrCVbUN1HS+4GtaCu9MH7SGqKjJ2tKR4dbj5GZ/rIB5NqJmi1qinNy6kDQl7inKuRBZg1MrW0SRZlLfjagtHzFHRbG+0V27Y4+joEJZ4pdGNy9qEPfL0OuefCCpX4vOK/zyhCzESkqVqRU8wrIppcXfitBM89kWjHvUMSZGy0+gNyv5gfxjJCLlJIzUBIO0wF03qSwBdmFYoW01fE97YvFq04DxV3ojJ1/RBWqu7gelibxjfc3v+bBlvzS5egpNEeZdDgeh6xIa++9dqDaPf6Hl9HyTji8+tX63qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOnfLe12kPtNLKugF0/TiGp+ruf3BZ0ElOg4zQzu4kg=;
 b=QDDeDCNAy2FjqOi2DjXrOkvKPjbnfVJLLVbWgxTgOou1mrQYCxYebOa/z48jnt7diQ+zqeheou2xwDnkwaEKaxLPdNzwqwFum0VI+aiJKoRAO4VRsYrtJs/oDkDKvWsjkiXt+tJlgi6LjAts2acJvILWpYp8B+Ac2auN9AkkV2SqlpqY+6+CjZtdxzISQLLBIu1RQOzJAElz7icSD4dkpr+v7RA5gj4g51Yztp6yV2kbezZMo5PXeHgxUVyT6HuHLLLsFJwbkqwUG/qbQSYzuTJXxGYktW3Rfi2oFfMs+9VsqT6LdS1qYtDmiZHtLu+OMY22l/uad+5oFxKj5S8R4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOnfLe12kPtNLKugF0/TiGp+ruf3BZ0ElOg4zQzu4kg=;
 b=KIUHz0HHHqERc/ycOm2BQpWJ5jQnH261NoYyO/jvvQrFHcxqdPFZ7ZzTv7EJJGHZx/255nE7dtRriAMfqm5NjIIraw++15PkpWx1SyT3CqBqNlVVhrM8JsfbUPhidt5LyoFtGpZtewVqI6mSaOwVyARPI0+cazAryLnQ0ALcpqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 Feb 2026 17:17:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: Re: [PATCH] x86/shadow: Delete the none.c dummy file
Message-ID: <aYoIkTbcyU5ktEth@Mac.lan>
References: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
 <aYnyY2MArv4vTXsY@Mac.lan>
 <DGAJI3UYR98J.FU94VABOFZ5N@amd.com>
 <aYoDiDiJ4rRLxhmw@Mac.lan>
 <f3474905-427a-4d0c-b087-38082bf7e2e6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3474905-427a-4d0c-b087-38082bf7e2e6@suse.com>
X-ClientProxiedBy: MR1P264CA0134.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA2PR03MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 64806e5c-c1bb-4f8d-90e2-08de67f6b5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFR4VExOeVZyQTRNYitPVTk0amQ5aHU3TjFQbUI2QlZEOS9rcjFFTTZsZzZO?=
 =?utf-8?B?Ny96dE0xV0tNZjhHUkRaQ0V6di91L29paXZyYXQ3SkJOdGpPYmdWdFFmVTRU?=
 =?utf-8?B?UTBvQTkyaFhhdkNrQUxnL3daWnREbXNJVEE4TmFEZmxBOFgrYkwzZWJnUGpV?=
 =?utf-8?B?bElydUJMcmEzNjFEOTFnbmtvS2RzWlh2RXRJUE5icFNVSjJTV1didVNXZkpR?=
 =?utf-8?B?M0RJQ2Ztb1kzREFBVGgvL2luNVc5alkyRnNiNWhCRldPdEtvbnZBbmE1a1Z3?=
 =?utf-8?B?aHJrWXhTRWZEY1FHeGFGWUhvVWc5SkNWUzVmbk5RN0xpVmFrQWJ5dXoyR2Js?=
 =?utf-8?B?WUZwSnBNajVCbmM4MWY3OXcwcG82bzlLL09IZko1dlNGU1JpbGE2ZFBHRnE2?=
 =?utf-8?B?RTNrUkhxYjRQanFNRmVNMWhINVNaZjNBb0x1Z2ppUDc5ZmwrUVovaXMwemJ2?=
 =?utf-8?B?OWtmQmdVMzV3OHVFK1hDVFhRS2hQUlJrSmE0UnpJUEF5Nmw5M0Zldmw0K0RN?=
 =?utf-8?B?dC9MZEZGK2V6c1pWa2xwR3QxTDRjZHUrZnNLeXJObkpTc2tXYVZMdDI4UnVZ?=
 =?utf-8?B?SFo1K0RXbEVvVk42My9WOHVOQi94emdCZmZvS05hdXE1STk0ZXU1cnA3S29S?=
 =?utf-8?B?MFlWMU1Ib0s3WGRTY0d6dGFZV1VUaE12Z2Z2L2c3dzRrL0pPTHJWZXVVcnp0?=
 =?utf-8?B?NFQrMXFSN0NJTEJ0MzlCYXcveVE0ODVLYTlnU05VVmRGcUN2Y3FHazRiditr?=
 =?utf-8?B?OFVzc2dPM2tmLzFSL2lZbXRaRzVFaDFKN3Y0TXZDTEVYU0RzZDg5WVY1TUdH?=
 =?utf-8?B?WVBpSmpMQTJmaHFRYmQxcDNHelc3Y2lSMnpYb0NRbGdKVmErSkYrUC9Gemkx?=
 =?utf-8?B?UUdEbzdTRElGd1QrbWFHMWd6OGt1VUh2emsxZTZhRU9DSjNVbFg0WGZOa3k5?=
 =?utf-8?B?N1Y1VmUxUFgxaVhDWUYzWXJBM3N1YWdNS214OXVmdWtQdjMrUlF6ZVZyWTJK?=
 =?utf-8?B?Q0owZ2x3UDBPVklMQjlEQ0hpM2hKMEZDZXZLVXVHdG1wUVczOS9PbWU1WmJL?=
 =?utf-8?B?QU13T1NaOG9tcjZBN0NOOGQvMjQwV1Q5WmV4b01KZjVoSzMzWG1PV3JZWExY?=
 =?utf-8?B?bTE2blJrK3dTMldIWGMxUGhGYnBWSTlpUmtNcDdzUFMwT0ZWZXhPa1BiOUhC?=
 =?utf-8?B?aDd3UmZzUDlQN3dDeldjeWdHWURjaXVyZ0tlQU1HbjFhVjFpMDBVV3VENW1M?=
 =?utf-8?B?L2xwRTYyY1RwVlVTVWpDQWprZjhTZjV0VmZ2WXlUS0NFTEtuZ2xUcWJ0b2J3?=
 =?utf-8?B?bUNxa2Q0MkpFZ29IZjA4aDF3MzA3UThkcGM3N1laQ2VDRWNjSXZZTlR0TWps?=
 =?utf-8?B?S1hLU09lWkJlQlREaExSZHNONnU2NjlSZlFMUWxHQVdyOEMzdWk3REQ0KzAz?=
 =?utf-8?B?a2todHVqT1RQS2hXd2wzQWpPU2pNc2VNNlMxbnZwMFNTNmtYNlNKc0puZHE4?=
 =?utf-8?B?VXZyRDROem5ORi92dnNxeTdFUTZPNmlmYis5MmI0TW1XUG43dmJESS85Nmhw?=
 =?utf-8?B?VFVvRlZvbkw4aUFyaS9OSmJFYm5Eb2ovWGFTWFBaZGJzMkN4cU5Td3RJNEE3?=
 =?utf-8?B?c3htRmRLMkF6SkZXTkZ4TzBpcExZVW8xZnpuOUNQdndKUDNhZFozTzZmQUVY?=
 =?utf-8?B?Qnk3VFpHNFY0cEdtam1lc0RQQTh1eEpZdUJsTUl5WHFSazg4YnJINEdHYXBi?=
 =?utf-8?B?dGpzSGdvRkZGZEVLUUxQRDQvalVFaHFCZ0EwclhaTEdRK2E4V2l2dThLeUxy?=
 =?utf-8?B?MlljUWkzZm9yR3FNTlZoKzIzZXJBaCtPT0NsRHhSOHZ2R0RvRk91T1BDNlVI?=
 =?utf-8?B?ODF3b1U4R3JpbTRFNy9lTHhrRXllMGpJNUxYQitxQXpWbERCZEljS0p0YmN2?=
 =?utf-8?B?RWNlaXoxeHpOa0lZN3lOWlIxRUU1VEoxMUtMYXNuZjZaZE15aDlNdG5KcnNw?=
 =?utf-8?B?V0laRWw5aS96MVlWUHdLY1pXaGYzVWxsY1BZdVllNWFONnRHZy91WG9kaE11?=
 =?utf-8?B?b1hIeTJwS2lOalg4S0p0ZHBKaHI2TCtyNjFqUkQ4N2dOSmlCYXRHR2tkTGs4?=
 =?utf-8?Q?LQJo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cCtBVEczaUpQQzV0WTlnRWZsbXNGVTNjcGtRcGtWRng1VHd1aUMxZG9HUUxj?=
 =?utf-8?B?ZG93VkVpS0NXQ3RpUzlPVHBNa1FyaGxGVmdiMHFvMlAzeDVpMlBXRDhJdUJE?=
 =?utf-8?B?STRNV0VaM05IUGVWNW4yWjRzT0VKOE9TWUNUUWJ3WE1tdXdabVN1ekJJa1lV?=
 =?utf-8?B?OG85U0I1U05VTnMvaFpJVmFMcDc5cWZBNE9BUU42ampOaW8ybG81dStCOWZN?=
 =?utf-8?B?V1MvbWJwbmJ2K3NsQ05rNDFHQXN5ZnZ4cWZNbkt3T0hFVDJOeXFXNzVqNG1h?=
 =?utf-8?B?STlOaklhSm82cWVnVVRwbXNwR0tVSDcvSU1Lb2JkcGtTaXU1a0tKYml2UXU0?=
 =?utf-8?B?d2JwZ0RoOWwwS0x4dVhMNlJ1ZXB4NkJRVU9xUXg1c3BsVzRVb1ZjNEkveDA5?=
 =?utf-8?B?QXJPclZUZHVuN2JiYUVaSm1VV0ZFS29kQVVhMm1XcldydTRkRFFuTmROTzF5?=
 =?utf-8?B?SGF0T0Z4eUw1cllLV0RVUm16QUxJODNUK09GM0IxZVlJVUxXN2EzMHRRRHN5?=
 =?utf-8?B?cVhMQzVreWRDaDNIS0JJQlRUaFBXOVFTSGpSNjMxRlNTSXVIeDE5N2dmYk9P?=
 =?utf-8?B?cGJSNHNyUlZML2ZWRU9vcmxyWHgyOEU1YkV0N0lwZHBXcXdRN1FPUXRyY2tx?=
 =?utf-8?B?aW1adFFlK0gvVis2eDhNdVVkNTRzNUtsNFNMQ3IrSXFWZmUyVGI3WlpBTTBQ?=
 =?utf-8?B?YlR2eldtbWNqaXVOQkJ6emc4NEtnaTErQm8rWlNTRnZ2dG1tNi90VTVHZm43?=
 =?utf-8?B?MlBXYTg4R0NMakw1d21ydSt0a1lRUXZUejJlNFpwZVFpSUw3M1pHSHFhMVpQ?=
 =?utf-8?B?bWlxWGlGa3VoREFpdUM3dFRKTmwrME5hVkpGT2VjaThVOXU2dkdEQ1hHNFRu?=
 =?utf-8?B?bE9SZUJHSVpyYUM1dFA5YmdZMTY1NVFoMXh4OUNCbktqek9oSEZwRXpFdHRQ?=
 =?utf-8?B?M3pVZGpydVJ1L3M3cUZIaXorNFhFb3c1SmJXSUJWaXVqazdhWWxPRHpUalhp?=
 =?utf-8?B?V1RRMHV5Z2Y4NS8zaEt3dUQ3YTRKb1QwakY3UHowVW5HWjRuUUtCMUZEQ1BS?=
 =?utf-8?B?dDdDY212ZitIZnYwYXowY0lKeVcyTWlQWXoxdWlUamJRZThSUnNYSGVhNTZ0?=
 =?utf-8?B?YmJ4bjB1MWtkN1RiaTl5Y09RNzBTSXdSaGVNZjRkcFRKem9FdGdjN0dQYUh3?=
 =?utf-8?B?NmoxUXJtZjV1RXBVbGxnOUE2blovcCthd3pLckdPQ1lsUGxibW02VjNXS2pq?=
 =?utf-8?B?Q2dmSzR5TUFmQnM5RVpkUGlyZStaNE80SndYbnhHQUw0QjJmY1hjQ3VFbFd5?=
 =?utf-8?B?NWNCU2hmRXhzOEtNdDBFT3JwZzJLWEtiT292L2U1eEVxeWpZSXhiT2RvVEpo?=
 =?utf-8?B?ek1rSWNyQVJRQVVDWlNGcDV6RFYyd0pJVTBEb0FSN3FVcmh1RlBDTkJJZkNk?=
 =?utf-8?B?MkQwS0djUGxidkN5Tk1CU1oxcERSTFFjVFh2ek5zUUh5c01lanB4aXdaQms2?=
 =?utf-8?B?WVNScVlPZTg4NmgyZEYvcjByd0N4cURHb1NVRGRZQ0ZJd1U0aWIveWFkVXQv?=
 =?utf-8?B?R1A3M2tNTHJRNEJzOWdjR2JvZUplRi9iU2ZmTklVNklkejJEK0E3NmhFTXRK?=
 =?utf-8?B?cktTMzdjcWJvd044NjcwVFlCY3c3RG4raXN4Q0tpeWpuNnc5SnoyZE5KWHVZ?=
 =?utf-8?B?N0thZW5OOWswazMySFVkUmVPMHo4a1ptdzdaekM3S1F5NUhRemxJbUdVNUJq?=
 =?utf-8?B?Z3pJOVE1TnJJQTZTeFNjTTMyUWtjYjlDR0dGUmFGOUJiemIvRGRBRHkxMnI5?=
 =?utf-8?B?Q0E5NjE4NU1tUmtMVWRrVEVKMXpmRGc5OGJkZXQzVjJyZGVGUGJoWFBiSzZC?=
 =?utf-8?B?eDFCSjAyNWNORC9SZFlyM0QwNGI5MVI2TGxpTDRUaytjZEdOdytwcE94bFR6?=
 =?utf-8?B?YmFndVJMZW8xbWc1Q1plcUtwSlRsZTlJa3ZKQjVkcCtGaEswdWdMNVE4VHdz?=
 =?utf-8?B?Q1F4OXV6UW42bWYzQnFyK1FMV2t3K1hkaElicXQ1bi82SXUvY2c0K2hMOGZk?=
 =?utf-8?B?RS9EZFFsdDJobEJiREhDQzAyMTA3dk9UOEtzS2pZNGQ3dXRpY3d0SDJTWFUy?=
 =?utf-8?B?ZUptSTB0ZWF4T09XTmZsNGhUcEp0b2szSkRXN2xLSmQ2UXdpbDBDVlFDL1FJ?=
 =?utf-8?B?WiszbEpjUTA1Ykd3OThScTZwcTduYnhPem5OWHYzbUExZ2k1c1YzQTFtb3Bl?=
 =?utf-8?B?eVlwb3lDUTFJRy82TUk4U2FTR1BqZkxyNGhWNmlWZ0haTjdYRm1RbFVLT2RI?=
 =?utf-8?B?U0FQUVRMcExzdWhRaW5NNldKUmhNcUNDMGFIcFJCRWV6SW5ueERVZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64806e5c-c1bb-4f8d-90e2-08de67f6b5d9
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:17:24.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNRrivDhG2UZ0aa/DyCJLgF4YajyVRDCUiPv9h45uA0aasq5OtJ8412LBPVcT/3htQGJgMk3qGFOu0qRZ7YYuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5769
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:tim@xen.org,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 47BC11126FA
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 05:04:55PM +0100, Jan Beulich wrote:
> On 09.02.2026 16:55, Roger Pau Monné wrote:
> > On Mon, Feb 09, 2026 at 04:35:04PM +0100, Alejandro Vallejo wrote:
> >> On Mon Feb 9, 2026 at 3:42 PM CET, Roger Pau Monné wrote:
> >>> On Mon, Feb 09, 2026 at 11:41:02AM +0100, Alejandro Vallejo wrote:
> >>>> It only has 2 callers, both of which can be conditionally removed.
> >>>>
> >>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >>>> ---
> >>>> I'd be ok conditionalising the else branch on...
> >>>>
> >>>>     IS_ENABLED(CONFIG_SHADOW_PAGING )|| IS_ENABLED(CONFIG_LOG_DIRTY)
> >>>>
> >>>> logdirty patch: https://lore.kernel.org/xen-devel/20260209103118.5885-1-alejandro.garciavallejo@amd.com
> >>>>
> >>>> ... to avoid the danger of stale pointers, with required changes elsewhere so
> >>>> none.c is only compiled out in that case.
> >>>>
> >>>> I'm not sure how much it matters seeing how they are all unreachable.
> >>>> ---
> >>>>  xen/arch/x86/mm/Makefile        |  2 +-
> >>>>  xen/arch/x86/mm/paging.c        |  4 +-
> >>>>  xen/arch/x86/mm/shadow/Makefile |  4 --
> >>>>  xen/arch/x86/mm/shadow/none.c   | 77 ---------------------------------
> >>>>  4 files changed, 3 insertions(+), 84 deletions(-)
> >>>>  delete mode 100644 xen/arch/x86/mm/shadow/none.c
> >>>>
> >>>> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
> >>>> index 960f6e8409..066c4caff3 100644
> >>>> --- a/xen/arch/x86/mm/Makefile
> >>>> +++ b/xen/arch/x86/mm/Makefile
> >>>> @@ -1,4 +1,4 @@
> >>>> -obj-y += shadow/
> >>>> +obj-$(CONFIG_SHADOW_PAGING) += shadow/
> >>>>  obj-$(CONFIG_HVM) += hap/
> >>>>  
> >>>>  obj-$(CONFIG_ALTP2M) += altp2m.o
> >>>> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
> >>>> index 2396f81ad5..5f70254cec 100644
> >>>> --- a/xen/arch/x86/mm/paging.c
> >>>> +++ b/xen/arch/x86/mm/paging.c
> >>>> @@ -634,7 +634,7 @@ int paging_domain_init(struct domain *d)
> >>>>       */
> >>>>      if ( hap_enabled(d) )
> >>>>          hap_domain_init(d);
> >>>> -    else
> >>>> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
> >>>>          rc = shadow_domain_init(d);
> >>>
> >>> If you want to go this route you will need to set rc = -EOPNOTSUPP;
> >>> prior to the `if ... else if` on the HVM case.
> >>
> >> Maybe this instead
> >>
> >>     else
> >>         rc = IS_ENABLED(PV) ? shadow_domain_init(d) : -EOPNOTSUPP;
> > 
> > But even for the PV case we cannot call shadow_domain_init() if shadow
> > is compiled out?  I think you want:
> > 
> >     if ( hap_enabled(d) )
> >         hap_domain_init(d);
> >     else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
> >         rc = shadow_domain_init(d);
> >     else
> >         rc = is_hvm_domain(d) ? -EOPNOTSUPP : 0;
> 
> Wouldn't this still leave NULL pointers in places where they can be rather
> dangerous with PV guests?

Possibly, I didn't look much further on this patch, as returning rc ==
0 and not having initialized neither HAP nor shadow is likely to
already lead to NULL pointer dereferences.

Regards, Roger.

