Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A668B66B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 08:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490004.758603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOvwU-0004GD-Kd; Mon, 06 Feb 2023 07:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490004.758603; Mon, 06 Feb 2023 07:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOvwU-0004E4-Hc; Mon, 06 Feb 2023 07:29:34 +0000
Received: by outflank-mailman (input) for mailman id 490004;
 Mon, 06 Feb 2023 07:29:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pOvwS-0004Dy-Nf
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 07:29:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fda60af3-a5ef-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 08:29:29 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9242.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Mon, 6 Feb
 2023 07:29:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 07:29:27 +0000
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
X-Inumbo-ID: fda60af3-a5ef-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FE488rrudBpEmiKEczLbQVLNOfWqcVfjZkKVOKdxmllnsHfA0EPV1eRGP5X1xfc3lmpiT7p+lV31tI2le2GbO7tCyxvr1nsQyNEpO0V5KV/RPuuHZGDR2rz9VxsDXqt4K8BphWtTplVD/I3/31LZFEMVL38A9MwR4MQF9ohQeQoZGU/0ASsLRI3u9s9lE+6RWWCLFpILNNHl2mGiJCDMWbWUlcMT0TjnMMXXD3ER1bduDaV99dB0k85928uXDfwjSXGqpQfoFHtEKCTuu+oQb/v79fqYp4x6Uc3dVlxIGSKW9a6iq8us2w9ZFlQriepigxTfbRum7rq9AR2rZg2DtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpewjFYViQTS3TbTGBCzOzSdWZJ26X2KGd9CmtR29+E=;
 b=AF8xCEbW7IMIqQgsb0IYBcJ/69ir+/0l/2wd+TYivknNMQn+2gQw8khx8oOuAQKSn6zvEX9JUXN0RbVKlFvzrk8J3979TKT7NpQpGwNqu4A3OdWG5OcKAsks0Ts2zqc0IFU41O0QTlL4g7CAzDW3NgmdBJShEuvHXKDTqBl31jzRm2SM/8AVm92B+/L1ux1La1b+/MRWEcFGslsQ/0GBlUXsG9aO9kRf8CL9kH31obh1cjGhHRF2lTPYBh0eQC2KPOcw6zJvJvQET9w3Dd7Mw2M3WvnSEQ139iOErxWndZutuJBGUZ/ogl2BBfeCl6IdFbZpO4lIyWCuPt4ZJY4LkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpewjFYViQTS3TbTGBCzOzSdWZJ26X2KGd9CmtR29+E=;
 b=Cds9JfGLvrwuUnm9/IA+Iy3LnzGIp2kme81vvjHWq8Ef8z39BkviWhdy/Po+KeSLZoDfAvb6e/v+N9GcTCAxOIu163D22Jmej217DagrJYRRyZwtgaXbQcpK4jMhArxtKqw1PZwVrevDpuvR1VcHpvZsUp1kVBHHepBoNAviRQfpMpJ7UimsvpvrMGRo+GW7kiAtTuyoxu8GzhJb9+1cdDD74DhV7H1OGMXQYAntOUCzsYXggqCnUY4AI0mQrzM4ymHvIV3nmd7ap/7MGJGDz7Zi2M/aot+0MYGo8N7mYRm0IP989EvTtn0+uwjVOUFplAg4NBxzUo9m5/qOt0L7Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df51bbdc-ab88-7254-799e-0e2828d3d1a9@suse.com>
Date: Mon, 6 Feb 2023 08:29:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] xen/arm64: Default ACPI support enabled
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <202302031801.313I1SdK033264@m5p.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <202302031801.313I1SdK033264@m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9242:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9c6c67-7975-4164-c3f1-08db0813e088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IntCnNMhxj+79HM7GnnYNEJmQey+sdp9MbAfwmNyXA9n7bM7KNPxaYI825yfqsFIZtHoh1hxvRyXnEOZr5w5XYz91xDq8NnA/sJ6oV5FgmBebiOq+ltHaS0goFRA6IR6d0a6GWTLZbA4CFfSISFFNXSwF5jZoHJawrGnrpl8i+1vr3Qha29xslq9tGJNzIchV4dlNAVI9LWb4fqPSvMTLlbRyrnhRaRQJt/rMmJW8QtF6U5p0DLj+WytEcidYLgbSuVnTr2OAgPuuipP8/re47NshU4bMZDi02e0t0ms7Ts2KVC0Jta7JWciIy4yeJohj8GeHPqzpQwM+7dlYYi/E4B9jvR/4Hpqq5vDQD8ScfjdmxiNc3Atn5y1lvFR88p1c3PNNtPV1kTZXdJFSw6XgC+9XV5sHfJzsospR/o+Js0sorWVx6flIIRmRy0mMmDB2vUXWx4auHZgHjsDu8oLd9SwhWxUma0WStFHLse7xUoTLp/JspGgN3sgjHyxfAMV9G3OnxvQXUp+tWVeSemXVLY0h9tPl6JhzcM4O30wSYz+sYTUpt8VRdfeDrvndK6DF3rDLA+mE0kS1xn7XTczl1X+MaU6XAenqD48nr10FEh3K49vd8f+sOsuhUdHJErnLUVKV/C/tjA63kp4sRd2n8eu5AExhS4w+k2iny5yspiRPsuo7XR3Q3WamUmMACQgQUCy2ClFk/+KVufkBK8WvINXaMEZ7vAaSTsI7px6pRQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199018)(31686004)(38100700002)(86362001)(2616005)(316002)(54906003)(31696002)(36756003)(5660300002)(26005)(6512007)(478600001)(66476007)(4326008)(186003)(66946007)(6486002)(66556008)(6506007)(8936002)(8676002)(53546011)(2906002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWg2MGdtVU44ZVlzaXpDTHFGS1U3aXEwem1VRHNnYy8wT1JrOVlXekJhUlZs?=
 =?utf-8?B?WnlEdDk1ZGY0M3JHNlY1bXQ3ZGc4cVA1V3Z0ZkVkWGUvQnhUWWpWVUhMSjhz?=
 =?utf-8?B?TkZGemltbFlwUmJVWU1kUXRYSHJPRFRpSmowaHE2a2lwSHF0NTYrN254SGdY?=
 =?utf-8?B?TVl3azN2VTRjdFdOdDQ3S3I1eTFKYTZzVDBxMkIxbnphRk1iV2I5dnVPWCtB?=
 =?utf-8?B?eXNOcFFONUxQekttVS9ZVXNEMGM0a1kzeVZGU0Z5a2ZBcVRDZU5tdWVyU3hU?=
 =?utf-8?B?RkV3SlZrWlVFU1NCZlU1Uk9tempJMWEwdFQ3Um9rTFF3RTRZMU1JUSs5Ylkz?=
 =?utf-8?B?MGVSdTEwZEFWenQwRUphM3hKYUlRZVRQOVRJbnNBWXFtbTI5SFRpN3R3Qm5o?=
 =?utf-8?B?N1BNQXFoQTROVTV0eDFYNm5qVDZVa2Z0YnRaTG5FMm04VTU3THlDTjRhV3VY?=
 =?utf-8?B?MGFadDNJRzdsOERvSXFoSklNVUdWL2RGLzZxQ2lzM1p5dGNSbHpoMEZqamhz?=
 =?utf-8?B?NHF5dHF5eEcxWXkwenlMVVRrRXNYWU5Mc01vaHpuQlZyTkFsemVPTklZLzZI?=
 =?utf-8?B?QUI3b0tMNGNKMkVzem5HL2hqR093QTRYcHcyMlEyaWN0bHdpZ0d1cHliZTZQ?=
 =?utf-8?B?Tk12YnZDSWhuZGpiNm5MV29jYjJCR3NjcXJ6T1U2Q3M1ZEdCYys2cmlneXA3?=
 =?utf-8?B?N0dySTBnTktQbU9aNWo0TzZXTGhqNFFyeit0ZzNwZGVhNlFiWnBBN3RFY09E?=
 =?utf-8?B?dGliQlVOS1dnRzNDVW4ya01ua0JkMzZ5QWR2SldwelBLUHpTSWFENkJzTDVC?=
 =?utf-8?B?Y01NYVAyZEg0UXZoN0JLVGZBNWJwbllzSExHRnpkMXpET2JMa2FJOW1xakVR?=
 =?utf-8?B?eVg0UE80SWhNZTRENzZXSFREOXUrRHYzV0FEa2U1K0xleU9zRlpwR2ljL1BH?=
 =?utf-8?B?Tk9qaXhlMTYrbitpZnM2cWQxNGtrazdubFZvQ09scWRRdElydDdTWFNDbzA3?=
 =?utf-8?B?dkEwWjJNUU5NMG9xR2hwOUVzdDhCVkphc1JaTW1mV054Tytldm82a1MwU1hr?=
 =?utf-8?B?NmljMUs1RnlFL1R3eXBXbWJSM3pSdnE4NVRVL2oxVWJUZmZXbkt0SURYdzNZ?=
 =?utf-8?B?MzB5NHA5V2QzWlZzRmgrSHNLZ2RXVk9lekZUQUVrb2g3cEJuSi9GOFhkckxK?=
 =?utf-8?B?TjFzREc1Qnh4WXlxYW9VOENHbnc1SUlQZUlDdkkvbE80Q2ZHelZ2RVVua0tu?=
 =?utf-8?B?d2c3M2pPeXVJSk0rN0lrWDlrbFZ4WGlHakwzMmdwSFQ2RzBac1pkVVhJNjdl?=
 =?utf-8?B?YWRLTjU2cHdqMHZRdzAvT3FkOTZrYlFham5JYm1DSnhYYWluR09YUDNZSkh1?=
 =?utf-8?B?NUUvbEJ0WHpjbVlDZm02eXdRR3pDdVZDTVJYUzZERS9xaVBHUlUvTUJ1WEV5?=
 =?utf-8?B?Z1ZZMnp6NkF4cHFEOVJrbjc3U25JN0RaQndlT3pnWjNjTDBKMVJEQ3o1ZzNF?=
 =?utf-8?B?NW1wZDhlVTVuTU0vTzU5a2VuVlV5SHVUY3UvTXdoYytuSHoxUWhnTGF2N0JN?=
 =?utf-8?B?Qjg5bVRJTTBrWWZQaXRrRzVPemN3WjhsQ2d1RTRrQ2RNYmpKdkdwU2NFYlF6?=
 =?utf-8?B?U2pzOXB3bDhRaElnRXIzMUVqOGRJdlQxSDBKT3RYaEtobHJaQTFDVFJTeVJY?=
 =?utf-8?B?Zm8xaER6b0Z1TXdxbENZTzNGVEoweExTVldSOVZuMDNWQ3pRZnJrMXRtbU5n?=
 =?utf-8?B?aXNwVC9MQ1VrYXB1Q0pFOUxBZ2NTNjhqSDhpWVJyREhuaEpxTXZud0gyOVhn?=
 =?utf-8?B?QUFHOHZtSStGTmd3Vjc3S1FjT0FEVXY0K3hWcE13Z3R1SzJNYWdjZEMxem1O?=
 =?utf-8?B?UVRsTFB5N21KclBRVVVjdllhL1Q0VEJvU3NkaGxBaFRMNGtDVXFPN21iRnE0?=
 =?utf-8?B?SGxIL09teWdlWWR5MUl6MUt1dlV0OXIxSjVQYzc0NldDWXFZYkJYVVcyVjlo?=
 =?utf-8?B?UkJxSWtrYnRlSDFvT3ZzNDBhV2QrdjJSdlFjWUQ3SVVXZG1zM0QxN2N5SWY1?=
 =?utf-8?B?RjFwWEE3VVc5elZNcGpvU3NXdDk3ZTdlN0kxbU8rVysvNkxTczhPL2craGc4?=
 =?utf-8?Q?HqWjAkSnTP7b6rrl7tMYe99wv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9c6c67-7975-4164-c3f1-08db0813e088
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 07:29:26.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51X2LpuoOVz3Z34AdCgTZptnUSw9OE1YJT8B6b9lIttTUorNHdT2VmVPnsWUolw73r9HlMezUUyF8Gb8kGpwsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9242

On 22.07.2020 19:43, Elliott Mitchell wrote:
> Unlike other unsupportted options, ACPI support is required to *boot*
> for a number of platforms.  Users on these platforms are unable to use
> distribution builds and must rebuild from source to use Xen.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

A general question first: How come this mail dates back to July 2020? I
had almost missed it as "new".

> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -29,13 +29,18 @@ menu "Architecture Features"
>  source "arch/Kconfig"
>  
>  config ACPI
> -	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
> +	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)"

Personally I think the (UNSUPPORTED) in the prompt should then go away as
well. Which in turn points out that we will want to reconsider whether we
actually have UNSUPPORTED as a Kconfig control, as its purpose looks to
be specifically cases like the one here. The question goes to Stefano in
particular, who I think had introduced it back at the time.

Jan

