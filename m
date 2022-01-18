Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864F9492AFE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 17:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258604.445565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9rBZ-0005Nw-En; Tue, 18 Jan 2022 16:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258604.445565; Tue, 18 Jan 2022 16:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9rBZ-0005LJ-B1; Tue, 18 Jan 2022 16:18:17 +0000
Received: by outflank-mailman (input) for mailman id 258604;
 Tue, 18 Jan 2022 16:18:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pp88=SC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9rBX-0005LD-MR
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 16:18:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b0d089c-787a-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 17:18:13 +0100 (CET)
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
X-Inumbo-ID: 3b0d089c-787a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642522693;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=aF96mxvPRc3tj1gGumviBBL7E6YEnHPqBYEvgnEOOSw=;
  b=ZzcTz4je5SzUc5G59b8nDEd20kYXg2w78xAR92QjXLp71PBkG89n7gWF
   aOPTwr1P+7N1xNAL9EAIGjZlWk2jBuRc8yuWxD3DjM0F65ZVwwsxlsEOF
   4McGrbseiZwN78bALLQnwzlaLsEI9iVutGiMdaC1dLsoyY6V3Z0hjfPID
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TM1IjXZT3Xqq4zutQtxBlQU37CGQrlm5O4bk8Q5uXORVbV9iNmcALS8l0KErUKib80JBIyqjNH
 TLmeq/ja7E4XT4e8LFXpxjmLHi7IIubeTJ8G8Y2ZdDlCyKe0MvctMdZLF7mXuqJC3BfThzrlzq
 KEyH7GmrsBNj569tuf+bo35+OTdB3N/jr11PIBlrsZMiWXivQNBfkdbL2qwYvCVMOG6q0036G0
 KdXuVljH/DWo3JsTaDxF39oxd0EnGe7Ozz1fP4/GkMLACSDGl1e9Y+6O83llIUKyjviqTSq/HV
 FDQ=
X-SBRS: 5.2
X-MesageID: 62642953
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hrN+Pq7R8DS3ohNOuwJzuAxRtA3HchMFZxGqfqrLsTDasY5as4F+v
 jMdUD+DPPmOYWDzf9lwbom08R8B75OAzt9gSFNqr3thHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg294w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 4RkrLOPCi0VILDx3+ccTCtBFhh4BPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgm1u2pofQK22i
 8wxcj5tKzrkQDd2alYeD780ze7zqXPdWmgNwL6SjfVuuDWCpOBr65DvOtfIft2BRe1Og12V4
 GnB+gzRHRUyJNGZjz2f/RqEj+rEzH3TQ5gZGvu+++ICqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT84FewH0c7DRR9dsEb88w3Wg4z0
 2aPpoa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHFm3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEwHpU
 JsswZH2AAUy4XelznPlrAIlRuDB2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGP418NuM4NYCDwMMebhr5d7exwksAM8vy/B5jpgidmOMAtJGdrAgkzDaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPLFd8tbQXfBshkvPLsiFiEq
 L53aprVoyizpcWjOEE7B6ZJcwBTRZX6bLirw/FqmhmreVs5SDp/Wq6IkdvMueVNxsxoqwsBx
 VnkMmdww1vjn3zXbwKMb3FocrT0Wphj63k8OEQR0ZyAgBDPzK7/tPl3m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:JpNWCqpj43AfPy+41UewDWsaV5s6LNV00zEX/kB9WHVpm5Oj5q
 KTdaUgpHzJYWgqOE3IwerwSZVpQRvnhOZICPoqTMeftWjdySiVxeRZh/qG/9SOIVyCygcw79
 YHT0E6MqyPMbEYt7e53ODbKadd/DDvysnB7oqzoBkNPGUaDJ2M9z0JVjpzUHcGOzWubqBJRK
 Z0k/A33QZIDk5nFfhTaEN1JtTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mBryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczHgNl1mpDp1L8Zqq
 iUn/4SBbUq15oXRBDvnfLZ4Xin7N/p0Q659bbXuwq/nSWzfkNINyMIv/MqTvKe0Tt+gPhMlJ
 tR2WSXrpxWCg6FshjcyrHzJk9Xv3vxmGEll+ELiXxZTM85U59+6aIi3G49KuZQIMrdgLpXQt
 WGyPust8p+YBeRanjCpGlhwNalQ3Q0GX69Mz0/k93Q3D5MkH9jyUwEgMQZg3cb7Zo4D4JJ/u
 LeL81T5f9zp+ItHO5A7d06MISK4632MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhNyJcpgp
 zOXF5RqGZ3IivVeI2z9YwO9gqITHS2XDzrxM0b759luqfkTL6uNSGYUlghn8apvv1aCMzGXP
 S4Po5QHpbYXCrTMJcM2xe7V4hZKHEYXsFQstEnW0iWqsaOMYHuvvyzSoefGFMsK0dvZorSOA
 p0YNHDHrQK0qnwYA6OvPH4YQKlRqRJl6gAZJTnww==
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="62642953"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpPC93tqZYELmU0wShaQRxVfAOYblOtHYBnIucymcXAMyyOrzmJwALmZ3RwPVyWFQPHVCncaeDrWKz1YkqZXWfGOOC1YZd1fY7SvhFIvA6d5LgW3YmBoe7AwA4qQbuTP2ToxWBsGJCSZp3vAPzW1mj/hLNvdKSBw5yzXGssoPnfEHAe01rX4SrozFTpk0jOCN7sLWlCSZHCdAshHMixV7RD93QOxw0oibg+laatk4VloF+iYnLDFXOuC9BbGzmby3soTqzpPFte3yN+ICTnfBKLfhXprrPYnlTP1Cu66ooxGnZIFVnLdVObyw8jWwBZDY11wJZYieb50iD+3Cyjvpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dX9q8j8NX9h/9vRwrio+aMOebKffHZxdKayjUcKJNSI=;
 b=f/dIx96F/rx5oeNsLVZir0GaXlC/D2CU2NYSItNezNTY1yQ2XrqEo/C2h73h4oh+4mNyZpACkWAch0HMlVCff/f88ig5S4sC3rUmIM7mzjQCuIrqFCQDJ0howxu1wmP/RH1RybY+sY6EOvC0B1LKr2rsiz0pl5ermqzPEQBhHAudCuqwe2v2JUjeiTQSw8NFh7i+39k0hNDAfLpI5hh6o4Q5cDEN5jeTSnvlwu0NmAJDX8DVqU7ADrPuH+qxhklQclkhGWaOX33i/RuTQw3+0q9kAX9yr4u3J56RZUlUbPAG5QHmQW1MsdY+tiRtsAi0/YTrJ5tNHSK6dw/fCp3obg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dX9q8j8NX9h/9vRwrio+aMOebKffHZxdKayjUcKJNSI=;
 b=roajrSB///srq0hsYm2NRDzhY7S83WAgHX1cvVyUJdefBs0HktOAGoPjecZGCgSSf7SDq0ZKNOkrNtdlhewSS5v9CO8x9pLqmwtCYqmEm/Hu4eXJJPBHaQ7Notqqba6N0Es5dq5CPN/HKZUxLAdld7t+AC97TltV5/EFgcHBZis=
Date: Tue, 18 Jan 2022 17:17:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v6 02/12] libx86: introduce helper to fetch cpuid leaf
Message-ID: <YeboKbhW0/M+mipK@Air-de-Roger>
References: <20220117094827.16756-1-roger.pau@citrix.com>
 <20220117094827.16756-3-roger.pau@citrix.com>
 <5a9c0bdc-e996-436d-0b08-b7422f47f694@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a9c0bdc-e996-436d-0b08-b7422f47f694@srcf.net>
X-ClientProxiedBy: MR2P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37e172c5-c600-4309-55e6-08d9da9e1387
X-MS-TrafficTypeDiagnostic: MN2PR03MB5119:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB5119B7F86292741BEED193C98F589@MN2PR03MB5119.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cIU8k02Wpbelll0sav7bwB3Z1V8rnA2HKESdHYzlZwEtCN1wvLPksoVCh5X2CTYdjAnWtxDffSVLeLg9Uf5f3ug7W/xksPMC5DUdncQZ9QYhxyFBcHErG5gNRbG4ezQwiLwCTHnTERKSLkppYhWybIz7Wm2nU3xx+yDcmQ2SBJVd68AakGzvC99bldplq6xIrRkXbd4c0El0D+6KaUIHjibnVY9zOh2Pri1bzehe0XGWm4dOHtkus0We8jkwvi8f+1fSuCkY8WCw2wODmafANntedWFkpCk108AkIMomzVwsdKZ6pIVzqaJfBUacM4YY36JuBre+/aYSs9i8O5Ia67Y+QYhcbcIQhotiKV5e/WPcQ7Hh109beNmGj/Ow7sCasyMrOWjqdonuUfUf+9JAUp/22iFzF5LIJ6HdrN674I4u1nMedpmeQDI3S4AMEuN69G99zVGyVjvzl2cE0rcj78Us6CeL6LWa+73+96XI+fGQfuMPTLQVkY95jQezO/y0MlE8bJlapwHAHhpmSQ0Ta0kqb8E+qhAOeH/7si/S76cR92Wp3ecfLKphUGE6SVjYnd9C5E6naC0X7VL6qXxJam2OJ574Vces4Z8H/gezuCFazTBdhFGljS+y8b6N/2B8uKW5pR9BkiHjyLyIs7jUrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6506007)(6486002)(8936002)(6916009)(4326008)(107886003)(5660300002)(33716001)(9686003)(53546011)(38100700002)(6666004)(85182001)(186003)(2906002)(66556008)(83380400001)(66946007)(8676002)(508600001)(86362001)(26005)(82960400001)(54906003)(6512007)(66476007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1JURHpJNUFDd1NyNlJMUi8zQnRJakFFdUVmWDNEVHVydXhmcHVXeXpYcUlz?=
 =?utf-8?B?MERpMzg1QlZhVldTODA1MHhLSVJMTVcvdERoVUNXRE8vYklRd0dvVEtCVFJE?=
 =?utf-8?B?eE9wdXYySFI2TGhWSlpEVmJDOXJRckMxem5nWkR3dmM4cWUrY2lBL0g3b01n?=
 =?utf-8?B?WFFmbTZIRE91dDFvMFNTUm9OOWtvdHBSMlJNSCtaZTF3dmRxOEJueDdORFJ1?=
 =?utf-8?B?VWc2NjBtcytpbmNITlVlWjIyUGFNWlVaTmI2T2txc1ZObno0SFpOblhPdzRv?=
 =?utf-8?B?TVVhR0xDUDUvYm5aY1ZudHIxb09Dc2ppVk82UUtQVmRNVTZZNkpHQnZqY1hL?=
 =?utf-8?B?NXlkdzZhbVNlYUhDTU9zNFdiU294ZWNQNFI1UnNoVit4ZUgyVUtuYWxRUGd1?=
 =?utf-8?B?MGJYQmc5SC94eWQ1MGw5YmRDcVdadkdEM0NQQ2JUZnl0dmRyODdGNko2OHBv?=
 =?utf-8?B?WnlnMmlDc0RrUDdKMktNOXdpOWdtak84dGNlMElmRUdYa0F1eGVoVCtnRFdY?=
 =?utf-8?B?NjQyWEpMUzNEQ2VxT1RCamRRYWxZYTF2NDdrS2ozci9DMkltNWdzUnY3VGY1?=
 =?utf-8?B?MjhQSFlqRFYveXgyMXZIVytMdE5pU085RzlVNzk1QlhSWFdZb3BoWnFaRUYz?=
 =?utf-8?B?bUVhdjVGTVpZTk4xWm9vUThhekhWdmw0VlNCa0xuYTRDZ2VDSFViTXAwVml2?=
 =?utf-8?B?WTVIR0J2QUhycy9MK211TjRsWEFGVEYwbEQ0V2tGQU9hNnVrbjN5L2IwY0x2?=
 =?utf-8?B?V0VpY25HSnhEaWJhS04yU0ZyMlBoYkhLVTlJajY0NisrdDM2NDdLOWhqYXlw?=
 =?utf-8?B?Y2NjS1BWM1ZhYkdhQWJ6OEtWVE5IVXNaUVJPSllNVnFLY1N6SkEyV0JlV2NU?=
 =?utf-8?B?V2lKbTVlUGk2VXp1TE5HYmd4dnIyazBqSFdVdHhVTGppYWZCQVZqRzZzZG5y?=
 =?utf-8?B?SS85czBDOWNPVi9KU09Paytna3VzQ2ZPeDV5T0xORFc5ZEs2MmI3THdWUXdt?=
 =?utf-8?B?ZHdXcWxrb3AyTElJOU41ckJvb2hEWDNCc1JtMk9LMldRQStZYWxuY1NiNndI?=
 =?utf-8?B?NS9VanAvNm1nQkVsdmh1cTljZ1lsYVB4M0s1aW1SRkJLRWVwZXh6Tk9QQXBk?=
 =?utf-8?B?Z3BKREFmY3VPUTJsTWI3aGtyLys1Z2pQNG9oV0kyR29YZG9ncHVkM1ozUVB0?=
 =?utf-8?B?cksrbXk2c1RIQXpUQ3JSZGYxWmUzY2h3MDdYYi9mNC90Wjl6VVY4SXZyazMx?=
 =?utf-8?B?YmFEY3BYeHl2bVdHWlZrbGIyT1JnbFZnMDh4THo2N3M3bWEzZ21sbEkzdHk2?=
 =?utf-8?B?UExqSHNsckYvaWk2Q3hZUjdldXNrMk5JRzJSMlIvOUJwWGhHSXErQk5uMHNQ?=
 =?utf-8?B?b0MxSVpzSTJqMks5Z2JEZzljSGxkdi96ZjkvYmEza3krZmVoaU5JUkM1bUwz?=
 =?utf-8?B?M0l3WXpiUXJkSzB4K3hVMkR5OWY5V3djYUNrUlZhcEJIMTVIMkxXOXEwQXp1?=
 =?utf-8?B?QUxYekxRZFV1S2NFSlZIeG5hTWgvUytZdEV6TUgzNEh1SW9wdlA5a3kvR3Yz?=
 =?utf-8?B?Y1BDYy9OOFppTzZzZWpHZlVYQjI2OXU1ZWswTytBdDhFYzVGbTdaYTFjSyt3?=
 =?utf-8?B?WXhsSVRoN2lGNWV4dVRTT0t6QUJwWUVFUVdpVHFiTmJIWERPYTZlMHBteFhX?=
 =?utf-8?B?eEZQbmIxTkFuSXJzLy9mYm1GcGE4Q25zV0NNaVp3MlZEZ3llcWw3VmFENVQ2?=
 =?utf-8?B?SDBZMk9vRjRZSGhUNG5uZEM2OFo1ZGFVc0xSUGswN3NRK2ZtRkh6OWpZaWcr?=
 =?utf-8?B?K0hvbmpnaU1CZzlGMFdzSmpvUVViMEFucENvaUtrQW1yZm9CcUNKSGpDY0VQ?=
 =?utf-8?B?QXIrSXdlRVphblhlYUJLOUFPKzJ4MENRait0akJkLy91RmRJV3p4L3FoZVVF?=
 =?utf-8?B?TEpjL0w0UmFjRlVzcUF2SnVsWnpCQXRBejJoM3lxQUZvQksrT1J3SGhzTnc4?=
 =?utf-8?B?ZXFrQ0Z6andwRThvbnFJeTNkRFV6ci9kQlFxNW45cGRBT0NwQ3NsYVZTeHgr?=
 =?utf-8?B?YUowUnVFa0J1YXFkaUEzYVdSOW1qSEVYWmphUEdySU9OZzE4TEFxdnhlcmM3?=
 =?utf-8?B?ZTJNdStITGxEdXUvUHZNTXQ3ZWVML3hpZHJVSDdrQ3FlMkhQSHp6M1FDUGFr?=
 =?utf-8?Q?KGQHgyZrQlLNTnni31aRsic=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e172c5-c600-4309-55e6-08d9da9e1387
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 16:17:51.9303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgkVSv4gaSrKmA2RkbJKSHdPA04nJbN8OwEDJZBhhv8HNRYx9+JQPriFU0muGlWKRDNm/tpQtC5r2yQ0nD8TWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5119
X-OriginatorOrg: citrix.com

On Tue, Jan 18, 2022 at 12:26:18PM +0000, Andrew Cooper wrote:
> On 17/01/2022 09:48, Roger Pau Monne wrote:
> > Introduce a helper based on the current Xen guest_cpuid code in order
> > to fetch a cpuid leaf from a policy. The newly introduced function in
> > cpuid.c should not be directly called and instead the provided
> > x86_cpuid_get_leaf macro should be used that will properly deal with
> > const and non-const inputs.
> >
> > Also add a test to check that the introduced helper doesn't go over
> > the bounds of the policy.
> >
> > Note the code in x86_cpuid_copy_from_buffer is not switched to use the
> > new function because of the boundary checks against the max fields of
> > the policy, which might not be properly set at the point where
> > x86_cpuid_copy_from_buffer get called, for example when filling an
> > empty policy from scratch.
> 
> Filling an empty policy from scratch will be fine, because we always
> ascend through leaves.  This also matches the chronology of how CPUID
> developed.

I'm slightly confused by this. The main point I wanted to make here is
that x86_cpuid_copy_from_buffer cannot be switched to use
x86_cpuid_get_leaf because the later relies on accessing the different
maximum leaf/subleaf fields in the policy object: basic.max_leaf,
feat.max_subleaf and extd.max_leaf.

That would for example make the existing
test_cpuid_deserialise_failure hit a page fault, since it passes NULL
as a policy object.

I don't really felt like changing test_cpuid_deserialise_failure to
cope with the new behavior of x86_cpuid_copy_from_buffer if it was
switched to use x86_cpuid_get_leaf.

Let me know if that's OK, or if you would like
x86_cpuid_copy_from_buffer switched to use x86_cpuid_get_leaf and
consequently have the callers also adjusted.

> The most likely case to go wrong is enabling an optional feature above
> max_leaf, and getting the bump to max_leaf out of order.  That said, I
> suspect such logic would be working on an object, rather than a list.
> 
> The important point is that x86_cpuid_copy_from_buffer() is deliberately
> invariant to the order of entries for compatibility reasons, even if we
> don't expect it to matter in practice.
> 
> >
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Changes since v4:
> >  - Rename _x86_cpuid_get_leaf to x86_cpuid_get_leaf_const.
> >
> > Changes since v3:
> >  - New in this version.
> > ---
> > Regarding safety of the usage of array_access_nospec to obtain a
> > pointer to an element of an array, there are already other instances
> > of this usage, for example in viridian_time_wrmsr, so I would assume
> > this is fine.
> 
> It's a bit of a weird construct, and both GCC and Clang could generate
> better code, but it does look to be safe.
> 
> > ---
> >  tools/tests/cpu-policy/test-cpu-policy.c | 75 ++++++++++++++++++++++++
> >  xen/arch/x86/cpuid.c                     | 55 +++--------------
> >  xen/include/xen/lib/x86/cpuid.h          | 19 ++++++
> >  xen/lib/x86/cpuid.c                      | 52 ++++++++++++++++
> >  4 files changed, 153 insertions(+), 48 deletions(-)
> >
> > diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
> > index ed450a0997..3f777fc1fc 100644
> > --- a/tools/tests/cpu-policy/test-cpu-policy.c
> > +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> > @@ -570,6 +570,80 @@ static void test_cpuid_out_of_range_clearing(void)
> >      }
> >  }
> >  
> > +static void test_cpuid_get_leaf_failure(void)
> > +{
> > +    static const struct test {
> > +        struct cpuid_policy p;
> > +        const char *name;
> > +        uint32_t leaf, subleaf;
> > +    } tests[] = {
> > +        /* Bound checking logic. */
> > +        {
> > +            .name = "Basic max leaf >= array size",
> > +            .p = {
> > +                .basic.max_leaf = CPUID_GUEST_NR_BASIC,
> > +            },
> > +        },
> > +        {
> > +            .name = "Feature max leaf >= array size",
> > +            .p = {
> > +                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
> > +                .feat.max_subleaf = CPUID_GUEST_NR_FEAT,
> > +            },
> > +            .leaf = 0x00000007,
> > +        },
> > +        {
> > +            .name = "Extended max leaf >= array size",
> > +            .p = {
> > +                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
> > +            },
> > +            .leaf = 0x80000000,
> > +        },
> > +
> > +        {
> > +            .name = "Basic leaf >= max leaf",
> > +            .p = {
> > +                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
> > +            },
> > +            .leaf = CPUID_GUEST_NR_BASIC,
> > +        },
> > +        {
> > +            .name = "Feature leaf >= max leaf",
> > +            .p = {
> > +                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
> > +                .feat.max_subleaf = CPUID_GUEST_NR_FEAT - 1,
> > +            },
> > +            .leaf = 0x00000007,
> > +            .subleaf = CPUID_GUEST_NR_FEAT,
> > +        },
> > +        {
> > +            .name = "Extended leaf >= max leaf",
> > +            .p = {
> > +                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD - 1,
> > +            },
> > +            .leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
> > +        },
> > +    };
> > +    const struct cpuid_policy pc;
> > +    const struct cpuid_leaf *lc;
> > +    struct cpuid_policy p;
> > +    struct cpuid_leaf *l;
> > +
> > +    /* Constness build test. */
> > +    lc = x86_cpuid_get_leaf(&pc, 0, 0);
> > +    l = x86_cpuid_get_leaf(&p, 0, 0);
> > +
> > +    printf("Testing CPUID get leaf bound checking:\n");
> > +
> > +    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
> > +    {
> > +        const struct test *t = &tests[i];
> 
> memdup().  It is important for tests which potentially reach out of
> bounds, so ASAN can work.

Done.

> 
> That said, you're only testing half of the boundary cases.  Perhaps more
> important important is the case where max_leaf is really out of legal
> bounds.

I was attempting to test this in the first two tests, by setting
max_leaf = CPUID_GUEST_NR_BASIC, max_subleaf = CPUID_GUEST_NR_FEAT and
extd.max_leaf also to it's max value (ie: out of legal bounds). I
could set them to ~0 if that's clearer.

> Further, it is also important to check the non-NULL cases too.
> 
> It would probably be better to have a single cpuid_policy object, and a
> list of pointers (perhaps offsets) to interesting max_leaf fields, along
> with their relevant compile time bounds.  That way, you can try all the
> interesting max_leaf values (0, limit-1, limit, ~0) and check
> NULL/non-NULLness of the answer with a simple min() calculation.

Then it would make sense to rename to test_cpuid_get_leaf_boundary.

I'm not sure I get the part of having a single cpuid_policy object, as
then we would have to go changing it's contents in order to do the
different tests rather than just having a const one for each single
test that's already setup as expected. Also I'm confused at the usage
of min(), but that's likely because I don't really get the part of
having a single cpuid_policy object.

I assume you would rather prefer your suggested testing to be
implemented here rather than in a follow up patch?

> > diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
> > index a4d254ea96..050cd4f9d1 100644
> > --- a/xen/include/xen/lib/x86/cpuid.h
> > +++ b/xen/include/xen/lib/x86/cpuid.h
> > @@ -431,6 +431,25 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
> >                                 uint32_t nr_entries, uint32_t *err_leaf,
> >                                 uint32_t *err_subleaf);
> >  
> > +/**
> > + * Get a cpuid leaf from a policy object.
> > + *
> > + * @param policy      The cpuid_policy object.
> > + * @param leaf        The leaf index.
> > + * @param subleaf     The subleaf index.
> > + * @returns a pointer to the requested leaf or NULL in case of error.
> > + *
> > + * The function will perform out of bound checks. Do not call this function
> > + * directly and instead use x86_cpuid_get_leaf that will deal with both const
> > + * and non-const policies returning a pointer with constness matching that of
> > + * the input.
> > + */
> > +const struct cpuid_leaf *x86_cpuid_get_leaf_const(const struct cpuid_policy *p,
> > +                                                  uint32_t leaf,
> > +                                                  uint32_t subleaf);
> 
> Examples like this demonstrate obviously why
> 
> const struct cpuid_leaf *x86_cpuid_get_leaf_const(
>     const struct cpuid_policy *p, uint32_t leaf, uint32_t subleaf);
> 
> is a better layout.

I don't care that much in this case TBH. One way or another this is
the style used currently on the file, so it's likely better to keep it
that way.

Thanks, Roger.

