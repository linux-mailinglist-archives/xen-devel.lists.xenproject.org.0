Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498BD7126DD
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 14:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540121.841633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2WnP-0008LE-Fg; Fri, 26 May 2023 12:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540121.841633; Fri, 26 May 2023 12:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2WnP-0008Ij-BN; Fri, 26 May 2023 12:43:51 +0000
Received: by outflank-mailman (input) for mailman id 540121;
 Fri, 26 May 2023 12:43:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2WnN-0008IZ-G5
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 12:43:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5a072a1-fbc2-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 14:43:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9637.eurprd04.prod.outlook.com (2603:10a6:102:272::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 12:43:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 12:43:45 +0000
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
X-Inumbo-ID: f5a072a1-fbc2-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvMk3VylcAy5f8Nly3tOySrIRrT5xSA1aHhMmZeAHGg5pWXRt+6WigUSLM1vTKNh20tlqRFF2ZPDA/RYadE1L1630ws6VMoQvMxU+LIp/xU/3B0uBv+DPvIRAgmrxWzcwLz+qrhIJHk7D/QV/B0nzKMDBNc8SQ4xBTbUElsAHNgyNNb0fR8zGXQW1qveCmoTj8HUjw+90sycbz6DeNIo11lPIJ3PmV5T7+j7K0EWw6/WrxTxQV9+HRerjLVGdxCbmq5JlX7jRDJYzUKXNjkdTfoHiDvxhxrxC7GNBgZ3vmNFUBCVbIXU15SwHV2S3pxPY0QIJEIiTc8OVK8bovyVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbQjKUhKwl5FaUv+O+ExmUqYGjiB6T0MjPVKu0iLULw=;
 b=Lhi4uaYBB3336tfbjiEfxpduX4ua0lSdK6XeGfQJe1JxUZJR30c/77iAusJg3qt2SJ1pWYf+vplF0dZb/w9FMOt3isbFkHhGvS15CbDa8KGkDMzwRU/KQHhkN/e+sPczYEdp7KyIIJM3BRt/jC/0RPUzfdNEXrQ3e8CuUMSMhCUFrRbjRgGH+d+3PRQqRH8x/BWx9Ov+1acfW27dGoVmU3rJfL8GGsZtT0VVExwk4funphrBM+x2YZmFPt9z0vRTk6Qglvp5QZhDrJJZPRNtYJ7AKDU+CEvrQp3KfO2qAfYJ8U01tBHD6mhmUcvb3j9vKZgdpaSMQKivJgkMy/Ghjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbQjKUhKwl5FaUv+O+ExmUqYGjiB6T0MjPVKu0iLULw=;
 b=GxDHCE+CLmlluxP7q4oButl2gCicZsNDmtBkdPQFNUAXHW6DTyR8yWrpmOxZLncJztdPYZptn/FpD8xBYBtfG8uRGqARz1LlPnS4+szgY0SN8a5OMsmh21YsdwXOhmb3IObiECbMDFiIJY4hzzAQz2+SwAH0v06uRZSJy3n0vGcynQMGrzE7A9iFipIu4JsEgsR5AQ2TfNcZYxHMb+VeMmrakZRJPsON1Dltsh3euoJZSL0MQxzSZDeZrxfC4KTaheq1FzvSXQQdLlwKnZNFjNllIcFF8+rhsoMhlselK6dKfEYgEC5PAo37dKRlIh2zb1dzL7P+pK/ryjs1Fqpdjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8fbe0439-392b-e7a0-1480-878fb923e58f@suse.com>
Date: Fri, 26 May 2023 14:43:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] xen/x86/pvh: handle ACPI RSDT table in PVH Dom0 build
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org,
 Xenia.Ragiadakou@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 roger.pau@citrix.com
References: <20230525231851.700750-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230525231851.700750-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0221.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 553ca0e9-4c1e-43c6-1515-08db5de6d7df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EQrpYqk8augXYLzJ0iiy4juTgZdWZwNX0I7AvSYMrxE5qFhbW5X4zxtgvXsE1RV9rK3mBcPSGfbOjQOyyhecTBp8fNS/bAX/L8XZn2abfwJxvDzSUQQVmb8EK1rlI7aike2RoYwYaYmK4RLmi9fTfK+aRiz/iYbpwghUGCuXfB2M0g43R4fCzhHKQXSbfxRHHXfEsYbdN4u3a5WGmanw/32Kvcoq+aRIE/TT7chIwpGW8dn6SwR9+YkFJplJmLuqGhTXTo82TgfZcH7DJOE4Cw1Pq8UMqcFmz58ZmE3qt3gCMn6Ez8hRg3BemtCGn1FEgxUFoF3wPo0v5S2onPw/7E4UnWOhezApnrYyDadTL5rPDIGZp6kU04BBNXNOmuMteuZCRcep8oXJEPFnXl0wEzp5H3m9SLXMaUiHhgc9bEdIrkia9vOiTWrLBOcRupvYMwwASQZS/KRzk0Ctzxvx3HCJr4G2cGiO3PpqbyfrM4pWo5SHyHsmX5v7a5ttiUB/+6Akjsa+TZEQb/CL+kWhIdD22n9fUD8xNR6Umy+NIvfy5swqeSnVlAKHd7VnkAnjJd5MclxaLv4bEjRO44bzlnixzNhN/a6KG+FN6Z8oRvaNreWwufErxPWrt0g0GqT0yeUKIobxLd+N6U1u/HKsmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199021)(41300700001)(4326008)(316002)(8676002)(66946007)(6916009)(66556008)(66476007)(2906002)(5660300002)(31686004)(8936002)(6486002)(478600001)(26005)(6506007)(186003)(36756003)(2616005)(6512007)(53546011)(38100700002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0xTcXNKZUZ2ZzhsWld3c084WUQvZDlKNGpWTWJFK1EwbVJibnYxMGkwdU9Z?=
 =?utf-8?B?bEN0MkhnMlgvRE00NzZEZXFvc0Q4M3VGNFJtUUttamhQUDUzT0ZaYmxUQUZD?=
 =?utf-8?B?aEtIYm9MZS9aMXJLQi9VZ2dnclFjWEFrS292MGIwQ29OVnk1em5kQ0p6YndZ?=
 =?utf-8?B?dE1EZDVocU5mOXI5Y3JQamVhRmFBQTRSK01uZnJZS3FlWHNsUmNLekk1Mlc4?=
 =?utf-8?B?VG5aNTRicEZ5Qkw5bDV1Z3l5cEZ3WFM3aGR5RTFkZlRtcjk1WWdhcUZnS1Jm?=
 =?utf-8?B?OGlCMTRPV2E0Z0gyTThVRzZrODNSYVlUbkZGVk0rcU5xVCtab2p0TXU1aDU4?=
 =?utf-8?B?TFdNdGh6UnhOdWhma0xzY3BTakdxVml3RFNEd2RDQ242R3NCbE1LTng3NjBv?=
 =?utf-8?B?djlhUGxJeTZxcFJRU0M3MmY1ZERXTEU0bXFTUjZMejVQMXk4dlh4MFdFUjNT?=
 =?utf-8?B?ZC9QaWs0TjNuSFhJNGNvaG1lR2FlcFZFSFpqenQvUEZlSUowMXU4V0FkV0Vi?=
 =?utf-8?B?SG5nNHYya3E4bHA2eG9TUUxSUTRVQm9ZZm1yMWpCK2xHUE9HbFQrZ0lrVDFX?=
 =?utf-8?B?MkU0VCtxNXhXVEtkL25LelJDeVBNYjJvaDRseWtGRUZYSFV3WkxVQnhCNHZy?=
 =?utf-8?B?bk44QXhpN2p1WmJ5d3ZObkI1dzJpSjhhWWkwbmllbDhtM2l4NE5HS0hqcWlJ?=
 =?utf-8?B?NFlNbE9qY2tzRS9mN1FCTHpMbW94TDV5U2s4alNIS09RRTlkUTFxWFdvejhG?=
 =?utf-8?B?c0R6bzZSNkNzanNvZno1RTBqS3lGc2JaQ0J4UjAvcEtCSFRBM3NsdjQwOEV1?=
 =?utf-8?B?bTZMc3pmY0E1eG4yNjIrR3phRytSekJLM1JCQ0xZd3k2dWRaMEl4NzdVd2lv?=
 =?utf-8?B?elhIRVdzWEJORVlnQS9VSC9USENLU3N5NERXeHZUOUhPNStneGR1ZmovdmNw?=
 =?utf-8?B?SVp1RWkvUEtzcGxBcDdCbXZxU0YrY3Z6Rjc2NFFHa0FoUEZpQllacmZ1ZFNW?=
 =?utf-8?B?TEpEZGdPbEFBRkNzelJFby96WXQrNGN5Rk1vK0tpa2hzVG9pSmNzak9CN21o?=
 =?utf-8?B?L1M1RWRpMlFZNWV1czhwQ1YyYjVxalJ5ekEyKzh5TDlZZ1Z6ZDgzSFR4TkpS?=
 =?utf-8?B?TGRoSVV3Z21MZXVoeE5WYWh0Vy9ySC9JRFBDZG1vU2kzalp5Si92UnNiMDNI?=
 =?utf-8?B?UkJocVQ5bzNNL2l4eE9acnN2cTVOM3lndjRTTlVPU2hCWXZ1Q0wvQ3RmWWJz?=
 =?utf-8?B?SjBYL0dTc2h0U0dKQlZrNndyM0cxY1BtU21GcGtWeEJranZVQ1BybFBxUDMy?=
 =?utf-8?B?R2RwWjVQVVZYa2wyRzdxamRqc3NQS0RGY29SU3liZVNBdExwczFXU25YSUNM?=
 =?utf-8?B?eUlsdW1RM0VpNEFLckIzSFlONWNNVHpHTXRqbjM5Z1E4bFZZM3VrZ1dWdGM3?=
 =?utf-8?B?Z3BqYStLbGdMVUVJLzdhZlBFT0IyRkkzcE1jOE53bGdCQ2d4RmVhY2twYW1q?=
 =?utf-8?B?cnZhcnQyT0R5dk12dmMzTmwrNnRxZXcvSndFOWQ1TWUvUklRd1c4NHl6Mjdp?=
 =?utf-8?B?cEVFaGtGWmlaeHloamY2Y0N4SklaM0hxNDhxa0VuNHRUSE14c0JKNE5RNzYw?=
 =?utf-8?B?cWE0Tk9sTGQwcVRnUDFtZkZVRGlNWFVmVDBITWJzdTVpOXhreis0bWk5WlJI?=
 =?utf-8?B?Z1hRVnhWRlZEQ1YrTVprZEhPNnJMQ3NlVnZOK3N1b0xCS1ppTHNFdlVvRkRI?=
 =?utf-8?B?UitQODltVnk3VVJNV0w0N3QyQTBsWVo1ZlNuYVVaTFVyckZPcUk4Q3l2elg1?=
 =?utf-8?B?aE10MzZmWUpxbHR0V0JVV2RFREN2Z2VBMUlsSzVOeXJ2NUkrS01hWmkrcHI0?=
 =?utf-8?B?VU1hS2ZGOGZlOWJMK204aEM5bFZBSnV5VjdVeDh1SDdIT2tsamJ1OHM1ZXYw?=
 =?utf-8?B?K2tZSzZobXl2VkpqMGQ4ZGxXUlVVbDVzVlpSOXhTYzM3Z2tzOHlVVWtkTnRZ?=
 =?utf-8?B?UVQ1TDVZMTBwOFBicnB4bzlnQjExVXpKTVNOb2dYUU1ITzhRUEprbCtvamhT?=
 =?utf-8?B?Szc4YUkyby9UUDZxSS9qV3VrN1VqQng1Uk90OE5DVENvVGsvSWVTY0lIWVdK?=
 =?utf-8?Q?krE+0OLI4s9hRA0gOqH1Ict/c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 553ca0e9-4c1e-43c6-1515-08db5de6d7df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 12:43:45.0477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KqC426xLfZcoiwI+jWKpZsKCz1sec441aV6/XwpQ75gqa7vabvpA0kTdnhVGbsu2B0e25InRjTjEv6OpF7xvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9637

On 26.05.2023 01:18, Stefano Stabellini wrote:
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -966,7 +966,16 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>          rc = -EINVAL;
>          goto out;
>      }
> -    xsdt_paddr = rsdp->xsdt_physical_address;
> +    /*
> +     * Note the header is the same for both RSDT and XSDT, so it's fine to
> +     * copy the native RSDT header to the Xen crafted XSDT if no native
> +     * XSDT is available.
> +     */
> +    if ( rsdp->revision > 1 && rsdp->xsdt_physical_address )
> +        xsdt_paddr = rsdp->xsdt_physical_address;
> +    else
> +        xsdt_paddr = rsdp->rsdt_physical_address;
> +
>      acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
>      table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
>      if ( !table )

To continue context some:

    {
        printk("Unable to map XSDT\n");
        rc = -EINVAL;
        goto out;
    }
    xsdt->header = *table;
    acpi_os_unmap_memory(table, sizeof(*table));

You're now pointing the guest's XSDT addr at a table that's really an
RSDT. After copying, I think you want to adjust the table signature
('R' -> 'X'). Luckily a revision of 1 is valid for both tables.

Jan

