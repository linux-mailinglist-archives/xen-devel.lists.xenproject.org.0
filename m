Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33303A5EFFD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:55:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911786.1318186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfHu-0003ye-0W; Thu, 13 Mar 2025 09:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911786.1318186; Thu, 13 Mar 2025 09:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfHt-0003wv-TP; Thu, 13 Mar 2025 09:55:37 +0000
Received: by outflank-mailman (input) for mailman id 911786;
 Thu, 13 Mar 2025 09:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6QA=WA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tsfHs-0003wn-So
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:55:36 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2416::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f782845-fff1-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:55:36 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.28; Thu, 13 Mar 2025 09:55:31 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 09:55:31 +0000
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
X-Inumbo-ID: 4f782845-fff1-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDAX0RLLwO4HYmuX7UC1jl3LOnm/I+z4AqIKEwJAhUvfLHWH378m3yoiMuS33hRoODyyzrOLUiDs5xeWztJYHonm7Rs8eWL7R6IP7X4wPGwQe4YQZF5+EALYkEuaWdxPPty+W3bB4KE8UBrReC66YBA8MhAg+TpLuK0wkuCDXjuRnZOa4J0GYJlcef/HnLq061B51TZeGBYOuZeHMbQDVU+Zpvur/+Y+9RiuEiCSuUHuQrPI7PSuvrMPG37c0StvrMS0utiGL+XStUlbqvYVzMKVLWc+ge1g0oyV13NLJ0YvTny/6dPlBktxvq9qGvd+R9cMACB0fOOPxypo4PzELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18Xr0bnPxAd1IyiDUun1RW67LBHYUgXavCJtgH/4GLk=;
 b=WzpQBx42tTap55TNi+g8Fn537USlkBtRPWJzTuUGYmSVK9Tw6EIR0yOPPZQCprrYp/3fMEbFg5ioKhlOcTBA5jaQ7GPcTnXLjoSAD6w5efUSefKvWAqBt3KsCPPwnQ17MHQv8tl7vUXV3YzCyWigbjqwi0Y/jkpTI0HYv4LC9Iy+jXcWi8LO/MYjB0NYvkIHDhrNkJ2PjTNqgMph8FbxP6B9bE8J9cGguFE9xF/hpmdujzcmCX8hDSlU53MJV9Z0q9VZnskmKUbzoeL5JC8YARcZKKKgVfM6W78JQ0/S9Zi1kuVuzjmZbpBfO27eHOSwmnYSVfLWaXJfWwdiXJkCPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18Xr0bnPxAd1IyiDUun1RW67LBHYUgXavCJtgH/4GLk=;
 b=oeVDD2MCTxHTIvTo/bckKW/JT7y/ZpTnH0xfON0TmAaVi7pMJ8osdHaJxIUUfzBq7vr+Mzoekkih1RFHbiCJ4jQs+mJt3W2TG3EggUFjR+PtIhr3DZcbBBW/RR/3ZbjnPSAFZV7GGG+IVUna7hdAZZ+iIWGNvVV6ZuHsjAZkDcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <93d63d08-6724-4dd7-921c-826926c5cd57@amd.com>
Date: Thu, 13 Mar 2025 10:55:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] arm/mpu: Kconfig symbols for MPU build
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-7-luca.fancellu@arm.com>
 <6a372989-e51c-4165-8f03-41da8e3a9bdd@amd.com>
 <73E6A3C6-E9B2-43BD-9F8B-6FC6F260FCE9@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <73E6A3C6-E9B2-43BD-9F8B-6FC6F260FCE9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e8bc0f-ae35-4b86-21af-08dd6215313a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjNQK2pacHJYMFpLRWo0QnNmZUl4TDlaM0hBTkdUMlk0ZFh3V1k2Qnh6azc4?=
 =?utf-8?B?TlM0S0s2eGNIckRzR0NuUTFYTjRVbFdiZGZqLzdIdFhPQ0VuOEcwNXBuUnFW?=
 =?utf-8?B?OUtVbkZpaUN4dFF2V00zY3dZRG5NWW9IcUdoNjVGZTA4aTFMNU1IUXNmUWxC?=
 =?utf-8?B?N1E5aHdzZnBBc1FDemJaZWtmRUJENU54L2F3cUNkRDlwelpUTjhNS0wzS3ov?=
 =?utf-8?B?RHMvS3JIUDNQYWZ4SlYzRGhMMnJOUmN4bXJpMHhaejhpOXhWT3I2dlU4YU4y?=
 =?utf-8?B?eTEvQTd3NjAvb3RhNUFEOTJoUkpzcnlaWUlmWlVEeUIwdURRcFJzaTgrdXNv?=
 =?utf-8?B?LzRBOTllaDJzK2V5Z3FFTG1lVGowNk5hblFmb01iN014bVhmbjRDUjg3VEox?=
 =?utf-8?B?Tm9ZeW1CbGJiVnAzdjlPaGV2YTg4b01jKzJFUXd2cGdLckxpSW1lVHVLTG5H?=
 =?utf-8?B?UFk0MnMvTFZyRERLeXJhNXZkR1AyS3dPdkVRY2Q0Q3RuSWl4RUVMNzQ3YkNk?=
 =?utf-8?B?dVlIV1R6SDhBY3UwTzRvT0w2WG9wSjZKWHVrNkVPSld2NVRoZ0M1WUlEU2o1?=
 =?utf-8?B?Umx4akw1Zm1kVGpzclhjblpMTmtZTncrbnNhUXJySFBsZWtqcHhtbHhsZDZH?=
 =?utf-8?B?STI4K2kzQTJ1L2I4cGNsT3J6S0xiTTJJZ1RITkJ1WnVSM01vV1B5aElQOHpt?=
 =?utf-8?B?R05pc29Dcy9TWHl2c0pVVm5rcXJhejBsM2Fob1pYM3YrUEFFakRHY3YzaE9T?=
 =?utf-8?B?ZWtYblp5VjFwOEZ6MVUycUE0c0wzUm1JZTBnWEY5ejR4OTNFRGdXVmljQXNo?=
 =?utf-8?B?c3BIRnRMelp1SnB5eFl3UzFhMitFcC9oOVczTTlXc3NNYzdEejNHY2dLN25t?=
 =?utf-8?B?U294dWhodkhUUHBiRUtIOVVKbXZIRUV0eE42K3E4Vm9yWWpCcDd0MTlhSWpX?=
 =?utf-8?B?dGExaFl1VExiRkV0ZFhXUFJ4akJack11endwUTBWTzAvLzBwU2tYMWpKYWJK?=
 =?utf-8?B?WUJ3MCt4QkdrRWFDYW16aGR6MFhSck1IVUVtMDdKdm14SEJDSnBoTHBhU2FV?=
 =?utf-8?B?cmIvQ0gyU0xZWSt6NUdkVkNNRm1EbDcveTgwTmlyVUtiRDhRK0tSQldQMGt0?=
 =?utf-8?B?cy9aYTgrVlMxUml2UlU4S1FQQ3hkTW9OWDl5eEFSU01DZTd0QktnaDNNNTFK?=
 =?utf-8?B?RmY2SVltcEhJZ2VZUncwcStGTFdaL295cWllMytMa3BaQlUweHZLNXJSQS9h?=
 =?utf-8?B?S1g5RGk0dEdkTXp5T09CRTFLU0taKzBIdW9BYnIvcUdjOUJENlZ6RGVTNSs0?=
 =?utf-8?B?bDVUdWZJZVFPZUZJNURXZFNybXZBWjY1NkJydFpaSG82SXlsK1RCZWZCdkxl?=
 =?utf-8?B?MlRwSWEyTi9XNjlxQWpSRzIzQkpDVUhCT3VSQWhyekNmSVJXZHZ1WVA0OFdI?=
 =?utf-8?B?UzhpRndsMjlaZWdIc0paY2VIcDlvWjJnRTVlY0pJWDBkbVBkcnlONUdnZVp2?=
 =?utf-8?B?UUZrYUFvNkhHcC9RVloxVlNRaG9Yd2ZTVWdIV0NqNC8veDIzWmQzZWt2RnIv?=
 =?utf-8?B?RERmekxWbGczc3lORzdudXRoS09rdFMzVWl6ZEt1bUFkZmlYZ2orMmhGL05D?=
 =?utf-8?B?V2g3bGpMTG8wVDRZR0hpMXBrdjRyci9pbDNCTzE5NE0wZjNOV2E4T0xmNTc3?=
 =?utf-8?B?bXo5Smc3QTMrWmZVUlNUKys5Z3N6MkR2bFg5K05Ka0QxaWdsbFlZQzZST2hS?=
 =?utf-8?B?dldXRzkrRERWdWREU05vZGhVcml2bkoxNHVRRzdUbmZMRGlWZEluMzlkT25Z?=
 =?utf-8?B?Mkd1TWdiZURXOWgyT3BhWUVvU1hjZE5yUmQrY1ptcEdHN3FOS201NEJSZzBE?=
 =?utf-8?Q?H/vVrfc+LN15H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDVQemhMbmttbE12YjRGK0JyYkVpSkFSamowQmtNL2dzY1dGaWt6QTlZWUVW?=
 =?utf-8?B?SjBzYzg2cXpxOEt0dGVOVTFUQ3hnUkgrUy9aNktGZmQ1cldrR3NGQ0pLeDdJ?=
 =?utf-8?B?dXR5L0tHQSswcm92N1JWQU1Pd1Ezb1R0RDRpYS9Wdm1OaW1wTjA2Z2ZUbTRS?=
 =?utf-8?B?Znd4WmdpL0FvVHNmTGFxOVhtaFUxNEw2NVpVT1d5aExsaUtqdmR5YlJTSVU2?=
 =?utf-8?B?M3I0Q3RmRHp0a1drRHhhTHBxWHdqSkxrWlBRWFUrTDEyUHE5UlJEQUw3Ky9t?=
 =?utf-8?B?YmlhSkxIWnJxV0NNZmV2ZFU5VUhMYVEyclJTd2NWRXZPQS9DRWg0b2dQQ2t4?=
 =?utf-8?B?bXIzOHdsMVFldUUwSTZxK0p0V0F4N3ZhM2t4dmVPVUFIelNFV0I1ZDI5aWFC?=
 =?utf-8?B?VjhpRk12cHpjR0M5dkpPdUpwZzBIeWphT3FEWXQxWjBwNzM5S00wYkRhdEpt?=
 =?utf-8?B?WjlmeHFib1hSTWJ6R0JmUmFJeDJ4RHYzS2tpMmxDMjExQW9OWVJEeXJWMUxC?=
 =?utf-8?B?cndNeWgva3dKdEIyOWZyc1VYQkRsUGV2K3VxSWdHSHIySDNncXMrUnhEdVVh?=
 =?utf-8?B?QjdycENLMUV3elFJaGtPbmVHQmwzZGJBdmdUUGxVWWljdjI4V1gwdi9iZnVR?=
 =?utf-8?B?dzBmUHR2enlyVU5QUmgvdXRKRkhuRzJCYmNrY2ZWb1JVRFdYdDAwbzdidFZR?=
 =?utf-8?B?MG9HdGFEYUkwRWJJeUUvSHV5K1B2R2REc1FzNkY5cWY5YmVCTlJwYlJtaGxu?=
 =?utf-8?B?eTJibWtpN0JObmtpVys3YUplbWhER3NVTFdnZlZFQkN4V0gwM2xraWpoeTlX?=
 =?utf-8?B?cmwvVXpwMW1QSHFoWS9lb2NwTnhxVWhyYUx5SXV6QWJJZmRTY1hlNjN0L3B4?=
 =?utf-8?B?S0tpTFN6LzJZajRxZ3ovVExFdFovSlVoMlpUeE1CempWci95aFVadUM0N1Ey?=
 =?utf-8?B?M2VBSXdySW9jYjY0R0l6ZkRZdGhJUU1EYzI0eDVrb0thMXRQcnR6YTBYckk1?=
 =?utf-8?B?OVM2UElQbHB0dGRFSTEvV29tQjlNRk1wWHJZd05XeDA1ZzJoQmt2SUNNM0tp?=
 =?utf-8?B?eExVTE9IcDNQSHkwUVNVNUhnUEV0bjIyK0FIT094czY3QkN2dGlXL2hGZk1E?=
 =?utf-8?B?SDZabU8ySUdDRkJMelZlZUQ4cWlkR2hVaEwzNyttVFlmbHNPZHBHQ2V1K3cr?=
 =?utf-8?B?Y1BIekFEK1BOd2ZQSWMra2k1K2NVOWhFMmdXOFh4QWQ0Y1ZRWkVpM29HVmJQ?=
 =?utf-8?B?Y3psKzR2dDFiWldhUzNTWW1LdDA0SzNLQTVZM0xOb2NhSlMraFNuR3BNK29M?=
 =?utf-8?B?RW5DaVljNzByZ1RVQUZ4d01xUmVaNFpTazNDTzhnZGRrbThUc1dqUUFOK3B2?=
 =?utf-8?B?OUdwSEp6YTRJMGdxbGpRM1JSV2VHS1RaT252dXVFcFpIQ3BxY2h6UkpGTFp3?=
 =?utf-8?B?QllTem5XeWNCaXBycnVWVUpkSHhyWlpzM01JbUN1QW0rQXl2dGJEbmg1SWZZ?=
 =?utf-8?B?REQyRXhyeW5hbVJoZk5NZ0wzb3hpbVFMc2xZL3pVUnNaVmpRbk8rVDdRUG9k?=
 =?utf-8?B?M2dmYzFWNnJLdU02V3pqZC90MkMwMEZDRDRaeVV6RThTMzVVSW9SOWJqejJY?=
 =?utf-8?B?YVpRdVBRaENlemcvajYzSXovSHZZNW9Gcm9zcjN1RjAremdjZ04xeTFrOFh6?=
 =?utf-8?B?ZEZoaEdQdy9qZ3ZXQngzT29jZGpjeW1vcWowWVdEcG50eEVEK3k3UDBVYWVY?=
 =?utf-8?B?WXk1OEVra2paY1R0K2NWWk42N29mTFRvb2xvRCt5QWpCalNMcFBPcENIRE51?=
 =?utf-8?B?MkgwclNOOTdkcVdxRUs3TTVpNXVuKzVwTnVCRXJ1NWk3ejk0eWw3aW42UWZF?=
 =?utf-8?B?L3VJaTcrSUVabjhMYy95TnlZdXZNMjc5cXdVY002bTc5b2dwZnkvZEZNTVBS?=
 =?utf-8?B?dmV2akwvM3pGTnhYL3laUVN6TjZVTFhGangrSnNlZTd6RmFpVUhXZ2tPQXY2?=
 =?utf-8?B?SlRKMW56blJxMjQ2SU8zWG92QTd3SWl0ckFybDBoUENQeHNIdDR1SEMzUlpT?=
 =?utf-8?B?WHpvcGRycXR6cGh2am5LL2Q5UzU4emVUWlNmQVlKNWR6OGFxMStSdnJVVCtB?=
 =?utf-8?Q?IgGA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e8bc0f-ae35-4b86-21af-08dd6215313a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 09:55:31.8340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehG1AjuNpSRVzAbbQdHdlpw50gzeSF4AdzhyAtU+0OePWYfxUCOEuG9830POJ9zw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887



On 13/03/2025 10:53, Luca Fancellu wrote:
> 
> 
> Hi MIchal,
> 
>> On 13 Mar 2025, at 09:43, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 12/03/2025 14:52, Luca Fancellu wrote:
>>>
>>>
>>> Currently the MPU system requires static memory to work,
>> Currently, meaning in the future it might not be needed?
> 
> No, maybe I’m not clear, my understanding is that static memory is always required for MPU.
I think so too. I'd suggest to drop "Currently" as it reads as if it was a
temporary requirement.

~Michal


