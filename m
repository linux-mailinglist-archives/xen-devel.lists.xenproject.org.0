Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4912948D759
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 13:19:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257169.441834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7z3m-0007aN-Va; Thu, 13 Jan 2022 12:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257169.441834; Thu, 13 Jan 2022 12:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7z3m-0007Xj-R6; Thu, 13 Jan 2022 12:18:30 +0000
Received: by outflank-mailman (input) for mailman id 257169;
 Thu, 13 Jan 2022 12:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64pG=R5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7z3l-0007Xd-E4
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 12:18:29 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8e73e8a-746a-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 13:18:27 +0100 (CET)
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
X-Inumbo-ID: e8e73e8a-746a-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642076307;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2d2QhPJhSOmwdxtuRv/X8nNTr/8kzvhNDLu+3zTi8VA=;
  b=KcNbeENhv1OcYRgvLqSLvjQZhXGA9XjZjFzSekkXcnOB16HgqhXswsJn
   0em4vvTlpALzbUmLfSYA+kD5i6FRgAHCsuwm/1z+EvfHXy0DsV1kkxJzh
   bkqjA/UW7lJN6va274ACxqjqG22BytNaQY8t6EO7NcJCBk8h9E0P0RDL9
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yWPlkplV1nfc8Ev14kGzXunBnPww4w+96ll7IbWlJcBzmIpA0hh01AkuxYud2LW3Wz4HGLIw1i
 FSj/kyqYLZgjCBlBbTxH/WLKHDG2V8W9bgV9AMUowv8iPmIMB8uCS9DmUkrnGCQPsSa7gy2yPP
 kZIZ+fmDqAqgPN1imLUNPrxLFk7WSfpO7yRYgP6CuiQ3vxh5KwcQD3x6oe+G5JDFgMbz1BhTaq
 gWmVGMh8pIqF0OsCaB8u4JVTYZGKfCffqsVliGWVcJgQj68h3zejqNxfGFrGPMDe5TUIK+ZR5z
 T6engfZq/oqqywQQYFn8uQgJ
X-SBRS: 5.2
X-MesageID: 62317552
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nGu/8q9XrObz0PUEumSqDrUDQHiTJUtcMsCJ2f8bNWPcYEJGY0x3y
 mAcDGmAPf6PYDH0e993bYni9xhV7J/cm9RhSlRsqSs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dg2dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhe2
 dJ8n5aXYD0uO6f2pr84dCkGEQBXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhmxp2Z0TR54yY
 eIXQ2czbA/RMiYMEQZLKp0DpMmGtEXwJmgwRFW9+vNsvjm7IBZK+KDkLd79atGMA8JPkS6wp
 GjL4mD4CREyL8GExHyO9XfErsbVgS7+b6cDG7S5++BCjUWawyoYDxh+fVy/rPqig0iyQeVWL
 UAO5zEupqg/8k+sZtTlVhj+q3mB1jYGUtpNF6sh6QeCyoLd+QPfDW8BJhZLZcY6rsYwSXov3
 0WQgtLyLTV1tfueTnf13rWJqTK/PwAFIGlEYjULJSMV7t+mrIwtgxbnStd4DLXzntDzASv3w
 T2BsG45nbp7pccN27/hpQifqz2pr5nNCAUy423/QGWh6Q9oYZ+/UIah41Pb8PVoIZ6QSx+Ku
 31ss8+a4eMVBJeBjhuRUf4NF7Gk4fWCGDDEiFspFJ4knxy24GKqd41U5DB4JW9qP9wCdDuvZ
 1Xc0T69/7cKYiHsN/UuJdvsVYJ6lsAMCOgJSNj7f91/SJJWXTWA+StUWxW1+FCzkmkFxPRX1
 YigTe6gCnMTCKJCxTWwRvsA3bJD+h3S1V8/VrigkU35jOP2iGq9DO5cbQDQNrxRALas/V2Nm
 +uzIfdm3Pm2vAfWRiDMubAeIlkRRZTQLcCn8pcHHgJvz+cPJY3ANxMz6e9wE2CGt/4M/gstw
 p1bchUIoLYYrSeWQThmklg5NNvSsW9X9BrXxxAEM1eywGQEao2y9qoZfJZfVeB5qLY7lKUsE
 aVVIJ/o7hFzptLvoWR1gX7V9t0KSfhWrVjWY3rNjMYXIvaMuDAlCve7J1CypUHi/wK8tNcko
 q3I6+8oacFreuiWN+6PMKjH5wro5RA1wbsuN2OVfIU7UBiyoeBCdnyg5tdqcppkAUiSmVOnO
 /O+XE1wSR/l+dFlqbEkRMms8u+ULgeJNhELQDmAs+fnbHmyE6jK6dYobdtktAv1DQvc0K6je
 f9U37f7NvgGl0xNqI1yD/BgyqdW2jclj+YyIt1MECqZYlK1JKlnJ3Xaj8BDurcUnu1SuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4cBfg+St63LubSkEObROCvzNQceluO4Q/z
 OZ/5MNPs16jigAnO8qthzxP8zjeNWQJVqgq78lIAILihgcx5EtFZJjQVn3/7J2VMo0eOUg2O
 D6EwqHFgu0ElEbFdnMyE1nL3PZc2stS6EwbkgdaKg3QyNTfh/Ix0BlAyhgNT1xYnkddzuZ+G
 ml3LEkpd6+AyChl2ZpYVGe2FgAfWBDAoh7ty0EEnXHyRlWzUjCfN3U0POuA8RxL829YeTQHr
 riUxHy8DGTvdcD1mCAzRVRku7roStkorl/On8WuHsKkGZgmYGW63v/yNDRQ8xa3U9ksgEDnp
 PVx+LciYKL2AiccvqknBtTIzr8XUh2FeDRPTPwJEHnlxo0AlOVeAQSzFn0=
IronPort-HdrOrdr: A9a23:eRy5BaiVC1ljOeLG7V7eWRZyvXBQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUZqFh5dL5iUUtMPpZxfSKJMB2/ffvtChPlHb21LtBPB5ryw6SHkondotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="62317552"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeLyqlA/zAzv8lepbdeIOu8QWCGbYLyc/rQnYGyJrHP/G6ANV1DXcFVUlZxkThp2kUo0m4I2feXXKEy7Rpq7wglRIL/IY8HH+rpwUQrus3u/6Kj9KqcIwFFO7OIyX6hwbc8DDBdERZE8CNfA4XGrOmRlzkr+z330N+bt5Zc2AMP9NSEZR4iTuSIQyALeUlwCM0FOrltx5c4h8xHik+biqTp60d8hdp/0D709VCGkcKZU25iyjZLB8R0fMjguOdCvPlLvIyWuf4I4ECo6nZrrZqvetmHmb37bDHqjeW3K09FOUv3Y124LJdkpztTeXpCsOxH5DwecSsS5yUZ09vlnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XE3/eOH5mYVV5j3s61hJ7bU+F4KZdw59sbl8x8LH/cQ=;
 b=OXbs/UHCWboQZvQWbDj1jYDvpylu31AEmLTNxe/oiAONeCa57TmSG/vV3RRcEiFtlrIm/dF58bYGiLre247ZM/j7C6B3YfjFTzL0c52KzgPZmMBZipDUgATqogEOKxFRLwTRVTsL+vP7iOiubAcRk+eymzqQHEzXoshLMNHA7k6WgEpJrf7Z0GZSMaIqDSwDTvQWmdrb4rnIk79qk1oa230iZ6Oi4gWY3XIuWYL2CRnCVsHx2EfQ7pCQzGLG4OHazd7cKgqGtZ+9wvtWYb8hbVdYwChYGwXmbEgHauEnhJsAcmB0GK8PTxCCIAgvGKL3f+qmXgenbuHv3jOv4D4Avw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XE3/eOH5mYVV5j3s61hJ7bU+F4KZdw59sbl8x8LH/cQ=;
 b=Fu7BQMk3VLywMCwqatxYkg4m1E3+lLnws1ywY02vzu+xdY54MHIPPEld8nROMpyJBFH6b9tFpka3pXxEFIlikrAaKpUgs/aP4As54PXmQHrIhA0GRWN3nB/Oh7vlVaF5q1EcjLKuyl1R6dsHRkttjTbRAFg7LazPfDrAkNwyTkU=
Date: Thu, 13 Jan 2022 13:18:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 12/14] xen/arm: translate virtual PCI bus topology for
 guests
Message-ID: <YeAYgOIcBMjMeWU9@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-13-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125110251.2877218-13-andr2000@gmail.com>
X-ClientProxiedBy: MR1P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b61ab24a-9c0c-43d2-c707-08d9d68ec68c
X-MS-TrafficTypeDiagnostic: BN3PR03MB2242:EE_
X-Microsoft-Antispam-PRVS: <BN3PR03MB224215F00736C8B151FD7A8B8F539@BN3PR03MB2242.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7q4FD5IEck1pux6ItHIKwRPotbnEBdBkcK2cwWm45/HEW5Qnv/U6dKYG0bIzzc4lQQDfAF4rgylWLgsbpex3csBy2fEaNx0ThfGFBuSMm5DXEzlCOgKHUsgFoTWr3fcOf80gTi2pd2VdYKKaFBGn0EmCzJLxlrKNpNFcaIx+yqpo8uaQZcfSoVtncVZKvffeF+EnsQ4QzPnFS1Q+33+AXHFFO/VPFfyROoJZlYZ3ylpd+TMjxjb5RokmbmpNC0b+R9BHY/80s8J9YxhD86Vs3RMLuxSb7xl0czaXDKJiTwmOXNPNwQZEJMhX0m2EFFHUBPwEF67MO/g1NiWmp0ymjC9t4tdQjWeh+rly4bR5hC/5UhNpiK8D08p1x4fDDUWV+ZAo3IPjAmsKIXrFpK5JKFz85c3wCpws1F9KmWDtfbxPMm4xxomrldf9GwWjTkpa+MLXljKxIp2YJIJY0fVofOKweHKol5/E6S++gL76N0m5R7x48cK5U3DcMj69vVDzYFzwgmlffrMF2Wntw55ShgxvM20sJxJq2z1jl/3X2hAoOSh0RKjeOJV1MupqWu1GdcxUr7khaWSRVSPv9TfBPGzJTVIfR0KEDjDBe+6CJ58za6HoqkOE1l3Qh9jW59X7ACIxjhpOmv2hM9bh0IDB/TPGQrfMzBHfuvccEAxYfM8Dd+DOqq9RF2zwajKali3e0d4rN8yuTCrY+1IWIirnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6666004)(33716001)(6506007)(83380400001)(82960400001)(6512007)(9686003)(316002)(5660300002)(38100700002)(26005)(8936002)(66556008)(66946007)(8676002)(508600001)(2906002)(6916009)(6486002)(186003)(66476007)(85182001)(86362001)(4326008)(7416002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnlobTRwQlpraXk0NENBNkZ0MnpjaTM1Y1VXNEJkcS9aR1FQRDQyeTE1WkhJ?=
 =?utf-8?B?QnFYdFNzUlFSWjR0cHZpbEx0cVdld1NYZmdGZWRDa2RRK25jWUhIZVF6TVlI?=
 =?utf-8?B?TnBpbzZUWE0zUUQ5WXN1UkhtQlF4VW5VcitkQWpnaVRSNllMTHc2cEpIMUd2?=
 =?utf-8?B?T01XOUErWkhoeHBYRU03Z1VSdXlySERJVmYzNUI1aHNHL0NKSkd0S0RiOE1w?=
 =?utf-8?B?U2p3dEdHQUl3RDFoZHJvZjZrMS9tbm8yeTl5ZEdPOSt4TVVLeWJXbkcvcnA0?=
 =?utf-8?B?U2srRzRZOWYrcUFibXdrMXphT0lwcm9DMEYrZGg2SWRDdjNtZjU4MTZqck5v?=
 =?utf-8?B?RlZlNEVrd2J1T2pWUlNkWG8zUTBmNEZqT2FhZm83aXM0OFEwalFwaGU2Q01Q?=
 =?utf-8?B?WW5uUmhLbXI4WTA4TkFvY2dHWDBjR2tTUXJGUzVlT3UrRk9DZEh6S1UrNXNr?=
 =?utf-8?B?dW9ZQldPNlAzRHB3T3pVc3BoSW1QL1JTNEhUN3AyUS9wZ1RLdHdpYVNnVVZK?=
 =?utf-8?B?bjZQTmIxVi9qNnM4RXdod1pjZ0NoQjM3aHpUaXJQbmtFS3NyUHpMWGZzQnRB?=
 =?utf-8?B?d1FNS0hjOFN6aE5qbUJoMFZ5cDZVbm0rd2ZjQ2ttYTdJRGRVQlV5ZmlsQStV?=
 =?utf-8?B?ejR3S1JpY1U0VlVnVGpOTlZGeitxZVZmMUlTUTBQWnNTRGFkZjBOYnlKaE9y?=
 =?utf-8?B?UVdEU0s3cHVVOTlXd3JsMUllekN1L1B2VDBXOEpxa0ZMZEd2VlgrZkFiSWJT?=
 =?utf-8?B?U0s0eFpUUDRwejRmaTNZamJuTE5rbDZJL3FKVExkUEFnOGJLWk1NdzVkOXNr?=
 =?utf-8?B?eFQyeGN4NzFybmRsTmhtNmNWZWswSS9JSzlIbERQTkluSWRkRzJUK0hURFZi?=
 =?utf-8?B?bmQ5UGpraGdlOWR5M1ZJRSt3WTE1TE5tWkJPLzM0amowOTBiYlNVazhZWFBH?=
 =?utf-8?B?dVhpNlNGT2tGRmo1Y0ZaZUdiRW83K3BvMVlxbWMzM25nT1BySXVaWWJUcXZq?=
 =?utf-8?B?RHVDMUNBelhQbytSL1FPKzVYVDF1b1QxUm9wUnZ4cG9hbzhKNVhNVlk3UDU4?=
 =?utf-8?B?OFFsdjBaSWpSR05OblZ2ZU1ZMjNtc2dnMCsvdjhWZ2dXVnRzVDVMUTBoRWdT?=
 =?utf-8?B?bndhRmxmc2lOVTNyMDdqZU5DSG5IUm1zNDNEd01FYk5kazZDWUIrdm5iU21T?=
 =?utf-8?B?dVdMV1BPNjNyNmFBbGVaMmdjNnZYV2QzODhHWmRnU0sxMElUc2ZKMTFYdG9z?=
 =?utf-8?B?VTlrZ3JOR1BHTUU5ZkJCdUtwN0M5VHRFYXJiVzhqaTlPeS9xVHN6K1hySmF4?=
 =?utf-8?B?cE9XNlhtbVlzaXpyNmpWV1JDb2hKN1Q5UFpJRDZPd20vMzVYK0MrMjY2aTY2?=
 =?utf-8?B?NEVBZXdLdmIyYzZlbU1lamMvT1IwbVBtZW1IVnpzU0k0azVSZ29xb0dPM1c3?=
 =?utf-8?B?cFVxU3MySklWNU9kaTFkT21Oc2ZMUlc4elJnSEFBRmpldXZlc0NnV2JiL2Q1?=
 =?utf-8?B?cmsrUEp3UDhUM3NjaE1kQ2xWcEdzWDllQlZIeEJXWWNiOFYrTm1GNEh6RHRX?=
 =?utf-8?B?R3FZMzBQUUtPYUdNQWFRb1d5NXc4cW9kRkZncUg5L1hTb1N2VzBMZzNhMFdR?=
 =?utf-8?B?QW9nR2xLT3NwMW9xakV3eU1QakFzL0N0NGZGdE5ZMnhHSTc2cTFTcHdrQXl3?=
 =?utf-8?B?dW9PWTJBK0RpQVQvMlh4SXB2aVlNbDh4VDJ1S2JVRGkxTkhlOEN2bzBRTlFo?=
 =?utf-8?B?b1NCYkVyRFM5S2Qzd2pIMHVLTTJvMCt6RW8vaWM3dldxTmNRS0ZTeUJHcHR5?=
 =?utf-8?B?eHZrOWhNcUM2L2NWa1lxQzNaN202V1RvQXRtTDJWWmpRdjdEVTNoQkc4QlM2?=
 =?utf-8?B?TDJKT3ZIcU1NQ0IzUS9yQ2ZlNlBJUW9ERDlUcG9HWnRmZHVrbVZ1MDlFM1hL?=
 =?utf-8?B?bzA1Q2FVZkVDd1R0TzJEZmFwZ2Z0V1RyQ1Q5cndiYi9xZFluYW9pTi8zeWNs?=
 =?utf-8?B?YUppK2VrSlU1MmZCdWhCcFNXaHR1U2E0U0s4Y2dKeHJ5c3kzRTJ2WFpqdTZU?=
 =?utf-8?B?T2cvQU90QlJrMEY5eFdzR3FDSkExb1VkQXlBb0RCVDgzUzJESFJ5UDNWRUdm?=
 =?utf-8?B?cithNFBHd3o1dk9ZRWVRd25zZDdGTGFqVnNPdTM2aXU4eThUU2s5M2RjcUtO?=
 =?utf-8?Q?vMIaLaWparpj/SpdZ5BjvNs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b61ab24a-9c0c-43d2-c707-08d9d68ec68c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 12:18:15.6637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRnxvwGmQ1u/LLPLT6Sbl+9eA+KPbnIwEFskxCtmEkX0Rq1yXPyOObDS1dOVz4dhLH2eH2HhcuqlKHw+5b2CvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2242
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 01:02:49PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are three  originators for the PCI configuration space access:
> 1. The domain that owns physical host bridge: MMIO handlers are
> there so we can update vPCI register handlers with the values
> written by the hardware domain, e.g. physical view of the registers
> vs guest's view on the configuration space.
> 2. Guest access to the passed through PCI devices: we need to properly
> map virtual bus topology to the physical one, e.g. pass the configuration
> space access to the corresponding physical devices.
> 3. Emulated host PCI bridge access. It doesn't exist in the physical
> topology, e.g. it can't be mapped to some physical host bridge.
> So, all access to the host bridge itself needs to be trapped and
> emulated.

I'm kind of lost in this commit message. You are just adding a
translate function in order for domUs to translate from virtual SBDF
to the physical SBDF of the device. I realize you do that based on
whether 'bridge' is set or not, so I assume this is just a way to
signal whether the domain is a hardware domain or not. Ie:
!!bridge == is_hardware_domain(v->domain).

> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v4:
> - indentation fixes
> - constify struct domain
> - updated commit message
> - updates to the new locking scheme (pdev->vpci_lock)
> Since v3:
> - revisit locking
> - move code to vpci.c
> Since v2:
>  - pass struct domain instead of struct vcpu
>  - constify arguments where possible
>  - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
> New in v2
> ---
>  xen/arch/arm/vpci.c     | 18 ++++++++++++++++++
>  xen/drivers/vpci/vpci.c | 27 +++++++++++++++++++++++++++
>  xen/include/xen/vpci.h  |  1 +
>  3 files changed, 46 insertions(+)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 8e801f275879..3d134f42d07e 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -41,6 +41,15 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>      /* data is needed to prevent a pointer cast on 32bit */
>      unsigned long data;
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
> +        return 1;

I'm unsure what returning 1 implies for Arm here, but you likely need
to set '*r = ~0ul;'.

> +#endif
> +
>      if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>                          1U << info->dabt.size, &data) )
>      {
> @@ -59,6 +68,15 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
>      struct pci_host_bridge *bridge = p;
>      pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
> +        return 1;
> +#endif
> +
>      return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>                             1U << info->dabt.size, r);
>  }
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index c2fb4d4db233..bdc8c63f73fa 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -195,6 +195,33 @@ static void vpci_remove_virtual_device(struct domain *d,
>      pdev->vpci->guest_sbdf.sbdf = ~0;
>  }
>  
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf)
> +{
> +    struct pci_dev *pdev;
> +

I would add:

ASSERT(!is_hardware_domain(d));

To make sure this is not used for the hardware domain.

> +    for_each_pdev( d, pdev )
> +    {
> +        bool found;
> +
> +        spin_lock(&pdev->vpci_lock);
> +        found = pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf);
> +        spin_unlock(&pdev->vpci_lock);
> +
> +        if ( found )
> +        {
> +            /* Replace guest SBDF with the physical one. */
> +            *sbdf = pdev->sbdf;
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
>  /* Notify vPCI that device is assigned to guest. */
>  int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
>  {
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index e5258bd7ce90..21d76929391f 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -280,6 +280,7 @@ static inline void vpci_cancel_pending_locked(struct pci_dev *pdev)
>  /* Notify vPCI that device is assigned/de-assigned to/from guest. */
>  int vpci_assign_device(struct domain *d, struct pci_dev *pdev);
>  int vpci_deassign_device(struct domain *d, struct pci_dev *pdev);
> +bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf);
>  #else
>  static inline int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
>  {

If you add a dummy vpci_translate_virtual_device helper that returns
false unconditionally here you could drop the #ifdefs in arm/vpci.c
AFAICT.

Thanks, Roger.

