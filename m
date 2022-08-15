Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBF4592A1C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 09:08:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387068.623171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNUCN-0000ni-Ky; Mon, 15 Aug 2022 07:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387068.623171; Mon, 15 Aug 2022 07:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNUCN-0000kI-HP; Mon, 15 Aug 2022 07:07:43 +0000
Received: by outflank-mailman (input) for mailman id 387068;
 Mon, 15 Aug 2022 07:07:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNUCM-0000kC-1f
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 07:07:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80051.outbound.protection.outlook.com [40.107.8.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f37ba64f-1c68-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 09:07:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7527.eurprd04.prod.outlook.com (2603:10a6:20b:23c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Mon, 15 Aug
 2022 07:07:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:07:38 +0000
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
X-Inumbo-ID: f37ba64f-1c68-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9n9oaVAanqlO2iCqQ8S2o9BM444WMRgA8DOfoczO8CwvszaI1/cFYDNiccWnr190uYscmM0rP72A/fJaGTTewRrCSBnqoMG3uSWPzsrdHLt5csrkwvezs4PWoyXW/mv+EoMewzYm1eufini1IstkYUEhV5o6s3sciCJryWmbKZXlwV4VyWnCQax/NDTrd7TT1pLvV3BSWLIMSZkA2B0vT5+MOJYSSLB29o2RpoZYu2nyMLTHRnUXlmStn0l6lS7k1NC2oWn9Hl/Xf50RYPM7UkEPlzoxSbG0r7puEza3Pu/k/IMwnYHb93gIlBhvge6uxCgk1yPPIknks67M/DWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D59zYW9NaXZzVvOXNAOE/Y5qnIokwt4rxRWE8/pVPCM=;
 b=AIzLpdE+bcv6vSpDjqjfTWjuGbqWE5zvI0YUnIO0NkJRPhLVvEMloFRjbJ0kd5PYrhw1aVFoW6OIRL7vFaK9SF/ISe/282zO/reFKGl5imVHjgQBmeLbuqcbiKdeWzC7fq+Dx683fz3a7gYUDQhZo4wm78DusdjZe5vuVHCMGyfC6JMBM/6YFOQeQKtp9MtRN6Hrktn+en9URpIutRn6rfoyRUSJdmauSBwDZHQEn/hmuz3tQ0Y3qmR7rCYnTQv2sgsl5mRAnjc2O2U+e6YbJ+UK+xrnNpkvTRoCPL9kYFgEr8T+SuW4kgjaa6AQSe+N+ZdwBpISmEjgdmc0R0x5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D59zYW9NaXZzVvOXNAOE/Y5qnIokwt4rxRWE8/pVPCM=;
 b=KQKggMDhLTIN0lxsxmkngX/uKtkCgv6791FwAKkxwV17WuXHyfWBqqrK0ww50EJJBaEJk20Bs2E7ysiB3StKxuah8HsXCkBOHafq9KB+CMCHJu9+PHDFEvRml6pseHzX/VtlrwwohqEI5pInQWJrjYnU/N+kVJUqYoLpKAioqS5SGEZ62Z2p/NKAvZsc0TuE81phnn2B39aRdSFVb2ujZ445Gz3tvZNOVlmm6zvCn+Sdsp88Ic92M1kApv6i/PholGBKUXI2glw10ajHVM+rxOJ5rZudNKhHc3+DslDEmQB3oXGtHhhdSCy7L2tKd6kzXr5AQ/EDEYaP3MhkNiYWAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77641c05-3dc0-cc47-deb3-8ad45a60ecca@suse.com>
Date: Mon, 15 Aug 2022 09:07:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/traps: Make nmi_show_execution_state() more useful
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220812173322.2222-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220812173322.2222-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba45944c-b73e-4cde-e479-08da7e8cd65f
X-MS-TrafficTypeDiagnostic: AS8PR04MB7527:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CsSD0oF6yQtjhXRUOkyY2mqeXIij61uAaBAbI8Kz8xXr0Bvh5SEkx71j7qca6HFTj8WoU4KKzqRB3F/Q4xDqCdRyey2uGF7tB/tEkscAZhtqdR6ZR4MXywBsL03vHV+Uyj08CJz0Plpp5PdwkZR/qWgU5pJOMTJckg4gySqI3oUZScEiXGwBGcVeZDsyS8aPlMYRfuRQJHkacnbhCvfvc5Tq5l39OFjAlVRcjutj1KrvOSLg9JJP0rYvhTmcBldkddeT6YfUXO/vxi4V93Dh/ae+DImqbXM+L6xBrr4h0NYH5PzGbGOtjhBi4NgCWPYEYrFyQW0iz12FoddwO3JiSACzIJEnN6eB7jlU1gCJYv14q3xaTfbhj4GXPjAU0DgsfOns3hTt/3P1EPhkZNzZO/ipj/PfcHl4oC18pAhBZzO+x4psuoExVCWn6nmSzA4oTm2MpFZrt/f0AVBrn/jbSfyTU7ghUQzUnHvL86bgLIHARmZnjFHyLFwlSNrQQU9gGXKUoR+muTXTuM6S/AFVzFW2pCyjYe1EzZMitbADXnEuM0xV1hmI2OTxFH+RuDlvCFPLfwo8Zoc9NkTXZ9T7vpZAuykmTiXvIjJ9tWt4hEwiI9Ja8eHP01z2hYPUc1iW+aedHEAIeNhhuh/8pGD3RBQ2vdcZz4OkT+8cXJQqu9k7YzcrQXqo2Ow+Vz6ZxamUFfNubiEAucDB1jjJVZg6gs1zlIjmetIYtxeqx/4vyvMvq/fDBPliXcZTgWFJ9Hu8hcnky+4ZweqAiP+2bWuBgGXIXRsI6EiF2pwk2P2pa1oj1WZUY3VIPdImjSG88q1YJypJRXK8CFeIpzihRlQqeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(396003)(346002)(39860400002)(136003)(6512007)(26005)(8676002)(38100700002)(31696002)(66556008)(66946007)(86362001)(66476007)(6486002)(4326008)(54906003)(4744005)(478600001)(6506007)(6916009)(2906002)(53546011)(316002)(36756003)(41300700001)(186003)(2616005)(5660300002)(31686004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THhPSEpTRjZHUXNUc0d0UFJBV2RzSm8wazdrbVBVeWc5dmRVbU9UdDlxaSsz?=
 =?utf-8?B?R1IxSWVGeXFGaGpKTlJyU0tHY0xONFFIUWZQOU0ySmpVVURTSWpNY1Y1QlZF?=
 =?utf-8?B?Z1RtdTF3aG9hVnVuRW5GZ0VCRitSbHFPdTJIb0NaRzFvbVNDOEJlRFdFYnIv?=
 =?utf-8?B?alVjRk14Y3ZGcW1QWjF4cG1aSXd3K1NOZWgycVZLbXlqSklteWtjNGZBNldJ?=
 =?utf-8?B?cHFjZXVOb2NQckR0YkdoemVKRVJzY2wvMXdCZE1CUXBiNkRibDhERkNnWDUy?=
 =?utf-8?B?ek4yb0RYNXhxZGJGR1VRb2FJNkorbFZaa0h5Y2hiNWFJVXd4NkQwWmQrRFRv?=
 =?utf-8?B?VzlGNG84cEdQa2VTL1F0ZHR2YXY4WXFFbjNyRnhpMDhpZEJpMGJQSHllMmFm?=
 =?utf-8?B?eHdYVTJYeU1DL0MxZ1pyVEgydStuMGVqalQvRlFYWEhVQ0lqT3pGR0E5THFG?=
 =?utf-8?B?RTBUbnUrTVkybkxQblhyN0Q2TXhHTy9aVFJDcVdleWVqMHF4U0gwRHVDazVZ?=
 =?utf-8?B?dDh6UmJkSVVmVXhJcGRGQ3FtRUZCbkNEdDNTL2tKeXE2dy8yZ25heUV0VkVG?=
 =?utf-8?B?bHV3MlI2SHFWU29SaUVtN3V6azFQOGpLQnlFNGpJdzBZc29OMFpHalhvaUhC?=
 =?utf-8?B?Q0llVWVTUnFiZlBPbUU1Z2k5SElVS1o5RG93WHdKMWpSZjFFSWVjNGsrbU5Q?=
 =?utf-8?B?NFBmbTB2QjFrVEQ4WjhWQkRFQVVPWERJenVZZlBkejlSekZtNUtlSzRiMzRZ?=
 =?utf-8?B?dU9kVDBEVFBFa2ZteEcvWmVVTTBMeFJDaW5pdEdiMm83MUVlTk1GR1JudDNj?=
 =?utf-8?B?cmtpRWIvcGdIZ2hWUFdzU21WVE1iWHhuL2ZEV2YyUld5V3BqdCs3bDZmcVI5?=
 =?utf-8?B?aG1CelJ0RGo3U0dwZk44ViszYmRaWkFUbXB2Q05scHFlM3hNREwxcUQwN1d6?=
 =?utf-8?B?Q2JyVXJWbzVPcHlqZkQ2ZlNGeDIwNUM5eU9Bb2U2dzg5T3A5cWFpd2oxS1BO?=
 =?utf-8?B?WEd4RW5wNFhCZVkxWjRXdXpIVy9PT0g3VTBOYW9SN2JCa0kxckI1RW1YQytQ?=
 =?utf-8?B?Q29DQjJaWHhpTHpqUERvdGYxTm1OUTJxcVIxMEg1WERmaThlWUdLUC8vbEJi?=
 =?utf-8?B?NXNZcnd4RVgxbXFsYTdBbGZOZVl0RXZBekh0QXBNU011amR4eWk5UXNaNCsw?=
 =?utf-8?B?TEJzSG9zc0JmL1FiMCtCTmt6WDJKUUwyaTlCL1VjVzJjTWVCMG41TnpnL3Bs?=
 =?utf-8?B?MVVuWXZMWXpTR3JwdWd3MDZ6MDF0QzdpMVU0c2tyc1hiSnJiZnZ6NXFsRzJN?=
 =?utf-8?B?bmRWRENFMlVZNlNDMlhpQlJmTTIrY0ZwbTNKZDlyN204ZDlKamtnekw0OXVl?=
 =?utf-8?B?cVNEcmJLNTlvV1pLeDZSSmFLRzFVQVdNZHlQYUR0Q2pYSFVZRjNicWZoSlRt?=
 =?utf-8?B?am9wR0F1ZVh3S0lVSlpaVlBPVlJQajNsVnpQZ3hTVXdNZ0FTT1F1SkM0M2dq?=
 =?utf-8?B?MnhOU0NKdTMvM3FBVWJ3VmNhS2o2OHlvTkhaQlZQWGQvQWovVytIR2pjVmw4?=
 =?utf-8?B?T3JxVVhSbktyK1g1ZFVXODhuUG9xZkVRNkVWeGZGUW1PMmNTOHAxOXJvWG52?=
 =?utf-8?B?RkhyK1RVN2tkVXNTV3dhRkt4TGtPVER3V0lGb3ZlcFlKL2hEMnIrMWd6UU9S?=
 =?utf-8?B?UU9zWU9zRVhNT2tPUEJUK1hNeXVvd0ZwTFc3aVhmcWtlOUd2Mk5ETlBVVXZv?=
 =?utf-8?B?S05LdkJwb3p0b3pPVS9VMEpLMTRlSmduZkxTdTJ1TVlHOTk2eW9zL2FHZ2dE?=
 =?utf-8?B?ZTBTYWZQVHRXcHJOeGhmMlNYbzVEaEFyWUNPWGRIa01WbVpoMWd5TG5KQUlE?=
 =?utf-8?B?ZlY3ZFlLL0h1WnI2VmZlb2lIWU9XVC8remx6YTVUdENManFtem5aRHJNRlJE?=
 =?utf-8?B?SFFJZmt1dE00czhyaDIzbG9PQnMzRDB5QzlLTVdtWmd5c09XZG1CUS9HRmgz?=
 =?utf-8?B?K25zRG93dFA3SFdTNjExKzI1Tys2QUVVUGltMit5VWRZNnJkVXRvZ1dlSTZT?=
 =?utf-8?B?MUo3TkpCa0hnOHd3VmVqMnZyYWpPMUZHODlzbGNKOWM2Mzd6L09XbTR5b0lH?=
 =?utf-8?Q?qwGmP0IAavKoKplbeIRgj7fef?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba45944c-b73e-4cde-e479-08da7e8cd65f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:07:38.4882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acjjkbQp3kb/mFT5RWWQLq4vuquzCuzTfqRm1yDqnf80Rgqw7J/vurA2ucdPt5gHoOX4a/A11dV1aOSYIw9QRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7527

On 12.08.2022 19:33, Andrew Cooper wrote:
>  * Always emit current.  It's critically important.

I agree it may be relevant, yet I'm not convinced of "critically". But
anyway.

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -768,8 +768,14 @@ static int cf_check nmi_show_execution_state(
>      if ( opt_show_all )
>          show_execution_state(regs);
>      else
> -        printk(XENLOG_ERR "CPU%d @ %04x:%08lx (%pS)\n", cpu, regs->cs,
> -               regs->rip, guest_mode(regs) ? NULL : _p(regs->rip));
> +    {
> +        if ( guest_mode(regs) )
> +            printk(XENLOG_ERR "CPU%d\t%pv\t%04x:%p in guest\n",
> +                   cpu, current, regs->cs, _p(regs->rip));
> +        else
> +            printk(XENLOG_ERR "CPU%d\t%pv\t%04x:%p in Xen: %pS\n",
> +                   cpu, current, regs->cs, _p(regs->rip), _p(regs->rip));
> +    }

Could I talk you into avoiding the extra level of indentation, by using
"else if" in the middle? Preferably done that way:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

