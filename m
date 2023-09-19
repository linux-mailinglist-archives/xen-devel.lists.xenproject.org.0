Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BE07A5C92
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 10:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604466.941854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiW8z-0002ge-LJ; Tue, 19 Sep 2023 08:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604466.941854; Tue, 19 Sep 2023 08:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiW8z-0002dk-IW; Tue, 19 Sep 2023 08:31:41 +0000
Received: by outflank-mailman (input) for mailman id 604466;
 Tue, 19 Sep 2023 08:31:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezs9=FD=citrix.com=prvs=619432e5c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qiW8x-0002de-LI
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 08:31:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f157d285-56c6-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 10:31:37 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2023 04:31:25 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB5449.namprd03.prod.outlook.com (2603:10b6:806:bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 08:31:23 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 08:31:23 +0000
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
X-Inumbo-ID: f157d285-56c6-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695112297;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gi1JTXRA9rmBGvhQl0IE3e0CMwy1ZB+ZR+Ko/Ee2QbY=;
  b=aSQAxnvhWMxrsIoHGCPa0A//PxPnAxHhK6yk7+JS1xg2wQwjYXS46euP
   jgK5OMWG2w7vqt2DFmfXgZdwkhbN+vttrLNgqyn+7FJpafjBpw61XhaXm
   eWKJYfNUQxPr8qnAiTnxOihs8lQc8/+2w/DbcaqGUoRMp7ZOhvIV57KLc
   Y=;
X-CSE-ConnectionGUID: ZS/f9KO5SnyNu/Jni0cv2Q==
X-CSE-MsgGUID: /ySHSVfqSZSOY07nfqinkw==
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 121711759
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:2toQGqo7vM3hZO949JxLKSLRIz1eBmInZBIvgKrLsJaIsI4StFCzt
 garIBnQPfqLZ2X9L95waIS390IEu8DVytQ1S1Fo+CFjQnhEpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5wePzihNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAI2KR7SpMXr+7SqbPQrpMIidML1ZrpK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIa9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAttNTeTnq68CbFu7gX0oKCYoW0KAk8KeuxbhXdxGK
 koX5X97xUQ13AnxJjXnZDW2rXKJpB8XXJxLHvcz5gCLy4Le/gmCC24LCDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcJYikfUA8Z4t/siIsugQnCSNklG6mw5uAZAhn1y
 jGO6S0h3bMaiJdR073hpQybxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTUKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:rqn19K9TtgwG2XgkjLZuk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-Talos-CUID: 9a23:U/gZEGykVPxmT49xsjb4BgUmIYcrI176kUzWMmmlTkRvSeWeVwWprfY=
X-Talos-MUID: 9a23:M7138AgTy4jXhIgEdUA/y8Mpc9ZTw5+QBlk2o64hipHbMyJpOjGek2Hi
X-IronPort-AV: E=Sophos;i="6.02,159,1688443200"; 
   d="scan'208";a="121711759"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuskropNnC/foeiKhc/6BXWk83n2VfbP2SQqq64UQEJ2QPOBYsaEvcvq+QjXDjdmJGijg+mfpqfUHdB1803XgDPgPvPJLgtZ+4rcymnjmeZogvQhoc3I3Mv2p9CI0s3O1miXz0BPEcnUhT8j7Max4UZyf1CZQejHWFBfJGlS1qATf0isHVY49/idJjRaNvkIM7scoNY7KC7Gajx+ZYH8Q0J5ZyxBb2ceYsM1TQeYLKvSq19bOViPEt2IpC8Q2YYvGQNsnTK8IU/+o7NQbsLNqfopTmAEcz0kKylOzGY2U7ixGMSDNG0yTo1uQdNqs6ng0oOAbokNtYfYiJ9N8h0xfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tATRAKhgy61lLSaXLbDX1q9Ae+8ay0WSHnJOxD5lsJ8=;
 b=Nt8CopxrQ8GOq4dxsoglIhjsDOdujYZg/w7nHCCRdmAFCOPu2X8Vwygv/ThNjqEX3zp+1TpAbyyhtdmLME6Cf6I5qoHKsILDWs8+ECRU/dulI2XkYFgQs+66/V6spBrMS18Ilvcq9tNg8VlOmBF04ATvWaum7j4ekXH7YGURyxcpOsc1ILXzjJa2ClGAAzCcY9B7SsfnFdzfjPfdK4+aN87fbj0CBLETRuc9PkxLmOOieqAnGIzIy80PlWpaWmwMjS7llcS6VxxBYsmVlYuQhGaUXQv4h8B6Z7z3qfTpJq6j64gH+FctOfxz0iolS1HBT/PDlPEt5BikzOU2pt+BGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tATRAKhgy61lLSaXLbDX1q9Ae+8ay0WSHnJOxD5lsJ8=;
 b=TgorV9iQO6ttC2HRbflJXxCKicSFuVRmACK8QiJu0leAtxtfmaSYVaX8iA9xWf/okS0KoqwgD7QCmas8ZizTPcR7xmfsBAs/De5wINcGnSOAHAnUBD1HHZ/SN8uzIthCHrrc07lXa+T4E2deK7etpNyWBl4RNEO2a74eA02Kka4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 19 Sep 2023 10:31:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com
Subject: Re: [XEN PATCH] xen/vPCI: address violation of MISRA C:2012 Rule 8.3
Message-ID: <ZQlcVIgnAx6RNun3@MacBookPdeRoger>
References: <c0a206c000f475f50d7ee52825567fcd111568ee.1694164323.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0a206c000f475f50d7ee52825567fcd111568ee.1694164323.git.federico.serafini@bugseng.com>
X-ClientProxiedBy: LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::28) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB5449:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1c8c54-1226-444f-a616-08dbb8eace87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B/2T2CUreppm0nPMj06jAII9lplH1ntxd6HIfzhINR050P9d92BvYWyeXIuuJsSGdqzzWTV2qBu95w7yqU8uF9kFex8sUYLZhgLCsXhM9b8CVD6s7y3S5ZxNZjzRoGOvlDjnNqtRwCgM9eYnNDa9v0pFmm2aSLh2OrCBRXTzCA6bvIc4mu44RRj3ENPeupksFcVF/hhq8DW9jMOIH9xVi0x5KtHTRYd6VyJav7fe+PPz57jbEiwQ+2Kzp1jVF6w7JLvUGntSNJBpbbXjYHMez6H94Zx4E33poA5JdoWqHv/5Ri/VOv6l1Iu9XE0FqQv0P9X3ijIWukvW50tgH73tBsm1QYs2vHj/m94aC2+f7Tdmr/GVcbcndYldiZ+9qEa9Gz84NXop0r1HO8FKPrDqddgSTxhLiypk6L8ay1vbi39jD3pbsnqJwKXoxgS0rUDHjfTXDI+b87MyhFL9dM7kB8+pbovV/RiW+SKFGqZQ5mpMLix2OUY8aX+BOuppomOzZ4wK9N9KP0dBLB2HC3Hyhv+AouQ1Att0W8JOrYJRD1vMP0s1HRb1foG/d1wDMlLC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(346002)(396003)(136003)(366004)(39860400002)(1800799009)(186009)(451199024)(6512007)(9686003)(41300700001)(33716001)(26005)(316002)(66476007)(85182001)(6916009)(66556008)(66946007)(478600001)(38100700002)(6486002)(6506007)(82960400001)(6666004)(5660300002)(2906002)(558084003)(86362001)(8676002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkNidmhhMlRsOTh1U0RvN2kyVzlSNWlqby9CYUZqSmxvWkVGbFlEYjRJVndO?=
 =?utf-8?B?SlA1b0Zma3VMVnI4MVJiM1hZZy9DUDl3RzhHQWpPYjlJMVVOQnJFU0N4Mkdx?=
 =?utf-8?B?ZmJkSHE5elc2QTM4RzV2em14dERJRkhLWVhYVm5RVGdIYlhYL0Q1ek9hZ3lt?=
 =?utf-8?B?SUovMHROdkJSOVp3TURsbkdMM3dSZ2FIdG04UWQrcUx3a05KYnZTcG0wdWdI?=
 =?utf-8?B?MmNvdUdIZmhjRVlOeEJKMUVEdWFRVXFQQ3I0eEx6WGRDLzAvWWZRN1AzVTlE?=
 =?utf-8?B?bWJybkF5OVdOblNlM2tMZkhQSlpRcEE5RkgvenRlSHdoY0hVK0hyZGVSL0ti?=
 =?utf-8?B?cWtvd0Q1RlQ1L1ppNVdZUmJRRi9acEI2VTVLRUxDbjFJdFlvakRGSThYVUN3?=
 =?utf-8?B?NU92L3A3dm01aGJWa3VBcy9vQWFYQUZWOGdoc0N4SE9yYW14UkJEZ3hxanFt?=
 =?utf-8?B?a0dZSFNrak96MisxY1dYRGlnMndPWmZmRHFBR0w5R0p0Z0NGM0RadFFhRVZN?=
 =?utf-8?B?T2sxd1E5NEhyUVBhT0F6MGRwN0xXUEZRSldnUm42aEZsYnUzTC9uMm0xR1hS?=
 =?utf-8?B?L3hMazAwNzJaUDRqdWhyNFNnMUh5UVZmdnpDbHJ1YmZwOTAzWmkvMGVRMUNY?=
 =?utf-8?B?cFQ0REgvT2phSXZVdG5NOFNiK2dnUGd3SStpTlZacXEyem44NWNEZ0htcVFD?=
 =?utf-8?B?bk9hYkFCUFFBN2t2Z01vNlNTYTR1QjEzOTFkRUMwNzZjRGFKRlV6VVF4aHl0?=
 =?utf-8?B?MGE5YmxaNTJwSmRBOC9zamExRDNOeFlPdXp4QWxzL0lVVkpqQW5KdFBOSUR0?=
 =?utf-8?B?TkIzQklEa3QyMDBGYnNGdk81L1I5T2hkMkdrcUlSdWRnN2ZvREpiV3lMcGk3?=
 =?utf-8?B?Qnh3eFpnMlhQczljcWpCdjFVemhYL0JGamdGS3N1SUp0eVZldWZLczhMRXRD?=
 =?utf-8?B?dUtUWWZuT2RkbE1mYkowZExLeHo2V2hyWVNDcDBucUtqdzh0cnljMGlodS9y?=
 =?utf-8?B?K2NZMG4zRUgrZjZsSG0yU2xuM1BXTXQxS2VKRWtHOCtOcUNDRFJvM0ozSmh5?=
 =?utf-8?B?N1hDSy9OZEFuR0ZBeFZoMGlTdXdhcFJSVXJKcUhwZzJWU09KY2lPZStDZ3Fh?=
 =?utf-8?B?bEZzK0xyYVFLT3lEL1V6MThMbUxlU0h5bzFhdlRjcUVPZk9Bc3BMc2dPQXNY?=
 =?utf-8?B?Q2Z2UEd1NE9jSG5Na3NCTkVFdDFLTUtyZ2FxOTNXK0RvRE9hY1BMNUE2VXMr?=
 =?utf-8?B?TE5pYndDUjM5TStnTjhHNjM1L0Yxc0Uzd0EyY2NMakQ5ZEdTMXhMSksrcVBS?=
 =?utf-8?B?dkNyNUlCa0JiSS9QQVkzSG1oa3RVazl3K1NTNk15YUp0N0lpbDN1bityQXlI?=
 =?utf-8?B?bm9PY1Y2OGRKYTlCM044aVhZaU5aYVZsanJCZU8zRXlXVFhlUHN1b2hweUg0?=
 =?utf-8?B?eDd4bFhEVUdtdEhEUTB1Tm9zV0YzVnNhUHIzRytWV2FYN3RvSzhJd3NTN0Vx?=
 =?utf-8?B?Q0tzM1F4L3dETkVZVDl5NUhJMEhCRXlzeDFDQjh3U2FKRUYwOTRoTlFrTFpv?=
 =?utf-8?B?R2dYTXZjV25zNklBNGhzSzNNUWszaEpPNWlGbi9kWEZueWZVLzAxaWwvenln?=
 =?utf-8?B?d3VVTkZMZ0FmcmR6RmlyenlVTVg5bFNyNGVvYkVWOFAxRjUvekxlQ2svVWMz?=
 =?utf-8?B?K2RaMmEyeE5oUmMvM01ZSEl3SVlvSG5Ublg0RWVtWnNUa2hDekx3aEdEVGR2?=
 =?utf-8?B?VW96T2ZhNG5KbS9URHR3eDZwMmFrQWR2SzFGTzZLaE84bkRXM2VyS1RNbzJ6?=
 =?utf-8?B?eDRvclZhVnFLM1p1T3hpcVc1S2ZnTGk5NFNGd2QvRGZLVzZ5U1JzL2JyeXls?=
 =?utf-8?B?ZXNsdjZuTVJCOFdhbHVHMDNrdEdqRWV5YlphVExZVHphZ21VanN3RXRKd0RO?=
 =?utf-8?B?RE5udCtJN21pT040c1FKZEY2U0RnQlQwOEFJSXdEMnBVa0YvNW5YanQvNmw5?=
 =?utf-8?B?ZkpuVjlmb2REeW8zSEFrTGo5Vjh4cXRJSStDaTJDQ1RDNGZBMGxqb29uWHJm?=
 =?utf-8?B?bld1YXg2aTFVVW9xc0tUZ1RiZGhidDc3MDNHYlV1NFZQNVg5NC92T2pHN1Uw?=
 =?utf-8?Q?wn3gC5pH5sF4FAgEHHylbFxnK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xKFdDsgNYqMxxtRrtE5DcZdXGbDcnNNvcB7XoHZqoU+ukNSK6ZN7yOwgf4f/6ZrTWXNqw2TXYjIXlfpUlOldRQMs10GrmJJ4xQW9MmaY4RLRBuuj6rkbK+Nh8TeqClstYGtsPucp/3/kswj7/xvVM3f2mLH9gFT2iNqn6z40NnXeqWLessx38TMPyAlcKN7oe4f5VLDqQEQWW8m2gwzvBtPzuA1YjeA8GtSOznMI2+o3OrcpYAToE9oa20sk6jP2kVGpSGdRUzouyeMUFCy/nuhMWyZoljAE6b5iCvgvbMNWut8BCFwOMZ6z/uBKCQbBL5jiBMCXOYkbmD0iE14WqFwrIpancsu0ERs79c1VZr/qSqupDC/z2ZDnaNinXCmeXLMA3Pf1c0jpaMLpYUWuDHdvFY2MdA/W50wUYNfx8+TCcCJPHl+8/YGvxzyNb7WlgpLlS+zuk4sgV65W3p9/e7qg0Ehswis/b55u6a7vxADy+GBWCzLt51qk0Uyl+SKN/i4NxUuhCQE/65Fqjc7amMEgoY84YVdO9I4vFJS9GaBmaktl0fX1A7B2CrEOaYsFUNDHQceyhHXMnB6ACk4foB3udWkpYaNA+mHedmuT9U/vhg9cRbCQ9aV6M2wRgYpyo3tuHqAMbjcCaMKcuqr/b+4oOIgRLUpjy/99Tg9gqU1UOnHwNguZUtE6ko1sxV37jVnlmPs7lKh7wNKJCPEs0YsiJDSkHqtBs9ikTkW+KoDfBf19gTrm/WduHMG8GEbacDQfNvEW+DMy47l4z3IkFzJ7ANBgY8Rk/o1fgvYeVy50SK2Vq4hbTlCWE2PzS4Kz
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1c8c54-1226-444f-a616-08dbb8eace87
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 08:31:23.1004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyipwcKHyJzHTJygLir6XtV/y9qn1vk/TUnSOjpK67dgz5cg/weSoSdpTDk+bOVQ+FiJoL24wb2npx7IfOl6Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5449

On Fri, Sep 08, 2023 at 11:13:31AM +0200, Federico Serafini wrote:
> Make function declaration consistent with the corresponding definition.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

