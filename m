Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0280976946F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 13:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572919.897051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQsZ-000210-Sh; Mon, 31 Jul 2023 11:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572919.897051; Mon, 31 Jul 2023 11:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQsZ-0001y3-PQ; Mon, 31 Jul 2023 11:15:59 +0000
Received: by outflank-mailman (input) for mailman id 572919;
 Mon, 31 Jul 2023 11:15:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQQsY-0001xt-2X
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 11:15:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e9dcd81-2f93-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 13:15:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9336.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 11:15:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 11:15:53 +0000
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
X-Inumbo-ID: 9e9dcd81-2f93-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1N1lOn2c1YkqRKSziklm8UxLFfGhkW9X5NUeoRM6Uu/erUOHge0YFc+rSpuZKJqQnjGGiNkVbUVpLGWXzLm+uxBoEBkApYAGomQybCPklgj88P/x+1CNSXBobFWl/BXffi/5X4DSNSPTuZGdhDwRHU7CtLvIdqV2gLfLLb6tMi5D0DOIWKRB0oW+fRW6Lw9RG5Z6HxhV6P4PoxHhDIVHbQx4HaZTWRaR/OrL3DSdI5YQbjWZC2rWuxUJxiCD/i8JU4IfaUi69GW8NiOHDD2hdsBo+8EvHNpXmGNb2WWFKLB1D3KYgds+UjCDfIAA5GBJEVQ4p25cDd2dxYAQpyFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uW3wYiVE6b/d+k8szt4QcKxk2XNHcpGVcLcMiq8XMyo=;
 b=ZKTWy15k64Irs+QRNKGq45yueqv1JL458XAhmjLXnsmypATGG3n6ex5dp38PueTwkbpfBlsXZd3JaniZVhy0lMTH0J4RUiT41MVZk6IRJ16cfM9LzmgoaofRwdnX5IPdI4QWEkQeZzY0f/dRaWzvmImaaZPqPVWgO9rEWzV7oo6aNrfFHQb333sZJs3elwploCHsKojaWoKumxWcpw5bT1VIzoGzG7Uidm1PPDHZ2fSJNUZUcm/PmgKDUmXVpx28gu3GB+lwL8yJWSFGsrHvSOJpY75pEEsB0FhduuVVc9+6+dY4vOYT/vJ24mKehwPW9qjmaypB23gzuIMbjCO3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uW3wYiVE6b/d+k8szt4QcKxk2XNHcpGVcLcMiq8XMyo=;
 b=hHPngB7EiLB/k+jKuOigT0Omp/C0R381X7+HcQH8x71mLWKkXeSgr78BS8NzlhA9m9ydGrSFCJaXnFxRtbvvIEq5X1hOcEddhRWTAHh01E/9I9e62RIFSqtcBoHbw889MuQuMD9Mro6tJnlKT9O9kzuzfCIQOngMfvDRFQT7eIByWgESqopl7EYmgOuxwqFE84oyu6ZheKoruN9Qo+hcM97U9S93Sw0VonFFNdoVSSHfqVyzF7WFCXbei0Tb8WS+f2PqHLkxruMq9pGNOjTMYbN2CBbU6L2oSf+ahFmuXBvZga+FFy/fe3AppwGvZVxyE1IWZJNh8Ht9BrSu8Hnz7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bdd5376b-477f-71e1-94db-71a2e4cb716e@suse.com>
Date: Mon, 31 Jul 2023 13:15:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v2 1/4] x86: mechanically rename to address MISRA
 C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690788513.git.nicola.vetrini@bugseng.com>
 <b169d1c682254e682e6ed34f33481a768209ce9b.1690788513.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b169d1c682254e682e6ed34f33481a768209ce9b.1690788513.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc45f73-cce5-43ac-4212-08db91b7813c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6rrKZhaZ86q5weJxglIDaTC/qxdCKtz3YdYg4UT+AR7czTRFmnS+h2NuHNjG7VUYcfXpRiqGevwdrCTBMC28fJx+L+bGB0S5ejH2oU567tHzj36rQ4cvfr079tBtzio2eq80uUTDuOHvzAPBJ2pVYst//yTpil4z+kXqE7DwAj0ZlNrPh6YeyWz5zaY2MXXBHbsGJgQz711wVpfhQ0RqHJxr53WGkdocSrfDLc4af44SIGLOsKD+W0hBEhsnweNepv0qPStktWzTQxsbcOq9RniMJbzUTfkz8ZXEOfIjafIHsWkKmGaQtEkAOF8FMXTuuv/U+/TUb8a7ov5YKuXOgGXEqwVSc3Tbwl8bu8q9dCygfRAPVxlo4KjuxYS0HVm8ULTGw6cYOcJSspK5jTYGrAZU06v1xWqSJLQT8XBPZA7i3C3UW30Fdz4k0qkW5nvReX7wCNpPuNUaNZ/sPHe2yoSp1YwKTUln3f10oLrmTmOiCMH5Q1zNiFpZQaAFDdNK7GslE7ubt9NVM2Ls5vcT5Becpa36yTLB8s2joFBN0OFhOcOKgA17Bd3OfT0o0BV1/YKlOpPHz+I9wJ6mmvzw5ighR99OVnMzIDrK7Bg6ZlFJgium0cvzWvePaqQ5Fs6trCsIZxX3zxhj1H5OUo92fg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199021)(6512007)(6486002)(36756003)(53546011)(2616005)(26005)(6506007)(83380400001)(186003)(66946007)(66556008)(7416002)(54906003)(31696002)(86362001)(66476007)(316002)(4326008)(5660300002)(6916009)(8676002)(8936002)(31686004)(41300700001)(38100700002)(2906002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWhLeFF6WW5lN1F6MVk0eUMxdEdLNDlad2xMZ2ZLc1kxYTdhclovS3IrZFp0?=
 =?utf-8?B?VDZ0aGNURjZoUWVXLzFPS0xYZ2xuS0xwMFJjVERoYTlwUnV4OFFqbUNtY3RK?=
 =?utf-8?B?K0hBVmJTcnlyVXZORDhDZ21NWUIvU1RTWWc0RDRkTXlyanF5VGhkeVB2VjM4?=
 =?utf-8?B?YXl6aFFCS1Y1QTRHZEJHblZuZGtNNnNvTXdzOHE5aVdOdnRMcHowcGxCRTZ1?=
 =?utf-8?B?YWV2aUNEN0N1b0JHRDljbHc2bk1CeWlOcVJaRmljTVNST1ZINFI2L1dBdUR3?=
 =?utf-8?B?MGZBTjY5NSsrcWFlVm5uakZQS29qQnczRVd1emFsd2ZrN0ZlNGdNMmZyNHdQ?=
 =?utf-8?B?d0huTFBacitzUjNJTUpxS09reVRvM3ZFSFRId2drNlAxUXRTbGJ1aDNCL1dO?=
 =?utf-8?B?R21md1g4SHlPbnl1RkZIQnVwZ29lSmVLdWIvcXlwVklwRHZGQnFUVTR2UElU?=
 =?utf-8?B?SDZrRGdlVFJzVExpU04yU1M5RTcxYnk1dldqQUk3c0hyUUQrOGhGUjdDdzg2?=
 =?utf-8?B?ZTNXcDBNSkN1K2F2cmkyUldwTXdSMDZyYTdia0NJS1dCT0JZODFYUjJuQ3Ur?=
 =?utf-8?B?c1Z2b0l5QW1tMllGUXl3dHllZVQ4N0d4dUYycC8vSE5CdWo3b21iK3R4UXYr?=
 =?utf-8?B?TUtFVXRQT2lza0YxaUhYR25ma2hBbHZ0RHorNzFxYUVQWkhwK2pZYXNLZmpG?=
 =?utf-8?B?TWl5RTEwVVh4czVnaWJ2UjhOR3YxeFVrQ1cyUzR2cVpGczVuWG1uRDkwYlM4?=
 =?utf-8?B?RUtXUlJGS0trZlA3WERoankvbVB4UmQxaWJ6TnowOHhYVHRyMTkwS3BTZHVw?=
 =?utf-8?B?SEd5c1NpckhmdElndXBoTjJYbUZRVktlQW5qSVVjcmZqRmpZSThZTHdlR1l0?=
 =?utf-8?B?d2ZoRGF1RHRYRUFFQ3psdzNFUm1NVFJSSHplMUJSTXh0TWdWSldTYU11SFRX?=
 =?utf-8?B?UGdFd04zUUw3KzZjSWlQWXRodmpDNGs5dUIzbnJkZmtKTTVCa0JYWU85NzZ6?=
 =?utf-8?B?NkRoM1pHT29RbEtpanprdXQrRWJ6VlVkUnNKNzNzU2J1QkFwQWFvTWtCRVh3?=
 =?utf-8?B?QktJNDVQVEVEUnFIM256UWJhekFpdnhIRkFLV2tBM3dsTEs0MEkxcU5GK0hE?=
 =?utf-8?B?MlU3bGhXUzRLa2wrT05hLzhDWGNQUFhUaUtIMUExMkpGWnVaekFTY2MzdFRz?=
 =?utf-8?B?L3VBOHF0TjUvL2x1QjREU2NUUmk5TUdUVzFpbXdJT29KMEg5b2FkTDJKaHJK?=
 =?utf-8?B?RzMwUlR4MCtzZ3ZHZUg3a21ablpnbXRRR2xFK2pSNGNJek0ycHppeS9oRnBU?=
 =?utf-8?B?RWlLSnhPZ20vK2QyVXJwZjQvNkF1WnZ4dUY1ZGhRWnlrbDlUZk5SSHpmKzFC?=
 =?utf-8?B?bWVPL2d6aU1ZVTlWMHVCeGIveW9PTXc4OVkvb1RYOWpORERQZkZrNTlvNGJm?=
 =?utf-8?B?VFowL3ZGRm9UcURweExJcjlwT3VVcUt1R3YzYlZJZG96d1NkOGZzSGhLWks4?=
 =?utf-8?B?ZER1dEMrME1jMmxRbDF2Wm0wSWcyTEk5THRSTjZtWVFxWnZOMStBS0pCMWRN?=
 =?utf-8?B?UEs4K3VFNmJzNExIMXMxUGVJY1BrVW5hYXRIcThkMWN0WDlLRFA4ck1KUTJK?=
 =?utf-8?B?WGFJK2xkRFNKTzd5WS9MdmRuclRrbTY2NytzMTBvTFNDV1VsUjBVbWpIQW9w?=
 =?utf-8?B?Qlg0RG8zcUdLaWROTXRXMFAyY3NjbTJTMlRpb0ttMlhvM3RYMFFSZEJ4dWRz?=
 =?utf-8?B?THcyTDRUUjFIbkVZTVRXVjBiVk1qT01SSHdFaSt4a2tiSGRjVFMxcDU2ejVq?=
 =?utf-8?B?SEZxbWRvOTRLRGR1TlYrZUlHU2owbXNiTEYvS0dmNXlLRko0MEZDc3BPdjBm?=
 =?utf-8?B?d1I0V3V6dGhMeTc3N20zdlFhM3RmWEhqSHpNMWJPbTVVdmhZbUdpaVdUbVJC?=
 =?utf-8?B?U0dEV0ZKL3ZVUWt0YzFBbEUvRGppdUF3ZC9GSVRobyt5M28rcnNiOTBKV3k1?=
 =?utf-8?B?RkYyVFZXeHdlOGhDTVBOZzZHcnNjeW1SZzNBVmdjM3hBOGtOY2R1bmdYMUdX?=
 =?utf-8?B?cFdtenRzQ09MUG9QcEtYVkMvclpMM2dUdzIzVThPU0gvRTVkUlJUQ25EbVIz?=
 =?utf-8?Q?KPG5hsbeA71fTjKyimn9a6yEy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc45f73-cce5-43ac-4212-08db91b7813c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 11:15:53.7623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bHO1hrZdOODkyJjUzH4+76KJ7hDqqAeTrXa4nMy7Oor5S8hwD3X6/D2PEA4nuExn7VCWNO/iTUX05wyuDXENA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9336

On 31.07.2023 09:33, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The renames done by this patch avoid shadowing from happening.
> They are as follows:
> - s/i/j/ in 'mce_action' (the shadowing here is due to macro
>   'x86_mcinfo_lookup' that defines 'i' as a loop counter)

Then that macro needs adjustment. Especially considering it's in a
public header: It's full of name space violations.

> --- a/xen/arch/x86/include/asm/hvm/save.h
> +++ b/xen/arch/x86/include/asm/hvm/save.h
> @@ -49,21 +49,21 @@ void _hvm_read_entry(struct hvm_domain_context *h,
>   */
>  #define _hvm_load_entry(_x, _h, _dst, _strict) ({                       \
>      int r;                                                              \
> -    struct hvm_save_descriptor *desc                                    \
> +    struct hvm_save_descriptor *descriptor                              \
>          = (struct hvm_save_descriptor *)&(_h)->data[(_h)->cur];         \
>      if ( (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),                 \
>                 HVM_SAVE_LENGTH(_x), (_strict))) == 0 )                  \
>      {                                                                   \
>          _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH(_x));             \
>          if ( HVM_SAVE_HAS_COMPAT(_x) &&                                 \
> -             desc->length != HVM_SAVE_LENGTH(_x) )                      \
> -            r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);          \
> +             descriptor->length != HVM_SAVE_LENGTH(_x) )                \
> +            r = HVM_SAVE_FIX_COMPAT(_x, (_dst), descriptor->length);    \
>      }                                                                   \
>      else if (HVM_SAVE_HAS_COMPAT(_x)                                    \
>               && (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),          \
>                         HVM_SAVE_LENGTH_COMPAT(_x), (_strict))) == 0 ) { \
>          _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH_COMPAT(_x));      \
> -        r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);              \
> +        r = HVM_SAVE_FIX_COMPAT(_x, (_dst), descriptor->length);        \
>      }                                                                   \
>      r; })

The macro-local variable gets too long for my taste, to be honest,
and it being improperly named anyway suggests it simply wants a
trailing underscore added. And then, since for a variable named "r"
the risk of shadowing is equally high, that one wants to gain a
trailing underscore as well imo. (And while at it, I personally
would also drop the leading underscores from the macro parameter
names. Furthermore I think it would be nice if at on the lines
touched anyway indentation was also corrected. Overall maybe best
if I submit a patch.)

Jan

