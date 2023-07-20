Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E17775A5F1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 08:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566335.885040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMMgL-0002Ax-Ux; Thu, 20 Jul 2023 05:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566335.885040; Thu, 20 Jul 2023 05:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMMgL-00029K-SO; Thu, 20 Jul 2023 05:58:33 +0000
Received: by outflank-mailman (input) for mailman id 566335;
 Thu, 20 Jul 2023 05:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMMgK-00029E-Ak
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 05:58:32 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72694731-26c2-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 07:58:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9709.eurprd04.prod.outlook.com (2603:10a6:102:26b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Thu, 20 Jul
 2023 05:58:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 05:58:25 +0000
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
X-Inumbo-ID: 72694731-26c2-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7bSMAke9mMOP5B8vhhvxtaOKRkKtL4n+4NW/ByXFTFoOCRssdeEpU3rALavFrQ0h5jPIADl9k81qPLKjRl5lRNUqgLVXM2xGjtkCZ6JReaiRv2O+8b7X2wUzCHHbnrDwA8WLIr1HRWHYiD3PQaKxPnFsDqDHrEh/zXsJTYGXYhcU39fF8p64T6gefw6a8yY45mPUhAUtNewSyYVl6PfAKC3ZLTJsGj5iecu5gmEJ1tjGg98wHZHd1fKlF+T0i7oEsA0xoIPBZwX4FwJE618ppnBlJC1hH2Cq1BzEG/bxLyYvkurkMVn00NIYMZoJjef0ytM48p7iqf9TRt1ojMKcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vL1z85zPLYEi37XUl/gthOpeiSSFb9tRVWv6syiwM4=;
 b=KS/Hk9WCr4jIBjy/Enl58yuGwipUmQv3GAyqjuD80IV63iHtjqNozIk3LjuW/Mc8Y+KqlSy15s2n7WCISSLu3DwdQtcKttGb4rVguMRg/WXznRANrlwONGXdMs+UE+yAt/xp/w9/3nezfqxuEzK7SGAFDBIu1SyjzqfC5OUQ3G6DLfkRcD3zy4vNZYvQJ3zqQymy6NkCegVp1MlFKo71Un2ZnDvkZVgA9tDQu7dQjZ/kbh0D0bAZY08l/cM21Z09yYBEz07h5j5Epohr2I8E4rERxDZ9pP72HYRd1Es1ML5T0dIlotkzkkbIPLlv3DoudzEfZCc9o9wnIKYzH9tz/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vL1z85zPLYEi37XUl/gthOpeiSSFb9tRVWv6syiwM4=;
 b=bj5KCRs1DSpBfNuKQMEUmlFhgH0PaR+jA3dy8av8+tvMaDjKyJWYtFi1wBrY9+Hvqv7FAXaMI2Ovj4VP6wNOXOI0HqMe78vba4Z6Z+dnowTPFu7jwfVGemHZ1+eV8L9g9eT4mkAvaqi6yI7SNBvGyMQHpAWxJTuQRimqjHD//pCALvt2VTZUMrMsNIGWb0wBIuG9NE38Rd7cc9mZkkuxU0aoxeVN9kRW+Rjf8dsTSY7KKyJ9AVBtd28SccZfuyQsTFCQsy7ZFbFpys1jCiUZTaxWgTXzZKuded09OziKRE0nFq2JRD5D152HY3sPf/A9Stoe8BW6xABb4Y2W/VHemw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c1a3d447-4b4d-cd9f-642d-e30fed088302@suse.com>
Date: Thu, 20 Jul 2023 07:58:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
 <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
 <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
 <30540953fb363fce4dfd59f8a7e709247a9872fd.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <30540953fb363fce4dfd59f8a7e709247a9872fd.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1097d3-9a83-4dd6-4f4d-08db88e654d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cWWdfHxNR0n4Rcw6FCS3Shjd2Pef+zvU1zWkfJRUWAE7OcPopf6s4G01j3vIQ/IQcJUfFmSf4XpFApzipNU6pF/zv2S0Vsp5N1AeaYN8dZwuUvMseAuST7jxQe5r2Oc8bz0JT76VuZiy0I8MGumXfiFszw8iGtnnamMVES/LJGqYecRoNqxNIw18yMFbmveEbxJyGR+fd+4Jmm8sQyRVlG1LgieFVN9r2o/FF/Jx7rBQxkrFVRJBcYisH88RNRx+TE0BmPeRJPHYm2gFTmQAh3mcFT3AJlKCIfZBy5Cz8fDfgrWho3E9gvIL0AgLxAM7+sSltdOtBFjQHPQ5kmdopV71x/ve1KQorggFfitX6kGUNMwtzVAZ8qp+5oIQ+SdnfQ6R26bjwxxi692ZhAL7bjWyhWb80j0NK4CTyXkBi7Qx/5/6XJ62524ARigqXBcYQmxx1WuEUKuCHtTjzap5HxHOFnCjWiTP7o7yW6KkGuTgU9j1l6wsnglIZ7o88ATTrWP780f00aivzIJkbE0ew6HsD9RwKhSVPts76SBsHH9BYcmVEp3tlkuWOHQNftK+rzrCfAia2F8+2V7xMWvMwAsuOkagWREdcsgFQcu0pAg13vgm+HZN3rPQLO8Z9Hjja9VJvBoK5L4r1sy7SlrZzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199021)(41300700001)(66899021)(2906002)(316002)(8936002)(8676002)(5660300002)(36756003)(86362001)(31696002)(6486002)(6666004)(186003)(54906003)(478600001)(53546011)(6506007)(26005)(6512007)(31686004)(2616005)(38100700002)(66946007)(4326008)(6916009)(66556008)(66476007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkZ2NzRhTEc3ZkNzekY2VFVYNkZXZklGc3NmNFVHRWl1SlNqd0ZSNUJjMEpG?=
 =?utf-8?B?UnR3b3VsSFJ0aWpTcklORVMvV3NER0dPS01Hakp0M3RwZHY2dktYQnRmREl6?=
 =?utf-8?B?QU5WUjR0Rm5QWmd4dW95Y21IbkpxTktqQzdsQnVJQjdRc1kvb1l4WnFqbVJQ?=
 =?utf-8?B?eTM5V2k5L2E1UE9iL0xYVUtxbkRUTkk1M3pkZTNwN0tuWHc2V0h4d3ltYm1x?=
 =?utf-8?B?NVZxdC9vMEJwOGtWZ2NxL0RXZ3ZnM3NxeE5tampqUURSZ20rRVFjYm9mZXNC?=
 =?utf-8?B?QjQrRk41M25ZV2RPUUIwaFJQNWI0WWVPNktkSS9MVC9MR0ZOelMzWmVvVVlT?=
 =?utf-8?B?NDZGMDdlUlVra1pheHZta1FiQjUrcTk4Q2kvNmJWbGVYajVKeUNyeDVMdHpw?=
 =?utf-8?B?S1BCTnkrL1BBdDdpcHFsL3AxclNuOE9Qd1ZUTFFHNUxRdUdQVEJjdTRhZXdP?=
 =?utf-8?B?MWFYdFdybGg4cytSTk1rdWVtRW9NaDRYcHR2b01xV3EwekhrNnA1ZGZyREc0?=
 =?utf-8?B?MHEyaHRUYVNYVmZ5clRub0hRY3g1cUhIaWdsRTQ3cXlzbUpXc00xNStVYk9x?=
 =?utf-8?B?eHk5blpmSWE5LzNHOUNIcVBLYjRoUnZqQTdSYTV5WG0rSEVqUEZmY0tkeTR6?=
 =?utf-8?B?VGV5QXN5T0R4SVJVMHMvTUw4TnlJZ3pTTmFrTDQwWnd5SzFYdUtGOFBrNm5T?=
 =?utf-8?B?SEMraE1md29SQ2RZNnBLWVJPMEdEb3FiV3dZUXRza0hNbUhSeTFDOVRudnll?=
 =?utf-8?B?blp4NGc4Vy9iSlRpdURJR3hDMW9JNStyVFVBV21veHVCdnJQRXBmbkZmT3oz?=
 =?utf-8?B?ZUw1N29hUmpoTENLRnJYdjZuVEE3dWFnWkJuRm1leWRCZVlhS1A2dldxV3Nk?=
 =?utf-8?B?Q3l2N1hiUzRYYzhXUEtqbG51Rk1RWm41cjFXUUxJRE55T001SUJ0Tzd0RHJF?=
 =?utf-8?B?YzcxaDNLTXMxQnpUWXZ1RUEvU3doOHYrMnJ0VzVqU1JCaXBrSGdPNEE4VjVr?=
 =?utf-8?B?Q3g2OXBlck5jWjMyV25ydlpoek9Vb1dySUs3UDFCc2VOVTFlNVFsM2JQUDdh?=
 =?utf-8?B?TWZYTm8vRzRuem1YNUNrL3d1MWwya21qZldzczRnRm1UKzduTjJmZmFjRVEr?=
 =?utf-8?B?T2pmRVB3TklCTzVtTXFnNzlGMElMYnFKUmsvUlZTVlZkZmR2Z0M0Znk3cFBL?=
 =?utf-8?B?YTIrWDNIOWNlbm9QY1JZazFTMEYzN3duZjN6Wk81QUpHV2RwTktiWnBzOXI4?=
 =?utf-8?B?ZEc2Q2Z1Smt5MW1jTk9FYnIzTlJpOGIyRWM0OEpVTHhzM3VINit0ellwWnJl?=
 =?utf-8?B?V3Q2L2wvVDRFUWUwWno3Q1dEZDVOOW9EeDEwODVIdytTdEdneHNHaWdnVEFI?=
 =?utf-8?B?UDR4Z3NSSDhmbVB4UmZSVG5ZL2R1M3VUc0NYUW9HR095dGVaMXNqNnp3NVF0?=
 =?utf-8?B?OU52Nnl5QWVwRDN2ZjcxZlE4QjdWQWlha2RHdWE3RGZ6N2hmVWlJbUQ1S1RW?=
 =?utf-8?B?SHNKdVdLaTFMUVZTOUhHV0xrNVQvaVYvNzgvUjRRbFQ4dm5abFQwRG1DWVNv?=
 =?utf-8?B?QUNrb3FHcjJBdmtKY3BVMVN2NGJFMkhpWmtSRWk3aUt3eFVpeWNaU0UxVllq?=
 =?utf-8?B?eGtDcmdJK0NTZmtDZkwrRmU1czc1UTRKWDFrajJnTE45cEFDRkJuN292WEZX?=
 =?utf-8?B?QSs3azdqYkRKVUpzemJoZU9uT1JBRTBHOEYzN1VVa1Zjdi9QNkFYcjQ0Mmc5?=
 =?utf-8?B?aUVZNk4yb01jNWdpYWJ5NjdCUGUvWFp3RytxWHM2MlkxWXIrUi9TeTI5ODIy?=
 =?utf-8?B?eGJyeHdENXdOWlZtQ3BIemxxOXFJUk05ak82c1kvSUh5MlRsOFhQU09pVDdl?=
 =?utf-8?B?cHR3V2hlNUE4ZDJLNi93SHl5OVlqb3RGbUlWQzVrQTJRSnJqcEhRY1JJVnpD?=
 =?utf-8?B?MmdiTExxbUd0Sk14ZWJxMnAxay9Ubm01TTkxVitFK1lrdTFGZDFVMlRCMzQ3?=
 =?utf-8?B?VEd5M0liT1hoaHE0RTBkOGxLWWNFRWhyc2NjTHdrRzF2RG5IeWV1dC95KzdM?=
 =?utf-8?B?LzVPeDVxWldGOUltVitDUnNlRVhLamw0TzhGbkVTYkloOHJlaEVKcm0rc2pJ?=
 =?utf-8?Q?pJ1T3oaMLvDvqPNtpp2Xf8pwM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1097d3-9a83-4dd6-4f4d-08db88e654d4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 05:58:25.1994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WL61Lfus8l64L+HKP+YVlSj4qZlSfor7lAuk0hQjzdGvQkjlavOCIhxKZNFT6hgYUkaIn0wih/Bh0g5OtshdjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9709

On 19.07.2023 18:35, Oleksii wrote:
> On Tue, 2023-07-18 at 17:03 +0200, Jan Beulich wrote:
>>> +            unsigned long load_end = LINK_TO_LOAD(_end);
>>> +            unsigned long pt_level_size = XEN_PT_LEVEL_SIZE(i -
>>> 1);
>>> +            unsigned long xen_size = ROUNDUP(load_end -
>>> load_start, pt_level_size);
>>> +            unsigned long page_entries_num = xen_size /
>>> pt_level_size;
>>> +
>>> +            while ( page_entries_num-- )
>>> +                pgtbl[index++].pte = 0;
>>> +
>>> +            break;
>>
>> Unless there's a "not crossing a 2Mb boundary" guarantee somewhere
>> that I've missed, this "break" is still too early afaict.
> If I will add a '2 MB boundary check' for load_start and linker_start
> could it be an upstreamable solution?
> 
> Something like:
>     if ( !IS_ALIGNED(load_start, MB(2) )
> 	printk("load_start should be 2Mb algined\n");
> and
>     ASSERT( !IS_ALIGNED(XEN_VIRT_START, MB(2) )
> in xen.lds.S.

Arranging for the linked address to be 2Mb-aligned is certainly
reasonable. Whether expecting the load address to also be depends
on whether that can be arranged for (which in turn depends on boot
loader behavior); it cannot be left to "luck".

> Then we will have completely different L0 tables for identity mapping
> and not identity and the code above will be correct.

As long as Xen won't grow beyond 2Mb total. Considering that at
some point you may want to use large page mappings for .text,
.data, and .rodata, that alone would grow Xen to 6 Mb (or really 8,
assuming .init goes separate as well). That's leaving aside the
realistic option of the mere sum of all sections being larger than
2. That said, even Arm64 with ACPI is still quite a bit below 2Mb.
x86 is nearing 2.5 though in even a somewhat limited config;
allyesconfig may well be beyond that already.

Of course you may legitimately leave dealing with that to the
future.

Jan

