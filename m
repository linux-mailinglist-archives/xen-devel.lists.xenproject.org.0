Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECA167E7D4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:11:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485674.753066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPRP-00031m-KD; Fri, 27 Jan 2023 14:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485674.753066; Fri, 27 Jan 2023 14:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPRP-0002zO-HD; Fri, 27 Jan 2023 14:10:55 +0000
Received: by outflank-mailman (input) for mailman id 485674;
 Fri, 27 Jan 2023 14:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N8iV=5Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pLPRO-0002zI-1N
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 14:10:54 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2064.outbound.protection.outlook.com [40.107.247.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67db86c3-9e4c-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 15:10:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8629.eurprd04.prod.outlook.com (2603:10a6:10:2dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 14:10:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 14:10:50 +0000
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
X-Inumbo-ID: 67db86c3-9e4c-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lP2FHtQ+ejRGZFfhRyXDXZVClVIudzpl6viE/RIe45uPy/N/t/uq7eVh3mGY4Apqx9frKeNgi1Apd65hoCngoghO9zqMQ7e/tITRzekPfWBhsQWNWz6UnP6et837DGfq2Jy6XpTpFJ7S+6LL9GGpXOYdH32xF9fvph91Cz8imm/nfzO+TrjGG+7fZhCctgnn4ydns/KICBIo6/3mtwk0muTBVVw9AgbCFMfqRoiuzjbZDKZQ6nQecck7EC6FpXJSC7AcmZKEj2QgOTCTKnQ3YqiR6Q1d+UO/ZMwowmjrqAEc4IfFp5/0Arn+2BEbs8SXT89/ug2YYrClNhAp0drJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXxGyIXVzWT9P3rWzXFHpgvtXdPourokcZtthskjvuE=;
 b=gBGAefrSKkamu0t8iOpVjnIpspBOHaJI0Vxc1H50Nu/ZfrKtz6oBc9UzV9RgE3cqgKkLI5VJVo2ffIpf2q6y22zP12cs/KMZ/Qu3gWalgAxxVB3P64YVqpsUstog42rjTe76wbWUefTvHG40jppqIlOIr7TTwOjvKKLU0hNDUlal3kmfxDmw1axvLUxbK7rcHpTwvd+8LuczxLPyMiKyOEbJJa4yxPEDI+bztTXW8NDh4WE18m0bKWP8MJ6Ya6iNx1owHttGdE3ogSIbC6SQmApV5ByV/kLXWiEd20LMYS2+jtmr6ApJ5hgyqok59OxCmvmzDcOMfhDmfcUC7OYYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXxGyIXVzWT9P3rWzXFHpgvtXdPourokcZtthskjvuE=;
 b=ocpT0dCViRdX+KwLLhPpMfPH15eq8BEUJwTufCWSK9GUb4nC2JKs/oW/rWwGIKDhAbwqSh+PCWQVLZuNgQPA2xaDENqXFLWeE2+i9ociotp5xTPiRFPNHthMmFmT7i2qVfKMmI+Psq/M6Jv7Y4f0hrhTtu31u3a3bzb7F0gOmWyUeJcTUMC7wCPYtN3cO9EfRAH6S8tI59yEHGbWvbNSwKHKBFwlOlY2DgDraSur/63zfsG9rmzn0oLN8xrP1UFpEVIS/M1cBfrhOEuflUezmnaZ9BVfATHSyEZIUPokj31l164xoLWMrO2xd0nfceITCpW3tLJyuMG5a03uX9y9eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7dbda8fa-d4f3-5101-2e8f-96b4b2ff790e@suse.com>
Date: Fri, 27 Jan 2023 15:10:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 04/14] xen/riscv: add <asm/csr.h> header
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <b26d981f189adad8af4560fcc10360da02df97a9.1674818705.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b26d981f189adad8af4560fcc10360da02df97a9.1674818705.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: 1730a452-c664-45c3-150a-08db00704ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IsVB/DwEUG3eSyqBTXFvsYBNBP5oBGJMLSBjjcnFBlZbHdDVbUxPnSvJ8RNkqT2oEPKJF1eWJ3OgUCp7I2yKaHsTOEQQHwUFK1RSMTD1msQzyMV9y2Nwd4jOUkpjoR5dRUTHJ0fyay2qDjKTGRr1I9ANW3r1NxTst6FMsyu3fHOfl0JVX7HFHI4oYBGe4yikxJclcu7ftbyZkILAxl7YiZg20zENzTOVXOgRmPj82FkRHfTnBHAO24jOnPP7B/o6uQfUKsbr65Rego3nk+Sy4M5a1d1y8smwDLntvt4GBtkoa+VfZ0W1p6I0ybarqbwSbKKF69EyPBUSbj0Jvlh0c5WvyzAdObsdS8qKEApoS6WxZZQilhYxzs4XLE/MmnZ8hury7B6Re5yL6v7MaDtj5/lCl9xDQUVNKGD4s7bmAK2ttUwDNJYZWXbK9FlixhpcL6z83pe3FTNIYHc68xOakpDkDNiMYJMH3U6vJeBLVku9Y0N4xbSxR5TNMWQBXT37+bLNputhyv58LgXvP+PfBj5N3RYsBPt9nxqszNfcH62/ptp7aUVNN5UKBZE3spt/y8ga+ZHbiKAJDX8Csscj6kLHc30oYK0eXlNhii46bOHRbQO0PW2TOg3S0x6YPM8HeNnkMd7Q+vOZ1qQk4kSZf/u+JIA3K67iPNo/O5yixLf0FbdnoTqv8dzfIiohEiWE2wyVdRNwtqLkboVTfSblRKvVXRXJAJYdhwCX/22q/hZpGLOqmjsJAd9PGy88Zc948qi+PgqDoRCPLjoVN6ywYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199018)(2616005)(6512007)(26005)(186003)(53546011)(36756003)(38100700002)(66476007)(66946007)(66556008)(86362001)(8676002)(4326008)(316002)(4744005)(31696002)(8936002)(5660300002)(2906002)(41300700001)(6486002)(31686004)(478600001)(966005)(54906003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHI4bndtT04ycW5OM2ZILzQ4WUIyY2puMzE4dzRGYlUzbXEzZzRpS0RVMmVE?=
 =?utf-8?B?UkxzWEpmT21wSjJrKzZIVCtuMGlxdXhBYVZmTllpNmJKVnczZ0M0c0ZDNG51?=
 =?utf-8?B?aUJpODZQOTFYdTVGTlhoT1ZRQTdZN0RLeDlWUkF2a3ZHTXY3T05kWXFYSUJw?=
 =?utf-8?B?VnY0YTE5WmN3QVBqdnF1ODZpbVdSTG56bWtHVm9GRWh5N1lDRUpNR3luTzRX?=
 =?utf-8?B?bjNEL29pcTBXZzZNVkhtKy8zT0xPMlluQUJYT1dUTTZTZzZBbVFLM3lnN3NS?=
 =?utf-8?B?N3g1WVFBWU4rVWVJMDVjTGcxaFdkKzJZVWxyL3VCeWtpMk05Y0FqM3NTNmI4?=
 =?utf-8?B?eTkxT3Z3dHpMSFAxa3VsbSswQmErcWFHZ0lyTE9ONmh3cVcxazI3S28rNGZB?=
 =?utf-8?B?WHM0OEk0UlNSQlg2UlBQMjRhbGNXL000V1M2NEFaYkZGTmc1OUFQcVBpam80?=
 =?utf-8?B?UFpML01LMjlrT1pXRFNKamRCbnNnWnF4Sk9HUUpBaE1VQXpnVHNzRXpMVVdh?=
 =?utf-8?B?ZFUyZDY5djdUdVVPRng4Rm5CSFRxVUZnK3hRdmpsZXRnaGpPQVpNTFFtMjky?=
 =?utf-8?B?cGU5WFA1OXBLbENtTnBlQ0sxUXNIMjBiUnltMlVOSHJSaURRd0tBK2ZnbE5Q?=
 =?utf-8?B?YkdVWkFKMmRZY0d2a1RJMVNsODBobUZYNW9wT1dscmV6SjdYOS9KdkdQdVYz?=
 =?utf-8?B?bDZQYTkxVURNeDRRaFJiN0YvbGlJbjJ2a3V6RGJFSHorVUJJMXBiK2oxK01w?=
 =?utf-8?B?SDhySGZVc3Y1Nkp6N0xOa00xbVcrSDJpL0toOTJVWXdIa1JLWnhEQ3FGUVpn?=
 =?utf-8?B?MFVEK0ZES1FFT2Y4dXQxREFGT1J2SGMyVi9seTZMa2lnSmRTMnZTY05GUGd1?=
 =?utf-8?B?YTRFc2JJOEllUThpWGlqYjA5MU5tb2xIYWNmNkxKVEJ4ODhSOUJpWFBXVjhw?=
 =?utf-8?B?b05FT25vOXFTck94VkVEUXoxa1YyRXBobVgvaSs1ZUN4UUlnMmNUUVZaY2lp?=
 =?utf-8?B?VGRjazNOWXV1cFBsdHg3SG1JZWVCTTkrWGhLMUtpQmdBSmNTRVVtVU9ibnhW?=
 =?utf-8?B?OUorWmpBeU5RWFRuSHpmS2czbndRTlJCUytSRjBIWnVXNlNsQnJaUm0rZTM1?=
 =?utf-8?B?SWVHZFdOYnZUYUhKSWpQWVpPM2l5L1k2WmhROTVwMzB3Y1V3SXJmL2JLakNZ?=
 =?utf-8?B?cW45NEZLZmdsUnMyQkdtOGxxRk10bTNqS09uZzRNNEJvZjUzNEdDS2JneHFG?=
 =?utf-8?B?MkVodGxQNnJ0VG44UDRNbFZIektHQzN6b254TTh1a0tuTXczeFVRZE4zVGth?=
 =?utf-8?B?dy8wM0dOMGl4QWNlMnJUanBzeUN3aDZJMENCeWN1d3pSNGdweGdDWlRrRStZ?=
 =?utf-8?B?YlpKM1ZlODJIN0g2dy9Ic29WWURkYWNFaC9zRzhGenExT0ptRnpFUUxOQTRS?=
 =?utf-8?B?a3ExYmZCZkJ0OW1PRnpTRVlWVjFhb0k5eTI0Uk01U091N1czYkVmdU5MK0ZT?=
 =?utf-8?B?N0pxVGpGWFRwNXZ1cUV1L2xJcVA1Y1pJRDF2clJNdmdMblhINVl4aGk1UUVX?=
 =?utf-8?B?WGtzZE5RSlo1MzJ2RGtjQ0Zscm0zQ3g0dTdLL3grSzRPV3NGMVM4ZHZSRkNW?=
 =?utf-8?B?Nmk2WFNkQnNIMmZnMjlQT05jdG4wdlpQVXFCdzJMcGdCdnErdXRzVU9kcXU3?=
 =?utf-8?B?RDBhQk03bE9wL1VyK0NFUDBQbTN0UVRzMlBiMjFrWVJ5NXdUQjVxQVBhVVE1?=
 =?utf-8?B?aitRL25IYXhaVFNnNmdwVjExRkFqbkNDczlyTE5lbjZ0UnJWQnlsUXY4bmFS?=
 =?utf-8?B?RVJWRnRKMVBBb2pYcVRSc29HenB6anRIb3B0cDh4bmQ2Z2tqa2pPMXVvUm5h?=
 =?utf-8?B?NklYSVJlK2tSdGZiQW9kYkJoYTRKZlYyRVRkYlhEakVsNGdFa2NheXQ0WkFC?=
 =?utf-8?B?SjA5Sm9ac1NLRFNwbkZLSnZXUFZsRGNtbzF5ejR4Q2U1cjcvZTQ5eURhU1A5?=
 =?utf-8?B?VGNzQ1dzRUQzOWE1VzlyMzNlK0JnKzhMNWxPZVFodGk5RVVPTFVNa09tSTJC?=
 =?utf-8?B?TlVIaUduamJ6NGlrOVV4M0s2Q1J4VDRGdXJqTkJEUTdxbkpwalFmcjMxM0F0?=
 =?utf-8?Q?AymQwJu7sb703YDNLpfrev1JF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1730a452-c664-45c3-150a-08db00704ae3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 14:10:49.9227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1mvrJl6uw5V9Ec4cAN2SpiImz0yBJhTCFm94zBkLkIgVW28nj/lJf6HUZbSNmrSXS2o17ZjQnbzyadp8vI6dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8629

On 27.01.2023 14:59, Oleksii Kurochko wrote:
> The following changes were made in comparison with <asm/csr.h> from
> Linux:
>   * remove all defines as they are defined in riscv_encoding.h
>   * leave only csr_* macros
> 
> Origin: https://github.com/torvalds/linux.git 2475bf0250de

I'm sorry to be picky, but I think such references should be to the canonical
tree, which here aiui is the one at git.kernel.org.

Jan

