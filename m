Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5317570FAF0
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 17:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539164.839779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qrM-000411-Lp; Wed, 24 May 2023 15:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539164.839779; Wed, 24 May 2023 15:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qrM-0003xg-In; Wed, 24 May 2023 15:57:08 +0000
Received: by outflank-mailman (input) for mailman id 539164;
 Wed, 24 May 2023 15:57:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8ut=BN=citrix.com=prvs=5011a8a4f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q1qrL-0003xa-HR
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 15:57:07 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a07fbc79-fa4b-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 17:57:05 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2023 11:57:02 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA0PR03MB5531.namprd03.prod.outlook.com (2603:10b6:806:bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 15:57:01 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 15:57:01 +0000
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
X-Inumbo-ID: a07fbc79-fa4b-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684943825;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=06QIJvnfgSCYeDpOUkD61jE14yPE/j9gzZT/zZITqr4=;
  b=hVlNhI8QQQOQtVcjduEk5wxlRdiwar9WokIP56F/oTTaYJInHUR4j+OU
   CBuZSldwiQ0LqaxC3TrXlRaN8R2StNRnPoM7MbwULpLasMfLrnU2e/uRD
   OphbBwsLqtCExXfuViuzLqHfeyMxBkEtQ/pqIhXQNgouhEY2aYP3J4sLk
   w=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 110649438
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eJAIu6oQBMTDtJ+gyEqSb/fePC1eBmIyZBIvgKrLsJaIsI4StFCzt
 garIBmGPqqINDGjfNF1YI++9UIAvJLVmIBlHQFk/ys1FnwboJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzSVNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAJTTiKY3c2k+Y+QeOgvpPkIcNPgZKpK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYWLEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtKSuHpqqU66LGV7n4SKAcXc3afmvakiki1R4pbC
 hQZ5gN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq17ayIpDm/PSwUK24qZiIeSwYBpd75r+kOYgnnS99iFOu5i4PzEDSpm
 TSS9nFh2fMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:QR9giq7oGffjTzRjSQPXwaKCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcV2/hpAV7GZmXbUQSTTL2KgbGSoAEIXheOjdK1tp
 0QD5SWaueAamSS5PySiGfYLz9j+qjgzEnBv5ai854Hd3APV0gP1XYaNu7NeXcGPjWuSKBJY6
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbLcAMLHBku7SiJlHeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9uFdGBkc8cLxTrk0KNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4Do0/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjcSCghA8RMqIpFel+BgnBQ9e1U4e
 Zu5Sa0ppBXBRTPkGDU4MXJbQhjkg6RrWA5meAeonRDWc81aaNXr6YY4ERJea1wah7S2cQCKq
 1DHcvc7PFZfRezaG3YhHBmxJiWUnE6Dn69Mzo/k/3Q9wITsGFyzkMeysBatGwH7ogBR55N4P
 mBGrh0lZlVJ/VmIp5VNaMke4+aG2bNSRXDPCa5OlL8DpwKPHrLttre/Kg13ue3Y5YFpaFC1K
 gpaGko9FLaRnieSfFnhPZwg1PwqSSGLHnQI/hlltZEUuaWfsuoDcWBIGpe4PdI7c9vR/EzYM
 zDSa6+M8WTUlcGJrw5oTEWe6MiXEX2A/dlzuoTahapnv/hDLHMm6jyTMvzTYCdYQrMHFmPSE
 c+YA==
X-Talos-CUID: =?us-ascii?q?9a23=3AQ1x8YGmCZx/jNx/ynvvc2QoDDNnXOU+D7EXLeWC?=
 =?us-ascii?q?qMFtCerzWa2K7pLlvy+M7zg=3D=3D?=
X-Talos-MUID: 9a23:B6UlkgbEStuHpeBTpT7MnjBEGeNT7LmuDksRyZEn48SYHHkl
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="110649438"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkY0LQSYXaehWiyvzyNqitoY3vltcjD6pFbFdTsM9BSfDuTtwvl6K0ZkfFONHJQkozhWy/fy8R/iBS/BhBRHkVGhWcWCnQ2BzRHOLRB7OxJJziyUdyRIcH/CNpr2aX6fokbG5yg0u4gqA3Hs1nKpPb4vqSmMoCoB9r66PlQzh+iV0BeFCvtDad9LgwEcSWUOkSuJwZy5zU1qK6oJqyToJP2BYHKDnU0bOgL6QFN2aYeRwbNOzZHwPnIZSd7JMSUBZHdotaLtfyPY84W5IDVFq1iD3oPtZd7m7CUEe0Ng8NABMDHXmZ3Bvl2fbk3+0umvPQpTOVl4TuUdKOX/eDpFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOuUxbvUgvn+5VOn2eOqg0nklFLGERDRMTjiWI5GnQc=;
 b=f+e8P04hOsLu1y4TkTZ80z7tFkK/hO8bCrSCnMGf2xAecz4Wk0jsZ1qoWZExmgJ0meTcDTgYlPrQpyIg2V5VYLol2P0De7i1bcKE8gcVZ/Sv82JGnB5kEuYs13bxE3UFufTRhf7ggr1R4Lm0DZuGamXrSJERaegJ+Hy7CBfoUF4vbbHtQ9Lft0DZMsu2bfNLuoNTsF9QHW4NT1x0bAygrb3up7Q8xfCpcx8TYQ+7YXDNKKpj9ED1huuV0jkfbiE2b6KH+Mv8SN+xhx7Tya5oVKuDnmlTJbALnfOdSMZLSvaZAQIjXMReNPOyZoU5PVSnus2CkauNRQ9gJiOHGUa0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOuUxbvUgvn+5VOn2eOqg0nklFLGERDRMTjiWI5GnQc=;
 b=tEok5xHsMOXazDg33A9RjvwRTPykIr/8CzgSYGM5T1jClwqtgBeznHgl4G0PrH/fLyeMcFspdUuvQk4vcjDsbvRcee0QYHXkqsvHlqd/bWdfzBs6AF/0zysuGCI+mDU4ku0vs/tsBgRDljm7uhT30oNdUr5mq/xE+b4JKE6h2gM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 24 May 2023 17:56:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Message-ID: <ZG4zx+TvUWTCEMh3@Air-de-Roger>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
X-ClientProxiedBy: LO4P123CA0465.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA0PR03MB5531:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c66fb08-d32b-4f6a-7e77-08db5c6f82b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AER3+ifWJbSnaetzj+pMTJdDdddF3JTM15iAza1ikqBZWFH34JDl7xdVChKQ0UGMFkeoXyxFNs9ZAu5xNg268eHMKrcB6v3e6pwPT+oL0MZ8Fti15uYG22frFuZd6wSM7ohN2kGZl6uwsheBGZX4QAfWGmT+H0Vo38D+5Ow4LLvX9aDGcBA5ZWatbtICqaLqn1qxwhZNuq6JraKl5AiB3SXEfmsGG8SdZGZKyUlqwy7Yb13n01DCQ0KgflhZKN1pLplqgyn6ngOLuf9B6BRuSNED1IycClQOqcckr7oioO2167kj+o/thGCdoQ7YlLS/EV7irqGPxfp8eAASlF6tAgenjb0QpcrH2zjgCsqQwE0MnRR54/nd8y8wLvmJyGYQTGhnCKVlvioOoff6yvxM35ny06Rgm7gUd2ZfIyzDmaj1zLHIcm3IEGG722/WKyP4aTH4E/TkwRrDNelKdTmkK/v5saZ3d1qEtdfKX8Oq1S2cJ3RuUmjsaAhD5wFzkGpNwjy0gxD3wfCLtS8x1zZOWjDcrDd9jRbjkWgFxzIe0X9HduwhFlukJtrbLR9GOjxO8Nh6wsey1J+XXfWwsJoCaametbz3gUn8XXdsLpnmBi0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199021)(5660300002)(8676002)(8936002)(86362001)(26005)(6512007)(9686003)(6506007)(85182001)(2906002)(83380400001)(15650500001)(186003)(66476007)(66556008)(66946007)(6916009)(33716001)(82960400001)(316002)(4326008)(54906003)(38100700002)(478600001)(41300700001)(6486002)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek9uNHpmWFJkeExOL2UwZ2Ztcm95a1pkODZpQWlRd1pwekI5Y204a01mejBJ?=
 =?utf-8?B?OWtXZkJtNjVmU3QxMEJXOHlObXhUMktvZjhaMHRYOGQxc3lnODNVT0xCNG1U?=
 =?utf-8?B?c0Jqek14eHF2Vk5aU2ZXK0s5OW9pRTVVUkg3YlNyOVc5aExHdVE4TXdMM1dN?=
 =?utf-8?B?d1lMcEhxeURIalhxVGRjZ0VBenc0NXV1ZmdDUmphL1VLY091OUlGVHB1TXFk?=
 =?utf-8?B?UzhVVGJCMTRsYkRQdjhRWTYyTmhkYlBWak5nSm5xaGNxd01oY0RoK1k0REFs?=
 =?utf-8?B?VDZIN2o0ajFJSlBGL3pValhhc2Jzc1o4MGZaS0NXTEthUjZVT0VvT3QzNDdG?=
 =?utf-8?B?Vm1JUk5HN1RFOWdGdzdEbHlHTWUzcHNlU01BN3FONlM4Q0dtSVdNZzUzZWNV?=
 =?utf-8?B?WkgvTHRaQ0MvUndEbDgrQ0N1ZlQrNmtUYUZLUysxSWlrc2pvemZxazRTcTJi?=
 =?utf-8?B?NUZPaEtsUE1TeVRjdjd0eG9GVEdhcWZ0SC9PMUZpMWJMaHdxNWFjOHlVTEVD?=
 =?utf-8?B?L2hyR2Y0S0EwaldsbVRTRi9vTGNaRWk3OWNyNy9CaDAva1YyODlPT2FubXha?=
 =?utf-8?B?SFN3T2ZNZ1c4NkppOHdqV2tVRVJZc09LQkhnK1ljV2ZJMjBPSDBpUElNMHdq?=
 =?utf-8?B?ODk4Y2VpazJBRWxuVmsvem96SklSV1RPNFk4QSt1WWprUjhVTENoQ3cwaEgw?=
 =?utf-8?B?WGROWlZiNjJvT0hEWjlQT3BEQ3ZZL2pnUzJ2K1hEK0JMTnRia1Z6b1BMM0xl?=
 =?utf-8?B?N3ppakdUVUZpZ3JKcjE2eEpjZXVLTnU1WWliTEF3Ry9yY3pWOGFiSm9ramxp?=
 =?utf-8?B?VTMrSkJBMFVoUkQvWmJLOXQwVDZrdGtJWVZvSnBJbytpamU4azdMU1dkU0pp?=
 =?utf-8?B?V3ljMzRvWmJaR29HeEd4aVRaR25QMUI2Y3hhRlBjcEtDTmdiMkpkSkU4RXZM?=
 =?utf-8?B?aHJZeEhRN3p6bTlZVEcyQXFLbXBFMmpzdGFDVTk0V3A3Tk5nZFF5Zk1pZXJi?=
 =?utf-8?B?NElwK2drdjF3ZVFYclZHVHYxK2FjZnNybWpING0xSnp1ZEoxTzI2Q28yYlNi?=
 =?utf-8?B?NFJ2ckg5MkQzR1VaWGJYbGhndnpRamFvcUhGbXRQYjlJRkVNVk1XTGZFditO?=
 =?utf-8?B?M3REM0VsUmlkNFQwYkdhOUFGSnZhSDFYVEZLNFJUMkd0NDEzdUhzOHVnUmpK?=
 =?utf-8?B?YmsyTG1tb1I0SnFRUU9lVFdQNGZXY1pCSnRFMFVMYzFXOXVpK29ncW9nTGI4?=
 =?utf-8?B?SFlHV08xZ1pjcExiVGphT0swQzkwWUJDeTM5M1hQQ2xTazBVbFRPeDFDaGNl?=
 =?utf-8?B?OENvS1BQeHZQeDNnTHhzRm1ycTRyd0N5dWRJaTV1aWhtVS9iajA1MWxrQVhW?=
 =?utf-8?B?WG1VanhHcmZOdkgrZVhFQWJqY1RqV083ZHhKTDF4TWpvUUhuSGNkb3B1Z2ln?=
 =?utf-8?B?d1YrRGdIdGErY2wzT1F3SlM3Qyt3TTJCTUQydHFvYWxnY0lBVllNeWhZNG9V?=
 =?utf-8?B?dFNHQndXSzhsOWZuZG1kWG1VK2RxNWhaU2ptK1pKaWIwMTFCVTZDOEhraXB5?=
 =?utf-8?B?cWVoajlEUmNOT0RJa0gxbGhXU2R6UldoelFJVUo3ZE5QNUx4Nmt3YTNrVVlM?=
 =?utf-8?B?QmMreG44djV5eTk0TDh2Y0FrazByaWQ3TlBQeVlQZktrdlpaSWI3WG00T0tI?=
 =?utf-8?B?cDQzSmNWSlUzaEZ3YnlNa1RhN2gwUnkrZGZqbk41TDBkL2h4NmtDNlJuS3c1?=
 =?utf-8?B?eHYzQ3JvTDdjVHFjb0NBSWZRSHprWmZlRTdpcWpHMkVwSVRhcXVkM1QzbkZ3?=
 =?utf-8?B?QnJjNE5xYWw1a2lKUVRmN3BjVEg3L3ZLTnNOYmlYbnpCemdtVDdxVTBjczN3?=
 =?utf-8?B?SDRHZ0tocnJjWFB5UUQrbFV1dm5TV1FZeFNnZ3JIcDJpZTN2d3Rhc0ptNHRG?=
 =?utf-8?B?c3ZQc09BVGJ3eTlwb0txbEI3RWlMcWtwZk5MUW1DOEQwRkJaMWR2SjZ3QnV3?=
 =?utf-8?B?djNqdXl3L0JxQTJ2UXM0OTJQR29MbzNYTTdaWXV1QUJuZU1BVXNJOTI2MUFG?=
 =?utf-8?B?V21DbFhZRHh6VHRBaDBwaDdXR2t6MU9nOVRoejM2a1MxV0tNcXdvdTY0aDBE?=
 =?utf-8?B?VExpNkdGVGFmUVZzZit2Wkw4bVBCWE1QREd1NWd0dlMwRHNyS1JreVJTRHZN?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XVRJh9N+Rbf0Wb1puCBOV/Iag4GC60Xg/1+emEZiVv/GAr6QiL+shft1pst45jjwhmB8XhkacyW27PQiBQkJZUQoOA+kwfM9m5bVZNzlWZtrgz2x2ymkMx7fQE8KoH1jF2OdY5eFPhRlmZxzbLbxKxu+rnC9WGngg5jSGh/Fm+R1YABZBBVEUiiaTkZtrc6qfHAx+pJxXvMpFg44HGini+kkHKGkl7yyeJBctciFwKY1Autr4B08Dn6qrsus1y65yIDogIVoPapwNaTdaryLPCAaWGs1osPwCYTV77qCIbozknW1ANUtdYPkDsaPjhxUVK9cuHzM3gHlO4imQz1urUWgZt5PMsM+Y0XIKkuaihSyXhBQ72emxnk1cVBB1I6OGH+cHWom/Ueck7i4kdlKrF3KPSbzvwcl9VSiEiEthBWyoaY7s+/ipWvPxe4ySonx1QqmRncqwQdViCZuaBM5xXgLq1j6Sj5e98Qk3XnYh9pgsBzkQ+RVvMvzyw+JcCIGRLMXnXEn4C/GQ6qLpz26cc/v8Wvu07N/h/6Y9umtYq7cnmfKklc5F9Xc0AOz3+TACVFSWoQJh2L10xN6fAuUeI4dbWGDlbIAip6vxTshllTFaaA5ESgsiezMRLL6WGiCFvrtqKiIMA23dnusdol4sxi6iHKs0poQEMXSzisWDHGjF0LvQHgwSbWQmfw4aMDeu3A4ZuMO1l1s1Yq3eUeHJMxLg9TywnGT9L1OoUid1+ndPSPh4Na9t+1KINAi6N8b9Xd7EOE6M2JvZBn35QajEbBbCW7Qi6WVSjIkdJ0YaSxh18je7gLOMBlykn91/+NPFns4u9f1Hftlr8E+5mEOew==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c66fb08-d32b-4f6a-7e77-08db5c6f82b2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:57:01.0033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHPzm1JLdpU56xy24zMbsMsUvFHuGPYiO23xyc7WjWpAtQOvMGbE8rlbLIjhNX5Uylc+B/XMqLMzvxe8MqyCKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5531

On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -218,6 +218,7 @@ static int modify_bars(const struct pci_
>      struct vpci_header *header = &pdev->vpci->header;
>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
> +    const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
>      unsigned int i;
>      int rc;
> @@ -285,9 +286,11 @@ static int modify_bars(const struct pci_
>  
>      /*
>       * Check for overlaps with other BARs. Note that only BARs that are
> -     * currently mapped (enabled) are checked for overlaps.
> +     * currently mapped (enabled) are checked for overlaps. Note also that
> +     * for Dom0 we also need to include hidden, i.e. DomXEN's, devices.
>       */
> -    for_each_pdev ( pdev->domain, tmp )
> +for ( d = pdev->domain; ; d = dom_xen ) {//todo

Looking at this again, I think this is slightly more complex, as during
runtime dom0 will get here with pdev->domain == hardware_domain OR
dom_xen, and hence you also need to account that devices that have
pdev->domain == dom_xen need to iterate over devices that belong to
the hardware_domain, ie:

for ( d = pdev->domain; ;
      d = (pdev->domain == dom_xen) ? hardware_domain : dom_xen )

And we likely want to limit this to devices that belong to the
hardware_domain or to dom_xen (in preparation for vPCI being used for
domUs).

Thanks, Roger.

