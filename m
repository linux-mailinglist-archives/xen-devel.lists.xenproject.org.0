Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3D87E9F2C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 15:50:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631637.985206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YGC-00025o-90; Mon, 13 Nov 2023 14:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631637.985206; Mon, 13 Nov 2023 14:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YGC-00023F-4C; Mon, 13 Nov 2023 14:49:56 +0000
Received: by outflank-mailman (input) for mailman id 631637;
 Mon, 13 Nov 2023 14:49:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2YGA-000223-A7
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 14:49:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4bac4f4-8233-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 15:49:49 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8078.eurprd04.prod.outlook.com (2603:10a6:102:1c1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 14:49:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 14:49:46 +0000
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
X-Inumbo-ID: e4bac4f4-8233-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHMl+6CaNbWaWCO5ORPLjOFZ1FCi0X7l21EJJsat+7HTimjmrqTA9IDMLbg5fJCXvJrb1DhE6p8FDCGzWnQOTWbD9xHORbbV9kCAjdaKRwjqTnv8NSw40fr+9JpWb3wn3ue/ajF2Ghz7J3Q7619ys3Zd8fYfEfbqzedRou98YS/cnaEYFc5YoiJ2rOT3uYUlc/l/OiLyKomdD1gnH9PSxt5FasdIXgg3phET1sAemj8HrFgNkkqsaPkjev+tTtmkmBUTeQxvtOAY32XgzLGKFhG8n6ukALgX3yG1NmOy4lGUlfgXax5R7uNsfbXcq2OvWbwOlE5L3tYtrDHuYqBk4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ6xMiqB1se4rbE2QAVyseajCja39tDNn+qd4ERKvlU=;
 b=j1+Nx1NUi3ELfKcsJiFwSWPeapVZlgzOmLQNAYba4gdQBcydq60yjIa8J6ZsteeGdOljnKWrBq/R2GchccBjGXh690S4ULooV+rBopGxU8DtDMpLiSVIe23Q0X4PBSBqmNkAVJX0aVv9XvvfdqO8w5CEVQCAgCUQh8ySYuAk3KyXrleUGgbLYS/RPIoKIhUNvK39s8KwI5LJ72t85+69kbqpEjGYdn8afc6EonSY47Oh1kp82G/2uhzDWbpo6Npn4IBTi8S5iDL9w65qV7L+i/L3jJB8pLkTc+kwfXOIL1NwnlZSUPdRLKCjh3QALfE9gX1wj/FWo0P04WUPEohnOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ6xMiqB1se4rbE2QAVyseajCja39tDNn+qd4ERKvlU=;
 b=5bXb8GurMEQNI3Gz5eZhRNhcXjvoXHrTZIrjUyl4/fybFjOr8tXXBemFsnaAc3iA/jq3XyAEQoAKGO09tf6zmbEoqDOWVeNq5+o2qxd/C6R7z+gGNG35x2ql74Ut42ZB0xKtGoG8VmzkWU8JAfQldPo4sB5UEqDc0b+sT2MQN5FuOOij+ocGtWuq7HAiVnxH2XTba9Fh/ULH8e6dwFLsQ7xGcQieWg4B5v22HP1/QSBFpx+4xQ+awHgd5bpi4PgHwzWpUTMHFGkOQ9SUbEu5lnU+4CNo6vYlBYn4gEvEeHOIazpW6OCuJjxftCTDaHoCW4U4N1Abd5zMczCIpLhj8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66d58b06-f7ac-a5e3-6c32-6ad09ec15bec@suse.com>
Date: Mon, 13 Nov 2023 15:49:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v4] xen/string: address violations of MISRA C:2012
 Rules 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <3e9b167738ade3f5249700d61591af95053ae6bc.1699605505.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3e9b167738ade3f5249700d61591af95053ae6bc.1699605505.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7c8df5-c1bc-49a3-2744-08dbe457c79b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dTau5p1QHFAozzkcob8OxiBgRL982F9WKcLENjrz1uE+GBpqaN8QCX2mIGEb+DTYLudte5Pd827Mx8g7vqoZfmrrUEFL5oLZvSwmR0CcewaPSqPhJCmSa6IrIXdj55PW8JJeEcRStlmmq0qPoTFQmcvjQLoeiNNkD2TqrtGqeKogeDZfqDNOHnCVa1zYpianaCMRbFrz8c43t7yDccNGlALXevLSdngnJxwcFhl3HUmLnJYX5+dnt2YQovzUL4qKEYKWaTOdZ2iKFETB2vuk9/cucvhtLJ97FYcFgWKJMu+iCvNemkw/EukX7YebQ31Pk2khUZY9OBUY/ciLfWfdxmNnooReH1DQFTrjpIHmJd6D8U/46gn3ykEtZcq4AbMjit2Z18oCJ5DBzbhrdzvaafeOuc4lVBsDbqDQeicAv1NGrQXhH4vZGfwVLPzs0SE920relS2r7X0ffk2WgxOrF24gTqIYBavESmBkYRQ3AByNSwBBJrQ9GYYPXNbZgh+XyPMbEnf5l8Z7T/ORqD8RB9RZqBhpaIskPyMeqx1/2LV7PgPBmf7wSPDSDQDuI3XOppCszR89LZm8MOb7IkdjOn7I+GwOA8+x68wCgb8HvAY2E74KR0QKLn9oVc79H6+Gm6jl050x+uAznkcSnMqUqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(396003)(136003)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(26005)(2616005)(53546011)(6506007)(6512007)(5660300002)(4326008)(8676002)(8936002)(41300700001)(2906002)(6486002)(478600001)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(36756003)(31696002)(86362001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXBUK1Q5Sko2TEgwR3Vuc0tpS09Qa0FBVVlUNDhGTFFlTHR0cFl0QUYvQXM3?=
 =?utf-8?B?WE00QktyYTFZMmpWbGkwbVQxRlFSZUdlOFU2NWhXbmJybnZyT2EyQldub0hz?=
 =?utf-8?B?OUlHZ2NIL05qdWpXYUlpdzBvRS9Tam1FdWxHUmtxa3NtYlcxZ2JCdkFUYUZT?=
 =?utf-8?B?ZGRCdDVROU9yaXE2Vlh3NldJbUtpTmVuSENKeXhxK2E1MmZqa1IyKzJIL1RR?=
 =?utf-8?B?YU8zYmt0aHVjSWo0YnBTUmtaMWsxYWFyWkxhWWhIazEwOWxaQnZ5VGpTT3pJ?=
 =?utf-8?B?d2JiS0VkTGMvRGI2RlIvVVJkNEp1ZkIzVEIyQWplM1NTZFJsYW1qUkgwNk9L?=
 =?utf-8?B?c2ViYWxmdko1UVgvWEFEOGdhOFVNMGsvQmFMSDhoYWZNMnhEMW9nMzVUeDJr?=
 =?utf-8?B?R3FnODc2L3RKV202M2JNTEl6ZThwMUIzdmJ2WFpLcUhvVFczd2pZVXF2ZFc3?=
 =?utf-8?B?USs5VGkwR0pkY3VaMVBMWVErckJuSHZjODZaSkJXc1pQb3cycHBwV0VkY0Z3?=
 =?utf-8?B?YlVIclNnV2NNMElpREZTZ1lXUGFXT1dlTWdEczEwWWhLQzI5dm83d05Kejgv?=
 =?utf-8?B?TFoyNHZWZ1N3OGpqMFh1YVVmV0F0WGQ3dm1aeWNUcFB5NlVOUmpTMkp5aVpa?=
 =?utf-8?B?d2tpNHkzSWd5VmtMSzJIa0p2b3F5STBEZDV5YnhUakc3VlV6Z0lqZlJSRGZD?=
 =?utf-8?B?ZlRuTFFxT0Z2WUhrV1FCeE5RYWJTUE5XUkxqZ3czSWJLb2tlTUtLdyt2a3Rs?=
 =?utf-8?B?cGN2d1JlRVF1Z2h0SXZ3WDVORE5nQVB1L0tTYlFxd2M1M1k5dDVnMWNyczJQ?=
 =?utf-8?B?V3BINXpGMHR6YnBpNXZrMW1NS0NTSW9UUVRCQUhkMjh2dU5BL1pzaTkwc2Vh?=
 =?utf-8?B?eXhKYkM4aHZoVFhWME5zUjVlUi8rQUs0UmpoeVFsT1pmbGdRd04xTnEvMU1y?=
 =?utf-8?B?SFdFcW44SWJ0TEZBSkhnblB3VU5VcllGVDFyQ2JLN0FpVlZlbnZ0QmRSYXAz?=
 =?utf-8?B?VWpOb3g3YlU2UzFmYzYxQ3E4MlBVc05TM0hqdVpJd0tnOUF2aVNjb0tlaGc2?=
 =?utf-8?B?ZjVCS2M1blh6U1hFRll6aWtncnBqb3pIR1dHcVl6WDNiTm5iNVRqeFYvZ0JP?=
 =?utf-8?B?c1NDMVRycTNDT1ZzUjZwNnJndTY0MzZPWmxXUWF6UitEN2FFWndFaEQwRlZX?=
 =?utf-8?B?Sko1YStyQ0x5SG1LdGF3SGZLUzhVNFJMazVBUy96UTRzZ1llQmxDUzRmaHhr?=
 =?utf-8?B?RnhTNFdHR2REVUhMU0NCcmJwRFZUSnFEWmNTVElzYi9DVmM1akp1cTN3NUw0?=
 =?utf-8?B?TDFvaEdsQ0dXY21CUjhHdnhmSSs1ek42R3g5TllFRmtHMTNETUFaYVlGVGJH?=
 =?utf-8?B?OGN1Wnk5QjUyNGZydE1idG9vOTJMa05mVFlaV3gydmtEbjMxM1pHUWg3dkgy?=
 =?utf-8?B?TG1qVitOTXU4MThzUExCMXJGc0tSNldubmhyclJ0ajhBcUVQdFR6Z1FoWEdS?=
 =?utf-8?B?RjBPVEloU0Evbms5SXpPbWIrUUExYkRNdCtpWmVWbkFTbzNWY3dnMlRRWXhH?=
 =?utf-8?B?b0cyb21CVHpxUTlSMm5aWTE3N01naVZTNzVYQkVxVmFuVXJPb3cwdWRsZHdk?=
 =?utf-8?B?T3hiZWhDd2ZBb1B6QjgydmxvZm41cjMyM1ZJWFFZS3g2aXdhYmRuaDFyZk1J?=
 =?utf-8?B?bUhHN0d0MW5kVmxtb1k1RThxTHl4b0VVL3BFZlFvT2QvL0FRTy85blVKYnZy?=
 =?utf-8?B?ZnBoQmZ0L1hwemhFT3ZDZGlGVy9sTjRsLzFpUXlHUGVxa0RIS1JIT2RCRlNI?=
 =?utf-8?B?bFFWTDN5eGRjT2N0UEMvRjFYTjBDVGR0aWtSOFpCV0FaOHUxZDhSRFpiWXJl?=
 =?utf-8?B?Sjh0TkpqcytzTmF0aEdrOCtKZ2FRM04yb0FsNXFxUDIxaWNDemNLd3BvODlR?=
 =?utf-8?B?b0FmREVLUGgrVFEyTCtBazZacGlsNnBxWFFFT0JrODFyRUlJY3RIL3JzalBz?=
 =?utf-8?B?TWpCY2dDSFpNQmVjV0piemtZSE9xditwZnJqd2lxdUlpL2thWUM0dTNPSXgw?=
 =?utf-8?B?V2JKN2pNVitEV3ZQNDg4R3JWYitRZWN3Z2MrS2Rha2ZpT2hwL01Fd3dRNmt0?=
 =?utf-8?Q?oLDAamzBYwmf6qUlhhuhVmyb6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7c8df5-c1bc-49a3-2744-08dbe457c79b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 14:49:46.6474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPCZwvPJ1cKOsefWUuIPmcv1dQVHEqzFBTvr/80KzwpCGzIEpYj5wTju//W33OnL3Wu/S6UoZmYP1YzBRDwOVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8078

On 10.11.2023 09:50, Federico Serafini wrote:
> Add missing parameter names to address violations of
> MISRA C:2012 Rule 8.2.
> 
> Resolve mismatches between parameter name "count" used in
> "xen/lib/mem{cpy,move,set}.c" and parameter name "n" used in
> "xen/arch/x86/string.c" to address violations of MISRA C:2012 Rule 8.3.
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

In the interest of getting this off the plate
Acked-by: Jan Beulich <jbeulich@suse.com>

But I'm still not happy about ...

> --- a/xen/include/xen/string.h
> +++ b/xen/include/xen/string.h
> @@ -12,27 +12,27 @@
>  #define strncpy __xen_has_no_strncpy__
>  #define strncat __xen_has_no_strncat__
>  
> -size_t strlcpy(char *, const char *, size_t);
> -size_t strlcat(char *, const char *, size_t);
> -int strcmp(const char *, const char *);
> -int strncmp(const char *, const char *, size_t);
> -int strcasecmp(const char *, const char *);
> -int strncasecmp(const char *, const char *, size_t);
> -char *strchr(const char *, int);
> -char *strrchr(const char *, int);
> -char *strstr(const char *, const char *);
> -size_t strlen(const char *);
> -size_t strnlen(const char *, size_t);
> -char *strpbrk(const char *, const char *);
> -char *strsep(char **, const char *);
> -size_t strspn(const char *, const char *);
> -
> -void *memset(void *, int, size_t);
> -void *memcpy(void *, const void *, size_t);
> -void *memmove(void *, const void *, size_t);
> -int memcmp(const void *, const void *, size_t);
> -void *memchr(const void *, int, size_t);
> -void *memchr_inv(const void *, int, size_t);
> +size_t strlcpy(char *dest, const char *src, size_t size);
> +size_t strlcat(char *dest, const char *src, size_t size);
> +int strcmp(const char *cs, const char *ct);
> +int strncmp(const char *cs, const char *ct, size_t count);
> +int strcasecmp(const char *s1, const char *s2);
> +int strncasecmp(const char *s1, const char *s2, size_t len);
> +char *strchr(const char *s, int c);
> +char *strrchr(const char *s, int c);
> +char *strstr(const char *s1, const char *s2);
> +size_t strlen(const char *s);
> +size_t strnlen(const char *s, size_t count);
> +char *strpbrk(const char *cs,const char *ct);
> +char *strsep(char **s, const char *ct);
> +size_t strspn(const char *s, const char *accept);
> +
> +void *memset(void *s, int c, size_t n);
> +void *memcpy(void *dest, const void *src, size_t n);
> +void *memmove(void *dest, const void *src, size_t n);
> +int memcmp(const void *cs, const void *ct, size_t count);
> +void *memchr(const void *s, int c, size_t n);
> +void *memchr_inv(const void *s, int c, size_t n);

... the one "count" outlier left here, with no explanation in the
description.

Jan

