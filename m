Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BF378C542
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 15:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592223.924880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qayl4-00017k-A4; Tue, 29 Aug 2023 13:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592223.924880; Tue, 29 Aug 2023 13:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qayl4-00015F-6t; Tue, 29 Aug 2023 13:27:50 +0000
Received: by outflank-mailman (input) for mailman id 592223;
 Tue, 29 Aug 2023 13:27:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qayl2-000158-TA
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 13:27:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7608612-466f-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 15:27:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9410.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 13:27:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 13:27:44 +0000
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
X-Inumbo-ID: d7608612-466f-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpQ7/6r4jW6g/N++xZDvQq0ySRzey1U3/LBnmkdXVIxs+wZTtTB4RMPDkHaIS6ZkaVF1PMIqXbbR5aPISj+37bXO4g/sHYSsZTYAAb+wFODXPk+oIRvxBDWUx1+Dt5wktJLhta1uETTXxs/560wLZORsqE5wRxs0hhHF4RuE2waNQc4bBBYdIiDrnvygbdgWrSBgAO5HjhYiM8HFg3ajILw8IS1nVg4hJEw5pYu1UJNoU78uj7lSbi3T/s2vDDerDqSuCd2k52SkjFAIZrpIraF3U/Cr55jt3sdR+4ETaAAbXDuRQd4Wuxcoe00Zyitf2OTpkGMgT3dNuEwyljmeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDsJl1p7wFHuZpD7gsWmAvch0per+E9iV1L9ki3wsto=;
 b=TFrhEGw4kd6MYrsrb1eFXHlX8r31g/HVylaw6lVTRC8FvA0UsBVXRq0nWi3xKoxTw3zv7AwJXPgfY38JVf6yoRwZrvJlzTJKXFKHyf8AyO38PutWsAGGzFjukeP+mJV73t84esISijltVYLkSYJieTKD/uOa89w9Xf+LpHcR5b4VS9HY2YJc+Wf2bbIIXnSCeGHeKr2YvFlbakAed7rjU3swYzC7iOaUFk2EpmpXscMuTAVqtoLVqOer6FJU0lFy8JhxLCI0/jugcPbd8EgAVVhixsGOc5C/2Ae8VXsOCeUSIfhEaHXmbkqw50O7QbmR/aO1ycjA6XSoQA5TovPEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDsJl1p7wFHuZpD7gsWmAvch0per+E9iV1L9ki3wsto=;
 b=L3AM0doZMPtSbCo9QuWP/+pe98o7vVbFo0GgCr3NUthYjz328DaGnXMInu41zR2FsEspZv/v6Q0VvP/zJV4x7JM42Z+XJw/v47t0Y/+4MHdvYXFlF+zgW7yJcg2Y/boevrEfj3NUqQDEwHM2HbD6vLCqe1o9UPdyOhcM59bU5uBWLMn0Lbimi+UCufWp2jEWVDffT9ipr1FGZRj4rRTrCPmMctaMkmYOcbvrheAB7CXM9pIho2CI/va3aTibUJvVVva6XKUIsqeGli9yPd5GVu54pkHlzbAIAnQ3y/69S3zlvAaCPPSAMiF++Pha8c7Lyrx5or8zBcJS99uV2Sx4IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5bc8dfaa-122c-e076-eb8c-5bfd9a459dad@suse.com>
Date: Tue, 29 Aug 2023 15:27:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 06/13] x86/EFI: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>, sstabellini@kernel.org
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <e5d9700d6ca237aed64ad11a9025a71a6fd3e792.1693228255.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e5d9700d6ca237aed64ad11a9025a71a6fd3e792.1693228255.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: f17a39b1-48b3-4502-21b9-08dba893ba2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fATvNwXI8JQTX6xpeykK+rs8XzkaHQfi4iVcMLNua/rgO0U1sGqy5jZHvUO5ScjdVDr+0O0NwnxjXMWd/Ql88wAytsr/U7w+/TLQSXMy20ltJlBIInhRej3zA5SrtH1uvSxW0jZjXyQEt0Vj+EORi0xh11MwWBmrS7099ffMr5n2V8MxAqxdpyRaa3KCHn9QDf36AupXhOAnE1rpWmMupfBaGAh7rMnSjTSL21DVAjw5igVv/vMki1Yy2i++bgEEHnmLEvzOy/ji66aOe0nHpgRj4KUj6PHCvcI4rmQxc+LcHvHB9T57zjjN8b+OIaVn8YKc53gYIB3zUKHKY/AGIalqpPGPoRpcojFkXc/wChMytVS7JUsNlnDQFKPt509PuuwP1cP43xJWB5TWFyoWvm+V80fQmxTspMt7H/dB6FQT7jbgQrBv/vcfetUOZF7dZ+Q5IKWIDCZNWM4OWwaNNEiXv91ytrFc4yT6hbM86EuZGb35g0vfK34zYYs0QDhErUX6F37MoyZDvNKBd+IijyZHE2Blyuea99ypCALLo9+TsMnVO/IA5xkKQUJwXqNSuEs4XBJSv/V5AS9GtI5avSIHLG6k4tFlw802UITEfKA2VUTrdqrioUgIjCAkT+DcllXuYOm1z3yoLBp9cGapZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199024)(1800799009)(186009)(8936002)(66946007)(53546011)(31686004)(478600001)(6506007)(66476007)(66556008)(54906003)(6486002)(316002)(38100700002)(41300700001)(6512007)(36756003)(26005)(8676002)(5660300002)(31696002)(83380400001)(2906002)(86362001)(2616005)(4744005)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THhvMzdoYUJxK2ttRFErKzRsbnVDZzE2QVlmZlVIQ2R5QWdMYzFOM3JJSFRN?=
 =?utf-8?B?bnFoZkFta0JLeW9Ib0NWR2VnZzIxUFJuYUc2QklwSVhtakxKV2ZaWlkvRTlZ?=
 =?utf-8?B?cGt6cnBhZlJmVmlZdkk2NzNwQmJJYXY0VE1LcmlYK1F4MTI5TDdQdEFzQUlO?=
 =?utf-8?B?Uy9zdWtIaEoyUE01VVJyNytvVzRKSUJvTnNZclJVNzRISHRaUHdYRGJWekFl?=
 =?utf-8?B?dmorY0FIallQNTF1NlRMMldhWjBIb1RoRFh0U1dXRDVpVnRXcWFJTTRaR051?=
 =?utf-8?B?QkltYkNoNU00ZUhIMWY0dTFpb3NoNXFVVzV5QU9YcGc2TmRoM1ZkckN4em5O?=
 =?utf-8?B?ZU5DYXV3bUEzbzBoRnVTYU5XZDdJNjVkMHplNTF2WWZDdUlKYlNjd2xzaUxy?=
 =?utf-8?B?WWxRVEFpa1JJWndRWFg1ckdYanFWei90Q2pLQjY3Q0V6UHlaUVU0L2x1b2dM?=
 =?utf-8?B?MDZ5OTNJc3BsNkNpaXNKNWxvUzVNUEZEVHJGaFRDdWtPVUNuU3dqSGpsOStF?=
 =?utf-8?B?OGhjcUhyVWxYTmppSU9qYWpzdmxOVnRFdXZFZjM3bjVtRDF1Q3ZMWU92RVVm?=
 =?utf-8?B?Tkd6K0hOQ29HZTRuYmNCZWgwZU5MRytXeDR5aERvR3hJTHErdWU4ZkE1THhv?=
 =?utf-8?B?MmxhcER6S0JqZU9KQS9KNmROa2NDN05XRVAyWU11WnZFYSsrUHBTc2VsZVhY?=
 =?utf-8?B?dWlPRFdUN1hscW9ZdGdwMHZNUG9McWc1c0h5Y1IrTGt3bmYvUTZqUFhJbjk4?=
 =?utf-8?B?alcwek56TFNnK3VCUGtEWDJBOWNVNWdJQ3BweHB6d1dadHlNb0h1NEVUd3hC?=
 =?utf-8?B?MHAxbStmR3VXYXZYTjNZUzJBV0hRUk1BN24wRHArWVhBNVQ1bjBidXFBUmRH?=
 =?utf-8?B?dlNyd1MzNG5ZbzhQcmRpUFRGWnZ6dWpROVNIT1dxRnFtZ2I4ZVpMV0FFT2ow?=
 =?utf-8?B?NE1mR29hcGlQN0ZJOWUvSHFYNUxSMTJvU0grNlVyN2lwQnl3KzVBNlVReG00?=
 =?utf-8?B?enZicVRTQ3ZSRzVPNzgzbGM4OG5OQWprdGVXaVYxcjZKOE5kR2dWdWhONTJX?=
 =?utf-8?B?U1FhM21kTFpsTWlOOXo0bW91ck9aWVNrenNNam4xSmlHRXp5ZGdzSDFrdFZ0?=
 =?utf-8?B?MEhITGlUTHV0SWxRU29YSnZReTUrM25saEZpeHZrN09HbmJWZkEzUktOekJQ?=
 =?utf-8?B?RGZVNGY1djRkZkhsbWdEZWRrUEg2dmVubnZRSks4OUtVNERoZm5vayt6Tlc1?=
 =?utf-8?B?QkhjaC82UEVWVCtwWWNpanY5VjZxUGJsQlZWaEUzbzlKQURQQThPWWg4eEVm?=
 =?utf-8?B?eDk3dkZSNExqbndDVFZTRmRzRjVKOEIyUnZsUW9qSVdVWFVRQTBwVC9DcWlH?=
 =?utf-8?B?VTBHb0NkOUU4MEhHNjFXZmhmdXdiLzNYR2Q4NG91WmtUc0Y2Z0U2Ni9TRGo3?=
 =?utf-8?B?bWtnVVlOT05GSjdzeGkzV3lTb1EwSDVsOVNpa3VmR2ljazBUdDkyNHZZZGl0?=
 =?utf-8?B?Ry82YlROVGlKOURxOFh4R3NlTllXcy9nT0xkajJyS0RQNUorZHRKak43c25m?=
 =?utf-8?B?aFdUZFpEcTBVcWhFM2pzRENSSXpzS1AwYjZuVnEydjl5cVBobmpsZ0dlb1Vw?=
 =?utf-8?B?TlNQYTI5c3JtTTVNZ3JGZGVwcmJiTEY0NWF0VW5KU1JsNGtKMkhYd2VwdmNI?=
 =?utf-8?B?YUtuN1IrZWlQdkdKK3pSUXN6WmQ4QmJ5eFpJQXpGV2lBMEIwc2w3VlJHaGpJ?=
 =?utf-8?B?bzdIbmljb1RyRVFETXVjRFIzZC81czNYdHZON2xWd1ZGRFRpWUhsRmwyaFhW?=
 =?utf-8?B?VzhVZ2xDQTcxNktaWjNiU3ZKWEVBL3NxOXFrYXhTSCt3OWhTaTE2WHNZM3A1?=
 =?utf-8?B?WFJjK1laUXd5enNZRXBkRmpiTENHQW5jQlpaekhTMFN0QURFSHErL0NJYk5n?=
 =?utf-8?B?L3pUQ2s1bi95b2IvdGI1U0xXZXNZV2NtZE9hRVBZTTRIN1ljZ0NGdDdMRXA5?=
 =?utf-8?B?c2M1WG1URWZMY0FvMjEwM21MTlRkcTNkYXUzeDkxMCt0SXdlOEdvakdySHlB?=
 =?utf-8?B?amd0MEtHc0twakhJY2EySjRTYUFWNFdYZjF1TFc2b3Frcm5ncUVxaUhOcFBM?=
 =?utf-8?Q?L7HJpvdn4ID71D3gEruEWzKTm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17a39b1-48b3-4502-21b9-08dba893ba2b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 13:27:44.1109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF/xSguan5vk4dzFgO5Bhoo1buEDugXfM8YQamLDA9LjJK5YOzESeN4r7mtEepnSz/CnKCq0Alw99NtTCrATug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9410

On 28.08.2023 15:20, Simone Ballarin wrote:
> Add inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  xen/arch/x86/efi/efi-boot.h | 6 ++++++
>  xen/arch/x86/efi/runtime.h  | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 92f4cfe8bd..2c6be062cc 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -3,6 +3,10 @@
>   * is intended to be included by common/efi/boot.c _only_, and
>   * therefore can define arch specific global variables.
>   */
> +
> +#ifndef __X86_EFI_EFI_BOOT_H__
> +#define __X86_EFI_EFI_BOOT_H__

Considering the comment, I find the need for a guard here quite
"interesting", to be honest.

Jan

