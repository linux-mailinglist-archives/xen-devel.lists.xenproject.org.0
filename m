Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9798270F94F
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 16:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539106.839659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1psi-0008Ce-21; Wed, 24 May 2023 14:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539106.839659; Wed, 24 May 2023 14:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1psh-00089n-Um; Wed, 24 May 2023 14:54:27 +0000
Received: by outflank-mailman (input) for mailman id 539106;
 Wed, 24 May 2023 14:54:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1psf-00089h-ND
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 14:54:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df874483-fa42-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 16:54:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7291.eurprd04.prod.outlook.com (2603:10a6:102:8c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 14:53:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 14:53:53 +0000
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
X-Inumbo-ID: df874483-fa42-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwiTDNWsew0Yay0QxfCfZA+XhPtnYJqlsfPB4v4RPG7qiym27+xEqOQ+XvLIa0h7VGXANw179eiRN2AONfU2MIH5OvgtMRXXnrprHK90dC+4qN4bYxrBqVqeq58zu5rNjgY790xmXkQrR0x0XZJJG5nlNL40t87vFpt45luitG524N5oJYSSMan574brD50lAP/AT6KwxWVsTMRbIKjMdvGMzJ/KDSdMVzYDazTuEnMk9Yp6HfkfMt6I0CC6djcSfwQR6jh1Pr/GVzcr1AiKUqxBT0G0ngETvte4R7ztN0HwvvUYUm7S42ZR0pfv1GxvI7Hx7MVQlmco5h4mdOpIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPJUS0WCIC5eRtguMom/gM5IoTXNHIgnDQqjRzF9sd0=;
 b=KwQW6Bo/yNXqEqnx+XOOhYqPzWrGXwai+y3o9ExijwtqiMvOJDFFSNSpbw0PeJjh9rUI+fH3Brm26BX8vQ+2WpJGVHyp1MSj4Cd8Fj0CnWkgc3Kx7k56H8FjhW+ziBgc82Q7RMNtWqRJ3O/9Nkth0zb6GSmZGzvIHPppRi5mAKKR0XHTkVcII9c4MG2TVeg8uSCrI8x+5wLyGKsgnKTh4t3mTXsb8gEisW5XASS+zrO00ZTtvJF17tFEYVsVo4HTyRHJxg/wE7Wo35dGCgtzU2jiiJXdkKgDRe2wn3ck8zWxT4W30NzF26dp+z229hEGlJclY1Fn7QNQbd0JqO66Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPJUS0WCIC5eRtguMom/gM5IoTXNHIgnDQqjRzF9sd0=;
 b=yyNrESG8/oNsFLue68ZjuNRkfywLLAtPvFBwsQatGhHE6A5NFE8X1MDMnT4I9xZxrvYG9hphDtbot8JN7S1YCHlgz9EJu8CG/0it0vL0A0/NQG8y4uC1LIT8MQ0lHA1fmCOEDTibYyOlC6Z9EkxTUaiBpIp2Jo1XPHKHpb/PwccZM5GJCkja/K6fmLp/YC+fQhY5/iPDjoEL93UaSx2dHGXWq3/3R+AfNZvaTpv0vQP0S+HwaxUIWLG7W53Zdkp/hZBm9bb9HQu7H0LQ+dEfYQ7OArp3u/BYnxKf0B4CUX7xfuflkJoU1pu+Xy5wMLVG8pTzcXuX6iFNSBlDUyhq0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c144bf13-9e65-483a-6887-9bd8645f25b8@suse.com>
Date: Wed, 24 May 2023 16:53:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/10] x86/cpu-policy: Infrastructure for MSR_ARCH_CAPS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
 <20230524112526.3475200-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230524112526.3475200-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 28426b10-39a2-4469-3d5f-08db5c66b117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1IQn6HcP/U1gxZV/kq5IL2LBGejYOLy+2azgYsN6rH42AFYqkesHE8vHVn18lGfRqLbWVobFyqvzcOkdq8W3wDkQabFwkkY+5PBo2NLy3mTzobEp6QfQWPIpb5AtvpAj/dMluDysRmV2dUAhLZNeOxNmOuF2OH8RRzr1SSH4il266KCIY0QWl2cA6R8tjEZD3GCq8bdHBiQhQNB1OBm6+WpUPiYKbJb7zee8W4X53V0UX4xjhOU6s003cR04lXglwi/moG3CrHnmHWLwGmUCUAWA3IwGfdVbVg9Xb1paMI2UOdiEDRCLyEj/3ZQ181Edh5ek2X3xPqsipP/8J4lUCWfF2F0AfKY6A/WOlecEHcJ57Fwp8uFSmoZoKCTrEHXgaushgX2MP6MzZehqEu80ax8T2fybxsRvb5ADc4jZmmdK6BS8eDeMX3x5PJo19QmNmbStk+yGLbkC0EBP6YAvlZwdMI26XgjOWz1L0Zi5gPzb9d1bixbeVBPUACYe8lYE15hzb4MQJBYxupBqZMkomWlqSv8sg2Oq8Jh8XecccvR7+//zObSMxTFIESD7uv20zu9qglKal84Cd64DiIMDBZbhKtthmV8mBOWF0OIUHf90uNn4Q4AjfUodJFOXvYAWrfSRRIdrowleTSJKy29t1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199021)(4326008)(478600001)(53546011)(54906003)(316002)(41300700001)(66476007)(66556008)(6916009)(31686004)(66946007)(6486002)(38100700002)(5660300002)(8676002)(8936002)(83380400001)(2616005)(26005)(6506007)(6512007)(2906002)(186003)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHlJeWVHcVQ2YTd6b2p4QzNFQ0c5bnlLdU9YYml5NHBMcmJwMDkrQVp4eGF3?=
 =?utf-8?B?RmtoVVNPVnlBa1pxTWpsNlZnaDNmVFV0TXJFdHRsN0NCalJETS9xWUo3R0Zx?=
 =?utf-8?B?SzRDeVhsSEZQb1RSQkJYcFBpNUcySjFjTnFyY1VJTmtncTFsa0dPT203ZnNl?=
 =?utf-8?B?V0Y2VE1LZThSTGhVVklZNzJjdjBSUmlSTE9Sc0JDaDZQQlhGT2lNUkdYaC8y?=
 =?utf-8?B?c29DUElFQ0F4QkVILzQ1bG0xY3RFd0ZoWGV6SEFzVXRzYmV4Uk93cmt1aUtt?=
 =?utf-8?B?WWlxT09INGRDNjk5amJGNk5wNTJ6MExVK3hxZHdmaDYzL25SZjkwaEd1eUFy?=
 =?utf-8?B?Y3o2RHhZd1R5MzdRQkVkcHBERy84WmZFODVPMGVWd3h6UHJYVUR3ZjdaQ0dr?=
 =?utf-8?B?U3UwM1ZQTFdEMkkyR3dOZmgvcG1xY0RUWXVYS3VvWnNZWkMwbkFvZjUwQ1hS?=
 =?utf-8?B?cDhkeGs1Y3ZPNXg3cloyTFZzYkg0ajF0NHZyb3RZdW42TWF3cmFNdkkvWmFZ?=
 =?utf-8?B?Z2luVVg3SjRHYU93RUhtRS9nN2dYcmsyWEl0RmlRb0U4ZktGMFVTR3dxcUhF?=
 =?utf-8?B?VUcrelE2a29qaWlJS2ptUTlDeUtRVGs5WDZTSXFCKy9MeDJjcnJpandFNGg0?=
 =?utf-8?B?SWxWMUQ2OThLd2tGaWlHOGFIRllNS0JMbmd1Z211Y2VIN2dhQTF6c0MyWmkr?=
 =?utf-8?B?elNJSEE2R3pURENZazR6SDJ5WFJDQ2Y4ZmdaR0tZUjEwU1BTM2NPT2ZuWm5P?=
 =?utf-8?B?aDRLRUtVWEhyR0l5cThpRXVSZmx3MXJPQzhKMEJCVDVwbTkrRnVjMEd4b0c0?=
 =?utf-8?B?MFE2am0wRFVkWjhtM09hSlFSNit5cTN0ZjZjTFd2ZTJaWUNuclFjWmNjOWVH?=
 =?utf-8?B?R2xIaFN4VTdqMEJlT2NrUkpJaHNDa3FWZU1sVEZBT0JQVVdVN2dTUlBJcHpU?=
 =?utf-8?B?ZndFTU95S2ZJZ0JUejRta0pLTHowYVpkc1ZVQ0ZLYkQ4aHJTZjdWemNPVFQ0?=
 =?utf-8?B?YW1Rd2pzcXoxdkhnRStPR25kdGYydFc5dlNKYUFnb3Q1d1VBODdVRnlRVHJk?=
 =?utf-8?B?aHB4UkFaeWJPNDRpR3lVV043TWxZcUFvVVBxeXQ4ejRLamNMVnZXaWRySGp3?=
 =?utf-8?B?N0cxaGI1YUFnb0N2VnJJdlBlQ244SUNsemordHhVUFlvdU9CaG9DVEdIRkRW?=
 =?utf-8?B?c1Z3MFc1aUhSRnpHVUNmTGpHZThyMG9jaklmcXRuSnZqR0kzL3EzSlNaSzJh?=
 =?utf-8?B?bXp1c3JtbkFTZTN6YVZmYUt2L2tmYldHU3kvSTFING9JRTR3c2tFbUhWUkd3?=
 =?utf-8?B?SjlFZ2Ird1doMk9BR051Wk90bE1jRkwzN0RrU0FuNHVHUVNRdmJnRkx3Ykd5?=
 =?utf-8?B?QTd3dVAreVhqNzNIcDN0U0lmakNtTGFTMnJ1WTZ4dEhia0ZWS1g3eVVnZXdT?=
 =?utf-8?B?U3B0ZGUvYkFaakNIMjFYNllPZGpvMXY0bHlDalcrZnI4ZDd1anNyeWNSNjVU?=
 =?utf-8?B?S2hJOGZ1VmY1VDNONFdkaGRETzlPSVJsa25KeGx2c3REYmk4aThQZ3RTUlFw?=
 =?utf-8?B?VmdLNG1NRFMxUlkvS0tNM01wRlZHaDErL1gzYVY5YitJWHZuQ2I2cHZJRFVH?=
 =?utf-8?B?TWQweEJsMHhnWk1YNkh3VXZicURYbVpVZE1vMHNlWkdHUkdJRDNVQkoweGFQ?=
 =?utf-8?B?cVN5SmUwcHpIZytSekg3dXQ4MUZvTENqYzR2b3FoYVpxZFRmWnFTeGQ4a085?=
 =?utf-8?B?K1cwZzcvdHYyYnlxKzY4LzZwNjdISW1qbXhlaXg0S1VTUFp2QUZYQU02elk4?=
 =?utf-8?B?MEVzejZVaEV1ZTc3RG1Kd21tYjJKY3NQb3RqTGdocUpobDlhaTVnaWtqSllC?=
 =?utf-8?B?cGRyWXhGdVRLSmxDZFkxRkt1RmpIREtrWHQ0cVlqZEg1ZHVPazFRSzJKVDFv?=
 =?utf-8?B?VjNwbVUraEYveFdpMUJDTnJjRWVwZlovOXV6WmRBOGhicTR1b1E1RFJGZm9a?=
 =?utf-8?B?SGE3RXhDblpVSy8wUEhnamlNVWdoc3JXWnhpbytrMGlzS3AzTTVDcHVQL3Nj?=
 =?utf-8?B?aUxBZjhub2NKVFRoVm9ESitWTDI3RW80ZENDejcxKzFRZUErcEhwNXBLU01H?=
 =?utf-8?Q?51b1vrqtzzk8roN/paWo4kavq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28426b10-39a2-4469-3d5f-08db5c66b117
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:53:53.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ed7Be6uQZeFfRiI67HB2VWByJztGyZCwSDmH9TKdr69Lyz3j2yEwboBd5ll+tfxSwn9iYBAYokQqFYQp8JyjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7291

On 24.05.2023 13:25, Andrew Cooper wrote:
> Bits through 24 are already defined, meaning that we're not far off needing
> the second word.  Put both in right away.
> 
> As both halves are present now, the arch_caps field is full width.  Adjust the
> unit test, which notices.
> 
> The bool bitfield names in the arch_caps union are unused, and somewhat out of
> date.  They'll shortly be automatically generated.
> 
> Add CPUID and MSR prefixes to the ./xen-cpuid verbose output, now that there
> are a mix of the two.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -226,31 +226,41 @@ static const char *const str_7d2[32] =
>      [ 4] = "bhi-ctrl",      [ 5] = "mcdt-no",
>  };
>  
> +static const char *const str_10Al[32] =
> +{
> +};
> +
> +static const char *const str_10Ah[32] =
> +{
> +};
> +
>  static const struct {
>      const char *name;
>      const char *abbr;
>      const char *const *strs;
>  } decodes[] =
>  {
> -    { "0x00000001.edx",   "1d",  str_1d },
> -    { "0x00000001.ecx",   "1c",  str_1c },
> -    { "0x80000001.edx",   "e1d", str_e1d },
> -    { "0x80000001.ecx",   "e1c", str_e1c },
> -    { "0x0000000d:1.eax", "Da1", str_Da1 },
> -    { "0x00000007:0.ebx", "7b0", str_7b0 },
> -    { "0x00000007:0.ecx", "7c0", str_7c0 },
> -    { "0x80000007.edx",   "e7d", str_e7d },
> -    { "0x80000008.ebx",   "e8b", str_e8b },
> -    { "0x00000007:0.edx", "7d0", str_7d0 },
> -    { "0x00000007:1.eax", "7a1", str_7a1 },
> -    { "0x80000021.eax",  "e21a", str_e21a },
> -    { "0x00000007:1.ebx", "7b1", str_7b1 },
> -    { "0x00000007:2.edx", "7d2", str_7d2 },
> -    { "0x00000007:1.ecx", "7c1", str_7c1 },
> -    { "0x00000007:1.edx", "7d1", str_7d1 },
> +    { "CPUID 0x00000001.edx",        "1d", str_1d },
> +    { "CPUID 0x00000001.ecx",        "1c", str_1c },
> +    { "CPUID 0x80000001.edx",       "e1d", str_e1d },
> +    { "CPUID 0x80000001.ecx",       "e1c", str_e1c },
> +    { "CPUID 0x0000000d:1.eax",     "Da1", str_Da1 },
> +    { "CPUID 0x00000007:0.ebx",     "7b0", str_7b0 },
> +    { "CPUID 0x00000007:0.ecx",     "7c0", str_7c0 },
> +    { "CPUID 0x80000007.edx",       "e7d", str_e7d },
> +    { "CPUID 0x80000008.ebx",       "e8b", str_e8b },
> +    { "CPUID 0x00000007:0.edx",     "7d0", str_7d0 },
> +    { "CPUID 0x00000007:1.eax",     "7a1", str_7a1 },
> +    { "CPUID 0x80000021.eax",      "e21a", str_e21a },
> +    { "CPUID 0x00000007:1.ebx",     "7b1", str_7b1 },
> +    { "CPUID 0x00000007:2.edx",     "7d2", str_7d2 },
> +    { "CPUID 0x00000007:1.ecx",     "7c1", str_7c1 },
> +    { "CPUID 0x00000007:1.edx",     "7d1", str_7d1 },

... I'm not really happy about this added verbosity. In a tool of this
name, I think it's pretty clear that unadorned names are CPUID stuff.

> +    { "MSR   0x0000010a.lo",      "m10Al", str_10Al },
> +    { "MSR   0x0000010a.hi",      "m10Ah", str_10Ah },

Once we gain a few more MSRs, I'm afraid the raw numbers aren't going
to be very useful. As vaguely suggested before, how about

    { "MSR_ARCH_CAPS.lo",      "m10Al", str_10Al },
    { "MSR_ARCH_CAPS.hi",      "m10Ah", str_10Ah },

?

Jan

