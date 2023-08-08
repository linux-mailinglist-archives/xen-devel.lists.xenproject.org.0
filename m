Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112AD773A5A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579836.907987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMRX-00005M-SA; Tue, 08 Aug 2023 13:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579836.907987; Tue, 08 Aug 2023 13:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMRX-0008Uf-PQ; Tue, 08 Aug 2023 13:08:11 +0000
Received: by outflank-mailman (input) for mailman id 579836;
 Tue, 08 Aug 2023 13:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTMRW-0008UT-Js
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:08:10 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe13::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e837b5f-35ec-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 15:08:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 13:08:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 13:08:06 +0000
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
X-Inumbo-ID: 9e837b5f-35ec-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+1EgTAUNRTc+bj2jM9VqjhwKR+ImArCw3XnHBM/aTbJlrkEKDoCKOXXAsYtiXxyqqRCqNR7zVNjc8cPXgtmWrw2IJkWfP9urGSqd4pAlJ5nXMd1Rv6qE1oqMmOy8ln2Ej3VZQmc64seDkCUEYyPsXIuoPsWZjdthxlpMRkopQPKvzALlnmWmRXxt4+sGv1ndXBTLu50zQ0DxlnL2tNB/xczfRE1yQpy2ZfLQZktLyMr/avFBvazOSjk1L/YEV+pduljaLy7s9dMEYmeeH5kK+FIgMV++N+Smseg/Xyt3zUXu821uCjnHTyZtxQh8WhYHIQwNMmUKvuVuR8DTakgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0t1G/E/XXCvKHnnjq9IYybPQRG3YkpdsFkUeUcddnQ8=;
 b=OTKsWTn1i2iYvsrKsfLrW0Dyyo1jx5KApI/9QJ929s6cJCGRt2UqvEvHUQIAqq7uRuK5hTb7dhLE5RhbwlXqrSph0ueSPri7U3QD40HT3DM5ErrUD25oq+VEc/zk1IysJ/ZBZbajLMGeVvjlA1S6xkgY4SiYCHGt7WVZX6v+9T+q6gLaF60dutx8YD+2shm5VtpEqRVq9fMQRgfy3syFm53o/4JBLquIRaxmj7ziIXGsfbV6vjmCNeUaVIfWd++jjyS60So594Xu01SMFIIrqFmzGvXEb9QJs292cJJcgaUq5maZAtzY2iUkjfxnlr5Mfd0+/LRpF8bz+kNKckyT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0t1G/E/XXCvKHnnjq9IYybPQRG3YkpdsFkUeUcddnQ8=;
 b=urjD4QYxQO4+XZRb3WKsCNLHfsVe1hEfjIl9R9YucLk5OZW91hk46UvbarwlZ0b0rnJuq8O368f+aTJ/NspGbNgeVQSI8HMlE7mo0UNJnYdtWI47RNfzW/Qci4eviOPSDHFWboBoL6do1Bamed6uW12N0TWPbyQ5FyfNFpyEVkfoxqvv11uCJWdFx47CaqAc8UIkT0R/yqrhl9hnV40RrB5X79J999fXK0hHinFfA0MhZCX2NDURKLKvP8vR+ZmZE5+YvfroHebUYwfJ9RZffSQ/r2D4nx8iwnbcHpIXLFfCtGqJl+pjALEzJYjrkOsStgPPxSwy8URu80rnRRdoLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <efee9d93-e1d8-6606-0e97-3f63ecefc8be@suse.com>
Date: Tue, 8 Aug 2023 15:08:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v7 1/3] x86/microcode: Ignore microcode loading interface
 for revision = -1
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230808130331.27995-1-alejandro.vallejo@cloud.com>
 <20230808130331.27995-2-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230808130331.27995-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: a32d1c58-0c94-4a38-0ebb-08db9810819b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T3z07wh7t4WnZnow5sNrj3fAq7xKQIobJob8ydyPHtVpOVILdUCmCYryZmkeuUuKNseTpi6Vza3e8qBVgSzn0K1AegJq+ChtFYmNVQg/IaL8+1ZzU0f+l5LoIiFyhwfVxY22e1skmJj+NV3xdAWd/2MyZAqFUqjZcbuwULNy4WoMlowf4dTz0pRkBaU6oD/O+nKr2Ew12S0Mr5L90S2yHfa4e0rvnJlMjBbnGCvtGyDMsZ3BgTawwF9Asb+SgLTzvRBv6VNWqiuCBhDSDXqQvSaM5Qiwh5RUuf/BYYzFIx5rQR4AJlIAQ7kDE2ZiM+ba/rrf0eCc34QAN9thY4NIw7U+RS7jDGSf3h7Jhl+TE3YbIddfcslk/TI2ql/OiTAyghKDlnOas4yApFRCsmzQ4jzKU2atb2YxJ9lUeQWEZlSYEkOBGbVoB0wVjgkA096yIW5nuNm+QN5dicA1Xd2Gq0LiLBzx96P9ORJbfiuokyhuCF+doVzPYlyKrQX7Ogo60j13dYnOskOcLxvcWPw+FyeE9QQWFlR+5nPZLMHUd6FzsTgPyQmZrne82Zar2yG+tYYjzAikEVVQ2HPvUN87YGd00CR+3ImYjDE4MFGVqk0Vj5xyQYjc+MScUvXZGOST5y8XNDfG6o6m3NeGcsZhUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199021)(186006)(1800799003)(8936002)(8676002)(5660300002)(6916009)(4326008)(41300700001)(316002)(86362001)(83380400001)(31696002)(2906002)(4744005)(6486002)(6512007)(2616005)(53546011)(26005)(6506007)(36756003)(66476007)(66556008)(66946007)(478600001)(31686004)(54906003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmVnWEpJZGxOc1g5VFhrcXBqd0w3L004K3dNVnVDczdoWTBPeTdHbkRSTjNT?=
 =?utf-8?B?ekZsbjZJK3BJemo2ODFrVmdoRGMyMmx5MDZlT1F2dDdGcGZOU0R3RjlGcXNi?=
 =?utf-8?B?dU16WTRRWVFzLzlzS1hsOXd0Zk8rRW5YNDI3dGE4TjlvTk5yZ21Ga0w4KzBP?=
 =?utf-8?B?YUhpNUNVSXA2VWdGOXIrcXZ2OFgzd05tdHFaRE54em9iN3M3NTJSYjlPZUll?=
 =?utf-8?B?SWRBUUg4ak1ydVlvT2N1UDd0bUtuTXhUdlE5MjhhNWhNbmwvMWxRVEhQQWRj?=
 =?utf-8?B?dzRmejN2TkE4ZEFWWi8wcHFoR1R2Mk9mcVdVMTMxUGdVRThXOWFHT1E2VmpJ?=
 =?utf-8?B?OVdyclpIakxwZzVTUEZYb0hGZWJndk9vUEpLc0lDVDltL2U3dmFMakdMS3ht?=
 =?utf-8?B?THV6R2dJN2VtZFdyVVdPMFNsd3JZR2Y2YVFZSUZ3Wm5KUjZ0djNpUVBVcTVY?=
 =?utf-8?B?YzZqUHBhMnNndy9YZGo2NGROSmY0MCs5aHhmV2lJTHBkNkhldVdkZHZwUGVu?=
 =?utf-8?B?R09KWFoxdi91d0xPWUxoZ0R0c21lYTNZUXV4RlhCTzJFL0NzWjVUNGU0TjY4?=
 =?utf-8?B?Y1VZNjVHSFZtUkxWRVMweUdmTHhrS05zMmpmOHF2ejZNWCtSNUt5c0VBUmNC?=
 =?utf-8?B?Tm9uczR1eENOWUlaV1Bzdk5td28vNG1FR0M5QytodFVPaEtQRFJpZ3ZMc0Zw?=
 =?utf-8?B?ejZ6YUFSMEp5ZGYyVHZGa25TVk1rVEFCWjVBM2p4dTZpdStSb0E2SzNiWWZO?=
 =?utf-8?B?S01IdlFtSnhCTVhvd0RuTnJVUi9pdjBOcUxVS25WVGVxd1NLeFRjSjFUTjNR?=
 =?utf-8?B?dXJEbzZBcWxpejlmT09palVGWnBlaW53ZjlwdDVldStqRVFHM3UzUkRzQm1n?=
 =?utf-8?B?TWlHZ0ZzMkZlbTJUQ2YyR3JxS2VYc21aWVN0bmZib0M3V1VPem9YZkpDZVpy?=
 =?utf-8?B?ZHVKWkROVVY4WkR0c2RRb3NmVHZIZzgwcWtkakRIbE1JaTBGMVVuWEU2VDBD?=
 =?utf-8?B?VXZESnRBbWtYelRrWlhDLzRCZW53REZrTEJpZlBEMFliTThxeWo4enhTYVJF?=
 =?utf-8?B?M0ppWkxiN1dkSDVZQTFDdmFiN2VONHp5T09aZnlqbkp3a0RNODQ2YWpvQ3hY?=
 =?utf-8?B?eUhWeEdlNGlYNURDMHZES3BpSGc1Q3ZjbDBiTVBPbDF3dUNvR3BqZjhzZjNw?=
 =?utf-8?B?MGtNMmFJNFZ5ZVJqbzRuNk8zQ3cvRW40ci95bnY4VWJzTysyeDVuSENlZ2U5?=
 =?utf-8?B?b295UkxTN29tV09BK2FXTDd0VDNrOHNISDNMQ3dMZC9aRjVsRm9YUWg4Yi9y?=
 =?utf-8?B?TW8wWmdaS0p3YWFsRVYwM0UrVnh5Q0hUNlF6R1pML0ZuK2RSczVOKzBURENR?=
 =?utf-8?B?SHl4cXYzL2xPb3pBVVBoUjhPUVQ4QkZzQWNiSkJ3eDRZRUw5bjM4SndrSzFk?=
 =?utf-8?B?SDR0VG5OYVFmRnBFcERlekVXblR1emhGdXpncC9rOXdRNmgvdGxUL1NXdWkw?=
 =?utf-8?B?bW8wZTJzS3NhZ1haUkZEME5TRmd0WmZaTUVrV3hsU0ExbERjV25JcTlFdDlu?=
 =?utf-8?B?SUlCbldEd0dVaVFwUjZVSmFwQ2NsQTBrY25YcU1Tbmdpd1VQSzZMb0JFcHVE?=
 =?utf-8?B?bTVxMi9xUXo3ZXM5MDhVSjY0WHZ2dlo3Tjc5YWZQWXo5aXFaYUpWdmN5UmNO?=
 =?utf-8?B?MktUdjlRbGpQU1ZweHpBU0liNHZiL3pVSVlvc2tHV3UydWtvVEZYYVYwS1ZT?=
 =?utf-8?B?aHpnUkg0ZTVma0pBVzR5Q0N0RUdMK041MktpZEN5S0ZCTzhUbFdDUHZKQklB?=
 =?utf-8?B?ZFJneFdHL1dFWi9rd0F2QTJjSGE1U0t5ZklUNGt5WGJBU1M2dER2bnVWeG1h?=
 =?utf-8?B?cVBKbEN2REIzM01jVmcvRmxJMlNETTRlUW5lOE4zaWthTUk0THI5Nnd0bFVN?=
 =?utf-8?B?UzBwUGtwMlUzMmdKditOdGFkdkpWNzZWV1ZjbEVYUEErbUdqV3k3VUhFZWN0?=
 =?utf-8?B?bWZYL0tnaENlUmEzOWJtRGtPa3hOUW9hODFuQkhKS1pVN05Ed2pKTS9EMW9m?=
 =?utf-8?B?WlJxWHladGdnVXNwbXAyeU5MN2lyM2IvRzl0K1N2MnRpVzlGQnM4emtKK0dK?=
 =?utf-8?Q?wTb9fOUkCSiaNu6H80W7JLWR0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32d1c58-0c94-4a38-0ebb-08db9810819b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:08:06.6040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +L44zMvKej45l0JEvOwcmAwaw5Sbhr7AK20id2cf7p2IjqDjqaMyyXoWlh9PYFVVruQwBvMtSFgjRNhpFjemAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643

On 08.08.2023 15:03, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -867,10 +867,23 @@ int __init early_microcode_init(unsigned long *module_map,
>          return -ENODEV;
>      }
>  
> -    microcode_grab_module(module_map, mbi);
> -
>      ucode_ops.collect_cpu_info();
>  
> +    /*
> +     * Some hypervisors deliberately report a microcode revision of -1 to
> +     * mean that they will not accept microcode updates. We take the hint
> +     * and ignore the microcode interface in that case.
> +     */
> +    if ( this_cpu(cpu_sig).rev == ~0 )
> +    {
> +        printk(XENLOG_WARNING "Microcode loading disabled due to: %s",
> +                              "rev = ~0");

Sadly there now looks to be a newline missing. Easy to add while committing,
I suppose, and with it added (back)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

