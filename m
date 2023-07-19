Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFE37594B6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 13:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565801.884321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5os-00054w-0t; Wed, 19 Jul 2023 11:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565801.884321; Wed, 19 Jul 2023 11:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5or-00051b-TP; Wed, 19 Jul 2023 11:58:13 +0000
Received: by outflank-mailman (input) for mailman id 565801;
 Wed, 19 Jul 2023 11:58:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM5oq-0004xg-Du
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 11:58:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8866ff7c-262b-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 13:58:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7134.eurprd04.prod.outlook.com (2603:10a6:800:12e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 11:58:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 11:58:07 +0000
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
X-Inumbo-ID: 8866ff7c-262b-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOYi3fymMqIQ+aUWg0xuBiDh1qcKCP3+8dSBu5jmwjySwrAy1DX81nd7sA0THWcIDYWUkPTpTOO1RGViDkkqQ9Fu8/dkOlXynfcJIF+5ItF474D+hrvVfaEwW2ZZsSCTlAlMu83VIHyQwHfS5kCjettCyd+gN5+gEbJO7xspGPtSteMnFQYuUITFWo+mv0h7G/W67tcD/ecEv2wtyW+k8nBPAkkvDUwVAg4VtrXgxQS+DVRu+UgXgLaUWcolbnQ0bWMO6Yl6606JEmdZ1D3BUDStsqG/5aEGLD1UTtYDupXRvyVHQWPNm4UqwKq+0PqNDfMemUJaP5visOIG0L4zkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sU905YrKktMBCfFR15qVudU/8Wy7M4d02lF7wjb0bpw=;
 b=lh4cypj3hcueVJ+QPI4c03iSlpiDyaP41fHWijkPT0EiJoSnW1TQo/275tL8sJxxyEWbtrcmNwF/yWvf6Ttgjxrar/h1Xtb5LRigASdzi/7FYas+2DjFTmv9UcePBfonpgJOjClO5pNTuJzhrJNdjDdDPK7NKjmuyEXK52WqsIt7v6hp91+XO2vo+8mFuPkjRnQ5CGHkUgK1vay4kESDBa/MYEd9z2Id5qBZVYzXWmEikxWNKKFCPEahQ4l58CIsO72S0XotXq6Xz2uEBKIZ5EPkQQp1truRXh93hD0gVua1dkVkvA9VlUZewT4l4jIPBSsv3RsuQklJeLRtz71K6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sU905YrKktMBCfFR15qVudU/8Wy7M4d02lF7wjb0bpw=;
 b=zw0+SxSKxVqM7FvewtDlme6HHJ4pkrHJj4QTOLMc2GAEJwzSK2nX8lUI0/j3nxRl/hDS72Yzc42Q3HnzUl8F5wcCNFBz6q3Oy8B2DJj5Lz/9gpl1xyroeztNKi4ZCmWbroVhioR/W7O4QbfHZoZgxVofOtNLQ+76F7MbRDHKSpwCSBRtmIigGKWUDvL/woOdmWozj727jiUB0enMSbw1Ng0jjzdrUHVSDVO3TEICKE23yMnWXz+ydnBHY+XEoUyklzUZGD1BFWc58P1Lf6SWX+nfSvUcORJKiqRX/R68frteNbXBZLatH1vLqYZgCCOhfy7Q+rGHJd9b9qlkRPl/Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebc7fd1e-1766-c767-c958-9f04fb741a59@suse.com>
Date: Wed, 19 Jul 2023 13:58:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC REPOST] xen: Enable -Wwrite-strings
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230719113810.4066290-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230719113810.4066290-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d4819f-dd21-447c-a0b9-08db884f6aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rZgyr2Da//J/4raV7mvPm0ijpTmxQpwKnNGmHuCAZFmLECa2ucaPxyxzlxEo6WvtGXFKNZdcRQAwZhXT5RSGo+k8HYes2REKmeWd6AgAbHUrotsZpkoIxqgs6AgXYBKw7TNPxTxWEcTEy7ltkZEQy54YMH+suTcTEmuXl6AzDrsvgSuunm8pCZjhIelfB2THnrXYgetyzCUOZr/EWt/v6pkd+IZKJTsKudOk6/YzIuQNlIX1JtNRfczUmmEyt4aZcz9lCdu0Ebj4Zw6djNWfhfXnmhrX9tV3aUvUKoCoi5ycJ9Xsfo8HonybggZXY+zbbincwtFUE/h0TiYSebbamiJooOnavRQi2c3ggWiEOsd75AoExURMYpHnrdGapUZXdRUYhbNjCXsMbdbGk9OETkuE/axqMuwQ7lxtycKzrFk+krIxHijRO+Y3FwVoizD0seSk1WecIrayyv1IKgL48/wjxaOFsE4f/GZMgc3XIxfUMfSEeROcKyH61/9ah9CNl3G0eTHKUNOOMx6qQBj5JkULDia9+2Kf6JlX/tXLh0g0NehtWYXce/ZYqcoimMD6icXpVDokVtXewnR3bJZ6MJT5orm/jkFa4Fkpl9jEioDsmNu8ZlQzdS+fDdRCy1sTGZ1W81PWMSwmo3GkJhp5xA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199021)(31686004)(478600001)(6486002)(54906003)(2616005)(31696002)(86362001)(36756003)(4744005)(2906002)(186003)(26005)(53546011)(6506007)(6512007)(38100700002)(41300700001)(6916009)(66476007)(66556008)(8936002)(8676002)(4326008)(7416002)(5660300002)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVlFZGJ4WnhIaVpjNkkxSzduVGNaWFdHMUw2V3R2Zk9mNm5FYXNsc2ZZMDA4?=
 =?utf-8?B?M1lCVVVib2IzN2RvN0xhRlhwOXA2dkxSdmJId3doREIzNG9MSk44YTdmUU5m?=
 =?utf-8?B?VkhmbURqVWFnUTN5NWNPcTdIcGFPZUg1aVl5V2U2YnZKdFFCTEZrdDNCN0Mr?=
 =?utf-8?B?QUJONGtGbUMvQ3dTUDlwOXQrdC9uT1AwTUlYakNFYk4rWjVHMi9aaDlXZ3Vs?=
 =?utf-8?B?M1JYR1VJNURUMHZhTk5pRU54OXZvdWNtV01ab3dhb0RoTHY3MlZOWmg5T25M?=
 =?utf-8?B?aWRrOUpJN2g2TEltOG9YS3lEdDJJZVA5RXFJcCtRUnJtUjdxMjU3TjBYQTc2?=
 =?utf-8?B?V3VwanhkUjMzN2RObmFYTXJPSFliVGdabFcwUGpDa3VlQUJjNEdpU0FJcmxp?=
 =?utf-8?B?ekRJOVJkOGZqUmdIYWtjTnlHTnU3RUpvQ2xwUEtab0Q0UUlLalZjZnd5N1pG?=
 =?utf-8?B?elFLbUtmTTlWR25YcG13VFVTRlFRaWRVNlhvdmx0TlhScHFkdXhaQ2F1WG9k?=
 =?utf-8?B?Qy9rTDliZEZKY21vam41SkNFcCtIdmFzR3RwSWE4VTRPZ0VieG5jTWhsM0ZO?=
 =?utf-8?B?R3RVMmt1dlVPd1lXTWdDUFZ5cTRzcW44Y3Z3dFpZd0dONjE4SlhiM2xXQWZK?=
 =?utf-8?B?aGdxcFdmU1dLdU1BUXdvbVV2YVZLSXJHcDVkWk5XKzV5cWtXWVVDaEdCME4y?=
 =?utf-8?B?eTR3QmtIaU5uVnkyVFF5R3BZQ2R1dTYxSXJSZU9nSTZvbXR5QVp2OHE0L2ZT?=
 =?utf-8?B?VGkzemRoM24vL1JHOUZ1MlRKWVpxanBJZkNWQWpaK21vc2NoMGdwUDdzeTdR?=
 =?utf-8?B?TlZpdUtTY1FKTDJrdCtCUUFtbGVOYjVjTFpOa05NTVB3a1U3M1FZNHk2NEQ2?=
 =?utf-8?B?ZSsxYkF0SXJTdG5odnNSRmFlNWJJTC93U1VIdlVhT2FsMERmMWZFNUJpdkpB?=
 =?utf-8?B?ZExHZ2NTc25MbVNXa3N1WHd6K0VXWUtvYW9LRDdtWWdKOTVKRXAzbXFUam13?=
 =?utf-8?B?MXhqYmFZOUovdmVVRmRLSENBWVMzeEU5bHNMQ0dBRWpRVis5VWE5TTVmYUpm?=
 =?utf-8?B?TkdvVk9nTCsxZmJIenBYVjdYVURBdEdwNlprcXovekRFQmtqcHphZ0dQTWxk?=
 =?utf-8?B?VCsxNUI2THExNHB0TFM4RTNKZFEvU1o0NDVDOXFPeTJmT3o0QmRmdGtxT3JQ?=
 =?utf-8?B?dEZkTm80a2cvYWUzZVcvUjBSUXE3d0E1WVdYK2ZvbDZtUGo2eUhZMVMwN0c3?=
 =?utf-8?B?WGFRT0Y4K2NSZTRKekVmUWNpUXg5ZjRnNjJQUWRwdXNCMHpaU2pXdERCa0lh?=
 =?utf-8?B?SGFoMWlwYWZSdE5ZRyt3VXNWcDQ2VzRoNmFYL2hLTVRjT2QvdjBxT0pSNDFz?=
 =?utf-8?B?dUZzSlQ1TmJ5VlVsV3YvS1h3ckxlZmRwaFFXZnpBSlRLWTRGQnc4RzdBU2N0?=
 =?utf-8?B?V3FHbGtyWk1PZytNdktiODUwc0I4akdjOHN1MSt5WkJWNUVUamhHZllrOVJK?=
 =?utf-8?B?WEF3Q0l4eGdRMC9LRTFaRlJZVENHYVdDQnhTSkVydk9DMUZJbi9LcTVJRXg0?=
 =?utf-8?B?emVDd05OTWZZNEJpYkpaYTJqQTdKWFlvT0ZlUXg4TmFNdWduNlorYXRCSG9o?=
 =?utf-8?B?NmdDZjUrS3RzMVU4K21jc2tKd0hzMmFzcEZIMmNFZ0hxUTVWWDBEUEphdjI5?=
 =?utf-8?B?azdqbDJTM3dSemRLRFlUeTM5dFlFVWpWVkcrcEhBbTM5QW4yeENqeS83NDYz?=
 =?utf-8?B?VVU3R0hQQXRFNitOMzRQeVUwNnN3U0VlV2FhRnZESE9kOFZIa3Zjc1ZrU3By?=
 =?utf-8?B?NFJIbXprQTUvaE9qOTNMdHdTWURDWmNsK0t1cTAxSFBFK1dzOG9ESThFaEls?=
 =?utf-8?B?eDlaZjJONEEwSTNqKytCa0M2eHFnNGtpcW9jT0ZJVktUOFZIanRSd2tqZ2kz?=
 =?utf-8?B?MVFSMlVUREJoR05oamVTTExSeERJV1ZjN2R3QzU0Ymx1TVhHYnFtV2ZZQ0Zy?=
 =?utf-8?B?R2Zhd2JQa3NOT1JPdUxRTmcvc2tVOFNMM0s1V1ZSL3NUK2QvSHZTS3gzQ0xH?=
 =?utf-8?B?NHo2bHhxZmg2WWsrcWVkQjlwdHVUR1NtdmNDcWN5clpHVUNkVEtuWEllWExo?=
 =?utf-8?Q?kir2uNm7JC/wwnd2zHRgKuVdV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d4819f-dd21-447c-a0b9-08db884f6aa9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 11:58:07.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkbolc8GJhKLl5srbKB8IB3Upob56eBWzg2JogYVqgcvPPbM5RQk/ezLeJ3x4/wRyh0oplJxmtRpGWqd46OK8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7134

On 19.07.2023 13:38, Andrew Cooper wrote:
> This is the remainder change to get x86 compiling with -Wwrite-strings.  ARM
> still has some cleanup to go.
> 
> There are two swamps left.
> 
>   1) efi_arch_handle_cmdline().  Swapping name.s for name.cs makes the code
>      compile, but only because the underlying union launders the pointer back
>      to being mutable.

To address (part of?) this concern, ...

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -324,7 +324,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>          w2s(&name);
>      }
>      else
> -        name.s = "xen";
> +        name.cs = "xen";
>      place_string(&mbi.cmdline, name.s);

... how about changing this function invocation to also pass
name.cs? The function already takes const char *, it's just that
there was no "cs" union member back at the time.

Jan

