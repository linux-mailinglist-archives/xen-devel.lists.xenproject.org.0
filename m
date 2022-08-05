Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF4B58A9B5
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 12:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381047.615546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJuvZ-0004Gn-94; Fri, 05 Aug 2022 10:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381047.615546; Fri, 05 Aug 2022 10:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJuvZ-0004Dr-5e; Fri, 05 Aug 2022 10:51:37 +0000
Received: by outflank-mailman (input) for mailman id 381047;
 Fri, 05 Aug 2022 10:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s4Nu=YJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJuvX-0004Dj-9X
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 10:51:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91dcff74-14ac-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 12:51:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9005.eurprd04.prod.outlook.com (2603:10a6:102:210::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Fri, 5 Aug
 2022 10:51:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 10:51:32 +0000
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
X-Inumbo-ID: 91dcff74-14ac-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/zM3OuBo6CNDapcU2hHiqpfiTjfNxDs/K11ik8qWcrQgvnbrrLnvqab7GojL2YHxv8h7onNjPIYdSHZySSadB/cPfTWLY4Xgq2ABs/4UP/dTDmo1nise34G8PDAVN1G9WCGPtPzIJIvYOP8/uhqTiQu/fO+T46vUyBk9lc5f4vclHsFnpGnBSvZ0pZPw/91GO8ltmYW6x7YfqgMCjoAiFBeRIfHdQ+59thxQLfOHwOnvmFRkeh500gQVqDzl4mbuvEMQRvX/sufqMMnVHJi9rI6YgTzgRHcx0CRLSerIhDB90xZfM5gk+7ET/18fKEX26oPEYxGHTP41NRQUtBO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocQwyIDVrCzLEs4NdDWQT1Voiibm6xPg9LD3hDeZZjk=;
 b=mVTuZlcplhYUgTc0wdGDn5v7XPw4zLjFk1cBg2z7Z+wGovO62nMXG/tgjmctJ3+chlx8o0Hs+5zAoWuCHzJJ80+0YDzIXqLlMzAs/c6H8z2GoKcldo7pu0S60uAArKUwkH56worpGDVZ+lvBNfeQJEAx+8FyFmtke364Aclgjz5cyQjmKRHxhcxirJskPQ0mWMCt1yFZO13bEGOyicAL/eYkwLo1peh3e+mxwAu3fAkfN5qaQXiU/7TwfA1XgWoi+IpPd6Ez8qWJ0tdg9Q6l1mhy1mfFo5K/gjzSod0yLAapVb0i8uqmiXsd8mb930TpWfLw5jSoXDfGn1gvZJpaag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocQwyIDVrCzLEs4NdDWQT1Voiibm6xPg9LD3hDeZZjk=;
 b=cvbtItnBqhA0Ia1eowSCRq0fpuhyLyJigFj14Tus6CqK/ZARt/ML2U3gaoRrOMKGcfERIfWACdYDNC77cVtcSFTxWK7bKkZZ7v6FKUZ2dG8mXc5G5I7YNSNGqCYPMlkRnRI3xiemTMoe00sj08kLApm+BkwMdJM8WuCqjfc4THJBUyv+b3VytY3lKe9DYcZKCodz7YdKzoJGlIvkVLunXrwykwGfKyCjrET/nFxgpFcP2Esm622dawcqT7LOxfEZPasyaksCzXRH4ec5kaS/oK2/5Vd/4ySCIcNUHGkYtI24dgSQJDhkuYCoo33HD5N50QT+w7Edj+sgIexStNYZSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd835582-a9e5-f756-8a08-148ae4d46983@suse.com>
Date: Fri, 5 Aug 2022 12:51:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/wait: Describe RSB safety
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220805103840.23796-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220805103840.23796-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d5876a3-d54c-4598-9dfa-08da76d07548
X-MS-TrafficTypeDiagnostic: PAXPR04MB9005:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P63N4GEoNLaU3w+RaJ9FiUtx2WOlDudROBYy9p+C9YMeJtBHoDMWwn70nPC9FINeHeqn9NYjKcaPttQ/4BVx/VkYgUSaUYHTGsVmlZzUFtRgZR6z7Ymn2WRlJS5USXKfVarx0PhSUYE88NL+GSCYsH/klnyNKCwz5OpqX5uQ1+MpzmdNTLptMxcaGfb0O/grjmE2lhUamPBPnLz8eA/F2mS88sBHfNyD1Ydb9Ng7iZ6b9SdT25BqIZubZu9k/6zBfeO4U9XE8/sTUcCGAizcXX7tGzdQrRNYwzjsi0W27401qSjMR4ehMgdCAvwCuN/y6aPTfiHSN3SDzFrtCISqMin5KUPl0sD/clJuGr4iDGNG/S4jYOlb1VjhGMGyvGW13/1NDwW1t3gQ6STytmEG7mAKnZZssiGKFAtB7gbV+f+2pesc+y1V8hl5vkjJ/2TFWoduuZvqdWURR638ZmRBlKHfWxrElVM73PksgYWeqZLbL+3afdmiqpD+Dix0SS7qjDcQxqPKykOKdo/Anktsafpg+dF13RlqRNiWESGSKUWNbCPmgT3twJOM/S+fuqivBui/hCkvod0O/rX6kiHTudxiAEF9TPWlpuk02Mb0PlS7mn3wu26Zze48MS58Mb6t8JGXIdqducd/DorRbpmh9YfGxfnW/GandUOFPCLXgUetXOKboKiOLHO4/VwcyTteSg/Hw1OmNziwO9Mg6IXwYEXhMp2orOOMd1llG3amvnu7Q3XRz/N75wtEBL1do57Cja73gx8Vz7btdlYgrl04K5EKoSeV5GdTW9ZUNhFR2B8PIk1rFeSc+CbGYNa652nva/0InkPxpobCGTiHifRnOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(346002)(396003)(39860400002)(136003)(53546011)(26005)(6506007)(186003)(2906002)(6512007)(2616005)(83380400001)(38100700002)(8936002)(8676002)(5660300002)(4326008)(66556008)(66946007)(66476007)(6486002)(41300700001)(31686004)(478600001)(86362001)(54906003)(6916009)(316002)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1ErWU5qeHQ5N0pub0p5YjhZVGprUGxmbWp3MERyaVdkUVNGOWxCQi9TMHkr?=
 =?utf-8?B?emV6NUQ1amtZMHA5MkVGK0N3V0NscnJuSlQwL2RFdWpRcmlCK1VSekZXQUVP?=
 =?utf-8?B?ZmpMNVlmVmFHZENOUmZQcHVvZDNnMU80RFdnYjhSOTJCVXBGdkNaTXBlbldT?=
 =?utf-8?B?Z2lqT3gvZU93c09halpDZTIxekJnQ3NUSlVhaWxwZThZcjU1cFphQW81OWc3?=
 =?utf-8?B?aDdLSytkZ3QzbHZsOVZNbjNRM291QjAvaDBQZmNka04relNISWR0RUZ3cjRy?=
 =?utf-8?B?Z01jQ3Zsd2ZUQTNpSXpobHI0c0Y3cFoxQUxROTA0UDRYTVYrQ0k0bHUrU3d4?=
 =?utf-8?B?aWZydHZpaEJYVkFMM3FiYk9IUkRUdGxrNXpsa1prNHpRN2xRS3ZKanpoNEFL?=
 =?utf-8?B?eXhLUXdMR3RjVlJwdTViU0ZUa3Zxa2daTXdHbFdRQ0c0UUV1d2h1WVg0L0pK?=
 =?utf-8?B?clMwcWg2WFZLY0lLYzIzNmZHbVdleXdrZnp4TFJBTU1vTHhrS3IwM0RJdEpx?=
 =?utf-8?B?OVdBa1YzWU5UMGlJSGM0dkpPQVA4RFJXeDFIQWQyWTR1YUJiVGkwb09mRUEv?=
 =?utf-8?B?VTg3czNqcmZnM3Y4WFdJd3ZiUGI3enhKcHZrMng4ZWcwbGtJbDNwcThHVGFL?=
 =?utf-8?B?THNGYkxFS0pQQng3Yi82QlJwWll1TEhGdWw1YkVQdmlJVE1vMnY4ZGVnYUxF?=
 =?utf-8?B?RUZBTTR0cm9HbUhsRU02MXVzcml4ZENBOGNES0V1RkoyYmRyZUxtRUtyM2tO?=
 =?utf-8?B?RHNCNG51V2M1ZHcrMjdDZUFKT3FZYnFOd25VMVZBdjdlZ0JCMTEweTdWOFgz?=
 =?utf-8?B?Y1F0RTBaVldITGlZVnVMa1ZGdkNoS2xEazVDelVJTTZXcXJCekhMUFh5OVc5?=
 =?utf-8?B?ZEs3c21PTEI1dXY4eGlxOStXeUd5YnFqTnBwQ25jdVpjOEE2bnJHdCtPdXIz?=
 =?utf-8?B?Mmd6ZjVCTVRoZFBSK28xY0ZPeXJrRXorSDhraGVtb1lvVm4rNklaanY4cnFh?=
 =?utf-8?B?UXpmb01QTDl2N0htbE94TW5RQmRQQW5wWklsaWt1U21MYzJtZzRJVzJEcnBV?=
 =?utf-8?B?VDE5b3VkNFVkcDVjVVFRRk1LbjNONElPU3M5LzJsLzJVRnI4cnFBMHRpTFRv?=
 =?utf-8?B?S252TUF6ZWJNQlVKOWFDeFR1S1p6bHJ1dndHRzUxZnYzYklXcEFvb09MOTlH?=
 =?utf-8?B?N3J2R1Vod3RUZUhrbHNIelRoWWhyQWdydUdXMTdoc2UwelJXdlcvWFY2Qmox?=
 =?utf-8?B?VmNnaitqRlFobmRyVld1WGVwS0k3MVAvNldSRlUyWWxhUUNqSmYxV1JBcUE3?=
 =?utf-8?B?Zmlha1hkcFR3SjM3NkVWQmt1aVN1UW1VVFk1M0M4TlBUTGkvWmNCL2pkVjRq?=
 =?utf-8?B?aGV1QkxWMzF4Q0EyM2l3M3EyaXFVUHRZTUxrSzlISWpWR09SR2JaVmpDK3Ns?=
 =?utf-8?B?Z0hPRDNJdThnbEtBMFpQNmVNeS9hcXBnK3YvZVNFUytiMlg0Z1VXTDhwZ1FZ?=
 =?utf-8?B?NTc3V2QrSjlWai9OdGNsR1VFSEdTb2lZSkZhLzVmRDNSanhSV1dud3VGeG5q?=
 =?utf-8?B?ekZkdnV0ZFpqLzBGYWdUZHd0V0JJWkhZYnBnVlhCcnhpZkVjbHVKNGl3OHQz?=
 =?utf-8?B?RFYwM1hXSUNRNlE1OTFhMFdxcE81Y2NGa2hUaUJJb1dTYjYxSUNMSnROV3JT?=
 =?utf-8?B?cGsrM2JRdm5uZW1wbUxWNDFRR0srZnp2NVdINEtqQ1g5SzFCOXIyeVlMMWlF?=
 =?utf-8?B?NzJrY3hlUW1kaVZZTzhUUkovc3NvdEhpTS9QY2dDOXZlbFl4OXJMZVRHb3Bw?=
 =?utf-8?B?VzZ1ZGJUa3JUMVppaDQ2L3pUSXp2eDBDeE16eGxSZ0lINExRemVsLzBXTFdW?=
 =?utf-8?B?MTZZcUdYaUNDZGZnZFZydHd2dTY1eGMwWmhNT2RORlJUTlpLZ25XMU5FZzlZ?=
 =?utf-8?B?WFhJeElhUzJ2ZEhhUGM4QXpNbytHbGhVVWE3a3JHZVlhMGJHT3BRa3ZrRWZ1?=
 =?utf-8?B?WDVCZ2FObHlZUkdRR2NqYkN6dTE2WTJZOU44Sy8rNVA2a3pDNTFqNTZPamdv?=
 =?utf-8?B?S0haT1JCanAxSHBaL2ZIZUdWUE1lOUVuUXVacUJFR0pZVkJiUVAxTXFtYVdq?=
 =?utf-8?Q?Wa3deQMuxaepzPO16Z1vmCEgy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5876a3-d54c-4598-9dfa-08da76d07548
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 10:51:32.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwy6NqBN96GVCC4H7w4TVr033fkDFeeVqY/b5pn6slI2RtqWbd2pEUdXfYhOHDnLoRdRHmWCRM7HJb7a3B8DLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9005

On 05.08.2022 12:38, Andrew Cooper wrote:
> It turns out that we do in fact have RSB safety here, but not for obvious
> reasons.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> --- a/xen/common/wait.c
> +++ b/xen/common/wait.c
> @@ -210,6 +210,26 @@ void check_wakeup_from_wait(void)
>      }
>  
>      /*
> +     * We are about to jump into a deeper call tree.  In principle, this risks
> +     * executing more RET than CALL instructions, and underflowing the RSB.
> +     *
> +     * However, we are pinned to the same CPU as previously.  Therefore,
> +     * either:
> +     *
> +     *   1) We've scheduled another vCPU in the meantime, and the context
> +     *      switch path has (by default) issued IPBP which flushes the RSB, or

... IBPB used here and ...

> +     *   2) We're still in the same context.  Returning back to the deeper
> +     *      call tree is resuming the execution path we left, and remains
> +     *      balanced as far as that logic is concerned.
> +     *
> +     *      In fact, the path though the scheduler will execute more CALL than

... (nit) "through" used here.

> +     *      RET instructions, making the RSB unbalanced in the safe direction.
> +     *
> +     * Therefore, no actions are necessary here to maintain RSB safety.
> +     */
> +
> +    /*
>       * Hand-rolled longjmp().
>       *
>       * check_wakeup_from_wait() is always called with a shallow stack,


