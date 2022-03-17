Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7E4DCBA9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 17:47:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291691.495280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUtHX-0006D0-IK; Thu, 17 Mar 2022 16:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291691.495280; Thu, 17 Mar 2022 16:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUtHX-0006AJ-F9; Thu, 17 Mar 2022 16:47:23 +0000
Received: by outflank-mailman (input) for mailman id 291691;
 Thu, 17 Mar 2022 16:47:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUtHV-0006AD-RP
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 16:47:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e97148d4-a611-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 17:47:20 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-EvhCu9xKMZ6rvXGY61GqtA-1; Thu, 17 Mar 2022 17:47:18 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB7537.eurprd04.prod.outlook.com (2603:10a6:20b:282::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 16:47:17 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 16:47:17 +0000
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
X-Inumbo-ID: e97148d4-a611-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647535640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rTbexEc3BxnMlencjCQsShFrJNxK+GsxeUDeqmGUzlw=;
	b=kmcJWPgbtL8ywWW4m28KU1TTECb7e3uR/obkHGiWLBsGDa4jw7OtjIa0OFM4PaYm5jzonb
	01LfYdHchiOLnay+hEhx7/bpHE6wBDzKtPBvha8ssQhVQb4dyQBLg+4OtqDojPr3GgdAs5
	jPYTiY4zHIKoS6gOfvyUX4WPJOvGR+g=
X-MC-Unique: EvhCu9xKMZ6rvXGY61GqtA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHa4XR+NqjU9+7rvYEwX7pGMc4zc41rBgA3gpZaM4czWbpN9R2Xx587rwokGCawmgWoLmUCDoODHfHpTCN8l6YiRSRsEKVFT9gF8T+8bRDxyI/wQPMm89OtritUqN+VwlpC3XFkW7deGeTGV2uNDzOjp5IaCvni8ZiRBYU3S1YUdjyGqJ19remQq2K281EpJGmpKYTaT5UVIV93QJ/QKqCwKamubZb/z75p9xHVPIXNULwJqdH4/RIypgE8O8ftYDFR7uOQ+QO0W/PSuQSSpPoN9SWcOCeL2XiuMkYFNf/F7NpNpYdzjPg9djgc/U3+GiRddezflT/XXBPXKQdXGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTbexEc3BxnMlencjCQsShFrJNxK+GsxeUDeqmGUzlw=;
 b=RzH6cHY7JH5iPHxPwQge7NM+5ZQyenT+59m+wiwkFZllLdtb+1bXk7oIBfWuI/FNb1qyN4fsoCKuiEgZIeGodWK3gjYs9LkupJ3Boll4TgxqHUAnQy23AMff2fYU3cJIcZxjm+RSAROR35KRXVUdxU1atfISzcV1qfSjubp60u0vVpbmLdHF8aAbYdUo4ZaKbsQuNIhQS3JurtVFyWJJgPTxIP/azSB3slU9tFZYkDBdugQaygv7BSC6IvlYOt7+iRqOpS7wsbx/28vj+avRZNSGdKSIH8rrjnhfXprnP7xPY8eHOonuQhooWPVmpZxyuvJ7pnwp1GL78SkWzUuFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac5efb3d-e55b-6717-de7f-78447d29f1b9@suse.com>
Date: Thu, 17 Mar 2022 17:47:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 11/11] xen/x86: remove cf_check attribute from
 hypercall handlers
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-12-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220310073420.15622-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0013.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9de6514-41f5-4fbe-ce88-08da0835cbc8
X-MS-TrafficTypeDiagnostic: AM9PR04MB7537:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB7537661C9C562C85C91FFC6EB3129@AM9PR04MB7537.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zImB7l8TkAKXVwYJ7E0Sv1I8hjsdBDWGkvhymnZUiAdUOmMVYFe/D4DRbsMzC1SBKtNfwbqAVqWdZujD26cyygtv8yWZ96yCvOV6NgA4+MfybR7YQc9DVsz3kxmU9176Oc61jPJge6bUBpJZtAPnw4oDxuYUm84/1Fr6GhnAzsztsYfv6zv/mRIm/Mwzfv/cp2xYWupuv7yHRCRwdoHGuEzSXqYnYOEc/z+GCBlglcexZamU9DnypzAXO4r9s5VYyZM+cndilp9WpvVT/N9m05sNY3Mfu3vJ8yDcUJZy9aAVaQuwsCa2LcbntdJdKKMseg66OwI3efN+sQMSGjH3Y0+irWr1yLstXjNQMYvFhO6TzyfZzrd2mEgsQ7XBu8+80jr1hqPeax7nlW/lDq/ylpDPkIuQJHZ9vLTJkvCmi2sCPo2vW0mGqFRYJXdmSpxiUHEbBJcMps7xVGcHr437K3BL/w6U9fE6OsY1QO/rYC+aukxAWXHJxTuLnCabMtZIuLgrXhbTszIJwy7RRqQcNhRmw7DRWhHUE+i11OYQDQTPQT9it0XsiqtO0TbqN8LPYpInsYwuKg82NC8/GWeYnZXvIyKdBbzRVWKXObJj2CKv5Z8yT2JS8q6FzFvBGrnxVsfNdtUDQbB+0mw5wlP8wmR+nmukhnkCgQUCiD6CRJuQz22B6YqveSTAfiQ3pL/jI15gAKg4Q33HfWfwfKYBbPIYWWQyRdzZKAi/jwD7nwc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6512007)(53546011)(6506007)(186003)(6486002)(508600001)(36756003)(2616005)(26005)(86362001)(31686004)(38100700002)(31696002)(83380400001)(6636002)(6666004)(316002)(54906003)(37006003)(8936002)(5660300002)(7416002)(66476007)(66556008)(6862004)(8676002)(4326008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlI4WElkNTFFM1F2YkdITnlScDRqUzQvQlNHQ202YThRcFcrWEtleENqcnE1?=
 =?utf-8?B?UW1TNk90eXluZ2paR3I0RGVRZzhTMENMZ2lxTEZCNXZiRm94OUtpR1dyL0w2?=
 =?utf-8?B?OXpIVk00eDMwdjc1TmwvdmduSVhQbE9NYkgxVWFXajFqek90Zk50WVE5UkV5?=
 =?utf-8?B?UC94RTFFZFNld0gxRldxL3FHdWRkUHA2VTBHQkVrTGxqektsa3ZaZFpXYlQ4?=
 =?utf-8?B?Ymt0cUVURDJqSHQ0RmRmT1VDNlpZTnVkMkJBVFpobCtHekFwNGVPdVdXaGg2?=
 =?utf-8?B?WjE3cmxwQWRuSG83ZmVRWG9Jc1JBVVpmalUxOXBMbGtOV2kzM3AvTzZoT2s1?=
 =?utf-8?B?RGIvNkVrKytSaDF3bDlINi9ERVpQNFhzSExKUkRCazRacS9jWjdFQ0tBSGRG?=
 =?utf-8?B?dGJUdlJWZnhla09OMUVXM2w0NWh2Rjh4WjIzY0ZsZTRlVXVNdk16VjRPTjJR?=
 =?utf-8?B?VkgxdlZPckk2dHFlOWFNTko3NzNPeGxOUlJod0wrdVZmbkJVb3hmWHZxSGYv?=
 =?utf-8?B?c0hodkxOdDRvRS9sL2o3TkpITDV0bWhvZmxvTnl1RWRHbXRLYWJFRG5yMVhx?=
 =?utf-8?B?SEwvNVJPVU5iVzlrOVJFcnBxNDBKM2tuMVJlckU1eDdBRUI5NUh3UGE5VDh4?=
 =?utf-8?B?VWh1Mk0xQmdDM3drWm5zWnNqdFZLamVNZ2c5NnJncnhtM2lwRllSd0dBOUMz?=
 =?utf-8?B?Z092VmJUUytiaVptTjFiMEZXUlppOTNDaXJFTDM4a0FiVzQwMXU2eGRVcWl4?=
 =?utf-8?B?VnE0VjZMLzFQbmR1TEVERjN1d0tNK01CSTZpck5qNlhIMHNmdzlxa3d5RWwr?=
 =?utf-8?B?akw3T1ZlV3d4b1ArMml5d2svWWxXN0dTd3BuMnpPb2l2Sm9uaFJmdzEyVkpM?=
 =?utf-8?B?dmVkUTU2WUhTUVFSZXY3V1JUTmhIeXcwTFM3MGgrZ2FTZWhFL0NMOC9SSWdp?=
 =?utf-8?B?Snc4blllRlJJc0RrUEl4cVFid20zQjNsK3ZRZ2FLMDV6Nkx4U2Z2TlhRZXJi?=
 =?utf-8?B?cXBpY0ErKythenZVTTF3MXFaOW9xRXJuemdkQ0U3NVhRWlBLQ1VNVWV2MVVv?=
 =?utf-8?B?cVlFWC9PcUhiTE1zMXdLLzRVa05GaFlJTjhtMWwyZGpXeG9rbEM4dmhESW05?=
 =?utf-8?B?b0V2UHRCTXNNNlpoclFIZW5xZHF5V2pGMFpRd2JCT2JZYnJMMlZqeE90Uy91?=
 =?utf-8?B?VFU1RlNVZlU4azhxOFBLdjR6dHBQZjlQeFkwTHVFb3hoRStiZWdiSE5lTk92?=
 =?utf-8?B?YnJNeERraHJrbGlJeVE3SlkrT2tHaEtGTjJSMlVneVJ3QnoxcEV0MWlPNTNh?=
 =?utf-8?B?cmRXQjAwRHpuNnlwNm5ybjF6NmlhVitHSUd2YW1SL1BDdXJOVHJsM3ROSlRw?=
 =?utf-8?B?L3hEQ3M2ZEJtNmxBODl4Q3NnOTBMVkl5b1VLZmNiQXVtcldTVWZPa1ZDcG0z?=
 =?utf-8?B?emZ5SWVvNmVBcVBSNG1Jb01uZXVhNi9oN1lyY1hORnF0RFVvYk9jY2dKN21J?=
 =?utf-8?B?dDFRemtCWlVFNmJLWDdvTWt2ano1cE1RUUtvbG0rOFhVWFBoWWM4N2d6Uko0?=
 =?utf-8?B?amdtajczenNXay9JUk9sMkp2QVdHTFREd0F1QVNUbGw2YjY0V25mM1MvM3k1?=
 =?utf-8?B?K0ZoVks4RitxYUJDaWxvSWtXWWpWa0ZNUWlxUzhjVlpOSHFGN2gycEdzNmkz?=
 =?utf-8?B?NElNbXpPTkt1YnhSMFNxcWZiczdvNWFJL2V0NlVQakpPemNvdHU0aU1IZU9O?=
 =?utf-8?B?K1E3cVYzU0NhN3VsdUM0bzhDN0RUTURDaWxHRGUzTFh5eHZ3dVo1ZEFVNnAw?=
 =?utf-8?B?a0tCNmtVQjRzSWZ0RjFYMGpiMU5aYXdnYlNJdGpFcFcxYVk3R0J4RlpXWVhK?=
 =?utf-8?B?eWlmSUZVYTlDMTJqL2dIT2JzeWFhTnExRW5lc1RHTmhxTUxMeVBQa2l1RHRv?=
 =?utf-8?Q?Cpud+BMM4TQ/N1E+n2QgfrodMX2nNVks?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9de6514-41f5-4fbe-ce88-08da0835cbc8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 16:47:17.2820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLkCivJ++JNNrfh1pGO84916ny/WExXVFrZG2mRCqe9sC3F8wyfT7DtszpYERR4Ngu/qrBUB9oly7Nr/svfiIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7537

On 10.03.2022 08:34, Juergen Gross wrote:
> Now that the hypercall handlers are all being called directly instead
> through a function vector, the "cf_check" attribute can be removed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V4:
> - new patch
> ---
>  xen/arch/x86/compat.c               |  6 +++---
>  xen/arch/x86/cpu/mcheck/mce.c       |  2 +-
>  xen/arch/x86/cpu/vpmu.c             |  2 +-
>  xen/arch/x86/domain.c               |  3 +--
>  xen/arch/x86/hvm/dm.c               |  2 +-
>  xen/arch/x86/hvm/hvm.c              |  2 +-
>  xen/arch/x86/hvm/hypercall.c        |  6 +++---
>  xen/arch/x86/mm.c                   | 12 ++++++------
>  xen/arch/x86/mm/paging.c            |  2 +-
>  xen/arch/x86/physdev.c              |  2 +-
>  xen/arch/x86/platform_hypercall.c   |  2 +-
>  xen/arch/x86/pv/callback.c          | 16 ++++++++--------
>  xen/arch/x86/pv/descriptor-tables.c |  8 ++++----
>  xen/arch/x86/pv/iret.c              |  4 ++--
>  xen/arch/x86/pv/misc-hypercalls.c   | 10 +++++-----
>  xen/arch/x86/pv/shim.c              |  4 ++--
>  xen/arch/x86/x86_64/compat/mm.c     |  2 +-
>  xen/common/argo.c                   |  4 ++--
>  xen/common/compat/grant_table.c     |  2 +-
>  xen/common/compat/kernel.c          |  2 +-
>  xen/common/compat/memory.c          |  3 +--
>  xen/common/dm.c                     |  2 +-
>  xen/common/domain.c                 |  2 +-
>  xen/common/domctl.c                 |  2 +-
>  xen/common/event_channel.c          |  2 +-
>  xen/common/grant_table.c            |  3 +--
>  xen/common/hypfs.c                  |  2 +-
>  xen/common/kernel.c                 |  2 +-
>  xen/common/kexec.c                  |  4 ++--
>  xen/common/memory.c                 |  2 +-
>  xen/common/multicall.c              |  3 +--
>  xen/common/sched/compat.c           |  2 +-
>  xen/common/sched/core.c             |  4 ++--
>  xen/common/sysctl.c                 |  2 +-
>  xen/common/xenoprof.c               |  2 +-
>  xen/drivers/char/console.c          |  2 +-
>  xen/scripts/gen_hypercall.awk       |  2 +-
>  xen/xsm/xsm_core.c                  |  4 ++--
>  38 files changed, 67 insertions(+), 71 deletions(-)

But that's only the definitions; for a reason I forget the annotations
are present also on the declarations (really the "also" applies the
other way around; perhaps it was that a future gcc will want to warn
about declaration and definition having gone out of sync).

Jan


