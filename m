Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AA86E74FA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 10:26:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523249.813126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp38n-0001HZ-Df; Wed, 19 Apr 2023 08:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523249.813126; Wed, 19 Apr 2023 08:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp38n-0001Eu-9k; Wed, 19 Apr 2023 08:26:13 +0000
Received: by outflank-mailman (input) for mailman id 523249;
 Wed, 19 Apr 2023 08:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pp38l-0001Eo-9g
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 08:26:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4467966-de8b-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 10:26:08 +0200 (CEST)
Received: from mail-dm3nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 04:26:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5374.namprd03.prod.outlook.com (2603:10b6:208:1e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 08:25:58 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 08:25:58 +0000
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
X-Inumbo-ID: d4467966-de8b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681892768;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jXGDC6kiv+tN07Ku6MpZLq9f/mygVX9xgH8nqy7xw2M=;
  b=f2vXY5R6s/8nxWlHJoQa8cHT1XZrpEMGI2WhJt/wRObTbh+Dy84tHb89
   NKPazmzuqj1vJ7bFKojRAjJGE2l3obGhJHC71s/ULiSOYywVQ9bZKg6iU
   dCWLy/l/nt8pY0z2PTMzl/92snaeVe7X6tj5pPM3g11wfk4VMsAEYfOdp
   0=;
X-IronPort-RemoteIP: 104.47.56.42
X-IronPort-MID: 105412093
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cFZNfquijxpDGfsogctdfIY73+fnVHFfMUV32f8akzHdYApBsoF/q
 tZmKTiEOayMYmf9fd8kbITkoRkDvMWDyoc3GwZlqysxFn9H+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOHxyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwDg4xckmSjuCN7ujgR+Vzq/slE9HsI9ZK0p1g5Wmx4fcOZ7nmG/+PyfoDmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv6xarI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjBd5LTuXprZaGhnWeyi8sBy00FmCLrOGyrFSecYJGN
 lI9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A79y4pog21kjLVow7TPTzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:UvNz6a3kiOacGZEdu4R8bgqjBUtyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4OxoS5PwOU80lKQFlbX5WI3PYOCIghrOEGgP1+rfKl7balrDH4xmpM
 FdmsFFYbWeY2STSK3BkW2F+r0bsbq6GdWT9ILjJgBWPGNXgs9bjztRO0K+KAlbVQNGDZ02GN
 63/cxcvQetfnwRc4CSGmQFd/KrnayDqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 n+lRDj7KnLiYDy9vac7R6Z031loqqt9jJxPr3BtiEhEESntu/nXvUvZ1TIhkFPnAjm0idRrD
 CLmWZXAy1f0QKgQoiOm2qf5yDwlDI1r3Pyw16RhnXu5cT/WTIhEsJEwYZUaAHQ5UYstMx1lP
 sj5RPti7NHSRfb2Cjt7dnBUB9n0kKyvHo5iOYWy3hSS5EXZrNdpZEWuElVDJADFiTn751PKp
 gdMOjMoPJNNV+KZXHQuWdihNalW3g1Ex+cBlIPocyYyXxXm2plx0wTyIgekx47he4AorV/lp
 X52/5T5cxzp+ctHNxA7Mdoe7rJNlDw
X-Talos-CUID: =?us-ascii?q?9a23=3AVL26OWolH49fVnkOkCKLQqzmUeYbTmGE3X7SGGH?=
 =?us-ascii?q?iUmtlV5CqT2CI/7wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AbO/wiAyH5xQlisAqfayPWQtNFaSaqKmiS38Cobd?=
 =?us-ascii?q?FgPmJLSdWIRe33C2qXKZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="105412093"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+67UWvcAtHAbLiECx9RLYAB0iclVsj95rbTGbBJgZLIczzh+G5eIxJQb9ejAWfrz/q6bsW6c6SzdGdT6Hy5WFRu7jJ8zX9COOGVOjzu6XhWQrBsLpnZBJOIAcHewu4ha1wyT0JdvaY/46OMxxpAcYFT4IwCyH/D37kwPNHfHVXAoAQ5U40sluFXLei10rTIJNi4roeBd+qO9qcVXhI76KYM7m/WGMN8CwYXokTEveQwTB7onxXxcE2VDoUuazLPRM7pxOn3P7T87oq8ItvaR1hw77iZ9I9cq1gN3Pr0TiQSZBHROYTwfGcok55PgqFeZAiPtwKnkR3byNCvTs9Uww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tErtKDgMNZIdbfUMqXfkVAwKLd2PbJoAetA2bfFtK0=;
 b=AqAqhygo49TXUDCJDNGTzrTVF4WGCMc91ZEJe0ctKr7GWFWtb2Ha2NBHUEgIynFEV9Xhai4BwOV7atnc27ollQEph+sQywep0H8fonGKPJ2FQjYlBcQSkHq/kpty3b2OPSMVryMSm1/RMU24jTcxf5zCDiUKnPOfyNd9Leas5vbGh1V+15uD9rlLQ8XfW7UvNQB8SyXkeBM9usujxcxKPfc8CqUDrcoZ78jOEkbOGq/iCcVwqnl59FNKoAhJPh0vzUmLpoUQ+cEhzQ8NP9EmjCFjepMiDz7DP+9V6yPUrmp6NwT9QMzEfrRQh1jndnR2PQe1Nguo08f0By7kw0XpQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tErtKDgMNZIdbfUMqXfkVAwKLd2PbJoAetA2bfFtK0=;
 b=De6qsVZNlX09/HZtNi9V9rLPupd/6vHinR2ipsNcnermZbrOBDJrhILJpJZZDLd6Cbf0wJT9DBMgGhBwQby+ruV8Wtqk/siSTJvvUMekajGqv0FLFoy+TXdd28pqdrMoGAL8mUYO/35KT42lT7to5WoYSJ3LDFUTGC09pqOiZxI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Apr 2023 10:25:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Message-ID: <ZD+ljXSEPCmPMAtN@Air-de-Roger>
References: <20230418092458.15253-1-roger.pau@citrix.com>
 <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
 <ZD6V0wzw/VS/MMw/@Air-de-Roger>
 <d301e110-f840-a032-c406-2f7404752783@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d301e110-f840-a032-c406-2f7404752783@suse.com>
X-ClientProxiedBy: LO4P123CA0133.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5374:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e4c9988-022e-4ac1-3c78-08db40afb3b6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mh3waQgL/ffsm0ruR6QjQEsy2p9KK4DsU9ayhibZbvx6p0/ZbgCjUAB4GWqwBtTgiMi9/QkohFobnKVP1yQmNH3sT9RxlgbHykUlwxIGJWFS0QzC+PKoYwwKVdW8PRXEbtZyDjuYlZR1nLUo/DV2gjgL3k66NYqrYjBMrIZZVWJ/RNJQJsWFABily199m+H8Va+bV8lOaWwm1AokmwDF0nzgIUYrkO6poywGUiY0pJogxd9hhmUHpKWL9/ypObMJuexA59mPorpzhandFQAf/C5SZWgthB9mejWbE/qAYPHMIvrcJXNJ6QI0BELu+pWqKjEN0H2yR6NsvuLO0+rW5ar3BieEfcmo3hAw3Ypo73Qx8pqLJi6cicUrWhXronY4CZc1J0UwBE6vjLymBw6vqYV+iC4mKvUkixR/U7R51V3JWoVbSdUglKTHmqPQPQQQ7Ttnwwh+EuO0RlQbLKRClxVUxtsVAhpr33jYkpLrtSedudT3ceIRifl0ZxjiAmlhB2n7Y5T3O28XRXSd43ATfgnOwu/S8TYd/jrbwR6OBPaLd/4cZZgt3ju/t7unQRrezQr/7oiTPfc2yogBkcxw2zGBuKnGhEpw7gwiktSCGUs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199021)(54906003)(6666004)(6486002)(478600001)(83380400001)(82960400001)(316002)(41300700001)(4326008)(6916009)(66556008)(186003)(9686003)(53546011)(6512007)(26005)(6506007)(66476007)(66946007)(5660300002)(2906002)(8936002)(38100700002)(85182001)(8676002)(33716001)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjRadlQvZjU1NHFBSkRLVVJsTjUvRjBodWhackxOdGVpM3pzZEo4QjZtSjZr?=
 =?utf-8?B?aXdzV2RDd1JhV3FvYXNLQTBPc2krRFZSYStLUUV6MTRGeFB0alYvQWpDVXMw?=
 =?utf-8?B?Q2RKRXVHQzE4dEQ0QkxNczAvSUtOcFZCWVBLUE9waEpjWTRydmdKQW51eVY2?=
 =?utf-8?B?Z0FPcms2YWRwaEhoUXdPTjQvK2l2SGpTUFdsNDFyYUZLSnBPQnhaem44dUdP?=
 =?utf-8?B?dUV3WlVFbTg3aWY2KzlOay9oSVprR3JhRVQ2K05MNjdVbkZhY1B2WUwyYmdK?=
 =?utf-8?B?ZUY5endpWHdSQ2djSzh5T0p1cXZTZUJFNEUzUXM2UVBhQ00rdmZEZ3B6TzUx?=
 =?utf-8?B?UVVpdkNHTFJFV2hGS243YXVpVkl0NEhOY0JKSGtrb25iZm4rNGladDRZSVZt?=
 =?utf-8?B?bkl3ZmNCOExibVI0K0QyUVUvbitWR2Nnd3BRM1BtS1N2SVRmbU9NLzgyTmxu?=
 =?utf-8?B?cVNzNEcxUEVSdWlTbWQvM3NWTnRmeGsyaHRYQWJtWTBmT2pqVUF3R0FUUEMr?=
 =?utf-8?B?VW1pVjRBUWtVeTZRczZSbEROcTVjSmEzMThvekpLRVlNVUR6dkpDUE9GY2xH?=
 =?utf-8?B?YjJOdmRrUVhIaS8yQy9ZM2FlcmpUMXJwM3pVczNVSHZvdE5TRzRtQWtaV2FU?=
 =?utf-8?B?L3g2VXZ6Y0x0bDFMbjlCcDZVMWwrQ3JKbFZXYnlZSHRiWExzTUs0Nmptakdx?=
 =?utf-8?B?bGd1QlJFYi8ydFBkcjBENW5pSUowRmtDS3dydXB4SFRQWG12N1oySzY5OXVi?=
 =?utf-8?B?c0NrWlZoUndTdUdtWWI1a3Fmb3FDeit0emVVUTJydWRGVHQvQW8wa2hQRCtY?=
 =?utf-8?B?YkMvVEY4bHI0RTBtcGF0Zi96bmM5TU4vRTk0d3IxaWNhR2Nmc3ZJbCtFRVgx?=
 =?utf-8?B?Z1lSMTI5MmpqK2lWWDA3VXArb3kwVzlnRnU3Wjl1YWwxL0VJckt2bGxPcHo4?=
 =?utf-8?B?TnZyeDJSSUlLZ250N29nWGpSZFdMcGZSK2U2NGxRL0hpRDdWL0RhbW1XcUlm?=
 =?utf-8?B?bGI3ZmU5cGY3MWhyTGIxdVpIWUp3c2d0NXhrS2hLUlU4a2lpU3pqMSs2THNs?=
 =?utf-8?B?WEF0N0tUbzRRSVFkeFJTa1lsS2x1TSttWVlxdkNJczBmMU1CaFpiMXgvTTI1?=
 =?utf-8?B?SU5vSjY3TDUzTHlmRGxjcVZOQTdvek9xVnVaZzI4RmM4RVZJaG4yY00yVEpB?=
 =?utf-8?B?dFJFVytRUVhiZkZMZW05blA5U01oQzJ1TDEyLzByMHdSSzFBNytLY2E0TElB?=
 =?utf-8?B?QWthZDZWVlFLcldCcXRHSDIvY3dEbldWcHM1VGJIbzkwUXVLR0VaN0FIdUlq?=
 =?utf-8?B?d3R4NmxHWlI5OVpVamRQTDBHL25ScWFFMGR4YWpYUzZudUltVUJaMnhtVndp?=
 =?utf-8?B?WGRsN3kzK015eU5SK3ZpYlZmRHljRmVwYURHbjY4cHQwRlV4Y1FmNFMrRjhS?=
 =?utf-8?B?QWZuY3V6SzMzSG03MVUxL3BXTzRZcmFaTGhyK3NPcUtEN21PY2xLUHFPR1ha?=
 =?utf-8?B?aURWMEZOeHVZbWVsWFZ5SVphdmp0ZlM3cFBJc0JVT1NzdW9WaysweExsZ3VB?=
 =?utf-8?B?TmdkQStZSHZBdEJJeCtGZ0Q3cHA4VWlYWHd6U3RZZTBNOC9RT0VpUU1DQllp?=
 =?utf-8?B?elZKcENXQ0taUDZJSDJSbnBGZ3d4aGN0d2QxSEJCTEp2VldBMW9yb1NyZWYy?=
 =?utf-8?B?V1dYMno3aVFiK3UyZWNwTWxhOTZEUEpNcURlQkg4cmlkWGdGS2dzdUdlQ3dL?=
 =?utf-8?B?Vmd6WWR3cnFtYXVLeFFwZWduaUpFMXBOMkRUeXV5VElBdGk1UGhjTVlyMWE4?=
 =?utf-8?B?d1Q2OGx1Z2EvUTZTVjFyWHdKTlg5VHJhaVBHMFNUUlV5emFkNWhTQ0Jyd1dh?=
 =?utf-8?B?azFQUmR2WmFFV2lSdDc3QlJQUmpUOUdQQ0dhbk9HT0FTMG5zaHRWZ1NGWG1h?=
 =?utf-8?B?K2FmMXZGUXM5dHBFZTEzMDNlNzVPSW0yMXNWRnVVenp1TmhrTUdvcElaWVVK?=
 =?utf-8?B?VlRvQnJQTmZMeFpsVVYydzJBbUVHOVByRWt5SXkzVGloYjBwK0NzUmpXM08x?=
 =?utf-8?B?TGYvL2FQQ0Z3OTQzQ3AyNWdaT2dHaWFPYTFTVVBNbnprc2pnaDd4dkNZSFhh?=
 =?utf-8?B?VkJmcnAvcDBNUWs1MnpNOHNSdWRWT2RQSzg2NGRBVlg4SHI2dVlvZVRzdXky?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NMieQ1AyBbF5KEIqVizY6dPqMY5Z10px0CS7YQ0gCRfYJWFceuhk319Z0BjKLeG3VVO65gIMgVvu/RWuHFRJoBIXxh1spxm+tJHuMX0HNJmvzTD4EFQPuLlXKU/ki1vHIdW8t+fgfePaAtjRG8A7icAxBLEOL3GNfVLBtjcVwGCH1/Hj3a3/ss8X4QwhZi3FvryQXF1qdBBk7b6G9jVf7dKUb5KkVS5oEJYTa3nooQzXcQxUb0lm6VfHa0KjRgjshh7JYS0BiF3lu9vI/d2oPEVo7jtdnqt0lcd2dF4BEYdoxD3i2XoHUC9W7SJ81i/p+n32FUZamYELUk5BZdjOW37jsfuhMX+l9mADd9Sd/aLr19Cz9MarZiynbvlYR5GfuHkGfWG+xrIZ4b3N/zp6w42hFqMBiZOlM3gL/N4bBfoHbR49FP1i/QTZrcnFK+G38jAgeeCS/jTCqOxJY+ig1bQjn2nVuKtkpWJfJniyQl/q6pZE5qmfUKm5XnQGpgTiixeR1mNGXlrSPvbVI1teE7RFSs9YeAi11R2ykvfQkLqiaFT+2hsNdMXjPP3Yj6347zYCYG869K6nqViehOBJwipgZiyHeCU5Oy1gWzzQEpQ1w2BKmv5ly7S26/fG7Zqq08lh+iKYU+VKP98hEirYXJqrs7KYiZuX+V4MFAJpslAuklEJ2bd2AuCDu5cMDAhRIkNzcQCawnZn5jzJuW24BfA7hPobC16D1gcuGztp0nQAsMjck8vIZVRKVXJFmcWPipGGDDEHXrqNrCX08gQ7HTP6QiWmyka+N3Dadgrc61T0WuOSVuaHfCC+xkJjM/Gv
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4c9988-022e-4ac1-3c78-08db40afb3b6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 08:25:58.4937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDri0lnSEUQbJRwqqwj0Gip/7i50j2UA0OKEYJECRCatfHgzqDSR9ry4AXmaZ5kMRDLRwAlDUMlzvgaffI7Zow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5374

On Wed, Apr 19, 2023 at 08:17:45AM +0200, Jan Beulich wrote:
> On 18.04.2023 15:06, Roger Pau Monné wrote:
> > On Tue, Apr 18, 2023 at 01:00:53PM +0200, Jan Beulich wrote:
> >> On 18.04.2023 11:24, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/include/asm/config.h
> >>> +++ b/xen/arch/x86/include/asm/config.h
> >>> @@ -44,6 +44,20 @@
> >>>  /* Linkage for x86 */
> >>>  #ifdef __ASSEMBLY__
> >>>  #define ALIGN .align 16,0x90
> >>> +#ifdef CONFIG_LIVEPATCH
> >>> +#define START_LP(name)                          \
> >>> +  jmp name;                                     \
> >>> +  .pushsection .text.name, "ax", @progbits;     \
> >>> +  name:
> >>> +#define END_LP(name)                            \
> >>> +  .size name, . - name;                         \
> >>> +  .type name, @function;                        \
> >>> +  .popsection
> >>> +#else
> >>> +#define START_LP(name)                          \
> >>> +  name:
> >>> +#define END_LP(name)
> >>> +#endif
> >>>  #define ENTRY(name)                             \
> >>>    .globl name;                                  \
> >>>    ALIGN;                                        \
> >>
> >> Couldn't END_LP() set type and size unconditionally? (But see also
> >> below.)
> > 
> > I see, so that we could also use it for debug purposes.  I guess at
> > that point it might be better to use {START,END}_FUNC() to note that
> > the macros also have an effect beyond that of livepatching.
> > 
> > Maybe also introduce a START_ENTRY() that replaces ENTRY()?  Albeit I
> > find START_ENTRY a weird name.
> 
> So do I. {START,END}_FUNC() or whatever else are in principle fine, but
> I take it that you're aware that we meanwhile have two or even three
> concurring proposals on a general scheme of such annotations, and we
> don't seem to be able to agree on one. (I guess I'll make a design
> session proposal on this topic for Prague.)

Oh, I wasn't aware we had other proposals, I've been away on an off
quite a lot recently, and haven't been able to keep up with all
xen-devel email.  Do you have any references at hand?

> One thing needs to be clear though: Macros doing things solely needed
> for LP need to not have extra effects with it disabled, and such
> macros also better wouldn't e.g. insert stray JMP when not really
> needed. Hence I expect we still want (some) LP-specific macros besides
> whatever we settle on as the generic ones.

The stray jmp can be inserted only in the livepatch case, if we end up
having to add it.

Maybe we should just go with Linux names, so initially I would like to
use:

SYM_FUNC_START{_NOALIGN}(name)
SYM_FUNC_START_LOCAL{_NOALIGN}(name)
SYM_FUNC_END(name)

> >>> --- a/xen/arch/x86/x86_64/entry.S
> >>> +++ b/xen/arch/x86/x86_64/entry.S
> >>> @@ -660,7 +660,7 @@ ENTRY(early_page_fault)
> >>>  
> >>>          ALIGN
> >>>  /* No special register assumptions. */
> >>> -restore_all_xen:
> >>> +START_LP(restore_all_xen)
> >>>          /*
> >>>           * Check whether we need to switch to the per-CPU page tables, in
> >>>           * case we return to late PV exit code (from an NMI or #MC).
> >>> @@ -677,6 +677,7 @@ UNLIKELY_END(exit_cr3)
> >>>  
> >>>          RESTORE_ALL adj=8
> >>>          iretq
> >>> +END_LP(restore_all_xen)
> >>
> >> While I'm fine with this conversion, ...
> > 
> > So I take that overall you would agree to adding this extra
> > information using a pair of macros similar to the proposed ones.
> 
> Yes (with the above in mind, though).

Sure, thanks for the feedback.

Roger.

