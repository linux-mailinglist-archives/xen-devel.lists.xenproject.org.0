Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053D435F1DD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 13:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110486.210896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdKq-0004U8-6S; Wed, 14 Apr 2021 11:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110486.210896; Wed, 14 Apr 2021 11:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdKq-0004Ti-1s; Wed, 14 Apr 2021 11:05:28 +0000
Received: by outflank-mailman (input) for mailman id 110486;
 Wed, 14 Apr 2021 11:05:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5rk=JL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWdKo-0004Td-AX
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 11:05:26 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7c4506d-fb7b-451c-b9bb-bf101925c334;
 Wed, 14 Apr 2021 11:05:24 +0000 (UTC)
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
X-Inumbo-ID: d7c4506d-fb7b-451c-b9bb-bf101925c334
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618398324;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=r+Q+0wDEnDNI0qnDTnoulZ96ltKytfy6fcxFT1Gbbpk=;
  b=gzj8GONK61XLak5YiaEzEm5YmG/o+5jnjDtlooO1wBFW87M1otqC62pV
   NlHpG0hF6MdiQvGahXDENO4H2/Dp6vhUHhf+/XlhVrEHdrIg51ZHgXT70
   irGEo1i1xrywdGUTdJuBNzBf/OtNJIBSvCi+5rFAlCkNc199Jts6cZjtD
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FFhkR2oi8R2V9OOq5ylRA+4Orio33cPykvx17HR30CDLbu99IQkO61RnLlRELyCnnW0Q4gEQzl
 0Z/25UwfcGj1ae4As2K9ohh0qP9eRs4g8od5++LuonR281RpsnXaI0Hxqbhnt5YPsbl0cqi7uQ
 zSdpdMbj9OqNmEs1d7HRj6X0zH/KMRQjOKVMTlrspWKEHmoo1vs164I93QL488FRb2xJ8oxEe8
 nKydVZ1dqGh1kk8FjbBHg+lB6x5VEsXr7S7DkGZ+0SEuyUpFmNUbvo6CAi4/duo/jx4yAnPHzY
 u2Q=
X-SBRS: 5.2
X-MesageID: 41553637
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:NbEB5aACRq3dtlXlHeiHtceALOonbusQ8zAX/mh6QxBNb4i8n8
 ehgPwU2XbP+U0scVsnns2NP7TFZHva+4J874V5B8bZYCDNvmy0IIZ+qbbz2jGIIVykysdx94
 dFN5J/Btr5EERgga/BijWQPt48zLC8gceVrMjEyXMFd2FXQoFmqzx0EwOKVnBxLTM2faYRML
 q5yo55qyG7eXIRB/7LXEUte+TYvdXEmNbHTHc9dngawTKDhz+p97L2eiLwtnxyP1wgoIsKym
 TLnxf04a+uqZiAu2bh/lXO5JdbksaJ8KogOOWwi9MYIjipqgGkaJUJYczngBkJofqi4Ftvrd
 /Uox1IBbUX11rteAiO0HjQ8jil9Axrynf5jXeEnHPooKXCNU8HIvsEobgcTzz0xA4Luspm3K
 dCwmSD3qAncS/orWDF/N7PWAhtlk2o5VQfscN7tQ0CbaIuLIZLq4oR5UVUF4pFOhnbxsQILM
 lCZfusucp+QBeidHbesXBowNuwGk4rFhPDb0QessyRyVFt7S5E5npd/dcYmHgY8pI7Vt165/
 /ZKOBWmKpVTskQBJgNW9spSdC8TmTQXBPBN3+TK1z7FKcBf2nAsYLz/a9d3pDkRLUB15F3nJ
 jaSltXuSope0zoAdCTx5EjyGGAfEy0Rj6o0M1X4vFCy/DBbbL2LCyOT00vmcO8o/MZRtbWQe
 q3JYg+OY6dEULiG4ZMmxf/VZ5bNGUEXKQuy5gGckPLqJnTMYvhuvbAfPvUP7SFK0d9ZkrvRn
 QERzT9P8NG8wSiXWL5mgHYXzf3dlX45o8YKtmTw8EDjIwMPJZLqA4blBCw4dyKMyRLtsUNDT
 1DCaKilqOwvm+t+2nUq21vJxpGF05QpLHtSWlDqwNPM0T6d984ypyiUHEX2HuMPRlkSczKVA
 ZZulRs4Kqya4WK2jpKMaPUDkuKy38I4H6aRZYVnaOOoc/jZ5MjF54jHKh8Dx/CGRB5kRtjwV
 0zIzMsVwvaDHfjmK+lhJsbCKXUbN9nmhqmJsZStDbWqVicrdtHfApbYxe+FcqMxQo+TTtdgV
 N8t6UFhqCbhDqpIWwjxOwlLVxXbniNCr4uNnXEWKxE3rTwPA1gR2aDgjKXzxspfHDx6kkUjm
 v9aSKOf/XGBUdcp2BY3q7m/EgcTBTZQ2tgLnRh9YFtH2XPvXh+leWRYLCozmeXYlwehuERWQ
 u1JQc6M0dr3ZS6xRSVkDGNGTEt3ZM1JPHQC7wlbvXW0nOpI4uYiLEeE5ZvjdFYHcGrtvVOXf
 OUegeTIj+9AfguwRaJqnEsPzQxr3U4j/Xy2lng4HKj1HAyRfreSW4WBI0zMpWZ9SzpVvyI2J
 J2gZY+pu2rKHj8bdaA1OXQdD5MKhTapGasVOE2oZVIvaY/3YEDXaXzQH/NzjVKzR8+JMD7mA
 cVW6Jg+q3MPYdpYogPYS5D50Eok96ONUMvtQTzDoYFDBcQpm6eO8nM76vDqLIpDEHEvgf2NF
 WF+yBW/vvOXUK4pMknIrN1JX4TZFk36Xxk8u/HapbZDx+ycfpfuFCgNGWmbbNbQK+ZGLkZox
 pg+cuUl+uPeyeQ4nGIgRJrZqZVt2q3S8K7BwyBXfNS+9uhIFKWn++k5tWwgDqfc0rwV20IwY
 leMUoeYcRIhmN80Mk50i2uRrf2pUxgmV1E+j1jnkPs3I/j4GqzJzA3DSTJxpFNGT9UOTyUiM
 6A9+6S3nH0+iJE1pnOD104RKA7J/EACozsaz5zIs0RtqOy96Uhgi5fcA4jZlRM+QzVzqdjx/
 Olw/3cVO3pFGfwNV8A8TBDAJRoniZDkxAyT+GuqZS7ex4aEuoBBOc2449RiyxgsVWb1SxoUz
 x98goy1o/MKVT7P3NzUaj29LGG/iQlmA==
X-IronPort-AV: E=Sophos;i="5.82,221,1613451600"; 
   d="scan'208";a="41553637"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bA8/1CrR8dynGl9vSw66kd3KjJkAHHLY7hIAfmU/Z8Col6SVN8gnzpOMDQA7XsiVeAeGWGVrNMYvoBJmOzFZLZdA+9DKklY0x8w2N8StytJfMkuVRWs4rV0B6KBwfp82yYp5sj19yYVYU33zl2xWP0/uq6+aRLmivFm8s8AroSBXUiqanF5vcbk13tJBkUgpGDLTympFMbk2zlGDGxCV8uAxZwxnhfLj1iVgUSbGnjoT4GfmDkE1TG+K/wWStVioHILEAI7BqjwiJOTPFPiyMzpDTq7eep282QcL20p75alSWjBY3MNJ7UknjBoUTo4iRYLKjkKx0cpyjAufhEVKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k+31nGFb+iXFVwUoejcH5kDAQ19bAnaFThuqFgmAQQ=;
 b=AxD2rV9oOg3TZyP0naOuGGZEOy541/y60bHCKUcEWWmi5A+kbClCuNQGqXYv58DtGhIW8PdiatTKynLSWssa9TD5COnZEoj7jCbJRYSIzuwnQzw+79qgOxjY3JHqWNnBaBy6KtJN0NyzpLs7nS+5QeCgh5G/lokLBR24Sk2Ujymt+86G10TN/8U/Zul+lFlREoNKbiTZR6F/Bv+HgpWP1yFtC6XrRfoZ5rYqyJqJhBlqb0t2d0HYNuYdyGheIjbBWPoUGFM6ZBYzEwX7EYNlg+lj1H1ta526YQHaUCSTr7N2yXRyORJjxalZiK0UsMmbzaZEbJ6m1PTaq6WFL/iMJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k+31nGFb+iXFVwUoejcH5kDAQ19bAnaFThuqFgmAQQ=;
 b=UwHsyzTCoRULjTH2Mmnrcoy4Yq9QheW3V+WoZGVuuiJWe33F4SKj1QM073FDg93cw7Lexxh0B3PAter3hRrKZKLequHc+/BluL60/N9go9AkvfOYbPIbbIFmnnjjD3LGl2EL/OLUZXdU+DDK0pHPDT30p578bH/qI/wpL568o60=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH 0/2] x86/amd: LFENCE always serializing CPUID bit
Date: Wed, 14 Apr 2021 13:04:31 +0200
Message-ID: <20210414110433.83084-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0083.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e3f3435-90cf-4089-8ca9-08d8ff3531d2
X-MS-TrafficTypeDiagnostic: DM5PR03MB2842:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2842D6FA7E1ADB2196BE566D8F4E9@DM5PR03MB2842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jA5QhmVDV3KLEjBOTwMN93Mzte2smJ/gbCy3dg5Fx4zjSPHc7RYr07y2ibGOELAMyDeMnHWD12Tmpg3yTbKS5DEl6vkWnqFFll/WQ/1wO5Omg/nmRcz6tYRQ9DZX9ya7Vpcj2080cSNXFcrZmgPFmZ/9UztMYkO17qbcPeEvnuGF+2NwjboVSeDZHTvi1z3Pzo5Cl4naLrhY1OAl0T/wcLvj9u4+U2ItBNh3URe3HM0YPIQPf+K6h6xJtmI/GXS5URYskmYDgvs63MJB48CxzWFStGcqvUORKW2ePMkbbCENBJkjGy7DhJU7oXWIidWd1Z/jH2Lll2W2jORy+GteFaxsSTuaJegG2UZvhjQnRRFXKdfvrWBZAWSMQt03YNbKR3LhQpsjv7KCKbxoBNR8elsZR5DxNGE8+DdR30FdxTEKF+vc7nwTYJLUGU/ESnE5SCkHj78aqKLsxu4IYmy76/wWMqbsG7P0Wt8BiyI1FdYmKRX4K8/7ej6HOtdpmamMzeOfR0O37YKfsh72jnVLHEpBRUfyP5y+y17jg72tb1w/u1bO30F4IocUclP8L+xRKQHd/m2Kn3ZPKq8wc2TaFg1tYFZ32KSE+WiMFrcmHl4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(83380400001)(2616005)(6916009)(316002)(6486002)(54906003)(8936002)(4326008)(38100700002)(8676002)(478600001)(6496006)(186003)(6666004)(16526019)(26005)(36756003)(4744005)(5660300002)(1076003)(2906002)(66946007)(66556008)(66476007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S0RqYlZLbzBwbVlZM2hjVGxJUmpoT0k0QWQxUitPQ21KN2o2REpLRVV5THUy?=
 =?utf-8?B?WFdtUnA3U1F0U1dnbXBwV09jZTVGMy9nUk1iNDg2M0ZrelpGZkt3NXRLNm9U?=
 =?utf-8?B?WnVFcHBScXg4dk91Zm1PQjNQaUVkSnlldjcva0x3a3FxVVlReXpHdmdDWjhy?=
 =?utf-8?B?bCtuUW9KWXhnZUJVY2lMMUF0aSsya29EM25YZFdmOVMzdDRVd0VnUElSSnJ1?=
 =?utf-8?B?dEh5RHVKRnd1eEgxQU9YWGdab0hXcnd2a3l5Nk9Ra3BQNEo2eW1XNHg2WmEx?=
 =?utf-8?B?UVJEUWxiYklDMVFFekovWjJRUldGUzRobnFQUENsR0tmSlZ4c0NKVHAvSmdj?=
 =?utf-8?B?Rmk4ZE44dVlUSk5SRUVCcnNlWmZRVG1ZbHkvM2pKcFArNU04Nnl4bkhQWWlq?=
 =?utf-8?B?WEZWK1JTREFneE5xYUhEdkV4Q0UvWnZKODNPVmhOeFZ3S09sQUJEUGFwT0VP?=
 =?utf-8?B?MFdiM0h3aTlVdTVGVTZLMCtpVHUxdmZqSHNnb1dGNDErMC9NZVRERjBqNkRj?=
 =?utf-8?B?Q3JGcDVUaHQycFRiOEg5bVA3NE11dmhMUWpiMGFSQ2xkZDFGaWw5S2RLeXdV?=
 =?utf-8?B?QjBYeWplcGNvakFPUFNXZ2dTaHpXUk1FSzR1SFcyYUoyT2V6M04vSkhtamdN?=
 =?utf-8?B?dVFkT04xaVovdTBMcGQ0Qmc3V01XZkdRS3JhZk9CVEtyZ3RIMFRwaWY1aWZa?=
 =?utf-8?B?dzFrRVpLS2R0SXNWb2RBcS9KaDNhVmpvT1Zvdmc4MmdBbnZsWUZyakZNczhr?=
 =?utf-8?B?K2Fyak5EZ0dQVFVieE1ObXZ0Q1BkUVpHSzQvQjNZVEVXVUs3MCt1UEN5YWV0?=
 =?utf-8?B?RmlvR1ZsTU1FV01TRE9DbFY4TUtvcHZ5Nk5IMDh5clh2dmw0RUZLVVk1dGti?=
 =?utf-8?B?NWZyLy9WWkh5b2R4Q3FpeFBLdDhXUmZQdUd3NEtxVEcyWVBCMGNZd1BWWWt4?=
 =?utf-8?B?M1FFTXBjazJjbEpiRk1rREtPUmlmdVpjNkJYeUJvTk9FbkVmeGtIZkFmcHBK?=
 =?utf-8?B?WnNIWDFlY2FteFNNaTZwRmxXSkJwcWVIcEhhdTV3U0dMS3BTc3crTSthajdn?=
 =?utf-8?B?VW9sVXR1emN0OWJONno2ZXJUVGFtSmZIaXI0S0tRbklURzFDblNObWMyQU15?=
 =?utf-8?B?QUpPbUxlNW1CZDJuY3g5NHFuM0k4enpMdjBnYitMN0lFSFJFeXZyV3ZtYk9T?=
 =?utf-8?B?MnJFaFYvb2dhYTFOelhkTmMwTTFRS1ZOKzUyM2RtRkpYdnRwbmpBdmsxQjd0?=
 =?utf-8?B?RmtMelJiNmlPa09HT0lDY21VOGE0ZmJVL1NxUGluRTBNMXdpcGRGazNDaytp?=
 =?utf-8?B?ckZZZ2FsenZGcVZEVDFMUERwSlhhdFZ5aEVFMldkZVhyNmU3eUQ4MGdaaUtv?=
 =?utf-8?B?MjdDcThFbFgzeDNrMy9VT2l0UnVGS21LZjJ5WGtFeDJvaWdQMldOQnBTa20w?=
 =?utf-8?B?RkpHU21yOURhVWRRa3ViNWdCZ1BSbHNFQkhBTElBL0NndGkvSk9lN29rZGgr?=
 =?utf-8?B?ZEJ5MCt4ektKNzdvL1M5K0IwdVZPTEhHRXM2L0lrZDJmR2Zrem84VGxKcnpI?=
 =?utf-8?B?T2RobGE1WW1LR3F0VUFLaHJ0YStUQTJqK1NGc2dJeW5nMkVVN1hnWTRSblpn?=
 =?utf-8?B?ZnJrQ3REVkJ6b0h2dk5wSk5WVktoV0RCQ2NPUEFmUDdqZStsaXRsREdEMGY2?=
 =?utf-8?B?Z216RzJwdzNEMWpnU3dCNTlEQnhQVzlURktUWXdiYitZWXNtNHJ3ZEZWRzZJ?=
 =?utf-8?B?SG9IL2ZjR0NtMkJISnJUclZYd3UxRFVCRHRza2QzUHdUZnMxZjBxeEJma1Js?=
 =?utf-8?B?UEt6bWwybEkrRXBOSW1wUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3f3435-90cf-4089-8ca9-08d8ff3531d2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 11:05:20.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tF56oEAjdXEinKmPzMDvjzOym+1UcTtxjjynyXwzdcGjoo1k4o+CWkVqSJdzUM4OOkCAyysYl6bQ4M/m9BF4wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2842
X-OriginatorOrg: citrix.com

Hello,

The following patches aim to add support for the LFENCE always
serializing CPUID bit found in leaf 80000021.eax. In order to do that
the featureset needs to be expanded to support leaf 80000021.eax.

Thanks, Roger.

Roger Pau Monne (2):
  x86/amd: split LFENCE dispatch serializing setup logic into helper
  x86/cpuid: support LFENCE always serializing CPUID bit

 tools/misc/xen-cpuid.c                      |  6 ++
 xen/arch/x86/cpu/amd.c                      | 69 ++++++++++++---------
 xen/arch/x86/cpu/common.c                   |  3 +
 xen/arch/x86/cpu/cpu.h                      |  1 +
 xen/arch/x86/cpu/hygon.c                    | 27 +-------
 xen/include/asm-x86/cpufeatures.h           |  2 +-
 xen/include/public/arch-x86/cpufeatureset.h |  3 +
 xen/include/xen/lib/x86/cpuid.h             | 37 ++++++++++-
 8 files changed, 92 insertions(+), 56 deletions(-)

-- 
2.30.1


