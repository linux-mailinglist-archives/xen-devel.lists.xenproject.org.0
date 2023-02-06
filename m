Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D7768B68A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 08:40:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490011.758614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOw71-0006e9-Jx; Mon, 06 Feb 2023 07:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490011.758614; Mon, 06 Feb 2023 07:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOw71-0006bd-H3; Mon, 06 Feb 2023 07:40:27 +0000
Received: by outflank-mailman (input) for mailman id 490011;
 Mon, 06 Feb 2023 07:40:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pOw6z-0006bX-KV
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 07:40:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83a45109-a5f1-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 08:40:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8412.eurprd04.prod.outlook.com (2603:10a6:10:24d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 07:40:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 07:40:21 +0000
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
X-Inumbo-ID: 83a45109-a5f1-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euuEMO48AbsKKH5Dr0YKaIDMiPiYX4s36tT7suugr95coCWkqkA7oPdivwUkc1XKlqrSwwksPuUKHUdwe7vOi5wnLgJFEgg6JuhLtB+SK7p+E7bVKYnzkDTbhk6LigNZ+XXZnOI/sPlHiWlNPgGd9ZXEDfhW28k6NiQho03VCJlJZmkuBow4xD1wz0RKyMlWGanCpOa+SrwnIv64xi1SirRSR7RjXSiiwITv3beM6umC7fYfxEkfdfsPe1S43dh5Mw9BJREF+x7dCT72jhAys1pL3xuLpzmWEpTPuFvuMnTdOdkJBjeuu6q8Zq1blyZ5heFHXWtES6AmTWa+Dbxzgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeptbsoB+9MhVxyyvgp9Jnu2s7hKqr9T6YbVcTedwk8=;
 b=iUvse3FgonoIiMg/KEOlKyAiA9A9hll0Gs5LORuOqBLbrsY0ewUQe70z8rDsrHY2TRh3mAc9LmgACaxUZYFrwvaBfHzW4jxRn0AsCxGMXFth9zy3OCfqb/f/AQoTcWFdAR/goDYkTqeqo/EdU0outeC4mSOjAzKazxCGYzC5uIvm49ZElB+Uew38WzQTevHYEy5Tf4FqHelmvL/pY8aOGT9vZ/jjCxYV0s5ilEEBcVbEg5SfIkIM7LciN2fH68hBr2QFOXfaVCkRZKCuaCtFQ1AcTwSwhtAg2aA3yGO/34xAxarYhW5Qfp/RTfwQk+Pnt3VCE70aqU2H2oHrPyVc7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeptbsoB+9MhVxyyvgp9Jnu2s7hKqr9T6YbVcTedwk8=;
 b=PQ9MFCYmPox11ncc3RO5lVMqEXhdRAG9hQ5YD+JFkjSFBOYOQ6TiDLZXC+OIUgV3ELgJNvzT4hEqScwPCdx29YBtyvHeatCW+nV0dK3oHrGDTs7Kl9hD4xRyAe1hMGrd6APtyn20LMju/TwhFfxyR/Uir134pgyZdyIm4oS0VT2Q1IEdor64fgptY4gHiCBmpW91QruM98bCY6f9hniFBMw99LwKGujjhCU/abvasOxEI2GwIeA6G7kRSwE+bLd+TYlVMzfi79X5whKzP8k9S6COngw2eVRg9zTM3fTbMoYde3Ca+4lr96S2V79oIA6lI9jK0ZaY7D1ZcDkVgDe5Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <509f24de-a34e-7702-4579-b27bcb86ce70@suse.com>
Date: Mon, 6 Feb 2023 08:40:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Ping: [PATCH] tools/symbols: drop asm/types.h inclusion
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1eaa4cce-2ef2-ca38-56d2-5d551c9c1ae9@suse.com>
In-Reply-To: <1eaa4cce-2ef2-ca38-56d2-5d551c9c1ae9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9746f5-e209-4ac8-cb83-08db081566c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U9J3xTkaaGeufhGUCHbHln5Aew7luYi4qvo3syTxqN0qOWFYEGjLznUaAFU9Y/Uuq6BCF6CNRR40TBQ4LawJBV4Y60IQtTqvgx7EV7lXFiFSVFWQIuLphAfQTHBcy5nr2DDUJLrpxC+h2aPS6FtZHJfWDvIMsNBfcTYVn4mQ00JUfueFxEMlnXAAfjONMAei4RVfL0wj06rQ0UXnVgQPs/tBeIurkoM9x2KsMotXZY0yZuHdnOKUo+EsJPivxNZJXm85jF8hvJItMbKjh9P+fJpJHllZiIwIyGz/FSVT+NBi4/ZT67wwOXFnBZtXEZeYQsSRO6XsE+gGX/6/B1gQaFINCYbKDypZ3lJujEJVbNrovIpmUXBO6Db5DlTZggA6GWBH5D/8LlNIn9a2p2MCTMl8NLKUoWKhc+j26NtYDVm2KOavHIvUHRAwekwq8aJuRLwY2pZykkcBttfOhhBQwvLZzv3I2ZTGY5cO66N9gL0OHX0kz/xQ1TlffI9opGCvpVyb+WR+9RUfYhewLfNZTJ/QvoDvZ2N4otSmo3G9qoC6nhgmL4SnVjMt2lISLvPgvXTV8JqnVg60YIj3YAIzE4PeSatQBeqwe6a1Sk4aKc0MBLZKvwg0OpIO41/memPFDMbbobfxYEmIUpHn4CesTwZRzXehWbV/AogTKcOymDX4Tm1Stu6WfhiXzmr/r9DFp0Uf+znvYK8hNmVDrxVtCXnyYuwPu3gopGKgDPo6aAs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199018)(316002)(110136005)(54906003)(26005)(31696002)(6512007)(186003)(86362001)(36756003)(31686004)(2906002)(66946007)(66556008)(66476007)(4326008)(7416002)(8936002)(8676002)(41300700001)(5660300002)(478600001)(2616005)(53546011)(6506007)(6486002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFRraUIrZHQ5QWhnR2NsNUoyNGxyZHd2TEhCSjI1Y3NFSWR3elc1a20rYUNH?=
 =?utf-8?B?YkpObFNGbGdZZFVMb09EWHlRYVVZRUlTTVUwVWJqem9wMUp5a0J6N3UyOW5r?=
 =?utf-8?B?aDQ5aDVOQXorVGVySEZKUHhNUlRlRHE3cGxaVFMyajBhZ2F4ckQyWkFxdjl2?=
 =?utf-8?B?VEtlN0R2VHpSbkdXWFVxdE43a3JLLzlxeDRlakVaa0IwaTg4bUxwYktLTktQ?=
 =?utf-8?B?S2RYZ2pqMWJoVG03NmVKS3kvbXZBVElxem1iK016NVlDN0gzMkNRU0g4YVZL?=
 =?utf-8?B?QUp1ZFA5UW51UzZYOHM0eUUySkh1WU9nRHVBUEtaZDlUVk9hMGp6alhVMmxi?=
 =?utf-8?B?VFhrYmwwQjNQODFxaFBpd0o0aCtrUWhOQUdIOTNOeU5WN2xUWXhTMmVEbjdt?=
 =?utf-8?B?ZXJ4N3Jrb1gwUUFkWUJibElYWUlpeTZFV3Z0T2UyeTlqQVRWdXo3ZHJSa1NM?=
 =?utf-8?B?bjlSMGUrNlExZ0JiQkJ1QjJGbnVtald0b1JMRU50ampUMGc4Z1EvamNBbFRy?=
 =?utf-8?B?Q0ZtZ01sK1pVRUp5dGlCUmpraGJtc3M4WUE4SlV2ZGFKY1oxbkFBeThIOTMr?=
 =?utf-8?B?RzRWWnZ3bVpNU3g3TnA2ZHYvdjhKYzJjVStQRkg4RGVyaVcyekFjeGl6clhh?=
 =?utf-8?B?VFVkUlBISGZoTUVkamwzZldPbys5QnhucTFjWkdqMDhYK0RkblEyYnVvSTRo?=
 =?utf-8?B?UXBZbGJiSzdNcVJzd3JFS2RtZ3dTRTJ0ZExxWTg0eUNOZVI1WEEvbTl2V3lM?=
 =?utf-8?B?Zk5nVHdjcW1hQWJaRGdOYWFQZFU3Ulk1R1pXTTk0akx0czBFbE1BUlhlY3Fl?=
 =?utf-8?B?U25iVmszVHBrSkEvNmV0UUVxNWZScEFpSlVnVmVieTFuS3pjWW54a1grS1lH?=
 =?utf-8?B?em9za1pmZElSQTkxb2R4U1hRZ09IWVVuY1FtN1htYWVUdWtvVUVzT1I0ZzVa?=
 =?utf-8?B?YUxwbVAyZXRwbUphempIZzUyREtWVXpaQWZ4N2tqTVBVZG5GTC9oM2RyZ0Vx?=
 =?utf-8?B?TUJSZG16SmdremRoQlNSU0g5azVhTWZhNXdZR21aUmtXblVEMjNydE9wK1NC?=
 =?utf-8?B?a0J0anJJWlVKMWtCdjNFWmhHZjAzaHNCd0dWNW0wL1lOWlVUamJwS3RLZlZ0?=
 =?utf-8?B?bmswMmQrVEFtYlA1NHNXTlRNV0JJZVkxb1BMOWg5UUlRUkMvMnNNR0tTUTVj?=
 =?utf-8?B?Ym5IZEtjNUNoT2ZyOEFKVC9TRXBrWFl2ZmMvRGc0R1pkbGl1RjBBSC9hZlZD?=
 =?utf-8?B?OVdSazZUOXFLYVpuUkFpMlpva1o1OXhtRkhNdlJLY0FLK2VWaFI2Rlk4OFFB?=
 =?utf-8?B?YlVQMXNiVkNnT2FLK3pVdERJdXBTYXNSQWJNV2UrbitJMHU4OHJqVU55VTd3?=
 =?utf-8?B?SGliS09Kd2hsTlc1dE5XeHppUzZMWGlXYVNyR1lpRmVCWkhTMWVhY0lMNUwx?=
 =?utf-8?B?UW9TNExHcG9kQjl1elEvRDBPMkQrZGZET0Vsb3FQNitqS2tzVFRkQkllYi96?=
 =?utf-8?B?VWhRRWdkWVNJK3ArTVRjdWtiSWxmRjdCdEpoZEo0Z0RzRkpqYTJ6VjMzaGRx?=
 =?utf-8?B?M1gvazVjU1BlcXprN2x0OWNwVXpVUkMxK1kvSDNOdlNBMmllbUpNeTVjZ0Yv?=
 =?utf-8?B?cE9JK25YaUJSM3ZqM2RKa3UyaVdIbXNTVE9YV255cDF6Qk1qVGpFNVdMczdE?=
 =?utf-8?B?TDMrckNDVHdXYXRtNXhQbGNzemRyclNaaGNQT0g3UnN5NFVLb2JQd3pCclNi?=
 =?utf-8?B?Q1puVE1TblhlaTJaQ00rN0FOTWhYNmVxNXJ3cXVsVW13RmNRWS9QQU9JL1hq?=
 =?utf-8?B?VXNJQmdYcEpnSnpHUDBCUkwySUdiT01KTTY4NHdaKy9KaVArQW5WNnhjRjJi?=
 =?utf-8?B?cE5EdjFwZXdUMmFjTHpGOHltdm40ZlZKZmlkMndvU1FNZXc4WGhuYjBNUFdG?=
 =?utf-8?B?Y2wyNTdJTzJsRi9saU1ZcE9UUTlodU9mQVJLTWs4M1hPSDM4bnYyTzNuWEhv?=
 =?utf-8?B?UDlZOGltdmFVam5IUzNIVHR2SWNmcTc0MWdVcjBFWDd6U2VMRlJjNmNRV2N1?=
 =?utf-8?B?enFCdmhqY0d2bnREQVJ6by9YYmZtbFBMbm5kUmtua3MxSGY3dTFxUlJGNjRh?=
 =?utf-8?Q?H9tjhFVnyNZUDR1EriBN06xzp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9746f5-e209-4ac8-cb83-08db081566c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 07:40:21.7105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMDk1QyD4ijcdUb9P6Vu9WAphnt7AZtt1p5BvbU+3SCYMb5Q5ITXd67rb1PwBqdMvH0S42/IwpDpDzCRdflWWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8412

On 20.01.2023 09:40, Jan Beulich wrote:
> While this has been there forever, it's not clear to me what it was
> (thought to be) needed for. In fact, all three instances of the header
> already exclude their entire bodies when __ASSEMBLY__ was defined.
> Hence, with no other assembly files including this header, we can at the
> same time get rid of those conditionals.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

May I please ask for a RISC-V side ack (or otherwise) here?

Thanks, Jan

> --- a/xen/arch/arm/include/asm/types.h
> +++ b/xen/arch/arm/include/asm/types.h
> @@ -1,9 +1,6 @@
>  #ifndef __ARM_TYPES_H__
>  #define __ARM_TYPES_H__
>  
> -#ifndef __ASSEMBLY__
> -
> -
>  typedef __signed__ char __s8;
>  typedef unsigned char __u8;
>  
> @@ -54,8 +51,6 @@ typedef u64 register_t;
>  #define PRIregister "016lx"
>  #endif
>  
> -#endif /* __ASSEMBLY__ */
> -
>  #endif /* __ARM_TYPES_H__ */
>  /*
>   * Local variables:
> --- a/xen/arch/riscv/include/asm/types.h
> +++ b/xen/arch/riscv/include/asm/types.h
> @@ -1,8 +1,6 @@
>  #ifndef __RISCV_TYPES_H__
>  #define __RISCV_TYPES_H__
>  
> -#ifndef __ASSEMBLY__
> -
>  typedef __signed__ char __s8;
>  typedef unsigned char __u8;
>  
> @@ -57,8 +55,6 @@ typedef u64 register_t;
>  
>  #endif
>  
> -#endif /* __ASSEMBLY__ */
> -
>  #endif /* __RISCV_TYPES_H__ */
>  /*
>   * Local variables:
> --- a/xen/arch/x86/include/asm/types.h
> +++ b/xen/arch/x86/include/asm/types.h
> @@ -1,8 +1,6 @@
>  #ifndef __X86_TYPES_H__
>  #define __X86_TYPES_H__
>  
> -#ifndef __ASSEMBLY__
> -
>  typedef __signed__ char __s8;
>  typedef unsigned char __u8;
>  
> @@ -32,6 +30,4 @@ typedef unsigned long paddr_t;
>  #define INVALID_PADDR (~0UL)
>  #define PRIpaddr "016lx"
>  
> -#endif /* __ASSEMBLY__ */
> -
>  #endif /* __X86_TYPES_H__ */
> --- a/xen/tools/symbols.c
> +++ b/xen/tools/symbols.c
> @@ -302,7 +302,6 @@ static void write_src(void)
>  		return;
>  	}
>  	printf("#include <xen/config.h>\n");
> -	printf("#include <asm/types.h>\n");
>  	printf("#if BITS_PER_LONG == 64 && !defined(SYMBOLS_ORIGIN)\n");
>  	printf("#define PTR .quad\n");
>  	printf("#define ALGN .align 8\n");
> 


