Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A973F51FEDF
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 15:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324584.546702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3pj-0000DV-Se; Mon, 09 May 2022 13:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324584.546702; Mon, 09 May 2022 13:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3pj-0000BN-OD; Mon, 09 May 2022 13:53:55 +0000
Received: by outflank-mailman (input) for mailman id 324584;
 Mon, 09 May 2022 13:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qz3g=VR=citrix.com=prvs=1216f8a52=roger.pau@srs-se1.protection.inumbo.net>)
 id 1no3pi-0000B1-9P
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 13:53:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7498433a-cf9f-11ec-a406-831a346695d4;
 Mon, 09 May 2022 15:53:52 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 09:53:49 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB2971.namprd03.prod.outlook.com (2603:10b6:3:122::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 13:53:25 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 13:53:25 +0000
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
X-Inumbo-ID: 7498433a-cf9f-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652104432;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/c3ie2XGLJXXW9etjGgzHiUJqMIHHEiG8sVQSFPzLRY=;
  b=LvEP0neH0lk8SQE28KZShV8HYCLvn0wIixOgOIsF+NkPTr9v0i/qGPhc
   2bUKb4tLsxbBOQPfaM69ngOssI6ewa00MnvdyJxPULpTBEI9raoM7uklQ
   7++i/ouPmALCe6rhFCczzVzujCzHKSEsoHtLLZu9ZZA7WeROC6FrFXYEB
   w=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 71294654
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nhGFwKgg30CmLu/F+UhjgH68X161qhEKZh0ujC45NGQN5FlHY01je
 htvDWqOPvuON2ejLYskat62o0kAsZCBzYVhTQc9qyAyFy8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlvc4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YVY4IqHNubsEahZ7S3tCD61rybWfeHfq5KR/z2WeG5ft69NHKRhseKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIIehWhu7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wvP9PZpvjS7IApZ973KLMTyRsGxSuoIx0rHt
 CX+4kXEO0RPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc/B1J
 lEQ+yEuhbMv70HtRd74NzWnpFaUsxhaXMBfe8Uh8x2EwKfQ5wefB0AHQyRHZdhgs9U5LRQoy
 1uIktXBFTFp9rqPRhq1yLCQqj+jPDkPGkULbyQEUAgt7sHqpcc4iRenZtxuCrKvh9v5XzT52
 SmXrTMWjq8Wy8UM0s2GEUvvhjutot3DSF4z7wCOBGa9tFomOsiiepCi7kXd4bBYNoGFQ1Kdv
 X8C3c+D8OQJCpLLnyuIKAkQIIyUCz++GGW0qTZS81MJrlxBJ1bLkVhs3QxD
IronPort-HdrOrdr: A9a23:lyKTR6n6U4f/n4/f39R0XblclErpDfOwimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtND4b7LfCRHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaFp2IhD0JbjpzfHcGJjWvUvECZe
 ChD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 r525RT5c5zp/AtHNNA7cc6ML+K4z/2MGXx2Fz7GyWWKIg3f1TwlrXQ3JIZoMmXRb1g9upApH
 2GaiISiVIP
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; 
   d="scan'208";a="71294654"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKWyZxMu+nsxHVnmgFL4TGVfDLmZRMBZoPN3EE4OF7sWBxIaAyy+T2vi5JdnIG+uCZAz7Q5xxDxafwPwjCYoiNy7mwTcUt1ua0i9cBNhtBv8xEhhSDuqwBgc9Yman9d+a3VnbH6sPAUlT68Nu/4St7o1tv7fcDzTMYN8AX4dWkowcYySX3ASuh6S4+ZnBwwDk2bjhsu7D5h7BS96v72XMbivY4KbSL9aDJxR4Bfyhwcka84Q3zqvA3O6vs6a/SfJpojkCXgKUHK0pU2DT4mqx5Nq9bYmqX8R7/Qax+zKUGqMH61pvIAcBbLh0R/QylADxxjF7Vk1t4u/ztEX3PVCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeFhHXcUn8QzX8DuAxhxcA27qps7HWPARRHyB4uGeas=;
 b=Y7BKu3VMinX8R811I1yl8JkipX1igHEzL6A24dE2EXTmoFez2vk21RktS1dz1azlfqRHoXksgvvj6wQcfzOOzePF1ur7D47vtMN0g6sVp7uW+YfRtlpiN0U8bN7KYlwYS9cKR50kOawH/pR3chUVx8gRyve3AyIISl0wNoD5yvK3EtJmvgcSXDEDrD+MxUnICMPYElXzPXVptukyIX8PW6+Zk3eoSXDIERXLyrOKmuin1z3qV95M98ae4eoymWS2aojkWMTUBR2P/GwvG+tAmcy0Xo/9Buh+rPtHr1j7xpA/AABIhUI0nIhs5SnnU6e4hMUG0dZSlrRUYxZGs7Y4vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeFhHXcUn8QzX8DuAxhxcA27qps7HWPARRHyB4uGeas=;
 b=cDzsg0ZLWRT/hwcZUULwYgGFc5f4cNVsKZIujued00nXABJFItAZk4dXAM5384H/bz6+FR8jULEnUtebzR1ROxlgJD8yxwn8DQMa1McpEKSKQ/hmPFSzIXsOuQkPIATT8o4mwnagLXrkGkeKE/9eEh4YeFPC0J6WiGHG1+BS9b0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 May 2022 15:53:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 3/3] common/spinlock: Drop inline from _spin_lock_cb()
Message-ID: <Ynkc0WbLY2be3OKG@Air-de-Roger>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
 <20220509122409.14184-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220509122409.14184-4-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0404.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c7cce90-2553-4c78-cca1-08da31c349f8
X-MS-TrafficTypeDiagnostic: DM5PR03MB2971:EE_
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB2971DD14B03F83AE303B28048FC69@DM5PR03MB2971.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2uhQ9JmHtbORYPqRdUQhh8QUC6dKIjZF8LQX5YBsTjXort8wm0R8moQ/npiyUhlsJxnJ9JgqLDCU6eqNZpz2pDJUdD9cbEJH0QsXp1wBU/rJH9hItbPseD76wEdrE4/Dzc+jRqvQOQGGJu+6hzSx/LzrlKAm8t2XRCrM0KGgZRCxotFo6dKmOVLvrnmX6sQDcNS/iHAZxmH9MNQovsy27asKCXeCSPS1UEnAEBMybMDbD/g4ldUXVCZqnxz4l3NrmxzqCWugOleqOHa3eYL6C8Jw5eO0qrtuSuJI52eSy1vw2JGZthxNXgUx7nIgOclk6Xt0C5E9fpUYicH3YlnC0nn82p9zx55cuWdErmfKdAU3WR01WYNqI6Kiivo8lFhXy/iK0eQdTeB+8bWPR5o01qq/G+eMGsUFPArw6R5yM+ExPzy52J5yd0DTy/ln/0HhTljcRB6U96q9TLx4MC15b54DVqXxIU3ehNJy2dKr2a/ImlVVlvsHTGVVE96JP6UithUzjq5jlOhJODlCFYSJ4QMBhMNxIuZoBKNbcPitcGjddsua7MLG1DtwyytMB1SDuJ5tyiUX/PlzO87f5+RWeIckP1X6KHgJZ9XGhQT9IveU5/VszTOU2uY0ALGszmJ2O9JmUcxQ1XGZ/C6N+JV7zQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(186003)(316002)(85182001)(6506007)(2906002)(54906003)(6636002)(6666004)(26005)(6862004)(66946007)(4326008)(508600001)(66556008)(66476007)(6486002)(5660300002)(8676002)(38100700002)(8936002)(83380400001)(9686003)(6512007)(4744005)(33716001)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjFONzRjc2pQdWM0a21IK3dCdXJkRlRiTnh5WTg4ZEVDL0ZKTy93dkJqWW9M?=
 =?utf-8?B?Q0ZZbWk5djJQMUhjMVFDUElTZHJWTWErUmlTTFlxeFhhL1FzamFmcm4xNTQx?=
 =?utf-8?B?RjhZdVpPazRGRm1Db2JOcU5CN253U05OYlZlcWJmNFhnb2VZQ3dtUVNyZ0o4?=
 =?utf-8?B?WC8yY3Q3VEYzOVFDcDl3bVJzVkl2UTJ5eGI1aUJUbnQ3eUVYalNOaGE1NUkv?=
 =?utf-8?B?UHRBZHRIdlBMMlFncEJmNjVBbDMyR2Jmb2NJRnpCdDdzQnNzTE9sTDRObmw2?=
 =?utf-8?B?SW5zU0huWlNpWWpjaTFHSmk3N2IzR3JhRFYvL044SGNRUm9QcWZZMlpwU2NP?=
 =?utf-8?B?dTNvZWQ2UGs5Y01iaGpIeGYvUFNNMXM4N3FONDBtNVBEYWpJUndEYlFpSEJr?=
 =?utf-8?B?ZFlZREJSb052KzRoM09aSnk4KzhaRHhPWE9IaDZsSCtsZHVhbjRacWtSOEww?=
 =?utf-8?B?Y3doS1o0bXJSdndBeHRZZWZsNnRrYnZnV3hkOCtCRkJ6WVFpcjVNRnRwSis5?=
 =?utf-8?B?WjRCbm5vYnp6aXNQODBsZXg4SU9FSmJteDUyUklhMWNnbktSa1pFczJNUDBo?=
 =?utf-8?B?K2IySk5pZDdxQWt1cy9mMm5PdnA4VXh4dTJUcnhmcllrQnBLWjh3dVF0STlz?=
 =?utf-8?B?ME1ja1g3QVJlSEMxK0todW8rQ3V0ajJpVlM2Y2dVNGM1VnhSSDlyQklIODFB?=
 =?utf-8?B?aGc3S21uV1dYZ1F5eDA0eWxqaUFXYU45bkVENUZOZGhOQ0JQVmtSR2tzVWVw?=
 =?utf-8?B?YUFCaWZwcysvUCt0WHF5Y1FadmZjcFNENks4aUdSSDBDYUgzRGlEZStJbWVJ?=
 =?utf-8?B?anFUVFh5KzN1ZFZoZlJIY2t1WnFKM25vV0RBTmg2SkhlY05uM3ZLSHl5d2x3?=
 =?utf-8?B?MWltcTR0bnIrMzVQanJzVVp4K2liRTB5SzIrRjNMMVlkMU9mVVRvVmNpbTNh?=
 =?utf-8?B?T0ZDNENnZ2liRysrRTkzdEFPMnhPUkEzVHlMclJwTEg3YmovM1owMGJtenJE?=
 =?utf-8?B?TnJUNEZzY1VlVEIwVGxTTi92a1lBb3Y3ZHE4YTRYRjlYQ2RiSCtGcFhQOCtt?=
 =?utf-8?B?VE1qSXd5cHhtMmVyT0R6NnBhSi9sd01Hcmh0TmVqcFJSaS81TVkzN1Y1Z1Qw?=
 =?utf-8?B?SFVuMVFLWHBqdDJFZWd3T3Z1dDlpMkJUdG1STWNTbVpFclo0QkFwalZIUHpm?=
 =?utf-8?B?cmtGWE9USmFyZnRycDVDWjh2djVFQTVBcm5sWi81QXpPMjNFeWlCMkF6ME1G?=
 =?utf-8?B?WXBPeUc1bEpuY0w4VG1SSkR1MDBtTUVqdHMyYWNWa3dTTTFXK0I0cjErZDNZ?=
 =?utf-8?B?bjdmUzdHY2czUzZhMjM3SDJ2WllLUFlWbzNiZzl6VGpxYjZRYlVmMUxlWUhz?=
 =?utf-8?B?T0tWcldZVjBjSmN1Q2tOc1FlQWJZdVJhS29DaFowcVJBeVRTK3lsMzFCRWgv?=
 =?utf-8?B?eEM0aVZTMmJtaFJrQmJ4UVoyYnVHaENtVStTR2JjL0hJekhnSVdqNS91VExU?=
 =?utf-8?B?SzRQMHR6RWRTdnIzUTYzQm80WEwvdDN1dC9lendTSEN4eEtJZms5ZWlBSHdw?=
 =?utf-8?B?NmN5OXpJUjVHSW9Vek4rZFhLOHRkN1dRcTUreXV6ZlZEQnRpWHVLdm9DTE1y?=
 =?utf-8?B?UUthcGVMVndLL2w1SHlKQ3h2akJyaUFsUVRjWkRkV0RoZXh0aVpjcjdmMWhv?=
 =?utf-8?B?aU5yRUJ3aUlSdDZMRzY4RTVtZ1VBamhkckZXOTQweTRBRVpsTHN2SlVCUk1X?=
 =?utf-8?B?UUd1dWl0cFl0TldHYnZ6WFdxNFo2SnR6dTFEVGZDQ2hLV3N2MGNqa3pnSUdk?=
 =?utf-8?B?SitWNHhwdDJmcE1McWF2M0xpMjU2T0MwRGJGRjRhbUZMKzJaM2pqTzNyOEUx?=
 =?utf-8?B?TlBGRndBZ29oTWFPcXkralBxNGZSTFZXeFRHNFArZTdnRkFNRXlDWlVRUFlS?=
 =?utf-8?B?SDdkK0kzMm50NWtYZS91bVdVeWxMTUxDcklsS2VObnFPN2ZIN01FQ2R6bTU4?=
 =?utf-8?B?SHQ4b1BTRVU5aW9pTGlIVUtaRFdjUWp1alZ2YVZHV0k5RkFTQ3d3bjV4aDVz?=
 =?utf-8?B?WHZnMVliS2hFZ2ZnbStMZ1Q0N1BPcUVjYW1RWnduOEViS0plOTdWQTF5bVFU?=
 =?utf-8?B?WXlKQnExbjNPVjJnQ3pNT2xJSzJZejB6Y21lVldGR2JrMnY1anJoMWdOZzlP?=
 =?utf-8?B?anJSbmQ2ZzdtUm03YUZkanVYM3pkQkJDR3Z4aFQ0aUt2ZVFnQ09kUWs1NXdE?=
 =?utf-8?B?ZUlObGhpSnJ3b0NpbU5EdUV3dnczWVZ0K2oxM2I1VndabzR3bUR1VHN1bHdS?=
 =?utf-8?B?d20rQ05RdWlwaUVpOVRSRWVXeGZLT1RPeVYyNVNTaUdvWW9EMktORmpremV0?=
 =?utf-8?Q?tCMmhqSkbj9stsK0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7cce90-2553-4c78-cca1-08da31c349f8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:53:25.7334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fmzudn+pQ8aow4xzqqA54xEgQQMDw5FIFIWJakzBmcIlilDkAMvrtuemSCOEC4VDMoSY66i7tOI3rL4+xFIydQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2971

On Mon, May 09, 2022 at 01:24:09PM +0100, Andrew Cooper wrote:
> This is undefined behaviour, because there is no _spin_lock_cb() in a separate
> translation unit (C11 6.7.4.11).
> 
> Moreover, MISRA prohibits this construct because, in the case where it is well
> defined, the compiler is free to use either implementation and nothing
> prevents the two from being different.

From my reading of the spec, using inline defined function with an
extern declaration could allow the function to be (re)defined in the
scope of a different compilation unit, kind of similar to the usage of
the weak attribute?

> This function has external users, so drop the inline.
> 
> Spotted by Eclair MISRA scanner.

Like wants a:

Fixes: 462090402a ('spinlock: Introduce spin_lock_cb()')

Thanks, Roger.

