Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57587A011E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 12:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602193.938615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgjB9-0001Mr-T5; Thu, 14 Sep 2023 10:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602193.938615; Thu, 14 Sep 2023 10:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgjB9-0001KX-Q1; Thu, 14 Sep 2023 10:02:31 +0000
Received: by outflank-mailman (input) for mailman id 602193;
 Thu, 14 Sep 2023 10:02:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgjB8-0001KO-09
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 10:02:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf70d55d-52e5-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 12:02:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9702.eurprd04.prod.outlook.com (2603:10a6:10:301::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 10:01:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 10:01:58 +0000
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
X-Inumbo-ID: cf70d55d-52e5-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORcMm3M3CZV1x9QTuS5WeGrqzY32Bgz++AOiFS2MBdtVnqeEIUr1QtZ1pNwYUkc8KnzSszhmWfle2NCo3rdH8iTufK2Wmrv10xXaOuwi0S3lKdIwppPiwaS/mHpH8c0b8AMUj9rW0dJ3Ua6nFFS3QNlpSfaa3KqZd48K1eAS/LgnJt/O/sreMEIf1Ow8YQZJACo/GAdce9VXqH83Zmar2wNxixl/Z2gKbrXW0V0jajJfvmSfXizJNH6QqYlFOSNhQBIqonQfCVF5AJkTvoGuvSXoqWKlaWdXYfY95WgUiUhNLXk4T+fgbyidJzmFJIzLJUL99AMvurFZRi3mmNrrWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dN6NiaxMlfnG0PfZ1cSEvFCRqeLn0VP+3/0tNDZ5WWM=;
 b=AJRbjJNm1vn+xFzirx4Fiiycz4jY9fAI3z2+R9lqJF5Et7WBGlhYk1HSHmKWxmhhC3vwhdDYoQX8LlmUEf6dlNT52WV0inBcYJ8fynYVNuUn5fVXyHrBBbAceb/49CFcNlhp+hfFtJWEkfeu1K8I6x8fMUDzaKXvQqoJ25Z43Yp1ZgFj/9qdRM5e0nbKbtb/Tl08ORNvKnSGYObNnBk9ur3P/0u6JlfdPXhfFlQ36/1cPBjHklP/yO0aPDS+ebSgQt481Jwg7wWbQ1Whhb6eAxfq1LmM2fqIJ0gLPJq5rOJ+FJ3jOnpopBoZrUYfVb+IotaHKkQorZE33CE0voC2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dN6NiaxMlfnG0PfZ1cSEvFCRqeLn0VP+3/0tNDZ5WWM=;
 b=S76lKAKA5oYuUIT/ZL+XkOV4IC5lZYLsR9/VyHP2HDoJmkMhXnfuCgN0bA94yKK1/H721Xg680wd8VeT0AXshxnsSjgWpMWexR3I8oI2fNlZhfRm729i04Iv55iAbP6xa9PBgr9X5f6insy6VtnJJJBucEldvZ8L6dP/+xy3nxQhF/leLsBPtpxZQCnYGIIpUQ1ebHfsh4auYnJcJ/Y2/OAMsey4sikY4/PTM2Y0CDcaDomOcowlmnA67D1ClcJPzBfgrv9cAi9YCFg4nK3+ied+xfWzmbQ4l4qCBmR8uHJrroWahdTSJx6puMbV6c6M4wpAABoNwcHYxodGbJaiYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f771260c-feed-9183-0c0c-308f517e09b4@suse.com>
Date: Thu, 14 Sep 2023 12:01:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 7/8] x86/spec-ctrl: Issue VERW during IST exit to Xen
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230913202758.508225-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9702:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f128fc-83b2-4178-a877-08dbb509a230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mz1QG5LM167+0jZpDqgdy+U7RUWgWcDVwavF0c4fgMpkwvxv+KYXZRbgyrlwnQp9qAEs6q9+51cvGfC8JtNDlhJjSFBVYXQnPeM0xslIl7Q7vNzxCfPswu7d5p8foL8sM18FAaDakXjpEyzFr23p4RiJaZMeArV1IFYdZm5LCgOoDqJ/XG5VxfL91MqxdBsEUee2HeefgKbABYvecW03/r/SzNlP2+m41OJ5Uuq68KfUpNnRDK/b+7z6pOdoxBid+my3l5AcfhqN8BAY8EdyHXf59/VF/o7ivzvbZoDpP1+PAzHgwiV/Ysi/F3mELIm4IzFNNvj9SGizkGKIdt0bDjZqjCzrQYAuTOFrWQAXXdohNjJ7n4OvHYcCdoja66PhsuadeSwAMdH6hbB2QgcWvlFzLvArjc6vEqH8rGz5iOs5gIJAfs1kUheEl9/FqKup6QU1jVT6gQtRlSjeS0DvyOYCC5wMteHbRKqvH/brFILp994NG8Nj97YXnXTx8hyJFDp/5TItgpvwH51qGN9icfR0kGg/uAZfffHYSetaEFuadhqlXtOMNDxYRB/r8DQW5Lrt37+/KiRX0plt/ltA2HlNwDVALQSJJHL1uqYETUyYcb0eYgyMDV+eFXr62qxYPAzHIaEIwn2e93Cn3hXJNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39860400002)(396003)(376002)(186009)(451199024)(1800799009)(478600001)(6506007)(6512007)(53546011)(6486002)(6666004)(38100700002)(36756003)(66946007)(66556008)(54906003)(66476007)(316002)(6916009)(41300700001)(31686004)(26005)(83380400001)(2616005)(5660300002)(8936002)(4326008)(8676002)(31696002)(86362001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnFQRmhLVGhmRis3Nnk2WWwvTGtIZlJoWlM5SFNnTW1sakg0T1UwUCtFaS9s?=
 =?utf-8?B?VHVWQTRMUVB3WElubnRsSEdNRnc5ZzJKbzdvRGRnQ1hVMDRleElaY3BSRDVt?=
 =?utf-8?B?RTRha1BhVzVyK1Nna2twby9UdmgwcEJCdDRPL1h5aWtLall4ZEJwaWlleUtw?=
 =?utf-8?B?aHp5dkQ5SkJGdmJkTG9MZWV2aXNPZ0pNSFJ5Um5GeC80NEh1MUVCWk4rUm1z?=
 =?utf-8?B?UnRYcUMrU2ZzMG5qOEVVL3J2elNQY1M1dzI1cC9FeXg3dXNKT2VEN0xaY0Jz?=
 =?utf-8?B?VHJaN1NOSUZvNU9CSkVLTmRSZ0tGU2Q3NzgvbXZUeFl4Z042QzJMRmQ1SXdm?=
 =?utf-8?B?azhrWEtFMlhPeTR3VlFPSnEwRWgwNFdTbWY2TVYwMGdwTzlzRTNZKzhZVDM5?=
 =?utf-8?B?bFByU2NqWFdRQlQ1Q0xoNzlaSHdOc3VkRUIvQ2JvbU5GUHd1MFZaaGpNdGt6?=
 =?utf-8?B?MHJQL1ZrdGpXM3V0OFNCL1JsRERBdVJteFJYTElRbnlETVJxcGVCZ2tkVWJB?=
 =?utf-8?B?Z1kwNEFVbThlcC96QUJIak9WdXh5c2NaWFgzbUtuUXlHT1N3WWNHNTN4SUUv?=
 =?utf-8?B?WVJTTEh3aFUva1VLdk0zdTdCVDBYMXYrY1dWN29JMkRLSlhmUjBoOWlqbkJj?=
 =?utf-8?B?NHpWUGl5aFBTMDFTRmhHRHBFTXdIeitzTjBvSjVsWCtWaWZSUGlUUkJYVSt2?=
 =?utf-8?B?M25QNDY5M3N6ZFFCK3FKV1h5NklWMitqaHowY0QyeEVVTnFsa1hFU1NoMnFx?=
 =?utf-8?B?Q1MrcVVybFc0MHlZTDBiSkQ1QjZuSy9HYzV6Sy9vVE54bXlWNHV6S1pZNEhJ?=
 =?utf-8?B?clM0bnF3c1FiNFV4Q1VSZFhnSnV2WGh4N3JtTlNtVDRlblppNHB0clFwUnk0?=
 =?utf-8?B?OHh2M3pQWXlRclNRZWpqMy9aRnBSQUtaZE1TSGdQUHI2WDBUUnYzUVRhVHd2?=
 =?utf-8?B?NlJlZjIvZ1pZa2ZLOWg4cGQvZ1BGMnFWSkRCTllkZzBObXp3YVl2eVQ0UzJs?=
 =?utf-8?B?R2VkWTI5d0RmWEt2ZGxTbnRWZm9yZVRta0lrdDlDaXB4dkI0L0didVVpbkdu?=
 =?utf-8?B?TE1WMGZPcDd4UlV3QnRVSVBuOHdFaWFCWnd5Tkpra3ZlMkhyTW9Mam1nSzhu?=
 =?utf-8?B?eStzZGVGVU9OdHhqTzlBaUlGeFUzWXQ3OWxIQXI1US9BWGkvdlBScUNtekNO?=
 =?utf-8?B?TzV6T1lia2lZb0V1a09SdmFlZE02Ukk4bE9GTFVZNUJkM1ZpdnhySXJML3VC?=
 =?utf-8?B?RWl6SmllV3RlLytiSzBzT0NmNEJPUU9sT21ZUkJrOTZtbVpLckY5b2lSOTE5?=
 =?utf-8?B?aWFlSUtPM2JsYU0rcjFraUg5N3RZNmlxamV5UmpVRjBkUjEvYW1aUkd4N3dV?=
 =?utf-8?B?V3RZUkgxNnNQakdUU1N5UlUvaHVGdGJVVUxYaGJSbmtyTGw1ai8zaDVIck54?=
 =?utf-8?B?TWZDS1paR25RRTVZa0U5Y0g0a1pQWEZ0cU1SbDJrUXo3YUdoNlBsT29zZXJJ?=
 =?utf-8?B?TXpBUkM4akt0TEhkV015cWRxQk5KMElUREZ6bUxkTkZhZlBLUUZZUlUrL01a?=
 =?utf-8?B?bDdnbmVHQkZJVkx0eEhtQmJYbG1aWmtXK1NobUhLcEhGZDlPSytpeC9YTEZL?=
 =?utf-8?B?ZC9pR2ZQdnZQNjlHSU1DdXpEajVvcjVtTit0d280UHFKTjNoNHBXUVhVUjdE?=
 =?utf-8?B?R3phVHdqUEZqSm5QOEJhNXk4dWdMWUlDL0NVRHkrK3VoZGxKUW5kMVpPa0dO?=
 =?utf-8?B?VDlBZktBbC9sZU9BWkdJaWlUOGZIM2hvd0RsOWp3UkRzV1p1NDdZNG14MTc1?=
 =?utf-8?B?dDRQL1NYSkZ4cXRVeTR3RWE3QklLeHltaGpFZkUyZSs4dnM4dkIzSlMrOCsy?=
 =?utf-8?B?UW15cEFKWER2TEp6VEJjblM3ajdDdmROMG8vWWhLL2RMV29KZGJZOGU2NjdJ?=
 =?utf-8?B?WXVFTlhtWTNSMjNrSklNOGJ6cG1PVEhaT0NKRVB4NVBwbyt2b24yRlRkRlBB?=
 =?utf-8?B?R1I0anFBVDY5UWc1UGQ3Z2FVcCtzb01iMHpiZzdLQ2JmbkNFb0tqN1lLcFN1?=
 =?utf-8?B?dC9VQ3d4ZjdPV3FjbVFya3ZFWGZnMkd4LzVZVmdHc2hzNWNoU2RIVkE4d3RV?=
 =?utf-8?Q?Q6YjxhA0wSQjuaYe1xulythAE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f128fc-83b2-4178-a877-08dbb509a230
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 10:01:58.4604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rI8pEwCntt1D8nUED7fYiKVOAL1RZoZIht8V5FqJ06cTksjpUuimHuHQs94rSFrghSW9+LwqS3k3yIORCFZKnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9702

On 13.09.2023 22:27, Andrew Cooper wrote:
> There is a corner case where e.g. an NMI hitting an exit-to-guest path after
> SPEC_CTRL_EXIT_TO_* would have run the entire NMI handler *after* the VERW
> flush to scrub potentially sensitive data from uarch buffers.
> 
> In order to compensate, issue VERW when exiting to Xen from an IST entry.
> 
> SPEC_CTRL_EXIT_TO_XEN already has two reads of spec_ctrl_flags off the stack,
> and we're about to add a third.  Load the field into %ebx, and list the
> register as clobbered.
> 
> %r12 has been arranged to be the ist_exit signal, so add this as an input
> dependency and use it to identify when to issue a VERW.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

While looking technically okay, I still have a couple of remarks:

> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
> @@ -344,10 +344,12 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>   */
>  .macro SPEC_CTRL_EXIT_TO_XEN
>  /*
> - * Requires %r14=stack_end
> - * Clobbers %rax, %rcx, %rdx
> + * Requires %r12=ist_exit, %r14=stack_end
> + * Clobbers %rax, %rbx, %rcx, %rdx

While I'd generally be a little concerned of the growing dependency and
clobber lists, there being a single use site makes this pretty okay. The
macro invocation being immediately followed by RESTORE_ALL effectively
means we can clobber almost everything here.

As to register usage and my comment on patch 5: There's no real need
to switch %rbx to %r14 there if I'm not mistaken; in particular you
don't re-use any of the other macros which require use of %r14. You
could as well use %r14b (or about any other register that isn't already
used for something, yet whichever was picked apparently wouldn't make a
difference) for the flags here, getting away with fewer new REX prefixes
overall.

>   */
> -    testb $SCF_ist_sc_msr, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14)
> +    movzbl STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14), %ebx
> +
> +    testb $SCF_ist_sc_msr, %bl
>      jz .L\@_skip_sc_msr
>  
>      /*
> @@ -358,7 +360,7 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>       */
>      xor %edx, %edx
>  
> -    testb $SCF_use_shadow, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14)
> +    testb $SCF_use_shadow, %bl
>      jz .L\@_skip_sc_msr
>  
>      mov STACK_CPUINFO_FIELD(shadow_spec_ctrl)(%r14), %eax
> @@ -367,8 +369,16 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
>  
>  .L\@_skip_sc_msr:
>  
> -    /* TODO VERW */
> +    test %r12, %r12
> +    jz .L\@_skip_ist_exit
> +
> +    /* Logically DO_SPEC_CTRL_COND_VERW but without the %rsp=cpuinfo dependency */
> +    testb $SCF_verw, %bl
> +    jz .L\@_verw_skip
> +    verw STACK_CPUINFO_FIELD(verw_sel)(%r14)
> +.L\@_verw_skip:

Nit: .L\@_skip_verw would be more consistent with the other label names.

> +.L\@_skip_ist_exit:

I was going to ask why the separate label (and whether the two JZ above
couldn't sensibly be folded), but the to both answer lies in the next
patch.

Jan

