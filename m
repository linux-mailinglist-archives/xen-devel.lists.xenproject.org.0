Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77033708195
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 14:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536330.834550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzcxm-0006m2-Lb; Thu, 18 May 2023 12:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536330.834550; Thu, 18 May 2023 12:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzcxm-0006jc-Is; Thu, 18 May 2023 12:42:34 +0000
Received: by outflank-mailman (input) for mailman id 536330;
 Thu, 18 May 2023 12:42:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cfsf=BH=citrix.com=prvs=495ba01a1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pzcxk-0006jU-Vs
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 12:42:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 731ed076-f579-11ed-b22c-6b7b168915f2;
 Thu, 18 May 2023 14:42:31 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2023 08:42:18 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7366.namprd03.prod.outlook.com (2603:10b6:510:2f3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 12:42:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.017; Thu, 18 May 2023
 12:42:15 +0000
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
X-Inumbo-ID: 731ed076-f579-11ed-b22c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684413751;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NG7LS6mzYnWLVhuTmdFXZLfM9ZebIaFX7/n2J7WJhwY=;
  b=GOFlDHqLwrq+Vbh+gdhvjAdIQ0Y9B4vSwAsBhglQG49fbw6jyhkPmigI
   3r19tR81W/G89tyZoAFd/B3PJOMvN1FpJnaBpYx8oeM5eymDQyrl/0m4F
   mOnY0qXuWOxs8kQG1HinlA7CcklJlunTcSvl8Anzw6XCob+MJz05k1qaE
   4=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 109399071
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fi3yFaOnTlnYT3vvrR2LlsFynXyQoLVcMsEvi/4bfWQNrUoq0TMAz
 jceX2yHOa2OMzH2ed5/O4nl8UsDvZXcyNVqSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5wxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uFeDFEU3
 PAZEh4ycVO6tbKR2K2LFsA506zPLOGzVG8ekldJ6GiDSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PtxujeOpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxXKgCdNKS+TQGvhCvl+P+X5INRcsVGSQkOmYu26OXNN+E
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWNQG+Z3qeZq3W1Iyd9EIMZTSoNTA9A79y9pog210jLVow6T/PzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQOAhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:B1Hm/qp+hmXODzB6rtHCV7EaV5s2LNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJ080hqQFhbX5Wo3SITUO2VHYVr2KiLGP/9SOIVycygcw79
 YZT0E6MqyKMbEYt7eF3ODbKbYdKbC8mcjH5Ns2jU0dND2CA5sQkDuRYTzrd3GeKjM2YqbRWK
 DshPau8FGbCAgqh4mAdzE4t6+pnay4qLvWJTo9QzI34giHij2lrJb8Dhijxx8bFx9f3Ls49m
 DBsgrhooGuqeuyxBPw33Laq80+oqqs9vJzQOi3zuQFIDTljQilIKxnRr25pTgw5M2/9Vowl9
 HIghE4e+B+8WnYcG2ZqQbknyPgzDEtwXn/zkLwuwqvneXJABYBT+ZRj4NQdRXUr2ImodFHya
 pOm0aUrYBeAx/slDn0o4GgbWAhqmOE5V4Z1cIDhX1WVoUTLJdXsIwk5UtQVLMNBjjz5owLGP
 RnSOvc+PFVW1WHaG2xhBgl/PWcGlAIWjuWSEkLvcKYlxBQgXBC1kMdgPcSm38RnahNPKVs1q
 DhCOBFhbtORsgZYeZWH+EaW/a6DWTLXFblLH+SCU6PLtBGB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMy12oFR+BylehT9Yd3U8LAd23FFgMy4eFKyWhfzDGzG0vHQ7cn3O/erGM
 paY/ltcrjexWiHI/c84+SxYegVFZAkarxnhj8KYSP+niv1EPybigX6SoekGFO/K0dsZkrPRl
 0+YRPUGOJsqmiWZ16QummlZ5qqQD2xwa5N
X-Talos-CUID: =?us-ascii?q?9a23=3AWH/QJWhoh46vyn2CBPzTyZhzhDJudVTQ/C35L06?=
 =?us-ascii?q?CJ1l2C4SnGXiI55M4up87?=
X-Talos-MUID: 9a23:bJxuLgbdxzBvhuBTiT3wuyM5Cc1S4puFOVAsoLU2vMilDHkl
X-IronPort-AV: E=Sophos;i="5.99,285,1677560400"; 
   d="scan'208";a="109399071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mu81g+6EshPnCwxEtZO/upLxf9bg7v43QiLBVPIcpE6/EAlkmndMSq9rud8MITlqE2Kbh0QtPseZl6sK5tJ2W5HTTv5V3miJqKEqrNu37XtheMyCtzfblkALNLvxIdmZuAeCr48EEbRtuauW1PgzrZ9Rr/GqnOGBlm8H0OJPJhql2Gr9JzcOfspfTc59/m1jaw2DM9GatCVzDwiTF7M1081/x0KFP9ZMxkWkFe9gHyWT0+baEq5ZuyWddHcYUCUlVG751NUlUQ7KjvAJxUatKw/rSRqu1+cRUhigVDpvY9iNblBODn8N5So5skc0BDdlogMaM1o+zKkyRZaWL3mwVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NG7LS6mzYnWLVhuTmdFXZLfM9ZebIaFX7/n2J7WJhwY=;
 b=KxBpz6WxSy1XhBzhMi6cGkLsJjd1jBdo0GkqJ63Ex2g+eB3lxfRqrNOY3FCcyC9ThDAzf28ThPZ59x7OkskSgq4RouZVoNf+hU9yNJl0k1Z9fzfeeVkgsHdc67cQ4RDbJRS49hi4Wte5aE7483bLm6qgJ4n+sIOMfG1dyU7pHxw7kw+8mfcWTCPZ+XYsIiWR1UrJu3WLC9gvIH+fAaVt1m5+VRbOVq2dL82Z8fR1LbkkF0OaV9cae84IdI4q2C+3HsjicWzk1eVyrZHbN4wVm4LFirbpVCQxAzPQEv0HLxItWINZSg7yXcLE/Qr3QjrhPuJr0gGzMjpjQfgbm42nkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NG7LS6mzYnWLVhuTmdFXZLfM9ZebIaFX7/n2J7WJhwY=;
 b=ofpN9aj88Aeq8/JkZzfcCoUFa8QXgM3YckH/fKL9MOZYOXYqJSbkwgaL0raNs++KqDsUKPBoIxpi7qeo1fBkEdhyqSvYLi4wKA2x06w2bzvPwfD4j6krPhCB7VM7Jhe1iZNc86R5kygbPuOdJLAtkFlKeetuXp5Ygf8ZZSde8zM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <480194dd-4757-d9dc-a2f2-7dea9182aeb6@citrix.com>
Date: Thu, 18 May 2023 13:42:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] pci: fix pci_get_pdev() to always account for the segment
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
References: <20230518105738.16695-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230518105738.16695-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0360.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c908980-d93d-4513-fcfe-08db579d4f40
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PsDfWbW+XY5n9mnlzTjVdspeAoS6k6Lc8xKkchmekciG2LCD2+hKPMdF1m7WzWmOHIx65OY2pydfzhSP3kY0EVLweEx2EunOTcO7RFkMx3xhJ4c5g3fS7L2wJ90zYUsumFulUB6McxnDL1AJl+ttTDvn3aiysHUhDkAY/gZS9M/X7CiJwQD4RIE7qL0iSicNWNaSuuM4fUUuSnsCKrH9y5HbF968vNDMT59sr//74nNOu/qznlUwztskyoDjWvr6PXpNVyLiPtJZvoawKTp9DGtg/s4+7h78vtMPrig39kkVdywtGR0ug5xFdMc/B7/9q3MvWB++3N7//STjVTz4KuyEBuo5OJHivJwF2K6fw2h/kPN6g1cVXdAFofV0TUJSAHopDBArV2KPF2DQ52TxTzHq8V+8qvPhs0Od2vd2XxGYhzFCjXih6MYbA4R7RCvg2LHFETYXkPF2SU6WEmmIFTlZLDFnv1dKch6QCl/5GfVD7LPuVND07j2fmWa+cQ9oN6+yZKX4ofFK/vlyNiG8By0YKMdkiV4NgzUNrDDbHjum3GwajHhTKjuCRaloIDQgAjLCG81Iun66yR5KJfs1auc2WIXeluny0rmoxfjXqXXoMu+eKsXDoLqEm3tl0YK6cCSGrNsyVipXHjcd0/g9SQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199021)(8936002)(8676002)(5660300002)(186003)(2906002)(82960400001)(83380400001)(36756003)(38100700002)(4744005)(2616005)(31696002)(86362001)(53546011)(478600001)(26005)(6512007)(6666004)(6506007)(66946007)(316002)(66476007)(4326008)(66556008)(41300700001)(54906003)(6486002)(31686004)(15650500001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkEvalFmTk9JVGtZOHZNZC9Ea21Id0t3aXRwOC82QzZtSXZwVG5nT281d0Fv?=
 =?utf-8?B?NC9pcnZ6L2NXQXAxaGl4ZTBuay80NGVyLzJxOXVlbTJEeEdyb2lSeDZlNFRs?=
 =?utf-8?B?cnZnU0pKZlFJQW9oVW1vZjI2ZUp2U3Y4WExWRlQ1K1gyRE9wVElpY2FqK21i?=
 =?utf-8?B?Ynlza3lMeWNQa05PQjhSdlU4Y21BUUxpR2ZJVjRvQVlXalExYWVobnY0d3pX?=
 =?utf-8?B?VUE0WW13aWJhUGYzNmhub3g3MzljajRmeWtQZVMvOGdtL1RkdkdjNjg5aTBR?=
 =?utf-8?B?VWhnVHhLYTUySUpYR2lJcW1zLzl0SjZvdFdod3VkQ09IM25XMzAvQkEvL3BL?=
 =?utf-8?B?ell3ZStXUGJzZ1ZmMEpqaHhheFFOVHhHRkZGbTlQY1VEMEQwUmJZeUVVMm12?=
 =?utf-8?B?Y2tjRGh2amE1YkNicXNreHkzeWsraXNlNWJlT0hSdEJzNDhyUzhDdncrRmpG?=
 =?utf-8?B?eWZZQ1lqNXIwbkJid2poUmd6MjFxcXFGWW1rSHFrR2tkTEhRZUV0MDl3a1FD?=
 =?utf-8?B?aFV0SmtvU0xUS1cxWlFWQTlWYlI2MERWNnJIdTN2SWFFZWVoUG1LZ3JDcitj?=
 =?utf-8?B?ZTIrTXJhdUNWMG1NMC9SOVBQQnpqd3pQa3pKZGxGV2NreEVKNnRYNkxJcVNV?=
 =?utf-8?B?M3kxa2Y1SWZEbFlCcE5HNDJTNkxFRUkyZzFHUW5Da25ZeEI2ZFJXd0VjS1pZ?=
 =?utf-8?B?MXpYS0ZXQ2R2NTlzcU5MTWx4eXg0dVYrT2huWHFZMFRrR3owUm4ra1RKTXJX?=
 =?utf-8?B?MDBBWGtTN3VhSGZkb3NlQlAzeG8wd0QyZXVqeVNKNEhKcG41RGYycUhOSkxj?=
 =?utf-8?B?ejVhaXVrc3kxY2tUby9kRWFjYjFVNXZoaVRBckFnZlVjdjZHaDQyZ2JETnlq?=
 =?utf-8?B?ZVljSE50L1hwOVgzVW0raFk5K2IzZDZBVnFtRmZ2RXNPOXdrcC82bTB5RHpU?=
 =?utf-8?B?cHpLQ2cyU0oycDM0YXcxMHlWTGlBM2dmalRHWFZIb0xMTHhaR0xua2s2d3c3?=
 =?utf-8?B?cTBGazZQU2lSbjI0YTFRSE9Jb3RGcUpWMHB6d2tscUl0VVhXYUZaME0xeUox?=
 =?utf-8?B?NitUd0xOZm9FVkMwNTJPL2lFTGoyRTlIOXFGbUZPYklrQ1VuMG1WQlgweCt4?=
 =?utf-8?B?aU9nNDlPSURrM21CMUp6cmk4RVRPa2FEa1NIUVNabGY2RDI4OC82N1JiNHVs?=
 =?utf-8?B?dFF3VU50TTRXVkdSOTlUOFVNREdCNlBzQnZOYk9SM2FVRVVBdjZWdzVCRTZq?=
 =?utf-8?B?WnpmMVFOME1DaWZrZml2S3ROT29NbWMwSjNHbGxtRlJsTWdZc2xJdm5Kbmdv?=
 =?utf-8?B?bFVHVW9DUkd4aVVJNnoyMXpFUzUyTDUxekR2STdCUjIwNklFa0ttOGQ5aTZY?=
 =?utf-8?B?ekVoWkdkZ0ZBOThXRm5WNWtmZzhGTWlsditKYktyU0VQOENDWDU5ek1wcTBm?=
 =?utf-8?B?Nms0T1R4RXNCc3l0bUtSVjN3UDdpVGxZanNBS05hYkZNNWFpcWFCQ1NjSG1z?=
 =?utf-8?B?MWRCaWNGVm90MmJkNkw0Tkw2Qy9Oa1E4K0htNnpwQ2c4TDdhMGt6eEFtRzM1?=
 =?utf-8?B?VGg1S2dWdTN1OE1HSndDRXdTV1FteWJ4UWh0RTR1anNoVm5EL0N0cEsrdXRy?=
 =?utf-8?B?V2lDM2E2ZExBT1lkY0hscURrWVJsRVp1aDZiN2FUUlpnRkxNblJQQXNWOVhx?=
 =?utf-8?B?dEQ1K280bHNMSkhZU2hXVEp5ekpRTWRYd2pIMmFDMk5yTGhzZkpzNXh1NUJw?=
 =?utf-8?B?Rmg1TTNUMHBpVSsxcXE0Y2pMckFEYThhcFBYNUJpWndydDBDNkZhbzcwR2Mv?=
 =?utf-8?B?bEtiRE5Na2tTbW90cW9DZmhpcTUzY3dEdEJDMHVGRmo1allCc1U2UXBoU29Q?=
 =?utf-8?B?dDA1MDRCZkxkVEdUUnY5Zk5JdjJYWis4cVZ2YXdiaUNYUTNqdVJHeW1NRm5k?=
 =?utf-8?B?aHZBR2dNNnJYQVc4OUdlbnRpY1I2V1IyMi9HeFY5NWVLcCt1dGVIM1p0VXlE?=
 =?utf-8?B?ZlowV3dLVm4wZ2xERnFtMFhJeWVkTmJPZ0dNeUpQTDlad3BGc042RUJHeFFl?=
 =?utf-8?B?Ti91WXM4VFphVFhqRHowdlk3S2ZOS3JNK0k1UHFWNElmR3ZOdjZhdVF6aVdC?=
 =?utf-8?B?RDB5aWRjQ3MybzNvNlBvZXhXMlBILzFsbXpKYkRpdWc3cDFZd0llaC8zUTYz?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s24v+f8Os3CF8T11RWgn+FBEGBQR2EkXUPff6Bpvz04qnATuCYsTNjnYhJd9VOyxIVWdQJG6bhL8Cby16hVHbekqgIhoXM2J1Xd3Y2Xm/sk5LbeEti9OtspSO+nurP9zgx+QT5dVqEBut0aFxJlxJx1jy+Hj3UJXgQWOVsKDaKKQIp34h/p0f/lrC9VLICXi3aZ5RySfwhyehED6mp21fGu+W2ymAkXh+iKqaJrYx1gdwzQ6S8HGDl3L3Nk/gTHvFIQw+PS3UtAzYWDVo+5f411ZFzOAAz5DyNIicYasn8NfTA90YkabdHER21H13hWbfZ/L6gtdNldHPWv+/NCgBG/Qf19kXWbcYAXYJWgFFRDMhOFEbdB8jr0bO59qbV4NYk/o1Wo3zME0rBB2s3sizsyEbhYHX1rLBroOdRlbjDvd4jKDRckpSk3bB3vQA+hlTF1FDOZgNvYvGvbObNx+dDTtHzIBApNeXlp/JnBWPbS12Etkz/z0qdkDtLUe5uEkCoZ50YHRvh/5w7Tw74P/BDFlkSmpee3k6zW/o4cKpu+rTUXQrDqIL6s+9p90fBvbocOtTPap3Xz3p42Gvqeukp2r04gwkNqliZUKG2PPfjthtzt3zPM4VdBYVISXZNu0m4cORDl3SQdSRWJXjeZ55lN7ga5qr2rSCuWsKrGZuDDc6vTzsDJYxAlCY4uL6C1oq6++WvAcQfYd5c9DLdY810jXsQt3uL98Rd3VUpSiXbMktzz3515mLTAs6rtjWMuTF9iobMNTlxxDO3Yf4SK780juGR3wXRg0VuCNg9u0BstdcUc8DOuNmx/Xr/JBuyzIZDYUSFywpql04Rx/xwikSg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c908980-d93d-4513-fcfe-08db579d4f40
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 12:42:15.7606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FITNHWTdemjipg9Bv9B1qHkLk6U0zw2RtGHJirv9+P9ZXQT6sPcYcpy6Ws8YyQk3QatggjhfUULRpwT3lzMqf8EoVWebSwA8GqFTJuCXIrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7366

On 18/05/2023 11:57 am, Roger Pau Monne wrote:
> When a domain parameter is provided to pci_get_pdev() the search
> function would match against the bdf, without taking the segment into
> account.
>
> Fix this and also account for the passed segment.
>
> Fixes: 8cf6e0738906 ('PCI: simplify (and thus correct) pci_get_pdev{,_by_domain}()')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> There's no mention in 8cf6e0738906 that avoiding the segment check is
> fine, and hence I assume it's an oversight, as it should be possible
> to have devices from multiple segments assigned to the same domain.

Oh, absolutely - skipping the segment check is very much not fine.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


