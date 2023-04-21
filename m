Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21A96EA49F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 09:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524462.815417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppl7Z-0007qW-Sm; Fri, 21 Apr 2023 07:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524462.815417; Fri, 21 Apr 2023 07:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppl7Z-0007o0-Po; Fri, 21 Apr 2023 07:23:53 +0000
Received: by outflank-mailman (input) for mailman id 524462;
 Fri, 21 Apr 2023 07:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCD5=AM=citrix.com=prvs=4680c1a37=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ppl7Y-0007ns-3g
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 07:23:52 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7483d348-e015-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 09:23:49 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2023 03:23:45 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5341.namprd03.prod.outlook.com (2603:10b6:208:19f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 07:23:43 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 07:23:43 +0000
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
X-Inumbo-ID: 7483d348-e015-11ed-b220-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682061828;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ty805mIrLDDFvm0+EkffuLtXpPKRDe73cSYUKkrN17s=;
  b=TO8RCqxpJfnWSKaTGaqi9XiHoCMRvIQ5IQNkJFveRZn80jzPzDTz2CLs
   qzVwCavRxfNqlCT/fRKh8AwpFQbpn9fnFUovjuyPNCUEBJYBl4PW6rfKa
   K7BwwCJX7qZX43jmNvaebw5cf4zyDpYnA3pfom03QsUDYxw0o2tJeSvAM
   8=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 106760223
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xuvtYK93uFRLTw8PIqipDrUDnn+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2UWXj/QPvqIYjakKNkjbNy//ElQ7MLUmNRmT1E6/Cs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOaoS5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklqy
 9AedHMGUSvElv60yZbjQOhlmv4aeZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAuuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eRwn2jAthJfFG+3u4t3XyhyW06MxopdGG3uOD+plOUWc0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZCb9o8vcNwWj0u1
 XeOhdriATEpu7qQIU9x7Z+RpDK2fC0Kd2kLYHZeSRNfu4W85oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr8hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:h5w5oKi0xTVofIPLD49gAV5Em3BQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: =?us-ascii?q?9a23=3A1dAPpGqky1nVM+raWsVG1BrmUeQbXnuBj3zvGAi?=
 =?us-ascii?q?pFWRgbOWfSFaMwpoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Aw1cr9g+kyQtXeahXpjam8kOQf9cvvoWcB0EkqpI?=
 =?us-ascii?q?5mvOILDU3Fyq3jiviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,214,1677560400"; 
   d="scan'208";a="106760223"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U41SZ815dtlfwm3UrFmkIz+fmza5hra7YaWV4u+wNl2xnqyRRfYCuWZ4WHTgMDfZGTjkvPjHEGz1nw5S+0BL2piRNk2rA2u95HOGrg6Ul8e32hz0993UxZyJ7jWEymoRj074NreFIzegU/lsL7auESc78Cv3ySY/ZAwUMBTLH4g630mNFJZmXnyamGJ/pFNC2RZUHTC2Z8ATZQBTNsswy2D+D7mLncFG/1+wyD34uKskejv/tMPYPA6KNlU6/85KCQRKYJeL2Yti2lkzwxKl9fQi6N/7ezPfmzmAe+i48Vs4u8Mc2TBfO1Fd1Oi22b/KkqHtuuqcRg/WXv6KcoIzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYpo+T+lEWFbN5SsXB//zMqCdlVvf6dsQVb8KerY+q0=;
 b=jnQBPs91UHzwusOeQLVB36ca2ZX8VzHZCvxIe52eWT3TQHBMHHZXfri7SQLqPQz67VD3YxCUrETluCs3G1FTZ6TMWYXdEaoi7PrtFKcjzinFtbmbAP/HMhVEyA8CGH6/W8mfuzcTMCym5T0UawNYcIEFUP/VgZ8gXXrgboiH4dF0C9+ixvioXaIcl0aa5P6GbmkaN30BHJ2AWzQN7+LCgfA+MdzRCiJ8OKDMmDjWgaBF1D2uuMFljkfghViImFwWe6UmwsbFYay1XdPKpG49xLXh92GcuA44YotJYhy+8lGPugzcNoEnUad5Jb+gAawcjNXlAALJ31puNrI3GR4lyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYpo+T+lEWFbN5SsXB//zMqCdlVvf6dsQVb8KerY+q0=;
 b=LKeoKVXI7KUKAqhi1dmIH8o4spr0Wi89Qd02ZW5Gd0MVhDPO34eUKx+xjqSaBUCTTTvJbdZd4bbeMMPG53vcVKjq9mW4e/N3Ib0xigA5MpBvkx2sKjvg40nWJXtI+/HZa0d1OxYn9Xm4g4HJ5zcJy4CI7XCZlxvWXpqLi8Jp/Nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Apr 2023 09:23:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v2] livepatch-tools: remove usage of error.h
Message-ID: <ZEI5+couvF57DBYc@Air-de-Roger>
References: <20230406114106.54735-1-roger.pau@citrix.com>
 <DM6PR03MB53728797915DB90C57CE03B2F0639@DM6PR03MB5372.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR03MB53728797915DB90C57CE03B2F0639@DM6PR03MB5372.namprd03.prod.outlook.com>
X-ClientProxiedBy: LO2P265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::29) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5341:EE_
X-MS-Office365-Filtering-Correlation-Id: 63814c6f-ffae-48da-b54b-08db42395633
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pprzdkz6kxa8+NUSfQc6oB0Ipo+K15gZlSprEUV1xyELWUrJ7dBCtx2PGEMQl7OPLXpB3pb+opSrBUCN2p4OJ81Gj58/4nI5nLchihKvUjetGEKkjjDANfEm907YbfeF7/R5um1qv+oh+2Z3696OqV/175rdYVim5RkYXzFsuTqvmVYDhsYvlu17qrhE+HoQaG6Sk4XxDz65owA5zOLcIcTRv2TupKcWLirU1IC8t9nJeLQuR1poNHDFRWlb5TaoMoBvv6CsrG3qpt39KOpMoo5RTRqKKkMOMtDZZxU3ebGb+N3BsO+dHhaAGu0VCvfboc2oSsTiUUoaajFp95cP7MuOLQnzoNlmijZh8cYyEENbMHLj92CnO863F8bgHrmL4qao+liWoOFSBhYMy40Irt9W/+j80X9oVy3Vnvu5Met5NqDQwpyzKeow6aW4tjyNxLFT0HjAidDs3eGRju8fFU1RF6c+ZbLASC26liIXf2Osgkk0VN7BNO/3gyf+W3vA14hUqZSCEIEzRAdgFqnHEXxyg03NUOgL+F9xhHn2i7EPEKZ8FfxFqe8lO7BnXLLJzMfGBLY5L8VMQAR/xA78yXjd/Erw8q0Xn37IdTXdBtc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199021)(478600001)(54906003)(85182001)(6636002)(38100700002)(5660300002)(8676002)(8936002)(6862004)(2906002)(66946007)(66556008)(82960400001)(4326008)(316002)(66476007)(26005)(6506007)(9686003)(53546011)(6512007)(186003)(86362001)(41300700001)(33716001)(83380400001)(6486002)(6666004)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkx4dWEyREl6bDAxVGJCTGhiOUZMaDZZOTRSdXhqbU5qc1NRV1JxeEJtQVNM?=
 =?utf-8?B?THV3N0M4Y3ZjTE85bnUzOWdhSjBuWHd2Z2RXaDBaQWFodkxlSTdlMXZTbEJS?=
 =?utf-8?B?L1pBOE5VVFJVSmhGSDcxR2R1dFEzNER0YlBJa3ZSRWFYYk5mTkZUNVNzUWQ2?=
 =?utf-8?B?d0tnSGhia3VJMzE0NmJFRE91UlprckJSUjVrOFdnb1JsVUUzdXZuOWtBcy9T?=
 =?utf-8?B?cmF2RTRtdGlYLzl3bmxJRURyeTJ5dHEzYXkvSTZDaXNLVENvcXBxZHAwdjN2?=
 =?utf-8?B?RHZQNklnQ3pBNzRCWU90bWpoVGVZeGtsejdSQUVGQ1NwaEFOVWZvY0hoNktn?=
 =?utf-8?B?NnZHS0djYkF2Y3hxbUZ6bC9iQldiVjFWQlQrYzU1eCt1ZGliVThuVW1QcVVF?=
 =?utf-8?B?cmxoNmpydkI1VVU3TTFyMXI5RHhubkZBR0ovMVJqYi9rdUQ2VUhxSUluVGlD?=
 =?utf-8?B?Z0Jmby9VU2ZFcUxIMklwMWNLZ2t4V1JLWHhSa2VDME9TeHZhZlI1UG9aRlhP?=
 =?utf-8?B?d3c5RjBiRnZjTHFyZTNaZlhaQUkwSHhOaSs5WTNOQ2QwTEZadEJjd3FUN2ZW?=
 =?utf-8?B?amZERG0rbnppdTRHdllOVitLdXBuRkpmejZ3aVlGQnlHbmR5OTltTEdQSUIz?=
 =?utf-8?B?RThzVU5KQ2JiMnp4U3gwR2dySnYveC8zRWdzbVU4UW9TaTRwNk1XalM0NHRT?=
 =?utf-8?B?TGh1UFBTT0pkZndYOTdTWGgyc0tORDg0U3p5MjJOQkozUVFTMjJrcjduNmFS?=
 =?utf-8?B?b3JUeCtCaitkVjlRT2NKZWIwZnQ3c0orRWZrTnZVNHB2OU43bkp6ZzhXVXVM?=
 =?utf-8?B?cko1WXlCNzhEUG93bmt6RGpkaHRTTmxWQ0hycndOVEtzaTVzY04zS1hTVUQw?=
 =?utf-8?B?MXRQeE1pR2IvbldPSlpEMjRNMmZGRTU1dHZuQkt1K0FjQk9mcDRQbVBndGNF?=
 =?utf-8?B?UXZJRnl6K1RTeUp4blJEcTFWeXcyY3hTNmp3VzgrZG1ZcWh5Mk8rUzJpczFK?=
 =?utf-8?B?QUFPSTV2dUJuUnhpYUoyN3h2UE10TkhUdlM4UVVLQ3hlQU1HZ2NFdjdoeS9m?=
 =?utf-8?B?cVoxeXEwZDZOR2FqTFpoSkFyUHZsRFdPMy9HYW1Cakh6dGFkSzJZcENMdXF4?=
 =?utf-8?B?ajhrcjFHSk9xMWZpMEh6NytzcUJBL2U1WUNmMkZkU0E5UVdKcG91N1ExcmZT?=
 =?utf-8?B?NldPZTNIR2FDbFFsdVc0SkhyUWl2L0NEcjUvcUZRY1pMZUxoZzM5TktibHFR?=
 =?utf-8?B?aTFsSVBrZ042R0RZQVlmd0VTeWczaC83bVBqYnZyazdsS0JtT2o2NHYvRHVy?=
 =?utf-8?B?YXdaSWVBeXZwRHVlUURCQWRHZWg2aVliOEJad2F6bHluNThDbXVGK0Y2MWhE?=
 =?utf-8?B?QlZDczZZL0N4Z2dPRUZLdDZGdDczMW4yNENhWjZWSWRMbmZWWml2OFo0QXRZ?=
 =?utf-8?B?c3E1dmRWVFhVS3AxajhCMDlLWkJWTW8wem1JVUJUZHFGVFhlR3hjcnBtaHEw?=
 =?utf-8?B?WWN1Vk45VU9SOHVBcUVmTm9Ub2xvRWhRR0NIVmNsb0NYNFFwTWFsUDN3QTQr?=
 =?utf-8?B?SWdvekplaHdsbGhJMjZIUVk0K3BXTVFNNEtETVhsbGkxNEd3UDJualRELzRv?=
 =?utf-8?B?RXBNY1VXT2tWdFJkM1RIalRLai9HOXlTeFZxWDdyamltOTM0cVVWMVdPbzgx?=
 =?utf-8?B?SzhsWjZDWDZ5UDMxY0ZwOWtHZ1E4THlJd2lrMlVOMFN2MlhLUDczVEZRbHBX?=
 =?utf-8?B?RmF1RUt4bVdZNWFuZ0ZVUEhuRS9rdVhjeWV1SU12bGZOMlgyaytjcTF2V0Nu?=
 =?utf-8?B?amJrWW1TOVRJMkY1LysyN1dGcThVN3NNT01ML3BMVUJidFNJUzlMY2RMSi8w?=
 =?utf-8?B?L2JzcGF4M0JMM1J0TVU2Szgzc2c4SUlUdEczTDRWT3poTWpHK1c0aGwrQjZw?=
 =?utf-8?B?c0J5M2ZZM0dZK1o1QklQZG5WZzN3NnZNc1dTdno3Z0NqNG45cFlIbTVUa0tC?=
 =?utf-8?B?Ym13bjAxbnVhZkp0MStBejJxRjJWcGJJQWFiMWVKODRYM2ZBNnF1YmZTTzdZ?=
 =?utf-8?B?alJRMkhYaUVGM1g1cjh5cU9EYmVwSml0Z3FhMVo1YVM1Q2FHZzJkZERyNkI4?=
 =?utf-8?Q?As4kur3lJGrtXCco8aNepA8jo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nhXCPTB86PqFGQUlG4RFvqzq4MFWNxJjFdQaJNIUi5QsuV57IIA2nwYKK/pQDt3bAmB42saOij6WIQCgqGcuGJFRbJCvddTjwjDMWomDsg5uym1ti8PZ1lLuTeGh12wwA84Y7xdmjpgzxlLbzV0JBuhev3cuVykOYb77rXuVi3lZYLb9ODnNY8OqoJQ6DFTF8vtRUakErTJV1Cj6q6cwRZt3lmO/TIdozCcJm/X11gjm7zfMber1I04nWO2zh5s7xb0rf5d04Mk7FhJXxeSpXJu41GKaTyOEInR5paTztYULdODXlnBzf+60QoMoMenQpl7TyGT9fKY3Xb4iRjJeRFmGDwplAnVHPUnSgTlad2nCIGcRN/eQjahRf2kWLXMQ2f3hxY7+dqKIGuCbW06lufG5dG9aRzvJSu3HyO9GKt7y7xb/2p9UvqoZhzsymWbDgGsb3Vv8IirLntXVV7dB80YA3UZWoBsNaAC+rUHumEJQb8oAdVFV36R/bL+HqY0+SX9LlMRNOqjP2A6Diq4UIwimRxoRsRjcP8ExCPFTzfkxA7BKZAt/fTH+zDiRxFCtgqSwxpSJlLEZoiY0xANKf+TsjtlC5Rxd34qj9kAlySMxaYFhghI5gNHUUIT1gqXtS9jHwYEkMOeLaKm8ed/wk10cwwraeQ4cahjPDERQVV8qtUZtY9bGaoaG8v7AdfAlJxLXHuywh6EVl264OaIz2EvzfB9KzhyzTn3m/XdHEE30PZte6OwH/xqWousBmCaME5ZG7T8XS6UYMdFsdQQbnAGLw2rjMsNZJ/v/4uZya+db+Bixni7tZHvOoQnL3Ug2
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63814c6f-ffae-48da-b54b-08db42395633
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 07:23:43.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syhjI1eUUWJW96WctFzoc+EYbxiS0AGar/I3vBn6QHwHXY2h/m8OfK0eHnbFsZTACr74xsP9tCB24KHyksOgOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5341

On Thu, Apr 20, 2023 at 04:14:55PM +0000, Ross Lagerwall wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: Thursday, April 6, 2023 12:41 PM
> > To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
> > Cc: Roger Pau Monne <roger.pau@citrix.com>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Ross Lagerwall <ross.lagerwall@citrix.com>
> > Subject: [PATCH v2] livepatch-tools: remove usage of error.h 
> >  
> > It's a GNU libc specific header which prevents building on musl for
> > example.  Instead use errx() in ERROR() and DIFF_FATAL() macros.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> > Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
> > ---
> > Changes since v1:
> >  - Use errx().
> > ---
> >  common.h             | 9 ++++++---
> >  create-diff-object.c | 1 -
> >  lookup.c             | 7 +++++--
> >  prelink.c            | 1 -
> >  4 files changed, 11 insertions(+), 7 deletions(-)
> > 
> > diff --git a/common.h b/common.h
> > index 9a9da79..bbaa950 100644
> > --- a/common.h
> > +++ b/common.h
> > @@ -1,18 +1,21 @@
> >  #ifndef _COMMON_H_
> >  #define _COMMON_H_
> >  
> > -#include <error.h>
> > +#include <err.h>
> >  
> >  extern char *childobj;
> >  
> >  #define ERROR(format, ...) \
> > -       error(1, 0, "ERROR: %s: %s: %d: " format, childobj, __FUNCTION__, __LINE__, ##__VA_ARGS__)
> > +({ \
> > +       fflush(stdout); \
> > +       errx(1, "ERROR: %s: %s: %d: " format "\n", childobj, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
> > +})
> 
> Did you mean to add "\n" here? Wouldn't that result in a double new
> line?
> 
> With that removed (can be done during commit),
> 
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks, please adjust at commit.  This is a leftover from v1
when I wasn't using errx.

Roger.

