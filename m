Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB136A0A8B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 14:32:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500385.771737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBhf-0003nN-CF; Thu, 23 Feb 2023 13:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500385.771737; Thu, 23 Feb 2023 13:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBhf-0003k1-8o; Thu, 23 Feb 2023 13:32:07 +0000
Received: by outflank-mailman (input) for mailman id 500385;
 Thu, 23 Feb 2023 13:32:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVBhd-0003jv-S1
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 13:32:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75c6f6cc-b37e-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 14:32:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 13:32:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 13:32:02 +0000
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
X-Inumbo-ID: 75c6f6cc-b37e-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMdhxjzd1sddA966z8yLFV5JRxi4ulxbS7iT7rFI6/g19CF2RjpwDRxZeE0uSBQbk+u+UrR4s+UAZVw0LNFdOTBawPTU4JWs+f2NKYqh8wuS4iCU4LY2qDwhZ26EVCpubRTziY0VYTjtGapUiMu6E9CSHEBzE7TPNbVDo0macFBV2C3UUA13Op2LsCzyxmLGQIcAHRYtQfeDd/7bJI+LsRTki6/ud+XG7MBQxVQ+zsyaVJuICpj+/+Xvzv/6aEmBjE/Lcd9LchNLaLoIaloITS1LyAZe73DSpC31496QnWbXyxdwOjOr4bf7vTc4RH+xR8425oL+pLQFmkG0ZLhWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1bwNcqd/wS9i9LdTX7YyH1XYvzPUY/cKQ/CucThg90=;
 b=kKj1oayeokwSpefzQ1xazrrDZFcJhTKHHdIEFK4T7wI+Ft6MA5yvAmF9NL7t8rfqAAP3c65d8TcfV6eQdgsnQcikiou5z5+MLavgpJRKMeMTRpfTmOTllE1AnCCebyhdIfuykGU4ap2oZM0fj/D9Lq0VuGozOPCxrmp+KzuiPzjnJ4mSAo759h9QeJRzZhY4S1FqJsPNdpWzbjWgSJvjvu+nx0XPEvfkLx4TW75nezkUgDADmYClgLN669e47w113Ih9VrsS97Gd2B2VjYjcHIsKnncuTvHEgfu2szpapP0d2b1HJBnC1PKreRYLKrZUkjh+psgxva20dizhiiiFhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1bwNcqd/wS9i9LdTX7YyH1XYvzPUY/cKQ/CucThg90=;
 b=uI1KomjIcytKkNOf9M0bYO3F3NwKSioWDGplsXevtaleC0qLUCl/kHdq4ZIsM+yGkMs13TNfO8lStqD0xeUEe+dyCtK9/mqae/6v/FS8Y1VXfWtZ1W905M2z6PV8V0IYWGL1Sfk1HiekCiV6uPJ5e7nmEjXDVi6aDcDgv8+ZsGv/W94vBLvzIa2NkTgiix3fNi44P8EGyJQ4O0Tq0NVqwHmsJ8apSSutMEhfgwd67hCkPbarPfVnzUeeFljdDa+mko/C7Vc03DIbhz7g80ElrFraUotAGJQhCFJlN2KaKrW08/hwMuHMwjY5EBVyntdP3ICI0oIXrbWjmx7IucntWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c6fb76d4-7ce1-98d7-8b29-c8752854f8c7@suse.com>
Date: Thu, 23 Feb 2023 14:32:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
 <aa0d3704921f5ec04b66c8aa935638a64018c50b.1676909088.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aa0d3704921f5ec04b66c8aa935638a64018c50b.1676909088.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 21307ff7-b95b-4cc6-f763-08db15a258b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZQOzumj70NU3AadamM3jrJ/NwmZ/E/rQmwJqLOtY7h+upaRtXiO1Fz2eOU4ADVzpZRD+1quxsqTmGF7XfuNnGDfXJjjQPMV68On7jIh0IkILUgBeY+ijEnbybzltvtQQYcaMmLnhpN+AJNDPoyTPOd42IFBYurVIkWueemwFfN71hf5jRLvczUVlnfg9SOLMan+KET4taFZKgsMUNKNiIktg0ftK+2zgweXBcwmeXykJvN/9d/BouciwZEGnjMZKwX9x7egXI8L04WybWlVJn7Jnzl5qnUo7P3rXO7WJva6PQVWINJF+oacz3m7E12D/QtzlPrbyxXeT48tt2y60piwhbidJYhD7PNCwdP7rC918kOsGGgwOgFOn75oAhNJOCiVVK13ECcve/3uiIBqiVHKtIE9MDrx1Jvc/i9TeEutVRQGPl4lJCOmFoKIjGLXu2r0qS/TQ0v8R/GAtWL4N8DRqJ9e6r9flc19VYLsGijqxceGeGQ/5OBptnp4JbLq2m+l01Dc3Vc14aZyf7fiMjG3GHC2+UsIGzPsWq2WkfhHMArfUmMRWVx6CPAjRdFDvkP1mZiK1E3hRFturk3+7BVtvAetArNqCNJ12Y+Nsg1jEUCTw3/SbBc3+vtU4uzAN6eVkcf6Lfm9hq5t//fEIdhul9Zwieq5K6bLAkjfeAt+YGZbGc4TPnd8R9vN5j3SahF1y+sbSnSCUsz5Ha9oBN9g2qGc7eaNRyYp6VFQbDsB6J/e+ku/5NtuoSTmTg6pA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199018)(86362001)(31696002)(36756003)(2616005)(54906003)(31686004)(316002)(66556008)(41300700001)(66946007)(66476007)(4326008)(8676002)(6916009)(53546011)(6486002)(6506007)(6512007)(478600001)(186003)(26005)(38100700002)(5660300002)(8936002)(83380400001)(2906002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vnl3T2N1Q3NLUzBtOHRadWo4K3huY0lPYitnMU83ZDdXdTNmeU85WkhneXdV?=
 =?utf-8?B?UFg5Tkc0NkhmQzFMMTRBZ1kvL3FrV3JxV0lWUjk4TUtob1ZUU2JQNzMzTU5K?=
 =?utf-8?B?aU9icEhBT2JQdmVWNTFDT3FtNUhKL28rdzRWWEhObWlxbldncTZBSmdlSWV2?=
 =?utf-8?B?aUFQdjg0cHI3U1loQU5ZMVpFaWVKUTU1QmZleDhEZTZTaFVwUnJVVFB1K2lw?=
 =?utf-8?B?cXU5V1lUcWxoWUh5eWhCM09YcHk3a3V4MHJScE8xY2J0NWZZeFMyWk50Smgy?=
 =?utf-8?B?Q0tNTXh1M0xNRXFlNVFrblVsdC8xT3dnMmlRLzcvODVnU2NkSjZQUk1wejJ2?=
 =?utf-8?B?MDBib081VmJKdDlzUEY3VGVIbWpaM1duMjd0QXFJOUtxa1dwZUlRNWhIeWcy?=
 =?utf-8?B?TVE0eWVLMGhxVW8ybzRQcU94bWZyOGoyak9kWVJxNXJ4STZNc0hPVjcrVFY5?=
 =?utf-8?B?R0h5Uk5CWHhXd0w3VzBNUWxidnhreGNIU0hWQmlwZXdGY2VSZXVKcnE3eXpX?=
 =?utf-8?B?clp6d1NMeldQdW4xVU1oZUd2UGdjdXdUby9nN3A4eXBBdEZJeldmSjV5RWVz?=
 =?utf-8?B?ckJuWWJlOUFjaTRhZVVaWUxmM1FqK25qMHlad2hYTG5BZTZJc0tUNjFYNkh6?=
 =?utf-8?B?bHRTd29pMkNnc0EzZk83emcrUTBRZ2RKUGV4aHNWd3puWFhTYTNobEhic0lB?=
 =?utf-8?B?cW5ib3p5Vjg0Uk9RTjc5cE13eCt3a3dDc1A0K0ZueG9UOUtMeWpaamZqMW1Z?=
 =?utf-8?B?blUwNjBNOEQ1ZTRRVHVsN1MvN1NGOHN1dlJlTmFCZXZmdEV1aHZmZHVHbU5n?=
 =?utf-8?B?MzYzeW1rdkIxa2JEVlRScEFQU280YjVrcjdXUW4wZ1RzVC94b2hMbUlRZnk1?=
 =?utf-8?B?d3lJMzhlVzEyVVZiWlpyMnhhaU5tTWwyRm5HdU5aUllMWkdXaUgyaG41OTBz?=
 =?utf-8?B?dFBaVzhJQmFEUThqUWMxZkM3WVZoQllFUEFCNXBoWFdnTkRCVmM4WE93TWdG?=
 =?utf-8?B?ZkJnWVY3WHpZcWJCZkFUU05TWjc1OW41d3UyREFRMUtLYWR0MWJFcE5pSHVv?=
 =?utf-8?B?dytBS0RzTTVPUE9kZ1JtcEFhOSttL1hlOEFJOStsTGhHUmRhSzJ6L2dnS2JL?=
 =?utf-8?B?YThTdElXTldIY1hwcXJHNGt4WjBkOXBoOHhBTEtzSkVFVy9sSzJERVVUUTQy?=
 =?utf-8?B?eFdYeW1WdEpLS0xMT28vT1VkQ3p5RFh2VndaMWdHOTlBSW1NZ2padVlZbVBQ?=
 =?utf-8?B?Ukx4d1c1U3BZY3I1blhUb0o1NENBdHZRclJoRjN2TlJ0NzJKZFhFRUtia3hC?=
 =?utf-8?B?UlRmUVJYNCsrWTlqOWNRaHpQNm5wRFhyZkVvUnBMWjU1N05TV0RhWU1FTXp2?=
 =?utf-8?B?aGVONVZDRytLTzFzRzVaNW96aUtqS3VnOGtaRmZka3Uxa00xSlVVeHhNQWRn?=
 =?utf-8?B?MUQ0R3VhbkRNdEFzSVVEdnJzSi85Y0NRaFJFbkdWOHcyK0plL3NENDkvd0pU?=
 =?utf-8?B?SWtBZUpmRVRmajFKdzFwV0ZSZlRsMVU5WUdmVFNUZ2N3Y0FxejJJeWJCbk1J?=
 =?utf-8?B?QnYwWFBOYkVKQ0hNUGFmSEhBOXRicEVtbUZkbWdhUC9PSHFrSWFZVWUycERF?=
 =?utf-8?B?Mk53bDBHUWx2Y3lKK0Rhb2NrS3BZM1grWWR1ZS9LUG9kRGtRb3c4aEJqNmZY?=
 =?utf-8?B?R0M4T294cGJPUGJVYzdXQmlFU2ZESDhjVWlvTStrbGpua204UDhDd1B5TFhY?=
 =?utf-8?B?WTNTVkhVN0dMbGVPZTFPWC9YWVZOY05TTkFXeEZoa3VJU2tZOEd4L3BnVWhS?=
 =?utf-8?B?Qlh5TTljdVN6ZHBKTzRIT3lYaHgrcmx6cTZiWm9ZaldPMU5TS0hJMERGVjRJ?=
 =?utf-8?B?OXFtcmRacEV0b3FrVGJxT2gySXJOZHNtblJacjN2LzR0cUQvUVg0RnBEL1p2?=
 =?utf-8?B?Z2pTeFFKUnE5eGFTOEc3TUpHVDNkQkVhcEtDK3VmRGxmbmduZVRmVEh0REd2?=
 =?utf-8?B?OTkrd1hjbHgzSzJtWFR6V04vOVJIVisraFJ2NUxmUCtnN0ZlNFdVRFBuRWhU?=
 =?utf-8?B?Q294ZitkMnZUSUlNczN6NnZ5ZzV6T0xmYk11azhDWDBlWExDSFZNcjNMbG9X?=
 =?utf-8?Q?mGc9vMyNlLsZCfxOEZ3FIezU6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21307ff7-b95b-4cc6-f763-08db15a258b6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 13:32:02.2984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIK3XqFz2EtUxoSBwXvVSaTxF1EJdmpMz6yCtKMJHHSZb1msn55O/GOdnifAlFHDe+/nSGY/yeIPurUVuR/qRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

On 20.02.2023 17:40, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/xen/bug.h
> @@ -0,0 +1,161 @@
> +#ifndef __XEN_BUG_H__
> +#define __XEN_BUG_H__
> +
> +#define BUG_DISP_WIDTH    24
> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> +
> +#define BUGFRAME_run_fn 0
> +#define BUGFRAME_warn   1
> +#define BUGFRAME_bug    2
> +#define BUGFRAME_assert 3
> +
> +#define BUGFRAME_NR     4
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/errno.h>
> +#include <xen/lib.h>
> +#include <xen/stringify.h>
> +#include <xen/types.h>
> +
> +#include <asm/bug.h>

Looking at patch 2 onwards I came to wonder: How does that work without
you first removing stuff from the respective asm/bug.h (or adding
suitable #define-s to limit what gets defined below)? From all I can
tell the compiler should object to ...

> +#ifndef BUG_FRAME_STRUCT
> +
> +struct bug_frame {
> +    signed int loc_disp:BUG_DISP_WIDTH;
> +    unsigned int line_hi:BUG_LINE_HI_WIDTH;
> +    signed int ptr_disp:BUG_DISP_WIDTH;
> +    unsigned int line_lo:BUG_LINE_LO_WIDTH;
> +    signed int msg_disp[];
> +};

... this, as asm/bug.h will have declared such a struct already. The
#define-s further down may not be a problem if what they expand to
matches in both places, but that's then still a latent trap to fall
into.

Jan

