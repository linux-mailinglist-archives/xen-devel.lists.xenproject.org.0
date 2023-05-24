Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0230070F8D1
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 16:34:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539086.839619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pZC-000412-Mc; Wed, 24 May 2023 14:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539086.839619; Wed, 24 May 2023 14:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1pZC-0003zN-Ix; Wed, 24 May 2023 14:34:18 +0000
Received: by outflank-mailman (input) for mailman id 539086;
 Wed, 24 May 2023 14:34:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8ut=BN=citrix.com=prvs=5011a8a4f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q1pZA-0003zH-ON
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 14:34:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d2f4b0d-fa40-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 16:34:14 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2023 10:34:04 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5225.namprd03.prod.outlook.com (2603:10b6:5:24d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 14:34:01 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 14:34:01 +0000
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
X-Inumbo-ID: 0d2f4b0d-fa40-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684938853;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=EcNIaQydvhtXNlRaBXSKnKItdCmNhbyp4OJLBjZxCnc=;
  b=VpeAVR+1yj6XPXPfeRj4u+aORWwBCnGmd6y+ZM8UffMlbjkvM1s0wXsY
   JO2CON84h2xXd68o5AWEXgNzzKek9bPhgl3ZNO3OlT/Ev1yc8YwAzdwqO
   bCX7Aqel4SzUX03MDWBX4wdO0Um1rtnVuHI/iuNH4Yn5ltaoWItxK81l1
   I=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 110637046
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4NFo0qjiH0DJktbdWkGgk/U8X161QxEKZh0ujC45NGQN5FlHY01je
 htvXWHQaPePYGbyKd5xPY/l8xgHvpOGmtMxHlE9rSg0RSMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QWCzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQlKjQAcACmjtuKnpGaabJvt5Q5Ksn0adZ3VnFIlVk1DN4AaLWaGuDhwoYd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluGybLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqiANxJS+XkqJaGhnW69EcSJT8ueWfn//iAsGiRQf1Vd
 Gwbr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9YWqU67O8vT60fy8PIgc/iTQsSAIE55zop9g1hxeWF9J7Svfq0pvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzt6sowFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:HYw6362GYtL4SSGh5oWOBwqjBIckLtp133Aq2lEZdPWaSL3gqy
 nIpoVh6faUskdoZJhEo7q90ca7MBbhHPJOkOss1PKZLWrbUQiTTb2Kj7GSpwEIcheWnoVgPO
 VbE5SWY+eAamSS4/yKhjVQ0OxN/DBEys2VbCvloEuFhDsFV51d
X-Talos-CUID: =?us-ascii?q?9a23=3AGGYfrGtQABHbJ0s0w3HZJ9eO6IsYcHnQ0mf1Kna?=
 =?us-ascii?q?EV0VIa+aWeA+K/qN7xp8=3D?=
X-Talos-MUID: 9a23:zi66lwumHzKjwUCEe82nrQNJNepK24iSVB4MqK8glNOrP3NQNGLI
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="110637046"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYaPZRjsLMC6Vj+WMKxVqm2Psa+NTAInsCE278gsyCqswtGnCcEttnjjJmb9rEp85bGfwPE0Zi7KxW+7K5riLVNi2iRf5PcwWInCYyjjWtC5QVoaystvMvNwFpmqU0nq9g8Npq0TPO5x+FUun7M8/HhsomTTHhPA2CT8RAzwqw+/ESNtFbLFFUpmjliULrXFTcnu3whMgzYmhOycRFHd6diEJTV5AXxQsTXTSLPCZvhVFS8VFlXSB/s9URP+dqJ0l+FrfUjJnGrtgCyxh6nhyZ8EuL36y6yPY1uoPEUQ3q1dnBys+o4A8TypP7Av42uOi8NYhqC+DQ6yWxvxYkbuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evojdKPoO2vv7sqJFZpt7vipqjpyXG9GSYbmRyw6PoA=;
 b=CdehBN+XqJNfCtXa/5ny9GT6lRkl/W8qqWDyUhp5xn1QJWFLRDXbfrqnTjNFvtciDNIN0b3dpXE+qrWImcst07otmfxd9l/Vv4Jz7KLKKPa/PTw86Kkst5309q6uANUY354gLt24/OiQl93Dsa8DPsMqzyPNmBiXdhVX5uRgOOZr4RVeCjgel6IBp9czG6MChy9tFgNFh1Pu+QTSwyEyxwfBndVtR7Vjvr2kyfREFNEhouKOtS8Oy8Lw34R93xyjnERnaS5oKE7y6R3NpfGNhHSCmvK+TgXpA1E+bkWTLGRzjO/SDWAZf/gXtSuV3hu7fJv++47oqr0qUke7WltyjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evojdKPoO2vv7sqJFZpt7vipqjpyXG9GSYbmRyw6PoA=;
 b=mqHX5TuaxsBIf7mk8sCESw3HzBnT2sjFVWU/RKrv6RQ6gnmhHBNse5GJ0xnfyY3KWIGj7vTZJToWMdjwK5GL1FFAKPU5hFuTPb7+Q5CHwb5ccAY80YtCuSX57WWgNjIYfrY4pvXfnulz6TRR+Oji/lThF3tzui0VOkCVhAdhK6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2] x86/iommu: adjust type in arch_iommu_hwdom_init()
Date: Wed, 24 May 2023 16:30:50 +0200
Message-Id: <20230524143050.17573-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0175.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5225:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d94a729-7054-4efc-f34c-08db5c63eace
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nvOTsWC9d0spAP/WRLAv4EiHPCCbowTtDwjdMaYkSxJg6eoSoG4E17PyH2Exn0eAD+Thw4X83R+yTB10Y5vlVbIPmVODya7PaKQmGDgQ5gOnTOiPlAGzZaUFVlXVzjT2amvpmwAzqe21GhNtsvC19XJYkPrlLaZMmKrykytP3GG+HxrDtxBEasLjf7bwyDGg+8Ooo6hlXiQmG2itfAuCF4ck2KKbuIvrS3/OY6Z7nxdtUj4TwC6Y68YHBZjDeAqWhORHCOP2pPRiOTTsy8GAxo/INI4lskQZxPjXbv6I26b/QUy2powDI1twf/2oosV+I49DUf3ORviK2N7Y+fRxiV+fYHRtnn790grGUZkjmzj8D+NzVFX7uclkEP0XUBUZDUsmhke1w7LdJitUSw79q2FVVBC5N6SwVEgZX+okGSWs6S0JxAAiYwbF0C4RXBiDwCtOPe907r/5cfC3GiR6+U+zhuw7dR/ZPWSmZhMEw7tXLerEkCONWB7//AxUGHjvB7LO/sk8X25n/NP+DztLapuHNo2ppg59Cvdl9gb6w7Q17xY6fVVMfoOHt7YQpUHk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(54906003)(38100700002)(82960400001)(66946007)(66556008)(66476007)(478600001)(86362001)(6916009)(4326008)(316002)(6666004)(83380400001)(41300700001)(6486002)(2616005)(36756003)(186003)(2906002)(6506007)(26005)(1076003)(6512007)(5660300002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXFZQ1RaWDFMSGhycWEzUm93NW9OK08zOC9zSXVkTUZaa1FXamxra21VWUJz?=
 =?utf-8?B?eTJycG1FYmdRVTlPUENkeXdieWhRQTE2R3NXVTIrQXQwbnpucFNGZVdPTjdk?=
 =?utf-8?B?WnRkUFNiOGpjR1NzRVArTGdoQ25iMC9HL3dFMzh0VVJzbDN0bjJjajRhQXR0?=
 =?utf-8?B?M2xUWWVpWEVmUktLdTNZVnFTaE5RbUE0WGFONGV2bkllZWYyWi9JTXhvR0pX?=
 =?utf-8?B?RWRyS0ZiR3VkeFF6U2s1YjYrNEZQLzFqd2piNlZPdmoySW5ZUmJjY29icm0r?=
 =?utf-8?B?THFPQUtoTXgxVFpzTVhBTW1MclY2ZFZnZ0tnamkzZzU2RkpvMjQ2N2d0cDhE?=
 =?utf-8?B?eTJmb01OZlJuNlZKWHRSRnc3dlQ3b3dDdEMzdHBvTTZ2SFZYTnExTjRlUXVm?=
 =?utf-8?B?SzRrYjFjY2VFKy9ldU1xS2J0SjhrUDVIenlwWTY2b1pKdnhKTVpON2IvaWtt?=
 =?utf-8?B?bjFSUnIxYkdUZTVjVEhwYVdyY01XN0Q1OUEyaGVOT3RvL21LeUFPajFNRUtE?=
 =?utf-8?B?WENFbVA3L1NvdmpWU0xKTkpUb1VZR1dFcHV5dzQ5UHo1UXFQVktXME5NNkMy?=
 =?utf-8?B?bFdxTy9qSmFpTTFOS211MWxxZWRaZVV3WEp2UXRtcjZ6Wm1WeS9VR21wSG5z?=
 =?utf-8?B?Z1cyeGtWblhHcysrY0pxdStIU0RqcmtNZjNZdVFuOTJwamdhNU5VK0Zub0p5?=
 =?utf-8?B?STJzWkc5R0xBbGlEajJOUk40TFpXZnora2YwY1duTm93c0pFWFFuZEVYM2Va?=
 =?utf-8?B?QnYrTjQ4WDhxOEhNd29IQ2Q3aHJoam00MDRsNmMxa3JRTGtDWCtEUXplVTlN?=
 =?utf-8?B?aDBDdHNpclVNL2FzL3BoaHJIKzcxcHpQMjhKdFFUSkFlNzk2OWxXdEdDSUVw?=
 =?utf-8?B?Ynl1R2VyWUlQOTNqTTdZQW0xaGZsL2Z4NzlJR1lWZWlhNUlZSVV6aWNwWGpk?=
 =?utf-8?B?WDlrYnlKeXFvUUJyRWg5Q0pOVkdUc0NKSFJTMnFDK0xWQWNhbGRrbHhoQWxY?=
 =?utf-8?B?c2doMnpTajBtQW1jQUdsZWNESzFWNDJFMkVxR1VUd2paOTBDbHJ0Ymd6WWFT?=
 =?utf-8?B?NXNHYXhVbHlYQVlIOWJ3Qlk3T1ByRmM1OC9wRkx6VlMwYWY0YnBObW45dmQv?=
 =?utf-8?B?Y1BOVmVNTkNqNGlaRVZrRTZUTXdVa05WTFlYWGtuZFAvekRNazMvNVcwRHFz?=
 =?utf-8?B?cURIOGN6MzZHUDRhTFZobU9hUUlqNUwvVHZINEdUMXJVVlE1VTdwVElISW1x?=
 =?utf-8?B?K1ZLenozYzk3RS9tekNaRjhCeWdFeTJSekg5R0diRG5WTkhlZjl0UWtERmRL?=
 =?utf-8?B?NStaTTBQZllDUi9hMzFkN0l4MDcvWkgyNC9hQzdBMytkSnc3T2JlNXNrRnY0?=
 =?utf-8?B?cXd5cXJqZ0xaeXZWM1l1K2hvNjBlRDZwWVhkcjVtdm5WQkhKUElGVmhDcXdD?=
 =?utf-8?B?ZHUrUG9KYzU0NXp5VXFZUi9hMkFLNzZWaGt5aGtSbDM0V3NaKy92aUNydzhG?=
 =?utf-8?B?NDBhc2ZxcnI1M0dtcjZLL0MrQkVaNUY4OUN6a2RlVHJxV1BFd21FNGRWNGFs?=
 =?utf-8?B?TWttSUpDSmRrNGFYanNKNmlOODBITkFLc1NQWXQrV3RWUWJEQ2xaQUZxVXBE?=
 =?utf-8?B?QnhNbGtuVFdaWHFUUHBEdXVDWkNSMVVsNG5UcGJaOXpIbUVrVG5meVdRMTRP?=
 =?utf-8?B?SFFTaVVxdGV5ZUxVdDJITEhPS2Zod3czbWlMNkwyNk5sTnFnZDFFRjhuTVJJ?=
 =?utf-8?B?MkVDZWlPeEVKeDFxN3QyZktvQXlXaEMvRSs5eDFXblhQMTNaeDFza3JMTkl6?=
 =?utf-8?B?eFdhdnNJeFFhYmZiMlJESXpNMUtnUGJlZ21oWFpUTG80eWgraTNMaDJrRWd5?=
 =?utf-8?B?RytmT0gyNFNhZGJ6Ky9UTS8vcGtHUW1Ybmt4MURrVTQ1RkNVTDRoQUJpSy9B?=
 =?utf-8?B?c1p2QVA2WE91YmozWm15YmZOMURhMGEvNWpKdWluTjlTdGRrUW5NR3VFV011?=
 =?utf-8?B?em9scVZPOVZ6YzFmT2Y0UHIwdVpjYWgreWRCMGpYK2hBSzhBWXozZTRNTm1q?=
 =?utf-8?B?aGtxNTJPUXRHb1JITnBMT3dlZGF5ZFNUbDBrN3dHbElweTk3cTlpQkYxZTl6?=
 =?utf-8?B?YjVKYU1YYU5nWjFRSFhXM0lRWS8wT3NUZm9wQ21jdm5oanBpS09nR2tYUFFz?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cFK7XwTv3jPX1PF43oqpGlFugnauwn6MWvfLMy0Rxm6p9rJWDKuYn21jbZ3ejDuWPPpDDHqV4v5vxnJh3WGF4j+LtkPGDoIcMCakcTWNpI9pj8Cgj0mnmlLYJhnnAnDsFbq4Q1NtticnVHD4pgTaR4U5NaScwhi0E3zk5w+leQQ2hft2UswZ/JbfE4h4LdAY6IYWacJ0qlNoVE5qoRdkziiXm//7ZRaUGyvsGGxO4ebE4IyVGnGLtkR13lZFSZ0Y/uRBWFlbyXaobInmKerRmaOKbNnuX5IuvJrRzMCZSMQEWHD393qDjZpVHgaD+/a9+mX/1M7pIP+ojaH/XRfXhP5/YBjD8agJZZCbX4ydc/D0obl2NYh2Omt+qhbcf2s9IPrsHTYivHxXkyj21eJe9zVWBLO1bF/9WGh3g6BNMsFSdegWkI8a9Zs6eNSwtQ8HfaiW9C9AfVLHgYz8u2a4YGi/nhLi2DR15iO76Ro2qynNcEYPOkr6WVk3yT2RXm1GHchvvO/ArzeA7IVI2Sip+KpxNaIFB19ZJU74qEkeQT962DBaBwcTByMYDIJYbXQu/ARbInqCbOEXj+Wxb0lK+cHXLVsDPFlE0/P0dQU/6e4eiuZHhq2Lm68VsVCsqhgJ9Ap76yQtic21Fs8E8z/HbUk8B9u8/kj1cE7EyGU3eh46PUZyhSJyyGqYQ/FIZgvCTxiDU0m+s01OlIGsgjD4dQzrG6xC6af5eYnpz4I0nR9Kc5tc6cCs9wBUTbymi0va43tzL4bzwVK8+BmUO1kvtckfODjVL/xL5Qwst1LnqtEVJl6WcypgqEOajVCdFJEd
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d94a729-7054-4efc-f34c-08db5c63eace
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 14:34:01.5604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9vz2shIq29QaA97Ld4cOTgwuUIk0wI0dhoxngr9VcyH8KiLySwQ7+RRjfoZGuMPzA6RRQY8y5juGR4cxZ+PeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5225

The 'i' iterator index stores a PDX, not a PFN, and hence the initial
assignation of start (which stores a PFN) needs a conversion from PFN
to PDX.

This is harmless currently, as the PDX compression skips the bottom
MAX_ORDER bits which cover the low 1MB, but still do the conversion
from PDX to PFN for type correctness.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Soften the description as it's not an error.
---
 xen/drivers/passthrough/x86/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index cb0788960a08..6bc79e7ec843 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -406,7 +406,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
      */
     start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
 
-    for ( i = start, count = 0; i < top; )
+    for ( i = pfn_to_pdx(start), count = 0; i < top; )
     {
         unsigned long pfn = pdx_to_pfn(i);
         unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
-- 
2.40.0


