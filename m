Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314BD757851
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565074.882952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLhFD-0000oR-Mf; Tue, 18 Jul 2023 09:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565074.882952; Tue, 18 Jul 2023 09:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLhFD-0000m6-Jz; Tue, 18 Jul 2023 09:43:47 +0000
Received: by outflank-mailman (input) for mailman id 565074;
 Tue, 18 Jul 2023 09:43:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLhFB-0000kb-Me
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:43:45 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9514c759-254f-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 11:43:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8055.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 09:43:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:43:41 +0000
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
X-Inumbo-ID: 9514c759-254f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zyt9m3FLMEqr/8WBvX9uqde/JDz5r0yL+k8PG0ajTnXqHsWODELj2urDvzo8ca5b6uZ+LRR8CCsMKkbVgZJM3luaLiJzCM7Wz6bx+7+rAxgIKOILRkxgAEKZ3kK5t+WfuTQZWJlIoSIaccq8un5D+6KnPQkVJ52skNM23+vtyznvRu+ksbz9PcoxZ7e4umPi5V50vJ0riDU+vqplOz0kKwwMwR/69wZ/PXmYlG6welvD5t9cliMb/Og/dbkF3havoRgGbSU+05XmZ/tJM5SSFbxdKpjzRgNZ8qVa7m4m1mXpW25x77M1ey9efZlyKTOHbdu7GBQpEEkHafqU7UsR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWUctEVPj/d7E/ZshGeF44eB425yKRCLn5zMjV0kx3s=;
 b=bcW9EM5v5J0Q4u0RAOezRpSvEdM5gEXtSBEgTMyyb9LySLUAU1EU6PiiGO//Z+wLvIYS/FC8ZZOsKYUW8GA/hPgCoJjNvIjqdPJWjkkDxY9AUKeDPyZMaiAn+U/5hHxQR9eGUv3lKPE2LmbcMP0j+tZyLc6DzAbR4xK3TtZU76W5A4XpjA4UAH49AMvGXQ3jHoiyAlH9/TcZ74fUDYIxPf+gcN6i4FBr+CalUFyOfraihsDYGJ6eUGWsSrzMx54d9oBqnQgY1Em5bL+8YMAy8h9nzeJrCZ6lr7oJrkzQVqxGwJXDvnA0hV7BJlCzmpCYD3MLKYe7QkLWQhkgKcihmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWUctEVPj/d7E/ZshGeF44eB425yKRCLn5zMjV0kx3s=;
 b=vxa0p+xmIfAz8by0pxvmAoyCPXz5yIdDbPCNeBYSkkOu+8031eo2W2cOkMZXtJ6Nelh51DaxhnSsHGM01tK2g7NCJXwUjG0HTmzldEAppdBbboCMyvdothPoHmhb4mtj//R2yHrPSUeJw1mwglhIRqlwkEBcK3mfE3MmGKrVwbQDlKBsUxFIEcpYBANSr56ss5v6Ga2Ving+zUOQe8OyB1PFtK9vwwIsoVdP34fFkAnhKFikwpVOYpeb0/4Z2vCrtohSudkVGvz2dCK4hO0Xg4CgzFaXgDAq1eDuBNPceYO+vv52sczZbgRq0+noL8lcKOg29qd7O398oliRJo5gog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <040fef3e-9a7f-61bc-13f5-c34f6ffdcb09@suse.com>
Date: Tue, 18 Jul 2023 11:43:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Experiments with clang-format and exclude-list.json
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <505E6BDD-823F-4337-8FB9-C3294D180E74@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <505E6BDD-823F-4337-8FB9-C3294D180E74@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: 98192755-e85d-435f-76b3-08db87737826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O9qnw8FAEGybstvrcv8aOlTtGamEw1u5OUfLGsi5wSODEEfI7jb0D4pF3SY8yuFyQY7mzNUrOsnAsiIUujJxTPq1LBKSpvLLuqgamEMJMlgBjEvvrsClRyIsXR8CciBvn6r35Me+O/S+R+oQ1LPn+rCrp+DYxJA7szl5fYmaRjaDdt+NYdgg1yFWRPb4NyPXmmaeQCJTJB425wN5xZmXXmxFUGnAzuNYMWs5ljxRc4V3B0R/OXIuc8iHJ0Uz7unrSY260qejE4iC353MXI1YENe0fCRua+xeTjnowiErs0Oi2FTmNqCCMVB2TrkG91CnsdFHJaJq0R+3gqICl587D7XG1l4HlLHaAiQhVYGHh6JSAuve554zShk4SQHGu7BoM7TROtHiFX76LZEWMZg/1EARpLyogmBWpiv8uOg8GKt8fW920M7SueRVpSCn8BKWGE23ayj8gjNeKKs/Eyh1XYL7L/L1Hac53l7f9QO4b+chE2BFmbf8c2bQLrF70L4x//jDwtFtYbLH3/mwV67kXKmrTxktal4XtkRQeKP9k2hwuhAQxSpGUyDSxl7llY2icSOU583lc/qFj8zMUpojRPjMYLCmbq+b+kHxNUZGQIHZ/IzJ8ogOcIPxq11QBs4Wpx1sTyxNJSGjHIYX2KpO1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199021)(478600001)(5660300002)(66556008)(66946007)(66476007)(54906003)(4326008)(316002)(6916009)(8936002)(2906002)(8676002)(41300700001)(31686004)(66899021)(6512007)(26005)(53546011)(6486002)(6506007)(38100700002)(186003)(2616005)(83380400001)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGlCMzlWK3pGNEVlRENZMG9HMTZ4UFA5L3lyemFadW8vemdLTWQxSEY1bjJv?=
 =?utf-8?B?WnBNOHV0RjhkazNMdXhQek5wVVAzK0FBbzEzbThTenpNNHJlaE5FSUNBQ2l4?=
 =?utf-8?B?bm9MOEk4OTVhbDM2SVdvZTFRVE5MSXpCTFA4Z01wSEpNdC9zSk5uSjBnOEw2?=
 =?utf-8?B?eEhvSFZYODBhK01Za2o0TWZSL2g5YUVoRHF4UktZNHVURFQyMDhPYmVKWnNZ?=
 =?utf-8?B?dzU0c01PRXJYUUFkbkF5M3hQa001WTNYY3VCMlRNNTF0VlNDcGlibmRwM2lz?=
 =?utf-8?B?UjFvQ3NzVmhGS0Zoa2NVdWpwRW55NkkzUHpyMEMrcTJXbjZuaVl6RkpIUkZq?=
 =?utf-8?B?bDZWbWoydk1EdWRDNHFUY29FeDhlQzM1Zk1CaXVIVjJmd2R1MnZFaWtjcFU5?=
 =?utf-8?B?b0plOWdGSHkzeXZJMm51RDEzeVlTSG1uSGpJZzY3cEROUGRjdGhGbEdNU1RZ?=
 =?utf-8?B?blhJZ2FCUGpnOEpTQ1dnWWV4WU9YNWdlWERVUmFGLytLaXVkSy8weWZXNGFI?=
 =?utf-8?B?QU51eFZxZjBRY3p1bVM0OEtCSDRKb0txYldBQW9jNHkvSm9jc28zTHJvZW1I?=
 =?utf-8?B?QlpPWmI3eGlMWG9oT2k2Vzh3L1p3RlVhMzhrQ0pXN0hReC9WaFlSVCsvRFpZ?=
 =?utf-8?B?YnU1Nlo5NGU2ZlZqQ3llSi95V0NPZmE3Q2NQR0ZOYTBLWnhZaHpSR1JmMkZX?=
 =?utf-8?B?OWNTTGM4cXlTbFZPTFVESkx6YnhoYStjaFo0VEZWSW9STG5vd3o5RERaYzV1?=
 =?utf-8?B?TEFkWXRqaTQ2WSttcmJOV29hcGxyQWRZVForQ3JOVkJKSjF1VHppcVVzVm5N?=
 =?utf-8?B?U2RxYktBRktwRTlxNTBZeTlPRklweG1OL1BRU3ZKM0pmNUtiT3lsUHQ0VDlw?=
 =?utf-8?B?SUhHU2NhaDFZbFRPWmVCL1N6bk8rYm01alowTUQwYWZ6OGx5MEpXRlpkdTY1?=
 =?utf-8?B?SGsvbmtQdytnMDZXdTZpcTlWMU5aNjJja1pzZTFLNmwvLzJJVWJZaDJMckJC?=
 =?utf-8?B?MW9MUUo4VW9jTWpvcGFYbnpDK1AzU3QwUjlqWmpqWTFab0FucnY4Szc3MmEx?=
 =?utf-8?B?S3dGUGt1cERrUGNkMWYxbCtjbmVRSjBXYTNPblBDekhMUS9GRSswa0Q5RXBG?=
 =?utf-8?B?RkNaSWhjU01IemJCNVllWUw2bHU4LzRDbHpjQVJzRHQ4RU1DYkNCcVNYWGFW?=
 =?utf-8?B?Si81WHZ5VXJ0RjBzRE9HU0dnYTBmKzBLZFROUHR2NmVXZjlFM05qT3JCTEsw?=
 =?utf-8?B?Y0FUOTNnRGZRVC9HNHg4MUFQbTBMdFE0VXZ0MEhyVEQzY2FNT0ZhRW80QWwx?=
 =?utf-8?B?cS8waWJEZUgzUjNNV2JKOTdsNHRrNVMyZUZmaUV4UGV0aHdSQ0lVdS9jR2t6?=
 =?utf-8?B?Qm9NYkJscWJRTlBHNFNtOEUrckFMWXZ5MzRzYmdkNFRFQldNWEpvOXF0UTJQ?=
 =?utf-8?B?MlZMenJFK054QkwwOGNIQS9xNzdUWTFSckNnK2ZORDJ5Nk9LajNGOVEzYlB5?=
 =?utf-8?B?NFA1OGhLRlVydVZSRUdCVDUvUFNqOXBPcnV2ZTJlQmQrTnRzeHJSWEI5Zm0w?=
 =?utf-8?B?dGh3MEN2UkhjK0Y0S1ZnNjNCdmFmTzVGNEtrQmxoMG5DMFJwMG0wVnJsN0M1?=
 =?utf-8?B?T1ZqVlJpSmYzcEJKdVJVSnUzVVpIRUptWGFxZ0dpWGg2QThJbHpnUzhUVDlT?=
 =?utf-8?B?ek1Dek5MVFEyUGltOS8wYUhqSk5HNmJmT2QzOVkvNTBKci8rM1lZT0d2ejNa?=
 =?utf-8?B?UWFQSVNsRTFKUy9FRzU2ZlhWRHkrS0VGWlhCSWsvSS9tc2p5c21GQ1hBeUU2?=
 =?utf-8?B?RGtjNmtrVHZTT0EvMnVkQVBIUlVTSnFIeGgyaW1ER1hLekRFNTB1ODdZdS9r?=
 =?utf-8?B?aTNwT3c1WUpZbmRUY0Vtc2ZPamxSMExTMXlicE5nRm4raTVBWndSS25NMUVj?=
 =?utf-8?B?S2lxaFpVUUZwVDMrSDQ4TjNaRE0rd1orNkhCdmU4VVhPNDlOV21tbXNZR2t4?=
 =?utf-8?B?L3Z4WDJobkFtM3p4M2g1dnlySHNmT1grRE1mSitWNnNMUWRjZjBGQTNJKzJ6?=
 =?utf-8?B?Zmh4UjhSKzlBbW5OSjkvZy9aUjUxZGw1WWc4SHRpYThJZEpsQ3dtYmp1MUpC?=
 =?utf-8?Q?0T4UhpRrZc1JXt2RLjmossrK1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98192755-e85d-435f-76b3-08db87737826
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:43:41.0765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNDPPxRQQOfAoGzlzO1Xy1sGPfSm/jMMuTm4gJ22fiSeU6YjH3Mwug5Qa0lUbCaHouC3zLkTQnAxfulxec2fVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8055

On 18.07.2023 11:13, Luca Fancellu wrote:
> I’ve done some experiment with clang-format and the hypervisor code (xen/xen/**), I had the need to exclude some files from the tool
> and I thought to use the exclude-list.json, but since it was intended for MISRA, I’m now asking your feedback about that.
> 
> In my opinion it could make sense, because with that list we are excluding everything that is external and not adopting the Xen
> coding style.
> 
> Do you have an opinion on that? Can it be one file? Or should it be a separate file only for the coding style exclusion?

It feels like back when the file was introduced I already commented on
the potential for it to be multi-use, so long as it's actually dealing
with the slightly separate needs. IOW I think it can be one file, but
it needs to allow for files that want excluding from rule checkers, but
not from style ones, and vice versa. Whether specific "comment" wording
would be suitable, or whether instead separate attributes would want
introducing is TBD.

Jan

