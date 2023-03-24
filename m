Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748AA6C7DEA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 13:19:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514300.796418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfgN8-0001mi-TG; Fri, 24 Mar 2023 12:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514300.796418; Fri, 24 Mar 2023 12:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfgN8-0001k3-Pi; Fri, 24 Mar 2023 12:18:18 +0000
Received: by outflank-mailman (input) for mailman id 514300;
 Fri, 24 Mar 2023 12:18:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kss1=7Q=citrix.com=prvs=440929507=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pfgN7-0001jx-3y
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 12:18:17 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1e1cbf6-ca3d-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 13:18:13 +0100 (CET)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Mar 2023 08:18:11 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6429.namprd03.prod.outlook.com (2603:10b6:510:b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 12:18:06 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 12:18:06 +0000
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
X-Inumbo-ID: f1e1cbf6-ca3d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679660293;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=L+aecX824IpmwKpxGsM44k3eUcYXg0iSgN4z3fwX9bU=;
  b=fGp5JmRTk7PHgAytmOaXF83eESpGFqGzHrbIrErGbgfg1l2qnxsWDnNJ
   j9aQlmRg8csLOFpbAdYOfWgq6JEyYd70LR+aDU5V2YERoG0xlJ3yQv04o
   w4BYS7jyUZ5U2AP21JyebglamSRwMaecbcDNJjcW9w2ub7Aum1mUztVq3
   M=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 102186767
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8XTEmKmlITp6k6htZS7U1h7o5gyTJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYXW2DOf7fZGH0fYogPYW+9UtTv5DTydVgHgpq/383EyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gOGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dhIBR0dUyuivMiN7+ybW/JFq9sRMNa+aevzulk4pd3YJdAPZMmaBo7tvJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3ieewWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHuhAdJMS+PnnhJsqHzOnjAXERgLblGQnfbg12WRUvcGe
 3VBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQkvsIrQT0h1
 neSgsjkQzdotdWopWm1876VqXa5PnETJGpbPCscF1Javp/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BwpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:gPAxqa0U2HKqC06e7lQM9gqjBQxyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ5expOMG7MBfhHO1OkPYs1NaZLUTbUQ6TTb2KgrGSuwEIdxeOlNK1kJ
 0QDpSWa+eAQWSS7/yKmzVQeuxIqLLsncDY5ts2jU0dNz2CAJsQiDuRfzzra3GeMzM2Y6bReq
 Dsg/Zvln6FQzA6f867Dn4KU6zovNvQjq/rZhYAGloO9BSOpSnA0s+0LzGomjMlFx9fy7Yr9m
 bI1ybj4L+4jv29whjAk0fO8pVtnsf7wNcrPr3DtiFVEESstu+bXvUjZ1SwhkF2nAhp0idurD
 D4mWZhAy200QKUQoj6m2qr5+Cq6kdR15ar8y7ovZKkm72+eNr/YPAx3b6wtXDimhMdVZhHod
 J29nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMMjgZJq3PoiFXluYd49NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonJrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB/aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOYNSRP5uw+zvngehTJYd228LAs23FQgMyPeIbW
X-IronPort-AV: E=Sophos;i="5.98,287,1673931600"; 
   d="scan'208";a="102186767"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwR5VNvDX4c4Qu/LIUZdg2+bPDzKWLXAQPdKjQYJ1DuMA9UOa+G7dInalqJoGpI7IlS3uY9nJp21ltZBJE5yOn4I+rpCZwrx46CNYMqOvrj8yXzKz8xtKFts4Mz6mg/NZozLPZdiGWI+efz73LxUatIuoHQ1uG1KIl45CPVnhcZegSDs55iZnPCg7G2Ty9SliRzQMM0JJ4x252q3H5gR8lt/UJ2QKCID8yDSgSRkH2d+aOkhUrVYBhpObGn6IW3+7Wy7gdA/U3lCWxHeBMis8TYjtdmki9PW6/iR4vFiIYu2JXA7wI5S/wG5lBcerpAatqEe9c9jyvddl6umR7cBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxgzcSseAwCOJwGnx2k5YsX61ejgootbOMxk1s0I3gc=;
 b=JNnSPjmjGK+Ln2YfVOlkdgWAj2UYWcJ6dZNuEhxQ1CXkRMhuM+6aAxjdJOjrz2jTPUWoT0FoWradQ8lAllU/10Iahn5gLXIgZGsZml2fvPdPDYhF2xtU4yTAHddxtaSQCOOVudjPrz02e/Cc6D8coQ4Bzh8DF60TDj/uhHsOeAm7ozIOjuw4MJiYAtRMaNXmJKq/KCFyLw3jeakkUGZNjhGvA+8AtSlDA9MrT/c/XOMATx1yhmtVtrsS9AUjcCyBqABznLpUFgfC5/cD29WoKcMeSg3Wz+CqHOAe7WSB8MguOAn4Opbttn01Luy4Eiq1BKfW4aVFOKPb32LMQz3MYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxgzcSseAwCOJwGnx2k5YsX61ejgootbOMxk1s0I3gc=;
 b=mjBA13DJLrWRz7EEgg1tOocnZ0m3VpH6fNAYh0lM9IEcbP2k6PTW+tiwi1DSHPEgzlFKKROn+csqNHFaLMuGGdju6lSB8LjvBKSN66LoUMKhJZQ7CT7zaENFjnfEInKUKY2j48T4YXP8A9aGJhv97CPcy/88ISk+R0LFty5Yqns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v4] vpci/msix: handle accesses adjacent to the MSI-X table
Date: Fri, 24 Mar 2023 13:17:38 +0100
Message-Id: <20230324121738.4920-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0165.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::8) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 6818fc52-10fe-4793-b797-08db2c61d26a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nz8yxKT35+X/gTEHxnkxcgRFGtsBEs0qPrEsUiV8y3V1YaChhB/FcEgoRIG3NkRIs79ZOGtCE+tEefaQeHYypZwgP/c4XL+E5eYysBOjds+ywBQQaoH4Sq5KPG6DtGvl0r5pX2nZs4GauCb45/3E26v1CeVmdCh0yOALjSEGwH5S75f2L/Py2OlqGy2sA45/Lseny1nsNNiZEiwqQY3MfbOC0VBkOQAI5WXEhFuhkddOiRmk5qqSiZIgwQfzXkPgSdj4QX+BFrieLytgnoHVQowiUY8cW5GnhEiJYgw1xrgl4qZql+uAq9518TcJGotZefSBCfva9I/oW07+qCZ/EqPLMPHAqkyQRWBCJ3NBGLPG0gD8PYx9J9tiQDEpo1IP7p4l6VG2ZFjMZIolHfH3tJsnILPINHYbt5XouHnrtNuQqwN9lKLc7JKqFZlPJf5sX5OC0bzkUZXVthh471PDg5idyf9znLp7/NP2K4i0d4lrq/BB6j973eQISTt5M/VE0iV8bFXoF431p2abRrjSVQJ32juVMuC42ELrEv+o+c9/CstlXof7hvXGhSgqenpynGOXvLLTf/DGsTGaPDFfSrqdsLFv/ltsGw0sxgEPGCqfuuRoLg5RY5g0nFBiMgyi7eFi5QsCrt9QrTSQ/3EM2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199018)(2906002)(38100700002)(478600001)(83380400001)(6486002)(186003)(2616005)(36756003)(86362001)(316002)(66946007)(30864003)(66476007)(8676002)(4326008)(6916009)(66556008)(5660300002)(6666004)(8936002)(1076003)(6506007)(6512007)(26005)(107886003)(41300700001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0pNTXJSeTBYakhELzU1TzgzdDV0M09BMHNQTVVLd2pPeTFhMzNvRGxHMHIz?=
 =?utf-8?B?Ukl2UTJZbWw5Y1NiRlUraWZqRGJSV01DbmZHTVNjODkrSEJnaENsSG5GWkp6?=
 =?utf-8?B?SW93V3FoaVhqUEthc0Q5cG4zZkZNeGgrcVNabkJHUzNPdmd1cGp1alBxUXBt?=
 =?utf-8?B?bHJjQ1l0ejRRa250QzRVV0xZZy96K1BjQzVEeEd0TUlkMDIzMlNzOGwwOUdN?=
 =?utf-8?B?TnFocHkzcVEyOXh3S1d1blBMeWRFWXRkN29GbWtMSXN2eFNOcHNCT3RkNk9v?=
 =?utf-8?B?cjJuSFYxaC9yV0MzMkxTaTFsbTkwSjl6R21lOGVhbXJ1VklUSyt3eVJMejlh?=
 =?utf-8?B?cE8wbmZDUVRYbnc4YlFpRllIaWkrdkxkZlVjQm1EaEhmUFpRb0xMRTRUQzdj?=
 =?utf-8?B?Q1lBWmVnZ0pHUUhXSk80QkxIUWtodUZtSW1sQjF4eW1TZ3VZbXNmU0JYMVBJ?=
 =?utf-8?B?VmFvajJHKytaWkdNdXU0QWFpRVJ1MkNlTU0zY1dhczIyaTdBNjNqK09QbW5p?=
 =?utf-8?B?bnoxSjFSdjZDeVdlSVJOUFYzOVZIU2R5SEJrSlQzZGpHaUhZUHZLRjh0L0o5?=
 =?utf-8?B?a0NQRjJrbEhocXFVRjVIejZxdC9DVHdPS0QzcDJLdVhzWGc4RFVteEZDSEI0?=
 =?utf-8?B?dWZYT2psN2JpbU1oUHo0Zk5qaDRrTHVQUFJ3MFhnblRST2M3b0IvdXB0TnJa?=
 =?utf-8?B?NzZOMXRmZExyd2ZFbkRYTDFNU2NLb05aL3dmYTNWMGZuWDNXMjE4T2JQS0s4?=
 =?utf-8?B?NWtXbHVWOGUyTCtrNjh1QVp1UWtrVWRvaWZva1FzZzhWdEE0cmtmaGtMUjgy?=
 =?utf-8?B?eXN5elBkNTljSjJ1Qm1UVVh5KzNPSE1MSmRiYUlST0FEQnp6U0t0djBqa3c0?=
 =?utf-8?B?aUltaVZGcU9tS3VzRFc0d2JwYjcvNFNob3h2NkkrMzdGcytzaWorR3Q0Uldz?=
 =?utf-8?B?b09PTGthZFVpeWNvOUdnTjROMGw4czRnRm03b0JoY0ZoOUUwaTd4c09aUGpF?=
 =?utf-8?B?V0pKRnJzMFlDTmNaazlWb0JBak1SUDVNcklzYmpidnFEZzV3K01BRU91U3hC?=
 =?utf-8?B?SkhwYjJQOWx1ZTJUSzlNUDY3d3pRWkx6VU5MaTJwMC8vS1paK2NUYnd1bW8z?=
 =?utf-8?B?Qi96aHc0TUxsTUpjK285UjBBYmhWUUhZZmxRNUJ0OWhFSktza3hXSWxmSWNI?=
 =?utf-8?B?OXRES1FNOWlucFV3Um1RNHYxN21tbitWay94VmdOeTNQLzZiZkVtZnA2cVA3?=
 =?utf-8?B?K1JNdjM4bXJiVzlXR1BsM3NVOWhhaUVnUkxsSkQ1aUtaTjNNdEJpWk11cytz?=
 =?utf-8?B?bmJNRlI3SEpCTVprVHlMbVZJT3ZWL2hvajZ5OTcvZnVQdHlzdGorTjB5Qmtj?=
 =?utf-8?B?MUlFZkZBZUhrajBxaHlJU1hJeVI0OWhuQ1ovR0pFWWVwNDJuZlVsQ3ZpQmtx?=
 =?utf-8?B?WGU5T2lHLytjSGZmOUpoUzlYOHRpSkdBTHRHSHZzS093M0E2NXVRRVNQMWcw?=
 =?utf-8?B?eXNZc2lmclkrN0NSOVJVcHRpWHllUkxDbHhWdkI3ZnRnemRMRE8rVGZIRzNU?=
 =?utf-8?B?OVNxOVNDUVpaYXZCcWpsN3hCMnE0TDM5NWJ5YURycTdIR1RlUjhIL2VJY1ZG?=
 =?utf-8?B?RDBoYVBVZkM0NVk4cHdEUXBvOThpUGRrY0xGT0RJRG9pbjMzbzgxVmVIYXBX?=
 =?utf-8?B?OTdORFlCMWV6SzdJbEJCWnlUZUZsNXgwNHFqcW0vZ0l2T2c0RFI4TjVHYS9s?=
 =?utf-8?B?UEFNa0dBclNyb1IvTTZ3Y0oyZ3hqZHJ4Yzdkb1FWTlRlcUFHMmhMWnV5aDhm?=
 =?utf-8?B?REEzZ0c1TExXSWRyMkRNNHNhYW1lUjRScmZ2VnZVeHY0alZiOWpsTFJIbjFq?=
 =?utf-8?B?bjI1RU8xdXl2d0MxWEVOaUh3SHd6UjZ6aTNVTHRZcWF4elBFZVVFTEk2Z3Zk?=
 =?utf-8?B?OGtWbmtkck1Fb0EyRWl4WEJ5aXRDWWVVdEZncFhaQ2k2cmxkdzl3RVkvNXpX?=
 =?utf-8?B?MFJyZnBnOWE2aFc0T0d6eXlLd3J2bVp5RTlhbU1xdi9NZi90TWMyb2RCeHNa?=
 =?utf-8?B?WThjUWZuMDJIdEorMlVzMEJaNHNDTEFGUiszZTI3SEFQVm9INHBmYm5LOWd2?=
 =?utf-8?B?QmZzdXFSREFmVHlIUzVZSDZ3bXNZeVFzNWZJazdsRGtlK25jb0xlSVpKeXEr?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r0jBExTF7BsluidOatQvxytQ2kBoMWS9+zt1i/+sjOTUUrlhaEIqejJ4VPhJQ4izoLIJVEfI9sadKjBSe1lkaMT+kQjr7/uIDltSrxZmmBHJqWuNOUCoICwO+Bb7MievC70UN7IVF7AMEqR7U0qmj4fTzISC42BrkU8zbQlCBPqtvdnjJ33qFHP4zo1H719wro4Wm2Xebgdh8ttV057aSQg8SLMVRdpbdBDmhUX3KkrOWUOyPD4FSUALVTxr4um7oQWP0RwiE3YaJbngJp/bsvFUOhn6Esr/FPnijGUeqNGgkmw+rb7A7p9xSSoo0Be606OXIu0OcBxsd1/PmtYaBUq99JL5R+HF/mUzO04YIPK6Re3uvUhTUJRQRplbGoMsn6rR7gpkUEVO4t8Ub1b2May9G5tH4oZVEe99Z1ey9yRhiJi+RfQzE3J9G2R6Dh327UiJ00DdNo14tlmLENyLa2rxAK9F+VfILtLuQFH8GB+ubEIyuaarx43f1aLp17qhPtOD8Ldp2T3R/RSLNNiyVp2w+943kzr9bvQvHbLknXuWFjG4knPIhmv0B0QBPzItfUGMSy77AQergVon1KwIz2Bg0vWnNSzBg6oH71r5xgDi0XxHMg747++neNg/mS+o3V7Qrz1Hsb1ry6c4IWcClaLhdCrVuX2sYRIY9n6U4uFho+SzuzO/CQ/1zH+XKROk8uYrrANnk9YeMLVJ7zH4/NkcwwDXEYMazb33b9zFwun77rwEOwSyzZMXGNgS9VIqid9ODrShxvk9MUifvMAJT6nWeA+YMqNfqkKrdEv9xgBMGM7KahzB1mF2PX+IiGd6
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6818fc52-10fe-4793-b797-08db2c61d26a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 12:18:05.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbM8cAJzcYFxsD5ztYj+t8y2ecAte1qECMmEWvcnAjMJR+gEJHLA6uUwphOSVRefaksNvNeHWTLUBJxVRFDHJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6429

The handling of the MSI-X table accesses by Xen requires that any
pages part of the MSI-X related tables are not mapped into the domain
physmap.  As a result, any device registers in the same pages as the
start or the end of the MSIX or PBA tables is not currently
accessible, as the accesses are just dropped.

Note the spec forbids such placing of registers, as the MSIX and PBA
tables must be 4K isolated from any other registers:

"If a Base Address register that maps address space for the MSI-X
Table or MSI-X PBA also maps other usable address space that is not
associated with MSI-X structures, locations (e.g., for CSRs) used in
the other address space must not share any naturally aligned 4-KB
address range with one where either MSI-X structure resides."

Yet the 'Intel Wi-Fi 6 AX201' device on one of my boxes has registers
in the same page as the MSIX tables, and thus won't work on a PVH dom0
without this fix.

In order to cope with the behavior passthrough any accesses that fall
on the same page as the MSIX tables (but don't fall in between) to the
underlying hardware.  Such forwarding also takes care of the PBA
accesses, so it allows to remove the code doing this handling in
msix_{read,write}.  Note that as a result accesses to the PBA array
are no longer limited to 4 and 8 byte sizes, there's no access size
restriction for PBA accesses documented in the specification.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Keep the vpci lock taken for the duration of the access to the
   mapped region.
 - Move back the handling of unaligned accesses before getting the
   table map.

Changes since v2:
 - Slightly adjust VMSIX_ADDR_SAME_PAGE().
 - Use IS_ALIGNED and unlikely for the non-aligned access checking.
 - Move the check for the page mapped before the aligned one.
 - Remove cast of data to uint8_t and instead use a mask in order to
   avoid undefined behaviour when shifting.
 - Remove Xen maps of the MSIX related regions when memory decoding
   for the device is enabled by dom0, in order to purge stale maps.

Changes since v1:
 - Properly handle the PBA also.
 - Merge the handlers for adjacent writes into the existing MSIX table
   ones.
---
 xen/drivers/vpci/msix.c | 349 +++++++++++++++++++++++++++++-----------
 xen/drivers/vpci/vpci.c |   7 +-
 xen/include/xen/vpci.h  |   8 +-
 3 files changed, 269 insertions(+), 95 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index bea0cc7aed..99dd249c15 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -27,6 +27,11 @@
     ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
      (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
 
+#define VMSIX_ADDR_SAME_PAGE(addr, vpci, nr)                              \
+    (PFN_DOWN(addr) >= PFN_DOWN(vmsix_table_addr(vpci, nr)) &&            \
+     PFN_DOWN(addr) <= PFN_DOWN(vmsix_table_addr(vpci, nr) +              \
+                                vmsix_table_size(vpci, nr) - 1))
+
 static uint32_t cf_check control_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
@@ -149,7 +154,7 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 
         for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
             if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
-                 VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
+                 VMSIX_ADDR_SAME_PAGE(addr, msix->pdev->vpci, i) )
                 return msix;
     }
 
@@ -182,36 +187,167 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
     return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
 }
 
-static void __iomem *get_pba(struct vpci *vpci)
+static void __iomem *get_table(const struct vpci *vpci, unsigned int slot)
 {
     struct vpci_msix *msix = vpci->msix;
+    paddr_t addr = 0;
+
+    ASSERT(spin_is_locked(&vpci->lock));
+
+    if ( likely(msix->table[slot]) )
+        return msix->table[slot];
+
+    switch ( slot )
+    {
+    case VPCI_MSIX_TBL_TAIL:
+        addr = vmsix_table_size(vpci, VPCI_MSIX_TABLE);
+        fallthrough;
+    case VPCI_MSIX_TBL_HEAD:
+        addr += vmsix_table_addr(vpci, VPCI_MSIX_TABLE);
+        break;
+
+    case VPCI_MSIX_PBA_TAIL:
+        addr = vmsix_table_size(vpci, VPCI_MSIX_PBA);
+        fallthrough;
+    case VPCI_MSIX_PBA_HEAD:
+        addr += vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        return NULL;
+    }
+
+    msix->table[slot] = ioremap(round_pgdown(addr), PAGE_SIZE);
+
+    return msix->table[slot];
+}
+
+unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
+{
+    unsigned long pfn = PFN_DOWN(addr);
+
     /*
-     * PBA will only be unmapped when the device is deassigned, so access it
-     * without holding the vpci lock.
+     * The logic below relies on having the tables identity mapped to the guest
+     * address space, or for the `addr` parameter to be translated into its
+     * host physical memory address equivalent.
      */
-    void __iomem *pba = read_atomic(&msix->pba);
 
-    if ( likely(pba) )
-        return pba;
+    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_TABLE)) )
+        return VPCI_MSIX_TBL_HEAD;
+    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_TABLE) +
+                         vmsix_table_size(vpci, VPCI_MSIX_TABLE) - 1) )
+        return VPCI_MSIX_TBL_TAIL;
+    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_PBA)) )
+        return VPCI_MSIX_PBA_HEAD;
+    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_PBA) +
+                         vmsix_table_size(vpci, VPCI_MSIX_PBA) - 1) )
+        return VPCI_MSIX_PBA_TAIL;
+
+    ASSERT_UNREACHABLE();
+    return -1;
+}
+
+static bool adjacent_handle(const struct vpci_msix *msix, unsigned long addr)
+{
+    unsigned int i;
+
+    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
+        return true;
+
+    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_TABLE) )
+        return false;
+
+    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
+        if ( VMSIX_ADDR_SAME_PAGE(addr, msix->pdev->vpci, i) )
+            return true;
+
+    return false;
+}
+
+static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
+                         unsigned long addr, unsigned int len,
+                         unsigned long *data)
+{
+    const void __iomem *mem;
+    struct vpci *vpci = msix->pdev->vpci;
+    unsigned int slot;
+
+    *data = ~0ul;
+
+    if ( !adjacent_handle(msix, addr + len - 1) )
+        return X86EMUL_OKAY;
+
+    slot = get_slot(vpci, addr);
+    if ( slot >= ARRAY_SIZE(msix->table) )
+        return X86EMUL_OKAY;
+
+    if ( unlikely(!IS_ALIGNED(addr, len)) )
+    {
+        unsigned int i;
+
+        gprintk(XENLOG_DEBUG, "%pp: unaligned read to MSI-X related page\n",
+                &msix->pdev->sbdf);
+
+        /*
+         * Split unaligned accesses into byte sized ones. Shouldn't happen in
+         * the first place, but devices shouldn't have registers in the same 4K
+         * page as the MSIX tables either.
+         *
+         * It's unclear whether this could cause issues if a guest expects
+         * registers to be accessed atomically, it better use an aligned access
+         * if it has such expectations.
+         */
+        for ( i = 0; i < len; i++ )
+        {
+            unsigned long partial = ~0ul;
+            int rc = adjacent_read(d, msix, addr + i, 1, &partial);
+
+            if ( rc != X86EMUL_OKAY )
+                return rc;
+
+            *data &= ~(0xfful << (i * 8));
+            *data |= (partial & 0xff) << (i * 8);
+        }
 
-    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
-                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
-    if ( !pba )
-        return read_atomic(&msix->pba);
+        return X86EMUL_OKAY;
+    }
 
     spin_lock(&vpci->lock);
-    if ( !msix->pba )
+    mem = get_table(vpci, slot);
+    if ( !mem )
     {
-        write_atomic(&msix->pba, pba);
         spin_unlock(&vpci->lock);
+        gprintk(XENLOG_WARNING,
+                "%pp: unable to map MSI-X page, returning all bits set\n",
+                &msix->pdev->sbdf);
+        return X86EMUL_OKAY;
     }
-    else
+
+    switch ( len )
     {
-        spin_unlock(&vpci->lock);
-        iounmap(pba);
+    case 1:
+        *data = readb(mem + PAGE_OFFSET(addr));
+        break;
+
+    case 2:
+        *data = readw(mem + PAGE_OFFSET(addr));
+        break;
+
+    case 4:
+        *data = readl(mem + PAGE_OFFSET(addr));
+        break;
+
+    case 8:
+        *data = readq(mem + PAGE_OFFSET(addr));
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
     }
+    spin_unlock(&vpci->lock);
 
-    return read_atomic(&msix->pba);
+    return X86EMUL_OKAY;
 }
 
 static int cf_check msix_read(
@@ -227,47 +363,11 @@ static int cf_check msix_read(
     if ( !msix )
         return X86EMUL_RETRY;
 
-    if ( !access_allowed(msix->pdev, addr, len) )
-        return X86EMUL_OKAY;
-
-    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
-    {
-        struct vpci *vpci = msix->pdev->vpci;
-        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
-        const void __iomem *pba = get_pba(vpci);
-
-        /*
-         * Access to PBA.
-         *
-         * TODO: note that this relies on having the PBA identity mapped to the
-         * guest address space. If this changes the address will need to be
-         * translated.
-         */
-        if ( !pba )
-        {
-            gprintk(XENLOG_WARNING,
-                    "%pp: unable to map MSI-X PBA, report all pending\n",
-                    &msix->pdev->sbdf);
-            return X86EMUL_OKAY;
-        }
-
-        switch ( len )
-        {
-        case 4:
-            *data = readl(pba + idx);
-            break;
-
-        case 8:
-            *data = readq(pba + idx);
-            break;
-
-        default:
-            ASSERT_UNREACHABLE();
-            break;
-        }
+    if ( adjacent_handle(msix, addr) )
+        return adjacent_read(d, msix, addr, len, data);
 
+    if ( !access_allowed(msix->pdev, addr, len) )
         return X86EMUL_OKAY;
-    }
 
     spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
@@ -303,56 +403,103 @@ static int cf_check msix_read(
     return X86EMUL_OKAY;
 }
 
-static int cf_check msix_write(
-    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
+static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
+                          unsigned long addr, unsigned int len,
+                          unsigned long data)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
-    struct vpci_msix_entry *entry;
-    unsigned int offset;
+    void __iomem *mem;
+    struct vpci *vpci = msix->pdev->vpci;
+    unsigned int slot;
 
-    if ( !msix )
-        return X86EMUL_RETRY;
+    if ( !adjacent_handle(msix, addr + len - 1) )
+        return X86EMUL_OKAY;
 
-    if ( !access_allowed(msix->pdev, addr, len) )
+    /*
+     * Only check start and end of the access because the size of the PBA is
+     * assumed to be equal or bigger (8 bytes) than the length of any access
+     * handled here.
+     */
+    if ( (VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) ||
+          VMSIX_ADDR_IN_RANGE(addr + len - 1, vpci, VPCI_MSIX_PBA)) &&
+         !is_hardware_domain(d) )
+        /* Ignore writes to PBA for DomUs, it's undefined behavior. */
         return X86EMUL_OKAY;
 
-    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
+    slot = get_slot(vpci, addr);
+    if ( slot >= ARRAY_SIZE(msix->table) )
+        return X86EMUL_OKAY;
+
+    if ( unlikely(!IS_ALIGNED(addr, len)) )
     {
-        struct vpci *vpci = msix->pdev->vpci;
-        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
-        const void __iomem *pba = get_pba(vpci);
+        unsigned int i;
 
-        if ( !is_hardware_domain(d) )
-            /* Ignore writes to PBA for DomUs, it's behavior is undefined. */
-            return X86EMUL_OKAY;
+        gprintk(XENLOG_DEBUG, "%pp: unaligned write to MSI-X related page\n",
+                &msix->pdev->sbdf);
 
-        if ( !pba )
+        for ( i = 0; i < len; i++ )
         {
-            /* Unable to map the PBA, ignore write. */
-            gprintk(XENLOG_WARNING,
-                    "%pp: unable to map MSI-X PBA, write ignored\n",
-                    &msix->pdev->sbdf);
-            return X86EMUL_OKAY;
+            int rc = adjacent_write(d, msix, addr + i, 1, data >> (i * 8));
+
+            if ( rc != X86EMUL_OKAY )
+                return rc;
         }
 
-        switch ( len )
-        {
-        case 4:
-            writel(data, pba + idx);
-            break;
+        return X86EMUL_OKAY;
+    }
 
-        case 8:
-            writeq(data, pba + idx);
-            break;
+    spin_lock(&vpci->lock);
+    mem = get_table(vpci, slot);
+    if ( !mem )
+    {
+        spin_unlock(&vpci->lock);
+        gprintk(XENLOG_WARNING,
+                "%pp: unable to map MSI-X page, dropping write\n",
+                &msix->pdev->sbdf);
+        return X86EMUL_OKAY;
+    }
 
-        default:
-            ASSERT_UNREACHABLE();
-            break;
-        }
+    switch ( len )
+    {
+    case 1:
+        writeb(data, mem + PAGE_OFFSET(addr));
+        break;
 
-        return X86EMUL_OKAY;
+    case 2:
+        writew(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    case 4:
+        writel(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    case 8:
+        writeq(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
     }
+    spin_unlock(&vpci->lock);
+
+    return X86EMUL_OKAY;
+}
+
+static int cf_check msix_write(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
+{
+    const struct domain *d = v->domain;
+    struct vpci_msix *msix = msix_find(d, addr);
+    struct vpci_msix_entry *entry;
+    unsigned int offset;
+
+    if ( !msix )
+        return X86EMUL_RETRY;
+
+    if ( adjacent_handle(msix, addr) )
+        return adjacent_write(d, msix, addr, len, data);
+
+    if ( !access_allowed(msix->pdev, addr, len) )
+        return X86EMUL_OKAY;
 
     spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
@@ -482,6 +629,26 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
         }
     }
 
+    if ( is_hardware_domain(d) )
+    {
+        /*
+         * For dom0 only: remove any hypervisor mappings of the MSIX or PBA
+         * related areas, as dom0 is capable of moving the position of the BARs
+         * in the host address space.
+         *
+         * We rely on being called with the vPCI lock held once the domain is
+         * running, so the maps are not in use.
+         */
+        for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->table); i++ )
+            if ( pdev->vpci->msix->table[i] )
+            {
+                /* If there are any maps, the domain must be running. */
+                ASSERT(spin_is_locked(&pdev->vpci->lock));
+                iounmap(pdev->vpci->msix->table[i]);
+                pdev->vpci->msix->table[i] = NULL;
+            }
+    }
+
     return 0;
 }
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 6d48d496bb..652807a4a4 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -54,9 +54,12 @@ void vpci_remove_device(struct pci_dev *pdev)
     spin_unlock(&pdev->vpci->lock);
     if ( pdev->vpci->msix )
     {
+        unsigned int i;
+
         list_del(&pdev->vpci->msix->next);
-        if ( pdev->vpci->msix->pba )
-            iounmap(pdev->vpci->msix->pba);
+        for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->table); i++ )
+            if ( pdev->vpci->msix->table[i] )
+                iounmap(pdev->vpci->msix->table[i]);
     }
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index d8acfeba8a..0b8a2a3c74 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -133,8 +133,12 @@ struct vpci {
         bool enabled         : 1;
         /* Masked? */
         bool masked          : 1;
-        /* PBA map */
-        void __iomem *pba;
+        /* Partial table map. */
+#define VPCI_MSIX_TBL_HEAD 0
+#define VPCI_MSIX_TBL_TAIL 1
+#define VPCI_MSIX_PBA_HEAD 2
+#define VPCI_MSIX_PBA_TAIL 3
+        void __iomem *table[4];
         /* Entries. */
         struct vpci_msix_entry {
             uint64_t addr;
-- 
2.40.0


