Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F374478C406
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 14:16:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592149.924779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxdM-0004JL-Is; Tue, 29 Aug 2023 12:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592149.924779; Tue, 29 Aug 2023 12:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxdM-0004HG-Es; Tue, 29 Aug 2023 12:15:48 +0000
Received: by outflank-mailman (input) for mailman id 592149;
 Tue, 29 Aug 2023 12:15:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qaxdK-0004H8-QK
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 12:15:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7ce8479-4665-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 14:15:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8607.eurprd04.prod.outlook.com (2603:10a6:102:21a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 12:15:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 12:15:44 +0000
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
X-Inumbo-ID: c7ce8479-4665-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhB02qnKHgjXbFIjQdzgZpJVdR8I2qepqGYJJDl0erwphCiULLihTekfFDjyDV2wb+bqS5iXyyWsEfSVHkrGh7vJZfMuUSE/9mh6Q+/JVfdYaOi5UvYGA5C0r/wpIHbjYFGAh4sGO3AuMzdwRhSzg3Mtm9t9vQhyVsXT+pmMs2Irx5Sz6qTKEj9dymzcxQQbiX1UVDjDQACnpXQvAhHIMwpggX4BfRulZQLz7sjE/9eprpkQ//MyDkawduLCVAK8LmwYssvRGM1fRwS4wq6z+NHB/KvzPClJVFtkVKsAro/NWLaK/1oSBdXgfGQn5c/8CCq6NGQWYyTeA1a94Np6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kOaYSK1aU6BycTvCRMwKPEsD3WbAgMeYjultb2R0/4=;
 b=ldhmHd/q0JUoK/lY9A3FEKMyRLaM2zjEg0/R+EShMcQvzuYGUNaPM9krOx5jHUvSdDtxmzX6huRotqEy+klaGBEnZ8n79D2Y4kQbfCW2RIzuA5q2uTlekmS9j487eFPlAGT/AW88ObTA0cpZJXXUu+uFaTDXU8PuArRN+vdplZ0Pr8xfwY0VvjHG11MtL8d0AaqWmzr+7EZBWo4p99PnaQxyt/D7aUk22gDfsJXepm5ERavKkUQ4P8eq8goSkoJInfR8cQoImlxhCO9rqx0p1OyOe1dALQ6cHIxRhG9pI9DtOWfT/PUmZvUNPKkfefsCqIufTyrww0cAs9aE3MJlbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kOaYSK1aU6BycTvCRMwKPEsD3WbAgMeYjultb2R0/4=;
 b=aMqQ8dK9pTxpu2XrGq5SdMS4VpxV4tDkRhevu1ryrL1EaqQwKCJkVeBpIdx8EePzx04PMoPPNzFxvhm/gpUcLJDK3CQzb5ViGB88cgsOVVtcS+pdf5Ai2xAKXhMNdHwYxsqCI4CeN1ku+AL/nTX7SfyUMouHZ2jmvhsbxXOFq1RqXJGugKZDZBD98uMfqp+GYOBKmfzL45wvO5M1pTBKouopYk7O3Vq2upuWXYGCXx2044H0cvhzu+LFPQDETuOpi09tH2RidgebUbIWgi6NSdUjWv10I3GPXzFBcUGSRF3d+2J2HiyMATP3Nnxl3dxMaxqI44GGvJlmVcTXKs2vjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c3ff2769-f9c3-eea8-9109-d1218b4e034d@suse.com>
Date: Tue, 29 Aug 2023 14:15:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: [PATCH 1/2] x86/cpu-policy: add (another) size check of
 deep_features[]
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <647aa53f-9b2f-df38-6de4-3e407f34f7f5@suse.com>
In-Reply-To: <647aa53f-9b2f-df38-6de4-3e407f34f7f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 0253f620-667b-4bd7-fb5d-08dba889ab5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cCw93K/9MrQ29s8grr7kAOXBG03fCa2aejX5qG3X1odhGpIXWRsY5+5/kNIYntL/bkOmpdecwkyhPrw7HNQzuR8+c9vDoF1Dk4u7bTe1Jc936Af5o6+e4WIY6FvryE/l19InZoko9DTI4CtfFL+0cy+sxSyL14mC3W73z8rTZpGHZR4HBFv7lCUuIhMc7ceXqbmUgAGvzYf+mnqOPgUrYHfb7c0Eizf778esPSQJDUHAhL7rDugRK7sT5+0KR73xtgu08hpCWe94/Lm4NeGDBYfG2pEu9VjqbaXsMab7rT0x024aSOYaZUILRh1cPvp3K76ce9/h5QMl0ItniMRKIhMpDcqwc5BVwLIv5WhZ9RNhgpuKJm+sWwiSUbKSrC+h5SSaZf6qBSf0bZkcJxKDHplHJ6Qj5FKv/7CE3Jp85zcW7wHBfPjmhB0yhSl70AdmuaQKOBsie3BSsBumKwxk8PAYo6LNTdLk+RidX6g4FuUw9wQuGxJd0pAAD6z+ha+MOEeOunvQqJY9SiwKrW0lgiE0ixEU+aZ4lE7k0ZtF65xk3dqCRwp5EtPnZnod1cGAJxz3cnCZPqH/nqTwgeiEa/+O8AhC26oBRWomrfNJQ7m6AoENGyNLihPOQC0piDP+e6OhTmnJ0uC2DT8S2yRFOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(39860400002)(376002)(396003)(186009)(1800799009)(451199024)(6506007)(6486002)(86362001)(31696002)(36756003)(26005)(2616005)(6512007)(316002)(6916009)(5660300002)(66946007)(66556008)(41300700001)(66476007)(38100700002)(54906003)(31686004)(2906002)(478600001)(8936002)(4744005)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlpiZUFPRzQwTUNjcjBFaUZVc2xiMkVIeXkxQVZlREJIcnVPTkhuT1F6R2M0?=
 =?utf-8?B?ZWQ0cHFkOUJDaUxlcDd1akRZcXVsRkQ1bmdpU1Z1ZWgramIydG9rcUx5ckMx?=
 =?utf-8?B?QjFiN2szTXhUM1E5R1VwOWxsZTgxV24yK1pISmtvNXlHOFJLV0Z1Umt1c2Y3?=
 =?utf-8?B?TURZTWZ5K0hOcjZpeTVDeHJ5VnU5Z0NGbUZjTForY04rOGEwcnV2Q1phd1ha?=
 =?utf-8?B?c3BJRUxUVEpjZ2xoempLM0ZQZFFXZThNNVdXdDdiaDZic0RXUDJ1M3dKSVJM?=
 =?utf-8?B?V05OME4vUzRUeVR6RG1BaTRudldlQzhyaHozcjREbzRnb2Q2NUN3M0liRUlt?=
 =?utf-8?B?MDlNckMxZXdjMUR3V2kvR3RwNWNMMHZrc3hteGFqNmNjRSs1bysveVhFa2JZ?=
 =?utf-8?B?YitqdHF1c1JVOGxGcnFaUGRhVEpNaTFIdGo0K2JvWFdKZHRvUENSQ2p0d0ov?=
 =?utf-8?B?Uk1CV3VjZEp6RGhZS3hNaTRZL1BOZWMzcWhHTjNaeWF3MHJ0U0o4U21OaUpa?=
 =?utf-8?B?YXMrL3UweXFuVTRFTUNzWE80dlpEeE9MRk0vRE5GNHZmM3VxSWRITlJUa0ZC?=
 =?utf-8?B?YmVLWlBENy9nSFNZeURtc1J5enRpcHhMU0VldDdqRjZRbGZWNURTUTMvYkZ3?=
 =?utf-8?B?TG5nZTRqUDJKbE1UcmxjeGI3blRvWmJuckg0UzJLWmdISk5UWU9ZUnd5RFQ0?=
 =?utf-8?B?R09OUTJ5aDhPTVZjNHNZMk9oaGQ5SG8ycGUzWG85K3BaZE9hcko5VC9nSUNV?=
 =?utf-8?B?UVRkS2xDVHFKcnRNRUlOdjdnZzROYUNJTktodWxQY3loV0tuY3ozQUMvdGJL?=
 =?utf-8?B?U3JGR01BejR0d0UxUFNlTHdhNEtNQlNoS054YzhicWhra01XRk54S1owZEli?=
 =?utf-8?B?TXIxaVdzUWlNYjVDbXE0UG51aWRpR01YaVZubUhnZytLbE4rbkMwQkZHSWdR?=
 =?utf-8?B?OFlhNEJZU21uSTNmb00yN3FpRnNyU0JHcVp3c0oxUVFaV2M2UFVidmRQU3F5?=
 =?utf-8?B?Yk92Zk5GL0ZIZUtERUFqcXZHTVJCSEQzckVNS0lkN1o3QWtJTVlMZ1NISkdJ?=
 =?utf-8?B?aWFZOWVxTjFTRklsVElIRVJRbjQ5U2x2VHJUQ0cvY25aaGwybmd2QjVIR0pK?=
 =?utf-8?B?RS9vVytCRVE1TUswbmQzbGdyVlgvck5WTkRPRmhxclRqeXd4OXFhTEdHKzlX?=
 =?utf-8?B?cEsxdXdjVUQwdWhMcG1jaGxna0RJbmIxMzJTVmdOM2FYUEdUa2o4OFMwdkhn?=
 =?utf-8?B?VktLenNsajZzblAvQnR4RzBxa09OMEdEODdIZ2NWN1hydjQwN0RadUdQcnk4?=
 =?utf-8?B?VEw5VFVMS2MzRFAwbExBMmcrVkRCZ2VQc284bk5tRVpORHVZeVJJVXJqcHlv?=
 =?utf-8?B?aXp5Um51TmN2RHJ6L2wxNmdtaEFYdTZPVUZCa25BMHpmdEZDU1h5YndHUnhq?=
 =?utf-8?B?SkJwOGlPSFRIbXd3VmY5TWNMcFJWMzY0MkZGVS9XSnM4MzRJejluSFZoK244?=
 =?utf-8?B?bGsyYVRvSHUxNE0yV0U4VXFMQlZpY3ZqZVIwTjJDTEVLUTNRNWhFQnBWYlJx?=
 =?utf-8?B?dXV5QTVQNDdCN0U1OHB4eG54TnpRZDN4RnN4YkVFT0JjTWFBRjc0TjVldGo0?=
 =?utf-8?B?MjZaT1pQQXN4bVR1a0crY3B0ZEVVQUh3RmRHeXBrcjY4UTh3bWtxNG5udGZI?=
 =?utf-8?B?VUg0Wk53d3RYWDRRMmU1QXVIVXBFV2hJdjBUeGkxbXN6aDN6dnB3KzQ2UlA3?=
 =?utf-8?B?ZTZ6OEh5ZDRXVGRndlBCVFZmSS9PbVYrU3ZjR3M1RnVtdmtaWjZEOFhDN0VK?=
 =?utf-8?B?NHBDZ04ybVZvUjdmRWMvMFNEV2VTbEx1NnNneWIvcHlvaTAyWUV4djhqUHE1?=
 =?utf-8?B?VzRrQngvcjA4U1duNkNGQldsM1RoTjJrUncwVUdxZ25wSWdKTzRqSFZ4QldN?=
 =?utf-8?B?MkxzUy9NcVRobzRoY3BXMnlycVVPQUgwc2ltREhGRGd0V0VhbjBmS3FaaG9D?=
 =?utf-8?B?Rm9aajVhaWluK1NqUzhZTEpLeEdUUXhuS0Ziam0vcm54UGhlVFNRRmJIUmt2?=
 =?utf-8?B?VGpUb0xYMjlIZTNzN1BhYkc0b1RqeC9xWVpxbi9hTzgrWGhNQlRpTFMxeFBx?=
 =?utf-8?Q?Fwr5uKMXAD8S5llXij0//Qyom?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0253f620-667b-4bd7-fb5d-08dba889ab5b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 12:15:44.3165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROtCMdfk7qT1nOBG4Ic7ltVoNMEziFWw6Zgcphvda/TVJMNL67HTvWUNW6OPt+Xijbeu36RIEO/clqztCf0B6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8607

Having this check in library code guarantees that the tool stack use(s)
will also be covered.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Dropping the check from arch/x86/cpu-policy.c:build_assertions() in
exchange may be an option. While there checking is against FSCAPINTS,
the difference is only on the surface: That's a #define resolving to
FEATURESET_NR_ENTRIES.

Really the duplication of deep_features[] itself is also somewhat odd.
While not quite as big as deep_deps[], both Xen and libxg could
certainly get away with just a single instance each.

--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -298,6 +298,7 @@ const uint32_t *x86_cpu_policy_lookup_de
     } deep_deps[] = INIT_DEEP_DEPS;
     unsigned int start = 0, end = ARRAY_SIZE(deep_deps);
 
+    BUILD_BUG_ON(ARRAY_SIZE(deep_features) != FEATURESET_NR_ENTRIES);
     BUILD_BUG_ON(ARRAY_SIZE(deep_deps) != NR_DEEP_DEPS);
 
     /* Fast early exit. */


