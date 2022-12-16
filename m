Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7EF64E7EE
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 08:52:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464178.722542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p65WF-0001O6-3S; Fri, 16 Dec 2022 07:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464178.722542; Fri, 16 Dec 2022 07:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p65WF-0001LJ-0d; Fri, 16 Dec 2022 07:52:35 +0000
Received: by outflank-mailman (input) for mailman id 464178;
 Fri, 16 Dec 2022 07:52:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=joxT=4O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p65WD-0001LB-Dn
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 07:52:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2088.outbound.protection.outlook.com [40.107.8.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9870aebe-7d16-11ed-8fd3-01056ac49cbb;
 Fri, 16 Dec 2022 08:52:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7540.eurprd04.prod.outlook.com (2603:10a6:20b:283::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 16 Dec
 2022 07:52:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 07:52:29 +0000
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
X-Inumbo-ID: 9870aebe-7d16-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhPWIGBjWIfnDnmhbaB21b71IDBMtx5mDfSiepNcEzYdzvExT+UXEZBpemN5mgG/CnTBVxPLzIhcUhaiiTeF53umFb9W2m3P/AIDoGnIwFxaiu+4nmtPLMeEgDuPkaxeluRhKroOuAK7ku5KBW/7gntDlxsBcJwtXc3fwF3YT58Ot5mKQNtPYHBet65zWUR6giS2Ql0TWAoOfTgn2ld9K3O7qy+JI4V77i48vosSR10EboHYAYTWbZ5W8AgXLH9tl4Mua5JCi/LQVldRlABPAoYjapMwDZyABkEBtNzHs79+qOV2lOpo50E/lDJ/yNjFcoQW+gqUF7gmiPvRkmzR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjbZ6RRVHuf9/bWVPp8AKnmkvJ3C/V1DFCH7bMuoFPs=;
 b=OBj1j6fBgaa87WLjbeXp073LY/3tLbB/PIwyvrZpHjjHzC8tgMDJmR7CXLmrLFMPh6FwudKvjKNzeyPSQdyVyZIRADSSmdFHu73NCOg6aCEeSHuqNKEFGjJ6QFmt/bNrI2JXxxIQekygLI9vnTKDM5FuhnmeCxzaQlKS6r0tDjo5TdEfu6TTXDTs7dTL6xYI/30AKSUg+0lqyZEMcm48lkc9p2dsD0Aps2wcjgO/1kMw9s9cKAdd+WhA/kH5sKK/TZcc5XlIjdqMTBj0kpfF3TIt+D+6RUNFSLeGdSH6GDp1lgu0CTK3urF0jUEGIWsf1Fmppf2J+zh7G+booxH8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjbZ6RRVHuf9/bWVPp8AKnmkvJ3C/V1DFCH7bMuoFPs=;
 b=jsP01pmMHr7FFc2P3PfjxPKLHWRV3fasbrQ70sglStJljNHhq1eQtThNG0CJMw1jkQAu4yGDtY1T46jYm3NvAr3wjxf2SdZoSrVBsDE2CQDqB60+zkYC3q0aGVW+9Vc6bLTs65P8ys2dsEFmUju1oaNkSjYFYf0/v9A+I1V3N9BmZfmn0/kzkzpdqWVxVqfj+1AZyfEqQGwSiwH82EVKoRZmuxZAF7fDEOhuz6u4UU3yKr+n4SDWu+fpZOPgTYsJBFSrwbAcZPVDmiM5rFZeZRZ/NZDsjt54fb/vB5yXo0Gr386qaUWahba2cNaY1OXMvfGXvro4ZdK88YaIpg3GBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d705350-5130-ec53-c814-7f7cbf451602@suse.com>
Date: Fri, 16 Dec 2022 08:52:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 07/10] x86: Derive XEN_MSR_PAT from its individual
 entries
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671139149.git.demi@invisiblethingslab.com>
 <2d6b2f875f023e9f57a93e31e82f8eb908a36d36.1671139149.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2d6b2f875f023e9f57a93e31e82f8eb908a36d36.1671139149.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da8d34d-5790-4265-a946-08dadf3a7b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hH5M2EVpCGgfCX6LGfbVYhf3b4wLDyK+gyv9TGCOdX67wOrxbbq4Br6UyBSVRfOK1agbfX157mGjSQcZVtE0azCI/5rh2JQ12kIoszx1K/W+C7dQk2LoLFwuVR389oCdil/NADQdxjhABaVuXbyXBSV9RrqOeN0Rii3TXQBiJ8pvNFmF57psppQYzcS/+h1aMqTF5aeyF1Mo8fM9hRm9AfiagRVoQxVEMfASDfQ2T1o9Fffzi6wO83h4gvbKRhSEcWP+5zo9un4INgNKXpgd40Jt+q4ZJ4ZO/uJSnzJRobyIzRakMwCsFLOPCKQO0kF+oEEvhWDHacat0Fb5wB2iWYzv3wmjUW4J4vBFgG4qvDnuMEtvDSCYrjk2yv3wwO7Y5IvHV9gIeKKF8sGhgdbJnggbEMXXwdv1fnaDFgS9RkjnryQox9qteCjXF2/EI2a7aOJP9/OXnk/mad+eMr2q5rmTEHcPG5KUcXrpvlCIL9u4PZui9nf5XQ8pWOiF6M8Y8vuE9wdO3pYweONuBexTu0eqPIQ0YdEFxLlaNRAWHV/vh0fDYKHoSQUevnd/c7K1nBX1VXaDp+p4QqOK/U814DvyD0Mo0oode+7B9bhyK/ACn5WLGQO4rF816wjttWaN4vzHsRMBUvikBqNDaMziZQTAoMtJ5j1mN06H+hTdsKtoBVQ3+C57NutIQb4y35Dk4J6a8tl5OFNZgMzNx/qXgsA86UuLf//KmziuiH0fHNo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199015)(38100700002)(8676002)(86362001)(66946007)(4744005)(2906002)(5660300002)(31696002)(4326008)(66476007)(8936002)(7416002)(6512007)(6486002)(6506007)(53546011)(2616005)(41300700001)(478600001)(186003)(66556008)(6916009)(26005)(316002)(54906003)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1ZxR3UyL2xjT2g4Vm5GQTNrSk1ZM0hyZU92dHBrdUdkVzkxbk44UFNlZHhE?=
 =?utf-8?B?MU5xOTQzK0VOVWVmblVmWDVFZjhsREt1dDdpVzExNzdiSU9INndwSmNTeTRM?=
 =?utf-8?B?WjF1c0RxcHZIZFl2cThJRkh5bWJmQjhNZ2gwTXhQeFJyRTlxNHhWMnhGVlJO?=
 =?utf-8?B?Y0tUMlpubG9VWTIwYW11TTJsUDZZUGNGbUJmS1ZtczhlZnVEcjA5QndOTTdz?=
 =?utf-8?B?a1A3SHQ4dkFHOHp4Y1YySFNVaGkrU0dFUU1BTDNnTjV1SXNESlFsTFdaSGR5?=
 =?utf-8?B?d1FhU1Q5bENoM1ZSdWxsMlNwSno0bU9tSEZkRFdLdmczOURoa3BvdkMwOVN2?=
 =?utf-8?B?UDJCUlBWcXZNcDhGWFRvOUNEa1hsMDRZUlYrQ2QrazhBTTEvUnEyU0lzOW42?=
 =?utf-8?B?K05XY3I1YkYrNVhpb0c3d3NzajhtOW9ydTlXY3lxc1NGZzk4Uk5GY3E1NGto?=
 =?utf-8?B?Zmc3blhPcUE5ckxwTHU2MUNadjA5TWhpSENxQ1gvdkVsKzA0RUQ1T3ViK2RO?=
 =?utf-8?B?bXpBcDFSdkhFRWE1Ui9xZzIzdW5oR0tLb2l2Rm5SMURVeStQUjRBV1kvbjNi?=
 =?utf-8?B?WWx1elBzYjljMUwrR3JKcE5yeVRuczFmRCtaZExKKythODZWbTc4ejJHRWcv?=
 =?utf-8?B?OUJMTnFTWWx1clcwVGkvQytyZ211UmpTelFNWWRuZU9pQkdnWUNBTElHNDlY?=
 =?utf-8?B?S2JLQ05kdFZQeWtzRktWT2wzMkNBWGZvTUErRHJlaFh0YXpSUjF3WE9QZUpW?=
 =?utf-8?B?N1FlNUp6TEJvL0xRZTBmRnRrcGd3VzdybmxLZFJ4UWRtLzN5emU3WHFnVm1t?=
 =?utf-8?B?SkV0WHFhWWsvcGdmenZ5aFJCSU1RK202elNHclEwTjRoN1p2K0NyWm9MZUVO?=
 =?utf-8?B?QTJJZ3gxVGhXWGVTWGQwTG14MlpUMjlySGphd2VjSG14Z1JDS29BbEJwNUo0?=
 =?utf-8?B?RVBnYWxKZ2l3dWZxWmVqSXpWVDJaSUh0SzcvcHBSejl0Tk9mZ1lNeG0zVGR2?=
 =?utf-8?B?Z1RuamRRTnFOa0MyK2JvSHo4N0NMQ0V4c3h6cnpLUG5Jb2RWWkMwRU9kVlNw?=
 =?utf-8?B?aVNKNWJycUJSZzdoZjNETitFTTJNSGRMa3BzdWNHcFlrUWhNdmlCZWFTRGJo?=
 =?utf-8?B?RU1oK3pHa3VRMWNtOWFFOVdWS0lORUk0NGZMQ1RiNERROVVjNXlyTUowbTJX?=
 =?utf-8?B?cGZ3SERKRWlQakptVkUwWUMyaUNuK2ZRTFErWXpTcDFLM0pTMXZqa3AwenRy?=
 =?utf-8?B?N3ZmUXo5NUc0Zk0welNsSDk4d3daZ09LOWtWd3FQTnovamc3UmVnbnJWUWNF?=
 =?utf-8?B?bzMzSXNzenVQeno3aW55K29YWkhLTXd1QmlyZ0xIZUpsbUVsVGhJbWYwTkxh?=
 =?utf-8?B?NkpYRTZBMnlOWXludFZDRVVjM0NTNDBUbFl5U2dBMHZpN1U3UVp6Z0libnNI?=
 =?utf-8?B?M2ZYdjNGajAwRE9IS0lrUk1QT3RtMko3UmF3QXpjMjJIZTdqWFBSKzFWYmVx?=
 =?utf-8?B?ck1EbGZUODEzT0xKcHQ0VXhSbnQrUnc5WXhHdjZzb29lR09CbXdZUWVQeG1p?=
 =?utf-8?B?dWZLSVBtbFdvUU1YL1BMeXplaFB0TU5hL2V5NTlvVTVyRmNkZlhtV0JKU1lV?=
 =?utf-8?B?R1o5ZkVhSWY3Y3kwL1YrSEdROExxZS81Ylp1empPeUVJWTlZZk53MHovUWNV?=
 =?utf-8?B?Um10Tml3TUxMNmNEQmVjdDhsVlNscFpPTm80L0JUSFUzMUh1MmN3aUd2K0xx?=
 =?utf-8?B?UjA4ZDFLK2U1RDRBYm9UZ0k4dWcvZlNtb2lSU0U0amxmM2hSOEdNUXpQa0Zi?=
 =?utf-8?B?eXFvL21rbUp6ZXVWOUFNeWZTTVlBOEV4Rm1DcTVzZk13U2ZYMjdFMjVTU3M0?=
 =?utf-8?B?Rnk2ZTN0eW9nM2hySFhjYXpaODNrV00vdUtJakdnSHIxQ2w5QnVyYktsZy9Q?=
 =?utf-8?B?WlpnR1A4dHpleThkVzdVNHpQTmV6N1VkdHZNQjF6dmxWRTVLQWdsNnplcXFi?=
 =?utf-8?B?TjFrRld6K0tRajZVc0kxSWVVMDdOOUpnS0RRODRGQnIvakR3a0M1UDA2RjRD?=
 =?utf-8?B?VnpaMGRmUXdBaTRBRWdwL3BIekhmK1AxbHdJRFBEYUZtbFk1RGF2cmYzWS9U?=
 =?utf-8?Q?3tv7f1mPW8POjyTBNbmwa5S7+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da8d34d-5790-4265-a946-08dadf3a7b54
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 07:52:29.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBzsMfOdzjvfJdiEd89KWAEsOh9j7DhqloE/lpetlg5V9UrzPwI3PHRmVZIUtrGeq6V1XH+b4xYLUlwwdCaT6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7540

On 16.12.2022 00:57, Demi Marie Obenour wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6357,6 +6357,15 @@ unsigned long get_upper_mfn_bound(void)
>      return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
>  }
>  
> +static void __init __maybe_unused build_assertions(void)
> +{
> +    /*
> +     * If this trips, live migration of PV guests to and from this Xen is
> +     * broken.
> +     */

As is anyone using in a hard-coded fashion what the public interface (xen.h)
says. This wants adding here imo. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

> +    BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C


