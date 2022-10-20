Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 801E1606061
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 14:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426711.675334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olUoA-0001F5-IM; Thu, 20 Oct 2022 12:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426711.675334; Thu, 20 Oct 2022 12:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olUoA-0001C8-F9; Thu, 20 Oct 2022 12:37:58 +0000
Received: by outflank-mailman (input) for mailman id 426711;
 Thu, 20 Oct 2022 12:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NEB=2V=citrix.com=prvs=285423218=roger.pau@srs-se1.protection.inumbo.net>)
 id 1olUo8-0001C2-SP
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 12:37:56 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04292aca-5074-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 14:37:55 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 08:37:50 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA0PR03MB5468.namprd03.prod.outlook.com (2603:10b6:806:b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 12:37:50 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 12:37:49 +0000
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
X-Inumbo-ID: 04292aca-5074-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666269473;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/un6VEClOFwm7x7cbxplUj4ScOZCfgWq3hUabeMfFGs=;
  b=FOUSIeNtY3zVnnslwuauicu4Y583Hm+Qeh1MrEs64y4jUs0we3QErge+
   ZhVToMRnCFQFx1n72B7lXS/+0a/JQUxShDkmPMMfJln07PJhFZex87SwB
   fqXK9SKy242sRaYIs4UcvYV8uczvLW5ZPHOfIDCE8FIx7zvayu82eJ8WA
   Q=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 83172328
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AK+uGNqIodHx0xq1fFE//H55y2zyVRhNe4xP0q?=
 =?us-ascii?q?kklJ80ptzqEa7yP1Ac8D68u64Nik5vdqf7RNLSqVVbxnmaZA79hCNQ9ovWCc?=
 =?us-ascii?q?3KLehd7hyqqmtozZah+vgnCfLxk1pnDENKXd20SyO5sKQ3qsLa9Nyz67Hv7Y?=
 =?us-ascii?q?eG6ZJViJv8KTomB/ZYxKw2Vu+FyBBZdDTpI8DkyRp4x2GP44gGYJIIFcZgm3?=
 =?us-ascii?q?U9PDhdF6LayaeIYoH3ipfOVwwCxaJ3BbWd92jGvqBw+jkxo6xJwVXbgTtA7Y?=
 =?us-ascii?q?1UYdqJ6lTIu8o5AYbP+boPxBuyb0AjskvM5n9swpyUTQkKv7qDIzLVbJOm1K?=
 =?us-ascii?q?nwOlaZBf7Ks7MQFQunxcscXWqaWtwSb4HgCVPSevQkZ5UbG0TAFgFf2YApUh?=
 =?us-ascii?q?nmZdGdI7NMt9G2fVRqiVZzY391CiqmR6hTTp1/SBBplAXfbJNjIvFWehvh99?=
 =?us-ascii?q?wSne7G3xkU7Urdn1dApkprTNKHnyb6qMzujEtrFL4QLLYQu6cg3lIPUve7zb?=
 =?us-ascii?q?X09jwL5nc7hntJmM7/feLlTQ4Ud1l6BYNz0okU5GMBbOL6F+QcLg5xnAByCZ?=
 =?us-ascii?q?rlYYf14hiNQ1UTBu0WL0rMcnUUUmIxOWDIw+hCIC2CsG3ofdU5S1dsj/7AMd?=
 =?us-ascii?q?SZUSV0Dnh5r/jGW/sU46dFh6QCsVe+TypYuNe0xpdHNesr4oqmZNm1feZvVm?=
 =?us-ascii?q?Qu/7Upq74wi3cE23VIyPjEsKU0vVESFot1K662fwvCKFv7CCU51os+gQV1P6?=
 =?us-ascii?q?JtEHFfEa7e/wjuFu9cemGhlHSGuFq3CPDS5rwgG8/i4Z5mqGCI6uNqs2pDgd?=
 =?us-ascii?q?nsIJIjC68YO6QgpiaNHDMj1g6ecJhiAWAhv0EHI50YGqyLKguysrnZY47SU6?=
 =?us-ascii?q?Tzotn0p0N/Qz0uy/fwgbxcYurv7JhT8lYcguJ6v5fNviiSXE2n96ro0bf0m4?=
 =?us-ascii?q?0GDtQ6nw1CDu82YKtjRAd1O67Hh5gr/Ec1Iy1hcyBRmT9kfRcTs5YTNphJJ+?=
 =?us-ascii?q?YmdpjrqX6GgMjIhUj9A0YetcoBeBC45KaMCxz9e+6POjPzY1OGEQ7bbUeo/g?=
 =?us-ascii?q?qtSbsCaIDeLk17Lg1wpVt5w5pGIZ57epgsNndqkB+F3fRzQ06xDmssX57O3a?=
 =?us-ascii?q?/XvwnUK4NkSaIHMEXaDuAgSvTWkylPDCy46SeXqRoYrxtCyfBtNlsZPp3uNX?=
 =?us-ascii?q?L9QFPnWCfiGOvidN6cMgVezwNdiwgrR23F9q8YgmZCHYzQ6JO7UOmpnnFtb9?=
 =?us-ascii?q?NxuS1QR+lG8Bg7SV9eDizqCqiO5qzfm2Y5dARM7l2UIzQVKfjUfLkEbC18Zm?=
 =?us-ascii?q?8piMZT33OzO3IoNqiD/BtMmR9XZGL8TKLqQm527fJUMFcEWXVywegAGpfwfd?=
 =?us-ascii?q?xz+h8DBn119iXVyjIdWaB+5JSjO9gYNNhA8EpyXehv72+2Vt9fREqeQPbS3n?=
 =?us-ascii?q?/U6im2Gi8A00tno8Yne2JCdTI9oVvtBcWg+YlhRTf9l2v/u3vmCZuTQD2Vq2?=
 =?us-ascii?q?Fbo49ooUlyBkB9NNDwQd9DFK97isiIMpmGdH1NoDHlLiwbJIW7GvwCIuyiMf?=
 =?us-ascii?q?KIb6IdZYXRGAZ5XNcc2O2+FQyBipON2iduYa/MvJkWjy6lGIX4+KaQucDWeb?=
 =?us-ascii?q?CXGxgEBhMT9U+B1kdG7ittbl8aA3qbg5BwaigYSnDldYy/9A1sBQrGXhKuQX?=
 =?us-ascii?q?uB+SITIiySg484dBPrTcAMBRC2mHmgbiM3dT9oB98vgaX9NUIvmoRr5xmnqt?=
 =?us-ascii?q?1IFWuK/sVT8VWE17cQ3EM5D6H1mXc3R8SpK3GNBWYdfapPj7kHYapNvtyKVI?=
 =?us-ascii?q?/ePe7aVV2NglwctixSW4Ey07d1Gcc81ljmuY+VQ55BI0RqSwWCHhox4vN57V?=
 =?us-ascii?q?X/O/m0VslVxXUpAFji9Szos9j5xgbLLNl0eHR/68nPH60R5v2uCZlQ/vziSj?=
 =?us-ascii?q?uxHUx7eqV8K7NEMYFaAGDNW5BPZ6IH43R2znXsywLNXO+UMsgq+/+ryq3s2B?=
 =?us-ascii?q?fS3vbkdvtmd2KlNpYl8I7vfU6s3Kl5ozN4dU3miJRBCH1YAj8lBDejKt64qZ?=
 =?us-ascii?q?Tv3a5bh8qhzbLt1RdnOo6Hj2T7KtcM57NoBZBcHAuiem7bAV0ENu5iASwY5x?=
 =?us-ascii?q?tl0/nc58y7VriO8MaKOfNB4y2p49havxGtdeUtEmX7uNoocJduMSORyL8k8X?=
 =?us-ascii?q?OIoVs76b+TjRyWEoficyKMdN4JmMz1ip/f/h34UhLc9Wx28ilIvsCwX2yz+P?=
 =?us-ascii?q?5OqSe+SEDtsumXPxzzjomPvIp/m+ZzIBAyZxvRW4S4gMcA7edTqOz6AJ+XBK?=
 =?us-ascii?q?UsSSMprRoSFAMuVV5G9kCg/Vm3cV0H7IUdM2GQu4Bp96tfahqx7F8tPDPLu5?=
 =?us-ascii?q?xeGPEueEx/xl9nK6js=3D?=
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="83172328"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lawLpx0dpbin4ZI2bGqJ0lLCRVakDHjiZdhApLT/EOaUFsoaJeYVC+vBQhS8vkdH1rXVYl3y/eiYCtMVPDNuCmUbcH3Q5ZXVuvjvqtzy2GVX5hjpsH//y0Wz0ImQAE2cozvAlLq1xLEt/jbKkhmB6+d11Wgbo0Pyb6DmvtXsJgMtoZYXhQeVzITTgx+H8R//2XQa0MBwn45mBXrix/51PWmlePvYhgr4n4yfo0MfTnlCL72MfpzW62B4Kdb2r+XDc1Nj3bOQ/0MH3qNITgjdADpNL7WPRBZxhIPJsptgHN+sydrLw7hWV62mMqTKjp2eGk1HLyGuH4wmuWXn3m88fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVFDYb/qQDQOUHvmwog2L/8QbdFFGV3QOgAsYVTKyLY=;
 b=BaV0b3Iy/n5JOtOHrskGa7P25KVhxkOvdu1wEjnOqJFK1cDL0vxpngZ+zfyA32mfCt4SFrXsbivwYTbGtDzunPkoaJecbp3XtPtNN9V4teYR2c2zVqEpqwm24GN+0H3zCIOvxHHBuInsKqaKZEhHaDpwea9ZGRJtV6WFsub1ScF+xwQ95s2WPGzKSekCNjxbZkSR4KRzBR86sQrgfpU2tk802/zTLCJTDzTUiH9ndpsx30YY+oimwQW+NogrtTUhPV9gtQXy5CEPR7QL5im4wr85dXVKtAOahMupZwfsvLIMJUX8npH3BAew3F2UY3OFvrwj9sy8JngySgeePR3iDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVFDYb/qQDQOUHvmwog2L/8QbdFFGV3QOgAsYVTKyLY=;
 b=fDJm9gB4lnRQOyW+w8Xb9+10QZFndX2HM1On/U8IMXoA4Aab4JjK7rlcwzfLDLR/4UYns3qjRFeLmiKzZfbTfKwJ63lckL6K6LK90UmNyvIFimE9slSWIEMZ+ZWByXzjML38BgXuuNuI2I5QCmV7XYfWG8vuj3Ms2uqp7pEybJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Oct 2022 14:37:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: Intended behavior/usage of SSBD setting
Message-ID: <Y1FBGTx5cSrkdVbZ@Air-de-Roger>
References: <Y1Eqk6D0dBDR4m4u@Air-de-Roger>
 <2f5ec31e-2ac5-2b22-8801-9ebdc4946962@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f5ec31e-2ac5-2b22-8801-9ebdc4946962@suse.com>
X-ClientProxiedBy: BN8PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:408:70::42) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA0PR03MB5468:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c37271-d574-4ae5-084b-08dab297e5fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zoUEawQsH2b6fjngw/2Aw56TYKg8qQwsmc79QFGIbSSaeVScFp0NF7GrWl58ixAjg3VXmZZMSeX1UeGWyPk6zm1xvpmWyD3mwIUnuypeGhHPKc25I8iiTxPKh0fkNd36BU0g30vi+IZK+3jkYilEeNRn52pwgI+S3gz2Q9piaMqHUh6PTY+WN6qoBBRB5y7WyIrS/6f6kKgP0sV23M1eVKZaasGBuGAoaGZS+Cj6mGPRsfSkjlAYZ2egDTINPWvXF9n4UhMCMOBMyclVNez0JiJ6VpBIT5Z8zLbyS//LouD+fXOIKp5gjRZhQ09MscIardOgeG+b2gWTa11MhuUn2hNsTlWzogpzMvyxRwW8q5OPwcGYAsNY72UcSha6w1acGta9R2hrANzQE0r6n9X6kNV0Wc7qZPrirSeHyqfWXD1uZdGQBMlMkJQfEgI+gV7NSf+MpxPH5HwNiaVX6ZrEa+vYyOVKnHUYqHA3bsYMPqyI786D7S+dSpErzkgn8KggOXM0F0oFVjjfOetkKnBSPPrOpfLx6BWZe+cpwqK5ymJlhDZNadva0tyMJ4E+V64Fmun06fs+G5bQ6f59znodsP8m+jPoiKgwSrUmpQbLuQYa34xP/xxcuzk6q+EWam6z5Vok8J/SyWp44HiyCr4J9LH9SHw0Qv/y6dOAxRAUj20TFMMGZaPmwPULhpubJ/mEgYYgaL+BgC9EeKgBP+39+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199015)(26005)(8676002)(66946007)(4326008)(66476007)(66556008)(6506007)(6512007)(83380400001)(41300700001)(85182001)(86362001)(5660300002)(53546011)(316002)(9686003)(8936002)(38100700002)(6916009)(6666004)(6486002)(82960400001)(186003)(33716001)(66899015)(2906002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWJ1YkFZenlGalZCVFlLd0ZPcVJ6a21WTXNHM1VaOThSK2QwYmRrSXVwTllp?=
 =?utf-8?B?QVByck5vNFpBdzl0YTkwZEQrRnluRmszS1l2K015dzlCTEk4K2lqME9kaWFN?=
 =?utf-8?B?MzJVMllReTYxUk02WkVqdjdrMGZLVU9YM0Q3dDkyblhlVUlPUThwL293WXlH?=
 =?utf-8?B?Q2NBOEF6ZVhOYkpmR0J3Ujd1dWMxNnJtZFN2SHdLaFhOQzhsRjcza1cyazRn?=
 =?utf-8?B?VHFHUExlUGY5Mktib3RscFlRVWJTQnE4SXcxNjBtdnFIVzl3Y1JvSG1PVGtx?=
 =?utf-8?B?K2dQYisvMFhmbFVJWXVORmVzbHp3eFNxZkZJS2lsTVovR3cwN0pvbDFXRUN2?=
 =?utf-8?B?WGg1c3YwRndKT0RaNk1pRStpVFozTnpPNHJkSE5wTlNMbW4ydjNkcGVPTGtw?=
 =?utf-8?B?SDF2VlF6cHhyT1NIVE10S2dndDUxQWp0cVpHbWhMT1BMWkYzZ3prcU43c2ln?=
 =?utf-8?B?WGlrYWNqbDl5YVY5SzFpY2Rid3dpMmcxYzcxVDVQZEVoQ3YrWGZYSXJBOVFi?=
 =?utf-8?B?TUJxL1pJQU9jS3ZXT0wzeXJ1aEVBWFJaUHROaHFTSGNqb0FSS2JrVkcyQ3BW?=
 =?utf-8?B?cE93Ulk1dTFISWIzczJORUs0eHltWHNuUVp6SjZiSmR3YTFERkw4MWdFQ1RI?=
 =?utf-8?B?WkR5bGFlb2tKRWs2V3FGVVhrcXRKYUs4b2hpUGl1bWM5ZmtvMFVrdUJzSk8v?=
 =?utf-8?B?WWdKRWdFd0dkU2tucmd5Qnk1R1hsbDdxN2NJeFRkeVU4dkFaVUM2emx4SExH?=
 =?utf-8?B?T2NRU1o4R2ZlMjU4U2JKZTUwMDQvVGk1Y2d3WDlhQW1wSnRBY3NjTU9ITFZZ?=
 =?utf-8?B?QXh4NXdTcW9Vb21DR2tHdEZabjVmRVdOL3oxWFd5OXE3M1A5QnZsSkRqTWdI?=
 =?utf-8?B?NEh3MStKdnpTMGUxUVZjUllCNzI3UE5EeWJyWjZlWXZ6cTVFVGN6OTJzZnhj?=
 =?utf-8?B?WEEySWRpbkx5d3dEZi9WVTdadHNzZ1VQVGhJS0t2a2NUS3N2cmUxTWdIQUs2?=
 =?utf-8?B?RmQydUZCMTZRK2NOU1BEK3ZYZ2pmUXdqVzY1QmhmMFdKaFlXb3dBZUQzS3Ba?=
 =?utf-8?B?di9qSlkzS3VPZXc3RE5XWTZnNjBMZHZBZFdYdkdRUUhVaTh4eXVyVnZlc1Ny?=
 =?utf-8?B?cG5IUDJvN1FJakFpMmp3R3ovV2pXZSsyemVVRTl2TC9yQjlkbDJFUUp0bHdh?=
 =?utf-8?B?ZnN3Nk5GbGQreHEvbDBqSGFiWVlEOVgzWU9RbG93V0hNZTBqVXhReUFDRW9V?=
 =?utf-8?B?Y2lGbjh1V0twSGJScDk1NmE1NXViWjdQTXVQa0hvaGJFcTdIV1EwcjhUaUhF?=
 =?utf-8?B?b0k1TmxLc20yUnBwM3pNeUZURmNNR1k4eWRTMllxMGtHbjIyQklCSFd5MTdW?=
 =?utf-8?B?Rmg0QW1EOVhWeVF5dHlxMlNUemN5dGdBTmZhVk0yZERlbWQwaHNBUjhMZHZF?=
 =?utf-8?B?ZlI2L3drUnA3WWRXcmh1akFBa1hRUUE3WDJyejd6SFdqRXhaMFpuV3BTSGlH?=
 =?utf-8?B?ZDRCVnZidTZ2b2FPS21Sd3NJTlVmbTNNbzdnd0ZYMDUvbVpzSitVRTZONWRU?=
 =?utf-8?B?aDNyYXh5K3FWS0tINTVES0E0R3dpb2FkNTNvSUhUdEZmQnhzaDNPTnYrdCti?=
 =?utf-8?B?Wm1lMGN6MHdUMm0vWDlCYVlQN1N5Uk1vM25LQ1FCdHI2SmJtNHhwVTZtK3Rv?=
 =?utf-8?B?Um1oUEZXYnNkc0VFVjRDVlZXcmg3OENaWGFCK1lxb2pNQ2FxVm1NVzRhQzU5?=
 =?utf-8?B?OGtrYzIraWRYbjM5Um1GeFBHcU0xWlhUOHlrM0N6ckwxZmdib3l3QVZ2a09O?=
 =?utf-8?B?eXJxL1M3allZRjdQaVRTc0NrcktWWXY5d2w3LzVsYXJMaEswZWRYLzhPMU51?=
 =?utf-8?B?NWRQT1hJcE9jSXRUcXdpamx6bkFRLzVPaHJ2cll4VHRtNGwxOThtV3JPTjVq?=
 =?utf-8?B?NlVXZjZkUEQ2UGlBRHp0NnQvc29zSXpaaHNTcW5OeWlwbnFreTlkY2RydTlZ?=
 =?utf-8?B?NER4VGx2cGFLYlNBWTlUU0NNQ2tiaFptTjkvWVVWVFBVeVBrejZ3Y3RVVDk0?=
 =?utf-8?B?SjZlTUplTExzMHFaOU9pdFZ0ZHZzKzJsNWtSWE8ybnJBYUNMcVlSSUIzUWNp?=
 =?utf-8?Q?knKEw8Ow2ZMePcRmsPvHSioMU?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c37271-d574-4ae5-084b-08dab297e5fb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 12:37:49.8492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Yxab0on7kxZAqmaGIApQAsQrgoTjR1IEb1M+ZG4Oj92iSl+LGrz3Syh4n+YIr1Z50B7UaSqf8xWqLz2jzwdqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5468

On Thu, Oct 20, 2022 at 01:22:20PM +0200, Jan Beulich wrote:
> On 20.10.2022 13:01, Roger Pau Monné wrote:
> > Hello,
> > 
> > As part of some follow up improvements to my VIRT_SPEC_CTRL series we
> > have been discussing what the usage of SSBD should be for the
> > hypervisor itself.  There's currently a `spec-ctrl=ssbd` option [0],
> > that has an out of date description, as now SSBD is always offered to
> > guests on AMD hardware, either using SPEC_CTRL or VIRT_SPEC_CTRL.
> > 
> > It has been pointed out by Andrew that toggling SSBD on AMD using
> > VIRT_SPEC_CTRL or the non-architectural way (MSR_AMD64_LS_CFG) can
> > have a high impact on performance, and hence switching it on every
> > guest <-> hypervisor context switch is likely a very high
> > performance penalty.
> > 
> > It's been suggested that it could be more appropriate to run Xen with
> > the guest SSBD selection on those systems, however that clashes with
> > the current intent of the `spec-ctrl=ssbd` option.
> > 
> > I hope I have captured the expressed opinions correctly in the text
> > above.
> > 
> > I see two ways to solve this:
> > 
> >  * Keep the current logic for switching SSBD on guest <-> hypervisor
> >    context switch, but only use it if `spec-ctrl=ssbd` is set on the
> >    command line.
> > 
> >  * Remove the logic for switching SSBD on guest <-> hypervisor context
> >    switch, ignore setting of `spec-ctrl=ssbd` on those systems and run
> >    hypervisor code with the guest selection of SSBD.
> 
> * Give the guest the illusion of controlling the behavior, but run with
>   SSBD always enabled when "spec-ctrl=ssbd" is in effect.

Right, I've also thought about this option but forgot to add it to the
list. That would limit to only allowing enabling ssbd for the
hypervisor code, but not explicitly disabling it, ie:
`spec-ctrl=no-ssbd` won't be a valid option.

> * Give the guest the illusion of controlling the behavior when
>   "spec-ctrl=ssbd" is in effect, running with the OR of guest and host
>   settings (switched, if necessary, as vCPU-s are context-switched).

Right, this could somehow reduce the number of toggling, but would
still require having code to handle guest <-> hypervisor context
switches.

Thanks, Roger.

