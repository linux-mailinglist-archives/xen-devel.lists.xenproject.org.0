Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC62372957A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:38:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545757.852308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YZE-0006NY-F4; Fri, 09 Jun 2023 09:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545757.852308; Fri, 09 Jun 2023 09:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YZE-0006KJ-Bk; Fri, 09 Jun 2023 09:38:00 +0000
Received: by outflank-mailman (input) for mailman id 545757;
 Fri, 09 Jun 2023 09:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7YZD-0006IW-8J
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:37:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f8b324b-06a9-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 11:37:56 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2023 05:37:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7223.namprd03.prod.outlook.com (2603:10b6:510:243::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Fri, 9 Jun
 2023 09:37:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 09:37:48 +0000
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
X-Inumbo-ID: 4f8b324b-06a9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686303476;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oW0ymwZZ0sgX3hy2nWihjRNskOeWi3NTY8m4d1dyiL0=;
  b=eP7Iy0ze1tSiUDybvPONxee2RBO+ES+o+Vtzz5wP79JupDxc0BYlAg+B
   gH/dUn2cJh6i8ggx4vuH42byHrg2eCMbH9A4O0i3zGxIQDX24P5LajwFS
   v57mbtOwEePKJK7chWsAec2m6OscGH++8TT8RrfQyKqv4xEABcfR6P84v
   I=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 112607582
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KnStnaO254prH4jvrR1zlsFynXyQoLVcMsEvi/4bfWQNrUoh02AOy
 jAcXGmHPvvbZWT8edp2bYy180MP6sLcnIVjHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5gxmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sZHO2h/y
 O01FD0qX1Onq9ik++2DG/Y506zPLOGzVG8ekldJ6GiASNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxujeKpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxHmlAN1PROfQGvhComWQ6i8aDAEqfwHlncT6qGuMf80GE
 hlBksYphe1onKCxdfH2Xwe5u2KFtxhaX9tWH+w1wAqJzbfYpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRu/NTcUKykeYjUDTiMO597+rMc4iRenZtJ+G6fzgNTzEjz0x
 y2ipTI7wb4UiKY2O76T+FnGh3ego8bPRwtsvwHPBDv6t0V+eZKvYJGu5R7D9/FcIY2FT16H+
 n8Zh8yZ6+NIBpaI/MCQfNgw8HiSz67tGFXhbZRHRfHNKxzFF6afQL1t
IronPort-HdrOrdr: A9a23:e80o96gcjFcACbYUd/lxOv6OHnBQXuUji2hC6mlwRA09TyVXrb
 HWoB17726NtN91YhsdcL+7Scy9qB/nhPxICMwqTNSftWrd2VdATrsSibcKqgeIc0bDH6xmtZ
 uIGJIOb+EYY2IK6/oSIzPVLz/j+rS6GWyT6ts2Bk0CcT1X
X-Talos-CUID: =?us-ascii?q?9a23=3AVFaU6WsmmCngM/gbmma8Vgm66IsFQkfU/UrBDnO?=
 =?us-ascii?q?1LlcqbJGvW2TPwPJ7xp8=3D?=
X-Talos-MUID: 9a23:VsCcdwu8o8sylnxPj82npglhGIRh57iSIhpTrahFmey2ETMpAmLI
X-IronPort-AV: E=Sophos;i="6.00,228,1681185600"; 
   d="scan'208";a="112607582"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mx1JK8/p+//FI4BCWZC1AMRbjyM9R3cLLi94ZleI+/E0idx2aP59Z+JpDFn4qirj71iX6cN4STUj9nGKZky1602mtkzfCl9lkTq+yNVI5JAqe/oDBq0Ut2q9+bbZgRXaRJjURqz383JJ/kjs52wtntUz1C+tJI8FpCXl2KdFb9isX+VHjQ369t3PaDU7/ZrtIlB1699ifyALKi8PSYIzlXWw+jFqRMNPB/2eetb1J3MZoL+TowtB61wLqRv1ZezsM1jPlSDEBwLF8zeE098ByQwt2rXwNFJCnWbU9Vd35kQ0KAITFCSGDCrr5RnW39OEENB0XV0JyfOYmnK3M2aEJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTIR5zHV5J2M3URXNiR1BWBtKeuimdMt5LWSJcWJM+k=;
 b=MYb4JpHrJKrxVIJ9M39WNiR3Qb/zd63BzQbymzNFONqsXZJABmptR5iK1hdUF6AuxuHFaIitkJjWkkruNFzysSKLNqlvu55eC+uKoa/aK4vkSCW8JkDwDd9E+4AZ5m0F9qNQ1iw7X+asYjkEwTy1Jo97wJ722KcdFMdcV86aJBSH4smWS73drf6uD0TPi0NDSC55g/uq4v2uzocuYwFbQSpzaLyQEY9dk1RsJPVkfqd4C48WTGP6ZlWosoazs4CV2KKDqw4/mrZeW/keEGutH+yT6iZ389SM5v3L7VEbOLu9hAHQGIxbORR1ONjrTrQPMKnmN7QnyZMcevtHLUC1PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTIR5zHV5J2M3URXNiR1BWBtKeuimdMt5LWSJcWJM+k=;
 b=ZX2ZFIDNkAM49FyUafn6IXLIcnYsR6w1aN+UpoYCB6vYAEGgwlmqwV7DnCIK0VFqSCi+M7bAa1ezDhzSr+cJE2nggE2IIPtrK52FpzYZYMQcDXIfdA1PNCdVPcNYivR4f+99cd0m3rCbLkkip5H3UPAvrONqzW8zCwcuAu3Dl0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cae2b894-7ff9-7873-9709-ffc5f74dded2@citrix.com>
Date: Fri, 9 Jun 2023 10:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] tools/ocaml/xc: Fix xc_physinfo() bindings
Content-Language: en-GB
To: Christian Lindig <christian.lindig@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>, Luca Fancellu <luca.fancellu@arm.com>
References: <20230608193312.2520222-1-andrew.cooper3@citrix.com>
 <D41CF6C4-7912-4837-B5DA-2E94D13F3799@cloud.com>
In-Reply-To: <D41CF6C4-7912-4837-B5DA-2E94D13F3799@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0177.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: d39d3ea7-6cf5-48ba-f091-08db68cd2fdd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hfd3vokCt/SIpMDSwg9vHQVCe5DfuJck71ohQS4rfCNEDxHHbnIAO/WcMExYnfEqfWlnjDK2Ht0sL3ZhLCO1qc9LyX2BTqOue7sfAcqx8aczM/Q2QbaumAUdPXs5QKzaPcYneKjAOP4701fJOpW+tLnGj4iLZ2HLk/I7qAEKFFmwy+8YB1XK/Sfij/O+l0N/VtpXW9exHvHbaTRiYxVd9KkzoyzyGLPtbfDc0goZ2r2v+JAhrMWnMlTHo9hlobz8cOIq37LWx0Et+yO+JrewmWW5v17j8HTAdpbrBYs9HTORNEfFcfRZZB51G1Yehw7ZzZoEwEx6XdAVYd9a4DQPnLCFFT+i6Y485bCAD/Cuayu6D22LiE2WzbZrikeeApcA37GOmoWAS5ZSRrpHA81nkmLUgwi8Y3AS6Y+8dnaROBvZwIxAoUqWiPjQd+YVB28Z+/IewfiWkL/UvhZYUTxrAVZMK0E6r+iyjEwNmOmjnVxO1J+KAMTbVYNnHBslI0JDR7HkiacV0qNbf7p0OwDBSLYSXid0vcpsBvoq1bgg2VN9t2tz53dBwnoJbO9RAxQ1Om3gIF6r8M+tHyAxTf/w1MNuoNFi6KLyLj2ZxZTlP6Bpml74PyJWSsloPNWgf29ZbGJVXP34fMeyWwyc2KliDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(478600001)(6666004)(53546011)(186003)(86362001)(36756003)(31696002)(6512007)(6486002)(26005)(38100700002)(2616005)(82960400001)(41300700001)(66556008)(6916009)(4326008)(66476007)(2906002)(316002)(5660300002)(31686004)(66946007)(8936002)(6506007)(8676002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFRPb1VndUhzRnJ4MkNqb2NOZGVhT0xHalY3TVQ4NXNiQURkc0pFdTNzVWJY?=
 =?utf-8?B?b0wwdldXeFFGSW96Vnl5aGZHbTlGTkd0NVFPQ1pIdWZDNFpid3o2Y1cxVG5V?=
 =?utf-8?B?dmtvU3BKeWw1djRVOUtFZys5ZS9jUC90Yk84emt5d2JyajhIeUxPbE4xMllJ?=
 =?utf-8?B?UG9jOUlPY1c5L21NNW1TTXpIbmZwZ2h0Tyt6a0s5d0J0WnNZcWVrVnMxVTFQ?=
 =?utf-8?B?WDhnQUdKZXBDRjkwQ3lFUTVjVnpLUDA0RXM1Z3F4emlRMTgvQmJ5MWZkVEtJ?=
 =?utf-8?B?eTR4YzlSQk9Dc3grdmtScDRhcHBUVlEvWmt3TEFNUVJ2S1NpM3pFUEZsYXd4?=
 =?utf-8?B?K1docWcvdHlWT214K2JPbXBSUXhUUkVsdEljbmxGdytQQlpleXJUOWNsSTFK?=
 =?utf-8?B?VVNMdW5XYWpBR09XajFiU1NWYmhTR0JkbzQ3SjhadmUwRTRJZE93Z3plUUVN?=
 =?utf-8?B?ZlBoYTJNeXhWOU0zUlJHYmlkd0pQelorNHc1YXpvbW9ML2RFeVVtRVdzR2JQ?=
 =?utf-8?B?WUxmVjU2YkNSZ2FGcHVCU3hQQTRudTJnZ1RKeFlSQkcwdXVlaDA5clNMN2ti?=
 =?utf-8?B?R0xoOWRJWUZGR2JWcDR4RlEwSXl5MExEaUxOb0Y3ZkdncWNSYVhoZnozaTZh?=
 =?utf-8?B?ZEpjbGJla252UU9qUUtnam56SHZUbThDbVBLbDZXMXhZelJieEtRM29NL3dL?=
 =?utf-8?B?c0NxRjdORW96MlgzQ2VpYWd5RU9KcytIZGdhTEptZjlxYi9PYlRzWWFBNVFI?=
 =?utf-8?B?MmF6Zzd2L2RrN2p0UDZkZUl3cXFpNkNEK21FZ3NTc29rSmt0Z2JUcWMvYnNu?=
 =?utf-8?B?cmhuU2hZQ1NYSTBsUmhBbkJyTVpOR1FyWVNZV0RnWGFMazBQT2U5S1FBSVBh?=
 =?utf-8?B?WUtqMHpSdlNDK1p6T2EwbTcrZGFDbG80L05xYzgwQ3VlNUtRT0IvTjM2SWFL?=
 =?utf-8?B?aWNqSURGNHQ0RlBEZ2JTendaNDBSdlJtN3hJYXRDOE1CaDdYNFBDN3k0b1d6?=
 =?utf-8?B?UTNzUkNLSDJZc1M0TVh0WFZQSndBaWd1akQra0c3NzFJbjNkL1NyRnd1Y1Z0?=
 =?utf-8?B?QnJiN3pqcXZXOWkzdzBJTDM4Z2Q0WEhZcSt0L0VzdlpXYXZoSzlRTnZ5Y2RI?=
 =?utf-8?B?ZDBSRHNqaGNuNXZybTcyL0VRSTJyNy9kS1Y5WnRhbG8zR1VyaW5wTWpnTk83?=
 =?utf-8?B?VHE1Q1daMmN4Um9MYnlQWnU2SUJjc2VmdTBYRTl0eHNScVdsWHZxMElzRHc1?=
 =?utf-8?B?d29wZ2VvT1l2U0RoYnhRSVpqRVB2cWJnbnRBbENBVDg2V3hhc1pmR2RrUDBX?=
 =?utf-8?B?WndZYXZUVWdJSE4yRzJVN3BMV2RxZm1JdU1GNWZudnFTUUZ5bzY0aFVXYXhY?=
 =?utf-8?B?cVZNZHMzeFJHQmF3Z1BxN1cvL0FzUEEzUzQ3TXhKOUJTK2t3d0VKZWVUa3kz?=
 =?utf-8?B?eCtzWVZCdEtJdFVGdUtkV3RZTlRJdUJJb1hNL1g2SjQ4NDZTSWdLb1lXcS9D?=
 =?utf-8?B?ZzZsaCsrVnFpUDZiZENNNVpydWxDMHNhRFlndXZ5UDFBYk5kdy9uNW9vMW5V?=
 =?utf-8?B?Mk9MZE9sdnM5REMxVTRSMktyZ243bmRTOXZaZnp4OHp2K2xrQmVmMjBkZHdI?=
 =?utf-8?B?alg5UXFOMlJQa0NWUGdOK3dJWFJQMGQ3VURVUDhqTDRucHlBdHFjUHp0VHc5?=
 =?utf-8?B?UkhiWWd4MnNDMjFBWWhYMXBxZEZHdlgvTVBETTJVcnVYQjJOeTRTZlQ5ekZ4?=
 =?utf-8?B?RUd6YTlZWEJ0bVdBV1pKNEU2c1FMR3N6N3dKU1hYQVJRNEtzVld3UVRtZHlT?=
 =?utf-8?B?WGlTRllFL1JCY3VMdDlMY0I1eU5GbGJGbUQrN1orNWtCMHZZSndQSGJ0Mklp?=
 =?utf-8?B?cm4vN3N2NkZ5czVWWlpHUlF1U3Y3WVpxV3dndFRiU2pHZk12UkdvN1ZYdzRQ?=
 =?utf-8?B?d2Fyc1p6b09KMFJVckJkSy9YTmdTZzI2U1B4cEtTOGtpU0RYVkxmOUhIUVNw?=
 =?utf-8?B?OGNoNlowaFJUV0VGVjQ0OE5FWkttNDFjY05LZFRubTdJSjFPQWFmVEZYQVRY?=
 =?utf-8?B?OFljZDV1S1dZQUZicENNandXbVQ5dENHb3FHWFJZRXp4VmN2LytvNll3Y3F3?=
 =?utf-8?B?ZUhIYUc0WEtMT3Nic0RYNkRwdUllYmZwYVgwV1JNakhkbi9aM1NiZStUcUph?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qFC/sQcq13oL1CI1StsggTaQKGyvFs2kXkx+64Dbn3PPAvX4mQ6zzG3BF4wTUEhDAvICL1LhAadCS89cyjnk1ZeX9k5JP/Vbx8xd0MHTuZtf/Nk1Ht80vGam31uWkvUc7XNQuXbooxMPGYUkDtSvLxNl+z21l4e5U16iOALg+0Gm42OKINvHbhq28l5lpjEFhN+Zy1ceTtV3e6lQUuQpdckkLQajQrzA11+1Nwny+zVKanewwi+zEHJMBIUiS00BivQNUFFC0yvKdzAd1LJPFKM8+HJWsyjvuEcCvqf8P2qg9Kan9M5HHb/ZALfuDpxwNm91RcNH0wpgEmGUtlJybJ+d3qJpptyvTzp49T4tn8SGHO6tvEAjMft+TU1MO6KY+2mz+jYsvmhlAxr3MzcrOjZ+Q8OPO62q9Tx0gx3MXk1KzindHM84+oOz/2b1fzT+DkDnlDUgoyLqmlOUhfCkT9zdEt2gzH+aHqCKfybPVBZqebIOWRFKXDI2hfeEaEs0fBj+KDjoGFJEiWXPpqXXI8yVjI8RuVh9ndbJ/ZA1S3bY5+7myksKQcY3yHn68xn3ROXgxe+taDH8ke4WbaxL9yeP6ZGt3dYyA6lyubzgLQHeFvmlAOo7d5dRgyZaAJhW0b9WCJk6ngtqoRJ5cKPJkx+BjSjGhmkJoClKEkAl8teGYnVWmImounHTjwjfs49nFtCe5sgt6y5GR0v3BAic99GDjs1WXFqZ7X/cVtTQzC/eG0eE6kiwnlE1NPLn97gHjBQ8BboGq1vWkyCH/BJ6pk+A5LPy+cB0BR/7E73TnNx8mnarwUMc97efvJBhkRrK
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d39d3ea7-6cf5-48ba-f091-08db68cd2fdd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:37:48.6165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9KmP1tKfPjiiDBbmScgXTGA7zQwbeUvbD/6ijNVyGaYk3KI1K4m3K1wDZuKPfi/sMdYRbFyKi6NaFa7UQvUt4cE8a8CfXzHXaRJNgrDvzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7223

On 09/06/2023 9:17 am, Christian Lindig wrote:
>> On 8 Jun 2023, at 20:33, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>>
>> +type arm_physinfo_caps =
>> +  {
>> +    sve_vl: int;
>> +  }
>> +
>
> Does the OCaml side need to know about the structure of this value or is it enough to pass it around as an abstract value because all logic is on the C side? I assume the OCaml side needs at least a way to persist the value and hence needs to know some representation.

Yes, Ocaml does need to know about the structure.

info->arch_capabilities is a collection of misc info.  It was intended
to be just a bitmap of things, hence why it's a list on the x86 side (We
added fields, then had to revert and I haven't got back around to
reworking that yet).

But now ARM have put a non-bit field field into it, where a toolstack
needs to select a domain_create sve_vl setting between min(0,
physinfo.sve_vl)

The Ocaml code doesn't have an #include <public/sysctl.h> so doesn't
have the masks/constants required to decompose the integer into it's
constitute parts.

>
>> 	Store_field(arch_obj, 0,
>> +		    Val_int(MASK_EXTR(info->arch_capabilities,
>> +				      XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK) * 128));
>> +
> What is the “* 128” achieving as part of this encoding?

No functional change from before...  except it was previously hidden in
a different header file which I'm in the process of deleting.

The vector length is a multiple of 128.  This value is more amenable to
being understood in a log file by a human.

~Andrew

