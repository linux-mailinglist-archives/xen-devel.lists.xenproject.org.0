Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C593509CB4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 11:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309984.526545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhTSC-0008OQ-N1; Thu, 21 Apr 2022 09:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309984.526545; Thu, 21 Apr 2022 09:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhTSC-0008LL-Hx; Thu, 21 Apr 2022 09:50:24 +0000
Received: by outflank-mailman (input) for mailman id 309984;
 Thu, 21 Apr 2022 09:50:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhTSB-0008Kw-2N
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 09:50:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 756cbbb2-c158-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 11:50:21 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-KM3JTh85NwSjjbCmQXVoBA-1; Thu, 21 Apr 2022 11:50:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4164.eurprd04.prod.outlook.com (2603:10a6:208:66::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 09:50:17 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 09:50:17 +0000
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
X-Inumbo-ID: 756cbbb2-c158-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650534621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ucCWd1m5mJy2RGEuB9NX07OlO0Yl5UzMnQ2LuAVDK0=;
	b=d6HrfzmnbBVySP4ZkfnVSN96AcuemM0jCf/daKXJ5W4WnLWKLPWb9GPw2VWyys9/eK9psT
	uFL7cqE0pHqmUxnh0mHLbCG8ifXzdVXzA1MFATMCaeQEO3e2jfCESeJcVZEwBJmfubczvf
	KBY3ajl5EfcpcbjHuwkZQNu8Z8nXeZ4=
X-MC-Unique: KM3JTh85NwSjjbCmQXVoBA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgzJKduuTEBZUA1D3GI8L9Ucs9GwPbCCSrdrmt5d7NHzvvTTuh3jQBkuBnro8NDeM1+trzUgbDlKCJh58PK2xL0MiHZCSPwI8LZ2I/9glpbq9DPtEEn08+C9+Nc1r30I+kEI6hScKRGb10YOZnVYAwvda8qqZ5PgfemdjHcfOHk013WkaxKMb8Et327S1HsgXjgYg6s2ctMssfFNBSAxzBGvnFLJkDBuCsub3Xeqtfze8KwkRuBdIXSGNCtt9AeWr2Wb+6RKOMY2HE1qAtEeOCzY1aMXn8+FkGFMgyt1cxDUUwCsHiy1xsA/TDcQ1/Iz+vo9NpurrBdfs8mnhA2yvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ucCWd1m5mJy2RGEuB9NX07OlO0Yl5UzMnQ2LuAVDK0=;
 b=HahP2DlJS8XZwbOS/51QqeLbx/6C28SC4pOykRhOXIvFrHC6On0phNhgI57dkDdqPyiTKBE00OsHu9uq9X5pnsTvBIeR1o4eoT8TPrJwu7mbUjf1cj8IwHTRmei+JrKX12UtGjDd9T2GAs0A38BTs7a03wG24egzsCjWOBTKWL+OMKST+FRX4zWI5efRzGGosjsqhIYIXXTurebxUTzVlh67p7HivJojdtwY+xz08flMHoi00sdVknudqwIJehYNjzWvOz5T4IsKnERrlUoum/6C2AgUEQa1c+WFTQTjkBo540KMMhl8gH8wW0Tw71NpeOYoPeLOwalBOQfYgnq0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0bb48681-a78f-d32e-f989-822dd5e54b70@suse.com>
Date: Thu, 21 Apr 2022 11:50:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220331092717.9023-1-roger.pau@citrix.com>
 <20220331092717.9023-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220331092717.9023-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0010.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61f26bb8-0c4b-42f7-f513-08da237c576e
X-MS-TrafficTypeDiagnostic: AM0PR04MB4164:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4164F8A65E6F5AA3B8869B1DB3F49@AM0PR04MB4164.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hGemch1Tsz2txySXItxkMXJjVBVD48H54vR3i225Ag36yZhSJYx7cFJynNoPnMgQk0PYtOSSUYEz11VM7+gcP5SfwgH9eAND5qlnrzUJ/BcJ1DAMAKXMoT7VAHpnX9lNZxCakGcUyxPD3xhevFwnygbf6lhOTSZ2YOHJQ02yWt/TIqok4KiczXCdnb/jMD1ThggVqifYonxMaxp6lKJkmmppd726eTy38G9hjcv8cAHZqFpV/xtnBeKJMNUyNAtO3wggKRFPs0bsr5W0dknmHcAv65qhHFlcaqlZe6pgkDptJjk4MPSXvZ8U3PuWH2ypUAI/zXESOerlY87HeY4UM035kcc0tTr9nwLMdhCZ+eF757NN6tZp/OjoltEW8DgPqnv+ECOluiDu00+Y0HBnCXiNV1iplq9rjyl/hZxlN6NFK2vQkCywpgMo1EoPrZU5+X2hwQuQzIGw2EH8Mo+tYT9HZ6Bqoyi9sMJdpZArrdmfCuljJHykmVOnNG5k2hCbVV1AF9MqygxLrpoE+yzZFzWgIsSIjJ6Dp0cbcNWrQxKo5fqXfD+tni+ACr0Y+wLT7Z8vwXLezBCYV+9uLmZnZPbl8USA1T7f3PxwV75QgIMv/69525Y77SQNFBs5QPKl0/IvSxlKSmEZIQheBfqtr2BPCLn5vUquauWUYU0If0iPM+oCLlceHmQy3q34rVBfUTMmVot9N+48F6wUuFBqvftCMQkOTWdbcyKMBwrT6pgTK0F4RKSRDyNvqr4pJvSP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(186003)(31686004)(26005)(6512007)(2616005)(2906002)(36756003)(8936002)(508600001)(66476007)(31696002)(6486002)(38100700002)(86362001)(5660300002)(66946007)(66556008)(316002)(8676002)(6916009)(6506007)(53546011)(4326008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enIxaHliaGdUQUJyaURSY09KMVZDZjVrYUZpMlBoZGlUakErT0dldlZiZVhI?=
 =?utf-8?B?dG0zbVRuWXlYSmg3bFgvWERvUGg5a2NtYmtUbGtSWUFNQWVVeWZWVjlKZkl2?=
 =?utf-8?B?Sm9zeUFIdFlqdXYzbXNxTXBSSld2bG9TL1dqYVhvMC9UTjFyNG5DZU51dGlu?=
 =?utf-8?B?ditSUFdBR013OTVRdGU4ZSsxVDhnRnQ2RnVXRkpOTk4xRmE0d2FyMzF4cTIr?=
 =?utf-8?B?TjdXeVNTa1NCb01ncllhUitJRWZ0NVlDLyswSUdzcXQ5S2M4T2NnQnQvcTEw?=
 =?utf-8?B?NU5JeVNyMXY4YWRpNWNtZm5tRDl3eUFxNmt6WmZPOVBGWGJhd0tqTWxRWkt3?=
 =?utf-8?B?TWV0ektzTzBrUVdjd2lka2lZRkhTR3VvQjF1c2NOTzFtTTJDbnF0TDNHYkNt?=
 =?utf-8?B?N1ZBdGdhYkd0UE9iMHNKME15WlNEVjRKZ2pWSjFwRVplNTdOeWcraG9UeHNh?=
 =?utf-8?B?Z21Jd2NoWncvNEIrbXZmdFduTGxSN0RZb3p6N3JIZDFKUDZNcExyZitWRzBE?=
 =?utf-8?B?V1ptMXN5OEpIQmozWlBzSkFTcVlwYVo3MVR5Q2NNVGNBQ09WcnB1NWI3WnhV?=
 =?utf-8?B?T2JZbmdNU2JYVDJ5VUhhcGxKazh4bDZPZzVOU21JVXpCbmN0ajZEbzBBQWJM?=
 =?utf-8?B?MVhMdlR0Z3dVQ05haGtqalhNS1lGSE1IVTg2TEwrUXhYelQ3d1Q1OGwreXUy?=
 =?utf-8?B?TEpxLzRBY0I1VzFwMUV2bWdjNVBNQzhkOHd5RFluN1orajhMZDBZWnFkQXIz?=
 =?utf-8?B?SnNVMmFmV01vS1RLRkVjZzFzclFIMHhJVTU1RXNqQzJkVHJmTysySXRFMVV0?=
 =?utf-8?B?Y1RteVhoNk1HamJ4WmZxVXdpdWZsTmtXQ1paS3NSdUpWUWFwcWI3Ui9LVUNO?=
 =?utf-8?B?S2VOVmdhQVp0aVF5MDRreTI1U2FIaFp2dStsOU9WZFRBbzBXUWtvbW9YWkFK?=
 =?utf-8?B?MittZTg0RFRhN3kyWktxd2JZeElsOERxWDlRMFYyK3RidjNKZ2k2VEdDOEd6?=
 =?utf-8?B?WEpvSWdDN2NYamlNSGRyaE1yb0ZkZ0NEZ3dsa2diNTBxbEY1ZFdpVGx5Qkxz?=
 =?utf-8?B?UllNbzRtNzV5VW1xZVhvWWhNOGxwWUFud3duSGpKdUxkR0ovdUpZS2MxMG1T?=
 =?utf-8?B?Sm5VZERkTlhtWWNsd3RaSHhwMSt0UnUyMmQzemlDaEtFSDd1TXV4RHp1NkZH?=
 =?utf-8?B?WUY5UFhSSFRtbVZzNXZ0NjFJb0VYeFhoeG9ndmlSQXRhbmpQU0MwKzZ5a1lD?=
 =?utf-8?B?TThrYVZNQ3RFSzJlb0xEaVNoRDhNRG1hQ1RNbGI3a2tHTG8yYWRPejM0Nnkv?=
 =?utf-8?B?T0l0NURsaVFJMnFYRU5mOW56U3E0d1hCSW95TDFSL0Q0Nm56MnBheldkcWQw?=
 =?utf-8?B?UnBpSlhWUStOR0x4NWd6WUpqUUY1VkQvWVVEbTRDQUxNOWFxQjg5U0dHMDJY?=
 =?utf-8?B?bzl2U01MTmRHQWdOR0lDd3FqS0kzNDdOU29IWkg2THhRaTNCWHRYNVNDbmgx?=
 =?utf-8?B?RjJCY0tPb1JxS0lFTVJLRWZqSFlXSkQrNWV4SkpCbjFLQmhMNDhlN2tnK3Fm?=
 =?utf-8?B?VjNvSmNpSEdCcEttajQxb1l1NEpWcit2VmhZTlNsMWlESzVHN2tCcWQ5dnZn?=
 =?utf-8?B?Z2NGbFRDSXdYQTlVRytYZ3hXTVA0QXhZR3B5TTYvaFRCYksweE16NEdPcTEw?=
 =?utf-8?B?UytqMUg3Q01aU1diQzV3dzNyVWtZVmlrVmVBeWM1aHlPUzVmWTFGTGNLTTQ0?=
 =?utf-8?B?b3Rvd3BxUlhFMEFnM1pWRWJMTDRVeGFEWXdxdDFPbkc0MElGZXp5T0tTd01p?=
 =?utf-8?B?TU9nK1IwY2llY0YwYXNBc3h3ZkxsWVBjb0V3ODliQ3JxZzRTckdtdVp5M09T?=
 =?utf-8?B?TEtKT1BOeExnNlZubGVKK28zNDBQMURWWEJuOTN2TzEwOGVpVmI5NW1PbDVX?=
 =?utf-8?B?N0pUak9PY3JDNnFqYWdQdTNWOU1GL3Q5SEk2TjdUREo5NS9kOHo0NFVnUTMw?=
 =?utf-8?B?OVYwd3FYRjdId09DOFQ4L05RSG0vcXNPV0t3RHNQVTZyK2Z2dUdzdnpzMzhx?=
 =?utf-8?B?NEtmVDRrT1JBUy9TWksvS3FQR2xFWGRuTzgzMUIxVzRwTUxrb2Vuc090Uko4?=
 =?utf-8?B?WHlBaUxZclhkN09HQ284eU5OVkVlWUQ2aTVWRmVpZ3ZNQ1hDNUZxNCsyOUlG?=
 =?utf-8?B?a0ZDRDRoT3hRTmNQRUFWeDVldWt0eTNWekhacmY5eUtEWDU4YkdjYk5rSTRm?=
 =?utf-8?B?VU10QWVpMlh3WmY4ZWlpTmEzVDNRYkZTZlA0RU5IK1R4cHo3Njl0bklQT3E2?=
 =?utf-8?B?VzUvNXZBMTFlTGhLb3lHY2lzdSt3R2dqVzh4RmkvWlFQTlVLaC9pZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f26bb8-0c4b-42f7-f513-08da237c576e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 09:50:17.7558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVzFUsQpxqyYIaBSDUWZoRTBtK8H/xXYnYZIG2bmBxCUUWNkYW0iDsoYc2brLDojEHjScLwrHkhWYaSCHbxB0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4164

On 31.03.2022 11:27, Roger Pau Monne wrote:
> Expose VIRT_SSBD to guests if the hardware supports setting SSBD in
> the LS_CFG MSR (a.k.a. non-architectural way). Different AMD CPU
> families use different bits in LS_CFG, so exposing VIRT_SPEC_CTRL.SSBD
> allows for an unified way of exposing SSBD support to guests on AMD
> hardware that's compatible migration wise, regardless of what
> underlying mechanism is used to set SSBD.
> 
> Note that on AMD Family 17h (Zen 1) the value of SSBD in LS_CFG is
> shared between threads on the same core, so there's extra logic in
> order to synchronize the value and have SSBD set as long as one of the
> threads in the core requires it to be set. Such logic also requires
> extra storage for each thread state, which is allocated at
> initialization time.

So where exactly is the boundary? If I'm not mistaken Zen2 is also
Fam17 (and only Zen3 is Fam19), yet here and elsewhere you look to
take Zen1 == Fam17.

Just one further nit on the code:

> +static struct ssbd_core {
> +    spinlock_t lock;
> +    unsigned int count;
> +} *ssbd_core;
> +static unsigned int __ro_after_init ssbd_max_cores;
> +#define AMD_ZEN1_MAX_SOCKETS 2

This #define looks to render ...

> +bool __init amd_setup_legacy_ssbd(void)
> +{
> +	unsigned int i;
> +
> +	if (boot_cpu_data.x86 != 0x17 || boot_cpu_data.x86_num_siblings <= 1)
> +		return true;
> +
> +	/*
> +	 * One could be forgiven for thinking that c->x86_max_cores is the
> +	 * correct value to use here.
> +	 *
> +	 * However, that value is derived from the current configuration, and
> +	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
> +	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
> +	 */
> +	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
> +		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
> +		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
> +	}
> +	if (!ssbd_max_cores)
> +		return false;
> +
> +	/* Max is two sockets for Fam17h hardware. */
> +	ssbd_core = xzalloc_array(struct ssbd_core,
> +	                          ssbd_max_cores * AMD_ZEN1_MAX_SOCKETS);

... largely redundant the comment here; if anywhere I think the comment
would want to go next to the #define.

Jan


