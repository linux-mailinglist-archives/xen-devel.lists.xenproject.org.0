Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D98AA8D76
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 09:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975870.1363173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBqdP-0000JA-Vp; Mon, 05 May 2025 07:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975870.1363173; Mon, 05 May 2025 07:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBqdP-0000GF-Ry; Mon, 05 May 2025 07:53:07 +0000
Received: by outflank-mailman (input) for mailman id 975870;
 Mon, 05 May 2025 07:53:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VAKQ=XV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uBqdO-0008MG-J4
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 07:53:06 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2009::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9e04fa7-2985-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 09:53:06 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS0PR12MB9346.namprd12.prod.outlook.com (2603:10b6:8:1be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 07:53:02 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%4]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 07:53:02 +0000
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
X-Inumbo-ID: f9e04fa7-2985-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoXP6z363vO+wCgOaAwFGsT+DFRVgZWgjaWYHhziPBEMkgCmgIY1+2XVJafTgwLMXf3Uv4GJYL2fzRuRAcBlQTpuDW3YW8Ey865PP3k6dlF+2XM6/3AQ2YSI+rN95ZZNcBAi8B/OG1GRG5KLlV53jzFmxKKAhtSTXdqQ82i/NMpQk3nUjOT5FlmNZ4+5a4Ac2JCiIsdxiIlbEtCeK9IrUy35KzmRlPoTkovTRTs9/GccAZAfH5uoUP57Nhnkv3CsimoHbCocAp2Dod2eJ7z2fruQ2QiQVR4mNRf+Y9NYXZKtcWmc2vVtyYqwBOrKaoCBgl1UKDnjWgOlxI5OfpKN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omH6pmtu5g3vZH53Ks/+qvZpK7FmZYOIbCvEAKvwg7I=;
 b=JPHJLtaougnxv+pC1JcB+CYHJ1fddqXCm8fx1yZ4jRT4aHl7QiYU4UK5ISskU/JHJCIBwpYI+/wlJnUc8DAI329Do5De+Rl8qC2jRk8PNE6hsfkGGZPtjnYzMx1c6fiexN6XFVM8woY3rfUMMdmVQ7aPaecze94y83iblZyEa5ERHehLzppuidUKlWMDAERdVSsD3shMOSfwxRUhM57peYkoBEVakBBzVrVvbsn2HDb8MO8hPwHg0k/fdsyPYIbryOw5UvP5TgFTiLb92dcgk6pMC98bgaMO0XeNfd1SuJEfQ1/UCJcVviwfMFBvK6qkRPRk59/amPTBBPrDMUckzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omH6pmtu5g3vZH53Ks/+qvZpK7FmZYOIbCvEAKvwg7I=;
 b=fUMSbP9nYoUF85H6dGN/6P48SMFzIAs4OecKBcTS94bc5opgQHEfsDY6B6HfjIskPrWBJ8Sn0dFwLHuCJ5YCAm48tLLBdeZCLr206MyvM/twXIZhVWr1sZeoqneJQQ8WnaQhpg3+bJTy911xmyaxwcmlglg+06KpwjGo3FxyOOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <fa800ffa-eec3-4496-b157-f89d10b3650b@amd.com>
Date: Mon, 5 May 2025 09:52:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen/arm: fix math in add_hwdom_free_regions
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com>
 <20250505025631.207529-3-stewart.hildebrand@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250505025631.207529-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS0PR12MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2ee788-b68f-4df1-4b35-08dd8ba9dcc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVY4dEhnYmVrZXNmeFUyNXZrTVRGNWxRd3M2WjZKakxFZEJCd1o3TWJzNzVj?=
 =?utf-8?B?cGlURnlIYzhZZkZldUhLQzRQYllid2RVVGY0ZjFYWDQ2VEZ6enc3a092ZWVw?=
 =?utf-8?B?Q1ZCbjlQVnJBQkJkR0lNVXBLY09YbXFBaUJ6YkUxNE93b08rQWFRMHByTExh?=
 =?utf-8?B?bldSMGRJS2l5TTJwYVBYU3FmT0g5YzYvOXExQ1IycGh3RGUvRmtnZE15c0sz?=
 =?utf-8?B?TFA3RmY2d1lCMG5ZTmpjTGtvVVNWM2E3M21iaXB3SnRtZGxqNnZwM202aWdS?=
 =?utf-8?B?c0VvTmlEeHZRcjJYQ3JiaTJrN2NIWVBraEtoSUhQT28vczV5ZUJuejJBdFZJ?=
 =?utf-8?B?SmVBV1AvamRtc3NwZkVweEZMMVNoL2dnUmR6RHUrbnpFbWw5NUtsM2NEbTJn?=
 =?utf-8?B?VW1aZWpUWFcyV0cwNXNVSXRoeHJza2IzcFdkMk1pVjZjQVlBRUhqZktiaW82?=
 =?utf-8?B?cmYxZWVYYWg3TU9nNko2TkdhMmhMc3RjTHN1VlM0Qm5oK2JCQnViSFBKVS92?=
 =?utf-8?B?TTQ3L3NWNW1iNXFMQy9ET0lRSHEwenpneFZRSWdadUVoS1d5b1VqbGpkYk1V?=
 =?utf-8?B?dzBGaXNqUkJabDNueWUrcjYwVHFEV0RzdHRyTm9iZ2JsMlcrTUNTTjVCSnpR?=
 =?utf-8?B?eldVRkR1M2pJZ0xENTFmcTlDV3dZVER5MEZsVkcxR2xGWXFBOERQQXFYbktk?=
 =?utf-8?B?ZFJyQmFYUzdFVE0rcDUwSXlHdTRxNm4wU2prbkJNUE9GUWF6TmpZWCs0Y3pO?=
 =?utf-8?B?elBzc21xazRQVi95Y3l4QmtFS1czUENob1F5TWEzTVpaMzM5QnRUekFpV3RO?=
 =?utf-8?B?bW9CZUtjVG1tQmVZcXgyWE1JaDYwdERIQXFVZ0R1eTRtZEhmYVh1aTB2OVFD?=
 =?utf-8?B?enZrOVlCdTR3ZGdJVnk1bUpwaVN3UHU4U0ZXVVlOWXA5U2t5ZFdDSWp2VFZv?=
 =?utf-8?B?RUlMYWhnYmtmSk11bnFZT0lxUHBsRCtUaGFjNHRXZGZBOE4wNG04Sk8vU0M3?=
 =?utf-8?B?MlJEODh5SHpvWEM4OE1pdVM5dk8wTnU3eUpKNTNsYmZWSjBpVFh4bHRxWFpF?=
 =?utf-8?B?eTE0Y2hETVFnR3J2VjE3NWlldVpGVDhhcWVhZHdZdHBxcjFJQXlKL0RvN3pm?=
 =?utf-8?B?Nkw5U3NlQjk1Ujl0K3pXT2w2MXc5ODlZOGxQUjhmeVlhWWE1K0sySmgvT0Zq?=
 =?utf-8?B?c3BtREw1eHczTDkwTjBQQlFPM09KRHUvRFJDNHZnOVVNS2xBNnJnNTc1eEU4?=
 =?utf-8?B?ZExZK1FiSlJiK2h4cVY5cXY0bGo1SkFVVFRVOTVrNjhiNGFHRE9ySmRsYkVj?=
 =?utf-8?B?dThWN0htVDBLVTJpVVN0a3ZnV0hMYXdhNGhzeDlzU09rbWZBS3RmRkQ3dllu?=
 =?utf-8?B?a011ZzJpS1FmQ2NGbjlDa294QkkyVzlzc0lRY2ZYVmxKL2dIQitUVThMVDNO?=
 =?utf-8?B?MXpJdm0zY0tFUk5vUkJNOE1TTE5WajZEeXdTT1huR3o0Z3R5eTB3dDU2Y1ND?=
 =?utf-8?B?cU9HWCt1VHVHd0x1RVVtMVNiOXVhTmJrRG96UHJuUHpKaTRndmZjUEs4bWpN?=
 =?utf-8?B?WHErZFZQUDE0dUMxUTlmd21pbmp0VWs2NlVqWUoxYjkzS0kwcXhNaFVLanRz?=
 =?utf-8?B?Z1c5dTYrRjBDNTlVekEzdms0WUlDdmZHL1RHd0dQMzdPcGZ0OTRESUF4V0tn?=
 =?utf-8?B?dHRQaEhLc1BhdjN4dDFvd3EraFpUblRBOFRWUEpLbDFlMHh6Q05yT2wzMS9u?=
 =?utf-8?B?ZHArYWp5WFVtZ3I5OVVzMWVtOUVrdmI1SXduZFpjcmlzRUIvY1UvZTAzWjRS?=
 =?utf-8?B?N3FlTytCbGxoVWVBZ3VmbS9xd1FlNnY2cFlNcEFrYitHMjFrUlBTRDlDYW5i?=
 =?utf-8?B?OVk2LzFid0cvdHM4c1g5WWdCSnN6V1Q0cktCTUhlZzE5QVpHeUJyaFhyVGFC?=
 =?utf-8?Q?tKRORr2CnPA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0pVdjNVdWJ2QWQ0UzFSUTA1QThDcWphUEdQQnMrTnFYeDN4NHZabzgwMi9L?=
 =?utf-8?B?TUVLR1k3QXk3SHZiSDZtSmhLekczakFtZ3c5MkZTTlV0dURETE5GZHh4MzYw?=
 =?utf-8?B?VTZBVVE2NGI0YTNnTFFaQzN3WXU4RjJxaXFPNU9IM1pTdTFpc2NoU3gwaHdQ?=
 =?utf-8?B?YkhNY0doTmtVZ0x5NlIyczJtTFMzTmFQckpVZVVMaGFyTzBtWnN3UXp1Tm9o?=
 =?utf-8?B?UTZPbXRkdmRNMjlXdDFGZXF3SzA3N0VZNWp5aVB6SmV1L2NPc2tDbkQ2eXUr?=
 =?utf-8?B?OFdpRno3c0pITnp3aEpNdWdZQkJzZ2NSblZ3SGxVV1U1SUdXSzZ6OWcvbnpR?=
 =?utf-8?B?UDErUkFTbzAxckpHVWVkaGRoeE9CWHE0SUt2cGt0eVE1eDZjbk9rLzFLOERZ?=
 =?utf-8?B?bW0xamt4L3hhOFdXcVJ1V3dFbk9CTlJEVS9XeGdlQWIyS0Z5bU5QTDlOQTRU?=
 =?utf-8?B?UlBSSzBobG9jT0xZWnZMeVZzS1Q3L1AvVWtXZDlCSU82K014bDNjMFpGclhN?=
 =?utf-8?B?TGY0ZklRUDhCSE9wNFhsTmlVZjc0U2IvcHpvUE9nVU5qRGI3ZWxSc1F5dWdC?=
 =?utf-8?B?K242TEJZbysvZlpzWDZOaERDMWlXOGpDUkhZWk5ET0JDU2RnSmthT294NDV6?=
 =?utf-8?B?Qno1M09jTHpwU0RNMU1DbE5UMXdHUjJmdmZUQ1VYQU54MHA2bHBvVmNydm9s?=
 =?utf-8?B?RHJQVXp6ZmZ1K3l3aHRNTGVwWHI2cTlDREg2Y2tTLzJtejYwYiszT3hGTEh5?=
 =?utf-8?B?UUN4YW9BOWdIdzFNMEdSTEZuMVZDSk1yZFRhRVRxYWxzd0s4UWdEK29IcjVz?=
 =?utf-8?B?WmxXaDZZWk5QMjc4WnlXUW9tMEo4d2UvMGxENXNFUXRFS28wSXNDWDNQaHV0?=
 =?utf-8?B?cU11dUFCS3JYazFodThvcThCM1BNWUtraFhSWDNFenhtQ0daaHpnWWQrMDBO?=
 =?utf-8?B?cUkycmpHSmFsQzR4dGJHR3Z3TW1HWm42dlE1S3FrSWJoeldDZk9kRnVodFpn?=
 =?utf-8?B?cDAzbG1acFhwaTdSb3FkV0FhOERSSG9lMG9lLzNjN0xpUlFFVXZONlNQbFQ5?=
 =?utf-8?B?QTVLNUJTaXNpWEJDbXBrblEwUHBTK0dzVHdMcmsvZkJ0TVpxQnF3TVRrTW03?=
 =?utf-8?B?dXBTbzNIMHdOeVhYNlRmSTZMYzRvWkxkc2laMW5ZS1ZwMEtoK25WWllLVTll?=
 =?utf-8?B?R1VjL1pyank1M0pvS1pEdlJPVDY0V3N4U2YxaFpvNWF3M1pJNFRkTVlPaytK?=
 =?utf-8?B?STkrUmUwdXljU3UycG5nSzd1R3VQVDlGQWJxb2M1enFKN0ppNkxIaVBxVXcv?=
 =?utf-8?B?bG9kcE1DYXpoRlpVQXZzRnprcGtGRTFyQmREUGNnTGQ3U3ZlcXVjbW1qQ1h1?=
 =?utf-8?B?QmNSNytTbFJlQXh4dWdLZnVlWlpycFduQnZFdXFkQTQ3MkowRTk5dllJSkRJ?=
 =?utf-8?B?S1IzdHlIS0lVM2ZublJPUGRtM3JpL3ZIZ2lLeVFYaHBPVFgvZnZwYm1uTDA0?=
 =?utf-8?B?VCtYUmx0ZHY2Y3NZUzdnUG8rc0JPbC9BM0puUklxcEgwYzRmeU1FRmhpcG9y?=
 =?utf-8?B?MmdueVZ5aC9jb2hHa0FqQkNhTWM5bEVUVEgyQnJ5UlZGbjgrTGdsV29PSHA3?=
 =?utf-8?B?bEE0ZWJ0NnUyK0l5N0RYZ1RuZ085Zk5qYURLQVc2VFFFNkk0Y3VMUXRnK0Uw?=
 =?utf-8?B?Y21HRjRXRnMraktORDhUeXg3VFg5SmxheEN5ZU5zeDVweUJLKzVzWFg5ZVB5?=
 =?utf-8?B?cTd5elFURU95YlVZYjEwN3dwNVBrK3R6dk5rSU9mUWJuNDJldHE5SmtHOVpl?=
 =?utf-8?B?T0ROSkZhVUtsK0V1MUI5OHVpbE9hd2wxajEyQk5BQ2U0dUxINkhDMzhadjJN?=
 =?utf-8?B?Rkg3QU9oS3plbElJZzdXNkFGTDF2clpZaXpIaXFaZmcwdTRseWFBa0YrOFdy?=
 =?utf-8?B?UHk5TUFrN2F0ZzBXRjU1UXFCNVRON0FFMFI4RjlTR1R6dTFvZ1JYRWt2anR3?=
 =?utf-8?B?Q2VxZ3JWQVA2dEJMbDVwRkJ0aUZ0S2Vna3gzMmt6NDlDdHhudkRubGxxQlpv?=
 =?utf-8?B?QTZPbmFWVzV4TUtCaHZrbE83OHRGMnRycXZwcDdKN3R6d2d3SXBjOVZveGNq?=
 =?utf-8?Q?sIUjHIKClI5C6o2ZwiYAVUFXl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2ee788-b68f-4df1-4b35-08dd8ba9dcc4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 07:53:02.7735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LN7WFpPLnsqpBPRHPy64KFmUc/ScaaZoD4sqDHbf8Yt6HnSkgfZelgrJ5+FpeDiZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9346



On 05/05/2025 04:56, Stewart Hildebrand wrote:
> Erroneous logic was duplicated from add_ext_regions() into
> add_hwdom_free_regions(). Frame numbers are converted to addresses, but
> the end address (e) is rounded down to page size alignment. The logic to
> calculate the size assumes e points to the last address, not page,
> effectively leading to the region size being erroneously calculated to
> be 2M smaller than the actual size of the region.
> 
> Fix by adding 1 to the frame number before converting back to address.
> 
> Fixes: 02975cc38389 ("xen/arm: permit non direct-mapped Dom0 construction")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


