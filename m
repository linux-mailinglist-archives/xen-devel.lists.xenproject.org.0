Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43AA6BCA97
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 10:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510420.788058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjkn-0000xI-6m; Thu, 16 Mar 2023 09:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510420.788058; Thu, 16 Mar 2023 09:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjkn-0000uV-2y; Thu, 16 Mar 2023 09:18:33 +0000
Received: by outflank-mailman (input) for mailman id 510420;
 Thu, 16 Mar 2023 09:18:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcjkm-0000uP-9B
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 09:18:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 828657cd-c3db-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 10:18:29 +0100 (CET)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 05:18:25 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SN4PR03MB6781.namprd03.prod.outlook.com (2603:10b6:806:214::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 09:18:23 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 09:18:22 +0000
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
X-Inumbo-ID: 828657cd-c3db-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678958309;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nKIXbBUt4e9VIwlU/1SUWh6UYbqlYB6xHHMNS57hF4w=;
  b=M9UWD5btHf4KNRl1d7u+6D3BouljLDlenRj7/UtsDqJgpb8Hou7XSyGy
   ZyZ+mwBn0NMleBkj7iINMAWZsmit1q9+3o11FnPGdVnd0s61F/8VO19by
   /9iVadzcS7FXuyFcnfmaqJxmmHHvOjfqb1xg3l9eMCM5Yp/zFWHP9LD43
   g=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 101085780
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wRvghqiNn2K7MpW3xRKkyk61X161CRAKZh0ujC45NGQN5FlHY01je
 htvD2iFP//YYzOmfd9+YYmyo0gPsZDWmNU2HVA9qytkHiIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5waAzyd94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRHLW4hMwqZn9ufzbGQZsYyj9hkBezSadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGyb7I5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjAdpCSeLorpaGhnWUhXUuKj0nZWKCvNSD10SHfuNfD
 FELr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLP+BqQDGUASj9HafQludUwSDhs0
 UWG9/vzDC0psKCcT321/7KY6zi1PEA9JGsPdSYCQQYfpdXuvYozgwjnR9NvVqWyi7XdEjHqw
 iuWrSE4wbYUgMgK2I2y+FyBiDWpzrDyUgMq7x/LGEKk6g90bpSsYYCA4F3Xq/1HKe6xRESbr
 nEAnMSZ8+kmApSElSjLS+IIdJmp4PCKNDDd2BhvApAn+Byk/nLldodViBl8OUNoO4AWeTbvb
 2favA8X75hWVFOIbLZ2aoT3IMQny4DpENijXffRBvJeb540eAKZ8SVGYU+Lw3urgEUqibs4O
 5qQbYCrF3lyNEh85D+/RuNY27l7wCk7nDnXXcqikEvh1qeCbnmIT7tDKEGJcu0y8KKDpkPS7
 spbMMyJjR5YVYUSfxXqzGLaFnhSRVBTOHw8g5U/mjKrSua+JFwcNg==
IronPort-HdrOrdr: A9a23:FxZnCaqGZ8FpiYZAAKzA8TMaV5oWeYIsimQD101hICG9E/bo9P
 xG+c5x6faaslcssR0b9+xoW5PufZq/z+8R3WB5B97LNmSLhILBFvAB0WKI+V3d8kPFh4hg/J
 YlX69iCMDhSXhW5PyKmTVRWL4bsb26GXmT9IDj80s=
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101085780"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpy0zRWij0lZIS1RRRTFUuA1C28WuhPxTqXYotGnN4v4rlBs82FjuK4rl4orcAqAKfDBLooZ4ef13t1vJJtWcUD7oMp9mWZceleSYbYZduUsJR3qSvhv/8dv4b8Ni1qQX6GRA4EKvZBsm6WCLvtYyj6/G0M5lTNt1rBJzJtlicSk3kJO7H6K3dKfUP7cxD7DNa2g0DufezPL681+4LhpNKuYM8o7LepHQsPN/by8pEQqKBUy3yxgzASqe/7YEo7fHK4Le4Ire7frGBYAAt3tuU4C/L4+pXRiGLyK7s6Sa3FYQLyHZ9Z8/QQ5Hlx/zi33hOE+ecNbN3rvzSXrrMbx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeDgwPxXeVZs1PypmdYNODInBTn84U3CB2OPdRnREVM=;
 b=ZiUnkVFLAKSWR+Bl7cLfW24+IEtJvQ498xMtMtW2D65/VN4aoijt5hXpSukaM7PKK2MNURLYkv885HV7b5mXgAA+UDpIdy4WqjC4Y3d8g8EuxH8tDWZlxxZLZcpQJXGw3lEFGYYJe5E4VM7s9oq9IOUHyUVPZ5BTBm+2nz1dFwdIBJovNiGpSANxqvjRVjUzvGTLlP7re/3vpmAXHvls3QWhhli0u1ErLVRY/uAkWoS8/A63xo3wiynPuij7PYqgN34xm5hOcWapHdwiRTJ0ucqQES782M/3/YMfAZRPrmqTn92Yw75vKkiW19BtlGYZ/Gn5bHHFK5J0Yg0HymQ8jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeDgwPxXeVZs1PypmdYNODInBTn84U3CB2OPdRnREVM=;
 b=UUYb74uKLQr/DgJnB12VXw9cdD9VcL6N1Oi5zSwkkycnq4DYPd7+bml+kbv08ZFI413KleELmtEtee0mzYMgTRv+/PXojRSE5mBLFLBirtP9oxM4VXGHiG7tXOG27RkXSLMFwdK3ND3W5VPLdZBgxhau6GXd5sS96uSO7L1MB1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 10:18:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Honglei Huang <honglei1.huang@amd.com>,
	Julia Zhang <julia.zhang@amd.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC XEN PATCH 4/6] x86/pvh: PVH dom0 also need
 PHYSDEVOP_setup_gsi call
Message-ID: <ZBLe2XJGh76ltVpW@Air-de-Roger>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-5-ray.huang@amd.com>
 <c51bcc5b-4f90-5651-de3d-df47bdf4a04a@suse.com>
 <521ccacd-a45a-f55a-72ed-de6b64bca050@citrix.com>
 <alpine.DEB.2.22.394.2303151723190.3462@ubuntu-linux-20-04-desktop>
 <9e493e2e-8cca-2b7e-e6b5-d4413c54a866@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9e493e2e-8cca-2b7e-e6b5-d4413c54a866@suse.com>
X-ClientProxiedBy: LO2P265CA0228.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::24) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SN4PR03MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 68188d72-eb8b-4724-c968-08db25ff63db
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jj02x+8SaaUl5BufhpHsvdo4wzxNk9B5wULnp2xA2ZDpCUnA7vfK50jJnz5qFARTci0I5o99g7Xw/Trd4V7bB2uPW8yAeDoN5luyaH52SMHHxvQiuZJhf8ZOHQJ0YOrTVKxZ3KHLg87pElp2ywQ3OuYTr/jFIdNMxEx8M32fACVs/dUK3Xvoa4d4SYfKAHpP0KxEvt0bYZ86aMVqnnwrwf6nCko5B3dzrKeuf2T22sZhBJ8/aSGA5m+55jiv8Bz2FSpOZpuLmdgg513kjqikgmtPVBKUlmOjWxA6y5siyb8L6ZNymFOncqm0DCfpKWU+RAKGDfjmRYKVWAvnp9I8hu/ZJki5fWEuHfZV21u4T0UtsI8vr5UXIG6xRyHNeVFqMOqTMH9FBfOaibXNnfFw3hm4DYDVoorQh3tNAYl4XfnKHu7xLzYZuNxgcavOD+PBTlwmVonq3SQLcx6OcgE18S1giI0wQTJeWaeyaXpkYj3hCT21Ut5cMhexxi1rX4287xmnsx200WoocbvXUovBMwTxe2UFHmJzBJwLiFhTVB8WFz86yCZVXh9BMDk2EPU1N3Rmq+VtHGgPRdNvikIaDc06nUking7e8YTpGEkFgOapR7aT8KQmjdrrkPhm0mmLuGZMN+gcz70KwdUT3DSOwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199018)(86362001)(85182001)(82960400001)(38100700002)(2906002)(41300700001)(4326008)(7416002)(5660300002)(8936002)(33716001)(6916009)(6512007)(6506007)(26005)(53546011)(9686003)(186003)(83380400001)(316002)(54906003)(66946007)(66556008)(66476007)(8676002)(478600001)(107886003)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVZiVHFkNnhuZ2tmUTNobFJ1YXN2YlJ3a3FVUUxWVkZGN3hDbTJRUjJJQjBG?=
 =?utf-8?B?dTN3b2Rvb01JUGhualo2R21rVTFXZjNCM2NoUWtvelhyd1UrNkJxajVTYTdx?=
 =?utf-8?B?THF6YUpCY1N4RUFDVDFldjhLRWtweTZ1UmhITFpWejJpZExIT1dSc0hDb3U2?=
 =?utf-8?B?elcrY1dhRjNERWU4cG5KQUtMRnllODZlbWJYOWpKZlc2UFBCSUFOWDhFUE5l?=
 =?utf-8?B?QlJGQk5SdlkxSlZYMHl0RUJwTmRiQ2xhR004MHVkenhkOFA4WHA2YWlIZDhu?=
 =?utf-8?B?d1BEMG9rWU5tSGYzWHFDVzhDWTE2cEtxZ0JUakNHUkFtMGxVM0FjLzliVjNF?=
 =?utf-8?B?bkYzT0N4R3orbjBqSUdTM05teTl3NlJ2K3hBN2xxa0ZRSmxsL1hoK1hmV09X?=
 =?utf-8?B?YjZaOW9BRyt3V01IM3VkSVpPRkhScTVMT2NBdDBZajN4Q3RwaDVlNTZ3bFFz?=
 =?utf-8?B?VjNYODdDTUN6dGtlT252Qm1ZMlR6MldaUFRuWVorc3J0VE5lelhnUC9jVW9Y?=
 =?utf-8?B?Tm9hRENSSEVTU1ZJL2oxbkJodkptSUppeHoyNHpZcFpEakRUaitNV1lqd1FD?=
 =?utf-8?B?WHNhT0RYeU9ZaVVsV3VpS3ZOY2poZGkwRWhORW9MSVA2emF1cWdDc2Z3Nm9V?=
 =?utf-8?B?ZWVJK0dtN25NcVlvbSttRXAyY3dNVG5QbXdYdmVrcFBPQU9lWjRnWVA3Qjd2?=
 =?utf-8?B?d1BKakI3QnZFSGhJalZoZkNFTUlUOCtKbmlWQXV5UlJYQ3VwVTFkRFduaFdh?=
 =?utf-8?B?TFVtbncyOCtqRlovQ2JuMVlGTENRNGVPWmJUWklpUmFaVHVENmJJV0dETUJP?=
 =?utf-8?B?dGJDUlV5OXVKQzdHbzZEMVM3ZFNYNXU0eTFQWEdLc0hzVWd3dko1dTJyTVFW?=
 =?utf-8?B?RXRJMzNDdWZmdklIaC9PMG8wNTcwS01XUXpzU0VlYU9SZDF4VVdOVTVIY2tu?=
 =?utf-8?B?Rzd4THpCOXJFUUwyWHpRd2VCZHJMbVpBdm92WFkwZjQrdE42ckdWVGFNYWlM?=
 =?utf-8?B?SXRDb2JNbEU0OG9tWWFkaiswNExXcCtpNHFrczJLWGJQd1g3RkkvRzQ5dlRj?=
 =?utf-8?B?M0V5dHpON2RTM21SWU5OSW5PTEZsTTQrQUZxTDVxZG5NTUZkdzRUOGpha00y?=
 =?utf-8?B?OEtGc2k1c3FmSkVZOE5WbG5pbktTL2RZeWRkWSs1UXg3UEF5bDVVaDdzMTBv?=
 =?utf-8?B?TkcxazFSWVNZRytUdU41bVdwd3ZGUjR0NGJzY1J1eEVaM0pTbjJIR1FWWERP?=
 =?utf-8?B?QWJHTklYUzZxOStGTStVOWM2WFZyTzByRVlyNThiSmg4ZGVvV1B5a0FSRVN4?=
 =?utf-8?B?TnlRWEZuWUpyTm5YQUxjZWF3RjFqYjNsZzdLak9PMkZPdDZsSWtTNERRcStV?=
 =?utf-8?B?RkNNY0JwOGcvVUE4YSs0NHJvOVhOSXVRUExpOW4wL3M0VXdFRFVIbjVzRXZU?=
 =?utf-8?B?U1E3NzJnT0R0OURxZVQ2R3M3b1JmK0t3MWFiRC9nOHJtWm9CTGZGMkJyMlJr?=
 =?utf-8?B?czFOcHJ2Y3lDSzFJS1VTOFRUWEx1VkRhakwrKzE5bUYvQlMyVVhVeFBDRnBP?=
 =?utf-8?B?VVE4V1BkRWIydDJqRDdjVmdnN3hQOTUzU210bXdwK3Exa2s0RXZ6ZndhUDRO?=
 =?utf-8?B?YWRPU2FIVTN2eEdkMmsrZjYvMnFaVFpOYk9rYmo2UytnUTZ1MzYwY2dRNW9L?=
 =?utf-8?B?QmY0aU9BVFNyNmlpRktTL0hWNVRQSWwwWFlhdzFocnQxcFFHYVlId2xkcEV5?=
 =?utf-8?B?ajRUWFhnUXNxaUZISlZheE8yb0NqWG9VNjg3ODJocFlnNDB6akc3L1dRa0VJ?=
 =?utf-8?B?TWE3ZFEyRTZISFd5UkZxcHNJUTBLOFF4S3JNQ2ZsK1FhUHo0dkdJRlFjVVRL?=
 =?utf-8?B?ZTR0UmFrdkNzbG5EUTZac3U1ZDBNTFlJMmJNeGJBVzdwM2ZaczFvTDFZeHJF?=
 =?utf-8?B?SUZOQTBUTWo3WGVQS1lSY2dPMDNJdGFXbXJBNXlGS25HcXFvNzN3WDZKbm55?=
 =?utf-8?B?TUNqc1hNZXltTWZMMGsvd2JLcGYzVmhkSVlSWkNGaFViRGF2R0MwUi9mejRU?=
 =?utf-8?B?eW1qZ1E4Vlp1aXUwNFFaamEwQnZxSWhtT1VRY2d1TGYzQzRKNFZZdy82d284?=
 =?utf-8?B?azU2ZnVROTFPM3VIaSt0b2JIc3FGWlg5emZQVDJVaGhObU12Tk5KeXc4Z0FY?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T0fnhPmO3ZJDiwt5RDvhwvMmw0wuxRNv74UB4Fz5uRMUup+2OHiHr0+qn57CSXNK9GaY8EzUhZGll+wbAu73kYICuMWA1XGj1oYGGlIrKq3Bw3PYE6Uk6ak6mflOZm7UIKnHmVAdQiGuzdjB8qHECDoL3t1twULVjszphQVk0sjaeWW8XZJaBwlPqqwpVQ6vGkP6WP2v0Ue12MS61dgSWezELs83ymVUyn7a+F5NZ2v4aLJUfaZfjpzKYKEASuzKEFIpqUQQb9RAZiYLrA5bR1BOJQIMFCOKEjNLwtf+x+3H4Mr7B0PA2hitktuzQ9m8vBabxH7QZjM3cdeWXQhzytGFbe/4ScuOrXihPQmjTt0CF6OKQ/1RISJlPAryYcKFsOAmAPdQmxWxFzNcQHEDygERuuyMwqF+GEnXQXvCtahU1zslrDltw5xOtOIycMOnHoxM9sWW5Cp70j3ur6PkROON/pQvyf39lZgS59v/mub+2jfgcHMZ/SKcgj6JudKjyp+kgj6nmsGXqdMfqgI86oUmlgwlTaWErQ4OPb/FWBL2JP8N8AFESADE5BvyIqNgM12D8I4zshOfbY6VG8cpcakT9uyZ3k7hb8JGx5GhQ83KDD2LsPt04EyOHV4a20gJarkZspRZxVAQhjppZOqIgldm9/fU6A0dPT4j/XWmUgU40WkwiXTLzOGqlL4ayJGricUH1DPgvwLR7wPvEQkRHcbiL0Yc34wf3VqT0AYNrZQB9BjIItP/JU0SF56rAJD5/l4XtiIvRI47hhoDPsdvw4KqCe9u3G8VkycRnrAUyMdbjsQYuyKd6fGawRSbKDpjaFEOGUijrg8A1rnF2ACWnZ458or/SI4sY3zpmMNFfCgwnOfu2EBOQW2WX4b+QmBs
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68188d72-eb8b-4724-c968-08db25ff63db
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 09:18:22.8102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63RGOB+JVOT0KWhWmBVlsksrWzSfwxcfiK3fys9xd1L1wxfGQeJiMUpK5OMoAWDOIrLdf/26Xhn/XwS6W4j7bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6781

On Thu, Mar 16, 2023 at 09:51:20AM +0100, Jan Beulich wrote:
> On 16.03.2023 01:26, Stefano Stabellini wrote:
> > On Wed, 15 Mar 2023, Andrew Cooper wrote:
> >> On 14/03/2023 4:30 pm, Jan Beulich wrote:
> >>> On 12.03.2023 08:54, Huang Rui wrote:
> >>>> From: Chen Jiqian <Jiqian.Chen@amd.com>
> >>> An empty description won't do here. First of all you need to address the Why?
> >>> As already hinted at in the reply to the earlier patch, it looks like you're
> >>> breaking the intended IRQ model for PVH.
> >>
> >> I think this is rather unfair.
> >>
> >> Until you can point to the document which describes how IRQs are
> >> intended to work in PVH, I'd say this series is pretty damn good attempt
> >> to make something that functions, in the absence of any guidance.
> > 
> > And to make things more confusing those calls are not needed for PVH
> > itself, those calls are needed so that we can run QEMU to support
> > regular HVM guests on PVH Dom0 (I'll let Ray confirm.)
> 
> Ah, but that wasn't said anywhere, was it? In which case ...
> 
> > So technically, this is not breaking the PVH IRQ model.
> 
> ... I of course agree here. But then I guess we may want to reject
> attempts for a domain to do any of this to itself.

For PCI passthrough we strictly need the PHYSDEVOP_{un,}map_pirq
because that's the only way QEMU currently has to allocate MSI(-X)
vectors from physical devices in order to assign to guests.  We could
see about moving those to DM ops maybe in the future, as I think it
would be clearer, but that shouldn't block the work here.

If we start allowing PVH domains to use PIRQs we must enforce that
PIRQ cannot be mapped to event channels, IOW, block
EVTCHNOP_bind_pirq.

Thanks, Roger.

