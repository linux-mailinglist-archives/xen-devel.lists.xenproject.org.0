Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E99769903
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 16:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573094.897462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTYp-0007vD-SG; Mon, 31 Jul 2023 14:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573094.897462; Mon, 31 Jul 2023 14:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTYp-0007s6-OM; Mon, 31 Jul 2023 14:07:47 +0000
Received: by outflank-mailman (input) for mailman id 573094;
 Mon, 31 Jul 2023 14:07:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQTYo-0007s0-An
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 14:07:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e5a44d9-2fab-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 16:07:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9594.eurprd04.prod.outlook.com (2603:10a6:102:23c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 14:07:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 14:07:41 +0000
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
X-Inumbo-ID: 9e5a44d9-2fab-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMk9JIzN8HwYkL6uQzk/ob2OV1bVkjvFxIoBBD5JCAKgnB8TvwCrMYIrDx1zvWlikunp1dHQnzWKYZ5fJAt7tgE0Kix+6+zmxYNLp0A+nIt16tB04d0JNIeuxWH4HvNjaE1vGiWulrMMVdw97DMt5Y5+Gz41TNpjxii7S8w1l1PtHSp/SJraaR5KX0XfW4wZi/1Lk8OpvgrbmSpJ9UyUZ6wm4+jq/yTNaNlpO4tbE4Wex2XaIH0dAHMH2Z807kwvJaQpzonydT60N+jAnKd7NTmGjcNoO6hR3qRnAr2n2acMy5WfbfGmBL1lHaULNS3/vBn2nA9YS0uy+AzBNncMlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPLiK1XbXOnQUoytDgEAYxMT80OH8WkR05LKs9yzXXw=;
 b=OXJYMFL1p2smJoRIpYxPjp721ljja2mUIwpuGQB5xYF36Nv1J3lyIakK4vsNAOj3pytOsDrhA+WmqlBSOC/msm2EAbr57YIhL+F8M3hQfXZwfzyXum+dlLiOS1PQGibhPUSWt0paye+nGh0Rf8TbL/fpYgiEE+JGxAythT7qIaaOudGaSpYu7rjOF3akRw3NHIQLT0jEW5+XMWgOvggP5vasc/p44nt+fFuQzdpTAqZcK036J0RnE4qZRR6P91/r9tbydrgdoKqblftSQ7NShEHiOCrgrTxU/MNetqsK5mOmWHRLpBhQbPOt5j+sgzuImjtWw3BqXxRHSvMkR/0ZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPLiK1XbXOnQUoytDgEAYxMT80OH8WkR05LKs9yzXXw=;
 b=klWLJMTaZ4BDyR7cpz8+C4A9XbfY/N+IZLl2mPAaugGPVVO44CkdQjMLSdZnCn7rguI2xfTtKoHBqsagzBH6N1mR5Fsq9+P2gkeJy7wi9eIr+dX2vFqmGeILsZ9AebLqQNVnCiGsWDJDWAAyS8vxe6THXmyVy7J3a14YRisajDmuRYv5B77RRo5HAW/EeCRA5bBi15Ol1T68Io7HekD69V2ccbxzwQbG7hOlJJqSntOLvKdaSXjnykQCNh5Ug6pfYBkadmwUD2wHjK0S0mb+GMlckluq+5q3TvbAJ/wTSuekGVM3aq+Kp4ed1P6DHQSZ5+2+yQKEclUXWH0Yon5ZOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <911eba8e-a92b-896c-e5dc-e54dcd570664@suse.com>
Date: Mon, 31 Jul 2023 16:07:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v5 2/2] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1690464789.git.oleksii.kurochko@gmail.com>
 <ab2e719bbe071c3d5c4e3341573c0848dfcee3ee.1690464789.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ab2e719bbe071c3d5c4e3341573c0848dfcee3ee.1690464789.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: 407022a4-c050-46a1-74b0-08db91cf8144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sRTCJ4RwNzxXxiFkvg+7+AGixByA4GdgLE1BjE8sxClWTykv/Ip2l1PNs/ZCxmdAWWaZq0b57Y2jzS6iGqOJQ3iwZa4z8UGb21w5Fea6v3m8e0pxhoXT1prLPpcQOhQgGOSLY2s9NXVK+1x860Ynk0WbRcAHI9+Ul8JO7JQv6UuDrob9byy0Q3QLYzSdUw4tdOIEW7ghLHqVl3qJhIL7koBcsWoc18orF0oap/Fqf/qjUdZdfoAN2yHuW5M/mJ5UrLzDT0kI0BsEsaTmq5SBlvFgfE8VEYZCcCQye4FVnqnyWMK42F8oh33YL3Ix4UPPPH2vPxO4aaYMOEOSbQ7EGX/WRG4mjT2blFwrw+gQYiw0iP2owBJcfZ4iGaOUD2SFR9FAAEjS2lA7+0WwCHuh7n+urujHn5Kr7J7V0uSEA+un72xqTtd972zIYEaVxcgVTlSsukUVrL06CrEfRIHwGe/uChNtoj487fCaBQdDRJHB5YDB5wYzXd7cz5w4tMs/tIRIOZimKNG9rZwQqu/0gPQcEKIXZJiWeGyL1JAvxj1Y9qEeOstP0QeIAmFkiXwsZcKJl0t9BrJNP2MboKuXXEVY5aeX5s5Dgg0+0EFAUN5/fI0ofvtJsQ/qucgd0tKbut+iUW0QKgZMNz9Ssw23cA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(38100700002)(31696002)(86362001)(36756003)(6512007)(478600001)(6486002)(2616005)(53546011)(186003)(26005)(8676002)(8936002)(6506007)(5660300002)(4326008)(2906002)(66476007)(66946007)(66556008)(6916009)(54906003)(41300700001)(31686004)(316002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2I0cnp5WjQ0NFp6ekFmamdBcWRpSzZFWnZHRWNvdUNWWFJGM2ZHMWMyZm83?=
 =?utf-8?B?UXYrS0FZaTZRTnh4OVFDUVdBck12ZWIrUlpaZHhZOXNkcWJGaDR1VmgrVDA0?=
 =?utf-8?B?SkgxeEs5YUtOY0RUd1lVYzZrdHFtV2wxUjA1MEVNZGxrMm9TRkR5QStUYzRa?=
 =?utf-8?B?OWFQcXZIU0tMYTdRMFR1dGVNT2lXU3R2eG44V3pGYlpLb1NrKytaZW1yTXdl?=
 =?utf-8?B?MWtrZFNTZzJPNzU0ODQ4eThCQmdaMnJyS3djOThpNVZZTk5jb0VzVGE3anVr?=
 =?utf-8?B?QzVOS05DRlRKdTJwcDB4Ym1zaUh2c2MvQmdiNnE1RkExWjhHSm5jNWhlTjh5?=
 =?utf-8?B?WlRDNjhCTGtNeFFEc2pjRzFxMzlxMm4yeWdGRWljV1JWMmdGeFhvN3YxeVFk?=
 =?utf-8?B?NEhtK3FYdFJ2RjIvUjBCNm1xVENqK0ZOTUVCZTlPb0NuSnh4TjZGRi9nbjQ0?=
 =?utf-8?B?YWJuYmZZM2gwQmgzQUluWDRQU0hRWXVqc0F6eFpYZFlQS2JSLzhnN3NhWXlG?=
 =?utf-8?B?amRhS2FvcnZRbEN3TjFaSkhpVGZqdXcvcjdZZDF2YjRPbTB3OVRLa2h6ODJ5?=
 =?utf-8?B?YVdRZjdmaWtyY1FSN3hVdUdHNklLdFI4Y3JKcHhkWm1QdVNWc2R3RlN1VEZW?=
 =?utf-8?B?VkJwTXdnOHBObkNweGRhWFJveGp3eiszcThFZVFpcml0RkFPT08vdkRmZTZ6?=
 =?utf-8?B?UzhQQVZpSExIdTFJa0lOUTBjUmVkdklGNmlnT0NYTWRES21ES1dnSmM4MkdK?=
 =?utf-8?B?aVVDQ1VVOHFkY2Nia0lmNGFJUG5TdzJZdWhPN3lGYU13dVdQMk1od3czbnJa?=
 =?utf-8?B?MkdTdzhpVVkrZWtneHZvTDNoYXZIZHhhZjZ4M3hEY0gxWjdVcmpzZHhFbjVi?=
 =?utf-8?B?UnlPbmlQekFRS051Um9LcjBGTDRCVUxnSTg0TytCdDFIaWJGMWZkTXdjTFpK?=
 =?utf-8?B?aHNVVGh0blNZcU1Pby9WVVplZjZJbXQvZy9YbnFXTW8xYTZURGtEcWY5Ry9V?=
 =?utf-8?B?bi9aY2hxdzBZeHFWTWNGd0xDVEZwVmNGd2xjd2tlRmJaMmpTNGhKby96UDRm?=
 =?utf-8?B?dzZnSXdDRnFUNGVSL3dPU0twR2xGNndjZlM5TFVWQkRnWm1Wa2pvZjlVdm1i?=
 =?utf-8?B?WCt2YzVGMXFjY1N0Y0U5bGdBdFp2b0VLZXpzekNMa1ZSN0FJdW43SlJmZVZs?=
 =?utf-8?B?L2M1UUFxejdHWURmNUdZQWsyT1pVQmRXbGtkTXRFSnVnT09TdjVFUi81Uit2?=
 =?utf-8?B?ekUyT0QrSkl1RFZwNVB2S1d5TERaSzNrSHdTWmhIYmhITCtndCtMeUw4N2xi?=
 =?utf-8?B?ckdFTGJWQ0QrR3RuZGRuMDdVdUsycHNyWERWK0ZkazdTMkdGb1NpZFVxQzFu?=
 =?utf-8?B?Y29tdi9WK0ZKRXRIVWJPbENudDJpVU9kUTBJbjdCN0UwemQ0Z0J4VnpxcWVR?=
 =?utf-8?B?dUtNbDdoUmlEYVVkQzNtN0FFSjZiTzFjTllPT0tEa1c0RWV6V3hET1NkYlhH?=
 =?utf-8?B?UFB0NVNUNTU4OUJPcHQrZnpUeG13SXY2MURuVHRHOUNwUlp5Rkh0UHR5Rnoy?=
 =?utf-8?B?Z0tub21jU0JSaDVtY0M5dHRLanJGODFmT08rUjBhdG84dVd5Y0I5K2lTS0x4?=
 =?utf-8?B?ZXZmbzdJaDRUek5ZdG9MRVV6dlBLSEgrTWFsNU5XTVVhTzBoSVNxMys0Mnpl?=
 =?utf-8?B?bDIxQzlENE56UTZ2WkM2TEVjZTRNRTh5WnJGNjB4SU8xY3hsUzNnTmhtV2hQ?=
 =?utf-8?B?YU84alZ4VHhsdlJHamFaeURJVkxUSHJJV1plajlnNmEvUjRkSXpzTytLZE9s?=
 =?utf-8?B?VVpDSWtrRy9oTldGeUxZL0w3Q1dBbTNsemV5anJQS091OWpJRlZpYWtqRlU4?=
 =?utf-8?B?dm5RWEtHYml3SjBlemk1Tko3bmdyd0ZtelRNT3ZPd1hzamRWbSsvSmkvTmdE?=
 =?utf-8?B?bmszT0JLZXRiUWp3S1dCSFRmM0RvMldJSHpRbWpac0htVGdzb3hzVzJjeStn?=
 =?utf-8?B?QThGaHJCMTBVdWM0S0I4emxDeUcrRXkydFgrVy9KdEJnWjlBOFh6MlhiOGZw?=
 =?utf-8?B?Ym5jQVdSM0pZdyszREhmZ281N2NFL3lqdE15cndzODNGaTA5WE1pN05Pdnha?=
 =?utf-8?Q?pqiMaUHy4/D8aFv+90TDijZQd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 407022a4-c050-46a1-74b0-08db91cf8144
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 14:07:41.7066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cv2qrMPe48mEpyC8/7QGJaMZgPIFPf15jUaUmiMdEVvXwdW0xtbILPrhpZhrIArp/SiJ9a70tk2MHOHxcktHWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9594

On 27.07.2023 15:38, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -39,6 +39,23 @@ ENTRY(start)
>          jal     calc_phys_offset
>          mv      s2, a0
>  
> +        jal     setup_initial_pagetables
> +
> +        /* Calculate proper VA after jump from 1:1 mapping */
> +        la      t0, .L_primary_switched
> +        sub     t0, t0, s2
> +
> +        mv      a0, t0
> +        jal     turn_on_mmu

Any reason you don't do the calculation right in a0?

> @@ -54,3 +71,18 @@ ENTRY(reset_stack)
>  
>          ret
>  
> +        .section .text.ident, "ax", %progbits
> +
> +ENTRY(turn_on_mmu)
> +        sfence.vma
> +
> +        li      t0, RV_STAGE1_MODE
> +        li      t1, SATP_MODE_SHIFT
> +        sll     t0, t0, t1

Can't the last two be folded to

        slli     t0, t0, SATP_MODE_SHIFT

(I don't recall what li's valid value range is, so I'm not sure if

        li      t0, RV_STAGE1_MODE << SATP_MODE_SHIFT

would be an option.)

Everything else looks good to me now, but will of course want a
maintainer looking over.

Jan

