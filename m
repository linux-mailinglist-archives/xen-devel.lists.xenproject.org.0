Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808DD6CD78C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516154.799830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSwG-0000XQ-L4; Wed, 29 Mar 2023 10:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516154.799830; Wed, 29 Mar 2023 10:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSwG-0000Vd-Gx; Wed, 29 Mar 2023 10:21:56 +0000
Received: by outflank-mailman (input) for mailman id 516154;
 Wed, 29 Mar 2023 10:21:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WOlf=7V=citrix.com=prvs=445effd08=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phSwE-0000AN-Ax
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:21:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83f93df2-ce1b-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 12:21:52 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 06:21:38 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6940.namprd03.prod.outlook.com (2603:10b6:510:16e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 10:21:36 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Wed, 29 Mar 2023
 10:21:36 +0000
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
X-Inumbo-ID: 83f93df2-ce1b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680085312;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=GgzvQ4F97uMh6hQ3cKDDJg2+/D82P4paLoBbMztQgYE=;
  b=cvnvmoP4R/Lj0L5M429EDwTEh7aJo+mPf/A7uR/E1Q+mH1+RQijEUjlH
   3yyLa1LFq69l6IHubnqwAo1vl+8MAuc66IxLIX4N68OEEU5NatNUwGACc
   y/Ak4S5VcBYjhNZU8M1XnL9x7eHHzlgwiiEq/TyG/Utq8pHPU2J1wStUy
   E=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 102857261
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9JUsM6oJSSfGGex5NXgzlXeoO0leBmIKZBIvgKrLsJaIsI4StFCzt
 garIBnUb/uKMDf2LdgkaYjkpBlU7Z+Ay9ZiS1Y5rH0zQSwb+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzShNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAB4yTACYi767+bCQZMA8nvw9J/jBJoxK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKMEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpIRODnrKAz6LGV7jMLKx87CluwmP6o1FWbf/FzC
 WBI4xN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBqgGqy8qDqzPW0fKzAEbCpdFQ8duYC7+cc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNtGuVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:Ash9VqBNegzMiDjlHejHsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwOU80lKQFmLX5WI3PYOCIghrNEGgP1+vfKl7balDDH5BmpM
 BdmsFFYbWfbGSS5fyKmjVQeOxQpeVvnprY5ts3mBxWPHpXguxbnnBE4kHxKDwGeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8TTutHRk5riQBgeQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7hGhdf7zdNHJcqUzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iFnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjXuVm2Hqr8DVTC8zT5Mpv/MRTjLpr24b+P1s2q
 NC2GyU87JREBP7hSz4o/zFTQtjmEaYqWcr1cQTk3tce40Db6I5l/1owGplVLM7WA7q4oEuF+
 djSOna+fZtaFufK0vUu2F+qebcLEgbL1OjeAwvq8aV2z9ZkDRS1E0D3vESmX8G6dYUV4REz/
 6sCNUmqJh+CustKY5tDuYIRsW6TkbXRwjXDW6UKVP7UIkaJnP2rYLt6rld3pDnRHUx9upypH
 39aiIZiYZrEHieSvFmnac7vywleV/NEwgEkaplltpEUr6VfsuZDcTMciFqryKamYRgPiTqYY
 fOBHtoOY6dEYKXI/cu4+TfYegmFZBMarxghv8LH3Szn+nsFqrG8sTmTde7HsucLd9jYBK0Pk
 c+
X-IronPort-AV: E=Sophos;i="5.98,300,1673931600"; 
   d="scan'208";a="102857261"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2IaZAR5vPZAk/isGePCrxrxNs0Kn6y9ikSt2Q89VMyv8c/UrAr8HljfVLEv8GdPSGe+lhNTHlbo9zAL+NWrlYp5osggMFJu6YItD9kWOw8jtq/Xnu6Ya1QJ7BWhg6XWImU0hoVh4zmf/OceCr+3CnT8I17nnXBiFY4A91hTeFtZ1kiMr6WwIol5j1uINIvL1I3ueDcMHR238+gX6GI4UkBXKH9ZcsIX6arIzIFrhrrkY1N1Hx/BuydUb60gqpwVJ8QSxvFa+Wl2rOPUTP5hgYJkzUrKSQbZhcRieMlo7E7SNcVpczh5GJL0fkrYJbVpy8bMIWbHi4Y51PpI29tNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBcikQid1EDsNKVmlhoAesovXe8SAQfNny1rvck7MW4=;
 b=TyzBoTPpJLj3nfCkblAAUY66i4P5J/JX5Qovwqne8VjrGY1nVAvn2mLsBaGOgNDG6LxFrPr3RmFqnny9P6MrtKlmU5h+flP5x654QmGxKCRQpkfRzts0wSUYAPLWwTQfzRvskvZwxeHtL3bgAuNGoFiw+b16eAHS1we6h0kZzHA5WJ5EfKcwQ3DBWwW062X17uMiU8Y4HqBKs5ULL5jPw75BX2Un5lj58btXEuCy+cSiWvFK59a09RRsGxnu9w9a/8b1frwRNy7hRKvVZuDMILB9p0OK9SEIFtZbHrcocd6XVYVArnWL8rJ01Lh6OHP9uC3C2+gsgj1c12glxhNohQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBcikQid1EDsNKVmlhoAesovXe8SAQfNny1rvck7MW4=;
 b=bhz+H6GD+MtpaZkzz1G7eQG6yLfxiCLJIijOK6CpFuOSFwkMjuKFhlyZ+FuBeydqHdoEIKKbCaVN9EAHDQWcGYXqvu8xKGz3WzSrlvhn2AyOgwpCBcKBsIoFoEw3bm/IS7AgzfkqHjMarN5McGCSbs5KDhaasws+sbFPtxZhnfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] vpci/msix: restore PBA access length and alignment restrictions
Date: Wed, 29 Mar 2023 12:18:10 +0200
Message-Id: <20230329101810.84726-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0238.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::11) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: 7128f24e-ec8a-4a87-fa31-08db303f6042
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	REENbcAroG1WWJHJJ+Tn53SljIdFat1+X2oiIJbUqOeVsQ/dy5Al/5wtMqb9pnoby02ZlvaR1EiFp0GvJs5vlEBCZkq+/cb34TjnTxuaIy1o/5N3Xq5lg3p58x8EMdp9q3BGpseWGIJz+ogBihE2iI1KjQJfhtO2wteCmPMovNRuDoVCjOri7de/1b9WyQ4yJqaYVkPmCmSt08a2VBJKFD0Aam4dJ+CSFGRsqlXJQrSs2jC6+pzV9U8kRm6PMnfzvsJDhWVbmEUVB7cgkFN3Orh5IHqG2bQQl/PO7Xf3dYuSSjV+Bp3Pu4G81h2bTfn5MCbGoK4FqWougoU4XsvaBipvGNFhVLMIsSp57TnqToc2g0aNVURKS0AjxEdDRVchqZGa+Lz9ql4qC7SZzWc8ycZSdwESeFn5+Jl+/qFmwueFUSTq8Nf5ltFU4/7fr6uOXRl03su2zVcCui2gOL21+vTPX0olYz236x65Hsxk8adjaEe0E/Z1LzE9junt0tiyPgnHth20Te9VhbPDG4VNv+Dl+J5zMQpMtKwAeUFu3ojRi6Q1B/7ypirXB5HYo4Re
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(83380400001)(1076003)(6666004)(107886003)(82960400001)(26005)(478600001)(316002)(6506007)(36756003)(8676002)(66476007)(66946007)(66556008)(6916009)(86362001)(4326008)(41300700001)(6512007)(2616005)(6486002)(38100700002)(5660300002)(8936002)(2906002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0xBM01saWZzNGx6bjNPSFA2MjNiN0RuOGltamVYQzl2MStBMUQxejFWcERo?=
 =?utf-8?B?TzJ5NzJKTklSelZsY1NpVDV3YlhPL2VqUk81QTdPOGtOczU2UlZkaDlIWjRy?=
 =?utf-8?B?Q0N1NzRjNUx4SmVRbUgvdVl3QXRNVGlxSE1IUi9TVWRNdk9CRnk4UEs4Q2lS?=
 =?utf-8?B?RDVacnFlVnRES25jUE1PZHdGTVhQWVcvZm5hb2Vpdy9WL0huR29hZ2pnQWs1?=
 =?utf-8?B?bWowaTNBNjJnemxBeEp3ZEw2dVAwMUIzWmRIRVhoZnZnMm04dmp5UzViR3Bh?=
 =?utf-8?B?MUpVWU84NHBHQzlCRDA1NS85YnMrejdTWkoreGMwR1FQdU42aU9VNnA5bXg0?=
 =?utf-8?B?UGtDTWZDdDJGU1ZDTEhCY0w2dXh0bGFRdXl6MHlSOUpMemNVVWh4K3N6eEdV?=
 =?utf-8?B?Q0RacXhVTWNJVTg1MnFDS0NQeUlySjdqTVRYNjFGamtmejR4YUYwdm1HZVpY?=
 =?utf-8?B?M09xR3grSjNLaVhNZlVabHVoZWlLM3F6TG0xdXZxNmZ5VUgydS82d1NtSzI0?=
 =?utf-8?B?K2tjQ2ZTd0cyKzB2UlpoaE1WOFFnYkM4cXRFeEYrTmJUbFRTaitGYXBwZDhr?=
 =?utf-8?B?YW1pZUFGbWEwSWpUZFo3N2wrRzJ0anhhb1NpZGMwbGw1VGhBTytITW8wRUhm?=
 =?utf-8?B?bVFhd0FrUlBHdUhVRE9qNHVKdWRPdzRaSzNTQ2h3Ync5UlYrbCs3SDZUdk1r?=
 =?utf-8?B?ZXVITHJaMlYyVXRBNlpRdThheUMvbmV2OTBxMFdwY1dCU3RLcHhNc2s1V0la?=
 =?utf-8?B?ekJjNXVtNnZhd3Ixc005UEo2VTBWcG9QTHVBWmhwWnhEcnJsVHBNVkVmVnFl?=
 =?utf-8?B?OGdGNlVKMFhpNmxSUURTRnJEQ0ZnbTdEMnNtNUo4d2NNM1lUckVsVEJ0V2o0?=
 =?utf-8?B?UE9CNkxwUXhhZW5KYTdFNGsvbHFVeU94L0t4UXE5SDdIK0I5bTVpTXpYSWgr?=
 =?utf-8?B?ZWFySGR5UEhUcXdxVERrRVZnZXJWYXR1anlFUkhYa2I1b3dtNXRFT1pia2Yx?=
 =?utf-8?B?d0NXanZEVFYrQk15Qjcra2R4QUUzZkZxWnFuQlhvajhZekkyNE5YUnlqR1h4?=
 =?utf-8?B?bFI5bFBhTXRzMnZDZzVRVmk4RUZMYkt4ekFkaWFwT053ZFZkTHNoaUtOZnla?=
 =?utf-8?B?Uk5leFRNYzgyMUY4UWFCWDlRRUNOdUdoeDdSYWN1bndTT0tsR241YkZkaFhx?=
 =?utf-8?B?QTRna2JUYnZ2WHYvK2hGaktSVDNwNm1KSS9kOHVCemY3NDN0c3AzdG55U1B5?=
 =?utf-8?B?cC9IdnFVOGhPRGVyd3dqd2JPQU5qVVhJajRFcFc2VHVyVGlVZFZxUlRBQk9l?=
 =?utf-8?B?dzRjMFFaYkp6MzRKYTlKbnkzZVFEYTZFQlQ5WmQxTVhwcTlPby9iQWw4MDg0?=
 =?utf-8?B?ajc2cnBFQSs5Qmh0UDRsZlZBbFBVK3hGUHZkSEFCVjZlM1R6aFRvcnVDUEcw?=
 =?utf-8?B?MUZXczdnY2VVbCtVU1JWY3ZNWCtMNjRnZHk3VnE5akVBZFVXemMvN1RQSEpr?=
 =?utf-8?B?T1hrOUFmSXkvOVJLc1VwZy90eHJvODQvNC91OUc0SGtRUVRYODlRYm1aSk9h?=
 =?utf-8?B?TjFpVmpjalpmUkExMXZtTFIyblZCTFZHSi9yYmlhclRzUmpGZkpsUXR5YUFP?=
 =?utf-8?B?T2w3S3lYbnplTlVVYjQ0U2dGcW5zWCt5OGtWQVcxYnRQd2ZjckZKZW5ScVdD?=
 =?utf-8?B?d3hOUjhRbUhCckduVmY1NEhINkNmdXVpZnBidVNEZkUvbEs1cGlScy9RbzlH?=
 =?utf-8?B?aitKc2Q2TzRLSTQxK1YyT05yQXNhYjg2TzZMMFVjOG5tWTlubVJDL1V5MnRT?=
 =?utf-8?B?ME5TN1FkbmxxeDBCbkdVNllLTU1sdUxBUXVlc1pNOUF2d0tqVlkxVDh1RE1u?=
 =?utf-8?B?WHZDZTBrbzk2SHJDckVJUjZ0eG93WittWFc5QWNhaFlGc09oaXlwazZJZlJ0?=
 =?utf-8?B?bWpEaDRMZUxKeVpaMEJmNmhlRTJ6VHlLOHB4S3ZMMDJwSEZnNkxIclZyQldI?=
 =?utf-8?B?RXAxTW9qU01OVjFhaFdhR2QxaXJjVzF0ZGRTelRQbkFJUFZJbGlvM2lLK2t0?=
 =?utf-8?B?MEpBUTNCcER2VXpyT1hwemtYQVFLdzVabWU5NEVVUnh2MzF0TzVNNXdRWkor?=
 =?utf-8?Q?bWR/UMw2vz8laF//JbIA06ebT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QMQq+ifS9ww4cSH1RWg0yjBqZ0XfCCTveaxNwczdjjc1B29o/uoqyyrkjz3NQDXyfQpAowvnc6kENrdDLBLu0wxgi4meEJj8r5hbA9wTYIDmdWs9wuEjiLm1aqJuvsgKoCiwQBhrIQJJ78lujOc9+JN/RVnzO1wMFtvbqOEaMpm7Ty1SolXuLltlz9sUyxhdSfpWC8vF/Yz8qJ1M/O11L1k5/9SICJv6IEdQ1+C+5VbyMGaKNDFo/bWnX+pOU1tZW/KSDUqToO5DPeCxpJozwuL/BcwAc02xvfRoMRgLIXhKJrRQWFvCtuu5qkS0RQ+Lpu9oJXi/z7TW9E9SFXBkVEWip7kY2+1BHJWUbNboROcDkO/qtllR/7fd0KvF7tYm6xXc7BBLriV3BIKGeIhxTy3jchOL0J5PPpYFXujetdFsu9keMWCDNWYjocQXybaEinT8c5j8GqtExGFNychOtgIWtQY/RFo94Kjb54lhycvIRuCzW/OqwPnKdsaAwblEmC9Me0bIoF3jXfF9QmSseyopZfpbMaGJ8tdljdqgz/nQaZJyMBJMQGvErheZ8rjYRn9gimzY59/ABE0XCj/pmB/Rg2sav9mSKAPTNsNFpbgEzajgCPsMbHrb/hfnReZA4e7ulNgsI3Nq/1NLsBO3IHKC3OkoPw6gSe+xPHUMlNqttVcPQ0crxPd/gIbPzCxJbFrnBv+wiiWZV/VYyo9hEVtDKTGUCxN9AqZPQdQoUrPemeTxp9GwDX9xpTb8YzqgbM4gB/Nfx1/bUNmiqXtVK7bE9XNWoaggZ8FBSbgN2heLTuXG8Rz+bzsx+E9D9JPw
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7128f24e-ec8a-4a87-fa31-08db303f6042
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 10:21:36.2100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2E7w6pWb5pGsTV/0r8eXjKOWgRUZxuTvLAw5oLTd1IyoRF/Gv5s/T6wnoWRGsRmRjWmJPZtFUCxsSS/HrWthA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6940

Accesses to the PBA array have the same length and alignment
limitations as accesses to the MSI-X table:

"For all accesses to MSI-X Table and MSI-X PBA fields, software must
use aligned full DWORD or aligned full QWORD transactions; otherwise,
the result is undefined."

Introduce such length and alignment checks into the handling of PBA
accesses for vPCI.  This was a mistake of mine for not reading the
specification correctly.

Note that accesses must now be aligned, and hence there's no longer a
need to check that the end of the access falls into the PBA region as
both the access and the region addresses must be aligned.

Fixes: b177892d2d ('vpci/msix: handle accesses adjacent to the MSI-X table')
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/msix.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 99dd249c15..25bde77586 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -278,6 +278,11 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
     if ( !adjacent_handle(msix, addr + len - 1) )
         return X86EMUL_OKAY;
 
+    if ( VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) &&
+         !access_allowed(msix->pdev, addr, len) )
+        /* PBA accesses must be aligned and 4 or 8 bytes in size. */
+        return X86EMUL_OKAY;
+
     slot = get_slot(vpci, addr);
     if ( slot >= ARRAY_SIZE(msix->table) )
         return X86EMUL_OKAY;
@@ -419,9 +424,8 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
      * assumed to be equal or bigger (8 bytes) than the length of any access
      * handled here.
      */
-    if ( (VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) ||
-          VMSIX_ADDR_IN_RANGE(addr + len - 1, vpci, VPCI_MSIX_PBA)) &&
-         !is_hardware_domain(d) )
+    if ( VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) &&
+         (!access_allowed(msix->pdev, addr, len) || !is_hardware_domain(d)) )
         /* Ignore writes to PBA for DomUs, it's undefined behavior. */
         return X86EMUL_OKAY;
 
-- 
2.40.0


