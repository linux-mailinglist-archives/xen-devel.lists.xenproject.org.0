Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34FB42A0F3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 11:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206968.362668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maE1M-0005mD-A6; Tue, 12 Oct 2021 09:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206968.362668; Tue, 12 Oct 2021 09:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maE1M-0005jb-5n; Tue, 12 Oct 2021 09:24:28 +0000
Received: by outflank-mailman (input) for mailman id 206968;
 Tue, 12 Oct 2021 09:24:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maE1K-0005jV-UG
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 09:24:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d384706-f659-429b-b890-7d8b6df125ac;
 Tue, 12 Oct 2021 09:24:25 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-S8iHYoLNMzO4LpKNs88Q-A-1; Tue, 12 Oct 2021 11:24:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 09:24:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 09:24:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0139.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 09:24:21 +0000
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
X-Inumbo-ID: 3d384706-f659-429b-b890-7d8b6df125ac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634030664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YJZGcpXtDh02n9Dttd375ZEN/OhO4vsMLJThZyN/6xA=;
	b=enHeJG1RiQJpmsiWIy83hMoNy7jFl2EGDqXGXuiwAAXGg8Xmks4TfbADbhQ7OjoLXmPwx/
	8bKM4nBujYu8utHJpMgOwcSsrOQx9b0R2cqYeI6mMtVWp0l1zEAE1JSNdPUlbcou9p4j5a
	fQBZLsznSVBBGTdL7sLiUt0wZAvP4go=
X-MC-Unique: S8iHYoLNMzO4LpKNs88Q-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aq1sQFcEMdeRPHlrGJaaYv0tiXDnxgNnRTrgnq02Z4Ah4xvEDKHKEnSNyZb58oBtveX2H2Li8Zm7B2JR7OqSsQ/SdK4ztNsZLGO3sb1H9J/QIA3C/Mc6Wgu5vS+vT6wNY4qxl7RifeNyAGgjh6v9Z/FApczv2K+AR2N6kkYwnWpiLa+K5iNPeePkSx7TpwjPPttIa2wYwBPKxd2dO/+lbxaepuJzeAtxGovFkQhqOPHAubnFi9P7RUyam8jLeWZCTKUnkPHrmCdvj4+ESO2U8REbm1JCM+y0RBrk3XE+Owsp2it5UMywUUjL63tXazz48xEYbCMYe1PTsn7Au8XdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJZGcpXtDh02n9Dttd375ZEN/OhO4vsMLJThZyN/6xA=;
 b=T8MLz7TsJ0GY2cwNb/QgPTyjyKycVnOgq8+rCFU0r82J3kuSBd0Jc0gj0fRXuB2qHFSZjJkX//hDwZ4LaPB3tXkygY89OQZtIXs8yODwdDvilzcdgUe+vxccOvfaY5T0l9tAmzB4F8Yk9z11wNUxHE99ZZCWCMs5pk0+Y8SGeIAn6WjsNbIdV/G7gGhu/1LIZmod9uzWMDBhvx9dTDuJdYrj9rw6bAHtsGNnCs0GdT4P9GuxoHyn9dAW0WaVATvleNwqG/TRU967B/EcYuVZ1uaarJeA++14fp0Ce6VKljbsaFDqLXaDRQT0rSDrZYJdyVnnYz42ssbvWUb7+GpBYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1466e946-d247-2380-6d7d-cda405a2f255@suse.com>
Date: Tue, 12 Oct 2021 11:24:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0139.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c0417cc-9000-4885-c66d-08d98d621352
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150FBA15267CD5C174E4C8FB3B69@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GzB8GA8GR5pM9b0lhJj38EXUQV2BM+eSB5oA5q1E0samvaNt10y7pPxi1zpbNSQyazzKEnm+rqjM7yviaQSj2/e2aSNkwEH6YcqcGeSR4N4Nqzppb57qnWZ0BrGlaGG5Ck4AL69LNw5DCRboyGvTZOJst8Ntb0pQVFzrzIxGQ+uiZDRwr+NFok4nfoZe+bI0oAAK+GrbbAolFMBVk4T2iT/e11h9NxArhbsma2c0BxBqo9JY4+WN+9xYXwsLaxAylKxZ1y+JlXSYWAfgMBraJhkqr+varmCFrd/Gl59yu+7pFQX3hOOkGlmhGdgo6gKcJ7q5JM1RSDyaE/FZl4spRwziZ8wuC7GE+nIet9Mkje6Ike4PdiZq3698V/N1Gxmjl6xqBWYwYlaqumO5axL7VJ2S0O61LstPfoHqFkVIwQkzDs4+JRwClBaNPOzkCuzKTGuq169Oty8BTlUl14LvILFxhQIb72hN48xRZE31u4p/DEPAyR4zg/SGBJn890uGdc+/sbUhhu5ZFhgFtMRx5+nJ2cD7aUf4uaX2nauHgS1n1p8uRAT3xJ9nz/ALqkzFNVsTSeYYC3dVl+JIP8YjdoNAacRV+rUlTZVkHoacnL/UiFp/5X5Mb8rPmCwMto9uHr1KtAauiQvXCfzzqIHuFwJ2yjfm1T0a8Wg9Fc2n1dT6w33xZpTRUIu7MMsfg1/T5fqxevSK3XcfZFvrAdrFHADlBcnRgcq2nHcCbxkge02JHj6sH46oQkf8/O16UMQQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(38100700002)(2616005)(31696002)(7416002)(956004)(316002)(16576012)(5660300002)(54906003)(66556008)(66476007)(6916009)(2906002)(508600001)(8936002)(186003)(26005)(4326008)(6486002)(86362001)(36756003)(53546011)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGxmalR2M1gySjFNa3BqdERIakJucElZYm1CRVlKenRTTm03dTEvSHFSa0s0?=
 =?utf-8?B?UCtBRHdjeFpjQUk0eld0OXd5WllZbHRSaVlEcm9PZnhrZzFHd3BLaTFTSEJ1?=
 =?utf-8?B?TDVrNmg3Uk55ajVrVDltaGt2aFV4aXA5bGZlSGRhWHQ4aC9RTVlSakN5NVRi?=
 =?utf-8?B?NkI5VTBDZE14VFNMNUhvbFlaajJYWlV6ZmppQk5neXVHdVBuVis1QXptT1l4?=
 =?utf-8?B?c2hhU0xHZ1NqMGpRZ1VtemtiQXFQcGdFdExvcG96OWU2eTdGZHJ3Vml4YWNY?=
 =?utf-8?B?MHpvbHIzc0RzOTIwZkkxbEVvZFZKbUIyUDYzanIwZlEwa21MUlhvOTJBYkNh?=
 =?utf-8?B?d1lNay81UG9ud2U5dXZZTDZKTTBwek96cGd5RUgxZVhCYVFSaHliWjVKWk9V?=
 =?utf-8?B?SE5kUmtWdnlGbzk1clR3WkxXNHczNG9VeW5TUE9VSG1VYzRUU3VTRjhVaGtW?=
 =?utf-8?B?QUNxMTIxTEpvS2w2OGNHWVhOZmErZ0t1dnoraVRmVFZOWjlURERsZTE0Q3pj?=
 =?utf-8?B?TXZnNEpaWmhxY3VFbGpuazJBTlczR1FiMnN6NHpUQ1QxMEU4NEtCdkJEb3Vw?=
 =?utf-8?B?T1o4VThEajN5REVoTTRzRlJmRkpzZ2phSzRmZ0pZR3JUR0ZqakpLM21KRVFI?=
 =?utf-8?B?QWliUVhrajhSb2FJLzFlVUQyQ0kxS3E4eEpYcFZoakNEZVlMUGY3QzNuWmxz?=
 =?utf-8?B?aVl0dlAvZ1lmaXVXS2RUREQxTzcyVFpXMExnZnJKS05MWDQ4Si9aNTAwRFBD?=
 =?utf-8?B?d0pOcVVld2t2VTU4RGsvRXJlN09KQzQwcnBHRHByOVJqaXVFVHdhZjBtNkpD?=
 =?utf-8?B?S3QzcFhoWGZORHZ6Ykp6bVE1RnpDbG0vTnF1c25OVFA4Rm1GVDlJOERuejRL?=
 =?utf-8?B?RG9QNnVGVmhsbzZUSUNFUFBORmlPbDBiTURPQVRnSXZSK0xNVjI4RkhwakZS?=
 =?utf-8?B?K2J6bkRHZUk0OG9mMG1mNTFlVHE3MlltNFN1UGMwZGc1cTIzWGxvYzVCMHlG?=
 =?utf-8?B?YTFLOFI3SEZkYjJBWTg3S3BjNWZkeEhRYitjUEN1ZU1TY1I2UXFtYzBwT2x0?=
 =?utf-8?B?bzM5QjJxK1ZYNkFxZFl6eDFDYlJRSXUwZlVQU0tZU0FJWGp3c0l4MFhZVTJy?=
 =?utf-8?B?WWxWaGRyK1hoSTUwZVJxelBXc2tEYjlwaVNnNUNnN2tzc1RaMEM1L245c041?=
 =?utf-8?B?ckVVN1ZuV2Ntd0dsbzUxR0tZVnRRTW1wdmd4dUU1VHZYY3RzZ2RSQy9YL1cv?=
 =?utf-8?B?UnNKRXNHUXZWeGZXWjZoQms5R1Y2cGU0L2Y0Nnl5TnVKTWFoTzNORHRONllK?=
 =?utf-8?B?UE40RkI2QVlxdTBWWWo5YXMwMWtnWXcyd3BCR25uQ3ZHWWJTS3lnS3hvOHNh?=
 =?utf-8?B?OVZCUUFnVXZTZGpxZktxWUtuRzB2bHd1V1FkQitsZEZLeEEzWElXZmlEc1VX?=
 =?utf-8?B?WElXK1RPODF2WUk5ZWlvQ0RHcUJoRndTbE9tenV1UG5kNUU0cFFJMGxlRWtH?=
 =?utf-8?B?ZFJReEFjL0RtRUVITGtZYTl1WjFISG84Qm50MllGYXNCQzR2YTNGLzFIUlNV?=
 =?utf-8?B?OHE2WFl1cTlxa0JJbm1SMnh5b25sU3I4RzA0RzViS1dOS1pHSG9FS1B5YnhU?=
 =?utf-8?B?a3RRY0o1SGU0TzJ0Vis3NU5pWUZaNEp1V3hxRjlIRXlnUE9qSUQ3c1V3NndS?=
 =?utf-8?B?V0NvMEorY2YzRnJkTGZRQ2ltUU9LdktidXBSTWZDYXBNTEdidDk4TFZaZk14?=
 =?utf-8?Q?00ZxKT8NC6LZnxcjGeVPUcfLx6y3N6m9Sj+uslI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0417cc-9000-4885-c66d-08d98d621352
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:24:22.1018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7n0cfP9kIOzckP3KRsYeqcEJhFKMaBJ+HExqRm6rdotprUQ5tpTjysnCKUOeGGWg4m5PTGrQAySj/ZLP4yc00Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 11.10.2021 19:48, Oleksandr Tyshchenko wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -38,7 +38,7 @@
>  #include "hvm/save.h"
>  #include "memory.h"
>  
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015

So this bump would not have been needed if the rule of making padding
fields explicit in the public interface had been followed by earlier
changes, as you could have fit the 8-bit field in the 16-bit gap
after domid.

Furthermore this bump is only going to be necessary if your patch
doesn't make 4.16. 4.15 uses 0x13 here, i.e. a bump has already
occurred in this release cycle.

Otoh, because of the re-use of the struct in a sysctl, you do need
to bump XEN_SYSCTL_INTERFACE_VERSION here (unless you fit the new
field in the existing padding slot, which for the sysctl has been
guaranteed to be zero; see also below).

> @@ -150,6 +150,7 @@ struct xen_domctl_getdomaininfo {
>      uint32_t ssidref;
>      xen_domain_handle_t handle;
>      uint32_t cpupool;
> +    uint8_t gpaddr_bits; /* Guest physical address space size. */
>      struct xen_arch_domainconfig arch_config;

On the basis of the above, please add uint8_t pad[3] (or perhaps
better pad[7] to be independent of the present
alignof(struct xen_arch_domainconfig) == 4) and make sure the
array will always be zero-filled, such that the padding space can
subsequently be assigned a purpose without needing to bump the
interface version(s) again.

Right now the sysctl caller of getdomaininfo() clears the full
structure (albeit only once, so stale / inapplicable data might get
reported for higher numbered domains if any field was filled only
in certain cases), while the domctl one doesn't. Maybe it would be
best looking forward if the domctl path also cleared the full buffer
up front, or if the clearing was moved into the function. (In the
latter case some writes of zeros into the struct could be eliminated
in return.)

Perhaps, once properly first zero-filling the struct in all cases,
the padding field near the start should also be made explicit,
clarifying visually that it is an option to use the space there for
something that makes sense to live early in the struct (i.e. I
wouldn't necessarily recommend putting there the new field you add,
albeit - as mentioned near the top - that's certainly an option).

Jan


