Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1530E75B3B9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 18:02:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566694.885864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMW6c-0000cf-Gp; Thu, 20 Jul 2023 16:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566694.885864; Thu, 20 Jul 2023 16:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMW6c-0000aP-DJ; Thu, 20 Jul 2023 16:02:18 +0000
Received: by outflank-mailman (input) for mailman id 566694;
 Thu, 20 Jul 2023 16:02:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMW6a-0000Sq-H5
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 16:02:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9ba4be2-2716-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 18:02:13 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 12:02:10 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6459.namprd03.prod.outlook.com (2603:10b6:303:122::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Thu, 20 Jul
 2023 16:02:03 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 16:02:03 +0000
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
X-Inumbo-ID: c9ba4be2-2716-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689868933;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=sOW24vdpwKFlImAKHjJQvLRO2DKrlh5GtlvIV6wNFqE=;
  b=fvJM3oa/CeOB9oUfNjwElLkZi8XMtLpGlgcFAqIhKCeZ8nbvz2pNUl5R
   TzY0Q/P9mGYs/xskye21IIkF10V0tNe59Q00gXNjAnXPSBSpXFILzCH8u
   prmnW45pOH2Dh3n2q1+JlkG1JG9OXMnTN3oQZiu2VK1zfDQoE8I5URdhb
   g=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 117322273
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+Dwzsa8lFOHumdan5XAJDrUDR3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jMXWWjSb6qMMGLzf49zb4q3p05X75bUmoU1SwI4/yg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqoT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklU+
 vJICR9SNCuZrPmo6rWKG8l215sseZyD0IM34hmMzBn/JNN/GdXpZfqP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeLilUpi9ABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWwnihAthNT9VU8NY6gGCP3kNOCiEtSAOUh9KWt36OXMpmf
 hl8Fi0G6PJaGFaQZuf6Wxq0sXuVpCk2UtBbE/A5wAyVw6+S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hRS2NCsOJGkOfxgtSwcf/sLjq4E+iBHIZtt7GavzhdrwcQwc2
 BiPpSk6wr8V0sgC0vzj+Uid2mr34J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1UdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:FTovgaMGXcdwOsBcTjejsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+sjzsCWftN9/Yh4dcLy7VpVoBEmsl6KdgrNhWotKPjOW21dARbsKheffKn/bakjDH4Zmvp
 uIGJIObOEYY2IasS77ijPIbOrJwrO8gd6VbTG19QYdceloAZsQnzuQEmygYzRLrJEtP+tFKH
 KbjPA33waISDAsQemQIGIKZOTHr82jruObXfZXbyRXkzVnlFmTmcTHLyQ=
X-Talos-CUID: 9a23:tPScNm/I6oqTgHzRnW2Vv1QbFJAEXSKH9237OFGSDlc4aKfEFlDFrQ==
X-Talos-MUID: 9a23:qGSrYAipds5Td35y08TT58MpZMdV/7yBVUIxqohelO+vGhFACzCFtWHi
X-IronPort-AV: E=Sophos;i="6.01,219,1684814400"; 
   d="scan'208";a="117322273"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYqWDL3bOjcemU2mL2DwA7oeDAoCV5PFs1133eR4mOCMjfJRdT9vvBubORlmItOKIFPiek4dRhA2Sro8yUVOtwiuxb547WkBCQv8xMcPb9wCh73wOOgkResF1DPRUUFsE6uWG6hVADd2a4yd0RmiOFzBzGCnA6ImrPbbaCLo2F39G0PJLaNFQDjsqgtVc9dbPzmyNk7+sK/EXbkmMnUiLOpJ0LpzdjrjVlKsOLFma2FUGgGaG1rDPE9h3ncVZiKNqejWM8jcxYznbhhiOQkVKRmb54eNKmTmovHR9vGE1B6qsH5wk3aGYXp9VJQTPyeaYQqCu1obNQcSA7WfBKj2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0F4oyVHuGXrIGbDQU29D8XIBOfRplyGrR3Oariy3Duc=;
 b=L5gFesAsyRO2xajXNzNlL6Sn/JZI55BPgeft7Q5+9WAyvX6M09xWL4FksKLo+002VBIZ56u1Bbo9XsuPSjFWJkyN8nKFE6iztGid/dhslpgqnANjTKoiJ+JAaV2kn/E+V5eiNik/21JsRcFNhXjpdcnnc7MkbMHnXjeDG5ZqcNQ6lGe5w4nJzTGMIn3t1JGwNpxkzs6f1jJGQix7kCDBR/Q7+Exgrv5t3ZVpx99NjoN9IJdAY+ASCmRKRi3nkw+iNFokpgpAKvrH7vGkxCaCWhPAfS2Aqxokn76ahFfonctqve/bRb92dVlxvOkHttehs3tyq5qWKIThR6WsNO3A0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0F4oyVHuGXrIGbDQU29D8XIBOfRplyGrR3Oariy3Duc=;
 b=LaeTHatBQucfFBQTOQNaAh7OSxePcK/IGLw1cDLFZdOLI5f8F8hmDI6pFsSG6TokIS/BWdWrC2cOPyN87PXf45NauJWe04uViksA4JV8WNB4NI5lYsaQ8H40meXYBRQY415C9AX2YRa35QldkAySOwDrCbsMqgHLIgPeA3tIGLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Jul 2023 18:01:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 05/13] vpci/header: implement guest BAR register
 handlers
Message-ID: <ZLladg9j9PCJE8oC@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-6-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230720003205.1828537-6-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 290d38eb-9bf7-4656-29de-08db893aa85b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GEKQz7Vm97kobm4/3ZzaBC5G8vec38pp+prOfkE2U/nY1yQsevQj5Sa6ByMmXDbSiCuKmZTYCtRR6F6V7UAGDewfo/BzjZH7rGYY9wu7qAAJ3foU0gdrOasttrQjDMqbSbjv7/OSLiGhLUgd+38TcHh3EpdBaDDscq7pMgx89UrJIO7NiCwYDmG7ctKqs8fcDppH8TIqkamsoFDXLUseyqflcFsSGdn8D4Zx+jwSxROWwyIKGmeZ4ySvMTm3hwiSP44i6I+lWlI4K9QtKGK3zjYM3KTCc8mQW1HA1az13IMV1wlKT8dpK+Z9wkwBGd86Y/O0drpg18xHpqozDKhny7V/IPz8myrcyZ7VqxF+8YUgvCfQkQ0qmEG6cpITerNPPQgDyk3kZKXTTgO9JAqf+R+CkRw3qgboEfH524jz2wTB3ADXWpAwzNJryoMoMbm6mqcaZRuaEh4iRwVtfRmXmCQ2CIX9BM6vXvi1STj2ClOQI9HUn1eqfreE/iSDPGDv/BvozMGXQPMKPqCSboiyJdzccHKm0C+iwSZ4cO3SQ7OUeWIaJafVn+JaILYlPP2z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(2906002)(478600001)(6666004)(66476007)(6486002)(8676002)(85182001)(66556008)(54906003)(41300700001)(66946007)(6916009)(4326008)(8936002)(316002)(83380400001)(82960400001)(6512007)(9686003)(86362001)(186003)(5660300002)(26005)(38100700002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVhXMkxROUdhR0Z2eUhONTR3N0J3L1J3Z1JEcExXRWhPb1dPVEVaZnA5SkhE?=
 =?utf-8?B?QnU3ZGdqNCtOVTBsWTEySHk0RU9YSFRPUkFUdE5TbTdUSCtzaTZ5ZVZWZ29o?=
 =?utf-8?B?cytlVkE3ell3ZkVObEVYSitzUXFBYWZzODhRK1RuNDBtL1NYVDYzVjlXeEFj?=
 =?utf-8?B?SktHUFZ4ZTRuZkFxVEJ4MFpTQW9DM25ycjVuTkUzcjlWSUhmUmZZOXZuV3VN?=
 =?utf-8?B?VWxHMlBvSUduaVZrNmtLTXFCR0JmV2VlbjFrTW1CSUd1RjRTUDNLMjQvNTR1?=
 =?utf-8?B?em1vak0veTVzUnphZVAxTXc0NjlBa1NEWnYxWjBlL3dhTFJiZ0FsWHBDaDVK?=
 =?utf-8?B?L2ZZMzF2Y2ZmOHBoN2RnQjNtZjY4c3V6ZkUzZWt4ZEt0QkNRM0M0T2RlUisv?=
 =?utf-8?B?eGdrYXZvZUFSRXJyamoyeTVTeG53cnJ2b2RnVUN2QlRBdlhNNFMzQ3VmekRp?=
 =?utf-8?B?eFBDajVuVFBrRkYwa3Z3QUtNSkZuNGpNbWZCU2NlT21vUlVXT2lKNksvNU1W?=
 =?utf-8?B?UE1mOGw1UjBGb3c2akt5SkVXekNLeUw4SHpDOTFobWlKS3d5M3pIOWEwTjNy?=
 =?utf-8?B?QmVYMjB0RjB6MjIyN2J1b2tON1R2ZVJzRGs4TkJDdnQzTFliazMrNFp2OHF2?=
 =?utf-8?B?WHlLWEhmcDlya2FhOG5SVUNKR0xPZldwekR6ak5PRFNhbUswTHU2bXFLdTNh?=
 =?utf-8?B?UkNIam91UElxZU5YdlhDN0FmSm5IYVl5Y1VpTUNUZ1NOUGgvSXZFZVFmVXBi?=
 =?utf-8?B?SzRmcHMvNTdJSmlVYS94b09ZM09tUEE2YTFNMmNsdWl0bzdxWEVxUzVKRGQr?=
 =?utf-8?B?N2YwOVBxbjBDSU9yMktJbHRGQnVwejdMa09MRkFvV1FHWTJtNFcyK0dHTHdM?=
 =?utf-8?B?TjMwTDkzNGIzNjZ0ZnJiMm05bE1HMnBWd2lKYUFCRW5hKzJ4WEx6QWV5TUVQ?=
 =?utf-8?B?aGtoRlBidDZvaFlJMmRUWGxneUVTaTYzblFnamdEajM1NEhOZis3UFVYQ203?=
 =?utf-8?B?NzJ5QzJzc2RRYUlSc3VNVXZLeVMvalBocEZENlFaR2JtQitWWWk2M0FubG51?=
 =?utf-8?B?akFvUTd6eGRFeDMxbk1FZUxMSGRReXh0dTN2NjFKWWVlOWt6bEVIVUUyeFhq?=
 =?utf-8?B?Wi9zZzU0OEw3dGR4WFIvTXU4YTNtb2xkMlhCR2EwcE84WUZlM1djSkpydDN1?=
 =?utf-8?B?UzN1cVowMDY4R293bGwyenArNm1IK2s0aks5eFhYeUR0SElNTlBid1R2dnRQ?=
 =?utf-8?B?UHFyM3AvN2w4S29CcVpUUDNNQUliWWVuS1g0cWNTMFBCcEhFbHV6UGZ2VXdS?=
 =?utf-8?B?NnNPQ1Y0VEQydUJFVTJxNEQzcDJEMWNISVR3bVdQelBRSmpsY2x4WlFjMTh2?=
 =?utf-8?B?TU92RTNCMVpuRnhkdm5QN3ovckJsNVNDZ0V1VmZpOG5UdjBOcTA3aDM5RDR5?=
 =?utf-8?B?UzU2bEhpQURTZ0xoekdleno1SDd2YWpGNUNadGcweHJPNEI5NUFwSmVhVC9n?=
 =?utf-8?B?bWZzYXFrcWZoRnBRenpFc25EWXBJb05zNjdjdTV3L1A1NVNsNlhtbXpaS2Nw?=
 =?utf-8?B?ditVOU1TTVR4SlQ1UG9mcEFZWmUvTjNaNVI5M3lreUo1SDhrYk1rTFFTWFNn?=
 =?utf-8?B?Vi9XZ2lyZ1hOOWpDR001aHQ2dEVlWm9zcnBhMWJyb2JCU3V4KzhsQ3dzQ0x5?=
 =?utf-8?B?dnVYdEdLbGpjSWw4K2pzUGNwSVRHcFlKYzVkdHFDN1VPQ3FPUDMwU01YM2l5?=
 =?utf-8?B?RlpOdjc3SkhQb21CcDFZbmlOci9pUWs3RnM0ZnFzL3ZVK1o4MDVxaGs2SDlx?=
 =?utf-8?B?aHBrdHQzV0FUTEF2eUkrU3hCYWlYUSs2N212UG55TU5vN0ZHdURqNUpWOGo5?=
 =?utf-8?B?OE15LzNMbU45Vno1YXYxVUVPZS9tUEFtY1loaW8vNlhsWmxkUnNqVmFZMVIx?=
 =?utf-8?B?OVExMlI3WkZqanV1cm9hT3pKSDBMcXI5aUluYkRDSGJRR2dycEE5MzRNSE01?=
 =?utf-8?B?UzdESHBlcUdyS0ExdmgwUzJJSkpmdm5wbFVPK3VYY0dnV0RJQml3d2R5M3Uw?=
 =?utf-8?B?QnlNWkdtNWQ1M0NlMUZ5VWVRWDRBRmNyYURuRXEvMXJBbExxNGFldVlTWmgx?=
 =?utf-8?B?ZEVYQng1MnpNN1BoM2UrOWVYZFB3bXhydHExOXpEUzR3ZjE5T0lVeFI1VDYy?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X5mXr+47da6+m0NyV5qredk6i+fQqMbpb6CCAt7cE89cCmW+iw7F0VLJFauqutQ9XDGHNnooo4KB5ocpPu0K/m8OwDeAb+OuVOk7ttTMMCRWKgSwKqmvus8M5pArGhL4/xlvSbzXbr7kCniVUPBfe3oHTEFCsMmv0yMRV/dxIf8zq4fuFxPmz4sTkPTJR72Sk57+gTNHO/BlaoYdiS1tp79RKRHgCMHtHGHHrZ4YVn0NFG3VxLZdOi02me6eiQzrAFKjxaVAfN6kEGGBbYag+nTAATq9wBRK8SssLRk0nLePHWrUNfpwe1ZJECnjK6ogMvOTiVLYTYx4kfs6ie9SvaP6a6LMzYyUNVo9LPufjV5n6B/f9CpeDH3oW1ul1MWKYP3d9HpJQhcNXCC/vYa2MpS1VzAInmSST5X1TdUOsqyL3QWjEu3MYnpW415AEvS4zgrsSXLQvhfr3vjLgeA5RF8rZN42xdi2iNL0xrXe1I/ci+FRxx3IGHIncO2Nv/ZwnVeIlwgJkXGvFIdkxZhvgFpp87nn18WcYLFaY218GopT5SemMbTlrOMpXByjtZBmyMD98f2dtYovMTAdZooKUMSd20sRWzwMnFSCv5egXJ/EXrO4NtXlxeuZ+buBov0tX5VjKICeJFa+hn6fj3UrlOiaFEcTkTeVK8poZQo5IPXQj3rwjapWbXOEqzOlb933C2Ac8AUe7c+sn071U3sCCnxs2auPZ+4S1vvElCWV+6JE19gvt2V6WadQdbG+qpX8Lu2JsaFYc9OYA3J7rdtnwXetdL37c1/UuSrIhs9aMyg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 290d38eb-9bf7-4656-29de-08db893aa85b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 16:02:03.2514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfGgrLfbVxZ6i3EQMOs4v38FUXmk7xuUj0DuWh7beR+cw4yrGMmRxXTOBkrizYUmUcMkU7GDr5uvZuXmbCjFuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6459

On Thu, Jul 20, 2023 at 12:32:32AM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add relevant vpci register handlers when assigning PCI device to a domain
> and remove those when de-assigning. This allows having different
> handlers for different domains, e.g. hwdom and other guests.
> 
> Emulate guest BAR register values: this allows creating a guest view
> of the registers and emulates size and properties probe as it is done
> during PCI device enumeration by the guest.
> 
> All empty, IO and ROM BARs for guests are emulated by returning 0 on
> reads and ignoring writes: this BARs are special with this respect as
> their lower bits have special meaning, so returning default ~0 on read
> may confuse guest OS.
> 
> Memory decoding is initially disabled when used by guests in order to
> prevent the BAR being placed on top of a RAM region.

I'm kind of lost on this last sentence, as I don't see the patch
explicitly disabling PCI_COMMAND_MEMORY form the command register.  Is
that more of an expectation on the initial device state?

Maybe there should be some checking in that case then?

> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> 
> Since v6:
> - unify the writing of the PCI_COMMAND register on the
>   error path into a label
> - do not introduce bar_ignore_access helper and open code
> - s/guest_bar_ignore_read/empty_bar_read
> - update error message in guest_bar_write
> - only setup empty_bar_read for IO if !x86
> Since v5:
> - make sure that the guest set address has the same page offset
>   as the physical address on the host
> - remove guest_rom_{read|write} as those just implement the default
>   behaviour of the registers not being handled
> - adjusted comment for struct vpci.addr field
> - add guest handlers for BARs which are not handled and will otherwise
>   return ~0 on read and ignore writes. The BARs are special with this
>   respect as their lower bits have special meaning, so returning ~0
>   doesn't seem to be right
> Since v4:
> - updated commit message
> - s/guest_addr/guest_reg
> Since v3:
> - squashed two patches: dynamic add/remove handlers and guest BAR
>   handler implementation
> - fix guest BAR read of the high part of a 64bit BAR (Roger)
> - add error handling to vpci_assign_device
> - s/dom%pd/%pd
> - blank line before return
> Since v2:
> - remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
>   has been eliminated from being built on x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - simplify some code3. simplify
>  - use gdprintk + error code instead of gprintk
>  - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
>    so these do not get compiled for x86
>  - removed unneeded is_system_domain check
>  - re-work guest read/write to be much simpler and do more work on write
>    than read which is expected to be called more frequently
>  - removed one too obvious comment
> ---
>  xen/drivers/vpci/header.c | 156 +++++++++++++++++++++++++++++++-------
>  xen/include/xen/vpci.h    |   3 +
>  2 files changed, 130 insertions(+), 29 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 2780fcae72..5dc9b5338b 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -457,6 +457,71 @@ static void cf_check bar_write(
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
>  
> +static void cf_check guest_bar_write(const struct pci_dev *pdev,
> +                                     unsigned int reg, uint32_t val, void *data)
> +{
> +    struct vpci_bar *bar = data;
> +    bool hi = false;
> +    uint64_t guest_reg = bar->guest_reg;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +    else
> +    {
> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
> +        val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
> +                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
> +        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> +    }
> +
> +    guest_reg &= ~(0xffffffffull << (hi ? 32 : 0));
> +    guest_reg |= (uint64_t)val << (hi ? 32 : 0);
> +
> +    guest_reg &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
> +
> +    /*
> +     * Make sure that the guest set address has the same page offset
> +     * as the physical address on the host or otherwise things won't work as
> +     * expected.
> +     */
> +    if ( (guest_reg & (~PAGE_MASK & PCI_BASE_ADDRESS_MEM_MASK)) !=
> +         (bar->addr & ~PAGE_MASK) )
> +    {
> +        gprintk(XENLOG_WARNING,
> +                "%pp: ignored BAR %zu write attempting to change page offset\n",
> +                &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +        return;
> +    }
> +
> +    bar->guest_reg = guest_reg;
> +}
> +
> +static uint32_t cf_check guest_bar_read(const struct pci_dev *pdev,
> +                                        unsigned int reg, void *data)
> +{
> +    const struct vpci_bar *bar = data;
> +    bool hi = false;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +
> +    return bar->guest_reg >> (hi ? 32 : 0);
> +}
> +
> +static uint32_t cf_check empty_bar_read(const struct pci_dev *pdev,
> +                                        unsigned int reg, void *data)
> +{
> +    return 0;
> +}
> +
>  static void cf_check rom_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> @@ -517,6 +582,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      struct vpci_header *header = &pdev->vpci->header;
>      struct vpci_bar *bars = header->bars;
>      int rc;
> +    bool is_hwdom = is_hardware_domain(pdev->domain);
>  
>      ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>  
> @@ -558,13 +624,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
>          {
>              bars[i].type = VPCI_BAR_MEM64_HI;
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> -                                   4, &bars[i]);
> +            rc = vpci_add_register(pdev->vpci,
> +                                   is_hwdom ? vpci_hw_read32 : guest_bar_read,
> +                                   is_hwdom ? bar_write : guest_bar_write,
> +                                   reg, 4, &bars[i]);
>              if ( rc )
> -            {
> -                pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> -                return rc;
> -            }
> +                goto fail;
>  
>              continue;
>          }
> @@ -573,6 +638,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
>          {
>              bars[i].type = VPCI_BAR_IO;
> +
> +#ifndef CONFIG_X86
> +            if ( !is_hwdom )
> +            {
> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
> +                                       reg, 4, &bars[i]);

For an empty BAR there's no need to pass &bars[i] around? (same for
all callers that setup empty_bar_read() handlers.

> +                if ( rc )
> +                    goto fail;
> +            }
> +#endif

This might be better done as an IS_ENABLED() check in the introduced
if condition.  Need a bit of a description as to why IO space BARs are
handled as empty BARs for domUs.

> +
>              continue;
>          }
>          if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
> @@ -584,14 +660,20 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
>                                (i == num_bars - 1) ? PCI_BAR_LAST : 0);
>          if ( rc < 0 )
> -        {
> -            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> -            return rc;
> -        }
> +            goto fail;
>  
>          if ( size == 0 )
>          {
>              bars[i].type = VPCI_BAR_EMPTY;
> +
> +            if ( !is_hwdom )
> +            {
> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
> +                                       reg, 4, &bars[i]);
> +                if ( rc )
> +                    goto fail;
> +            }
> +
>              continue;
>          }
>  
> @@ -599,34 +681,50 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          bars[i].size = size;
>          bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
> -                               &bars[i]);
> +        rc = vpci_add_register(pdev->vpci,
> +                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
> +                               is_hwdom ? bar_write : guest_bar_write,
> +                               reg, 4, &bars[i]);
>          if ( rc )
> -        {
> -            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> -            return rc;
> -        }
> +            goto fail;
>      }
>  
> -    /* Check expansion ROM. */
> -    rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
> -    if ( rc > 0 && size )
> +    /* Check expansion ROM: we do not handle ROM for guests. */

Is there any specific reason for not handling ROM BAR for guests?

> +    if ( is_hwdom )
>      {
> -        struct vpci_bar *rom = &header->bars[num_bars];
> +        rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
> +        if ( rc > 0 && size )
> +        {
> +            struct vpci_bar *rom = &header->bars[num_bars];
>  
> -        rom->type = VPCI_BAR_ROM;
> -        rom->size = size;
> -        rom->addr = addr;
> -        header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
> -                              PCI_ROM_ADDRESS_ENABLE;
> +            rom->type = VPCI_BAR_ROM;
> +            rom->size = size;
> +            rom->addr = addr;
> +            header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
> +                                  PCI_ROM_ADDRESS_ENABLE;
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, rom_reg,
> -                               4, rom);
> -        if ( rc )
> -            rom->type = VPCI_BAR_EMPTY;
> +            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write,
> +                                   rom_reg, 4, rom);
> +            if ( rc )
> +                rom->type = VPCI_BAR_EMPTY;
> +        }
> +    }
> +    else
> +    {
> +        if ( !is_hwdom )

Extra !is_hwdown?  The condition on the outer if is already is_hwdom,
and this is the else branch.

> +        {
> +            rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
> +                                   rom_reg, 4, &header->bars[num_bars]);
> +            if ( rc )
> +                goto fail;
> +        }
>      }
>  
>      return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
> +
> + fail:
> +    pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> +    return rc;

It might have been better for the usage of the fail label to be
introduced in a pre-patch, as there would then be less changes here
(and the pre-patch would be a non-functional change).

Thanks, Roger.

