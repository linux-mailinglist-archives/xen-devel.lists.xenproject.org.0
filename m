Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C34BA7A001E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 11:34:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602168.938575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgijg-0004a7-W0; Thu, 14 Sep 2023 09:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602168.938575; Thu, 14 Sep 2023 09:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgijg-0004YP-Sd; Thu, 14 Sep 2023 09:34:08 +0000
Received: by outflank-mailman (input) for mailman id 602168;
 Thu, 14 Sep 2023 09:34:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgijf-0004YI-IJ
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 09:34:07 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2077.outbound.protection.outlook.com [40.107.13.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8ae0001-52e1-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 11:34:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9283.eurprd04.prod.outlook.com (2603:10a6:10:36d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 09:33:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 09:33:35 +0000
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
X-Inumbo-ID: d8ae0001-52e1-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/sQ/hPf7aJMvgujH5SL/Okk7QmqCbFu4Ubk6MOl8OrXQpYJpqMh3k1fhp8m86qXoQBT/HfKGw3tJyXYyI0NeCdqBQw9QQVU3WwcGi3iAetl6x8JS/SNSkDbeouALb5oCu9Ls6FtdbXpqA6AgRJGhuvyBSaKYg7kUn4Ccn/QkVdhTii2J2mc4sKqgO7FM7QQ4G4xsH6i68bh5kQs/ltM7RJBERzCW6ZmKq5UqQvznPYSVYrbrhMPTX+aXawOQiPO1D/7uuvLMq+9al8UuWm6HIJ458ERFAnYztRzb1gY37N0xr2Ax160yHrLDKqAOWD+/O+Rvb9rMxDCLP606jvK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0+kUN7Q3YoxPaK9V0YptjbAt6nhVQFSlr+4KgqzW4w=;
 b=FxDAOQQEM3hErYl/XBf5t/cw/auPKYh7y/C4x7aPA4l9FuXpldstvsn7E4QC1+LMSbdBYlnphpntAlvXLcFt9++pYlFhnyhIRTUqpFindW9m021VXGtoX3Yr+R1cEF0W1l8ZGczATypoACrIjRFmgyc5//ChhU0R0xgojDvEfOpJWNTtR6ZwSXjVcbVLhuRsYq90XcMlXsiFUUOAZOgiokJy4pe1fob2vYA95dhUomYPjIBenAiaLDh3UnZskrqOFy3/w/yvjRZjYAA5zfuHZ7J0GiCwCslRd7XyScASRztluUUpC/95sg6FS1UvwvaIzSJVGNw+RNd0Yky3E6vDng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0+kUN7Q3YoxPaK9V0YptjbAt6nhVQFSlr+4KgqzW4w=;
 b=bP/7483eMthKsSKwCKJb1mqqWUsRvyy8uT9G8p44xC3pKSbS4SBlXu0mB9xbK8P1K+TDmx5ZUI+HPHa0IP8M9gdEUHz+SByGfWF1aBvENfcEiKEWj8PZacXI+JoVNbFZ6pBE6spLHmxGjtTUxvvVdI/OJIsBXaKjWAxlPPjyfEvwCl2/Ocx7XMe1mAzSCc2/2/HyXsI4G4RcY9+CvScfcWM4jzbp+9CMpfXeGSx1fyxSfybVTiY+6SPGCLTDv6FVeuP88Stqzyr/wumTcoEkERHsLswP6GyWDZv8uSVd4gW0z3cCVC2EkMNb4LBF8w5NG73XVAgtYrTaNHWRR6AWKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <762b58fe-a841-f92c-93a8-77dbb86bf118@suse.com>
Date: Thu, 14 Sep 2023 11:32:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 6/8] x86/entry: Track the IST-ness of an entry for the
 exit paths
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230913202758.508225-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: 96715eb8-38fc-4a27-e99a-08dbb505ab63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g0GNk/A/YiEd1qjxdLMV1gAVRUQUZwbEzcS6iYwc8MPfuCHTCJgIP+3ls5+u53wxAXeqLvzLdws8fuWyl8J+eKJBAD0qx4YmR5apRHnHOmuE45OO8X0W89a1Cqf7Yzz2Ck1otmHPGaAF/Ypd2I4lDegzTWyNjUQfesq5NguVFiA0OhxvtAaOISKGORYVWWM21EZiDwvprdd7ivlbhg8rfT/29wWMfxpn4YVTjzx15AJGTxwcM5SLyUo5BAWTHk24xodST5LuEmQcAqnsMGTkSoOfHFepNhI6NwxJP4YSa4OwYkjc5vNgSCxVCAoWmkdGUz7+3VDMwAJ+KKi0t9CXB+nhLrilG/EU8V9WkhpXwzffAcYgSUs0MaD36eW9S+4IBCqppP05shkbn7KkqeoV3fdBnGJFTtPxMsWGwhQEtj+flmY6gCiuDOEBaA2PvFRzfKlYku37vIWvTo8OIkqZIv7s7KNN3IDPv8D49jw0EYpUfYQZvyTUdskpSmKFdfB/wkOe9GZ0sTk6h6y2YWq9C2L7QvjFbI73Ax3HWMifTzIGxvVI4XOWH9p6J5dpTOHJpo4ptTW3DVwDhS9GwA68DKz9RPV9IKFO9pq8Cv5aH8EAsul0MeV7p5XgMtvnP6u1Rsud/qkms0niXC0+q0vUCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(38100700002)(2616005)(478600001)(36756003)(6486002)(6666004)(6506007)(53546011)(66476007)(41300700001)(66946007)(66556008)(54906003)(6916009)(316002)(6512007)(26005)(31686004)(83380400001)(8936002)(4326008)(8676002)(2906002)(5660300002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmZ4WENDSkRIbmpYRlZ0c25BSnI5Rjd3Wno5QldVQ3c4RndJVEhWQXZ1Z2dB?=
 =?utf-8?B?RC8xVVFkb2dtYWpOQmpGdUpNR0JTRk5tejlJOVVhRzY3TzVsYy9EQTZ1cS9p?=
 =?utf-8?B?YzU2bDF3d1Y2RlZEMXpXaW1QbGlSMFljZ0RQMnFtT0Q0eS9qRXNBY1liQ1hN?=
 =?utf-8?B?L2tzbkxENkpicElZQi9DS2pFSXpvRGtSUHBsaVNUQVZ4WDBUN1JZQW5sbnhN?=
 =?utf-8?B?aUwxbEViZTIrZ3ZQOTc1YkpSS0x5MUtXVXVQa05oWDV6UnRQSmY0OWNoZXhY?=
 =?utf-8?B?bFhDVGtPZDFSVURTYWtyVnUzUUJRbE1hREdsc0lMVnJyT0hIWXZnNGkvbndD?=
 =?utf-8?B?di94ZHlydnJYaSs0emhDN1ZrS1RYSXU2QXp3UTZwZVpmbXFBT1BBNXdaS2pC?=
 =?utf-8?B?NzFmT1RlZVRlR3R5dGJ4b25WUENsOTRYWEhZTmRubEpnTEw3cVg2L0VHQXJI?=
 =?utf-8?B?TmU0QWxwaFVIL0RtbHVLNlZ0bXRrdGY0TVAyT01XN3gxYW9sZDF1ckxaMmY0?=
 =?utf-8?B?SmVMUHd4RGxBQ0Z6dEdDd0daSllwdlV5b1BkZE00YTFzWC9VZXBCNWFuK1hJ?=
 =?utf-8?B?Uy9TZllYVE01QUpxdDJUUWxpTmhvZjlqcWYrUzlOSmYzTzNxQ3hzVlZ1MmN4?=
 =?utf-8?B?am1KYkNYMHV0MWcydUV0Z0ZCdm92MDJBaE9qNStyclJtRFFRR3F3ajBoS2pk?=
 =?utf-8?B?MEdmYnJsaGlLUnhOVUtlWk1DR3pkOG03RSt6THRicExmKzMxeGN1Rnl4Y3Z3?=
 =?utf-8?B?VFdmN1h4d3M3azhlVy9sa2lEdzBLUm1xNmFXZVpBdHFreFdwb05QRUdvUEpH?=
 =?utf-8?B?aS8rVkdyaTlhSmRaZ3Q0OGkvdTdpTklHcFJraHBtdlpPb2xOYm1wMHlHQ1FO?=
 =?utf-8?B?aUNSMlFnQkF2UGVaN3hKTFJqa2VwYmw4MFFDVklod24vOVg1dlQ0TXdqNFJo?=
 =?utf-8?B?UzBYN00reGRTcmJMV1ZYZmM1MUN6Y1lycEVWeDl3KzlhTDNhMW96NXVROGZj?=
 =?utf-8?B?ek1RWDJnMlNDQlNNcVBqOFZXeGVTeVkrUmZEaWlmYitMeWUzMXBBaDR2OXRx?=
 =?utf-8?B?QjZOODdsV0lqdDBaVXo5a25iM2RQY3ZYZ1BUZlR5SWUza1I1Wk0vRnlhQTdL?=
 =?utf-8?B?akc0bm15c3BQNHp5ZUw0ZEprNEppZ3gyMnlFT3k3Z1loM1VOd1lDMS9LSEVD?=
 =?utf-8?B?YnVjTXF6MC95WGNxemdHcnhKQ213Uy9QcXErV0lMMTlaMmp6UlRnUFoxK2N5?=
 =?utf-8?B?dDYwU3pGU2pMVENDeEZITGNZZlFLWUZwUWxPTDE3NEtKdkNHWG5zRzIxV2Z1?=
 =?utf-8?B?cEFjaUV2bHdGaVh6YmhPWjdPT2hGZEtVcGlhTlpwdElOZ0dYbHAyT1IrdHVX?=
 =?utf-8?B?MDdEQTdYbmtWcUMveFR3cEdDSzNGUXpjQndxQUQwS2ZaWVI2Zzk1bTVvR2JV?=
 =?utf-8?B?N1BoQnJ5TnlyaXVwMk5YbFhqaW1GZ3hRQVg5OUE1cmtQSDFudnFrLzUvakt0?=
 =?utf-8?B?b2RBL0E3YWp4ekxVTWF4VisxQVk4VkFnN3huRE1Ec0JqV1kxa1N1MTJYSDN6?=
 =?utf-8?B?SVFSeEt4dGhLZHFLK1VhNSttWUhzZFRPU0x2UlB3cXBtdTBWTE1WbTRyQ29w?=
 =?utf-8?B?UkM0VitKZ1JCeXZ5d0ZHaHVOTEU5S2dmalNBbjB1andQcW5URGxDRm9JbDQx?=
 =?utf-8?B?RGFIU3NBemdzM0pQMG1CK1Rzb09rRHhvV28yTXJHMmZIQjl0Vm51N1V5OXlG?=
 =?utf-8?B?cnFqcUxZNjFHUEx0UmtRNmZUMlNOZnFBSEUyVjk2S1ozVkxhYXgyZ0dKMEhh?=
 =?utf-8?B?aGlxQlUrUytIdzZpTSt5aTcwdDh2MGdCUG0zV0lPMXVzVTZCNmxQSHJJQ292?=
 =?utf-8?B?a1U0alRFTlpheEljbDVoNzNVQjY0TjJBTGJGY2h3ZkZ4Rk95bmFKZy91WHpu?=
 =?utf-8?B?bUNYOUp3ZWJON1VjR2RJSTdhbWJzeHhOTHNnc2psY2dIYUVzaEMvM2p4cHV1?=
 =?utf-8?B?Ri83WEM5anV5MDFYdlpDR3dKaGMyT2dSR0JyMjYvUjNtMjQzb2xlNEZrTjhK?=
 =?utf-8?B?WW9rQnNhdDVwUXAyRzFpT3FWb1pNL0JGN3NoazdxRG9mWnBQUW8zTDJYUTh2?=
 =?utf-8?Q?bt4ATdiiuuFnrK0va4y+gU6HZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96715eb8-38fc-4a27-e99a-08dbb505ab63
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 09:33:35.9114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdgUn31zTK0lI4BegAWjL3bqCYDid4J2vaifDM5OP5H+50Nd5r4aGwabA6jTGmEJgGKD9RFHzzOjqyN+E2lLYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9283

On 13.09.2023 22:27, Andrew Cooper wrote:
> --- a/xen/arch/x86/x86_64/compat/entry.S
> +++ b/xen/arch/x86/x86_64/compat/entry.S
> @@ -117,8 +117,15 @@ compat_process_trap:
>          call  compat_create_bounce_frame
>          jmp   compat_test_all_events
>  
> -/* %rbx: struct vcpu, interrupts disabled */
> +/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
>  ENTRY(compat_restore_all_guest)
> +
> +#ifdef CONFIG_DEBUG
> +        mov   %rsp, %rdi
> +        mov   %r12, %rsi
> +        call  check_ist_exit
> +#endif
> +
>          ASSERT_INTERRUPTS_DISABLED
>          mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
>          and   UREGS_eflags(%rsp),%r11d

Without having peeked ahead, is there any use of %r12 going to appear
on this path? I thought it's only going to be restore_all_xen?

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -142,10 +142,16 @@ process_trap:
>  
>          .section .text.entry, "ax", @progbits
>  
> -/* %rbx: struct vcpu, interrupts disabled */
> +/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
>  restore_all_guest:
> -        ASSERT_INTERRUPTS_DISABLED
>  
> +#ifdef CONFIG_DEBUG
> +        mov   %rsp, %rdi
> +        mov   %r12, %rsi
> +        call  check_ist_exit
> +#endif
> +
> +        ASSERT_INTERRUPTS_DISABLED
>          /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
>          mov VCPU_arch_msrs(%rbx), %rdx
>          mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d

Even here I don't think I see a need for the addition. Plus if the check
is warranted here, is it really necessary for it to live ahead of the
interrupts-disabled check? Further, seeing that being marco-ized, would
it make sense to have a CHECK_IST_EXIT macro in case more than a single
use site remains?

> @@ -1087,6 +1100,10 @@ handle_ist_exception:
>  .L_ist_dispatch_done:
>          mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
>          mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
> +
> +        /* This is an IST exit */
> +        mov   $1, %r12
> +
>          cmpb  $X86_EXC_NMI, UREGS_entry_vector(%rsp)
>          jne   ret_from_intr

Could I talk you into using a less than 7-byte insn here? "or $1, %r12"
would be 4 bytes, "mov $1, %r12b", "inc %r12", and "not %r12" would be
just 3. All have certain downsides, yes, but I wonder whether switching
isn't worth it. Even "mov $1, %r12d" would be at least one byte less,
without any downsides. And the OR and INC variants would allow the
remaining 63 bits to be used for another purpose down the road.

Jan

