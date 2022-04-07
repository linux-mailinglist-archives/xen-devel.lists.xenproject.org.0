Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373A64F7AEE
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:02:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300551.512722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncO1m-0003Xu-KA; Thu, 07 Apr 2022 09:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300551.512722; Thu, 07 Apr 2022 09:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncO1m-0003V8-GH; Thu, 07 Apr 2022 09:02:06 +0000
Received: by outflank-mailman (input) for mailman id 300551;
 Thu, 07 Apr 2022 09:02:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv4n=UR=citrix.com=prvs=089d11f18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncO1l-0003V0-IZ
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:02:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62ba1dc8-b651-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 11:02:03 +0200 (CEST)
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
X-Inumbo-ID: 62ba1dc8-b651-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649322123;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TORuY2rvbBLGP/MaauekUkUm5+f7SaWS4p6bds02T3E=;
  b=NIUzDaSNKYz6tix0ceLj/tPPJetNLOGWr9o3UeRd0ePflGQjFXV61x6N
   sBdW4i6SCka1DnfSflsuxEl84C+/2tSIsRI8QbixV7pFtJGxGWfj0XJ5H
   n9kyiMpnpLPrK8uO1TtoCsAzqlURkQxTPUhRTKujJZLK2/1oallgNUTzB
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68239714
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rCYrY6nEu00VVXU1bQZEq6vo5gxzJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaDT2GPvfbYGOhKo11Odmz8klQv5HcnNQ1HVNlpS8wQSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW1zV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYURgKDJbHuf0hED4EMXFcB/F31p3lPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6aEP
 JtGMGYHgBLoU0R/OXo2DaMHvuq4jFDuTBxFqgqbjP9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqum+vOkCXTSI8UUrqi+ZZCvlqXwWACDQwMYnGyq/K5l02WVspWL
 gof/S9GhaQ76kGDVNT2WBy85nmesXY0RN54A+A8rgaXxcL88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf/LqJqTK5OQAOMHQPIyQDSGMt4db5p5oopgnSVdslG6mw5uAZAhmpn
 WrM9nJnwexO04hbjM1X4GwrnRq0ubv7dQUU/zmUeT6HviFDOL+LRa63vA2zAel7EK6VSVyIv
 X4hkseY7fwTAZzlqBFhUNnhD5nyua/bbWS0bUpHWsB4qm/zoyLLkZV4umkWGat/DioTldYFi
 mf3sBgZ2pJcNWDCgURfM9PoUJRCIUQN+L3YuhHogjhmP8AZmOyvpngGiausM4bFyhVEfUYXY
 8rzTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDJGO1VbQbeMb9gtctoRTk5F
 f4FaqNmLD0FDoXDjtT/q9ZPfTjm01BlbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9zY/1E
 oWGchYAkjLX3CSfQS3TMywLQO6/DP5X8CNgVQRxbAnA5pTWSdv2hEvpX8BsJudPGS0K5aMcc
 sTpjO3cWq8fFWmdo211gFuUhNUKSSlHTDmmZkKNSDM+Y4RhV0rO/NrldRHo7y4AEmy8ss5Wn
 lFq/l6zrUYrL+i6MPvrVQ==
IronPort-HdrOrdr: A9a23:ZcTaBK4e1LRfLjmDkQPXwSyBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdhrNhQYtKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkANDSSNykLsS+Z2njBLz9I+rDum8rE9ISurUuFDzsaEJ2Ihz0JezpzeXcGPTWua6BJc6
 Z1saF81kSdkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cNzp/8tHNFA7dg6ML6K40z2MFvx2TGpUBza/J9uAQO4l3ew2sRz2N2X
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="68239714"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DU+SQy/ki+gkt7lpVrFUQyFbc04QtwdenjsJv/6aisCKAOgivzb1MvWYQIUODezOmTx+dd2aDLGLcIp2HyKOt62EG/c3eT9Me1V/ExqN+AFNhJgbTFYLe/7akX8gzC2/phOWCAFL4TKLnmGn2DmHtQo7zD9oIaifS60c6J50FmbtaGyv9PeGafklgZHrD1hEUXsbksCTYeSY6TSe8xUlI2u0D+KyxptQeu6/0TKx6hpNp0h066satDRqtzEJXx4lXzH3oOOe7l8EZcHT0nzk8vAj9HTE/zAFKuGisexnyAPv56LXAdQgcUNCQl5jRiaCl9KBZ9NYEN7lJPNxkZT/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaG12ZkIagFOGVa5EwLSVI2EahEPMc0oBg4/E9fa9Qc=;
 b=fbCKRejC654CKUnVSAGYP3bbdF29qNclaJ7gs4erGS5sRXeAhsgxDdKU155czVYpDE8A3xaBHqwIff5Ahahyo2Bw4JUys++3wb1wpBdGLxLVwauHhTF3xEWlMLs5Ip+Zl/L9mT8A63iTBs5bvRkP5W5EsdxrQmOmETLdf9U7LWmqc6AwhMdwrKwcY9k4YWw+GwgINueA/NkQatQ1LsYmwD+SJmIWXC47mIQnqYOfuuxZ5X5jmHlKmPBomMareFVSv69kOfR6GqYpgivmkz6yFetwx75RRQVggqrPOe6viGPTpODvm03VK4XW/KpEeE/5Yp43/kd3Ro/SUEOb56GZeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaG12ZkIagFOGVa5EwLSVI2EahEPMc0oBg4/E9fa9Qc=;
 b=idWO7wGV52rEtPMKaNMpByxHIUju4QPIVripMZwEEuXuL2xxheDfQydupB7OtGOz47UvUXTVA46Pczh6/gDYbdqnDuvNrpjF2OcvRD8h90koUeZZdv5rJ4dO1MKlvBPd5CnQ/xOUPnoX5/momP1QM938X3D/JT1AT7kKOW0IbFo=
Date: Thu, 7 Apr 2022 11:01:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v9 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <Yk6ofw+JcKpuJN/a@Air-de-Roger>
References: <20220401104713.22291-1-jane.malalane@citrix.com>
 <20220401104713.22291-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220401104713.22291-3-jane.malalane@citrix.com>
X-ClientProxiedBy: LO2P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbf94411-cd6e-4ce8-030f-08da18754407
X-MS-TrafficTypeDiagnostic: MWHPR03MB2447:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB2447B6935CC76B3E29590F468FE69@MWHPR03MB2447.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1NwmbVYTEBrRIWuK7wTKFa/rG+sUoxXCtWWBu0vbtDdj82i3t8wDYqke6yKOdUeYaTfWKVRo3OyDqIxLHUMYl4ilEJejmv4WSarHvPzW+p1fsxrcBq+c71gwyaw4r0krH/Ca6v46zttzaxHqkGcLQ7aIzuI6TbyuWY+4l6qu9n/HAl8oRdymkrR5FSKMsNKmTwJZRbeuUfGrU/GM3BxNcM1rEikRjBOFppwSZZJxJLj403CmMOoiHYiamd03CwpWZUy9zgnTnz6IrB+yh80bf+Pv3cjrXXBm128UutTCw+nAf9A2O9KHQV6iBRPM5Hu7gZygM5xXFD26nsC+WNHhIoU7HqOhJ7iAyLCzK3tBqGHZfafoqwKW0YdseC8Ga3mc+Yy2CqR8GFpJ9QDoTB36FFpvBNOh57MNWijXL6y+NN1AkxyEY/pttO4PeXCWL/jT1Gcu4qSIKswnqunJdxZBbhq2qWSAdIgl20wvSL63LmkYi4pFheN7Nc8/dcrAt4CfrPhe379Yquj0kmSdevlhoITLdBeJBDoIQUZATdVCgagzHDI/sSr7TEMPZfZdLsqjpDOJpq1AkkydP/0z/RuK1NF9Tq1R5COqOqYo3vCGjXFcUY+XWrbZZ7YK3CvYrOoOmIoKUyUA2w0SUFFwWI03lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66946007)(4326008)(6486002)(6862004)(66476007)(66556008)(316002)(54906003)(6636002)(8676002)(38100700002)(86362001)(85182001)(82960400001)(186003)(26005)(508600001)(9686003)(6506007)(6666004)(6512007)(33716001)(8936002)(5660300002)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dklWSlZ2Rm94SHZVZVA4SWpiN1YvektzSVhPMGVyUWF3YmQrTC9GVVlubjZJ?=
 =?utf-8?B?YXpESDNVTklreVNVcXd0SUxnQ1g4dk1rYTRjWk00dG1OL01YVGJDQnQ1c1Br?=
 =?utf-8?B?d1JzZWo0bWhMd1BCbkdIaHA0b0xBQ0pRUm5hSlFXZ1pLUlVhTjdBTlNvV0hx?=
 =?utf-8?B?dkhJN0M5Y2liR2cydlMyemRxT2RYUUYrRTd1dVhFRlY5OUZ5NXY4RDRQREQx?=
 =?utf-8?B?ZFdvclNGUk9aM2VEMjV1cVZZdEJDMFErSlJnOXpXNmZSZUJIWFFtZGVrZTJR?=
 =?utf-8?B?dVRoNmdIUUFWcXhMclQxRjRtbEtPWU13aFZFMEgyOGpyUHphdWs1UXp2WjZu?=
 =?utf-8?B?Wkt3d0VTWFBVMkFJVXpyTmRSWTl5ZGZRRTVsZ3JUWWlLenB1U2lzY0dZcWxu?=
 =?utf-8?B?QWVDMko0T005ZjBPb3BxLzFWaGVTM0pNV0JKWFp1bVdsaWNZSEdyM2FoL014?=
 =?utf-8?B?R3haN3FJbm51TGtoVjBnRUx1N2NjN2k1ZmgxRmFWcWlxT081a2lyRmtJOWpS?=
 =?utf-8?B?VWc4dnVUQk9yN3NRU2hkWkZsM05sbUN2K3JDSHNTRjNiVEdCUWNpWlR6UmF6?=
 =?utf-8?B?QTJEOU5KOWxQbFJJd2ovTS83SUxONHVyVEl4WXhOaXdnS21xNHVFdG9qLy9Y?=
 =?utf-8?B?K2l5ZXA4ZjFkNmljUXNja1BIeFZiZWp0anBiMEtocStmR3QreVNWVUdVRnpT?=
 =?utf-8?B?aDVicUg1QnkvOC9WMHl3dG5rb3ZRQmtTYXFrMWVHZGNOSlRzY3FmR29BeHcv?=
 =?utf-8?B?Vlc4V21VK1FEaFlCSlo4ekdaWm9tREtZQWd2dmFxcHdEN1dSWk9lWnljd2g4?=
 =?utf-8?B?VE92Nmh4K09lUUVMZkZQQ1FzaHpjZ2l6QWlyaTExclVsQ3ZWU2VncndtMlow?=
 =?utf-8?B?R0ZNMUZ5c3RYM2kzRnRCdURmMURaYndTN1gzaDVTYlpHRnRIUGJnVmtrYTVZ?=
 =?utf-8?B?TzhRV3dLT0poTTJ4bHhNRlRUUkRFT0FNclRXMDRWMXI5andsR1hKb1gwcUsr?=
 =?utf-8?B?cEo0dlIzcG4xeDNqZER0dHFBV0w5d0RoZi9weGFCWXp5clBMZVdTSTFlWXRV?=
 =?utf-8?B?YTc3dCtaYnhqN3RqWG5OT1FML3RQWitpZ1V5U2dHRWpXbGREYytrdnlBY1BH?=
 =?utf-8?B?cGt5VDMxQlo2OFdneGRuOUlOdFFlOXlmVnBDdGxFSkRxU29mdHpYRVdxTjJF?=
 =?utf-8?B?MXpzZ1RIZE9uU092bU9lOEdueWF4RG51b2VVVXdKZFFKWHZYb2pIbXYyclBt?=
 =?utf-8?B?MTRGbnRMUHpHbFhDUm1HVFMzNWdXY3Yyd04xSHgra3R2QXNuY2Y3QWN5VGdP?=
 =?utf-8?B?dDNyL1NXOWhGdzd0RzRVN0F2Z1praDIzWWc1bUVuMS9HVmFaZEtiTGN0Y3dk?=
 =?utf-8?B?WnNkNlA5UVlpamF4YjZxUHorRjErU09iMWdGMkl0Wm9TQUJWN3R2NlIzOUdp?=
 =?utf-8?B?NmtnRDl1ZzQ4TWdJUWE1UmIyUmd4WW9WNzF0Ti9hWThXV05xeDBtSTA0b1NQ?=
 =?utf-8?B?SHk2TUtrVXZ4NGZNdmRSRVJjV255ckEwYUJpSGo4Rm82aDlCaFZLazJqVFQw?=
 =?utf-8?B?TmNWaVpQaCtPbE85WCttU1RFQmc0Y1JqRTBXeU5Ed2EzOGhCWHpVaEtEbnJu?=
 =?utf-8?B?M3JpeEJtSDFtUnV4aTVXR0prNjQwS0M5a25PbUZ4Yzd3ZHZwZURoWXRCd1dT?=
 =?utf-8?B?T0wzcURjQ1BNYXpyQmlBYzVIR2tjWkpsNzRVZFdaVjhsVVdZdVZHZCtrMC9V?=
 =?utf-8?B?dW1QVGtZN3E4cTI0OE9sTktBUnlVWGlCMTE1YW9za0laRnJNQlpWckRxRStS?=
 =?utf-8?B?bklKN3ZFVk5jdDJoM21HZWZxUkNLTmdRL3ZZYXZPVTVFbFNmQ0dCUGJCMC9t?=
 =?utf-8?B?S2MzT0pNR0NWUTRIVUNoSDBvZjQ0MHlyVXpmRmYyVC95d1Q4c1ZtS2JRWCtF?=
 =?utf-8?B?VnprY2pNVU5CSE00S2g3d2pSVS9VRXQ2eFFJV3VrYmRyVEk2NWVJZk1wQTJw?=
 =?utf-8?B?SWw0WldMZVdDZlZEeDlLZkVDWE5HZGs0YWp5VjJsVVVRVGpTa2JlNk5BMmVY?=
 =?utf-8?B?SStxZ1BHM2h0NE5KUy9hY1R0QmNMZjZzaGdpcGpZYVN4emcrYVBuSGl1Ykcv?=
 =?utf-8?B?Ui9xaG52Rnk5TmRhRmVDVFcvR3k1Q3hHb3JrUEZhWTFnTEM1UkRVaW84MFZp?=
 =?utf-8?B?bzY5R0MzWDJpZ29QM3M5Q3JMOU5zckc3bklBWC9GWjRwdWwvRG9uUFdndmpB?=
 =?utf-8?B?blJINEFrZC9IQjVVRE05QTNYajB1MHJZdktTRHZvald4MjY3c2hBcGN1NGo4?=
 =?utf-8?B?RkhkbWYzTGZFNXlZY2Y2Q3dqMnNrSDRUcFBjZGVsZG96aGNlQ1hKb1hGVlUx?=
 =?utf-8?Q?SJpNpauHWnVRwMbw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf94411-cd6e-4ce8-030f-08da18754407
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:01:56.0083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qs6XuXHfQ6ZjKACRLXR2gN1MEi47vwu/Taxuo2/sjvHkwN2LKAuAD2HXFQTtiALFMh9jQhJaFjfcNhpeHrz4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2447
X-OriginatorOrg: citrix.com

On Fri, Apr 01, 2022 at 11:47:13AM +0100, Jane Malalane wrote:
> Introduce a new per-domain creation x86 specific flag to
> select whether hardware assisted virtualization should be used for
> x{2}APIC.
> 
> A per-domain option is added to xl in order to select the usage of
> x{2}APIC hardware assisted virtualization, as well as a global
> configuration option.
> 
> Having all APIC interaction exit to Xen for emulation is slow and can
> induce much overhead. Hardware can speed up x{2}APIC by decoding the
> APIC access and providing a VM exit with a more specific exit reason
> than a regular EPT fault or by altogether avoiding a VM exit.
> 
> On the other hand, being able to disable x{2}APIC hardware assisted
> virtualization can be useful for testing and debugging purposes.
> 
> Note:
> 
> - vmx_install_vlapic_mapping doesn't require modifications regardless
> of whether the guest has "Virtualize APIC accesses" enabled or not,
> i.e., setting the APIC_ACCESS_ADDR VMCS field is fine so long as
> virtualize_apic_accesses is supported by the CPU.
> 
> - Both per-domain and global assisted_x{2}apic options are not part of
> the migration stream, unless explicitly set in the configuration file,
> so it is safe to migrate a guest that doesn't have assisted_x{2}apic
> set in its config file between hosts that have different support for
> hardware assisted x{2}APIC virtualization.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

