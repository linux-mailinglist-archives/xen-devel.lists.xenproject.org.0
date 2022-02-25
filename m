Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BAA4C494F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279468.477188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNche-0007ap-Bj; Fri, 25 Feb 2022 15:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279468.477188; Fri, 25 Feb 2022 15:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNche-0007Yn-8J; Fri, 25 Feb 2022 15:40:18 +0000
Received: by outflank-mailman (input) for mailman id 279468;
 Fri, 25 Feb 2022 15:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfiy=TI=citrix.com=prvs=0484f4aa7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNchc-0005ID-JM
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:40:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 391bd44e-9651-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:40:15 +0100 (CET)
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
X-Inumbo-ID: 391bd44e-9651-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645803615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8CnV1YFo7Tb5Y161XjRmYx5MERlsmjdyjjYLhh+ReR8=;
  b=W2gANz99Pq1EQMyZHvwrg+fqJZx4GoEDkLrcQ7g2ycW3xStfSbfFol2H
   46usqkvRJu659J5tjs843Nb8JS5EvL8TOKXBGQYZ7cgTYxsL0KxJUsSg7
   Wzx1eVVEJx3o8Y6WZ3vTxD0UuDd/CNSPANpnju8oQNhbA7o0EQZwgqf9x
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65000615
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Olo6a6Igte+8JZNxFE+R2pUlxSXFcZb7ZxGr2PjKsXjdYENShDFTz
 WFKWGrVMveOYGSme9t2aNu2/BgHsMTXxtJjQQJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2NQ12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MxQiI2ibS0xApDngu4geUd9OSZeB5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glt3pgWQ6+DD
 yYfQSdKVQzCQxFxBmgOS5w6vsiF3liuKAQN/Tp5ooJoujOOnWSdyoPFLNrUYZqLXoNcxkKDo
 WTu8GHwAxVcP9uaoRKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdwSlnW+WmjQEZ+d7CecHwl+o4K302T/MUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalu1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AjPNAuBRPtfNi2mUBb7zt6cowGGxFATpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxpiH/JNwNuGkmfC+F1/ronxezM
 Sc/XisLufdu0IaCN/crM+pd9exwpUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Eb5rak0gECbamCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnnMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:+2hXFam4qlAkMUL0DNIQD7OknZnpDfPIimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPlICO4qTMiftWjdyReVxeRZjLcKrAeQYhEWmtQtsJ
 uINpIOcuEYbmIK/foSgjPIa+rIqePvmMvD6Ja8vhVQpENRGtxdBm9Ce3em+yZNNW977PQCZf
 6hDp0tnUvfRZ1bVLXxOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mJryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idhrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1/DRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNLd3AL3Z
 WBDk1SrsA9ciYnV9MPOA4/e7rDNoW0e2O2DIuzGyWvKEhVAQOEl3bIiI9FkN1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="65000615"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeReTPUdOael0apFxFejlRkY4U3ONSJp1KAgTpV3S1LL4deGgIzdNzPM4cjM3j1X+xSsYCklBCwudF8vUVeW1KfCff8UcneTnCt9l8kdHSf/qMHRxFDASw/knFpxYc9e+zkysmzBwYLxFtRvNQSoR3C1CDohPJY2f0rgveKokS9yWYJ8d8FXKGLK9OzXXp7AvRfNntDk+QtzrErUuRtVjeSDXy23ON5tAORPc5/HLmqtL3fFf59XwDPFBLITY1Xv/razPSg8a14AcbGUqZxU8D4ZIUHp1xqwU9GIE3FBEcozaIArVIEvul6xspmdJLLWyZlFtgAgIhpJaGI5wJKHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xQx3p2gIUoOaj3d39MS75urWwINz7VNe9IUM3IGjb4=;
 b=GfnsmJ7mXOiBfypO4BPJ/ujEsTqW2eefbBeM3we05cJRFcsqzKAIgDB3b4cb9I/a7JlEtPyyUM5BPextIeEbzXq+o56eFYsgJHcrdzamXVmu6nzZArpZbc6yRPNe/J0HWKWaS3AEcxUuVyGwzTc8cO0VuRgDFGCV3ojJKeER7VoOgiz6Zya8uR3gqMf3LRA7wDpkiipKexgonb+AQKgxmy/a/ayipUGURki0kuw8o42s4eQkYy3dNhJZcD1cpYEzDwRuHONc7U0bYLaMxfuvrNj9rIKacVMs71UKmgeDMA0f4HW+F142GfG3g5nbq1tUikoT6RuhWFruCbzDHndKNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xQx3p2gIUoOaj3d39MS75urWwINz7VNe9IUM3IGjb4=;
 b=GidsEg8DFSXjBL1Tol9f9BWi1b8hc5h8ZT8exLV7/5Cf+etkDxAlgOL4yCehOrox0sLjhSfRNJFmbQZfsdfD+KQbBdYVeVTlVAWzFERrc/gF9ZyX96VR5xEhrokdLERiRXxvur+p4xa+fW/Icw/TxPl66y7r0tRmbnx5e5HwhpA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Alex Olson <this.is.a0lson@gmail.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH v2 1/2] vpci/msix: reduce indentation in msix_write PBA handling
Date: Fri, 25 Feb 2022 16:39:55 +0100
Message-ID: <20220225153956.1078-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220225153956.1078-1-roger.pau@citrix.com>
References: <20220225153956.1078-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0324.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 019e133d-9591-4d66-7409-08d9f8751a94
X-MS-TrafficTypeDiagnostic: SN6PR03MB3982:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB39825A984702F7AD78C802D28F3E9@SN6PR03MB3982.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S47bMAshBVi46FtOzdks/NOl01WwW67ADrmZD5p7cKYx2HDGU1nfSc/5EhC1+NA+Ak36baT7sGKyeFySNLUCurOk0iTgj68+zgaUYRvxWhjK5urDkjQhk236kr8m3tre8fsJ/sg+/lIGPR4ULC7/7u014f35g6RYpE1Eu7kqWYyw40SExhCbFKIi+aYHDUVZ7gjiHhCHFFwWZjs8SuQ9xRclJAMz9N2Hpn4De+puIf0yM75l476QeUKX0a3/Bo6NOzVqV0l27E/0ycQAuqfO24kffl86BJoLhJDMf1epcTRf5mZ4oDVZuZqSpi9F3yTEvAH5I8gVnkP71n2up2UXK1YDs2qH7cfUzG/R/4poBEBUDcHr0yHQUz2L9HY1nsTktJ/qa8WEaHCD120emdDnLVDaIkHdbZqa6QGasNmUWN+hh2Qy4RK/mP24NZaZOpA03el+I3nFEN53ANXG8+wLNU29GiaBNz0St3cbuP4w4JqPXpslvkP5uvPPil5FHqKJpJCRLQkwhl8bI0imUnsiGeuLDw7HtYDtgIq8SUQ0liLptdWwr2i0kZ5VmxhCnAUTmBZkFC0edZanrL4/fV1YSeY1e/Hm7Yw963xkPGqKb/IreQfdY3MFKShHEA19q6wXCqf/szbfVKqNAa6eTB/ZGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(1076003)(82960400001)(6916009)(83380400001)(6666004)(54906003)(86362001)(2906002)(26005)(8936002)(107886003)(186003)(36756003)(316002)(6486002)(66476007)(66556008)(5660300002)(508600001)(2616005)(8676002)(6506007)(66946007)(4326008)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckFwSUlKMUhNdDJhZ2N5aHJFNy8xejQvNEtIa29CNEpsOU9Sa2lJd0RyWlA3?=
 =?utf-8?B?d2RZcFc2OWwrQmRHVFFBbEdZZUZJWS9Pc1BvWkErK3p3VDNvMjZubzZpVHhQ?=
 =?utf-8?B?TXBIM29zeDNqMW82RDFONUgwc2dwT2U2TjN0K2xGZWF3dllyM2h5VWp3Ty9n?=
 =?utf-8?B?d1hVcnc3bDZ4OGlUb1BiUm5Id0VCZ1ZZZHVqUUJDblRzd3Y4QW9BU0VzNzF0?=
 =?utf-8?B?Yzd5WWVENDA1TWNMWGFWaFczWkVBaGtXVnB4Y0htNVJFK2ZNeGhuRURIMjdX?=
 =?utf-8?B?NWVIT2pwRG4yRHQwUmRZZ0hrbThaK2RsaWdXbDZaUllodk84M2hpVUFCUG5w?=
 =?utf-8?B?NlZEUHFFZmw4aDRZdnZVZFladDVIOSt2Q2ovRkJralVaM053aHBKZnFSd20y?=
 =?utf-8?B?cmtsT0FydklVazdwdHdLU1BiV1ZPamdKalJUWUpyRk4zTlJ2dTlRWjdpa2xK?=
 =?utf-8?B?TkVBZlYvSmVIUldSemw1eWF4aCtleVhKdnZaakpLUDZVam5QU3liVzdZbjVj?=
 =?utf-8?B?UXNmQkxEMjVieFFhNFpvemRzSWdGcWdWQmU4QVI2TlZPTHI1S1U2bHNLQUVi?=
 =?utf-8?B?YnhVcW54QUg5dVkwZGpSTzZuU0ZxQjRHZkhKaDZSaTlRa05KcVV3d08zM3Iv?=
 =?utf-8?B?emtWRkJheGZ5ZVAzaWlUS0J2UjJ1VXF0STJGMWxiWXRkRk9oVHJib082aDBW?=
 =?utf-8?B?dXRSMnE4Qi9MenlqckJzclZQbGhGcjBlTnhwRENpQTNKWFRBSjFyK1JBb3kw?=
 =?utf-8?B?NmZ6SXlMdnM4MjM3ZlBZSlI2eEJSOGFhaHRQMlYzOUdCL3ZzUkYwOVgxaVBF?=
 =?utf-8?B?U3laQkNIdmNZeXJYR0lZSm5wMEpackdSdDNaQTR4aTVwbFAyY1dHME4zQmJl?=
 =?utf-8?B?QU8yVkEzZzE3K20wMmxPaUFHZmRiYUt5R25DZDBxSjI1NFdDeXhtNHgvZGdP?=
 =?utf-8?B?ak9lOG1Ba1hhYUpRdENhUUVHRkhUWnZjZ1J2aXROTFM2OVVmQlp0ZmtwNENP?=
 =?utf-8?B?cU9ydVh4aG9yS2V6R2t0blF6TVg5UVFBMVppdEhvQVNTbk1zeS9qSTE3SjZC?=
 =?utf-8?B?c2U3b01HTlVOeUR3OFQ5bkF1RmkwK2FQY0txZzdVZ2NoNG9BZDdwZ0VFWmt0?=
 =?utf-8?B?bDh0NWJxZ0M3c1JUKzF1TjRtZ0VWWUNSbmZyMDBBRFc5dGNhc3UyMkt3RGJ3?=
 =?utf-8?B?MHY0RngvUWM3VllRLzVOSENuZDF1cHFxdEV0NTdZRWlabGUwaWV2dWtKSFVC?=
 =?utf-8?B?S2hSQTFnejRsTnNhelprK3lSZzdiS3ljVGZ0SFpqK2RWQUwra09WbjgrR1ZT?=
 =?utf-8?B?czBwU1lhR2d0SEhkcmRzYjFwV3FsS3k0cXFMV3JSVkNnSWx6c01nbkhtQVZ5?=
 =?utf-8?B?YVFaU0t6RGo4M0dSTkVaV0xjR1ZhckRyUzRjeFZGU2ZQNTdaMlB1UXZxQU94?=
 =?utf-8?B?SWp1eXFYREVqMDJsaEl1L1hOWUFhQXozbFRta3VXQ1JlOWJEK1JJVUxOaThs?=
 =?utf-8?B?NmVqRlBJamIyeVlueFJhemdleUlxRTVyQnVhS0xsTWIyU29IVi84cFVoNTF2?=
 =?utf-8?B?Tmo5U1BsQUdBYld5UWEycjkvNzIvTzU2dTJhM0MwajJDaGFHN3FrVWVteFV1?=
 =?utf-8?B?VklGelpvRDZqQnRiOHk4QWZYUW9wRFM1aUZldFRSczNhRGZWdmg1MmttZGdK?=
 =?utf-8?B?QXZ3aDY5VDBSWTgvSVVRdVpISUF1MkRIQjJVUkRDWWlZZVpPWGF0NUVBSFVH?=
 =?utf-8?B?R3FCT3ZWSHhGMjZFZUpmSCtiTzUxQS9YSW5TMkc1RjAwYitva3QvcDFiWkRE?=
 =?utf-8?B?RklqMzl3MHJ0N2N2QzdRRGhJUlU5UjNsWVlYRVMwdFJZdDl0ZHRLa3VnZWJ1?=
 =?utf-8?B?aHdlQ0ZJdWZ2YWg3R3pyaHM1amthU3hubTBpbFF4Snl5bkgrdXZlcGFzS09U?=
 =?utf-8?B?eDkzUTlWUzUzSFVZNVpObW9zSnpycGREbUdNQjBZQmJxUE9BQTlNRjU4WVEy?=
 =?utf-8?B?bUdoMDd4dnNydkR3TStUc2s3MEI5SkplV09xL1RvU2VGcVhhMXdqOUw5RTEy?=
 =?utf-8?B?RFVYdEZ5eWpsSDRmQjQwUDBHOGlTV0dYaGVpMms0TjdGeTJneFkwMHRWY2Rz?=
 =?utf-8?B?VnN0VkVDTmhhMDVaUlp4RDZWLzNielFqWThnRHNOY0V1Y05QMUtGTkQrOEM2?=
 =?utf-8?Q?9RQqnJbfl3VnyCS3zyGSFzk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 019e133d-9591-4d66-7409-08d9f8751a94
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 15:40:09.2009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3/FX7Q4cgDwcv4otIBIBF6NVElerJVn7GaIDjzqhYSEAZmlo+dY9SR6DPpHH9GJjj/HgLKLGlH0w25Uaz7Cjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3982
X-OriginatorOrg: citrix.com

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/vpci/msix.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 2ab4079412..a1fa7a5f13 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -275,23 +275,24 @@ static int cf_check msix_write(
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
-        /* Ignore writes to PBA for DomUs, it's behavior is undefined. */
-        if ( is_hardware_domain(d) )
+
+        if ( !is_hardware_domain(d) )
+            /* Ignore writes to PBA for DomUs, it's behavior is undefined. */
+            return X86EMUL_OKAY;
+
+        switch ( len )
         {
-            switch ( len )
-            {
-            case 4:
-                writel(data, addr);
-                break;
+        case 4:
+            writel(data, addr);
+            break;
 
-            case 8:
-                writeq(data, addr);
-                break;
+        case 8:
+            writeq(data, addr);
+            break;
 
-            default:
-                ASSERT_UNREACHABLE();
-                break;
-            }
+        default:
+            ASSERT_UNREACHABLE();
+            break;
         }
 
         return X86EMUL_OKAY;
-- 
2.34.1


