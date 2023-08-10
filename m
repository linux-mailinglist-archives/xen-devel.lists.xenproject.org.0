Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE31F777C0F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 17:23:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582115.911706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU7Ut-0001Ag-4W; Thu, 10 Aug 2023 15:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582115.911706; Thu, 10 Aug 2023 15:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU7Ut-00017f-1M; Thu, 10 Aug 2023 15:22:47 +0000
Received: by outflank-mailman (input) for mailman id 582115;
 Thu, 10 Aug 2023 15:22:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU7Us-00017Z-1J
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 15:22:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0a495e4-3791-11ee-b284-6b7b168915f2;
 Thu, 10 Aug 2023 17:22:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9951.eurprd04.prod.outlook.com (2603:10a6:150:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 15:22:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 15:22:40 +0000
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
X-Inumbo-ID: c0a495e4-3791-11ee-b284-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyeEuT31jGRyVdkO3PyM2bOhSJPGZM2+UHF3Xao9ph176PQHZ+9Bmf5ETCae5dKQz+/6QDoALS+Lsb5yz06gnIP7aS8U3DfV3ADHlXUonD8nLYXAUcNNGqtQDGPAMaEmKcTjMHm6r2HpylEAYg3OReBkIdQAo9/x4OCVaWmFwAHjOA1SAKD5XN/NYXguTYdFBeY71oPmppmtYWHBcfw2ylp+UamDpdTnWOKXj+3Wr9IEG8eqTrmQjHhSU8wWsrd18ZE0lrI8xO7w1BIVKUmjQP7J6b8eRKzqHYWi25lXULg3j4pgt7UPutiMhlG0FU5PiHPvh8yYpe6rdVNWnnvhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yXHXhGgAaZBvGO/HRjNHzgKfun6sR+8AGqHAx4aN+w=;
 b=gH7WVrFcXRVPCIS0jTLd1EW4jCWsfxghw/TBT/q8DEvUgSVbyHHS9WKiwR+/1IATyHeyd2jLHXUBFeEAfjK7o84uv4G4+gwacRzx8aii1fMzNxeMk8fvrrTDW8oqLVbUMdRLXK05VjaZ5hmVqIOgcZjNKXr0nra2Apxwj5HlTq+GUSKFN1e5ZKz8bVY8XRmpKTPhrjIpnp9HVovLLi6X0/WcFrBEEsP0wA2Mqd+g6decVKUApneP5lYR2w24t8HrQLuNNNPDZwitgAZlspYLr5KivVG36jnFA7Zx9GWEkTR7xDZVO4mln7qtZgQ+jb6XYAjvJzLZIRiRtWM3zeWMPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yXHXhGgAaZBvGO/HRjNHzgKfun6sR+8AGqHAx4aN+w=;
 b=q9MYga5Svovm/LzMEtJiB6IZNilME6MTqq5/BSLaj1+9mNeauB03002YYPbH755jYoe/squoIYTFGG9GSsiTdZumDUxF0gBXT8EQq/bNqHT0pgDA81Hs27oMjb4GlCmJ2+Yu/t0Km1++9NSmGhAHfCc/smcaVAO40fKS05g4etrcygRKvf8EKkLhd0oNr0vqB7/UjJScnDIKTXvEb5+XWRb6xg4sOomah8tVy8mIRG9PGQauz8wHSzh9ARE+/kHXN2tHobpZZxXIgeKWyg7QasFQG8eY63DFsFhyqIRvUG5oVqUeQADax8V+r1jfFOQ688MkCUunQ+RO3ENbcwKBmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f700da2-e5a0-2a58-e147-6d4ad3ab544e@suse.com>
Date: Thu, 10 Aug 2023 17:22:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/cpuid: enumerate and expose PREFETCHIT{0,1}
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9951:EE_
X-MS-Office365-Filtering-Correlation-Id: 6425e173-c97a-46ae-8374-08db99b5a295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s6PHsXJ7VST1HS9Zv/ay0TOQm/7X7DX5DIJC4iZ1y0n2+nQ0nZdQEw5HkVL4dGzIoD5YUE3gaCvfBqc7QOxsPZXq6r7X/sVYAgFCkFa3p78GD5rUzpLqL4mZ2V6oRFA/xkuj2v8dDJz5kLRPyISf9OI0ONX2SoWZM2JxDgDNJwHS6BZBh9EEH8zmk0L6rWJNXkyAwMoOflOJwdv0feZGeiSZgEZxANBUnsZMhqXmSesdb78/rMo8HceegwTOzwN8CFAe+cW04wk/J01UVj1ppXDcGFGP1sbYbGRIDM08C5Ad5FnSezgIa2gWhMZ1UjGsynBaVWmz3TUSTe/NOsdZvdAvj5ty2ixHjxGHW+wWO5Zbc1p2vEwyo+ACVmUWEQDBMnesvJtVKw9kz0Xt48xaPU+pNW4q4Qf36ftNurQqupQY6NLgYs0Df7asQSGPV5TmSytTWH0d3N410aT8cyEXW7nRcgO8ZOJIE2u/BULP3WHY97cjNX/4NRBzF3o0ul355HAj6JJJ6UnpqauF2zvvVxX9efgcml51VoNd7Ov7TTIsX6uQ9lQemmdgraqQE1LLfLU7ATJmC0+Rc7jS3GrMJBX7xVhZ2gf2++NTygzyOMXVsTd2X7DzlpaFV50+GEMXbWEzbJmSyVUglFi6FNxIqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(376002)(346002)(366004)(1800799006)(186006)(451199021)(2616005)(478600001)(6486002)(6506007)(26005)(31686004)(38100700002)(54906003)(66946007)(66476007)(66556008)(83380400001)(6512007)(6916009)(4326008)(316002)(8936002)(8676002)(5660300002)(4744005)(41300700001)(2906002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmNDTXk4UnB5Z0VubjRqMExWaHdxU2FSVFZPYU5lcURmWFEzVUx1SXFHeUJ4?=
 =?utf-8?B?WVhNSE9USlE3RHNVdGN3NjNneFdjOGNhbXpwa2VpUTdDMjY3RmVTQldnVlRw?=
 =?utf-8?B?VFpkQUJUMXlnZWZncldRR0N6WmxBdlhDSHRjaDdEYThQbm5SdWk5d21GQU9k?=
 =?utf-8?B?TjBoc0JBK1Zhd1VzazFVZ1BvSXJKRmFUTEJXTDNONTFyMGtMcW9wNkxvaXN1?=
 =?utf-8?B?QytXMWJpRU1KdFBZQ01mZ2JLVytycHcvQmNtUmcxd1V1ME9qOGt1OUtJQW5k?=
 =?utf-8?B?QTM2aVYrRmMzZzNhaHBNUDl4bHlvQkQyVFVCbU5pNE5udEFueVA3dGQzVUhv?=
 =?utf-8?B?S3hZbHd2aUNGZEVmZG9hUk5kK2U5WWxibkI3Mk83VklDM2VkSUNTWU90Wlds?=
 =?utf-8?B?NkNhNFpKZDFyT0tYZ3BZUGhSZ0FYRHRwcGQvd2phcExkakhoVWU2VlFVeSto?=
 =?utf-8?B?N1J4bWh5cERCOEZra3dUK2dWUSt1aTREbitCeklMbzF5b0JZa3dRWEN2ZnpG?=
 =?utf-8?B?NncwZWR3OTk0SXlrTmlzaTZzZVdvejFPSk5lVXVZVHpJTks2UVpOZStERVJH?=
 =?utf-8?B?Yk4rMGxJNUIvV21zQVlBbzhGOVdGYWppVU5SdTFsTkZ4MmdDOUF3QWs5QVBC?=
 =?utf-8?B?VXNSRjA2RVEyOUdFRGlVZmtYZ0M4ZTZKUlFPbG1vMHRWRk9jTW5yeVB4Qlpa?=
 =?utf-8?B?YWt0M25mM29KUklycWVDT2xpeTVlRGJEWGhKcE9Zam9yNUViZjZoNForanVV?=
 =?utf-8?B?WDdNS1MwSlZnNUoyZVdqUHZST2orTDJkQnFUTFo4VjZwd3pod0g1MzgwdGhm?=
 =?utf-8?B?VGtiUjNLWVMzYzdzaUt1ME5lYTVGQmJMSVNjZlNvUS94bGQ4TzJXbjlEa0ZV?=
 =?utf-8?B?Mm16bmdkeUwwb3pPdzFZeE0zTVlub2JsWC9GeDU5aDZoUWpnc2REbWdWdldn?=
 =?utf-8?B?NFFtekF2WFhiazJSekxnT3VFaW9pSlF4Rkw2Mkhma3JDZnNpS25sSjMvbTV6?=
 =?utf-8?B?NGNpdW9qTnZRV2oyU2d1ZnBoay9jU0U0NnEra2k0QmdCTUZWdEVIZzRQRHVw?=
 =?utf-8?B?NUErR204UGloMDFkR3VUTWtUazBSYzFubTdNeGs0UnZrendFRmd3eVR0MmVr?=
 =?utf-8?B?MHYwK0xldDMzem9jdVI2MktlOFBLKzh1WExnR2ZVZEdHK1M1K2VianhTZTA4?=
 =?utf-8?B?c0FtOXQzUHVubjdPK0RXQlhGRTZyY0MzN2pVS1VBZkVtVFU2QUx1cXcvRmw3?=
 =?utf-8?B?WlJGV25HUmtXR3VSbmZrY3kyS3d0Z01vREpocExLY1lpdUlURDZCSElvRWdX?=
 =?utf-8?B?SGtVMEg0NzAyZHV0NzZsT3NRS29NeDFVUys5NnY5WGwxandIL1ZnWmU4OHR0?=
 =?utf-8?B?ei82Y2p1VlBMa0lWUFdEM0xVd0QzYTdTV1BveEhvRTQzOXhSV0dWOHRUakhT?=
 =?utf-8?B?SW1WQ1diSUJzM09nbnV4WEk4UEpXTG9YOW5hZm0xa0VmaGMrNU1haTFHTGNr?=
 =?utf-8?B?aHZkbHNkNUdtd1NEbjVvVGdQNlZBTE4yWlFud1oyWHBiMllaZnNyeUw0emln?=
 =?utf-8?B?ZGJPNkRPNUoxZ3pkRTRKZlZoYnVnV1JYR0IzaU85T2tYVDdGOWdCejhDejJS?=
 =?utf-8?B?VFcvSUtueDZmWnNVSy8vTjR0N1dpUjhyVFFMWFdCcXZ3aFpsTDdzTVFpU1Zp?=
 =?utf-8?B?aHJCZ0E1MWhzQml5TFN2a0dvR0dSNFV5L25LSjVHUWlRRkQ5U01JcExEQUdi?=
 =?utf-8?B?TXV6Z05zc1dTdUY0elUxMnBtOERMWncrREhDZ3o0ZHY0Ly9QVWNKUUcyaHBi?=
 =?utf-8?B?OW5yd250alRIbTNENjRodGlENS9ocE1ydnUrd3VmRVpXUTUweTl2RDRHMEN6?=
 =?utf-8?B?WWdqdEtJWnhVczZyd2ZCM2kzN21MbWp3aEhlODFvSVdQbENLb2pWdE54cWpa?=
 =?utf-8?B?UkZESnJSTWhRRDlhUFZ6SG5qN1VxTlh1QVlKS0Jia21zYkdrQS8xVFZOOVJx?=
 =?utf-8?B?UkNVVFVFbGFkdm9JZUtNOE5YeUpOVFBVNkkxcWJ0cnU4NHdxcXlBSWhIRUIz?=
 =?utf-8?B?L0FNN0d1M3pNQk9iNk1oejNQdzZHMHRWbG1TTkd6MDZZbU9CbW1pWU5maitk?=
 =?utf-8?Q?bNoC3+TYuvWD5BYl9UkUHM0HB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6425e173-c97a-46ae-8374-08db99b5a295
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 15:22:40.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpu0K0h06OLYnnkmHznClKjLmvIUlKCtD0aD6WFqnseKt9kBx5+E0MWvzBVswjDvGCfRQmxcDh6vSdEfKg/44g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9951

There's nothing else that should need doing in order for guests to be
able to use these insns.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -220,6 +220,8 @@ static const char *const str_7d1[32] =
 {
     [ 4] = "avx-vnni-int8",       [ 5] = "avx-ne-convert",
 
+    [14] = "prefetchi",
+
     [18] = "cet-sss",
 };
 
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -309,6 +309,7 @@ XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
 XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
+XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */

