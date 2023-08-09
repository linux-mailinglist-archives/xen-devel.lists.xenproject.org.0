Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A65775FCB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 14:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581059.909581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTigD-000562-3p; Wed, 09 Aug 2023 12:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581059.909581; Wed, 09 Aug 2023 12:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTigC-00053T-VR; Wed, 09 Aug 2023 12:52:48 +0000
Received: by outflank-mailman (input) for mailman id 581059;
 Wed, 09 Aug 2023 12:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTigB-00053M-Ax
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 12:52:47 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3396899-36b3-11ee-b280-6b7b168915f2;
 Wed, 09 Aug 2023 14:52:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9054.eurprd04.prod.outlook.com (2603:10a6:150:1d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 12:52:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 12:52:42 +0000
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
X-Inumbo-ID: a3396899-36b3-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdPTyyVVS45EDDuOjEl2oODT4s7iaIdJxLfMu5F9kJi0ng12DGvq/A+iU6Wjv+7ZIUWIk3PJ9LOZBzF9v6V48KP7hHYI/TgQCKMdM8vA+GJcbDnRMxtp0eDhiHW/ief38LZIM3J4caqyvLEW3wYhpfOliB+xfKkACJqcli96fyhAezSn+PQzuAV62c8QlUbqwocckFmeoOphkGT96HxGdHa6TDXhb8PNSEs6413TGtv66SJMHI8i/nwsGNw2s673jVLuOrOqaSWfIGusw9uXObX+X1J4onFqH5hnuEpldkfeLYSp3sv76YxfMCcqcwjZ5clen2jtN9RKhWDJkIz8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdwjTbUbO+QqXHR55jQn/wqnb9odMkztNp0p2VMdN2U=;
 b=SPZEtrzKCeQvZpbngVd8zVahPA39sG8c0psr0Eg9P6MSh4n/0ZHsm6QOg/ysvbCmm02qPRjvojGy8FLfhEwWcuzKa9I74KSW91qT64VO06LC/zMaAXWGWkCegntdrMxvJ2MMOY0IaS849EVJNDQv6At9wY5U1pwR/HaFZpMNXFkmSm/e+2Q0Jt1jLxHr/YlEF8C6S+eHdWVrInXmOJ9YlU4k8E15UzPHOwer9HbW/sLWrzkyBO66TTnEuX+VUgLCeqdNqYZhFerSV2ZsH63lGL5Dt4r9juHLHkF9R4crrIbEffJ1ae5fqU5bNIdsvF56eN+d4flfMTotrsp2w2v9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdwjTbUbO+QqXHR55jQn/wqnb9odMkztNp0p2VMdN2U=;
 b=SMuK184L+TW4OooCxL95ZZbs+nUYhJcDHTzF6Y/BGJq3guAAq2Nz+eT4jgZ9P/zwqKkmYf6FQ6oh48pgF4A+KQHAwOon1B175OsZ82yhaRBwdx6Xx0XzyFdyM4DH8RQyZeV2E9s2/Pph175eZJlyjMr/OHTO+chy1/o4SjdYG6geXpe2G9zfWgXgS1j40Sw8n0FGJqiiR/NWPH7Qc8U/4N/IWvhXL2XlgEz+GaETuQ5qZvVgSfP1CvbxblMAEidZcen5bdBXASKJafxSP4q0QdaR33OLTKeBligDAhxCsuUrU/2ZOzU1jSRKwwQ3K0Lxb/oLBfagzxWwSAfC5P0Z3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d752a7b5-4b8b-8394-8e72-bcdffce1fb82@suse.com>
Date: Wed, 9 Aug 2023 14:52:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 7/8] x86/i8259: address MISRA C:2012 Rule 8.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <41edfbbbc8fae317ebee791633259d7b5c88a2c6.1691575243.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <41edfbbbc8fae317ebee791633259d7b5c88a2c6.1691575243.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9054:EE_
X-MS-Office365-Filtering-Correlation-Id: a184170c-d869-4e50-cce5-08db98d78547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WfwnzvesxRP/CEGpeznaTlKcpZAps1BGR1Oe2ROmBrMXlAWUnWpSl5OcybxFw6WacvseTyll/UPrej342bKVViFNAIZu7s970cXqi6FLWLtOeDQJxCCPCH/qg7AovCN+/TAmNcbsIQozwgaLEO+lhLnB4aMNLV7JKmkrypUDjHb3R1qZ38G/0yJ10WjxFTb1iTWaBUEa+czDaonjQjn7dq7Q1a7U3GB/rRPicV+mqgWRcJfAGDfA80XKUf/LOY20SVA7ykgUycH6tzaT1uVRs5F0wXJE26Iqrka6JAfZop/D+xudlIy+bvlmxlihAk6nffL86cWB4tsucOzdtoOF7XwZxVg7Q2+Hx2haWT65fITeb3+KfupVzthEj5uoz6orGW5IOTm2I04DBGIm00orcnqNjn/kevCmJQCkJSEddIuMWINhAE3V7jIuQ5SGjb1TIsF7JgV3dgHIpNRqChC5JKMBWBIm4plAMrCICv3JKGwYDSfjpjBHUMSNkwwgdtatGUYOeb5V/R9bgayTOUxTH0je83VWLifQR8UTYKZqsiSqrAmBFQsQbp0z6ed5NF29z7GA2D1d7Fi4xrdJXGKd8gONXhxJqAq7NUKtNOTg4zdiTfHhz6O1JnT6IMXMWWh7NDgvlY5VTBlsTPefx3BrhQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199021)(1800799006)(186006)(966005)(6512007)(6506007)(26005)(53546011)(36756003)(54906003)(38100700002)(5660300002)(86362001)(7416002)(31696002)(4744005)(4326008)(2906002)(6916009)(66476007)(66946007)(8676002)(8936002)(41300700001)(316002)(66556008)(6666004)(6486002)(478600001)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3hQakFrMTc4ak9penJ0OFRLc29LM04wQkVBZEZXQ2JDTkN2NHFzMXkxbXpq?=
 =?utf-8?B?U0thV2RXc0Nxc3NDZGZ6YUJTRW5FRGJUTUZmNUEwQ1BsRTB6c3VpNzVBY2FU?=
 =?utf-8?B?UkFGTy9jVWZnd0hUYTM4dnhZTldiMEpmSGZob0lFQ3FVUVoyS0tnYk83ekpo?=
 =?utf-8?B?MnJhMU81QXEwbzZLaFpjUitqVG5iN3RBVFVLbUxFZDR5WG93anExZmJwV0NL?=
 =?utf-8?B?Nzh4aU9EU1Jwb05SYVpwUGxnM0NUdmRiWDluTWpUcEZnTTJzeWxNTDFiaVlq?=
 =?utf-8?B?NzdaNFJZMHlaNEFHMGZGYWpTa2R4SHBLU2N2eDF3VHRyR3R0Mll2TUZOSFJp?=
 =?utf-8?B?dXBpaG10RlpEZU5EVVkrOFhjMTc3OExiVzAyaDRWYUJqMEN3MUxscDdDQzY5?=
 =?utf-8?B?MzU4MFo1VFZtc28wYWRoa3I1cWpwY2xBelpWUXNtMytoRk4reUo0TDM5d0lP?=
 =?utf-8?B?NXFJaDBMR1NZcEl3bGl2TXVNWkh3M1BzeHd4MU5GR3FLZUdXZFNVTVArcnFm?=
 =?utf-8?B?L3BXeVJUelNCK250OUd6ZVEzMExpNHlydUFnVURTU3lqU2JVZWhMVGtZNjFu?=
 =?utf-8?B?SDdjZzJMUm9LZ0lBMTIwMExISVlOdGgvTk43ZkFCcDNCd0RZbnJoQTNaUjRs?=
 =?utf-8?B?MU1CZXdtT0d3NVZGL2ZMNWllL1dubGNZeUlCQ0FKUUpqR1VIcHlGT2NqQ0Vk?=
 =?utf-8?B?OEZHVXVHV0NCYzZKeXNrVXpwazRkOEhGV05ucW5ESWJJT0x6ZUNEbXM1R0c5?=
 =?utf-8?B?MEEzTnVoZkl4TVNUazdlcVRQR0xzNnQ1d3p2eWs1Y0haYndzeVpCa1BZcGVi?=
 =?utf-8?B?dHZEcmJwVUxYUHNmRFViaDFWcXc3MWtFd0FzTmwzN2xLUit5Zmg4eWtsUnA5?=
 =?utf-8?B?dXBUeEt4aUp4TlErTjdMZzhNeU9iV3RuQWdJai83Mnk5VVc2Lyt6UVZEQUNX?=
 =?utf-8?B?bGJPWC9FT005TmxkOXhUa3ZnZmRPeWplZUZEdS9JTjdjQ0RjUkxnSzNRNEN5?=
 =?utf-8?B?RERsYW9XOG93Q0F3cm9KL0NyNTRGU1JNUXhZak4zckpCSHBvdHVlcElES3ZG?=
 =?utf-8?B?NUV1Sm12OGpwbm9PZk5FVGJ3Vm9NWXRhaEhubXl4YzhsMHhFMXZSR04zNVVH?=
 =?utf-8?B?T0oxOUJTWXFra2JjdUt0cFlzZHZLZTZHY21ZSzN4djZ5V3dURzNueEZETGtr?=
 =?utf-8?B?QkZ6RmxXWEh3Tm1DVFhpRmxpWitLcmVvbG1tRzQzRVgyd2JiSUpieEp0eElk?=
 =?utf-8?B?MDRuWlEzcFpSSmgwNUp0VVBjOWpwVDF0a09nR08yOG9jRlRUbEFTcThXSGRE?=
 =?utf-8?B?RFAzdVM4ZXBHbGZ6VkVFQXQ0ZGY2aTRhQS9hNnhxNXBIK2pwM0kwdnN3Q3dj?=
 =?utf-8?B?bnZBRVBOMFZUdG1veGdlNGdGdE5RM1YrOXowM2RyeVpKR1lHZi9yRDRTNy9n?=
 =?utf-8?B?c0FMeEtxZU9tRlZLbU9XYWMyK0I1UnlqbjYyN2hIeE52cm12RzRENkRLYStv?=
 =?utf-8?B?dytHVmxNTkY2UlFQeisvcjdmMi9UY3JLT0E5Ri93ZDFVUXBMRGphYlB3Y2Er?=
 =?utf-8?B?dTBXbDhmeklrT2dvZEQ4K2tCZ1JnVXgva0NQL0tBMzFMOWxVcDFQWVFUOHZH?=
 =?utf-8?B?SFh1Wjk2ZEpzYUkyMG5FYjRoeDErdHZjM2ZQb1hmZ1hhcFZqT3RNNmZGYTdZ?=
 =?utf-8?B?U3hIVlJzdjdwRDRtNys2RTc2a0xqRHNVMVpucm5zenlFcEZVV0tkcm9DV056?=
 =?utf-8?B?RmdBdDFCM1kvTEVlakVheU5ydi82bjR2dmxQZm5WcFNoNWEwZUlzTnpVSGNw?=
 =?utf-8?B?dFRlVU5QTjhYUWk5TEFwWFhreW5RWjc0SVczSzByeDJneE5RRFNyWkd3TnNi?=
 =?utf-8?B?SHYzRG5oQWpMcnlxVHMwMEhISForUTR1bUp3dXJ1SERwUkNvaWoySWxrVExP?=
 =?utf-8?B?RmhmeVdDaG96ZlJhN1BIVGRJWjExQTAwSUNOeVM4TGNDRUhzRFB0bko2ZkZG?=
 =?utf-8?B?Q09ZaEJLSHVybnRrYTdSV0JzY0czUkZNbXB5NzlFMEpZQTFCdVh3WG1Gd3Na?=
 =?utf-8?B?TFluWjJZS1BCbXd2TllnbVhYQ3pvck8waXB2NjNlUU1wNWszaXJRbGJwWXow?=
 =?utf-8?Q?bl9YVKk7dz3bFwqdqiDX7TF9y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a184170c-d869-4e50-cce5-08db98d78547
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 12:52:42.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJ1rRv2Uyo0zSwBhFFAESfGnTmmbM7GO3dLJlBHUlO6T/kYW915J65QMIB+uR3QFiS7j4/eeBYY6ElD+ZLHbyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9054

On 09.08.2023 13:02, Nicola Vetrini wrote:
> The additional header file makes the declaration for the function
> 'init_IRQ', defined in this file visible, thereby resolving the
> violation of Rule 8.4.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/i8259.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
> index 6b35be10f0..9b02a3a0ae 100644
> --- a/xen/arch/x86/i8259.c
> +++ b/xen/arch/x86/i8259.c
> @@ -19,6 +19,7 @@
>  #include <xen/delay.h>
>  #include <asm/apic.h>
>  #include <asm/asm_defns.h>
> +#include <asm/setup.h>
>  #include <io_ports.h>
>  #include <irq_vectors.h>

A patch adding this #include has been pending for almost 3 months:
https://lists.xen.org/archives/html/xen-devel/2023-05/msg00896.html

Jan

