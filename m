Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08A5C0136A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 14:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149097.1480839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBulA-0005gF-6j; Thu, 23 Oct 2025 12:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149097.1480839; Thu, 23 Oct 2025 12:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBulA-0005e7-2O; Thu, 23 Oct 2025 12:49:40 +0000
Received: by outflank-mailman (input) for mailman id 1149097;
 Thu, 23 Oct 2025 12:49:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oXKG=5A=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vBul8-0005dw-FP
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 12:49:38 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8bf704e-b00e-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 14:49:33 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB5301.namprd03.prod.outlook.com (2603:10b6:610:9d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 12:49:28 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 12:49:28 +0000
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
X-Inumbo-ID: b8bf704e-b00e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoswD2zGgnSVUddnm6f2cux1Jop16PFu4J5YWdP+gPV/W1wH7AFhvwW2KPLHXD7JKKpvXAgjnBCNtC8dNLZI5mio4lEEdq6hy1Iac7qM6HqWfq+yPVPeFBUW4XwgjZ0lYuC1V9Cr+kIN0PAPMYdP9+/xfKyZ2f6ndKttETCMjM6lUOlRYjbc+NCLuoH2w5Nruf7heFZQ3moOzmIDKAFn6om/IYNMOMc5UE4hT6ifiW1qKFx8ehcTTwRaloHUflWNgNqjcuYT3yr5F+crkZ8nmS3E+/aTGcVPqnTwozrA6eS2glY8RfRfmwxmpr73UGvjRt+1VVcQZYZODdST1y2J9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jT07Q4pCbhQZlbFA7p7ZVwTicpcsFxE/NAEh+ocixTQ=;
 b=PY5hdaSmn0U9qgWylbgTjTE0+ZZLTTtqniVmCCgkZEwP/u3aucFO90Cu4i5/ylUA6xg0FIa1YZ6H/JCw8IB8d5NOIuz0GOztOU2Xq4/A5HRm5DXhvH26tcvNv5Usz6qTnV9uuldzl5A1CJp0Ao+8VbgaXaC6MPP72KCxDJqio1IhrfY9Q7fY7Ho8bdhNDif23Cwok8bnqxOcNaJRkvH8Zc6eO5rcc1Xex319wZu8Qy/WS5PHwrh+MZ7l73I+Ej9sMpSwackyoNWa2GZ8I8lySCBLm74iUOS6xcoNfMV536heFgDBLu600xYWtEacfexnIe9ROvh9X9Ej1HM6mxw90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jT07Q4pCbhQZlbFA7p7ZVwTicpcsFxE/NAEh+ocixTQ=;
 b=sVY9J9gf2AvRm/JIt8hStoaR79FtdKaU47uhzWlzwdNqllBztb2WQ7eK6aW3t7CVq46iiSz8kBl23PSnQ48ihSnLKiTVSEtOB/ZJDDt2AGWQvL6q6PEcHDNj3p6Pfbv0NKWf9jgNoIJC9dG0GCbxLGlNgswe/RZyfBVJC2mniH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 23 Oct 2025 14:49:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
Message-ID: <aPokVBHr760Zixcs@Mac.lan>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <c8c124c4-71c5-41e7-8d84-fd45ffd6af14@suse.com>
 <aPZh3Y8W4QcV_oLs@Mac.lan>
 <7128bbb5-d099-4584-8cd0-bfeec49b3e55@suse.com>
 <aPePepQk3t6gxMR1@Mac.lan>
 <16d62ac6-6666-4bad-be59-324cec634a20@suse.com>
 <aPnpvtXOoYSXXsT-@Mac.lan>
 <47c1fb5e-abd5-40a8-b581-be8494be3861@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47c1fb5e-abd5-40a8-b581-be8494be3861@suse.com>
X-ClientProxiedBy: MA3P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::11) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: 0725962f-97b3-4990-e924-08de12329a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czE1Q0ZPZnN4cmVrVU5jSDM4ZVNEbmlRWllobE5Wbk10WGdVcGRpb2ZXRkpa?=
 =?utf-8?B?WDU5VU9NY0NBSHlCc2JtV3B1U0Z5R2pvbi9MazZzVG44YVJqbkVYVHFXcm9o?=
 =?utf-8?B?U1FhL2tCUHNJQVo1cTFReWV5MmpKeWc4UE5OOERXREh2ZElDdTVPUk5jTlFM?=
 =?utf-8?B?dUdXVXNaclZNY0lpV2txOXd6dTlNYVVHWU5lUy9Fd1F2QmVYV3dONG0yNFU1?=
 =?utf-8?B?REJ1VnhGOVJHQlZuSXF6NVB2RjBZY1Z6UWFCZWRSaUVpYjgwL1duWCtzSkNU?=
 =?utf-8?B?SFp3RUd3NHpkM3VOVSt1NU1DYitHYXZnUldrWTVOMTU4bFRtUW9CRDFOcVNC?=
 =?utf-8?B?WEZTTnVRTEFUZzBGQWFsWGZxT1crTzhRYWtSN3hnSytSN210Rlo2RXpFMEdu?=
 =?utf-8?B?aHZReG1meVFNTWV1eStUaUJIcXhVNHYrQzhiY2hIU241TlZXNTBtQVhDRGJG?=
 =?utf-8?B?NHROcU9vUEpHWm03L1pOQzQxalNaMUFJZ1hkcFBlemZLd2s3cWc4WVJTc1Vj?=
 =?utf-8?B?bG1USllmWDNDL3MrYXZ6NzJqVTNYd0FuYlY4d05HeWV6OHJTclNobVVPRXpV?=
 =?utf-8?B?YnNBTG4vMy9vV0lhSldZYTZqOENHNUdOaExLM2xNUzZGWnBkalpxSGtpd0x5?=
 =?utf-8?B?eE13cSs0OU80UGN6U1VYZW1UMWpUTFowVlFUNGFBaFJMNm5OMVk0Qlp3MnRs?=
 =?utf-8?B?TTFQMXJvOVB6TUg0V0tHbjdBd3dyUGtSdzlqTEV3Y2VMVGZxZ0d5Z0lIM1Fi?=
 =?utf-8?B?elQxZmRGVjh6YUxkVXZHaFpPR0k2aW5QY0FaVUpydTRBREZDTlVMQzhYcm8v?=
 =?utf-8?B?b3N3Rm9sZjVNMTE5SkVsT0ZWSGpKc1d4aVhUNXptRzRDTTZ2enQzbmJPTG4v?=
 =?utf-8?B?bnpjTUtxNlJqU1F0UzFqNlJXV29selVlZU1TMG4xTkV4bnl2c08ySHBZdm5i?=
 =?utf-8?B?cnFZRTM2Q29pMXYxWHVpZkJKMUZkQ0RINlJJaVJmalNVZmJLZU1pRVdDelZw?=
 =?utf-8?B?VEZqbkNJVWJhQnVnYTR1dDNjbzBlZ0VvZjAva3ZUL2Rmb2ZQbnNseWxQRHdo?=
 =?utf-8?B?WDR2WXNDWjZTUXRaQlV0RVBxUCtoWXBCM2FHcTJKUENkM2FzNjFoUVJHanVj?=
 =?utf-8?B?ekdGeVVZVG90U2g3TmFVYjJCUGI2eWlWUEZXWkJ1cDQ4ZGU5bi9VWktwSTlQ?=
 =?utf-8?B?ai8zOE1VOWR2UEFuMkxyWFluc01MVlRLL2hSTmVZVFA0dmlyL0hJYmRUUS90?=
 =?utf-8?B?UXZlVExQQWUySDhHNjBiYWFwZzNzTGQvL2F5cFltdzdQOG1uVXBBY29PQmtX?=
 =?utf-8?B?OTZ0L0NGU1JaeE9hdE1aQk95UFd0bGRDenRqa29MemRROGVrOVdFQ2UxSHJr?=
 =?utf-8?B?QXJGQjU4UWhSOTJQcUp5MGR1aTBlS0hxUzJtYUFDYzhTdkJxOGdvM1VOeGhk?=
 =?utf-8?B?VHdHb2VoR0ZIMlBiTTRFSGEvMTQ1K2xyTmNWeDRoUW44RVdoR1FwaUVpRmNh?=
 =?utf-8?B?clg1RGVCbk11WjRrVFRGa1hZY2VFY3FDS21mallUcVpPL3BSNHl1a2JDMmwv?=
 =?utf-8?B?blNISDZSOE4wY1N6UmhTaTZCcUZ6M3JHb0ovMkx3c0xYVWc5dFgzRVBCWVRV?=
 =?utf-8?B?SC9xYXFoM2Q0eGJWMnFkMGVRQTNFY1ZlVzNJZEVESGUzU01FK0lKblhSVjBF?=
 =?utf-8?B?UFNpSDZvQTFENzFEbTNXcVJqa3R1UnM4RHUzRXZBaDI0WS9keVYyNzhxa2ow?=
 =?utf-8?B?NEhrOFJqUVpqSnBzblg1aVB4aE5HRmlxbTB2VnYreHdOMk12OGczdnpxK014?=
 =?utf-8?B?TkpIbzlrREFQSFJuSGIvSjNwalVVYUx2K0pQd21rZG9qdzJoc3dsVFVoVlFM?=
 =?utf-8?B?cmRWam1VSXVlQUVKemZHTzhtdVk4SFFISzduZ1VDWHlYaVpsUnRPenJUeVlk?=
 =?utf-8?Q?tQvih1kXC1DU4SK4S8JBl5ncEgPyMWkA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnJmbjIwaUtWa245aVlyRzhLWFlXdU5qdEQ0d2tYcmowcjMzRk5CaDN4WWhl?=
 =?utf-8?B?N3pybkk2MndNOTB1NzlVUFdSdHNVSExTZ0FPc1dPUWNGdy92dEV5aUpNUXBJ?=
 =?utf-8?B?ckFKM1lEcmpVRUsxNFVWRmorMWc4SW1ESWdkb2c3eXNvZW5Gcjhnc3oveVUw?=
 =?utf-8?B?Ri9tRnpJQUdCRUtGVzViQUVKbFVlWkV3aklNZnhXVEhsOS9iUytGa2NCYWg4?=
 =?utf-8?B?cVpTMzA1YVJVWjF5U0wrTUlpTlNWQUV2dzF6ZlQxRVd6T3JuOVExVlorTXhI?=
 =?utf-8?B?Z1RncTdTZTJDWU5YVGhJR2s3K2g5YUZuOXY4QkVNQ0d1QlljcCtHbE8rTWYy?=
 =?utf-8?B?d21DRHpTaUs2T0w5Skg4WHNFMUFqaXlwZyt6WkRGYkNvTjFWRW41b2tFNTVt?=
 =?utf-8?B?MlNZQnhNNllzMXRxU2xnM3ozMmFjQnhXc1JieFpkOVl5RTJlRmZrNDU1ajVB?=
 =?utf-8?B?L2tyUTZIdm1NTG56eUcyR3JSNFVvYUlHbDJ2YThyRlo0RktNNnVVZ2E3bERU?=
 =?utf-8?B?Z3N6NnlnTk9Dc1JGYkd4N0pvRzVQREZJYTRRVE55aEpqdWxPbllzWjlXRWl1?=
 =?utf-8?B?VExSLzBjWTVZRDczNGY5cU9SRG9nbzF0eGlZYmFkSlV1dzE2REN6bHl3bWJ4?=
 =?utf-8?B?TUY2KzBKTEJZZitFekE5NTA4TzA1Rk5PQmVZQWFpNVZNVERYRHBQazRaOXpz?=
 =?utf-8?B?dm5WSjdBeTJPSDZDdG9TUmlRL3JUR3oyN0FrUGladHNvQ2VvRWFWemZEalgz?=
 =?utf-8?B?T3FsVlF0RDhNYi9tWnR0YTNOWm9VSWdIZi9WWFY4QTFGWjhpbjFBN2trOWZi?=
 =?utf-8?B?SThvY3dSQnVpYjdvK2RQb2lXL3IvdUJGNXNqU1dsWUY3YVhvYXpuK0VaUlZ3?=
 =?utf-8?B?Z1pZYXprRmdSTXBEWnRuMnd2Zm9aNHNST2JuVnFnYzhFZ2hRRVNvYnhPaUQ5?=
 =?utf-8?B?aTNTRjJwV0hsSWlXbnBsQ1U2UzNNYmJndzZNRU5OUkdxQjdxQ0hvcURhNlZJ?=
 =?utf-8?B?SEJ6TXpMRFhQclVYenVON3BCWFZDRjc1TmcxY0hSaGFEc2dCaUs2T0o5RE9t?=
 =?utf-8?B?MzFtMXdUWU5MVnVoYlhwRHMvNE9vNDRQQ2NHTkZTeFdOeHVWWTlIR0NHeFVN?=
 =?utf-8?B?TUNaaklNN24rZnZpVHRld2JQT3V2M0hPTlVGZ1BmY0YwNko1Y0ZhK0xLelh2?=
 =?utf-8?B?eWVsOVZwL3lHdm5KZ2g3MHFZdGlyUFlCUUNlaGxZZ3hPQXB4KzVpMEJNOTJG?=
 =?utf-8?B?YXI4a3FmTnZnRUovMk0xZ0Z3Ty9OQ0lhWlBCNWE0YmpLeW0zMGw3T1JXekJz?=
 =?utf-8?B?UlpDZGpDcnE1bDBWd2Y0Tjl6cmVUL2VTOENEYTJjeW5nOS9zem9vbXpsWkM1?=
 =?utf-8?B?NElHdUN4K2VhLzFIcjhvek9rQUhacU1RSDIrdUpLeXNzcHVrOStQY1Bqd3V1?=
 =?utf-8?B?S2ZTNlhiM0F5czNUTUlVTDYycnB4dEd4MVRQclFCMUhoUld4bkp4NU4yaFRV?=
 =?utf-8?B?WlhWNDZhM0JaK2hsUXlpYmZ4QUNzVEdzRDg5Z1VtTnl4OFZRY3BXL0xmS2RZ?=
 =?utf-8?B?TE9TVGg2aGxsS0tXTnVCRlc3NlcveVQyditmdmtKNW9MOXFqY1ZLbllQQkN2?=
 =?utf-8?B?S3dlNnNTMDc0bjlPL1o3NERuNlY5Q3d5VEpySlNQbDNHekY4NmZ3d0tyb3JF?=
 =?utf-8?B?cW54OUFHb1RTek5OQXVUVkM0dU9jWnR5b2hsM2l2YTJNU250THI4Mkg2eERI?=
 =?utf-8?B?Z3dNUnhwU3JQbHZvSHQ4ZWpRMjlBNFFGM25aQTRjQ1JjdlJGTk8xcjB1Z3dr?=
 =?utf-8?B?VnRDUU5vQXFUSUhYZjEzcXkrMmx1bUJHL1FSbVNiZ1R3akZrOUlWVStwV1JZ?=
 =?utf-8?B?ZGlLMlV2cmpuSGxmanJpVXA5emZYajdQOFZiRHZ3d2xEbEltTDRQLzFFV2F2?=
 =?utf-8?B?d09XTFIwb0E3aWdiMS84YWM0Yy9uMCt3RmNDL3N1aEJEMjlyb3FEYWZQSDRw?=
 =?utf-8?B?MFc1b0tJbzVLZVBzSzJ5TnFtUFBJZXE2UUNNQXBtSjMraDdvYi9qSFVLVXlE?=
 =?utf-8?B?bXBVN2tMK01oaHNvYlJrZGUvVVQyWnU3UEU5dWZ4SktBckNVeTd2WjJYOEFv?=
 =?utf-8?Q?JfDgSS98LtILij/SGh2XxoQk5?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0725962f-97b3-4990-e924-08de12329a2c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 12:49:28.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sc9cSzvLAp7MAZlqkqUew9yl3g5ebVQb+Y4NxsR9KPIxQHuQT6D8j0yhPKWfc0MLZmENz3vZDsboc7wEaTbfSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5301

On Thu, Oct 23, 2025 at 12:37:22PM +0200, Jan Beulich wrote:
> On 23.10.2025 10:39, Roger Pau Monné wrote:
> > On Wed, Oct 22, 2025 at 11:21:15AM +0200, Jan Beulich wrote:
> >> On 21.10.2025 15:49, Roger Pau Monné wrote:
> >>> On Tue, Oct 21, 2025 at 08:42:13AM +0200, Jan Beulich wrote:
> >>>> On 20.10.2025 18:22, Roger Pau Monné wrote:
> >>>>> On Mon, Oct 20, 2025 at 01:18:34PM +0200, Jan Beulich wrote:
> >>>>>> @@ -476,19 +486,50 @@ static struct hpet_event_channel *hpet_g
> >>>>>>  static void set_channel_irq_affinity(struct hpet_event_channel *ch)
> >>>>>>  {
> >>>>>>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
> >>>>>> +    struct msi_msg msg = ch->msi.msg;
> >>>>>>  
> >>>>>>      ASSERT(!local_irq_is_enabled());
> >>>>>>      spin_lock(&desc->lock);
> >>>>>> -    hpet_msi_mask(desc);
> >>>>>> -    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
> >>>>>> -    hpet_msi_unmask(desc);
> >>>>>> +
> >>>>>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
> >>>>>> +
> >>>>>> +    /*
> >>>>>> +     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
> >>>>>> +     * actual update below (either of the IRTE or of [just] message address;
> >>>>>> +     * with interrupt remapping message address/data don't change) now being
> >>>>>> +     * atomic, we can avoid masking the IRQ around the update.  As a result
> >>>>>> +     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
> >>>>>> +     * keeps setting the new deadline only afterwards).
> >>>>>> +     */
> >>>>>> +    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
> >>>>>> +
> >>>>>>      spin_unlock(&desc->lock);
> >>>>>>  
> >>>>>> -    spin_unlock(&ch->lock);
> >>>>>> +    msg.dest32 = cpu_physical_id(ch->cpu);
> >>>>>> +    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
> >>>>>> +    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
> >>>>>> +    if ( msg.dest32 != ch->msi.msg.dest32 )
> >>>>>> +    {
> >>>>>> +        ch->msi.msg = msg;
> >>>>>> +
> >>>>>> +        if ( iommu_intremap != iommu_intremap_off )
> >>>>>> +        {
> >>>>>> +            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
> >>>>>>  
> >>>>>> -    /* We may have missed an interrupt due to the temporary masking. */
> >>>>>> -    if ( ch->event_handler && ch->next_event < NOW() )
> >>>>>> -        ch->event_handler(ch);
> >>>>>> +            ASSERT(rc <= 0);
> >>>>>> +            if ( rc > 0 )
> >>>>>> +            {
> >>>>>> +                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
> >>>>>> +                ASSERT(msg.address_lo ==
> >>>>>> +                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
> >>>>>> +            }
> >>>>>
> >>>>> The sequence of asserts seem wrong here, the asserts inside of the rc
> >>>>>> 0 check will never trigger, because there's an ASSERT(rc <= 0)
> >>>>> ahead of them?
> >>>>
> >>>> Hmm. My way of thinking was that if we get back 1 (which we shouldn't),
> >>>> we ought to check (and presumably fail on) data or address having changed.
> >>>
> >>> Right, but the ASSERT(rc <= 0) will prevent reaching any of the
> >>> followup ASSERTs if rc == 1?
> >>
> >> Which is no problem, as we'd be dead already anyway if the first assertion
> >> triggered. Nevertheless I've switched the if() to >= 0 (which then pointed
> >> out a necessary change in AMD IOMMU code).
> > 
> > Right, so and adjusted if condition plus an ASSERT_UNREACHABLE() at
> > the end of the if code block?
> 
> That is, instead of
> 
>             ASSERT(rc <= 0);
>             if ( rc >= 0 )
>             {
>                 ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
>                 ASSERT(msg.address_lo ==
>                        hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
>             }
> 
> you'd prefer
> 
>             if ( rc >= 0 )
>             {
>                 ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
>                 ASSERT(msg.address_lo ==
>                        hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
>                 ASSERT_UNREACHABLE();
>             }
> 
> ? That's wrong though (for rc == 0), i.e. I fear I don't see what you mean.

Oh, I see, sorry for the suggestions, it's indeed wrong.  FTAOD, what
do you plan to use then here?

You could replace the ASSERT_UNREACHABLE() for ASSERT(rc == 0) in my
suggestion I think?

Or maybe just do:

ASSERT(rc <= 0);
if ( !rc )
{
    ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
    ASSERT(msg.address_lo ==
           hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
}

Was your original intention with those checks to ensure that for the
rc == 0 case the message fields remained unchanged?

> >>>  IOW, we possibly want:
> >>>
> >>>             if ( rc > 0 )
> >>>             {
> >>>                 dprintk(XENLOG_ERR,
> >>>                         "Unexpected HPET MSI setup returned: data: %#x address: %#lx expected data %#x address %#lx\n",
> >>>                         msg.data, msg.address,
> >>>                         ch->msi.msg.data, ch->msi.msg.address);
> >>>                 ASSERT_UNREACHABLE();
> >>>                 hpet_msi_mask(desc);
> >>>                 hpet_write32(msg.data, HPET_Tn_ROUTE(ch->idx));
> >>>                 hpet_write32(msg.address_lo, HPET_Tn_ROUTE(ch->idx) + 4);
> >>>                 hpet_msi_unmask(desc);
> >>>             }
> >>>             ASSERT(!rc);
> >>
> >> To be honest, for my taste this goes too far as to what follows an
> >> ASSERT_UNREACHABLE().
> > 
> > I can understand that.  It's the best way I've come up with attempting
> > to recover from a possible error in the release case, but I don't
> > particularly like it either.
> > 
> >>> I'm unsure about attempting to propagate the returned values on release
> >>> builds, I guess it's slightly better than possibly using an outdated
> >>> RTE entry?  Albeit this should never happen.
> >>
> >> Yes to the last remark; I don't actually see what you would want to do
> >> with the propagated return value.
> > 
> > OK, I can this this not being clear.  By propagate here I mean
> > propagate to the hardware registers, not to the function caller.
> 
> I.e. you still think adding the two hpet_write32() is going to be useful?
> The mask/unmask, as I did say in another reply to your comments, isn't
> useful here anyway (for already not being atomic), so I wouldn't see much
> sense in having them.

Right, for it to be correct the masking would need to include the
iommu_update_ire_from_msi() call also.

> Plus of course we'd want to avoid the writes on
> release builds if the values actually match, i.e. the construct would then
> rather end up as two if-mismatch-then-write-else-assert-unreachable ones.

My concern would be that after this change we won't cope anymore with
iommu_update_ire_from_msi() returning a value > 1.  Which might be
fine, as it's in theory not possible, but seems less robust than it
was before the change.  I guess it's the price to pay for avoiding the
masking (unless you have other options).

Looking at the existing code is likely no worse than when
iommu_update_ire_from_msi() returning an error, and that case is
already silently ignored by hpet_msi_set_affinity().  So I think
silently ignoring > 0 is not that different, and doesn't make the
current handling much worse.  It would be nice to handle those better,
but can be done separately.

Thanks, Roger.

