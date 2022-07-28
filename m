Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EA75840E2
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 16:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376832.609864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4KM-0002KU-NC; Thu, 28 Jul 2022 14:17:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376832.609864; Thu, 28 Jul 2022 14:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4KM-0002IC-KH; Thu, 28 Jul 2022 14:17:26 +0000
Received: by outflank-mailman (input) for mailman id 376832;
 Thu, 28 Jul 2022 14:17:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTbt=YB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oH4KL-0002Gv-Dh
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 14:17:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffd77ef8-0e7f-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 16:17:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7702.eurprd04.prod.outlook.com (2603:10a6:20b:23f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 14:17:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 14:17:21 +0000
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
X-Inumbo-ID: ffd77ef8-0e7f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ji8V2yJc/ERM5mHrxU0Xwr2ZgPyelgGxVWmyZqW+6QvlkPZmuRA7Tmy0ex7ahz8Gi5UZr6FS9IYhb2CxxOLOjR8LawbUDNqLRbAm4o75Sxs7vMXAT2Ahyg5w4PKyKUjwOQqfdguHBY+9fvEl9ahYuU+AHNJ4LArhgWcv+Rta3rxWNd0pfsmyNt5PAnFiN6c5PEIfOGibq/iiQH6fnDYPXL7gWHagpgXjneCJNizBzRPmrNNsXZIPqyuY1zYJrnodpgnx2iC/vwKeQA1nNhkKKOcAfWEa6L9fphbk8An2s+XS5h6U36g5aOVm0Rol5Z1tl+2XV2dNMTsvCXjB9J+iXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mo7sOtI6KgCguR/fGcGZ2tlVZjkl9xKuor/v6/nyoG8=;
 b=DYYN7Gwpi4Jq/JoU3kdsImsBtmiMK2pRN0PYKRyjMt4hmghxukeOkOudLRz5KlA2m4pSZKvU5IjPjE2pQb+jhwO+piXCDOCW3Y/FNDa4232dadXkCO14Yl4EssRTyiRfZR2hnVt6G+xf9hGfACbat7dHSOnopvBfCB5H+hM9RuXq5NX0W2tjObVAJDQ5lmtKl6CzpRDFvCLNh7Nq33nXcVyHYyf5hHdH+g+ACetrT+eBPVyUFVv7lYim9cmTu1pGD+7OQEC9kG572q7E0HN3i8LIayZhi88GZMKTDob6F1G6GWL+yj99kPYfXJoivEBz1EbsQ9grv5VGfFg1nzOT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mo7sOtI6KgCguR/fGcGZ2tlVZjkl9xKuor/v6/nyoG8=;
 b=U0aZETQa3ZtQUV3NZ+qyv+ToCGutt9Z9dDcmKXjfbXydv9S16GPkJaKZ0GHRGBVJhe89pDmL5b3cSZaGoObSexaTjXVdPMYZlchdge58HIegSB6Hv/YonLMoro4mp+XxQ0WqTMgquxbPxmDaFnBLLA6kGiaXGTqiDw6lxBeIuO0ndPcN3iBYOJdM+Y12tPkn1oUuRoRjyOTWTIZ9qa7PM8WN6gpchdOAfYMR6HJ+2rvjt5144gnnlg+1HvCBXjg4CKW7rGf9PFfbDHxN4q+N6SUb4DhgxeT61/7G0khM0eEVextvFe+pSzMuc4QwbFVmdTQGzaMQXG/w+h60hH4OQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <818c0331-ae00-d0f6-327f-56606514aaca@suse.com>
Date: Thu, 28 Jul 2022 16:17:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220728134943.1185621-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220728134943.1185621-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc230213-e0d0-4555-2fb1-08da70a3e2da
X-MS-TrafficTypeDiagnostic: AS8PR04MB7702:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9P/ErxXYFslS09CwKsyqyEFLo9bkBM7za/jAPmxBlOEWHh4pwITkAVZwl0aRtxrQ+LszlPv7c1qYowwVthbrPrhGvjx5ygBNkyeRHLkDFzcq78uPTU0G6C62eHQD1/71fvHBInzhSCRgDSZSLjmFV3JvpwH1J6cH0Wq7qBVziFx5fJ4tlngdZ/owwOilPrUSo8lHMpL709rYymmvBZPQrqBEHere1pDbuBwHBBLOs2bvPVaelRuWxOlI1qbYRVt9Jxtm5E5xmkaGtxuDFeGNE3cpxYR9HSZwRgK3Nh09NU9n/O/4Mf0HaBw90GRm0nsjMx80s5ngt/c2IWYnfqkQLR4fTXYB7tcfM98GAnCElGaHNLQmkpTUId5a9H/gJUk/4owv9Wuc12PurUQ8xq9Cd9FjJ6uiW8keBfjTC1crHQQiT45dihmFHgSjFvLF5MS5LYw5tYL4Wl5arEe9oqPHMykosOYturrJ/5TqcKV2B9cvqM60ZXs8wBV467cthR9L4KlaynXDZ6q6BeWiexTBwm6NhMMiVRZ1PDhK0FlDdR4YjBhRwW1PuTXqi+87j7j+afHt04oFDSFQXtor8Qagekut4iQQBMhXoJBQRX0Rf+4bTwjj/jaAeY9QDdkcIIUqEBHut93xx7Bf2kehVofrZKro6NkWYMTvGUmaRBuDiGyD0NV4l7DXNBIN4K0FMYFJHMzkk3qhly/m7t9N+IMYNvTkpsApHmsexrEvTye7hsSP44geRRuusaYymiF+aEebSLmKVyWdw/w2ycd5X1bBp7M2NSRKNk91w72tpIw/Gc1sUM8I1zZVp/GqIp/hSVXUghpXtdoY5l1AxGLpCF5Nfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(346002)(396003)(136003)(83380400001)(186003)(2616005)(66946007)(38100700002)(4326008)(36756003)(8676002)(316002)(31686004)(54906003)(66556008)(66476007)(26005)(6486002)(6506007)(2906002)(478600001)(6916009)(86362001)(5660300002)(8936002)(53546011)(41300700001)(31696002)(6512007)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE5WMG41Zm8wK2lhRTNyNmtiOVdCSjUxSjdxbFRNa0FWTmY4ai9TQUFRYnNh?=
 =?utf-8?B?RnFFQnA0VWRuQ2pCSkhzcFoxdnFrNVRXbEE3dmJMQitVU1RhRzlvVFdMRzV1?=
 =?utf-8?B?RXYwcktSck5KalVFUTM5TWZ6b3hQV2xtenJad3ZnQmtWVHlhVHMzOEZqOTIy?=
 =?utf-8?B?Z084ejRSTFNKKzdlenJPWGtvVFVKaFRFZFVKN2JBZnFQY3EzSHBXRmlsWDVQ?=
 =?utf-8?B?OFJoT0pDSHU2azBpRUR3UzZzaHRDRjNrczByOFZJVUZ6T0p0c2UyYzgrNFlK?=
 =?utf-8?B?ZHMxdk5ETmNxWDcxM1IrakEzUGVMeG9YbXVsTHFpZUpQR0lDK29ueTVBbm9L?=
 =?utf-8?B?ZmlBNlBLYVRRUFdaK2lEV2Z1TTU1b2oxR3F3SkttdjV3emNpa1NIOGhnMy9l?=
 =?utf-8?B?QUNKcDhZek0waTJSZ01TaFVnWW5WRWxDQUdLR1JKcXNkRVBUdS8rdVA0RmNx?=
 =?utf-8?B?V1pQKzJQL0VoOWd1NWVOM3JuclB3RmI3OHg3dS90Zm5OOWk5UzJwOFFxNlFz?=
 =?utf-8?B?TWZrYk93UUZvdERRMTNQRFhBK3FjcGhGQ3FVRFVmWVAzQjVySFJjbWpuVXhG?=
 =?utf-8?B?ZnBZZjVXZ2grZEVnODQ0SW5kcHRjVGNkQkpGR29qTm82bktVcXAzYmczVUl6?=
 =?utf-8?B?cSt3M3Y2QS81NDh5OTl5S2w2NjQ5S2ppYm13dmp1WXdBWlN3NG1UZXZuSVNx?=
 =?utf-8?B?VmN1NXg3SFNXNXVQWHMzL1c5RzQvWHdXMWt5YzdqL29BcXp2Y3VFZmhhZkJv?=
 =?utf-8?B?UXo4TkpFZlJGZGN1cC9vVVBuZWVnUzJZOWNTUTRIWisycll4SUZhbUFEcFdJ?=
 =?utf-8?B?RW1iTEdTdllwaGxBblRsNWFMYnJlOFV1QXFFL0dLazd6ai9CSS9wZGJucXRI?=
 =?utf-8?B?b0ZWenpYR0dUUyt5ZEI1Nk9aek53QUN2TXg3QU10ME03eGNaMkV4ZDFaQ2hh?=
 =?utf-8?B?WGZMZGxnSU5aMEo0bDJBQ25HdEdNUlFTLzg4ZXJydzd2VkFyTWZKUkFXNlJ2?=
 =?utf-8?B?ZWdLcGh5VDhBM3lPN2RERVd4QXFQYXo2Q2t0V2RXTmtYUnNyTFg5TTFOeDQ1?=
 =?utf-8?B?bHRwL0d3cUhRY1A1NXFtT2tlYXhTcWl6SkNIODZseG9VTFZNc2JaTklzUmRi?=
 =?utf-8?B?MTJmd29iTkh4bWhIdXNqWGJYNTZ3bFRidWRHdnd1RXNsUWF4WHBtSzVmVkZ6?=
 =?utf-8?B?NWdJSzVKNmtvZXpCVTJFYUJVeVFyYjJHbGNaa21JdjF5ZFJoSTAwZzJyTUtW?=
 =?utf-8?B?WVptYWRnems0MmdEV2l0NGZOcU8yVzRqUk1qZjNTZnF1UC9zbVpZekVyMWgv?=
 =?utf-8?B?MmtudHRiLzlRSU9GMWUxZHYzaFR6am94Y011R3VvWHpRK29qOUV6NFN5QjJK?=
 =?utf-8?B?c25QdWU3K3VZVWFwYlg3RDd6Z3RGM0VEdFljR1VBUUFFa1JLUHR6MWd2L3Q2?=
 =?utf-8?B?QlNUTjJaTmFtMnRBL1JhcGsyaDlWNytPWXN0Y2xIMFdiZy9jMzA1TEZ3alJL?=
 =?utf-8?B?NERmd2swckluUms4WG5YZFhOM2hkN01tQWZXRFZRYnd6bWNKL3hmSUdYUDM3?=
 =?utf-8?B?bmNuQlFKYjR1dTMrU2JEM2pxMW5nWjAybHNKdjlrSktNWTZUY2trMFlhWEIx?=
 =?utf-8?B?VFFNL3E0SmZhSFBlZjc0ZTUyNFZkWGZ0VnlsOHF3L0h2UVNpeTlyejJTczFa?=
 =?utf-8?B?Wmc1NU15bmJzcXFoMFFPdURBZkNsVSswOWlmZk5PQ2JWVHFJVG85eTdld1VN?=
 =?utf-8?B?QTB5M2hhcUdSOVBHbTRHajV1WWhmMjRRMkJMLzJUQlRmbkN5YmlUYm5oUVdv?=
 =?utf-8?B?UUowSng1bVpZbk5PelNNaEhiM3piY0J2WG1JZ09JbURHbWM1Vm9rV0tOS0xa?=
 =?utf-8?B?TUFlUzdBWkVndnVDQlRiZVB2Q2I4RVMwdzZBNTNPM05SYjVIYk00MWZXd1Bu?=
 =?utf-8?B?b1lEN0MwelFvaHVLemxFem9yeE5EeDJXOTZEZHVvbUVqK3A4a0V6cjBDMDhK?=
 =?utf-8?B?VzBtS3B5NGtEUkF1bldRMzdkUDhrRW5JSXNGTTI5dWVSUVFRVDNsUzV3U1Y1?=
 =?utf-8?B?K0w4d2UvamZ3cXh6UytOL1hndHR5aStzNVJOZ0I4N0pVRXJkMCtiTndTWU0x?=
 =?utf-8?Q?j2NrinALfd6lPTFuHirzL/785?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc230213-e0d0-4555-2fb1-08da70a3e2da
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 14:17:21.5838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVSr4aXS1PKs7lrUiHuyIOH2HYZNVxGkUy+S5VUJOAqjD7KAIGTV/45lczRKMI2hxI2lixV6iaQIxDgEAN0Hlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7702

On 28.07.2022 15:49, Xenia Ragiadakou wrote:
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -461,7 +461,7 @@
>  /* Access to system registers */
>  
>  #define WRITE_SYSREG64(v, name) do {                    \
> -    uint64_t _r = v;                                    \
> +    uint64_t _r = (v);                                              \
>      asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \

Out of curiosity - why is the intermediate variable necessary?
Can't v be used directly in the asm(), possibly with a suitable
modifier added to %0 such that it'll always be x<N> (and not
w<N>) which is used as the operand to "msr"?

Jan

