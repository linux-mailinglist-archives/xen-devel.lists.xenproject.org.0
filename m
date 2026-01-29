Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMAsIbp9e2kQFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:33:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCEBB17C9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:33:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216729.1526670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlU0p-0001LX-IU; Thu, 29 Jan 2026 15:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216729.1526670; Thu, 29 Jan 2026 15:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlU0p-0001JY-EJ; Thu, 29 Jan 2026 15:32:51 +0000
Received: by outflank-mailman (input) for mailman id 1216729;
 Thu, 29 Jan 2026 15:32:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEJ3=AC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlU0o-0001JO-Dk
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 15:32:50 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3db69a6-fd27-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 16:32:49 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5180.namprd03.prod.outlook.com (2603:10b6:5:1::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Thu, 29 Jan 2026 15:32:46 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 15:32:45 +0000
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
X-Inumbo-ID: c3db69a6-fd27-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfLMKSdz7+RoM5YCHz6Um8j3jcNZC3RGdTKubZiES/xYun7abeAmhXfG1a5PMzmfj/hNq0sOdQYGjkbnpsBckG8NkHFwVtcxgAgS2Ir9iDaaM+rdtt9Plxb3uT66izlnLgE2/F6rc6UnjwO51yMJlbxieCOJZHc57luSwQY0eDhOUrV/jz+ek36zP54kIkuMaDKFqyeooVcXfmMOgBg0d3YabB8i35L6DNNR/INzIYyHwzGWCKNyDPOxpjgtRDDPQ7+shw/A0G6fKRXIo3gC04NzpO+e1sReyuiy1qixSFI1VwPc+2AodRTjkvGZqFYtnZ8r1viInEzWEl4AAB7maQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuIVjMsD8z/WTemF1vaO+4Tej9Jwy+LLlnwIfT0DoJg=;
 b=SczC2JXn6oBTQYBcqh0XDMGFGi1Oqo40AmRTZyXR0PyAHfqwqQOl8GIaGs2HBGuy/GANzxHe+XsKXa91+20KYE13tbQ4ZQE81tVSMeRHMBZbuYJ2+p2n463MuuCQaPUg4cMoZxu2v/zTPOvdodZrS+QrmjJoCgqp9QJyUruM4BLXeqh0ZGukAptVZ500ZwBCNMW251iUdGRi30uG3lDgzpLARyncBh/alJKGBx2PLf2k3avnlwEJG9VGMNDDvSnJmrES1Pj0fDGVGDFAH8tyLifPddRX0UcFLEP8I7T3pProxXOF6pqEv2zpMpjeITST0u6PjjZTuHEV8NNj0DlCTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuIVjMsD8z/WTemF1vaO+4Tej9Jwy+LLlnwIfT0DoJg=;
 b=Z2arAxDa71nFLS71uQvlnIQ6EYk2gjw/BzgYk4Q+EWmwEdjq4X0/BWktDl06wxp46d2F6WiqwZmY4yLEozz0JxVhJnF8EArG4uRt8NVdQsJMPjFEXbiDtPxNQ5agjm37kepWQybWiKgM0SQ8yWKChmzwhfEAaL16KEVuGtE4n0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jan 2026 16:32:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 5/6] x86/PCI: avoid re-evaluation of extended config
 space accessibility
Message-ID: <aXt9mjFhSLwxrzM9@Mac.lan>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <a0b10d39-daae-4fc0-af42-a3794a96f9f5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0b10d39-daae-4fc0-af42-a3794a96f9f5@suse.com>
X-ClientProxiedBy: PAZP264CA0155.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f9::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5180:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c750eea-4388-483d-74d1-08de5f4ba69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Kzc3L2ZvSzJ1WkJMU0NNdkpLQ0NUWXNnclpQUTRtS0k4VjlDTUtaTkhWalBv?=
 =?utf-8?B?RUFiUnpjZHo2ZDdLUmhaOFN2ZzRMbGhTK2U2RUlxeFJXVEVzN0ZpYWUxN0o4?=
 =?utf-8?B?bUNDOVNhdVljTGhDdFZPZDZ2S0J4c3NCMWxEc2VOTThpZ0tkazFpam44VGIz?=
 =?utf-8?B?QWh1OUpIcXNaeXZwNEtuQlJpc1ZwZWs4b0tIK29HQ3pQcW5pVTRhbUNYWnN4?=
 =?utf-8?B?cy95TmtjVU81YUhzOWx6QU4wS0R6OEVJL0hISDFWMkdkbEdZTnZmVkdxVGp6?=
 =?utf-8?B?QVdoYnNUd21hem5hdEgybjZGaDlZQ3BPdkNFbFNHZFNQMWlHRlozRXdyeHFO?=
 =?utf-8?B?bmIwR0JDbFhwcUlwZDVOUGpTV3lOU3lPUlRzNkN0WEVjMkFyZXpQZnd1Vk4r?=
 =?utf-8?B?QW16WWdBUzNVRjdjSjZvelkwQ3dOZ0E3N1VOYWpMUDdEZ3A4VHc2OFhXUCts?=
 =?utf-8?B?bUZDbjdMSnhmMllRK1NyVm5iU0xTb3Z4bkhnV2tGSGplWkcxMUE1VEFueW9v?=
 =?utf-8?B?RXdNSW1YdnE1NldRdFlvbitOUzI3VVpwVTA4bkVwMHUwWmcvbU52c05XMDA2?=
 =?utf-8?B?LzkzM0R5Wk5lcU5FbXpwZlhOTDZsdkFweVhRRXlaMGZYTzJhbkdrOXdPTUp4?=
 =?utf-8?B?YmpBOHE1eVEzOTdnRWl5MG9aYVMvSmpYa0J3alE4YW82MS9Nbzdoa0JPZDl5?=
 =?utf-8?B?MEp5S1Y0VzFSYjQxUjRJTC81REgvNjVXRkpVOXZzSE5DeS9KNUI5WTdlMWJQ?=
 =?utf-8?B?YlliRTEwTnh2Wm9pV2dOSUJWbm5Yc3VheDduUmlkbVI0L2x1OE81L0xrcGI1?=
 =?utf-8?B?cmpvUmlrM2dyRDBVYXBTbTZTdGtsZ1ozWFp3REhNM05ENUg4UmE1R0tWVWxN?=
 =?utf-8?B?V0NhZDBBR2UvMm51RWpyVjBJMEF4cm9sT0dVUkp4QzJaM294V3VYMVNDRmxS?=
 =?utf-8?B?dHNzTHZ3RGpDNXIwRDhidmxHRVRVaXBJdDdxNW1jUmthYXljNEZFNjV6cjFu?=
 =?utf-8?B?MXlKVXNGdHg1Q1pzOC9kYnlpN0p2cEYvV20zTjlseWRod29FQTBNclh4MVFo?=
 =?utf-8?B?aUlFYU4rTzR2ekVJZkNyUHd3WDFKYkNNQThCdzBYd1o2cFRNZWtER3JSRmtw?=
 =?utf-8?B?UXdsRjd3WlgzZy90QWtIUjhscmZ0a2p1T1pZSUR5K2EzVHE0bmNsSFY1Tm52?=
 =?utf-8?B?QmRtUVhWWmorRXF6VDcrdU5YSFI0RUEzNmtoaFdqWW8yMktoVlAxR0IzM1Mz?=
 =?utf-8?B?eEhhZW9HTlVHaWFBYW9JcFdVU0JOZ2dqZ29DZko3VlpQTjN4dm9XZXJhT0Nu?=
 =?utf-8?B?VzBic2FBblNKMTNHbFVZNHJNbXFSbmtleGo5VDk2TW5Oell3aWpRT05jek5G?=
 =?utf-8?B?VWlCT1BuQlB4MkVjeFNqdEJnTTMrNXFQZStiSjgxL1pWQTJLYk14cVl4MlNx?=
 =?utf-8?B?VHUrazRhWk10eWJhd2QrMG5BQ0FUWGZ3TE5mSmJvZzhhSzZ5R0VYaEg5WmM4?=
 =?utf-8?B?QzFyOFc0UkxZdnZ6TEprbFdHbWNmcjQzSjdBQTRNcEFqdWxRVHA0NFZpQURR?=
 =?utf-8?B?bWlZTUF1dnhZOFRJUW1qRVdOUEYrNTgzc0x3MlJ1MWtRV1Y2ckNpblg0eFQ0?=
 =?utf-8?B?cnZaWStLdGRWb3J1TUJJRWoxanhENkYyclRyK2pyTlZKdWJPTE1hTnpTM3dU?=
 =?utf-8?B?d1oxY1laTXdMNFFFMlkxdVQyaTQwWFhRb29vRjNKUUhHMjRkeWRPeS93S2ho?=
 =?utf-8?B?K2tvSnBLTVYxYUpOVTFLZUhieDI5aXFQcFR4SjRJV3VPa1FxVG03UjE5MWFq?=
 =?utf-8?B?VEh1ZTRJakg1YnRCY1dGK1dsK1RMSlFRdE5oYTVVYStvbjVXQ2VxOUJnbmJQ?=
 =?utf-8?B?V2d3MmJIdnpXUHYwemdTRFVWQjVKdk1GZE1WM2VQem51bE10V3RTVUZpT0l5?=
 =?utf-8?B?SUxsNmhpWkxZQWJKdjlwUjBkTmtVS090T2VrRzNVZVRVUWFjbjE5RnVjNytk?=
 =?utf-8?B?T2c3aVZJNWhWcGhaNXQ2cGhkdDFMRHhWTmxjbWpDRTBxM3M2djhhWVlHMHN4?=
 =?utf-8?B?TE41cnZ0TXBBcUZRQlU4LzRjV2FmTklOM2lzUk1WMi9pUEtCaXAwTkxyNDM2?=
 =?utf-8?Q?Fr24=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUMxazFQcTZGcUx0bGRoQlZJL05xUGtURThCcjBSK2IwRVpTQTFyaUZxeTJh?=
 =?utf-8?B?K2xkdDVUU1hHMjRUdVRreHNtR1hrM082ekxVb0FUQzNuVURIbWZYdXRwVGRx?=
 =?utf-8?B?SE9kakdEcE9xOWo4TS9Ya2NTQ1FLd3JFTkR1d281Y3ByVWpkTVUyTG9qRVlR?=
 =?utf-8?B?TFo5eDIwMzNqQjdpUVF5UlM1MU9FTy9URmpaVE9ZT0xLQTVlTlZqQ1hjWnpm?=
 =?utf-8?B?bEhkQXZtRzYyU2ZpUEJWbTluSTByM2c5a1pmeXdHcTExMnVpYWdEd2d6MVJN?=
 =?utf-8?B?bGdBSGJTRjh6NGpZMkJ2YjBYOUJESytNamMvWnBVUDd2Q1hCNERJUWpCNVk5?=
 =?utf-8?B?dmFUVkM4UDB4ZXNEVWJQYU14b0FNeEdHTUJlRFZXZFZESU1HcXl1Nmt2cmQw?=
 =?utf-8?B?bm90QVkzTG8wYkdncVhyT0xvSFFJNkFNd2RDVXFMOWxnTC9EMkhsNm1kVVM1?=
 =?utf-8?B?VkR4WDg3VndDWVVsZTd2Lyt2YU1vQ0ZYd3ltUDVJb1R5UThNSm10ZWRaQXFC?=
 =?utf-8?B?NmdwVE1kU1F6MjAzZnRWd0dPRjVDUlRMZkwzL0VMdkhWRUc3Smo5NmpMMmVZ?=
 =?utf-8?B?T25XRzRwVDRGdE81Rk5pa3g0RHp6aG1hNEJrNGMvcFN1Sk8zL2F6TVlSZGtr?=
 =?utf-8?B?bUxxWGpJbGFiSmVlYzdoZ1hweUlSc3FreUw3NDFIMEViODUvWi8zQjFnRXVM?=
 =?utf-8?B?R1RsQkRtQUEyaE5oWnRWb3hxTkt3dVZBSUVQb3Nuc0RkYnRtVDgrZW5qM200?=
 =?utf-8?B?a2ZDRktjK3BzM2s5ZFdjdDRjWDVqM3Y2NGVPdTdDdllZODRNc3JWRXRTdG9I?=
 =?utf-8?B?ZXM3SVhXRXE2dkFBaFFudkRPdzB6Sm05WFdHTmdUcXltTlBKYW4vMkU4TFdR?=
 =?utf-8?B?emxPU1h5WVhuZit0aVpXcUJrQ0lkSzIrOGlyQ1BZOHBtWU01ME1wSjlYN1ZP?=
 =?utf-8?B?cmtmM3d4MERES3JVTk9mQUhXM3ZkZmdnNGpLNGxJeFdQN0xucTNGa0d2cHlH?=
 =?utf-8?B?NUJzSWM2WmZIRDZLQlBpQ1gzdy9BNlpIdEhPMVJwR1NLb0hhbVNSS0hMYWRD?=
 =?utf-8?B?TDZKY0QyRXJQMDJ2S0tyZkh3Q0hBa0xuNzdvZkhvb1ZnL0UxaHlGaHcyWmQw?=
 =?utf-8?B?eGdWR28zZmpsVTljOHI4TFYxcW5MZjZpb0ZmRHdudHRZdzJIRjVtTVpiVFNK?=
 =?utf-8?B?aDllWitacUhNeXJ4bWJzNHVwSDZuellJNGZzS1MyVS9sYkZ2ZnR1MURhUWlG?=
 =?utf-8?B?U3crcTIrZkt1K2pwRURaRzB2bWczNyt0eWhKVzN0VktLTnU1bTFOaTEwS3Jz?=
 =?utf-8?B?VG1KNWlmSkZBWmpPTTFOY2srRFRCZDJFYUhMemQ4bzI1ZmVMY0Y5ck9CMjhE?=
 =?utf-8?B?UTZuejdSVnRjRTMvMW1LZGRiVHRIcHI1WG1iVkd6QlUrdk44NlpLK2x2dmph?=
 =?utf-8?B?WlN2cTk1UUcrenpNS0NEaVNSS0pFUThVdmJlMVMyMjN3bVN5ekxrNW5sUUhH?=
 =?utf-8?B?aXFOck5oR3VFeCtXdS9JNHAycmxFTWNWYTR0ZUQ0NnVsbHhxSnFXSnVRVlJt?=
 =?utf-8?B?SFJ0MWRjK2VnemRXbFVQczNITGRVeEF4eUIvMGc3OFVzVFNpeXg4ald2NWFT?=
 =?utf-8?B?VDVPc1I3NWZrRU5BR01PbjFXSDQySkNxM0xBSjhnS1I0ZzltR2w1bCtIK3hl?=
 =?utf-8?B?UEVaV2xValVqL3VzNXZoMm1lRnY0M2lQaFFWN0N3aGp4OW9qWkNCSVQ3dnRn?=
 =?utf-8?B?VlZYUUxjbjFDLzRTUDFRa29BVlk0QlF2MHl3QW9hN0Qyc1Rlb0E3TnZYTis4?=
 =?utf-8?B?VjBkbzRGQmxBTHVidVRaNEhEN0pwbmtoRXRhYUNidFRNenpKa3oxcTBuVUZS?=
 =?utf-8?B?ZTNWZ25SaFJoMXpuZVhGeW5XQjh2R0NFWXpmTW1mVncxRnhMVGN0K01IOFRz?=
 =?utf-8?B?QVo1RUgyd2lJV1A4OTBpUWJMTmRDekw5cm5xMjFhSDlYTXNrTllsQ0l0Mlp5?=
 =?utf-8?B?QUpPZFJiRzZsRkNPdWg4aTRIMXRralE5TlRvTFBkcjlJUUh4a2puOXNrbm9k?=
 =?utf-8?B?WEN5U0x5MDRyYzkxMEw2dUJFcW9CTnJjM2lZakF2NWxRV1hPandHclQ1SUV6?=
 =?utf-8?B?VmVaMG9PRUEwSnhCNEcrQ1ozR3V4RE02dURqSnBoR2I5cjlVQ1lvd2oyM0xy?=
 =?utf-8?B?N054SGVlYVZwMmVhZ0M1a1FBS0kwWFN1cUJGNVdSRlVHWVd2alZxWncwTmUx?=
 =?utf-8?B?aGVNeUluV3FhR3BXVDAwSmkwT0p6OWwxeXJ6aEVCdU0zOHF5dWhTTXREYlpT?=
 =?utf-8?B?Q0w5b0ZrY09pQTROdGZNV3F3cWlWUDJoMGNIQ2NoNjBoQkRLaDNtUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c750eea-4388-483d-74d1-08de5f4ba69f
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:32:45.8798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHHpUlVd30GzgsJhCNA7HUtONSBPJSEa8LIvjF/WNIELa6cZH0HGHQr/mm7ifPRpPbtYtrajOzTHB+6Z2fQERQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5180
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email,citrix.com:dkim,Mac.lan:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EDCEBB17C9
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 02:10:01PM +0100, Jan Beulich wrote:
> When, during boot, we have already correctly determined availability of
> the MMCFG access method for a given bus range, there's then no need to
> invoke pci_check_extcfg() again for every of the devices. This in
> particular avoids ->ext_cfg to transiently indicate the wrong state.
> 
> Switch to using Xen style on lines being touched and immediately adjacent
> ones.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One suggestion for a further addition below.

> ---
> v3: New.
> 
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -528,6 +528,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>          if ( !ret )
>              ret = pci_segment_iterate(info.segment, physdev_check_pci_extcfg,
>                                        &info);
> +        else if ( ret > 0 ) /* Indication of "no change". */
> +            ret = 0;
>  
>          if ( !ret && has_vpci(currd) && (info.flags & XEN_PCI_MMCFG_RESERVED) )

Maybe it doesn't need to be strictly done here, but now that
pci_mmcfg_reserved() signals whether the MMCFG was already registered,
could you also restrict the register_vpci_mmcfg_handler() call to ret
== 0?

That will also simplify the logic in register_vpci_mmcfg_handler()
since we no longer need to return 0 when the region is already
registered, returning -EEXIST should be fine if the caller is
adjusted.

Thanks, Roger.

