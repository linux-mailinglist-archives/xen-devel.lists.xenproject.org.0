Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E72C47A43
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 16:49:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158518.1486859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIU8v-0005F1-T0; Mon, 10 Nov 2025 15:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158518.1486859; Mon, 10 Nov 2025 15:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIU8v-0005Cg-Pq; Mon, 10 Nov 2025 15:49:21 +0000
Received: by outflank-mailman (input) for mailman id 1158518;
 Mon, 10 Nov 2025 15:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7fAs=5S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vIU8u-0005Ca-U7
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 15:49:20 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d16032ab-be4c-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 16:49:19 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 BL1PR03MB5959.namprd03.prod.outlook.com (2603:10b6:208:31a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Mon, 10 Nov 2025 15:49:15 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 15:49:15 +0000
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
X-Inumbo-ID: d16032ab-be4c-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlJtHKxBCE8hg7J4cdIThyY6htL2BzmP1ZRTEHObWCKncjQMHWLtXBteGHLZpWvQMTqgFakT/Cc/xPLjqW3nOwYU66EmxYzW5RCUCGwB2U9k73jyARVgPnGGEP107DlTF9m5oss6TGNXG6zX8lW4e3hwZB1wewQf5SdQwFIOQwJDXeICX/yBO14opYQw8x7DYhNUW2BzbIdgw8u+0kV84+dWZ+hpZUKhpVIxrM5apoqz/B3jA3TkpJqJUukTLtTJtAMlQH2/mGWgtG1BzKbzzxiwMypLFV3TG9J7fVOHskIuiGLTdfS6llxdSdMwh3xvhQTd1mVeJPCejws5fZNXYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atyCoqZBbcgHr6/1iIcTBUwS1SAKosiw0NtG+XfMZhk=;
 b=SUdEOXNE4eX4OIYAoZ3sEB6QaVeZv43C/OEx63KCW4vz5cmU449WKMF7PaySPHVE6yS3wBn0+JIeVYGcaAWDgZXwJNv4g67dODqGj277UWf9rK6bJ+PYZxZn6z8msG108wAorBsYzqCo2VOSFIkg3sGvxo5IadX9muUMBHPxAFYE0Zib0gPQRW0rpbEH/JJoWEyQLjJc8YsoZxO7Go2bOHqoBJJdQC45aDZ1A9Yi1CAs2Tp1UizmOQIhIVm6oRkhjfOlz1FYS7iBc2JItR9ShuLeA9vT7zY5hKtGQpbE5lHa9J3+udCrh7ftu5RldKGrqS4r/rnbxMTsI5GEvbsXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atyCoqZBbcgHr6/1iIcTBUwS1SAKosiw0NtG+XfMZhk=;
 b=kMd11bOw8nPpw9rNmgdhhXYTwm7F/eU1mf/Pp2Efoj3qfhGyGEOyB457jWhfXkpP1wbmlJk/4svgtIF4zIhVH6u3Gabes3zHvf61vVJKJe4pdEYMek6EezHoBplVo5IKqi/d0QU+ek/b46KcFq9o0YbfUUTvQeiTbJByEH6gDj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <456a6e0e-e722-4b19-b2f7-ab9b58419063@citrix.com>
Date: Mon, 10 Nov 2025 15:49:10 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.20.2
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <0aa341eb-5662-487a-a9f6-713932d2f6ca@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0aa341eb-5662-487a-a9f6-713932d2f6ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0557.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::13) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|BL1PR03MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d518e5b-77c2-4492-9d9b-08de2070b2e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGw1UmlVeE55MndPZnFvK2oybnV5bGw3NkpDSXF1bHhhc2NIYXhmdm9Vckxw?=
 =?utf-8?B?cnd4TUZOUHNtc1k1Q083UGIwWHV2ZC9PZDFDSHRQckFBeWV1YzNhZkl1YmUr?=
 =?utf-8?B?ZHpSNXROUy9BNndDaFQwUE1WTlB0ZGVqcVBKQVBmZkQ1eXNvOUdobExFTjlY?=
 =?utf-8?B?cnFaek9IQlNrNE0zYXlZLzdzVlV5cU1NMVMyNFBqbWk3RWF5ZWNGczFVeDRp?=
 =?utf-8?B?aGNCbXRpKzNQK2J1bXZFQ0JVS04wNmtiTTZlSGJzOHFEcTZQWmUwRXpsc2sx?=
 =?utf-8?B?dVprSG8vSS9xaDVqb2dlUkVydmZRUm4zdXZrSU13MWpNSEYwVUxNVzhLZzZQ?=
 =?utf-8?B?VFVPdnlaK0dBdHZFbWVvNXFDcERxdjdJd0ZBWCt4RkgvU21XRnNtOUZWMEc4?=
 =?utf-8?B?UnVvOWdhWDNuTHFaSGF0c2JFWjZwbkZDMWg4WEI5TzJLRVZpeXI3K3RGTlZv?=
 =?utf-8?B?UzVwRk5JN0JBQzhIK3FYTnRFUlQ0dlZEQXBub1BiaHAyZ1ZsU3RSNUN1SVVU?=
 =?utf-8?B?T0dxK0NiQXNiZXhacGdKSkFOT1pmTkF3dFY3NEZxdzYvYlMxTXo0VUNhWXMz?=
 =?utf-8?B?dk5ESEs4cFNwWlI1Vmp0bExDVThzbDhBcnNTQ0I2Z0NxNzVXdzRkMkczTzVJ?=
 =?utf-8?B?dm9qWnpQVDNYTzJzWlA4b0JTSEk2bGFnNXdaTkFXT2Z5aHRhajBCc1poU2ph?=
 =?utf-8?B?NUYxNk1sRG1RTHpaTFNkR0VQaU8xcEV1M2NzbzNsemhTV1ZFNGdXV3VZS0dv?=
 =?utf-8?B?b2F1TnVBc2NPbDhZZmpuUmw4WW5jQm8vY096K3hLbXFQS2F6bnFEWHc2V0RJ?=
 =?utf-8?B?SDVzNFdZLzJyS1pQSVFYYUU1VXNHSlozQzkvZC9YSWRrcTJwWjgyTmxIMk1T?=
 =?utf-8?B?RzJTenBMbmhhM2YrYWw5Z1dUT3N1YmRFN0JBc0IrT2h5QzR2bmZtUjljMDRD?=
 =?utf-8?B?aGR5RzNkQ0pubjRBc3Ird214dHQwbnVENExCV3Z5cHJWSzBYQVhTTTZOeEtY?=
 =?utf-8?B?SGxsZTZMMUJ1aFdSc2Y5QkxuakQ5L1RFa05DNkZJVXNhTGFVUlQ3RGd1eUts?=
 =?utf-8?B?YlNsZ0s5UCtiVnpZVFI2NXowSHJ4OUxnZGRUdEpONzJzV0hVSHZScjJMN3Bi?=
 =?utf-8?B?TVNwSVN3byt3ODI1SExFQXRRcThCZFcvZTBXSnJWRnZRMG1hTS8yWURodGI3?=
 =?utf-8?B?cXU4SW1CQVM4NXprRlhVblBKYU5zRHVHY2JpL2JaUzNnNWxLV0VSWG9OOTh0?=
 =?utf-8?B?VHphK1dWQ2VKZzhPeURrRitleGVZRDYzRldvY0cyaXEzd2pnT1FaaWZPakl6?=
 =?utf-8?B?OHlFWm5DZGdtY0RKVTkzRHBTcW5naUxpRmN5MG05d3MrVWdxaGcrYjN2Vks0?=
 =?utf-8?B?VG9CYTZud0tvTndnWktXRStWVU9MVE9ONmFhNlhJTklnUmpDU2txV1krR3ZL?=
 =?utf-8?B?MlpMZFZLOTVEdWZEbVpLakg3YzBZalhUL1VHL2lGa2puNklBSWJmUExOeEpw?=
 =?utf-8?B?S0xVaDRiZitJeHJ0V2I0L21YV2t0enptQmdKUzJDSEoxQS9zRHRQYmN2U2Mv?=
 =?utf-8?B?TE9SNUZVdC9QZWQ3WXhZVmpWRVYrTTJKMEhpSHhuTjNIayt3NnkrcTZBTzBT?=
 =?utf-8?B?MXZENFUvcU5BUEJXR3lCY29LV3E0bVQxVWRUVTh0MjBGdWxSRGttUEhMc09G?=
 =?utf-8?B?dElRRXVJMUoyQktHZlB6NjE4ZGYxazZiNGFmMVJJdEs1RXEwR1crTEJYY0Rl?=
 =?utf-8?B?NEd2ckQvZWJhUnFrNEtxamhIelM1NGVvbWNGeGVHZEZ6bk9FVndja3Yyb3li?=
 =?utf-8?B?Ym83aXEzUENHMUVnT2hXcWt1RTBvdSs2WHgvMGQ2a3pxT2g1RnU5MkEwb2R1?=
 =?utf-8?B?eW56R1EzNC9zRFJpZUNsV3dQeXNxNFRWTENNK3pIL0ZUN2UrNDVlZll6QkpY?=
 =?utf-8?Q?sWaBDXfqAs1ThG1Rt9YRTzIUfIgJU4X6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjRtSjRGWnhZMTVRMnpLSklOQ2V4RDAzTlRvMWJPSDlFTW42d0FaSGRVMzUz?=
 =?utf-8?B?L1U1WHpYMC9yTWdEbXJaMGFPSk5kUHN2RTlhTTg2RzhuNDBRRzZ4b3BwUDlu?=
 =?utf-8?B?eGhGb2dzWTVWenZCMmtzOVZwNzdZdk1yek44VE5JRjZvZ3V5dWJBSktlQmp0?=
 =?utf-8?B?STM0ZGxTUFBmWkN6TCsyYVNNN0orYjQwVEh2WmN6TElzY24xMWZkZC9ER29x?=
 =?utf-8?B?aWlNaTRIamNmaVA2Nm9jbnV2M2l0c0YyNnZrbU9JT1kyTFVTNUtDbWtDcHFr?=
 =?utf-8?B?a25VTUtUdHhFZ2NCaE55L1RuSC9JYkNmc21yek14c2hGUmRBK1JRdXA5OG01?=
 =?utf-8?B?dkRhT2FId3EyRENVYnVRUzdiQkMvVXBVWHp5WVpKNU9xeWNoZDNlQU5HYjhJ?=
 =?utf-8?B?WlJKRWYwdVlxbFpRdmlnUmlGdVliV1NMb0l0L1BOYS8zdzBOREJOYnE4QkRH?=
 =?utf-8?B?ekZrMUQ5OFMwV3RwS1ltUjFZSHc1VlR6TmV5T1dHQ1RvTVpReStNOVR0V2Z6?=
 =?utf-8?B?QTVRaDMrZTRjaUduYmkyaWlDZ0txYWg2VWVYWVM3aW1EVDFhQXliZXlCcnVl?=
 =?utf-8?B?NzRucVhDWjBlYmdwU08vSUl5OVJLR2VXSW8wUUgySlA3dWF6cTlQMHBVYlVH?=
 =?utf-8?B?WGNOTEM5YWd3WDVCNmY4d3VLdkQvTEpMd29zeGJpeXV2ejF5VkY4Q1djYUYw?=
 =?utf-8?B?MmsvWjZGQlFMNkZhbTZJRmxrc0dwemh1QjZ0cGk1RTh5SFFKN0VhKzl1MjJr?=
 =?utf-8?B?YUUrVER3Y1Nia0M4ZlNpV2VlUDc2QTJyc3poMXJ6MFdTWDJPNEF6U0hFUmFi?=
 =?utf-8?B?Y1RoNFQxUGd5REFVbHJJNEJrd1pZTGJSVVQxeWdxMlBjMUprMUFGaFpUN0h6?=
 =?utf-8?B?SVJ4cEluYjhLWEh5a2JuV2VlSklDclM3ZFBDaGJaWnYyRm95SDRSU1FiKysr?=
 =?utf-8?B?Q3IxeENKU0NZWlp0UWhqM1RRTGFPTkQyUVVHZkRPRmFmSnlaQ3dBRTNQRDRJ?=
 =?utf-8?B?eXEveHFxYnJIQzJvTzhuT085UnRQbEpHc3lvQmxPcXI4eFJpck1DMVhhQzVF?=
 =?utf-8?B?NUU1NWVKZkp0eEJIaTFoVlc3ZUVBYW1idmZLTExRWUdzZTY0Q2V2R0w1Sk43?=
 =?utf-8?B?eFNoa2x1c3FUeXllU3hGTi84SUJoMEQ5Z3BuQWo3ZXM1N3lIVXptN0FsdjEw?=
 =?utf-8?B?NFE0M3V4alUrMzRBZEJUMDlkM0l4QW40ejF5TGgxKzNpcDFTdXpUbGVvOXZm?=
 =?utf-8?B?T2NJTEhkNEtnVzVxUnVWMjIwVnM0WFJka1ZjTXREL3ZWc3hBUFpsZzFwMWRr?=
 =?utf-8?B?NVhKZXVkU1JsWTk0LzVnZEdRM2Y5Vm5JR1cxdC9NZnkyQktUdno5QjZQSUJS?=
 =?utf-8?B?bkpieHM0dzdpTmtPRWgwdnJGSGs1WnJwMTZiMVQ4enpkUjNUMDlUS0RDWWs1?=
 =?utf-8?B?bWhWaUJsRng5ZUlxS2kyajJldTdVZDBqbTZCOVp5bk95MXZoQkxrakJKTHpX?=
 =?utf-8?B?UXA5ZDBUUlYra2E5Vlh2ei95SzFDRWxtVzNWd0JTWkU4R3owV2c5SFllYlhV?=
 =?utf-8?B?UlFmeXJDc3NoTmhpQWMwa2N3dkxEMlNnNkZiY01raTZqS3JGdGtrUExOVndi?=
 =?utf-8?B?WnNUeFZYVXE3R2VOZ2hKYUVjQ1pWb0w3ZUFQYWs4bnQvelpxSG9uYUd5b2Qz?=
 =?utf-8?B?aU9SNXRvMzRyOXpnQUk5Vk1PUlhUM0dqMUFWU2JLek9VRnlKQytUUXpCV3JP?=
 =?utf-8?B?MHJ5REpRSVN1SDFRSlZPN2VrUHZ4NzFTTm5zODNDNXpuRi92NlBZVnhjQlhp?=
 =?utf-8?B?a2F0TmlmVUdRdExsd0l0M1phelR6anJiTm5waHljMjB3Wld4SncxUk5vRWJD?=
 =?utf-8?B?bFg1Y2VaZDlVM3NFbVpCNlUxalNqTSsvY0k5OGt2UCtiUTFEOEE2RnN1UEs1?=
 =?utf-8?B?blRwNmVya1lXR2JlWGVveERreWo5Wkt0UWpmMm5FUmdTWk9SWGdla1BiWUJv?=
 =?utf-8?B?SDY3SlJPWXV2UGV4MU4zZEZWZ1B6S1A4Q2ZrMUVHUVVrZFVSWEpZVC9YQmVB?=
 =?utf-8?B?QlAyM28xbysxeEl0ZW11b2RtVmZ5eXorbHkrbUlzOGF1SmdJS0Q4OWx6OEN1?=
 =?utf-8?B?VDROK2tNVWZNM0ZPTjZqQmQxWnJMMDQ4N1hGdlRQYmNlb0FSekwzZU9sNFRQ?=
 =?utf-8?B?dFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d518e5b-77c2-4492-9d9b-08de2070b2e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 15:49:14.9084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJq8jyuFgRHm/bquefRBwmX1NxEgB3yRsq8QyDLkAeheK8JemwLq+wWwFQf1XUcPXoKG9QtmRGartg0a1WYuTVtTyXYe2eg1xy4ZCEl00ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5959

On 10/11/2025 3:08 pm, Jan Beulich wrote:
> All,
>
> the release would have been due over the weekend; it slipped my attention. Please
> point out backports you find missing from the respective staging branch, but which
> you consider relevant.

Looking at the XS patchqueue, the only obvious one is:

b7838d12bd1a - tools/libxc: fix xc_physdev_map_pirq_msi() with PCI segments != 0


We did also backport migration superpages (50baf2d9f7bb) but I suspect
that's too much of a new feature for your liking.

~Andrew

