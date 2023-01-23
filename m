Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DF16779DB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 12:10:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482757.748434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuiM-000708-23; Mon, 23 Jan 2023 11:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482757.748434; Mon, 23 Jan 2023 11:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuiL-0006xW-VL; Mon, 23 Jan 2023 11:10:13 +0000
Received: by outflank-mailman (input) for mailman id 482757;
 Mon, 23 Jan 2023 11:10:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJuiK-0006xQ-PM
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 11:10:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2080.outbound.protection.outlook.com [40.107.6.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 803ea0d2-9b0e-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 12:10:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7480.eurprd04.prod.outlook.com (2603:10a6:10:1a3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 11:10:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 11:10:07 +0000
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
X-Inumbo-ID: 803ea0d2-9b0e-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9hz/iO31AnNCDzJ52ohe2jheCWNwrLUB8+OWAsPqQbElbo8GA5JiEmD5CKtKZxcdrDoGxcjGblA9CIzwspst5Ykip31kbuB0NStwCwq4raXUGAIMu68Zsz/LzRSJtwUYC0zJWLBHzZMpF+HShE2tAbMoE/I0NXT4zy4MAT48OB47ceQNVMA5cWbS4ib83/izFAnxWK0GjKKE8u5odEBunazi2ZAU6BsG9UD8Sosd2b68FMQ3vmioqtBJLzICzYPH5NJWUxbpdE9ATvZjjI97tfpEatmqWEaaUL8Q5J3Awh2nQixp2MOiE2oo9rQWHWsF/UFsgyb3YdueCnANztOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TI0/4CHvullVluTKKM10tQVQxLa2eSvSGGZSIoHfyV0=;
 b=ATgzWRUJgsYF9fWtfz/zkRsLHBvs1jUbfrmB+4fmTwTFiu7ZIB5BZKMXWd9utVaR/O96JQCbyFkIoEXx7WK60u2yMc2x6HWPvRea36e3F9v8J2oxf0RSH0PH6Ag/e1LUswhs9W05em7akOpiyPVNCNiLnDnphMbcKENvFv+uJnNa2RcyWdL/kvAwwZBORQALAEMmF7jUIZnB+kJkVn95IWVMfjCGlMMctQ//k30HjLy2u4IESUmi2Jldc/4fZ9DPCHg2aLs5alIpSD62/ZC3mjy90URePasmziYQgCQ1POUg/YYMQTke+0D/BmnStAaUFLs5og6c+wSnjHKZo66lvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TI0/4CHvullVluTKKM10tQVQxLa2eSvSGGZSIoHfyV0=;
 b=J0cBw6XVbLhPGZ1TDvMEJnqBbxt/1cUdggMYOAMR13bRuHlvhGvkqzx4qW9+wcTSKdCDdEFF4SCQsFSWke+zduYrMEshsA3ZjtH4WUgBPvC7LW/tH6fldpAfa+Wi/CkLIHT3chlBUAjgYBRA9up1aK0w+9o+C+GZTSMkmfreAkS78/lEblmsT3uf8RBr1Yz8Zk+euKOof+Jr8fiwD6EwbWRPKOKnF64Yf5oZFOKHOnoLobZkDVOuSTGoVIP+gskDhxrGnGy+EmptCsiGyxBABdtd0jHHLeLwWFBswd4oIyROPGJaCrdvqtNkf7sRZwL9BSznHtUTqw19bLjRYxRY3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35c3175c-47f7-80c9-c417-1320aab02de7@suse.com>
Date: Mon, 23 Jan 2023 12:10:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 05/14] xen/riscv: add early_printk_hnum() function
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <633ced21788a3abf5079c9a191794616bb1ad351.1674226563.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <633ced21788a3abf5079c9a191794616bb1ad351.1674226563.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 2052be8f-e2bc-4037-e602-08dafd3262b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MZKc3iOReDUxw7s+n6mVsK/BfIvDfw6mi3SesFxAKrQCp3TXMtbd+j7+qnv7bk1IcgKd45rr/l+DeNawG25B2ZC1dvs1bBDBFa0nULlRtEx3zW4tv/eMq7A+uSyJ8TLZwQFP5NL5cZWMk/QrSaJzG996J9juX9/KhuQtlzPASMxeF30RjqAx/5LexGqAsciwElKgk5ffqm6PJhH6er1W6Opgk99SYJ91ZIdwNJPLzwrtpsNmNm7Ztd0yOzTPxJDQkxJskWiVn1tfyaltqY/qKxx6fvdq9K1uTYpIyQFB2LupShCIOim/PT2ef71KkFPpuh2MCdRKYj6dTy10nthqodzhN7saSCeslhmmGjgVB/DyLUFUfNSTiojxbTpC4ITv9/l/Z4JWzANhxrMFMNlE5t/JwZSydiPg+dVdDcfvLm0ndVUujLWrlWEsmOSPE4Q0TRPAJZBQPIyD3opiUvjQc12P1srkolWvdfZ64zjlZftArJrfb+L9m/EoX8pX5jnXgYqs0YgTvjecPlHRZaw6e5gK99LS1Z/XSCW/GdKFUV4e4MwqmcroER93x4pe0xryj7CXCFY+U1khDN2+DweXXwFmD/U3wXPYeyvZfCKeZgnypmMG9E3GnMgviVxG1O+Ogz/aWyg3YL05GlKlBx/IIZ7gI8JWsed1g7oxocbSMM6AG7Vh9mNxVoHF9vqIKK/hWzO86imwnP0d6P4RtRBl1gkA9BPbpdDsZ/Nxbe/prcI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39850400004)(366004)(346002)(376002)(136003)(451199015)(38100700002)(31696002)(86362001)(41300700001)(2906002)(4326008)(5660300002)(8936002)(6916009)(8676002)(26005)(53546011)(6506007)(186003)(6512007)(66476007)(316002)(66946007)(54906003)(2616005)(66556008)(478600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHFhODlzcVNYb014NzI1SUtBenRHajIrNGhSYjFaYUlOckF1VkM5NWYvSGpM?=
 =?utf-8?B?UDJaaHpnREdiUG9WN1I2ODMzYXBJSVFBOGZMRTl1U0svQTZ2b2t0S2tNR3NS?=
 =?utf-8?B?QlRPSFNseEFXMnpsYU1rTGV1L05SNG1DQ0hsTVR0K3FkbDlDN0RXdXlSK1dX?=
 =?utf-8?B?Q0IzaWJnUVpoUkNRdk9za3V4MjNaOFcwRzVLSjM5R0c4MUpyTXB1SzdHM1Bj?=
 =?utf-8?B?TC9GUGpmTmhLdGh6OFFYbHBYL1cyNDBSRWovQWErNWRkU2twbnJhdW9Sb1BS?=
 =?utf-8?B?TWMxNDcyeTlJcWs5blNtL1VkM2RGbUZ6OTZObVRIVWR5SmNnOFRGVGtDemhN?=
 =?utf-8?B?QldqWERxWGlMeUZpNVFLdzJYamRpQjMvUzkrMGc2c0d4Ym1MVWdsRFE4b1pL?=
 =?utf-8?B?bi9ROTVnNW5sL2M3QU9UdmVaa3QzWWJWbXJrcE1HVTc5SmRXbkdOQVhOYlAw?=
 =?utf-8?B?bjZNck94VnpNZ3Z0b3VxRXRqUXB2SjA0ZmFKb1BzZHppeXFCbTJCMjNIbnRw?=
 =?utf-8?B?a0RFQW1VV1drdWtrVDFXMWIrOWFDdm9KODBKOElmUHdBc1JYa3lFNE5WVHd2?=
 =?utf-8?B?a0xUeDNYSjRVRGlzNFZmUTltQ2prZThUMktzOHY0SWVxa3FJZEpEZGEzK2tM?=
 =?utf-8?B?UFprQnlUVEk3UGFGSEJ3QmpPcXRxRzhkNWFOZXE2WXRpcTJrYTNwNDBidWdW?=
 =?utf-8?B?VzkvWmxEd25GZ1dtaTNDUVcwWDhRVmhSQUZXMWphNTBwV0hrTDhSck1vTGF3?=
 =?utf-8?B?bFF2VGNXeDE3SWNVWEJPRnd4N3ExQU9sODVIMkdTOGFvK2V1NjZLeGtNYlpl?=
 =?utf-8?B?aFRvcXM5bHY2elltdU5Ea0JuQVhyNU56ZFBBZjV2SWdpaDFLdWVvRkgrazVW?=
 =?utf-8?B?UEFJUFR2SXJOYU56Qys3bzFjdGVwalpTQVlncktqbldoS21zYnloUHdOcVZ2?=
 =?utf-8?B?cWw1SGs5QU4zdStJRG9DbDFPekFFTTZqaWw0UzkrM0lqSE1lb2wxMUNsR254?=
 =?utf-8?B?U3dJNytXMDc2ckFRZW1WN213TlVVbmUwYVpxSEpOblZYaXNvNUhmbVJydnhw?=
 =?utf-8?B?WTJweVYxc0NWbGtHdWJOVDZ6NW9neFhMcHZjZHdISjB1a0R3NFFoUU9tUFla?=
 =?utf-8?B?OWZ5akVXSnFoTXZNd2Y3WlhpSXZWQVJnOU95STgwU0U3d29Gd29KVCt0L1Rw?=
 =?utf-8?B?azkvVFByRzFQREtZRVQwMEhKdy9sUzEzdURTQlExNXZ6dnJjNHRBaERyNHpy?=
 =?utf-8?B?bVFEcklXNzBudWEvOEJESnl0NG5JbzJiWDNjOEI1VmtaaVRyYkhOWDhHajVt?=
 =?utf-8?B?R0FndWhKN3N5Rzl0VUt0WHlaUmVjb0RSb3R4Ynh2dXR0SmFzQ0Q2ZTVEcEcw?=
 =?utf-8?B?YlhremIydHZPSmp5TmZyMlFER0RuUGw1S0Z1VEV0ZkxlUEdKZ1dkMVFBNys3?=
 =?utf-8?B?NXZTMGtYdklWcnlKYVhFOWthNlY0N25nQllhTzV0UC9wenJONys5bzI0NWNr?=
 =?utf-8?B?dkx1NnFHK2NHODZYUkIva1VLZzRuVHdOUFp2TTM3V3M4SzljVHhGQVBncHB1?=
 =?utf-8?B?TzIxVzBDclNrTmViNVQ0K0VabUdrbEppOCt0d0Yxa3VpLy9MSnVkL1pHanZH?=
 =?utf-8?B?ZVpUd2J0V2R4V25RL3NmZU1BNUVocURUVWNqbnRsMzViLzhleHFiWkxnQkFR?=
 =?utf-8?B?L1FtdHh2VGgwQ3BPOVZScGxSUGRwMnV6Rk1LS1lQangybHF0QVZMN3U3OVlx?=
 =?utf-8?B?QVdsT3RRU200ZjIzT0xVanVMbTFSbzA4SUZJY1ZzZW1ZWlhwei9uMHVJTjMv?=
 =?utf-8?B?L3Q0OERzTWNSeUJHTDRjS1BzN3B2NldjdEhveDVqaHhzWmNVZXVmNE1yVmth?=
 =?utf-8?B?enE3WnpUUU9tclJBR2hoSGJROGJoZGxyYjI5U3BVdDYrcnhDbDcxTnFzOWNN?=
 =?utf-8?B?SmxQRHhZVkZ4eVZiOTllREFXRGtXUlhhOCtmSUM4Yms0aUR4Y0dCaGFDSWpF?=
 =?utf-8?B?TUtCZGQ4a3Q2bHpwWkRoWkhSazJ4NWMrTHhWN0ZEeGxIVUM5aGpISG1acEVC?=
 =?utf-8?B?NUhKVXJ2dndvYUlqem9kVFdPVG1sT0wvODlpaEtpTTVyOGJwSmZFTFlQcEQr?=
 =?utf-8?Q?qe/psP4T0a6+LkmARdlHYuJUR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2052be8f-e2bc-4037-e602-08dafd3262b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 11:10:07.5907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z094t/72ss2HWYXI1GkBAW/SbGf6BQbrj+QqQT7l3DyvFRJBycWgtCCkMXVdcw6LP6RgZCfjsG87kspeglu2Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7480

On 20.01.2023 15:59, Oleksii Kurochko wrote:
> Add ability to print hex number.
> It might be useful to print register value as debug information
> in BUG(), WARN(), etc...
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Orthogonal to Andrew's reply (following which I think would be best)
a couple of comments which may be applicable elsewhere as well:

> --- a/xen/arch/riscv/early_printk.c
> +++ b/xen/arch/riscv/early_printk.c
> @@ -43,3 +43,42 @@ void early_printk(const char *str)
>          str++;
>      }
>  }
> +
> +static void reverse(char *s, int length)

Please can you get things const-correct (const char *s) and signedness-
correct (unsigned int length) from the beginning. We're converting other
code as we touch it, but this is extremely slow going and hence would
better be avoided in the first place in new code.

> +{
> +    int c;
> +    char *begin, *end, temp;
> +
> +    begin  = s;
> +    end    = s + length - 1;
> +
> +    for ( c = 0; c < length/2; c++ )

Style: Blanks around binary operators.

> +    {
> +        temp   = *end;
> +        *end   = *begin;
> +        *begin = temp;
> +
> +        begin++;
> +        end--;
> +    }
> +}
> +
> +void early_printk_hnum(const register_t reg_val)

Likely this function wants to be __init? (All functions that can be
should also be made so.) With that, reverse() then would also want
to become __init.

As to the const here vs the remark further up: In cases like this one
we typically don't use const. You're free to keep it of course, but
I think it should at least be purged from the declaration (and maybe
also the stub).

> +{
> +    char hex[] = "0123456789ABCDEF";

static const char __initconst?

> +    char buf[17] = {0};
> +
> +    register_t num = reg_val;
> +    unsigned int count = 0;
> +
> +    for ( count = 0; num != 0; count++, num >>= 4 )
> +        buf[count] = hex[num & 0x0000000f];

Just 0xf?

Jan

