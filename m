Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300DC6E655C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 15:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522850.812485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pol2q-0006MF-V0; Tue, 18 Apr 2023 13:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522850.812485; Tue, 18 Apr 2023 13:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pol2q-0006KR-S0; Tue, 18 Apr 2023 13:06:52 +0000
Received: by outflank-mailman (input) for mailman id 522850;
 Tue, 18 Apr 2023 13:06:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUq5=AJ=citrix.com=prvs=465f4c9e2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pol2p-0006KL-0Z
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 13:06:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfb503af-dde9-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 15:06:48 +0200 (CEST)
Received: from mail-bn8nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 09:06:35 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5528.namprd03.prod.outlook.com (2603:10b6:5:2c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:06:33 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 13:06:32 +0000
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
X-Inumbo-ID: dfb503af-dde9-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681823208;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vfbdOvdBTQ1QyuohBhSl2KUhIhJ8XGo8bJ9EKlH/nXk=;
  b=MbEFLVSL0N2e19cFA5vXEdKUN5EPRoNW7Pq1HvPwJzGmqe1NOR9xqSg5
   kgw48ijdEpVEGn5X8BSP2DYsC/9OpPEXxH9A/lS4IskO+gmpqq/YvQqrR
   jFB/Xc23RA7RM3laoWJZMbSDCfDpZ/Mvm90Ov6WhgdDpZF+XnkHFaQNo6
   A=;
X-IronPort-RemoteIP: 104.47.74.46
X-IronPort-MID: 105853709
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1TBGiKlvJMt4pO5FFbLXgxfo5gynJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNWj3XM/mPMGagL9wga4Wy90JXusfSyYdjHgNqqS81FCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5Q+GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cYFMnMRVCiuvfro5LiUdOZLh5hzAvC+aevzulk4pd3YJdAPZMifBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1A3jOaF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxX6rBdlNTOzQGvhCiUyxzU8IGh8sURiEm+KHgR+SSt8cE
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9URX5NkcHbC4ACAEDs9/qpdlvigqVFoo9VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTzsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:cjYpn64geWZ1Dte8xAPXwPPXdLJyesId70hD6qkRc20tTiX8ra
 uTdZsgpHjJYVoqKRIdcKm7WJVoIkmsk6Kdg7N9AV7KZmCP0ldASrsSj7cKqAeQfxEWmNQtsJ
 uIRJITNDQgNzlHZZeT2meF+4hJ+ra6zJw=
X-Talos-CUID: =?us-ascii?q?9a23=3AoXBXuGjQq90j4huhyz6jSyLR+zJuSGDHj2vqG2K?=
 =?us-ascii?q?CEThNQpKrRniRpPNKqp87?=
X-Talos-MUID: 9a23:BsNuMwSNvM0WALvlRXTllRNpF9x64Z6qS383iqsN6uWVOG9JbmI=
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="105853709"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRVtbJuaJp9/S2y/nmRHpvyIfnI1R5DFgzahlILFVX+6JQa40mXUNVj50XvOhwrIqmKCM3nsjObLr0qSbtx4ApZpkuLCDKyqpHa+J6chaz8B4Q10j3oFyG+2a/yGOEAB3xOKULIdfTyqx9wGOAu6Z/prtjlkwfZXZXsas25dWPlZVdFly+eDR4Z82BYHw/3eDcyUuDdl4smVkb4fWKS59+R4P+OTClegiHopY4nnKrRWDRwp9TPZ7TY9K9XOspq5Hspdt+rJ0NpGt7hYKDP+yM6fjvci6n51YaUGVCXLpOyrR+J5/FJ30oOc18HJNgI1FMrFN6qfRgw4I6sgfR4+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKRKTIdcqwDDA0HCTO2pA69812HWzmrY+qeBp1Pmt4U=;
 b=c1wtAqCJlLfQ7PSvfsxumzjy1sva1azmhUUcWQo0uad9O/C6rTZynTwOWj6aU6EmAi8ELxEqUS32QSwylBIM3JgxRzQvZoUjrKG6Z1grQW59RgdV60CxzcvV7pE147MbmZeCBk8seISsxwM3EnOR0g5a7f8TbT63nP81dOMNK0/JaiLG7KSPeo0YjeYESYrK+1153QqCaO06wUPBRVCFe9dGCL30xuVf6YeP8W+VlBhwytSizk9w8y6n8WRYrb4mfFJocUO+KMmlTQT5WzIT48eoCta+RUQpxB+Jq9AEV3lLgyEhyafQOEyXOsTcLwjko2TNMdzhocA2x/LsWhPK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKRKTIdcqwDDA0HCTO2pA69812HWzmrY+qeBp1Pmt4U=;
 b=sSB47TCJo6Lx0/pk4CM+/uRkBvd5xVzHAdDGTctsWv/u7mHgjNAaXP0QM85Cew8kzhQDcrhm4G5z+MTEpXH2MKIkK6+yl2aZbVgyLrtozt0vM1zX65sQDD3WdRSwh+b42CdM5CEdj3r32Tl6euPCt4MAlHp/mJTNCf6nRNvHkv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 18 Apr 2023 15:06:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Message-ID: <ZD6V0wzw/VS/MMw/@Air-de-Roger>
References: <20230418092458.15253-1-roger.pau@citrix.com>
 <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
X-ClientProxiedBy: LO4P123CA0552.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5528:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec97f29-5e48-4750-4234-08db400dbb62
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xkx5A6f77MxAOwXtX39keVEHOC3dZ78bCVXeVwJdXJYyJTR114XbgAeV6VVXbQOHC95K/XkGRNBMNCrpQ24QGf/St94C+Cf838FD/AbYa3BSThlyBY3vRodos4w+9zyLVT8E4hX61oSGQeyL+IErhgG/m/jj4Qgi622wewuPwomSspkGMFemyrX7u8WSlNVl3JsBSgNwbi7z3m+7whNEw3DtP+0RcB9Rr6vzS8gocUoKsQqjmjHSqZU7fMYIjFSM2aoCcl7y7qCKABIlTUAhkq2N83fcx4LOBsmRHXzKg6xqeD+DKgqrdYoOVET93D2N9kZ+waOkhCAusrdVEvoBkM/7aABhG9Zfi/djVsnjBIrI0jVN9YCmAgWc37SXhqYhNrk9WcrS/dV6tI8NLCpMspfA58I48+768f/GBwl2m+cQvM8EuHXuSaC0bGmhARnguMvwZ+ri4TnityzoavqwpOfyADhby1RqAkLfwrLLzpYiKgaC78vlALq+X9e/l+WWDN59xnB3MzxtQt3Z+M9UvybwWXeegRm0/sSGtVKz8ibq0HZevuQGuSUbgda3Opqa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(66899021)(38100700002)(8936002)(8676002)(5660300002)(2906002)(85182001)(33716001)(86362001)(478600001)(6486002)(6666004)(54906003)(186003)(9686003)(6512007)(66946007)(53546011)(6506007)(66476007)(26005)(41300700001)(82960400001)(316002)(83380400001)(6916009)(4326008)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm0rOCsyZnIveHFyMHduOGdEcG5RY3g1cjlZSnc0WWZhMUQ3ZWsvakp4SG9l?=
 =?utf-8?B?L0RMenNmS1psbXdSbkI0dTY3OXpIbXRaNVI0UC90RzVQeUQyREdob2ZnR25Y?=
 =?utf-8?B?R0Y3NjN6SEJwRW8zb0JKZ29UVS96c1dpd2FyOG5JMVQ4ZCszbTJXMkNEUDl5?=
 =?utf-8?B?alh0OGE2SHFsR2ZFYkgwYmhZK0drTGJ4V0FsR1pvWExXcS8wNWp6WkhtOHRo?=
 =?utf-8?B?WVBkSnNzVXYzRUJJd3c3Z3JoMm12WE9qaWl6RHFvSko0bXBuYmJERk9VRHNs?=
 =?utf-8?B?Wkg1eUVFMDdIbXFyZDdPTGpZaUpaTWJLZE9pcUgrYXhSaXI5eTl2WUVsa205?=
 =?utf-8?B?QkgrTDdqSW5aUlluTXg2Mi9IeDVhMDFTMDlLNXl6bXE1R3A5cjRGSWJhNXFU?=
 =?utf-8?B?bmwyS0RZQlUweSt2d2R6NXFoOVZyZHJiSmJLSTVhbGZ6eFBPNFNuWVdoVTFV?=
 =?utf-8?B?MU42MlZiektqRXpKWCswSllsL2QrQ3lIMUFOK05teW9TcEx1cVBHNGczSjJ5?=
 =?utf-8?B?MzdQS1J4WkcyRE55VGRqajkvWjk0QjlrbXd4cXYxdDgwekxvT09Mam5rY090?=
 =?utf-8?B?dVBIU1gxSXdjaldhK3FPcVBhZDNwdHFkcUJVU0w4enMzZXp4aEV2VDJQWXhP?=
 =?utf-8?B?U05jUGszZW9lUytadEpGMG1lOGhRTGxCU0RsbFU4SHJMWDdSeTZlM0ViQnFU?=
 =?utf-8?B?TEdzUk9iRndJYjc1cjVkbTNLZld1Qi9CNkxwSDByZmJMZTlVUnFNbjRmTitx?=
 =?utf-8?B?N3N3QkVRMHJjS3hZRWh0VHphZk1SZFlyZkEzM1pQWDVjQmllS1BOQ0xaNjBD?=
 =?utf-8?B?SU5OTFlHdVRUM1IvYVZaSEVkU1V6Q3g0RTdNR01pNGlOSGpreWVMa2ZwQjBH?=
 =?utf-8?B?WHEyOEFRYzZkOXNxR1VJWU1QYWcwckQwdktnS0dJTlYwTGwwcUhhcjRSbk5p?=
 =?utf-8?B?UGh1WkF3OUNBalYxZm9KRTZYcDEraDdXQ3FzZExsWVZ2R0loTG1BbFc5VTMv?=
 =?utf-8?B?eFRJY0hvOE11Z21sNERlOU1MZnBJUkNxUHN3SkM1enowU0pLOUJoQnlIWlht?=
 =?utf-8?B?M0Q1dVZBM3NKdDBYQ3dmd1pMWld6SUhqd1JxeGFjTHVsVFdHTEsyZXFVdzlS?=
 =?utf-8?B?WDk3alVFWjZvdjZxZkdkMEtGNVI5K0kyRDJjeG5kamUzU3dJQWVwaHBnN2hR?=
 =?utf-8?B?UmQyV0ovd0dPQjZhUG1IWTdrQW1YbWhXWWZzVUhVMlFuZVR0OTFwNWdoemVD?=
 =?utf-8?B?eTYxYU4vOWhEL0lFOGNFM1R3YzkyU0tGd2N6L01POFpKZXFSNkJSc1VBWWxh?=
 =?utf-8?B?cjZYQW9ueVZXOG1LNGE2NDNZMWJaaUpxTFpsRUdUQndyV0EvRUxlbFVzQ1pR?=
 =?utf-8?B?cnp4SGdmVzVCc3dIU3RxMWpqRDJUODJxZ094alVjcGRIMmtiR2RoZjVnVVNm?=
 =?utf-8?B?RGVHUTdlb0RTb0lEMXJLRG9KRE43TnpNNmsxdVlKVG1TSGMwcDNBZEpHWm9i?=
 =?utf-8?B?b3ZOYTd6WGQ5OXRYTi9WbGRUUGZjamQvYXg3ZUlQejlYdzEydnRKeGFxSVY2?=
 =?utf-8?B?eXNVQTZiQmJ0SU1JRXY5b25sbVFFMCsrU0Z5Q2RETTBJQ1FUL2s3TWo5cWk1?=
 =?utf-8?B?QkFCKzhDNm40SzFoRmtqcFJGNGtPODJ5bXZ6a2grdXdWd3RnZEhVOGo5Kzd3?=
 =?utf-8?B?N1FQamNvdkNlc1hqaWJ5QTgwQVJxMXZza3lqQ3FBWVN0eEhwOHh6MHFPalcz?=
 =?utf-8?B?a01YUmVDY1JXUzFucjdrRnBiUUE1ak9UcXFMVmFVSGJwTEkzUkQ1Tm82WFY4?=
 =?utf-8?B?V1VyNk9sMFVUMU1VWklOcnFkWm42eDVMQS9pK2VicUJPWi9QbTU5NURLMFJ5?=
 =?utf-8?B?RVVrZUR2UjRtbzFCVnR0eFlNcVBWSm1GdTJlTCt3bXN6cmtNQlk5Z3A2R2NG?=
 =?utf-8?B?Z0tqZVRmRmlTcDRjNlFnbXk5T3FGTHpMaitUaGF0a3ZiSURWa1cvZTBGZWdS?=
 =?utf-8?B?V0dya3hKb3NwejY1Q1ZzekkwdXJoaHBMVEpYSWxXdmNxbnZBSy95WVQ1M253?=
 =?utf-8?B?TWxEWkN3bHRsNVFZdCtWUXFVeWJIczQzZU42V2EwOFFCQjBFZ2c4d1h6L2xx?=
 =?utf-8?Q?8S8LSSW8D/93sXa7ysiLqP5yd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YTQKA08kFwEw37aLVoo6Shroj92esiodwQKjflHR40zdnV0lcO6AjlFv6/SVDG5w18+RZslYiGp0QY5SbDEUlq/g749NCxF+YmOABmpial8KeF1LnbNxqDSi8QkgumdVPbPqLqqv4B1WBu7UgWIoysBc/qewZzzfrtvXB3eedqMCxh6dZaGMww400bC6zpvHDs6QP4gOa0c6LoS9SlX/ZYbdezapH+0tb+kfjYKiSB0ND+ze1a6pIBO04lVXObbW7Wm58bDJ+DsKRcOZ2L6c7uc+Kbo8JjM8BtTYEnsUBO/bL/VBGFYt5GSynxdsff9pA8K7dedGf8fb278r0k/xz8PqdYMRdUKvNqWcwcsWjxw0POHOTsGZM1LuZbJ4eejJrfH1TNzfvxAf+f7b54v6g0HI4n1lsuqZ+AQkhD+x1AxRwF/cWmV3/abEm62xVJdA91PAJVu31dRlcT0KVcQx7N5BG52bDKwYPhZNkYOhs4RW7eR8hdyDW9q4NSodi3jRHi6NlhGL3EmaMF1Z0LHD/Q84r0nf5KJU2e7m8GzXattt+25jb8L/42fXJCReTxdD+8AkbFVLPDPMVdWITWMKVu6YjiNdAYJN3VSRl6URTnSVqZ6Q4391UhBXB5bJgI8Ss84rIXxNHsV8tYdxludMFpxzGF8ddgp7syCv54Mhn+oDBqwQtiPxYfIW0+fTxl0n3p6InqOL8nqLRrePyr4eRLvN4hkCMrPAafjwuZvJSSQFeuxfQkNrPxOmu4FvsbKgmitYoxC7zGzCIBQU9ck9d3NDjoJYsQk28MvZg6MZfsImKts/4uRPtci8w3fITGpk
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec97f29-5e48-4750-4234-08db400dbb62
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 13:06:32.8948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDsgRylornKOUy/LUKK7hx1RpH5aGxnyaoLz/RQm4sI838pNf5DE7bRmTiFwU2C5UWSVM1Rza3bjxP9z81Qw8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5528

On Tue, Apr 18, 2023 at 01:00:53PM +0200, Jan Beulich wrote:
> On 18.04.2023 11:24, Roger Pau Monne wrote:
> > Some of the assembly entry points cannot be safely patched until it's
> > safe to use jmp, as livepatch can replace a whole block with a jmp to
> > a new address, and that won't be safe until speculative mitigations
> > have been applied.
> 
> Isn't the issue only with indirect JMP, whereas livepatch uses only
> direct ones?

Oh, I see, livepatch uses a relative JMP, so that's not affected.

> > --- a/xen/arch/x86/include/asm/config.h
> > +++ b/xen/arch/x86/include/asm/config.h
> > @@ -44,6 +44,20 @@
> >  /* Linkage for x86 */
> >  #ifdef __ASSEMBLY__
> >  #define ALIGN .align 16,0x90
> > +#ifdef CONFIG_LIVEPATCH
> > +#define START_LP(name)                          \
> > +  jmp name;                                     \
> > +  .pushsection .text.name, "ax", @progbits;     \
> 
> In how far is livepatch susceptible to two .text.* sections of the same
> name? This can result here and perhaps also for static C functions.

This is all fine, as long as they are not in the same translation
unit.  Livepatch creation operates against object files, so as long as
there are no section names clashes in a translation unit it should be
able to deal with it.

> > +  name:
> > +#define END_LP(name)                            \
> > +  .size name, . - name;                         \
> > +  .type name, @function;                        \
> > +  .popsection
> > +#else
> > +#define START_LP(name)                          \
> > +  name:
> > +#define END_LP(name)
> > +#endif
> >  #define ENTRY(name)                             \
> >    .globl name;                                  \
> >    ALIGN;                                        \
> 
> Do these really need to go into config.h, instead of e.g. asm_defns.h?

I've just put them together to the ENTRY() macros, but yes, I see no
reason to not move them to asm{_,-}defns.h.

> I'd prefer if stuff like this was moved out of here, rather than more
> things accumulating. (Perhaps these also would better be assembler
> macros, in which case asm-defns.h might be the place to put them, but I
> guess that's fairly much a matter of taste.)
> 
> Couldn't END_LP() set type and size unconditionally? (But see also
> below.)

I see, so that we could also use it for debug purposes.  I guess at
that point it might be better to use {START,END}_FUNC() to note that
the macros also have an effect beyond that of livepatching.

Maybe also introduce a START_ENTRY() that replaces ENTRY()?  Albeit I
find START_ENTRY a weird name.

> > --- a/xen/arch/x86/x86_64/entry.S
> > +++ b/xen/arch/x86/x86_64/entry.S
> > @@ -660,7 +660,7 @@ ENTRY(early_page_fault)
> >  
> >          ALIGN
> >  /* No special register assumptions. */
> > -restore_all_xen:
> > +START_LP(restore_all_xen)
> >          /*
> >           * Check whether we need to switch to the per-CPU page tables, in
> >           * case we return to late PV exit code (from an NMI or #MC).
> > @@ -677,6 +677,7 @@ UNLIKELY_END(exit_cr3)
> >  
> >          RESTORE_ALL adj=8
> >          iretq
> > +END_LP(restore_all_xen)
> 
> While I'm fine with this conversion, ...

So I take that overall you would agree to adding this extra
information using a pair of macros similar to the proposed ones.

> >  ENTRY(common_interrupt)
> >          ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
> > @@ -687,6 +688,7 @@ ENTRY(common_interrupt)
> >          SPEC_CTRL_ENTRY_FROM_INTR /* Req: %rsp=regs, %r14=end, %rdx=0, Clob: acd */
> >          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
> >  
> > +START_LP(common_interrupt_lp)
> >          mov   STACK_CPUINFO_FIELD(xen_cr3)(%r14), %rcx
> >          mov   STACK_CPUINFO_FIELD(use_pv_cr3)(%r14), %bl
> >          mov   %rcx, %r15
> > @@ -707,6 +709,7 @@ ENTRY(common_interrupt)
> >          mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
> >          mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
> >          jmp ret_from_intr
> > +END_LP(common_interrupt_lp)
> 
> ... this one's odd, as it doesn't cover the entire "function". How would
> you envision we sensibly add ELF metadata also for common_interrupt?

That was done as to avoid patching the first part of the function that
does the speculative mitigations, but since the jmp introduced by
livepatch is a relative one we are safe and could indeed patch the
whole function.

Thanks, Roger.

