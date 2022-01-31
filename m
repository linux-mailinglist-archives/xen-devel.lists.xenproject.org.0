Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 897B54A3EEC
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 09:57:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262803.455177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESUo-00044w-RG; Mon, 31 Jan 2022 08:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262803.455177; Mon, 31 Jan 2022 08:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESUo-00042X-O7; Mon, 31 Jan 2022 08:57:10 +0000
Received: by outflank-mailman (input) for mailman id 262803;
 Mon, 31 Jan 2022 08:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytUN=SP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nESUn-00042R-NC
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 08:57:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c373b6c9-8273-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 09:57:07 +0100 (CET)
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
X-Inumbo-ID: c373b6c9-8273-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643619427;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=v0uCsFN7cuyPvP36Q/6+jZz2sPtuZrTqUmU+2s+2fIY=;
  b=foECka5i96Xsyrzjs/Xxexr/3g4Ozggg5Q03vnxynCRZIdAcqc6NRFWb
   vu6cd0EINvFO75OHiry6KOLZF9m3z5Z/FYreycgC/9cLjjqcuflYmp1EA
   iOrgkcpslwi2czQ+Kc6XeGIMAsmNioU7I7v2lZR08XWCI0vMteOhvh+s7
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /481knikzNJreyF2jcka5xisX/33OxGNoLoIF3RH8hd+kE8g8InAHW+RC3lLp/ythvOKYKXLXr
 15y/6XTDOgjIECq4JWex/OkpmMefrZPXkCoLfbH5puYiKLj5EK0Ws2l3g4phvWVibyIIDnaO/j
 9uQuae+5ZaIhow84qMT71Vc0qL27IP/j3EQdNnunt5Q+6sS3dnHWYNkRuh5FEBWNjUZ+DNmOdp
 SwSf0Mxzgtza+C1AwsOjUBFXuDu+a3/lxGuweBn/zyFJLheV1+RPcgdFcXpSac91LXnswbHc03
 53whb/9ox3seAx/if96qxd55
X-SBRS: 5.2
X-MesageID: 63101300
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SZDhhqLEDDV5SeH/FE+R5ZMlxSXFcZb7ZxGr2PjKsXjdYENSg2MOy
 WEWCmuGbv2OazemLY9zbY6y9h9Sv5CHnddgQQZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us4wrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2GxuBq2
 c12vKeubjsZEafpssYHCUFXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UvoYAhWxo3qiiG97aR
 NA6ZGJuZi/uXBlhYlZQUM05nNiR0yyXnzpw9wvO+PtfD3Lo5BR4zbzFINfTPNuQSq19t1yEq
 2fx2nX2CxAXKvSS0TOAtHmrg4fnly7hRJgbErH+8/dwmUCS3UQaEhhQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8BZE/A+rhqMzKXUyw+DAy4PSTspQOIhsMg6VDk7z
 GijltniBSFsmLCNQHfb/bCRxRuwMyUIKW4JZQcfUBAIpdLkpekbqRbCTc1qFqKvufTzFSvt2
 DCBrCU4hLI7gNYC0uOw+lWvqzCxopnESCYl6wORWXiqhiteYIOmfIWu5ULs0edbLI2ZQ1+Cu
 1AJg8GbqusJCPmljzeRSe8AGLWo4fetMzDGh1NrWZ47+FyQF2WLJN4KpmskfQEwb5hCKWSBj
 FLvVR1568ZjJ2qyVqZMfaWNO+sg6ILCD469WaWBBjZRWaRZeAiC9SBoQEef2WHxjUQh+Z0C1
 YenndWEVihDV/k+pNaib6JEiOJwmHhirY/Gbc2jl3yaPayiiGl5oFvvGH+HdagH4ayNu205G
 P4PZpLRm32zvAATCxQ7ELL/z3hXdxDX5ris8qS7k9JvxCI8QgnN7NeKmdscl3RNxfg9qwsx1
 ijVtrVk4FT+n2bbDg6Bd2pubrjiNb4m8y5gYHxzZQb2iiRyCWpK0Ev5X8FtFVXA3Lc7pcOYs
 tFfI5nQahixYmmvF8shgWnV89U5KUXDafOmNCu5ejkvF6OMtCSSkuIIijDHrXFUZgLu7JNWi
 +T5imvzHMRfLyw/Upe+QK//njuZ4ClG8MovDhSgHzWmUBi2mGScA3av3qZfzgBlAUir+wZ2I
 C7PX09A+7GR8tBkmDQL7Ijdx7qU/yJFNhMyN0HQ7KqsNDmc+WymwIRaV/2PcyybX2TxkJhOr
 80Mpx0lGPFYzltMraRmFLNnkfA369f1/ucIxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOXbIt7hHX4QOBEhMraJ28YLl2SA9v8yOkj7unN6peLVTUVIMhCQoyVBN78pYpg9y
 OIstZdOuQyygxYnKPiciSVQ+zjeJ3AMSfx/5JobHJXqmkwgzVQbOc7QDSr/4ZeubdRQMxZ1f
 m/I1fSa37kFnxjMaXs+E3TJzNFxv5VWtUAY1kIGKnSIhsHB2q090ipO/GllVQ9S1BhGjb5+Y
 zA5K01vKKyS1D50n8wfDXu0EgRMCRDFqEz8z1wFyD/QQ0WyDzGfKWQ8PaCG/VwD8nIadT9ep
 enKxGHgWDfsXcfwwiptBhI19629FYR8pl/YhcSqP8WZBJ1rMzPqj5inaXcMtxa6U9g6g1fKp
 LUy8et9AUEh2fX8f0Hv51Gm6Ikt
IronPort-HdrOrdr: A9a23:Qv53i68ix44w/thoH3Buk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="63101300"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBkEKmfSUXmSMOwL/0iTFTRQDrEr5tNkGS0X4I57tG96s9LplHup/JjFcHDNqpZMnXCSKT83zAoOKgpR8NQ4kdcW2bD1udnqfFGBIZxRM4FtIPaAraud9gfiAoxKP7kEAvJpT1kDMpBOcaFsl2iWSWqkkREsjhzfkKmwy0PcdBEOtnDYiYRz06G7xVnSPrPx6Ibc6fyIFZhoA+FL6osCLRuEU3K4Oo4vPivp00pxFYr11PEA4O9jan1YFMDrwAJoLwDMeBhYfkIpnTaQJYnfVTd4jRDrsXFoIMCiEf7mWJ5c3wCEyZ0UE7LM7p9bBKdJpYqiPaylZpPPPygQQJscww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTrfXcwKimioBEh4P/30fZepIiT5wZOWp2rDgpxwfmE=;
 b=odsXBli9F2o8Blkz6pBNURWnjHIa+YNd/yg+2FINVqcz4jXVkr7JepeQYGkXPtyRMOlJrW8uesASaeKWC4XuN1nQU/iaT71RzSNNYDWmY92fGW4AoXqwCEeRO1tpha72XGep7N9SkNEM8uOVtrEdUiP/jOxwCsuNZ5XnQnwqHeoOAIvNYWIX3JoMWvX/DTP8ECP0ggqcgabyUP0P44Ws8KvsMgSZ1UbazdixTrEfFoRAE3fEBmvlpetin4k8QzyzdPxu0yHREDTiDS2y2WCRpZVgbgSuAWUuFwvlyZxJXhfHXxuBITfOwR4dRRqQBDnRfVTvW+oimaRUYmOSD0ZTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTrfXcwKimioBEh4P/30fZepIiT5wZOWp2rDgpxwfmE=;
 b=uO7/ksLVLD27fVA6iEnj5MawCcr0fEuGGbJ5TQOQCGtrF23XfnUW7jjrQiMUBuRblMOQ6fAQYZ3754aFaxw3PsZUDgUkXKnoyGMxwgiTVpOP+9DPkmxhszgPaZhJEw59jw5Cm1E6H/HemIJOUKEN5LGoRArTPqOIJ56lHpG3SAk=
Date: Mon, 31 Jan 2022 09:56:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Message-ID: <YfekUyXZZ1cxeObs@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com>
 <c7a9020a-9713-47b6-45bf-5ac2c6d4157c@suse.com>
 <Yd73Aq4w2H1Eo01h@Air-de-Roger>
 <4fb1d547-6f6d-c4e8-b2ef-0dea780dd66d@suse.com>
 <Yd/pnYDBwsdyLrPN@Air-de-Roger>
 <c937d26a-5357-1ced-ee6a-ef713a3c5964@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c937d26a-5357-1ced-ee6a-ef713a3c5964@epam.com>
X-ClientProxiedBy: LNXP123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9abe09f4-70cc-4d58-4d1d-08d9e497a347
X-MS-TrafficTypeDiagnostic: BN8PR03MB4884:EE_
X-Microsoft-Antispam-PRVS: <BN8PR03MB4884C2F79063B5E6CB27C0958F259@BN8PR03MB4884.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zA5sSt6cfoa5KHl0qTsg6U++8lBv3xfn0WRONRpCWCQzYz0T3FRjYBtF1L0YfRoq90IloAzFl8tvwfU10bQKMbg1hXiiBPjRCV94vw+eHgFc/VooHnZ3sKztfzvnzE30nNlrOWy4sgViM//ShtmKomnQrgUXA1tyO6vh5MCkUxEgCbvENhUkc2kWYvQ1zrOZlBjKbrIu45vxwSLlsgt0s6rJsvyaiM6GcFYmicQb8HGB5otJZ39pTleMVqjqt9cokDT2+PG6o+zIElv4dRmT+/jWo3IIRU98VRLC/enahiV4Q+fvAaaLiWd3fvMxaDauFFjVdFfgWBY6zJK1hvKyW6V+08csIH5+Qz5soXU+fzgqdt78Rr69hC3Iic5yKY8llCuKFDyqWpF09V6utX6jhlk0Q7e9EBpLFqnYLvaGTxv5Ap4WvPDYdOtv4Br0k3LT50ucGpTw5q0QOWj4CApPDh8nB3MYozex3znPfv+AoxYq5v4fQEEJ+S6lEeHlXhu2f/1Wz93xP/mrwVHgqWuADlcCaoknqZ8aEuuXZXJkFaqaG3s7nXTVRsptiJdSntIiMBADnm2Ofu4ulKOAS/PA4BS2jtX4YZ67DauXOlc5adglmsqDMcukWDEWyMtBzCnCZx6kAfGiyrpV+p+4LRELcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(4326008)(8676002)(86362001)(83380400001)(66556008)(8936002)(66946007)(82960400001)(38100700002)(33716001)(66476007)(6916009)(54906003)(7416002)(6506007)(6666004)(6512007)(9686003)(53546011)(6486002)(85182001)(316002)(508600001)(26005)(5660300002)(186003)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3JqNEVOZVA4OUhsRlQxa3JLVklSNkFQNEc3ZlRpcm9zNzhnUHhGbXFJTDVo?=
 =?utf-8?B?enVpdjJJZ0IrSm1Pd2gyYmJ5OUgwd0V1MU5qVmxDbW80Ukh0Mk9RQ1B4cFpQ?=
 =?utf-8?B?anJLMW1UT0s4MnF0ZlhlVTRmeFpSZHdIUmhqa0RkM0QxNnVWZm9LTXZsRGNp?=
 =?utf-8?B?Ky82bno3Rk9od1BJZ0pWaWVqaHd1NDM4ZG9jWjJ6YWdta29SM1d6aDZVMHJt?=
 =?utf-8?B?dkdmZUhINlBIZ2pUdXE1eFdJYVg3WGRtVHg5eTVEM25PNnBmSzNmSlJPQ3Ev?=
 =?utf-8?B?M1FQSzRvblpKcXpjNERsMjJMbWFvbnM4N0NJQk02b3hFcWczQnYxWEdCOWxJ?=
 =?utf-8?B?SkhzVWlhRHk5K2l5SEljR2RpTWxaRHcrRGQvbkk3ckMzRWJKM3FabmRrOXlo?=
 =?utf-8?B?d3VLY0ZCeU5PODNnSVV2RE5FWlBteHRrV1c4TmE5YTZlOWkvaU04SVk5dm9q?=
 =?utf-8?B?aGZZWWh4NEJFUEtQZEpXYjAySUVLSEVtcWpXRlQ4UlV2dWxhRXNxQWc4SURV?=
 =?utf-8?B?WG5nMTlQUFBlVHhzZ0FGQTF1U3dHRUE4Y2g4b1JVMUladG1JMUVnd2Npc2JQ?=
 =?utf-8?B?YXNOQ0lHMGZFd0txU2lLa2xVZjZvNVBONUdFcGFTdUM4eVdKUFJXWGtrQmVr?=
 =?utf-8?B?QzlRUExDeXkwMmxZWFlrbisvVVdsdEMvYzF0UG4xSjhueGNoUC8xSHpDYlA0?=
 =?utf-8?B?RnJCb3pzK3BleGR2QWVleTA5VXMzNDdldGk4UDBJeXJMRnY0NzdTMXBIWTdL?=
 =?utf-8?B?aTR6anhBZnN4eG5mb1FaaStNUVM5QVpjeTZlMnF6dFZNN3c3QmtNclFqM2dM?=
 =?utf-8?B?S1dCVGlleDZMV3RWTlNuUGZ4M0dNTXNic1NwYW9tSEhMMTkwMnhvQi9jcGtW?=
 =?utf-8?B?Qy96OG9hMmNMVFhZUzMybDNtMlppMGVoQ3ZSekxlOWswbktoWFhUci9yNUlj?=
 =?utf-8?B?S2F5VTh2QkFNU0dSM21rdDA1N2czNWRoakh3WHRuN2ZNMyt5SlpLNFFVdzdQ?=
 =?utf-8?B?VTNRbmt1VlJHQUF3OGQvb01halpVTVRCcGZkOGR1cjdWdms2ZmYvQUIyQXR4?=
 =?utf-8?B?TUZmZmJxN29GZm1pM2xGTFNaOHY2Y3d1eEorcmdta2tmdGpJbm9VdUlVNlBx?=
 =?utf-8?B?WFdOdzNUcFBncHF3eTA1QWpUR3B0VEhlL1VjTmNpNVEzbkpQdGFtQU9YUGxh?=
 =?utf-8?B?cXBBTTN6NU1OMXhXZjFOQmdEVXBnSzFlWGg0a1IzM2N5NXFySWV3SzNVSEtJ?=
 =?utf-8?B?YTQ1VmRwcWtwTHo1NXZ0a0grOWVVN093YytrZGtjbTEwUHVjRXlyRmFzdFVN?=
 =?utf-8?B?c2swK25zQ1B0eXFjOGFLSjRiS3hFalB1cFIyZW1Hek8xTDA2QXNGaXBKY1lh?=
 =?utf-8?B?MmpmSnpNNUhaaWppY3hmN3cyVHh5clA3cjZVUUw5QnJPMVIzRHJoYlA5RXpi?=
 =?utf-8?B?VzM2bzBJS2FIdDFrQTFveEVsOXkzZHJ5amxMQ1kxdzVOWHdvMEFHWHREVWdT?=
 =?utf-8?B?ejNha3M1QTROTGhPM0U1cnRObWIxMzFjMjhmL1Z4a0Z2UHFhSjlmUHhpNjA4?=
 =?utf-8?B?eTVGaGdJZ1hMRG5ETng3cXEvbGMwdHVTb094Ump0eEdnRytyYlBtSUhoNTV2?=
 =?utf-8?B?KytKVWdlbGtNdlowZFEzUWt6RGk5b0FoaEllbUZDT2VEb0dIZzNYakN3eDho?=
 =?utf-8?B?MUZvSEErR3I4QVFUT3FZREdYc2hIYUpBZ1Y1aFo4d25GRDhTcTUyRFJhYWkw?=
 =?utf-8?B?bUZmUUhpNko1SVdyK1FoTGk2dVhVYndpdk5rcWJ6MTdNMTFIYmMwTHRPbzZL?=
 =?utf-8?B?S2U3Z3N5UVd3WnRUV0NXK2RtMUg4UUR5bjBuVWwrNHcxY0doWmNKVnJvenZY?=
 =?utf-8?B?UlExeGx5YUdNTG9OWUN0UDZiZ0JIR1d4bzl2RWpUTmhpdit0ZDRBN0p2cTFK?=
 =?utf-8?B?RGRTK1BjOExLWlp2ZW9JOVVkWVdncFdPTHl0anRoSW9LMmZRd0ltTjJaNlFm?=
 =?utf-8?B?RkE2QlRkS2F3ZEF4ZmtmcGJlTVRMQ1pQRFJaT1JPQ3VlM1REZFNBTE4xa3V2?=
 =?utf-8?B?YUNoZmE4Z3kwWmZ6ank1b3AvZys4TXVaNXJHamtmaERqT014Q0owaUd4TURo?=
 =?utf-8?B?VEFCYmk2UGI4TmVITURCeTcvR0JFM0N5ZVdMdHVHWXRVM2MyWG0wTjFjOXdR?=
 =?utf-8?Q?U06VtaJTCCQCu/z8N85OuBE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abe09f4-70cc-4d58-4d1d-08d9e497a347
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 08:56:58.1919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtgnOYtRg+meBGB7WAuSXcktjCaFZZcmvFY/MdZJJ6kavyqTGQLpcnaM98xqeb5xJCDGF0NBqCu4t0Scl8Rdmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4884
X-OriginatorOrg: citrix.com

On Fri, Jan 28, 2022 at 02:15:08PM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger, Jan!
> 
> On 13.01.22 10:58, Roger Pau Monné wrote:
> > On Wed, Jan 12, 2022 at 04:52:51PM +0100, Jan Beulich wrote:
> >> On 12.01.2022 16:42, Roger Pau Monné wrote:
> >>> On Wed, Jan 12, 2022 at 03:57:36PM +0100, Jan Beulich wrote:
> >>>> On 25.11.2021 12:02, Oleksandr Andrushchenko wrote:
> >>>>> @@ -379,7 +396,6 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
> >>>>>   
> >>>>>           data = merge_result(data, tmp_data, size - data_offset, data_offset);
> >>>>>       }
> >>>>> -    spin_unlock(&pdev->vpci->lock);
> >>>>>   
> >>>>>       return data & (0xffffffff >> (32 - 8 * size));
> >>>>>   }
> >>>> Here and ...
> >>>>
> >>>>> @@ -475,13 +498,12 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> >>>>>               break;
> >>>>>           ASSERT(data_offset < size);
> >>>>>       }
> >>>>> +    spin_unlock(&pdev->vpci_lock);
> >>>>>   
> >>>>>       if ( data_offset < size )
> >>>>>           /* Tailing gap, write the remaining. */
> >>>>>           vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
> >>>>>                         data >> (data_offset * 8));
> >>>>> -
> >>>>> -    spin_unlock(&pdev->vpci->lock);
> >>>>>   }
> >>>> ... even more so here I'm not sure of the correctness of the moving
> >>>> you do: While pdev->vpci indeed doesn't get accessed, I wonder
> >>>> whether there wasn't an intention to avoid racing calls to
> >>>> vpci_{read,write}_hw() this way. In any event I think such movement
> >>>> would need justification in the description.
> >>> I agree about the need for justification in the commit message, or
> >>> even better this being split into a pre-patch, as it's not related to
> >>> the lock switching done here.
> >>>
> >>> I do think this is fine however, as racing calls to
> >>> vpci_{read,write}_hw() shouldn't be a problem. Those are just wrappers
> >>> around pci_conf_{read,write} functions, and the required locking (in
> >>> case of using the IO ports) is already taken care in
> >>> pci_conf_{read,write}.
> >> IOW you consider it acceptable for a guest (really: Dom0) read racing
> >> a write to read back only part of what was written (so far)? I would
> >> think individual multi-byte reads and writes should appear atomic to
> >> the guest.
> > We split 64bit writes into two 32bit ones without taking the lock for
> > the whole duration of the access, so it's already possible to see a
> > partially updated state as a result of a 64bit write.
> >
> > I'm going over the PCI(e) spec but I don't seem to find anything about
> > whether the ECAM is allowed to split memory transactions into multiple
> > Configuration Requests, and whether those could then interleave with
> > requests from a different CPU.
> So, with the above is it still fine for you to have the change as is or
> you want this optimization to go into a dedicated patch before this one?

The change seems slightly controversial, so I think it would be best
if it was split into a separate patch with a proper reasoning in the
commit message.

Thanks, Roger.

