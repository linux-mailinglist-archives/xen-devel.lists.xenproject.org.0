Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC8A75B3F4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 18:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566707.885896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMWIR-0003rU-7L; Thu, 20 Jul 2023 16:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566707.885896; Thu, 20 Jul 2023 16:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMWIR-0003pe-44; Thu, 20 Jul 2023 16:14:31 +0000
Received: by outflank-mailman (input) for mailman id 566707;
 Thu, 20 Jul 2023 16:14:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMWIP-0003pY-AE
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 16:14:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e3494a6-2718-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 18:14:26 +0200 (CEST)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 12:14:18 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5006.namprd03.prod.outlook.com (2603:10b6:208:1a4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 16:14:16 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 16:14:15 +0000
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
X-Inumbo-ID: 7e3494a6-2718-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689869666;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4c+AGg5lgNWFFMOoxEg4tuEpINgWlOvjczJfPLBLvFI=;
  b=cyxVrld7CPJRuAAl0a2+Fp2rWS1a4cvKxNI8wYZySgYjja7j1OW2rNlR
   rKYQ2U88/0nM4QXWL5DrDqDZkOP+O+UkaVtpu4vo2mVvv+Bzc13W7XME4
   aOIJHkJgeWbzQOjfUVv+yihrbKtJJKmXMGAQhLInZfQ3H+zgKAWW36Jr6
   g=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 116184633
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zbxjVq/jWdWsOweIN1VkDrUDUX+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 zceXj3UbP+LN2Khf9BzPYvl8BxTsZOGzdc3T1A//Cw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqoT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl+1
 KAfNTkyfyyGuNic/ZaybsZtqMA8eZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAruFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aRxHOnBtlJfFG+3q5k22CNgWg3NEdIRECBrsvmyXWSS80Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwD+Kzq3Y8gOIHF8uRzRKaMElnMIuTDls3
 ViM9/vOATFsq7STRWiq37GYty6pOSMVIGkBYgcJVQIApdLkpekbnh/JC9puDqOxptn0Ai3rh
 SCHqjAkgLcehtJN0L+0lW0rmBqpr5nNCwsqvAPeWzv/6hsjPNL/IYu19VLc8PBMap6DSUWMt
 2QFnM7Y6/0SCZaKl2qGR+Bl8KyV2stp+Qb02TZHd6TNPRz3k5J/Vei8OA1DGXo=
IronPort-HdrOrdr: A9a23:YjbMPalD6ovpPABiwy/5a+GZVQjpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: =?us-ascii?q?9a23=3AT04fjmseuZSrK5mrRyvAgZVQ6IsVUyHa0X7vMnO?=
 =?us-ascii?q?9NlxDdZmcbXCR1qd7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AvqxZsQ424//3kgGy4O07Ijnuxow47f+TFgcJtal?=
 =?us-ascii?q?c5difDyNCZHSmoCSoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,219,1684814400"; 
   d="scan'208";a="116184633"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgDr00UbT3RrAUGa+2nLhl5CKM1H8jwo4bb++ZGscQjGUVPmbv6sJAFY5RVPXbfCq3ChDCMop7teQ4iFB/yo5SYwWo+cSDdwDInR59XPiyeXTIrLK/tRaPd4BLQTPwTnTc0KE2ryUc7YFAIY9tpffOxSPuEpFQGXuh0RjbK3z4x7LaIHtgyCUtwnOcVtvi4yn+a3EQ5Zv/LWRsM7YRw4pHQjYTEO0pdLmTD1i3ggopG4Luex1btjc9sNf8yTCAslWu5/cAPd49sTY4tdNpkOZltxJMe91+/YCPFKoME+F3xj66q9TuDe2ZZsIQlsfCDmQGhXhZ3tNfMcgRoEznknhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5XqeSpoSMiHGxJV+Hfwi6aytvUycZVxS45ve2ddLmY=;
 b=LskurM+gdbwEM6FO557nLfVU3ilBOg4sqcP2ms1LJ93jLTGyq0E3KFYkx690WFc9FvzXEy3FzHnuwDRjN6GflC3eIFVg5jPaBpJbdzIulAXqPuYxlvqqC+eUnLMSOYwP6C0cA8JWTSPRuq2XGekb8Ht55GV5xgsA0gAM5u0mMhPpDa7mdC9yObH84JkUrIMrGq8h6SrWI+TeAmhkDZKUkux3m1kVvFgpoyqUi5kWZZIoEd8j8neQ14uiTAu0AmrTmkjevEtPUltQHcaZ68Eeg9DVVQ+R9ulEylJyWTlJZ/bT8IDe11zhfH8SJgtBi3g8ifu49DcSE/AEyYzSoJ0x9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5XqeSpoSMiHGxJV+Hfwi6aytvUycZVxS45ve2ddLmY=;
 b=aDAB5BikmX1zY+VPXXf3P5v/9LMs27akLhroHVFf7C2aRkt9gHXnD6YRye0HSwnh9CwiwlTBxgIMVRBZodjZe46eZirFZcVh1R0VNULu2irHxMQSYzSnItVQbExKncTdzLvlLbvYWp/7cpNo0Jo2eyMPidmIo4n+KkdoFMlHoM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Jul 2023 18:14:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZLldU9ZNM5BRXqeY@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <e9331a8c-69b5-b803-7989-7e3b95b815e4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e9331a8c-69b5-b803-7989-7e3b95b815e4@suse.com>
X-ClientProxiedBy: LO4P123CA0129.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8e313f-f647-4126-9ab6-08db893c5d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CAD5w7NVFVyNF+xHY6+pHzgyL2KYcxAlCxjeeWNHVI8LfYz5sI+Da1vEDA+H0wqT5pf0gxB2ysUjBIX1h99LgPPGq6KjogBS39JZdWKgOap4ZJnBYGaLyK0XaKeWRu9zUvdPceqaPrm1tPQ93+2sGvndrSkMFcuP4XCz6zKwr5sksobc2776jblPlWJ6CCPSJpOV8DBAxHd2q4ppQsvLZJPgYldFbkvTdpqFbPSW2BL1svUum5rbeayzFRgdj5YscY6nB4RGpvka7GC2KHh72t9tApkMM03MspcVujJnOZl0YmP/xNwV+cGf6VTfBGd2BWzHEYZTXvBRniMBgws0OGMETxSwofgpP0vS+TGvBnkf6mptrsCuO3xIZ1b+7cctWMKWmqRa0z42OXtau59q29TgJnpxQGggf9KKBRf1NwOQDIS/priAtGiDbuToFi5BmUWIPDC/730EzaJpU4cfUudEQKJF5k8anADc4NTpkEkBSz9AKRo4BQ9DWkQgA9aWeP8qbaOHYBr07yJ2EfN1nH1kdwqGPG2AvaKwq4N7mYfH9T6mj0f7BlmGXkYsgXbt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(2906002)(4744005)(54906003)(478600001)(41300700001)(8936002)(8676002)(5660300002)(66556008)(66476007)(66946007)(4326008)(6916009)(316002)(82960400001)(85182001)(86362001)(26005)(186003)(6506007)(53546011)(9686003)(6486002)(83380400001)(6512007)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzNHZDg0a0F3SEpnenkyc3g5WWwybGMyVjJ5VG5rcmFtYnoxbzVtajcxM3RO?=
 =?utf-8?B?T01JQWh1U2djUW4rTUp4MFFmUCs5bmFwT0Z3cjhGZVVybUZPZ294R2lqYXR1?=
 =?utf-8?B?T1ZKOXFWUk9ZZXp1L1hrVUdCQzI4RHl3eDQ5RXNYbWpuOThlQVZRTlRNMkNK?=
 =?utf-8?B?ZTJEUHNWblNoOHYvN2U0ak5qZmpxTVZFRzdUT3JQSk5sNkxWN0d4RW1rbER4?=
 =?utf-8?B?R0dzeHhCOElUTDZCckx4djZNQzc0UHJ4dXpBWktGTnNtc1o2Q3dXemQzYmsw?=
 =?utf-8?B?VTBOeVVIeCtla3RnZnlxcWVKK2w4Y2EyRGVNSTdqMlNGbFZwRGhydm82eXp1?=
 =?utf-8?B?L0xONTlzWEwwVUl4a1pjbk1OeFgrcUdFMndvUjNDTDZpNWxnTklGSWQzQzlG?=
 =?utf-8?B?NkU5TDhINGcyOGtPMVZWYi9sdEtNQ3BmVkdOc0kzZG5XNnpURzMrSTlvZGFW?=
 =?utf-8?B?dFc4NWN0N01QUDFqMHdsSkVBbHUzVXV6M3VxSFh2ZGI2N0ptTXVTaDI5T3dw?=
 =?utf-8?B?V2F3RkJZTFlBK2FqQ3p6SDkxNWk2ZlBJem9CenhSQlhkajFtZnBDbFJ3MzNw?=
 =?utf-8?B?TkdjR1lGZW1CN3p6bENsZGdZVWdRbndFdDhmZU1TWVN5eUh2VUh0TTlYVldi?=
 =?utf-8?B?YWE0SWxBNEEwNW91cVhLOVpqaGlYQ1RkbjRnblZaQzNXYUtWRjB3SWVtSk83?=
 =?utf-8?B?UTJYdjFhTHFRN1Y1UFpFUzZHQVp4WmxJNFltZ2t5MW5BOVFXdExKWjVHcU1G?=
 =?utf-8?B?VnQyMnRSWWNjSDQxdDA3UE1tY09qdGZpODJ5NTN3YjMra05DeEpBRnRFQjYw?=
 =?utf-8?B?d3VPbUwzZnJlZjlzVzA0ZncyZ01tSHFYbmpXWTc3MGQvRjNUL0FaZi9uaHlt?=
 =?utf-8?B?T2VBNms4a2RLZlpQWHdLeTdxMEZPUlMyUWhRY1ZTMzdCLzdJUmRXVTFocHZu?=
 =?utf-8?B?NVMrZWk1MjdGMXBJbXY4eGRkNWh0all4YTdZcmdtSlVGTTEzdGFqWThIUDR1?=
 =?utf-8?B?SHVQZ1AweUNMMzRZVDdzSjhDQ2ZWTlJEdFZ2ZjQ2V3FlVy85cWVXcVU5bWs4?=
 =?utf-8?B?ZWFDTms5QnpWcmo0R09qb1lja0h3M05pREcvT0poZUtSbFBvYmVWNXRoK01O?=
 =?utf-8?B?bzBqTERBcExNUTVpcU9XK21PSG5OSVQ0bCsvYkd3d051Z29ZMjhCaVpDd3BW?=
 =?utf-8?B?K0t3amxIVlowMkU5OU0zRVZqVWRWRnROTnJxRXpPdGhISzF2M211eWx5Rk51?=
 =?utf-8?B?NmcxVXFkVUJDTzdocjdRUlRvL2xnRExEMTNWZkQ1cFh3NDc2UGxhKzNZRXZa?=
 =?utf-8?B?K0ZRdkpqNWw0WmlUWFhFV25WWG0rcC9OZ3NDOTZ0WTJXZyt0MUpEbkpmem11?=
 =?utf-8?B?NTVGUzZ2Q3pqcUhjQm1tTG5Tbm9oYzBLVjdFY2ROWjMyMkNuVDgxV1dINW1S?=
 =?utf-8?B?ZGE2YWVwVHJGbXBXNUVkWks0bktJQXo3VEdia2tseFE4VVhDQkswN1VLS3Vi?=
 =?utf-8?B?eXBHSENEcjZkWWZ6VHNCOTlteVZKa1RKZ3ZkZklVZ2NnTGdzUm5JelllODht?=
 =?utf-8?B?MVNiRTFxNnNtYzc5UTVBMDBXeis3dys3eHBmZGdhbWJ2amVYRk02dUtBRUwr?=
 =?utf-8?B?MHlDZlVxL3RkMkdveXNNUThHMmx1QTI5NXZ3V3loTHI5bExZaHpMbFhDR3I5?=
 =?utf-8?B?dzhsZGNhWVdEZGYxSG1tR0kydUJtUDVkVitwUDJ6RzlFRlFKOGk3UHYzNitl?=
 =?utf-8?B?SUpBSHIvSnBwSHRLdzhjM2YxYWNad1R1RFFBQ2FubXRqRkxEN2xMR0RlYTFP?=
 =?utf-8?B?RzhnTlZQd3h1Si9namxONGhZN3g2OU5QUURUVTJvRUhra2p2NWJHWVgyVzJN?=
 =?utf-8?B?UmFhYkwza2dxVkxsYTJ0ejFYRHNGcmhvbWdibUxYWnIxMmFsL1J6SGlna0xH?=
 =?utf-8?B?QjBnS213S2MxNFZSRDRTNjdidk1oM1oxZkxyVXBoVDNxVWp2NmM3dExKOFRR?=
 =?utf-8?B?ekFJUGNVVnl4Lys1OGxOcG9yZExzVkYvSGR4dUtINEFWd3Ard1BoU2ZzM1FP?=
 =?utf-8?B?Zk9yMGFTZERDRmhwRmpXUjlmbDZMNGJTNjBkSFdGN21KTzRpZ0NmSVQ2TkE4?=
 =?utf-8?B?Tnh2a3orSzAzTWhrUXpza0VrTWE1aHQ0aC85MkQ1eDFNVlRjWW5JYTd6UVRw?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uvZdxteuqkDvH8d6OxaKLa6PyRFJ2PPxtGCArouaWuFucNQueWh0rq3Oq3QITXMNvvhtCjloMZgzpJZBmyUvNASIWSLLMHSaNXh2a85sUt1uJ4QAXpiPf9w97ffh/SQRD0hV2sWS5yEx9SOvV8tRcCj80PAplmsj08qbOITephjuG9E32sDQegVrdc/RtpfgFcBKdcFMUgoXGwki7+F/XhlvDm+OnxyTqOXqMaw9jvpA+HiPZjpBPcjZKoDyyhzaH9K0+RaJSauZVoZFT0lnkZmYmBjBzPfpSbM0TBs9txyEKMp8vLiIdaRLVNaIvrDpKmCm47cABG8c2e9De8RF3WXRkxbhIujC6otNy75HLGrRHyK6+ZOX75+6J3/4ZOWXM5o3tZEFEMBEki/hkw9lpRK+/eyNtU0Qb3Db18/Aec/SbdzxvQP8XGGrJI9+mTKfCSRUqpUhIVdoAWsbqS9XP2WG+6xTI5z1XdE7DLbDeHB8Fij7qWHm5t00N6OgmRaw+f3tXkeZEhEhgZf3CahSEhWJD93LdVwr4u2FljLK+Xjng6NpyOxwDU2B3iZthdGsKPfxa7mvrLITTkbo7AO9oozkAuv6SyIS7E5WEf8YN2zfaBg2q6EIXfPBXbyHLniOf4D6KsMFlRO6G2ZXvKwkcE+NGpLGBsUh/tJYod4xwCJc4sWd7GltGPRhUwlZZCBtvuUfbndxNGryLTvO0tpcrE0sjrdJqwJ5VhmBGSeCdAJkEz8PEHKT3UJCDqbFc8FdvAWvRwKmyos7S6+k++R+2+sGO6DHMZ729z7av7wBIuYVo+OFq+aZ/0ETuPT2VYtFMjGwlP14WX1Czu9Ts78QUg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8e313f-f647-4126-9ab6-08db893c5d26
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 16:14:15.7758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1etd7+qx8lKXJtBYpSuTFXLbcW8XktrmXBbmsXjVsxRrh1HQJVLtLZy5fDKodCOd/fCa/HNICGi7hQGczu0dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5006

On Thu, Jul 20, 2023 at 06:03:49PM +0200, Jan Beulich wrote:
> On 20.07.2023 02:32, Volodymyr Babchuk wrote:
> > --- a/xen/drivers/vpci/msi.c
> > +++ b/xen/drivers/vpci/msi.c
> > @@ -190,6 +190,8 @@ static int cf_check init_msi(struct pci_dev *pdev)
> >      uint16_t control;
> >      int ret;
> >  
> > +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> 
> I'm afraid I have to ask the opposite question, compared to Roger's:
> Why do you need the lock held for write here (and in init_msix())?
> Neither list of devices nor the pdev->vpci pointer are being
> altered.

This is called from vpci_add_handlers() which will acquire (or
requires being called) with the lock in write mode in order to set
pdev->vpci I would assume.  Strictly speaking however the init
handlers don't require the lock in write mode unless we use such
locking to get exclusive access to all the devices assigned to the
domain BARs array for modify_bars().

Thanks, Roger.

