Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A47476B62E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 15:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574223.899476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpjL-0008N0-V2; Tue, 01 Aug 2023 13:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574223.899476; Tue, 01 Aug 2023 13:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpjL-0008Jg-Rm; Tue, 01 Aug 2023 13:48:07 +0000
Received: by outflank-mailman (input) for mailman id 574223;
 Tue, 01 Aug 2023 13:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQpjK-0008JF-ET
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 13:48:06 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe13::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a42e769-3072-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 15:48:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9228.eurprd04.prod.outlook.com (2603:10a6:10:353::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 13:48:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 13:48:02 +0000
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
X-Inumbo-ID: 0a42e769-3072-11ee-b25c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BM+Ylq7dGahQph/Qj1AQspYBh3eb0ovcRqKNbmCC1TAWJKUfYSGpYglmARowTo5L1YYY0Qk9HuNS3zdQytT807ZiNcSQB9emyGC0PuvGlq0oj7ZvvMtd5+gOw6oguEBPCm0fL/vU2rvscxQmx/kh/lvZrTc9/7HL4+m7i8aNn0dOq0ulvkhOtwUt6fxzJ11UcDvfqYcs+KBKPDZR3H/A2tuyc/Gg39VV5fixQnpaKDae8Y7SHq7E9UYDKzacUHS0biB9uvap9pBhSOfu6GnrNuMoJAe4YpK8REKs4pWIz4H/ICLA0/WjOXgjDN4mz3CJ7alZf5FS18/b01NGSO/uvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YphD5DSyEpD09Z5GHtJ4XjWYPjpu6zR/PRBsmuYun2c=;
 b=hAIZkJEhpOCF5zMRt/V5dQk4hczHdno2eOq+2aWMZy0b90C+C36nI7foizlGKIFWxrKAfcoabIRRWR1U+iD1FlUa9O3ZJre57LYC1LyK9G21luE3ROyOkIrDbewBbmdttzN+Yu2vyZEVu8o29D2KiZ80tcd+kV7DoA8mME9gccp6XBUufLisMx/yr+CEKQZcFr8n382mT7JbqLSQGzYEb7lagKzJzUO98D/KTpnQ4Zooly7b2khCRc+PYB+1Lm5SB+rh9bYcVwhxCJDe9otaYorllnio9YHjrnQwUxiUa/Co21g3Gx1WBzHMSi+K9QUohYabzsyWhkcJSWvf8luAkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YphD5DSyEpD09Z5GHtJ4XjWYPjpu6zR/PRBsmuYun2c=;
 b=IIqkaW0PcVMAG/Fv1mtJaRqw5p3RV98L/8N/7HjLBmSLeUxzWQyBj/CzLO35hcx8BclgGSCMHBTx1Z9VY2Sx7gjP4ZwzfYm6AqIzdUH5mN6BZXM2kpQAwY2nmQkPCWB3j9/fdlTenH0/ArgBFwODTLUpescibVulHz9/G88A4fOhp6UzfOBkPgw4Kl3vNbZdTjts6N96odeDAfqUcCVjjvaBCvWLGBEFUnueFmYVYhO9whKJVidgByVnrkof+PQEHjStY1z257Daxq8sq8pa3TrWohjcS7+bAgV41GSxc9kBAReNrqhn+/m6QdRGaj+UJ9l1cFlXBZKEL3+VbIKfLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <362e0c38-c799-eb4f-af32-3827ec223129@suse.com>
Date: Tue, 1 Aug 2023 15:48:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH] x86: mechanically rename to address MISRA C:2012 Rule
 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <6c421b903cf11e4dafdb0883e0401ebc2d6cb318.1690880275.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6c421b903cf11e4dafdb0883e0401ebc2d6cb318.1690880275.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1dd6d9-cc8a-42c4-63cf-08db9295ecf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pi3oeX1jE8kPt2eXqnmr5hem9kJxAhs5WbihVv5rc4nZjuaiRbGU/I47mCmuYM9mqkLq4T87tJdwpO4W9ykZRVqwOKPuNm86b9o0RbkdM2VyktL3fowy4jYvLje7r/smaEEkKIIvkCvsRra88VqzlJoAcQSKeBJ7+XfyO/NqSxwVSZH36fxIqK8lYrtfAdo68la3Pul1+MkeQsP64m3uGiZSsppB2m4pxDrFdFD93r/ueXndmVoO8aQX9ps4rAgcGm66bOa3kTtPd0g/mX7mAafZcvDG+i6IG8mqGa6UDgmVgWhBFdxYpAPyEcDrfbPfrzSv+wcm44GXZbllnASQNNzgqnktT+NpJw53eg3gYfLOmW2PAzHYkCb1I7s0xLEYLpp06ZsdzgDybswsPBJqOrl1PgoMTp+fhAl3e0q/G9oqCH5N75slOcFobgx9eGuuSWIdmdsj/1oepkwzV5ON55FP6Nkl5BO7jlD1FpKro1rX3dAIn1AWsQuLlMucmpqPQ16DZkKTXfXqpGPgQvUQ7J3ASHkWiSea82/SDLD3FsU9jbE1+dH7nIKTOcR9GkPhDbtQWzcxce2g/MaDqz3LUXpMMfCQPwhZvf7RoPrhJcV+rk5fHWxtZSVVvPYIfF0GetwXdQrBj3rLuPPDpS383zyUQelvr+P/HoeZgj4UYR1wqYHV7NeNL9uIPlVvMOr6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199021)(8936002)(8676002)(31686004)(36756003)(6486002)(41300700001)(478600001)(2616005)(2906002)(26005)(316002)(31696002)(186003)(86362001)(6506007)(5660300002)(66899021)(7416002)(38100700002)(966005)(6512007)(54906003)(4326008)(53546011)(6916009)(66556008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3AxRUFmUGd2UnV0Q2xQTkZQV0FmU2ptRFZQTVRFamRXS2xDOVJlMC9aK1hv?=
 =?utf-8?B?MHVILzBwbU9LOU5wRkloT0MyYkJLTDVlRXFaU0tvRzZ1UTNjei93OVN0UlZ6?=
 =?utf-8?B?Vkp4b3gyYzAzcG0vbnJRZEdnZHlsbzI5Q1ZIY3cxQnA5YSszYjJxd2lPZVlv?=
 =?utf-8?B?Nk84ZGo4VmdoQXh5L2lBSjJlbFErOTB0RXhFY3c4Z1lkd0pjMWdCWHBvNS9P?=
 =?utf-8?B?Ykg1TG1MeE52TGI5bjhVajVBZ3RNbGphVU5qZ3F0RnlBdHRUUVhnOEJOUWZh?=
 =?utf-8?B?UDBMT2g3Y0ltQ2JlNmEyTlFUTjZQbTVpM1FPK2F2TnNWVHVKOEQ1SFNVNS9S?=
 =?utf-8?B?TnV0YTVJcDE3WFlqVnA3MUo4OTFkcStEN3Rqd3BrbzJtaHZzRlhGSlg0a2g3?=
 =?utf-8?B?MXdUQ0V2NjVQcUMzbGJIblc0TjdyWFdZWnZGZ1h4dThodzVjVkREN2tHZ2ZR?=
 =?utf-8?B?RzV1dW1pcFhHL09RRTlEaFlaeWd4SVhuRlZBUytobU5vVjNvRHRmVmtnMkFw?=
 =?utf-8?B?aHdiS1p1MmtvMkQ0SE93ZFFaSm9wZ2x2SHlnR2pLN3Z5d09qWGdIaFRuMHZ6?=
 =?utf-8?B?RjFxU0M2SmMrMEhMaUNQNlc1TVJwRzFuRXd5MFd4ci9VME1KbXl4bjVjUDRX?=
 =?utf-8?B?cmltL3lHZHlOazR3d1lqZjhqVXRScWJTbENPdVQrMHVZdFJyTW40dXcyZlFF?=
 =?utf-8?B?VjhMRzh1VUpCMFJlbERwMmJFMWdUQ1dLSzlCdFdDTEJ3dXNXQXJLOWpUOXNn?=
 =?utf-8?B?elVtOGFFVVBWcE1EWFJVWTBKWmtoNHR5M2J0NzVpdy91bk1zN0VCcWszWnhO?=
 =?utf-8?B?bUtGdFNDMlp2cm1IOHhGMDZJODhKZWt0MGVBU2xYL0NvQnVpZjlKd0hJdzA2?=
 =?utf-8?B?dEFFKzFLdWorS0VxbFdTS0xYV1lueXBxamg1Q2FsYTR0OVI5enJKN1AwbHNj?=
 =?utf-8?B?R3JGM0xlU1JjS0NtMm9rTGVZQzJzUmRybXBVZDV1TkZpMlpRdTQ5cklnYktB?=
 =?utf-8?B?STBDQU84TURtbmNsek53L3hsZzhRVXNwdFhDall3YmFrWnVVWURZdWJZMjUr?=
 =?utf-8?B?ckIvSFVXeDNjWHdsWlBldzB0MFZ4UjZEc21seTlxY3dWYVBOazREMVBFL09D?=
 =?utf-8?B?bnc4M3Zrd0Z3K2JHaXVxVWxkU2hyZVBqMzA2N2w1OHY0U0QyMFhhb3VLbFVJ?=
 =?utf-8?B?OVZvWDV5a21ialdCeWFtbm5GOHRab2VMVjNKZkRONnJERmNwcjRZc0NqdTNL?=
 =?utf-8?B?VEdqT3FxVXQ0aHhjdlZNVHdWN2l5NVlwZFBQYVp2QnhldlcxbUswNGZQV1ZT?=
 =?utf-8?B?QktaRUYzR3RBZGJrRlViTHNkaktzSFM0b2ZmdTd2WG9NK3NNUVNBdWdoQU9I?=
 =?utf-8?B?UERyOGZZd2JiQWxhYXVBMHBKVmk0WWxObHdScWdrVjFPeXN2ZEZERUZBN09R?=
 =?utf-8?B?RWgrY2NPNlZFUzVFNWY4Rm1CbHBCL21FbC9rQTZrUXlCdk1XY1krSStGT29p?=
 =?utf-8?B?c0hlT293R1ZybW13K0h4UWY3cU1VVHV2ckJkekoyRU9NaTREb1VMOHMxd1pK?=
 =?utf-8?B?cWc0VDZUWWNpTDA1R0tiYWMvRE0zS2lSZ3FWQnlIZnRzMmxIVW1nYk5aeFN2?=
 =?utf-8?B?aDdoa1FtZVAzamdPVVkvMlk5ekNadDRXSTZwRE9ta25zVUFNUUY0Sm5pT0pt?=
 =?utf-8?B?RXVEcnZ2c24zdVRLRkMzWW5iZnlwZVZLQmVnTTFYZjlpdFh6UndqMzNjNmNu?=
 =?utf-8?B?QTBKdEFHV2JmWW5BSVR2OTB5Nm05N3NZQmZpSzZqL3FZSFN4ZTZ2ZTRYWEFM?=
 =?utf-8?B?aXlYWlhsdFUwMHdsb0VmZUdudUg5T3hCbm1uSk5ONTBCSmoxNFlrbHlYV2JD?=
 =?utf-8?B?RlJDWW0rV0Jjam1vb0txZ081NFU0TER2RHZiU2NvU3lsOE9wWDBEbDQ5VVJE?=
 =?utf-8?B?clExa2didmpVVXhibmhXWUlPRVNnQjQ1QWtVYmdZeHJ1SVA5Z2ZBS2JNOFZB?=
 =?utf-8?B?dW4yY09nTG9pMkxwR3pRVHFtQWkzNFhmQjR3T0tzTEw4b1pESy9PdEpnTG01?=
 =?utf-8?B?VnZMcThMeDF3SkpoS0VvY0ovUWlSL0dHS2pPMStsdTRacTQ1SDUvVk9TcXEz?=
 =?utf-8?Q?Vrl2W+MJe7fSXvaSHs/LP3h6G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1dd6d9-cc8a-42c4-63cf-08db9295ecf6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 13:48:02.7441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hlRarVgODUGUWZKV7oU+G62MWXqkv2CpTT8gZwBSHuw1LrZ6PN76n+DYGD72CSa6nSp4nCJm8PQejE8/ejz5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9228

On 01.08.2023 10:58, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The renames done by this patch avoid shadowing from happening.
> They are as follows:
> - s/socket_info/sock_info/ in 'do_write_psr_msrs'
> 
> The parameter 'cpu_khz' that causes a violation in 'pit_init'
> is unused, and hence can be removed.
> 
> Parameter 'debug_stack_lines' in 'compat_show_guest_stack' is removed,
> since the shadowed static variable has the same purpose.
> 
> The declaration of 'init_e820' is renamed to be consistent with its
> definition.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> This patch is the non-controversial part of patch 1/4 from series
> https://lore.kernel.org/xen-devel/cover.1690788513.git.nicola.vetrini@bugseng.com/
> The other part has been dealt with with a patch from Jan Beulich
> (not yet committed at the time of writing)
> https://lore.kernel.org/xen-devel/e9035197-b329-af2e-65ed-af31cd0375c2@suse.com/

(Just) naming this v2 (or whichever version would have come next) would
have been nice.

Jan

