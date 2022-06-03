Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0724253CBCA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 16:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341573.566813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx8g3-00058l-3w; Fri, 03 Jun 2022 14:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341573.566813; Fri, 03 Jun 2022 14:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx8g2-00057A-Vy; Fri, 03 Jun 2022 14:53:26 +0000
Received: by outflank-mailman (input) for mailman id 341573;
 Fri, 03 Jun 2022 14:53:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DOPF=WK=citrix.com=prvs=146533d13=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nx8g2-00056y-6y
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 14:53:26 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea5b601d-e34c-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 16:53:24 +0200 (CEST)
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jun 2022 10:53:17 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB5180.namprd03.prod.outlook.com (2603:10b6:5:1::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Fri, 3 Jun 2022 14:53:12 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 14:53:12 +0000
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
X-Inumbo-ID: ea5b601d-e34c-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654268004;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CeOoZHVmBDTeCDWyr6srfB3n1uMkh4xDcKOevGWXN/Y=;
  b=RS+93M4WGCxxsu7QvBmHdrmapsfGpRZQSBmKxos4yr89jlTPBEADaIX7
   +9VNQGMR8AzNaVchbo993uAivg9iZAU5Dchf+s+WlaNMJBnexBezcVLrG
   3FI34+65s3IYb61+85wPHikQWWJ+T4Nwk1AlcBxHkOzvaKMKqGjEAy8Nw
   A=;
X-IronPort-RemoteIP: 104.47.58.175
X-IronPort-MID: 75352390
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ASaJ7aka32R7ggLnL7i7Cwvo5gz1J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKXmmDaK3YYmDzLd52bdux8koG7JKEyYdrSQpprCkxQiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DnW1jV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYZT0NNKzBwtohFDJZSxwmFvx2yKfLPi3q2SCT5xWun3rE5dxLVRhzF6tIv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXtZkBg2pYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH9QnI//FmuwA/yiQt1+DVYMXpReCVRP5FkEGz/
 0DvrjzQV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQMDDUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4LgEhwASEy66R6QDJAGEBF2dFcIZ/65JwQiE23
 FiUmd+vHSZorLCeVXOa8PGTsC+2Pi8Wa2QFYEfoUDc43jUqm6lr5jqnczqpOPTdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:nW9dn6gj59+8FBmNyp7jow0qkHBQX0Z13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCJSWa+eAcWSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AWV0gK1XYcNu/0KDwVeOEQbqBJbq
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0md
 gsAp4Y642mcfVmHJ6VJN1xNfdfWVa9Ni4lDgqpUCTaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.91,274,1647316800"; 
   d="scan'208";a="75352390"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ/6qmbTf4Jsx6RBMcJxSsatizHoGq7cBjbX8LDbe+AF24Z2EC5QvGea/DKuhVEg5+0T/+yHDWEFhOZEgLdcxq4hfZJhkIFWRQ2fXcngrFigSmZAbiqkDgS0YSa5N/SNFaMefegE2E6OLfNEHBM24e17eEVEybi8Ki24b3jIzi7xc/n+2SjLE6haZuvlkcy85muN9mALdiPYqhKmy3vgJF54aclKYfhi7Ry8WrqDIPQvBicIFMwMpWeed2o7by6KXxPknrCis12Qs6rA8yhwZuQzseMy70uVOaT8LhhOUvm8puuIDsj1zttNisZ/B1deMg0DNrpf3eQDUeYRgvEZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEO5KEH84xBGRvwftGa85g4axL+WqYFNwUoCvf48EYk=;
 b=apmP4dKebxJllrqkAD076+G9NVJIngM8Jg1bqJLDx72ZIcqNsI+/jnkeczcmoiLl4KXs4gsDUGg8Li1pGi5D9jNmmedeRwXbFCbx5NpArRg3OLnYTWwOMnftBx9w6q4ognqgbG6CRLiZyPBXqdE67nJ+I4iWV3i6iOo9TwHDcNHN3LkjvjehNdYtMj+LKSAeqgbnTQj425bJP2hT1fFl0UAU2BogFdOGhqvSyLC14ZSmkldHqhVxqYoeUq6P3IrHAFYDlSPLi5mexueOmwKUwXnUgJCsovaRAWcBPQanVoDbdCLwJLXv9Vl6v99vXl9UBnBo6ZVVaWL6Ce/ZzgaBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEO5KEH84xBGRvwftGa85g4axL+WqYFNwUoCvf48EYk=;
 b=vtAQuYEvVYJA6BVH5JELtRKaw0cai9waZRcZqux2RKu/7g7MM14N/HD2jCsR420yH0m2HPTA8XNEWvEcxqfg5YvQVxwhQPJbXf1GXfoNNvm9qzcoLVTn8Sej0DHCUt2x9XTZH3oN8QDoKWMK2uUGoIolG1h6Q5pDIdbNSXfsG0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 3 Jun 2022 16:53:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC 1/6] x86/ioapic: set disable hook for masking edge
 interrupts
Message-ID: <YpogVFqGl1zS3VCU@Air-de-Roger>
References: <20220421132114.35118-1-roger.pau@citrix.com>
 <20220421132114.35118-2-roger.pau@citrix.com>
 <85dfc48f-3440-1e6a-dc44-4c2bb050184b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85dfc48f-3440-1e6a-dc44-4c2bb050184b@suse.com>
X-ClientProxiedBy: LO4P265CA0189.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb5493a9-fdad-449e-8cf5-08da4570c7d4
X-MS-TrafficTypeDiagnostic: DM6PR03MB5180:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB5180E5C8B277F28119962FC48FA19@DM6PR03MB5180.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jWLb9DYlLKKeqC29MeO5E+MtNon0FX3WCIS0ZaOx6C2iICHNzWXOipQmKoT1jyCgaOeqlA6ReslGTC3AyM+kytbHtgZ2oESDYEaACa3Ww+d4OTrJSQxKZKYqLvhjnClSDCBwKZnolRjIT8ZWuiVyVaGXZGxA5Y9ZnLFvIWhVxaSmiVAg4tPymtzSMHUX5N9LHRqw4TQFANumF/JtPJAWaUCMrD+kBo1rycX7IHEf555zP78Xw6twVJSYoz/ImO1wIB9iyLtTYLb6/akoEC4/VtcwlRj9/O1JJExoSVQ5OPcuoEL82XvDYv63ldpyK/WZtFiwxWbsl9lkzVCrGCqgLbNCdpiEsbe3QVfDQ1ida71ib56pbDuVv+niHLKwwLJcTqnI2RoV1UzU0+sjihpYq1b9eCRGKF0V/kA2BRSmmIJP6iwFFnyTeOneSnEMnngLtL+1SUntw/Z64lc3hGIfthBSG3ONF0QXgUIRvgaHIiKuukSZfv2vK5sSd1qed016W90M08qOCnFwPpq4pitGDXTWRz/GRcvMArjD7A97qHj1t7m9q7kg+ar1W7TGNTMj2ruUGzFCJDOYvnlwQ/DbKFybUInMt1UWkqTj4NQYTaG04fpeu/rA8KfpH/iMjKk/977mxGol1nmAIKBqGWaPeA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(6916009)(5660300002)(33716001)(66946007)(508600001)(316002)(6506007)(54906003)(4326008)(66476007)(66556008)(186003)(86362001)(8676002)(82960400001)(6486002)(83380400001)(6512007)(9686003)(2906002)(26005)(85182001)(6666004)(53546011)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmxGZUN3d1FhaUF3aEQyTlptTU41d0NSSzFuT25VSHl5ZkxrZmJoVGtFZURK?=
 =?utf-8?B?TVlvQVdlU1RtaTdmZ1RoRi9hcTBxRUpHZkFlVlhEam5Vc2F1OHVPbjBPK2o0?=
 =?utf-8?B?bVVsUUNqTEkrTEFCL1BtSERmd1NIRHp6Rnp0RFl0U3ZkbS95NW41UkkrQVkw?=
 =?utf-8?B?ZXExcVNmOFd2NHV0QUplM3ZQT0oycWlkcUJjTXMraEhVRzZpQUppQXdkdlcv?=
 =?utf-8?B?MkhTS21jNlc5aW5VdHBrWXJ0Sk5HejVKOS9SMWdCRUhJelZDU3g2Rkk5OGdJ?=
 =?utf-8?B?M2pzL3ZDTG91bUJLa0RrZ0lMRENVbmZZL0FvUHMxTWptdHBFSmJZYS9UNGhS?=
 =?utf-8?B?cXNualpZYlZ1U3AxUVZBcGI1QWZsaXB6Vm9MMUNjd1krVmllYmxUNmNRaFcy?=
 =?utf-8?B?NDQxaHRyaTFLVHArckxITWQ3M2Y1NDBuQzYwOUYyQnZYblFlN0xDYUd6WU9Y?=
 =?utf-8?B?cmJvbEJremIrUnRqM0MzMm5EcWwzL0IxK1A0L3lnY2pRYmFVSFR2bGtYNEd4?=
 =?utf-8?B?eHR4VFdFQzVEdnA0cWFxbFVSUEJhdVhzcXpjU2hWY1pCTEF4MnJCa0lsVHht?=
 =?utf-8?B?RDEvd05nYlo3UXVkTHlYNEdodWU5U2hXYVpXVHdNTVlvQTNScjNkS2IzTGNx?=
 =?utf-8?B?eTlPZUV1M3BBQjVNUlIxMzBLbkRrTTRpWW54M1dReVRIZEZ6UWdUTE8yYU1T?=
 =?utf-8?B?ZkZoU0tId0FuUHFBVXNwWHlmUlA5N0gvTnZvMTJ6QmsxeCtmN0NEUlFOWVB0?=
 =?utf-8?B?aFRuYUNSWVlnOGMyMUcyVGpsaXRBVmFONDFSamYxM3dPN3lzQ3RLUTBJN254?=
 =?utf-8?B?bWU1d2Mvd1VTQy9JQ1hHakg5MkRhRUF1TElycUhXSDhhcHN1dnBmNHAvKzJH?=
 =?utf-8?B?Q1FJL3J5eVVOYnVJOUM5UlJxQ3pnUWdLNk1hZnVIa2NFYklpQ0ZFVUtYWEJz?=
 =?utf-8?B?WHNmL04yZGI4Wk1MTFpORTdCU0FLZDduZGkxSkltRWZrUWlySnZLRmdzSURQ?=
 =?utf-8?B?amZsNGNIcmpYVEltc1pUd3JOZjIrTXBKd21OcVFtc25pRHRIbUFCdGlkNzhk?=
 =?utf-8?B?YmVsVHJYd0xOUjI3UW5JSmNBNGRUVEVzTERoOVRGdms2MnpaNGV4K1h6R2lz?=
 =?utf-8?B?NHY2QWhXNVR1YXpBUmJ2ZjJXQVpPdVdrclllakxPSjFLTmxBUG95YjdmMGpu?=
 =?utf-8?B?dDlzQ1dqZ280TGVkM1ZRRjB3aStjb3FlSTBzOWl3cVBiK0VicGNJck1zUG9E?=
 =?utf-8?B?VFo4OVlXOE90VWxYY2ZxcktpeXRDaHhqdjZkOFkweGxHYTdXa0F0VTJzV3Vk?=
 =?utf-8?B?cG0rQW85b0krbzdZWDF5M3pUdnhaZHBacC9LMWJ0QVI1UlJXazlEUUsvWHha?=
 =?utf-8?B?VEF6U0tzOHVxd0toaTl6dHppMWorR3pIMlBIOGx3RStxb0dieHdvZXplKytZ?=
 =?utf-8?B?VWxpNm1pZ1VyTENva0JlcC94OUtJQUVlQ3RwbTdjMjdLZ0hvOVdWK09yKzRS?=
 =?utf-8?B?dENkZlJXd0xOWUEyVmhySVdxK3hEcEpRbTMza2JIWXRZVFBKZGoxaWIxSVVu?=
 =?utf-8?B?NEhjRnZkaFVTQnpXOWJlYU1WWjFyR0FiUVdwZTVaQnE2aFBDcDNnS3A1WGNz?=
 =?utf-8?B?OUdpNklMbVBYbndEQ2xabXlEOFh1aUFzWU1NTkRPOU9yL0VGZ05hNGU4dGlq?=
 =?utf-8?B?TFBvZ2xiVjAzWm5rNDlaRWcyWHVlWm5OMFFqK1djb3FsV3doWUFrUzJvamsy?=
 =?utf-8?B?WFhUN2Y3Snp2bDRZeGFpdDNBMFJZbDVVUWtmWVpRUzVDRnltOTNKd1JYbldO?=
 =?utf-8?B?d1pPREdPZ2FCNndIMytQd3Q1KzZSTU84d3QzeElIRFFMRC9qU1hqbmtVaDh6?=
 =?utf-8?B?am5RenBuSzduclM0RFRuZDV6MHA3Z1ZoYTU1Vmt1NHJubGVCeFhHc2RwNWFu?=
 =?utf-8?B?Q1lHdjRGT1paRFhvYnV1OHV0aG5sK2RxcnptbnFPMDdNZExTZXR0Z2hmZWdy?=
 =?utf-8?B?VmwxMTh3aW55cmp3QS9sK1BuQ1VxTDNoSXR5dkVlS3lYOVJOZWpFZ1ZXNzM4?=
 =?utf-8?B?V2RzQzM3TFVwbjlqbGNoZ0svbXAybVREVGxiTzM5eFhEd3NXbUhzQldUcVA4?=
 =?utf-8?B?NFhnUmdBLytTTXQ2Q0xlVFRBTDFTVFV2aVVpQjNpN0tzTFVpZlJwWjJNbWJR?=
 =?utf-8?B?QW1oZXIrQ3NLRloyaGh3L2VIQ1BiZURKMWpRWXlyQTBxQ3JFYm9ZQldTRmI4?=
 =?utf-8?B?ZjhQVTMwc2kreit4SDdaeGhQQzVQSDlET1h4VGVNM3pSL053RHFLcnhlV256?=
 =?utf-8?B?V2xsdVAyOFM1SUJZazlWcE5WTGE1dUc5ZFRPaS90TW9tZThFdURlUlZWZFJp?=
 =?utf-8?Q?mb9O1Q9SbrQrqR+w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5493a9-fdad-449e-8cf5-08da4570c7d4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 14:53:12.3219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vI+aqhluYjM4fCRgl4NjYqlIFdVLS1DPbqoDmsf2qsq8gGuue2WIAFFMpvJ8OX5nNpOGToz0WQQNoQtv3cZstw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5180

On Fri, Jun 03, 2022 at 03:19:34PM +0200, Jan Beulich wrote:
> On 21.04.2022 15:21, Roger Pau Monne wrote:
> > Allow disabling (masking) IO-APIC pins set to edge trigger mode.  This
> > is required in order to safely migrate such interrupts between CPUs,
> > as the write to update the IO-APIC RTE (or the IRTE) is not done
> > atomically,
> 
> For IRTE on VT-d we use cmpxchg16b if available (i.e. virtually always).
> 
> > so there's a window where there's a mismatch between the
> > destination CPU and the vector:
> > 
> > (XEN) CPU1: No irq handler for vector b5 (IRQ -11, LAPIC)
> > (XEN) IRQ10 a=0002[0002,0008] v=bd[b5] t=IO-APIC-edge s=00000030
> 
> I think this needs some further explanation, as we generally move
> edge IRQs only when an un-acked interrupt is in flight (and hence
> no further one can arrive).

A further one can arrive as soon as you modify either the vector or
the destination fields of the IO-APIC RTE, as then the non-EOI'ed
lapic vector is no longer there (because you have moved to a different
destination or vector).

This is the issue with updating the IO-APIC RTE using two separate
writes: even when using interrupt remapping the IRTE cannot be
atomically updated and there's a window where the interrupt is not
masked, but the destination and vector fields are not in sync, because
they reside in different parts of the RTE (destination is in the high
32bits, vector in the low 32bits part of the RTE).

Thanks, Roger.

