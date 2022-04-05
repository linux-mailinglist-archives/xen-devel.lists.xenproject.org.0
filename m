Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8364C4F2C4E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 13:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298744.509034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbhMx-0000Rs-BR; Tue, 05 Apr 2022 11:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298744.509034; Tue, 05 Apr 2022 11:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbhMx-0000OP-74; Tue, 05 Apr 2022 11:29:07 +0000
Received: by outflank-mailman (input) for mailman id 298744;
 Tue, 05 Apr 2022 11:29:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbhMv-0000OI-Si
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 11:29:06 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 981fbab8-b4d3-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 13:29:04 +0200 (CEST)
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
X-Inumbo-ID: 981fbab8-b4d3-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649158144;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GmuU0Z5fI5ZUI08YEiKarVgFZxOXiN1qCT/YZ3XK3us=;
  b=Mher8mFHW/738Tgfj4CYSA4NU+Cnf5UNYpgwar322kb3FbMR3LPlznRJ
   FAN4RjuQ5p/dpxE4bKzE58riuDq3oGXoYGDaEnS9kz3f12kqeqQhB4cn5
   xncxVQ1TYK8kPfLyT3Fkyts/tJgnS0WhzFTPr6WoqsrfdDFqev3LTQRlj
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70429976
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rFkgV6OWrseNLK7vrR2zl8FynXyQoLVcMsEvi/4bfWQNrUolgzJTm
 mMdXTqOM/iKajCnc9F/a4mz8RsPscWAmIVjGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tMw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 fpS6pqLVQwQMKDvtus8YRJyDXF3IvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwg29s3JEfQqi2i
 8wxciNKfE/GeCVzBng8Cpsjuva0pFzQSmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaBkQFDXeFMGNQ05SKjxYvm6CyHVmEbG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnFI4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1gRiG2NPdXABb3nARBodtvxor6p5
 iVspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/LNgKuG0jeBw1bq7onAMFh
 meJ5Gu9A7cJYhOXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPRkk8FDbKnPneMmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcBkTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:S8YFPKrnUPOCrgSUauCrAvcaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LvEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNP6Wsqd
 60d5iAr4s+PfP+XZgNdNvpfvHHeFAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="70429976"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1aJ04XmboW0LwDpMzfTTtznAegMaRyj68tfBPkxkl/jA/OLg8VA8gmyfdc75sttDW1UE0xZVoz/VHc3UT3veAyqdpDGyIrdct6K1KYXiJH4vpgK4TiXcjeZmYdwDlYPx4X7TsEuPYm74RT2huOLxibvmYBVpJTkxOF4585FgvJHPqRddGP299RWcLy7LC4CiT20nI7srHJgFDZO/6BRF5CtgLb28EPxC3SwJp+jyhKK53kqeLQDZ2UbatIb4CKF242EB8wHiUpQxuagZDhAnFAQzuqeZtM7VkhqhJzrKSAwf71lIcIz2x/lMXKd98V7kLV6/2m910icRfbYoB3ngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RY6uMT8CuzNAMGleFkZNbPvtccNg9iX4aoZ2+tD5o4I=;
 b=Dw5jbQoX+Bh2psvHA03CPhUVpxoeSOgoEXAhydnNfGUuWlBZFU5ygVqXS4cnwArO3VeIynQcMm+I2Y1D7RxXLx+Sm9IniaHWbkEyxTamiFat1MSO7vlaHTY820bbnrjjA7RZb9BqyUAjgnd5k/Rd+vJG3IV77ljZZGstsI1WFZmZ6TiUak2gwDasASvgkYsi/Vz1j7ekkPHxkuy7VBOh7zwZ6oC3smdEFQ9W2Dqhr3Ex3QTUWbQkaNWb1w9D4RrJciwWd5dCWYSm5/842gwqz15BoSgGIuGo4sSAK4I4LQB4udiRPCNY4D8jhpS6tZwzzv01/hHgaJjMceoc2jLmmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY6uMT8CuzNAMGleFkZNbPvtccNg9iX4aoZ2+tD5o4I=;
 b=fmsL8bYBXVDoabqs5VKWIwQ7Er5wAVE5OumXDoK15f1VP8UgVbu/EsId4GHwQn7KuZ0xxqv0oKIIiLazIj4iyzibmPPgcWl4Q18k820iRVW0IJFHR9vd5msd7XN2nZiCRXrIWcVTVSnWGn3tAc6LSrJ2C/KUx+/0484po+bzDOA=
Date: Tue, 5 Apr 2022 13:28:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 7/8] x86/boot: LEA -> MOV in video handling code
Message-ID: <Ykwn3dVVAtTkz6Zx@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <48666252-a448-9c17-cacf-2788fe1a3c17@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48666252-a448-9c17-cacf-2788fe1a3c17@suse.com>
X-ClientProxiedBy: LO4P123CA0185.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d7f044e-0e43-4563-c84a-08da16f76b88
X-MS-TrafficTypeDiagnostic: DM5PR03MB2475:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB247502C3FD907D89F6D0E9458FE49@DM5PR03MB2475.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q+v6AjhJ2Mkjovc7CRKGMQ2zu4fvbFL8L1MrKaUNxd+Zr5Cpc54BNYz1h6J66FFGocGuMmLFN2ab0qHDX0pVvQenipRCT/lBRqgWIjRZQlsQsv0SAwAxSKy5gal/ohdm01uIPgZWQID1z902KPX2GAGlAEz78lxpPuWlKqMO3A8H7AhlpwnaimctGpTwu1uIbv+pIqlksf+YTzPjUe30gda7xkQmkq2oy0cDIS4T884hMCKc8aWbZdrMtiN6Yl3WBnZng8IaIR1gGdetOxxf0S3A2LLkYGSfz+5B2MGqWEojh6fLNZ9Y+8xug+xT/CaWJ2MNboVqQGmtgE42Jr2lq4JEOT+fqtv1XQI1/6cP383Ops01rkI2k47Kn8YizCCYbb/29teFuDkmXzRc2AOW445PgvKR7vclneec+HTUfN45wFOHD1bf5lOO+kiJOJXs582xRfp/M4cXgRENRGkQUT4wwvYHeszA/Y3Ep0051Qd/2b77Pgbpi64ZqAAvZwSNLm2UuwVlWGXnzXDtY3vbFrI7H1UwFkhOZvD9kA0ahWth11laobwIWQqNRej91wvmv3MWxsolgQE/4t923ei2pB/lRWr5KZ9xjzs83M/I5PrPIFCjbZWjA8Se5C751IarMMXmyO/RAgmUpcNikyjG4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(4326008)(66946007)(66476007)(86362001)(2906002)(66556008)(5660300002)(82960400001)(38100700002)(8936002)(6666004)(9686003)(6916009)(186003)(33716001)(26005)(54906003)(6512007)(6486002)(316002)(6506007)(508600001)(558084003)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SElIdjlXaGZIVzhMNEhHbThnb29vRFFYNWhhMTVtWnV6cHNDTlh2Mi9zWWF3?=
 =?utf-8?B?ZHkrZnRBRGxiYVRkZVNEc0tBcTlHWmVJS2xjamxGUEJ6cklLY3VCbm80UnRO?=
 =?utf-8?B?blBHOHhRcm9zdVRadjJHR0QvblU0WDQ2d0h2VmVxUlg5bWRiZnNQUEJDajVo?=
 =?utf-8?B?OXVkVTJQQjVqTE9WQktVRzBCMDZSVXdTUUcvWXgxMkJPcU9qT0JzeXVTc09y?=
 =?utf-8?B?aVBIMDJ5TWx6OTVCNzljSXFSem5HNHVsR0c0YmtWdHByQlpGYWhET1lmRUtK?=
 =?utf-8?B?L05jUXU1cVBPanRrTTJTeVFkdFREdnVhOThRbHdhaWlUbFQwYVFYTXYwM01I?=
 =?utf-8?B?alRpK3BTSlBYaHF5RXp3SkFQd0tkY1hUZnh5V3laTFc4TitBeCtWZVVWWTMr?=
 =?utf-8?B?YTBWVis1OTVlbHQwaFo0ZVdZbmlhUXhDL1RqUXFGWHQ1VTVWbEtBMkFKVGZG?=
 =?utf-8?B?eC9NRUplQnkwWEh2NlM0UEdBWTVNR2xPeVZuMktpRTdjY2Z1bWkxSUhNK1E5?=
 =?utf-8?B?WHNiVmZFdEMzZDdwUmdTeUxFMmIxOEo1UDZ6WkR5dzhQcDBsY2pRL2xWcmty?=
 =?utf-8?B?VkxPRkZEMk5KOHB2V3lmVUY3VjdqUW8wWE1vSEFvODVCL0xrYno0ODdMUlgv?=
 =?utf-8?B?QlBnbkZKR3JnYzBkV3VDSWQ2ZFFNL3g2clZBYm9tbWtvTWFEOXExTm9lNW9q?=
 =?utf-8?B?Wmxqc1hoWkVFSW5QM0xZb1ZSUlk5UHNzeExOWFZ3Q1Y3a05ETyt1dWVlN0g4?=
 =?utf-8?B?N1hlRWRtKzlzMXFQa0poYVJybjZHcUZYdU1DaVZUYVVnOGRnWk9BM2dVQ3Fq?=
 =?utf-8?B?bWpIaXpSaFd2NGJoV29JaHpTb2dJMW9EajNJME5JMHJZK3ZBbHpIVHBySFA5?=
 =?utf-8?B?VjRCV3F4bEJnRXpJL1E1a1lRSTI5MkpFc3UwN2VtYlZkVFl6MnNJWW43QmVT?=
 =?utf-8?B?eUNlcW5hL29HU2VVdUNrQWNXQWx6cktpVVBSTzhmMFpCZm9OUlg5WHFDS21Z?=
 =?utf-8?B?RjdFT29UL0lyQjhGRFNJWFllNkNBUXRzeDd0NUF4QTRsanovYzFOeGVKSUhE?=
 =?utf-8?B?UmY0NXR4Rkt1NXJNck1ldFpyVjkxeWdLR0IwVncwNXpDVHh0c2pPRzJXaHRy?=
 =?utf-8?B?MWxMS29ZU01DVjNhSDJXdGNuNFN1RjJDZ1oxeVE2amdsOU5KMnh6ZGErRCtW?=
 =?utf-8?B?NGRyczAwTmtlRWZ5NXhZa002dkF2ZitQeXdtaUl0VkpadWVOblV2ZXRwb1kz?=
 =?utf-8?B?MjJHU2orTTZ2ZC9qVFBUOXZKVURCZUlTb2xnWkNaaWpyem5Bb2kySHFSU0JP?=
 =?utf-8?B?aWR4a0ZBdERSQ05hb0Y1ZStodEl5REFpZ2dibExMOVhJZGkwUGVWRW1RODBB?=
 =?utf-8?B?QUlpWWdtNjVDaTkyTXc3MzkxNStzWG1oWGQyTlFwMXdiWWRvMDZuYVh3VEtF?=
 =?utf-8?B?UVNnTjVHK1hCWHlXM2FMMnpNdnRodHJXSzVNdFNldmNBbUVJYlZYK21HVzQ4?=
 =?utf-8?B?RmFqNWdLQ2R5Q2ptTTRmdVp0ZmdoSUQrRk5xalRDOENRUnJqL29zUWRzODVW?=
 =?utf-8?B?cWZ4a1FjeXhlUW1JOFFwSTlkYUN2QVhrMDR3R1VNWE02Z2lJQzB0RDBYY1Qv?=
 =?utf-8?B?anFSTmVmL1R4c1Nrdk5TRmlmNmt4K1ZQbWh1QjdZVlBXRFBGQms0Z3QvOGxz?=
 =?utf-8?B?R2E0bGVFUmt4aEJERHh0SXV4S2tOUkk3a2Yzb2NGU3ptMGF3WTZ1Unh5M09R?=
 =?utf-8?B?bnE5ZjFvK2VSVnhaQnlacXhrdjdnNlprUEtxTXJiYVF5VXEwUDF2Qm0xdWE3?=
 =?utf-8?B?YjB3Vkl5VlpVVXVPNFE0VXpBY0pCa2ZTZWl2NThRdGJSc2xlZlp6bUpYdk03?=
 =?utf-8?B?dzF5VDVWenRTTDExSkxVempKS0Y3bDQ1ZnpYd0R6ekgwTVRtK3JKWGVuUXMy?=
 =?utf-8?B?eHg5ZmNHT2NKWVQ3VTNqZHM1eXFrK2RPaEkvbDBEQTVJN09qOEh3SE10emU0?=
 =?utf-8?B?eE1jRnNFV3ZOeFZ2eTVBem05VUJwbnlKSHdKSFl3bWt3ZDl1SDdyNFFlaFpO?=
 =?utf-8?B?VXZXUXYwTitIZlZoT2hFTlY2Z2hnYTh3ZjQxYVZ2RjFaS3dGQXFwN0FONGtu?=
 =?utf-8?B?RWV4bm5MUXV2dk55SnVNMUV2amZXdXhOcGc1OUZycHJyWTExMU1UK2g0NFFD?=
 =?utf-8?B?Sk9YMXJ4ZkV3QkNFa3p4VXpsZHJ5LytoWU5wTi9CNjljM0wxT2phU2NOUVdD?=
 =?utf-8?B?YzRNMkRmcVcwTXhtV05aVEszS1VZWm5QcjNndmJ0K2I1VnZITlp4aUxmK0h6?=
 =?utf-8?B?V3c2YWJEa2dJUURLT2RkOWUyRTh2OWV0MDN5cFhzN0daQ0M2cnB3dUkydGt0?=
 =?utf-8?Q?d/QQelIx6qYy6oFY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7f044e-0e43-4563-c84a-08da16f76b88
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 11:28:34.4299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NT9lQtH0L+EGCYPwrQ/IVhHIUpxIQCbYbMq5IjCMZpk/fONSVd9ILDzIPEYplB0EJFVOEeMrjZEiUZzBWdUyTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2475
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 11:50:20AM +0200, Jan Beulich wrote:
> Replace most LEA instances with (one byte shorter) MOV.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

