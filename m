Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E6590C8D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 09:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385330.620933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMP6Z-0005VR-RW; Fri, 12 Aug 2022 07:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385330.620933; Fri, 12 Aug 2022 07:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMP6Z-0005SU-Nq; Fri, 12 Aug 2022 07:29:15 +0000
Received: by outflank-mailman (input) for mailman id 385330;
 Fri, 12 Aug 2022 07:29:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMP6X-0005SO-Ra
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 07:29:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60053.outbound.protection.outlook.com [40.107.6.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7574224b-1a10-11ed-924f-1f966e50362f;
 Fri, 12 Aug 2022 09:29:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB3372.eurprd04.prod.outlook.com (2603:10a6:7:8d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 07:29:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 07:29:08 +0000
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
X-Inumbo-ID: 7574224b-1a10-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJ4V3swva0PYXMcHJ2U1W5t06tfybUTt/Rg4WR64mYCEb1VdVxRoKB4wx4IdPGVmYyBx/O4L0YksDGItR+/4IICDiLyAZYBt+CXkFD0urAKSuxgUskE0nR4Nj65Nyh2b7yTejIRQA5GlwawbmbpXkYKIBxZuxFHvLM4EyiyomBjGUSpByhqVlZcBXVXBQBJ+rVJdeeEShpOqPvx4EW3hvdf7WQjPfwl1UWh4RRbaO15g841MLuos1VcZGSlzBKgZhq/QHinf8sOfJgx0/50lYFUvQlGkpVnZvulSroa3z7js9NMPPWCviQZZSKgPiS3N7kkpBEsKMrGLPVUNXy7Jpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09jxNHr8AlzaG54Wd637e6Mtl0Lzx6yO38Rpe5px4WQ=;
 b=bd012ATtA2kVH8VqyYmyhRjLJvYfHdWNYmdblxPrNiAzOkBYoqjjdaD66rUzNWXAcHXMgwqM1IZJ9u4bVW8lJrxwwGR+acvj9eS+hOEzY/TB415tmnZUIw1jHsk4mT/s8KJfxFyomy0La/jQPydAR8Rb9kGjrhHMpmIXBe4Z7dAhtjkJu8T8gQ8TML7YZnCZ5LWjZevfXTtrKVNjgm5kQkpLQh7+geNGym7t+nW7gpczow3wMB+ErPlEholb3e1fb6bNci2CgjqYlKDe7so7/LaWZraOCTYHdeg/4l/IPbnLy4EB77ChXXebwrmAgHCCYpFVx7WXvwBNjIcx6O04ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09jxNHr8AlzaG54Wd637e6Mtl0Lzx6yO38Rpe5px4WQ=;
 b=s7Xas3C+CNCgf6v6duNz+r9wUqxDrmwr2kO9xrHfCBziXQoBqQnermaaecjgX0UsO7ZMG8YQIHiMeIhpL6CNGZg40Pgsh3qCSDj1Z55TlpZ+7o5YMraUanLmIEX4RWaMg44gqZIWj+kdtvnSR9XfNzENx/9Z/S582aN7NQIN5mbh4zAXdvyXaBo7sbWgHbNZPFkFOWCSk47ftouF7kSjO6PIwxw3Kogfy69Abj1hHc1t+s0CZLgApwqta/5okFsod8zryYYy2qNBs+OyQDlgeDOg9/6Yrzh09l29yEry+d3SUlylD7eyskP20ElekebXw4uaG3QgUMpxIm42gh7rog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c7eb68f3-4c86-b033-c57e-bb64fd8729b2@suse.com>
Date: Fri, 12 Aug 2022 09:29:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] x86/svm: Keep the RAS balanced for guests
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220811195905.7780-1-andrew.cooper3@citrix.com>
 <20220811195905.7780-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220811195905.7780-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0084.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ac25a12-46c6-482f-6756-08da7c345849
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3372:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yv9ulJ6oag6+jbGqlu3E5Gn2yzNVa3NDZpfQGiGqSDFj0vj8QOVxVuTBOSYfF+h1pIvsq8u0b5z1DA8ECHdudL0jIV6lN+kuO3w2C2yzEKKO/atqoA9F+ZLxjOsyN+SFKQ1/HRXvOZRNmGPDcfE7FIAbbU5hOhMu/aT9tJ+aQ4VqNyqsj1nVyvcX9ug2zNtLJN1gJH7IQ+IcqNkTskzhMrl90AP7WNwHpE3NqBZAn2fDep9XAPxrQjJ+1+tD/ojRbN1DfnFCozh6hJuCjuRqY3y9Ew2df1j+IVB5gKsGx/L77fltxaqoPWUVsnkUdBwklyLpdyT0Mak0+0dz5uhhUJPiqNaUVVm9XNRBz/3nQleAf1zAKff1G0YBAsFUxs3jh4JGTrYlkUsF/OzM9UoXjaCw15HDfvxX17MJHt2tpl1VejUMwbAffh7DpPUwG02c63DEKbYkOJ0KOFZCnoiOPgYY7UNQB5C0nZw0bm51z46T+htoKhf73OYlZnsBGyzDpXLmkJCVu201k62rliTrZj09LJ2Vx83zPohYuSUQQl4WwYjK6y6iaesCbm8hiOG2/3TGGfieqG9bTu3C+5y04Vv/nBb3HgFjgdnEFgWiZzLjRAsUZPN5TMO7TTN3kdtxC68tcuuMhkJ7LldE4UkV8ROULWTPajhPO6dN1ov1b7czvn+2b/BVjsbxX5D4Xj3r8uJanF5l2bn8GrYJ8N24IfZU3EPjBzyy4zfNyzZVBUV/sqXxuzc/fYy5AUsve3TO0ZwzqddcAZxGP+4DC0R2vhjveujREQHhlTLuC07BMBVHUmBAGT/tgCjrY2GcMS1/YwxPkJjIhU7GLnLzo//MDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(396003)(346002)(136003)(39860400002)(31686004)(86362001)(31696002)(36756003)(41300700001)(38100700002)(66574015)(83380400001)(186003)(6916009)(6512007)(26005)(6506007)(53546011)(2616005)(5660300002)(2906002)(478600001)(6486002)(8936002)(8676002)(54906003)(316002)(66476007)(66946007)(4326008)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGpyekh0UFVWTDMvKzlPK0lQdTI0QStIMG9tK200RDRRbVo5UnQ5VmdJVUlR?=
 =?utf-8?B?b2ZxSjZGZ1RnRXorenFhTHJlY3pKUEpsRkI4dkI2ekkvRXZQQXYzVHdmVkV2?=
 =?utf-8?B?ZUhqUVBGRitha0NsMlVTNmhuY214NldKQTVRdmVJNXRrZ1F6MW84T3hxNVdU?=
 =?utf-8?B?dnRVUDY5ZFZiUll2UFN1bUg3aDI2KzBTdmpwU25XbXZ5NnNBb3AvbEFEQjBs?=
 =?utf-8?B?MWxTd3pVWld3aXY5UlYrVHg0Vkx6T2V4a282ZldwVkZYaXh0L0lOTUNYTzJO?=
 =?utf-8?B?K1l0S3E2a0lrNDhSdWVpcngwbnJydVk5UmFxL2NDME9WdWNQOSt0ZEdkTXVP?=
 =?utf-8?B?aFRKQ1FlOERuNWtuWVA5MjIzK3pkK3NRK3Z0Y3psYUNKelFSNlVaQWVDaFZx?=
 =?utf-8?B?Mld3TGR0eDREM0lwQXpTWnRKUTVQeWttQVhPNTJnQmxraWVQcVNMQlNzUWFq?=
 =?utf-8?B?eUc2NFRUUDZGbkpIRk5JWVltOElDZzIvUFkvTVpZWWl2VFVvMEJkZE4zQi90?=
 =?utf-8?B?Q1dTeEsxcm5ja2hIbGd2eFdiSStwdVdBM1hkVkdaTU4xdnBEczBHb0ErNStN?=
 =?utf-8?B?eWtneGtLZ2R6OVNJamNQNjZybVd0aTVsWC9LaUJJSHovbXRNeUR3cUhndTNT?=
 =?utf-8?B?N1VqV1JubTlIODJzU1ZiWFhtNXFYeDZQNVgzb3dLWDU2SUplRi9zL0d1VHdw?=
 =?utf-8?B?enpoUGkvWWErODFnandML0NnUTZNNGxDeUJoVDE0cE85Yy9yR3cvMXV2OGls?=
 =?utf-8?B?L0lHb3JTUHl1dXJ4Y0ljWmxGZkxkMTJBLyt1THF0Q0g2K01McjE4dVBOenFu?=
 =?utf-8?B?NDVLVGlLdXAwbm01N1NjYVBsankrMjQ1RjlJT2p0Yk5vdUFqblI3Z2p2dms1?=
 =?utf-8?B?cmprdDNQNm5aVjJOcHl4c3hYODhMTTM0bWtkRnNvUUVkbWhVSklCYjBKSmZE?=
 =?utf-8?B?VVNiMWZzMTFpYnkraGRKejZveGlTZWxRa2g4VGhlZmx6RUVhNTBBT2s2TlVF?=
 =?utf-8?B?N0dTMndzMXdGWXMxNlJwcHBiUTdXT1dnSXdKNUFERGNXK0xmaCsxR1JqUWlM?=
 =?utf-8?B?VXBLamVCS2VaTmxidURRdVdzOUpHeUdTMGgzN01Xd3RUZ2xvY1NjTmxJb21Y?=
 =?utf-8?B?MHU1S1FpZlRRSEdkZlpDQ0kyN0FmMUF5UmdEZTRFOGRZUFROUHBra2FVaHhw?=
 =?utf-8?B?RVlaZk90TDgzY3JNWFhidmVwdVZET1AxSldVT3hOZlNDRDUzK2tRQkZyRlpV?=
 =?utf-8?B?bitMMk8rbzFOdXpMN1pJTWQvdDhDVndpcFZDVEU4TktSVGdGMDhlQmlFYVZu?=
 =?utf-8?B?R1Z2aE5MZ01NdUFDVjBwbnVnRng0WklTL1FrUlZBSWdQVUp4WC9JYXJzYVdW?=
 =?utf-8?B?bjhUMFNpUVZZcjVMQ2hpbGFWczFrK0tDNVJvaTZsY2RBQVlJL3VPaHNZUG5K?=
 =?utf-8?B?dXJxcVQ5WWorNktwRVV6WWQ4K3FqYmtjazROYzZseVpuc1JNWTAyZjZ5dHY5?=
 =?utf-8?B?cUVVRzEybzU3cE03bm5NOW1Pc0VyNk1tNC9sRUlVeGRRemV4dmdaVUowWE8y?=
 =?utf-8?B?RDRuanZhM2NoOGRtY2l4alZYcnJyNS9BckZQUkluN0d1MElBdUtjZXp5a0Z2?=
 =?utf-8?B?N1JHVVBWYlBKb2VCTXJKTHNlZTl1dFBaL1NaNEhNeDZLM1lpVFRKcDhCVUNx?=
 =?utf-8?B?VFdMZFRIdVNXcmZ4aW1kRnpOUFpUbkFqZm9BUDVJbHErVFFYOHR4OXFXV29L?=
 =?utf-8?B?UDhUQWZRYjg4L2VERmZuMUJMQ1NHOWViNTlFMmxkckhjVUZHZmZrUkwwZHhw?=
 =?utf-8?B?Q2NpMk9DTmovRU96bWVTMEZuUUpxNWUwNHRRVE1UT3ViWjZISy8zUFNZb0JG?=
 =?utf-8?B?ZHJhbW83eHI3aklsR0NoN2JNOTdZMnhjaHFHMWNyRWNkaFpHVlJJT3pHbWJU?=
 =?utf-8?B?R0ZiRmUwTXZ1UDhsMVZhQlIyMk9mZDFGb1MvUXlMN1JUd2FRY3JoY1hYQVBq?=
 =?utf-8?B?cytWT04ySEFIa29HTnUxYmdTY2h0d042d0VyeFErNnV0eE53cjRZeVNuMURI?=
 =?utf-8?B?cWJnbXRvNlRobm5kMXloT3JzSFI5d0xxNkFnK0lVd0tkZWdKQ0FLQWlybmJV?=
 =?utf-8?Q?GFImXlVIsNxLYwjuWQ0vhbF9h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac25a12-46c6-482f-6756-08da7c345849
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 07:29:08.8789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9weFMYs/BHxFb80wS0wdLp4hRC9ReVqOwwQ5Qjk32gUV0UG8WbPMplniOoLQtWb2Q3cM9HnVgpu6URLcI1bfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3372

On 11.08.2022 21:59, Andrew Cooper wrote:
> One source of lost performance was that fact that to protect Xen from a
> malicious guests, we had to flush the RAS.
> 
> It turns out that CET Shadow Stacks give us enough architectural guarantees to
> construct a lower overhead mitigation, which keeps the RAS balanced for the
> guest so their return performance is still good.
> 
> To keep the RAS balanced, Xen must execute the same number of CALLs as RETs
> across one VMexit->VMEntry.  Without CET-SS, we could achieve this fairly
> easily with a `call; add $8, %rsp` and `push; ret` pair, but this is not legal
> under CET-SS.  In fact, CALL is the only shadow stack "push" operation we
> have, and we can't use it a second time if we intend to keep the RAS balanced.
> 
> Instead, we keep a real return address on the stack.  This means that for some
> of entry.S, %rsp conditionally doesn't reference CPUINFO.
> 
> This necessitates swapping the current order of DO_OVERWRITE_RSB and
> svm_vmexit_spec_ctrl; while they don't have any specific ordering
> requirements, push_one_ras needs to come after svm_vmexit_spec_ctrl or else we
> need some very invasive changes to fix up the %rsp changes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> RFC for a couple of reasons.  This does function correctly, but I still want
> to do more perf testing.

As per further down you mean to say it functions correctly without the
use of alternatives. And even then (see below) I suppose it doesn't
function correctly with no (or unused) CET-SS but CONFIG_XEN_SHSTK=y.

> Secondly, X86_FEATURE_ALWAYS is clearly not ok for committing.  I'm still
> debating whether to make this construct available in !CET-SS cases.
> Mechanically, its fine, but the safety arguments depend on CET-SS being
> active.

I'm afraid it's not entirely clear what you mean here, nor why you've used
X86_FEATURE_ALWAYS in the first place when we have X86_FEATURE_XEN_SHSTK.
If "this construct" is push_one_ras, then the mere use of WRSSQ requires
it to not be used based on a runtime characteristic, not just a build
time one. Hence afaict you could as well put the entire macro body in the
#ifdef that currently encloses only the CET-SS insns.

> In principle, on CPUs which do not suffer Branch Type Confusion, you might be
> able to reason a defence-in-depth argument that if an attacker can't control
> indirect speculation, then they can't bypass the 1-stuff safety either, but
> the only AMD CPUs not vulnerable to BTC have CET-SS anyway.

Yet people may have reasons to turn off its use.

> Third, I'd like some early feedback on how clear it the logic is given the
> conditional nature of %rsp not referencing CPUINFO.

It's assembly code, touching of which needs extra care. Taking together
the size of the entire file (quite small) and the comments you add, I'd
say that's fine.

> Fourth, the alternatives logic (I think) needs improving to not fix up a
> direct CALL/JMP displacement if the destination is within the replacement
> length.  I did the functional testing before wrapping things in alternatives.

Yes, unless you want to prefix the CALL with a redundant insn prefix to
hide it from the displacement adjustment logic.

Jan

