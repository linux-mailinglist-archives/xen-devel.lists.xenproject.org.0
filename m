Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE74593DD02
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2024 04:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765821.1176470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXWqX-0003Ky-21; Sat, 27 Jul 2024 02:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765821.1176470; Sat, 27 Jul 2024 02:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXWqW-0003Ix-V7; Sat, 27 Jul 2024 02:07:44 +0000
Received: by outflank-mailman (input) for mailman id 765821;
 Sat, 27 Jul 2024 02:07:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9te9=O3=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sXWqV-0003Ir-Oi
 for xen-devel@lists.xenproject.org; Sat, 27 Jul 2024 02:07:43 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2414::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00b48e0c-4bbd-11ef-bc00-fd08da9f4363;
 Sat, 27 Jul 2024 04:07:42 +0200 (CEST)
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 by IA1PR12MB6185.namprd12.prod.outlook.com (2603:10b6:208:3e7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Sat, 27 Jul
 2024 02:07:37 +0000
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a]) by SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a%5]) with mapi id 15.20.7784.020; Sat, 27 Jul 2024
 02:07:36 +0000
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
X-Inumbo-ID: 00b48e0c-4bbd-11ef-bc00-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtfyoHKr0DH35EWVjVJhWNNHu4GVnsIN628ry/egsLPdJvod0gnpsr1TdG9VCUxJ0SYXCOWMNR3crCcV/C+3sGMs5+1O8rvSYsFpxopw8tpIxarkXd9QewVf4Vd1Mow4El+S7zUE2AQcpvqC2mCcfjbqxsy+ja8IUum7ctkVU03q3RFZKSCFYJoC6G2BL2zKcbDxTL/TXr6LULU8c8w6WJ/6s4IXuj28GI9gkhGByq36h7un4HyKBkiOaVcEmn4XF6/fYD7hwBMlv658aWWIvxZhX6nrH6n7Vwvn5SRDIUDCw8eq259mPIaLzL16xOF03kYIMH+9VYD/elmIptZKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Hu6SPjyd7uFwhIOol54HgCu7zWoa372Rm4gqf/f0hk=;
 b=p1MnsYkGbve/hamrL3hIr4fWyTATupO/In39O54GLOzO4egqpzL7EFLQIQQjhUGp+elvWfLNFmPHlE2hC+2VwmZvDsplwunfDmaHTxroqhv6OZwNfAT0gcsEFfpbi6hmri5H+hMY0oIHNyLrNQt/SLU70x9oO61j5xGguuhJpZR3ijZuzeT+zzjqpHOmqFgJSgzzabiKtNk8KGkCfXR/76AUtnDr4JvGvtB8Cu3Dtcya6eTjzKmy/D6m5k1CIG8MpkN0G6qwGiGYtumx0+fNqzVx3HjiRNb8e0sVJBhi2Dj0nRzHJ6z/8cDSU/kmlz6vSlekxmrL6tG3hbs+NdHJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Hu6SPjyd7uFwhIOol54HgCu7zWoa372Rm4gqf/f0hk=;
 b=GMJOqFbkUO4mSGlJrXwjmOapAw6QkGnQlvsCPGlsb7MKnZIolrmVvNLH5QTeGQWuQY7anLwVeZX9x4fTRsYsba0U6SwAXZga5cOhZ1oHhWg6lIcXytV1O+5DVIE+M+nZilDCBjAIbUpb91arI9Duguab2oWT6N1AkJru61AoJtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b5764e91-a88f-4ddd-932a-b5955d26aa93@amd.com>
Date: Fri, 26 Jul 2024 19:07:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] automation: add x86_64 xilinx smoke test
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>
References: <9c065e301bf1f00c218def202f4685b83083e1a1.1722044804.git.victorm.lira@amd.com>
Content-Language: en-US
From: "Lira, Victor M" <VictorM.Lira@amd.com>
In-Reply-To: <9c065e301bf1f00c218def202f4685b83083e1a1.1722044804.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::11) To SJ2PR12MB8876.namprd12.prod.outlook.com
 (2603:10b6:a03:539::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8876:EE_|IA1PR12MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c311f0-0d67-4933-83b2-08dcade0e2bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aG9Gd3F2dkRieURuMXV6RGVHL0xQSFduTzdacmE0R1FlM0dXREhncm5IelJY?=
 =?utf-8?B?SnJreDNzSmkxTDlOZE1vdTNvYy9uR0JobFJrVEp4cWpoMkxYcmk1MjJDd0R0?=
 =?utf-8?B?WnpTT2FHazJ5UkIzcGtzOUR5cTNkWDh6WkhERTRldk50TkR0bjBEM3g3bkNJ?=
 =?utf-8?B?OVQ4RXFYT0Y0b01hVkZIS29oejBBN1RzclYzZWZVOHdxUGFUVlo1MU9nRTA2?=
 =?utf-8?B?QmtVVzdPclpGRDl2V09xZmE5cTM5K1M1Sytuby81VGpnMFNVdXE4N0QxU2h5?=
 =?utf-8?B?bFFSc3JLL2tKVzd0Z0swSlFEWnhLOFRJemhrRWhkREtlWTFjQ2JhT2YwOEht?=
 =?utf-8?B?SnRsSFhvOThCVnQwOXhDTXRTNUwvK29jd0tXbDd0SHAzandBdlZ3ckI3Y1hX?=
 =?utf-8?B?WktTa2FPSk9YVGc1dmxQd3ZzTjVVL3pjMGNHZk4xbytlbmpDK0JmZjZQQjVL?=
 =?utf-8?B?MmptbUErK2R4QTRxd2l1MTVGc245UGxWdDlrWHkzRWNta3h6RTd6RmNnQzJt?=
 =?utf-8?B?YTFBajVZS21QcjZsVDBLRS9VdlRzMUtKZXlFaXI2MzVYMXB5QnovWG1WMDht?=
 =?utf-8?B?RUJkZzBWQTl0TmU2WXBaQ25hbzFzc2FlYXRGRmtCUDAvaGE1VmlOM1phZEky?=
 =?utf-8?B?dFk5Zy9JbVBlci9wY3liN00xckwyaDRFN2srRU8vWWpVbTJPZXp6bENUZURT?=
 =?utf-8?B?QUxYUXlRU3gxY2hHV0Q2cnVTd3FBVEViRGpXMEFoaTBTdUcwQ1RVWVkrMmF4?=
 =?utf-8?B?SmdBZVdQM201WU94amRCSzg1Um9oNXJoWlU4ODkxbzE3RHhiejRmclp4emRy?=
 =?utf-8?B?cTc4UndMN0hxL2FJQk5EZldZNk5Kb3hiOVFkdnNQUXpFbVIvNEhEdmhkQVVy?=
 =?utf-8?B?WHZZeEdzQzB2L0NBRXlGVDFWblE1ck1mcFU1RnRtQ2lPaDBDakRlTkIwY0ZP?=
 =?utf-8?B?QVN4ZGtVRkwxYTIydDVqa1lRVGhTVm5iL2RNTFRtWE5UMC9qc1E5RDlnTU5K?=
 =?utf-8?B?UmN3VHJiSE5QeWs0amNXbHVzME56SGpTQitja3NoeWthZU9XT1czL3pQM04v?=
 =?utf-8?B?eGpuTEJoRnZIRGtnRWx4dkJkelllR09zYlhsSmVmM1JucE81VXczUmxpdFEw?=
 =?utf-8?B?azZMaG1YK2FxY1Fhd1lDRHFmL1BCY2dheUxVMFJlRmNRRFlIV2dvQ0o4RnpS?=
 =?utf-8?B?d2htRnNiZW5LaFU5Nk92aW0wL2xMWG4vR3RWczBGRXBnTzdtZDZ0RE5aRlln?=
 =?utf-8?B?cWMzZDlpc2JxS1crbklTSFFJOUxKSERLMHNvbDRzdm1sbWJBajdyOThQMEQx?=
 =?utf-8?B?dy91WjFJOERQN0JabEhYamkrTC83UERhdXZ6bFRzQzZwY2o5TEh1M1prYXZi?=
 =?utf-8?B?eTMzRzhLZDAvb3hVRVpDU242dUorY2pxRVhzek5ldzE5MzhNMTRWY2tOenlS?=
 =?utf-8?B?YlZRQ3pJMjFscGluc0hMNzl6c2k1c3k1TFl1OGVEYXBGdi9pWkJwNzQ3Ny8z?=
 =?utf-8?B?WU9TR3IvbmVvN09SYWhzci8wVGxEVEphOFJ6azlJeE14RXZMQXZJaWQ5OTUw?=
 =?utf-8?B?RUtiL2lURFN6eDI5bUpqbWhQNUJBMlorK0Vpa3VlanBoUC9ibFowOWtKV0w5?=
 =?utf-8?B?Z1pQeGpYQ2pmdUdKNlVzMG93aTI2UXdqd3pvdE9UblNla1pic0JwNGpoT05m?=
 =?utf-8?B?bmozMm9aZzEwVUFEV1g2ZVk1ajE3dmYzenVidFJWYWFnVXJXemV3a0dWU2Ft?=
 =?utf-8?B?enE5OG9zSmtLWXZadXZqS3h3RERZTmQyYU9BWDR3eEpzS1ZXTFhvRWl6Ly9s?=
 =?utf-8?B?VTMrbVlFdk15S3Fvbm13QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGp4L25PWjZmOHdIRHNBRzJvckpjQ1FHWG13cmZ1VFQzeWh6Nm5lY1BsS0ZR?=
 =?utf-8?B?UjVVcVpFUnZlQ296OTlyemNOelByam5wSGFaSnBaSW5IdFVscTFneUlwdkhq?=
 =?utf-8?B?TDBLdm9Tc2t6bUpLODh3OGJDcjBwbmlMU21RaitqUDB6SGgwT2tvMXluNnE1?=
 =?utf-8?B?ZkZSbmVSSkR1ZGpOY3QrQ1JjYm9EWEZld0VtWnJ4bmdZK1Y4a2lRRVpBTGVV?=
 =?utf-8?B?R3pGeWx2eEtOOFhidDVCRVF5UDVjQ0ZGSk9SYTFIeG5ZYkVwL3ByVlFIajhQ?=
 =?utf-8?B?UzhIcUxJTW9jVnJWenpmdHZBZDZZelhJUGlWTkJBeEQ3TU52Tm5jM0l1Rzdl?=
 =?utf-8?B?aTZ3N2xFQzJua29OMzUrK1ZWNWdJMUFGc1QydUwyck50ckpYdTVhY045L0Nt?=
 =?utf-8?B?eVR2UFFLbkh4ekJYM3FDT1hXQ3pZZXhsU2FyMzZPam8xb0gySVZKaDFQdVF3?=
 =?utf-8?B?Wk1OMUVKL0Z2QVhLanh1Wk52NDc1b2JxVkQwV3JWM0lFQi9tRzQ0QS9hdVNF?=
 =?utf-8?B?WlNJRnNDMTBWMHlmWXJXNW9IOFl0c0dWNkdxQmtza2xYb1o1Z0NtZVhrWjhq?=
 =?utf-8?B?aURmVjhQbkFYMXpvekpjREd4Vnk2Nk10d3BDZlBPS0J4VG92Qm5ReVNTQWYr?=
 =?utf-8?B?azhlQ3FOaDhSaFM5TDl1c21ZYzduYnEzQWhMRTkwdmxmbTc5VHVUbHZLSjF6?=
 =?utf-8?B?N016K2hSRXQrRHh4K0ZqOVNyY0hUU0c0QUxoQ1V4ZDBzMlR2ZUlrdkxrQmtk?=
 =?utf-8?B?d1ZrczJqRTRoUXhpQk9SNGQ5WTBQY3RRNGtNVVBRNkN4RmJVRXlaUnZWMW16?=
 =?utf-8?B?azRZRW8vYURNbWhYQ2ppcndReGlpNGdHVXBGQm5pM2EvUXRDczBHRXJVQ3Yw?=
 =?utf-8?B?bzRpWGZpWXo5WFlmeFN4Y1VpYmlIUkh2RnBPbG9QN3lnVFJUTEM3d2pLYjJJ?=
 =?utf-8?B?Vm1Sb09iYm1ZZGt1emVvY2JzNm91RUs4SjN4Zm9HRmR3QjNZYlRoNWZhbEw5?=
 =?utf-8?B?dU4wZGd6blBINlJIREFlUGlTZzFRVEZ2Zk5hWnVodGQ0djgrUEVDK25wOUY4?=
 =?utf-8?B?T3l4YXZrMWZJS01uemZmUkhLK2JDWmxWYlh4cUpLTWJpUFp5S2NQZ0dYYXQ5?=
 =?utf-8?B?NThiQi9LSENidDFsWHZUemtWQ3N0aTZHVzk3NW04K2doS1dRVVk1bFJSdUdK?=
 =?utf-8?B?a0VWWUtxYkRzWCtLck9HMTFCUkhJQ1huNnNFSTFkOEI3Zy9kUW1CRFJuZjNJ?=
 =?utf-8?B?Q05YeHAvVlZ3ZlJwVkN3VFVTc0dIMjBzcWdTTWZnM0dvWEc5cXNOM3lweEZU?=
 =?utf-8?B?K0IvcnJ2OEFYOUF0aTBnWlhXOS91bkFLUGtma0JKdG9Ib2JtSnV1RjJqRTl4?=
 =?utf-8?B?YkhYaVhpaHhlRC9NVzQzQnVXMTZiWjlpSjJjeGw0SERoL1phRmtNdEh3SXph?=
 =?utf-8?B?VDFaeXJ2NDA3NEhLMXpXSm8rYnpPVGxSRUgzWXFGMWJVcFp2NitVNTQxbXMv?=
 =?utf-8?B?L2NmRXF5Y00xalY2WU9ZTjdJN215dXNsYzg0b0gzdHVFQkp3Q0h3WTRVVE85?=
 =?utf-8?B?bEJ6OFRkeHAxTjVYQlNZSTMwTnFLNE91TnNJSmFzeGFlWkMwVUpVVGtGMTNk?=
 =?utf-8?B?b3dEMGRKUUc1TU90ZVZJWExJeml2c3dsaFdhQzVzNlVsNU1UMldwcFJodHJl?=
 =?utf-8?B?WFNLWUM2ZE1ueWl0UEpmZE9FcTkrdm45RWtaUGR5Z0ZydUNDZlBhYmhZQnJC?=
 =?utf-8?B?UTkyZlV2NElaQ29jdDFGZHVXNnhVZUpob1JPNlNsZkVQOFJ6cWNVOTZzK3JU?=
 =?utf-8?B?R2RwcEpWWkRLV2tKREg3SGl2NjNnY0NhZmpnZGxqdUdVMk1SQWpBRE15WGRJ?=
 =?utf-8?B?YldXTTlqWGc5K0ZkVnFhRU5JNElIVldUNnVFZkE3WHVZWm1ndHFqYmxPS1Z1?=
 =?utf-8?B?M2xQbmF5U2tVOGpaSGMwNldtT1liZ2x3a1ozNHlabkliN01tWlpVU0l6WG9B?=
 =?utf-8?B?RUl1azc4RXV6S3VtV1Vna3l3Z1RQckZyRVYwT3B0bFVXRGJqVlczV012c1dZ?=
 =?utf-8?B?cytRLzdLK2cxYXFnSEEvYnV1blZlc0kzM2ZiMlgxVzJHQkpGNjVySjJvMlZm?=
 =?utf-8?Q?AK8I5m7P2A7lUqvp69knKMsv/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c311f0-0d67-4933-83b2-08dcade0e2bf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 02:07:36.9350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLnjQTOJisF1VSPQXy7kqBwDalS+2n2ERW2MtSwX3GdYhDFGmr0KU+e78TwjIt0sbsEoyIrXjdr257rtEGz6aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6185

Note: This test job uses the same tag 'xilinx' as the existing test 
'xilinx-smoke-dom0less-arm64.sh' because there is a single gitlab runner 
which can run either test.

Victor



