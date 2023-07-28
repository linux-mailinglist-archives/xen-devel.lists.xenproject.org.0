Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D04766EE3
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 15:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571470.895397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPNwL-0007XK-6R; Fri, 28 Jul 2023 13:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571470.895397; Fri, 28 Jul 2023 13:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPNwL-0007Uv-3g; Fri, 28 Jul 2023 13:55:33 +0000
Received: by outflank-mailman (input) for mailman id 571470;
 Fri, 28 Jul 2023 13:55:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UUpw=DO=citrix.com=prvs=566eed887=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qPNwJ-0007Uk-Ao
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 13:55:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6698a733-2d4e-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 15:55:26 +0200 (CEST)
Received: from mail-bn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jul 2023 09:55:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5808.namprd03.prod.outlook.com (2603:10b6:a03:2dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 13:55:10 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 13:55:09 +0000
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
X-Inumbo-ID: 6698a733-2d4e-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690552526;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lsOhabthQVNtaTIyZQM2dHk3H9wBiLxBJyUk/+vTpAs=;
  b=IdlUTbwRvj0tsAvsvgu1HxGiC/3s2zosz/5UUBj/F1ec7LpBvvYYk5v0
   Lcze3LIWmD3dubPDD8Gz/VFq07by8NSejJV5QyGhULB2CpT3d3hCQDQya
   4pNOgtRz/349UutdqNJ6JhhL9Q8I9jd+by3yW64XslTCx4NXOEz9e6QRR
   Y=;
X-IronPort-RemoteIP: 104.47.51.40
X-IronPort-MID: 117070347
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Jy/tY6nEh9g1xDPcSDZCl3vo5gxQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdC2+BaK3bZWCjc9xyaIu/9U5UvMDRzYNgSVZlrSFkEyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5g+GzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ewhAiIDQD6nvv270bWCR8JPge4jCeC+aevzulk4pd3YJdAPZMiZBo/svJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVU3jOCF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHyjB9pJSOLQGvhC2kSR4mgvKDkvd1qrmKmEqk6EcJFlJ
 BlBksYphe1onKCxdfHDWBm/rG+BrwQrcdNaGO0n6ymA0qPRpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuVPSUWNmYEaTUzZA0J+cT4oIozgxTMSf5uCKewyNbyHFnYw
 TqHsSw/jLU7ltMQ2uOw+lWvvt63jp3ATwpw7AOOWGugtll9fNT9O9Tu7kXH5/FdKorfVkOGo
 HUPh8mZ6qYJEI2JkyuOBu4KGdlF+sq4DdEVunY3d7FJythn0yXLkVx4iN2mGHpUDw==
IronPort-HdrOrdr: A9a23:NW1DLq9JHV5whTFfnoluk+D+I+orL9Y04lQ7vn2ZHyYlCPBws/
 re5cjzsiWE7gr5OUtQ/uxoXZPrfZqyz+8X3WB8B9eftWrdyQ+VxeNZnOnfKmbbalXDH4dmvM
 8KT0EUMqyUMbEVt6fHyTj9O8o8xsKK6aW57N2utEuFjjsHV0ij1WpE48qgfXGejTMpOaYE
X-Talos-CUID: =?us-ascii?q?9a23=3AxWuFw2lfqAzdjghn/yoEFIn+I6jXOW3k5mXeDWG?=
 =?us-ascii?q?cMHlkWbqsRHSz/4lktuM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Akc7COw9htf/1voGy944GAHGQf51x4YCqNGApqLc?=
 =?us-ascii?q?Hq/DUCAxwARzetjviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,237,1684814400"; 
   d="scan'208";a="117070347"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnRwVhyOfeFH9GicmeDa/WRyTrVZEWhMYMQ3Wv/07aHwgjHGDDwpS2RS0o9F2WEQTSsTeghH+simg+HfLt+d4bm125CLAc5qKqJa1UNfs50Z0OOdEfOLWue3qZgFskkb94CU9JS3qNEFmVGDHQL3blKOHiajMjCzIKIyv+Wm+JK2As3FBf3VBPWqdxA0aUzvKfK31qay15Q0S4pry105A1QVJOkgn1CM8bmhw90GVXItnwBVYuRfkh752uRSuArP5Ts6cNeubrUY5syMwJHS5oADEeZt4zxcWAp9JY985WLDahIGMCg2ceIOldtpvUyIoq642Gx/EH6uiVtnE6yjzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTbxb09MAK35wf0lo93bbnMh5YL/QO7+u3Rh8gTfu5U=;
 b=JyD1QyAHpSPTAOoqu5GXIYyYrkO/+X8AY7kzIEifcpxXRbnDKjO7AzUS7efbtBQ7+W5vgG9EBBznvGtWmsqabLmADPksNxcFgnebksgcKCJR+af9NKwcSGKzIb2cek01+zOmma3TXp4yPCl31G13LAqFHfoucMe4gnCiPEs/anzketsl68M2FrwfDZDfeFQtYv0Bj/KAXfA6IFPYWdF1q9HLf3f01J3RC7rp7PE/5aV9i+WGlEZ6QBz7xnc1IjaSFH4NNUYmwZbYGM3GNt7gzqLRb7YK/nyvtSvfmfiSfg4dhSeP34e7PI6ROismGKPf1om2VvXtOopCl/C6Z3FSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTbxb09MAK35wf0lo93bbnMh5YL/QO7+u3Rh8gTfu5U=;
 b=mc2rfTTjcoSb7iGvuWiWj9VTn9GZPjpBiTjLVJ/jeuL/yuDDZ0/oJclv3LA7JZtzFNfrF2AVc0JqQWAkUHWd8e0X4PXO6zlEDA+V7B2+K+S5wVosNhB+0pPxicIwT5uk8qzR9GhIRXeJRBdJCH0o3Gl7k6hHxs+iRYCCJO5mOa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 28 Jul 2023 15:55:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZMPIuIiNHlqv_3Xp@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local>
 <87ila7cvy2.fsf@epam.com>
 <ZMDox0WwumxMGnzV@MacBook-Air-de-Roger.local>
 <87y1j2b296.fsf@epam.com>
 <ZMJmJTkSFLKZXkKB@MacBook-Air-de-Roger.local>
 <87cz0cc2ce.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cz0cc2ce.fsf@epam.com>
X-ClientProxiedBy: LO4P123CA0221.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 06048e53-9dcd-44ac-0e43-08db8f7241c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T9/wY5ZTkBsCv7UrLTwLVeOz/PApC06pdcnf6WEQ4yRtYop7zwvGU1dn/J0A2x7ofOwarVwlipNaLuwjqSLARYz5d1gyiBSZApAkybx5bu8wI5nZnja0sdBBC97Z+esaQ7R8HgRfaNf6DaBfWfPcvnE9kqNgkCu4QJhjFHzyB1w0Lse1Roo/vso56GpjcYRgV0sYTExQeCc5W2CrEl4fLpY7yjPrTlVju/B4zFITKJ9x0CdPgbnfq3oZ/CnQwYw4PzvU9QVZcaXi9GSomk1vOy6RTEs9WTCxGjTRrvu0pwDHAb0s6LI2lmWfYdZPEYrkhEVib1SlbkxOTahonL0FFfdtDZFG/LubDCYgANQ59p1WXfPTOaSRUOu4BcVcxCHU3iAmEM2Ms5LBYnyif2CnpDEX9joyiKdmdmE+7KNdqBX/tg5DLdiY6Vlq0Dj2OoWZwj71Mgq5x6v56JcvLKs0ux6uKJgGS3N67tmlRrFgiGFeluP8YvPwcnry1GG43L4Z8pTzl1pc5aWWgpkdHTgmD9yxAiFN0De+RwgX3F7odIOEVFkloSszF43VS1XPvDtc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199021)(2906002)(316002)(8936002)(8676002)(5660300002)(41300700001)(85182001)(86362001)(6512007)(6486002)(6666004)(54906003)(478600001)(82960400001)(26005)(6506007)(186003)(9686003)(83380400001)(66946007)(38100700002)(66556008)(4326008)(66476007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elp2ZXdGdnB5eC9hU2pEU0pYb3JJOURZQzVqSCtzS202anBqYzNnTFUyK3d4?=
 =?utf-8?B?SFlvaXhiSDZzc0ZkZFRrQUpPUWhGU1l6YngrZ3IvNml3Um1odXJxTHRnVXEw?=
 =?utf-8?B?MTAyMlJtWTdoZEdlWHJ0bDJqaXgyTk04c1pMa1BYVDZicU14aEhNRHVBMCtt?=
 =?utf-8?B?bUIrU2VLckxESCttUk0rcUhWQkY5bVkzUXMwazc2d25TOVNEd0ZvcE44NXNM?=
 =?utf-8?B?aSt4bGg2dWcwck1sUC9ZbkkydHc3S29lTVdIUlB5NEhwVTR1WVdpUS9uWndU?=
 =?utf-8?B?MFhQMFl2bEJpQmlYUnVCSjU2anJiWEJ0OXBwa1lmdDZ3N2svdGFqVlhnWmdv?=
 =?utf-8?B?TGNVbGFIeWVSQ0s4eWsvMU96TGppLzY3ejFEMlJ5NnR2bWtqLzYzS0N2K0Y0?=
 =?utf-8?B?ck05anVoa0s4bzhxME45UjUwaUc2MTJNNWRjV09CZTNYcGZVRURkYkVBZk03?=
 =?utf-8?B?N3V4cDhJMDBhSHh6T3pLV0dCanFFMlFraEgvRUJEVWwrbFdIT2NhbUdESUh5?=
 =?utf-8?B?dGpQZnJKemxVeTRxSWx3eTVrOWdKYlpZUzJodnM3QkRpVktxek4zKzcvb1RF?=
 =?utf-8?B?MDJhVzBjT3BLcjZnd2dNMzExRDJpbWRlbkRSaDNxOUpGaWVTZExDYVYxejUx?=
 =?utf-8?B?d1VVLzg1TG9QNTdDNmhpZ29SeE1sUSt3REFVM05PR1p6VlBybnRSbTJiQTZL?=
 =?utf-8?B?cUtBNjNFelB1YlNKS1h4SHNKbjNZZ05ZNmFOamlablQ2dEd5SlJ4Y2ZzWGVQ?=
 =?utf-8?B?eE1jNTBWVzNUeTlVbXJmL25Cbmo4UXYyR2wzajdLL3lQTHNISm5HRzh1S0Vt?=
 =?utf-8?B?VVExUlVRZlRBYnc4bHc0RXB4MTZBcmJ0QkcvZ204dEZPMkgzMjZJL283Q0Rv?=
 =?utf-8?B?NXFSZVkzOEpuSmJrS255U3VMRk8zMVdlbEUzNUJiN0FGaVJMYld2NWhUbVpW?=
 =?utf-8?B?czM5TStzaWw0UWIzMFdEZVQ2WW1DeS9IWFY1STYxa1FjU2h1eitlQjdocDRT?=
 =?utf-8?B?Z1lod1ArcE5PN0MyV0tIbWdsMVpIdFVEU053NUoxeEJxeGFzN214Nk4zRkJi?=
 =?utf-8?B?WkQ1WWtISnA3WFBYRkh6VDRjMS9mZ29VNjRQT3ltQWk4bFFUeSs2VmlkZ3BH?=
 =?utf-8?B?SHlBM3NkN25ENEVIUWgwR0YxUnlzNWp6b2RCenpUK0o2VmgvRmJlcnR5emdK?=
 =?utf-8?B?Z3kyN01iSFZEbDIvaWRrZTliM28yUXNXbVVUY2NmNWR5ZnZlM242a2oyQlVZ?=
 =?utf-8?B?TS96N2RESm8yTksxS1RZeUNpK3FyZlZsOHYwditlQWR6dTFnUllicmMxTFZP?=
 =?utf-8?B?TWJpSHJsaXZTd0JleU5yMnpHSGxuZmJUbmo5OStwOVVHWlU2MEU5YnFhRFpI?=
 =?utf-8?B?WWJEb2hlTm9oUE9wSzk5OFdseEpNeWdYYjV6UGluejBWN05LQi82NTVPeG5D?=
 =?utf-8?B?NGJsZXBWOVUrQjRuQnE2RlZ0K09KdGR1ODFLVUVRR0JSekc2TnNZa2pjWFJa?=
 =?utf-8?B?bWJmNFRBYk1VSnVjYi9qQkhmSitVdzUzMmNVT3BRRWVaVlR5Ty91NllWaFJ6?=
 =?utf-8?B?REZVaGRyVnZOTzZaM1Y3anlBNy9SL2JnbmRIOFRpT2t3ODZMaE9kZHk5UnNV?=
 =?utf-8?B?TXE2V081M0JJY0wvUFVidkEzQ1U0K0poQzBOdVgyS2VnTU5WQjNjaE8zTElE?=
 =?utf-8?B?MXdIWG0yVWhyNGRNL0R2S2o0WU1hTStCWVJiRGZiRk9wWlU3UEh5Y3VRYTB2?=
 =?utf-8?B?bXIyZUlrVmFIc2RDejlQRjRPTTJhS0VxNU1sbUMrS1FhSVNZb1E3RyswZG5z?=
 =?utf-8?B?Vi8yUkpxcnJib1hYMmNQdlR4LzJrWEFLZ3N3YStlanYyb2lHbnVyZFltZlpR?=
 =?utf-8?B?YisvUFVBcmlZUWVrSTZOK0tSb3Y5Sk1Uc0kvUHVPUmtpMzR1Z1E1NUdTY3ZD?=
 =?utf-8?B?TkhwQk1Gbk1EZjg4SGlMMzh2MFhoc1d1TXp1YW5hUU4yanpyY2FyUEMwNnRC?=
 =?utf-8?B?OEZ2aUJ6c21FWmI1R2RZZE1FbGxKY1BJbkVyTWcxU2RJTjRVWlErRk1Hem81?=
 =?utf-8?B?MG13dkorU0RSSFdtR09WWk53bEVCcTB1MXJyZXcxNzBCL21CZXpMc2NWeGgx?=
 =?utf-8?B?cFhBMUFsSUg5dW9DbnNMNUNndXBmSHBveFgyK0FqV3gyN1ZCVnUzWTNZbEU2?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fGXb2Yq4/7Y0QGHT4VDhN1S/T2/IlDbUuVBrjYqauCfrkpleWH2CEJ+lvd4RHAJwdubw99kLij1tFubiKcz9C3n/jcZyNlxhRnXOeQZ3UTPVQ7+Ee/53giktHCfE5PkGo9J3XwNsdTmqSCNjs/ZKNvbkwTU0qIqQdf1pzGI2IVYHjpGW+KdAHXi3u3RGSmOGidvQJ4LZztgQd0W/q4X/jK8jO6Ya5ZLbcY62Pc3sDENF7DK10hRoUa3P73PAwgiRBo5XYP5DmYv44cgdHq0YSj6m2Z44J+x4+s5UwhC+aYO+f7asibh0SWBjlAQ3oe4alf6l9MHd2FR+WxOfMSMA7wTvkKEla/WGt+5xienTm3KAVvJ83BiiTyoC0leKHbwU4FHYyNZ00ygAaCiQAspAL55uVMr+ZFsTzdXW/9jxv0xw/eVj03+aokCvcYUZdmEV3S2i26LrTuZS5P1UXlnDGx9mPJBzGVmdebXGZkud1TggEHRlVVCi4OSn36bW2NYbVzeyfDR8P+3jKJznt5bNt83uCS9F/sKsSuHVYt8dlZoIQjvwYFcjuhvxL3L/qszMfV+rvu7XMK0NMNSjL6nbvLcpw6WN2LYVTJdwj20LVt5kW71fmTFVuErv6z+h4gB+CfhQvSOAJQWyje8iiwN62/kx5eCsqzY0oKOkyyHXJZM1TccMTZe3ax9pa1NmJDWJMBE/YPnCuqrKNnfTXdvp4a//FvHNNoSF3kdwb2fC5P/5LAuWN5BaEwF9d+bQAOWiEWumGsNSF8h6P3f457JHbpW+3ozBp8CUtxzWiLWGS+UGOOoj1idbTmjE8fEvw2mhY+YmGadWgUkqXzl+oWELFw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06048e53-9dcd-44ac-0e43-08db8f7241c9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 13:55:09.8532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sEizpTjNAd/hPi0rSn5zDBZ4DMS78+YIIrmpsubSKcNFXztwYs1PSWQqdip+V9Wa0Tjr6untOJVkGQt2rd8wDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5808

On Fri, Jul 28, 2023 at 12:21:54AM +0000, Volodymyr Babchuk wrote:
> 
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Thu, Jul 27, 2023 at 12:56:54AM +0000, Volodymyr Babchuk wrote:
> >> Hi Roger,
> >> 
> >> Roger Pau Monné <roger.pau@citrix.com> writes:
> >> 
> >> > On Wed, Jul 26, 2023 at 01:17:58AM +0000, Volodymyr Babchuk wrote:
> >> >> 
> >> >> Hi Roger,
> >> >> 
> >> >> Roger Pau Monné <roger.pau@citrix.com> writes:
> >> >> 
> >> >> > On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
> >> >> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> >> >> @@ -498,6 +537,7 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >> >> >>          ASSERT(data_offset < size);
> >> >> >>      }
> >> >> >>      spin_unlock(&pdev->vpci->lock);
> >> >> >> +    unlock_locks(d);
> >> >> >
> >> >> > There's one issue here, some handlers will cal pcidevs_lock(), which
> >> >> > will result in a lock over inversion, as in the previous patch we
> >> >> > agreed that the locking order was pcidevs_lock first, d->pci_lock
> >> >> > after.
> >> >> >
> >> >> > For example the MSI control_write() handler will call
> >> >> > vpci_msi_arch_enable() which takes the pcidevs lock.  I think I will
> >> >> > have to look into using a dedicated lock for MSI related handling, as
> >> >> > that's the only place where I think we have this pattern of taking the
> >> >> > pcidevs_lock after the d->pci_lock.
> >> >> 
> >> >> I'll mention this in the commit message. Is there something else that I
> >> >> should do right now?
> >> >
> >> > Well, I don't think we want to commit this as-is with a known lock
> >> > inversion.
> >> >
> >> > The functions that require the pcidevs lock are:
> >> >
> >> > pt_irq_{create,destroy}_bind()
> >> > unmap_domain_pirq()
> >> >
> >> > AFAICT those functions require the lock in order to assert that the
> >> > underlying device doesn't go away, as they do also use d->event_lock
> >> > in order to get exclusive access to the data fields.  Please double
> >> > check that I'm not mistaken.
> >> 
> >> You are right, all three function does not access any of PCI state
> >> directly. However...
> >> 
> >> > If that's accurate you will have to check the call tree that spawns
> >> > from those functions in order to modify the asserts to check for
> >> > either the pcidevs or the per-domain pci_list lock being taken.
> >> 
> >> ... I checked calls for PT_IRQ_TYPE_MSI case, there is only call that
> >> bothers me: hvm_pi_update_irte(), which calls IO-MMU code via
> >> vmx_pi_update_irte():
> >> 
> >> amd_iommu_msi_msg_update_ire() or msi_msg_write_remap_rte().
> >
> > That path is only for VT-d, so strictly speaking you only need to worry
> > about msi_msg_write_remap_rte().
> >
> > msi_msg_write_remap_rte() does take the IOMMU intremap lock.
> >
> > There are also existing callers of iommu_update_ire_from_msi() that
> > call the functions without the pcidevs locked.  See
> > hpet_msi_set_affinity() for example.
> 
> Thank you for clarifying this.
> 
> I have found another call path which causes troubles:
> __pci_enable_msi[x] is called from pci_enable_msi() via vMSI, via
> physdev_map_irq and also directly from ns16550 driver.

Both vPCI and physdev_map_irq() use the same path: map_domain_pirq()
which gets called with d->event_lock taken in exclusive mode, that
should be enough as a device cannot be assigned to multiple guests.

ns16550_init_postirq() is an init function, which means it won't be
executed after Xen has booted, so I think this is all fine, as
concurrent accesses from ns16550_init_postirq() and map_domain_pirq()
are impossible.

Thanks, Roger.

