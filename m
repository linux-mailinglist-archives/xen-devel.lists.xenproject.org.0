Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0981579A7A4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 13:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599346.934721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qffAl-0002Oo-3v; Mon, 11 Sep 2023 11:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599346.934721; Mon, 11 Sep 2023 11:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qffAl-0002MP-0n; Mon, 11 Sep 2023 11:33:43 +0000
Received: by outflank-mailman (input) for mailman id 599346;
 Mon, 11 Sep 2023 11:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qffAk-0002MJ-7k
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 11:33:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e9f6d61-5097-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 13:33:41 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DBBPR04MB7660.eurprd04.prod.outlook.com (2603:10a6:10:20f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 11:33:38 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 11:33:37 +0000
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
X-Inumbo-ID: 0e9f6d61-5097-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lw2UP0VXOy58jIVrd3bN77Q4LHAKG7sKNAstwS9ZI8bNiBdpKBjvcwfYrLmfaSp1Zbi1KeQ2j47NNaMFsGKL1jR0oODBSx0i0QEZdiWXvUNFEN9r/vZNEpuSsfTpKPWhcc2aH8B+4AsrrhL8TW5MV1+RsiFSmPLiDGbdJ/AmvCE0uwuBHh9oL1E1i8W5cd+NSboh3gqZM1EC8r9fpXqRiPLiFwRujLVK1obuAOMynjarc+iVL5xSbdhB1NdwqeSbWI+MeXV57Z/lJ2KWlIK6R8cGrqvr9UJofaJTKTxGPoAr79Cikqsh+UG7xl2+qnsbhUwIshxhfsfim6duImSb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV9VmPO7J7RbGIB1ovl8ONYr13bwZ0HfyL8oaBvtUrQ=;
 b=mWXg5vlqdliAa/2sIqnW/eOqrsv48m1xP26JqeamVeouLZQ2ivey2b0Jgxr/CsEMaV9pHePAQt1hrRT7H7jzDrelDUPzndbaH3WTKdtBp0PClnbQromGq+8K0byGtUaHBM1aE8W34Z1TAxh8Wq5+6yhMuswB5h0meAzb1H1rrN+HNGfHKHwqF2ccDh0TL7U8ePeqmG5zjCjMb3ih6inuC1CX9WWPCi7l/zDgzE3C4vzyyN6oFf0YWGZNbbYlOEMgzJe3kuLLrZbTXyXeHSkfvEpJ9Iy7yFB5oZ9KpMEgLLtsfF1NBARAX6jsxTuRDHCSybsGI0xCH0ewYAvTJY3tXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eV9VmPO7J7RbGIB1ovl8ONYr13bwZ0HfyL8oaBvtUrQ=;
 b=grZV95LPUuUZk4Biu9OaRnBG8ritrVVJIBDn1bbvnmrLXyJ+si/apJjjfBsQjxKCz7eAbDWVznuBAZgRp6zBStwaEoVavZlp1zsFtXAzcICl6ni4215h5hwBTvjDbV04QUXiuOuJsuNB7Zs8/Bvr3Ukbbw6SbSMmEOg0eh/on7ozAcCWR81+V5m05VVCiXJSdDJaDdI5Ac1MwjbdSiYbapjzWksaZTRg8Mz++qnf99aP83BuUhtIZiM9LVjL501gZ9twgKFaP6KS3up/LB4xeJyvaODYl1E9OxtqahDE9LvNs/XebM40VBEImYz7tY29DPltbL6IoQoXpC+6sVZxDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93f4a2f3-b98c-332d-64a6-9e34cc9dddf2@suse.com>
Date: Mon, 11 Sep 2023 13:33:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 1/5] xen/ppc: Implement atomic.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694211900.git.sanastasio@raptorengineering.com>
 <7ed453323033a759427da33cea7d18ddca247ae7.1694211900.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7ed453323033a759427da33cea7d18ddca247ae7.1694211900.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0258.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::10) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DBBPR04MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 98addac7-a9ff-4226-4b04-08dbb2baf0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZLhqlDR331WLvhkEdO8MVcKBRBI4MoygDXf5KhPAqer3PnuY5cFjwNupGviAaWyRbtLHnbXhAkbdWBiFGRuYB7TKZgsvmW8DaS1Szb6MAKcQuqHSjbFvU2YYBM9YwMW1LQG4eNw2hzH9rW0FvzF9v8ebv/B5Nx7KJ62C0aoz87B2VMuuwklmCmiCjzh9QS1DODIeBvwaX3PX9gJzcYN0vngDN8zXDkZLchG2iyWM9k6eEdEr0BdWAlQaiRYJEmTmZ1Lfi2WPv5yUTqiFQanyTugwKcBq4K2/bk2biAK23k57zYr+0oLu/13suvA0Tc4Djccqe0K9vYw3Tiqr/scTP2qSYfOT02W5ht3KH/Dx6emNfll14UHaSfFwtReO4IckHpPbi/ZyNude01hG0p/4IwbJgV435IXVH/aQtDR4p3xS57wr19eYebVClNZgV1jDgvY238trLcdvl45oSm51TGB9qmmFJQPr+eicGerRutA38bJqA9Pemy8cgrQTYAGa/swnTAIqJPrCOf4ebjDoTRaWlw3oC3Az7xKnca8x48gxr9Lt9atXzgj5LP/B+uEBntZXJ0iy9TX5ywFeHthI1123jnnVVTbXxN/FX9X2y0VQV0dnOU9DS2Yu+qj0M2ibzBgCBuGDhY0M3ADk+5cynQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(1800799009)(186009)(451199024)(53546011)(6486002)(6506007)(6512007)(86362001)(31696002)(38100700002)(36756003)(2616005)(26005)(66946007)(66476007)(66556008)(6916009)(316002)(41300700001)(2906002)(5660300002)(8936002)(8676002)(4326008)(31686004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnZEOXRVTGdxZVZ4K2RHLy8vZkpWRWpZUUd0NWJiTjJJaXo0b29PeXhRMzZa?=
 =?utf-8?B?QkFuaHFyRWFIT1lYZHJYQ01RcTJ4ZWJkUS9Ma0JxNWlXQVE2L0kzRFYxbzJZ?=
 =?utf-8?B?R01sc01FamlCSHV1RnFmZHNMUUs5eVZQbjVCY3FFbjBQc0lmQU00UXRPdDR6?=
 =?utf-8?B?TmNhWjdrRlZtZHUyMGR0U2dQcmhJUi9yejUvL2x6U1M3QUhtM3R5aTNsVXdM?=
 =?utf-8?B?cnFXQkgvN2JoSmZ6UUZiSFZBUzZ0VVhIUFZpbGJTUVRrMUhzSnJrKzBzUW5m?=
 =?utf-8?B?a3ExRHBNR3pxcXMrSE1XR05LYUlxdnd6ZVNnZ0RKcWY3YmpuL1QybGNkSmVG?=
 =?utf-8?B?aXk5TnE2dWthYm43VFFtZm1ENXhIUkVKb0RXQUhvYS9MdzJpS1JoRERnTTNK?=
 =?utf-8?B?RVBUb2xSNUdnNFJQbGw4SHJPeWgvZU5oNjQ4Zzc5cjVhSEFGWmhQblVTWjFR?=
 =?utf-8?B?NkRySEdHVkNiRjZGcGJiS3c5bE5qQ0tNZGdOaDFZYUtHUVYvbGVqSEV1UjJH?=
 =?utf-8?B?T3BQUURRa2hWRFUrQ1I5Tlo0aWs5anREZGZlYk1jZndCYjdQSVpGMzJXWVp6?=
 =?utf-8?B?MnVnSTZXSW9wQkhWMXJleDVIUmExRFZJVWIvN3JCTjVUZ3JHbHFBNkVCUEww?=
 =?utf-8?B?UjZTSE1Rdlk5YmJGWklEVXpVSVBJQTl3cFV6dmdqSCtwUDlnMzBBS3ZsWWk4?=
 =?utf-8?B?QXJkbU5TMVJvTDQxSnp2SDNuWlhSYjVsZkNOeW5NM2J1QnQ1eXAyNmdSZEMz?=
 =?utf-8?B?cENzdFNzaGpkbGMyaVdmVjR1S3BucWFBenRtZVE4TEdmalplSFpKWWxZWGN3?=
 =?utf-8?B?RUpHVm8wRUc5MXZQWjMxUzdERVUxZmFaQm8vOElIekRQUWtNejRrWkNBbzNJ?=
 =?utf-8?B?NFR6anc5N0gzK3RpSlV1V2IxZ0R0WVlTeEpsSmkxZ3UvMVA5OWtCeFpvNk5W?=
 =?utf-8?B?WDlodGtScXZxblA3RHlwMHFQWDdQNXhiUmZ5YUphait5b3EzTlFFT2h5K1pz?=
 =?utf-8?B?cEZIdG5FcW52cGJrY0FkYkxMeGt1bkZibTlLOGZDdDZiY0lWTWFVQ2lQMExO?=
 =?utf-8?B?ekNycWQ2TnRxelZ4QVo1VTBubTROQzVHMHU2Tm4zN3dVZEFTRmVvOXcvZk5N?=
 =?utf-8?B?cTJVdW10bk1JQk5uV1U0R0hyanhjdDJpT1VHNHA5b1Y3YTlXL2RlaG5WOG5u?=
 =?utf-8?B?NW93dWlWaDkwTUZEeitZYThNKzBIbnVrcjA0V0Myek8rQVdoa1ozeUtkcVBB?=
 =?utf-8?B?QVdYYVk3OEtQV25xaGxLQ3RqY1FVSzIzYndPNFcyOGFkdUNTcUN5SHgzMEsy?=
 =?utf-8?B?b2pFMi9sbVk1d0tvMnV2VTV3LzhqUlYxY0NJUDU1REtsMi9uNlVDQnpKajV4?=
 =?utf-8?B?M1Z5bUtxWWcrMW8zdkh1MSt4VVNxYkhKbXhiS1dqU0Z4Mnk1WWFFYWFVSnVB?=
 =?utf-8?B?UGZjb1RJcjNVR3hDY2FzMUlXMlBNWFNtQUU5MGFzT1lBOEhIc0tKWkp4MFV0?=
 =?utf-8?B?cnJ2UjVsUTF3amI3OVJxblN0dE9oR050SHZvMzNoOUhUVFc0U2x2ZGZtajRM?=
 =?utf-8?B?bHN6UE5jVnZ3QkVmK2ZORWpUYWpmVllVWDY1SEJZcmhCS3dJaTBLV0YxR29W?=
 =?utf-8?B?WmlJeXVLK1R5ai81Y0EzN2NUdnREcWhOQXdlOEpyNHgxendvNDNrSFk2TlVS?=
 =?utf-8?B?THUrb2hXMjFKeW4zZXFKWHBQd3k5SS8wTU1QcXFOWEZrUFJtR0doU05FL29V?=
 =?utf-8?B?YnVodFZsNHFCaVB0b05wNDVvMTd5QTZMZitDZ24wNVBkT2hzNHp2ekt2aVgw?=
 =?utf-8?B?VzRadjMzay9qMCtGWHN1cENicXd5bWRzdHVtTldLbkZwS1NtdkluWGtCYjg1?=
 =?utf-8?B?eW4wUkZmRjhZdFJmMk0yT29HeEhZVUgwRzAvR3dCMnovei9YcGF1ay93Q0hl?=
 =?utf-8?B?WVhKUlRCZk5WVjJKclFtZjFOcWtFQkV0alpUMVViVXdkdDBEbzJYQlVqdDdv?=
 =?utf-8?B?aXpvajdVcU93dGdEUVpmU21SdncxWnc2MnBsTmdoWW1aOXNjaVp5Tll1bjlS?=
 =?utf-8?B?UmVqWk5raldSUGVIY1dlam1JdnFqNUwrd0swOEJ1MEtublBMVGR0WVRSNnBo?=
 =?utf-8?Q?1I88YMIDE51pfL2hnaqDn9H6p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98addac7-a9ff-4226-4b04-08dbb2baf0ad
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 11:33:37.6316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSdaq4mpGfjBmon7tPjKewJdYZisC69YGrDEmxK8/AqCun/D4KdFLI40rPxqY1khGWcgHQYj6A7WeKbw285MLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7660

On 09.09.2023 00:50, Shawn Anastasio wrote:
> Implement atomic.h for PPC, based off of the original Xen 3.2
> implementation. This implementation depends on some functions that are
> not yet defined (notably __cmpxchg), so it can't yet be used.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Just one remaining question:

> +static always_inline void read_atomic_size(const volatile void *p, void *res,
> +                                           unsigned int size)
> +{
> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
> +    switch ( size )
> +    {
> +    case 1:
> +        *(uint8_t *)res = read_u8_atomic(p);
> +        break;
> +    case 2:
> +        *(uint16_t *)res = read_u16_atomic(p);
> +        break;
> +    case 4:
> +        *(uint32_t *)res = read_u32_atomic(p);
> +        break;
> +    case 8:
> +        *(uint64_t *)res = read_u64_atomic(p);
> +        break;
> +    default:
> +        __bad_atomic_read(p, res);
> +        break;
> +    }
> +}
> +
> +static always_inline void write_atomic_size(volatile void *p, const void *val,
> +                                            unsigned int size)
> +{
> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
> +    switch ( size )
> +    {
> +    case 1:
> +        write_u8_atomic(p, *(const uint8_t *)val);
> +        break;
> +    case 2:
> +        write_u16_atomic(p, *(const uint16_t *)val);
> +        break;
> +    case 4:
> +        write_u32_atomic(p, *(const uint32_t *)val);
> +        break;
> +    case 8:
> +        write_u64_atomic(p, *(const uint64_t *)val);
> +        break;
> +    default:
> +        __bad_atomic_size();
> +        break;
> +    }
> +}

These two functions being as similar as is possible, ...

> +#define read_atomic(p)                                                         \
> +    ({                                                                         \
> +        union {                                                                \
> +            typeof(*(p)) val;                                                  \
> +            char c[sizeof(*(p))];                                              \
> +        } x_;                                                                  \
> +        read_atomic_size(p, x_.c, sizeof(*(p)));                               \
> +        x_.val;                                                                \
> +    })

... is there a reason you keep using a union here ...

> +#define write_atomic(p, x)                                                     \
> +    do                                                                         \
> +    {                                                                          \
> +        typeof(*(p)) x_ = (x);                                                 \
> +        write_atomic_size(p, &x_, sizeof(*(p)));                               \
> +    } while ( 0 )

... while you did away with its use here?

Jan

