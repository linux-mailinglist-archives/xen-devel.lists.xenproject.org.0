Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FE36F44C3
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528596.821958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptplz-00010t-5g; Tue, 02 May 2023 13:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528596.821958; Tue, 02 May 2023 13:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptplz-0000zC-2o; Tue, 02 May 2023 13:10:27 +0000
Received: by outflank-mailman (input) for mailman id 528596;
 Tue, 02 May 2023 13:10:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptplx-0000z3-Gd
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:10:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b19caf54-e8ea-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 15:10:23 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 09:10:15 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6013.namprd03.prod.outlook.com (2603:10b6:5:388::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Tue, 2 May
 2023 13:10:13 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 13:10:13 +0000
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
X-Inumbo-ID: b19caf54-e8ea-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683033023;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MLTij1A4AGgMlMo36T9Wt4Qj75z05q5Hq5R1l5hi9LY=;
  b=h6eJw6Q4lvP8JFrhrk5eRk9ydzxSNLRUeKMqg9kLd+lbFaYPBercUMm8
   mhzutk6SBqRX1buUCjC7LT2Mc/0faJFQVh6zZFLNei31k6oTKPOzr3YFM
   n2yiCqCpCSIKyAROnqeFHWQMa4Jie8wyZngWzdslEPeDCrn+ehM84BxMN
   k=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 106330959
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7oYHTqACK8wkChVW/9biw5YqxClBgxIJ4kV8jS/XYbTApDon0DdTn
 GIbWjrQa/mDNDOmed1zb4TnoRgD6pPWyYBqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/aFrP15Bx
 /gkMW4xbE7fhaWI2rS+Rbw57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDe7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqiz33beewHKTtIQ6L6Hk3ORQhEyowHEuBxEcd0DgreGzhRvrMz5YA
 wlOksY0loA+7FeuT8X9dxSgrWSYowUHXN5ND+w97hrLwa3Riy6bCXIDVSVpc8E9uYk9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt4dPuvYUyhRLnVct4Hei+ididMTPtx
 zGHqgAuirNVitQEv42g5kzOiT+oopnPTyY26x/RU2bj6Rl2DKa6Y6S45F6d6uxPRLt1VXGEt
 XkA3sSbsuYHCMjUkDTXGbpSWra0+/yCLTvQx0Z1GIUs/Cis/Hjlep1M5DZ5JwFiNcNslSLVX
 XI/cDh5vPd7VEZGp4cuC25tI6zGFZTdKOk=
IronPort-HdrOrdr: A9a23:H+bZBqmszeS+IVs//9cWkMZOspXpDfIN3DAbv31ZSRFFG/Fw9v
 re5cjzsCWVtN9/YgBCpTntAtjjfZqkz+8S3WBzB8bGYOCZghrTEGgK1+KLqAEIfReOjtK1vp
 0QFJSWZueAdmSTiq7BjjVRRL4brOVu4siT5Ns33B9WIj2De8lbhTuQEG6gf3Ge7TM2YaYEKA
 ==
X-Talos-CUID: 9a23:slJ1Z2CuWA4nM5v6Ey4g6HArFfIhTmSD8HWOf03/N3xvTbLAHA==
X-Talos-MUID: 9a23:nY37hQqWsBZAQ7tzByEezwp+aO1y2aC/M0YQrJoKseufbiBoMTjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="106330959"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFyDtxFMI5BcUyRjwWhOm6ZQUx9JZ+CZdN8MukvFFQSjUdtqgCVWlJVlAcDjqNs8/TRjXVzPadrcATJnAd/g21GqAWu5EmKmaKU7VAC/n8D5lnohjg6qm51aYVfWqJPyPmVpCo3ggRyecGpoPa3+igJWiX9/AZR7mMU3r9+hbVDpNTC6yMKjGbjoYaATrc5bDqRMad0I0UswgXA2QIRTZU4xQViMv/yGn1Ib7b/ORydt5iOWkGti8X7gEWqgH9HaQNVtA32VD4HfnGE1jOC1VSSWth1xWOFlbUgnpOYTLpI45NjLZml0KGaEkd77Dq57SSepxf2V0DCMGWcoKeg0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnyaevPHt9hCzAcJesQfdl7YN/uqEVelGTTDFPY2XNk=;
 b=lGuhUQK+M6uSqWMO/N0NnDf5XPXAlt1y4eLybdpUTxRa596ZWpFFtjDnkDCyJMo5v8pxPgnjzY7Uke2VCyHDAsNRlDU3rfiSorBo7Y5iV+ibA4SBJB8OwS08Ttt8npfNbfjuu+ofmwNEaUbYG4MXhcJTgwjn8mATAUS8I57VZazBkrJa2T3iYRHWR03jH4P21GaHWZSkUliJ7bs3bTfUZi4H/vbfdyhp6MRDJBaVCQSWYxTKSQ+M0AIZyiUl8sE8UFba8bDUbSyphzr183xxqV+7FajZBDnqdqcWu58/ulQTac/4okl/X/I2P/p6JnlOg8M9EEY0xs6odCbNabD0tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnyaevPHt9hCzAcJesQfdl7YN/uqEVelGTTDFPY2XNk=;
 b=CspUmLAaxzHAmRVoplMQfH/XvFn/MyvB3VoUokVi5FvWPQC6Xm4Abpw3YPGF/O2BfTyDQ2DnEyAwZrISdVrryes8YA2SD0RsgdrtCbq+rR/4wSsGKo8mGU0qgp+D2ieV3vwU772ISeU8/eKh86bziEq3B79MbrrKU7mlx6EjqZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 May 2023 15:10:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/sysctl: fix XEN_SYSCTL_getdomaininfolist handling
 with XSM
Message-ID: <ZFELr0BYpMgX9CzR@Air-de-Roger>
References: <20230430144646.13624-1-jgross@suse.com>
 <0c01a75d-8a98-3931-28fa-68ed373e9a2e@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0c01a75d-8a98-3931-28fa-68ed373e9a2e@apertussolutions.com>
X-ClientProxiedBy: LO4P265CA0280.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b812388-0d10-4fea-4791-08db4b0e90c3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A284q4kta1n9fTTSN6C8Pz8YvnOENCFWrSpiO8RRAqHJeRNqT61uxpm1axYR7xlxUjrMvR1RmTqGXW4Fq+lLKNll0doD1lVYKds3Q7tCqpV1CuToSe0FKdGRLJo71TUL2CyXkJKaht/fnVXBY64s2mk5W+LHHxsfQx68gMTD40OlUDDFmdy59rJFx/q6tRcM7hxqeFk1JwCCeYQ82a69CecqoaDBg9BIkdyMSqnPgsHlyoHvUj/xd8th5Lt7kic6KtHZs8spDPfZ6vudymDwg6huTLRbOS/qQGQSthCVABxobJ+SBxYC77yIIXQ25q5KBprqNQOFDEfYTaHThD9TD7CNIp9JkM8bzI6UqgxO3nIY9QplxxRtu0O6pfTWojev1MEnadVib9yEIZhZlwaxhhnfvruE6+ODsndksjqlkDnqGlnWEpxmXAb5yKZ5hPb0CYKQ2bSXzKVTNSVoj8aV6slmuqOUlEp08XYmRsz28t42lame+nMtcyMyati1axvbNt0v+iee8cligFvBscxswaMmwZEftRkz5L3KNUyWTNKMCaCUFoWXtc3+TnvWaUgD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199021)(66476007)(66556008)(66946007)(2906002)(86362001)(5660300002)(8936002)(8676002)(41300700001)(6666004)(85182001)(316002)(4326008)(6916009)(54906003)(478600001)(6486002)(186003)(82960400001)(6506007)(6512007)(9686003)(53546011)(26005)(83380400001)(33716001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0N0Qk9UZS9lTmlvd2ZybEFIZ3dETE9XQlVwRDNnZ2UxQ1hXM1o4dVJUWmRS?=
 =?utf-8?B?UFMxYXFMTE51b3RZUndhakJheWJLcHdVTDlxcm0xbmU1OW1hUlQyRzdTYU96?=
 =?utf-8?B?SVJGV1hrV1VuenU1VTBZZXAxQWNEdXh3UnAwTWlEMEdVOVBROFBNcXdoL1JU?=
 =?utf-8?B?NTRITmNyNmp6YzAyajA2S3B4aCtMSmg5d3B3VWg1K3ZPL0FBSW5ROHlQTjda?=
 =?utf-8?B?dnFranQvODBQRHRVM1pwbEdtVGo2aTV5b05yNTU1MW9CQld6TDZQV2lNU2s1?=
 =?utf-8?B?cXZCV2JLbFZNQnVzSVJlUVQ5SWFDZ05halVaR1ZIRGlMWTFtdlZHUUdjbWFS?=
 =?utf-8?B?RUlVMjlWdEJJT0tyN2d0TE00bW5vMDJFdFlUdUtET1RQck1uNE13cmZ4WlNB?=
 =?utf-8?B?ZnNKczhJVG5YMGhmRzB4SWxPUGMrWE1ZL1lvb2RiYUROWTEvNnBZZThIdUov?=
 =?utf-8?B?eWw1NGIrNllYelJxWmhuYzBuTlBVYjhxTUVVWnVQbW5BbS9GVHBrOFVZQTlq?=
 =?utf-8?B?T1hQdWxDUndSN0JxK3MwdndWSC9TZnR0T0tnN2h3T1NwZGxnQ2ErMDMreU5h?=
 =?utf-8?B?TDhkaVpOb1RWamlsRmNxSFlPWHVGOTgvejFtb05FbS9XMnh0ZU5HOTlVTnps?=
 =?utf-8?B?WTd3ajdmTnBFZVpHTzdVRFpZTFQwTzFQRkl3TFdkZ0J3aW4wRFYrdVRRZFpZ?=
 =?utf-8?B?aTBKajk4ZzFYRXk5TU82cUZ3ZmZib1UweUxFcjJ0c3pQeE5reGU1RTNZQWJJ?=
 =?utf-8?B?MTIyam5YNDNUVVlyTENWYXhGNGowamtzSWJ1MHhXcHdLM2lTaWRPRjlReTI2?=
 =?utf-8?B?Ky9ZdUJHSHhMNkp5bVJkTXRLTThRWExLbTQycy9hZU8vSGV2U2pEQ0k4SzdH?=
 =?utf-8?B?RC9LaXVWMXEvc3oyU3VQMEpvakg1NytybTFIT1dLUDJlcjl3RFVTNkZBSWFy?=
 =?utf-8?B?SVJCbkl3WHR5ajg0TkllWFAwbC85d0VXVkNjSHZydzJSNHVVeDkwMjNwVjBO?=
 =?utf-8?B?U0pGSlJVS2Y2NzdSQWJob1lmUGlDY1haZGlMdVJvSE9kYVNrZEo1RTdBTTNa?=
 =?utf-8?B?SnY4OWxBUnZVVmM1ZGZ6RHpwVE9WamtjSjB0SDBndTdodXdkeVlNSW9aWlNN?=
 =?utf-8?B?UGpYL2EzT0QzUlAvdFhqQi9XZTBsRjFMUXQwbVJ0SGtiOGtmV2JrOFhnendZ?=
 =?utf-8?B?ZXNLcDNjZ1VTRDJreXBmMU5QUHRkMFNzRnBPam9qMEFSOWZVN2RVdWcvUHNx?=
 =?utf-8?B?QjI0eDgzMlNnK21MZHM3dWRrbEhXNzFBVSthRVJVVjFhVExUT3J6OGdsSE1D?=
 =?utf-8?B?akpzNUtBR1B4aVNNVHgzdm0xTUY3VXlOWjh6US9IK1hXeHJPRkFWRlZGcXhO?=
 =?utf-8?B?OThjcllxcmoxV0M1T0FQdktmNmxjSUZXOVk3WVlDK0ZWZk1HSnRPZG9HQkJE?=
 =?utf-8?B?MDN5YVlVYkttZzZrdno2Tyt2aXU3R1hIajEwdm44L2tKaUpzN0kvamtRdit5?=
 =?utf-8?B?Z29QWEFPTWJ6QXM3bmJLMHZZS1U1dG0rYTlXcTZLRlM2MklSQW5tOUt3Z0lH?=
 =?utf-8?B?eGwzNnJuMHNJVTNWQ2dpSWpnR1VLWVBzSFd5YmZjS0thaE9UUTdQUGE5cXlH?=
 =?utf-8?B?TTNlUFE3Rk11YTJSeVhab0VNVklRd21IZXpUN1kzUTZDS2Q5R1JwditMcUh2?=
 =?utf-8?B?d2czOW5tZFlJeitHLzVEazdRQ2lISVBaVWVvRjdwR1ZxTmo5UWhMTlpWdmVu?=
 =?utf-8?B?Z2wwZzRhWFh2anhkQmdkUW9ZNlNLMzE3MWhuOGpoTUJEU1RNaG5EUkR2UFNJ?=
 =?utf-8?B?aGxJUWJuNDlDL3ZvQ2NlRXFWZFZpYWpPdFVpamcwaEltZmFYeFg2RkZCRnVB?=
 =?utf-8?B?clB2UTdOK0x2WmV3S2dQVDNwMG9LTjg2djlTdnBrUHlKQ2NHK2Izck1pVWNu?=
 =?utf-8?B?N3dOR2tzN3hVeVV6WVVwdmhlYUtGR1RWSEtqbGk0c1lSL2dtMVZFTVR2MmpO?=
 =?utf-8?B?STk4Q29kNUtGMXR1Wm5TV3pWSzhaTEhZMzJ0Z1hWdXdFU1JjM1RMckQ4WGlm?=
 =?utf-8?B?d0NVN1p0T3V1YzNnRCtjY0RVNWwvQ3FFay9yZGM3YVQ3cFc1eGM0QVkxbENK?=
 =?utf-8?B?cDUrMEt5bTBDdzlmNjhnc01ldjV4cWhBNWNmZmpRS0RSMGtkaEJXUGdGdWRU?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2VNVuPYfGPrNgiXB7bw4LWeI0+ztdrtDXxwXL2ipUP4sffuIld55GgvPjcRe/HQgrLLYYXEs/hG90C66ucKAFaI9Hn5KY2eMODgGk/iGTKfGLMT+yESFqY4/nx796Q70Ys1+P3tlZQLIJWhQMYxuTqfWXzX1+U/xOgIE/dTOdJwAB+oQ6VLXviGBO5FCO887hmUksDvAmoxJtOmo7gontjvtp1ipk+TVbI6S1vFv03bOq/Xn/lYoKmPluhUak0GAe7GK2MyXlX3WHTIuP2luuzJ+e1BvZiacbGltywwkvcX2e+Z+HHscPLQddAITUMgrtZkPtm1yUFNrJ2h3PByQYd3aQziJY8rwmj83rHR43tf48k9MIksdQY+AcN4srUnv6D8+3prBMeXJmBxaZeCJPj+KKYEZCd8nZOV/yCLafrZw00+csldIaqnDgBviG9ghVTY3PrfCU/JnG2v7B+4FQJDmiRV1Ke3iaZIkrqwQSgPZUPYKMkC2OvwYYZDYs1LtTO/lQh8FwoTMHXdtKPNH5EF2k7noFMhnaPPOCaAZeTRfxQLZItE5lpyThHTtaRm7Rz4vPBJQfSevoiULQ9CpKpAYfZQbZuaKx9iqnO7mdGyLS9ulsR57Z8ShK+azW4OZLCkHWBRt39jV8Rg2iau0Og7Hl9ATYbPCHX3EO/8+H41/ILJXspZoa+juIsNiFo0af7whU0cEm1R7HDrBmyvW6hQ7w6iQx1zZtA/hZlr5JgjnxwVtbD2MuQWhOiarqywWA4EEgY3XD5a+ugEPnKn+pJV5iQ4niEW5+Q8U6tGT8rotonbo3+Amp8zb8IEpN6van5i/Nce1Q5jd3616RdGL40UUA+dQYukk6l2T/xXuW9rpXReCMLqPEvna/geO3RT87A9f5AU2cgxJZbjxO4qhxw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b812388-0d10-4fea-4791-08db4b0e90c3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 13:10:13.5897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypz+UToJ0eskFZI3G0Lp0ZN5SWrpq++JqLAd6ETXEb9jPESZSfEvH+LuVfthZc6Z2k7cPnfDWe4KMN0zA9KIhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6013

On Tue, May 02, 2023 at 09:03:00AM -0400, Daniel P. Smith wrote:
> On 4/30/23 10:46, Juergen Gross wrote:
> > In case XSM is active, the handling of XEN_SYSCTL_getdomaininfolist
> > can fail if the last domain scanned isn't allowed to be accessed by
> > the calling domain (i.e. xsm_getdomaininfo(XSM_HOOK, d) is failing).
> > 
> > Fix that by just ignoring scanned domains where xsm_getdomaininfo()
> > is returning an error, like it is effectively done when such a
> > situation occurs for a domain not being the last one scanned.
> > 
> > Fixes: d046f361dc93 ("Xen Security Modules: XSM")
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > ---
> >   xen/common/sysctl.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> > index 02505ab044..0cbfe8bd44 100644
> > --- a/xen/common/sysctl.c
> > +++ b/xen/common/sysctl.c
> > @@ -89,8 +89,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> >               if ( num_domains == op->u.getdomaininfolist.max_domains )
> >                   break;
> > -            ret = xsm_getdomaininfo(XSM_HOOK, d);
> > -            if ( ret )
> > +            if ( xsm_getdomaininfo(XSM_HOOK, d) )
> >                   continue;
> >               getdomaininfo(d, &info);
> 
> 
> This change does not match the commit message. This says it fixes an issue,
> but unless I am totally missing something, this change is nothing more than
> formatting that drops the use of an intermediate variable. Please feel free
> to correct me if I am wrong here, otherwise I believe the commit message
> should be changed to reflect the code change.

By dropping that intermediate variable it prevents returning an error
as the result of the hypercall if xsm_getdomaininfo() for the last
domain fails.

Note that xsm_getdomaininfo() failing for other domains not the last
one don't cause the return value of the hypercall to be an error
code, because the variable containing the error gets overwritten by
further loops.

Regards, Roger.

