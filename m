Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 585654D34D3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 17:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287990.488366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRzDo-0002XR-SD; Wed, 09 Mar 2022 16:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287990.488366; Wed, 09 Mar 2022 16:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRzDo-0002Up-P2; Wed, 09 Mar 2022 16:31:32 +0000
Received: by outflank-mailman (input) for mailman id 287990;
 Wed, 09 Mar 2022 16:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRzDn-0002Uj-HF
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 16:31:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e12fdab-9fc6-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 17:31:29 +0100 (CET)
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
X-Inumbo-ID: 5e12fdab-9fc6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646843489;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Dm7/6LoRjHlZdzdMjGL+Nj0JzwiBDA4t1ql643AT0xQ=;
  b=PZjVaicbLQ0PgQbJEThnojWH/kbyX9LC0DlkZQND9ue/s2+Yh3Jkf7EH
   261lA83Zd/sP8u78H+4yDzr7KrTMl1CR+DZ+BFYu3XZR1rudANf2MP0EC
   kS59gvMPpBS9TAE6gbGErToo2lVOsc6fKhEh6FXsapdzzBXcy+xrI5XPL
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65310681
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sUkcda25UPiotI40/vbD5e1xkn2cJEfYwER7XKvMYLTBsI5bp2QCm
 GsWCG6AMqvfZzDwLY1xO4qwo0sH7JeHnNBnQARqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw0IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1M6L+sdTspY5Tjt7sUFEMCAh98IfRJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u25sXRaiOP
 qL1bxI2YhfbRyZXHG5OM7IUrtv2pmPccCRh/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZCm0aPz2YeDBkXU1qTovSjjEO6HdVFJ
 CQ8+CAjsKwz/0yDVcTmUluzp3vslhwBX9tdFcUq5QfLzbDbizt1HUBdEGQHMoZ/8pZrG3p6j
 Tdlgu8FGxRu7Z6JdU6dq467gmy7fnJPPFEAeXYLGF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 w1mvBTSlJ1I05dVivzTEUTvxmv1+8OXFlJdChD/Azr9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6vdWNE/qQQ2d3XEy9hL0yT9FWy3yGsiTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27Cq6LMIYUMsQtKFHvEMRSiai4hTCFfK8Ey/1XB
 HtmWZz0USZy5VpPl1JauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYextDbd6VchgtPnsiFyMq
 753bpLWoz0CALyWSnSGquY7cAFVRUXX8Lir8qS7gMbYeVE4cIzgYteMqY4cl3tNxP0EyL2Xo
 injBie1CjPX3BX6FOlDUVg6AJvHVpdjt3MreysqOFejwX84ZoizqqwYcvMKkXMPr4SPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:vwZtgKysAk+fSI+x+pLpKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65310681"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhE9x0hKYMSEdivoO9uxyBZMSy1wV8xNXzezKWw+gwmV+v/FtKmZt7U6dMSFllZOasfoPZeXCoubbm78eGxmGj6jFt/GarIv3W6npuaKQ4hFyNhpRgMmuTfuXKmM6wNiNsrh7df6DnwgWKN1TZZEdYZFY07fdKj3mnezktBui7MaKHxETeNqIuy8SZmBZpPEXrs8gvSVekn7rnsEK0+hC3Tu1mZFg/6NAZ/mOWCgRf/42JRsevmRQI1uindClsUd/vzf6gIvutPjQO3gpcwb0L58kWyUzYfwbvBKMecTYzcizR6A762AoYVSoWaebwmo/EaN9z3hsCMOSwVEUyMHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EM8Op1k6uEX0qDaiVSGaBuog1RPDRS9QMH5g5+r4jgk=;
 b=J/4t+LNAAX9eFVylJxTr3fUGmpWBqYC9EcnRVfirNgKA9Bw9Nsv0gqWn0bFqInccefYhoUxcHEluUnryKZnxIcBN02sZEa0lX7KbXKuGF7Tzpy1wOBsGmGxr5AXau1L/7lr4sB+WHPwnQHvBRCuKgkKiOwRBV9eKSnibFNBSjP4scxtyzsDtuZ/LomISrVEHXnDv1c7cw7NIIQ0U22oss9EwfAXrxhJgsCc/3iE5a7Av4AM1cOXXw4YnylqFI5XVs0wughrkofAAsj0gcw4fIgCn4fPjIwZ/1vf2JUyrjVE0WrhoZUWPS80G3rhfZUD/Q6xttnltM5bOmQTNSUkPzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM8Op1k6uEX0qDaiVSGaBuog1RPDRS9QMH5g5+r4jgk=;
 b=BsC5xU7256X8fj/qO/MFKwoHxh2ox0HUlf2NBUx6z2CxSR7KS+Md70rXm/frQv/RirAK8ugE35xOWoz3IhiDN1yzBJDd9Nwau5FoWvniAg4ktWbpmiUL3Uqg2D9ReFHXvq4g1F2SwDnf/tTMztXeiw6Tcb/nFDCMWrhh9hcjtKw=
Date: Wed, 9 Mar 2022 17:31:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests on
 top of SPEC_CTRL
Message-ID: <YijWUj3H+8UHEikf@Air-de-Roger>
References: <20220201164651.6369-1-roger.pau@citrix.com>
 <20220201164651.6369-2-roger.pau@citrix.com>
 <8e7f3193-dee6-1ff4-0c68-081032e240d2@suse.com>
 <YijBpyOlmTA7tIUl@Air-de-Roger>
 <6d0d901c-fc7c-2655-6285-df07101b852d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d0d901c-fc7c-2655-6285-df07101b852d@suse.com>
X-ClientProxiedBy: LO4P123CA0401.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a1585b5-dbdf-4163-3aa4-08da01ea3d3d
X-MS-TrafficTypeDiagnostic: PH0PR03MB6496:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB6496A994C7C71EDDD51DB5478F0A9@PH0PR03MB6496.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wx7Y5UHp7gyTGPdc2hX2AalrGLNkkiZFsGiCQeEbMoAibhZNS0ZMijqJdqFW9LCz534DCJi5ZLhKYTwF00Hs7e9csV5yswUCVPN622mywfqnFuBSGhDWD4+Am5cg2oJJmqAfssO1Y0QmaTLoYyltbxEk1hRvjShCA/jzhYfs6KtZkH5BcJYGGR9Qbk/IvYZ7GuhW5xt8P8j1LnbaBO4qzkfnOwgEo63mblCTJs+uv6soAJ/SPUGB1iHtrVINPSgwM9SdPYNSFo7yDOGpyjnOM1SVe1tUget7gcu85ewOCIjKxZVjJTU+lDapnIyZiaFT+C3CTGPR96Dkagd0lWlLizeue7w5xVsuw70UuGwi/Z3gxPUWXDpOYLkDUYNF4X0lMHoSlMSAnl+YP97lRNi1k4s78nXmtbJF9bgjDyvwesDr4/EE7LldNYuDlqTFlRIYzWgfCmYxvY9lpmW9hitmospepG7T9f9ix/gwxQ8x3fwBB3TqMC+R1rGLmXxr852Y0EM3N4BmqMiMOu6AgkdY/dG/8+RYh7kFNlfgGJECfLPi4C19+O09XuxbRPWaeapExDWaeTt6v2RlEI2403NcJBdVElWSHl5yCZTh46PX20eHu6++1jKEZQcpZ/XaUGVSaGFNAj4Y3SCWo4fM5lrR8lbjEl0+uOHARy8IkAbt97kb4J6W07xUvFLwzN44luqAjOFUij1Z2HjWrLqsgGLTiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(85182001)(82960400001)(38100700002)(6486002)(54906003)(5660300002)(86362001)(8936002)(66476007)(8676002)(83380400001)(4326008)(2906002)(6916009)(66946007)(66556008)(33716001)(6506007)(9686003)(508600001)(6666004)(6512007)(186003)(26005)(316002)(53546011)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGdtY1ZrQ0NiQWRydlhHSW9ncERxck9RajlNL3M2V2NvZTVlenZIMmtYMmth?=
 =?utf-8?B?aWNMbkJhcGZiVFdiak1SbjJrU2J3bUFvSHRlQ3M5RHFmbTlaY3dVS2JlTTl4?=
 =?utf-8?B?TmZTUm1HcHBqT25DdEE4MnBZa2IyZGdWK1RXUFRIWFQ4ZFNvaVJydzBMdG9D?=
 =?utf-8?B?M0pJbGQ5bFEvUWYrQzZZMGlQMTBiZFhuNklRQURMdDVJMERaQnpKSXFRbldC?=
 =?utf-8?B?UzJxYUZkdHpqQU5CbkpYbEN2MHZLdkwyWTZPMHlaaEhlb0Zlbk93M0ZSQ2VG?=
 =?utf-8?B?VkZlSDRRbW5Vejh4NFVyWkpDRm9sU2t3TTI3ODRLUDYwREVSaU5Obm9iWHRE?=
 =?utf-8?B?NlcvUEVHN1NCZ2JjZnlmeit2OVFiMzI3SkN4L1Q2bjFWM0c2SWxGUjhwUnNK?=
 =?utf-8?B?Y0JCWUJ1L2FVSGhDaUVtT3hPYmJ0QnBtS1RNODNDT21VcGNTSG5KY0RIOXVV?=
 =?utf-8?B?aUUyY2pkZGVkZkx5L2tNNlhQUmdyMnhLQVRscXFQdXovR1dxL0FwajIrWjVy?=
 =?utf-8?B?OFZ2YzZuSWpZK2NiUEV0T0VHMGp6QVFTcmM0NXIrS2F6YjFFeVVHQlM2d05L?=
 =?utf-8?B?YysyczN2bzVHM3pRdmRESnRCRittOUwrQ3lUODBVRVk0RFhaREl0M3VpNENQ?=
 =?utf-8?B?amsyNVZsOHJGSk9zUi9pcmNJZU8yMWtWK1NHanNZR2h6b1JnVHlXdmI3c3BM?=
 =?utf-8?B?NWo3eHNNZGh6RUROaGV6TDN6UHJIWEpZR081NHViSGpkMVIyV3loSXQxMTJY?=
 =?utf-8?B?QTVyd1B2WUtJUGdpTDRmbU1rNEtUcWViUDBzS1BpZzdNRlhPVWp1TmhxakNT?=
 =?utf-8?B?c2RHandzbjdLVEN0T0dyT0lxeWFSMTEvajY1bVZDOFRlSkFOVGcrRG9RMVlD?=
 =?utf-8?B?N3BHMTRMU0hzNndXZk05ZUd0MWlMY2Zja3BGejRQNi96MzBrYlBkRUJiRllq?=
 =?utf-8?B?dkVTSC9GbmFrNXV0RUtIS1JObmhnckNwcmxPMVBiQTBIQktYTjRnYlBHb0Jw?=
 =?utf-8?B?cFpXcFkzTTRRWjZBdGhLdGRhVmZSR2ljK1FTTnlNenVVbmEyMGFnYXpEN2ZG?=
 =?utf-8?B?ciszaU9UZ2JXOVRRRktnYUJ2VEZ4dUQ5UlErSGE0SjRwdVRlZW5hVklUQmYy?=
 =?utf-8?B?OHNrVEtELzV0cWNCWUJGdjBMNUlKZ3JrSklMdVJUZXV6NUIvUDc2b2hCMVRO?=
 =?utf-8?B?bFJIV282d3pGcittL0dJL2JRMWJkSUJqd2hZQnlSTVdnOU9hSWdhdVdUa21q?=
 =?utf-8?B?c3M2RlIwVGFTWHduVWQ5Zkh1RkdqNzM5dmsyZGZldUhQS3pZVUJ1c1FiMEVE?=
 =?utf-8?B?dEUzb3lMam1Vc3h6N0NtMG9qRFNnL2YxUUd6eExRRFFoSW00aTd3bWVCZjhl?=
 =?utf-8?B?c1BWVEtwRWo5Z1ZuOFpOeEk1QUk0VCtyZEVWMkM1cmw3UXdQTVpZMzdyZUZj?=
 =?utf-8?B?dmREcXdyRlkxM2FrNDlvSTBLRTZDMUtHOGRjQmlvSXBDSXQvaXp6akRWdFhO?=
 =?utf-8?B?MVNLUVVnY3RMS1BCQVhDVTlubW9oMVcxMTB6cGR6dXlmQjVjSHdpZzhkMFVi?=
 =?utf-8?B?Z2RvQUxndE1BcFdSK1JiK2NyTHVYYWs5bzc0UEhnSXFad1UyUnNsOUU4V0l0?=
 =?utf-8?B?dTRCVzZIeFZuSWtWQ05DOHRxTGpCb0dkTFhTYTA5WlZBcWorL1M4c2U4blZP?=
 =?utf-8?B?UVRFT0NkYnNYeWQ1Wmt4aVYwU0VOUnNpV0ZVcnprSFhSckdUL09KUmpNcmFE?=
 =?utf-8?B?bkVkTDRqVDBKT0NvaWVPalE1a2Y1Y3doU2hqM2VlZnNnYzJzdjFsa3d0T1hQ?=
 =?utf-8?B?NDlkc011cDFyK0hxTmhKRGZ0UVEzQlVCcTJuMGh4bzNWYncvV0tJdnpIZXND?=
 =?utf-8?B?bmUxczduMWllTWU4NFBsenJzTW16Y2hBdlJtN2pqT0tReGZnNm5sWHVBZ1NI?=
 =?utf-8?B?M0d5NW55TWZnVlZUSFNFaW44ZzZraW9DUUtRUlQ0Y0ZINFFGU0Vuclp0b2kr?=
 =?utf-8?B?T3pJdlMwQ3lsNzVhUWxNUmFCblVnNDJROGVpUTg2dWV3QXJqMlZxbHdtVFBw?=
 =?utf-8?B?N1BQeVc2TDQ4R2lpMDVyY3NZSDFEeXN1Q0pqZEwzRWV2UzRpSFhGR0s1a2p4?=
 =?utf-8?B?dS91ODVBNDFCZGlZRytIcUt4TzBIN2lTeGlqVythVGpiZzVjWEVQVkZTL1VY?=
 =?utf-8?Q?LGwAhN3dtXT4yEf3TK2+j94=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1585b5-dbdf-4163-3aa4-08da01ea3d3d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 16:31:18.9775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NL8A2c7galHjn7yUsHzUbfFULBM+on3MLeQ1K4dOiW/XbS79EcDUaZHR83NGtj1+AXkSXXv1bzqSD5cbHQePxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6496
X-OriginatorOrg: citrix.com

On Wed, Mar 09, 2022 at 04:40:24PM +0100, Jan Beulich wrote:
> On 09.03.2022 16:03, Roger Pau Monné wrote:
> > On Mon, Feb 14, 2022 at 04:07:09PM +0100, Jan Beulich wrote:
> >> On 01.02.2022 17:46, Roger Pau Monne wrote:
> >>> Use the logic to set shadow SPEC_CTRL values in order to implement
> >>> support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
> >>> guests. This includes using the spec_ctrl vCPU MSR variable to store
> >>> the guest set value of VIRT_SPEC_CTRL.SSBD.
> >>
> >> This leverages the guest running on the OR of host and guest values,
> >> aiui. If so, this could do with spelling out.
> >>
> >>> Note that VIRT_SSBD is only set in the HVM max CPUID policy, as the
> >>> default should be to expose SPEC_CTRL only and support VIRT_SPEC_CTRL
> >>> for migration compatibility.
> >>
> >> I'm afraid I don't understand this last statement: How would this be
> >> about migration compatibility? No guest so far can use VIRT_SPEC_CTRL,
> >> and a future guest using it is unlikely to be able to cope with the
> >> MSR "disappearing" during migration.
> > 
> > Maybe I didn't express this correctly. What I meant to explain is that
> > on hardware having SPEC_CTRL VIRT_SPEC_CTRL will not be offered by
> > default to guests. VIRT_SPEC_CTRL will only be part of the max CPUID
> > policy so it can be enabled for compatibility purposes. Does this make
> > sense?
> 
> Yes. Can you re-word along these lines?

Sure.

> >>> --- a/docs/misc/xen-command-line.pandoc
> >>> +++ b/docs/misc/xen-command-line.pandoc
> >>> @@ -2273,8 +2273,9 @@ to use.
> >>>  * `pv=` and `hvm=` offer control over all suboptions for PV and HVM guests
> >>>    respectively.
> >>>  * `msr-sc=` offers control over Xen's support for manipulating `MSR_SPEC_CTRL`
> >>> -  on entry and exit.  These blocks are necessary to virtualise support for
> >>> -  guests and if disabled, guests will be unable to use IBRS/STIBP/SSBD/etc.
> >>> +  and/or `MSR_VIRT_SPEC_CTRL` on entry and exit.  These blocks are necessary to
> >>
> >> Why would Xen be manipulating an MSR it only brings into existence for its
> >> guests?
> > 
> > Well, that's not exactly true. Xen does use VIRT_SPEC_CTRL (see
> > amd_init_ssbd).
> > 
> > I'm unsure how to express support for VIRT_SPEC_CTRL, as it does rely
> > on SPEC_CTRL when available.
> 
> I wonder whether the command line doc needs to go into this level of
> detail.

Right, so you would be fine with leaving the command line option
description alone.

> >>> --- a/xen/arch/x86/cpuid.c
> >>> +++ b/xen/arch/x86/cpuid.c
> >>> @@ -543,6 +543,13 @@ static void __init calculate_hvm_max_policy(void)
> >>>          __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
> >>>          __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
> >>>      }
> >>> +    else
> >>> +        /*
> >>> +         * If SPEC_CTRL is available VIRT_SPEC_CTRL can also be implemented as
> >>> +         * it's a subset of the controls exposed in SPEC_CTRL (SSBD only).
> >>> +         * Expose in the max policy for compatibility migration.
> >>> +         */
> >>> +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> >>
> >> This means even Intel guests can use the feature then? I thought it was
> >> meanwhile deemed bad to offer such cross-vendor features?
> > 
> > No, we shouldn't expose to Intel.
> > 
> >> Additionally, is SPEC_CTRL (i.e. IBRS) availability enough? Don't you
> >> need AMD_SSBD as a prereq (which may want expressing in gen-cpuid.py)?
> > 
> > We need AMD_SSBD if we implement VIRT_SPEC_CTRL on top of SPEC_CTRL,
> > but we could also implement it on top of VIRT_SPEC_CTRL (if Xen runs
> > virtualized) or even using the legacy SSBD setting mechanisms found in
> > amd_init_ssbd, so I don't think VIRT_SSBD should explicitly depend on
> > AMD_SSBD in gen-cpuid.py.
> 
> Hmm, yes, good point. But when the prereqs cannot be expressed in
> gen-cpuid.py, I guess they need to be encoded here.

Yes, I've added a dependency on AMD_SSBD here, which was missing.

> >>> --- a/xen/arch/x86/include/asm/msr.h
> >>> +++ b/xen/arch/x86/include/asm/msr.h
> >>> @@ -291,6 +291,7 @@ struct vcpu_msrs
> >>>  {
> >>>      /*
> >>>       * 0x00000048 - MSR_SPEC_CTRL
> >>> +     * 0xc001011f - MSR_VIRT_SPEC_CTRL
> >>>       *
> >>>       * For PV guests, this holds the guest kernel value.  It is accessed on
> >>>       * every entry/exit path.
> >>> @@ -301,7 +302,10 @@ struct vcpu_msrs
> >>>       * For SVM, the guest value lives in the VMCB, and hardware saves/restores
> >>>       * the host value automatically.  However, guests run with the OR of the
> >>>       * host and guest value, which allows Xen to set protections behind the
> >>> -     * guest's back.
> >>> +     * guest's back.  Use such functionality in order to implement support for
> >>> +     * VIRT_SPEC_CTRL as a shadow value of SPEC_CTRL and thus store the value
> >>> +     * of VIRT_SPEC_CTRL in this field, taking advantage of both MSRs having
> >>> +     * compatible layouts.
> >>
> >> I guess "shadow value" means more like an alternative value, but
> >> (see above) this is about setting for now just one bit behind the
> >> guest's back.
> > 
> > Well, the guest sets the bit in VIRT_SPEC_CTRL and Xen sets it on
> > SPEC_CTRL in order for it to have effect. I can use 'alternative
> > value' if that's clearer.
> 
> Well, as I tried to express in my earlier reply, I view "shadow value"
> to mean "alternative value", so replacing wouldn't help. The question
> whether it acts like the shadow values we know elsewhere (VMX'es CR0
> and CR4, for example). If it does, using the same term is of course
> fine. But it didn't look to me as if it would, hence I'd prefer to
> avoid ambiguity. But please realize that I may have misunderstood
> things ...

No, you are OK to ask. When developing the series I went back and
forth myself deciding whether 'hijacking' the spec_ctrl field to
implement VIRT_SPEC_CTRL was OK.

If host has AMD_SSBD: VIRT_SPEC_CTRL.SSBD will use the SPEC_CTRL.SSBD
bit in the spec_ctrl field, but it will be set behind the guests back.
If guests sets VIRT_SPEC_CTRL.SSBD but not SPEC_CTRL.SSBD, reads of
SPEC_CTRL.SSBD from guest context will return 0, but the bit will be
set.

I called it 'shadow' because the underlying SPEC_CTRL.SSBD bit will
get set, but reading SPEC_CTRL.SSBD could return 0 if the bit has been
set from VIRT_SPEC_CTRL.

Do you think that's a suitable use of 'shadow'?

> >>> --- a/xen/include/public/arch-x86/cpufeatureset.h
> >>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> >>> @@ -265,7 +265,7 @@ XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection
> >>>  XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
> >>>  XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
> >>>  XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
> >>> -XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
> >>> +XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!s MSR_VIRT_SPEC_CTRL.SSBD */
> >>
> >> What is the ! intended to cover here? From guest perspective the
> >> MSR acts entirely normally afaict.
> > 
> > I've used the ! to note that VIRT_SSBD might be exposed on hardware
> > whether it's not available as part of the host featureset. It did seem
> > to me that using just 's' didn't reflect this properly.
> 
> I wouldn't have assigned such meaning to !. In fact if we emulated
> a feature completely, I think it could legitimately show up here
> without !. But then again I may also not fully be aware of all of
> Andrew's intentions ...

Not sure either. I've assumed '!' to mean that such feature could
appear on guest policies even when not present on the host one, but I
might be wrong. I'm happy to use a different annotation here.

Thanks, Roger.

