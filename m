Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08D352ED4A
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 15:38:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334159.558162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2pd-0005Vj-1q; Fri, 20 May 2022 13:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334159.558162; Fri, 20 May 2022 13:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2pc-0005Oy-SO; Fri, 20 May 2022 13:38:16 +0000
Received: by outflank-mailman (input) for mailman id 334159;
 Fri, 20 May 2022 13:38:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns2pb-00056k-RH
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 13:38:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17375472-d842-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 15:38:12 +0200 (CEST)
Received: from mail-sn1anam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 09:38:10 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA2PR03MB5755.namprd03.prod.outlook.com (2603:10b6:806:111::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 13:38:09 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 13:38:08 +0000
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
X-Inumbo-ID: 17375472-d842-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653053892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=vuqEjtABieXu9Vo87t3IJkTLruYFx2uqb2Zc5LtfZjw=;
  b=WkTepDBoZk0JjbEMIERxDebjYhtUy/v1b2eSx2GhXUvahtfjCkBYzDmG
   B54m0fkpiFp1nTZyhTvqICgVTvFsHw7H8zRlwPQ/tiZr4AptI6PeqmLUl
   PgTlDQhycTLDdyewkTbAwbvuVPctmRSI1YmLa6yZHUKaa1hKfoaWu0s7i
   U=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 71650040
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rbZkhq0j7UyayJib0PbD5adwkn2cJEfYwER7XKvMYLTBsI5bp2cFy
 WIXCm2OPvaJMDOjftsgPI3n9BhQucPcy9NjSwE/pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMy2YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1ok6KfbBUwIZSdo8ECVl4IMQpEAJRvreqvzXiX6aR/zmXgWl60mbBVKhhzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82cBfmWjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SChLmUA9Ar9Sawfv2/Qky5K05bUIITcUMfNeMVxwneSn
 zeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGS0SvHtUhv+p2SL1iPwQPJVGuw+rRqLk6PS6gPBXGwcFGYdNJohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnF76PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:IzV//ayxUGds2Wz2+7+XKrPxvuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhORICOgqTMyftWzd1FdAQ7sSibcKrweBJ8S6zJ8l6U
 4CSdkANDSPNykcsS+S2mDRfbcdKZu8gdiVbI/lvgtQpGpRGsRdBmlCe2Wm+hocfng6OXN1Lu
 vU2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnS4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUoZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpAoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPXi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZNIMvD0vFnLA
 BSNrCd2B4PGmnqLEwx/1MfjeBEZ05DUCtvGSM5y46oOzs/pgEN86JX/r1bop46zuNNd3B13Z
 W7Dk1WrsA/ciZvV9MaOA4ge7rBNoWfe2O7DIqtSW6XZ50vCjbql6PdxokTyaWDRKEopaFC6q
 gpFmko/1IPRw==
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71650040"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCYHoXmHTfr3TZEJ8LuPO/Hu9Ytk0cK7+DHPa3yQ9fLGenw6ABisVRAsxAvt8wphJIFqNaoSLCYOfe0igAj5ergfJ8xzvwXx4LZKHv6wZt3QQHtgGhDMAs3quTuyZ1EDn3hyW3mjPj6A5jn8GX/kCktYntUDssm/JuUFi2MVvGExgr2lZH2l1fuZ6qJvy19oWREBkU5EiJ1L+MyH8AqIvGYBfC6JaovBo0XCB4/MgRJUxzLsEU1vdHDl8c4m6PTYInpajBsdyqKDevsQJQ49fO02lMdp2gmE/0/1Cucaz7dlGEekblxDB8AaV155IonRt11MH73ME8rIx0ELOnvfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9Ekmh3tbPwwgEDDXKvXO+tVDL7mMqUMplf8TjgDEWQ=;
 b=HOealfUS7+T01miNdDwL9s4fwDeAgDVHEa3jAuC4GE1XTTYBEHW2teBTvHJ5d01ga758r00/OTUAgdk+srCnZ0nw9KsvwQuHg6ICZu2y+uuIQkl6xGEZHimLpg7mWNspBa/B54eUGVzF+8DdFtdtTJqPtataX/XMhQK2GDmvGGmivEd7tP2xeavaGXXj3gccdVUeSMYE4vZPgSFGQRSpr2R2acgxse8pROOcKc/FXajHdl819cINlG/x3y4Bhp0vzuebWkbGH6aBnH50XPdOYlhLelUxDWqYvt2Z2bM1IuLIiDs4lHZw+VpEMUIf4B1iRstrHSWkvmNE7ut7zTMAdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9Ekmh3tbPwwgEDDXKvXO+tVDL7mMqUMplf8TjgDEWQ=;
 b=c3118TzE6ZMbMHxY6Fbfi6TRXqBvf0wrYgCH/cCnUugdnl8tyv783NxLDtRjwo8KnsZbUIQ9/hV0BXaULDp5WQvTXCvxBImpJEVFxVH/ilOZKA5tBgXUBQfeWDs0R9jGyUvFLPsOtfnmOWomY/xjv1Rg4eyW/OMM6IUJC+Pbqb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/5] x86/lbr: enable hypervisor LER with arch LBR
Date: Fri, 20 May 2022 15:37:43 +0200
Message-Id: <20220520133746.66142-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220520133746.66142-1-roger.pau@citrix.com>
References: <20220520133746.66142-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 745f6886-5750-461e-994e-08da3a65fa0f
X-MS-TrafficTypeDiagnostic: SA2PR03MB5755:EE_
X-Microsoft-Antispam-PRVS:
	<SA2PR03MB5755944A605BBAE3C120C09D8FD39@SA2PR03MB5755.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B4jxkw1Z9fVWJg6SQ50Vvv4ogiPEou3PJEOW2Xvb8IRH8e+ERf3FsS2pSLOVrCEA4qnulVuqNCqSesm43Q8yJBp24FdJ5E0cF2y4I0lMzT0YYrMelLhI/Y1A4esV2Wy8U4WPul+fzCU+XH9Go2E7Ui8B6W2G5kccVNXyCbMcER7YLdID8usTkJXa8tkLVAN0SoWY+Iz+i34SAbDcHhjlRvCjVi1/Y54YV20rW5YUL1JT2YvGDSFOos2qTwaUP+460e61+ezuiZ29B0Q2nAQzIZvYcp6F4l1B1sawEr77uz0Aegt9bNBbibCMyD2hbx6ZjUOjjB6X/34R1zfmzwDkautRDScwDFRUKlpqYA/BpJXMjXj+Lb3e1IAvzSjPXaoptYo+z20Jx+kslSBNY2c3xRMxhhyX6aT295KJocysWddIOVWShTWqgxM2ov52goont7O91TU0lf4CLXbeHpv026HeMiEQD1KpKGqRrUQXjPzzg4uisnUWqInT8zWQFoHNwG0KYVmhNbg6eLeJtrh2Bp9GL7RHfBUBAWUPkzI0t8M3H66kEv9QySxUKEphLUCTpCyh9zUp71IBETY1G3u8T2AEUGRm9DHIuse1YiZy8m5IZIsGVhmFWix/i/0EnJUyzq8RnCkgR48MEYvn5DwEOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(316002)(6916009)(86362001)(66556008)(66476007)(66946007)(8676002)(4326008)(6486002)(83380400001)(6512007)(26005)(2906002)(6506007)(508600001)(1076003)(38100700002)(2616005)(82960400001)(6666004)(36756003)(5660300002)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjI5cVVRMWJTZ1l6bVRMeHpNNHFyanJIVDNnNDBTSmNjR2FKZlIvSUlva1Rn?=
 =?utf-8?B?Si8vNHBqT0ZlRDIrUW5STUhnbFkzTXZJZThkRjhtYnJOLy9qL24rblFieXli?=
 =?utf-8?B?TXlPY05wdUtiREUvREhtSGNrSjZoTnhabk1rUXdZaWp5bTRGdXpwOFBCNlEy?=
 =?utf-8?B?SnFiSEFpTHVUUzZqZzA3Wktad2taQnA2NzFvOUE1UnJNRUtOa096TGViY3Jm?=
 =?utf-8?B?bkFKRFEyYnAxaXRqbXZ4K2VwZjZxYllCaUYyejc5LzNyL0l4bzdOempqODNJ?=
 =?utf-8?B?MEpjZlIzdG92a2lMZk4yTE54MlROTnpJV2IxWDJKbGM1NkFzSVFIbFJsVzJF?=
 =?utf-8?B?QWdTR2YvU3ZFbkhFVFVrQzhJQllMWUQwcjNzTHhIS2hYZWNHZFQrdGJncnlO?=
 =?utf-8?B?ZHNZV0RwMndDUHRreVdrT0kzZlUvNHNBWjBPZWNXOU9UYmZ4Y1ozczRpSW5u?=
 =?utf-8?B?WlA2K01wTXpVcHlQNWZIQmFBVkg0cVAram5QYmN6bWwvZWtFN1ZDbFhTNmtP?=
 =?utf-8?B?U2RCYVBBSEdVZDJjc0xwMDFKY0prcWs2RWFKNmJBWFpUZmZ3YjZsS1plMGJi?=
 =?utf-8?B?VGl1a2ZRbnQ3d2wvN0dTSDFZYmFqc2Qza1pxSzBneldWUUQranVXR2JST3hS?=
 =?utf-8?B?dkcvbGFXMUU0d01odkFMNnRjMm1nUHN2Wk9SRTJwUFpqR25WcDBid3BHci9N?=
 =?utf-8?B?TUt3ckZRaHZWTklIQjJucDNRL3RpOU9tbHJSRkF1OHl3S2UxbUJ4MnJ0UXY5?=
 =?utf-8?B?NUdxdEJ6R3FJM2dFTTZsNC9NNmtWcEVjdzRsdnhWc1RNUWFER3gvSTJWVUxD?=
 =?utf-8?B?RHB2MEt5TUJtVzRzc0hCZzhNY0EzSTlkZTZWREpWR3RPOEs4N1ZZUHlZb3ky?=
 =?utf-8?B?ZmZmTWVhZ0g3SHRlTENmbENJV3BuOWl0N3U1RXJZZGNPV0xSOTF0bmdodlpm?=
 =?utf-8?B?S2pZeWRaSHkzSDlyNVdyNFJLY3J2cC90cUZ3eUJuZG1XbkZvLzg4Rk9UY1c1?=
 =?utf-8?B?SHR2OURvRi9MQXd3cC9idFZicFhxU3VFVDl2c2JPc3FLbmJMalA3ZUgvR2FB?=
 =?utf-8?B?NFJzc2hFbkNRWG5QMDVIMGsvdlZTL1RITGVoeWY2MEVBb1FEN2hMV1pNMmY5?=
 =?utf-8?B?Sm1nclRtL202Y3FRbkZSakxLb3VhZDNTSFVWSE9qR28wV2R0RC96bGtpNHE4?=
 =?utf-8?B?UUUrT1A0R09ac1NreUdrd2xCTlEzcVA5K1lGWXFjTTVXQ213TWVvcG9RUWhN?=
 =?utf-8?B?VUw3dHhUMm5NQ3Zxa0x0RngwMDNvMS9VVXZOSTl2WUR5MnpMTy9TRVUvSHl5?=
 =?utf-8?B?dXBCcjgzbmN6WE1YQVpWbWk0VEg1NkkyWGZlVzVCcGlYQUFwTXd6VUdua3RV?=
 =?utf-8?B?MGZjcjVDdmVTN1BMK2tTbmFBcWJTdytISldHUHozSVBwbHNVRTJmOGxWcG8x?=
 =?utf-8?B?ZnZ2Z2c0eGE3MGZiUFNXeEZCck5FNk1tRjl2K3lrTlExWHZ1MWk0UG1YL3NR?=
 =?utf-8?B?dHJ2Vyt1aHFsaFVQSjRvMENSWEY0ZW9OYzE4S0ZaNVg2ZnVCM0xkWUN4SStX?=
 =?utf-8?B?VEY0amVidlNlL0pTbW44Y2QxUTZ5TmsvdWZIS3YxWkp0a3Q0VE5TakxSQ3oz?=
 =?utf-8?B?ZFROVC8vOFBBdWl2N05oVFo5T09xYm16SHJDK3QrSHl1cW11RmhNUDVzYVc3?=
 =?utf-8?B?eUdEcVFQK2ROcWdRUEpvVW9xaU5QdlBIU2ZkbmdxdU9sSVdWMHVkbHpqQnR0?=
 =?utf-8?B?MkNJVEsyTU9taVBLZGpTYXdiYWJ3elN2bHJ0RWlWV1AxOURONDBYYVh6dERF?=
 =?utf-8?B?eXhndTdlZ3gxRkY1ZllHR01UdHBDQjVGK1VuendrWnFjb1RENklYcWExbEsr?=
 =?utf-8?B?YmRIbndJMXg0QjZiUHlYck9ZY25NMStpd1czUlFtc21MZVNxcHVFTFJEcm5P?=
 =?utf-8?B?bEpUQ3F2b2dLR1VnTllFQ0dsd0xSS2YzUXlnN2dwRWJ1QkZXYm1VM25TSGli?=
 =?utf-8?B?a1FVN1MrS3hvZUFTcytEdGxFS3VHSFFXeWRwMFRPaTRwYU9ybzNpdXhCdmlZ?=
 =?utf-8?B?Q2U2eHh5UkhRL25YMVE2SFJyZFhKQm56YkZSajJXNVdEQmJjT1JtbGVMMmpL?=
 =?utf-8?B?L3JSWEtmYU9rOU1URkdHTGJBd21xRVBrVjBXbWtGb3hjaWhIWUlBVlFvaFg4?=
 =?utf-8?B?cEdXMnZEd2RRbTZlMFV3Y3JtdDRaQnREK2J3SnNiNTk1ekVTMXdYczc4aWRB?=
 =?utf-8?B?akxtNW5tNVIxYXlWMTRVMlBTcHBrdS82VDlFbWxmdzhxbEM2NUhxcVhYV3Fi?=
 =?utf-8?B?V0JvdnIzd3dEdUp6SEpTZVlHcEl0K2orZklDdHNPekFPUmhseU00U2Y3ODBP?=
 =?utf-8?Q?sLyxSEBZv/oL+/1I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745f6886-5750-461e-994e-08da3a65fa0f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 13:38:08.8874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwAQ15aAC9cNAmQwkv8fRyTkZglnbrKc/vJmVsB3/1qBp5hv1Of3cHvORVGZ8CpD8meOj0MCH4ITAQ9x/94yIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5755

CPUs having no model-specific LBRs don't implement DEBUGCTLMSR.LBR
and LBRs can only be enabled if the processor supports architectural
LBRs.

Split the logic to enable LBRs into a separate function and expand the
logic to also implement support for arch LBRs if model-specific LBRs
are not supported.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/msr-index.h        | 18 +++++++++++++
 xen/arch/x86/traps.c                        | 29 ++++++++++++++++++---
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 3e038db618..7b08e1804b 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -139,6 +139,24 @@
 #define  PASID_PASID_MASK                   0x000fffff
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
+#define MSR_ARCH_LBR_CTL                    0x000014ce
+#define  ARCH_LBR_CTL_LBREN                 (_AC(1, ULL) <<  0)
+#define  ARCH_LBR_CTL_OS                    (_AC(1, ULL) <<  1)
+#define  ARCH_LBR_CTL_COND                  (_AC(1, ULL) << 16)
+#define  ARCH_LBR_CTL_NEAR_REL_JMP          (_AC(1, ULL) << 17)
+#define  ARCH_LBR_CTL_NEAR_IND_JMP          (_AC(1, ULL) << 18)
+#define  ARCH_LBR_CTL_NEAR_REL_CALL         (_AC(1, ULL) << 19)
+#define  ARCH_LBR_CTL_NEAR_IND_CALL         (_AC(1, ULL) << 20)
+#define  ARCH_LBR_CTL_NEAR_RET              (_AC(1, ULL) << 21)
+#define  ARCH_LBR_CTL_OTHER_BRANCH          (_AC(1, ULL) << 22)
+#define  ARCH_LBR_CTL_RECORD_ALL            (ARCH_LBR_CTL_COND | \
+                                             ARCH_LBR_CTL_NEAR_REL_JMP | \
+                                             ARCH_LBR_CTL_NEAR_IND_JMP | \
+                                             ARCH_LBR_CTL_NEAR_REL_CALL | \
+                                             ARCH_LBR_CTL_NEAR_IND_CALL | \
+                                             ARCH_LBR_CTL_NEAR_RET | \
+                                             ARCH_LBR_CTL_OTHER_BRANCH)
+
 #define MSR_EFER                            0xc0000080 /* Extended Feature Enable Register */
 #define  EFER_SCE                           (_AC(1, ULL) <<  0) /* SYSCALL Enable */
 #define  EFER_LME                           (_AC(1, ULL) <<  8) /* Long Mode Enable */
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 4c38f6c015..133348d9f9 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1963,6 +1963,29 @@ void do_device_not_available(struct cpu_user_regs *regs)
 #endif
 }
 
+static bool enable_lbr(void)
+{
+    uint64_t debugctl;
+
+    wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
+    rdmsrl(MSR_IA32_DEBUGCTLMSR, debugctl);
+    if ( !(debugctl & IA32_DEBUGCTLMSR_LBR) )
+    {
+        /*
+         * CPUs with no model-specific LBRs always return DEBUGCTLMSR.LBR
+         * == 0, attempt to set arch LBR if available.
+         */
+        if ( !boot_cpu_has(X86_FEATURE_ARCH_LBR) )
+            return false;
+
+        /* Note that LASTINT{FROMIP,TOIP} matches LER_{FROM_IP,TO_IP} */
+        wrmsrl(MSR_ARCH_LBR_CTL, ARCH_LBR_CTL_LBREN | ARCH_LBR_CTL_OS |
+                                 ARCH_LBR_CTL_RECORD_ALL);
+    }
+
+    return true;
+}
+
 void do_debug(struct cpu_user_regs *regs)
 {
     unsigned long dr6;
@@ -1997,7 +2020,7 @@ void do_debug(struct cpu_user_regs *regs)
 
     /* #DB automatically disabled LBR.  Reinstate it if debugging Xen. */
     if ( cpu_has_xen_lbr )
-        wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
+        enable_lbr();
 
     if ( !guest_mode(regs) )
     {
@@ -2179,8 +2202,8 @@ void percpu_traps_init(void)
     if ( !ler_msr && (ler_msr = calc_ler_msr()) )
         setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
 
-    if ( cpu_has_xen_lbr )
-        wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
+    if ( cpu_has_xen_lbr && !enable_lbr() )
+        printk(XENLOG_ERR "CPU#%u: failed to enable LBR\n", smp_processor_id());
 }
 
 void __init init_idt_traps(void)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 9cee4b439e..cd6409f9f3 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -280,6 +280,7 @@ XEN_CPUFEATURE(RTM_ALWAYS_ABORT, 9*32+11) /*! June 2021 TSX defeaturing in micro
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
 XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
+XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Intel ARCH LBR */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
-- 
2.36.0


