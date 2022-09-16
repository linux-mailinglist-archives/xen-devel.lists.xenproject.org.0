Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E15BAE46
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 15:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407988.650688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZBVK-0000no-K0; Fri, 16 Sep 2022 13:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407988.650688; Fri, 16 Sep 2022 13:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZBVK-0000ln-HI; Fri, 16 Sep 2022 13:35:38 +0000
Received: by outflank-mailman (input) for mailman id 407988;
 Fri, 16 Sep 2022 13:35:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHCK=ZT=citrix.com=prvs=251a9f4e5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oZBVI-0000lh-VM
 for xen-devel@lists.xen.org; Fri, 16 Sep 2022 13:35:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 703148ad-35c4-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 15:35:35 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Sep 2022 09:35:27 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN9PR03MB6025.namprd03.prod.outlook.com (2603:10b6:408:136::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 13:35:25 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%4]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 13:35:25 +0000
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
X-Inumbo-ID: 703148ad-35c4-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663335335;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kG5EzjFODtCwNsyXVF2QbPxc4glCcGst+oHLRR1MHGU=;
  b=XPaq4HSkDwWI6uvXn2GrpnnANlHr20jG0Del5+eU/lrCCcr53Lug9095
   PPQ2XVHto9y56HPfL9Un1c5dTC73oi0/7NSXkp5BHg5NardtJ7TwVKcB9
   HATs8KVXZPfl9mMaAZyFuQNfoGj/j8QAvofpGLraE9TpvjrcBHbEgL2V8
   w=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 83205714
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CsOaYKMXJAYKGJjvrR2llsFynXyQoLVcMsEvi/4bfWQNrUoh3zRSm
 2NJC22HaPnfazf3f4ogPY+3pBkB6MeDn95gTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMuvvd8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFO9zeVpS0IfE7ZE3dhYO1gJy
 aQSJD0CO0Xra+KemNpXS8FKr+F6dYzBGtNavXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr4wCChI1W0q3rMzUYzy3LUwwFrlqDkLfLee8CQRNUTlUGdz
 o7D1zSiWElHa4XDodaD2k+jmOvGjSfnYagDBZK/26VOkg2c+XNGXXX6UnP++5FVkHWWQMBSN
 EcP/SwGoq079UjtRd74NzWorXjBshMCVt54F+wh9BrL2qfSpQGDCQA5oiVpbdUnsIo8Q2ws3
 1rQxtfxX2Ux4PuSVG6X8aqSoXWqIy8JIGQeZCgCCwwY/93kp4J1hRXKJjp+LJOIYhTOMWmY6
 1i3QOIW3N3/UeZjO32HwG36
IronPort-HdrOrdr: A9a23:8OIbeaAVKauSb0vlHehJsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOE80kqQFmbX5XI3SOjUO3VHFEGgM1+vfKlHbak7DH6tmpN
 xdmstFeaHN5DpB/KHHCWCDer5PoeVvmJrY+Ns2pE0dKT2CBZsQjTuQXW2gYzdLrUR9dO0EPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmffHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+3CVTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qe5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 929lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQlo+a87bW3HAb0cYa
 dT5Jm23ocWTbraVQGTgoBX+q3hYpxpdS32AnTruaSuoktrdT5CvgglLfck7wY9HaIGOuZ5Dt
 v/Q9pVfZF1P7orhPFGdZM8aPryLFDxajTxF0/XCWjbNcg8SgLwQtjMkf0I2N0=
X-IronPort-AV: E=Sophos;i="5.93,320,1654574400"; 
   d="scan'208";a="83205714"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nio5yoITYK5YRzYhcQK6+obUtqjv7NxWS0BSf92lhYLVzr3X/KUk2puiVZOqOBaKKRMxQsyB2QIe68o176zrymcHGmy+VtVDw71WDrwcuEq802/nvO1aCdMrQ13W/Q0E471rtLhGTJrmItqxG4kL7s/TPKBMssnESeenfCXGHAhsoonw4LgLBywDkZqlGfkVBEe+F0Lv8MnnpuW71dPARnKDwAk9jdYp0mbdBm3BQ+0Qo7Ld2oTDNhvCgFSXFdLdvPgMU7rXanu/uBGyEO49kN13tG9FNNXDcdmr1CLZlzSw7bsdRslb1r56Dg3mfkqciEFAOSMhr2e16LZiAYdP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99otT8we/7e0MOONlXF3h3V+jEf7LpLhX8cdYTMlN+Q=;
 b=W+79rIF2jWNXdh/5oB+21adj7qrQ3+/Gs/+erwhSLdMuN44B1ybY0sQxy4BAHopSbFCBqk3+yhd9A5LdgCmvhDSpMgLoXinzWQ4bl/Yv6901QN6YTcxWbVUuFjN4W5JMVSf7tmNRaK7udUXSSZDVIKPtKqFTJzdWnCIZ3GN657huydIU9Z/noADdREpMSypO/2nJOBGwq9oapsZ18tPearoGzfAs2/APuWj407ll6xPvuF/GHb3XY0cXOCFFI3Zz4XuAFmNqiIzCYKIFHENdlR4mpV/V/SBj939/l8eXUe8NwpXjF8Y4DgA+bOKA3rLDs+Wb8mALJUsJQfhCcOPDZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99otT8we/7e0MOONlXF3h3V+jEf7LpLhX8cdYTMlN+Q=;
 b=qxVYqE3RDTzv0P/wobfD5Z3m0bFdYWuJfz0b3fwxpz33+4UVGZvpKWIMeWeEWOddZ26vg1G/HO0WTsizI374cLMBmYDQ9dEuEyCK4KsBYLAK0IzFBdsPYLonwokeSS3x1ae64pB3Tf9B7bIvYBB6Kx4nevOtXB3XxNsFBxkZaH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 16 Sep 2022 15:35:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Adam Szewczyk <szewcson@gmail.com>
Cc: xen-devel@lists.xen.org
Subject: Re: [BUG] problems with NICs pass through to OpenBSD guest
Message-ID: <YyR7mIMh2htWkR7o@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyR1eUfbq9aVSVXV@Air-de-Roger>
X-ClientProxiedBy: LO2P265CA0425.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|BN9PR03MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: f7cf5695-2707-4e53-9662-08da97e84fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nZrRsCA0aGLAw3VT2+e3JnnUaa5CgVO5GIO/NIWcslZLBBraZ1IOjjHH6/Ak5VXlc7tHDFpuC6QltpM6jdT0AWz6rTFk1V2ilq9srLTJKrQ3PYin+2IoJdf7cAaciMPEwK0oXN0HLhhtiOi0HH4Jhpu8KEkluMYHS1IFJVWWMzZr+QFsR/UdKHqVQL6jzd0iLcTzCG+i3ePA+cb/5dEvW5PVQxHPezsoMTq1oea8w8tueWnzHBsUzyA1F2j4xW3tyT7lTT7EFr71Cf5+oToniln7DPu0nzT5WWClPIvJTh8bGJFU4Ux3LBItEGrOb0K/BXIqLxphmzNS+s8SWnS6+7fHzDBRWFCL3VhpkQQKmlZ9VPj7Y73elzujlimKI7ZjQHr4FNtfJmd5t+uIaKQv09bsReCk/Rn+VLe3UP3cvb7noP+uX5dcnAWIaTf/AUva0jwwXVG+qcVBv/HWdu59OUD5WpO6c/cNtECJoUOP4WjUahnq3Zrjf3b9Rji//Tp1svTpzZlqwsJdteKgU6GsmyPTR5KKK4qmLzliRPREfJsSxMHIv1pUXpBFT41ujO4tvrR4y4BNNag6GKsLR0iKunRoTcU854fk0Eb2+6TIIKF7AgLTGRSzdMhv6rCA0cT9tnLO1+4CFEsrBg0wSFCHVvxNnlwh5/o9AKzynpRzszCNJzkiv67j6yIYkFdXyCETjvhLjwI1ajHNPTjfgbs7HQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199015)(8676002)(316002)(8936002)(5660300002)(66476007)(6916009)(86362001)(4326008)(66556008)(66946007)(82960400001)(38100700002)(41300700001)(6666004)(6486002)(6506007)(478600001)(26005)(186003)(9686003)(6512007)(33716001)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHpkK0pSUTJhL20xWW04eDFOTjJoM0laUnlXem5vTTZzY1VWSmM4b0dqNDR1?=
 =?utf-8?B?K2ZBT3dPSlE3TkU5RG9ENWF6eUZaNGJkQ3BXYVl0MHdGT01GaXlKVWpEOThP?=
 =?utf-8?B?dUo3eGpFdSswelBUbW1Fblpabytickgzbit3Q0R5VE5pV3REbTBuZUx5eFBa?=
 =?utf-8?B?cWhvcXlNc3pXQUJ1anFwdURrK2MxdndyUytOZ1ZQUFg3cUVSeVVtMkZzQTdq?=
 =?utf-8?B?YWpsTURrdkUzSzd3SXpKbWZvejlrQ3liNjNTRVMzUW0xODF5ZXhSTUhhRWpT?=
 =?utf-8?B?NTRFekdxaUZpYnJwYzhYUXdQL2U1RUZzcjZjKzZXRUUvbE0vOTArdWNDRVVE?=
 =?utf-8?B?d3h5QUo0ME1hY3laSFdXbm93WFNCbXUrbkh6OC9YSXR2Y1pWbVF2L09IM2Zj?=
 =?utf-8?B?WnlUZDJraTZXajd0UEEzUmw0ayt0RzJMTWFUV1d0Wkw0OStNMVBmYVVvR0x2?=
 =?utf-8?B?R3l6Y0xxMnhNcEMwR21MRTdpY3d1NkJQRlc1blBkdGY0VFVzN1BHbS93YzF4?=
 =?utf-8?B?aEZuWDdoWnEvUkZNeHp2RFpNOGVRZzNlblBSMnZOZ3RDdjBXRHpjNlhCSVZI?=
 =?utf-8?B?V0JaNUV6cVFVZGthdUJZMDNDSmh5c1NMaHkyWk1iSklFcE04c1hDaTl4a2Zu?=
 =?utf-8?B?eTVzaGoyNHFjQ0crY1U4eVZURVhaclErYkNXNExXejRrem51enJiS1IxYmpx?=
 =?utf-8?B?RGhBOGlIMldWMUdjV1AzamhITnUxMzlSemJMZHNMWDdWU2dMNm52ZlZkMndh?=
 =?utf-8?B?M0ZOejhxTkFIRkNyVndrTEU1UmJzZU5hSFB2bDRkT3NQSUJUWENqRmNXeE9m?=
 =?utf-8?B?d1RKUkVqa3c0aUkyTkNEWmZQWFR3SmpWbkdZbFI4Mm1nSndJQjEyMG9oSDFG?=
 =?utf-8?B?M3ZRMEFHM0tEUEdweWtxekpnZTZ1bVNFRTlVS2JmaUpYOUVNM09VVi9zdzVM?=
 =?utf-8?B?ZXZFTTBZVlV1T2lHeCt0R0VjVUVCVFQzREJhY3kwTmFvNXpmUFM3NE81cmtu?=
 =?utf-8?B?YkIwMFNtVk5YZVpyamI0R0hHL3hLazlnUTRlR05YOU04ci81Y3VlRGp1NTJU?=
 =?utf-8?B?dThYdStZV3lGZlFqaEoxbDNmQnYxNUE3T0dYODArdkU3YjFCUTZJRHY0aWRt?=
 =?utf-8?B?a24rVFJxeGpmSzJkRjYrcTFpem83dUp0bmhGTkdXbDVrZEorYkV5Q1RucFdk?=
 =?utf-8?B?aDVQTnljR01IdXBVZ2RlN2swYVFYbnZaVjJrMFJ5bGIvSWRYaDZSUDZUUjdY?=
 =?utf-8?B?MG8rc2tRbkhFNjZxblZjanJaR21Id3dlTzlwUjI1OW4vdHhDSG5SYUZqWi8w?=
 =?utf-8?B?a01hNitZeVg3M2tHU25TMjdZem05NlNpeFJuWkJjR0dVN2pWcnY2K2N6d1Nm?=
 =?utf-8?B?MlVQUHlPV0FpcnBxR1FINnRKWjVlZmY2MlFYREJvZ1YzSXNXYjg3eEdmOGhT?=
 =?utf-8?B?ajhJZ2o5WXBEMVo5TUYzQlVtTnJOWmNEV0hJK2V6NGM4OWpWSmR5cFV4ZkRO?=
 =?utf-8?B?UFQvRFB0Tjk0czdzVmp2Ym8zSUM1REJCUVQzTTJPZmRMcHBMOEpOVmJIMm5Y?=
 =?utf-8?B?SFM2V04yMjRqVmxTdzkzbkJUYWNQdzhHSGZ2TDUvZUpycFhZZHNzSWR0Tk9u?=
 =?utf-8?B?MS9iWVJPS1g5aE9vdVJ4cEI0T3hhT0NpOURDQW1oNW9sQVprQkFnM1FpUysx?=
 =?utf-8?B?YUl0Yk1waEdrNTJPc2tZdkE1Q3VRWURRdWVIOWRtU29xVk1PaTY5SGdJcTRW?=
 =?utf-8?B?OGp5MHA2anN1M0VtMDZRWFBKdU12K09BVE1rT2dZSmlQNkM2NCt2cDBjZVR6?=
 =?utf-8?B?bjRXM0V2VkxWTEVyR3p2OG1hbVZsQkExdGhzd2w0TGhhL2RDY1grSjM5REVt?=
 =?utf-8?B?M24yWlYvZFhSYWJZenlCZUU1elFrNGh3QTVyaXcrUlBjOG8wT2pvdEUwVmZB?=
 =?utf-8?B?ZnhkT29GOGJrWW1MQ0RqTCtRMUtOSjlQRWprbWNUZzFMQ2x3UDhqb0RobEpJ?=
 =?utf-8?B?UlBKb2szMlZCeU9iTHFkVEJMbGt6UmZWbTlnNlZaM2JrM1NRTTZZM2paVk55?=
 =?utf-8?B?cjBnZW9HZ2h5TDRxcFhzU3ExVThMUS9SRUhqaTU2NnFxSTNIOFdzQTFiYXUx?=
 =?utf-8?B?WjRNbTJFYXNYZ3kvbUtYT0VJbkRydTNlR0hNTnVlcE1rKzQvSWN0UzkybEhE?=
 =?utf-8?B?Rmc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7cf5695-2707-4e53-9662-08da97e84fd7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 13:35:25.6113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGPmLYD5WQ7dW5TCcdmnLYxzFxTfiSxx1QZRudjY71TgM0mCQd8ppbxtXwloptO36qIDT0pezOwIh0mb9KQnrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6025

Again, please keep xen-devel on Cc and don't top-post.

On Fri, Sep 16, 2022 at 03:19:30PM +0200, Adam Szewczyk wrote:
> I executed it in dom0 terminal and it prints lots of stuff, but when I run
> jus xl dmesg it prints almost the same logs. So I'm not sure if I have
> right output or what I shuld search for to paste it here.

Hm, you should see something like:

(XEN) [ 8729.266567] MSI information:
[...]
(XEN) [ 8709.154958] IRQ information:
[...]

In the output of `xl dmesg`

You can paste the full output of `xl dmesg`, that should be fine.

> Regards Adam.
> 
> pt., 16 wrz 2022, 15:09 użytkownik Roger Pau Monné <roger.pau@citrix.com>
> napisał:
> 
> > Please keep xen-devel in Cc and avoid top-posting.
> >
> > On Fri, Sep 16, 2022 at 02:35:17PM +0200, Adam Szewczyk wrote:
> > > >  0:7:0: Intel AC 9560
> > > > 0x0000: Vendor ID: 8086, Product ID: a370
> > > > 0x0004: Command: 0006, Status: 0010
> > > > 0x0008: Class: 02 Network, Subclass: 80 Miscellaneous,
> > > > Interface: 00, Revision: 10
> > > > 0x000c: BIST: 00, Header Type: 80, Latency Timer: 00,
> > > > Cache Line Size: 00
> > > > 0x0010: BAR mem 64bit addr: 0x00000000f2014000/0x00004000
> > > > 0x0018: BAR empty (00000000)
> > > > 0x001c: BAR empty (00000000)
> > > > 0x0020: BAR empty (00000000)
> > > > 0x0024: BAR empty (00000000)
> > > > 0x0028: Cardbus CIS: 00000000
> > > > 0x002c: Subsystem Vendor ID: 8086 Product ID: 0034
> > > > 0x0030: Expansion ROM Base Address: 00000000
> > > > 0x0038: 00000000
> >
> > None of the BARs are at 0x404000 which seems to be where OpenBSD is
> > trying to load the firmware?
> >
> > I would have to look at the code to figure out exactly what it is
> > trying to do here (and why it fails).
> >
> > Can you also paste the output from `lspci -v`?

You seem to have missed this bit.

Regards, Roger.

