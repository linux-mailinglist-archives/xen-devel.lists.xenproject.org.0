Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E74C4F515
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 18:52:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159187.1487573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsXP-00007R-Hw; Tue, 11 Nov 2025 17:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159187.1487573; Tue, 11 Nov 2025 17:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIsXP-00004s-Ew; Tue, 11 Nov 2025 17:52:15 +0000
Received: by outflank-mailman (input) for mailman id 1159187;
 Tue, 11 Nov 2025 17:52:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIsXN-0008WS-JH
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 17:52:13 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24282feb-bf27-11f0-980a-7dc792cee155;
 Tue, 11 Nov 2025 18:52:08 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by PAXPR03MB8249.eurprd03.prod.outlook.com
 (2603:10a6:102:24f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 17:52:05 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:52:05 +0000
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
X-Inumbo-ID: 24282feb-bf27-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHnV3nqwauEKf1g00Fu5qHVt/n4CmIq3EJGkJ+Ri43dWWLh0fP4Ba5JjcRGw0QokoQHNWE1DC1WtWczjwEU5NRz3KgG75gvL1Aw+D8waKHhoG1N4nDWwEr6OUz63j2v8W6RkGKTbKRdZcrdHq0un4M+PL47VQp/0qqgLJL1X1iz1dm36+lDW+xR9wOpziPFNxH9d5hjT72Q0MQZBvMM5Q4PhSzV9gvHFvW17Muxckn9a9r5TubRIlGk46RCsPNmJ+P8IBOqBO9CmNr0asxoRmYnasMLytyV/Qt7k3kHBIQvsnvMh67LoxBaVP413ifNgrd1hx6BpzNQnN6JZ84rg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aezGidGgtshjyPLhbIqrw5klDLEFqQlUAJ01YoMbnE=;
 b=lG+DzXuHChan2M10ryB3GsEU+7TEDvqpHOWGPy4XrDIuiS3GP9pCEOa2ItyCrzDc2UoGEZrd5VTT8bFXHH7UfWnid5pOTOpcsR3j/zEskPeLfjNk2wf4RV1I2++b4hKmV0JulftHmJUitEVXfYAnGLCVfnqrnjfWzjlK8LQ15rVfZuOFfUSGJIspnq0crFJnsUS54nBB/QgBxdEL4NELvCF47HbJjlp8lUDOGDPdDtcaYAea1vsyiSjswpbBQA68D58pOY0Fe5c1GYt6LJD8124z330kOSkp50uGt+X7iEQVrBIrFo5HiVp3ykLwOHXJxWDdbJUPs3RclgRTykRSfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aezGidGgtshjyPLhbIqrw5klDLEFqQlUAJ01YoMbnE=;
 b=C/mO/VPWMP/6Xedutr5Ads5rCAtNTFXtdsEw63yl/hwlW4THCTSnPW3OFhVK3U3Cg7i01+hFMlOoKo7MHfZGV6Ccs0kmnBPVeHsZwYx8/MafFiWjE38b512/iyC4CGnbFsRkFJ51aN4FI6Z3tYH7VKfwwJCa88M65tdVheVbJUuaBw7+nHShRby/80HgNJTSaO6HFNO3tuEdjZBiusTNJl9FjyeLV/l4UQrA7Xo1+VuI21ihIDuUi/t7G2Hsm3kDGTTZSyjZjX6qjmPVOlJyFy/Oh9P1qfmtAZxf+7yI4bdc7Ed7TxNL2Y07rv0PRyoaQ6oRU5C/lZlb84rgezYyEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f0a5a939-7d66-417d-8a88-34cc172623e6@epam.com>
Date: Tue, 11 Nov 2025 19:52:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Lira, Victor M" <victlira@amd.com>
References: <20251107181739.3034098-1-grygorii_strashko@epam.com>
 <47f86a44-007f-4b90-9656-b2440238b2ba@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <47f86a44-007f-4b90-9656-b2440238b2ba@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::17) To DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB8919:EE_|PAXPR03MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 59309015-fd79-446c-8fcf-08de214b06a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dElseXJ3d0YyYVJHQkpFckF4L1VTKy91UGJZSUJUcmNqS2RuS1FzR0dYblBi?=
 =?utf-8?B?TnArTkFZbzcyL2ZJczNtYlNEWEZ6c0JHWS8vMWZUNUlkK0xGL2MxRlMzM3ZS?=
 =?utf-8?B?Ykhkd1J1Q0RFcVAwZlJzdFZWdVR0R0Z3MnpYd1p5dURheXVHbTlYaVVCSDJ5?=
 =?utf-8?B?ZmNpWEVXb2laMy96Z0xRbU9ZeUNvR2MxcDJzSnUrTUpsbHpsN05rREVDSERJ?=
 =?utf-8?B?Q3RsSGllZnNlQTU2UktoTXhZZ3o0Q3BrM29yMlBLVnRFajIrYVBNOHJkR1FY?=
 =?utf-8?B?dkJvcTRKOWVUU0t6SC9Ec1hGa1RLbGpHdyswRzVabzFvOXJPT2E3aUVYSjh4?=
 =?utf-8?B?MXFOMStOSjh0NDhzUDJLbFJraTcvQjkxZ2hQTUdXeXo3clRoUzVOSzJTTjJ2?=
 =?utf-8?B?UmcvYkVCVlZKUklXc2xUejVRN0xxdjdIVDBUQ0RoekRHankyMSt2OURiMENQ?=
 =?utf-8?B?b1phd3dOTFVmUzkrMHJqQ0p6S1pJNjcyaFVad2VuZWtaTEl1NVNaL2JKVmtF?=
 =?utf-8?B?ajU3M1VsR3ROc2ZHNVpCK2l4eVFBTmVMcEZ3S01kVHh0SDBYdDZQSUJYUlpU?=
 =?utf-8?B?Vm1tZVBLcDN2Z2VTMVdFT1k4TGpIdTYwRGhHQU5LM2loaDl6KzBXN0pKOWRP?=
 =?utf-8?B?dzE1Rk1xV0JpamJVQjE2WUFVQlFiWDk0OWd3dzlWc2lwTmp2eUtFSXFiTmtz?=
 =?utf-8?B?czlPNDlSTnBSaDhzTzFjUHl4VDV5L2cwRU5Cay8xMW9sK25GcVNEZTNhZWRH?=
 =?utf-8?B?V1JxNjFUOGI2c2NWNVVqZHVDa081aTJSSStlQVdSV2M2M3cybXY5bGpyT011?=
 =?utf-8?B?WHJwaEZQejZjSVJyc2pqeEZXbjdPM3NIRG1sY3NGN3Z0eDY1WTk1R04wTEN6?=
 =?utf-8?B?Y3FRMnB1OVh5SDhOdVhQYy92OUg3ZFNONGxYYi9wakc5RVRpbHluNDJEVDNM?=
 =?utf-8?B?UytneGxpaHZjVGJHRDdESjdkU1JRSGxXQmd6VUlVcllJNEZHdE5HdEd0WElQ?=
 =?utf-8?B?MUlvaHZ6a0M2Z0hSQjJndWY0bVJIQ2RkYWtkSFNlVXJ1eXVhY25JZGpPam1N?=
 =?utf-8?B?RWorSkxTZVBFWkFQYUZuemtzVTl1aFJoRE1TRHFQVGlGY3h6Y3NOWUdheVFU?=
 =?utf-8?B?MWwyZm5rdVNIRHJoR1RNeGdTVS9OUnBGU1pkN0F0SXRPL2FiVWRsOTZtUTZ0?=
 =?utf-8?B?YVNMQlJxSFYvalJiMzAvTVlxV25JdE1jWG1zeEI1UU1QRUEwbExRK0I4dG9n?=
 =?utf-8?B?SHRCWkQ1eHdMb3NLRzlXakhGaVYrTkY3YnhMU2kybEtIREg4Qmd5QkYzOFlj?=
 =?utf-8?B?L2x5WCt0ZUk4YkFVb0k2Y0JVZExMaDduTllZd0lVaDdMMC9GdVZ5SmR4eUFS?=
 =?utf-8?B?RzEwYUJVZk15MVEwVnkvdlhlbXNFdlpkSjJUNHdRaHBIS2lKNWdJUXhEc3cz?=
 =?utf-8?B?bHRBTHdkYzJYd2h3blk4MDdRSU5qS3l0S0x6ZkNMc0FiV1pnVThXc2Y4RTZD?=
 =?utf-8?B?cHV3ajhVOUJYdVRIdUtlQU16MEZ2TG5vSDhzK05wUWFjS0tveDE2dlZ1aXU3?=
 =?utf-8?B?S0piVHozNFZQNzhOMjhuWW92MHR3SjBnNHdHUTNuM0E3bGVsN1hPdDRDd1d1?=
 =?utf-8?B?V015WTNuYlRKTFVrM3pVVzRDUUpCbkhaa0hiRUtWV0c3NXZzczN0MHlucllt?=
 =?utf-8?B?d2lxOHoxbnV5YUV2bDlwdXlyRFFPZkE0QWMrazk5dlNSRmpKSVJSL0F2OFRS?=
 =?utf-8?B?TlZ2b2xMM3BydjZZZTh3T2w5ZEQ0SE1CYXpSNTlyc1h6QktMTzdKY1JOeGhm?=
 =?utf-8?B?TmpZQmo0K2xkVTdRcWkwZ1Z2M05uYmtSVFJEMTVISGhMdTUxbU43L1diYWVT?=
 =?utf-8?B?cDdlOXRmNmtBWHRMUVZJdnE5N0FzNWRabExyaURLY0dmNWJiTDI0ajE5czVo?=
 =?utf-8?Q?kPkDynvJNGfyexrKB+ejf+VBMstEnqeM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzRHdjFmRElrbkFyYkcrdTJhL3g3Y08wVlZzbXV6dmZyOXJrbnVUUEZRQjRW?=
 =?utf-8?B?bGxER3FkK1A3UWJBbkhPRm9LeitmOC9ONk1kSVk2eXlKSkRTZGhxaUR6enZ6?=
 =?utf-8?B?Y2pxQjNOZWxUNjBNUmlWcGRYQVowMmJQRTZ0SjduZ0MwekUwQ2MyWEVJTCtl?=
 =?utf-8?B?OUc3MGc1dys2ckhlekluU2RPZTdRbFN4WWc0aWx6L1dMQ3VvWmUrN3lsRUFt?=
 =?utf-8?B?STd3dUEyQTFmZFNZSGJCKzV1L2ZiT1ZGbG5Ecm9mRE9TQTA3dzRFYTVUT1Vo?=
 =?utf-8?B?aWs1NlM4TDU0ZGFzVnRudm1WeHQxWHIwOGRpWXVoSEZUd0I3TzRPZ29DdTRK?=
 =?utf-8?B?cmM0UWR1M005U3Q3NWdlblU4M0FPTlpGZFNkYUZmckZiOWRlbGoxWmgxOTJ2?=
 =?utf-8?B?cFFpVE1wSWFjdUNyWW5uNXp6LzZJYVZJTk14d0R1RlJMbGsvditHTmtTOUhs?=
 =?utf-8?B?cnNHTVNFKy95RkMrWWo3K1RreUMvTS8rbjE3Y0pheDFoNGtUdTVvYmxYNjFp?=
 =?utf-8?B?Q203ZUtHRkppeENnV2Z1NU9za2taSFlMbWs0YU1BT29rR2djMlRrYklaOUpZ?=
 =?utf-8?B?dGR3Q05xTDQxVUNheFBoK1FvWWtWdzRYUXhnN05SUEJjeDJWblcxVlk0QjBT?=
 =?utf-8?B?V3Y4d1ZqaFhEeUg2ZEdPNUV5K055K09QMkpKamR5bk05bWlzNmlHZ29JcGhD?=
 =?utf-8?B?eUNvczIvNUxkZm5aSkZUMWJWa0VROWtYWldDWDBjR3hnVHdYOHI2V3BGUnY5?=
 =?utf-8?B?Z2tkK1dFK0hodUpOaWx2NFFvOTBnQ1BIdnF3dGlvenFWYTBIbW8xN3VjRTVu?=
 =?utf-8?B?R3VKOFdMdDJCZHB1V3ovWDUyQytRYWFaUzZQalJvejRHQndseDRGejVjY1Az?=
 =?utf-8?B?TTNPRk1lR2xXbkh2dU9PMXlaMVgyRDNWamF2WDRZanVRQ1hGVTBvTXF0N3BB?=
 =?utf-8?B?ZldmcTFodU1SKzcxRU92T0hvRUE4eERHRXljeEtHd3RYcTlHcTFMdnBYNG91?=
 =?utf-8?B?Z25nWVpvMEpjcnpSVEMrUVczbnRTZzBCdi8rZjc4TDZrdllCOHVzSTVpcDZK?=
 =?utf-8?B?NlMzeHZnWlMxWXBQdzJSMHo2elArcHJqU3liRTJtMWZjSFdYRXllNDZDWWsy?=
 =?utf-8?B?ZFFmcTczQ3gvbnVsWkJpZ1g3cEhBVk15dGdwbTExSFFqV0FGU3ZNK3hkU3p1?=
 =?utf-8?B?NlFORi9tVFVLSWpzeG5xekRUOHNTRE5ESXY5REZYYnVuTzZidzVmK2xXOXIv?=
 =?utf-8?B?QnZnMVpFay9RaG1PUDhQbE5zSUhTbTFBZDJBYmFpVkI5ZVZib3c2MnRCMzRQ?=
 =?utf-8?B?RFU4d2JWZEQ5OGtOM2thT0Irdk5UL2xsQ01PQjJBNnQ4QTBrN3lUbi9GRHhF?=
 =?utf-8?B?MkljTktZYkV0MjZ2dlIxblc0bmRsL2ZMaHFIQ0cvTFl4dVhUVFBONXVROG1H?=
 =?utf-8?B?MGIzN2ovdmVvUlliS0xjS0wzeHd3NHQ1d0k4YUxiRHlXUU1aTHBpMTh2MjNq?=
 =?utf-8?B?VDNmWFdVc0VITXV1MGVvVUl1cGtGbkpqWlJGYTZoajNERHpBc3RUUEJmbGlO?=
 =?utf-8?B?RUdKN3NrTmxRNHdGYUgwS1lsbjVrUWM0bGhGNGRkWjE4VFprOUd5OEx3bTNZ?=
 =?utf-8?B?a1lhMzJPYUFMaG9OZER6Ykh1eUp0Q0dWVEVBKzBnak51cTVPZ0o5amhJUXRq?=
 =?utf-8?B?STJITzBNd1g3c3AzenZVZHhWZ3U1c0VodmcvdzR3WnVQUmJJRXZROWRmNjlu?=
 =?utf-8?B?VmtsMXRVRXBGOUlWL2lJUEQ5QVdYQmloMVBlTFEwN0xMSE9Zc0d2c29FK3FY?=
 =?utf-8?B?eVdkWEM2aXBQTXY2dDlWbHNzQ2xLd0lCYytEZUs0NEpoRVpQaHlwM3l4SE9x?=
 =?utf-8?B?K0EyWTh2Zk96OEVTQjRBV3l4UnVlWE1OaERGMGdOeGNlMExvMlhSYnpSV1U1?=
 =?utf-8?B?S2QrSjh3T0hWcEZiMEZXc1lZb0hzWGNML0pXeitEK013S3ljV2ZRMnJTOU0z?=
 =?utf-8?B?eUVUQlVHVDAxUTlENDcwOWVKOVVJUE1heWtYZWs0cjQ2T3JVc3ZyNDZid082?=
 =?utf-8?B?dWVTK2VmM0c3NHAvUWZOL2k3QlRHMDJyRHhHMThwNXAwdXB5TnQ3YmZNMWpp?=
 =?utf-8?B?eEorRUtxc2FxbDN0OUEwZ3UwZklDK3JhbEh6Ry80TXdXTzl3a0plUGkrYzN6?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59309015-fd79-446c-8fcf-08de214b06a5
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 17:52:05.4235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dG/jny7xlJblAtw/EArO5LnyehTRIqQ2/WWZbH+omP8iOnB/mU1s+/nzVanTmyXMuXB3By5qdwBN3mMxqaSN99HgxkigKjrTh2ic8Sdrlsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8249



On 10.11.25 09:11, Jan Beulich wrote:
> On 07.11.2025 19:17, Grygorii Strashko wrote:
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -71,7 +71,7 @@ obj-y += time.o
>>   obj-y += traps-setup.o
>>   obj-y += traps.o
>>   obj-$(CONFIG_INTEL) += tsx.o
>> -obj-y += usercopy.o
>> +obj-$(CONFIG_PV) += usercopy.o
> 
> Imo, if this was indeed doable (see below) the file would rather want moving
> to pv/.

I've tried it :( But at that time it has failed for me because of macro magic which uses
"# include __FILE__".

Now I see that additional Makefile line:

# Allows usercopy.c to include itself
$(obj)/usercopy.o: CFLAGS-y += -iquote .

need to be moved also.

> 
>> --- a/xen/arch/x86/include/asm/guest_access.h
>> +++ b/xen/arch/x86/include/asm/guest_access.h
>> @@ -13,26 +13,64 @@
>>   #include <asm/hvm/guest_access.h>
>>   
>>   /* Raw access functions: no type checking. */
>> -#define raw_copy_to_guest(dst, src, len)        \
>> -    (is_hvm_vcpu(current) ?                     \
>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>> -     copy_to_guest_pv(dst, src, len))
>> -#define raw_copy_from_guest(dst, src, len)      \
>> -    (is_hvm_vcpu(current) ?                     \
>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>> -     copy_from_guest_pv(dst, src, len))
>> -#define raw_clear_guest(dst,  len)              \
>> -    (is_hvm_vcpu(current) ?                     \
>> -     clear_user_hvm((dst), (len)) :             \
>> -     clear_guest_pv(dst, len))
>> -#define __raw_copy_to_guest(dst, src, len)      \
>> -    (is_hvm_vcpu(current) ?                     \
>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>> -     __copy_to_guest_pv(dst, src, len))
>> -#define __raw_copy_from_guest(dst, src, len)    \
>> -    (is_hvm_vcpu(current) ?                     \
>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>> -     __copy_from_guest_pv(dst, src, len))
>> +static inline bool raw_use_hvm_access(const struct vcpu *v)
>> +{
>> +    return IS_ENABLED(CONFIG_HVM) && (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(v));
>> +}
> 
> Without a full audit (likely tedious and error prone) this still is a
> behavioral change for some (likely unintended) use against a system domain
> (likely the idle one): With HVM=y PV=n we'd suddenly use the HVM accessor
> there. IOW imo the "system domains are implicitly PV" aspect wants
> retaining, even if only "just in case". It's okay not to invoke the PV
> accessor (but return "len" instead), but it's not okay to invoke the HVM
> one.
> 

This patch is subset of "constify is_hvm_domain() for PV=n case" attempts.

It was made under assumption that:
"System domains do not have Guests running, so can't initiate hypecalls and
  can not be users of copy_to/from_user() routines. There are no Guest and no user memory".
[IDLE, COW, IO, XEN]

If above assumption is correct - this patch was assumed safe.

if not - it all make no sense, probably.
  

>> +static inline unsigned int raw_copy_to_guest(void *dst, const void *src,
>> +                                             unsigned int len)
>> +{
>> +    if ( raw_use_hvm_access(current) )
>> +        return copy_to_user_hvm(dst, src, len);
>> +    else if ( IS_ENABLED(CONFIG_PV) )
>> +        return copy_to_guest_pv(dst, src, len);
>> +    else
>> +        return len;
>> +}
>> +
>> +static inline unsigned int raw_copy_from_guest(void *dst, const void *src,
>> +                                               unsigned int len)
>> +{
>> +    if ( raw_use_hvm_access(current) )
>> +        return copy_from_user_hvm(dst, src, len);
>> +    else if ( IS_ENABLED(CONFIG_PV) )
>> +        return copy_from_guest_pv(dst, src, len);
>> +    else
>> +        return len;
>> +}
>> +
>> +static inline unsigned int raw_clear_guest(void *dst, unsigned int len)
>> +{
>> +    if ( raw_use_hvm_access(current) )
>> +        return clear_user_hvm(dst, len);
>> +    else if ( IS_ENABLED(CONFIG_PV) )
>> +        return clear_guest_pv(dst, len);
>> +    else
>> +        return len;
>> +}
>> +
>> +static inline unsigned int __raw_copy_to_guest(void *dst, const void *src,
>> +                                               unsigned int len)
>> +{
>> +    if ( raw_use_hvm_access(current) )
>> +        return copy_to_user_hvm(dst, src, len);
>> +    else if ( IS_ENABLED(CONFIG_PV) )
>> +        return __copy_to_guest_pv(dst, src, len);
>> +    else
>> +        return len;
>> +}
>> +
>> +static inline unsigned int __raw_copy_from_guest(void *dst, const void *src,
>> +                                                 unsigned int len)
>> +{
>> +    if ( raw_use_hvm_access(current) )
>> +        return copy_from_user_hvm(dst, src, len);
>> +    else if ( IS_ENABLED(CONFIG_PV) )
>> +        return __copy_from_guest_pv(dst, src, len);
>> +    else
>> +        return len;
>> +}
> 
> I have to admit that I'm not quite happy about the redundancy here (leaving
> aside the imo Misra-conflicting uses of "else"). It looks as if some macro-
> ization could still help. Not sure what others think, though.



Just an observation note:
  From my recent experience I see that macro-magic makes Coverage report (gcov)
to provide not exactly correct results in terms of code lines coverage at least :(
For example, for usercopy.o: 7 functions reported, but lines coverage is accounted
only till '# undef GUARD".


-- 
Best regards,
-grygorii


