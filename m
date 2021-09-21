Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274D84136FE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 18:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191812.341926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSiJh-0000Np-C2; Tue, 21 Sep 2021 16:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191812.341926; Tue, 21 Sep 2021 16:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSiJh-0000Lf-8y; Tue, 21 Sep 2021 16:08:21 +0000
Received: by outflank-mailman (input) for mailman id 191812;
 Tue, 21 Sep 2021 16:08:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSiJf-0000LZ-GY
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 16:08:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb6967ec-d273-415a-a586-478e399b1f65;
 Tue, 21 Sep 2021 16:08:18 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-vFHV_xWuNf-hRxxZcyxw6A-1; Tue, 21 Sep 2021 18:08:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 16:08:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 16:08:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0160.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 16:08:14 +0000
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
X-Inumbo-ID: fb6967ec-d273-415a-a586-478e399b1f65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632240497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NR0Akg+4kX+0ZzQheqIw5Txm2AdPCdvBk1SsmKfxUW0=;
	b=lAaom/y0iZsckFK14twPT2H3KpAoOdVU1W9hUA/EfXQv959P/lvdBXPy0jdhO2pMH/YO1Y
	rCUR9q8t2cMv9YiIp/4u+mHCS1VDuIf/FtPHHEE3ADVZai/M6sF/OjnKMgxH/a6n37qTED
	FcVUge3G2yDbkcnqv28NZhMOfT8Cj2I=
X-MC-Unique: vFHV_xWuNf-hRxxZcyxw6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhU/Huk+KzPX5T6w93G+kWRiML+laZJIUbq+ELp/GfHpahiR+ILbpspkFF4tzCUj+Eo8OwSwf5yIfYFbxFGNQwehfgdk+sSuScjv9IhaYxOxgy4IwnoNI4qFSLZz/Y8UVF2ZTbqac8XZcPprmPh55QVI9eW2s5hGoGattLTSt/kL1fTbqRX8+tvEHmRIePxdUsBuYTKejiZYeNGv/R6U4B65H7WRmCK1EXMpqFvZlRU1EmgdfZBszVg+i6aMaC7G9LteKgmK90Wk2nw7H5VO1l3agcn12wkF2dCuq+eFVd6ytfcUdUL8qqLfDP6j2lgsPNi2bGaDXce1wPLGh6hDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NR0Akg+4kX+0ZzQheqIw5Txm2AdPCdvBk1SsmKfxUW0=;
 b=R2jZgsOS5y8NM+UxlldHs3JX+dM9wK13pA9zXIZ3UlFrWSxI/DazMg9ak2eorvdhhrS5wzx4DV3GglnJ7DWFViYiZ0icvsyFtC8wIEYNJX+yzjVvzDmlrbQi+aD2J0acYkWjybUWomJr7XpQ0qoE3dlpRBOEtFtQZNsdI/77TBMDOJReQ10z+5Ze18e7FIX3kZ65FpZYZWowvw8CKFIRJrNpgij8Cn2mc7a+aWuv1Yn+bygGZ/I4gkyCz7WoxQEL96mjyxrr6mFvODAjEELDrF2HRSRRme7kBg4jJ3DTv3y1FQ/xE4ZNF02ZIbcKHg3o8NwrEvAbQ28Wu5p+Q87phQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 12/12] x86/trace: Clean up trace handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-13-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f953cc44-3da4-6860-6e55-6a5751c4b3c3@suse.com>
Date: Tue, 21 Sep 2021 18:08:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210920172529.24932-13-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0160.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a3bb977-c766-4dfb-b27e-08d97d1a04b7
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB630405ED6892C307F896DD09B3A19@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mlFjVAd7SgD7g2XY+LzoctFUb2bKHCRGKmdctEPCHsO4B5WNOEuuiTqoA+cxeO8nF7jdMHICshy528FJqSSy6eK857Yzd6EiFpvztu9KIUSA9j8fv8coe0OFphVLgblzo7GRHfQAp4J15NkOAJLOtQELhX6MAris/9TQBv3VeluhDxlKCqlQYbzLdYaG9+cglyJfyxMI8EqRh83Yhhx2WnQqLT7kryDZheVPesJ01oCIQoxJrM5UKsvO/xrx7bu2s86rUU8qH1chOwXR3Q+NjWjHPxG7BEnTFiXXKUWHWpZzEOLEeX5/qVmoWbw2c8mpRMcAnATH2YklfKa5gQCEa/7vGNRevHJfh79QwvlBF88cpKn1jJ9Et9zb6bUjIRrlBImepozrb8QkpLBrXk8SAhiHjGHTBxVBlKwCsVkOP1YIJRDdz3JTrYJousfMTP5JJv3Fym4c3UKL0MNbZUEkEwU9lJEPJ7lI1pdPqDyjYQ9ocxL7EcX7zpaattm+Vlp6E2v1GRngKEtViMnxxC9X46t/HR7xyQVQDKjP7LIz5yFPV0N8S8DfqjPbEmoKmZSYmr4W+JrN4WbPelixKZiJ9lx+zYEh35W42NMfVwCzjxPR2w5K3gAMXXMsCEvkPNKo+lFVUFxqq79aDCSdT/aSR/qsdP6bx4OrvLNXNResIH7lHZ8+7XH4RliaFMP/2iFSHI7vD90ybFn727cABiEqv9IKKQUR/UYNrHAsF/pcfJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(4326008)(31696002)(31686004)(66476007)(53546011)(508600001)(38100700002)(16576012)(66556008)(2616005)(54906003)(66946007)(8936002)(6486002)(26005)(36756003)(8676002)(956004)(86362001)(6916009)(186003)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW51OWwvbUhxcExHc2dSN2lNN0QxYkI3S1huS0tRd2JSbFB0Y1VITmY1VDJi?=
 =?utf-8?B?WWtrd1o2QzlLNmJBUUZ5ajNRdDRaUnpyUGpsM2FjTVZmTE5nQkZ5RXJwcFBY?=
 =?utf-8?B?aE8rWWM5UEdiTUs3M0dPUHBkOEJkckM2VGRRaHFVRlVlRHJtR3NDV05janZS?=
 =?utf-8?B?ZFFVTzRGRmtCWlIwRjlyTkJnWWJwQU12b2xlc1RhdUlvdUNsNkZyMjRLQkFa?=
 =?utf-8?B?eEdONGUxdXM0SHlvMmh2QlF1R05KWEtiYk5mcGpTYldPYS95aHByWWt6b2NY?=
 =?utf-8?B?VzV2NjZJYnZJbjVaMW9QVC9CSmRsQXpiTmMyUlk3MjgvUHd0bWdiekc1ZENQ?=
 =?utf-8?B?YmFaREJwVFN0NUtxNjZid3c4amxQR24wUmFGSzBCOVYvZkRwUXBxYnBLMGpQ?=
 =?utf-8?B?a25WYWxFL3ZiUWcrdHZNbE5KN1dpek5jMHhkTkQ0blVST0s0SHFoek5LN1F2?=
 =?utf-8?B?QVpOZWNtT2lteWZTcGVzczFHRWFtVThMV0UzRGRQUjlxc1h5aFdYREkvbW45?=
 =?utf-8?B?SEdJaFNPUzFoeE85aExHOW53bk9nRkJrRjJDSGtPSThoZW5OcHFuSzJNUTh1?=
 =?utf-8?B?UE93RjJzR09DZHZzakhyTmo4dDE0Uzczb1k5NW1MN0lva2toTnpEWUJFa2xu?=
 =?utf-8?B?QU9mRWlPVlhBV29UWFlNbnE5QTNDNE9pUEsxSXlBV2hKR3NCQnpsYXZ5Smo3?=
 =?utf-8?B?RldueHdHSldBL1JpY2hGbHRuL3NKU1U5eUl5Y1h6ckE3dDFPcllOTk5IK3Mz?=
 =?utf-8?B?dmlHcHlRa21jYnBKeHhqZVViWEVIRVd2VzRnSXdhQWkvTjkwVzVxY21ORFkx?=
 =?utf-8?B?aHE1cllWZHFFS2QrQ0picjM1MmppaDlSRHJ2d1ZXVVNsUG5EVXA3b05MY05C?=
 =?utf-8?B?OHBzMUlFWjg3TlR4eFc5OXVXRm1GQWVmYWlrTm1Qd0k4d2piVkJ4M3ZlZmMr?=
 =?utf-8?B?TEJDNS9NOG1ZY0xZZG1ZczEwMk5XOExKdy9zWHFXWWpRNy9TSHhIUGdhZzJt?=
 =?utf-8?B?RkZpaXpFcXorMVFPYktwaU9LalFJRjNLdVhuYmpGRHE0ZUhwWnlJaURlT0M0?=
 =?utf-8?B?WWdDTmQ0UzI1WDdwakljUGhzU1dpazVNQmtMd1B0SFpVV1B3ZmpnMk1ERXFx?=
 =?utf-8?B?MHVNUUhaLzRibzhTbWZ3ZTJ0K1dUdTZKMXlITGMwTkRLRGN2QW1ydEFLWFR6?=
 =?utf-8?B?aHVwOWtrWlprU2I4KzhTM2lDSjlILzhYNHNORGQycVhyMWxlY1NRTFY4Tlhj?=
 =?utf-8?B?UEFWMk1ObThOZ3FLcXpHemFJMHl0bGlZS0VQMll2QTRicHl4WWJQNkNWRi9k?=
 =?utf-8?B?T1FwNEJJMTZBZlh4V3BrV1lWNTZHNUpLWWcwcEIxanpxQXZMZGZUaTloYUFH?=
 =?utf-8?B?Z2FvVGtUekVhdnJSbDFwaU9scjV2dVc2R0VBNlBvbEZHRmVDTWNKa3lvVDBR?=
 =?utf-8?B?a0FGamxSSFdNL3VtMVZXV09QY29xdm8zZk1NbVNyV0gxSk1XRUJhV3VYSk1V?=
 =?utf-8?B?bSt2bmh1QnlkelNrOFQrUGtXU0JZMFdoVmpGRTI4bUN1UUJXMDZxSWZwdUJM?=
 =?utf-8?B?ZTlrMlEzZTlBZktFVnpOT1c2MWJab0pkcHIvWS9zL05lbzlHbUtMVGEzKzdM?=
 =?utf-8?B?QitEbmticXN2S3BZeExiOFk2MG9PUEswNWZGQWFuWEcxMzk3VTl0MTBzZXcz?=
 =?utf-8?B?c3lzb0FtajdLYWQvZkM4VXZTaXpDWi94YUNnMlF2SnlWVVhiUURueWZKWDlo?=
 =?utf-8?Q?08Hnu1Mmep6DTns0AUOtLbdOITpQwR05x4kTA5S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3bb977-c766-4dfb-b27e-08d97d1a04b7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 16:08:15.2344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6u8foeE/+c8Oo7Y/1SErLsaBy0Blg1I4k+9SLgFjn6YwnCZSpuBtQxNclNJjej+vO5Frg97b+L2qZG3dkOv2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 20.09.2021 19:25, Andrew Cooper wrote:
> Use more appropriate types.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a suggestion:

> @@ -48,30 +45,28 @@ void __trace_pv_page_fault(unsigned long addr, unsigned error_code)
>  
>      if ( is_pv_32bit_vcpu(current) )
>      {
> -        struct __packed {
> -            u32 eip, addr, error_code;
> -        } d;
> -
> -        d.eip = eip;
> -        d.addr = addr;
> -        d.error_code = error_code;
> +        struct {
> +            uint32_t eip, addr, error_code;
> +        } d = {
> +            .eip = eip,
> +            .addr = addr,
> +            .error_code = error_code,
> +        };
>  
>          __trace_var(TRC_PV_PAGE_FAULT, 1, sizeof(d), &d);
>      }
>      else
>      {
>          struct __packed {
> -            unsigned long eip, addr;
> -            u32 error_code;
> -        } d;
> -        unsigned event;
> -
> -        d.eip = eip;
> -        d.addr = addr;
> -        d.error_code = error_code;
> -        event = TRC_PV_PAGE_FAULT;
> -        event |= TRC_64_FLAG;
> -        __trace_var(event, 1, sizeof(d), &d);
> +            uint64_t eip, addr;

Like you've done in __trace_pv_trap() and __trace_ptwr_emulation(),
perhaps name the field "rip" here as well?

Jan


