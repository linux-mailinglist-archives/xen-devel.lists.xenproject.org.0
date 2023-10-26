Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A007D7DF4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 10:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623551.971482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvHv-0007Uy-3o; Thu, 26 Oct 2023 08:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623551.971482; Thu, 26 Oct 2023 08:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvHv-0007ST-0g; Thu, 26 Oct 2023 08:00:19 +0000
Received: by outflank-mailman (input) for mailman id 623551;
 Thu, 26 Oct 2023 08:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvvHt-0007SN-L0
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 08:00:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1aa20df-73d5-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 10:00:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7457.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Thu, 26 Oct
 2023 07:59:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 07:59:43 +0000
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
X-Inumbo-ID: b1aa20df-73d5-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y21vPpE4Yq4bKVEBI9qcatKMFyE8s3X4QCVrR2gJgh5juT9xCRyOFkiwRlPOUNN2eKympMD4TDNA7CT7dXXdbnsU2zdHS3OXyItIcnbLBfPg2Fw3/LfLyIgEtEv2bHK2yw62vhQnnXHJ8PVF/irETy4YW0+ecojLE0TajheZmO9gHfW4QyhM7sgy+K92lB4HWKg9t7+QdppLoNhImb+rby49hQy9KMbpslP96R3di7TCMToCQTaQi92g3mfwyluPupiIMwStvPlgABP+T1ApLaIy4JLlLBaAz88rq/tAXxqfqdxkI0etcZ7V0/8PH2lc+4YPm4Klq2pPiFijKF56uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9hy9gzhOj6gXKvmYiTueG2H0zjrq70Tn8DcVN/uQHM=;
 b=Mx/78QbQl2SKqfkZnFUBa2zp2a5X1Z5XS76OLLS0si4AIyr+OQFrcBulpDXSEchoH+zdlxR32UR/HB91vrRDWjgig7aHPaQJGjkhG31L0SPfFt4sPHJyFmkBz4CYLHI553B/+bDCQC/mAfBOMUJRub26su9W3EnHerJrjT9JWuj5gTHOibjuAh7xsA05K5Ay60npUsMmlOtLgBmXarvO2GjaFQFu8zB2sY5jb7fE5P5PRMh5QcVgc1Jk+RyKfyEO0XCxJRFjYMuwltmPSwehAYO18LQggvxpli//1XBtmKpzIx7br2hbNNqixkIdFFTIlRffl6qa8afKbMtvXlrZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9hy9gzhOj6gXKvmYiTueG2H0zjrq70Tn8DcVN/uQHM=;
 b=msKyCzbT/YuCPxiUzfGX+eYyxiJZWWmW8Jg8IioJFfqtcUBMRxfGiXPpStqMjA/clFiopEaKf1v5cwTq/C3JRlmD0zA4roVQ9QZWcIiJqw+oWDJLFHekYElhKPbHGMKKibXiLDmNMWn1SjtfWUj2rYykSt52m87VTFv4w+iJt7yDcTwuOKAdQmfBDdAYcCuo4RMrCMWeYwYCQHKnsrN2n69QnlLHdlFonPPm+sIQz04jta0ErAxym5Wt+lHbhWmIYqUmr92Xf3FAqMXn/20d/+OHMu7UlarTl99LTW9ZwS69SJ/UmDvRjiDDDalVclwY2e5Dl+E8YEuBPo4iCCBYgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e3daacea-79c8-32ea-70b7-7654f542c9de@suse.com>
Date: Thu, 26 Oct 2023 09:59:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] x86/i8259: do not assume interrupts always target CPU0
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231024145340.49829-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231024145340.49829-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 944a23cb-a617-44a2-2cf4-08dbd5f983d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iXeWt935ZbWhJKxEs6QQHCgjxxX9ZHQHB8BuqX+v+J4NWhVQXjDjIWPCsbpM+WBJh10Idmv46SGxGUrWZT66reGbt/SuRa053SZpYklDnGIKTc7IqfU3CYpy2ZyXoIeRJIqm8iB6sYGLPx2uTttYeoHqvYFtN/SIO9kqvj4PryYb4UCftiKwGcLDcTuW/tTaAyDcMmAjWuA/eU+bVCDjReg3D18U72wud+oMWSFKFBEgm4fVh38iL2CtC5iK1cr5VQPNaQI88Wr8B/76v4KEjqy9gU8sz/MAO+ymkZGvM/UByclQL8Lyrc04JdKGOr7VCIptO2RM2g6QlkCRKDpXKYCD2O5BA68bU35I1aqhp4k3zl3T3CBWrLxIjvOsMLOF22FTM7r9GRyI4XNuZZGTUGwmHrqarZxomSu1+82S95KEeXo8TDb385pTY6qlz0a15zfdohR8IVhw+Ecqi0xoOxgiASVZzg6MhzOJ7oQdZpNLX7IEHLojEajYeGOBjCofXaiovFUO1vxKpfRjlw7u+Ffp7nLdu7mNTqVf6/3N+u5+w+4WQ6qNyQLvmlBCpy+TXXOgMgLzkwrjTNfGz7P6P4/g82ywPOYKUmGgcoYAj0tI3TFfdKkOUNMU77+gsWMuildOM0lktlYscaLbzMSknQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(31686004)(2616005)(31696002)(38100700002)(53546011)(26005)(6512007)(5660300002)(8676002)(86362001)(41300700001)(6506007)(4326008)(2906002)(8936002)(36756003)(54906003)(316002)(66476007)(6486002)(83380400001)(66946007)(6916009)(66556008)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWM3OXB0SjBRZmZ1NGlwNHdOTHpaZEJRZUIwOVplZkZWU0kzRGQvYkZwRE4y?=
 =?utf-8?B?ZDdjUFl2ZXJPUU15cUYrU09QU0dUczFCMmJMd3JHWnhjVXlaNUxHS0YyN0k5?=
 =?utf-8?B?TmRsWTNLNCtKV0J5ejRmakF1Z2tSM1ozdWxHVXZjYTFWY2Q1L09MVTM4MGRt?=
 =?utf-8?B?REsya1NzSmJlb3BGdnR1NWpZOWNET2pmY1pYaUpUbm9uZUtxYVBHcFpUMTdm?=
 =?utf-8?B?R2FySFBsbTl1cmVBY0tJTGtmUzhlcC9ZUGdVSFU3eFg2cnRZQXpLZFBjNFQ4?=
 =?utf-8?B?RUtYU1VXdUtHd0V5TUlHTW1nOU96Rkk5QmRpYjE5NCtqVm9BcE1NMmNsLzU0?=
 =?utf-8?B?L0o5aWs5L2ZVWUQzSnpia2tzTlJGRkpMWDZMYWFLNG03WDJ1YisvOVVlamdM?=
 =?utf-8?B?cnlQMUo5Uzh2K1V4b04wRWZscStOUnRVT2QrcW9SQ1FGOWNwdmFWZ0Q5eUxp?=
 =?utf-8?B?SEUvUG1wTnBUQlpqRFphSEEvalJ4ZEFBRUJwLzBMaGkxV2tXZmpUOWw4aXh4?=
 =?utf-8?B?TXgvd2hYdXJjaU9KS0Z0ZHJ5emRya2ZlTStRZkIxZE5CNko1eUhEbWdERXRj?=
 =?utf-8?B?Y1FPZUxSTURlR1FsSEdHTmFuMXRuWWppTWo2bTNOWXB1OFRBVDM4VVEzaWhG?=
 =?utf-8?B?Zi84bGNpYmlpVXpDaVdaKzBYWXM4eG1hZzFtTlpvbytQNVZsOFhSaGlGRkg3?=
 =?utf-8?B?bmp5WlFSOHRCYjZBbUMxTnNKeUlaeERDN1ZaZ0dEWEFjRlhPNjBOT0hqZWVn?=
 =?utf-8?B?VksyN0NhOEM2ZjNHNWJ6TElUcERGbDlTUElvLytFbDR2M2FGeUY2eG9mYkgy?=
 =?utf-8?B?L1dmeUE3Ym5NU3p2MGRpeG5uTWtIQ3RLcXFXSXJVOTc1Ly94THRnSy8yeHFT?=
 =?utf-8?B?dFVhNXYxeCtrMW1xRnhHd1pwKzc1bGRoaGllWThJekF5N0N5RjdObnpidElC?=
 =?utf-8?B?ZnVEeEtEbVdMZWpkTVNHTmIzNmRRYUlZekFGbnBvUXVaWnFpOGd6Y2t3bjdk?=
 =?utf-8?B?YjBhR0FWMFRZL1lQQmo2cVMwMC9Zc2Z5QVYrcU42YVB6Z2RGMDdPZGExYlpo?=
 =?utf-8?B?Y0I4a1hBNjgzdFpRM2RCYXF0UmlWcGNWVkpwUjBLRG9CZGpFVnBpcGc0Vzc5?=
 =?utf-8?B?T0U2ekFTbjd2L1NOVmNOakZkNEhFUVdYY3dDdUV6ck5jNnFSRUFOU3BESitM?=
 =?utf-8?B?dkM1anhPLzdlaDl4TGlvRzRNTTJ1WllmM2xFN3REOWVZQUlGWjFjWHoybWlQ?=
 =?utf-8?B?cE45QTE3RDIxYmRXOFJRcFpzeG1mNVFHQ0sydGRHVFZ0ajNsV3hhS2xRUjFP?=
 =?utf-8?B?ZnVyc0NxbWYzb1ErNERDeEluWG9SVERRMHlvdDVsMDk1TlFmcVJoY1FXUUpV?=
 =?utf-8?B?d3JYb3B4aW80d01KMU9UYkYydEZzMXduNFpEUldLdVNwYWMzcUxMVFkrbUMz?=
 =?utf-8?B?OVhGdHRmRzAxbHo4MHU1Tk85WHRxNjRweTh3QlFLOFI1eEpkQWc5WFQxQ3E2?=
 =?utf-8?B?bjZpQlRaWCtRVEtFaUhWTU1CQzdUa2daa2dLZG9ZWEJyNTZqZ1ZMV1l6TnlN?=
 =?utf-8?B?eXBmK2VrUkVIQlowSmgzM2o5SHcxOG5Ua0swd3pxUzVXK2xCRFhsaHJHTVRH?=
 =?utf-8?B?dEJPcmdKQm5rRjMrZHcyRzl3LzRHOGhoV1JWbkpnaEdUbzUvcklpdTkwTmpH?=
 =?utf-8?B?dmhoMThBZWM5eWNLd2VqQy9ha3hNTzl1cVRaY2VTZldaME1kTWNBYVZYcmdY?=
 =?utf-8?B?TmlUUjUyR0JJaEkrbURFZEx3VkpXTzdQNm03Q3NyOFc2b1k5cSsyZ2hvMTB1?=
 =?utf-8?B?d2prWXp4Q25DV1JHR2Fha2hZeE4wMy9NSjlvM2Y0dFlMTDluWFFOSEIzV1Ro?=
 =?utf-8?B?M0xYdDBqS2wwMHE1YitFdlFpQ1QySlROR0EzaFQwK0R4bWltMEVTVTc3Sjh4?=
 =?utf-8?B?LzdkVS9uRWQweHI2ZGNNM05CUHhVNXhMU2ZqQkFGZENKL2xoeEtvS1IvcEpP?=
 =?utf-8?B?UnpaanNMQmRiVGxwV1BMZTJ4SERHNEJDWHUyVU53NkV0Q00zYmRZNWZxVjZP?=
 =?utf-8?B?Uzh2b0NCaHBTVzRUR2wxOGZaNDVhbXRPM0ErUnZyRVlOOWx5WjBxZm8zUmdu?=
 =?utf-8?Q?15QHI+O6MpHvqn5suKPytrVU5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 944a23cb-a617-44a2-2cf4-08dbd5f983d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 07:59:43.9741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSpGW5koEduwAWYaZpgRqd0tvTtsH292Haoa5tddcNHq6cAhZ5lhWmjNmBGlONkLrGMyUyudT+tqd/A70e13xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7457

On 24.10.2023 16:53, Roger Pau Monne wrote:
> Sporadically we have seen the following during AP bringup on AMD platforms
> only:
> 
> microcode: CPU59 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> microcode: CPU60 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
> CPU60: No irq handler for vector 27 (IRQ -2147483648)
> microcode: CPU61 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> 
> This is similar to the issue raised on Linux commit 36e9e1eab777e, where they
> observed i8259 (active) vectors getting delivered to CPUs different than 0.
> 
> On AMD or Hygon platforms adjust the target CPU mask of i8259 interrupt
> descriptors to contain all possible CPUs, so that APs will reserve the vector
> at startup if any legacy IRQ is still delivered through the i8259.  Note that
> if the IO-APIC takes over those interrupt descriptors the CPU mask will be
> reset.
> 
> Spurious i8259 interrupt vectors however (IRQ7 and IRQ15) can be injected even
> when all i8259 pins are masked, and hence would need to be handled on all CPUs.
> 
> Continue to reserve PIC vectors on CPU0 only, but do check for such spurious
> interrupts on all CPUs if the vendor is AMD or Hygon.  Note that once the
> vectors get used by devices detecting PIC spurious interrupts will no longer be
> possible, however the device driver should be able to cope with spurious
> interrupts.  Such PIC spurious interrupts occurring when the vector is in use
> by a local APIC routed source will lead to an extra EOI, which might
> unintentionally clear a different vector from ISR.  Note this is already the
> current behavior, so assume it's infrequent enough to not cause real issues.
> 
> Finally, adjust the printed message to display the CPU where the spurious
> interrupt has been received, so it looks like:
> 
> microcode: CPU1 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> cpu1: spurious 8259A interrupt: IRQ7
> microcode: CPU2 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
> 
> Amends: 3fba06ba9f8b ('x86/IRQ: re-use legacy vector ranges on APs')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit (which I think can be taken care of when committing):

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -1920,7 +1920,16 @@ void do_IRQ(struct cpu_user_regs *regs)
>                  kind = "";
>              if ( !(vector >= FIRST_LEGACY_VECTOR &&
>                     vector <= LAST_LEGACY_VECTOR &&
> -                   !smp_processor_id() &&
> +                   (!smp_processor_id() ||
> +                    /*
> +                     * For AMD/Hygon do spurious PIC interrupt
> +                     * detection on all CPUs, as it has been observed
> +                     * that during unknown circumstances spurious PIC
> +                     * interrupts have been delivered to CPUs
> +                     * different than the BSP.
> +                     */
> +                   (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
> +                                                X86_VENDOR_HYGON))) &&

Afaict these two lines need indenting by one more blank, to account
for the parentheses enclosing the || operands.

Jan

>                     bogus_8259A_irq(vector - FIRST_LEGACY_VECTOR)) )
>              {
>                  printk("CPU%u: No irq handler for vector %02x (IRQ %d%s)\n",


