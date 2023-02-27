Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED8B6A4509
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 15:46:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502648.774536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWelq-00049v-Sn; Mon, 27 Feb 2023 14:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502648.774536; Mon, 27 Feb 2023 14:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWelq-00046X-Oz; Mon, 27 Feb 2023 14:46:30 +0000
Received: by outflank-mailman (input) for mailman id 502648;
 Mon, 27 Feb 2023 14:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWelp-00046R-9B
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 14:46:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83eb2c91-b6ad-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 15:46:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6896.eurprd04.prod.outlook.com (2603:10a6:803:12e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 14:46:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 14:46:26 +0000
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
X-Inumbo-ID: 83eb2c91-b6ad-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLEWDkXW58jvYvdyDFxA+tgP1Wlm9dgE/wEUsRTDZLvP5M7LrGpq6obV+0ev9rKRA72Q1OFUqDbWbNadpc6ZCrjqaV8H0aDRrrZM+yHW60NqDFCG295qBpxBqAi+HyHuuA4ICF5ChGexa8DpEQVt6kgaCtYMZFr7117L7scykk1LgLrMoILRyQ9wEwV7OTFyxFhoeuhOBGTnjqORUlSp0rlF33ozSAt8sRXIugUbV2pfzmEf5b2+8s41IYGiHu9m5dSjszFcWoKeVy60z+g0S08ltL8TjcWfpbVniIEuESIYOMo81u0FjQtnzRILOr/sCytv7Ok6y1ngHTW29Fn3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdkh2oAG5nnCXQvMNmwAI6pYV0dsGBMjdClv8mL+7Ss=;
 b=WjTE3jrcXpBB3P3nd4aa89EM/buT5YcdqGvJAIfwPZ2iHUWa8ykrkTVVcRkaJ6Ze3HtywjWS4UWSxPAb06VO1IWDAapqkwC4eAgRmQgyvdHVbcHhSojgZedlO4sTA01w9xMeKoD2JEz0HGqOqfRDZakRe1pQZUvTo4wggIE7j1s3ePlNf9gKWwyCEvgLzcFwTApRwwVc0QvR5/KbksV9548Xd1ahWhUtbMPwAy0VhrRwIv06Oqcc0j3DM99NusBYPQ5m7/FERbF+gZIyyDx2Ao7OBa+RdCc9pcXmY+5ZZfFDoriUrP1GdNWHo42Ixbgw0Zq9tE28jcOXqsQmwO2f6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdkh2oAG5nnCXQvMNmwAI6pYV0dsGBMjdClv8mL+7Ss=;
 b=uQZFTNwBCfIV4DRhSwGdNXtn3NBKL5z1bEK1/f6PADFtagYl2U/B8i4GRpCucpwuOpmh1CSyE3lRgNumnKsY1kJjPg7KXb93nNKdFWUnQOsuEt0+Ji3vcGEMm17+TUpJWY7a83uHNUD0LkOvS7O49Zq8I6KGAU1857ktH/Bs0NtZAWuNlOa3BzR3S1radTcnfTNNYEvue4Tavx7qHAVQEr6+2OH+VG1GjQZvzbuKBQXbl8rj9d8ET+IOE3yGFhH8os/mq5IzwXgDGuxi0Yl7GQ+WI4eRjzEW2m4K2nzT1PHPzLMiC63sTEbtoNBKvpJ2ww0D/iwsEk3JfE5JLhk/mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90ec98cc-e416-05c3-f507-5e4b2b7f937d@suse.com>
Date: Mon, 27 Feb 2023 15:46:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 4/4] xen/x86: switch x86 to use generic implemetation
 of bug.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <38bb75b9add8655288347aa4df1394450e4e10c9.1677233393.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <38bb75b9add8655288347aa4df1394450e4e10c9.1677233393.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 673ce911-51db-4e3a-7d88-08db18d1673a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RzGKpwSJzo1d1YZk2SGYbIahAzg1fmkQR+2zNl/9IozDyXa94DUTZspGxHlFnuVERxhBKBpRTIkHooNUmf7TxEmX3/mwtKzIFu8rYisp1/L78s8MeldKjG0H6nfe/E+pLZjc62hJgFddpyDDbRzpgX5kaNZ6SzUnxtqNmHkzhrJzVp/L9jLKq4L9NfMchv8saOLVwF2UQAvdM0HfQet/nnMfSKixJyAugR1XZVsDHjHK0MLL99mFqsVBkn47QWrHhspRmW3tnjJd9oQxZfH5779sjxqFv5NLjq679MNk+sXZxmARUTj52n9Gk+ki5tr8Bn68IIwxsBpMY9qTqSALwJCwPADmPMRUWFxw6f6ZGNhJUW9Jqbc3ndFY3PHGjFfgCcG1nMnE3rpq+R3jO155QK/ikXBrZAN+x+AGy7HVryRESNjM31I3jfSkCxjyGH+v95cZ/YqnDt/aYosP+M964hoC4fYTTGTWRfcBgW+C11JBg0nNmdd7mmKOXC2ObHE4BxhoCFjNQawutp8yujV1X2kMc8dXCyFKGCCXzv3j3/DycMrF5tH1vwnu7BXEBwj13YxzRSd6Wi8Wl8x+0IsgIztnd1wIEI4uhX7jxd5sl5nuli268ACMfmprcwAxOdCm5Wz5lBgmLzVLF3Voxkty9lLDWSPMceXEwlxWQeAVhf9KuoCWx4zFTkv+Kw0L11EyHw22MMSA9+f2nmDHaYsnx9p+dtnVqPfRNtOXAz4J/haW1bEyOXqJN9uKE8HLBqP8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(136003)(346002)(39850400004)(376002)(451199018)(316002)(2906002)(31686004)(31696002)(36756003)(5660300002)(8936002)(86362001)(6512007)(6506007)(66946007)(186003)(26005)(8676002)(6916009)(66476007)(4326008)(54906003)(66556008)(38100700002)(53546011)(41300700001)(2616005)(83380400001)(478600001)(6486002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEZhcjd0MWFJWlp2RXNsT2JvYytJRDR0Z2huN1BERW9GYm8zZG44SnRZZ1pq?=
 =?utf-8?B?b3hjL3pUekMzL3VETkN0M3JUNDB1bDFLR0p0aitpZG5NQ2hmSjBVOHpTQ0Jz?=
 =?utf-8?B?UkdNQTJGcUpqNUVNT21BVHhacGhDVmJnb3luVE9PajAvckhQRkwvYTkyeGhm?=
 =?utf-8?B?NFNkZGpERThtdmNDUndKdkc2djlrR1crZWtERVBZZVhPdGdhOFpJQlZpSnVW?=
 =?utf-8?B?M3F0a0VHVGluMkNRU2hOV1ZTU1NzYWVNSE96OXhWTUhsbkZ1bVQycWdDaE9w?=
 =?utf-8?B?dHdhc2hzbkV3Tm1aY0ZaWDVBaGdIVmZBSDQrUDV0YllpcUYzL284UjNWeGxQ?=
 =?utf-8?B?bHMzWm84YTU0YUZUMXd0MXBiRWw2cXNGRHNqZzVkVDJhclpVSmlrS1VUcXc1?=
 =?utf-8?B?VWpCNzVYS0E3dG5MeDRvUmhqMVAzNzE2VTRkbS9DQUlpRCs1ekpEbDFHVXFP?=
 =?utf-8?B?WEEwa3RLcU5JZWdWSHgxeEJTOU9uN25aRi9UOXpJbS96TFNKVStMZHNLQUlJ?=
 =?utf-8?B?T0wzc0I2MWJtVnh1WDJoWkRJbjVRaEdmN3NvOG1GbVNzWGkxampLdWhrTnRr?=
 =?utf-8?B?aXNtZkpPQkZoUkdVWDdaV0VsVk9VemJmRS9JSWFxQ0FmRktEM0VaNHNpa1hP?=
 =?utf-8?B?b1h2Q1dYUGd4UDFsbFEyemFnT2psMnlmT2owei9rMjI1elA4bTBLUjk1RnBS?=
 =?utf-8?B?UjNQaDFydmxpZUdWMmI1alZSVk9jeUJsVzZ6TUl1KzJJak91R3lvU3pTQjRF?=
 =?utf-8?B?bUw2bkpvamM0MTRlbjdleDduRUEwM1l6WFZQSXpwZTRkaVJmbjA0cDFzK3d1?=
 =?utf-8?B?Q3N6UWlzQ2ZhWkNYZ29JTnQya1M2a0E2S005VkZMbG9vcWhhcmlvcXB3ZXNo?=
 =?utf-8?B?RXZmV1VkbEgway9VVHJPMS9HTEVoZWJudTF4QUUzRlQydjE2T0ZYUGt4SU9h?=
 =?utf-8?B?ckRubUdyOS9TZnArMkIwbkYyNEdjLzBZeU5sQ08ydm43N1huVSsvNzAzaHln?=
 =?utf-8?B?eitRMnFhclAwVERSZXFhL1hQanVxNWVPSCtXaFVvZk92TmFTSHpMTWpvcWJM?=
 =?utf-8?B?clRtRkZsS3I5aFhZeGZFOXp4Z2dzbFVBRG1Pb0ZTbHlpQjhCQ09id0Jvb2xS?=
 =?utf-8?B?bm9rZXp6aGxhSzBPbEl5dnI4aGw1ZkxQZTFLVy9hZlJRbzRpMERPZStjOHZo?=
 =?utf-8?B?Q3dCNE9UbDFRSlU5aWZ0TDZIRFRVb0dIMm1tWmtnZUk0M21LZTV3T0RwT3oy?=
 =?utf-8?B?VERXV1pvTHBFaWdSaU5EZk00d1g1UThnRDlCa2Z6cjZvSmxMeEcvdVIwRkJm?=
 =?utf-8?B?ZjVWMzhpMzhUaDRWMTFweS8xUnVZNVFGOFE2WlI0Z3FtUzNGRmd3UWRSS0Rx?=
 =?utf-8?B?OHlpZlpoR3QyQ2VpRmRHN0pwVnlHWEhXdDZERmY5UXVFd0pUczhTQTJ0a29z?=
 =?utf-8?B?R1hBcThTajBVSDA3aUh3S0xpZ1lzU3d4eFlRTVRxbDBYS0xMZWVoN0ppcVRt?=
 =?utf-8?B?d2h4dmFkeGNKSm8zVDV2UThOd2lGSmVtV0ZTaUI1TUtqNEhHSTc1cGUrSkNk?=
 =?utf-8?B?dk9jZ0h3cU9ocmlIYUczbWVnQzlqOUtCL1lpbXljM0txWnBtMVdNVHdPUUxm?=
 =?utf-8?B?eTJWdUJuWDU1cTVZQ0syWlRsN1ZGQkM3NEVObWFqS3FSbDlHWHNSV1JiaStt?=
 =?utf-8?B?alpBUTFvN0dSNEltclVwb0JvdWF4T0JBNThnVWthV0lWUzNWcW9uRXdxcUZN?=
 =?utf-8?B?UkQxUUtXSHAwQnk3YUdMTVRmNmViWW43RUhvWFB6R3VTL2EwaHZYMUdkN3Z2?=
 =?utf-8?B?aHFveHZydjYxTHpIZkJKcWNDOW40MWFwVnFockExZ1hlTld5VWNNU0kya2E2?=
 =?utf-8?B?bjF4clhNVndyY3FSNHFKcHBJaDQ4OUVrK3RtQmRVR1hEazJLWmtHK0JTZTNR?=
 =?utf-8?B?VndxL1VPYys2empaMlZlN29zNmpxU1I3RzQ0UEljUDIvaHl4V1FsRG1pdUo3?=
 =?utf-8?B?L2ZxOTYyTzBSQ1EyeEZTMmNRc1JTamc5Y2lZMUFzWko4V3lCaXdZNktYVmk5?=
 =?utf-8?B?ekVZOVczSDJKY3pRT2tPT1Y5QmxxcFVVdUd4dWpwRzhLaEhraEMwbW5abGd5?=
 =?utf-8?Q?aPiGTWnmuDYTB7w9/j+GnQnVp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673ce911-51db-4e3a-7d88-08db18d1673a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:46:26.3268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzMGWu6g2bnvCrCSy7iSV0yfCBnlr3MupONbQkvUNzp7hqpvH/rhtNEXSPNEY3Cq+OnkMIWPPzZzc8zTgyOSsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6896

On 24.02.2023 12:31, Oleksii Kurochko wrote:
> The following changes were made:
> * Make GENERIC_BUG_FRAME mandatory for X86
> * Update asm/bug.h using generic implementation in <xen/bug.h>
> * Change prototype of debugger_trap_fatal() in asm/debugger.h
>   to align it with generic prototype in <xen/debugger.h>.
> * Update do_invalid_op using generic do_bug_frame()
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Hmm, there's the question of where to draw the boundary between patch 2
and the one here. Personally I'd say the earlier patch should drop
everything that becomes redundant there. I can see the more minimalistic
earlier change as viable, but then the description there needs to say
why things are being kept which - in principle - could be dropped.

> --- a/xen/arch/x86/include/asm/bug.h
> +++ b/xen/arch/x86/include/asm/bug.h
> @@ -3,75 +3,10 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -#define BUG_FRAME_STRUCT
> +#define BUG_INSTR       "ud2"
> +#define BUG_ASM_CONST   "c"
>  
> -struct bug_frame {
> -    signed int loc_disp:BUG_DISP_WIDTH;
> -    unsigned int line_hi:BUG_LINE_HI_WIDTH;
> -    signed int ptr_disp:BUG_DISP_WIDTH;
> -    unsigned int line_lo:BUG_LINE_LO_WIDTH;
> -    signed int msg_disp[];
> -};
> -
> -#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
> -#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
> -#define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0)) &                \
> -                       ((1 << BUG_LINE_HI_WIDTH) - 1)) <<                    \
> -                      BUG_LINE_LO_WIDTH) +                                   \
> -                     (((b)->line_lo + ((b)->ptr_disp < 0)) &                 \
> -                      ((1 << BUG_LINE_LO_WIDTH) - 1)))
> -#define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])
> -
> -#define _ASM_BUGFRAME_TEXT(second_frame)                                     \
> -    ".Lbug%=: ud2\n"                                                         \
> -    ".pushsection .bug_frames.%c[bf_type], \"a\", @progbits\n"               \
> -    ".p2align 2\n"                                                           \
> -    ".Lfrm%=:\n"                                                             \
> -    ".long (.Lbug%= - .Lfrm%=) + %c[bf_line_hi]\n"                           \
> -    ".long (%c[bf_ptr] - .Lfrm%=) + %c[bf_line_lo]\n"                        \
> -    ".if " #second_frame "\n"                                                \
> -    ".long 0, %c[bf_msg] - .Lfrm%=\n"                                        \
> -    ".endif\n"                                                               \
> -    ".popsection\n"                                                          \
> -
> -#define _ASM_BUGFRAME_INFO(type, line, ptr, msg)                             \
> -    [bf_type]    "i" (type),                                                 \
> -    [bf_ptr]     "i" (ptr),                                                  \
> -    [bf_msg]     "i" (msg),                                                  \
> -    [bf_line_lo] "i" ((line & ((1 << BUG_LINE_LO_WIDTH) - 1))                \
> -                      << BUG_DISP_WIDTH),                                    \
> -    [bf_line_hi] "i" (((line) >> BUG_LINE_LO_WIDTH) << BUG_DISP_WIDTH)
> -
> -#define BUG_FRAME(type, line, ptr, second_frame, msg) do {                   \
> -    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH));         \
> -    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                     \
> -    asm volatile ( _ASM_BUGFRAME_TEXT(second_frame)                          \
> -                   :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );            \
> -} while (0)
> -
> -
> -#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, NULL)
> -#define BUG() do {                                              \
> -    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
> -    unreachable();                                              \
> -} while (0)
> -
> -/*
> - * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
> - * and use a real static inline here to get proper type checking of fn().
> - */
> -#define run_in_exception_handler(fn)                            \
> -    do {                                                        \
> -        (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
> -        BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
> -    } while ( 0 )
> -
> -#define assert_failed(msg) do {                                 \
> -    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
> -    unreachable();                                              \
> -} while (0)
> -
> -#else  /* !__ASSEMBLY__ */
> +#else

While for new #ifdef-ary such comments can reasonably be omitted when
the blocks are short, I'd recommend keeping existing comments (except
in extreme cases) in the interest of reduced code churn. In the case
here, considering that ...

> @@ -113,6 +48,6 @@ struct bug_frame {
>  #define ASSERT_FAILED(msg)                                      \
>       BUG_FRAME BUGFRAME_assert, __LINE__, __FILE__, 1, msg
>  
> -#endif /* !__ASSEMBLY__ */
> +#endif /* __ASSEMBLY__ */

... you keep (but alter - please don't) the comment on the #endif,
that's even more so a reason to also keep the comment on #else.

> --- a/xen/arch/x86/include/asm/debugger.h
> +++ b/xen/arch/x86/include/asm/debugger.h
> @@ -14,9 +14,9 @@
>  
>  /* Returns true if GDB handled the trap, or it is surviveable. */
>  static inline bool debugger_trap_fatal(
> -    unsigned int vector, struct cpu_user_regs *regs)
> +    unsigned int vector, const struct cpu_user_regs *regs)
>  {
> -    int rc = __trap_to_gdb(regs, vector);
> +    int rc = __trap_to_gdb((struct cpu_user_regs *)regs, vector);

I view casts in general as risky and hence preferable to avoid. Casting
away const-ness is particularly problematic. I guess the least bad
option is to drop const from the do_bug_frame()'s parameter again in
patch 1. However, for a fatal trap (assuming that really _is_ fatal,
i.e. execution cannot continue), not allowing register state to be
altered makes kind of sense. So I wonder whether we couldn't push the
casting into the gdbstub functions. But quite likely that's going to
be too intrusive for re-work like you do here.

Jan

