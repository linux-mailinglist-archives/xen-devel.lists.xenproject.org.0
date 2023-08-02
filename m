Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC72676CE6D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 15:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574932.900563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRBoI-0004bx-Ci; Wed, 02 Aug 2023 13:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574932.900563; Wed, 02 Aug 2023 13:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRBoI-0004ZB-9q; Wed, 02 Aug 2023 13:22:42 +0000
Received: by outflank-mailman (input) for mailman id 574932;
 Wed, 02 Aug 2023 13:22:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRBoH-0004Z5-F0
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 13:22:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6c8ee88-3137-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 15:22:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 13:22:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 13:22:36 +0000
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
X-Inumbo-ID: a6c8ee88-3137-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jm1YgyxlQXaBelA7xtGyiHhb5UasncN8CiQYoyH+w6pPh7NvHsj0m5FlQGGKimlTWiszdV3d7OeI9xcr3yoBwHoljLyuTSTIwZCfsAdgm65cdSADIi7a3oM5liIOPh+MJM80zI/5CGoT+yuG6K22rThSa+6Mh2iQL9jjZ68/1FVsWXo91UgsvRahMq3O93dzGVxXE3J/jaqj8TLl7Az8CpKy7zjD3TbUZw3XckrYybBmB2Nx3MoO7UMrbCY9MNzXh95tnhB32acTcMD4SP/Qbw6o8vMKraX2DJYIExzlCR1w9ERf3NHM2QHJNKgUiyvQUIueL7dss+YXOgkUhNyy8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbmkM94i4Y6Kbqbs5bDYN11RQAXqd8uCacxrc9BCgyM=;
 b=OEQ5FCdm1TZkUyQ/NLvgg2EJzIzN1GK+Q0stU7tcqaRLIB5XmMmR3ZPas8Vm6y36X1AOBQccoRmvvsqZ5qfqDIKNmzziuP1xnNiRNbK45yJ1CTlkf478gW15+U0bFFSb8d05rIPx7OQgvPwD+Uua1LxS37jMJn55OLLHfE4CUlJ9eDZAUkZ1rby5XseAX7FlTsZL8AoXhQQnIrxsPEHKpHh7YMXjTyqUACLawo+5TL7eu7wUipGSUKuQ6XAHtU/HJX+cSoxGz/NJItHhie2tu1vsx/UirjO4Lp+ISigWYyaPTsQfXylzO0KBCTaSVGsx2bgLNmPyf8TtIYfHwLdzrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbmkM94i4Y6Kbqbs5bDYN11RQAXqd8uCacxrc9BCgyM=;
 b=2j7b4uhw0gPzdn34tbymYTzSEPFMlSgf0/qjRL5CV72zlEsGHGQpFbJz5SvESSLkG1zZ0unBQvrmPvPqF82cHiq4OtnO9dpV62xZGtzPQ8EJk29fDPavC20wJvaqiWWIDnDQvfBZdaCBK036ba4nW8vs81qBHkOVpNDR7rVmayfrnlnlBwQnOYrHdb4qbXbbMxObcXLFK2EEsVlCpP1FQMB04ahR5hY7Qi9hxG22lLNtEUOxQcTJuIvRJf+ZmLCPxK3YGw1GaavCNkbD/AhsLqgdG8MtBQ7wKfQk//0qLuVDJ66Vir9w5lxPIRRWJC04re6bnl26o+8Ho/Tpw2t4MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b7ad0800-4808-d18b-2278-d4d4812c8d46@suse.com>
Date: Wed, 2 Aug 2023 15:22:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2] x86/gen-cpuid: Avoid violations of Misra rule 1.3
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230802131003.166670-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230802131003.166670-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: d188a132-a21e-4ef2-e077-08db935b8949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H5utEMK/HmmPYZbUuZJXoGU6S8xqzBn+7z7F/w8sRlacO39zIrO7EnpN5MzlYsZcB86m8iyUcqtfuKj62ipqN4Ve9qIjEhBRadFvsGSZO7I+TsALZDT2kF+iacS2IR+UON1GCuGWwJ5r/xOc735xxWrDhm5Ky7rGsIdDrbNcEld9BdFsajW0PE3vl+UfNLUGHsyKCkeg/kF1xvhW8O1IsiHXSXc1BhQ99/lRN9EKHUm6EJjHKZ9nabW4hxxhgxf1FpcP0EDJ0IBmMPoWtvEMdLWoLaKJs2oAyRMfYTyQnPs6nY0gs0LkNm+BZWhBDDH8Nh9wvCMx/6XE0TRbzxZ8x3Mw2ljeZlIVolDNRZ4Rt5CJhYam53MffphV/phk2dW3I5ZLVS3xi9FikfsmVmYLJBVQ6FcerXTkk4g31VjmP9CZN+SM9JFWFH409y/0zjKfal9aYg7qp5GpjCYWOlSR4NaJoYAsuIdMdU/NofhsFePno5Fx7GSvAdLTCMopY3+KSJm/ZOBYHH0ERVgBhDZ+eqntuRrG031aozm2OrKXePcc8Hx4RGVPOccOnqtGsUKKi0AnW7vuH5sjkT4dh+78Qm8TKvZ9uvamddjfAXMS8oLpvveUORWG0ypJVLoAgG8qDU4WtumVSzI2HNR30Fm7HA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199021)(31686004)(2616005)(26005)(6506007)(36756003)(38100700002)(54906003)(186003)(53546011)(2906002)(6486002)(478600001)(8676002)(8936002)(5660300002)(86362001)(6666004)(31696002)(66946007)(66556008)(6916009)(4326008)(66476007)(41300700001)(316002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkFGamtzazdqQW5ocHJvR1AyYzZMaU9yc2xhakNoYzA2SE5IOC93eGZXRFBH?=
 =?utf-8?B?MjN2Mk5ZNEhEY1lzZ3hTNTZVM0Zwb3B1VHM0UlV4dVA3azV1V0RFVHk3LzhD?=
 =?utf-8?B?dFNZVHFQeGxGYXhSWlZoaVZqa0dUOWpwL0J5Yy9MdlR1dGxxTVVseE9FMDRx?=
 =?utf-8?B?RGcrWElsZGE4NzdyWGFUd0VVTkdhSENiNE9iazZhcUgwY1lWcDYvYVk5eURi?=
 =?utf-8?B?b1dLRUxsYXlkUDgzSkp1R01WRk90RURGM3RxMDV2K0tTd0FabUVyYXZNWm1n?=
 =?utf-8?B?dkFmM3VHRGtqUDFNbVFxaG9qVFdJUWhzMjBOcnV2cTFqZnF0WDBOcVBqRnhF?=
 =?utf-8?B?NzNTYmdzS0xXeU91OWFYUjhFbWpPSzlKUEUxSlM4UFNCUStUUlpoQUxUOU01?=
 =?utf-8?B?Q0ZQWm5mRThMYjNGRDV0Q0lmR01aOVc0eFFWY2JaZm1EbWhDZ0I2UWI3WVdr?=
 =?utf-8?B?bFl3L2NyU0RZWkE5REN6OUsxUzBrU3hBTEZ0RHdpSjBGN3A3bW0yUlVZK0k2?=
 =?utf-8?B?S2JVUW9LQVJrN1VETWpHYUJDdXpvczB4YnhuMGV6MHhQT3AwUFNRV2xsWVhW?=
 =?utf-8?B?WDNqWDZjemxneVNaQ2kxdzl0V25sdVZVM1d2ZXVmeHNHS3N1b1dTZDhvYzNx?=
 =?utf-8?B?THYvTGhWYzIvOUF0NGR5dEY1ejZLTVp5cTJDTUh0cWs4aTV1MnFWMjVVVXQ3?=
 =?utf-8?B?RTB2TGFqS3JsSHFnQkNQa2VMdXQ4LzZPcWNrdi9YRTJjM3RRSlZiV3I0L29O?=
 =?utf-8?B?UngzNEJ4ZDZydGZldHFLdXplbW5JSkt5UkxXYkV3S0c5NjA5akZ4ZGxXMSs5?=
 =?utf-8?B?eXJmTm4wMElZenVPQ2ZjWnhBYUJHbWVEVFpaNnhTbDdCSWtVZHFkdm5iZ1BO?=
 =?utf-8?B?dS8vS2ovMzExZXNYWHdOakdNMTZTNU93M01taDNZdnNJYkJFZkhEcEV5RkEx?=
 =?utf-8?B?VUlOWTkybS8yUE8wT1MxSkNxU3lqUitoVGtEMUZkcXVPK2hWamlYMFBYVVpy?=
 =?utf-8?B?QXNobXRLUXNGcGowZHliUm16c1JFV2RrQTdLdGpqeitxenJKb3hEUG1aeG5q?=
 =?utf-8?B?dVFNeStlUVY3NHRXYkR4OFFpNnNzT3UzbEoybGpzR0pSWGtkTDM2Ukk4ZjNr?=
 =?utf-8?B?WXZMUDNicXpTd2g4VVJHVmJOcnlYbVQ4T0hNam9lUWcwQW04Y21CV1czS2JU?=
 =?utf-8?B?cURvVkxUSWxYVHdjSG82YVBIMWRsa1VhZVNrT1h3Y3dpTjkvdURwd1NHWXdy?=
 =?utf-8?B?VUVjUzRWd0tmRThQd25xSTEvUGtKZE9zd0EvaWNvdzVYMkJqemthWkxqVWw3?=
 =?utf-8?B?cjFpU0g4MjdxYzhwdGkrRk5TOFIrbGFFTnZXdThYRTdQclpJSDFZaWJIMmN6?=
 =?utf-8?B?WXJEcFBNY05WWUFpcjc5MlJJMVNlc09MU3JhU3RFVGRWMUpQQXQ2M08vWmlt?=
 =?utf-8?B?OThHc2ZsV2VDczlZdnRUNHkwcFZtK1JScVdCSGN3azJHL3dPR1V4ZTNMZ3Yw?=
 =?utf-8?B?OUJISG1vbXZ4T0xpOURacDZ6SkdtNk1BS1doNlBwblBSU0NJZHRWWmt3ZjVt?=
 =?utf-8?B?dldoNCtNcllsTFYxVk5JeTVCb0RkQ1Z3cHYrcVJnYitmNFNsOUl4bHBwRVhC?=
 =?utf-8?B?VGd1YXVGY0t2emJhRFRqOGRlWUdQVWs1d2wyYnNqOEFhb2M0VDZ4STBxRDhw?=
 =?utf-8?B?Q0hydDlpM0dGS1dPWmJsYTRxNXp5dHRIWkcrZFNPVVNUejl1T2Q3cnFxVDha?=
 =?utf-8?B?cGI0dG1YeHVEVnhlRWltVkNYOGdXRXJwNWpvODJ4a2dLV2R1R1R0WjU4MTlj?=
 =?utf-8?B?czg5ZlBhcUxwR1djbGlEYTJYa0FhQ05PWktYVVNSbXhDQ2NsdWhMUjc5ZXNN?=
 =?utf-8?B?ckdxWFhWZk5lRHNDQVgwb1N2NEZDZFcxUGljc1lkY2RZNHhvTDU3Sm44a0kx?=
 =?utf-8?B?OVNuYTJXSG0rVUI0dVpvMTdjWHVONGNUeVZVZFhRTXp4L1F6dXc2MmhsOHN1?=
 =?utf-8?B?MW9iai80Nmd4cWJHYzZud01NVWZoSE5HSk5rajQ2dVRMTmZ4UHM0R2I0Q3pu?=
 =?utf-8?B?U280dG5kanB4a21jbEp1MEx0alhVczE5QkxscXZzTDFBL1JMdGZheXhHbUhp?=
 =?utf-8?Q?O5q2pQTddnsTiJ9KzaBZopfnz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d188a132-a21e-4ef2-e077-08db935b8949
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 13:22:35.9250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PzAywFGCymx+FQnf9RH+zrtonP2pGQ1xA4fZNjvsZbM+umHb52JCuyZDp1+qdiWOC5CoVIApr48GFMhjWviMRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142

On 02.08.2023 15:10, Andrew Cooper wrote:
> Add the script to the X86 section in ./MAINTAINERS.
> 
> Structures or unions without any named members aren't liked by Misra
> (nor the C standard). Avoid emitting such for leaves without any known
> bits.
> 
> The placeholders are affected similarly, but are only visible to MISRA in the
> middle of a patch series adding a new leaf.  The absence of a name was
> intentional as these defines need to not duplicate names.
> 
> As that's not deemed acceptable any more, move placeholder processing into the
> main loop and append the the word number to generate unique names.
> 
>   $ diff cpuid-autogen-{before,after}.h
>   @@ -1034,7 +1034,7 @@
>        bool intel_psfd:1, ipred_ctrl:1, rrsba_ctrl:1, ddp_ctrl:1,     ...
> 
>    #define CPUID_BITFIELD_14 \
>   -    bool :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1,   ...
>   +    uint32_t _placeholder_14
> 
>    #define CPUID_BITFIELD_15 \
>        bool :1, :1, :1, :1, avx_vnni_int8:1, avx_ne_convert:1, :1,    ...
>   @@ -1043,19 +1043,19 @@
>        bool rdcl_no:1, eibrs:1, rsba:1, skip_l1dfl:1, intel_ssb_no:1, ...
> 
>    #define CPUID_BITFIELD_17 \
>   -    bool :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1,   ...
>   +    uint32_t _placeholder_17
> 
>    #define CPUID_BITFIELD_18 \
>   -    uint32_t :32 /* placeholder */
>   +    uint32_t _placeholder_18
> 
>    #define CPUID_BITFIELD_19 \
>   -    uint32_t :32 /* placeholder */
>   +    uint32_t _placeholder_19
> 
>    #define CPUID_BITFIELD_20 \
>   -    uint32_t :32 /* placeholder */
>   +    uint32_t _placeholder_20
> 
>    #define CPUID_BITFIELD_21 \
>   -    uint32_t :32 /* placeholder */
>   +    uint32_t _placeholder_21
> 
>    #endif /* __XEN_X86__FEATURESET_DATA__ */
> 
> No functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one question below.

> v2:
>  * Write it more pythonically.

Yeah, you know I don't speak Python very well. I was glad I got it to
work without overly much hassle.

> @@ -382,7 +382,10 @@ def crunch_numbers(state):
>  
>              names.append(name.lower())
>  
> -        state.bitfields.append("bool " + ":1, ".join(names) + ":1")
> +        if any(names):
> +            state.bitfields.append("bool " + ":1, ".join(names) + ":1")
> +        else:
> +            state.bitfields.append("uint32_t _placeholder_%s" % (word, ))

I thought % could be used here, but then I wouldn't have known to use
%s (elsewhere we use %u), nor to add an empty argument (which I see
is done in a few other places as well, but not uniformly when %s is
used). I assume there's a reason for the specific way you've done it
here?

Jan

