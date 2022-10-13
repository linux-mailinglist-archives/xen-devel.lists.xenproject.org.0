Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F065FD8A4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 13:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421905.667614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwly-0002ht-9y; Thu, 13 Oct 2022 11:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421905.667614; Thu, 13 Oct 2022 11:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwly-0002fd-6x; Thu, 13 Oct 2022 11:53:10 +0000
Received: by outflank-mailman (input) for mailman id 421905;
 Thu, 13 Oct 2022 11:53:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/C9=2O=citrix.com=prvs=278604417=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiwlw-0002fX-Mt
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 11:53:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9885bc5b-4aed-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 13:53:06 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 07:53:03 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB4987.namprd03.prod.outlook.com (2603:10b6:5:1eb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 11:53:01 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 11:53:01 +0000
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
X-Inumbo-ID: 9885bc5b-4aed-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665661986;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PkPSzrknOdcb3HnIptMfAJflOpcRYvoZBB+HqlhcL88=;
  b=JXSgEzEXiBQwK9ksz9iAUzOfVFFuiPrjipfpPziVdt/MteKBzuBCPWgm
   DYDlkgzNpMGZ73Jv2XSZ2vCmjUxtRL6i+y92QUTXzsoJcNtse8jNUjWZ1
   7Apimtm5L/IiRsOOXAk7gr4s7ZQpopFHezdRWtn4hBN06ypDOPr4SYQ/C
   U=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 82654859
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AdNmpv68cLiHKQKiwOAO9DrVtTnXEBe8aBUUsX?=
 =?us-ascii?q?f30WtKx8/RTzJ3v3xIN5G3TbNRwPMuHkG28EylCq5hUTj+5RhKEl9FcpmOwO?=
 =?us-ascii?q?MQtib7y4yM6N6EhTH+PiKyi9oREdP/9qNo93K7lj8nRD9jEzVXhftgwTRdHw?=
 =?us-ascii?q?YF6LTtg88bRqUjkRKHsn+TpnKx3FGI7FY2j7oSDBbb+VhP+mjh/hpslM/nIy?=
 =?us-ascii?q?ZAS6V9yKIVrePuUZHDxqtyoYnq9jkid9nNA7ro41dNe1yepggu4vNSfEyxD7?=
 =?us-ascii?q?InLVNWJkkiyHVdwEnWxb0ymEbOssV89AdkZW5MtdBPHDn53it72ux6DLOYFy?=
 =?us-ascii?q?m1LPdqktSeJDzWtOLw3eKa4r5GiI5G7/I798ns/3KjyX5qYeAZwdkUhxgpOC?=
 =?us-ascii?q?tAMH/mSqMoPTmHNybMJaarYcn2awPuz8gMaoRE6TnyAHHo04SNM2dcHf5dVQ?=
 =?us-ascii?q?IyEFZH4duYrLqrRs0Iou14+Ur5FD1ZiZJ65q+/mYRTdHC2wkk1FeSdT+p0We?=
 =?us-ascii?q?UssDAFRLMvYiyp+fmLwFhP4PwJ1DTbpfc/IR4/IK6AZ81d0bObASgeWGbr5U?=
 =?us-ascii?q?kqj5nnEEoZ8W+QXxKnvwWGSI6u9cngLz0T2SAuUBzbCicciCcZbJwN6Caf5Z?=
 =?us-ascii?q?p2DFJB4ZMT7B9tzdyV9X7tAPDxh+Df+JWLKcPhEeYu6yetDEdNbJQUwAD0iI?=
 =?us-ascii?q?n/NnCyniADufLdhjAPkcmtZZ8LZgHTjzETTvI8TOvi3MxxQFkkAO4zpnnRIm?=
 =?us-ascii?q?MCOlpovouMkoGmIMg2YwqIfv9cew/jTAbb3W1AeddeI6DYRCVUgS6oX+uS/B?=
 =?us-ascii?q?HaiCmlcjgY2wR5RyVi7nZYXqsDmgttaSs3q2FzPMTCef7Gr+BUnQDr7YiEI6?=
 =?us-ascii?q?j5QIJB2dNzwA49sFK0nVvflnm40GFB+0DEuoK54z+Tkj6GzdBq04Os4cN2Hr?=
 =?us-ascii?q?aoIqn2izx0C4yfcF8oyrRImYMdjWm5gIgbZSvduD7vs6Mm/xLIJbUwu7zJZi?=
 =?us-ascii?q?pD9rt/oVZVgUHME7rvhaS5FEOrMekS98Htp7BmoQKeM9RSrwYR3XM0IMe2DH?=
 =?us-ascii?q?ZeeTPSFyBU6S4YNM/hUddldaBWVvcve7Qi2CuZtSfPuGS1d3rPcuXwgUYBI2?=
 =?us-ascii?q?5ARq9k+7SFEht3ML2vFCRtui4wb2R7SxgyNRK+DVyFKuDBbUv3fw0I8GSReI?=
 =?us-ascii?q?z+hjxt9V2P9N3iGPN74ife8P8fKgPCU2k5aoEGS44S24sEm5SALhtqI4Jv36?=
 =?us-ascii?q?/Q2YKv/eoKnhflQ2KR2Ic/BZHn6bEufOqTfoj7Rbpy/EiHw5kuPcIO5QRp6f?=
 =?us-ascii?q?hH4LIzzZmwAvTrkq6RA6Prbc6ntTgB9RjqMNWtIvwD0no0b/T+FWnGQPAWxq?=
 =?us-ascii?q?u/ZeDqf+otB0agL4fA1J8Kt5MJO6lBTiuMuqI6k6eRluRzo8KcUy79gPvfLl?=
 =?us-ascii?q?DH0dEW82JIq869ioavJtic5hE6f/dajuaxUjLvBcfUiIQPV3/NvHGY1dUpAQ?=
 =?us-ascii?q?1cLVeL2fvDfpdmCLnNbt6cNnweii/QFt5//8zoy16tBXRb95EQxvocqETE7G?=
 =?us-ascii?q?G3ni9+R+zL/O52K298akyN2UaQuq3JqU9pUDmOqsn2+VsAOpkTnsjYEf0iCV?=
 =?us-ascii?q?mydOyO05hKIF2T9eRrp9vWLmiVjGRAvypX/qby3sUkJLEy8gMJXcH+p1GSLY?=
 =?us-ascii?q?uOTA3imIQbR04fHRgv2KAFIRKdfOaGRGKvDzxM6HZR6B+KC1ADiSvOi8nryP?=
 =?us-ascii?q?9Ikfy0+hnHBBJRL9evTLwki4ZVmdDwRfPJneNFLsMfY5vm/npgQkhVbT8RaK?=
 =?us-ascii?q?4QYZEAsfpmsBiks4a1ltd35rMEa/uoqe4q0oFmU0Rd9hGo7EM+6foNOPIiAh?=
 =?us-ascii?q?HvL7wyxgaAmwDtXYgf4WKTEBhJpBJQzdmlGjYrPYcvzJ43tcHKU5p51IhULs?=
 =?us-ascii?q?XEblG4n5/g51s3e7bzzcD9FmF0FLzsq8WDBx9HharGOTXDvlgme9ajkhzOBL?=
 =?us-ascii?q?8zJVyqXm5SDeeV6ETSybI1CKz81kvC3+jjeIpMQui1o96aaxSwBHnGhoqg6+?=
 =?us-ascii?q?n7hY1Vh1LJc0vbZDCaMXziZkYcPDHDn/k4BBmkHRZpSpkDB6t8Xl8X08njhW?=
 =?us-ascii?q?bg0A1tU7UP17Xv8isSxVJhvaLCQwuo047edP8CGZKH00LS2zFWxiA6QS5GW8?=
 =?us-ascii?q?wMww53pxynSSUjO3kYCmTh/jBpk4Kie6oIHCgnQlcUAk+zTCETl5YZ/M7bO6?=
 =?us-ascii?q?cuXaWO/5nPwcaKzCd9wycjkNH9Ry3dxA3FjfYPtPXK4pMXRpNX5vFs/XA6Jt?=
 =?us-ascii?q?f5kGrvS5GRCTHNRaIbZBYEMY8kJJuK6QEqbbSmRc2GWBvFGSRekwhqVt5Dg6?=
 =?us-ascii?q?yQSmkIFcTyTgcN+ZMO0ODeoajBz91tYblD3FH84GqUQxrVzGRgFURF00zrxl?=
 =?us-ascii?q?WTtRB3HqKUDkEVn7003Ov8V41g=3D?=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82654859"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIR97GQAGhoUm2e1ZmmqUEAW+0EuXMxCNUmylZzA6in89p0qo1AXCetoFsRx8Tnbl63fKNRkf2RvQ8jlwcWEPyHEzuyp8adB7W984dkNJ6jesf08t5M92lkIeg+xKqOMUmZLG7ozoy2KK6tRdCLuwBYhpFA6UJeW9fhO9KoK15JVklznpXZF7e2FJ1mBqq5htnem5YiR1K3wWTdahbrv40nHu4vyFmDL8lA1qi2d2TIGo9oubCQXvQhE/u2Ce8GrStRLOEHaA9A0IHWFIil3G5xbb5eWPxRO2I4kkGGfY1n6+AcWukurqIV1T3rDDn06lbSQkGaVx5igXVBUzzWuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76gElHA2d5iThTDRevOp//4smkK+KLnfA4lsH0LQ4Tg=;
 b=Mb9lxaaSsPafSz9wf2KKd8kI1THThiBbAvPE0JipleUwd7enmqMjsiL3nVUUDjhv0douLu43Sqp1IMR1SxlKhw1HU3Fqms9o4yxw8IguBPmiJxDqPTtGs0YVCWpgRFP1Wyzei84pTLO6gOymC1p9FMVf3qbA9SRs1HViOf3JblrKdQxXXcv+4FTuY3T8BSF9qyMXNosM7spj8342btOkfuDdexCEgReaWhYaJKr0krvgil54pye5rGRJALeC6kL/sMwkA7HTYRFHSJcZ2ZWqDBG/QJI8oql/9GIq+g1/NiB4zaO5sDBz/Z5Y6sCzr7nd5rxMj53gxDGqESAUrqRpIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76gElHA2d5iThTDRevOp//4smkK+KLnfA4lsH0LQ4Tg=;
 b=O+fOJLE5g7W022UXOYtiFLU8GGZTWprwQt9CICTLjQgI4gRxe/ste+gDE6yrnyovz+o3UkeT30Q+NxG9+W73u+yCD6zIL7RzjvlexIc/hmeA/95h/3dc8GEjSZOzP+SLILYJgFilwbwfn42bdy07i+IY1i8yaBNjjJaR3NX6pt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 13 Oct 2022 13:52:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/5] x86/mwait-idle: add 'preferred-cstates' command
 line option
Message-ID: <Y0f8F9yqdct7zy+S@Air-de-Roger>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <0690742b-21c8-e5b6-e8ff-5d4709e0c3ee@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0690742b-21c8-e5b6-e8ff-5d4709e0c3ee@suse.com>
X-ClientProxiedBy: MR1P264CA0170.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB4987:EE_
X-MS-Office365-Filtering-Correlation-Id: 140def5c-d4f6-4d38-410c-08daad117a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2BUmVuxa8bsp6XNh0TvKagEE/aphj1MuQVe1kWTRR7877+g6QfDpjf5y5/JdMsTdPkl/b8oFgfy3Pm/B4FRzvhVq8d4ei+Xcpsma3cBBTwnvpQgf/B5z8ApgFhKKOIxmcaSZgXcRJQ2l9cgbvioxImSzZMJNJm2cE+MnO63XAqQyMy/P3yl4N8P1dBLYHhym5kjBHVuz72zk9NVcPUQ2etIPBrJCGBDork2LaWCc8B0ObuJIJZzF8ntyi6nFSuH7uFMA6Nt+cr7ip3wFAUJ/f/NPxWjOlrMUWLS8OVN8sO7bqYgVHYb1A48rLnJIGBtD4+OXqnXkFypwehJ5z88WthOqDhmm8oZqXwlPLiMK+Fj69YikihJx/jmb11/MAlJvZP1OQ91G0XOWh7ly3MYwps9zpWd+hpJbTRKb4Y/fGU3Ftujk63aAsS2mnI8W19/kYMKpMDDIl4jn8fvtR7PtjK2pK72967YUZbdsH3hpL5TPs6QU+EAr2mY/lXAb31Cl4clOb4+SsASMc51GMPYC+YNvmSk/7i3CI26k6AyRDXiskvW5FT1uwn1KKZQ2XDvbIwDbDAro2xFfbOeSLLN7GIAs4SFGpuRK5B7RiKpo+qxz1a4oqElF82sBZvEI8kyN0DV0iaUAuIg4dhwy4kegfuZBK67PSfhJDTfDktD/H8Rsc4oSWqOumB8rhLT2WTD1t2eaf3f40TW+2y9CSQO0MLn1cE3wd+vr+W27mGSh7epehI/ley/HqPzU/DiJ3pNhPBltNwHMOOMzdeA2k5Ng0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(39860400002)(376002)(396003)(346002)(366004)(451199015)(6916009)(86362001)(85182001)(66556008)(5660300002)(2906002)(41300700001)(66476007)(8936002)(9686003)(6512007)(4326008)(8676002)(26005)(66946007)(54906003)(38100700002)(316002)(83380400001)(82960400001)(33716001)(478600001)(186003)(6506007)(6666004)(6486002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUFPZ2c3bWgxNmJHbmg0RXJBUlNCcG5jY0Q2WXBZSnFIMWVZTHBMZ1dWVGQy?=
 =?utf-8?B?N1BTRE5yVjlndnlqQloyenBxc28yS0xpbWtRK3hyNXowNFpMQ2RZRkx5bHlk?=
 =?utf-8?B?ZXRqMnBTZE9tNWh3K1hUNGhEVzZ2ZmE2UUFWRXdNejJpV1ZoOGlOSGhhMzRT?=
 =?utf-8?B?NW1GSmZYOWZSdUNyY0oxQzBVM3hYbFZRSWlMU2dsMmI5S2hNZ29MT3haWHV2?=
 =?utf-8?B?QlFzWlVMTjFPb2lUVGg4QUZUM2V2WUV5VFNLOE1ndGpMZnFVNEZqUFQvUVNZ?=
 =?utf-8?B?RlV6a0RhMUNGdFNDRG1HbSt1YVkydURGeS8xajJQT2FRcUowWDQ5eUJ0MVFS?=
 =?utf-8?B?cjJNdjRva3JGZkdPV3UrU1FkdzJkRUx1UExZeGdXSUluOWdrNWxvVUxCelNJ?=
 =?utf-8?B?UlNmVGxmY3pocjJTeFZQQnVQTkJrQUt5YUhta2plZmZQTkh1NVRIcUNxREpE?=
 =?utf-8?B?VWhPRXJSb2xDdlRmMXlOQ1BrRXE4NWxzQlQyeCtqT1pneFcxZTk4d1BaOHQ5?=
 =?utf-8?B?Z3Q1RHhrVkQzREs3WGg4K0tYK0dsUnNaOUV3cTY1K3Z6Nlk5SHZCYVc1R3M1?=
 =?utf-8?B?MXljd3RpWS9ZVkRpZGNiMm1vckRFeHFXUkR1S3EzZm5lT3dNNyt3K2psQjV6?=
 =?utf-8?B?d1FRSlVRNTQyYzdJVWVjSi9iNFJ3d25UQzEva29ENXMxbmF6clBBeVZTR2Jh?=
 =?utf-8?B?WWtzT1VNL096V3BuMmV5RmNRRWViQ0JsWGRpNG5pYVBCTkdveFlFZGZ6SWJv?=
 =?utf-8?B?YTQyV2wyaExHaERLY1ZBOW9LQ2toNHgxbWF1eTg3WW5IR0QyTVVlT0ltVkxq?=
 =?utf-8?B?Y25hMmN0NTQzRmtyWnUyRTZuL3JSbjZJeUxnSU9aUHViK2hmWjNUWXFRNGYw?=
 =?utf-8?B?SUJlQkJVM2Q1dG5CZ2hFV2lGNUEzUUhRZEVDMU9TdnphYUZIeDV2MEs3VFZr?=
 =?utf-8?B?RTdGM1hBNnZDcUJMYTlmVW8rdE9PeVZicUUyZ0RNUGV4cmhtRTFQQ0lSQldB?=
 =?utf-8?B?bzgxY2NnK3QzckZoa0xVQ2FyYnh5OWprSXNobXAwVFhHays3RTZMbGVRWHFm?=
 =?utf-8?B?WWVrSkNpc09JK21lQy9saGFRcmFPQXcwckcvMkc5OVhLM0ZoR1JKbXNnR1J2?=
 =?utf-8?B?TDh3Vkt6UTFoeGJIL2NyOGR1Lzg0MjFTMFJJR0h5Uk5keWdITXBpSFdpb2JP?=
 =?utf-8?B?VDlFNTYrZFFTZlRwdEVtMzBRN1ZNcUFIdkNISjAvaWRLVVUwajFQODFLendB?=
 =?utf-8?B?YTdMVncxaFB2enZWSEtiUWlHTG5mODdHeTE4RlE0WURjZmU0VFNLVHNDTVNs?=
 =?utf-8?B?amllZG5FdzBpMFhHN3BpQVkyQ1dqWmtEZ1EwVmV5TkxQZFFpWVcyVkUxdm1K?=
 =?utf-8?B?OU5sNTZ3QXpFMDFtamhOUVJYbWZEVWFtQjJYNFlndWFwNkh6eDd5QmpBalFL?=
 =?utf-8?B?VElSaXVBZkd6WnAycVlCNUpFWHlPU3V0N2YyZlA3RjB2dDg3M21pMEJNLzF2?=
 =?utf-8?B?ZTF2Z3pCNVhiK3Erdy91aE5NVjVNcHZKVDZiRWNFejdNUWQ1RXQrWXpUNW5L?=
 =?utf-8?B?RDRobkFXRVFzMkkrL1ZJNC91QUtiZUttdGQ0QXhIMjhKdS9DdFVHS3p2bTAw?=
 =?utf-8?B?cU5qZ2Vackd6dU9Lc1VQNXFFWDhqNWZDRUNRTTlaS1pHTmJJUzA3RDQ5YXMx?=
 =?utf-8?B?TzhWN3lJT0krNWxrWGwvQmFlRm9qYkxLZ2M3RlFWMGJVdldtVFJVaUhJOGhp?=
 =?utf-8?B?QkxLenY1Q2NBUFlrVHArRnpiL2xhRTNVeDdCV3d2NDB2eGlZUnZScnhwY0s3?=
 =?utf-8?B?NWpibXowWHE3SGc0TUtBZWdoK0EzQ3VJeVBZRzBPUitqbnVheG9XdjBjK0tn?=
 =?utf-8?B?SnFQNWt3NVYySFJBV2RPanRUdUFNcGpKV1Y0a2FaSFZsdkkzK0dtZHMyVWlZ?=
 =?utf-8?B?VVQyOUFLQTNXWUM1N2xuSndwNThiZTlLMElJWUUramN4VmdSbTlEbUFhZnZY?=
 =?utf-8?B?RWFhaE1wRDArK2tOOGFOMFRvUUlqZUZJdEhKamdHMHJUY05MNFV6Y0lVREJj?=
 =?utf-8?B?cnFwTktVOXBvMUl1N3NPQndwdkUvak9jazN2WnJrZ1RKTmx3VTNLRGdCZThY?=
 =?utf-8?Q?Wn2BuGnoykipGvQmGufSNgCNH?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140def5c-d4f6-4d38-410c-08daad117a95
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 11:53:01.3058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEpVkvPWf7zrTA5GiESDUAx7pTjSLJLoSsynm2oU8V91Ea7g5Wsu/EttCEf1R3O69NpoXo27OfkezhJOMsB/Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4987

On Thu, Aug 18, 2022 at 03:03:33PM +0200, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> On Sapphire Rapids Xeon (SPR) the C1 and C1E states are basically mutually
> exclusive - only one of them can be enabled. By default, 'intel_idle' driver
> enables C1 and disables C1E. However, some users prefer to use C1E instead of
> C1, because it saves more energy.
> 
> This patch adds a new module parameter ('preferred_cstates') for enabling C1E
> and disabling C1. Here is the idea behind it.
> 
> 1. This option has effect only for "mutually exclusive" C-states like C1 and
>    C1E on SPR.
> 2. It does not have any effect on independent C-states, which do not require
>    other C-states to be disabled (most states on most platforms as of today).
> 3. For mutually exclusive C-states, the 'intel_idle' driver always has a
>    reasonable default, such as enabling C1 on SPR by default. On other
>    platforms, the default may be different.
> 4. Users can override the default using the 'preferred_cstates' parameter.
> 5. The parameter accepts the preferred C-states bit-mask, similarly to the
>    existing 'states_off' parameter.
> 6. This parameter is not limited to C1/C1E, and leaves room for supporting
>    other mutually exclusive C-states, if they come in the future.
> 
> Today 'intel_idle' can only be compiled-in, which means that on SPR, in order
> to disable C1 and enable C1E, users should boot with the following kernel
> argument: intel_idle.preferred_cstates=4
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git da0e58c038e6
> 
> Enable C1E (if requested) not only on the BSP's socket / package. Alter
> command line option to fit our model, and extend it to also accept
> string form arguments.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

With the indentation fixes.

Thanks, Roger.

