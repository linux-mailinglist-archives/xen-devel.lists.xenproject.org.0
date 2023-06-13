Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799B972E046
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 13:02:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548112.855908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91ml-0007qY-MZ; Tue, 13 Jun 2023 11:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548112.855908; Tue, 13 Jun 2023 11:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91ml-0007nF-IJ; Tue, 13 Jun 2023 11:02:03 +0000
Received: by outflank-mailman (input) for mailman id 548112;
 Tue, 13 Jun 2023 11:02:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qeg=CB=citrix.com=prvs=521ad94c6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q91mk-0007Zu-H7
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 11:02:02 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b827f3db-09d9-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 13:02:01 +0200 (CEST)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jun 2023 07:01:57 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by LV8PR03MB7518.namprd03.prod.outlook.com (2603:10b6:408:190::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 11:01:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::3474:a81:a100:1529]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::3474:a81:a100:1529%6]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 11:01:53 +0000
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
X-Inumbo-ID: b827f3db-09d9-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686654121;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YDyR3AYWwDz7F2U7p1Va48mLoi3FggJ2SOmPLybHjto=;
  b=IyLDeuTcF+lvOaoaQroGdPngkSenCJRQVzhHyM4vZstzR/aJsJQ21EXG
   coEDOoaxghywbnpGwjE2C9O0Amgi018RgrlQQ/+0BJbb+GfAFDDNzbM+7
   JK9QzRfzVrKs6Is6SBSL4x++lCDFPwzKV2iKgUqQkKqvAXMQiYFhAUcqL
   U=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 112476844
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:z/kTYqPHPQG5viDvrR2ClsFynXyQoLVcMsEvi/4bfWQNrUpx1zVWz
 jZLC2GPPaqCMTT9fIslbIu0oR4H65HQn4RjGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5wdmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uhMDyZ//
 KAKEh8UMRWA187n8Kq2UuY506zPLOGzVG8ekldJ6GiDSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PtxujeKpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv22rCRzX+nMG4UPLvg9fUtnmDK+jdQVBk4eGCfqNuGtmfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAbShZRZdpgs9U5LRQo2
 UWOhMjBHiF0vfueTnf1y1uPhTa7OCxQIWpcYyYBFFEB+4O6/9h1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxlklDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:K9Nauq13Q18vwtrCfcZfJQqjBNEkLtp133Aq2lEZdPU1SKylfq
 WV98jzuiWYtN98YhsdcLO7WZVoP0myyXcd2+B4AV7IZmXbUQWTQr1f0Q==
X-Talos-CUID: 9a23:ogOuumEpmzzrPk1/qmJpz0BTK8l5YEfy1SjVIB+UWFZxRaWaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AJMjPIg3Q0YrvHd62Fg8dbac3+TUj5fytAwcTrMw?=
 =?us-ascii?q?64IrYMQJdABOUrguLa9py?=
X-IronPort-AV: E=Sophos;i="6.00,239,1681185600"; 
   d="scan'208";a="112476844"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErxQRWYI3NU4h6TpySeaaHEQnB4fV4DqFBJsmvIizImXAuhQYwxL2E9x7CYeg0jkg1yaNLZIC9+rk+lfVYft9ZOInIMO+65XS3rvYvjVAQQKXEb3zF40caD/Bj0VYFL9FwhuNcZARuX938M6K/HbyRFOv/tHyf3pbsSP6g9dboy7PnWnoG2bwdV1sgp4DehDOZl4HNQmEstxVXa0aUYx1aj7nosZSCNggh88U56g4Ms/3InALqibfQA8h707t7PRZBIBIrTpFEhV1rudHOLJQZpZuzt5zr2ERX0QI2tzLHKjjoe+qioCUjhd5hpm3XhPXh9tL1HrG66q8QXq4yH88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMwdBqaoEcIUxdHwAO9oIQE1YEouS7LZTFXu/dIPxD8=;
 b=PHr4oulHzsmqLqjifu0YNsn2pEDN+Kposwf/QNgoZP2Kqi9uMQ8x6PWFpgAAuyctzcGhvJP6ArqjIau+IPFS9xg5zIR7ypqU8B5B3e6osRkJ4Bg8mZzPnwkJ4d+TUFIOtqJ7gQT32aqr3uKhxxskos+iRzialiDMk8rTvmoAmbUoQ/Iz5qpPLvAYql7G5GQCgq82OHZQtRY3GqX5QWcRU37hAUCPiyHonI+WGbwbij3JyYejJ9mxjSo5gyeKHo9NgeJ70C8g5mZ/uH1wZg6XGn1fY/LNyYIZR2SKqRZKCj4YsnaEnNXCDa6/xCG1W00OqBtOaBC1HcBHW0PW2gvttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMwdBqaoEcIUxdHwAO9oIQE1YEouS7LZTFXu/dIPxD8=;
 b=C1rzOwGKvo1BPsIHxvYcyoFI0RHoqTbrVWVjdQJj3e3ss52mIZjLLbw/D8Bu+8qtUbmRCRE277B9Jh6z2iEIprJYZ0LDcx3BQ1vtw3gVawn58R+9YiNWTwHXOi1VBUs7b/cbdlj5OX1k7SqEanHlXuLQxA0r7wI9huJ9Je4D8A4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Jun 2023 13:01:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libs/light: use the cpuid feature names from
 cpufeatureset.h
Message-ID: <ZIhMm2D8pOmsEuY9@Air-de-Roger>
References: <20230605103657.14191-1-roger.pau@citrix.com>
 <cab94580-70cc-4f9e-9da1-4830ba7eaf13@perard>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cab94580-70cc-4f9e-9da1-4830ba7eaf13@perard>
X-ClientProxiedBy: LO2P123CA0078.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|LV8PR03MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5d3326-9191-4f4e-6799-08db6bfd98b7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NRS7uoV5g25qGmaTcQH2qRRYCPCSoPKmp6V+TgA7fe8u+UPpXyeQHZwNtqjyLv2ys0rAkVd2yox3posMLRWPN5ay+Qj1U+75YN7t/nZCqR9ZILeWJNlJmBuMsUV3IdchpAV64Ty/fAKF1JJdqiOQQhP6xDRoJAYn1zIK4NRESB31lh40XjEncCAEVPa8FStFP/vceGEPE5iwN+BSswZVaiwDZlMOhP1fnDP6mwcKK7p3kdZM2RAueco8QMEQy9NMatHUtYirgAMVsjLq7oWnJXctn3FUI/M8Vn/S8ZqY9cwwzjlQVd/ub6lOl/Jg/3i+Y8NKKgwme4mlnkCCI1CPpfYJvsEc+LOhWQSN+etDs5BD9/I6jbbVMwvfW3Q9f9o2EhSjnG5IF++3AAT7D3qGkD6j5Pxcopqn/D2suUW2BRXyRVFRlkK14POZ1gOrOcly8X+KsdVcqFmMUtd2sXFgY+JYYHiNyI9CG7eda6m4YfTRXCcpNBAqrD2+qLWMCtm4JGwIy+gVx7xOHEdC/aBGHRef6SnDX/GzMLPilZZiv0MDqkShD3ZdPTsH9rjWKSXB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199021)(85182001)(41300700001)(6666004)(316002)(6486002)(966005)(5660300002)(66946007)(66476007)(478600001)(54906003)(8936002)(6862004)(4326008)(66899021)(6636002)(66556008)(8676002)(33716001)(86362001)(9686003)(186003)(38100700002)(6512007)(6506007)(26005)(82960400001)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2hlUHpZcVpDNS95c2djWWRRbDdDU1VCZWFPNEpWL1hmWWg4TDdpQlJnK0dG?=
 =?utf-8?B?dnV1WXdHaVZlaEtzRFFFUUtVMUlQbnRneVhtNVhtQkVEZkVuWklQWkNQcjRQ?=
 =?utf-8?B?Y0VQeHJBUFRJa0dGWkt3aERaQUtIZ1RiNGQ2WUNFc3ViT1NLSnpQazc0Tm5k?=
 =?utf-8?B?bVkraDBucXZkT2RBamtqckloTGxONXpuV3R2SGMvMFFCU0J4VDQyUmJUaTF3?=
 =?utf-8?B?L2RTYTM3NlFpRm9hMUI3d0ZaOU83M2dvZVkydTd1VXpubDZkQTJkbXY5MjV5?=
 =?utf-8?B?WW9yenJpZkRHNzhSbXFvMFpaVXVlcFpJK1pReWZFQ1FGL1kwZUp6b2ZFUlox?=
 =?utf-8?B?UGRNSjRGUGJUZXpBMllSbjRseVV2Y3J0dEw1T2VkRXVKYytDVncrRnNvU0VB?=
 =?utf-8?B?OFNFVVZJZHRJMUY5d1JBYy8wZjJvK28ybEZMRCttWllQN1ZUU2lCTkd5Yjk4?=
 =?utf-8?B?ZTNGd2NaU0RRNVBPZTBSc3hMcUJJNURuYjZGSHJvVlFXVFN0UWQrS25lMitn?=
 =?utf-8?B?OCtMRy9lOGlUVVRnMkZQOHNqVkdDdVoweHBYZUd0YktQTlBDMGhJYTZQb0di?=
 =?utf-8?B?M0JvVSs0N1lzSkdudHNVbmJrVFRCbk9sQzQ0SGMwd1pmQXZ4TmZwdVZLRmh5?=
 =?utf-8?B?V0ZtblpNWTRGQ1I0SUYzSlN3cDZONlIyTjdPUjRzeTlPTWFPaWRDS1pjWmR3?=
 =?utf-8?B?WkpDdnJXS3UxRWxtQ2UveEp3R3pHTFhpcFI1VmI5RmZmWmFFUFQ5ZFJ4eHhn?=
 =?utf-8?B?Zk1RbVkvR0d3a1doNjZwZVFtQXNuNkxjK3VYSkxIUjNRWWNpWS9xLzEzRUlS?=
 =?utf-8?B?MzMwSWMwRW5lNjMvWGRlZmlrYy9OZW5EeEtPYUh5cnVFcHRGMVM5emZHQXJa?=
 =?utf-8?B?OWU4TGdiWWdrYTh4UWdnOEVMNUV1Tkl2OEhQdEFDRVdlVzNxWDF4OVpEdDVH?=
 =?utf-8?B?bWh5eVQvRVZqOXd3YXhmRlBQQ09USXpWOVlwTmpRcERHZjlpUTc5bzl0d2FC?=
 =?utf-8?B?S2hGeDlmcXdLaVVNQXZyMXFGN1AzVmZNVTNucFArTmtZejNsdkUwelQydDdL?=
 =?utf-8?B?d0t1MGxMSWZ1L1ZYTlJoL2JDQm9FaUJFUFRuUWR6elc1b1VNN0lSNDZDVkM0?=
 =?utf-8?B?YWM3NnphWVpYb1czb3U1MkhQTE5UZ21CTGk2KzZ1aFh1VC9yS25IdGozZGJi?=
 =?utf-8?B?anJTMzRxSVB2QWY0OXBFcHVPeGVCY2oyWWh1dEhrV3RwOEdVMkdKNEdKRXVt?=
 =?utf-8?B?OW04ODdzUEhkMnRFQ2RNcDRTVjdnZG8wMURqZUNqTEZ2cEduZ3djOUE0NDV6?=
 =?utf-8?B?VWlXc3M3NTJBR1A2dEtVSkNZbmQxZ01EVnJlUDB2bks2bFZLSDlmOUdYRHVU?=
 =?utf-8?B?Z2daNmRvV2NTdFpjVnBja2ozdm1hWjhEcW15ZWZmUFduMS9mT3lpNXdmYmpo?=
 =?utf-8?B?MFM0STNWSGlzQVQ2Z3NQNHhSWEZ2KzZ5QWo5VXpYdUNHVitlSU93bytURjFJ?=
 =?utf-8?B?L3pJUkNUaUZsa1ljZGlHQkNEY2FCMjNZUVViRFJBOUIzcDhuZTU4WVlEU3BK?=
 =?utf-8?B?LzNNWVlaZm05UFk1TXZZMSsyWTh3bmtlS29BdDN5aUNYMDlMNXE3NGhuQ3lM?=
 =?utf-8?B?U1A4VjlxVWUwV0o0Z0NjdzhRN2l6M2tyT2kzckZGWXRMN3lNdVprUUtDakdJ?=
 =?utf-8?B?bVQ5WldyNS9wMXkrbWpzdys5ajkwcXk2TmpxQ3M4S2hieUpzcjlPRzBYbkdY?=
 =?utf-8?B?UVkvdjZwVi9UMGpzSEpuT0t2WURCOUV2a1l4T1ZFQ2xWQk1jMFgrcE9oYk54?=
 =?utf-8?B?WE9RYmd6L2hXRTZVYXdCMDJHeVJqM2dYdjZNTFM5THdIaWhaanlQNXJtV3hh?=
 =?utf-8?B?akhrUEVkQTdEWTdjdk5tMDBxZnFEaVNlUUVWN051UVYyU3o1cnJQcWRtTk9a?=
 =?utf-8?B?aDVRRXdNeHBzUHhrbHFMNkY5WnpNaXYzc0tEbEVMVkhzYkFLRnVUUGRRc3Jy?=
 =?utf-8?B?ZjJpMmVRTnlLOW56ZGZSLzVqa1FoZVlKdmJua2c1TEVSN0RpeGhZZnZEV0Z5?=
 =?utf-8?B?QzZhN052SENybmVmWTZYRVZTbGdFd1NjaFphTTRBYnROV3FLcDJ2TXIwZ24v?=
 =?utf-8?Q?DpNj6GaQy0CaDQGfuMRSbxEMt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7889dsppeWjnZ/2f6CqcEAMvgfPz+NaaLiDm0qJ4Wc99N3roudoAIp+j0SWCTwvU3ON102WGY97Oc+TBnExiMmDEhTBoJFdN0ojfSjjsPZIupEPMjkgpCec8jhmqcVZn8y7kM4q/9xPBseVtAnNjldG/LArAEjgYWlNR1D55OIoHWk0XFKn4VWijmS60ruOcSecNFw624C7/oMqVHkZRbREKHtAhEHU9/ruEEqgLsU+V3U8ABCpYlQ0ZbqM5cGycqz87oyZsfqAroRe26fjgmXatjZnZiW6WLrz+Qk+ln/P/SPC29CijIikPJ+INx+MDh3uxfI2Cej2/70d7X74+WyjqWvy+mZyMGa3FhuTYBw2q7/hnBX37TfHTFKg2bFw7THTlZQXVFLsvMVqhgDGaGWNpeT/CsqgHE6qH4Wt7sku7IRutMGT/IdW6zLEt2HN4X2nTQF1/jCb34gzBG719qjYNQ4SojPH8t1xmVYix/idXVdaMlnvFLVxAIAEV0ZrefiGCO6eGQlH5pijPb1rPnbkKqHmifd7apOlbdnpTIEslbRkWYyfmfBsXdLAwV3BJKQCwpoA2k56dINfjQ9Lwmnhp8XSpSUuDLcQ7XgHgCjAKh774nkOoKlFMj3RzXqi1XT2UHpyYd2TKdsdUuiKu1wDP9ZrsgHZIXzfXLiVaexjWaR4/dcrGy/ALxuhBGdTFmIAGA7Pi7kRx/5uMp0P4tT+MlN+EoFPLZP2l75yTwie0oDJcNQgkBcLOq/ecPLjuXRTaAhIbKJCHkvDND010TQ9lgJv+5B5OXP+Va+GvgPpBVwc0MljWmbzgfXl7vDjgN8cczIg5139S5AuwKveY+A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5d3326-9191-4f4e-6799-08db6bfd98b7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 11:01:53.7588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHLyc4JXMN+SconSmz+UOAVmspqZ4xI06bnvpH6uAYs88S5onWgoablr7FS8TpNalIJPFh8ZOGxFY33AucfO0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7518

On Tue, Jun 13, 2023 at 11:44:51AM +0100, Anthony PERARD wrote:
> On Mon, Jun 05, 2023 at 12:36:57PM +0200, Roger Pau Monne wrote:
> > The current implementation in libxl_cpuid_parse_config() requires
> > keeping a list of cpuid feature bits that should be mostly in sync
> > with the contents of cpufeatureset.h.
> > 
> > Avoid such duplication by using the automatically generated list of
> > cpuid features in INIT_FEATURE_NAMES in order to map feature names to
> > featureset bits, and then translate from featureset bits into cpuid
> > leaf, subleaf, register tuple.
> > 
> > Note that the full contents of the previous cpuid translation table
> > can't be removed.  That's because some feature names allowed by libxl
> > are not described in the featuresets, or because naming has diverged
> > and the previous nomenclature is preserved for compatibility reasons.
> > 
> > Should result in no functional change observed by callers, albeit some
> > new cpuid features will be available as a result of the change.
> 
> I've looked at the removed lists, and some cpuid flag name might be
> missing with this patch.
> 
> When looking in "libxl_cpuid.c" and
> tools/include/xen/lib/x86/cpuid-autogen.h (INIT_FEATURE_NAMES), I found
> that some flags removed from libxl_cpuid.c seems to be missing with this
> patch:
>     "sse4_1"
>     "sse4_2"
>     "tsc_adjust"
>     "cmt"

Hm, I got confused with the _ vs - notation, and with cmt I wrongly
deleted it I guess.

> I did the same with the list removed from the man page, and those
> flags are missing (some were probably also missing before, so probably
> not a problem:
>     "avx512ifma"
>     "avx512vbmi"

Those two where already missing, so I'm not planning to add those.

>     "cmt"
>     "sse4_1"
>     "sse4_2"
>     "tsc_adjust"

Those are an oversight and will be added back to cpuid_flags array.

> 
> So, at least for the first list, is it a problem? Or did I failed to
> check them properly?
> (It seems that "cmt" or "tsc_adjust" for example comes from libvirt,
> 90b2a267c19c ("libxl: add more cpuid flags handling"))
> 
> > While there constify cpuid_flags name field.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index 24ac92718288..c5c5b8716521 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -2010,24 +2010,12 @@ proccount procpkg stepping
> >  
> >  =back
> >  
> > -List of keys taking a character:
> > +List of keys taking a character can be found in the public header file
> > +L<arch-x86/cpufeatureset.h|http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,arch-x86,cpufeatureset.h.html>
> 
> https:// ;-)
> 
> And this probably want to be "xenbits.xenproject.org"
> 
> Also, I think there's maybe an issue with this link. Maybe someone can
> assume that "TM1" takes a character, but that flags I think would get
> rejected, issue with upper case vs lower case. Then, if we deal with
> the casing, we still have feature like "AVX512_IFMA", which would only
> be recognize if written "avx512-ifma", so issue with "-" vs "_".

Right, it's not perfect, but I don't see much better way if we want to
keep the documentation in sync.

> > diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> > index f5ce9f97959c..0c7ffff416fe 100644
> > --- a/tools/libs/light/libxl_cpuid.c
> > +++ b/tools/libs/light/libxl_cpuid.c
> > @@ -342,6 +214,28 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
> >          if(!strncmp(str, flag->name, sep - str) && flag->name[sep - str] == 0)
> >              break;
> >      }
> > +    if (flag->name == NULL) {
> > +        const struct feature_name *feat;
> > +        /* Provide a NUL terminated feature name to the search helper. */
> > +        char *name = strndup(str, sep - str);
> > +
> > +        if (name == NULL)
> > +            return 4;
> 
> out-of-memory are usually fatal in libxl. Any reason to use `strndup`
> instead of `libxl__strndup`? I guess we don't have any libxl_ctx, so we
> can't use the libxl function.

Yes, even NO_GC requires a CTX.

> So, instead of returning an arbitrary integer that isn't returned yet by
> the function, could you return ERROR_NOMEM?

That would be my preference, but the function already returns
(arbitrary) integers as error codes, so I'm not sure whether
ERROR_NOMEM won't alias with one of the existing error codes.

> I wonder if it would be possible to use a buffer on the stack instead,
> but it might not be worth the effort to find the right size.

Hm, I could in theory try to do that, as feature names tend to be
small, however I think the implementation would be fragile, as the
length of the feature name is based on user input (iow: we would do an
alloca() using a user provided size).

Thanks, Roger.

