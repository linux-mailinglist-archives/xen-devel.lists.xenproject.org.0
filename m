Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9817CAE17
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617837.960888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPqe-0004e5-QZ; Mon, 16 Oct 2023 15:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617837.960888; Mon, 16 Oct 2023 15:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPqe-0004bW-NQ; Mon, 16 Oct 2023 15:49:40 +0000
Received: by outflank-mailman (input) for mailman id 617837;
 Mon, 16 Oct 2023 15:49:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsPqd-0004bQ-RJ
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:49:39 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c6e1173-6c3b-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 17:49:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB10028.eurprd04.prod.outlook.com (2603:10a6:800:1db::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 15:49:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:49:06 +0000
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
X-Inumbo-ID: 9c6e1173-6c3b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaJD8QkCwmjfTyl95ZOwHZY2u1H8mqTAej/ZnH/Y+7e0gmtmaWokWmOT4nRF6s05EthZ2eG5DQAIMkF+bt1ryZq/iHgTry80oEGsikUQInl6bHsvIno4CR9m6JaaOIybmGQjRBTOyI18cO4lxlzD+/KQib3v1JnJ/14Mk1bA6/Y028G9wNjFYroPP5u2hX1/4uCSyQvAc8Bnljfp4Ey3W3Kr/6xK7NnVNwifPryb17yjMyJkMU8Oyy2+iDtBJPh8VfBXIvoKgFOeuyS5y2eMpUjuo9QkQDXfEB9GYv+S4Cj0lvgX//cHaiRqYAlH4a41LoKTkPgP9b066/69idKaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Co9c1WJR1J2gKj9Q39bNNmznPJ7Sf5SJUde9ztGPp1o=;
 b=AfLYUfzK6PNr/pTVMz6suJHnCcdveHQMf9dBwp0S0NtnOyw96lQcSwQAtn+KfUG04QIw6dBx3oNXBzpCcJxBtvW+vV4AYbR69oRRSHhpihW2iRswausu6Lx+oTZ1QZiox9ITqG9ONyw7ZSXlvr+h/w8+7Cl/imTiH4Zxj+JFnxpZ4mrNrWmZ8YxppF7n3pK1RA7uQDboV5sFoFA++Co+4goY8pvJ7vJassrEsv2fFE7+mvgy5kzth0H+BzXpwrnMWtM7zJ2OdcfoXwib9H7V+AM3R+4z25neullNpCzWNNKwlbvCvTm3neTLGLO8lSukmzF0w47a4xCh4pmcomdwxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Co9c1WJR1J2gKj9Q39bNNmznPJ7Sf5SJUde9ztGPp1o=;
 b=NNAN0onns4CfswnSr3ed8kWYxnzZa6sZDspYmnev2KzqTiC3iSI9fG0c28inTP34myqbypLeT8l8iWP3yPMXctPHsA3lnGdoED/yDWRyRbyVMHRhbumkEFNgftCUdWW+P+TJO433GsiSVYctu6e1zV2JIpziQquoGhShuUZ2j17Wi8ClGw5u/Ap9wOJzZSDjBAKQefkpXyMkMfOQ1vXIioVNLXMT7j1WWpSlQrD89QlmZPnKsPS/tgs5HhN5sg6naTMNfmr+/c6wSMRUADUU+wIZRkiQ2YIpPRgEy/kCvX4vV7ZVVrLTKUJbDsVcF/gZtPQhxM1GQbVsqv9rPH+kaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8c0a4331-4a89-4cb2-02ed-70cad3ad2116@suse.com>
Date: Mon, 16 Oct 2023 17:49:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v2 7/8] xen/types: address Rule 10.1 for
 DECLARE_BITMAP use
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <f94b0c9411937a4003b86b5850b6d4ad91dff5d5.1697123806.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f94b0c9411937a4003b86b5850b6d4ad91dff5d5.1697123806.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB10028:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e842dbe-ca43-4d93-da73-08dbce5f6e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fUIofPlcWjqV2nZixURdLBIylUKucbkCmoeyLHW6ECNQnh0pVuHmH0/K4+0VVnkU9fXrAvo0S0v8vtMW37uVU22g/BNxwYHZHqnbjQes9X97AT1dwhqJ/DadDVDdFWBbLTF3Sgf+g+eyg3Gx2QgbvBATn3OrsdzbN6PoXPlq0utV0n+y/bwx3lYjF9tAO/XP3LdRbA7Vl3U3UgIeMxjedq4++4Zq21uwYB/C0AxTkswOR7wZvKoFDmmg9s+pUy0pz4iNqyHQXpRxQCKKBzyP1d9KBkzCFaYXRCU6CrW6G3cv0ggMpV93mo46Ak0Gh2RtGTBEOsDe/woTHYLkJ5cbqNKJHhFHkodq3j+Kfu0lWRblrcfns35jOgHFria8waq/0YyfJBPNKPJjRo9C0DpKweZHy0pIvu6KqGoTzIeK2MKYkLrsKyV8fSaOSKchM72Tf/pEC9pv85JR+x9Unm1fAvclUFbtYY86WUZjhd4/pCRSYcYDMIJdLvdIxA3zyQ7qmZJP1vPWrDqS8QbZYZfbSZ4zfYD9xX/9ij8y2M4zedX8XFcABqSftNYXS1vCU4BKvHCh5LKbFXH4Y30NfNefqbs/JnOF/eQTkjaFbXSRHXlnpNXgboy9BPdc7vJzQvF8Ca1wsT5Vzx30k00SOPkgMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6512007)(38100700002)(26005)(2616005)(86362001)(478600001)(4326008)(8676002)(6486002)(4744005)(7416002)(8936002)(31696002)(2906002)(5660300002)(316002)(36756003)(41300700001)(66556008)(66476007)(6916009)(66946007)(54906003)(6666004)(53546011)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE1yaUt3b0Q4ZFg2YkV0L3FzYVZRNFltZVVlV3J3b3A1UlZYTXBwVWVEa0VS?=
 =?utf-8?B?M01lRGsybXBwcXFiTlg4amN4TlVoWklydkdsa2p4WTIyWVRWY1JNemdCaVE4?=
 =?utf-8?B?azdLcUxWRTFyQi9CRzRTMjkzRk5wTGFWWFkzeGNDQWJCcDVMVWdMMlRyQ0NE?=
 =?utf-8?B?QjVHdnZnalRaWlIxRi9COUNmWlpzZnl4S3VYU3pJdytnbE5tMFZwNDN1T0NH?=
 =?utf-8?B?SjRhWFhZRVhHN3lobjdyaU5lNk1NS2xRS3pld1NFbm5uODE1eXA3V0MrbDlk?=
 =?utf-8?B?Y0c0MVFPeHhSMVIrMDdJUXRlWVRnUFVqRjY3SUoxdW1ySWpzdXBVeVI0cHVp?=
 =?utf-8?B?MHdtWGtGUFgweDZERWVTY3FDNklZL2Zab1ZmVUFsREJ6U2RrWUxweXo4REt1?=
 =?utf-8?B?SjdhQWhrWlQrV0dwdkc3QTQycEZsWHNxc2oxR2h6VHhvWGFSUXdvMWlkVEo4?=
 =?utf-8?B?bmtUTGY1SUt0NnZmMHhCMlFtMmJMY0d3a01ETTBzUUxGYjhxV2NFdFNVVHVy?=
 =?utf-8?B?RmJlRkpyYjRGNElVMnkrcklEUjVIR2o4cWFtZzNaYTlTM0tJamtPQ3N0ajI2?=
 =?utf-8?B?SkZhTnJoVUFZaEUzWHFSQ1ZOZXBSVW95aWZBdVVmeDYvVWc4RlQzQms1eDhL?=
 =?utf-8?B?Zk1xVGliTnJuSXpIalZKVjhpVnZuYlFsQ252b3FMN0x6RllaV1V5ZnlSRXdi?=
 =?utf-8?B?QXNFb2dMdklJNHlHTndaZkorc0xRODlZTHY0M1hHdDNjc0dwNUpUR3k3QnEv?=
 =?utf-8?B?anRKSk9HZUdHbE9KTW11d2FDTkZtaVB3cHprdDI1ZWl3Sk52Z2V4UGxHYkZT?=
 =?utf-8?B?TmcwY3lnYldSWTBZeTlYUW92d3Z3aHcwNGVuN1ppbjhyMEl2WmpFTkhZOGwr?=
 =?utf-8?B?Tk9sMzRReWlIR3g3NXRhcXI2S3lpZEJKVnVaK2xwdEpSOExYbHlISUNlV1BD?=
 =?utf-8?B?S0l0b2tHVzM5V2NST1FSc1lpZWVjbGRnOHlOQVZ4RGJQMGJaWFZOZVpZSThp?=
 =?utf-8?B?RlpPU3A3QTlkSGt1c0M4QXZSWTgzazhUZ3FHQnZScEFybjBLRFhjYkxORDl5?=
 =?utf-8?B?V05HZ0lKZFc4TFU0UGV3eG01VWNTaGJnMWlaVWNJTDR6alZhdkl5TmJqZWVj?=
 =?utf-8?B?V0VnVVRHR0dMWSttT1VTejYyS1RtL1Y2emZCWVYyQ2pOL0h0L1ByNVM1N0JV?=
 =?utf-8?B?WlhIemEzdHp0QzB1dEVIK3J2VEtlOG52VVFsS2F5UFpEMEdibWtmNmZuNTFq?=
 =?utf-8?B?dEVVajAwNlpYUjVVNGd6UHc5eWpMMWJoVnhCbkdjYkNpUFBGZy80STlGZmlN?=
 =?utf-8?B?U2t2d0p5M21vakNXNTJKREhRSWRYWEc5Rm1DV0ZvaDVqK0RqRGJLMGFvcW9G?=
 =?utf-8?B?NXRQK08xNkVHY1o2eXFCUVdHcTA1MS9jL25wTVRBTHdycDlFbzAwT3ByblVy?=
 =?utf-8?B?WGlxOE55WWFBUXBqQ3J6ZmRoSW5VZGUrSDNRaE5YaEEzY0JmcnZ1aDNpajFM?=
 =?utf-8?B?cXpOaUpNbzJIbWlZQ1I2SjI2bWFXSE93OXN4VHdsRXRvdFp0QktlWGRPZ3VM?=
 =?utf-8?B?U2MzWXpOQzFETUViRndTMCtOWUhPZHlzOW9zVWlXZlVHUlFOVndETUN4ekRl?=
 =?utf-8?B?TjZZQ0wydHkrTGZWR3RDQmxyVFJkdHdZcFRPditvS0hGWmZTMTdOdkVFMy9u?=
 =?utf-8?B?TlE2eUVDbkpXZmdBODhHQ2VvYVBKakEyUHpMSzJzUEJLWm9ORDJDQ0ErbEgr?=
 =?utf-8?B?MDBpQ3RFdkxNZEJid1JnSGRjT1FCRTU1V3BseENRdXpCNCtqZ0pOUVp3ZkVT?=
 =?utf-8?B?OUJIZWNwbVYwZ3VTZUNRUFZmRkk2eG9Oc0NNWENHa2VDUjNNbjcva2ZiREdB?=
 =?utf-8?B?SlhxSnIxQkl6YTBmakk4bFE2TEpzVUFNc2tYenJBdFF2QXdBNnQvYmlnZDI4?=
 =?utf-8?B?SHBTelE0blBsUkJPQUNaMXFtYm51ekpmM1dRWGwxN2VGc0ladTNJSk1aUGN3?=
 =?utf-8?B?d2gzZ2dMa29VTlEvanR3WStadkdFSkoxNzVLbERXdEFCc3ByY2NJd3lFd2w1?=
 =?utf-8?B?MXhmVkdzZC9pN1dtZEQwWXJTU09GNzR4emZvaEJMRFZxWWhoTEZRcnZvU2JP?=
 =?utf-8?Q?CndH0Vrc2n6Y2qHHD2QaxorYa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e842dbe-ca43-4d93-da73-08dbce5f6e00
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:49:06.6755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6VYF32uakFmIa8W3WP0JRI5SSTWo7jMv/fbyd8Vf4KbVxux9ohl+PPKFgb2fkzqXKsy4yGpqr7cqP8vib431A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10028

On 12.10.2023 17:28, Nicola Vetrini wrote:
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -22,6 +22,14 @@ typedef signed long ssize_t;
>  
>  typedef __PTRDIFF_TYPE__ ptrdiff_t;
>  
> +/*
> + * Users of this macro are expected to pass a positive value.

Is passing 0 going to cause any issues?

> + * Eventually, this should become an unsigned quantity, but this
> + * requires fixing various uses of this macro and BITS_PER_LONG in signed
> + * contexts, such as type-safe 'min' macro uses, which give rise to build errors
> + * when the arguments have differing signedness, due to the build flags used.
> + */

I'm not convinced of the usefulness of this part of the comment.

Jan

>  #define BITS_TO_LONGS(bits) \
>      (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
>  #define DECLARE_BITMAP(name,bits) \


