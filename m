Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2771A4A6D1F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 09:45:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263854.456700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFBGM-0003T3-Ee; Wed, 02 Feb 2022 08:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263854.456700; Wed, 02 Feb 2022 08:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFBGM-0003RF-BM; Wed, 02 Feb 2022 08:45:14 +0000
Received: by outflank-mailman (input) for mailman id 263854;
 Wed, 02 Feb 2022 08:45:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAZh=SR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFBGL-0003R8-6I
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 08:45:13 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d63fffb-8404-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 09:45:11 +0100 (CET)
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
X-Inumbo-ID: 6d63fffb-8404-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643791510;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Svkr3g4I0IlUiRrpN97bOo4KOqfsvL537oiSq1vPLyQ=;
  b=DpjVyngbyL47BlnQU5/n1F+JNB8DAdCxi3VKgwMWzbKpHQaS5WkXtJ6s
   TUKKBQwnGmo1SabzxFaxLsc0O1syGmiM6ZmBUZf/WSLQ+iQU/+DGOQAks
   AtfVmm7XYuI8BxcER35doQxoCBqGDm+9pG3h9T6G3QrJhCjdkqHocB5ia
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LdmeYZvTmsolQRO6kAXOFtIinXGVr4kt+acDfSkSF6UvZNQaJRlpl02T16DQcMWqX1bFZc2f1P
 S2UmfniOytnDEBKYimTUk6dP+E2Muq7vz475p4wxJ3zKD2nPWLfYvM3HoJru5pNZfMXO3OBa37
 cGbbgiwKpNbo7MdEDmUr/JIqzeCsrUS0ZHdyj9d1G+jxH3tiRlWeZq221FKxvLFjBWRzTkyuqv
 AURMHmJELLlEYCXgxku/sPjoYf4CF0tdoVb1wpTV6YYoQcdm1Sm+xlqH7TU0NfcXWSy3Kf4pa4
 ashCZsh1lea0TGFwqFg96DJI
X-SBRS: 5.2
X-MesageID: 63214442
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0eq5Ea7FuB7v6WwjtYut4QxRtBzBchMFZxGqfqrLsTDasY5as4F+v
 mcfCDiFbvuMNDT2eI8nPY3nph4OvZOGnYJgTlRs+S4wHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2tQw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 NhgpJnhV1kQGJaQ38UBAhRkPQJbFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmxq35wSQay2i
 8wxQGdtdgjeQwd2G1ocVblgpvXzuiLNbGgNwL6SjfVuuDWCpOBr65D1OcfRUsyHQ4NShEnwj
 nzB+2P1ExQLLuuVwDCO8m+vruLXlCa9U4UXfJWy++R2mlSVyioWAQcPSFqgifCjjwi1XNc3A
 0sQ9yk1pK4+7nuiSNXnQga4q36JuB0bc9dIGuh84waIooLO6gaEAi4fTzhOaPQvrspwTjsvv
 neOm97qHjVpvKeiVWOG9ryUoDWxPgAYNWYHIyQDSGMt4dPuvYUyhRLnVct4Hei+ididMTj2z
 yrQ9HBmr7oWhM8Pka68+Djvkz+q45TEUAMxzgHWRX6+qBN0Ypa/YI6l4kSd6uxPRK6CVUWIt
 nUAn8mY7cgNAIuLmSjLR/8CdJmr+vKEPTv0kVNpWZ47+FyQF2WLJN4KpmskfQEwb5hCKWSBj
 FLvVR15vJJ+LX77c/FORbntTOU2nKXcO/fAf6WBBjZRWaRZeAiC9SBoQEef2WHxjUQh+Z0C1
 YenndWEVihDV/k+pNaib6JEiOJwmHhirY/Gbc2jl3yaPayiiGl5oFvvGH+HdagH4ayNu205G
 P4PZpLRm32zvAATCxQ7ELL/z3hWfBDX5ris8qS7k9JvxSI9QAkc5wf5m+9JRmCct/09eh301
 n+8QFRE71H0mGfKLw6HAlg6Nu+0Asom/CNmZHJ8VbpN55TESd33hJrzirNtJeV3nACd5aIco
 wY5lzWoXa0UF2WvF8U1Zpjhto1yHClHdirVVxdJlAMXJsY6LySQo4eMVlK2qEEmU3Tr3eNj/
 ezI/l6LEPIrGlU5ZO6LOa3H8r9ElSVH8A6EdxGWcoA7lYSF2NUCFhEdeddscpxVdEWemmDHv
 +tUaD9BzdTwT0YO2IChrYiPrpuzEvs4GUxfHmLB6q2xOzWc9W2mqbKsms7RFdwEfG+rqqike
 8tPyPTwbK8OkFpQ6tIuGLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+8LoxayV
 2KO5sJeZeeDNvT6HQNDPwEidOmCi60Zw2GA8fQvLUzmzyZr577bA15KNhyBhXUFfrt4OY8o2
 8k7v8sS51DtgxYmKI/e3CtV636NPjoLVKB+7sMWB4riiwwKzFBeYMODVn+qsc/XM9gVaxskO
 D6ZgqbGlo9w/EuafiphD2XJ0MpcmY8K5EJAwmgdKgnbgdHCnPI2gkFcqGxlUgRPwxxb+OtvI
 Ww3ZVZtLKCD8jo01shOW2egR1NICBGDoxGjzlIIkCvSTlWyV3yLJ2o4YL7f8Ecc+mNaXz5a4
 LDHlzq1DWe0JJn8jnkoREpoi/3/VtggpATNlfeuE9mBA5RnMyHuhbWjZDZQphbqaS/raJYre
 QW+ED5MVJDG
IronPort-HdrOrdr: A9a23:X2yfma2gS0XPFZC+Kz6L0AqjBShyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5Wo3SIDUO2VHYVr2KiLGC/9SOIVyaygcw79
 YFT0E6MqyOMbEYt7eL3ODbKadZ/DDvysnB7o2yvhQdLz2CKZsQlDuRYjzrY3GeLzM2fKbReq
 Dsgfau8FGbCAoqh4mAdzM4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 TxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72xeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlBXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbhrmGuhHjPkV1RUsZ6RtixZJGbCfqFCgL3b79FupgE486NCr/Zv2kvp9/oGOu95Dq
 r/Q+NVfYp1P70rhJRGdZA8qPuMex/wqC33QRevyHTcZek60iH22tXKCItc3pDfRHVP9up1pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,336,1635220800"; 
   d="scan'208";a="63214442"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jr5dkQRWswLmcCAgy00CaKQzCxjHXxcHk1vr/JmZkFqUy9+UeDR5dFHZc0oAHa/mvG1ueFwgQdcRAdId35PK+tKt6p3FlKaF18EN16eS2qCe6+XQxsMfhh/HDnmpZUjsWhS1RMyHmlQxnNf7Z/J/fsFzISF5cqPdWPM3jnouLJ1WSu/xeijOa9RA4CIqEIi70P1X0aEsPdwwlgZ1mT7BrKdKt377P+UjaJ6czEwMLl8SPBHIhKcMi+oQPhZI5kDbKCHdRwEmNYOMPJeo+m6ToCxpgBS7ghVbrn5YzRR8YkZmx140pnDlKWpTtMIHh8uMQD3+sHYhYy1/9B41mOHB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFcgdBGfb4DtEg6ovNwaYcvVpsSukS5gpllFSMMnfyk=;
 b=D6B1KVED2cm4OyOfd9plLG80WjLefnfCUwoKwSNn7WnRBGGjVb2ToBdZ75SjjyLPJjruCtnJ5yGwgI0xhg80r1DJwkmc5gUpEnsvBtmalQrQWXEB2FZDgEfssQi7u8SwD5NKDJj2MBKunY4w8yVO6nVZEF/CYDOxWM2uNclxeAQFIUd7xdfCAKu1XgXWKD0IdQcw2V+tlSjpg7ZonJsYbGMczu6v4KZArpRYsmYeJCAh8gWiecUTRr14RclRGnR5hakA7lonCbW3+z2c49Uxjd8TjO2cGzpedLrA1Ik+4AvmHmkwfoLh3qRHgyrbs5tSsUl4zE4WJvIOB+vNngneug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFcgdBGfb4DtEg6ovNwaYcvVpsSukS5gpllFSMMnfyk=;
 b=aLx8hJED7bLpOwkwLdUwjY7zV7L/0XhpKvx06e7RK3KSC2aN5J1uriCRnk3fifrRCOgzJyOv+vaTF0peoEhJiZcEUqj+pQX/gw43TRBYYzbLO0LjJhY4Wdn/XVpOEf7J1xaMwOvDigbunsJXPTWG/OsIQaUlxttmeOBNHnrAhl0=
Date: Wed, 2 Feb 2022 09:44:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 3/4] vpci: shrink critical section in vpci_{read/write}
Message-ID: <YfpEiWT0NpYNSAks@Air-de-Roger>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-4-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220201162508.417008-4-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0192.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::31)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a2301a4-ce7c-4091-013d-08d9e6284e3b
X-MS-TrafficTypeDiagnostic: SN6PR03MB4048:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB40487DC9BA22711287C0643C8F279@SN6PR03MB4048.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MnQGvMLbJG0dscIkc2UohiRC843eeEr7zjJNnasv9qYcOANRGmjFdFl7iCK8+8tNW47WuXJwdI6ftlPg44OjBVoFAQaeUpI3GM3AsPlKtB6FUnVUYMrPWSQ8dbPIoXixuww1jiPUi6eWH4UX2Ztgo4/UV6hyaapdYxd0fPRptdGH5qeOMK8vvX88zUGJnl+zKb0D+B3dji+RGlsSDDFa9H9bf7Xtl/HsYd2cgPydLr5siGhTxmsU6Fo0NOPkoanQ+U7nHOdXPCiss559oJJqkmG2ZB33zXF7YoHso/d7yvrCgNdHhwU0bwQk5m7ONGHGNAmg3qclQSXyV8xPYeGDBwAHNQCHcSue8nIrAeiA8YN2BA2gXi4NMYPQ4Bgjo1wFFv9glSzM2hZyEJh2hU50x3qgd2pBm+mR0ECUdggQvisD2c4eu63jtvloX7HV761xf2YExV3cCiAIN6i4Lr+O1fJ7SK5LiwBpkY9oB7GDidwQL8FMYgwC86KEx3DoqnVp+zRq+L+4H+Qca/GqjZofjmETEBOKSLSdTsssUfsxFK8H9ZyNVZBLFtz081yqxrydcFYMzKk67g2uPKCuScIymuCLVds4QwGmyuKAa9qIy/2C8nF/wnCWcacHDij103TTCRiOPnigbzXcpxxVr/wUuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(7416002)(66476007)(2906002)(66946007)(66556008)(8676002)(4326008)(8936002)(82960400001)(85182001)(6506007)(186003)(26005)(33716001)(508600001)(5660300002)(38100700002)(316002)(83380400001)(6486002)(86362001)(9686003)(6666004)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFFWZyttTnpVRGJHNW1zNURTUTNhaUIvQ2FPejhNR09MYlJFcXJOTjBabHJ1?=
 =?utf-8?B?cmpZT2tmY29hUkgvRndpcDlOUHRwT011UDRHeWJuRWRqOHNPUFM4U1RHU0ow?=
 =?utf-8?B?MHFaMkNoZGlsZkp0L2tQSUZuOC9UN3BXVitjS2lwVzVxbWhZaEVRUHlmYUh3?=
 =?utf-8?B?Vkp0Y2E1UDd4TFc4eFBKYkRjV3lvNC82Wm5iY3Vod1F2THB4T1lzcU40VUpP?=
 =?utf-8?B?VUd4dXdyQldVZEQ1THFZS1g4cElBZXcybDJ0dHZueDdlRFl4LzdYeUVBVUF1?=
 =?utf-8?B?eFp3N09lZ3Fndk5ROEsvTXRYYnZrQWp2ZjRQdnJLRmpHakpla0NmeFlMbyt3?=
 =?utf-8?B?aU1uODV3QzUwODk2ZzRnbWh1MmNnbVJaL3VvQlBsWEVaK2MrVE0vREgrVUx0?=
 =?utf-8?B?d09ORGhKaytVN1Z6WnFJV2JCRUc3cUZuMjdzMWNuVUVRaG5OMDRrUDZ4NnBu?=
 =?utf-8?B?eTFMazNwNy9sTk50cTlIeHpEMWxvY2F2S2lrWENvNUd3bGFQUHVzV0JqcXFM?=
 =?utf-8?B?UThnWTk2SVpHcENkdEdSeEQ0anVDSWYvMVE5d1UvbFE3R0REWERyUHUvS05s?=
 =?utf-8?B?QVVUTU5MZVcxbDJsL2dDQjJiK1pLR0t4K0RmclZ0bzRTMG1hTEZmcExibjd0?=
 =?utf-8?B?K2pNbTQyVEhzTVBrTVlWYWJNVmxSNVIvVzdmV3d5S1FiMy9MSGNPNmZYWXRM?=
 =?utf-8?B?QWdhczdIYlNwNFNPQWd6T2NnMUZaNlp2OG5abGxWcXY3SklKdDIxMGdCQWRE?=
 =?utf-8?B?ODF6dkFudTNHSjhydXJnT3dtYXVIUG55ekNNVithNjRETE13bWdxSCtpdWxT?=
 =?utf-8?B?a3dxTENHbFpvdjdlRGJpaGt2TkdPbXJuNklQdVUvY1pkWUlveG14UnpWK1Rt?=
 =?utf-8?B?VlQvdzZmUXJGQU16Z1NDbTZFMk9yUitNeDZZQjNDNjhsZE05ZjJKZXA2VkRq?=
 =?utf-8?B?K1NnNk4vK1dnM0RuSU5DN1hlS1hOVGN0VnFPTFJYM0ozWTRxNGJNM2ZlN0Yv?=
 =?utf-8?B?WFZVamw3VXNiV2dRMXJqRHZrUVlXZ0lUQVRrS0JMelh0SWVQS2Vwd3QzYzNV?=
 =?utf-8?B?RGZDYzFDS0lNL082M3ZueldEdXpuU0VtWDYwUWxlQlhSNGVLNXNDMi8zdFgr?=
 =?utf-8?B?ZmZXTjZFZS80SDRkZTAzTDRSLzA4ZkdyaEV3TG5wdVFhSmlvNVRsSEdBQjlj?=
 =?utf-8?B?QUR2SEJIcUVHNzZGb1krSzRkbDBZemw2d2k3M1RiNTVMVmRHbEpPL0x1YUVn?=
 =?utf-8?B?d2ZtVlRVZ3YzSnhPd3lQZVhHM3NUQUdZN0FDclFpZm9hcjZoR1Y4NE9ySXBK?=
 =?utf-8?B?ZVppanNrQVo1ZTBYU0ZnQzhhNjU2RFpZV050SFRlMGl3Z3JSTWhZaFJtRDl0?=
 =?utf-8?B?M1NVdy9lZDdreE1Hc3F1TVIxR21kaks2SlFBb3ljbWZHZ2hzbUUrcVBaWHI0?=
 =?utf-8?B?TnhhcnF1RjEwMXVpNG5ZQkszbkxPL2RiejM4dDVRVmlLRS93UGw4MmhJcGox?=
 =?utf-8?B?d1VwRjY4MmFMdG9QbWVsT0Nja1VhSzdSelgzWE9aemFVNWI0Q0xTZmZtV2VS?=
 =?utf-8?B?V094dTdWVnRkSTdMdGt6b2lPblNoYjRLcVRJMnBuWks3Tk5Cam9pL1lFWnNm?=
 =?utf-8?B?cUZHWVpKSTY4aTZXR0RaQ3hlRHRLOWRMYzBEWGhacUQyUkU4SlNPUHE0KzFO?=
 =?utf-8?B?cE5RbjN3MFhiYTFaL1lXYVZBN3U4MnhvY1M1dVo2U2VSKzI5QzBDSlNwY0VM?=
 =?utf-8?B?MllVR3JzSHR4eTNnOWM4Y3ZPbS9GRlpXUTd3aVhndHZMbDlidDBCTGVnQjB0?=
 =?utf-8?B?V0FYM3Fob0hqWGI0ais4L3JuRStYdHVLRW9rREFSSmFabTJ6ZlJBaFFLbzUw?=
 =?utf-8?B?elJaZW50blYvNEdWcmhtbWRsVCtpYkZUYTBOYXdjOG03cjRsRzFiQ2l4SVlL?=
 =?utf-8?B?Nkpvb3VsRmI4eUV6UFUyOTdhNWQ5VkFnRzJnNmtkUitKdklCQmtaODN6cXJk?=
 =?utf-8?B?NjZjUHV3U21JaTRuT1Y2YVZKd0hLS25JcTNHd3dLUlBpaStpUXJ2V0xhN2M3?=
 =?utf-8?B?U1ZzeXJrdWhvWXZsZCtRYzB0M0ZQdERXOXZsUm1zb1NKQisvQ0x2anRiK1c2?=
 =?utf-8?B?ZGFkUHR2WTE1N25tbUFKdXp3cGh4OFZtNmQ3ZURQRmRCRzJMaXVzWWRvV2Er?=
 =?utf-8?Q?fsCKH3bWHeU97vdGNJhCa0c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2301a4-ce7c-4091-013d-08d9e6284e3b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 08:45:04.0049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThXmhI6biQS+9YQSiMdiQ25UVDrsrij4H7iDJ+gUrJpu+Y0Rd5zN4Fqa4mTsqYhmIpW70QJW4AP8lG+Tn7uUhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4048
X-OriginatorOrg: citrix.com

On Tue, Feb 01, 2022 at 06:25:07PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Shrink critical section in vpci_{read/write} as racing calls to
> vpci_{read,write}_hw() shouldn't be a problem. Those are just wrappers
> around pci_conf_{read,write} functions, and the required locking (in
> case of using the IO ports) is already taken care in pci_conf_{read,write}.
> 
> Please note, that we anyways split 64bit writes into two 32bit ones
> without taking the lock for the whole duration of the access, so it is
> possible to see a partially updated state as a result of a 64bit write:
> the PCI(e) specification don't seem to specify whether the ECAM is allowed
> to split memory transactions into multiple Configuration Requests and
> whether those could then interleave with requests from a different CPU.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Would like to make sure whether Jan still have concerns about
splitting accesses though. Also since I'm the maintainer we need a
Reviewed-by from someone else.

Thanks, Roger.

