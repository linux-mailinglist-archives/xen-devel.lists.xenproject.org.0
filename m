Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C570E766FFB
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 17:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571492.895480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPOx2-00021h-O6; Fri, 28 Jul 2023 15:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571492.895480; Fri, 28 Jul 2023 15:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPOx2-0001zc-LE; Fri, 28 Jul 2023 15:00:20 +0000
Received: by outflank-mailman (input) for mailman id 571492;
 Fri, 28 Jul 2023 15:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UUpw=DO=citrix.com=prvs=566eed887=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qPOx1-0001Ov-Qc
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 15:00:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 763b37df-2d57-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 17:00:18 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jul 2023 11:00:07 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH0PR03MB6036.namprd03.prod.outlook.com (2603:10b6:610:bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 15:00:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 15:00:00 +0000
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
X-Inumbo-ID: 763b37df-2d57-11ee-b24d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690556418;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=7D19uLmGjZGAO/qNM7axaDAHovChSZ8H5rumbbRz9fo=;
  b=KBgl8uODLdmE0p80BoxXV9OlipMQFznBoerziU+Uk9iz9QxhQLfqOp5x
   6pmoqsdqDHXP+58L+cbSHhYJKBx8Vnxg3q5GIvob7WrCxNUg7D9bcz80Z
   bp+6ZuCTlf4CK/VZbJAD1Z55p2QEcygyyEgwFMv/Bq8wxXhhFjvC3Dwb6
   U=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 120420115
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0/eSqqvS7tE/z6mD1JNkBIP1GOfnVJhfMUV32f8akzHdYApBsoF/q
 tZmKWyDafqOZGD8L9F+btu0o0kEsJeGn4NkTgVuqSk0HnxB+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5ACExyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMgkQVSGGq8iKy7u1eshtvPs8HZLmM9ZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60boq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtpOTuXhr6MCbFu7+GwMEiEKXEeBhd6msUiDdcB8G
 14f9X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRUcAeCsFQA0t89Tl5oYpgXrnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqY2O76T+FnGh3emoMjPRwtsvwHPBDv7vkV+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHRvHNKxzFF6afQL1t
IronPort-HdrOrdr: A9a23:l1vRmK0YkhZYgdMJAIhF6gqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-Talos-CUID: 9a23:cLhlm2GxmGvck/t9qmJ9zVMvK8UJWEHWxXngAk6CNnlYE7CaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A5W8NkQ85GX0p7NkcVqrGvWeQf/lo/L6SFEkRq7E?=
 =?us-ascii?q?hpPKCCAJiGAePhzviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,237,1684814400"; 
   d="scan'208";a="120420115"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGElOZK/hRnfPno8nIcALlnofCjuCbNCCR6gv8E99gSg0d0bvGitY9bsEDqtSo+ki+ErB6nPyqqIr1j14HL57a+qHeWWdOk1bZSHt5nE+sqAyY/n44O/lv7CtH56PIRaAWACHRRmwGmh5DAzHoFtLZlgQyK+yhUMFnwifi3hlS1TPohbYseopUvT3KZrtWUujWWzeXjWtE7NlnwvFPoeikmczrPf7CCbKLVLf4hl9WBH3Jp3JM7qeSQxG9lIphb/dbA47jcQPEfeI1Uqd+9IOPgGRaaxXNSc4RAmibPXRX0bm2xIn8/5uMKS7GwFKGliM8xOUruq8XBzB5Rai55ihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shzfUpIOvf8C3SbtOW+PVv/ldzrXVQ7bEtwQXyg5sMs=;
 b=FEiDdQUYSRhgirpwJ/RgwoAOW4xJpmAa2SYMNBXnf+5fKfi7xB9hF4SHjwzjZyNiHEXLbXl/OGfWMVeY4t8aYgK0XQRisrlNTHXslCC/htTNXIgiwaA9VFGYklX6qR5uz8M9d4ibm59PCZN3RdwJH0FRncEEJPubOa4ow7MOmWE/xYWilHqBZDK4aOy06qveR4ZmK96jpLOzG5YBCHS4Q4N6lV9z+fS2PQvQSvfre8nTgxUkxeByUQwCffwJ1HiI6j8wstT8ysKkiUgq4cnpkmmyFxY0Sxm4Illw/ECVGZetj5AonxGqpWtSzbQCSqIlQZiZR65y91IxPbpeGSGt0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shzfUpIOvf8C3SbtOW+PVv/ldzrXVQ7bEtwQXyg5sMs=;
 b=YvpfEv5MAlnF5h92/DygRmtleQb2p6U7aX/uswmAz8GWGnoNeF3azrpovyAPqpTCzeEZP6KiGRkQRem/XBJixjL7H//6pU/aIDjGYgCGVESgOMn23vDRPxasTMEFSAEn8Igr8KMRtYf6qSw8WrpGm09CqVZok8W8MzrtpkYtnC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] amd: disable C6 after 1000 days on Zen2
Date: Fri, 28 Jul 2023 16:47:29 +0200
Message-ID: <20230728144729.17446-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::28) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH0PR03MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e70a11-9a10-4a4f-6c7c-08db8f7b5086
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MmiumzUQvJ63zlgdDf+peem/mTkjLxQIC6FlIQ40QmgQ7i9A4eUl9l2tQ9kPd42FmXweh73njlfq0h/ye8eA7OXezX8WuPhOlF5UAleldoqYRcP+UCWC0pEELJP+8+IamdYYWcsaJ4V25qCrkNEKftR++DSCXZwyfeLqeEZKsR2Rob7as81EKCmOTmJ6ZVUo1MP6X9u/Kfyhs0J+kJlS/GAAnyfFICnZRqJxDGy1kETewdipNaeZf9JbPcRzsSxuxTwYTFx9OqIEwchOyMl6ZAt2n117Hp+haeEBn9PAUFG5G1188LxYKMyh2t/UzL6uCq1hGv0fZ32POl4COh3KSubzgtrbG9e/68sbfXNXXqoU/bXiXhnm4tq1uPd6a8bcEQN1bqWxPVyKFihspdE28dwKdo8ib4/aB4MHJTapuE2vDzyADd9snNhZAEfPgmmAygW/ZheOgdIkHctHQRM1ZyCpteSYo4qpM9vO/5XvCJtn8rC7Wt5+Rxl1iywGSC2IrGX4Ke4MEOneF4wh6NZJCe9fvX6OQXiZMdjW4AWJTqaMCTfQE9faDJyQNydqMnlGPdWIareXzAAP9DvGwlPW9/TOH9VsIIoo1dIG/PCxjxj8YQdCBFiHux98YBLAEpbr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199021)(186003)(54906003)(6512007)(6666004)(6486002)(478600001)(83380400001)(36756003)(86362001)(4326008)(66556008)(2906002)(66476007)(2616005)(6506007)(1076003)(6916009)(26005)(38100700002)(66946007)(82960400001)(8936002)(316002)(41300700001)(8676002)(5660300002)(221023011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THJCaUhCcC9aN203YUxzUDR4UDVWNzF3b3JrTUFXMXhzZnFiMTJhOFFGUFN1?=
 =?utf-8?B?bWpmU1FsdFE3MGVmZnlMSkF5dGdlT25UZWp0dnNYbUtvVGxwcE56MG5kWVNp?=
 =?utf-8?B?amZWS1dCUFkzeUowZ0gzNUlzL0FYVDlXb1FmT0pqUEFCWE04RFE5VFFza0Fa?=
 =?utf-8?B?Wlh3NytkaFRLNERKTlNKRTFaNWE4U0ovMDYxbzk1cWxaZmNFSlIwdmZjZCt0?=
 =?utf-8?B?WkJYQWdRMEZWcVh0WVJJUFE0V3kwZzVRdGl6WWE1M3BzaytXYkRVUjhScmZi?=
 =?utf-8?B?bnRZTXMyRmVuT1l6cEhMK1BKRldjZHJIbzNON3R1bVRCbjdpblk1aEsyQTZN?=
 =?utf-8?B?MHJQbWVVNXNBdHVncVlNYzVXdmE2RnNzaGprYVZDQVRUMmNhMlh6Y3dCL044?=
 =?utf-8?B?cWlqUDk2ZE4wVlNGdmlwc3hmMXFqeWVTVUxGT0NMQ2FlSktOTDdQQjJDcFlG?=
 =?utf-8?B?b2xyc1dxV2s2eHRyemhZUURpWS9vR0Y2S0pTbkNaSkEzb2J3NFcxZUdMTGxT?=
 =?utf-8?B?dGluNlVyYVZqOU9xWVJ4NWxRQjV1T2Exc2NrNndNTHhEQ3gwTmtDQThQdURa?=
 =?utf-8?B?dXRvUEw3WGVrNjlla1JOaC9wTXJjeGlFN3krVUhPdmZsMDNoNW9KZXV4Mkx2?=
 =?utf-8?B?NTRGK2VwOEVFdGVxMCtucUhCQ1dKdW1xNlF1WStDM0RHRmJYb09wa0kzUTEv?=
 =?utf-8?B?cERJeGhnZlBTR09ObytqU0wxTCtuMklZaGxuN21laHU4NUY4VmR3TlEwN1Rj?=
 =?utf-8?B?b050eUxpeWJWVmRveFM4eVVNcEVPS0xCeUZ2WmVmTXJyNXlQQjU0SS9Ua2xo?=
 =?utf-8?B?T2NXdEp4OEYyandSZEVoRHN3b2ZGRFppUEIrQy9zL1BsVTRjaWhWNUV1R1Jl?=
 =?utf-8?B?SEplRDJuRXBneEN6MzhjM3BDSHJDMVlIdDg1SzAyM1FqalRNNEIzSHZoL2t2?=
 =?utf-8?B?NlRtS1BZNEMwR1JnZkdrV2c0UXFGN09lWm81RnhYRHB4K2ppempoQTRVcGw1?=
 =?utf-8?B?Snl5SURyeHlEcFQ3L21QYS8rVGtSVTRRU3RuK0FORWd6UVB3S3gvWkh1NGoz?=
 =?utf-8?B?SitPNXNnaU82R1pIVW1jTVBZdHN1Zi9VZkxvZG1XSzBkTlNTU1p0RXFXQTd3?=
 =?utf-8?B?b1lYV2w1ZHQwM0NsZVJpaVdoQ05QUTR0cDdSdks5UHJmcmJoTmF5Ylg1dUhJ?=
 =?utf-8?B?ZWxwV0c2cUE4MTlpU3NHUDNtWHRWZ0Q5SHlxOER4cEYvdjlzWXFDR3RiQWJ1?=
 =?utf-8?B?ZWMwOHhXUkI5aXNpWkIzQ2F6ZlNLNVQ3SWt1ZE85TU5HbGwyOGNaaDRJM0ZQ?=
 =?utf-8?B?RDIvK0h2ZzVUdHIzWkVacnBMRGxRQkF5ZkRPQmVwWW5NanZFVlBuM0I2SS9a?=
 =?utf-8?B?SmhQaFcvR3ArbFRMU0l0TVB3WFFzb3pZTTAvdW14RnVXalNJZ0lyQmZab21l?=
 =?utf-8?B?bjNMUjVzVmlKbWlQOGYzVUZJVDVwSGt0SnptMitpVklYTlVNcFpZR3g5MXho?=
 =?utf-8?B?dzc2V2pFN01YZUpvc2dJbDd6RFZ0QXZBbEJoS0hna2ExSnJWdEZSL0s2bWF6?=
 =?utf-8?B?eWJrY0tWTkYyb3I2YVBFYlByUFpHQzdBdThTandwMGhhMkErSFBjU3VkeVRn?=
 =?utf-8?B?T2FtRXRPSVp6T1pxUXY4c0ZVZDRJMTNtVUgyMHVWd3paWEtvalp0NWF2SnNm?=
 =?utf-8?B?MG41R2QvLzV4d1JPeVRGVUVINjFhRzFnNHF5dUlvZ3R2NEhOOFh0ZDVUb0Rn?=
 =?utf-8?B?MVh5c1h4TVpnSVhaOCtwVm1zdDBrU1VNL05RZXBJWjNIT1F3MzhjVmgvVTdE?=
 =?utf-8?B?ODBxSVNHMk5iSlB1Q2Vha2FtR2NML05Jb3N1TzBicjdIWEJEaDJFb0JCUEdJ?=
 =?utf-8?B?ekNXckhWOXM1bjhtdUlKU2p6akwvMmMwUlVVcDVtTWduRDN6QmJPY21jMytO?=
 =?utf-8?B?TGVNV3h1VmlRTVhQOXBLc1Zhb1FUMnZiVUwwTDFESTQ0R0pFQ3BsRFVFbXlF?=
 =?utf-8?B?QlRMODRLTlplUzBjSm9RU1R0NDFUL1ZYL3YzVDNIbERzbXNoMWs3Tlhta01J?=
 =?utf-8?B?Z3pGNE9LaUUyRG9XbVdpUDJqZUM5N3gvL0x1bU9jejIzTGd1TVRTR21HTVJO?=
 =?utf-8?B?TzBMeFB3cDNQdk9tMmxqSFdySG5XMUFyaDV6dlFaMm1KdmdRb214Qkljd25E?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aPUCMKIZJFvv77HB9jf9NPWxdFDGn/wcGhJJtBa4pBKGdKirBODGMmAbR1A0/cYCgC7GdtzSIyi2TVVuojABUd3hrVXnm5DZUa31kViZn97SNmJLSpdkgFvG/HuEfftYm42ncVnkToid6pAAnG7E41PBZg5eufFFeJpy1ge/q5fIlyBZs5Zr7kum1g7blj+w5EFDhFz9hxHUTRQ9GXGhuceqs/LrLCoNBos9N7CcL308nOSggYMRnp9NPcysniPhmCNsmZ1cjuFGOuDNO1D9W/JjUSkGc9awD1cgzjy9D7orsSjFqx0373TWEXr06/j7UQlcWgWspRJfWj8+U0FKmpwY8TMJJQpoMHAqMpnTYP55D7vE8DIP4jbx3AOlg2kJE59UwWf7b0M39wfpwEbH2QSF7tGNVs8Vik5xmH8J40R9hcCeWqIYPlo+irxY6an2rPilaX2r1BJbfMh5DrXQK3X99twFwdttPXJKCx4Od54upJNQKKIEnIshYBUu+4ItBYduE0tBsvqVhhc3wlZDh9LYLSAd+SSNrTqG6E4ysLywIouxJvV94EwFO/GACwZJMfK9eSfaX13dHrACMRNYyiGmv6kW34EQnx/iYQdMAoN0PG3zFWdpKlkMIsuQW1QMsxidr1ysNe+bgUkw0G/bOdU+Q1EH7I3YRJnBOAzfh+R4aApcLEeRz0xqMJUYmMAO6JeWYOq/1kkWJkQxy0LmpTNXHWu6WnrHwUl1JZ3pqOAQIL+8diZWwSflthUizFTb7XNb6oMg4Gf8sdPhTQi4UQX8KsNwTnKyN6+kG32ZTrYxzL91R5u88VgEIzoTh+OKAzDsUmWIOAYoXO03FA+3JXkMJoAB6fOmkEb7AhWdKxU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e70a11-9a10-4a4f-6c7c-08db8f7b5086
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 14:59:59.9945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S72B1VDTX6gzyUDdK4D6a3QaASDuD0oztAuEAVM2OFffEByn4CpYb1/jVEiRnuMhBIqHTM8hzRL82MhYVsc0Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6036

As specified on Errata 1474:

"A core will fail to exit CC6 after about 1044 days after the last
system reset. The time of failure may vary depending on the spread
spectrum and REFCLK frequency."

Detect when running on AMD Zen2 and setup a timer to prevent entering
C6 after 1000 days of uptime.  Take into account the TSC value at boot
in order to account for any time elapsed before Xen has been booted.
Worst case we end up disabling C6 before strictly necessary, but that
would still be safe, and it's better than not taking the TSC value
into account and hanging.

Disable C6 by updating the MSR listed in the revision guide, this
avoids applying workarounds in the CPU idle drivers, as the processor
won't be allowed to enter C6 by the hardware itself.

Print a message once C6 is disabled in order to let the user know.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The current Revision Guide for Fam17h model 60-6Fh (Lucienne and
Renoir) hasn't been updated to reflect the MSR workaround, but the PPR
for those models lists the MSR and the bits as having the expected
meaning, so I assume it's safe to apply the same workaround there.

For all accounts this seems to affect all Zen2 models, and hence the
workaround should be the same.  Might also affect Hygon, albeit I
think Hygon is strictly limited to Zen1.

Instead of the while loop around get_cpu_maps() we could re-schedule
the timer to NOW() + 1s, but seems more complex.
---
Changes since v2:
 - Add zen2 prefix to added functions and variables.
 - Check for Fam17h and STIBP for Zen2.
 - Prevent CPU hotplug while engaging in disabling C6.
 - Don't use _safe msr access variants.
 - Define the MSR bits inside of zen2_disable_c6().

Changes since v1:
 - Apply the workaround listed by AMD: toggle some MSR bits.
 - Do not apply the workaround if virtualized.
 - Check for STIBP feature instead of listing specific models.
 - Implement the DAYS macro based on SECONDS.
---
 xen/arch/x86/cpu/amd.c               | 74 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/msr-index.h |  2 +
 xen/include/xen/time.h               |  1 +
 3 files changed, 77 insertions(+)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 3ed06f670491..0358a610605c 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1,8 +1,10 @@
+#include <xen/cpu.h>
 #include <xen/init.h>
 #include <xen/bitops.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/smp.h>
+#include <xen/softirq.h>
 #include <xen/pci.h>
 #include <xen/sched.h>
 #include <xen/warning.h>
@@ -52,6 +54,8 @@ bool __read_mostly amd_acpi_c1e_quirk;
 bool __ro_after_init amd_legacy_ssbd;
 bool __initdata amd_virt_spec_ctrl;
 
+static bool __read_mostly zen2_c6_disabled;
+
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
 {
@@ -972,6 +976,32 @@ void amd_check_zenbleed(void)
 		       val & chickenbit ? "chickenbit" : "microcode");
 }
 
+static void cf_check zen2_disable_c6(void *arg)
+{
+	/* Disable C6 by clearing the CCR{0,1,2}_CC6EN bits. */
+	const uint64_t mask = ~((1ul << 6) | (1ul << 14) | (1ul << 22));
+	uint64_t val;
+
+	if (!zen2_c6_disabled) {
+		printk(XENLOG_WARNING
+    "Disabling C6 after 1000 days apparent uptime due to AMD errata 1474\n");
+		zen2_c6_disabled = true;
+		/*
+		 * Prevent CPU hotplug so that started CPUs will either see
+		 * zen2_c6_disabled set, or will be handled by
+		 * smp_call_function().
+		 */
+		while (!get_cpu_maps())
+			process_pending_softirqs();
+		smp_call_function(zen2_disable_c6, NULL, 0);
+		put_cpu_maps();
+	}
+
+	/* Update the MSR to disable C6, done on all threads. */
+	rdmsrl(MSR_AMD_CSTATE_CFG, val);
+	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
+}
+
 static void cf_check init_amd(struct cpuinfo_x86 *c)
 {
 	u32 l, h;
@@ -1240,6 +1270,9 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 
 	amd_check_zenbleed();
 
+	if (zen2_c6_disabled)
+		zen2_disable_c6(NULL);
+
 	check_syscfg_dram_mod_en();
 
 	amd_log_freq(c);
@@ -1249,3 +1282,44 @@ const struct cpu_dev amd_cpu_dev = {
 	.c_early_init	= early_init_amd,
 	.c_init		= init_amd,
 };
+
+static int __init cf_check zen2_c6_errata_check(void)
+{
+	/*
+	 * Errata #1474: A Core May Hang After About 1044 Days
+	 * Set up a timer to disable C6 after 1000 days uptime.
+	 */
+	s_time_t delta;
+
+	/*
+	 * Zen1 vs Zen2 isn't a simple model number comparison, so use STIBP as
+	 * a heuristic to separate the two uarches in Fam17h.
+	 */
+	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x17 ||
+	    !boot_cpu_has(X86_FEATURE_AMD_STIBP))
+		return 0;
+
+	/*
+	 * Deduct current TSC value, this would be relevant if kexec'ed for
+	 * example.  Might not be accurate, but worst case we end up disabling
+	 * C6 before strictly required, which would still be safe.
+	 *
+	 * NB: all affected models (Zen2) have invariant TSC and TSC adjust
+	 * MSR, so early_time_init() will have already cleared any TSC offset.
+	 */
+	delta = DAYS(1000) - tsc_ticks2ns(rdtsc());
+	if (delta > 0) {
+		static struct timer errata_c6;
+
+		init_timer(&errata_c6, zen2_disable_c6, NULL, 0);
+		set_timer(&errata_c6, NOW() + delta);
+	} else
+		zen2_disable_c6(NULL);
+
+	return 0;
+}
+/*
+ * Must be executed after early_time_init() for tsc_ticks2ns() to have been
+ * calibrated.  That prevents us doing the check in init_amd().
+ */
+presmp_initcall(zen2_c6_errata_check);
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 2382fc8e1181..4d41c171d291 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -211,6 +211,8 @@
 
 #define MSR_VIRT_SPEC_CTRL                  0xc001011f /* Layout matches MSR_SPEC_CTRL */
 
+#define MSR_AMD_CSTATE_CFG                  0xc0010296
+
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
  */
diff --git a/xen/include/xen/time.h b/xen/include/xen/time.h
index b7427460dd13..9ceaec541f4d 100644
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -53,6 +53,7 @@ struct tm wallclock_time(uint64_t *ns);
 
 #define SYSTEM_TIME_HZ  1000000000ULL
 #define NOW()           ((s_time_t)get_s_time())
+#define DAYS(_d)        SECONDS((_d) * 86400ULL)
 #define SECONDS(_s)     ((s_time_t)((_s)  * 1000000000ULL))
 #define MILLISECS(_ms)  ((s_time_t)((_ms) * 1000000ULL))
 #define MICROSECS(_us)  ((s_time_t)((_us) * 1000ULL))
-- 
2.41.0


