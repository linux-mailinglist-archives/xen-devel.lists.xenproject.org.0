Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D50E769A93
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 17:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573135.897551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQUcG-0002st-RU; Mon, 31 Jul 2023 15:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573135.897551; Mon, 31 Jul 2023 15:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQUcG-0002pl-O4; Mon, 31 Jul 2023 15:15:24 +0000
Received: by outflank-mailman (input) for mailman id 573135;
 Mon, 31 Jul 2023 15:15:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQUcG-0002pf-0y
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 15:15:24 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10fe4fb4-2fb5-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 17:15:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7185.eurprd04.prod.outlook.com (2603:10a6:208:19d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 15:15:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 15:15:19 +0000
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
X-Inumbo-ID: 10fe4fb4-2fb5-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRnfRIfi8Yv1LpQq4RsB3++hNbmfu+0apVW5cydhEpW89LNFy8EILuXVpDM7CPb49tMVDXX359lrZkaTEwkN5CfI01MeYdfWgUYy2RsLGz3fqcXXwEPU3y4PE1Npe0LGr/euSe9sEQhRpbCG9q0wMyKxytuVLUzc3Imjo5N9AlGAYIFz97GtuTuMZaurcWRZrK5CLEycAvyAnX6Sm1vE02Smpqr5QXnNyeLTjsvw5aeWiTtZJYrs3ydLTjo/Ig/Bv/wpoQ03J9GD1OpEslGUJyl6XLDFlym0N3q18fZUpwAdSyMlV5mij3t6FyliAacGsxFpehdL+K2xl2i/w5ryUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WWRE1l7TrgEFtXxBf/7xoEUBU43Vy6Z4xGD/r5ngYg=;
 b=nF3fdYpLgtJohbI2L3bNOZdDyoZUp/gyFeaic8I8UgCbeL0tMAb0ud5nPOp5hweuJlqrrImFxYVdklC3b6qWSJbVPl70rsAjFaAeCkpcpKoeSQkcVju8ZN3OABD6yMAiBRN1jkaMBr47+WlP6y0NzI3od9SVxkwcGwjYF/j+S+BqT9ts5hY/2/YzTSY9bnq/u3d0+z30sV00m5qGcJy/Gi9p7fGZdhDEe0R8lF+miONyFN4lF/QZ5esdgng6WofSidMjiyVZthYn/skR91xbdPy5261g4Obj4joucCH4wKbMfepaG+O1315ackyIZmrPp83diCqNhJIA74h2Bf7NeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WWRE1l7TrgEFtXxBf/7xoEUBU43Vy6Z4xGD/r5ngYg=;
 b=whyZdiAMH8LypzviFPlRMwNO5Ljzs2q94VMKCsCHS8rDuRAcxUm92ByIisJL44UHu0RM0vt4Mp3vAPvrFNXisAVqTWXlJEujtGnxtOs110yFkF5190kTg7mDonC9Mg2vZkxFkCku3SMxkJ8Kd+6oGB0yAFAbj+HwNZCTNC79OmirqP04Z+lIpyJvLkWhgeyE8l64src6seZC2Eymc1kIh8DB8fv/k19HPk94wbJArqHVOobEBG6bGtMm1jL+Mm6gDFrYSTk0fI2QJSX4ToE2y0mg50OMOuMk9JoZsLBT65Fzlt2Yh4ZB8C/hbFxWqGHsx6tHCNXj0aFB/LWWHFnqXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db533ea3-8b1f-fb36-a0b8-d196f3a84f33@suse.com>
Date: Mon, 31 Jul 2023 17:15:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 2/5] mm: Factor out the pdx compression logic in ma/va
 converters
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-3-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230728075903.7838-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7185:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc6927a-f771-4d08-7978-08db91d8f403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zsHYkH+1tQ11WxMTKMnfFwYiiEhiwa1Qsh7BYFrCONtYeeqw0Sb0edzQIe9dUN/7+Oz27bllWHTFkM8I5m5QdjDM6Djqz7jv0FDaLm1AeOMvsnAmMGUYFxmWhDWWv9PV36e1wCwuQvNIc7he/0tw3H0is7etveeiJSI1UYYw9vX+yJ6zQUU82bt20nZV24x5D04SHB56Xp6+RvDPy/p/yRxvml9zO9kXugn5bHI5Uoo9n5ErKPeuVlNRKkua2+51TzkggUVYpINan6MUgUNPS2Vm3S7ZbH4gzo2cJf6JXi4bvqYR6wnMrqiy+AskzELhRkfI8ALjeIbarkUIA4CHBlrUwpswsziFKGHm+XuzFGVNvw2+d56KXHva5I9v7msUlfRznvRQ12cuwDLi+cIbIeSv9Pa1jl4au0vxv4u0pscBPHBJ6sdDIAW7rB8cJwoLv9k893hn/KQ8MvKrswSpVZK4+ivBxTFQGsMh1dP6mBtsiR0sE4v+SqP3EixZUY/gfc09Fca3NIMLO3/HzZmARtATv2LWl7pu9z2+tYrBRqiY6Lr2dR0BMTZywYNM8cwQfL1HvPNh4o+Wp5Jz6dgdzmK54rQekUa904gwmSQ2vsoF6Vg4U/W0idWjsFueIaDNw7Qi+NO2GzhWsqte/eavcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(6512007)(6486002)(186003)(36756003)(83380400001)(2616005)(31696002)(86362001)(38100700002)(26005)(6506007)(53546011)(5660300002)(41300700001)(8936002)(8676002)(31686004)(6916009)(66946007)(66556008)(66476007)(2906002)(316002)(7416002)(4326008)(478600001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVBhM2JDN1BLUGVUUjNaS0lQWkJpd0hCZVBuMlFQcVFvLzdQaE15R0Zja2lC?=
 =?utf-8?B?YS9mdURXTUFWbThuZUhpQzFwRW5GYmQwWWllL1BzYnFIOW5nTlRWMjJ5a2Y2?=
 =?utf-8?B?dllHWEV0bUhDRHZrTkJacWVkZmVLU3NNUEQzVUV3UWJPU2dwS0xPcWFPVVhI?=
 =?utf-8?B?cmN6QVFDSGY5bnJISmUvMUhFNk1SS2dvWFluT283MFo2Qlk1eWx1S2hBZVlR?=
 =?utf-8?B?WmlXcDMzbXFEYUdNNlFnWWw2cHlqZHE3MUJsNFpzM1h6TXVJdEZiSXFNR2xn?=
 =?utf-8?B?a0ZCTXFoa1FGMi9jbGRTYTh5QTNocm9qdm4vQ2NLRG1WSnd1VE1KK1BDdWpW?=
 =?utf-8?B?YWJFbW5kbFdmUlhGQUJyV0EwVUpDVlhDOVE1UmtXU1VwS3RMSzFkNlI0aG11?=
 =?utf-8?B?MDZJeS9VM29iS0JvNy84Tk5BYlpXSnNybVFTZ2lhcFJhTjRJS3Y0RnNoaU40?=
 =?utf-8?B?MDlGc3dtT2Yrb3BpMzQ1N3JuT2hiRUpLRkJUdktLbEtGcXNiZmg4VEdKMDNl?=
 =?utf-8?B?UHhJbXFoMlE1YmtIZFlKMjQ5SXZrQlZ5VmMzdUNFOFBScjFsVWdNVjBsdXpl?=
 =?utf-8?B?S1BFRTBrQkNFZjFDQVlvdUgzSHhWNlFIajc0MHpPVTFRQm9RR2pYallEZWxj?=
 =?utf-8?B?ZVVPVXdPR1RmR2ROU3hDdlE4QmkyWkluT3JibGx4SzgrRUIya1R4MUcvTS9O?=
 =?utf-8?B?YS82VjN1SGFhYWxOSEEyU2xCMHozU3FXUVFDeFFYNUdsTFZwQk9wTjBsT1FP?=
 =?utf-8?B?dkdXa3dLalZ5b0tDamh3dE1NY2t1RHBLQ1V1OFRTRVZKNS9VWkRIZXk4eVJo?=
 =?utf-8?B?TkxFRTlCZ0doYU8wRXovVzZpejlSMzg4YWs2d3hIbVBmMklqeDBpcldBMHhp?=
 =?utf-8?B?aWZNbFFoRzl2YkdoT1hMYlh6YW9NalhFZUdqTndrdDNja1FiRG1Jc2xaVzBz?=
 =?utf-8?B?bWFQWGZqYXlYZExDajVkam9MQlhrUE9EemNqZG1yZUFYSWp3UWRCaXQyclU2?=
 =?utf-8?B?b2FUNkt1V1pBREswa0tEM2Qwb1BmQ3RFQXFMTkJBNy9SMkdnbXZTeGE5L01H?=
 =?utf-8?B?ZnlZcStoVkU3ZEE0R0JhNEtDblFwUDJXY1JtWlB4Wk0xOG9rbm5PUmNpdXk2?=
 =?utf-8?B?eHJPeGtqT0xLcDJKSlZYc2s3U2Npa3g0NDdPMWNSL0gvRW94Y1BtdHdLR3pn?=
 =?utf-8?B?ZGo0bW9pTnJ2L1RMT003ZWZ1Q21kcmNTMDdVZVZmQUJKWkFpT3JwQ1pZdFly?=
 =?utf-8?B?c3hqVVBsWEsrL1hjK085N3RCNHZBamdOcmFxM3d2bnVHQXh5R0FZMU5yZXdw?=
 =?utf-8?B?SHlXUjQ4QnpCbk5kNTdtV3ZDaVQrSEZRbmw2by92TVE5cERCY1YvekJCdnpr?=
 =?utf-8?B?UENUT3loOXBvSU5wekQzcFdheDg1TlpZck1zQTZBeENqU0xTSWFXMGRINE1U?=
 =?utf-8?B?TlE2ai9OSGFpdjBrbE9WMlZEUmMxRm1LNzJRRStUQWVoMGVYaUJxWEczVmRV?=
 =?utf-8?B?d3lSb0JKRHlOUVRrSEt6akhCblY1NVhmd0k3dXZtZFBOZ1hZTW0vRXJIaFNM?=
 =?utf-8?B?OXZtb2FXQmZvdTYxWG5tQUwrZ2tOU3A0c2t4ZW1XUUMyaVhucjVlZXdJWXdG?=
 =?utf-8?B?aGxIcm1iVDZZSk0xNmQ3UDV1QnVvMmRBQlAwMnNoSzA5enhReWg0SXBkSENm?=
 =?utf-8?B?VmNJbzMxb1VnUklqK0cxWFRJeVkzd255L2VyMEdnQlE4cTJFTWxjaStzcW5L?=
 =?utf-8?B?QWFEMW1EdjhiZEo1ZlV3SlI0YUNyMHh6bGJTUGhXengxQTJyTGRSZzRMbEFa?=
 =?utf-8?B?UGthV3p4cldzZUZTUVF6SUhRUUFZbG90QzRVc2NubnRhSENvenN3ZDNUMTVX?=
 =?utf-8?B?eHZpS3lEczRnVVNoYjhITElQeGVRaTVnK1BSbU5jZFd5SlNnOHdyQmJCb1Nk?=
 =?utf-8?B?Y2RXM0NQVGxicGlPWTZMSmc0OVhrTkxCQnpna2NhZTdtNHExQ0FXWkIvQlFR?=
 =?utf-8?B?WUh2RmVsWS84NWVYN2F2SDNraWw2SEpDV2xwVFQ1aklLL2JXL3ltWElUQTVp?=
 =?utf-8?B?MzQ0QVdkeVJKN0xZbnJzeEoycGFlSWQ5VUVWK0VTbzlMSkxZSUNpSmkvY2FG?=
 =?utf-8?Q?78HshyqNQhNx7ltMgAa9Jt+ji?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc6927a-f771-4d08-7978-08db91d8f403
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 15:15:19.7202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCXgoialkppnNhc29T6F+kxoyxTLHYzQLOo+UyzUrSxwKFZIPbBeYFU41pq+NE6aCcJ7PFO+wCkzw6UmELpkdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7185

On 28.07.2023 09:59, Alejandro Vallejo wrote:
> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -160,6 +160,31 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
>  #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
>  #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
>  
> +/**
> + * Computes the offset into the direct map of an maddr
> + *
> + * @param ma Machine address
> + * @return Offset on the direct map where that
> + *         machine address can be accessed
> + */
> +static inline unsigned long maddr_to_directmapoff(uint64_t ma)

Was there prior agreement to use uint64_t here and ...

> +{
> +    return ((ma & ma_top_mask) >> pfn_pdx_hole_shift) |
> +           (ma & ma_va_bottom_mask);
> +}
> +
> +/**
> + * Computes a machine address given a direct map offset
> + *
> + * @param offset Offset into the direct map
> + * @return Corresponding machine address of that virtual location
> + */
> +static inline uint64_t directmapoff_to_maddr(unsigned long offset)

... here, not paddr_t?

Also you use unsigned long for the offset here, but size_t for
maddr_to_directmapoff()'s return value in __maddr_to_virt().
Would be nice if this was consistent within the patch.

Especially since the names of the helper functions are longish,
I'm afraid I'm not fully convinced of the transformation. But I'm
also not meaning to stand in the way, if everyone else wants to
move in that direction.

Jan

