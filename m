Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4EA94F5B5
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 19:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775689.1185917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdYcH-00020t-C3; Mon, 12 Aug 2024 17:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775689.1185917; Mon, 12 Aug 2024 17:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdYcH-0001yV-8c; Mon, 12 Aug 2024 17:13:57 +0000
Received: by outflank-mailman (input) for mailman id 775689;
 Mon, 12 Aug 2024 17:13:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zvba=PL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sdYcF-0001yJ-Oc
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 17:13:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f44d1fb-58ce-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 19:13:53 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MW6PR12MB8705.namprd12.prod.outlook.com (2603:10b6:303:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 17:13:42 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7849.021; Mon, 12 Aug 2024
 17:13:42 +0000
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
X-Inumbo-ID: 3f44d1fb-58ce-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLkLoxFpnqNmjjqlKvABEe70Qs+viReO1xDv+2gKtKT0/UZVen5ykfxXSBJ/GKIaEu7BbBpIQCFZxYaxT4HMgZ5SeLbGzENWGBHfo+SDC/bP4+CN0KK96RPx8gyQqTZHgQOnLc7EPcWmCZGOaO/ycx1zAvzi9K/Yz3wrerxFmcK9zfCkoND67sT/Y6W6Qxde59Lldg3CRTV2xxYuMgMvm6xmfoIgOmJp1gCP0+RsyAHPmtAZjqq3QiuomNDsBtzbN3TacvqkP9efc7xngZYcJGqfxujN9FcOI0fj/AzLA5kP8QGptOl6z2UG7s9sEpUmhMp11qHLPnnhCnu6H5IKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKru4S+QNA4hEk1mp8ahGuyyOr4JCd++1MajJCNbRZ8=;
 b=y8N7FiS7B4e7uKePD8qyOaDHto7G+FMoGTKaR9RXxsq6LRPJ2Jy/Me6l6qgkLN0EAcdDLWEQXJazvbHConiuWqq+27rpfgjiJB5gags5IyRAADTCFGrXQCCjL7U9KTAjoqmwPIUW6A42zteDgZAatQl+p2p7aw9D8qz1kf9MSmjlBid83FFt7pCzVHjRGApHXmmm8bD0Ac80ELj38Pccykw07/VOKBIpIiosA+b3n2bUr0uBl+7k6P9lAITKJcZ/pd7YSKKD7u5SVwJmTOuuI2yn/kjAubMoWVGQ309nUYhaH/6yM+JctFVArep1wEHKLgGZstf7szy+igpWj5enGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKru4S+QNA4hEk1mp8ahGuyyOr4JCd++1MajJCNbRZ8=;
 b=Ij6CsKv/9Ti4HH6IxW0yYanciCd45pDH+syDr6sIhOFe8ojnRvQPDEsVqy2ZpwUZ1hk/SV5SASYXU62ilzDilbh6Um4AZDxasQCJ8itDJn24/y+pZLwT9Bpytb1ART1s/+1YGM8SMeIcEATim+ye3zo7AhSFV3CWnNlKH5skeSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <12a28673-852c-4478-9e46-5aa9d2e8c94b@amd.com>
Date: Mon, 12 Aug 2024 18:13:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen: arm: Enclose access to EL2 MMU specific
 registers under CONFIG_MMU
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, julien@xen.org
Cc: xen-devel@lists.xenproject.org
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
 <20240808120936.3299937-5-ayan.kumar.halder@amd.com>
 <07e9a5bc-6e51-4073-b7a6-eb7bb7635891@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <07e9a5bc-6e51-4073-b7a6-eb7bb7635891@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU6P191CA0068.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::20) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MW6PR12MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 386d48bb-91fa-48e9-bfef-08dcbaf21d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnBiczFocTZ2bHRlNUJuR1M5elVxNDZjdzkrWk9CS0tvdlFocFE2YUZvNWhQ?=
 =?utf-8?B?RUhYZ1Zvcng3UzFzL2JiR0NMcXphTzgyQ3FKQXd2dFE4UWNGNE1KRzhCUkk0?=
 =?utf-8?B?Vjlzbys5UCs5YXY0ZFFNcEZrYXRVNXhhdXZudllDc2lzemYzUVNRZVhTek82?=
 =?utf-8?B?YVBmUXZGUmI4VVdsN1JaMGdyUGxLSHIzSDJZeXQ0UldKNklLUHp6b2ZDUEx2?=
 =?utf-8?B?Y2plMFVMamF6TVFpamVrcjY3Uks2NmpITFJwMEkwTFoxMUk2ZlR6bnZrK1ha?=
 =?utf-8?B?ZDNPa0FYS1hnUUtnZWdTZDhzQjYwQUdPTldzT3Y3a1hKUlA1M2VqSFkyOTVU?=
 =?utf-8?B?ZEZyNkIwd3A4ZVlBMm42YlkzejVUNWhIN2JlcTczU1NScCsxeWpBYXlGYzhQ?=
 =?utf-8?B?NGE3K3dMQnlmT1VOY3Yva2l2aElxZ1pPemlZVy95cjBkdzc2THVSNW5nTkFI?=
 =?utf-8?B?VFhSVThHTjM2TURzMlB0Ly9KTVZLU0REVEFuU0VsVGRITDJLem5SQVlvZXFn?=
 =?utf-8?B?eXpzc2w5aG9BN040WjkyMDlzdVJZbXpVRFc1SGZidi8xbCtXZXlpOURsbURx?=
 =?utf-8?B?SGw4ZlFDM0dXeUFFZ0k3RXBxQ29SM3Juek81dTI1aDJVWTFTMCtaQS92cmlI?=
 =?utf-8?B?M3k5dHl4cURuSGxWSlhQM2JvUjZTTGxKUEl2bjc5VWhJTE9SR05qL0ErVmFN?=
 =?utf-8?B?Qnd6Ylk4WU1mY3ppUHFUQ2k2Sk5uZGhFam1aM2pPR2x5WGFpbG94THBDSWwx?=
 =?utf-8?B?cUhMSTk2VDI5L0RwUlpxa2ZtelhqV1RDRjdZNE12MHMwVkd1Z3owdlhzUFBL?=
 =?utf-8?B?QWlhMU9kWXpPSTVtVXQ4dDBxY1E3VHNFQ2hOS3BaYlJiYTJEbHJka3Z3OTVE?=
 =?utf-8?B?UzJoUkhMb3JTUGpoUmFpVllXUTRuVE5JTE5XaTNoVlJ4ekpnY3VtL1JQbkRZ?=
 =?utf-8?B?THNoUnVJUEgxZkZkVE9SbzNnS1pXa1N2bFhyUG1PM1c5TXYva1kzc3FBUW1y?=
 =?utf-8?B?NU1rREZBN2FoMVpJZ3UwQllSc2VPWUUxRUdRZCtxM2pPdnJFSy9uWjh3YnlW?=
 =?utf-8?B?eTZ5THZ2NElXNkdZMTFVK2ZBZDlhVXdpL1BwYW53anVpSGZzL1NOODFsUi94?=
 =?utf-8?B?RnNhL1NjQTB1K3hTVEVmQjdiZVBwVzhRTkJGd2gzSW1qanV2ZFBxMzVlZXp5?=
 =?utf-8?B?TXZKREZ3cklPN25KZFpnUjEyUEw1V2NBTlVuSGRhS0MvVkthN29ENHBDdVB4?=
 =?utf-8?B?ZmtLQ0lrWU9QcnVHL3g5ODU3R0VOYXJhTmZwTXVoV2JWVFEzdmhYNHMyblcr?=
 =?utf-8?B?QXZvekY3Nmw2eWlPZ3BiazBlNmJ3ZzNXcTlYczVwZGgxYVFCN0FmRnE0Sk9j?=
 =?utf-8?B?TW1IbUhkcHp3SUJDbTY0a2ZzclpXeWhmQjlwVXZJcW12OXcxNkRHL1MvRmRX?=
 =?utf-8?B?bXdvcldzVnppRjgzK3hveUJZdncrRDZVVTRocmc4aDdQM0s3SmxvSVlLTnh2?=
 =?utf-8?B?Y3lBbG9FSnFyc0E2R29xMUZQMEFhbjRwZkc5T1oxZSs1cUNuTXVkUThDRTB2?=
 =?utf-8?B?L1VxNDN1a0RRRTBuZzhZN3pHbG1wUEk0WTc1T2dqTGtpUVNyck5EZjRhKzBP?=
 =?utf-8?B?ZW1IblN5Ni9qSXU1Wm9IQ0c2ZnJBWmhvUWU4WDVHaFFCQVFwd1NBM1V0aWNN?=
 =?utf-8?B?bnlOM3Z1akJCTmRqRDRNSEUzRzg0bG1hcEc4dDloVGloSEpRRExMYm1Pc0JJ?=
 =?utf-8?B?Ulo0dmphNG16anRaT2J6MTNFSFFEMHVtemtKcVdRc2w1VXo2SHVEdjBzcWIr?=
 =?utf-8?B?VURaYXR0VG8wZXBOZlBCUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlRYMnZWNDBaR2ozNVlPcklFUHBqYW9WMlhWR094MXhTdXc5WTZQVFFaRHZY?=
 =?utf-8?B?S1ROeU9uMnVlZ0xjYmZmUEtrSWtmc2hqUURLYjdzVTQ3MERTd25OVWcrV2h1?=
 =?utf-8?B?ZlFMdWxZRTRNMmE0VzAzZEhpVXA0WVFvYmpFZGJGMnI0MnJsOU1vSWdhbzhI?=
 =?utf-8?B?Mzd3cGc1cDNWVXlJZE80UzBvVGNoMDJWazVaOFZFU1U3VkwvdGkrSkpkM3Vl?=
 =?utf-8?B?ajFWMllqdnlTd3FpYjBEb2tORm1wQ005NUtnN2ZzQ0twQkhMaWxwT0cvQmM0?=
 =?utf-8?B?dlZzL1JEckk4V1hyZ1MxRzRVUzA1MEhiT0RYTE90WlZpbGNWZmRiU243RGN5?=
 =?utf-8?B?WG9KeXg1dFpBWmJCSWl0MWtLNlZjYjVFcjdPTXE1TVJqYlZLZXhjRERKVjFF?=
 =?utf-8?B?VWFnTlRYaHlGZldHdENoY2RQTlh4dnovc0prdndxUDY4b1A0dFBoY2VCWFZ4?=
 =?utf-8?B?aFBWVXdDb3FQdWs1OHQwQVBaQjJlbmRyVVo0VkdNWDZoTlB5TG9MMmcvOGQ5?=
 =?utf-8?B?bTFlSVVNMm5oM05ITlhnTGxLc1B6d0lXb250NE9wekpuYjJBR0dSQkFOUXRO?=
 =?utf-8?B?L2RTZkVlVzlIQWZMYm5uS2lBVE9YaldXRzE1OTFYd2tFUlRUYzE3bUNFa3dO?=
 =?utf-8?B?M2JmREVrSHorb2hRYmFaQ1BDQ0NrdlZ2cDE4RUNIbTFFQURPemZCWmNxczc4?=
 =?utf-8?B?MVN3ZXd6cHEzbC9CTEIvQnBReTRvRXFBSEFXcHc1ZnFuQ3M1NUwyVmRYN3dv?=
 =?utf-8?B?eGordjBkT2MvVkNUQVVlaDNWS2hJU2FmbFBnUUw3VnNVKy8rV2ppZ2s2bTR2?=
 =?utf-8?B?U0trWEx2YmMzSEVERGVaRTV5MEV6VCt6NndYMEg5Y1pOdGFSeXF2SjRFRG1m?=
 =?utf-8?B?ZlRHSGRQMmR4bmVQNTgxMmpDaDlWKzRKRE1VL3FRY2tkNGs4WklHVFdFb2Jo?=
 =?utf-8?B?cUI1bHlYcjFWbmFSa3U0SnRuZkVXalZ0SStwQk1MRDFyeE81VVpFblRPbGhj?=
 =?utf-8?B?WFk3MnBXWTBENm5pWmRLTUtnMmlZZVRNc0JZemZpeEZKZEdZVlczem1LSnhr?=
 =?utf-8?B?SGpFdHEwT2VzNU9sU2M0dGxQU0k5TXZjQlM2NkVKaG9hSDZOZFdFNll2Vngr?=
 =?utf-8?B?YVNPckRYRU9ROFh0NUFjSkZuZzh6TVoxTUdNQVNiR1dpQ0RRMkZ1ckZHQThK?=
 =?utf-8?B?ekRkVDI0WUR2YVRPaG9kR2lyZVIrb1ZNQTZLWmtmZDVmZEtaT0RheWlQdmRq?=
 =?utf-8?B?M1ZUam5DcDlTOCtMdnNoMk4zTW5VTjhSUU56MXVVOE1rRnRDREt6TzNNaEpL?=
 =?utf-8?B?YTFid0l3V2dyUzVoNDhOSGRXOVRaaU1oeEttc2J6cFVkcnFWZS9QR3Q5WHds?=
 =?utf-8?B?Q2VoL3l5V3YwaWFvQzE3dlI3bURYQ0crQzloNWE1T2RGdnNicnlHeWZZNFVR?=
 =?utf-8?B?MzJrNVpCbTYwL0haYmUzSjcvOUFPMkU2eUdqTjV6eDU1aEUzOWwwN2dsTlVB?=
 =?utf-8?B?T0hqVCs0Q1crakV5MmRkeEpKaHFiYVpWcG9ac3p0blZqVEJQdEg5aGpMZzd6?=
 =?utf-8?B?N0RDNU85QzBDdUFrRnNydXNTc3hpcU93eGRTTWtOS1huaHp0UCs4c0oyMTNN?=
 =?utf-8?B?eWJZbjdNRFFNR2I4U056UGdLdnZVak5OSVBvYWRsbG5ObzZsZCtrUmxvWFlZ?=
 =?utf-8?B?bjlnNDQ4MGl3ckJOTExXUkZpL3VydzU0OWFta3dMZ0NPY21hME9GRVY3Y0ho?=
 =?utf-8?B?OUF1WXFvVGVPUlZBeTBKZjFyRkYwTjBBR1J4UW4zZUQ3eUszem1mYjJEZlh3?=
 =?utf-8?B?RXJ3Z0dNOXJOQmNaRnBHenNuWG5TTS8yNUdCeUZsaTNzSTVrMkZpZzM3THpU?=
 =?utf-8?B?YjA2M0kxSlN2Q1dWQk5NYjhxNzRrenhHUjJhdnhGV1plUlNDdGRoa0dHSk1Y?=
 =?utf-8?B?dk1mcWg5MVBLMUNlZnEreVZtVnFycEJyc1NZT1hkNm40cU5mZ3RiamhHNWwv?=
 =?utf-8?B?TlVmeCtiZDMrbU4vYWh6RVdhTW1mdEV1bVc2OHA2ek9yVnc2NnYwUmhtNVdn?=
 =?utf-8?B?cEo5Z3d3UzduVFpMUjh5Qkl4ZTBIWDBDNVNDZ29sS2phN3VOaTAyblUxWnY0?=
 =?utf-8?Q?K4OBrwwb4HGl7Pkuj5bZEwZh6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386d48bb-91fa-48e9-bfef-08dcbaf21d62
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 17:13:42.0141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovvGLR7oS1hxvpzl/9aABswAZgmJKI6RiRrLbFNQZgtVVXB9iCLnIlYR/klyrbvj4nEySkMHRrdFa0K1VgGHSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8705


On 09/08/2024 13:15, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 08/08/2024 14:09, Ayan Kumar Halder wrote:
>> All the EL2 MMU specific registers are enclosed within CONFIG_MMU.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from v1 :-
>> 1. 'vttbr_el2' field is enclosed with ifdef.
>> 2. No movement of code.
>>
>>   xen/arch/arm/traps.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index aac6c599f8..f51e1424cb 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -720,8 +720,10 @@ struct reg_ctxt {
>>       uint32_t ifsr32_el2;
>>   #endif
>>   
>> +#ifdef CONFIG_MMU
>>       /* Hypervisor-side state */
>>       uint64_t vttbr_el2;
> Given that you protected the field here, why did you leave assignments in show_registers()
> and vcpu_show_registers() unguarded?

Makes sense. Sorry I forgot about that.

- Ayan


