Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79D84BD894
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 10:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275941.471934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM57V-0004ii-DS; Mon, 21 Feb 2022 09:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275941.471934; Mon, 21 Feb 2022 09:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM57V-0004ft-AD; Mon, 21 Feb 2022 09:36:37 +0000
Received: by outflank-mailman (input) for mailman id 275941;
 Mon, 21 Feb 2022 09:36:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vyL6=TE=citrix.com=prvs=04447c275=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nM57U-0004fn-70
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 09:36:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1799a26-92f9-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 10:36:34 +0100 (CET)
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
X-Inumbo-ID: c1799a26-92f9-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645436194;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5jNIvNO4GZxND01VagRoUBd/GzqCBijSlE2w4EcIQbw=;
  b=etNeaEuMfYSYjZQWBE1pcV0sguqpTjkKZDQUZeQ5Ezteb2cBC0GwFQMa
   mo6NerQ4tRjvXlfEyBA2xU1OPnyji0I3yiL6D4jN51WUyOJjYuUkiDUQv
   yq6MD8BdPXiw0/Va5Odqz3GJmdua0GHceoBPmLelds2FVLRXpEgwK5DSo
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64635024
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Xs/FXqjWwMN0hAPYp63HO1ffX161fhAKZh0ujC45NGQN5FlHY01je
 htvCGyBbP6LZ2v9Ldwgbd/i/UIPvceAzIUySgI/+3sxHi8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0Iz8wIFqtQw24LhWVnU4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQsTH4TDs9kSaSFZDgVbGrx9yJ+EG3fq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiCO
 ZFEMWAzBPjGSz9jHVYTLp81peO5p3v2SzwftQ7Lu6VitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQfFxgJD3O6p/ejg0KzUt4ZL
 FYbkgIsp6Uv8E2gTvHmQga15nWDu3Yht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIOuPUXbDMB6
 1Czp9L0IRlIoYalaTGn+eLBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Q2f21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshTV/lhdwTXGY3h+Y1FAN7fbVXhbaZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusMOZyv2PPImPtjgYyjP8UQHPY64Ps04k/IUOsQhHON51HoGibGsM5DFzxF3zPBX1
 WazesewF3cKYZmLPxLtL9rxJYQDn3hkrUuKHMiT503+jdK2OS7EIZ9YYQDmRr1os8u5TPD9r
 o832z2ikE4EDoUTo0D/rOYuELz9BSJlXcuv85QPLIZu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHBP6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:3AeVEqNJAgytx8BcTy/155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80lKQFm7X5WI3CYOCIghrMEGgP1/qH/9SkIVyDygc/79
 YQT0EdMqyJMbESt6+Ti2PUYrVQouVvsprY/ts2p00dMz2CAJsQljuRZDzrdXGfE2J9dOUE/d
 enl4J6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr10jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKva/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdY11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj8lLYIk7zI9HakGOup5Dt
 T/Q9RVfY51P70rhIJGdZE8qJiMeyXwqSylChPmHb2gLtBCB07w
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="64635024"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKRQkXa0qz916XEI1yVmlO92mRKpQsbspRn2b21xU/5aLWXm+3CErMvjtgzaP0RImre1mvRK8J2GlFn+o8VdjEL49qB4z3KK0nDuQYhgJhK2/mL/nGamAD7QMVMihcQWbghN/trn/biWT8v8o+s3+9yGO+bQVloo22xcckjuFHVcrI7LtxFTXwB4DB/fA7OKaTKVDxpRcBkX9xxTgcBng5USlxp6/xDGkVIAI8AH5brLi0Kua9agFYWQS0WTq/Xv3z61yANPq2u84P4c05pn2wiunvze/SAhJbVV80X7SIptfg/+iSC5oVUto1obsCA0tHvCjEX+ERaweDKplgFHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JybfmasKiAgFTnXItVYG5ibtIRfT/x+K2IvtkLPKnkw=;
 b=NXXYeAqk167ugERo9/YfhRolc3p+MzreMdQ4DNeQoZhC6dC5p9lLi/LWRnX2QNEZzA/qHiSIJQG057R9kdD7Pz4Q2mVR1BOdGf4KvlvfCr6zt3jdMEewUFsb0GJr+zEg1Rlv4XWWO6WOBeeQJ8ovSBUL+r8+D4Q7Eot2EGEeILGdNDCtuIEXOsxBmDQVQ+ojg9njxOLIk70yIzrDjmnebM4pSZaeDVqn9ailULxeHA20wZ0K0Qu7gLSO43S3EzkLsHwyhFZea6laFXEJUNsTfKSPMrJGgC83h6Q9WyTa3M+Z0CslCRHS8HwSjlDYZI1JpVsrpitWH5WCzlHSYUGcOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JybfmasKiAgFTnXItVYG5ibtIRfT/x+K2IvtkLPKnkw=;
 b=Gf0fZmpXZ0v+OnTeLk24nKqxEI4vy/9BYc3S7W42BN4q73wIicdfLVTPOrScbiv9hptnP8NIoo9vWkNA+tRW65wu+cKE6SF8vj17zOtZHdeZ6o2urQHEvwmtpdSyM5f8gBumAlarHFLbnMcFJT0+nFFPpCPopWik1oA+vna+HMU=
Date: Mon, 21 Feb 2022 10:36:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/5] x86/cpuid: add CPUID flag for Extended
 Destination ID support
Message-ID: <YhNdCnxjmUW9/Ui2@Air-de-Roger>
References: <20220216103026.11533-1-roger.pau@citrix.com>
 <20220216103026.11533-2-roger.pau@citrix.com>
 <979fbc26-925c-f58f-9c1a-9ccd72275c9b@suse.com>
 <fd22f7e19590b0e8679e5a3a15992bd1f8a92126.camel@infradead.org>
 <9b5a8474-0be2-b4e6-8919-7e22dde1570a@suse.com>
 <Yg4UPzFk15tJGo0B@Air-de-Roger>
 <4d89ffe13d2579096c955edf800b5c86.squirrel@twosheds.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4d89ffe13d2579096c955edf800b5c86.squirrel@twosheds.infradead.org>
X-ClientProxiedBy: LO2P265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9496f261-cbd6-4914-699c-08d9f51d9b09
X-MS-TrafficTypeDiagnostic: MWHPR03MB2464:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2464C8D6226558BE6CAD83758F3A9@MWHPR03MB2464.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mWHks6dVksDS4WXpwwo/k28CKVJqvgSyjO7+2M/fQH+pmLpkrUKvJrn9YuxZU7LnIrNFk6uO6d8K8rZNXt9O/AMoA4WMoS+VZzwMsEnkq0A50SUqMyxpbYFugAE6d/9rtt7o9YwQZP+g1PQJqivjD35PBa1Fa91mcEETEq4OSR5SLE/65WTJl+w4ffxz+l93dvoBuPUXqTUanj4mX/nHfU7MItZJjvtbSJlchl9ndiGJauInboaRCpa4CqXTrdZCnFQtU+IivxEoDqQN91WNaJ/7h8ruE4U5GfzgcccYoTOQ1vpesFpjiEj4ZgUtDPs9/tskmDfChqWXQRWEAv9BFoby2wvyd5bBBtVgj+6pZ5BxcHrvrCHirexb7a/NkerqbEqupICO1UC+GKu/X63vtqTqemfH6h/1KxgU/0cjHaP3+RGl62z/FEwEu/TZLyFAx5YTdAPuF/j41iqxJ3KnEBtsUU9N0BHxzhc/qlQzuXzKENfsE+4A+/dXD5q9viFZhCI/OjBVZFanyCl376bHaos4q4e/8240OtigUrj4/G+9FmIc1M38zFMB6WAPj06nO/6shw+o8+NG2xYsSfKA9mVebNm9YWR7E7IRZ2JXmSBcwGmTWUmRxrLSKHO5dTjhQYOrU30l6KEa5wTxt1TebQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(85182001)(6666004)(508600001)(6486002)(6512007)(9686003)(2906002)(38100700002)(5660300002)(6916009)(186003)(54906003)(8936002)(26005)(316002)(86362001)(82960400001)(66476007)(66556008)(33716001)(8676002)(4326008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVgreW5oR21saU5CeTlWZWEyOGZBTTB2ZnN2NGlSM3BvYm1tQlpydmdSRlMw?=
 =?utf-8?B?Y1JhSlVjRjNoVXZxQnlySVZaYm53V0YxbXZGRjdJZzdiMTVpRkZ2R1RUMUsv?=
 =?utf-8?B?TjRjb0xmNFhVaTd3WmtBQUJUTUpudkZDelBoa1kzNEkvS25YVm1EUi9IT2Vq?=
 =?utf-8?B?MDMzdDNEeEp4S3NKd1RKT2dmOE0zWlZrVyt0M3QrK3M2VTBkTWpWckdabzlZ?=
 =?utf-8?B?MmwwU0M4d0hZMm1CTUFSRSsvWTV2ZlZMS3VzUlhyZmxiZnhNZlQzZW1FNlEx?=
 =?utf-8?B?NGhrK0h0MHRvY3J2ZzZvR21CNG9seWFwOXZOZHc2TjNlZVFQbmRoL3VZYlVl?=
 =?utf-8?B?OTZIdTh2WjFzODVwWVllTW5jOTJmMzRGVmdLMW11Vk5pLzYvOTdzWTNKRHZY?=
 =?utf-8?B?RnBFcVlWS2QyZktUMlZoaWRKSlU4Z2JhaXRmOXlpUjZUOHplazdHbnd4UWQ2?=
 =?utf-8?B?TythOWEyajZweXYrZ3pkYldSUDZORmtmQ1JoaGRxMENrdzJiZzNGMHM3UTlT?=
 =?utf-8?B?WWJxK1RFajkrUGlWNmlnekkyZlpzeXBwQ2NPeTdGU09mNEF5OGxvdnlGZkZQ?=
 =?utf-8?B?c0xxcnk5eVJ3SkpwcGtodllJUFZDdi9xVnY2R2NZNXVBV3Ivb1VrbWZKSzZ0?=
 =?utf-8?B?TGo3NVlWNFU1OVhOTHNvU0FxeW42YUJYT3RmZWdydGlDanBvbmNYRWZiL3RJ?=
 =?utf-8?B?emlZQ3lHZmZvUWZzZ0g2ZzhzTjhUU0IzYnJlSGRhWDcrQndMMm04a3NZcC9H?=
 =?utf-8?B?N2NQTDdXOTVVQjlCbGFJZmlUN1lic0Z6WmtvM3ExQXdYNWlobGRNM01ldnBC?=
 =?utf-8?B?NVE0R2FvaDA0Tm1aVmNZMXQ0K01vaUlhRjJ3QnpCUlkwa2p1NnBWcjhzVzgx?=
 =?utf-8?B?LzQzSGhlT3hOc1dQVVA5SEh6SFcxVzRWVy9tSWlXY0dqUFBwWkxldjI3WGw5?=
 =?utf-8?B?bWZBODRDYVNPTFFhLzhrcjdUQ1IvRk1iTnJEWGJuRkFKd2NWcWY5Nmx5c2VV?=
 =?utf-8?B?aHpMMzR5UFczL1hNMjJ3UCtnRjJKU2Z0aDJ2cWk3RFFjeVlwcjN1S2tCMWY3?=
 =?utf-8?B?L2E1bktlQktkeTIrZUR0L3EzR2RZQU5aQXkvNjh1TU51S2VBaEVCaENpRWRo?=
 =?utf-8?B?ckdqWWxGL2tvTDMxWHh0YVZQRkhkd2hQOFRHdGlMWmwzdUQ4Uk91bXBJVVhw?=
 =?utf-8?B?ZjNnR1BzaWpyaFgwVU5XYXcybnVXanZiRGZBeWhINllOZGI5b01mVVJkbmps?=
 =?utf-8?B?ZmRoeFBXSDJGS3BLWDJUNlpkUXRLM2dQMFBBTFdPSk1zTzBNM3IyOVF2YmVH?=
 =?utf-8?B?ZjhCWUh1R1dqZVVBemNIVlJDeTB2OWVyNHdFRTZMczJBUXMvN0tIMDhELzRy?=
 =?utf-8?B?Qi9XT1BIV1Jwd1lFekR3U0dHSFR4YmdWTzdkWi9RVDE1Q3BFd0wzN2x3MExG?=
 =?utf-8?B?TStJK0NySldpcFlFdm5pV0JndlRDNmFaUHg0RkFpQ0JFQ2RIbVpUazN4UFVN?=
 =?utf-8?B?d2NDcmZxVGVjVzAyV3p2Q1hvY09rdWNrOExNNURXTU9OVnJuT096Nk1QQ3RW?=
 =?utf-8?B?aFBSUVFJcnFMWGhOSFcwVU5xalB4L2x2c0ZqWnVDVWVvUDh4c3FBRTIydEl3?=
 =?utf-8?B?Uko0N1orN0VZbWFHcTNuSDQ3OERIeWZHaDdyUkV0WitzQVlmc3JET0Yra0My?=
 =?utf-8?B?d0xtQ0x6Q1pLck5IKzFuNDQrQmYwNWNhQkxJVnhQSWdTKytPekc4Q1pwcFk4?=
 =?utf-8?B?UGlBY01zc3J4cFdDRkp3V2lsTlJWTm1GMEYzVEZUSmFNZVVaSHNjMmltbE5B?=
 =?utf-8?B?ZHkzYUZxMDRLMkp0MVgxTysydTBsYzc3UlB5QnRmeDVVZnZhZEFCVzVaVzVz?=
 =?utf-8?B?dW1PWVRYdjFCWjBwaW9nVjVBMWdBY3EvK2ZNOTJWeElNd2tWalZQU2RkbGdY?=
 =?utf-8?B?OUVVMlhlZnBlWkIwczZxcWVlOXpicHNiYk4zVFI4VHRVYnFiWkNlendDSGs3?=
 =?utf-8?B?b1RLUjJVTmluKzNFbXpNRXlnTFdwcFJnbjd1M1E5ZUhqOTJZVkt5d042RmEw?=
 =?utf-8?B?VnJwM2ttekYvaExIWVNjUkYySy9HT1JnT1RDaTZRa1BtVUIvYU4zMzhYV2J2?=
 =?utf-8?B?K0VEUHhmNlRzU20vTHhQajd5S3k0NStJNDlYMERjM2FNN2N1V2VyM1ZiWFpq?=
 =?utf-8?Q?xnrA8IudsFshGyqtN7U+LHk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9496f261-cbd6-4914-699c-08d9f51d9b09
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 09:36:15.6088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56rL6qv14O+45nNv74qz6tWoy4KDO5kk+65OZRsHj1F+q5UnVVF2PqzbA30D8eRuaugtPvvFtygsyGRm6f4Epw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2464
X-OriginatorOrg: citrix.com

On Sat, Feb 19, 2022 at 11:24:25AM -0000, David Woodhouse wrote:
> 
> 
> > /*
> >  * With interrupt format set to 0 (non-remappable) bits 55:49 from the
> >  * IO-APIC RTE and bits 11:5 from the MSI address can be used to store
> >  * high bits for the Destination ID. This expands the Destination ID
> >  * field from 8 to 15 bits, allowing to target APIC IDs up 32768.
> >  */
> 
> I am not keen on that wording because it doesn't seem to fully reflect the
> fact that the I/OAPIC is just a device to turn line interrupts into MSIs.

But that's an architecture implementation detail, I'm not sure I've
seen this written down explicitly in any specification.

> The values in bits 55:49 of the RTE *are* what go into bits 11:5 of the
> resulting MSI address. Perhaps make it more parenthetical to make it
> clearer that they are not independent... "bits 11:5 of the MSI address
> (which come from bits 55:49 of the I/OAPIC RTE)..."

That could be an option also, as long as it's clear to which bits of
the IO-APIC RTE this affects.

Thanks, Roger.

