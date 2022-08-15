Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9336F5932DD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 18:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387672.624009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNcoo-00081f-FL; Mon, 15 Aug 2022 16:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387672.624009; Mon, 15 Aug 2022 16:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNcoo-0007zp-CH; Mon, 15 Aug 2022 16:19:58 +0000
Received: by outflank-mailman (input) for mailman id 387672;
 Mon, 15 Aug 2022 16:19:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNcon-0007zj-D8
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 16:19:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 198a0241-1cb6-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 18:19:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6102.eurprd04.prod.outlook.com (2603:10a6:20b:71::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Mon, 15 Aug
 2022 16:19:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 16:19:53 +0000
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
X-Inumbo-ID: 198a0241-1cb6-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK+bJLoDov5WVQYimvAhYVEL6eMpxn7eMEMKmiUllRfhpYzNEf9MfqxhaFvq9cQQXsktmpjxj73hVDcCk9PiJ65Enz0f8qXQv9Fxr+TRKQRmwkHgHS5/XhDJpXKPuhWsXhH2lXOBbtXq6NEiTOprF6ysNAssHnhcWgHNyZ72zJMtrSE1RFZk1fiN7d9E8TWxI3X7CJBH/pJF0d506yYhARdvTxHudZj4C8ZXHPFBZSBo3ShXUCxVW1odbw2Ur5S0uoD5XC70MazjlzW08smpF8JMtbRorPxvOJ7AZSWYIWiAE/7t34p0nzKOxC8LppudES3nYMOUzrWI36tQD66AHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzdTEu7s26estwmfSRc7xCggcOp93hzkdIuu/yFAY8g=;
 b=nh+KTi1sbML+TfT4rid4juLD8urFDi3zE8N7hPMkCRavZQ+CBr+HD36pn4hnQ3fSAGXBg+MYKwQpMQZsIqEWN59H580+C/QVUMVI8rH06LF89lhdipxjsymCJg4C6b4UKuUIu9szo3vVKMWBV4F5yFCn5usKhKJr5ihGcvdAt/8K7U3bMIi0cIrTUDA7SbKu5tkvhKEeBH+hqUytSU/YUgXN2Xi3G/WDqsAbII1ru/tRxRjjZCNLK+AkHFqRFIwpF8MOYXaTQZ2TAOFArhjfLzk+/oT5AOzHYwiCXvpEE2StIBFXPhClFf0u7PE0EWJYXYFmdXAZ/1f0gLBj3sWv/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzdTEu7s26estwmfSRc7xCggcOp93hzkdIuu/yFAY8g=;
 b=Nw1mxflqwETWkkNQ4UAm4+f+wY5FuKntnm4FvQ6GtAAataxRVMthzYHMLfJsOGpes7VTU+c82prb7LKRVtjOKYP+NNVwOtGYLn0pXNWFR937osxyDixjV0L9mM7FB1heornF5ErhztS3cOvVZuFy0oYDCslutTTShDvkGcEMI6PxCe5aWOjXopnWPYhYOZDqxLpTYyS5HyadQopGRfh2iBe2ZwVUWbpEmbQOlQCfF+A3uugBO/QEWiiD+XJ+nmYSEFjS82jjz0WZAuwNOMvtqkDFDAiIc9loTZfRUiBk12TEgOBUaPzkBgzIH7VDmgWnS0nUy9Ykupcb4ox/xjg/Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com>
Date: Mon, 15 Aug 2022 18:19:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <4c3976aa-dad4-2707-2852-9b26593692d0@citrix.com>
 <pDQL7BhwlO49buWymLE-VFEZJim7qNeMmAeThZgHF9qzcbNbQ6ZoSXktgD14I_HYpsdxqfCugrNoJ227u5DLCWEEXk_h9c7bf4iKdgoQbQ8=@protonmail.com>
 <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com>
 <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com>
 <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com>
 <c24c469a-e0e9-6162-b8d3-07c1707fc2d8@citrix.com>
 <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 174b5c07-6c2e-4e9a-9334-08da7ed9fc94
X-MS-TrafficTypeDiagnostic: AM6PR04MB6102:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZlJWopOAV14iBmTYPL+4we3uOVa2cCWoZHGF7MVEXkmy0UGCQSfablU0KDDwo783hBErC3gxPF2eJg+TCJD6WR7eB1+npNpidxvf8Aklcwan8LkTxb2kx3HOH2jrkOd7uLKUubfX0Z+DRnCe4WI+bqhTiSvKoybvtIDoS8Gp4DXuuWrG4ZCoWK42TdWlGG5sOLZHvYjU0lgD9oFhNi4fVrdHn+CN7fT0chx7dxFx+u9ehrUVxyhf/M5YgwVZqYNUPjp5X7VJSN2Wu0CEwak2a4lpGUUbnByAYA1pRHQpY/1x2KXjT+fC5pKS6s1pc/rBbTI5cExmv9Up4XE3fuyVUSelULVsaVoAhUs83UclpB9t3qZ+To2e4hKdmmW7QDAM0fkfltZWij4j0fWjb05fMKpMg7oORWqeAXePrPCSxpTHJnz8gVjvN77yU/XgiOxnPM5vaMjsuo4chTtB4fkRZ+d5iAKDplIBjOlKbljGlWyeA0KVR0YOylE0AGRD35lr0z2JvM3kPxeils3yqTfy5GtpkSyimZzasLaShPoprbuFY2jElREX4dCuv5T0nL+g1Ygg1XUwAMSoLLqPpSjtMlxb/4vD6UkuEXHd/Aj3Tx7eS8OCyRq8wN1+SyrTJYHVIN0T1MSI0xBHdXzt0/F8GM+cV61N1NPEVkf8CNq0vGT5Zj8aCoYypmplvp0A6xCeIftI+eoI035yuJLXvjv9jdZ+kh3vnXdPDxw3Ue76NrxMhLX7EO+eO2KiMbizL4cSQYwDlN+0HN1Wn2T+mfY1DxVbsqf3kdzJP3O+rXPYJqxJi2Ioc8Yxwq8eUP+bIFR9yi0jPiotRdN83/0zzuYc+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(366004)(396003)(346002)(39860400002)(31686004)(54906003)(6916009)(316002)(6486002)(8676002)(66556008)(66476007)(36756003)(4326008)(66946007)(83380400001)(6512007)(26005)(2616005)(31696002)(5660300002)(8936002)(4744005)(186003)(86362001)(478600001)(6506007)(53546011)(41300700001)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dktaSFBPeDNPWmJCd0FIK0NJemFnbGc4c1BpRHJUdCt3WHM4RDhmczlDQWRx?=
 =?utf-8?B?M2prWXgvRUxaSXloSHVnWTFhczJ6b0cxRmJXdFV1b1RFbk1yVUVpRFVMc3lM?=
 =?utf-8?B?aGhFQmdPMFFFYjg3YkZ0RVordEtTOEJZSW9wd3p4Y3dtanNwV3dKWHIwZENR?=
 =?utf-8?B?ZTU1U3NvdUU5ZXM4bGVadStBcUNxOE1HMUY5cUI4VE9tSEM0bnFsTnFFUUZO?=
 =?utf-8?B?TEFkb0gvYlJuNW1DcUdBZzRDMGJCVWVQTGZYN2hENmVoNUJ2aHpWbGg3UmVq?=
 =?utf-8?B?cy91TzRoSlNUZkZHbHprdklUVlZvZUFTVHlIMm4xa1YvSER1TllydjVhbU9B?=
 =?utf-8?B?QTBNaTI2cSt0ZTU0aVUzZ0xxWDFiQWh5SWtKUDJWb0QxRTRMNmZXRDlEMFpw?=
 =?utf-8?B?RFFuUHRKcnRDb1Q5V2tTa1dhWDV6NFkvb05SMEJqK09zbkVTZU5mUmdTMGFp?=
 =?utf-8?B?czdvdWd5ci9GWTZmRkF2cms1RkorQ3diYUc3dzEwNFcvU1pVb2hVTG1rYnVE?=
 =?utf-8?B?c2lFMzU4M1ZkT2p6TEJZaXJOTHFMK3RhdkVESHpIRVlYTkdGckhYRU96Rnkr?=
 =?utf-8?B?STUrNGFmQ0ZTa3lMRDIzRGVKM0RWQjhjZVRNV2pmNG9YNU5vTzlESFhXUlBU?=
 =?utf-8?B?WW5adVBRcFZWeTlCaEFQajRRUy84cjNBQnJwb0pXaHRkYm5NWmtlZit5L2Iz?=
 =?utf-8?B?Q3FpRnZXSTB1WHJqbzczOW80MkpnbUpmaVN2bFNpeVg4T2dsdTNSRjRPRzJm?=
 =?utf-8?B?dndVNjlaa0NZMkloaEJqY0lEMFk5OGI3dVdlTlVzUnp2eHFVaFo5VDc2bFJ3?=
 =?utf-8?B?M3g2WGlSbTVtVHZqN29zWDliZ0NSUWhJVktHMmJSSkcrYjZhR2FoM1NXL0tU?=
 =?utf-8?B?Ykx3K2QxY1A2Q0lxK2lDWFJvWGNkSThhb2I0QkJmUGRaZlNJV0lZam9QTDVa?=
 =?utf-8?B?TjIzakE3cWtSc3d2YlBKVE5HU3c3SHRRemxaQmdNbi9IeGt4SjBZb3NrZUha?=
 =?utf-8?B?dm5nOWJKWFRsZDhYdENRbW1BbllobzQ2VllKUDZCWlNob2Q3Rm9zcE5hbllD?=
 =?utf-8?B?ZytVSm9EdDJoWGxXUW1XTmc5VjJ1RGJXbXlHL2p2aTZ2WWxwVUxCWFhLWFRI?=
 =?utf-8?B?eCtnQWRNOGYwRStrK29BdWdKcmZRNm90Mm1GejYzaWJUUHNUWUNpU0NoUzBa?=
 =?utf-8?B?elp6b0R6Y2YzbXlLa3FRMUVrTzJyWUJiL0hPUGlENjB1cFVpUXA1eS84ejZO?=
 =?utf-8?B?dE9xZCtXSjBiM0NnaVA5NElCSDVZUTlDaHVEcnpkR0ZDNUpxdXBVYTM2ckN2?=
 =?utf-8?B?THNDNnMwd3B3REdWczQ2djQwbVNkdHlqY0dCcWlDWGo5U2h4VlJtRktqSXY4?=
 =?utf-8?B?YjZ5a2hIUlpTSlloWDdFMVNZOHdzRVRLYVR6YVZLOEpwWStxcGgrZHB2MmxY?=
 =?utf-8?B?Nk10UGdnNVh0SlIwbUo3UkRkZHduYVdMeld3K20zckVTNGxlNmkzczlMbENS?=
 =?utf-8?B?dFptbWpkcHhoS2hycWc4SjJRRWN5WFRTSmRrdTlSQU1MSHRReHN1UUNOU25t?=
 =?utf-8?B?TlFzTks1K2xCT2w0d0V6ODZlZktGUTZMQUxoWWNRL2hUUTQzLzZGL0JPZnRG?=
 =?utf-8?B?QXd2YXNHWFJNSlRDNS9RWkhKcUZYVjFUcysxYlp5aGI0ZDVlZUQ3M1N2UHVE?=
 =?utf-8?B?MTRxQ3JOcmpmOWQ5ZmtwZmJpK2tySUYwK0VBcC9ORVlrWVhjM1VHUUplT2Vw?=
 =?utf-8?B?R01BMk05aER2NU1TNFZJUEN2dUZncE91TnRkYmhpZWFYZUs3amhaSnlmZ3VR?=
 =?utf-8?B?RmJMbEM2ZTZybHRuVGsxTDFTNC9IMXp5WTVlU0l1WjVEMVhDRlA1M3VRQUZz?=
 =?utf-8?B?UGJ6M1pMUFowd2JMckZUT2VNMU5NcUdPTkc3RzlPQjlKWXY1Z3F0UDh2Yk1N?=
 =?utf-8?B?d2NHSlh2THpqay9lRC9YcUZPTUNxQ24xSzk3Z0lXWVI5UnMvUE1LaFRueW1m?=
 =?utf-8?B?UmpiQ0t1RHRRZEdzNDR2RG91QXhvTkxRMHlmbE5wVUw4aHFzdXJGSUI3MzBo?=
 =?utf-8?B?dWY0ZE15RnVQR3NGWGZvNnpPMDJsMFlYV0xiZDgzYzc2aE9ESWFZNk5OS0gy?=
 =?utf-8?Q?P94lk+npcsUDfipiWOtUZIBYU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 174b5c07-6c2e-4e9a-9334-08da7ed9fc94
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 16:19:53.8038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d74qdeSkSCEaBR2tvtk7MAgOWLc3AdHGcEFtd16vJSknIVri60hGnC5g766vJEuOo+7dFxi+oKCUd4oI1xokfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6102

On 15.08.2022 17:39, Dylanger Daly wrote:
> Great news! I managed to get it to log the error with your cmdlines
> 
> Please see the attached images
> 
> The error "BUG: unable to handle page fault for address: ffffc90040639019"
> 
> It appears to be a memory violation error?

Yes, there's an attempt to access something which wasn't (successfully)
mapped. I expect there's a log message ahead of the actual crash telling
us what it was that was attempted to be mapped. A wild guess of mine
would be PCI MMCFG space. We may be able to read something out of the
system's ACPI tables, if you could extract them (at least DSDT, maybe
also SSDTs) into files. It would then also be useful to see the
hypervisor and kernel boot messages, at the very least to know where
certain things live in physical address space.

Jan

