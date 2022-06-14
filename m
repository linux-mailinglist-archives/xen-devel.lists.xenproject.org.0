Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E192D54ABD9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 10:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348621.574836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o11z0-00083g-VF; Tue, 14 Jun 2022 08:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348621.574836; Tue, 14 Jun 2022 08:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o11z0-00080E-S5; Tue, 14 Jun 2022 08:33:06 +0000
Received: by outflank-mailman (input) for mailman id 348621;
 Tue, 14 Jun 2022 08:33:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1me=WV=citrix.com=prvs=1570496fe=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o11yz-000808-FW
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 08:33:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a17c3aa-ebbc-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 10:33:03 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jun 2022 04:33:00 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6740.namprd03.prod.outlook.com (2603:10b6:510:117::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 08:32:58 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 08:32:58 +0000
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
X-Inumbo-ID: 9a17c3aa-ebbc-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655195583;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=w8JMB2I/0hLlB0BbgFRK8BAMpsGJNOJzCn71/Y1tgAk=;
  b=VVPF+lh46Tuq0VkRedo/zQaVg7NpXhVJSsDeUGxouLHkUmgPvBoRlWzj
   D4xljjo9XBBzTtBrO4lvqoqg2lFJGeuq0z83U5o0wJJA5Ve5p93LubVeu
   OkBqnCua5T9go0J/YDCRS00iiZ4BeWeQ4k7XQnzFe8QUiUc3tuc/gVzYA
   k=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 73555577
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/MgCBah2i1dfDwptPFHUrVYjX161fREKZh0ujC45NGQN5FlHY01je
 htvDziPP6qLNmrzfdtyaI7joUMAsJHdzYQxT1NvpS5jRn8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVrR4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTotGLbCw7xHajZnESp6bfFv++LHMUHq5KR/z2WeG5ft69NHKRhseKgnoKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMu4EegGpYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8w/I+PdovAA/yiRA0P/GOvntd+eJaut/wEanj
 0XD+UDAV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQRFRkXWF2TsfS/zEmkVLp3M
 FcI8yAjqawz8k2DTdTnWRC85nmesXY0RN54A+A8rgaXxcL88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIU9x7Z+RpDK2fC0Kd2kLYHZeSRNfu4W+5oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr8hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:4i5abKqu7T0MxwtpNHmB3EUaV5u5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wI9HdwGOtx5Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexvwqEH3QRSvyWqOLtB1B1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.91,299,1647316800"; 
   d="scan'208";a="73555577"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jt97Xubbu0Fr1CGts6yr+RNHtZ5MU5X25O69pmZ88ke5dynRgXKZfSullloiwbuNdJV6Jil8gPPB4EZYKvfTOuZEHO2CDc6tYwyu1Z0L8PyQrvyvgTI2BF2EFn/yamNBAlzrEbhSHIA4P5G+P8JwvlWQbr6YmVZH2ZbYfLkkb2l5nMy7g+hme+g1sHOdkf6BG/CxXsScp+tv6qEa6SSzRki4orPIWpHaG52QLElpY4czgCMPi3aMosKQ4rH3R+Ve0sT4CQPDML+P2br4zN6nJTQXo/r9bQCl46bFN7IAy+ag23mZaFywTNgWVw1v00ScQ0i8j6fi6O+OpEpNz7wCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YG7z4ZJ/syeOaBHMFNSJud+K31voPYyfT3kV59x0JhI=;
 b=f+BANp4dz3jElWcakrFTKBv+7SCIQW0puMlLapR3mcKuNyU5VM9AVVTmDQ4v7+22H5OEkvmfmRcqqEuDmdlR+Jzx/NJg6/BP1a/f5pRGeB+IzANyFVY4kXs2vnEBflZVwIhaZqY4KjeztJb64nFicFOpVUBS7I9xsKRmo7iJOfZ6FVlYDmwlxB3ZWwOpy7dPG55Gi48yX/oKNMJ+Gr6Ic6SliIAmrg8iQEig0fpTMvGTVw7J1U+U0EXTPQS/ruKucDHlRH7/a4HxGIk8nRrbB3AvwP9AdGwz7mRrxkw+Jd577wjgDkUaNxkfEt7+rg4ZK4t/6LvZGiluH8a+yJ9Grg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG7z4ZJ/syeOaBHMFNSJud+K31voPYyfT3kV59x0JhI=;
 b=fO1Pr9AzwgaS0NHTR7ZTj2VVAgayw4UHmOUSCa1PQE4a5R8D6Rb/5jX0S9Wo9dT3Koglxq+i2T6yMUMoNjF9X6eOqgAguRgh8AMLtqcIk0Yunqpy3OQpZtq38ya3h7aJrojI8bF1YWHUc3RRwab4s8OTjlYchzLU1WgEEE51MoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Jun 2022 10:32:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Message-ID: <YqhHtetipYTG8tuc@Air-de-Roger>
References: <20220610150651.29933-1-roger.pau@citrix.com>
 <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
 <YqbziQGizoNX7YFr@Air-de-Roger>
 <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
 <Yqb9gKUMokLAots7@Air-de-Roger>
 <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
 <YqcuTUJUgXcO3iYE@Air-de-Roger>
 <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
 <YqgwNu3QSpPcZjnU@Air-de-Roger>
 <69d85d88-4ec1-987c-151f-0d433021fe34@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69d85d88-4ec1-987c-151f-0d433021fe34@suse.com>
X-ClientProxiedBy: MR2P264CA0098.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92ca511f-f2ba-4438-b60d-08da4de07c91
X-MS-TrafficTypeDiagnostic: PH0PR03MB6740:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB6740BA629903012F532027678FAA9@PH0PR03MB6740.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mklt12uUdDutMvG++j+2KzGCz4mz7pTceskq5EgIlKLMxtUAUqQ6o9uZKrt8Fl+lThDfHgzZBjQep6n0XVnnM/UPUhS2DKy+iPN0xd2pW9b2nLNHncetswheD5q241GgGhZ957x9oyczZ6VjsHGt8C5mhm3B6Iaf9v2F0EsoLMDS2ukkfDpPsDt3viSCsX5PH77KBCph6UvlSSiA6Jn80OJHwihow5tZrj8P5oMpGQJs3C/RGX/naooAEpVM64gs1G88GzTy2m698YlsRBRnUCmr0IWTzjM0Oy9ZABAbg3MneVZeThZ/W+Hgl+k/c2PFhdOewadN6/Sh07lWnXk3w/cKJiUhEAYtcb38ikAJhS5yaUFholBJJ24p8w9PMpa8L1uJPLVRhnT61S2/d0ymwLYyn2G9PwtTsShZ9QI/kmRW0mWc8PFLHkoZdIfDJHZRO6Fevaln903VNBvbvbHzftE+0dpO/Uy5bqwGynuQ74dTTYjJhmOc7CNSqY+Kq6j/XmECfxUqSCmq3ALGaG1XOu5VTcleLdgTKPJynk8ebkgMwO3tT0f96hjWjfETFU246wCJu/unKdSkCVxTuUVPaMWN5vfe1tuhDaDhuYfF4pwUCz81/Q7YinzPGc7SfZ2kvcuEWc0AMkYSTEchum1fTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(366004)(9686003)(6512007)(8936002)(53546011)(6506007)(26005)(4326008)(54906003)(316002)(66556008)(66946007)(5660300002)(6916009)(66476007)(8676002)(86362001)(82960400001)(6666004)(6486002)(508600001)(186003)(33716001)(83380400001)(85182001)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGZhZGljSGlSQTVBbHU3cGVHY3pQVVlleG15TlNyN1pPS25zSGFrTktNS1lB?=
 =?utf-8?B?YTlTbmN6MXNSQk8yMlVVSWxMcnA0bFJWUjd3aVNhMWV0eWNYaXIwa0k0ei8w?=
 =?utf-8?B?YlluZHc0dDNhWGFjOHlxWDdnK2FBbHB2THozMmY5QzY1Z3c2bmFadUV5TEh5?=
 =?utf-8?B?WnlQQXQ4VUQ5ejZkYmlWd0lUc3J4bjU1ZnBXZzVBMURNd082ZCtNbWFRcVAw?=
 =?utf-8?B?TTdXR0hSREd5cHM1bkxLSkxncXJNZldkSDNRVmlkSmR2ejNrbUF3TEZuanRa?=
 =?utf-8?B?Yk1wSnkwYWdhRFltSjFpNXBCZTF2VEZQNUpqNTFscm13Y2FYM1JzMWlGcTNv?=
 =?utf-8?B?bFVQVUFrOVAxMUtyVmY5YmJ5TXRiMndYVXJSL244cGFyMmFYSkNNb0UvSVJD?=
 =?utf-8?B?OWpzcE1Qd3NDOGxjb3o1NXNPa0F2NS9Zd2dLODQrRUJNaTB3NmMxaXhma0Q0?=
 =?utf-8?B?RjBTRVpqWi9tU2RTalJzVWwrTXc3TGN4NWxLK1BPck1UVHBRWUl1OU1jYWtQ?=
 =?utf-8?B?MWt4Vm8xMmdTZkRRano2MjNtbU5iZEJNSTRLbkNBb0JIajBBOE4zUFpxeUJi?=
 =?utf-8?B?YXV6QVhaTnRDK2JrQktqN3REbllkc0pMUWdFNldWaFVLWG4zQTdrc0tpMTR2?=
 =?utf-8?B?eFB5RE9MUWZWVzIrUnFValVqdWs0R0RSSWJOZFpDVlVuUEJuSVdSYlR0MWdZ?=
 =?utf-8?B?WGgzblQxc3pVMkYyTkpFazA5WExMZWNXMGdFQ1FCQ3NCSE9VUGNWbXVFSWtl?=
 =?utf-8?B?aTVvd0IxeUdmOEtiQ1dtcHVCY0ptY0dRbmVlUHAvalprYjF6MVowY2owUUUz?=
 =?utf-8?B?YitxQ3VqUVBialp1NGFZNXY1YStXemp6RHBrdi9HdDFZR0tLazQ0WFM2NnFQ?=
 =?utf-8?B?SnFaQWR5S0NrcHpWU2lXMW5sNTJYdWREM28vTXdBcmJsc0ZFLzArS25kQ2wy?=
 =?utf-8?B?RTdzZ3MrYUw4TkM2YzJtK0M5Z3lMRW1iRk9uZ2JZRDVIeUJFNURLN1REYU9v?=
 =?utf-8?B?UUptcTJDdzRrdGFBdUpmM2EzdDI1dU01VUZmcjBFa2h0T2d0cnRWUUtneFN1?=
 =?utf-8?B?V1BoL2xibklzSnZOR09CSTBQdGkyMXRBUDRXbGozY0VVL28xZW1VazR6eDJy?=
 =?utf-8?B?czdMemV1eTE0M3JGWDVFdXdkaG5EeUxyOENLMldXQUx5cnl1c2pDeXhPV3Zt?=
 =?utf-8?B?ZGNiakZXZ1VnMEpGY0Z2U1pHOHBrN1oyUThMSFZPaEdWSlJYVVRGZ2dvYU56?=
 =?utf-8?B?UWtIdEtCQWwzZGhXZldUOEJhK1FIYS9QZEZ4b04wTndaenNFZUlxWXRpL3lp?=
 =?utf-8?B?ZjZrZ0lmbTdSWTMrVE1Gb3Rxa09ZNW40dkRIWXZjbkZxTWJBekdDellCU0FN?=
 =?utf-8?B?UWFpZ21aMTJ3cmpqbC9aL2xhMGs0UEpYd2tJMnI1Y2hsdE1neXNYU0Z5N2ZH?=
 =?utf-8?B?amtFVitZTEpoRmYwMjFycXRUS0Z6QVB4Tlo3YmJzdEVZNnhHMnFMb1pHVG1q?=
 =?utf-8?B?UUhzOFl4SkZFQjFCZ0RCSFBFR3Z6aDgxOWhVbHJncVhoRjZ4eUJDUUNiT1dl?=
 =?utf-8?B?ZXpMb3BCdzZzWVd5S3JjR3dtRFRranQ0b2tSYkFCZEVtZEQxZVJxSTZHcy9J?=
 =?utf-8?B?Vm16b2dXcEdJb1BMcE5oVlVtSG5BLzFaWnpXSkhXM2dFdTk1cW9vekdGU2V6?=
 =?utf-8?B?UUZiSC9TUEJkdzFWN0hwNWllWTFrNGxNUllMSHNZWitJcjVxaXozbENEclVD?=
 =?utf-8?B?ZnkrRmJUenIxaUlqdlQxRlp1RDJ3ZXFnNEVXai9jT25UdjBuTDZ0aXFGQUFa?=
 =?utf-8?B?b3M0cGxMT0l4VHdtOVo5cUJBY1Z5c3N2Mzl2Y2tubDVERXZUa2tDcS9lZlNJ?=
 =?utf-8?B?V3pjeG10cUVmWlI0ZTFCWk8xNHE5OGREdXcxbHBiU3RJQjJ2by9lME9FN2ZE?=
 =?utf-8?B?RUR1MGhyKzFpS0diM3BRNDJkWElMUEd2WDdCdlJMaXVJREluQy9mMkVjUDY5?=
 =?utf-8?B?OFR4YmEzYUFLeStHcWFtdDJEelhBL1FUUXQwSHhGcFlpbDJTMzZ5NEN3WkVr?=
 =?utf-8?B?QUF5NW8rWXpZdU9rZDlPd2d4OEluMjhtNDErU2wyRjluNTU3SG1ROTZMRFZE?=
 =?utf-8?B?eWxTRkp6N2tyKzErUzZYSnQ1aUxUME8zTEpFN2FnS3V4bjVWNVMzbnhLcWxS?=
 =?utf-8?B?N2M3NWFLendRMzNPaDNwZ0VZMlNFcnBNWkZNU09HS1J0elZFcWt1ZU4wSyty?=
 =?utf-8?B?MzhMSHFra3lwMVhTWC9wV3ZKOHB2aUNKeFRNOWlCWjZmZEVNa0JnQXdNL3F3?=
 =?utf-8?B?bUdPSzFCZHhhR3BtdkFSMkhjMEJxa1dLbHZQT0ljNGtFQVMxdFpnY3A0cWtr?=
 =?utf-8?Q?cumlDhyHGcHB6MtI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ca511f-f2ba-4438-b60d-08da4de07c91
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 08:32:58.6314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttw/nh6YYQEO/Xt3SD91+V3UuQLXnxBiFSgMHLNQKTw4iK3FTggazbu0YFezYZRsw+7FWAz0V5MpYu6gUBySUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6740

On Tue, Jun 14, 2022 at 10:10:03AM +0200, Jan Beulich wrote:
> On 14.06.2022 08:52, Roger Pau Monné wrote:
> > On Mon, Jun 13, 2022 at 03:56:54PM +0200, Jan Beulich wrote:
> >> On 13.06.2022 14:32, Roger Pau Monné wrote:
> >>> On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
> >>>> On 13.06.2022 11:04, Roger Pau Monné wrote:
> >>>>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
> >>>>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
> >>>>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
> >>>>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
> >>>>>>>>> Prevent dropping console output from the hardware domain, since it's
> >>>>>>>>> likely important to have all the output if the boot fails without
> >>>>>>>>> having to resort to sync_console (which also affects the output from
> >>>>>>>>> other guests).
> >>>>>>>>>
> >>>>>>>>> Do so by pairing the console_serial_puts() with
> >>>>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
> >>>>>>>>
> >>>>>>>> While I can see the goal, why would Dom0 output be (effectively) more
> >>>>>>>> important than Xen's own one (which isn't "forced")? And with this
> >>>>>>>> aiming at boot output only, wouldn't you want to stop the overriding
> >>>>>>>> once boot has completed (of which, if I'm not mistaken, we don't
> >>>>>>>> really have any signal coming from Dom0)? And even during boot I'm
> >>>>>>>> not convinced we'd want to let through everything, but perhaps just
> >>>>>>>> Dom0's kernel messages?
> >>>>>>>
> >>>>>>> I normally use sync_console on all the boxes I'm doing dev work, so
> >>>>>>> this request is something that come up internally.
> >>>>>>>
> >>>>>>> Didn't realize Xen output wasn't forced, since we already have rate
> >>>>>>> limiting based on log levels I was assuming that non-ratelimited
> >>>>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
> >>>>>>> triggered) output shouldn't be rate limited either.
> >>>>>>
> >>>>>> Which would raise the question of why we have log levels for non-guest
> >>>>>> messages.
> >>>>>
> >>>>> Hm, maybe I'm confused, but I don't see a direct relation between log
> >>>>> levels and rate limiting.  If I set log level to WARNING I would
> >>>>> expect to not loose _any_ non-guest log messages with level WARNING or
> >>>>> above.  It's still useful to have log levels for non-guest messages,
> >>>>> since user might want to filter out DEBUG non-guest messages for
> >>>>> example.
> >>>>
> >>>> It was me who was confused, because of the two log-everything variants
> >>>> we have (console and serial). You're right that your change is unrelated
> >>>> to log levels. However, when there are e.g. many warnings or when an
> >>>> admin has lowered the log level, what you (would) do is effectively
> >>>> force sync_console mode transiently (for a subset of messages, but
> >>>> that's secondary, especially because the "forced" output would still
> >>>> be waiting for earlier output to make it out).
> >>>
> >>> Right, it would have to wait for any previous output on the buffer to
> >>> go out first.  In any case we can guarantee that no more output will
> >>> be added to the buffer while Xen waits for it to be flushed.
> >>>
> >>> So for the hardware domain it might make sense to wait for the TX
> >>> buffers to be half empty (the current tx_quench logic) by preempting
> >>> the hypercall.  That however could cause issues if guests manage to
> >>> keep filling the buffer while the hardware domain is being preempted.
> >>>
> >>> Alternatively we could always reserve half of the buffer for the
> >>> hardware domain, and allow it to be preempted while waiting for space
> >>> (since it's guaranteed non hardware domains won't be able to steal the
> >>> allocation from the hardware domain).
> >>
> >> Getting complicated it seems. I have to admit that I wonder whether we
> >> wouldn't be better off leaving the current logic as is.
> > 
> > Another possible solution (more like a band aid) is to increase the
> > buffer size from 4 pages to 8 or 16.  That would likely allow to cope
> > fine with the high throughput of boot messages.
> 
> You mean the buffer whose size is controlled by serial_tx_buffer?

Yes.

> On
> large systems one may want to simply make use of the command line
> option then; I don't think the built-in default needs changing. Or
> if so, then perhaps not statically at build time, but taking into
> account system properties (like CPU count).

So how about we use:

min(16384, ROUNDUP(1024 * num_possible_cpus(), 4096))

Maybe we should also take CPU frequency into account, but that seems
too complex for the purpose.

Thanks, Roger.

