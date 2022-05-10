Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 433F152137A
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 13:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325484.548065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNt3-00069O-Nb; Tue, 10 May 2022 11:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325484.548065; Tue, 10 May 2022 11:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noNt3-00067O-KI; Tue, 10 May 2022 11:18:41 +0000
Received: by outflank-mailman (input) for mailman id 325484;
 Tue, 10 May 2022 11:18:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=To9D=VS=citrix.com=prvs=122921be6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1noNt2-00067I-I7
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 11:18:40 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea8de687-d052-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 13:18:38 +0200 (CEST)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2022 07:18:26 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN6PR03MB4287.namprd03.prod.outlook.com (2603:10b6:805:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 11:18:21 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 11:18:21 +0000
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
X-Inumbo-ID: ea8de687-d052-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652181518;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HyIgtJGvVS55IG8M/JKzgwUvD7lI6WTq7uyYO0vAdh0=;
  b=XADpH5786FC/iVObr5XmbFORAN+AwskrNZ0J0YhrQdoAcUhszaYvkCWo
   ACgDnv6X54zStxBhUypDmvAjUAsqg8U5jY9WpTBuWtfBanccqvHh082Ej
   jQ8B7pbV2lJ7dn83JwiB2Gi9H4CaFT9xhZlS5YR2XfAVpvJOapGI9fTYn
   o=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 70958111
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JbF6u6N6NUNRKLnvrR3clsFynXyQoLVcMsEvi/4bfWQNrUoj1D0Fx
 msZCzqDOvnYamTwf90ia9m19EkC78Tdzd9qGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk29Yw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 P5VhZv3aAYSIJLru786WhgbL3FkIvgTkFPHCSDXXc276WTjKiGp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7ENaaHPmiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33iiiI2QB8Tp5o4IawzLj3TVg34T9LeL4UPKLHtcEkUGx8
 zeuE2PRR0ty2Mak4TGC9m6rgKnVkC73VZg6G7ix9/osi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdx+3unmfpTYHRsFdVeY97WmwJrH85g+YAi0IS2BHYdl/7ssuH2V1i
 hmOgs/jAiFpvPuNU3WB+7yIrDS0fy8IMWsFYixCRgwAizX+nLwOYtv0Zo4LOMaIYhfdR1kcH
 xjiQPACuogu
IronPort-HdrOrdr: A9a23:ol86RaE6jWB1gmCnpLqFdJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHP9OkPAs1NKZMDUO11HJEGgP1/qA/9SkIVyEygc/79
 YdT0EdMqyWMbESt6+TjmiF+pQbsb+6GciT9JrjJhxWPGVXgs9bnmVE4lHxKDwNeOAKP+tOKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+zLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfgWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrjXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MG40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIZLH45JlO11GkbKp
 guMCmFj8wmMW9yLkqp9FWH+ebcEUjaRXy9Mws/Us/86UkloJk29Tpb+CUlpAZ/yHsMceg62w
 36CNUYqFhvdL5jUUsvPpZ3fSOIYla9MS7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="70958111"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRnZRAh8iQ2PYwO4yoekytOHiFZzpNYd/u9IeFsvxQvlGczvaCDlx54/CnLAdtfCvHy/c6Q88vRjJ+v2gN1BXDHbqYwAQN27TPUve84PbGnDOJJDxxtoMCyP9Zfl5km9PVcGf8Bx5gEDWpD8wMjXLM5I3i/A0YGMlXaVRQlNTND2O6L3SkZ2rrvoPGTt/l8c3cDgFV0T14h4Xj4Ach2e0T+i46JL+On3+F8bxqZzO/X/fzN6KLhLutGvM5afBKVHE4VYHVfBW3H+PsSY7Qhxk6yyTaHoZ210O1d6nox2KEFD8wixu+1BIUIcnbAbDoed1aF703Ol20kl27yaOzeCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cmeste97dBajqSDs43BpoyLnifzvAhV7iQP9o2WvMps=;
 b=KBdp8/0ZKgbiryxICHNCWlT5DSH3QcZOlaQdFlDEQbr2t9KX54Q1HxVtkh0LPQ7jTh+NgQPD/cKkhaPb/hwgNhWsOII2vKqlvWCUATxZXeYSSOIZ5+ng8bIDG4mjXNveCjnDLZuqm6PrOkul1f7O4+f7CMIVdzLIKIKgZxIxtg3Ou0Km1IKwajhfZQ7hDfL0a9gvW3yKmf4ZMz2sGuuwwPSO1EliR5Ce6Tkop2Rw2RDt9boagyiLrtPoVvv1PWERM2DdSpJrj9xODqF4Q/QQiwxidOl6dMYxcxzM42OeNLiypgYC+AGT3F4ChlcpV2fCnB1SboDwu1iYwRqm7Hx6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cmeste97dBajqSDs43BpoyLnifzvAhV7iQP9o2WvMps=;
 b=be/5Yz9tnBo9tlSgp+sc4plZdnS6FzEHDj9X405CCC3hplnLhYWaNlhK5s7Y2Z19M15g9LbZP0XV1KqF+yADGCn2Lm6YOQJZ20rnbbS2lToYzeYRdbyh7jvvaS21tDyCSAxy9jzI8dxpPj/TL3DnLo0fk3pLek7cTyuFK8W4R58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 May 2022 13:18:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Colton Reeder <colton.reeder@gmail.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: OPNSense running in domU has no network connectivity on 5.15.29+
Message-ID: <YnpJ+E6eGZeq0Jsp@Air-de-Roger>
References: <CAHq+1YiXwgOwPzUoRc37pA4t8Ef-AriROA1XYr2fpfMXOjdwhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHq+1YiXwgOwPzUoRc37pA4t8Ef-AriROA1XYr2fpfMXOjdwhQ@mail.gmail.com>
X-ClientProxiedBy: LNXP265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cac7ded-be9e-4fea-e3db-08da3276ca46
X-MS-TrafficTypeDiagnostic: SN6PR03MB4287:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR03MB4287830DB0EBD6116A7E7F758FC99@SN6PR03MB4287.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TI4PCRGrctwUf9qTh2GNYb+dNZ6sVOlhvgzJ01tZxlIjaQkpu1TMupZDhncjm51Xr1MTD3AhFnfS9h/tlgsvNxx5409d9OCmgYceZv1Y94uj31GyTPKN3QpJmQlgWTOs827Aw6d2fiI7u+CwitKnedGlIsxM91/Z0nfo2Rd/JYSXE1XccGKB7mJR+lG69owJShMGtePwQghWcGKRfVG1VVx5riszEOwzv6Wy7bwLkCAUz8Vl3BYBL4dG/wMMC8xiHgJBot5RP1Yhksizd4PCGbSO+7CERUFJfyYx8KEIMJ/i/aDXWVKKHVGA2ijwMEZ5c4lYi6lUHiZ5F9cDoYEXYqClst6Ib6seYnau39wGTfqbXz9MHFUT/SK/4zNz0PswrrthDB/XmSGZTSPEVYXaWdfIwi8BAwpwSt3BugNQOStmtWPSEZBwNlV1Nap3GA7yMYAvMAS/OLrzOAbCTnITSlifTHXCmBUuROGtsKbPcg1HlXS2OQxn27LcsV6MmTk6sr0iarmfKXclqu2f0NnsU/QzUd44yr/cBZMhlo/yMr2WO3zRQNb/hWZPYphR1GNq+8RTPcouxOpQlSOD7EzpaZWZ9A0YmpGDwnYdW1zrS6xDcVmXsOZhtsFyAtIXaq+C0AJLJnSHi6GQ/ePYFeiPRiPqJWx4ZGJYNLocE156b04KA/4BvjCssN1+L7ryQl7o9FueNA12oWEtHo9LdBWqf2hASqQgXmv8TPcVMYzF40wV9Lii6KuCo6KckSCL/SsnM0Und5qakPRkzfi6QliM9BuOWnDcTqWrg6OGQvzhafWH9aGo4XpFrgl6d+3xsQUC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(38100700002)(6486002)(107886003)(966005)(8936002)(6916009)(66574015)(83380400001)(85182001)(54906003)(316002)(82960400001)(186003)(8676002)(33716001)(9686003)(6666004)(6506007)(4326008)(6512007)(2906002)(26005)(66556008)(66476007)(66946007)(5660300002)(86362001)(10126625002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE03WTdZZm1wbTRFcVh5RkdHa2R5VFhyeE9VNjVGY1NWS1RFOXp1YXV5UE5x?=
 =?utf-8?B?ZzlUeU16WFdVUm4vNnVISFNubGgwTVZUSTllaFd6RmNheXJVZmh1QTFJblh5?=
 =?utf-8?B?OG1EVlVVQjJXZHZtU3hXN1NwcG42dW5idWJ2Mm1abTFhdFJvb05ibCtFaHV1?=
 =?utf-8?B?L2dWUDE0cVRzSEtKU29hQlBrSEV6VGduN3NXb01sK0FHWkJDUXh1dUs2MVVO?=
 =?utf-8?B?RE1FR2t5SG1mWmM0MWE3bU01WEVWQ2pxVVV0RkhyL2xuakxDd0N0U3JmVXZh?=
 =?utf-8?B?bmlPWkVQNmxqUEdtcTh1R2E1SEUwYVdzL3VwQ3hDSTNXQUduWnJReHozUVRu?=
 =?utf-8?B?WEd0UGkrTk9oQStETW5RazQxZ3k4YmlZZFNSR3dOQzZwOWFzVlZXYTZiUGdx?=
 =?utf-8?B?SThQZVJCeFdhR2VNc0I5WkV3bnNURVFPa0M2aWZUUE50cEpkV1ZzUks4RlE1?=
 =?utf-8?B?a1g1ck9JWlZhMlhXTUFsYW5abHFrbC9BY0c2SktWYnRZVmhNcmhXZW84LzNs?=
 =?utf-8?B?TFNSU2lnT1dkUHBwdnB6L2tDaUVBWDBVMlhvazcwVkRNeXVNWWZnMldYcXJl?=
 =?utf-8?B?Um5QUE43T1ZCVHZKaGhweFRxREt6MmRRQXZLWHo2bnVaMk5TZGZrV1h1bGZM?=
 =?utf-8?B?K0NHY1BYaU1nbU1IeFJML2V2VjRmd201R1Yrc004V1EwWEQ0V21HMXMrMjZI?=
 =?utf-8?B?a2VPVGVQL0RoOEMwRGJzaUV5WXYvZWFZZEJnYVVSeERnSXU4LzhDWUtYUmsv?=
 =?utf-8?B?YXlMTkF3YXFkVExjeENTTVZmNitkVmIyOU92b3NWL0hkMEhyajFTQ28wQ1B1?=
 =?utf-8?B?MzYyZzlOMG5OMEZYbm1yN3d4aEJXVTVOZjJ5R1RVNDY0VmRVUTlxaGJmVUJU?=
 =?utf-8?B?ZWJmWE14Uk5TUnBoK0F5YUhzc0tNN1luOXgrQzV1VVhub2lhNGhTWENLL2Vm?=
 =?utf-8?B?SFhRa0pHdVE0MzAza3RiWS8xYnZGVG0wcEZRSk8vbWQrclJjWTBKYjd1NHpH?=
 =?utf-8?B?bmdXamIwVGxXUkRRMlZiTXkzT05pTmtud2kwM2t5RnljV3ZVN2xpWHljUzY4?=
 =?utf-8?B?dldEU05ISGdNY2ttd2tXWHlwZGJZU0VSazZ4M3Bud1hldTFjVDdLSEdTVE9H?=
 =?utf-8?B?dmFTZ1lLWVl1MEVrZVJITFRVZnFlcG5kckFuZDVTTHplR1hDTjVidFUrVW9a?=
 =?utf-8?B?MWh1TzFKc2s5RWxSNkc5M2JydE84OXVKMTZCdDEyZlB6ZktvYUFvTmhpU0dX?=
 =?utf-8?B?eDJXUkdWOHRldGJta1FNdTlwKzVMd0Z0ZiszM0owZzRvSU9CWXpoL3pVbk1V?=
 =?utf-8?B?a1BNQVFYMEVvKzF2M1pGeVY5SUhTQ1pqbU83NmxrYjJxdHJENVhlUVZvaFdn?=
 =?utf-8?B?ZyswakE5VDlwcjBtdHZyZFhMWDBCbnhCTGlqVVdlMGhaZjJwNGN4TG1nVmFm?=
 =?utf-8?B?Uzh2TlV6Y3hwZmZ2N3NNSU5McVg4ZGgvOUJqU2JraTllNUl4bkIvYWRQNnpX?=
 =?utf-8?B?MDFTVFRHajFxWm14QlB2NGloV3QzN2YrZXl5RnpPdVV0Ni9xQ0xGbUdqVktq?=
 =?utf-8?B?anRBVGhvUTlMZk5CSzZpK0ZSQ29VK3RvNXNLMmE0Z0RjZkVvVFFZa0ZWM2s2?=
 =?utf-8?B?cU1MM3d3V21pakpHU1o5bTl6bmU5OElKQnh6T0VHUm5WcldyWjg1d3Vvdjl4?=
 =?utf-8?B?TDBSU0lxQnFRYVZoSzY3WU9KNFF2cnJDV2x1WlZjaG5UVjNxTmx1Q2hDaEdP?=
 =?utf-8?B?VVo1Vyt0Rk9MVEI4UkZzNVY4R2pOUjY1bmlmaHlwSFpGd2g0QXc5WHNwMXkz?=
 =?utf-8?B?Wm9XbGN6OWpJV3p4Q3dvbGdIRUJOUjM1TWtLSTh2RURJSUV6L0h5NmcwRjJO?=
 =?utf-8?B?WUNrWE55NC85b3pDUURFSmVEM0U3azlzS0JnWmxHRy9ZRkFOZVZnUzVZM1VV?=
 =?utf-8?B?SVVqZDB0NXRubnROQ2h4MHNqT1E5dG1kYVV1SXNuZ3Q0YnN5b3BuVFBFeFZs?=
 =?utf-8?B?V0hLSDBOakF3akw1ckhrL0N2YUlNNTNxWnp5ZzNMZWtqOUZoOUdES2k5bWpr?=
 =?utf-8?B?WWxWd0M1YjF3aUhqY0VzSUpLdVRCZnYxWThUYUplb1V4RDJkbFp3K2Q2ZWdX?=
 =?utf-8?B?b2JrWUZXREJpdk0xR29leGxXb0dCZWJGK1RmeFJORW1YWWZSYVNrMjhQcCtp?=
 =?utf-8?B?VURpQUdVUk5BQ2FGT1JwRDBhRytWakRXYlZPN2VVT1VCWmkvUTJwTHdXb2lT?=
 =?utf-8?B?N0xHaXdhY2ZLc3prSU1DKzZvb3FPcmIweGJiTVJLc0RYekQ5WWFXVzhrSitt?=
 =?utf-8?B?ZENaSW1KdWFjV1p2SERkVytYYTJGWDhPRW51REVWNXJUN1M1S2lNVzFvMity?=
 =?utf-8?Q?xYIuzKCn6DOozFS0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cac7ded-be9e-4fea-e3db-08da3276ca46
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 11:18:20.9550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1LDQvEpA4NBEuEdFrg9YN9/qVVtREJnDHi849dfovj9odZEWX4oM7fEkZKcsdJjiUUG68WspSbqk7fO5X+Nww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4287

On Tue, May 03, 2022 at 12:36:43PM -0700, Colton Reeder wrote:
> Hello,
> 
> I am running the FreeBSD-based router OS OPNSense in a domU. I
> recently upgraded my dom0 kernel from 5.15.26 to 5.15.32 and with the
> new kernel, OPNSense had no connectivity. I downloaded from kernel.org
> 5.15.26-32, built and installed each version and booted them
> consecutively until I found the version that no longer worked. It
> turned out to be 5.15.29.
> 
> I looked through the change log of 5.15.29 and found two commits for xen-netback
> 
> commit 2708ceb4e5cc84ef179bad25a2d7890573ef78be commit
> fe39ab30dcc204e321c2670cc1cf55904af35d01
> 
> I reverted these changes (a revert of a revert, yes)  in 5.15.32,
> built and installed. Now the network works. Now I dont know enough to
> know thats for sure the right fix.

Could you try if reverting only one of those fixes your issue?

> Maybe I have a config issue, I dont
> know, but reverting that change fixes the problem. What should I do?
> I was asked to provide xenstore -ls https://pastebin.com/hHPWgrEy

It's better to post the output of `xenstore-ls -fp`, as that's way
easier to read.

So it's only OPNSense that's affected, other VMs run fine?

Do you get any output from Linux dmesg?

From the output of xenstore that you pasted, you do have another
guests that seems to be running fine regarding network, are there any
differences in the configuration file?

FWIW, it seems like the netback instances are stuck in state 2.

I think we need the guest config file, plus the output from `xl
-vvv create config_file.cfg`

Thanks, Roger.

