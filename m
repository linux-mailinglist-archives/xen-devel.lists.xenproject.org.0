Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E6C48ACE3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 12:46:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255705.438242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7FbE-0003ld-9k; Tue, 11 Jan 2022 11:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255705.438242; Tue, 11 Jan 2022 11:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7FbE-0003im-5f; Tue, 11 Jan 2022 11:46:00 +0000
Received: by outflank-mailman (input) for mailman id 255705;
 Tue, 11 Jan 2022 11:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Jw/=R3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7FbD-0003ie-7Z
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 11:45:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0840d934-72d4-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 12:45:55 +0100 (CET)
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
X-Inumbo-ID: 0840d934-72d4-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641901557;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=zQLombefq8WBuZusJs270nFXQ9dXIg9hibuZtnbfBtY=;
  b=aBr5kOXP8jFNPST77tqxyvzj0mIv5jywn9pYJZTcwLCd7FydIWY1jKBs
   7uRL/OGO0AqyPZm3iQH78FwDQcM501ONvAJHfFCxWQrJTARyP8V5Yzrte
   664OEK4H8K+mGBQxSwu/kmqdICYUur7PFLm+jlUD/W0rpzytW/qE7IHXq
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rNc5iZC2jVIIVwxiVIeteXI3+OnS49YBt4d8o9+3YKGSnz6bN8DMKijv17DvMlJbGrvX2aBfff
 Azbr3CmGqJgXS6q4G9ssuMNjGMTyzyL4r1wIbTsJKOV2sMkfn/jESu1QzMomAUdjPBTa0ZE16l
 dPpeyXmL+l9yxPFB8CiQaF0P88gmjdvVzi4mTBRjHYNh6cE00xlPnozsFP+WHnI8LdozzSolto
 ekASvlfziu+p5wFTXvwJSsHCWATiW7cY++ZXATfX01EyPrKgyvGk8u/8APi2yVXC2nN/bSBKiE
 bLIgLtK/dqUbDDB14G+cSsmx
X-SBRS: 5.2
X-MesageID: 61729341
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eUfU6qNp4b+6hynvrR0okMFynXyQoLVcMsEvi/4bfWQNrUok0WMGz
 mEfX2rQbquPNDT9co9+YNiw801Q6sOEmNc3SAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Es6w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2qGrcB62
 MRCjqHzCg4ABaOQhsAsaRYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uTuoUJh2tp7ixINa7yY
 pE6Th5LVkvdfUxPOnpLVYwdgPj90xETdBUH8QnI9MLb+VP7zgNr16P2GMHIYdHMTsJQ9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3uFuqE2ewCoUEhJ+fVmxrOS9i0W+c8lCM
 EFS8S0rxYAz606DXtT7Rwe/onOPolgbQdU4LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobWMl5
 E+Cj8LmPgEs87S8cnzB6JOllzznbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhrx/sChc+Ij2unAsotJBCtdbZXtWYGn4EOzAR1ofNfAFQnpU
 JTpdqGjAAEy4XOlyXTlrAYlRujBCxO53Nv02wUH834JrWXFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtztUpR2lfGxTY+4Dpg4i+aihLArL2drGwk0NCatM53FyhBwwcnTx
 7/GGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiLr
 753apXboz0CALyWSnSGquY7cAFVRUXX8Lir8aS7gMbZfFo/cIzgYteMqY4cl3tNxPUKxryWr
 yDkCie1CjPX3BX6FOlDUVg6AJvHVpdjt3MreysqOFejwX84ZoizqqwYcvMKkXMPrYSPFNZ4E
 KsIfduuGPNKRmiV8jgRd8Cl/odjaA6qlUSFOC/8OGozeJtpRgro/N74f1SwqHlSX3Tv7cZu8
 ae90g77QIYYQ1gwBsjhd//ynUi6umIQmbwuUhKQcMVTYkjl7KNjNzf10q0sO8gJJBianmma2
 g+aDA02v+7Ip4NpotDFibrd99WiEvdkH1ocFG7etO7kOS7f92ul4IlBTOfXImyNCDKqoP2vP
 LwHwev9PfsLmEdxn7B9S7s7n7gj49bPpqNBylg2Fnv8cFn2WKhrJWOL3JcTu/QVlKNZowa/R
 mmG5sJeZeeSIMrgHVMceFglY+CE2a1GkzXe961ockDz5Ssx97ubS0RCeRKLjXUFfrdyNYokx
 8YnudIXtFPj2kZ7bI7eg3AG7XmII1wBT74j58MTD4LcgwY2zk1PPM7HASjs7ZDTM9hBPyHG+
 NNPaHYuU1iE+nf/Tg==
IronPort-HdrOrdr: A9a23:hDZCbKNeuCM2xsBcTyP155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080lKQFmrX5WI3NYOCIghrLEGgP1/qG/9SkIVyCygc/79
 YfT0EdMqyIMbESt6+Ti2PZYrUdKZu8gdiVbI/lvghQpGpRGsddBmlCe2Km+hocfng7OXN1Lu
 vV2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnT4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUrZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpwoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPXi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZNIMvD0vFnLA
 BSNrCd2B4PGmnqLEwx/1MfjeBEZ05DUCtvGSM5y46oOzs/pgEM86JX/r1bop46zuNMd3Bz3Z
 WwDk1ZrsA+ciYoV9MPOA4ge7rANoWfe2OEDIqtSW6XZp3vfUi976LK3A==
X-IronPort-AV: E=Sophos;i="5.88,279,1635220800"; 
   d="scan'208";a="61729341"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Da7tNfpN3Oc44pyyIOe3/36RscLsTcRPcF0vUgAem9W5vCf/l3ZV8CyeBKtlHBYoDfBClSk+AleJuAEFqUGXMj6kPRhzyo+uWTcFTdkc4Ujsw3GE6/x6HTaa68VWGJe9gFVl34kSscyUgv/oa+B/qUeERkqYIaIxVLxRX7W6znYD4lXT6zMsXxMYXXHgRASVdXAXZ1nvfs09V7z1bs9nq9zbbVbrw4KgEDiMKh7cjxtfZuSGjA3bL5wITkVH6Tf49Ym3d5OIeGO9wQF8ey/jCDzxlEp3aq7Ht9kTTa1kPwUHWBkCKc6/Nl20ehI/6YOw10+OQqpc1j2IfWCagAfTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6P822Vxo5HdzqJSK86yHAzW8bg9tOrpVCq1Cd8R/f4=;
 b=GiN9vksrasRlP3cjGulluBofMqRnGntQgdjKFDXGJBxkQTZ2r5X7HlwW5M6blgJlR9pAT1a/4WgkaUYhdachgNneZhP4Dha5fdYJru8Qeljwwdv+OpycjDhEzedcTn6syg8vDLDQnO5WOiaFEl9G+/+K/o0+2mQooKRi1MLQwS6c8hH1rcDPM7eKw3JbQYywwSWcVQyPRxq/hL/19nurrLcR/47YLMaiKkVq2Skq/wCFJZ9kxnR4PoeE8P2kan0lWYNBiz0dtqPJ13V6YESs5GSj3t8xKxAv1bTJgA1R9rVc+l0xYXD0lkWQEKMSXTtjxDkdp8naJQNygEeNPOxeIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6P822Vxo5HdzqJSK86yHAzW8bg9tOrpVCq1Cd8R/f4=;
 b=XuTZld+BcMj+XiSZiWVQIS8o+nCTdOc2peUb83XPv9apImcvPuhMetAt8xjIHzDC8zl7vI/EXwV56opNoPtmS1fZLdcZm4jgF3UoxBBrGhOWlX3nBQxp8IOniRZHplI4gx8PyGVwR8RYmV/02IzSgeBJYWNbXn1MuIJudDVUWps=
Date: Tue, 11 Jan 2022 12:45:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 05/12] libs/guest: allow fetching a specific MSR entry
 from a cpu policy
Message-ID: <Yd1t7Uhem/233ckk@Air-de-Roger>
References: <20211129153355.60338-1-roger.pau@citrix.com>
 <20211129153355.60338-6-roger.pau@citrix.com>
 <f7c427b9-2564-dc0a-d03d-411df83ba9c8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f7c427b9-2564-dc0a-d03d-411df83ba9c8@suse.com>
X-ClientProxiedBy: MR2P264CA0189.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::28)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 917f5000-b73f-4b62-d3f3-08d9d4f7ec5c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB44769DC26FDA5010E99C5A1D8F519@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q0cNLLBkU+aEQXiAsxomUiBknbh97qHaIX4zQ2DEFxnXubMdNlExhlQfm7KZZhUB2FVPMlOyLnNTqeJbU9nMhd6zOPnl+vIUmUSGc0LKGaPr0eHYbaDn9J3audKstz9e21QaleVaZ7pMsyK96Z+sGEUV2yymsjgc9yAwJ1NdIWW6N4oPfqfTzE0CQhB4URwXrsKbT4Dzl9pMPaYMJxkkBdGfNYevyB71yMSPl/KFqzjz833uZUA11BX0a2flKTXH8YDocubqlPgsh+LYzFubbV1/Y4MhtfNJiLZn5EOr2u+EMZCkCx3jpVevzSEKX38QZW1ooL2EoYJUDEuRdb0RhoJ7YzqPVVlUgHXmN09vWILqSt9/BTGNa7tpOD0p9QcgoEeF3BZ7dGBkHIeN5N/NpiZZ5fOe0ygX3abFrPQfnU+WMZeDuQ/ik79l6ECptw22ZOTY2ahKX59E4DBhCZ4ZChKo5WrzmmW/zGiyW+zBfE6ah7LnmB9EMAYFCjTl6U4obQLrxw4VI5og4OmgIfqCS9q5qdtSZ65alsHeGnJcdxkW58FPueaJPY1GgaGjDklk9fhkR29ae0tupfZUZQVCUW4cmoNxFJMakZxBih7a17lJrEvksXE3KGaerl8IaIfcVwIg//paID1LooPtQANGBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6916009)(85182001)(38100700002)(82960400001)(86362001)(33716001)(508600001)(66946007)(6506007)(54906003)(8676002)(5660300002)(53546011)(66556008)(4744005)(66476007)(26005)(316002)(6512007)(4326008)(9686003)(186003)(6666004)(6486002)(2906002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0JmMFVKYTU5QzFETnkyaEpDRWJOVFlNc1hQRFM2WWdCOUZ4Qmk2ODAwM1Bl?=
 =?utf-8?B?RlZCOWY0Q05PNjczUHlvRFJnZEp0a0VCZzNOTzVhZWtWbzg1aHpOVFh3S2hC?=
 =?utf-8?B?SDFvRDh0T28vZFVyZ1h6dDBXRzZ6anNUa1dkakorM2pLcWlWQ25CSmJKcG81?=
 =?utf-8?B?R3BCcGV4ZS9TSCtnblAzUDhVUEs0cVVkMkRKU05PWTVWUzlqMmx1NFZWWFdR?=
 =?utf-8?B?MlRRUHcrZ09FemxLTW5LOFRtVzNQVjFRQlpvSEkxVE1RMjhRNEYzSCtPSkgw?=
 =?utf-8?B?a1FOTDZnaEo2ZU9jQjRncURqT1NGMTRtWG56QndUTWJ2dURFb2lyNjAySURi?=
 =?utf-8?B?WUNwOG9JekJuUzNYODhMK0FWbUNwb0xQUDUyMDM3c1RWS01BczFLM1ZKTkta?=
 =?utf-8?B?RkNRVjJKZnBOTVpXVGxYRWhXd1dwYS9OcldyR3kxdnVJNWhUUitKdC9PL0Fj?=
 =?utf-8?B?cFQwYUhUVHdTYnFmNkFXcEZESzR1cjgzWUJWYW5uZzd1S3hIaU4yUXNncWFE?=
 =?utf-8?B?aWNVT3NFYnBEcGk0dUhYZm9QbW9tdU40V2lCRm9wVDIrTDhPRFYvWEowL2Yr?=
 =?utf-8?B?OTByRlo1VjZ2QzZ4SHdvdFp1RTFrenVCWERVanNMNVlrd0dNTXpuemk5K0xD?=
 =?utf-8?B?L3JCd2VqR3U3M3pJWi9mK3lEaWV1Z1VRSDBGK1FOTnlja2R4UEpjTCswbzA5?=
 =?utf-8?B?SGNmMTVaa3ZVY2Y3bTVETHpvSnRjN01xVEljTHZUUTNHNStpTXMxZjE1NVRW?=
 =?utf-8?B?b1cyRE5aZ1d5bDhzQllaOU82TldYVDhZSVI2VWFMUW5rWm9zVGdHZlRLRCtx?=
 =?utf-8?B?N3BmWlI5UXdyZVcyQW1VRHNzeDVNU0NyYkVlRngzTElMaEl1eW5YNE1jc3gx?=
 =?utf-8?B?bFpDUDBXUlprQ1h6Q3NPYlp3cjJjdDJJV3JMeUNEUkN0MytiYlJVRnpWQkY5?=
 =?utf-8?B?d3pXQ3FETXlBNGJrZko2QUtTT0s2Ryt6UjFCOU4yWWlnQThxZEhpdFlTVG9G?=
 =?utf-8?B?bXhMUi9yd1RIb000OThoKzFUcXR3dDB6YnI4U0l3b2VybC8xVHlDT2dIY1dI?=
 =?utf-8?B?Z092Z0l5LzRhanExVzhmYy8ydmpsQnhDTm5USlpJKzJwT0NrTmQveGlQZDR0?=
 =?utf-8?B?a3UrdTJZRW1IcVZ0WWt4VWprdWNJV0JVQUE4QnBoV0F1SzNXaUxHTEQ3NG9V?=
 =?utf-8?B?b0twUUllQU1KUUFHOEhiSTQzQlpFS0I4ZUZxSGFBbUFkNjBmWVNCdXpMdkdF?=
 =?utf-8?B?RVZmOHFqUUZRejNXNGphRjcxT2J2M29WUTREYjV0ZXZOdURNQnN0Q3BNZEdC?=
 =?utf-8?B?OERTQ29hdno1dVhmTlMzOTFuRnMvRlc2Z01IOUtUejRIcERTNkhzQzBuVVZq?=
 =?utf-8?B?bHdyeHFZdzJNQTJpaFVCVTRjWVdGN3hlVXZuOGVjcmRJWlFaM1NtTXlJWVc1?=
 =?utf-8?B?VVA5TU8za1pMS0VWU2F4YzFkNFNTN2dXdWQ3VFpDVWthVlpNMFVDN0RYUHE2?=
 =?utf-8?B?bHVrQTc3czRsczlWNGQwaGJVNm5BQnM4M01LejlKSE1BV1MyZDRsbi9TNkhz?=
 =?utf-8?B?b1VOWmxvREozMyt2dUZDWEc4bUh6MFhBRnQyL3dLQWNsSGN6bjMyYVRERlBB?=
 =?utf-8?B?bzdlVzhJVlZ0ZXRoZWwxWmZ4M0JhQnJyL3VkaEpxc0NXZi8rT3F3cnhaWnpw?=
 =?utf-8?B?NWttd0EweG9nVGZsdjR6Ym1yR04rNkJuZkdQQ2hqc1VGMVRpd01pVmlMZjg3?=
 =?utf-8?B?d0NnQ2gvdlNtQk1lZmR5a2J6WjM5NjJyMGdxWUhtbUZmWWJqbmdRNTdna1FT?=
 =?utf-8?B?RzZmUFJyN1IxUW1zczlNbGg3bjRMR1RzSjJQMm9MbzArdGtkV3hpKy8rK2pH?=
 =?utf-8?B?eXJjcVlGZXFYdW1DTVE3Z1R5TFJFa2lTSlVwUE5ROW9jRXlVOUh6Y3RaVDA1?=
 =?utf-8?B?VHhCTjJ3eEpYWmp0TjFOS2VJYm9GdUtpaTdsV1U0bUlUd1JEaE5ReW5LNE4r?=
 =?utf-8?B?NkVQUzVIcjZUWlhmY3ZXNU80WE5aSXY5OHpYUThUOGtRYnZ5alhwSklmWVlX?=
 =?utf-8?B?RElVMlR6MHc2QU5xSnhZQkFpN1p1YWxaY1FuSmFWS25ja0dzMUprcHJ4Wm41?=
 =?utf-8?B?WHNpQ2VQVU5yYkNVMUkzRWMzS0ZUWnhYeHhlaFNhZ0tNOENuclczTjg5dlF0?=
 =?utf-8?Q?OcgjM+rGfKgCq2G4o4e0rjU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 917f5000-b73f-4b62-d3f3-08d9d4f7ec5c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 11:45:53.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgik42k4XgfDAIp/ZodLirll1AeLnpQRUWyjcjjb187/1R+QV+rUeO+yEMF50MSkPpAK3OFhoGVmTsZlHsuOwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Mon, Dec 06, 2021 at 04:27:25PM +0100, Jan Beulich wrote:
> On 29.11.2021 16:33, Roger Pau Monne wrote:
> > --- a/tools/libs/guest/xg_cpuid_x86.c
> > +++ b/tools/libs/guest/xg_cpuid_x86.c
> > @@ -878,6 +878,26 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
> >      return 0;
> >  }
> >  
> > +int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
> > +                          uint32_t msr, xen_msr_entry_t *out)
> > +{
> > +    const uint64_t *val;
> > +
> > +    *out = (xen_msr_entry_t){};
> 
> Unless there's a specific reason for the divergence, this just-in-
> case initialization should imo be consistently there (or absent)
> in both the MSR and the CPUID function.

Right - will add the initialization to the CPUID function.

Thanks, Roger.

