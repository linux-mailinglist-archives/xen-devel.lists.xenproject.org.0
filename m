Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9D8756036
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 12:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564356.881820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLLHZ-0001sX-HG; Mon, 17 Jul 2023 10:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564356.881820; Mon, 17 Jul 2023 10:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLLHZ-0001q7-CG; Mon, 17 Jul 2023 10:16:45 +0000
Received: by outflank-mailman (input) for mailman id 564356;
 Mon, 17 Jul 2023 10:16:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVQe=DD=citrix.com=prvs=555fa4c0e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLLHY-0001q1-2x
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 10:16:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 045fa6fb-248b-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 12:16:40 +0200 (CEST)
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jul 2023 06:16:33 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO1PR03MB5857.namprd03.prod.outlook.com (2603:10b6:303:90::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 10:16:31 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 10:16:30 +0000
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
X-Inumbo-ID: 045fa6fb-248b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689589000;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FKIdwi7Mznb5kJhfPdGX/6j5F60Vc18pRJIq8/EP2KY=;
  b=dSfKiYK0NjwdqI80ArIKUJK2ECVlLAKa1zdoItSW5ulJZhKNFf19p1cC
   R0S35DF20BWVN1ssCzz+QjSBSbHifY+sPfKp3GFUgD2ub6z4sA2W8l8hS
   QrNT3mfl7D/+JeucCxwWBL5nfOaC4YoX+RwoWhlPXTrVTRrP4AR7qMKFH
   g=;
X-IronPort-RemoteIP: 104.47.58.107
X-IronPort-MID: 115734601
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QAdJLq8wKc2OloHJiugGDrUDcn+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GdJDTvTa/rYMWugfN0jOozl8xwAucKDydVnS1dkqiw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqkU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl1s
 tFbdjAtcCutqP2kmrakVs1znIcseZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpj9ABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWwHygBNxKTdVU8NZPsn+p1nUOBSEVRFm1jd6Qqnblevhmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaETMUKGgEaGkORA8B6sPipqk5kx3UQ9BsVqWyi7XdFjD5x
 TSXpyF4g6gLhNQK0aST903ImD+qqd7CSQtdzh7MQmuv4wd9ZYikT4+l817W6bBHNonxc7Wal
 H0Nmszb4OVQC5iIzXSJWL9URO7v4OuZOjrBh1IpB4Mm6zmm53+ke8ZX/S16I0BqdM0DfFcFf
 XPuhO+Y37cLVFPCUEO9S9vZ5xgCpUQ4KenYaw==
IronPort-HdrOrdr: A9a23:/3BqUaORhm7IoMBcTs+jsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ6VBbAnwYz+wyDxXw3Sn9QtsZ
 uIqpIOauHNMQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AUPHKXmpTqzbyi/XXF9lYiQzmUftiXz6DzFfOGGG?=
 =?us-ascii?q?XFnQzTKKJbUCKu6wxxg=3D=3D?=
X-Talos-MUID: 9a23:1dorngnLLVmYPyS4N387dnpHBuVS872zBXwOgJcIl+6tFRQrGh2k2WE=
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="115734601"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPprn5MzpuBvE00G+VXisfHhKGXpTJwMgAqkMGWfbTZkwwmfQtYTe2+7JLBECSziAfPe1tTZYjK6ziWMHZcKp1OSSYdZlZiz6rjT0UGM1wE4s7ym2/ZOEk3IjkR+u2AGA0ntDLoE178HFDN1zDMoyzTSyoTdWMLrcQh4crGj72pWyFriZFBdd4hZCu28lq+ZNrkV/DnWA6C1Sv1b+GNkgBhIdrW7nR6u+I6BV/oQtnnCu1euNTC8FYZkr3NX0n+IiO0n7V0RfZIuYMPLRhX2nlODOWmTFQVwtbKUTAo2QtSYzEaYobOSBadZM/7uJWDClAabD4mxtjNMbuH9U8gArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAPNmYDbUikkdB1HPtR4tT6fJefwLIm8/v7oqFdwqCo=;
 b=QOk/KoE7y36VYOLgwtGWL3TPaUeQix7IhYeC1q2I2AtBTIgKeiLybrTieBudC333DvaqFXw30ac6ggW3ripF2mhmIfWcIA9KAQt8G+G7d3sfJDyo2pHGGCNE1Iqo0BF89CkxlAQGylKElM/+3kFf7vpIfy4pG0m0yvERLJe5MRdgrQZ/p6P2S4zerutAhfhAwzS0tJ+ZU1NV+H1LUD3vaMNzep0Tv5zRLYSkfu2K/ynNmDcKMD4/uGaCsqrhJdmsRCkUpAxUUZgJfFIqASloSmKW40CXZhcIW+AHChNhiX1tHRj2C1ncjl8FK3A7q0SNLgmZ25rb9hNks15zwsbAdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAPNmYDbUikkdB1HPtR4tT6fJefwLIm8/v7oqFdwqCo=;
 b=ghmeNu9lbLIoNS0Y/fYUcHBRVXmrCtY/7J8GAD+W/XMX2VAZBMVAg/vrC8uCoTVS7tSG8F5kENGiAOqElzW0Y2vpVVVhVB9ZVoMYivn6WusezzAgutFKefePl7wvIhAOijOMb2ZOpOXYX95S89cHOLudYjD9uiCleNgMgjqkwO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Jul 2023 12:16:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/ACPI: correct off-by-1 in SGI MMCFG check
Message-ID: <ZLUU-EGVwWDcejv6@MacBook-Air-de-Roger.local>
References: <93646ba2-ca84-755d-290b-d7470827ef46@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93646ba2-ca84-755d-290b-d7470827ef46@suse.com>
X-ClientProxiedBy: LO4P123CA0500.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO1PR03MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6fb422-08d3-492d-684b-08db86aee391
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VeucMVMMorJMPeBaIx4T/Hn2MLBH6zmpoRrnGw7nKhNhKLafjzRtwR175x1TyAmE9HL2BXYf/gWQrFXLwzkL4o1b0IeZxhRdV2veaiupMddPARaS05P5rY95Dz/3uUmSH2eSW6QGmWBeThbVfdQwuxFnBFCeUkCyHG7Vftg1saaB03bFBsxNFjs798nO7cW3Mns0grt3EpZeuWZBraC417+Xl9CU5EiI3mitdqMbJUtmpgckoSvg24e6LHPvjIJL3OEuDXRf7oLTbGqnmZpwRTFnKvYjSmF51avWMNr1uartB70cYpuayCR472uyO6mc5r3V4rfjBJ+HntvBBsuqI6g44tHCugHO1kgkT2UNVFvxIV3JrJlSSREg7JDhyx7o3JnZEgVzz0fBVzjsucPMyACnHirLWjpHUSliZ6k42hfn0xrrEaOUvye+Gk3othVoJ+ydEV2axE5x2dZMY51Dcuq77wUN2Hy8kA5v6WNLZ64p3mngA+ym5c8x00uLnROXIHwV+oxAt5oNP7NAi806fxH750Whmp+Ju0o9nhn/gJ69OlpEx3UJLFr+ZrSycayK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199021)(54906003)(82960400001)(38100700002)(6666004)(6486002)(41300700001)(478600001)(5660300002)(8676002)(8936002)(66946007)(66556008)(66476007)(6916009)(316002)(4326008)(186003)(6512007)(9686003)(6506007)(26005)(86362001)(85182001)(4744005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUlnd0ZKRTkwNFE5WjRFdUN4MTcxVHpLZ1pWSjhkV2ZnWmZLTjB1Zm5NQU8x?=
 =?utf-8?B?SEd6UHdBSFNKdUplZVVsakZOL2pDc0hYZUNXWmM3SkNlaHpLWEtYMWIrdFM5?=
 =?utf-8?B?NWFmeFNuZUljRzJhaDZ2cER0VFJxUmtQQm1UNkcrcktsOS9DaUVrLzl1OEhO?=
 =?utf-8?B?STFJRHNzNnkvYkNxMy9iRTdyazM2YU4vSGJQMTFMenZ6ZXpLL1kyamZYdGZK?=
 =?utf-8?B?clF3b1Vyd2Q3RGd0aENlTGhRekJxeVJMME9GQUdrWGFnWk5TZDBhdG9WamhV?=
 =?utf-8?B?ZlVPOHY5Y2JYYjVhTUorYmVxVWpOWE5SVy91Z0xkVjVqcEZBdXl5dUJ5R2x3?=
 =?utf-8?B?Qk1YaXdxN0pjSStRN2NiYmUwRTk0OU9sUGs3VWNHL0wxb1BGSWlKQU8wQkRu?=
 =?utf-8?B?UEhlekRkVklBUjFFazNkeUcvdVY5bmNVUGd4alFPL3VIMm16UzAyTWNvVm0r?=
 =?utf-8?B?SGdNYmZXQWd5VFhkRzB5QUxjeGVCRDV3ZUJvMjlmd1FBTjB5dzRrZFFjd3B6?=
 =?utf-8?B?dVhieDlRVzlISjRjSVFzbWlNa25HS1U4MnR6RUQ2Nk9tZEJyKzBwNCtabUYz?=
 =?utf-8?B?K1p4TkFxVlJ5dEVZZ3ZFajZCeGMvb0ZvbTYyUzE3VFl4RUJkOTNPVGVCTEtr?=
 =?utf-8?B?dmw0QVRIOWlUVnkwRnIwZ1dXQnlnUE05WmoxMjdTQUNPSjV6R3BYSDY2Wjdi?=
 =?utf-8?B?dG9mWDdjb1hGTWhxYzFEayt3aFNkYlVFVDVhVGQ5TjhVUEplSEtPMk5sOE1C?=
 =?utf-8?B?SGhmaHlWNS8xdTRCYXcvamJpR2x6cFloNGRwSEdRWjgrNTBLMUxUZE1CVmhu?=
 =?utf-8?B?a1JUSklQRERYVUZpMlpSQnNUemVzZkNwTGxQODZkQ042MkhaRm5ZUUtqUlov?=
 =?utf-8?B?b1NTYWhab1VrTG52c1FialhPbWFScTIxbHI3OERyTnBzSm1jdjRReSswdG5Z?=
 =?utf-8?B?R2FoTlk2SmdBVUFweEg1Rml2R1lBZzNUb2FTRDcvYXVlOTN0OHpKY2M4UGpK?=
 =?utf-8?B?Ykt3b2ZsSXAySDF5NDFGR2Q2QXRTTE5URU1zS0xNNDBZRVJ4K00rZ3JPNTV2?=
 =?utf-8?B?OGx3QjlwR1cvZHd4dGVnWlJJT3cvdkJvNHM0eFM3MS9iUUdoQ2p3eHFreEw3?=
 =?utf-8?B?eUd2K3lMRHlJaHhOVGIvekNpaWVsVDZsTjFYUWYyMW9PcHVTdGNWelF1enJm?=
 =?utf-8?B?aFBiYzBNQXpVRUlPRFFiSWYzZjZaMFFITWZTVThNYUltUnJhY0NrR3VIY3dX?=
 =?utf-8?B?dlJBaW5SaVJ5c2tnZHZqOVd6T1JNbmRDRndwQXEzWWhLVjQ0WEEybDR5OXgz?=
 =?utf-8?B?K3ZzMjB3V214VDV4cVFQT2ZHckVTeFhtdDkrbTgyazZEU0dIUmVrbFBtZHNQ?=
 =?utf-8?B?NTVvRzQrVFd5QS9RR0R0VU04MUNacW5PWTVFbS9aTUdUQllxMjZ2aFBnQjBM?=
 =?utf-8?B?M2pJblh6VE9ZM3NWOEx5MFRFc1N6Mm4rVjJiajErOVJaeEdYL1FCYXd0WkVZ?=
 =?utf-8?B?S1JiQ1BnNU9CS3RnM2FCRUZIUmEvV2w2Q0RxYUVDZ1lWU0hya0ZJQU1sWUF2?=
 =?utf-8?B?dHVkOVJPaTZYRVh4aWh2OEVEbXRjU2dFZExLSzIvM1E4YUFFdWFUaE9RcDJC?=
 =?utf-8?B?ci80eXhIbnBJV2o4K0E1bzI2WjlKSWRCUDhCOWlNN3VyUGs1bjNCUkhJSmdH?=
 =?utf-8?B?Zk5yV09RK0tBVklMVmFTTjNkeWhWYjc5a3pqVU96V0o0bXdjazJyUlM1VU1y?=
 =?utf-8?B?dFJHWGV2UUs1VXgzV3I0WVN0RVNKWmpjMWFDYkdWTlVmSnFpaXh4YU1kd2hZ?=
 =?utf-8?B?ZTVEQkpDNE95V2ljbklHTVNldE01ZEJoa0dQT0Y3S2o0eE8wRXFWb1Q5eUw0?=
 =?utf-8?B?dzhYOHNpRmVzcDMvalNxWDEyalJOVGFsa2tqbTlQT3lFVm1weHNEckRKMzlC?=
 =?utf-8?B?SGlqdEwyL05IeGgxWG5xSFBTNEkvVmZXdzBCME5ZSWltejZMMGdwYktLc3hH?=
 =?utf-8?B?YmpiM3pQRU1odGYxSjQrNXFSK0lrc2syTXJPRG11YkF1WWk2SmhRc3dzWGJn?=
 =?utf-8?B?S0tUK2dIbVAyNnpScnc5dUhGb3lvSkt6REVEZUdNaElOUTZHeDRKbUEzY09H?=
 =?utf-8?Q?W7fZD9ZniJaLxlxfCbe8nwgcK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vcdQzpDe2mUr813OZ/qonFI2pZV59sks+z1/cOrQjLp+v6OQA/cWOWYhfXWV6a7YGtIrlKTtkl7vxW7Q/JeRFzcV0ITH7TpKOxcWqpAdNtbvikRsqZIibc9HLkDcbtkR263cFe0jjqffDie5cCFoMvdEuLeNfT6vxfel9SKKtoLmzpWmjNwsLTtO7rmCIzwSnS0AcYIxPb3lT2+kqBbN+zVR0tcIW3SUKsgVjn3JG4OE3XxRntSG8e76sLzI/DlUTwi0tsUIl1soXsaGXTT9Dc+GLNCP6CxREzbWYfAlL8oapbY7GyO0/YlR2qAZn36HV07V8KaVD0WzErJ5je6/lIza5c75ktHD7CTuC33EAfsrWFomr13FQEO6k5IIS9WzJKLCZgAOJ/zHbNPwMI3sAaQgdnVITVxuF61Cq9qDQDejJAbG+ReYzeTMY7TuoFT27m4hSz7mIZL8QtixStl/l0R8Dc750hfoj472RkUtYDl731aLKWiBuPDeHnfTNXRsDrVjQ61R9MJ6R5XHoS7eAKzKOpTQR4QvBHJUpBG7n+Rk8vqrid1jx6TcOBL2KKyeoPM7aE0nGkNJTLFPDFnvTdd5urZGpFG+4e9tU1yu5dPB5GE7r49yq8VF63kjs+cszvtuP3tpCn+ZPdzrg63sE0QEktulgVYL4ycdfPAmIRyBc4cYDlRBLpgG2QR6a3qraPvakvRTDCsy33QXKgxcSLQoezTdSDxyJV1AIN9bfoTpLIykknfY/qro7AUMsgiLJ5LLpNP/yUnPXcEbG+cS2lDz0wabED9g3aNh5pY2YwSzpxAvGK/V+zAfrNuYv+3TXqvka6P2fX1EvqakBQWuwdiX8pwBL17RLQmPgcQKN1vEz6gMswqbHm5iBC66Ofo7
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6fb422-08d3-492d-684b-08db86aee391
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 10:16:30.5026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8vLJel/0/9a9vqKd3JPjP2rjZBjNYze5nqelgO10NhIV5gpzgwYTYBGKwwWflzN38ofuvox1st7SQrZPttQJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5857

On Mon, Jul 17, 2023 at 11:43:28AM +0200, Jan Beulich wrote:
> As supported by the printk() (deliberately made visible in context by
> also correcting a mis-indented return statement), "above 4GiB" is meant
> here. Avoid comparison with a constant to "escape" Misra rule 7.2
> complaints. (Note however that even up-to-date Linux, which is where we
> "inherited" this code from, still uses the very same off-by-1 check.)
> 
> Fixes: 94ea0622c5b8 ("x86-64/mmcfg: relax base address restriction")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I wonder how relevant those checks are anymore, TBH I would be
quite tempted to just drop all this.

Thanks, Roger.

