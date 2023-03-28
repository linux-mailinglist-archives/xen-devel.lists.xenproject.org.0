Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0DF6CC76F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 18:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515985.799443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBoX-0007TG-U1; Tue, 28 Mar 2023 16:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515985.799443; Tue, 28 Mar 2023 16:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBoX-0007R5-QF; Tue, 28 Mar 2023 16:04:49 +0000
Received: by outflank-mailman (input) for mailman id 515985;
 Tue, 28 Mar 2023 16:04:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phBoW-0007Qz-Fy
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 16:04:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42844f0a-cd82-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 18:04:47 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM7PR04MB6853.eurprd04.prod.outlook.com (2603:10a6:20b:107::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 16:04:44 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 16:04:44 +0000
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
X-Inumbo-ID: 42844f0a-cd82-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPUqbxf30InLPiW7DnCDHNkRvNhd4eqOax0p9C311S7SaQKWYtYT99ey6t1KXibXPH0ihgOHAH25eeLDddzEyptOnZtv2J94AMTA0ExhlMSlBUhDNsxBd1eeuznQUuivRNW4turLYnB3tDGovrPD5ppLhjx/65mvBt1LPdru7DoNaJn5GWMN6ItnilLIhTZMATZ/oQNpM+Ewi5572MI2aICxrUh+f4/hrQQ4M0Mdntwk/lmABkCuVKk9kw0Jg+3QN+vGBwXGW5Ura/eTM7bDWffFI9hGnYnLT0R8JgWiYBmOV6SBOxrN1rheiSYXY3v3tdB3F6XNTmuAr3/DUz4yxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBWZ92GV0sYp13Kh1h6hT0v2619ihGuAG3IGPIaZZ/I=;
 b=EXjhUSwcDMprzdxJ4/AVWTlzhDNcIQIMKoG3XnQ5BnI85ZZdSVB21Dkh28Uykpy7xgTSM8DfJQ4QMr4iUAvl9uHvLuFTuhe2KQ2aswBV6/ZabviNMx44Qkc+Rd3RrY71+ag0MNj89+Jj2ZGFIMLD7oYRDzKIVnEFMqMNFHMqI2lpuixA40Npazy5sHigrwJGziIucLGyN7BaprsxPlD4A/HhBtY8P3VZtoSPE7EE8ZWKDZUIhhxaEPK5+AzWQk35qBiRyTJCRIO8qx+LRW+dtHebqJgfz4BTdpfu/PLdoILOJhEViY+vwUf7L59dJHkTIHV2Z2vZ9TEkh+ZYxfh3eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBWZ92GV0sYp13Kh1h6hT0v2619ihGuAG3IGPIaZZ/I=;
 b=FU7rLwF947F0ibR5Hj50vNeJLHh2mCfS9gLUOOY67XcwdoZh+bwILi0Vl0xf7sM0XYUT6/aVhEotLdfPh4+gGv3c5PXnpzjwC1LqPq8YMtiS/cPaM3in2YVg2pnC045d70kHCWahvhW8hoc03YiKyp8DSr+nEPdhhDNhgOynRHl63FJZljk6SmxnjHs+S+kYH9O0rJU8/mb9jRASBrBIXl/25P0rwOK1GYmakoHPyN3Uplboyb3og0TgjuxIYqxdiQp9/f4gECNWGj3roFTFUh4IwrhTgwFXVHoat57np5HtAgnfTZAFpQvsjzraxnPxC6ZNVPY8OHIBybr04Wa+Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <353bfbe2-4101-6de8-e972-859eda62fabb@suse.com>
Date: Tue, 28 Mar 2023 18:04:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/8] x86emul: split off opcode 0f01 handling
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
 <c8ecf582-2c1c-ca41-f289-b6a6a080061c@suse.com>
 <ZCMAS1+pzlU2k6BF@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCMAS1+pzlU2k6BF@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::10) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM7PR04MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c526995-8ba2-4477-214b-08db2fa62581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nLyZMsYj1SoeJk6VLpZE+2Rwwu9gjDJn9/gwRULWTJTPVyCWBWEqLJU+dnm1u+mUpRq/+5O5jtNV8Fk8kbFhNCTscUmF/90sAvMmLS1bWwx04NXv4fKDC835vw3sob74DYSvQx2cz9FMkYBVELnbrVX1PSFF+rWv/yxzbuUw82iHXP+2rexSzD1jm3REqhShHkh6ydRngkT4GHkuPF4CIAethxMwA5lCrT42WTagQJ7X/fUPFrDy4b7tccIOeQUOWMYycViYeDJ4D7pWMmc8X0FZXisVjPwrXNER4eGJctMSg8ptLhDSZEmbL1BvP8LyVh9vfN9KfWI7S2tet0Flnr6mR+083ohqE95rGU/QfvdK6RfeQbuhY7gSldUUx19ZUqhiuzOuuupN+QDYXe4BOdh8cguyRnhq32bV6F1HkBE4aH/fnfFZk4du5AIia6q3a7mACIvl+Nv798+4xrHXncssec7N9QWrpeD9DdSo48RjOBQ0A66EU85WsKIbDD9yZ6aZoepDMNMkHKA7nAnuWjdvI8fazF+QAt2YANYY/ISP+H/8TxYGOtcp5LdNtvpYOiWOCanXCp77KOCq4PiAezbTTfefRWr7+lqQTfAvHR5SOYI+K/7GhAG2r2KfSx7SrwGduk5kHZqQUiv/MUUK18YYsIcVJ8MC7b8O3S74144=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(136003)(366004)(376002)(346002)(396003)(451199021)(316002)(6512007)(86362001)(5660300002)(31696002)(2616005)(54906003)(8936002)(41300700001)(36756003)(66556008)(6916009)(8676002)(66946007)(4326008)(66476007)(186003)(26005)(53546011)(38100700002)(478600001)(2906002)(31686004)(6486002)(6506007)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE9BbjNmK1lDYld5TzIrdW9aRTM0bGo3Zmc2WU1sdWJiQlo3bVlJUXJvOHF0?=
 =?utf-8?B?ZlRZNmNLSlU0Q21YUnFwSGNqS3d5cXZIeUtvb1JWeTdqOWw5WGs1NVBsWTZv?=
 =?utf-8?B?MnlzUU1BVFJqS3BVZ2V6d25IQXZmSTlFTGIzUFhTYzNxZVR6cTV5Vmx1aE9M?=
 =?utf-8?B?ekVMbHoxcFZDSUJwbk1zMmt3WEJhQm12aHZNSm9UUmZmYXkxbWZlSisxMm1Y?=
 =?utf-8?B?Z1FUOUt2UWxYYWJzR1F4TlByRGhQVTBGQzh4Vmt3ZzBXSitqd29acjhaYnZX?=
 =?utf-8?B?cDBuTmlJL2l3Q3FhOHdTMTFNZFBtTkhpTkp1aHNHclZpZ3FVVk5BenZYWVdY?=
 =?utf-8?B?bFVBalRqOE51aTVGSE5wcEJWZE8vd3BWaW5YZnAvZklPSGE1U1NCRnRCd2NL?=
 =?utf-8?B?Y2J2ck9UYzV2NXBjUG5xZk8zdGRPa0IwWk5sK2ZhNDdwbUhLNEhVZjVMN25I?=
 =?utf-8?B?RVdIeFhsREQ0dnJQRkJjNkxTSHBpY3hBaDZXRnFCOGN3Wks4SWk3akkzOHN1?=
 =?utf-8?B?RHhEaFZMazZmVjJ6VlJIWHZSSFNyTjE3NzZwWVJ5VVdEYUFOM2RYdjZuY292?=
 =?utf-8?B?c3cxY3IvbFVmQmZ4RTQ0cGJ4NjlLSG8wZE1QZW9iVW5Ga296aVVsZkttNlZK?=
 =?utf-8?B?SDA1T2xJWjhWcUl3ci9GUGZ2YkFQWitBYzhTc1lEcGJ3UytyOUwxWkNxdk43?=
 =?utf-8?B?QUNSVElCb2JKZ2F6MkxJRkJ4aXNFSzVzNXFyTUQvd0trajRkY0FObEJ6bktp?=
 =?utf-8?B?UG5IUFRySWZsbDdXQmxMazNwS2F0Zi9NejJrcXZwR2hoRStnOVNVbktxSERr?=
 =?utf-8?B?amFSZWt3eUx3a3JXZTJJemUyMDFwbkJ1MTUvc0hXaG1FcVUyVHBvN294VU05?=
 =?utf-8?B?WG9haGU4Z1NNODFMR0wvZ092WmNScHdGN0IyaFN5aHprR3oxTmFzSVJ6d2hl?=
 =?utf-8?B?NC9lWExqbnZER0piTkN1UklEeTM5WXhSdHV1am42UlJJWTZLYnFJR3psUVQv?=
 =?utf-8?B?UW80bkJyOXJwdDBBQW1kSkpjblAvQ21QRlhpMko2SWg5bnE5YjMrMVZQbmFJ?=
 =?utf-8?B?a1FQWFd4L0tjV292VDhMYUoxMkI4cGx0RElKdk5zdFdOc1R6Y1FaR2VmdzB2?=
 =?utf-8?B?cTZiL2w0elVpdU9NUTA2ZWFXRy9VV2pRNi9jK1JYcHVtY01vcmRKTG44UnEz?=
 =?utf-8?B?MFNxOHN5YzZZYmtzS2RXKytUTDg3czdNelNLMDg3bkhoZGd5dWtNRVJkVVgx?=
 =?utf-8?B?aXQ4VkhoNjBYV3ZLOStkN1Q1RXpuRnJyUHBzWTJzbjh3QVI0Q0l3WFArSTRi?=
 =?utf-8?B?UGp1Mnc0Q2pMNE00L1VTOHMveUVETDd6elVUVzdmbm9DRWkwSk9pbERGQWQw?=
 =?utf-8?B?UnFwbnNHcjVGVWUrVUZTYndSZUwyKzdQczArQWpidGxUOXhVK1daUzBESldV?=
 =?utf-8?B?NzYzZUxPcWUzMGRIYWZYT3p4bUdERnRLYWNhOUdJZjhPc3FQMTlBeXM2dWFp?=
 =?utf-8?B?SHl2UURock1MVzhGaFlNc2xIYjB6eUdQRS8xcUlxbVI3Ym1VVERsaGdRVlpI?=
 =?utf-8?B?TFRPa21MaVNjMEhTTmhqcmlkUXZKd1JNN2REZHk4dG1FV3VoYkc2WjROeHlm?=
 =?utf-8?B?TkdDeXN4K0FJTUEwbC9WaFoxOHlWcm9lYjVhUUlXMDVPMktpQ1p6L0FteGhn?=
 =?utf-8?B?Q0VlNFNyRkhlNjZmbzlJbGpYWGkrRVdLb0ZZNXFRMFdVWVBXMS81eWdQVTc4?=
 =?utf-8?B?MFdYZ3YxUkdvbXVkL1VMUmxiRG80VEdteGZ1VmtkUEppVHlZN3pPNGNNTmEz?=
 =?utf-8?B?Y2lEZnJZcEJxdG50cEpXQnpuaUs0QVM4eU50azIxT1RQaGd2Sk5rYWkxcHhu?=
 =?utf-8?B?OHJrSEE1UzFVL0oycEdnRVVEcWx3YjhKc2JYRkdBR2dMa1JVM1N3N2NjRHpP?=
 =?utf-8?B?UmQ0QTl0ZG96NkRpUm9VQWYrY1pRYmtIcHphL0MyOFpKQ0xJeUF3Y0Zobk8x?=
 =?utf-8?B?RmI2YjRISTl2T0FYa3FwekFObDZFd1dENHd1eXhkSUxoay9tVTQxZFAwM2F3?=
 =?utf-8?B?WlBtS3VKa1FtNnk4SnRIOCtKcVZzeVhWTWpmMm9SaDVWY3F3Zm9OaXZTWEZt?=
 =?utf-8?Q?7vB/QaKLrBi5QczUuQUw1UbiV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c526995-8ba2-4477-214b-08db2fa62581
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 16:04:44.4328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxU0hwCYdPKeVmUCLG1rBHHxVupLp6G1Xdz7mCoFvA5T8TZAtsdGc1Qm0tP70IodRt0AQsHkCLJ5cw3wAzWB3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6853

On 28.03.2023 16:57, Roger Pau Monné wrote:
> On Wed, Jun 15, 2022 at 11:58:46AM +0200, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/x86_emulate/private.h
>> @@ -0,0 +1,531 @@
>> +/******************************************************************************
>> + * private.h - interface between x86_emulate.c and its helpers
>> + *
>> + * Copyright (c) 2005-2007 Keir Fraser
>> + * Copyright (c) 2005-2007 XenSource Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifdef __XEN__
>> +
>> +# include <xen/kernel.h>
>> +# include <asm/msr-index.h>
>> +# include <asm/x86_emulate.h>
>> +
>> +# ifndef CONFIG_HVM
>> +#  define X86EMUL_NO_FPU
>> +#  define X86EMUL_NO_MMX
>> +#  define X86EMUL_NO_SIMD
>> +# endif
>> +
>> +#else /* !__XEN__ */
>> +# include "x86-emulate.h"
>> +#endif
>> +
>> +#ifdef __i386__
> 
> Do we ever build this code in 32bit mode?

Yes, for the emulator test harness, which can be built both 32-bit and
64-bit (like all of the tool stack can be). When the tool stack is
otherwise 64-bit we even have Makefile logic there so the test harness
can be built both ways in parallel (and hence things can be tested both
ways, provided 32-bit runtime packages are installed).

Jan

