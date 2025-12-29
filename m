Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E5DCE6829
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 12:23:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193998.1512502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaBL4-00036I-KT; Mon, 29 Dec 2025 11:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193998.1512502; Mon, 29 Dec 2025 11:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaBL4-00034g-GR; Mon, 29 Dec 2025 11:23:02 +0000
Received: by outflank-mailman (input) for mailman id 1193998;
 Mon, 29 Dec 2025 11:23:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DabL=7D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vaBL2-00034a-FE
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 11:23:00 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9302822-e4a8-11f0-9ccf-f158ae23cfc8;
 Mon, 29 Dec 2025 12:22:57 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7956.namprd03.prod.outlook.com (2603:10b6:610:24a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.13; Mon, 29 Dec
 2025 11:22:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 11:22:53 +0000
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
X-Inumbo-ID: b9302822-e4a8-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djcVfb1kX16wbg3FARs1kiDMQHycwdPgPWIi29NBA9kp+dnzLMQhZSXYnb2fklQdDRL3S0eiIj5XjWf1LXVfdl5ydSuFxdkOl4+RV3zoDLqeaXyKUu4pXlQEJSy6KKyM+ajjYljCJ6Da0UhLll0h6lA1k+clUTQ/uwmcQ0ELVsW5S5Q9pUK5SoXEwsup4QY5GbxV3bgsiUs7VDB/R6ht+dsXmyHbPXgQ/E71Q9X+RcgsQhNUH5yc3mA0c1nAZx/Chiwy+dSuZyJDnGJqqSjpQw53lZF15Xxu6GUj7+xXINj9bHc/prMx7HtC/qPUEfLHLhntFY3ZQMA7exi7TIOXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Flr+Yy4BdWQZEEB9Qi+QM49ScYRPaLKnbW5GK8JuaiE=;
 b=uNENIOw8tZnLA8swYJbMkyJ6Tp2pIsbPp68LGeWeWMj78BJ2ezUWXcroftXTuauDaHoTnjK98Iiua1rqtudCW+hm7+L2tTrYnLzdNFw3ioUovo8PuD/nNNVJQ+zx6rNc0Wdsoad9Qrg19PJXv9S02zokbnOLXoGzQnTqpl2BqG06fRZmez7duXRSPlJIB4UL3ZA4Dg05cyptCqxXwr07W0t4xMCihZJ6b4a/JqRQS07nYh6jEewm5MLBq0abxWCZw44k2r3cZXiyS6TtV+R3UeUpsOJNQ1hI1YoW/pj6v0OVmR4eouNXjgiFq7y19pYiWXPB6CxXQokAS+vQyKLGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Flr+Yy4BdWQZEEB9Qi+QM49ScYRPaLKnbW5GK8JuaiE=;
 b=UhKInlyri0B8VYVLnhtWKlHfoWFVTLtgvysan12WzYFXzEIo3MxCk1Y1E7SKq6rtGTboWAubhw3TAgkmg8DJEpfDijMEipaz/46XV0zENKNVN9+Z3OnlyEPnZK5hkoJBUt/sYlCSaJFqnX+ZYZ5uMBU/VnDgGjc0ETR6E6i0jlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ec5ecc50-d8e4-4385-9dd2-d20441d079da@citrix.com>
Date: Mon, 29 Dec 2025 11:22:50 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/2] x86/cpu-policy: move copy-in/-out functions to arch
 library
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4a8f06b9-8210-487f-9dd7-e0221e2df9db@suse.com>
 <41447fdb-bc9a-4b1a-afd0-9d878ab21301@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <41447fdb-bc9a-4b1a-afd0-9d878ab21301@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0145.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: f1259512-ac7e-4b43-cfe0-08de46cc9bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDRpa3V4SStQNExZQysva1Vqa1kyREhEeEhnQTF6cTJ0czJSYkpodkNjSjhP?=
 =?utf-8?B?NnpSRC9ucUVyS2JGOGFza2xzek5xT2FkYnY1SitJNjVtVDVNRVkwVzdWZmNM?=
 =?utf-8?B?R1ZJRzZGd3dTRmlPTFBJM05OZ3EwTU1jMnkwWTI3OG5yaExYa1kvL3lQa0NJ?=
 =?utf-8?B?Y2RRaTNFVEQ5dlNBYVVmS2JUTmdMRlBpUUZwRkFFYWdaZ3YzY2dFcmJmTiti?=
 =?utf-8?B?UHR4SXovRFFxVm5aV3pqSXN5VGZDTEFGbllHWmowbGtFSWxkZmVSVUpsNUVO?=
 =?utf-8?B?Z215dkp2SXNjaEEzeCtHc1dBbTRxcWFnTFVEdHhTS2RIUGhqU2JlcEV3TXlL?=
 =?utf-8?B?ZkRrY0R1OGMya2Y4VkRReTh3TjlVb0srNXNlWm5Kdjkvc0pjYXMvSnFzOHhV?=
 =?utf-8?B?K2VPM3NnbXVmeUNYeUptWis1UFZjOGdTcWFXTDR5eVBhdHdMUmFGK2RtWm9s?=
 =?utf-8?B?cDVORDNxK29QQmNROXZXdHI5UFcySjRlWmNNMEpNejI0aDdaZXRyTzVaNEg3?=
 =?utf-8?B?NEV5OFJoMFErMkV6ZGlXbnUxZUMyU3JSUDc1TXJ0L0NsNkxhUDFxSlU0c0Ni?=
 =?utf-8?B?K2x1alBOakxUSFZ3eHkvR2JQNk9xd3hNS2dUTWhFUnlhL2pxU3RWcS9rbWhO?=
 =?utf-8?B?c3FwWE9UbTZiTHo1ZXlmMnI2QURzKzk2Vm1hS2dzZm41V2djUjdVOE1xeENv?=
 =?utf-8?B?Q2NBV3d5RmdFNzR4TWZON0ZpTjBGSThLUktwZ0IwaFcwcVJPRjk5ajJsTVlH?=
 =?utf-8?B?K1JsZ0JySkRBeGRDSjVSbVJBdkZqWGRDeG9pVURuVGpIRTR4TG0vYnhPdHhl?=
 =?utf-8?B?eVduSi9ORzdTSVdDT3RUZTBGVmh3UG1SRzltYzUvL01EajBRQzIzYTJwY1lC?=
 =?utf-8?B?cnNPOUVlazFHVGVObENldHVjb2NVY3pqMG1CNFJDOE5YaDRSTWg3SXQ3YjVN?=
 =?utf-8?B?TjN3WWd0anZNbDdkOVl1RTRDWE1oMGRNeWg3VWF2MGc3Nyt3Y29Ga3pIOHM5?=
 =?utf-8?B?VHVNT3U3Y0ZOdk1VS1UzY3VzVlZ5SkgrbnVOR1l4UnRIaVRqdWR4SzJCSmRj?=
 =?utf-8?B?UE83aEx4bFl0c2x3TU9tWW5BaDZmUGh1aDB2c0daamdSclpISmg0T1ZnZDg1?=
 =?utf-8?B?RXlHL2RpVDhRSzY1cTVlelpxcVQ5N1FZOWFpUTVEZTh2bmJZQXgwSitkc0xi?=
 =?utf-8?B?U2xoaDNwWmpNSC9hS0pnNUYza0NIUCtSNVpBdDAvbmtnYmxadzN3YkpoNDQy?=
 =?utf-8?B?SVBHcFJTdGtTWCtGT0kyRWFXcEJQMXZwM1lLY3FUSDNXSXJ1RHZzaVRZQkNJ?=
 =?utf-8?B?WXFqcjlybEJUSzZHN2hUL3pIL1FXdGtKRDFqcVBrKzRqY1FSR013R3ZBdW5C?=
 =?utf-8?B?UzVPM1dKb3RTc1VDUWwyKzZlQTRJZ0kvV1p1NDVaU1FlQ0FGM0hTMVNLbmhh?=
 =?utf-8?B?WWF3eUJxNllEaGQ1bUl2OStCbkpXSTI2c1JLdU5oV0gxbU1XUWs3VlZCYldp?=
 =?utf-8?B?cGhmSE9WWVJocWx6dmNqRDhFV002Zk9UWU9nUXNnSityNU1EZTJrYUlkQWh3?=
 =?utf-8?B?U0xZaEFXdzNJVXBSWTEvTzQ5RVpMTkFDc0tqUElGaFZ1R3hLUGRSMFhZZzNw?=
 =?utf-8?B?d25TZWNGdllIbWFFTHl0SUl5bGdHc2xEaGxoNEFpbzJBeGxicE9NdkIxNGpv?=
 =?utf-8?B?U2NaNXlnZEhvK3JjVU5BNG1UWWN1RS91NUlweU9sREN0TThBcmdpYXgvZmtO?=
 =?utf-8?B?K1kzZFhacVR5VGxjejJxTU5lZC9UVTZNRWxNK0FoakNQVXp5K2llMldKbjdS?=
 =?utf-8?B?UHhDMHRhTGVJcFpVVDBtUm9BN3QwK0ZZTnl1YVpWODN4RjdBUXkrWGVmbWYx?=
 =?utf-8?B?YTd2ZDVjS01wV3AyU3RROE1MRU9PYnBlczQyWWNBcjFVb2xDUE9hV05ZY21L?=
 =?utf-8?Q?kZ/pg/X6/Cksv4lGDpEYQHAut1Qb6I+H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzJGVFZaazk0dDdYWDAvMHRROGtaeUcybWNnZklWVnAwZytrK3pSMHllaWQ4?=
 =?utf-8?B?WDYydDZNUk8xdi8zQTlCb211aDNlR25rUU12MnhPNTNrNGMyMmVRWHdTb2Rz?=
 =?utf-8?B?YXhSOG0rbytxV2hQR1lqK1Q3VG1kb2tMaGRnN0NRaEFzSzNQRllGSHNNY25E?=
 =?utf-8?B?REgxWDBjWkp4MFkvWUhHVDJoc3pBQ2V4cEs4SUU0dFVkb2swQzBmVGJWZTl2?=
 =?utf-8?B?M0srcXBYU0owTDVvL0NGSUtobktWMVh5L1BPQTZlNG1RZlZFN3dGUys1eXY2?=
 =?utf-8?B?UEZjNGI4ZDlvVStBK2hMbjhHYXVMYXdyeWNtRENjczNFVis1aUkvQUtVcTFD?=
 =?utf-8?B?bXhSVjZDN3lTcnVmRS9jS3U3cytYRk00ZStQTWJuUEozcVdEd2JRWWd1T0JL?=
 =?utf-8?B?ZE1vSXRZSkNHN3BBeml6VmhkaWI5WGkxSkpUQ0lBSnpuaGx4LzFuaDhpUkE1?=
 =?utf-8?B?MEZ4SXVwYzBUV09UdnM2MThBUmQ2ckE5T2UvaC82Z1J0WHBrUGVRQ1pBbEFQ?=
 =?utf-8?B?U00wUGw5YlR3Wml0VEVSZXMzc1REcGFnMk1Sc3NOSlJaWU5rN1NkMlVXLzdu?=
 =?utf-8?B?bllIb21qSER3bTVQN1NJOFM0S0lSMlFpaFM2SUNOWHY0V1cxdnByUTBhUEdl?=
 =?utf-8?B?WnNwOHNUNFF3d0hFbzlwMkJUekFjT3o3c2xiSGxUckFMZHFiaGJyUkppY29T?=
 =?utf-8?B?ZjVKZWY2QWl3aXhmRGVLeSt0UEdNWmtiN2h4SkFlMGxGT3VDT2Z4NHR0dlds?=
 =?utf-8?B?U3gxQzdZaGk4VGxGQk82K09uUmpGaUVVSEtQTHNMaDhBSEVkU2RVYjRpcWNI?=
 =?utf-8?B?QkprU0hzTUhMekpxR0ZwWDN2Ukp3bWU2OWdUYy9DUThpdC9iV3JoM0kzK25y?=
 =?utf-8?B?aDhWWmN0QmpnSEtPemExT0tia3U4MUwxUTMvdUFPd1lSaUVCSzhXSTg1SEhv?=
 =?utf-8?B?dmpySXFQZjF2UUticXB1dHo2K0pOZ2R6bVBseGZ0NWhlZlp0MkVpeGI4Tlht?=
 =?utf-8?B?aERrM2kzUE9NZW5EOGJ6Z0dIdHYzUHFsd05BUHRrUVpwb2Vod0JZMXErdnZL?=
 =?utf-8?B?SldsdHFiRXQycVYxbUxsdnQvYXBDSU1JNHk1bnB6ekw4OHBSbEJOeXJvcmtJ?=
 =?utf-8?B?MVhkKzZTY05NVWp5RHBYQ25PK0ZRVUMwSklDS1VuVUY1RDYzR2lqbDRZSjg1?=
 =?utf-8?B?K1RZRU1xQk5GczNZRXZWSWhNbFYwOU43SDhSa2MxK0RBRm52UEFPT1E4V3Ry?=
 =?utf-8?B?azFtWUtWMitBV2FnS3RoU3F3R2N2S1VPSmJiVitKYzVKaStybDFweDJGdmtv?=
 =?utf-8?B?bTFxY2ljL3Q0dFBPSmI5UndIcDB3WTdSdGN4NmFpYlhBR3psbk5xNWtsMjA1?=
 =?utf-8?B?MFNGQ1p1bjg5QmFuelNZUEQ2TlVia3NTSXBQWFVHaGNmRk1IcWRnV0pqRU1Q?=
 =?utf-8?B?MExEeXVVSDl0V2JBQ2FkczlTK1NCTk9XM1BYOW5XK3NYOVFhYWFNa0pPYUVN?=
 =?utf-8?B?V3ZTTUw3OEhKOGEvbGQxeEQ3enhSanZ5bnVoRFZpbTRqZk9BWWRWczhjVE5a?=
 =?utf-8?B?Zk1BVjhYRDV5V1AvQ25hZ01IK1lkNEQyRjFJdzZBbW5CL2pieno1bFFiZVY4?=
 =?utf-8?B?VkdUMFJvMit1a2prVlhIVCt2QmV3bVpDME4yclFCWXZmQUJrek8wUXQyWGph?=
 =?utf-8?B?eHA0eVBUSU1TZ3dhbHlHRy9XemVVZDZmcnFORFhmcnpiMyttRUNVeGEvcHhT?=
 =?utf-8?B?LzhGbDN6dTBqdlFTUm05NVRWbDhWaHVyMU5BeUVtR0FtRjMwY1BCd0x5THJI?=
 =?utf-8?B?SWUxSUI1S3FNU0NPbkhCSHhRdkpuQjV5ajlmTm11SkZ3c1FPd2EreXczK1FT?=
 =?utf-8?B?ZVRWWGdmazVnSnZhL0pHaHFXcTA1cEVJdlk5ZWVQZWk2RndqVklOWXpXWVIz?=
 =?utf-8?B?bE9pQ21MVGxxUTJCTStuQ0ZNdHRoQ1RJTjJGcktramozVjlHalN5c0lERUZQ?=
 =?utf-8?B?NkdzVkZKeUFMaWI4MGxXZWdRMWdaazM5UGYrbnVzM0tMNDFYcWpRbE9MZ01X?=
 =?utf-8?B?T04vRWlSSVNsaVZmajdSVnFsNEpHbmR2ZUZldnhCaWFHZGgreGZ1bEs5bVBG?=
 =?utf-8?B?MDlJcWxXTWkyZ3MyRTBkV1ZoMGRoemNJR0xISFpvM25SQUxpSjBpbTFVTzBC?=
 =?utf-8?B?K1g3NW9QdThBVDRmMHkvQnhSaVM0WlR6ZXNGRUVRMitUcERHaVE1TG4xT2Ny?=
 =?utf-8?B?dHFaRHpmVi94aTdRcmM5anF2K1FOSnZYWEJ5cDcvQWFHa0ZHT25KUTMzK3BD?=
 =?utf-8?B?dFhIWVlnYUtWd1c5R1JjZE1TZzVhMzM3dE9FaDR1aHpFc29MUXROdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1259512-ac7e-4b43-cfe0-08de46cc9bd3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 11:22:53.6243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RyyGGcLliS4s1uMqUCoS0zx1ailPPYA6cffcSvtqRh9nU8iQMGmEfoNpxfgMjZqNl0xPz4+ZhHwdCAOtcJ1jI7YK8YlsFe7m3ozuACr2as=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7956

On 22/12/2025 4:54 pm, Jan Beulich wrote:
> --- a/tools/tests/cpu-policy/Makefile
> +++ b/tools/tests/cpu-policy/Makefile
> @@ -42,11 +42,15 @@ CFLAGS += $(APPEND_CFLAGS)
>  
>  LDFLAGS += $(APPEND_LDFLAGS)
>  
> -vpath %.c ../../../xen/lib/x86
> +vpath %.c $(XEN_ROOT)/xen/lib/x86
> +vpath %.c $(XEN_ROOT)/xen/arch/x86/lib
> +
> +lib-y :=
> +include $(XEN_ROOT)/xen/arch/x86/lib/Makefile.cpu-policy
>  
>  %.o: Makefile
>  
> -test-cpu-policy: test-cpu-policy.o msr.o cpuid.o policy.o
> +test-cpu-policy: test-cpu-policy.o cpuid.o policy.o $(lib-y)
>  	$(CC) $^ -o $@ $(LDFLAGS)
>  
>  -include $(DEPS_INCLUDE)
> --- a/xen/arch/x86/lib/Makefile
> +++ b/xen/arch/x86/lib/Makefile
> @@ -6,3 +6,5 @@ lib-y += generic-hweightl.o
>  lib-y += memcpy.o
>  lib-y += memset.o
>  lib-y += scrub-page.o
> +
> +include $(srcdir)/Makefile.cpu-policy
> --- /dev/null
> +++ b/xen/arch/x86/lib/Makefile.cpu-policy
> @@ -0,0 +1,2 @@
> +lib-y += cp-copy-from-buffer.o
> +lib-y += cp-copy-to-buffer.o

cp works as a name in source code because it's used by a type called
cpu_policy.

In this case, cp with it's UNIX association makes the file name very weird.


If we're going to be properly lib-ing the whole thing, then we're going
to have enough TUs for a directory anyway.

So, I think we want xen/arch/x86/lib/cpu-policy/copy-{to,from}-buffer.o
right from the outset.

Also, I'd really prefer not to have things split between the old and new
locations.  Everything wants to move in one go.

I'd suggest having one patch doing a wholesale move of xen/lib/x86 into
xen/arch/x86/lib/cpu-policy and fixing up the vpath's, then a subsequent
patch splitting copy-{to,from}-buffer.o out.

> --- /dev/null
> +++ b/xen/arch/x86/lib/cp-copy-from-buffer.c
> @@ -0,0 +1,238 @@
> +#ifdef __XEN__

Hmm.  I should sort out SPDX tags.  Defaults would say GPL-2-only, but
libxenguest is LGPL-2.1 so it probably ought to be LGPL.

~Andrew

