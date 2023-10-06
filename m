Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD127BB2C7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 10:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613286.953732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoflm-0007qr-Ct; Fri, 06 Oct 2023 08:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613286.953732; Fri, 06 Oct 2023 08:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoflm-0007pI-9V; Fri, 06 Oct 2023 08:01:10 +0000
Received: by outflank-mailman (input) for mailman id 613286;
 Fri, 06 Oct 2023 08:01:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qoflk-0007p4-GW
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 08:01:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e84c85d-641e-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 10:01:04 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 04:00:49 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7092.namprd03.prod.outlook.com (2603:10b6:510:2a5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.39; Fri, 6 Oct
 2023 08:00:42 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 08:00:42 +0000
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
X-Inumbo-ID: 7e84c85d-641e-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696579264;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1/i21sLZ1qZupfXyPu6lYYnc2VAq9mauUmeGOXEuDc4=;
  b=ZQp3Pahcg8vW5Amx6avQA51wBVF/yvonSODSCUS7TmWSkwCHBB/O/TZ5
   xunUdpx3HlsBIj4J95g2p8NpY/ZtNlaswbb93B+xaQE+uoYEK36hG3NJ1
   T9UF8pB7Y1HGm8GwwKHV8Emcu5dQYOHjVJswBFTYFDxPTDtt0PRafmYY1
   M=;
X-CSE-ConnectionGUID: 2fltv9SnTgemEaFDM1be3w==
X-CSE-MsgGUID: JJlhh1NzSBeMJauXCurgVw==
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 125229527
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Mr9SyKJHDm20wUfdFE+RIJQlxSXFcZb7ZxGr2PjKsXjdYENS1TBUz
 2ceCG+OOamOYDHwfN5yPY/j9RgGuJ+DnYNlTQJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gRjPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4tD2VS6
 60jLgwCYxWujsya5euxR7Jz05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLlWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv227WVzH6hB+r+EpWa1PpqgAS11Fc5BTg0XEaLiuSjhXChDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTjNHcs1gq8YwShQjz
 FrPlNTsbRRzubicUlqB9bOZqzyjNCxTJmgHDQcGRwYY59jooKkokwnCCN1kFcadkdndCTz2h
 TeQo0AWhagXjMMN/7W2+xbAmT3EjoPSUgc/6wHTX2SkxgB0foioY8qv81ez0BpbBIOQT13Eu
 WdencGbtbgKFcvUzHXLR/gRFra04frDKCfbnVNkA5gm8XKq5mKneodTpjp5IS+FL/o5RNMgW
 2eL0Ss52XOZFCfCgXNfC25pN/kX8A==
IronPort-HdrOrdr: A9a23:ntvgJqrza5YwecLouX3usoUaV5tYLNV00zEX/kB9WHVpm5Oj5r
 mTdaUgpHnJYWgqKRYdcIi7Sd69qLbnhNRICYl4B8bcYOF/0FHYa72KnrGStQEIfBeOsNK1tJ
 0QN5SWbeeafCBHZKnBkXqF+robsaS6GeWT9JPjJhRWPFhXgsNbnnVE4lT3KDwseOAuP/NQfv
 fzh7sj1l7QAgVsUimiPBY4tqr41qj2ffrdEEQ77nUcmXezZEaTmc7H+m+jr2Yjul10sMsf2F
 mAuTe8wpiK99ua53bnpgzuxqUTsuCk7uZqQPGtp6EuW1fRozftToVsUb+4sDo0ueGi70sBkd
 XHoRssVv4S15rkRBDpnfKh4Xiy7N7gg0WSjGOwsD/Gm4jUVTg6A81OicZwdQbY0VMpuJVG3K
 dCzwuixtpq5UerpkjAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEb8bdRiKwLwPIa
 1LNoXx9fxWeVSVYzTypW902uGhWXw1A1OvXlUCgMqIyDJb9UoJ5nfw/PZvtUvoyahNHKWspt
 60ZpiArYs+G/P+uJgNUtvoQqOMey3wqFz3QTriC2gO0sk8Si7wQtXMkfwIDdqRCdA1JEFbou
 WebLppjx9sR6unM7zH4HRqyGGdfIzvZ0W89impj6IJ+IEVs9LQQG6+oRYV4pmdivIYD83AUf
 O6OJZbGJbYXCXTMJcM1QzzUZtIJXMfSc0YvcshXU6Srs+jEPykigRKGMyjb4YFOQxUF1/CPg
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AR8SWcms/kqR3xzFVEzbN0hA46It/fHnB0ibrJXO?=
 =?us-ascii?q?3BGNEQZO5bAaa9fh7xp8=3D?=
X-Talos-MUID: 9a23:h7BZCAoWr7A9NqG490oezxNAMMdouoK8M2oAtLcPpvmvKDZ/BSjI2Q==
X-IronPort-AV: E=Sophos;i="6.03,203,1694750400"; 
   d="scan'208";a="125229527"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEaWrQ2zXruyk2g0731UM2cP9VE9eFKoTArcz9zrR8lsOkmEb2md6Oa4V2yyIOrzBoES5HM+N4vDhVNJqtFYiB7bLOaWsnms6JSLQaT4FiL1kbwckXziNpnPA0NWYuVenmb2ckgpM4hnVp5PrbZvZl4Wk41Q5jhTtVumSnoeWABQJ0zU0+8DRbc3/kiz5szjiuiTLgb6NOt2AU1a+HnuO6Tx9RCBXU5ZIZSlxkwLrts0VAc0k7xH2kKfdCjcFy7X0b2fR3cdNCmsI4VG+X38aeF/8X1ZLU2EXy9+2PV6y3aH4IBgJQTR4n84+FdtKZjp1BdSOY7B5Qny/Gbl7nVCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Btfp1SGMMSX5XPpBhmPAz3n7R3RWimmHl/FS17qxDsM=;
 b=KTOepUu2Jnl+Je/1jmFkrDoxfNIuKqoVx44dbyrPdrXgpR5p9D6JaE5Qi5uSEWsb0XUbCU/0figYkENSLP6u0tyaDwIiG8MuOGzcxTwp8z+D/hertRaPoyCv0k6AYV4f3cS5uD3PPTJ0EWb/6K+jqIDEV/Ng8dJSjgXkOPn9s88F31k7Yx5WuiZ3dSQXYFZKUJzgTOKoQqIcuDLcWFEpiB0tRIfShMxz9HKbHBwJ0WJtjt1ljP8tqzjOt/AIGnJWuRjDi4RqCRhvqF39ilRX1qAjZG5fA3KiW8NnjdYvKFVQB6OU1upqQPCVBlEVJzjxGSoP8AMTu+4nbEBKxQC2mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Btfp1SGMMSX5XPpBhmPAz3n7R3RWimmHl/FS17qxDsM=;
 b=XdTweKBVgPMCiNopaSj/IadbXUq/6qSWYsNNKXecZ+Sk4f2K8daC6Y2iSzCfvREK3L49z1OxsZcHpQJah7OuClxNuJH7C1wOTJRWzvpTPWVGkWwEK8ht5czriZ4h/kFSt6FC9nhruUXNx8syGX/zyABp8ULEn2IqekiXZifd3Qs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Oct 2023 10:00:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, henry.wang@arm.com,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [CRITICAL for 4.18] Re: [PATCH v5 00/10] runstate/time area
 registration by (guest) physical address
Message-ID: <ZR--ozuTl9-CgBqg@MacBookPdeRoger>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <ff8994eb-968d-4bbb-a960-e5ca78ef658e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff8994eb-968d-4bbb-a960-e5ca78ef658e@citrix.com>
X-ClientProxiedBy: LO4P265CA0316.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: b0676bff-8b1a-4dcc-5866-08dbc642560f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MZD2KWhwIPn3z+znM2xVRzbsNnTZfGvhK7yRyBKt3jZG3mt0AZk8dlOVDngLcT6XkM7QwK0KMJUNuuaYjQ6WiI0na290UGF5TWLJrn+xysgYpVUEoQWmGPJSU4SLlIZRhcDQmpuXIG19TeryI2W1Y7Uu6nL1mLeTdi1c5H7yhOeXb+1rlKqo5QHPosjykel499o09UEhpLagq1Xwu6gwkN6JVwDxnu+nU6mcBpsF7XruHY7rFCY8136wcnP6/GMkQcBN1Pv6kwfcsG4eEk2BhY6BJ9W31NKUROaxX+nUGndyGIJfltJs+oR57MIT4Bz6fBBCpqkLin8R0WCZp25XqpWELMVOQAUmKecTNaA4roR5nnthCeQJWhqCPX5Ecd4kmxZj/5Vnz4eBT7kDVPsBAflO5cVKcC0HVM5xH9qxwkq5YlDcRFy6zZWKyZQ66pwgHwIbgdzjjpsaGDr7yysaoTMZPFKn+xKK8xwMWRpUkvF3MwJbTD4Hh+3hKPtkBVxxtCpOfYY2RGYcigMGKDw9/MB+6ukBfrV1Rss4sio5yRLZVIUiY51NJCOuZWJvFGgu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6506007)(9686003)(6512007)(86362001)(82960400001)(38100700002)(85182001)(26005)(2906002)(6666004)(478600001)(6486002)(83380400001)(8676002)(8936002)(6862004)(4326008)(316002)(41300700001)(33716001)(5660300002)(66946007)(6636002)(54906003)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmNYSHBYd2QweFdRUzBWVjE1QnhUdUpaM3A4ZmJ0MWhWOXJrUEF1L2U2WnlF?=
 =?utf-8?B?QllhYjNKSGJsRG9RLzMrUFlTRkhxczBtOHRUejJNT0cwWXdiWS92bDJTYXdh?=
 =?utf-8?B?WWRCanh6bHdaWDArVjNEVWdWOUhuMWFkN1VGUFZIY1EvWTZxQVFLcDRDV01s?=
 =?utf-8?B?eU9PUkpGejh5RmcwaTRwb0cwK2M2Q0pINy9TdFJ1ZGpNSVp3cXJBWU9HTXl1?=
 =?utf-8?B?Umx3VEdxdHJ1K2J5TkJSOHEyWnQxWnVZaVVHa0hZRFRFMkFCRzFWbGU4a1NQ?=
 =?utf-8?B?L3BzLzExY2NPbjQxWW55T0NHKzhlNXNEeDY3RmJqeEQyZDFRT2txVk9JeitB?=
 =?utf-8?B?azkvaFVtTzBPV3h3dnVwVllZalM0QmZQQk1pWWZETWZUYlJXcHA4UGhjOWMr?=
 =?utf-8?B?WmpLRWNscnB3Z2NsYUFiY052ejk5U3d2RTNKUmlCeVBxREJoNExXc0dVcndi?=
 =?utf-8?B?dDdHV1hJMW9YV0tUL1QvbG1GckRwMFpNZEZ4NDBxbzJ0em5BVXZXS1NGVGJv?=
 =?utf-8?B?alZTNnl2eWFrZ0x2TEorKzZaR3ZmNkYzSFk3RHdCa1J3Ym8wVVBSZy9DalVx?=
 =?utf-8?B?NHNtR0hWZDl0ejRSREZmR0ljaVJvdi9RR3hpM0huQVFnUGU0eGJ5Q2dYVHgx?=
 =?utf-8?B?WXNyR3liNFVlZnErUEd1UEkxTkhJSDJsZ1FsUGZaT2NqYnFxRnZBZ05uYXc0?=
 =?utf-8?B?aUZBUDZ1ekdsVkNRKy9SdHVId0hMU09CR1UvQ0JmZEI1b2RXcktiZDFnNFhC?=
 =?utf-8?B?VFN3YXZUd28zWUVqQ0JDLzBnT1I0bWwyYmRiZzVPUmxBNmdaUnZwcXdLTjRt?=
 =?utf-8?B?akxmMFBiRlAraUR5SmdWUDNtbElROUFNZ3gvMS8wbjlxM2E5S0RSdjZhMEF3?=
 =?utf-8?B?dXdzRGVjZVBwejMxRVpyd1ZCRWZqZGo5ZndhakVSWUxQdGJmRExjeDJVYmNh?=
 =?utf-8?B?Y0Jzb05aL2R6WkdZVVJ2Zzl5ekNVM29LTXVQa3R4dEt2QVgzeEFWOXp3UDZo?=
 =?utf-8?B?K1pucDJxOW1ac0ovbkRaREd0N3h2TkIyRWFlVWl3ZGdBNERsay9aM2VGUCs4?=
 =?utf-8?B?N0p0NWM0YS9tQnpwbWVIY0VyYzZaWVgxdUZkcXQ0bkVwT1BneGViUTRnTWZl?=
 =?utf-8?B?OVZGYmFYWXg4YnlaZ1BWVzB4Mm9aMjd4WDBHZjBsWE9hZHRBR25KZmRTYUJ1?=
 =?utf-8?B?RFhqL2J4czRTeE9mTXFEUTJFMTRsdmE1SjdXeFhHcXBJWGllQ3p3MUc3QWJ5?=
 =?utf-8?B?YUNrSFF2QVp5SlcxcG91dTBvS2Q3Vkh4RFJFcUdwbER1N09zK1hLTzF6TlAz?=
 =?utf-8?B?NXVySDlLbE85dGtDSkt5M0tyelZVTVlYZDZPdUNQU01odEtOUmgwN2ZJbTJx?=
 =?utf-8?B?NDBZUCtXaEsrbUpEOVBPVkhLWFYwRzNqelFzZEx4ZGdzaWRKS3hZanp6cUF1?=
 =?utf-8?B?WGlnWGFQb0ljUTQ0RVc3U2M1ZzJNMlJxLzRFYlc5V0dOQXJvZk5VVlJuUmp6?=
 =?utf-8?B?Q2RqQndITXZCTkladVZiR2pvdFgyeWx5aGlqLzVUcmY0SjkxaExHVjhadGVB?=
 =?utf-8?B?RXZhNng3YjdjYnNxUm5FaVJIRlc2QmVpTmY2RWxZREU5N3RWRGN1cTJsZTlN?=
 =?utf-8?B?MEVWUHRJUUQzK3lCQ1pxbmxSWm9TYm1oVkNrQkFHZXRxVlhkc29CNmRzNDM0?=
 =?utf-8?B?dkVrdm12WGEzN1NUdWFaOXljaTZLc1FLYzFINWttOFVjd2dzWGVBSXl2S2VL?=
 =?utf-8?B?dWVHQTVZd0xjVTBxQ1c1MzVIWjJILzZWekQ0R0ttSTlZeW9wdEZDTHdiRWZU?=
 =?utf-8?B?bFdaQkVHK1JQcXIzaWlNRHBKSFlZaUgzM1Y3MjIvcER3QVhENHBQdEpvSkI2?=
 =?utf-8?B?NkZEeW1reWFHb3BmditkZDJiUkJtRGtFUWFHdm5HTkpnT3kyTTZ3dHJNeDBN?=
 =?utf-8?B?ZGFvVTQwcTBvdWFtRFRTL1VDaFl4TU1jai83WEQ2YlVaWGF3OThCSGZxU01k?=
 =?utf-8?B?dkdRdDVuN3cydTFFaTVzTGJYN0NqcWprNW1lczdiUGdiVFRXUWFQWnZWdnBO?=
 =?utf-8?B?TnRRbWNmNXVQMndIODAzbjByUGlWTk9LaTc2WlBvTHR2UUZLNHdDUEI5MUNL?=
 =?utf-8?Q?92R8e2NDt0mOSDa6Vvhv5KZIu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DYHxzOVkIYHvGqlEikG6oZv/EDzsgd1gZZy6u7SbeFizCsZdM/aBE0QQAc/X5p2Xb13cdKbH54ROLRY1AHicmkcw2WjgCf0dwjiSFmxFgTgC0P2xcD7AB0TUUzOu5HfsgHR6wYfFpu1OHtzuqPzd4iwFlOAs30r6JarauvqI2S/if24io4d8o5PeeGkN/UnHCbXVW3gJ1hNlLfOVY/u+c5/wNeuOL3Kzh9ucz0rWomYxH4165sKqAz1mzbV1QDkBl03HbyZvZnCWtq99qK4LTYzWHK5TiUR80M+HB4pnoiWl1n2guAviN1z3w4gwLPZffOesONCvBISWwJy6+4VtLq7Pi9gVY8b4kQdgJR3nRi9ylSmdPfl2uZs+NWIJrKvGsxxfLpP9M0TfzP6zZLUPo3nYkDJ5Tym0mPgqqcOm20CjFy/4ctzD5HAfKq3YlWv69Ek+LwcgwSjvHXAl1szORFe5w5fKFEJYCJod0WV3C/jZsI9jQObcyrboSFs+usoCFc2TSarLRCsUzM/rHmvLtghsMWMhPrenN1oteSvZVCm96Ph+1SevdF53oVq90MtKBXYaFmiU0zXB7zA8Ud3B7ben+tSgTVR+Ev3o3dFbNOArcZLvgHeLqOTLI5QbLop8Tfd9+0jKUWNH4mMXgK4RM8dtzX/zk6nrduMZ+/mamjik0nOSiy3YMyjJeBujrdryldxX7cLirP9mooDQC2Qdj4FYzwYoYFpzCjx7ZTsw2sWl/5J3LCZAF317+oIT19bgWD4w5VSQA9XY9Z0k5axeUShN09xmNBLg2JHQUtomfrvxtjZ+UQWfiQvjXf9yoU8Noj3opquNuugsxDtKONfzbQIdK0yVLv4m0CD68vpoPzN+bh6u/oAl5OaqqBjf9c/imixCE2xZP3D7rL4EYNCXadTP3HLywC+vzzzWObjNk58=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0676bff-8b1a-4dcc-5866-08dbc642560f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 08:00:42.2575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggUH7/HZw0frz+mJss8SwTSuNeaDDbnbII/9NqENDTnjcqHQS8IZXW1GigYixDCwBAfje+PdhIxhypIkGcTs7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7092

On Thu, Oct 05, 2023 at 07:58:50PM +0100, Andrew Cooper wrote:
> I see this series has been committed.  But it's broken in a really
> fundamental way.
> 
> 
> This is a new extension with persistent side effects to an existing part
> of the guest ABI.

The only change in the ABI is the different return code for multiple
attempts to map the vcpu_info page, it used to be -EINVAL and it's
-EBUSY now, which seems more descriptive.

The added hypercalls are an extension of the ABI, not not a
modification of an existing part.  Or maybe I'm not understanding the
complaint.

> Yet there doesn't appear to be any enumeration that the interface is
> available to begin with.  Requiring the guest to probe subops, and
> having no way to disable it on a per-domain basis is unacceptable,

We have never mandated such disables to be part of the series adding
the new hypercalls, those have always been retro fitted in case of
need.  Not saying we shouldn't do it, but it's not something we have
asked submitters to do.

> and
> has exploded on us more times than I care to count in security fixes
> alone, and that doesn't even cover the issues Amazon have reported over
> the years.

That's fine, I can add the enumeration.  A CHANGELOG entry should also
be added.

> 
> Henry: Blocker for 4.18.   The absolutely bare minimum necessary to
> avoid reversion is some kind of positive enumeration that the two new
> hypercalls are available.
> 
> Otherwise I will be #if 0'ing out the new hypercalls before this ABI
> mistake gets set in stone.
> 
> 
> If this were x86-only it would need to be a CPUID flag, but it will need
> to be something arch-agnostic in this case.  The series should not have
> come without a proper per-domain control and toolstack integration, but
> everything else can be retrofitted in an emergency.
> 
> And on a related note, where is the documentation describing this new
> feature?  Some tests perhaps, or any single implementation of the guest
> side interface?

Not that I know, I was expecting Jan to post that once he gets back
from PTO.

I already noted somewhere that I wasn't able to test myself because I
couldn't find any Linux side patches to test the feature with, and I
didn't have time to write ones myself (was expecting Jan to have the
Linux side done already for testing reasons).

> This is engineering principles so basic that they do go without saying.
> 
> ~Andrew
> 

