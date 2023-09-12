Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA779CC4E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600231.935874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg01J-00018s-8i; Tue, 12 Sep 2023 09:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600231.935874; Tue, 12 Sep 2023 09:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg01J-000165-65; Tue, 12 Sep 2023 09:49:21 +0000
Received: by outflank-mailman (input) for mailman id 600231;
 Tue, 12 Sep 2023 09:49:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1UZ=E4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qg01H-00015x-EB
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:49:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a408625a-5151-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 11:49:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7906.eurprd04.prod.outlook.com (2603:10a6:20b:24e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Tue, 12 Sep
 2023 09:49:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 09:49:16 +0000
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
X-Inumbo-ID: a408625a-5151-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tp18ZnJZoxb35tUj2PuLlBppdcd9OlV8RA3ckHqGV3UsnA0GWGy63ORtvvPOEfGW8kcF7HwWPxZlWckQnOkWQvuJqE9dMh1PSQGgtGQghw//qkd5i34bWzrBmB+oJJ6rPfp7yv/zyJ3MxwPyYrco9CFrwKTb6BPLbN7VSWfsD6QWlHiamwWXuckSggWJVcIU+r4n0PGeOGCLIj0A5ZAuw2zqLcwbB4wh0WwhYaAKPRzwuGrqYqg5PqpTZJ43tLoPGUWXjvIGI4SyL6xmCCS7OgfYEC+leaORlH+rC3Y+j1k+Wxe7waljB9kv0+zcBIpbWQtbxXxIQRrVkSJcCMDydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Du8d1hhfOBMOkMiYhC8V8eRXVi7QybGpn33qI8OSCpI=;
 b=Cnlh078d02isuVCY471LCAXeqCVN9Mv+sOdlgIuUcq0yCX0+a2vAl9WAUS76rqg/gWKHbr7gHgc9uTo/RX2T7DOH8K6b3KN/zoX99IWkBtZgl5zEh4vo1s0TSaRco0m93Hq+MbdUF/ZP4q+Wfg+EmsqWgNimAv6vUpEynA79RUFzVnECtrCpbXi0EBRdimOd5sVQeBHy1L3oqfX0g5/NMReYD1HYABIuiuNrb+I4JukYhA9o7odhv7pwLmz9lKDDskCFfwML1W8Iob5AoAENbLnwHmo7GXMJAMIofYnh7VgmL20WJym9ciFCGFvHcoy+9VgpRyObQBbFgYk01jLmrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Du8d1hhfOBMOkMiYhC8V8eRXVi7QybGpn33qI8OSCpI=;
 b=l7QRKpcpgWbw0M4FqOpSUWeABeBmTneGZdascIwbFE+CiCuJ4u0yHK7SEVt9Pk8Cyqh5oZuM2Ci/MrAW9eIdPmRwioUW378OCvkQkK3L5why2OtAFo2/AhimK1VVke4nsTjifoB20zPiezXEQYxd6JWlztZ3MMxRl+nBp6EldjOPj3tvBe0twt7w+XNMdf3SU2b3L+xyGQ1MpZe9dQhf8rEJb34msSUMNZIS1B7rWI5cghx4TcDkKNtIPfL99jHLjPgNSwB9UmXGUL4n7Bl5ejcSTBEBHHZjQMI1+PF8gX/xCjqtHhxPetK96X0RJR3icQg9J+OQ09gx1m2CYr6jCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68504895-ee95-105b-eae9-01efe648a3b8@suse.com>
Date: Tue, 12 Sep 2023 11:49:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 02/10] misra: modify deviations for empty and
 generated headers
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <6da900e1692ac1c1fff554da53dfbbeb1e42ad07.1694510856.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6da900e1692ac1c1fff554da53dfbbeb1e42ad07.1694510856.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f9ed164-9550-46d6-0532-08dbb3758725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/GnBoBQbHuXJS96GsfiKcRhQT/YRGll8Qv+jM68gEFrOjJsi/tx9UV+Grydty9Nu663DXDS4ouxLGz1065dZY/f/isb0c79iWOGlPVlHvDWs92JUNoOgtsU9w34uZ8WD2WFi40GZmhndJjCqgiKhTwrIEU/DXNmiLuKJFLrBZtR0UhbgEwayjVxSvhPzHHiMdp0jqKoCX2YEmLTeEqM1GkNBabbsbTia5/I1iopqqj3wE0tOd3RVEf9DWSSxIG7QIGuGToG3b1gLevhweRoSD2fj/sUC6JfzTza1uWQazWTg9npQN+uWwn6PvdE+Nwp0faCCenEBJtzOX9Ba+NYDWqoc0V+dwe2HNF21xkma2INln4gzEDa1/HM/ciW3VH5gfie64FlB1suprUL+DvuduvrtlWaUhwpEts0VRiSjg4Mk+EFVP4pM/n3NB7GpH1nkS+4kPKi/oCbCok2nQoIf2CIihfFQrU6nRjekJIhb9+z7ns8PcK7Hn1dfprMAmMkNmXOkOCFGbbJ2RNi3PENer5neyH4tNrGXd/IaH3Gge53020BVzLDWA1lck7gX7tYXaVd13EZ6tVYSjbi+Hv9FNJ0tRVyoBy7OLlHYMpHG1YLBzvumuPVQ29/T0f8AqKMfR5nUscQ7iggO+d+lwYx36Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199024)(1800799009)(186009)(2906002)(26005)(316002)(41300700001)(66946007)(6916009)(54906003)(66556008)(7416002)(66476007)(478600001)(5660300002)(8676002)(8936002)(4326008)(31686004)(6512007)(6486002)(6506007)(53546011)(2616005)(83380400001)(36756003)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2dQSjdURVRzQUQxT1VPUFhiV3RieDdCMUtTbnI0STVweU1LWDl6NlRxVWpw?=
 =?utf-8?B?Tk50REIrWFV1bU1DcFJhR0ZPU2dwOHBnMm5icFZsSnFLMnFiQ3Y1ZDRHaGZO?=
 =?utf-8?B?ZmErZGdURWd3VUdoQzg1eFpGU0ZaNFFHNnozZitrR0tVSmUyZU42d1pzdkZ6?=
 =?utf-8?B?YlB6dUdhMllyOXFBN3Z3aEhlVUErT2IzNkgweW90SlNPQ2dqVjIyYTYxSXJW?=
 =?utf-8?B?THBvdUtkclRWMVBnWUdqcUFjZnBCUTl3djJBS21MQ3dHSmc2QWo3b3BWbjlt?=
 =?utf-8?B?VTltZjNwVkpTV2tGWE1XZmd5emUyZVpVSUtpbGtxb2FZVTVSUm56QithVTg1?=
 =?utf-8?B?MWFYRldaOGtjS3NPMzJhOCtMYlNMeE5WVEJSZ3BGNFJ5WjRWNy9qSDhBZFNW?=
 =?utf-8?B?bDFDMEV2RWxvWkFzWTFJeElBdk1qdDBXM3NkM1hBSnp3bm9oSTFTbWJORHJF?=
 =?utf-8?B?RXRqdk8rbHNuQm9DVll1V2FrYUZRNkpjYlJxR2lWR0JGSlRkUk9RdWZQMHFV?=
 =?utf-8?B?YXRqNkZSeU1LaTR4dE00OThvaWdZNkE2R0NvR0ljZ2FSZ3hGaHloejU1ZmRo?=
 =?utf-8?B?clZpOHg1NTlxNVJJZkxqYnU2QXRLVTdjaC9IQnAvQXBuS1RSVDdhekxaMnQ1?=
 =?utf-8?B?OVlwR2x4NnQrNnFzVlpSeW5mY2pWaGpyNmIzNHB0b2dCcE1tWk5MaktFMHBX?=
 =?utf-8?B?WXIxb21pRnpXNWVOUGpDN3pnQzgrQm9MSkk3WUhXbTY5ZnVERkNWTUptVXY3?=
 =?utf-8?B?ZHBrMndMcXNURXpBdzgyUmxKL1dmZSt6T3U0R1hSb1Z5SmxtWS9Cb2p4YlFB?=
 =?utf-8?B?M2ZzeUFDdGk4VVFPRmdPSjJCWEJBRjZnUHlMbDZxT3dSNVRzK3Y3YTRyRWZm?=
 =?utf-8?B?MHlnREJKU2IvUEJ0YmhGWkFsN0RiT0xJTkttYzYvbGY3N1Y0Wm52b2tNdUt5?=
 =?utf-8?B?eGdYTWlpZnlWOTBoY0RYbG9Za0VXNnpQaXpHdzQ5dXBtbFREdUsvaVcrVTgr?=
 =?utf-8?B?WGdWcTcvM2FrTzB5c2lWZnE5bWk1blhXN0tiTnZZTEMwQnk0Q0tyUlNFMlR0?=
 =?utf-8?B?Mkl0WUJNQUdmMUpWTjBYS1UxRHNaL3JyRCtqS0JUR0ZJZHZhZ2U1UVdyV3p2?=
 =?utf-8?B?amwrbE5CTDdJY2lEQXdPRzcwakVIazh1YmRQaTVBY0d2c1VvTW9qeE53aFRX?=
 =?utf-8?B?dDYrV1RKa093T215cGJzYk4vaVFIZHBTNVJZNnRrazkzMUJNNGFXRlN2b0Ix?=
 =?utf-8?B?anJnTk1iMzExbVJiZm90NDJBY0RISFZEYXA3UmNKdGVKaUw1WmI0eHU4aUZr?=
 =?utf-8?B?eTIyUXRpTHo2dTBxd0VDMnpCY3dwRkdNS2M3VWtTd3pmZmozUjB0RzVxQkxF?=
 =?utf-8?B?N0NIT2RJQlh5amw5ZS94VTVuY0t6V2hCQUd2Wk4vVTBqemRyVGM1VHhyRFpJ?=
 =?utf-8?B?MzFSZVVBaFU3TC9pakdzcSt5YTZncE1lQUMzWGVPbUpENEJQYUlpNGRTVjZX?=
 =?utf-8?B?Qi9GYmtWajkzeEwxNGh5UjZDU1o2a20vZXZ0SE1LYW1OWDFrUW5xR0NiTFpl?=
 =?utf-8?B?YUZvN3BadWNaYlo1bUwrMktNVno5YS91VDV0TDNwSHJ2NHBWdDVhN0JSSEYx?=
 =?utf-8?B?Z0ZkaFZiK1dPWEZpOUc5Yk1HeXVVSEcwaVY3TWtpbDIvRThFdTFSUGplVlNR?=
 =?utf-8?B?bW84QjVFRWRJK0ZVekxWQjg0MDFOVmVkSTE1ZXFaYUxhWFFLelFVbEsrQW82?=
 =?utf-8?B?bDNZTHg5aUp0SHVBWnN1aUJZcUtuY3lqUlNWVk56Sy90LzJZY2FJSlZ2WkUv?=
 =?utf-8?B?SzZqTHdFaEk5KzFncXBOSjlROWZibC9jVEprQTdVZ0p6cmhYUlB2REpWYjFt?=
 =?utf-8?B?QTJrQnhXdi96eFBOQTNaRmJYTnk1ME9BYnNXRWFZYk45YmYxN1o0OWNaZ0xn?=
 =?utf-8?B?NjRpbkVXaE9YTXdrWTRFMVZNY3p2cHRVNjVaY1FkWTFadUtSUldDQ2pFcERC?=
 =?utf-8?B?dmpzc2p3N2lhTnl1Q3ZvVGVNOFYvWHl6UXhHUS8rTHY2S3RHRi9QU3J2Q29i?=
 =?utf-8?B?dGlSK05OZHFaOWdaUUZjTUptSWt1VFBWaW92S0JpcmpOZGhFZ0VvN3BhZk5W?=
 =?utf-8?Q?2FB3d413LOeIz6gDcwM/08r3S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9ed164-9550-46d6-0532-08dbb3758725
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 09:49:16.4326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQX/aVmqiy2EflReX6RFiVLE/tcePnh0dJz0sc2cXvljaGOGmHkokwRfhYuc3ywKaWRGIfSOfJ95U+urE1Im0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7906

On 12.09.2023 11:36, Simone Ballarin wrote:
> This patch modifies deviations for Directive 4.10:
> "Precautions shall be taken in order to prevent the contents of
> a header file being included more than once"
> 
> This patch avoids the file-based deviation for empty headers, and
> replaces it with a comment-based one using the format specified in
> docs/misra/safe.json.
> 
> Generated headers are not generally safe against multi-inclusions,
> whether a header is safe depends on the nature of the generated code
> in the header. For that reason, this patch drops the deviation for
> generated headers.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> ---
> Changes in v2:
> - use the format introduced with doc/misra/safe.json instead of
>   a file-based deviation for empty headers
> - remove deviation for generated headers
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 7 -------
>  docs/misra/safe.json                             | 8 ++++++++
>  xen/arch/arm/efi/runtime.h                       | 1 +
>  xen/include/Makefile                             | 2 +-
>  4 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index d8170106b4..9313027af1 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -78,13 +78,6 @@ inline functions."
>  -config=MC3R1.D4.9,macros+={deliberate, "loc(file(api:public))"}
>  -doc_end
>  
> --doc_begin="This header file is autogenerated or empty, therefore it poses no
> -risk if included more than once."
> --file_tag+={empty_header, "^xen/arch/arm/efi/runtime\\.h$"}
> --file_tag+={autogen_headers, "^xen/include/xen/compile\\.h$||^xen/include/generated/autoconf.h$||^xen/include/xen/hypercall-defs.h$"}
> --config=MC3R1.D4.10,reports+={safe, "all_area(all_loc(file(empty_header||autogen_headers)))"}
> --doc_end
> -
>  -doc_begin="Files that are intended to be included more than once do not need to
>  conform to the directive."
>  -config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* This file is legitimately included multiple times\\. \\*/$, begin-4))"}
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index db438c9770..e8e200cb0a 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -28,6 +28,14 @@
>          },
>          {
>              "id": "SAF-3-safe",

Noting this, ...

> +            "analyser": {
> +                "eclair": "MC3R1.D4.10"
> +            },
> +            "name": "Dir 4.10: empty headers",
> +            "text": "Empty headers pose no risk if included more than once."
> +        },
> +        {
> +            "id": "SAF-4-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> --- a/xen/arch/arm/efi/runtime.h
> +++ b/xen/arch/arm/efi/runtime.h
> @@ -1 +1,2 @@
> +/* SAF-2-safe empty header */
>  /* Placeholder for ARM-specific runtime include/declarations */
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -53,7 +53,7 @@ cmd_compat_h = \
>      mv -f $@.new $@
>  
>  quiet_cmd_stub_h = GEN     $@
> -cmd_stub_h = echo '/* empty */' >$@
> +cmd_stub_h = echo '/* SAF-2-safe empty header */' >$@

... there's the same off-by-1 here as there was in patch 1.

Jan

