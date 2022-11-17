Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ED462D840
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 11:40:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444923.700113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovcJQ-0008KI-C3; Thu, 17 Nov 2022 10:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444923.700113; Thu, 17 Nov 2022 10:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovcJQ-0008Eg-8o; Thu, 17 Nov 2022 10:40:04 +0000
Received: by outflank-mailman (input) for mailman id 444923;
 Thu, 17 Nov 2022 10:40:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovcJO-0007ch-RS
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 10:40:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3020b5c8-6664-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 11:40:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8521.eurprd04.prod.outlook.com (2603:10a6:20b:430::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 10:39:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 10:39:59 +0000
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
X-Inumbo-ID: 3020b5c8-6664-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cH++qI5O/3vot6Izply7klumLRLgqkT7n1aWmg0OD3MSCuYSkKZRp711TV/VnLOPPznvDQwVh1ofA6FG1mbdob4Bw3ZXHh26QA2e/fczz60msnT+noUKkHCjY/NoGOAvT4BzcKI/xD0NmdB/Uy0kdc9/yOVTL/NBGjAVJyP7PoayBvDoKOVgH2poRTR7oqegn4AZEcakcW8DyS4tb5qIkbCB8Z3LONI26+xtks0uo7hxrcPPV5KRlovAkEsyqIi3+w9oKL+/G2IgffYL5J9eNb8McGktkVXkCoVHA/CIihH0Ndybea0RCgQMmfwLa1G9ZZCbf378jOE5mFR4XbNi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAvRLOg6w4mmvcA3i5mjaJkjOWFpZznd38q0eTok1IY=;
 b=lhEJCBuMQKa1TiZg68Z3R/bpzCkS7JCbMp/3ifNmRa0sIp7xyFXk/rNR3hTl6n24xFjoLSYE7jEA3ddkBEzBH6ZUqyfrs9FlqhujliwC6ei9vorcuMy/FcHWoIiqlK++bRAt9e4YFtVieWSGtherNtDVcfHfbQXLX11v+LbcZg9yIhvUvFIXXud+OsKtIVojccOTWJqkrBEySwfZ+WuSpNK1JZF8Hx9HLGvSiFxmzvq0bkPqJdu6rVQzskqQBZwIPUiG4ozXpH7QkeTPgf+lgbGPJJfTWlW4AwBvqVDPbSc1ifWt3cQOr+oaWHU6wmx0Ytmtt9/XddeGqrBbGcS/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAvRLOg6w4mmvcA3i5mjaJkjOWFpZznd38q0eTok1IY=;
 b=C8DOqCVOmBCx7vHxkiEpqJZdpYO/L4zRID4ENg4AsTyBwMOkEWb/RpYMqKQFYJfLIT+IFhnLTXB0XwU5UWZX2CBzwWemAQjjZBVVkWIUpuPObmT8J6KlNe8Mqv4VnnCi4H8VkirrQl6wVurSRIUpwErsYwjpwGHjNciU1CrJmtqWXRBX4m6MS0k2qzq57aFbgCGJWUXo2rQaRXws+w71Qay0EggCCR0mMYzc3tYTnDK/DNu/51fiYGE9IeISncPMHQpMpXcn0qUoLiP3bzkKLz0O9V6lToQ3K3yY7JokA2UBoDJ6Y2f19n4mPnMJQOYzKtvMRRR4lAd8AEtRKPkJRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ede581f-3393-9290-b929-6c28450b007a@suse.com>
Date: Thu, 17 Nov 2022 11:39:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] tools/tests: Unit test for paging mempool size
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Henry Wang <Henry.Wang@arm.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221117010804.9384-1-andrew.cooper3@citrix.com>
 <20221117010804.9384-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221117010804.9384-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e399993-647f-45b5-b373-08dac8881375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RADNTdcV35PJIMTQANJgaAbrGVaR9Lwc77yYKy9rlDNM+m7niwzMtKIxhM1e3VQf8q62NTcUHMI8IoILFb5CSVs8UvxGjQ2+1ha+ShoUnxUFu7ZH67qVf8Fv1abHuo6Z4pSBsFbzJuAOrhj6q8bb2Iy0z8q85QyQZfQwklfzEecZzOQSmnUwhhjC6JhcfEoCpRx90nFvl7JRXvU54gJwRvD+0hRN4zc3NztQGlrGzo0qVc5cxPcYQo8ckDIBa8HXm3XKTCvvaOM8QaGVmFrq9Zu/bsqnbOSK0p7bBXc+AgVkJIBHi3pJjTBgWtE7Z6gR3NHtlhMYlOoygk0TmgevGCwkrvsCfRzRJzPXOMvX7y8s+PGvIm0kXMC6qpiyDBlP1AxtE4/52h2WD9rP+Zb70kGmCFQBC3+0iHOPLfcyR2o0x2cCH0Juo3gIqF460bPTWg7mtZvemqyzKqRGTMr2I3+Ma6loh8va9HHNdnLUXGwOQpAJ7goqPDZp+qcbFEVffZ075xkFLTb5UbCuvsJuWo2F5GACmWcdMb9aCdjAeOU94ocBMwF3VUMMMuVFdP6+m5sEjys697aV+ZvFlIktTOJl2S5drvgkXsjAvmwyOe2pLB8tBptdpm16IOeqOkpFSKrLPvLOeQQk5nRhIIr2ALBi9BEWSfIMUfxu3vtRAzx0JGonEoJJzuAfU8xhfWXaPzbTDi29SsOu01IbAr1ekc7edZjK3+nShK9BDEjnmkg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199015)(478600001)(54906003)(6486002)(6916009)(8676002)(83380400001)(31686004)(38100700002)(26005)(66946007)(66476007)(66556008)(86362001)(41300700001)(36756003)(6506007)(186003)(8936002)(5660300002)(53546011)(2616005)(7416002)(6512007)(316002)(2906002)(31696002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlFmcXVZV2hnODRROXBJMkJ2RW9kellwK3ZSWFJSTUt3TTQ3OFhUeHhzMUk5?=
 =?utf-8?B?ODJGR1BTOXU2VThmMlljWkNhYTNhUmlmRnRUb3dBdGVZQzJpVEtTaVNmYldK?=
 =?utf-8?B?NGNxQndod0F1M2xhY1E0bE1pQ2lCczhLbkFnbUpXSkZxVTVGVzc2bkNnYnBZ?=
 =?utf-8?B?OWpmaVAzcEJXVjdGNjZMM3A0RTd2OE4yN3l3K0F3b0R0dUNMTkswd2pTdWhD?=
 =?utf-8?B?aDRKYmtGRzBFWHlsWlhwbVpGUFNzTFR5cmloQzRXeGxrUVpuYlBYYVQvSWU1?=
 =?utf-8?B?L2JJUm1tTStVamUxcHZRWGRRK1J3YzRlZEdHQVY1aHNoRmdoVGJKTjNqaU5a?=
 =?utf-8?B?SXZmc2o5RjNkenp6MHhOZ3pKYzBpekJyRUp3U0tCeDRYODlNVXN2VEIvM0Zl?=
 =?utf-8?B?eDJwMXdDeGFldWRFdW53a1hLQmQvUzVIVDk2cWltOXQvdjErZTJMcDhmK0tL?=
 =?utf-8?B?UHNOQ1R4MDN4UTBjZmxMTFNnOExCbFRpYU5XOTVKVzRyRkthbGozWmdEWWxG?=
 =?utf-8?B?ZHJkNzFHdVpJeDdjVkJIbmY4M1NqamY4RGRZcndqMVJhQ2o3ZTB6Y1JaQnQ5?=
 =?utf-8?B?NFd5MG84R1d0bDBpYW5oRm9oajRUTjFUN3kvSnRaUGJzZEVsUVZXNThqdEdP?=
 =?utf-8?B?L1FwYzZDTENRdDlUVFZRQ0xHU2VmQ2xaYlRyZzB6c1F1dnhNZkVDWWF0WWV2?=
 =?utf-8?B?OGpwU3hXKzAvNUFUZ2pmY1daTHJWNDJzNVZENVZEcFRWVlMxajF5eFFqMXpl?=
 =?utf-8?B?R1pmNUl0U1FNakxaWUw0UTFvMTdlQ2tWU3ZPWHltTlk5VmQ2QXZGTC9oVTBx?=
 =?utf-8?B?UXNUb2N1QVo2ckp1TXJmWEI2L0NNanhJUThSYXZFek1EWjJoQmFiQm11TWFP?=
 =?utf-8?B?eGZqaDVadjB1eGxhL2NWaGJYb21VSnFFS21seGczVGxTYUVlS0prL0pSVjRO?=
 =?utf-8?B?Sko1Z0V6S1NBTTBJYnJJanYyYzZMYURLbjhwT1Y5SlFMaUI1UzNvSGJVRkNo?=
 =?utf-8?B?bHZZSnRQK2ZaMTZMTDJNcCtxZ1ZhSDZtdjZrcHIxd1J1a2FES3ZmZEg5SjdG?=
 =?utf-8?B?TUxMamtWcFNRcjZPM1lvNTgyK3o5MnNuckZGK2o1ZnNManhpV004SFlheE9s?=
 =?utf-8?B?R001dG1hOUdpaVY3Wi9Fb0JLMExXUTUyQlVCV1kxN290SGZUWTlXZUgwVjc3?=
 =?utf-8?B?L0ZuQ3hXNURZUDVESzRPVS9CNHFPalMxRWZuK0NYOUQ1d3NPSW5zRnM3UWVi?=
 =?utf-8?B?cC9JcFZQWUhsNXlSMXVrTU5xZ1VwV1BmMkhvYXliZTVpUS90bUkrOFhRQVkr?=
 =?utf-8?B?WUZ1bTF4ODV0cXZIWjhhSjYvMDRvZmVUZGlXc3RCL2dheC95VXJzdml2Mkw4?=
 =?utf-8?B?TGVxV3N4bTE2bENLOXQxWFYvVTdqR2tyTXpqYmplNGJhOXhtNEtzQ2ZOTjhs?=
 =?utf-8?B?TTVVSFZiaVpHSU5FaWJtVnZtclZaSW1idElTYmtZVk1HREQxRVc2ekdHMWpY?=
 =?utf-8?B?VU5mWmhrZHF2bWZWdEZiS1VKUWFXcVJ0bXlyZDhKT2tnRmlGektmUk4reWwz?=
 =?utf-8?B?amVSR2pCWW8vTHI5cTRLWG5TV3I3RmxhM2diVHFYQ05LSXk2UHN4ZEFmMW55?=
 =?utf-8?B?aHVBUFBPVHpMdk1pOXhBL1ZnK3c2RlJxN1U2ZGt0R1YrTXRqNEt3QjJNbGo2?=
 =?utf-8?B?MXIwMEpVZlluNUpKMjg3bWJKMVFaSVgvdktjZkdPU25qZ1d2dlpsNi9oTnNO?=
 =?utf-8?B?VVhhS2c2UDV5TkRrRHp5NFdlamVya1VNdjhxUHlYa05RMzd4dE1ycHpxMjJ0?=
 =?utf-8?B?S2M3THh4OFFyYUt6VVBWRjNCdEZkamppa3hjaC9CUnMxSVNRRjk5N0ZvQ241?=
 =?utf-8?B?bUwwWWkyQ3VHaDFrK3I1OERUUTZBOFFLeXJwTGkvQ3U1NzRoN3AzeWQ4TnNq?=
 =?utf-8?B?VU13VWhRcWQ5VXJ3SWUyN1VGbngzb0JGalhBczgxbFpLZmNWMGU1TTFjM2Y3?=
 =?utf-8?B?cEZFeCt4UDg0ME1DMFQ1ZEVrcHpiU1FIaXRRV1FmYTNXdGF4SXpPZHZmNGtR?=
 =?utf-8?B?MEVWbVBlMmtuV0VERGV6bWtXMzIzOXI4TENFaDA0am5QZ1M2QXRkbkFlbDlR?=
 =?utf-8?Q?VoSo94HLYTOssHBf+DAmmMj/K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e399993-647f-45b5-b373-08dac8881375
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 10:39:59.5028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCjKLREaanEjHGe5G5FvL5q+gvitjeiPN21fOTgFp8+YgEeozsXgzwRQtQlpyCkS/uuG4LOR7TQ0LX0bI/qGIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8521

On 17.11.2022 02:08, Andrew Cooper wrote:
> Exercise some basic functionality of the new
> xc_{get,set}_paging_mempool_size() hypercalls.
> 
> This passes on x86, but fails currently on ARM.  ARM will be fixed up in
> future patches.
> 
> This is part of XSA-409 / CVE-2022-33747.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
(if this counts anything, since as it stands the new stuff all falls
under tool stack maintainership)

> --- /dev/null
> +++ b/tools/tests/paging-mempool/test-paging-mempool.c
> @@ -0,0 +1,181 @@
> +#include <err.h>
> +#include <errno.h>
> +#include <inttypes.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +
> +#include <xenctrl.h>
> +#include <xenforeignmemory.h>
> +#include <xengnttab.h>
> +#include <xen-tools/libs.h>
> +
> +static unsigned int nr_failures;
> +#define fail(fmt, ...)                          \
> +({                                              \
> +    nr_failures++;                              \
> +    (void)printf(fmt, ##__VA_ARGS__);           \
> +})
> +
> +static xc_interface *xch;
> +static uint32_t domid;
> +
> +static struct xen_domctl_createdomain create = {
> +    .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,

I understand that it is accepted that this test will thus fail when run
on HAP-incapable hardware (including when run with Xen itself running on
top of another hypervisor not surfacing HAP capabilities)? Oh, I notice
you're actually translating EINVAL and EOPNOTSUPP failures into "skip".
That'll probably do, albeit personally I consider skipping when EINVAL
(which we use all over the place) as a overly relaxed.

> +static void run_tests(void)
> +{
> +    xen_pfn_t physmap[] = { 0 };

I have to admit that I'm uncertain whether Arm (or other architectures
that Xen is being planned to be ported to) have constraints which may
cause populating of GFN 0 to fail.

> +    uint64_t size_bytes, old_size_bytes;
> +    int rc;
> +
> +    printf("Test default mempool size\n");
> +
> +    rc = xc_get_paging_mempool_size(xch, domid, &size_bytes);
> +    if ( rc )
> +        return fail("  Fail: get mempool size: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    printf("mempool size %"PRIu64" bytes (%"PRIu64"kB, %"PRIu64"MB)\n",
> +           size_bytes, size_bytes >> 10, size_bytes >> 20);
> +
> +
> +    /*
> +     * Check that the domain has the expected default allocation size.  This
> +     * will fail if the logic in Xen is altered without an equivelent

Nit: equivalent

> +     * adjustment here.
> +     */
> +    if ( size_bytes != default_mempool_size_bytes )
> +        return fail("  Fail: size %"PRIu64" != expected size %"PRIu64"\n",
> +                    size_bytes, default_mempool_size_bytes);
> +
> +
> +    printf("Test that allocate doesn't alter pool size\n");
> +
> +    /*
> +     * Populate the domain with some RAM.  This will cause more of the mempool
> +     * to be used.
> +     */
> +    old_size_bytes = size_bytes;
> +
> +    rc = xc_domain_setmaxmem(xch, domid, -1);
> +    if ( rc )
> +        return fail("  Fail: setmaxmem: : %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    rc = xc_domain_populate_physmap_exact(xch, domid, 1, 0, 0, physmap);
> +    if ( rc )
> +        return fail("  Fail: populate physmap: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    /*
> +     * Re-get the p2m size.  Should not have changed as a consequence of
> +     * populate physmap.
> +     */
> +    rc = xc_get_paging_mempool_size(xch, domid, &size_bytes);
> +    if ( rc )
> +        return fail("  Fail: get mempool size: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    if ( old_size_bytes != size_bytes )
> +        return fail("  Fail: mempool size changed %"PRIu64" => %"PRIu64"\n",
> +                    old_size_bytes, size_bytes);
> +
> +
> +
> +    printf("Test bad set size\n");
> +
> +    /*
> +     * Check that setting a non-page size results in failure.
> +     */
> +    rc = xc_set_paging_mempool_size(xch, domid, size_bytes + 1);
> +    if ( rc != -1 || errno != EINVAL )
> +        return fail("  Fail: Bad set size: expected -1/EINVAL, got %d/%d - %s\n",
> +                    rc, errno, strerror(errno));
> +
> +
> +    printf("Test very large set size\n");

Maybe drop "very", as 64M isn't all that much (and would, in particular,
not expose any 32-bit truncation issues)?

Jan

