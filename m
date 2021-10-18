Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BAC431977
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 14:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212182.369963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRw0-0002S1-7h; Mon, 18 Oct 2021 12:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212182.369963; Mon, 18 Oct 2021 12:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRw0-0002PG-3m; Mon, 18 Oct 2021 12:40:08 +0000
Received: by outflank-mailman (input) for mailman id 212182;
 Mon, 18 Oct 2021 12:40:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcRvy-0002L4-Q7
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 12:40:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84ddb942-3010-11ec-82d5-12813bfff9fa;
 Mon, 18 Oct 2021 12:40:05 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-mMD5NsD4OBilhcl8h35RdQ-1; Mon, 18 Oct 2021 14:40:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 12:39:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 12:39:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0033.eurprd04.prod.outlook.com (2603:10a6:20b:46a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Mon, 18 Oct 2021 12:39:57 +0000
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
X-Inumbo-ID: 84ddb942-3010-11ec-82d5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634560804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipJNu4qj6dm2jYX0skiI/XOERdPqIDqfgYF+nBOsLdY=;
	b=QtoJW/Vr48HiA1ux0iG/y5fGikX/IUL12/QnHgbEDJNSlq/2fFOHh9scVjZ+Ha0X6hOhxq
	W49JH9zLOM0QOLQlImj4CmvzqRHRFkyzOX/WKTfXXFpkZkg05rm8dZv4l+98tP6JU400fS
	hUTMf8TsLKp9Q9XMDVn7i0my+/XfhEM=
X-MC-Unique: mMD5NsD4OBilhcl8h35RdQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDvmVzyhzpQXsdqgxbu1qYcp0Wh9312WfjE1rnxuVyLpwG0B9+TwGqU4lJCktP5RZUcmF167wPbIBzby6uX76Y2IOsbbXb5oIpsKrpsyF26cmlFcI7xsaiZ0zRV2+gDgIp/RlHDzqxfhQtZ9kl2AsTA0La5hypX5VCJVwZ8SXq8KGgkFiVO21ec6XTmQYbHf2OVvlnRhaQ6sq2mThV+A8uAkA+54bbSGR5yHwntLA8D4rNc7qg3te/Cczyrp2k0PlXC/tUbifFBA/An+Eg0ltVRPFmJPqQig4TL76p+50DZb4Bhu87U/+0xSAKBJns1APFIrjcGrTWvJoeOh7Z7iyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipJNu4qj6dm2jYX0skiI/XOERdPqIDqfgYF+nBOsLdY=;
 b=dwD/y7F0f5c+fiG2voKzkFst7ijmBrPQQas/adSKxMXdEU9NuKj2pbukrKTCd6INm/e4oBcWq8deUp0lKsdTMg8o444D5R9IH+Ap+Ps2WdrA75oXht1zUPg6Cp0rpXd/0Tr9FyAAyXjhIV0WNjEHPQ1BW5kIQan0BWRWVA/d8CureeiorampHj3oImpY9+WsoVIRcWa5xqna2VWoFxhiJrajzsyODTVT1oRyHe5/SwuiPzS/KiyH5jgWTh9N0oKHPk5ki9hYXHCUxBmg925I27q9y5rlzBs6FBLU6t2je6/dBlgTpV1+gQN5j4xl7+Tx88EUqBn+71Jn8gtgifsyXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 05/12] xen: don't include asm/hypercall.h from C sources
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d26c7087-8c39-9624-bbce-876cef47f84c@suse.com>
Date: Mon, 18 Oct 2021 14:39:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211015125152.25198-6-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0033.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8f9142b-f35f-4836-4afe-08d9923464ea
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2448A536F4B0BC2BB5EE8861B3BC9@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t0tOMVmToJCA/Nm/qby8KcfhjRPwuDx+2zO24BElSRrcQvCVGiLhC3T/pY3/n5UZq7dQpCHmAb6ZTKyghh4HVCs7K19IAHV7JYSVGkeDFIZkHXUyolr0IJrngdh7HCKRnEa0RNgCE6ffJr3u06vKrRVH4Vs6ko2Y/HTUeyOlqEUJiMQehOKPgqcRx2SGrbpcSosgSV0MTUeSjeI01/q5sZIUh4g1jtMyVy6m5mmVxLV2IYHQFQIrv7f+kS6+rQc4LrhyJ+cMhjuunhz6zt5XKJwXdKSQkQomd0ycd2YjzqxIs+3JbwocwW0oTmP6JIc/aZyM6h1Um4xdjwCWkYuQPIHaT+26lehTODYuY+U4lSUt6RXTq7JDqYCvo1qtZNO5Uguq2N6yACCurrS9Cb7GaXJ9MeLLvyHfix7bb1J3C43sQQmVYQJmPhxicHkmabXkIowJ1b3gwKgdP8G8bJMt3OWBSEFJTNqZR8s7TlTeoTC3DUiNlQLCej2C5SbLGqayZPgYehOwqdQ43YtGDGPamBjenKb6+1aXq4eienzxxg63OCUofuZ8ucr6LOlWAI4NUpQxG32SwQRqRsZG4+QIFUNSlFYIVVCu2lb5kJmmzR2OIp+i0HfrJJ/8s38x6pHxqTlVmVZPVR3vO8062TVLoo2TRaWrGULXEFtGoHNQ27h+YUjDN2Hohl3pQcXXkb4FavR6ocSrrrpIa8pMeToFlJiGGeANC8TWHfLiL/qxNvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(31686004)(186003)(31696002)(2616005)(66476007)(8936002)(2906002)(36756003)(316002)(66556008)(4326008)(6636002)(5660300002)(16576012)(38100700002)(6862004)(8676002)(37006003)(54906003)(66946007)(86362001)(956004)(26005)(6486002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHAvZU01M3NJSi8zRlYvTXhNVytPaXAxNlNmZTl2TzFveTJRMHZZZjBza3VI?=
 =?utf-8?B?eExsWjZDaVBoR3gyODhMUUE2VWc4YU5rYXVXdms4YVJFL0NUbk90a1hJdXNo?=
 =?utf-8?B?Y0dDcG5lNFdoTEp2VmxzcXk3d1Fta2U0RUVlaEk0bEpFR3l4UzdpNmw2dDh0?=
 =?utf-8?B?UFo2dVdQRXJ3UkNQMy9RTk1veFd5MjJrVWpxUlJhbUp5Q2hGTWNFaDJITFYw?=
 =?utf-8?B?K3RNckh2YndMTmQwd2ZGelNZVEg3eVBzd29iV0FJM2RwczNLVUhMRWFpeVRl?=
 =?utf-8?B?bXpNQlNtZnAyTUQ1anplRzhiZFV0UUUzaUE1bEowRGNOQi83SVJuS3NXM200?=
 =?utf-8?B?TWY0b1pQTVo0cmlFcVBFeklYZkVNenN6azRsNTQrVHlTTFNRRHRrMzZjY2Uw?=
 =?utf-8?B?SkxVZW5oZENuTmFsa0dySm1EaHhCd3hFck9VaExuQVBMQnI4Z1Y3N3hwd1ZF?=
 =?utf-8?B?RWUzU2wyN09WSmF1bC9TNXRpOU0wTHJ0QjMrSEhpZzNwS0g1a2NPdmVzR1Rl?=
 =?utf-8?B?d25ORnlnQ0NrZjVEdGdia1l3dHR1bTBPalIwUkFSSEIvdHZxQVlUcWxsT09V?=
 =?utf-8?B?NkE2QS9mUkdVYjRyakdiVzdIUFV6VHo0SzY2RWFVd1lPTmgrTFFibC9rVnhy?=
 =?utf-8?B?N1J5Vi83QUlaeklGeGMzVkxxKytYVVQzS3I2bDZNUUdwRDhhcVloRkI2eXdY?=
 =?utf-8?B?cytBUStvZWU2R2Jtb3VmOG13bUlQc0t4UDRCQVVKa3FUS091WVVRcWNIdGFG?=
 =?utf-8?B?dzZQTkVrSm4wbzFERTZQTHMxQ3V1Z3Q4bnB0NXlNdE1OeDBhOE0vd2hIdHhs?=
 =?utf-8?B?aUgxdGR4am5jSStiOHAyNnl0MlZlemlTTjhXQlRLQ2JxYXNzczF4amRsbjBQ?=
 =?utf-8?B?RlQ1dDRGQmFMMVd3T1VCcjZId1NBZWp6aXROYWpoc0poTm5ZcTY5WEIzTmd3?=
 =?utf-8?B?YjhRRWdrNDh5dDNod0tNdzRvSmFXQXB2Zm9sSGZuaXg5T1dTWmJOMFBqdTIv?=
 =?utf-8?B?MC91MUluRWE2cDUvamc4a05EOGNZZ0lNQ1NidnVTb3h0bVdkSkJyNWhKOWlO?=
 =?utf-8?B?SlpvbEU5cUtONkVsWWVtMWNxQ2pWMTRpeERjd082M3padGQzbVJuc01DWTVw?=
 =?utf-8?B?SlJISHJKOFpqYUo2OVh3akZUUXlucW42UmVKdDBpcW03cUVkQmRnRkthdERt?=
 =?utf-8?B?RHZjTEtQbGJWTlZTUzFsL3lpMkpVdTNMTmZpTHQyekJIY0F3aGhuYlYzZmRF?=
 =?utf-8?B?RDVOb1VoTldKMk1RZmVVRXlqTDZMcWZUSDBSOGNQVzJxSjZPVzYvQWZMYXNi?=
 =?utf-8?B?djFUNEhXOEozZVVWTE5ZYWlyMjEvOTlMOHFsNUhjNTlYRThtWkR5VDFJYXFL?=
 =?utf-8?B?ZlBKT1FmT3dORnlnNWc1TUNlS3NIYnhNVVV1RW9ERU9oYlBzazRWbGhTM0FT?=
 =?utf-8?B?TUdTL0lqbUt5RlNIMHhQWVhZZGtRK0NWMEdINllEQzEwY0hRMVJZWS9UT3A5?=
 =?utf-8?B?eklhaGlWRVVLdjQ2OXQvZjg3QUZpcmlpVGt5QmNTbDBsNHVnSEV6dFB2OUpi?=
 =?utf-8?B?Y2oyVTZwUmRwbXEvWGl2TFo1ZVM3Tlc3ZVIzUWdFbE5SV01xd0xhczA0NEFz?=
 =?utf-8?B?TWU0Rmx0eGFnWW1QSmJqU2ZQaEQzdG5IZzRWbWk1bldZYlFHdi8vQ2pVWktO?=
 =?utf-8?B?eDkrQkdXYUNlOGw2ejFhQWpFY1JQSjJpVXNSSWhXMk1ZRXRYWlFnUFhZcUNj?=
 =?utf-8?Q?8TAuLiXLL9vai+odFPmw2lXXW7NKxv2rS/nZgl8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f9142b-f35f-4836-4afe-08d9923464ea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 12:39:58.0145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMg6akVIC1ert62L99K5PBK0d+ymH2UAgkEpeR5Nm+fSB/N07bFo+1Oe5tiemGc7niOHzk3Y958pDYfT4i+GGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 15.10.2021 14:51, Juergen Gross wrote:
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -32,7 +32,6 @@ EMIT_FILE;
>  #include <asm/page.h>
>  #include <asm/flushtlb.h>
>  #include <asm/fixmap.h>
> -#include <asm/hypercall.h>
>  #include <asm/msr.h>
>  #include <asm/pv/domain.h>
>  #include <asm/setup.h>

Afaict xen/hypercall.h also doesn't need including here. But I can
agree that this is at best a partly related change.

> --- a/xen/arch/x86/x86_64/platform_hypercall.c
> +++ b/xen/arch/x86/x86_64/platform_hypercall.c
> @@ -41,8 +41,8 @@ CHECK_pf_resource_entry;
>  #undef xen_pf_resource_entry
>  
>  #define COMPAT
> -#define _XEN_GUEST_HANDLE(t) XEN_GUEST_HANDLE(t)
> -#define _XEN_GUEST_HANDLE_PARAM(t) XEN_GUEST_HANDLE_PARAM(t)
> +#undef guest_handle_okay
> +#define guest_handle_okay          compat_handle_okay

Is this a change that slipped in here from patch 3, accompanying

-#define do_platform_op(x)   compat_platform_op(_##x)
+#define do_platform_op(x)   compat_platform_op(x)

there? Or does that change belong here? I have to admit anyway that
it's not entirely clear to me why this adjustment needs making.

> --- a/xen/common/compat/grant_table.c
> +++ b/xen/common/compat/grant_table.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <compat/grant_table.h>
> +#include <xen/hypercall.h>

Nit: Generally compat/*.h go last.

Jan


