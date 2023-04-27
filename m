Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A010B6F05CA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 14:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526982.819085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0kN-0003tT-5k; Thu, 27 Apr 2023 12:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526982.819085; Thu, 27 Apr 2023 12:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps0kN-0003rR-2x; Thu, 27 Apr 2023 12:29:15 +0000
Received: by outflank-mailman (input) for mailman id 526982;
 Thu, 27 Apr 2023 12:29:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqME=AS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ps0kL-0003rL-Fz
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 12:29:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cc12cf9-e4f7-11ed-8611-37d641c3527e;
 Thu, 27 Apr 2023 14:29:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7698.eurprd04.prod.outlook.com (2603:10a6:20b:282::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 12:29:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 12:29:08 +0000
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
X-Inumbo-ID: 1cc12cf9-e4f7-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC2N7b0tQXNUZuDQa9pJJ54MD+zQz1lcVlX8BWi23z0wZAzTexJnWmjVy1KwiJYxOdvh7hybsf3U7LSz0iqMNwRSO3N/ENAe9+oh+0bweL4WoEHury6WjWCsCgG7OJlpyxJjL7Sjg7Z2dc6SC5MwMFTN1oiOdWeOsnZD7iA9uxiSbd0XWzuCOXugxOP/NZHvz1nR8jPeQFjjaXF68MXBWgLUios2Br1uyrTCjL57RxR2sphoUEt4a2EhanO+GI1lko256XaHLB74y3K+1wc6sot5oi2anGCLI5wGoDAIPh8S1jlgcy47YI5/Ir1NXvzUr0vhgsUnYPqMu5aN0b+vwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJ3ZejmMgiNwVsLvBG8URgcin/AR9FTILHMG5MwlCUc=;
 b=TGjQ+ZpuvAu0CSnQeIL64l08sfSpWONkJEYxVJy5wzqZHVzsU9LY4LKem8kN1ZtOR1KgRBrmhNPunpzTvhho/C0c6xfybQ4Zxv0igcyKmgE9szXRLxKA30Uquno1dzOFB/IF2RKdPxzS2aisCXXGJMOggwgcEgVErLhPn2bViWI4xrq0J3IHc7V+IjyxM3TG6H38/Wwrkqq1pvxS2+9q8BZ4b9qiJyBOuI/Fe2FbqZCvoWTx7R7NnD4aY5MiGVD47J6mefVS2Wvg3aKry2o6rp53ix9/3P9xUefj1sJo3/FQ6ykGF6h/7x2mkJ2c0M8d/mezbtJwLInoE9gPo2iueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJ3ZejmMgiNwVsLvBG8URgcin/AR9FTILHMG5MwlCUc=;
 b=RZb20PL4s0JbvYVo4B2X8i/X5jwL5YS7Q5VDjyVXrOz9CoWyVlGVwRap6KS8MmSNpC9nvF7WWy6JiWC72Uu7bh/+w+2We6e3DZcVoRxsLpFdPdrD2lZjf/5CIwJ3w1qUyZZgFBuC7ImoxWZEXLvlQ8Kc7zU3lrDGz68FHJAGL7MnnnV6Si7OVpFM23us3BqtaPQRQLqATZGYjEfDarzoXqQdUTtn4S/gy77QtlEAXf64SWBfBabNqx/JW2+3ZWIFG0NYY5KPdck8Ju9XBncYgXgdG6PhnwZWHzrqLWRn8FERvte3b+yMxnl+tFqq3Cgm0sLEjSwbJQ2e24vLcDIpWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <104c3456-03bd-37be-627b-45e614a616c1@suse.com>
Date: Thu, 27 Apr 2023 14:29:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: replace bogus assertion in paging_log_dirty_op()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: d7bb33cd-9045-459e-2913-08db471aff45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1tFNJGHVNJsPmMksQFjQLoEnras3mV78PD8vq9tLUzXXdG+Udo3Wpe1nf8fXoKHofoS4MVALGR9iFhtVbqn6j6yzfpJcK1hEN3sf0mPimcRPkljESp0VCj/y96/VCs2cnwzSxp6wzsh46SLMC9rY0urGzHwkG4kxHIasCzcwXkw2wy9k0PdO2gYUHAn+JRPwJrW1YQd+tsWwB02vZfhhS34oUoYrMz5UQwkyBM7WVVruLidBHZghOl+3JM5riXJWoGbmK5mzA6QsJztATPH86WMud0iVA3RzTwRyqyKCta3XthcRv/2NftbY3m+nTUKHiV5vmF4AOXGoo4YQUMQI/DX9bREcfsLDUDBPk5i80F7wueYMbt5PQMkWoAv+wVq9nXiDgv9tOLUe6J3E39zpIhg+e8tRqB6eSc7mF7UA559pCTUSAD0Znt9EryGOzJWzbfoKWfevTLL5CbTnUV0KgFBkqXrx/LjogxEGQ8IJrKCtsIpBEAjtXvuMPaQJdFgaflFrHGeXwnQZwNGGR66ZkkMHIKNiLa5zSedyBhpDI9lP4o3bJRg76JyUZ7OiqgCF9nVKKTkBdaItN+7+RD2fsDK7zxwmJ3qIUU0U2V9a9uCVneYKBN25wzjN9+QlqWMvIulL4CctdlbtTzsIMnAiJpoj6jkquRQbnOjJmLP7veU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(6512007)(66946007)(66556008)(478600001)(6916009)(6486002)(4326008)(54906003)(8936002)(66476007)(41300700001)(186003)(38100700002)(8676002)(316002)(83380400001)(2616005)(26005)(6506007)(86362001)(31696002)(36756003)(2906002)(4744005)(5660300002)(31686004)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUVGNUNDdWw4RTRYRVpEM0d6MHcwbW1wOFhmS2tqM0ppSnU3T3daajI5QkdD?=
 =?utf-8?B?T2pnaVc5RXZkMFdLRGVwWTB1U2k1YzJjMzJpNEo2MkIzRGVheng1WWRkWWtU?=
 =?utf-8?B?YVQ4dHk3OENvQkg4Y2Jxemk5TGtpVW9GNVlOYW9VTldWV3Y2VnBTR2ppYkk1?=
 =?utf-8?B?dHVpdmJCQUhlczRLcVJmOExuMDNOcisvZXkyNmdLSzNCUDdGcS9GZDE0Y1po?=
 =?utf-8?B?M2dKQlJ2Yk92a0djeXI0ZlVmZVN5d256UGFaaFZ3ZFpULzJya3dMODAwWEVN?=
 =?utf-8?B?U1pNZkxRYm8xSS9MakN6R3FOQTBwYzlUOGlzRjJXb1doZzlXT1puNkZMNlZI?=
 =?utf-8?B?ekZ1OXBnKzFHZE9raGxGNHhxanFyeDZJMmQrWjNCWFZ4cVhtV3FrQzRFTXBu?=
 =?utf-8?B?N3RrWTh5eGFZTHlud3A0VE9tZy9UNVJHYzNIUG5mNlVPeDVDR1AzeG9LdHBX?=
 =?utf-8?B?VDU2dDRGbkdmVDgxb05GZ0h6SVpLK0tFcDAremVRMUtnK21GNW1sWnpwL1Vi?=
 =?utf-8?B?WlRrazNLTXpOTEVYMnZhbWkrTFI2OEdRMnkrYnJJKzF2MDRLODBQcW5yYkZP?=
 =?utf-8?B?eVZ6N2kxOSt3SGZlS3JXWG9VdjBuK0hTVklVb1F1TlZrL0dXNHZoL3VVTlhw?=
 =?utf-8?B?ODMzMlRJbTkzYlgwRTV4Ny80RSt4Vzd4Q1UvVXVzTG1lRDNTcEd4NTdhZndi?=
 =?utf-8?B?OXBob2xINkVIQ0ZNbUx4WklQQy8xbHJqZG0xMHlzUC9RUE9aVy9BMnpnZElE?=
 =?utf-8?B?RHpiRHdGRlVIYVd4Ukh1SDUyc2w0K0hlUU9HWC9NMDdZK3luMmdVL2wxMDgv?=
 =?utf-8?B?OWZTL1dnZ0xMTzgvYytpanpDZG9PUm1CdE1OaktCcjZzOER2K0tkSEtOM1pS?=
 =?utf-8?B?RXBjQXpkMXBZQTNML3hJKzBuWm5FRmNaVFM5Nkx3YzROVlJzT01VWktPTlA4?=
 =?utf-8?B?aUZRNFRWdzUwTHptbzVJblVUZ3h1M1pyUEZzTXRXdHVpNDgzd1pHbmgyaHhO?=
 =?utf-8?B?MGw4UmZxMjdtaW5YQk56R2s5V2xoMkpSVVZVaVp3U0RORkk3SXZ4NTZyVE41?=
 =?utf-8?B?eTdrRzkvNWozcFRkUHliZlR2bXl4TUFEQmJWcU1WT0VyUUdXK2MzVkM0REVC?=
 =?utf-8?B?eDVoMlltOVIzcE13SUtHZCszazd3b3p2U0tieEpzamwzMlduWjQybEhOaldV?=
 =?utf-8?B?dVdVTXkyTDlWVTVieXBmL3N3blMzTU5takwxNjdSMjRROWlqZEhOOWVFM0RX?=
 =?utf-8?B?a05FcURjRnJPYnJlNVAxQlZOU3d1Z21xMm1YUTZlb1IyR2I3Tk9UbmUvbVhT?=
 =?utf-8?B?UjdhZmFyWHdab0JDNTc0MEZEcEwvTkk4Vmw2ZWZaMEo2ejRWL3owR2VTZXRF?=
 =?utf-8?B?bEZEdHU4MFVTRWo1dXBEMUdqTm84bUtCb3lQZXArK2tHbWJ5Y3Y1WFBiRWpr?=
 =?utf-8?B?a3JFc0R0QmpOVGZ4bFFGVDljYzNrSkVGODZJZjF5TWliZi91R01OZS9vdFlM?=
 =?utf-8?B?cmdacFV6TkF3SjdRVkRDUFRONFhiRlgwSFBLQnZURDFIdi92a29HQ3o2Vy9x?=
 =?utf-8?B?T1hpejRYNlJ3TDhVeEk4L2ljd2xMdW1tL0tvK0syaERvMktVdytDU3hWS0Yz?=
 =?utf-8?B?WW41QU11cHlORUdCT0tRWmU1cVlZMHFMbzluei9sTWdLTTJrSE5zR2JyZ01q?=
 =?utf-8?B?VFNkdk9LOGJCOEREU1JQengzeEY0V01tSGU0Ry9JSWhXUHdwRGhObjVjU2NX?=
 =?utf-8?B?MnNCZWp3elBoc0swaU41dnhIeFN3emZRMldaYjM5RlR4dTRZbDVuanVhU0pH?=
 =?utf-8?B?UnZ4ZGs3SzZSYUQyTWF6ZmNmb3hZZkNFcGFEcjU0N0FyTG8rM09VdXhEYnFk?=
 =?utf-8?B?cHJETDllaTMraDJxN3NWWGRRYzB5di9PNHhjVFVTNGZuS0VIMUtFeUhEZGdB?=
 =?utf-8?B?L2tUTjhLUWVzSkl2YVNHYk85Q1NzSVk4U1Z3aWEzL3ZraElPd0hSMUlpY0hi?=
 =?utf-8?B?UnBVSnFualN5RkMySW5URUNjRG1ldWM0b0dyQVJuSHRIRkRvbC9IYnkrOElW?=
 =?utf-8?B?UDVkNWdlUFJUNjJQdWZXRXdMK2xkRHdaTVZyaFVZSFEzOWVFS21RdHdpdGNY?=
 =?utf-8?Q?QEvIWJj1LcbYRLE5oOMzSaoLG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7bb33cd-9045-459e-2913-08db471aff45
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:29:08.2296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O53Gyw1qa38ZNtFQHG79A7td0u0CkHlvCioDGNeJqVYxDoUwYqhtrc4jROLbbVVoif1+vPN2NFGpc4j/VF2kMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7698

While I was the one to introduce it, I don't think it is correct: A
bogus continuation call issued by a tool stack domain may find another
continuation in progress. IOW we've been asserting caller controlled
state (which is reachable only via a domctl), and the early (lock-less)
check in paging_domctl() helps in a limited way only.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -431,8 +431,8 @@ static int paging_log_dirty_op(struct do
               d->arch.paging.preempt.op != sc->op )
     {
         paging_unlock(d);
-        ASSERT(!resuming);
-        domain_unpause(d);
+        if ( !resuming )
+            domain_unpause(d);
         return -EBUSY;
     }
 

