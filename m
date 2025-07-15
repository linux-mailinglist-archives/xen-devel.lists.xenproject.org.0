Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D11B05567
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043851.1413902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbO2-0006Ol-Ec; Tue, 15 Jul 2025 08:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043851.1413902; Tue, 15 Jul 2025 08:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbO2-0006ND-AS; Tue, 15 Jul 2025 08:51:42 +0000
Received: by outflank-mailman (input) for mailman id 1043851;
 Tue, 15 Jul 2025 08:51:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Lhd=Z4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubbO0-00069a-Lt
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:51:40 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20630.outbound.protection.outlook.com
 [2a01:111:f403:2407::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea27d1c1-6158-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 10:51:37 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS5PPF5A66AFD1C.namprd12.prod.outlook.com (2603:10b6:f:fc00::64d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 08:51:33 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 08:51:33 +0000
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
X-Inumbo-ID: ea27d1c1-6158-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYN5fldMLn9O02f3jHspV+pGo+YoWmkwNx0gcZ1OyD2sSjxp0oH7YECx5YWrBsJFd7YSxjkLaFsb0al1zDjeSgYfL+EeIPPBg0t5JSDVPyO5qvblEeJVDoUNb2U4kwF8DuvKeJm8xQzJaqIxq3IDVLEPn66NFJcbUhDB8HBoqRbMPdD2IvhQxp4Y+3JkDeq3FvyMJg+Mpk1aQuVKfKqbyVzv0VvvLE6N0ZVcfT50GmDzNHt7G/hoeLVDijTnYHsxoXUdj/TitlBG40aGRBBht1g/ms67Dgu7A2PtNnaMAqjuHIRF8pInKI/B4Yx3riCIWBpvHmxjuYUkT6pWVllOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JouHg5l+vC6TBVUnpPWY0hEgq8btCFx6GdmvMqdO0o=;
 b=RdyTr0819cxrLPP9UMqj3jnw1WlZtKGgGkK0Q8Dsj9zzTDm05tlrYnFcvFU1nv0BV+OCH8suWU/fE1v8JM/uyujA5Jov3KNSEQXk/Q6+8KQEo91u62OOZG9b8D99fWKrdBZ5Zl+3WZuVPUXNhBTAHsQ0icXhlHIWt4Kfo2yHd+e1vxiAO7+NI7CfsHl+tY6HI/UfA6rT0rlN5+eML2UE0er9oGIhg0xWvg7FuDDBTOO2bqurphvWvwilf/eaKnzSrvsve4N/UEDZSYBSceTS/0z/Wegpf+feau3Pd+48A+YgE1/MEwAsUCoFUaPLN8Rc/ByN3IU1SPmwqMKpwxDx7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JouHg5l+vC6TBVUnpPWY0hEgq8btCFx6GdmvMqdO0o=;
 b=DpTWEzMPA5shMasiLBEXXh1wntRa2/42Fmh5i5WtAs6cDqZVxRuWMu1ErOnddm9un8o1XHyPSaCnwGpO44Gtdqb1MhvdS+82WMOsB02DtisXgkSGXENhL62z6tPQ45FTGXCGhE5rLgaTffyNfnOu9ryR5ybtWRZ1PCsW14AbtdE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b4c058be-148b-414d-9d9c-a00097db6c0d@amd.com>
Date: Tue, 15 Jul 2025 10:51:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm/mpu: Destroy an existing entry in Xen MPU
 memory mapping table
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <cd3a8bdf3e18af688426a83f873654210f449e47.1752565274.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <cd3a8bdf3e18af688426a83f873654210f449e47.1752565274.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS5PPF5A66AFD1C:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e7f371-2ca9-422f-613f-08ddc37ccc8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dSs5YzZOWWlwVFZkbzMwRDRmanhCVjlXR25Na09TQTNKd2pZamxkQlNLcUl3?=
 =?utf-8?B?MDVBQVp5V0dOdEtWdEpyekgyM3NhZXRXUHp5Z0Jxc3RQRUpMemYzdUJoWWlF?=
 =?utf-8?B?c01QRlM5Vm9hc2ZhK1NSY2NIYTJpMklsV0tHV1BjcUxsaDZYWGpkempPVmFn?=
 =?utf-8?B?NG9Mc1NBMkR1R01keUp2YVE0RXVGNEZBSjJoSGkxVmtOd09CcTlrVHpRSzEy?=
 =?utf-8?B?VTlGZnVlclpWbWJDZjdjT2NoM05XMm4wMk1LYytmQ28yVWJXMUJnd3BFR0lF?=
 =?utf-8?B?VXRwOVYrZHNSdmlaZXp4MXBsOWRad2FoOWNSbDZHazQ4T0ovMHUwYTY4ODdw?=
 =?utf-8?B?Y0Z6cFhaNkJKQWNmK2F1b0FkMzY3ZnROL2RWZnk5KzZVUlBtUFdMcmFiS01u?=
 =?utf-8?B?eU9PWWl5Mmk2WjlCdTMrdEd3QmJKN2I2SUwrYmxqOWJrUkFnWWVML3IxQzVM?=
 =?utf-8?B?d3g0VVo0MVlKU1duOXlXUjZsMHFuUzlNRHpQbHNaZmt3TktkbUsrRU9QbEtx?=
 =?utf-8?B?TG5DWHY2RDlDQU51ZEg3eWprZDhZZTJlYURoSEdpTURnRHF5eTZkb1FuNGZN?=
 =?utf-8?B?UlZ4ZTc5RmE3Z2xyY2lwTlJIdmFsVkplMW9nZkc4V0FQZ1h6Rk5WNnJ2Vm5u?=
 =?utf-8?B?dW5VVjJwY3phaWx3SXJIaUxpT2RoUnErT29HS3FoRFY5akVPUkwwWXZvL28r?=
 =?utf-8?B?bEZGRlpFa3B2RmcvNEdzVGE2c091TlZRYlR1OE1sYXFXdmVVNEh1VTdWbmtG?=
 =?utf-8?B?QUZSOUZEQlpuOWpPTlVmYjZQUko5NDcycjRwZUg3OHFaL1BXbWZEbGdsNVIz?=
 =?utf-8?B?RzdOMllmWjMxK3gyYlVkSy9Yd1VQRVZCa0ZsZlRUU210UDBRNlZIeWxyMzBi?=
 =?utf-8?B?OC8vS3pvQ3lTSTlWb0lyaUxtTWxaOHA2SWxEWXhlRjhCeXkzTGlTQXBsdkEw?=
 =?utf-8?B?SGkxVTdxQ2NPQWZLTWZqa3VMVjZiL2w2Q1NrSWdmUU1pcm1zbG91L0tBdmhS?=
 =?utf-8?B?MFM2NzN5MVRhWHRPaWh2WlpVV0NjWlZ1WlhpaW1zeXhxSyswclBIZzRKUDdC?=
 =?utf-8?B?VWVoQTV0dmo5TzRmVnNWUlVHRVVDMkFRSmd2bzBld0JrY2xlOUxrSCt5VlVy?=
 =?utf-8?B?dWc3VDdxN1dwN0dHOVNQTTFMbWliZC9vYkdldy8vckQ4a1VYQUo0dU9nRis1?=
 =?utf-8?B?ZUk3bzdlRFZiUUthRlUvclpWbnk2bHh5RVVzWkdrSkhiWERBczV0S051NVhR?=
 =?utf-8?B?UFQ2VmJrcWJDRkxxL0Jxd1ZLYWxqWVJTYmNXZEU5RjhDTGZjT2VCKzA1T2Nl?=
 =?utf-8?B?UjJtNXpuMkpnaXkvU05VQzFwMnFTQlV1SGtUNDhNcisvN2U5Mk5ucVJIV2l4?=
 =?utf-8?B?dzhaVklXY0pndHZnNFVHQVB3UzRBdVZ4aktyZ1ZMM21NRDVDRXlrNzhobGhY?=
 =?utf-8?B?cHVqdnc4Z2NIS3loRGFDWFFOZ0hZeXpSeDhiK0NwNjVrT2tkM1NZbTdCdzY0?=
 =?utf-8?B?VDM3d083NDlzcm9tV3BGOWg4M3RuWkFqNzBIMTEySHdvTm14VmtIWWxLRFI4?=
 =?utf-8?B?Q2VxRXJXRVVSeWhyT1g5R0Y1VnVOOXVMWDYrZ2xYQ1hzbHUyL3JYamlGb3pl?=
 =?utf-8?B?bWtoMENCUzU4cG9ON3VVRTlPM3JJNWVGNU5kNG5PWnNMZ21uTG1ubUF2VUVL?=
 =?utf-8?B?Zk5ieTVQRXBvZWFVRHYwQWdITllkWjBQb0E3SDRGVGluanozU1g4QUFJVytD?=
 =?utf-8?B?dXU1Q2VMd3ZIWGZDMEtPc2Qra1kwUGZjVnZpWjZhSHBRN3lzK0FQNlgzSEU3?=
 =?utf-8?B?SEYzbHYvTzVUM3B4b2txVFdPS3dsL2c2L3NSQUhmQ3pBY2NEcU1sYUNCcEc2?=
 =?utf-8?B?MzZVc21Jb1E3bEVpZlFLTko4NXBtZ1E0WFFuYkVtNWZQM2RyZWJOQzhibWE5?=
 =?utf-8?Q?/Q6URD733AM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1ZYS2N4ZGdWZzJqVkh1U1ovUXJlTUR6NFcxQWtla2tJcldSRVd6WVlFWVE2?=
 =?utf-8?B?VHpWRkQ5eXIrOUliNU0wS3ZuNkpnZmNUbDlKcHp2V0c2NXV0MzdDS05JNHB2?=
 =?utf-8?B?cWc4TjljSEVsUnhEQnRuL25Nb2h2RVBaemJzeVdDeW1SNThMYWlIY3F3MEZy?=
 =?utf-8?B?VWNTbUdIcWtiYU8xcFNuTGdNYUNOZE5HbGpzWFA0VFF1MkRxRjhwSUVGa2tF?=
 =?utf-8?B?Wi9ncXVtWkp6dGt3RVQ0MGxNK3owNmN0djJzWHlybnlhS0x6QlZ6V3UxOUtI?=
 =?utf-8?B?TkhCSVhtUUVnOE9lNUVGdnU2dDdkZ3BIRThNakE5K2k0TzdmczRjVEVRd3lE?=
 =?utf-8?B?VTdueERQOWVndVVRUk0wbHd4R0hKcVRlcUd3dU5ORktwNWxjSHVQemhNTXpS?=
 =?utf-8?B?N3Nnd1NtdGJ1RGpJa2JCalorRzZzczdBT3BEUmhJd00yVmMyV0lkK2IwQ3Fp?=
 =?utf-8?B?MmJFdXNSQUR6elRSdUJQdDh6RjZqdmRSZzhKWCs5bFAwNVJ0YmpXelZjUHJZ?=
 =?utf-8?B?WVdDdEpyMkJUUjA2UXdrZ1FQcHB3R1RRT0xOSGNmRWtRUUExeW9JTjE3c1Bt?=
 =?utf-8?B?bjNoRkg3bzNneGYzODFKaVhibUlBcVdtelBuckpvakFvU05MSlRCdnl3N1l0?=
 =?utf-8?B?QUhsSW1IY0dwekxFZmZORnB5bWgzY3ZlUi80TmpRL0FEZE8ySTNMbVZubmUv?=
 =?utf-8?B?MnZ4YTc0SnEvVnBDTXltWkpCVkp2RDVLSTlFWU5hV1QvbFBnSmF0NVBwekov?=
 =?utf-8?B?R1NpNTdUNnQxTnpGK2YzU3RpTmFTaWhNMm1jNXJwYUlEMEVZcUo3b0NMV1FH?=
 =?utf-8?B?aWUrcjRoNWpYN1dKc2ZPTk5BOVkzSXRWZFBMMW14VnVHdDZxd0NhOVowM3Rh?=
 =?utf-8?B?S3NMVUFRYVNXMkp5V3FKaW13KzhTWWludjNMVjUzTDJQNWg3WUIyZFUyUDdN?=
 =?utf-8?B?aGpJMHgxL3BUMGkyR0RGN2xlakR5TEYxcDR3Wm5YVGY4VENGVk9jVHMrMTkz?=
 =?utf-8?B?dVBKS2hMVWhrY0s0aE5LOUR1Qy9BQmVraFNaeTIxRTZtUTdwMVVKR1VNQnhs?=
 =?utf-8?B?S25DRkl2THV1bHpXbERrUWdJUWNackZ0TGlGT2dRd2VrUHpFUjJwNnVSRCtW?=
 =?utf-8?B?M1Bic0xUcklYVVA4dUNBV0R3a1NidUZIdjVoTE1nWmw4NzdBL3NWL21obzl3?=
 =?utf-8?B?em0zeEc3b2p0eTNkVFpEN1JhUUwvRGVqNUFLWm1ybkl6UDNqc3VVZGhrMFhi?=
 =?utf-8?B?Umk2Skk0KzJqc0VYYWJwWWlOR3VPR3NxUWUydVE1OHhwTlNRc0RjWTVDMHRX?=
 =?utf-8?B?RjI5TjZzUGFybmFXbndjQmVkMWI1UmlZekFTYjFzZFZCTWQzYkVyck9rNnpB?=
 =?utf-8?B?eTVYaVZIQ1ZwM2trYVFKN1MxczhYSmRyK0lsbThMTytaOGQwU3hUeWpiU2dK?=
 =?utf-8?B?cmdBZDBVeEk3aHZxNmhmaXh0Tzl1bWdFZndQaExlWUhwMkJWR1NWdllqRnJx?=
 =?utf-8?B?Slo1WmdMOVU1djBsM21BT1dEaG04WHpvYW5ER2Y2S29NOHc4Q0ROMndPc3I4?=
 =?utf-8?B?RkdjVlZ0clBDdkdWY0FwVnV2OW5HOU9DNzV3QnM3YVdKOEhtT1pITTJRUTRx?=
 =?utf-8?B?WVVPNzUrb3cyRnNSZCtYaWlGN1BBYkFiMWYrSHBjRmwrNDlxMW9aZ08vSENp?=
 =?utf-8?B?Ynpzdk8vc3ZTUHhVUU5JYXR1MlRkY1FvakprVlVFYTR0NXBnSm5XWUlzRkdq?=
 =?utf-8?B?OGJaT2Z0TmxWMUVDczFycFdyMDlvWjZ2UlVIMlNMcWtNNnVEV25NSlBaOXA5?=
 =?utf-8?B?WHJFUDRUZ3BVYi9zQThnMEJqcmptU25XM1Y4aHVMbUZzSXYrZ0ovQ3ZDV0Mr?=
 =?utf-8?B?U1FSeVg4VGJibXhSSUVuVVdkL3hrTlJwV1Y1Z1NYTTZXWGpFVk9FbmJVTmpM?=
 =?utf-8?B?VjJqL2ZmbE4xQiszS1VMREdIdW1Qa2hwdlBpQlZJZGMwVEdKUDNrK1lhMnJp?=
 =?utf-8?B?bU5tL3dKYkx1ZE53ZWV3dFEwTzVPRk5iUnpCNk9hNFZibG83OVVMajlITlNy?=
 =?utf-8?B?b3RMUlZjS2hNWkl2R0RvckZLYS9YRWNxZUx4TElDdlZoME9Gc3E2WWhyOGlL?=
 =?utf-8?Q?X0aoTCh1YvKaUyi7TQIvHgP/w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e7f371-2ca9-422f-613f-08ddc37ccc8d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 08:51:33.4468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LX96F9cmB0Sj0ElZKGsDNKNymjiMrIog3LbcL7MW2olonmg3xr9hlRscANw2/Ijl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5A66AFD1C



On 15/07/2025 09:45, Hari Limaye wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> This commit expands xen_mpumap_update/xen_mpumap_update_entry to include
> destroying an existing entry.
> 
> We define a new helper "disable_mpu_region_from_index" to disable the MPU
> region based on index. If region is within [0, 31], we could quickly
> disable the MPU region through PRENR_EL2 which provides direct access to the
> PRLAR_EL2.EN bits of EL2 MPU regions.
> 
> Rignt now, we only support destroying a *WHOLE* MPU memory region,
> part-region removing is not supported, as in worst case, it will
> leave two fragments behind.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
> Changes from v1:
> - Move check for part-region removal outside if condition
> - Use normal printk
> 
> Changes from v2:
> - Fix assert from `ASSERT(s <= e)` -> `ASSERT(s < e)`
> - Remove call to context_sync_mpu
> - Use register_t
> - Improve sanity checking to catch modification & removing non-existent
>   entries
> - Update check for MPUMAP_REGION_INCLUSIVE to be generic
> ---
>  xen/arch/arm/include/asm/mpu.h        |  2 +
>  xen/arch/arm/include/asm/mpu/cpregs.h |  4 ++
>  xen/arch/arm/mpu/mm.c                 | 92 ++++++++++++++++++++++++---
>  3 files changed, 89 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 63560c613b..5053edaf63 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -23,6 +23,8 @@
>  #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>  #define MAX_MPU_REGION_NR       NUM_MPU_REGIONS_MASK
>  
> +#define PRENR_MASK  GENMASK(31, 0)
> +
>  #ifndef __ASSEMBLY__
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> index bb15e02df6..9f3b32acd7 100644
> --- a/xen/arch/arm/include/asm/mpu/cpregs.h
> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
> @@ -6,6 +6,9 @@
>  /* CP15 CR0: MPU Type Register */
>  #define HMPUIR          p15,4,c0,c0,4
>  
> +/* CP15 CR6: Protection Region Enable Register */
> +#define HPRENR          p15,4,c6,c1,1
> +
>  /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
>  #define HPRSELR         p15,4,c6,c2,1
>  #define HPRBAR          p15,4,c6,c3,0
> @@ -82,6 +85,7 @@
>  /* Alphabetically... */
>  #define MPUIR_EL2       HMPUIR
>  #define PRBAR_EL2       HPRBAR
> +#define PRENR_EL2       HPRENR
>  #define PRLAR_EL2       HPRLAR
>  #define PRSELR_EL2      HPRSELR
>  #endif /* CONFIG_ARM_32 */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index d5426525af..a5b1c95793 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -189,6 +189,42 @@ static int xen_mpumap_alloc_entry(uint8_t *idx)
>      return 0;
>  }
>  
> +/*
> + * Disable and remove an MPU region from the data structure and MPU registers.
> + *
> + * @param index Index of the MPU region to be disabled.
> + */
> +static void disable_mpu_region_from_index(uint8_t index)
> +{
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +    ASSERT(index != INVALID_REGION_IDX);
> +
> +    if ( !region_is_valid(&xen_mpumap[index]) )
> +    {
> +        printk(XENLOG_WARNING
> +               "mpu: MPU memory region[%u] is already disabled\n", index);
> +        return;
> +    }
> +
> +    /* Zeroing the region will also zero the region enable */
> +    memset(&xen_mpumap[index], 0, sizeof(pr_t));
> +    clear_bit(index, xen_mpumap_mask);
> +
> +    /*
> +     * Both Armv8-R AArch64 and AArch32 have direct access to the enable bit for
> +     * MPU regions numbered from 0 to 31.
> +     */
> +    if ( (index & PRENR_MASK) != 0 )
> +    {
> +        /* Clear respective bit */
> +        register_t val = READ_SYSREG(PRENR_EL2) & (~(1UL << index));
> +
> +        WRITE_SYSREG(val, PRENR_EL2);
> +    }
> +    else
> +        write_protection_region(&xen_mpumap[index], index);
> +}
> +
>  /*
>   * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
>   * given memory range and flags, creating one if none exists.
> @@ -206,22 +242,51 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>  
>      ASSERT(spin_is_locked(&xen_mpumap_lock));
>  
> -    /* Currently only region creation is supported. */
> -    if ( !(flags & _PAGE_PRESENT) )
> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, base, limit, &idx);
> +    if ( rc < 0 )
>          return -EINVAL;
>  
> -    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, base, limit, &idx);
> -    if ( rc != MPUMAP_REGION_NOTFOUND )
> +    /*
> +     * Currently, we only support removing/modifying a *WHOLE* MPU memory
> +     * region. Part-region removal/modification is not supported as in the worst
> +     * case it will leave two/three fragments behind.
> +     */
> +    if ( rc == MPUMAP_REGION_INCLUSIVE )
> +    {
> +        printk("mpu: part-region removal/modification is not supported\n");
>          return -EINVAL;
> +    }
> +
> +    /* Currently we don't support modifying an existing entry. */
> +    if ( (flags & _PAGE_PRESENT) && (rc >= MPUMAP_REGION_FOUND) )
This check should be above ( rc == MPUMAP_REGION_INCLUSIVE ). Otherwise you
might end up printing a message about removal in modifying case.

> +    {
> +        printk("mpu: modifying an existing entry is not supported\n");
> +        return -EINVAL;
> +    }
>  
>      /* We are inserting a mapping => Create new region. */
> -    rc = xen_mpumap_alloc_entry(&idx);
> -    if ( rc )
> -        return -ENOENT;
> +    if ( (flags & _PAGE_PRESENT) && (MPUMAP_REGION_NOTFOUND == rc) )
You check for flags & _PAGE_PRESENT 3 times. I suggest to add a bool variable at
the top storing this result for better readability.

> +    {
> +        rc = xen_mpumap_alloc_entry(&idx);
> +        if ( rc )
> +            return -ENOENT;
>  
> -    xen_mpumap[idx] = pr_of_addr(base, limit, flags);
> +        xen_mpumap[idx] = pr_of_addr(base, limit, flags);
>  
> -    write_protection_region(&xen_mpumap[idx], idx);
> +        write_protection_region(&xen_mpumap[idx], idx);
> +    }
> +
> +    /* Removing a mapping */
> +    if ( !(flags & _PAGE_PRESENT) )
> +    {
> +        if ( rc == MPUMAP_REGION_NOTFOUND )
> +        {
> +            printk("mpu: cannot remove an entry that does not exist\n");
> +            return -EINVAL;
> +        }
> +
> +        disable_mpu_region_from_index(idx);
> +    }
>  
>      return 0;
>  }
> @@ -261,6 +326,15 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
>      return rc;
>  }
>  
> +int destroy_xen_mappings(unsigned long s, unsigned long e)
> +{
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
> +    ASSERT(s < e);
> +
> +    return xen_mpumap_update(virt_to_maddr(s), virt_to_maddr(e), 0);
If virt == madr on MPU, why do you need conversion?

~Michal


