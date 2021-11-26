Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5A245E8D6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 08:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232340.402780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqVwV-0001xi-1M; Fri, 26 Nov 2021 07:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232340.402780; Fri, 26 Nov 2021 07:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqVwU-0001v5-Uc; Fri, 26 Nov 2021 07:46:46 +0000
Received: by outflank-mailman (input) for mailman id 232340;
 Fri, 26 Nov 2021 07:46:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqVwT-0001uz-F7
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 07:46:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 003758cf-4e8d-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 08:46:44 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-s3BY4HlyOQK-JKPBDtqI_A-1; Fri, 26 Nov 2021 08:46:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 26 Nov
 2021 07:46:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 07:46:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0069.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Fri, 26 Nov 2021 07:46:39 +0000
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
X-Inumbo-ID: 003758cf-4e8d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637912804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ue/+97yGCMNvbWu+AvN8iBKquKtgDOSOMnRt2uD6tjQ=;
	b=Gnpt8QWhJ+RCCc4CjFxT43qQN1GQ2fFVR5e2PX2Sb3d+FKxtahqEpu1/dW2HWza8PUGipy
	EO3NRzQovdX5i0lg7ykjrL2V2rpsxhx0j/WKz4NWGGT/wCmM7N5lM+dqibGp+kujPACBe0
	R7jSowcm9QHcJkXHO9eDAEtRX83QzMU=
X-MC-Unique: s3BY4HlyOQK-JKPBDtqI_A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVfm388N+BwREqt5LODC0Uap4VawNeJMQyLIg/ADxzVXMsq3EDY44tNVa8pKkcR3PTbE+t/9iB5AHN3nbn2FNGLFQSghL/OB0uX8WdTihEIdiZKZe1hSAq14f4+wHMd1gotcKtRickSGzixwyMyP/fsVaj9TWl6bNM16FznGUGbK9Q/UggrF57d0rLh6iFnFWtPRAS16fRYbP8ayVZsqKdWrUuxK1dSGGeOIfV8KOP1F6QZwPKe0AseZeYJhVATUo38uDWal15ydMuiKmY4wbt8f2/kaAlPvicnejErkINM4byPlRknTO7Y8r/b7oUIXNA7bpLdxfxAM1jdLBCecMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ue/+97yGCMNvbWu+AvN8iBKquKtgDOSOMnRt2uD6tjQ=;
 b=SkA78y2HWzYyt5fnOaXzP1bM+LOsGvi8eLs9FME63TpguDyA/g3dBFH8/fUN9/2Rh7tDkwsEeL9melNKOagBwSVbs/T9A6mBgSasIXIPlR3VmvytIQLQLbwZZdHRspfXdzH0GHuhi3RzbTj22PLaQe2nEwi8Nc8v9GhiuDBDYKlddKFYa6073K8Jt8+j1uqJfkUkh6Ynn+izzHi4oVO+DjzrrYYvacRXTSqo66a/OjYHSOLSKXaBkblQ+eXsDcK6trFaCtQ9o3vxh5p4yvwK8km1W/x9gZzLIc5GtVybxrv/e+MjPrLguJJGVYX5l+AyB09EDIIeNIzdnGafYKxwLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b51fd518-6c32-c945-d220-f2092ff2666a@suse.com>
Date: Fri, 26 Nov 2021 08:46:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC?] xen/arm: memaccess: Pass struct npfec by reference in
 p2m_mem_access_check
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1637880559-28821-1-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1637880559-28821-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1582817e-2406-466f-92bb-08d9b0b0e1f5
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4191C43002E7F5EC5E22FB88B3639@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	COwqExwqCJdqbvKoE45uEmfWjMYZ+hFOMLQRaewMCbhJr8P/sY9f00x4HzR9SUmXRbvCX/0/j4oaw1ND+O+PqMc0Les1lb/hlJorYE6BbOV/5h0X7kb/yYOU3MTf6K0bqW/qUtU1zUsldmFTg33JT5Yrox86UKqR0jNm8saPMlQZuXQWFA3+Z+YlAx1tn6ZN6bhyBVREhcAmNzDtcDJ060OTkg/T5hVVwuIaRewnAjAJOtcfpq9WVQx/DUEKR+kK8ILaDqimR4DAeHtzg9ZqGHxC01h/F55AjLpxlHwjKUO5VOIcBLH//Nc5qEIN39RwsiAfSGxT17ytDhPxWOfSJz1lqYfwb88+++7CMX8ycxbzElTb/kuf9YDGxFhhZCP+mXYKf5J5kdbcOptO9aaboB7Ctl0SQ8KhkggLkw+jC+X8UAnrxl878aWhiGJb6mOQjCJSvgFkFXovgaGtqLfXRtawA1ciUKRjaojQ5kg6nos/dps1/l96+20hHMGEGYeKOT017/NDXFafU4JlgCu1J39qK1l2cnJj+Atsr1V5f1ee+L2nF3lQpkOprF+/p+0Sw/hWipHl7H+vIiGHkPImJdTrTD5/hlYDqdR45mzY5PVGOiTMlYEcW8iOZxIU9c2Ywpxpg9xhbMISXwkiKASjWgn1N66zo2fbgqBRS11MvO6nfSl5KOeuAkk3UuEf1kqh/hIZbz/ovwDo75t40U95DnR36TWJ7wPoZ4w6YOEL+utHvbNuIvfd7QlTE89QNkymGL5q+jcwDZMoDQpAmQKtqHIPwk4i9qUymqifLmuAuaiQ+cKpjGFwdWx1iL6SZ+aePP1WYDwNGOYj7A0isALyCvanUf4hL5suEiPxMIAmGqs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(2906002)(38100700002)(54906003)(8936002)(5660300002)(83380400001)(31696002)(2616005)(7416002)(186003)(4326008)(31686004)(6916009)(66556008)(66946007)(966005)(86362001)(956004)(6486002)(36756003)(8676002)(316002)(53546011)(26005)(508600001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUwxck9DYVpBQ1ZtOFFDclBuNUxrQ0FCTzc3UDdYOUtxNTNieDlkMGtTS1hL?=
 =?utf-8?B?UGRhK0U5bG1rMDdqTXVyUCs4dDRzeUNBYVdxYVZSc3owQkYzdnNvVitvcy9P?=
 =?utf-8?B?dHBwVDF6TThJTkN1NXJTRnAwR1Awd3JBV08zOFNyNDJ2QTR1dys3Z1BENUt1?=
 =?utf-8?B?d3hQa2wrbE5DSkM1VC8vWmcwbEJ5ZmczbTRhZ1Z6RUkyd2xla2hzVis3S2x6?=
 =?utf-8?B?Z3EvSXVySm0wcit4bEF1Y2hDMXg4TnF1SjhvWFN0Q3VoZEtQbEFtOW5pQVls?=
 =?utf-8?B?Snp4ZVd3RlprZWJNejM2T2RQNG8rMlQ1QWEvREdWMTl6clVUSThHTWYwY0tL?=
 =?utf-8?B?ajN3RjNrNHVNZlNtaG5WdWpZU21sMG5UUVEyTDlpNWQ1cGdDTnNqWC9nMzZ3?=
 =?utf-8?B?dktWME40Tk1XYVhmTVRidEZ0UTdhbnk2LzExRGZIa1NTYXlHczlyU0ZpN3Jm?=
 =?utf-8?B?eHVST2ZtY2R5UjF4M1RFWGxsOWRzNzlJdHVJajRlR0JyeHFWUUNKZVBzUXhu?=
 =?utf-8?B?STQxYlk5REkwNWdqdkpOcll4THhHRlJ6a0c0Rm1yYjdQZ3dncUsyb3lOWnNv?=
 =?utf-8?B?ZHByL3IxVjl4cGtQVHpXWDloSzVVcWJHS1JZRlhQcEVIS0lhMkU2ZXBDazB6?=
 =?utf-8?B?ZWRSakZPSkR1SDBNUk5zMEpQYjVIWUVsM2hvT09HMWc1NUlVVmZad01PTlBh?=
 =?utf-8?B?QXBrL1F5SzZyTmtmNmtiRjJuMzdCVU5FdU5YaW44cGM4NWZheGMzckx6RkFl?=
 =?utf-8?B?UDBOa3pielI5MEVVajlKdFNJWFJzWHBGcFBNaUxJYUZ0ZUZ4ejJhT1R4bnh1?=
 =?utf-8?B?QXNBUmFzdGlySi9oZDNpT2dndGpFK2tTS25Tb0ZLZzJDNytzVXQ4NHdjd2Nm?=
 =?utf-8?B?RW1RdytsT1B4aXlzSTJxbjFEM1BBUXpsaG1tV21wbUJseTVpdHdScmJGc0Jn?=
 =?utf-8?B?eWVyMTQ4MSt0TVphSDhCTkh3OXJodjd2STFIZnRKVFEwRUVNQXhxOEU0UUJO?=
 =?utf-8?B?VHZPMytCeGlDRFl6UlhaVWFlck1aQURRZ3FCQVFDaU9vemlHNFI5am1PRCtj?=
 =?utf-8?B?Qk9SV2lkcEYyUkZsRUxORHZ1M0h3WnRRNit0NC9rV0xtVmFkNVRXU1BtVFIy?=
 =?utf-8?B?U01tL1o1eXBaNTVKeFMwYjJZek1DMFlMTzRac09CWmsxTEJKelg3c0JzbU1W?=
 =?utf-8?B?cTlVMVVobTRkUFo5R3JOQXhDZmpiQ2ZKQmdPbzFHaktmT1had3FpTldOZ3lG?=
 =?utf-8?B?MTBzS3VaeW5uWDVJT29KS25jRm9Gd0p3Q0pBTzlsZ0FXSS9qNGsyUVp6eDVQ?=
 =?utf-8?B?UmloUVJHSDcvMXkzY2dDRlRtL0p6SHZlQ20vZ0NyNllDaFltcDFNTStzayti?=
 =?utf-8?B?VGNLWHN5Vkl3RGVZei83dDJwcXpqcUVSMVFZT2FtMm9VVm00MjJrZTJhVzBH?=
 =?utf-8?B?NTltRlJNZWpqUjRsZ21tbllhWW9oTzhWQnVLRWFkbGNER0xtZldTeEN3U09O?=
 =?utf-8?B?WS90SWw1TEFLRUNwaFZmaERzb29vdW9MOUZ3eHFQVGxLSVFla3FWUWVkWVFR?=
 =?utf-8?B?a2FTUjltRWdacDVGMzl1ZkpVd0ZPV3pvc2ppL2VBK1RSR0Qwb2drZEJGL0hO?=
 =?utf-8?B?ZzBzL2lMMElOUUt4TE9BNVNyK1hyMG40SjdySVg3ZG5YVXRVM2dpb2I4VXVm?=
 =?utf-8?B?T3FFQTlROU82RElOTUhSS2ZubDdOTDhIK1BMQnJhdXZzSkJhWkNvRTFwOC9Q?=
 =?utf-8?B?QjhNUEozYW5LTHAyMFV2YjlReFpUV0x5dWFkbFV0eExJV1d6bG9ieTFpL1Z4?=
 =?utf-8?B?a1lJZGhsbTN1alB2dmFvK003MGRrRngyNTU1YUxxcERWUjl3alZYM20zMW9l?=
 =?utf-8?B?b1Myb2c3bnRkYWFnV2tzUWk3MFZWL0FIT1U5TTRsUkNzZW9IcXUxcUNhQ0tV?=
 =?utf-8?B?RUZObHlMTkRGbkl6T3dWNFFjRjUycnJPR0hodG5HSGdQaVVWZ015M1VXSFR3?=
 =?utf-8?B?ZTg1d3pKRExKUkdZNTAyUzlxdTdBbEwxZzYyZzhQU1RvYWZodVlGNnpXWmk4?=
 =?utf-8?B?UG1JQ2txZnA5RVZkL3FGaUx2N1Z4TVNhQXpJUnJsd3g0WVRxeldWMGdtb25J?=
 =?utf-8?B?SEFqQUd3NXQrbURqKzRobnJtdEtRZTFGbUJua0RMT0J5WWM1N1FSakpJeEJQ?=
 =?utf-8?Q?V9XfuC1VasTd2qieyyAYJqE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1582817e-2406-466f-92bb-08d9b0b0e1f5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:46:40.2705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FujrDW2BkWBDc5Aq+gm0/BXg3WekKmJKZ6EfBx+Ejc84FBCpsxK/dRuHVtn3yNVlI6dWsAxlGtbwoKUV/RreQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 25.11.2021 23:49, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Today I noticed a "note" when building Xen on Arm64 with
> aarch64-poky-linux-gcc (GCC) 9.3.0. It turned out that Andrew Cooper
> had alredy reported it before [1]:
> 
> mem_access.c: In function 'p2m_mem_access_check':
> mem_access.c:227:6: note: parameter passing for argument of type
> 'const struct npfec' changed in GCC 9.1
>   227 | bool p2m_mem_access_check(paddr_t gpa, vaddr_t gla,
>                                   const struct npfec npfec)
> 
> From the explanation I understand that nothing bad actually is going
> to happen in our case, it is harmless and shown to only draw our
> attention that the ABI changed due to bug (with passing bit-fields
> by value) fixed in GCC 9.1. This information doesn't mean much for us
> as Xen is an embedded project with no external linkage. But, of course,
> it would be better to eliminate the note. You can also find related
> information about the bug at [2].
> 
> So make the note go away by passing bit-fields by reference.
> 
> [1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg87439.html
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88469
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Compile-tested only.
> ---
>  xen/arch/arm/mem_access.c        | 28 ++++++++++++++--------------
>  xen/arch/arm/traps.c             |  2 +-
>  xen/include/asm-arm/mem_access.h |  2 +-
>  3 files changed, 16 insertions(+), 16 deletions(-)

It's all Arm code, so I'm not the one to judge, but I'd like to recommend
to live with the note or convince distros to backport the gcc side fix.
This definitely was a compiler flaw; see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91710.

Jan


