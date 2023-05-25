Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C194710EAE
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 16:55:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539653.840772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CMC-0000Fy-JU; Thu, 25 May 2023 14:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539653.840772; Thu, 25 May 2023 14:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CMC-0000Cg-Fg; Thu, 25 May 2023 14:54:24 +0000
Received: by outflank-mailman (input) for mailman id 539653;
 Thu, 25 May 2023 14:54:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/c8s=BO=citrix.com=prvs=5022a0095=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q2CMA-0000Ca-Sh
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 14:54:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0694db6b-fb0c-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 16:54:20 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2023 10:54:17 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6770.namprd03.prod.outlook.com (2603:10b6:510:121::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 14:54:15 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 14:54:15 +0000
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
X-Inumbo-ID: 0694db6b-fb0c-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685026460;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=CQcQeL4dM6nru1H9wEarA6jMvS6wNi2oY0CLI5DTXjQ=;
  b=arkBQzfHuxgzMYgu8yjJhirIWYqWUfBrZEjqTA9pq0/Sbg/Eyc82nnMR
   AeOHc1faKf7qL2h4yyy8YUfK5KAAmUwhB7eI/yZ5scq1FpMrXGvU73XXg
   2AWrUD56XykAnj8w+YSgRH5EnmeEQ1Pkz0J57dHnqbqWDfd5VPo7Zxeua
   I=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 110294510
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GKHAjKpFbyx1jW/U3EEHVXy5ViBeBmIZZBIvgKrLsJaIsI4StFCzt
 garIBnUM/6JZGL9ct8jOY2+909T6sfXydJrTAE6/3g8Q3ka85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzSRNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGAsSRrY38C9+pbhEcdclMQ/HZC2E4xK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKJEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtKTuzkq6cy6LGV7nAuBS1VcQu7ncKGlVSxRdlAF
 U9KwwN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3PLaXhQv3
 16N2tnvWjpmteTNTWrHr+/I6zSvJSISMGkOIzceShcI6MXip4d1iQ/TStFkE+i+idid9SzM/
 g1mZRMW39075fPnHY3glbwbq1pAfqT0czM=
IronPort-HdrOrdr: A9a23:hsfhPqwI98zTqqmPa3HEKrPw2r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726TtN91YhsdcL+7V5VoLUmzyXcx2/hyAV7AZniAhILLFvAA0WKK+VSJdxEWtNQtsJ
 uIG5IUNDSaNykfsS+V2miF+9ZL+qj5zEir792usUuEm2tRGtBdBwQSMHfqLqVvLjM2fKbQjP
 Cnl7d6TzzLQwVuUu2LQkMrcsLkvNPxmJfvcXc9dmIaAFnnt0LS1FbieSLopCsjbw==
X-Talos-CUID: 9a23:UyA/VGCnU3VPYpn6E3lG00RPQuIuSFmHl1ngMU+kOD80Z7LAHA==
X-Talos-MUID: 9a23:oYShOAiH7KjFAhKeeI9ENcMpKPpl0+eKWEAxqqoZocaaPjNOOGmkpWHi
X-IronPort-AV: E=Sophos;i="6.00,191,1681185600"; 
   d="scan'208";a="110294510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahwcnJP1mTEv4Dl7J5kvEQWlU6eIzP6LMQurKpcEz+M663alUno6mZvJpbjiSnTY93EVVd3GmGlObCn0q5qv8GMoLVfxHbYd9BFn+NvDfR0G9DsITNhdNRpw2KJl1fYgbmZkhx75ltZ3wIdrYmxDe91tEqq0PHRYnkU2qrKJetHzxAw45exaPgyvhAX1d/pnF7KrL0ngBWrJAefm4q7GdRkQIvgDlIhIY/1sh+A8P69l0Si+QeWXUPGSlBNulmcuVjSE1XNvZz0aRR6RonmARJ4aisz6bu0XWd3GCNGOgagQO+eyF2WSkWiN7UBvutL6T8IzE2fUne7RGsaPsZ8M4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7lYlhK5AwmL/nNaSMu10HnFnCudJ9cJnJ6lzC2Kzwg=;
 b=SCnbPMYJth3NZCKNihCUOdWEBK8NdU5WkzhK6YE8pjykAzgIvx5F3QJktZkjbKiV1PoCjugDQ/KaZie7lmVftCS+aY76cTxfyIhOrGZfHmvUVCQC2pnohumoAnEyPVnZr6OMRSq/cdZGLGDHyP/82JD/tk2v0p/YyeCredZbIciBXQIicyUJ0LdKyLjBvLirHMMaRC3VlxtC6Z6kOy0Pkvy9nQBJe7OP1wiLce8JdC8l9Vd9jGEuNAWvyTm70pU5tiUt5uYDfNa9b7BYSIluNWb6JejuBkQpgVL9wZuS5pKZIrWvZY37iGF6ksJzrhRQ6Qx0HMypuRD1SY5BtIHb9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7lYlhK5AwmL/nNaSMu10HnFnCudJ9cJnJ6lzC2Kzwg=;
 b=mc5A5FmfwaKJBgDY9ZSc2OI2AGMjEF+vjexl8H88okrdqRMbaPDJ32d2lffkM9M9tVWqyVBfUJ+PMlFOPtBbFeUxaanfCntP/+j8XHIiQ0adUljEkUs6VrltoQKABYuHo9sWSUUP41Xh4cjhM3mMQ3Suxf1JJp34xE4TbO29kJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2] vpci/header: cope with devices not having vpci allocated
Date: Thu, 25 May 2023 16:54:05 +0200
Message-Id: <20230525145405.35348-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c1ef7a-109d-4854-e667-08db5d2fe8b7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WFoeF/nbM8MpCKhmKVCogzHhpD9ukLvVPkC9AU2a+a0m6NQnTXa64SAqgnStNkBOFtRpYlLfRWQWpVPSyP4CHWmjar/6YOoMzk4wBWc0mviudBkT8zC3XmusHJDEtj48kB+dugyk3P72CNeC0XNraN17YkyIfnZrZGHmdyKOleQwaRH71C0hHnFX7kzQXcFTU0s7L5MZxkH7TBfwRvPCCYZ0jtdT+X3mWVzKCoTuKPX296UtIB7iIY8tM/QGavhaLZxgqVllMnBL2KqNaT6fR7/JjVaPBPiOPhqO1aEVXuuKSLXotlOpennV4hjMxAaDULO7NvD5mBQcpv439Y5XghQvVzcEBBjzJX1qwa4j8NBbPHPc5TeKpHRxOOIiSREFK1Inxo1FUllzThqwCrkmkWwyG3XVnFYXezx2j54umpnSVk0WhShgoRwIEIP0fxr/cI0ah6fNkqT57jg9Gdqzw464Z9+C9jefafsNhCMjki+gOeWr/C/JncPDRVVyID4bcNOZP9CM/Lk5obhDJyEcypAeal5e3UugdOuQbis6CVvGIfmdsPd+0M0gu3bvx8/K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(4326008)(66476007)(6916009)(66946007)(66556008)(2906002)(5660300002)(41300700001)(316002)(8936002)(8676002)(6666004)(6486002)(478600001)(6506007)(6512007)(1076003)(26005)(107886003)(186003)(36756003)(2616005)(38100700002)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkxNcDR4UWNpdzU3TmxkdHdYdXhuTWVCR041MUxGcHp3STNDRTIxY3dwbWF5?=
 =?utf-8?B?NFpBdmMrb3kzN21sbHptK29Zc1FqSUQ0QXVEdkRCa0d1NkNyWTArMTV1eDBK?=
 =?utf-8?B?UUJhaEVhRGxVV1lISFh6ZGRxUjJPRjhlZXB3ZzNWUElkUzVIcEF1U0JQRnJr?=
 =?utf-8?B?ZFc1SG5hdWVNREx0WDdKOUthZE1rRE9RZGZyODk0UGFWUzhWc29zckFCUjlj?=
 =?utf-8?B?NHk3ZWhvbm1nb3kvdnBaWG9pRzR5cDhNWEM2aFFSTFFLaEdiTThpOXpGQWpz?=
 =?utf-8?B?UitxVElHSDN3d0lnbnc2ZFlwVVNPdWtNMDhKd1dZa1hkYkJTT29RTlozcFpu?=
 =?utf-8?B?M2hUT2FGZjJoOFpjMGtFczdmcjIrYWkrRVBkbGRVOGNKbFZtc3V2SXN2ZU5u?=
 =?utf-8?B?cXF1R1BDZTd6SFUwTlJseCtPNzErNDgrWkdCUHdNTW4ydndXazUrd24ybHd4?=
 =?utf-8?B?WmlqQ096VDJxNGVsR0JhZHJvZ2NRcHBiNTAxN1ZOZFViYTJmYjYvczU4K2FT?=
 =?utf-8?B?RzlSVGk2ZGNqUlRXWnJwcHdYTHhLZFBhQ3Y3MTlsWFdZSkJUaHFWRTlrcTZ2?=
 =?utf-8?B?OWRGOWt5TFR5N3FvRWdWUTlRZEJTL200YmY5SkhlWDZwYnh0OXZrVVp5SXVk?=
 =?utf-8?B?OEJVRnJnWSsxK1Zrd2pPQXZ0RFhCY3paazc3MzNLbjZENXFFcWFuaDU1MDJ1?=
 =?utf-8?B?Z2lic0hnUVNtbWxuME14NnRVVU82WjFsNm1kMGkzb3BONE9FUlhIcURtQWY3?=
 =?utf-8?B?SG1keWtrTDF3UEU4Qit4MU9jWGhUdVBpYWM1TlQ2ZnpoWjAxd2s3Q01LYWo0?=
 =?utf-8?B?ZUtjSDdTa2paWDhFbHRWUmh2TlNlK3JsTGFuZC9PUUdFRUNaamU2c1M3c1gy?=
 =?utf-8?B?MnQxdnJ4akhwcXRkVnR0UXBZRUtBaWhmZTVXSTdsVG1jYjhtM3poaTFoUjdr?=
 =?utf-8?B?M3NoSHRKNFd3Y2ZCSFNYQ1RqVWlteXkraFRoM2xtYjMwRWtEODhFTjgvdDZJ?=
 =?utf-8?B?N3c2V3BKdzhJZ1FkdE9QUzNjRWJQd3JsTEE1cG1hSWhPMDFEbndpcFBPdmJI?=
 =?utf-8?B?bThLajJpREoyL0o1b09DVjAveEVySTBnTll1b3Rqc2VjWXM3MnpPamtUY1F1?=
 =?utf-8?B?SkZNUmpIemQvMlFGVzMvUitMU3JOSzR5bHZsOURRVFN1ZlA2SEJPa1ZLTTRn?=
 =?utf-8?B?YjUwWFEzTVFjZjhIMjdwYVJaQTAxUkdnSWh0S2praENZTyszSXJTOS9DSzZS?=
 =?utf-8?B?VHhKekE2aVhwSURsVjhlTk5vZVMyZG9NVjhPM2Z3YjlkeGVWSHVpT0FyaVZ3?=
 =?utf-8?B?c2dWOWs0UW5zcU5CZjg1c29UeWJQQmpCNUlkbHc4em15VUdGZElkcVQwbFo1?=
 =?utf-8?B?MUM4OXI5Yms1MmsreTFHMEE4cUp0a3BhVUhtVmN0ZFpKMzhBU2ZtbC9vVVg1?=
 =?utf-8?B?TVlVSW8xc092OGNySTR4SFo0WmpVWGV4c0RZMndQakdzQjJjcTNNeE9WQmtR?=
 =?utf-8?B?YkdKYW1CTkNDZVNtZ3lyb2I4dDJsN3pOS2pTZ0lHdkM2QUEzL1E1aGFJUFNX?=
 =?utf-8?B?YUVzVXlYSDZIbThiOFdzWXp5M0wvVWNWWTlLaGJZSk5RY3I0eFZDODVRU0o1?=
 =?utf-8?B?bWJ3eDJlc3dodXFCNzROZnVwdGdSVUtyaksrQ0xVVXdOU3RsYXZNQkZPNUFE?=
 =?utf-8?B?SE9EOGlQNVhWNkFVUTZQZi9BRnkrY3pxQkJ2ZUpZdG5EekJMa25qNGxac3NV?=
 =?utf-8?B?eVFRL2wxYVI2NW96Tmp6c1J6MUh5Wk9yMHNPZEFWcEFKV2p6OVlmTFVyTDdi?=
 =?utf-8?B?V1o2Vm1obGhrdEdKSEZFckxlUkF6akk0MVJ6Vm1UTzh6cnEyb0FITDNabmd1?=
 =?utf-8?B?dlRsNFdYQXhnMzltTzVORU5YQ3IyYWhXRmxVaitIcTBETHNNQnlyU2Fwazd3?=
 =?utf-8?B?OFc4OTVVZGQrQjBpazdFdEFka25XckNqaXlvVzdRbFh3Rnd2M0Z1Rm16OVYy?=
 =?utf-8?B?QXRPdiswdUcvT29IWVVyaTIxbWFnVUtwNjNYeGRLVW1uUkxjZHZrU1h6UDJj?=
 =?utf-8?B?Y09zcHA1YUl6SlJDTmpnUUdPTEJZNTdHcVlENVdHTTdCYllxaTBZU09Sb3dE?=
 =?utf-8?B?VkRINnZ1enBVVENxZTYyNDlmenNKb0gwaDc3ZzBCdGJXckFsQ1ZhbnJ3dkNY?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4G151kkwfpBG6o6aOHLRdSRqdxf8hz9Vi7ddlWXiH046SEFKUrqEJfg3QmNAn4TaoeBC9/R7w7Q4HYcKk3eg0wJpIftv5DIdh3ZGQU+8z8IW6GLlLgkR+xjPZZplZF2EsmTSbteZdbbVInr0Xiw80JDFfG59DSQxVoMaAXwsCMAPORbQd+luJ9qlX4g7qKPIBrboXASdWBfO8SGhmWfX4vCm1tmu3FsJxNiDnQR+madcBzBlmV/xYx0Lpc/tTh14NCMXqL6Biuf2Y5pj648fmbR9zkIB283/OtfOq3giuTZtzqiPRLARxy622u9nPPVYt72OkwH3nD0rM0RmVBMimtSmyMeOd6YVQT0RLXqXaQwpo3ntnQXo60iz4vN8z490tNnSJat6hDTBdGfRD4C2ocJHGrNmFKsVbmocoA3f5EBja13QXToBUw9gNKL6/c8IGlxABZslvDIUcMk4AGJZCsq80toTe0pmU10G0g6lKtF7TO3JqCvWrtVuiioV0H2IK6rrNnYno3ZSFVCxJuDG08YnAJAZQnlEwnCjMXHfUer7xdEZzeq+MeYoWPL5oFRstw2OhA830zGG5LSOTeKEHgWG2DOdWt+XyR07Dq7wT2za1HFjW+G3oN7u7SQ4ELYdL2HFWlZ0s77e7YP6WVshypTDfXgx2mGn/uRbvte2ZAtsHmrQui4oI6Y3KUYvLO8RnyguWxa4qB60qe2WOaEWc2KCLav34pLQpEbn8x+CgE4RuYBJq9+816OtdJyhg05lef2hPCuE4FgLllEl+MYBNQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c1ef7a-109d-4854-e667-08db5d2fe8b7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 14:54:15.3867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhHaZjXp+ikUELp7Ztdd08I8mx/osNQAYjvjXeq5FOzL+Hr8BCWFStgvrPByQ2cpkteQPZA3tt8ILPGUoEI9Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6770

When traversing the list of pci devices assigned to a domain cope with
some of them not having the vpci struct allocated. It should be
possible for the hardware domain to have read-only devices assigned
that are not handled by vPCI, such support will be added by further
patches.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Do not mention domU plans.
---
 xen/drivers/vpci/header.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ec2e978a4e6b..766fd98b2196 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -289,6 +289,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
      */
     for_each_pdev ( pdev->domain, tmp )
     {
+        if ( !tmp->vpci )
+            /*
+             * For the hardware domain it's possible to have devices assigned
+             * to it that are not handled by vPCI, either because those are
+             * read-only devices, or because vPCI setup has failed.
+             */
+            continue;
+
         if ( tmp == pdev )
         {
             /*
-- 
2.40.0


