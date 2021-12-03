Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7846789E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 14:40:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237658.412211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8n4-0003HK-7I; Fri, 03 Dec 2021 13:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237658.412211; Fri, 03 Dec 2021 13:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8n4-0003F4-3x; Fri, 03 Dec 2021 13:39:54 +0000
Received: by outflank-mailman (input) for mailman id 237658;
 Fri, 03 Dec 2021 13:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt8n3-0003Ex-Bq
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 13:39:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e21b14c-543e-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 14:39:52 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-zOuDlrK3MSigQKX8YLvphg-1; Fri, 03 Dec 2021 14:39:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:39:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 13:39:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Fri, 3 Dec 2021 13:39:48 +0000
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
X-Inumbo-ID: 7e21b14c-543e-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638538792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlb2C9KX4/QLshera0eJldEU/BNffZR+O7olz5J/0EE=;
	b=ZsU8a/4EpOMHFGSYEgWJYnus9LlTKqEB/b6Eod7049jMv7RO3jOZiBqVbS+SMwzIzufH2A
	pK7OiTbXhoEVdNvbgW6a35PJoKxj30p53STc0ELdEIfL04QEIlDxHWb86YcCAHZq4QTLrz
	M+2Vik5pTsi1YcA7kS2XVpUQssPAgX0=
X-MC-Unique: zOuDlrK3MSigQKX8YLvphg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iseIm7/ybvP/4QRtccxY0XQ7iselk8p75xPB+YmhGQrbPYkhWlHCnKu1u8RZDhtkDIZg9jQrHKpx1llRqX6xBlpu/JDGaofdMHkGClOk4OIzNiK+VL5KsHE0yCZZU0egTOTPx1VppJo2xjmFEZUZtlI8CohImMLP3PNPyITuU2rZ678OQ5IPpiEvmKj4FzLQQ0JJ3DT6PnTyimNUvqN37Q81+bcr3ZXhL622JocSV4DnnU4Jt2CNGhGovjV9e1Khwjh+LjHafAFKH5ynaqUO5YlOBRd9UyGiUb72h7LJ651ovzH55Urwk6Xhv0cn+k+PMoZKEfJkG+tfTPVJDuYWpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlb2C9KX4/QLshera0eJldEU/BNffZR+O7olz5J/0EE=;
 b=gTSYotlCeXNW1rYJLI3gO6jXzn5fnbIp/tA1cIn3JeU6KBptuWZavixTp26ZqowuTZuuhSbMjAJoyixvLLaV+3k8IsRpBDgsp2AbALcvURkH3yvXMStQMFZvQlDbpeNpADQpq7FCauHzNY7k2tBtlqpoafwTOkddStJS1YrvCyuAjiME8cH6ljZ7kRaA3pxm7he6yaUDQhDvAWFjGzoDF1vHDqIfVz96JKSB2Mj95s5Z9B1agrGbLFu+vQOeP5O5ljlzlJ3yGvX+OYp+ncnGk2NSE0of7QTv0D/ja9DHS41quEOXTp9pJslzg1fXFX45mHPdoD+aMUD+s1ZT64pmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <789422cb-e800-9a46-b70b-b6e882ae2cbf@suse.com>
Date: Fri, 3 Dec 2021 14:39:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v1.1 60/65] x86/emul: Update emulation stubs to be CET-IBT
 compatible
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126163714.28870-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126163714.28870-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5acf3c6c-98bd-44a0-93c6-08d9b662602b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532512E5A91FDBE5D3A98EA1B36A9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0VgGXVfbU24CNpXKy+O52qZl2Ku2FOUwc+9KGSUeEhuEn7kpfcRsjhXRYE//R8GmE6z9pKA4INTB9JOlFA8fZA2nMUTghtP9eczHzYdTGC4sU7ohpiQHjA5gKloxPRifcCEP4kNfpq6PJcx9q9Bgs7lTd0K8/+OVhBR+sGD7W67V8LL/53cuFOmXoXEsXljYEHd2GvKOFYMrmUV3hZpdPLzLlKe89Xv8fditJXCpZtAHgKTR2oJFQyipjzscK0j4lT8JP6skGUKL8jJPQVsIAXL4eERWM8myXLKYL8MFSTciD9+1nqe3dBa9yFFi52gj2OZdhGGcT/AbPbDrWqd1IdrrawRVaorlKh6L1jgJGWDtIAbnhL+dXFDayJfzSpppjD6o8ZsssMH+i0Eslx+fhw2khDXk55aXsWEtvCtYFbrdE8AxOeITvDaaAh8QgdJ1hMKJ6sx5N/sDZYmCsLA684hJvwVm0b+HXdryXUrRGbSrLzT+h20f9kICgLkAtDfcL/IpH/XH6svIvUc+w9vHcw3vSia1vkxS1s1jKm3Su7TiUTMe2+/K0WPk/fci3MRf1gJORUr74zVFGeqfmp9v4Fn5GWmYKA2z3zFa/R1oEhN3zJ+eCCEzYyUu7ZIlPGb78Cr0ebnBxW2GDiEwwjFgOHApRwVbevVv2qjyoAplxIrTRK50GgweXLwl070B9WND1VGhlUVxmxyU8bhjgcPHmAgdpyiHmT1QpAO0YrGmuck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66946007)(66556008)(2616005)(54906003)(956004)(8936002)(4326008)(38100700002)(316002)(2906002)(36756003)(16576012)(8676002)(86362001)(6916009)(31686004)(53546011)(508600001)(31696002)(26005)(6486002)(186003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHB4UE5lY1kvaHNuWUV5RDRnY3VWakRjS3k1aitqY2d4U3pEOUlCWTY5dC91?=
 =?utf-8?B?WXdJZ2hYTlNJTzdaVlV6MW04TDZFUVR3YWQ2Z2pzZ1kwU0ZYSmVpWE9OeG9M?=
 =?utf-8?B?ajlCazZxeTNwOUovakNWR1FTellPcTFNTlRoNjZZbmdMWXNiK1hFYlV5U1Rk?=
 =?utf-8?B?czVoMnVkUnMyUG42V01XWXV4bFlLakxxckRtTG1rYVR4MFEvcU1WV01Bbnl3?=
 =?utf-8?B?WjI1UFYvemdOZGh5TjJtRlVXakZtaHgvSU5OUE9RT1VvRUxNOElpUzdSeTRv?=
 =?utf-8?B?M0p5cnF4enJvL3hsUnpFdnh2WGZ4M0xWSmNYMzhBNEg2NFNnR1k4ODRpUEFL?=
 =?utf-8?B?MXZwblB4MXhFLzFsMXpkRFF3M0xjTXQvSHhWcElSTjBsdnA5NUkzYnkwdmdZ?=
 =?utf-8?B?WkF5dnRBQXZZYng1bUJ6eVppeGxQNjdMdVRpcDV2SVRianZhSHNCWHM5K1Ur?=
 =?utf-8?B?OGswNmw1bW9DRFZDaDVlZkFyZmRoU0RVa0ZSMHdJTGN3MkhmVzhMekVsN3Zv?=
 =?utf-8?B?S2M1ZURZbThrU0NZWkgrR2tRZEZSWlhaZ2M0T250VDNlZXFOMEJ0cUlGanVY?=
 =?utf-8?B?S0Jld1RsZXM3aUV1UjFaUjJkODduZ0M1WnFwMFk5ampNeXV1dU1RV3V5Qitq?=
 =?utf-8?B?ZksrTVl5cUNrU2NJUStxMFVYNlpzYU0vNS9BSzEvT2pmT1E0THJTVHZqZTJM?=
 =?utf-8?B?TFVZRnBjUEVPdE1IL0JBcFAzcldZOE1BUlM2bzRqVmUzQTU4czI2bzVpb0oz?=
 =?utf-8?B?MjNHbEgzMlkxbXNVTy94RFhwSGdvU0tQandBUFVva1huWEdvaWVhMGI1Nlg4?=
 =?utf-8?B?cWk5SzdZQUU1aHgrOWRaeGY1eHlpVXRmTDBjRVFBdThPQjNPQnpTTjV0d1Zh?=
 =?utf-8?B?WlZEd2w2QnpRNlcyUG8vd1NGcndwY1liN3REc2J6L1FwR2RuQ243TkFoMkha?=
 =?utf-8?B?bTU5SzU0R29rQ2wwVWdzajQ3ZHBRSUFuSGg3bmphbEVUNWVlWmh2cFFBZ0VR?=
 =?utf-8?B?b0UvcG9iTmpTZXpRbVIzQUhuYm1nNFFSTzBlSlNSdHlxMFJhVFZwYjlQOXo1?=
 =?utf-8?B?M3Z1SGhYRVEyUEY4Z2N4RTBkOFozK2xrTmlDR3lKdS9FaFh2ek9wMTR4N2hm?=
 =?utf-8?B?L0l3QkF1WkdtYWZFdTNPL0hscHNXdGVSemJrd25LbXBNVXJsZDg1TkRsNUZX?=
 =?utf-8?B?K3dLMjZuenp4RUgwY08vdFJrM01kUVk4eDJKLzgwK29qOERzOWpNai84SC84?=
 =?utf-8?B?RnRHUHRyNVpkWjE3dEM5Q1IrOFFCNmdhMGdndXdETHJKRjVDNG5aZ0RBVzh4?=
 =?utf-8?B?QlBZYU4xVjVmMnU1bEtoQ3NTMnV2SUtCWXBUdjVsd3YyMlVWL0ZHWmNNS2Z1?=
 =?utf-8?B?U0diblJ5Z1pZRXN1dE5kWXNaVW96U2syUVY5dGFHZGZEcm9rUGQ2UFhBVUdL?=
 =?utf-8?B?MVZHWXl3aGoveTZmTEU0Z2MyaTJ1c09DZithWEFRQTM1bS93cTlGZk1USnFO?=
 =?utf-8?B?RFR5djlnK2VXTjNEN0wvV1JnZ1hpckNxeDNGS3JSMXlTUmFGVlpqN0lNelZX?=
 =?utf-8?B?SG5FdDNRbHBnNkViVFgvTjB3RU9GUGpmdGNneFV3NDVBeWc2TGpYem9OanRN?=
 =?utf-8?B?bWNtN2hkdUhTdkxKa3F3SklRdkhKb3NCMkR0VEFsY3hlTURCRERJSWx2Z1FB?=
 =?utf-8?B?YVg5UlhiSTdEajNkejNyK3d1a0tadzJuWEhyN2pSZkpIbnUyNTJoVGF4dC9h?=
 =?utf-8?B?VVlvNTV6ZG1oTmFjOGwxbHZNTWtybGVWNm1TbkxnVkphVXhuSWl2QVdYSGF5?=
 =?utf-8?B?WUxQbkcyNnRucHVySFNrNnAxa1d1L1lhd0xwUXlMZ0FiRDFFeUoxdFNwdWND?=
 =?utf-8?B?bC91ZHc1cVRyV1FUTjdaQjAvVG5ZOEVqc1VIQW1sU0JmL2VZYXF2dDNtbmUr?=
 =?utf-8?B?bHpSYjRrWnU3Y1ZPTUs5eXFVNG9JZFZNSElQa2JGM1BRcUt6VFpJN3lPMnQ2?=
 =?utf-8?B?VXJHM3Zvb1JaWlYzaWEraTlFbGFLVVh1azFwVGRnVzQ4Znh1R1VrbENYZmU5?=
 =?utf-8?B?bStRY1RueVhsMjllQWxlWE9rdndwZEZKRFNNeHpGcWdMY0hVK1VHeHBVdytJ?=
 =?utf-8?B?NE1GS3M1Z0ZaNHhOVFNlRk5jVTdQVC80ZG9zY1RVNkM3aXorL2t2TTZTcENO?=
 =?utf-8?Q?AvEnWF4cq3rVihfCs6DsTPg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acf3c6c-98bd-44a0-93c6-08d9b662602b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:39:48.7623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rejO42idWTPpfCavVjUYNm2rbcsKLWpXDhCKcU2PgpHxU6tbLJPvHCcw3LYzHuVTw5mqKBP+e+NHyncloA/0MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 26.11.2021 17:37, Andrew Cooper wrote:
> --- a/xen/arch/x86/extable.c
> +++ b/xen/arch/x86/extable.c
> @@ -129,19 +129,23 @@ search_exception_table(const struct cpu_user_regs *regs)
>  static int __init cf_check stub_selftest(void)
>  {
>      static const struct {
> -        uint8_t opc[4];
> +        uint8_t opc[8];
>          uint64_t rax;
>          union stub_exception_token res;
>      } tests[] __initconst = {
> -        { .opc = { 0x0f, 0xb9, 0xc3, 0xc3 }, /* ud1 */
> +        { .opc = { 0xf3, 0x0f, 0x1e, 0xfa,   /* endbr64 */
> +                   0x0f, 0xb9, 0xc3, 0xc3 }, /* ud1 */
>            .res.fields.trapnr = TRAP_invalid_op },
> -        { .opc = { 0x90, 0x02, 0x00, 0xc3 }, /* nop; add (%rax),%al */
> +        { .opc = { 0xf3, 0x0f, 0x1e, 0xfa,   /* endbr64 */
> +                   0x90, 0x02, 0x00, 0xc3 }, /* nop; add (%rax),%al */
>            .rax = 0x0123456789abcdef,
>            .res.fields.trapnr = TRAP_gp_fault },
> -        { .opc = { 0x02, 0x04, 0x04, 0xc3 }, /* add (%rsp,%rax),%al */
> +        { .opc = { 0xf3, 0x0f, 0x1e, 0xfa,   /* endbr64 */
> +                   0x02, 0x04, 0x04, 0xc3 }, /* add (%rsp,%rax),%al */
>            .rax = 0xfedcba9876543210,
>            .res.fields.trapnr = TRAP_stack_error },
> -        { .opc = { 0xcc, 0xc3, 0xc3, 0xc3 }, /* int3 */
> +        { .opc = { 0xf3, 0x0f, 0x1e, 0xfa,   /* endbr64 */
> +                   0xcc, 0xc3, 0xc3, 0xc3 }, /* int3 */
>            .res.fields.trapnr = TRAP_int3 },
>      };

Instead of the recurring hex values followed by the /* endbr64 */ comment,
how about having a local #define for this? Preferably with such a change
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


