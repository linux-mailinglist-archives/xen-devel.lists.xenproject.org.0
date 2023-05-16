Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24324704773
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 10:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535049.832636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyplM-0000EE-A6; Tue, 16 May 2023 08:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535049.832636; Tue, 16 May 2023 08:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyplM-0000C8-7O; Tue, 16 May 2023 08:10:28 +0000
Received: by outflank-mailman (input) for mailman id 535049;
 Tue, 16 May 2023 08:10:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S66/=BF=citrix.com=prvs=49309c509=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pyplJ-0000C2-M6
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 08:10:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1965a915-f3c1-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 10:10:21 +0200 (CEST)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2023 04:10:18 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY1PR03MB7287.namprd03.prod.outlook.com (2603:10b6:a03:527::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 08:10:13 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 08:10:13 +0000
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
X-Inumbo-ID: 1965a915-f3c1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684224621;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dF8KfOhaku3ezLauOaEsh/qUOMg+0QPae1KGp/NKK9w=;
  b=VB9V/glpYkofJpYKUfoYV7ErGKa0035iGUPMaQTMoY68OsRTXODWY3/B
   z7QgO+7A6HZOR7PJOKKf8rhEgbx7+T/JkzYij1KTcM/FnWJA/mr5BxFUr
   GgPy8H3ECzmwAeHWU5WZX60lkDgU1S4x/NKJE2CWqoUs2VfoVbNibtsE3
   M=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 109193109
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bfG3VahGu5yc8Z+MLIVwVEFQX161gBEKZh0ujC45NGQN5FlHY01je
 htvWTjVMvjZMDT1c9pxOdu1/BsCvZfcz9NkSQNl+3s2RCob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QaAzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQiDwwyYiG9hdvtmp6wbftzj9wSdcbCadZ3VnFIlVk1DN4AaLWaG+DmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluG1bbI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjCdtDT+Tgp5aGhnWU3mEPKkwceWKg4va7rFDgBtxUe
 nI9r39GQa8asRbDosPGdwajvHeOsxoYWtxRO+438geAzuzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiLE+iBPGCOxqH6+8gtT2HizYy
 jWG6iM5gt07ltIG2ay9+hbcnzumq5zNTwg0zgzSUiSu6QYRWWK+T4mh6Fye4fMeKo+cFwGFp
 CJdw5XY6/0SB5aQkiDLWP8KALyi+/eCNnvbnEJrGJ4isT+q/hZPYLxt3d23H28xWu5sRNMjS
 Ba7Vd95jHOLAEaXUA==
IronPort-HdrOrdr: A9a23:d0ka86/UkRuOZFtQSNluk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-Talos-CUID: =?us-ascii?q?9a23=3Ac+wIi2rId0fZvcGmwPLFC/TmUfoCTkLR/UnSGhT?=
 =?us-ascii?q?iJW1OWqKcUW7J94oxxg=3D=3D?=
X-Talos-MUID: 9a23:ExHzLAgFtkbE1PFAZICYwsMpM99l/4b/Amw0itYJue+aa3F+MGajpWHi
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="109193109"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzKTJujN17HvN+LuTFlZPn/dt4wHa/cMMmtxTjZLj09PKxDP9XIUm2gAp8aZ4yXysgmZMvcqUmK8MFm8dnm1Kk8HJLB1HwL3ZhPlqCi0jGuuMJUDDUyU8owdAV7TCedtRA3/I3CAn9f1jdXbnMbtSGn3bvKpcjM4MGKqFlpizTVGLQWSEI8KAxE+t1FWJK167vDZhkDFzC6eTwTsgc/8UNweeIZY3DL7C+DQ9Uxr7bPRHuvsS4EVUNIWgmKaHAYec5xJkknidUqJWwqKdyND6rC9DQEG576our/ukJl61EUbKTnm+v6WDwl/B7MR6rHY6+lEku2ImxmFG590xZXmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOXbb4jEGs6Ot+i5UNfNslHGgWyzA/n6EdKWvgtkWrs=;
 b=bs7EhvvedcKCOOxJj8H2APz6g4V3b01xv8C8kKiv11NXrPizb7a0RDFPLvkIcopSu4sPzF/cUbjk7QUAEWqDy6ENP2asxRcTr7BcLZPBybRfHZxGIp6m/b5nvtBMmYHITAjV//i8rnhA+BRAT6pvL17jzl/fLUKAoQQtashr7TEP22Lws6TaU34jarEKwz6JGn9lCcbXuqIg0ph9EcVDKgpZwJMqQJP00dSFastHUzNPy1paERIv38osq6n9mwuzKqMdYM1gWu1WgDFTihf0qauyRxjilj7sE5iBEwn420aReNOZowkReMF9SlSu9kTV1Z2s2h1cabVZhHkihAKxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOXbb4jEGs6Ot+i5UNfNslHGgWyzA/n6EdKWvgtkWrs=;
 b=lltVDrgRH6vBZIGe4fbW8C6zKkWPVhZMIuXIfEgy6UnFMV35w5Ek3Np9c10WTAVge1S/RSz8Mq0aBT9WvahD1h1Lgxl24RSZJoiE1avUN42LilYOdkq2mGZjQ3BNIyh9qUVozxPMU5nhYSywta2PUj0L+R5FLMzVg20nhqPbkaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 16 May 2023 10:10:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 1/2] xen/x86/pvh: use preset XSDT header for XSDT
 generation
Message-ID: <ZGM6X19p50oSqbNB@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-1-sstabellini@kernel.org>
 <ZGHx9Mk3UGPdli1h@Air-de-Roger>
 <81ac6e51-6de9-5c4c-5cbd-7318cae93032@suse.com>
 <alpine.DEB.2.22.394.2305151712390.4125828@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2305151712390.4125828@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO4P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY1PR03MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: af3bd137-ec70-4083-3f60-08db55e4f978
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	88w5apDuGuXPQ87aE/622rpFGZOa+yEEkcwZPZodclNj/dbn76gb/GWGwjrrmBGEbN6a7e6jHxghrKlQay/tmRe1sCr5YywR+Y6oCAoPUH+i58X+NV5diez6QA2MKgOrxOFZPUDIuyZXwFY+bHjJZ4PqotVJX7PEVI2FiuU4/NJtJpZQAr7+2wV+KMI4X3xs7HU/EBOyKSXHFmt6GzQ/OhIEpgROrbFX80WjnOD8sU7y6VWkRjxJeJaJvFsNRX/6JpwCpnw1u7r84WYfa90Hmealk9t7npaR8bxXvMxnMJ+tP7uw2mbvHoV4Vd87CyDbZHCz0j5PlsKjOJ92kL+wpbF6QbN6SsQ5NrGfBtgq406mbkMG1ve8UMChNeLuRXvLaaJNqItEIqwCcWORyQ6ASYqv/4tloMvOwUG2ZwiXUvUjGCt0avwd1Zi1vUwbcZDvUCOT1CxMoU594MOK8w989xfMPYEbrH1+dF3G3K5Q08EI3AZFZO9sN6U3DVE78llPQSt6pGK5WrtyHuc4jtG0SwkFJxU+emC7cu8TVrXBNjHG51BUEwFAr9eZCJXcH6KT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199021)(6486002)(6916009)(4326008)(478600001)(66946007)(66476007)(66556008)(316002)(54906003)(86362001)(85182001)(83380400001)(6506007)(6512007)(186003)(53546011)(9686003)(26005)(5660300002)(8676002)(8936002)(2906002)(6666004)(41300700001)(33716001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTU1T2VLdG45VDRmWjhqL1duUlovTVN5YWxlSW1wekRvQUJCcVIvS0N1Y2Mr?=
 =?utf-8?B?ek8raVJsV29GMUdKSU1QR3ZvVHBZSWtrb0twdW5iTXhIZ3lFMzJ4K0JXbE1l?=
 =?utf-8?B?VkROK1RMNm85YVpMM3VieHM0Z1ZRRS9GWTNMTHVreitTejh6ZldnUEljaUlJ?=
 =?utf-8?B?cU94NGVlNEpjTUpqS2QrODJsT0pKTmhJMFNzUnFPNzNkVmxIZU9XSU9DU1lH?=
 =?utf-8?B?Yk5TeTFHYTFnTnJGblU4N2Y4UVppTTlVbEJyMVkzVTdTeGl2VFpVMGhEcUJj?=
 =?utf-8?B?OE84RFdCRmo4czRSNHZLY05IS1NlTUgwVk9EOEN5L0RzVGt5L05MRy9pa2Ry?=
 =?utf-8?B?OXE4Z3dPRkhXZTRicjA1dTMxbE41UXVRQXVINFJ4Q2k1ampkU0hhbTZyUWYz?=
 =?utf-8?B?YzhHYmZvMmVuMFRPUWNPd0VRMEh1YVRQUGcyZ1U4Z2xkbTBqeTA3UHpBTHBj?=
 =?utf-8?B?NHNVQzNIN0V1REhTdW95UmtLZFh3QmxHK3FMamZnZkJQampZcm9TVDdRMVVi?=
 =?utf-8?B?VVZkdzNHa1NXK08wUlA4amRVZm0vTFRTSUR6M3g5dFc4U1FNa1NTZDh2UUtE?=
 =?utf-8?B?cTBPWUdvZUlvVDhHam5rbXI3Vkg2RENIUmttR0MyQlU4V1RFcUoyMFE4OUI1?=
 =?utf-8?B?T3ZYbmZmcEcxYVFXRWtzTXorK0grQWZMbHdOeU9QTlJsZmFLTmRaUVdmeFE4?=
 =?utf-8?B?eXhFdnlTYU1kZmVtZU9aNVhKdHhIcU5mUEtPTjAyR0FMVUo5ejN0M1VMSmU0?=
 =?utf-8?B?SzEvZG5OK2xJUTltdkZWVzZCV3l0T0g3cjl3VGZxbTFSbTZDRXBQdURJL0RF?=
 =?utf-8?B?MlV1TGdjMGp4MTZkWWNlTkVyUU42ZnFCbjY3Yys1RmdOdzNyWjFwbnlKWTZL?=
 =?utf-8?B?YWJudit0aUxkbHVSdlB6MkpjZlBqTjdBRTMycVNPQjg1V202QkZEY0ZNc29t?=
 =?utf-8?B?Mms1VGhmMFQxUFo1VnBkOTI1OEFIbHhWS2s2S0xZYlR6cjFlNWIrV25CSE52?=
 =?utf-8?B?S29CellqdUdjdmVGN3RmSmY1UzhZc3lHdGd2d0R4c2dvMVpSOFoyaTdjT3FC?=
 =?utf-8?B?b2xVWVdETkxNcDVMV0lHS0g3WlI3S05oMk9JNFlPT3FkajNqQ3BOYmtXZEhF?=
 =?utf-8?B?cVI0Y3VEUW9SeXJ4U2QyOGZMa29kR1FjeFA5ajZScTRoWnJOWTRDeG5qeER6?=
 =?utf-8?B?OVd6dEQvT2xVTlE2SXMzdDRZby90WCtBekd4SDFWN0tkY1gyNGNsbXRkZzVX?=
 =?utf-8?B?ek5YRWFFQ3pwcUR3bkM1MjR5cGdnZ09XTlZHK3Z0bUdFeXZ5OEF1bE1CTTBs?=
 =?utf-8?B?cFVVMmhYYTE0UG1tdlZBWDhQeTdSenNiaC80WlZCVE9FNVJBMGdhbENWMDBN?=
 =?utf-8?B?aGVmdmVBS1BVN1l6U2d1aFJSbW8zTzRqWnRVMHBLOWxsZEZ1YWpsazhYVnJC?=
 =?utf-8?B?ZHlKMDlQUVcyLzJsR2ozVDdyUVVWRmJDaExEblBDZG9JMzFVR0lMcTg3bHNt?=
 =?utf-8?B?K0ppRTExekVRbkpIbXVsV1ROMDVZc1BLQXVqZkdMdTVQS2x2UTJYc2dsVTF2?=
 =?utf-8?B?QjdKY3BNRWEwREIxNW1BcFVWRE4vN1hkVFcwT2hLaEsxdUFxRk42d3BkaXJQ?=
 =?utf-8?B?RHcwTUVrQUdCM3dCOGMwWTVYWW54ZlBQaHFBd0pvMGtDM3NXL2lJaFprdG0v?=
 =?utf-8?B?b0NhemExYlVBRHhld1lPWEg3c0xTWnBMNTkxN2lvbHpWRmN2NzIvUEZjc0Nt?=
 =?utf-8?B?cy9MWXZURlBsc25EdkFxaVZqbmRDSDluMk1yTGd6eVVHNzlndHovY1haYmVm?=
 =?utf-8?B?bldxTXlwNHpqL0c1Wm82alArbGxJblA5QzRpdmF4M3Y3MGlqMXF1MzY5cG5Y?=
 =?utf-8?B?c2NsQmVRYUF5ZDYyRlNVeFZuYkl2R3BQM29xbUJDZnoyd0dqRlptVmcraFRh?=
 =?utf-8?B?aFkvK1RnZ1lrNGkrMGJyUiswd0VMbUxCY3huL21sUm1sa1NnZDRnL2RUZ3hB?=
 =?utf-8?B?cXMyYVFrWlBodmJPUTlkZFZjQTJMTW4yc0wydlVqVXJQd2ZHSktWeHB2UW9O?=
 =?utf-8?B?ckhFR1kzQlZaUXNMdkZQZjArRDZRK0Rmc2ZqS0o4UUMzbmZjQ0VYZ2w4RGtN?=
 =?utf-8?Q?Ba0QC3MhXYVBZ7KnzPbp6NSCk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xs9ND/e1cXerf7JrkzY3l4Zr8cp9RiXYkfjwh3Uuca/sTOQGOBLj+2O18A6JYzqun3hvAg/1gtwMz42ehWcNSPv7hy9XrSh7DRMkAE4TKs1z5H4weGS/D+GwDeWgt6fcYMqOFJ9B807Cr00vX9fv+kr4s0t4aO0cc7wS90hjYrJ/weEuUue6oCvnWpZVmqZo2Mrf0Gyu+yCZzfnEu4gI7NixwV8S27Gl2ms594XxLqOP5GDt5iUuO9To0fIxyqgZRksl7wCLYkzcnvbUVymEHyuO5GVgDBmDmLQKbzlEZJ7QBEt5CvHFvyvgze4DAidp/ZIh9KYTeCY5bMG/sG8YS9+BAmHkljL+9wru2C/xGRkuWQIaV+jkrxyogzi1Aeu74JEkE2IekCwgzmLQh3goqIb9JR8vqF5pbOAB+gKDKBBPzbnNxSd9ayPBEQOvDpbTSju2jWy4Bt07Zfwwu5sh7B8oA5InMy30Zipm3CKqNzHNowS4EITWcyfRVxlh/AYjCsyCI6X1FnwJkSsW2KqB5PvqIPp0U706S9ty8gbWwnpI7cp0fymh6SezlfRgLhPvze0QlxO0O6ktw08AmcpGFF2qhLneaUC286INe2CUnV13l9W9hSYLFUI1XboeJr7ayoQqDL4S9K/orZcsRmEd2uyuQgBkDxY5mMma00XOie8fDewGzAPZiTMaeEDj4x5PYqNmTMic4EntPCrNsKG5GQmGfB+n+LcnnGu8WyGtnlJdW34mT2MK8gKqK0WvwnnPUWx4dk/KoOqjh4jZCv6Lbtm3aITuMG0DqHBStHvW8kMx8P9kh5Bz7h/MYaOWhpy0kL3ytcnMYEx+ukxScZ7FI96rzkVxfSBCZiOjqY2uCho=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3bd137-ec70-4083-3f60-08db55e4f978
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 08:10:13.2620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNVwBkg30i8RkXNJqhQtUhh121Suud/CaioMPxR9MvdZZOxzqJYMus2ltQn2WKDa2gs63lqSUV3IhCPRkSWzpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7287

On Mon, May 15, 2023 at 05:16:27PM -0700, Stefano Stabellini wrote:
> On Mon, 15 May 2023, Jan Beulich wrote:
> > On 15.05.2023 10:48, Roger Pau Monné wrote:
> > > On Fri, May 12, 2023 at 06:17:19PM -0700, Stefano Stabellini wrote:
> > >> From: Stefano Stabellini <stefano.stabellini@amd.com>
> > >>
> > >> Xen always generates a XSDT table even if the firmware provided a RSDT
> > >> table. Instead of copying the XSDT header from the firmware table (that
> > >> might be missing), generate the XSDT header from a preset.
> > >>
> > >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > >> ---
> > >>  xen/arch/x86/hvm/dom0_build.c | 32 +++++++++-----------------------
> > >>  1 file changed, 9 insertions(+), 23 deletions(-)
> > >>
> > >> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > >> index 307edc6a8c..5fde769863 100644
> > >> --- a/xen/arch/x86/hvm/dom0_build.c
> > >> +++ b/xen/arch/x86/hvm/dom0_build.c
> > >> @@ -963,13 +963,18 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> > >>                                        paddr_t *addr)
> > >>  {
> > >>      struct acpi_table_xsdt *xsdt;
> > >> -    struct acpi_table_header *table;
> > >> -    struct acpi_table_rsdp *rsdp;
> > >>      const struct acpi_table_desc *tables = acpi_gbl_root_table_list.tables;
> > >>      unsigned long size = sizeof(*xsdt);
> > >>      unsigned int i, j, num_tables = 0;
> > >> -    paddr_t xsdt_paddr;
> > >>      int rc;
> > >> +    struct acpi_table_header header = {
> > >> +        .signature    = "XSDT",
> > >> +        .length       = sizeof(struct acpi_table_header),
> > >> +        .revision     = 0x1,
> > >> +        .oem_id       = "Xen",
> > >> +        .oem_table_id = "HVM",
> > > 
> > > I think this is wrong, as according to the spec the OEM Table ID must
> > > match the OEM Table ID in the FADT.
> > > 
> > > We likely want to copy the OEM ID and OEM Table ID from the RSDP, and
> > > possibly also the other OEM related fields.
> > > 
> > > Alternatively we might want to copy and use the RSDT on systems that
> > > lack an XSDT, or even just copy the header from the RSDT into Xen's
> > > crafted XSDT, since the format of the RSDP and the XSDT headers are
> > > exactly the same (the difference is in the size of the description
> > > headers that come after).
> > 
> > I guess I'd prefer that last variant.
> 
> I tried this approach (together with the second patch for necessity) and
> it worked.
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index fd2cbf68bc..11d6d1bc23 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -967,6 +967,10 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>          goto out;
>      }
>      xsdt_paddr = rsdp->xsdt_physical_address;
> +    if ( !xsdt_paddr )
> +    {
> +        xsdt_paddr = rsdp->rsdt_physical_address;
> +    }
>      acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
>      table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
>      if ( !table )

To be slightly more consistent, could you use:

/*
 * Note the header is the same for both RSDT and XSDT, so it's fine to
 * copy the native RSDT header to the Xen crafted XSDT if no native
 * XSDT is available.
 */
if (rsdp->revision > 1 && rsdp->xsdt_physical_address)
    sdt_paddr = rsdp->xsdt_physical_address;
else
    sdt_paddr = rsdp->rsdt_physical_address;

It was an oversight of mine to not check for the RSDP revision, as
RSDP < 2 will never have an XSDT.  Also add:

Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')

Thanks.

