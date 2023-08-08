Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6805777398C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579551.907576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJc0-0000ww-OF; Tue, 08 Aug 2023 10:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579551.907576; Tue, 08 Aug 2023 10:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJc0-0000tR-L8; Tue, 08 Aug 2023 10:06:48 +0000
Received: by outflank-mailman (input) for mailman id 579551;
 Tue, 08 Aug 2023 10:06:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTJbz-0000tH-46
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:06:47 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe13::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47888136-35d3-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 12:06:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6857.eurprd04.prod.outlook.com (2603:10a6:10:114::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:06:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 10:06:43 +0000
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
X-Inumbo-ID: 47888136-35d3-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zh9blmFV191qIhf6hQvC6BPBNokFLBkDgY3U5DtV7AvWWY805cnkFlCX6wEmpq0MejJioaCeAOMas6He6fxB4cuvZJaL1OiAoUPW0wg8U4bNwrOf0E9E9WuIoDyhdSueF4uIj0nG7z/IZRszkaiX0McgNggP0uEa8k8TlQpa/RLz8GYT5EWekWk8WwX0o8oDxtUtLGufb/NHkx2z3peJXIJUsx3hQK33NKkov8qwcR+R4MRayV5CLXSEb3n5YYQbzWy6LoBmSTot8RuMoXzCMTnK6ACy5i6Lm+EC560BR/5bF70mYUGiiDKZKY4IvqdcHhwX0aj6NiJ4/cuPxQGFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vow4pBM9reenEJMA4yQKVwMg3H2d4S3CfioddDhs0/k=;
 b=RjCskfejuTL3YPjxmDEuZZtocFn2IyAPOUDdUZR2Y3EPHoLzHPd487JFlhXSEb4ID00LXwWnsNOX9WHVvXPnFGq/G2Ajqp94190ym+78buD4LdPmwQBoci9IIHtY6Dnpm1xbQq357qmEzZs1gkBZBbg42UCzwqs2y6KdJQtcwxcr3zt4l2p+rHf2nKy/qxWKRCwm3o//1Jjch09nsp8C2MfPx+JRAeG/2npCtK90nFhPVX2f4rfbEx3Yg2I6jKBcB23iytAmqbYsnowtTjaF6AX50Iu4MhXwve6NSh/ShRi87jpCjzLFhbae2zKcmoLdghYH4sdyai02LUcVCWKexA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vow4pBM9reenEJMA4yQKVwMg3H2d4S3CfioddDhs0/k=;
 b=eK44V0tRLmsw7r9ooAD23yZQGUlv99ld7GAOhrCsXp0qTkLWFfzEoUnu2w+ZB6vh276z9BJm91t2yfEW++H0pc2kcr6XeM/cfD+u/zV7GgndMfAtHOzfABGNB3JGm/XtZ9eS7qeWNeBO9ojijLAQWlxCSjS7HZYYleKCiDwUNIpm3GbpwxG5G/tZIVf2YEv0TPfbVJE+SUNTGTdLthmGV8uAgh1txknHd8ZkMJ/hzmlVUimhh4PWcpKIS7v97Dhh6RWvfjr0jjP3WJH9QBB58RATO74q2IAqrnEEla9Qd2bRSKkLZzQTRbYh98LgTtTxzHwQj43K0MHFgFPtSExWmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2709366a-207c-d05e-a458-dcfe5964a5c3@suse.com>
Date: Tue, 8 Aug 2023 12:06:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 7/9] xen/ppc: Define bug frames table in linker script
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <65e26bb63977749cc50daad4ecaf891bf7cc6b0a.1691016993.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <65e26bb63977749cc50daad4ecaf891bf7cc6b0a.1691016993.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac16b23-d6f9-4238-6010-08db97f72ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qF7UrdcHfOfVkDXMyhjRgHmBo8k3UkUyIKOSzzSCjEYc8SoNCGV+UayIOwThJXDqkyudBIn8Gk6M76IHr5u5jJc2lU1FG5nkxfiGYeLTqqtj9rmmJgJn+DdGV9AKTSFSrWaktSN61DwZaaiYMLEk/PdHcRLV+gwx9+nZiNwNPb6rKtGbbq032GadFnk7kRvzAT5ii6efcexa5m/IKFOffm33470VT4GgHG9jPUL3qD/bXdVDZYO8A48NnfZlf9gD6eksLFCwAHO4d/v1b6t4Rpnod2o/CVkgj8bXapSjCmA0cWOTVXkBMLzPQCJDvl5OJ1ePDQGmSPLpK1bbLyK3D0hm695p9iZI3Nol1n/5wJ+3snXF4bc4ZNl1VcjCipfh7yWulLxGmLAiGGJN02DW0z3tmwnXXKmVeyyTw8uIJTrG49IQq3og+yzo1hSFQ51ZoT+Es8BOhZez2/6Mk7UAycO2UAbTdU+Jm9nOT7p48ONhGHP/jWvC/w6l+NNOZIq+jXrl4+rfRwfN86ST0iFR+GtaWM0xYCcOyXEmEEG+9PePjhjOGfXOrUMaLsuif49JDlwqt25lCSvv3IrN9oeE5ex96+PwWapAFi0OlIKgPMb5a3f2/uxfER5Lhm8U+UoEyMwKyrXnmQzd/jrT/bdFXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(136003)(376002)(39860400002)(186006)(1800799003)(451199021)(2616005)(36756003)(26005)(53546011)(6506007)(6486002)(6512007)(31686004)(478600001)(38100700002)(54906003)(66946007)(66476007)(66556008)(6916009)(4326008)(316002)(41300700001)(8676002)(8936002)(5660300002)(4744005)(2906002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmoyS3hOaHN2N1l3aEwrSS9aVzljZFc5QU5VaEtKSWNXV0xYdDBIaCtybjcz?=
 =?utf-8?B?Y2xKeE11QWN1Q1pMUnhpelpPZERpK0ZLVnZVVFIxdURxaDVWT0tKSlphSEh2?=
 =?utf-8?B?QnBURlNUUzhXUXh5OWl4eGZNdWdielBPckxIV1dtT0tDMHFHMkg4VXFhNGxa?=
 =?utf-8?B?UHpraFAzQktDTEo1ZVdxNjVaRmVtMWNYYXc2UWZNeW1XVmJFMjFwd2E1MkJs?=
 =?utf-8?B?bjIrME5QeVlQV1U4ZWJ3OXd6eGNOaWV0cTg2bkk2dm9lSEhKVUd4ZjJxQ3I1?=
 =?utf-8?B?QnAySjZtblQvbGVaOW5iVFV6c2FWT2o1WlpKRlFtdU4vMmNIRHJHVFVPR3A4?=
 =?utf-8?B?R1JjTjJpNmZ2QzJYSFZ3ejBrLzJzcGdZZjhIK1F2OERmcjRFejVNS2IxUkpk?=
 =?utf-8?B?OWRLNkk0SlQ3aEowVklMcWVlRGpKazhNbWpiemtXTnZRK3hVS2FJa3pJZWtW?=
 =?utf-8?B?R1NHVDZIZ2l3NGJnTUFRTFllM1ZURDlYSDltMW5OZmkwQkxGdWU3TjJNNlhp?=
 =?utf-8?B?Sm4rZ2pIL3E2QS9tMjU1dVFHT1BiSnYwNWNOZnU0WWRZUzRBNGFVR0NFSmRZ?=
 =?utf-8?B?RDBVc3JORzBzUXViM3NDeGxXWm5vNTF1UFZLeDZhSWFOMlZFQXRDZytVSlFh?=
 =?utf-8?B?b3pML0Zmd1F5M0JOL3FuNkRrZXlFWUg5aDcrNE9yeWh6d3NpTVlWY3BLeFZ4?=
 =?utf-8?B?aUhjZDE3MTM3aUFTUnhSZFJzdTA2cEdPb1Bod1VaUnZrelBVeUtxMmJib0N5?=
 =?utf-8?B?ZjdYU2Q2SkpGTGt0QmtwR3ZraiszUkY4Y0QyOXhsQzJTMThOVHN3MjJxSlY3?=
 =?utf-8?B?OHBSU2RmMENvNWVRNFN0RjhTaFp1UzE5eW9FY1BNSUJNeCtPNnBhelh4aXdz?=
 =?utf-8?B?dTZnY0lIR1B6MjgrdGRUdHdORjNsQU5mdGE0Um9teU1SWE5ZWHFyRUJmWjhZ?=
 =?utf-8?B?RDY5RWF0RTJmZ09aeGNSTTcra0tLKzJuQ0FYejlQSloxbW5DSk00Q1p1ODVu?=
 =?utf-8?B?aUJTZXlBaU14Wm9GVEkvTldpZG1mVEdpZytpU1ZMNHltOTg5aklhUFpkbnMy?=
 =?utf-8?B?MWVXdE92Q1hKVER5NnNmVW5WL3FIVEd2MmZLVjNlTmxIOFFTY2RWR0dEc0dM?=
 =?utf-8?B?ZXgyRGZFRFJSbnA2VW5nQ2RhS3ZIVmJuYk9sdnhzQnhKbldIaFVvODI2L3hN?=
 =?utf-8?B?VC9iZXM5Qzc4Q01RRjdNblBVZDlMcVk2S0JQQTNVZmlZaExRMndtNVpZYnpk?=
 =?utf-8?B?bmtnMHJTcTZjSkY5aG1ydUMrNXg2RnpUcEhlMUpQWjVvK2xheEJ1Tm1TL2xW?=
 =?utf-8?B?OXJydnJZL3FJdFZjaVdSUmZUV1ZSUGNycC9DOEpHdk1XLzQzbnBNL0RobVoy?=
 =?utf-8?B?bEc1MlVuVHJMT2Y0RUFLcTRxOU1iRWFrVnNvZ1Vqano2RXBRQUhmOWxnQzls?=
 =?utf-8?B?d1NaVlhUR21PejVLbk1sQVZ5V3Z2MHROSVRjblMvMFZIOTh6dVEzUXNsWjYz?=
 =?utf-8?B?QlI3Y0VsY015bzNLVEYxM1o1UFVmalpLL0t1akRjbmVTZ3cvUGNvS3pTYktD?=
 =?utf-8?B?UHYrTElma0xlVXNsaml5bWJQNlNWVExlald5N1VFTmlGVFl6elB3akU1aHVh?=
 =?utf-8?B?SWtjVVlRRFhzY2RSZE5UbE9CRnRpQkhuNStNR3ZpMm1DNVA3RlVmakFFamxz?=
 =?utf-8?B?d2pDMEFvWDdNVWhTanFPZEdvVWRHMUQ3NzlZYjFua0sxd0RLdVd0YXhLcnlz?=
 =?utf-8?B?UFpEanJUS1MvZlRVZ1VKVkhCUDhMWHJNT3NoWmgvWTVLMFdUYXpNcWJZTkgy?=
 =?utf-8?B?SEFXVFpLUERnUmZBNFMzUzRUMFVoTnFzVVFJa2hzRnZoOUpvSVNTbWJFS0Fz?=
 =?utf-8?B?TUtKdS9sZDk0bjN6NThtb1phT0dsK0tRdmpobHV5L0tIZHlSMUIrWk5ONXVO?=
 =?utf-8?B?cUtPR21DaFE5ZGkyeThTRVJMbDUvVnNxSFIrWUhiblFqSlN1VEQ3a2UvYzlZ?=
 =?utf-8?B?bG95c0drbjRHWEs3bi93VFhFSmpBY0hMQlR6djVLcjNhTjEwODliTzVyZ1FI?=
 =?utf-8?B?NnZBa0FiT0NBTDEyckhLN0FjYytZc2pvdFZPYlNyZ0twbUJqTWcxU2V2UUg5?=
 =?utf-8?Q?t6QwzJmvbayu++12JaaGP1/Em?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac16b23-d6f9-4238-6010-08db97f72ad8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:06:43.5903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5bQLHXMs45Jpm7jvxjVG4a2/LJJ1Sd4U6iOkguYrhcl3X6ujcLxSoTIESc+5cc+FQVr6oG8BgLWuCvvezEBcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6857

On 03.08.2023 01:03, Shawn Anastasio wrote:
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -41,6 +41,16 @@ SECTIONS
>      . = ALIGN(PAGE_SIZE);
>      .rodata : {
>          _srodata = .;          /* Read-only data */
> +        /* Bug frames table */
> +       __start_bug_frames = .;
> +       *(.bug_frames.0)
> +       __stop_bug_frames_0 = .;
> +       *(.bug_frames.1)
> +       __stop_bug_frames_1 = .;
> +       *(.bug_frames.2)
> +       __stop_bug_frames_2 = .;
> +       *(.bug_frames.3)
> +       __stop_bug_frames_3 = .;
>          *(.rodata)
>          *(.rodata.*)
>          *(.data.rel.ro)

Looks like the added lines are indented by one too few blanks. With that
adjusted:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

