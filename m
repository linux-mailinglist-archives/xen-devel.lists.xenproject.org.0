Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D682B4F292F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 10:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298606.508715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbeoh-0003AG-R9; Tue, 05 Apr 2022 08:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298606.508715; Tue, 05 Apr 2022 08:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbeoh-00037D-NN; Tue, 05 Apr 2022 08:45:35 +0000
Received: by outflank-mailman (input) for mailman id 298606;
 Tue, 05 Apr 2022 08:45:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbeog-00036o-8c
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 08:45:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfd9e359-b4bc-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 10:45:32 +0200 (CEST)
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
X-Inumbo-ID: bfd9e359-b4bc-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649148332;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6wQSPh9seQupSNmo9ABmYBAqNSLEb+diize44Wecdk4=;
  b=BA759pPV9LPyi5fskUCgn7muPPmvUAQ5tCaT6J1mFuQfezHItMHuR86Y
   YkcHyHm/pg3rUjzUDihGbmUjeG7/koyhC+6ns8eXSji4gR7VodvV/MnZM
   Q1MGTINn0PHisU3acuBROCcVa7Y/ZpUgQ4X5/gc9+YM+iT706yPez1hqD
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68428354
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4+amCK2RGj8wxBdF2PbD5R5xkn2cJEfYwER7XKvMYLTBsI5bp2NRy
 WQeX26PPqrbMTf1L49wPNu0oUsPvJeBnYNjSgpopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIw3IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1M6MSBUissYJaXu8pDdwl/KHtuPvZZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u1pwUTa2DO
 6L1bxJXUzCQYAcTBmwuL48wvsuKoT7iah9h/Qf9Sa0fvDGIkV0ZPKLWGNHSf9mXQ8RJjwCdr
 2TP8GnjKgEXMsSFzjiI+W7qgfXA9QvbVYQIBfuH//hlqFSJwyoYDxh+fUS/iem0jAi5Qd03A
 04e9zcqrKMy3Fe2VdS7VBq9yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBeeNAx/
 gbXxZWzX2Up6eDLDyLGnluJkd+sESlIdV4ZSSpadlAmzYfHsKYI1ALMFck2RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRzwoBZPnqgKuVmSwXuF1O5eJFcFh
 2eJ5GtsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeon0/PRTIgz2xyxRw+U3aB
 Xt9WZzxZZr9If45pAdaus9HieN7rszA7T27qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Om
 +uzw/Cikk0FOMWnO3G/2ddKcTgicChqbbir+pc/XrPSfWJb9JQJVqa5LUUJINc+wcy4V47go
 xmAZ6Ov4AGm3yeadlzWNCsLhXGGdc8XkE/X9BcEZD6A83MifZyu/OEYcZ42dqMg7+tt0bh/S
 PxtRilKKq4npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:tyg+waGoORHDDjJ+pLqEi8eALOsnbusQ8zAXPiFKKSC9F/byqy
 nAppkmPHPP4gr5O0tApTn/Asa9qBrnnPZICOIqUYtKMjOJhFeV
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68428354"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+LDxcfYVuVFhRR7nNNLUcShHe6iNzvMBs9yb/8d/Du0LjBRpIGEZmzGJNTLM/lrO8jng8eAlTBbM2c//S0BVGrj8paMFTV1AHp/y73eBfsVhMLCkPruTDC0BCATWJNlEpRtQyeI9lVptur8OxsfrySy9TqdRij7KqT4iDR7QD2h/viQjeg6++qvosUWkP1p1TnqLmhFJMiQIBHEwhgkw7aqNaFaF/HpKXwKHt6hKTqeDB/Fzy6K7EED9ybnluPgaiQ1WLaUeD19Sw9mLA13TbB+VF8jaW7fpgI79Ga7EJY7rYmtDDqiDxLds3pBDs5Ahs5Goa9DnRM9XEP4Wchypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jU0tNywfi2tR5O6evzJJi9J6tCUoHjY/kSrbZl6XiPA=;
 b=gn1/ZRYUd6ziJqpnNuz1I+4tDIlNdNrz3uBF3vWN4ogLP0iWVoW0KHDPNwNPL2l7n1TUJVOpmAnCJl1Ju9Fi4ti8QsVnZ+WFuk9jsQn1h/h8TCS6KxHSfyfYMlBh2+CNp3jlpWb5XRYfMnfsgJMZAs/MjQO+SAzi+WI9iTpF6szetDZ3cvvRXskr0tkORYgNMFuHYO6gsGFDn0YuO8Vgf1XwU02tn2fZkbPY5lROIJDsSIeet5Ilp/a4jQ8FLdu217h0P77LLrLZf3X7MlFepxAOB7pO1GLfdDL4bad3rc1uOh5GrU679mMmJlnuQP7leLXDYlbfO4V9CQFI1dOsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jU0tNywfi2tR5O6evzJJi9J6tCUoHjY/kSrbZl6XiPA=;
 b=D0NZx2X8TudqclKD7ViVufrtErjjVqhXKfqWq902/fIA5ZUfdTBOATXEpmxvi+a31r3C7/0BWBO2m6EY4tSO1E7kU88+SjUYi/fOdw+iTyMdAopyAYOaIUhqglpnf0QBHp/hrQEk6kJJCqh5SUzc1TWphXbjN3ffh6Fdo7PvylA=
Date: Tue, 5 Apr 2022 10:45:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>, Henry
 Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 1/8] x86/boot: make "vga=current" work with graphics
 modes
Message-ID: <YkwBpKcyrnuXyNPa@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <3fb7f3e9-a6cf-4f8e-1141-100848b1bdd0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fb7f3e9-a6cf-4f8e-1141-100848b1bdd0@suse.com>
X-ClientProxiedBy: LO2P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65821b87-9778-4691-392a-08da16e0a21f
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5759:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5759A2E351555D7031041AEA8FE49@SJ0PR03MB5759.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pakkzPLwPvC2+Ui/khhDC5h5QQ7H7alBbPbP0VOYx+IwOYPcftRmSe91EGaufWrrWc2JVEr7l/mB13RP447xAMsP2ob3aFDCktEpMi4s/fkRnyzmUz1phy5+c91sQ1BG6mEYQEylOUnPax1+p8kTAQNNvls4jiTIBB1kd93jInEKKSbabtWYg8XZyK0DDGkg1FOB7JvTfasSxOaggfZSl3AfaAGn+yJztDJ2cDoqNCADuLsxzINsj9i8YmA6AkoFxgzBjTAlKWbgVFYrcHRvRmJ70Awnca4RZWc0s/gUsuRH3se+/VOa62E0oqwF/6yyXws8gZy92lvMsezz3Mai3BxLSMYsT2pKx43OArbV4mevaPoCls5PRKoaeK2GJGxLSMHEfMu4xbIVd1U2fGpGRcWCpqFp40grYaZUSYXUZjo1JUKxfHDiZw7mRflPTyzrMBnziKIDhAZO+ZIjKmDfk9MYN+gXIU+ZJzDvU9XRmxNzKlBiNpdwLzo5L7JXH+HuZsEQfkSEH/VXJVqrzn/tfbD5PnlM6Fnwtuw9gf0+yEauFAIde9vwV38EdKzP5MA5fFk8vn2O9UkT99cQ4tSpJdHvoujGBri9v65aUuVV99Qw16UJXsYutUniUgV3ktBrSNSbXlXAgwVVmlEi1lrOTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(5660300002)(6486002)(85182001)(6916009)(83380400001)(54906003)(186003)(316002)(26005)(508600001)(8936002)(38100700002)(6512007)(86362001)(66946007)(33716001)(2906002)(6506007)(6666004)(66556008)(66476007)(9686003)(8676002)(4326008)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFdZUmhQU2l4a3ViT0NwSmNMa0RETEU3RmcyU1hzSXpYODN2SXpWSWpBRTIz?=
 =?utf-8?B?NlFEZ3RwL20vSmxMWFdYcDRhMDB3YmlQK1E1RURqZ1pvTFVkR2FMeGRxMWx1?=
 =?utf-8?B?S2diVG01Mkt5ZHVBNm54Q2p4U0JvMTNKL1ZlOW5rbS9rSXB2Q053bHV0Smxv?=
 =?utf-8?B?L0pNUUphNys2alZKRXphRVBZK0tCVlFmYkl3MG1XYUFXU2plcm0zcXJxd0ZR?=
 =?utf-8?B?a2V0NGxtbnNzUlhiQWptdWR1MlRSbjl4c3p4Tm5XbHVGNDNXa0pXbVlYWDNn?=
 =?utf-8?B?aHVxZGtVZ25kQjhScjhZMEtzaXBsTVY3YjlOZXhoM3lFUm8yNmlrV2NGTTQ2?=
 =?utf-8?B?aWcvTFdMRlpLUlZmNjZKQ2dMYXhpWis1RHIrcDk3YXhwc2dHZDgwazhnUW9U?=
 =?utf-8?B?eE5RS2RIL2VhQ0VKTHlvSzczenUzT2pqZnNvSnB5azVSUjVIc1lTb3NlUHhL?=
 =?utf-8?B?NWtNWWhPcXJUczA3RDdBT1EyRlYrRXJyMkxvUTFyMjNwZTlQNHFHTjJaNHZm?=
 =?utf-8?B?RlVwSFEvVE1xQVdXcUkzYTVTbHFoOEJqRDVTdlg1NStwL0UyVG5OVGtXUkNr?=
 =?utf-8?B?dWgwblJTRnA4cENMU0M1T2pCcWRhNkozdmdCSTBwakw1ZXJYUnNLdGl6Si9p?=
 =?utf-8?B?S01NWC8rRnovcVNxSlN0UHNVUTRwbVJYaFBYQkdKblhMMVgzaFhuamtlQW9x?=
 =?utf-8?B?TThyM21IODIzV2pIK1ZQQkMyeE1aVUNuRVJoUllXTTd3bkM4LzNYS2N2VDFR?=
 =?utf-8?B?TlBOWWRrTFBjSndWVmlnVjlOb2Zia1AzTjMyVUJFSnVKRE5EZzUvNEozc2py?=
 =?utf-8?B?dHI3NytkUGVCemcxZE9aSG9PbnpCRFJwMFY5bCtRc3UxRjV3S2JMeG9oMkUv?=
 =?utf-8?B?ckJhZ3lZZjkyVmErcmMvejBBQldrTXR0OXR0K2JBUi82YU5ZaHQ3NE1qV0Jk?=
 =?utf-8?B?UHI5WFB1S2VhbU1laUhMS0NtSHcrNVkrQnR3OFVmYUlrQTBXN01xWENoWVVn?=
 =?utf-8?B?NUNTMWdqMmdlK2RHMURhelNnU0hVMS9TWVE0YmM1bE9zVDMybWFvdXNubXRF?=
 =?utf-8?B?T01Obkd3Z3kyRm5NTU9FNlJVanJQNmNpYmxMRCt2ZUJid1J0bHppbFVDdmZY?=
 =?utf-8?B?cHVSTlZRWnByNWVnd2V1VEFvL3BvNTBlb2R6Um1tQjhHNHBJcFlJRjMxa1Iy?=
 =?utf-8?B?ZlVOL2RZREcrNmNXKzNoQUNzc0hZK3lTejgwYTlHbzdCMzV4bjU4S2N1OTRs?=
 =?utf-8?B?RThsM3FUMTRUQ3o3QTcyUXRxbmFReTU0SHFhSVBaN0cyb3NyVkxFVWR0MmN2?=
 =?utf-8?B?ZmZqemp0akRhVFN5bXRFRHp0anNwOEw4Nld5Z00wMDlBWG42cUU5b1VFM0py?=
 =?utf-8?B?QmozbFBwQUF0cE8wQlJvbFMvRzhRQXZwSTJJeTVLRi9RZG9GNFhrWUhHQ1c0?=
 =?utf-8?B?N0tRZ01uZFczVXE1VjBDaWNsK3FlOFZ4UWg5VDRqUkxwOFZrL0xoaU1jamtZ?=
 =?utf-8?B?eEtSY3M3YzZET1cxMUJkZjJKbnVDRU5temVLOGN4MXNFNlRZUEJoREoxUEZK?=
 =?utf-8?B?MW9LeDdRVEhJdTREMitENGxDUVhSNzZkcjZTZ3VTbkNLR1pyYjJ4QkNHK1Uz?=
 =?utf-8?B?bTdrUThJVHY1N1hac25veWQrZXJ5Tnc0UzMxZ3BWekV0TnQzK2RPdHorLzdN?=
 =?utf-8?B?YjZCVmJUczNORlBGQkpBOHZQbVpSYmZKTUtvVUx1OUVTTCtzR2VISWlEWlMx?=
 =?utf-8?B?TTdPZVFnTmFjcjBjaUlaanF5WDRIYlBlY2pCUXlWek5IVCtIMWwvZW1lTFBq?=
 =?utf-8?B?dHFTRDlTOUhWeWRoOExBOVYrUzNkd3lOaXVhbksyayt4dGxnYU02aWlIYlN4?=
 =?utf-8?B?TTlvOUUySHFLQXhVdzExLzZIOFhWeFpsUnk5VnA2N3hmQ2NJcmFmd3Ixdyt3?=
 =?utf-8?B?QVRiK0NTWVhscW56cXpjYVErZ1hsN3RQU0llN2ZJWis1UUluSkN2TFNCRVdH?=
 =?utf-8?B?cjJ5bDZ2ZGVLdUQxL0svZjhYMDBscS9ycFJ1OVd6Mnh4ZXpUQ0VVcnNwM21t?=
 =?utf-8?B?MFVPUFZHNjRzT1p4TUhTYUU2b0RUN2hVZ25UN2hCSlh6WFplQkZsOFJWTy9w?=
 =?utf-8?B?aGl4YXJzS3IzdEVvbUxRYXpvUTNjMVdDTUVPaWlkRGgyZk9MR1dsZXY3NFY3?=
 =?utf-8?B?cEh0MU0zOTBXWTNmdUlvcXF4QUZMY0NienR1aG9zMzdRbFc4aFFmL2Q4UUJY?=
 =?utf-8?B?YmdHMTZ4TTVxdXFGWnNQSVRBNWV5SXJtdUVVV290anB0Q2RHcUlFTm5lSmdT?=
 =?utf-8?B?RjJsaC9FTlVoQi83RFI3YjZzTHhsS2JVOC80OW50eStIMXUvcU14Yk53T3RE?=
 =?utf-8?Q?15EDW5xB3Na6iglA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65821b87-9778-4691-392a-08da16e0a21f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 08:45:27.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oN5cGIbHP0Ub8In81gTpPBymT4KaEogV+8ZG//7s27WztdTCikrHMKRmWSLlh/NC68hPazRp5ybva4kh+bWdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5759
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 11:44:10AM +0200, Jan Beulich wrote:
> GrUB2 can be told to leave the screen in the graphics mode it has been
> using (or any other one), via "set gfxpayload=keep" (or suitable
> variants thereof). In this case we can avoid doing another mode switch
> ourselves. This in particular avoids possibly setting the screen to a
> less desirable mode: On one of my test systems the set of modes
> reported available by the VESA BIOS depends on whether the interposed
> KVM switch has that machine set as the active one. If it's not active,
> only modes up to 1024x768 get reported, while when active 1280x1024
> modes are also included. For things to always work with an explicitly
> specified mode (via the "vga=" option), that mode therefore needs be a
> 1024x768 one.
> 
> For some reason this only works for me with "multiboot2" (and
> "module2"); "multiboot" (and "module") still forces the screen into text
> mode, despite my reading of the sources suggesting otherwise.
> 
> For starters I'm limiting this to graphics modes; I do think this ought
> to also work for text modes, but
> - I can't tell whether GrUB2 can set any text mode other than 80x25
>   (I've only found plain "text" to be valid as a "gfxpayload" setting),
> - I'm uncertain whether supporting that is worth it, since I'm uncertain
>   how many people would be running their systems/screens in text mode,
> - I'd like to limit the amount of code added to the realmode trampoline.
> 
> For starters I'm also limiting mode information retrieval to raw BIOS
> accesses. This will allow things to work (in principle) also with other
> boot environments where a graphics mode can be left in place. The
> downside is that this then still is dependent upon switching back to
> real mode, so retrieving the needed information from multiboot info is
> likely going to be desirable down the road.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

