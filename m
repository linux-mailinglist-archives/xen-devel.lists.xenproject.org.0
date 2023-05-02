Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A306F41B0
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 12:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528466.821648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnKy-0000uj-5K; Tue, 02 May 2023 10:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528466.821648; Tue, 02 May 2023 10:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnKy-0000rr-1l; Tue, 02 May 2023 10:34:24 +0000
Received: by outflank-mailman (input) for mailman id 528466;
 Tue, 02 May 2023 10:34:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptnKw-0000rl-HR
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 10:34:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4565d0f-e8d4-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 12:34:19 +0200 (CEST)
Received: from mail-mw2nam04lp2173.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 06:34:11 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6377.namprd03.prod.outlook.com (2603:10b6:303:11c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 10:34:07 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 10:34:07 +0000
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
X-Inumbo-ID: e4565d0f-e8d4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683023659;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=OcL+fG5wIRAZ9WwG+QC74Q95vh4A8SH6qo7tdrcXdLg=;
  b=NsFwCJMy+YXgHlwdSeWlmlztQwbtYYMIZuDSSUfxYA4tjt1YkFkq7UD5
   u8DJ2R+Yn22OL9fQpO1RYZyhUxMyVVwAVUwXLLogEQ0yqW9tvuqRjVixm
   1Jk2DYiF5R5mnZPGtHDKX7x992B5mCThXqFy1I0YLhvBHbWkv6P9dkDnY
   g=;
X-IronPort-RemoteIP: 104.47.73.173
X-IronPort-MID: 106882018
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zTYqtKvdXjajRR6hFyO7FWVJOefnVHBfMUV32f8akzHdYApBsoF/q
 tZmKWiBM/aNYmekc4x0PoS+8h8O7JKGzd5jHQM/+yo2ECgS+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AKGzSFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwEiEudDGmubOK6ZW9YO5q3McRCJfpBdZK0p1g5Wmx4fcOZ7nmG/mPwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0oui/60b4G9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANxCROfgr64CbFu7/jAXUzQMZACCnNK0003uWsBZD
 30Uw397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptz8+oc6i0qTSs45SfHuyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CBhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:ZJ2NkaCVUp9mEd3lHemW55DYdb4zR+YMi2TDtnoBKiC9F/byqy
 nAppgmPHPP5wr5O0tBpTnjAse9qBrnnPYejLX5Vo3CYOCJghrOEKhSqafk3j38C2nf24dmpM
 FdmnFFebjN5I5B/KLHCaKDYrQd/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3AbJwajmvMi3GpRs5RfBQVzgbs6IsfY17H7VLucnO?=
 =?us-ascii?q?RLmBDT7vPSm20pqFdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AD5olMA5B3Aqm3zZmlAqK9wWRxoxQv6D1IVo8yqw?=
 =?us-ascii?q?7kMTdNnxxKTG5vTSOF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="106882018"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTiSQy2ZHdqcfQ/c6tg012pHRl5DY5hbab5ef6EPVhV5OsD6mO3qE7M6bt5bg3Y+ihPG0rOtydkH1cqfbEf/ZjxRxflGdFawe4pURq7bNstaNHcH1wO7CfKMwRpfBe7/dj3xHwkVw9nEWshXDNR4ngnQojRlzNqMutMLIVhJyhIH674+8esJ1BDANx3/ijJYX/3RXmLrzblLIoUrlg7L7F7FD/E3E2my7AhbXXOr/CiHlPMxc54/Wd8IFdbG/DNwQrZ6ArBBTaBMeBEmxOrMcUjIur00PDlvq877kLdXNWBawehYGQiRUswKD4jJAGf+5qIpiL6vhS3EXR75scDrkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GK3S7p7ZYgG72MlZtaCx995FesgjOzg2erqZCRG44lw=;
 b=mrjz97AG4hdLpm59q4PGDRgL5ds7J3vhwV3KQLwZbqUeBx6RiN6Hwh7XLF/lD7RaXSvz0D1P7B+dYV5yEgs3vgkTffPNHzYk9HlEnpR8itOggtbmkvVs181OJEe41Oj+a8694/81j/mH8SDP469bbZUjCOEYSVFcxVn/QahRJg5SYGd0C/ruvDaIEgH6cZGh/4FzXHbO3HT/A7ZsSIjNvfrC8c8BEunUll0wNT/96qHf/ngQVQCbsVxBPMq88gc4E9Jxo/CF/JcQUxAvBYkR3TH3c5aaXHjARNVyN/3OhhPtomBeer3w5rZEOaiOMcfpdRl++DATL6sd1yhGIHF8Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GK3S7p7ZYgG72MlZtaCx995FesgjOzg2erqZCRG44lw=;
 b=eOTI4ORgDQXmFoCAHDBMOBHyPA93vF7FVe7fJLvudRTU60PIZibHPuluVR/lKECPJIcHOcmIOkwBg31wdyRdgrgvUC4L7pqvEtrSC8VafyRRny7tbLq0kxjjOCaBDZtXWHwyFYna5UHk1gMuqePcOB1N8Jj9DJfCHSoT2GbhyqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 May 2023 12:34:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] x86/trampoline: load the GDT located in the
 trampoline page
Message-ID: <ZFDnGaNXhI7PLOBM@Air-de-Roger>
References: <20230502092224.52265-1-roger.pau@citrix.com>
 <20230502092224.52265-3-roger.pau@citrix.com>
 <11b24761-9268-e647-7316-0bffb549ae6d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11b24761-9268-e647-7316-0bffb549ae6d@citrix.com>
X-ClientProxiedBy: LO4P302CA0010.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f05ead9-979c-4c7e-6d29-08db4af8c22f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0/3WxzpTu7Lkw1YweM6WqWo72QQQkY45SZYSH1EwD9GNw0x7MqMXtpY3aC/4FBCPoKGCIhH3LnC4uUWecFYwMRxaNWzQXzxG0Uu1gobWLJVVpx/mRP2gI5FneJJG8I3Fq6qCHdHDMcd0/oFPp25q+Hn/hzUsMv2QQUY9tXr3NJELjC5vTS/qVQ8lATsxx+dMypdbc9gXAJhsmu4LJIZOfbUZ4Z3L7qldVrukRuVF7UgcEg8lzZW/YS/RedKJzod7rgXISXn9d2DiyRlIaZRCJrhCyYL047tl3tQVVfb1nPCyqnLYmeOVLRDVhtJqxdmb1I+YtwvHZ2HAkGbYz0ZRTc1mwFk6hp1zn6XaO5eZAYcAc2r9fbM5MPLKTpTbUxWzSIx+R87KApZqmmqRDaKQiMTmxB/8GnnOI9jfIpF7FA4jYZKnHyzYDa8OaCGMCYy37G1Yp6JGEtsoGuMvhGcBb5+bVGNnJ0/IfpYn20jriu7YRm94vstNo8T/8HsHJ3XCpUAx2FK/KBfjbIwHv8P/Y1RIcOI8cI3hU6Bh7ALkzqHxNiSHsj2A06qgxox6fM1S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(4326008)(6636002)(83380400001)(2906002)(5660300002)(8936002)(85182001)(6862004)(33716001)(8676002)(41300700001)(316002)(186003)(9686003)(6512007)(26005)(66476007)(66946007)(53546011)(66556008)(6506007)(54906003)(86362001)(82960400001)(6486002)(6666004)(38100700002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXM4RXhBSGxXVm1sVXBuWnY0Q2FQdHNrU1pzR0RpN2hteG91MnVVa1hpTmt3?=
 =?utf-8?B?NWt0aHhURVVUUEhzRnBmWmZDZnZIOFBQZlI3MDNHYTRtWndxdUMvTFNrcHlJ?=
 =?utf-8?B?TWZ0b1VPNVpwS0VyYkJua1hwbmhRR3FGeGlQOU9hNEF4ZFNNSytRMHY3Tkkx?=
 =?utf-8?B?dnRMOFRkTTJuekI3VXFuakV4MkNvUmNrclZ5T1MxNC9iMjVDTFdhRUhuVzln?=
 =?utf-8?B?OXVCZE16RHpBMTA4K1lMcVNkNW5QZWZuRi9kZXFNUFc5aXNncSt6UGFCVXhD?=
 =?utf-8?B?dm96NjlXcy9Za1ZIRElCVWxvUFJkYVptSURNcGxSbTI4eERGdGxkUUF2RDhm?=
 =?utf-8?B?MzNEcEk5VFRWVCs3U2RrN2hxcUFCNmpxY0NaT2R4WTMvSTZXUlBMR2pzSUtR?=
 =?utf-8?B?aDJ3WU5SYUVxVWQwRDhlNDc4MEVydVkwbzBXNXpGdEJQblRFVFZrWXpTN1Rn?=
 =?utf-8?B?cGYrUm1ZOEpQc0toMzZqRlhWT0RVN0FVbW94bmZTMjAzMHVGWTRmZnlCNVk4?=
 =?utf-8?B?RXB0OHVxaXFzdDNtVFBoU3M2b0c2U0g1NGpnRXpLKzN6ZGdwZzhKU0UvYm1X?=
 =?utf-8?B?RGIwSlFCeE53WWdOWGQzYVNWSkswMWpDMlp3Q1hWRnIrQ3l3VFgrbml0TUk0?=
 =?utf-8?B?OWF4N05QQ0ptZVRncFhVQjdPeG5qbHE3Y2RlS3pmOG1abHpRSkhCZkhPSkNi?=
 =?utf-8?B?b3hyck0zRG10cThOWjNnMEdqdFZONE1JVFBhYWgvblpsdGh2R3FvUmdnTG50?=
 =?utf-8?B?UkF2dGYrSXV5TGpQZDZva2lvT0t5QmNZUlRUMVd2NGdxVFh3bWNLRXlOVG1Y?=
 =?utf-8?B?dDJudVVrcVV3bm51czYrZzFQNUlYV1hLWlhXdzNSTWJmMFNraVY5cVcwVWlt?=
 =?utf-8?B?Y1YwdkxVMXJJYm1tUzAxVjd4MnZrY1JHU0FhRVFJcUV4OFJma2FuQ1pIZThN?=
 =?utf-8?B?VDY4ejMwaE1sQkVjV0ZOYTFkeTMybk1yc2lzUW80cVp4KzNHMjJiRnZOblRu?=
 =?utf-8?B?WWlMeGVJQStpLytIZU5URy9iMUpjaVlSUnFVdS90YStHUEdrM0l0eitRNGc1?=
 =?utf-8?B?VFBaRDlpNUJwR29URHlpL2NpdW1KbTRLYzhteDRxa2xaSXRWeUYwT1NXMUNs?=
 =?utf-8?B?WXRkSWg0Si9HcjFXMjdsQk4wZ0xaQjZ2Z0szVDhTT2lDSkdXK2tXS2ZCcVYx?=
 =?utf-8?B?Mk5jbWIyNGJNcUpPeS9OaGM4NVh2TFljMkYwQVhSY2E1K1lweUROdWdPcWxO?=
 =?utf-8?B?Tm5BVGpTdm9ZZmFCb254U1BmVk9wWlY4V0hZbHByQ3R1a0p6SStkczM3TDB3?=
 =?utf-8?B?bklvRXNuNHNoMkRBK2N0U3lXdmpTY2Z0clVpU0sxaEd1blBDMHB6bzZjcC9S?=
 =?utf-8?B?Y1hNRXF5UXVMemJla0Vmb1E1TkVDLzZ5dis3TnFmL2VEWjdDZUQxNW5CSkdX?=
 =?utf-8?B?SXk1Vm1EcTNrZUhTRVZCcDJaMXQxZXo0TnRWMThxdGNyYThJeWVqV1hvZmpy?=
 =?utf-8?B?L1RQMEREeVUwRWo0Tytnd2hDMVhod2czWDRnYy9DYkQxcmFES1o4RVJpZXgy?=
 =?utf-8?B?MVJJVWJVSUxpQWNqaS9IdnJZOThMYlI1ZGFBOE1sdnJ3RkVOUmNuVS9qeUVK?=
 =?utf-8?B?aUF2eDd5RWp0d1pLWHBrM283QlBPUmhWM0FHc29JWXJkMmd5ZFZkSzd2cUFz?=
 =?utf-8?B?bnlaeGNEK1IzWkhEUkp1aUNobFpCZmtRZjBrTnRqWVR4THV0TU1TYlFYUWpW?=
 =?utf-8?B?cXJNamR3eVY1bGRndE50blRTMUJtMUtmV2ZuNzVqQ0VZR1U4L01yOFR1UUNa?=
 =?utf-8?B?ZWpSSS9HY0xoWGU0ZnhhcVBlQ1pDZ0lHRFF2SkVNYW00VWxjNWN3WS8xbGND?=
 =?utf-8?B?OGdMREtadHlwZDVvQ1JDZUM4YlU1TmIzMXFMSkgzZFh3YXl6NFBMak1CK1ZJ?=
 =?utf-8?B?OEhDMUszMVM2WjVoTnFJRDRockkrOFZzRHhPT05rTEVTUUlBUXR1NUFyd0JT?=
 =?utf-8?B?ZHdMOGorOXNnY3hVMENqZXI3VGpVVmt6elp6cktvWTMwQlJrSTY0ajBGeUJY?=
 =?utf-8?B?WDBjOWFtTkNFZHQ0b2pQbFFISDJyK2luUnZRbG56MEIyYzdNeWxCaDUwVmRo?=
 =?utf-8?B?azJheVdJVnZLNzR2aUVqZVFTQlhaZjhDSkxkbDY4eHpHaGM3b0IyWEVoOW1L?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1OOtrEE3Btos8DXXC67djlIg8QlU0OmiGKiQDk2zJpbh4kkQJso5YUyRLodoAHb9YQ1CW7sHZnMNbcN5ElsBbdAISbQ+6eOnLNqK/puHn0f+l4O7tBMtLAVWRXmpIUOYlfBR2WpkGIeeA1Jdg5hb+nL7BrUM5YUV13439AxS3jwiiGXicPWtC7KwfgT3xR51NdhhQmhacCU7Q9XB/1cCu0vv3Vk2/M8xBcqDxrzMrvt60L/8bykwL4xOJB/lQ7OUtvRxUjhjmFWiFHVwBmiQH/CX2PA4mYe2aZ0VZM8G6/DYLWsDcfEV8wpSfps7DDl7nUStjOJ4+WXYf3EbKZhCZGFteiCFvDNDD38Ta/GQj7vhSi9453Y2PnsVnbl+7SCYYYAGb1llEHTpBeSKZVUGxZLkXIQ2ldqguIlAScukjQ7zxnbVoV8yy3tuKOfiZ0D3ReitCpE7VzNJA+sC1cAg+Qz0+ZEcCgLLoBfymqStXeTcfye79ZS75umbGAPtHb25dx5hDDOWtXxYdll9F+8pmtnaeShCsUmMDrVuAoocEStKbT9Tw5WvCWUXI3+RCAw6KNeA+DQPeKygCGWGuXx+QgYkJVvoiWkrE2kqbFN6wC9IKEtYRg3UgpHVpuCrntqL53IA6d8EdYaRNpsw0TNfpt+LKoLyvfnMiuZZLbtZShTe/HnAmAb/TI33oh+g8TOsoJT/P3xgFZVZX77TAdlBxOQXYjfnPEsmzIDmkXSRMivbMVrIOrj9P0pRExH2OyKB4zd4XlKwa/aecTw6BIAPzmGqNvucbViy8aPjf9be6YY/9dGxKrM7Rz8TiMcQ1N4/
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f05ead9-979c-4c7e-6d29-08db4af8c22f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:34:07.5778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jeQzUA6PEPFeHoJUObp0qEN2xXLkzgpTwSHyCtF7kO5IrD8umptI/dOJDuKdiRSd7hSezm5pVvK0T08eSwcHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6377

On Tue, May 02, 2023 at 10:43:13AM +0100, Andrew Cooper wrote:
> On 02/05/2023 10:22 am, Roger Pau Monne wrote:
> > When booting the BSP the portion of the code executed from the
> > trampoline page will be using the GDT located in the hypervisor
> > .text.head section rather than the GDT located in the trampoline page.
> 
> It's more subtle than this.
> 
> gdt_boot_descr references the trampoline GDT, but by it's position in
> the main Xen image.

Right, gdt_boot_descr GDTR references gdt_48, but the instance on the
Xen .text section, not the trampoline.

I've tried to explain this in the commit message, but maybe I've
failed to do so.

> >
> > If skip_realmode is not set the GDT located in the trampoline page
> > will be loaded after having executed the BIOS call, otherwise the GDT
> > from .text.head will be used for all the protected mode trampoline
> > code execution.
> >
> > Note that both gdt_boot_descr and gdt_48 contain the same entries, but
> > the former is located inside the hypervisor .text section, while the
> > later lives in the relocated trampoline page.
> >
> > This is not harmful as-is, as both GDTs contain the same entries, but
> > for consistency with the APs switch the BSP trampoline code to also
> > use the GDT on the trampoline page.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although ...
> 
> > ---
> >  xen/arch/x86/boot/trampoline.S | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
> > index cdecf949b410..e4b4b9091d0c 100644
> > --- a/xen/arch/x86/boot/trampoline.S
> > +++ b/xen/arch/x86/boot/trampoline.S
> > @@ -164,6 +164,12 @@ GLOBAL(trampoline_cpu_started)
> >  
> >          .code32
> >  trampoline_boot_cpu_entry:
> > +        /*
> > +         * Load the GDT from the relocated trampoline page rather than the
> > +         * hypervisor .text section.
> > +         */
> > +        lgdt    bootsym_rel(gdt_48, 4)
> 
> ... I'd suggest rewording this to simply /* Switch to trampoline GDT */,
> or perhaps with an "alias" in there somewhere.

"Switch to the relocated trampoline GDT." maybe?

Thanks, Roger.

