Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615FF697BB9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 13:28:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495943.766400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGsH-0000bm-BI; Wed, 15 Feb 2023 12:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495943.766400; Wed, 15 Feb 2023 12:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGsH-0000a4-6I; Wed, 15 Feb 2023 12:27:01 +0000
Received: by outflank-mailman (input) for mailman id 495943;
 Wed, 15 Feb 2023 12:26:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSGsE-0000Zw-Ne
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 12:26:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05e4a015-ad2c-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 13:26:55 +0100 (CET)
Received: from mail-sn1nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 07:26:49 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5804.namprd03.prod.outlook.com (2603:10b6:806:fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 12:26:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 12:26:46 +0000
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
X-Inumbo-ID: 05e4a015-ad2c-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676464015;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jgYUi7Hk3CJQ0ktQHBIZxzZzjOJvCu6eXiRegYTW39k=;
  b=GzXcxONtmtXlUEllisU+uH19YLhgE+mmR7L+aA0p/IOQfDY7ZuL58tiO
   tUh6uRHK66NvPNwcAeokXOcJZuPMV23JA3VtxOMToMokkGg4T38TXVrI+
   6bw4vU2G+FJnW7A8NsrWP4bjIFBWAH9aNp9iGM9jGX3m6v7J7wEyVgHQl
   Y=;
X-IronPort-RemoteIP: 104.47.57.48
X-IronPort-MID: 97543435
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zPRHqqC/NYyhbBVW/x7iw5YqxClBgxIJ4kV8jS/XYbTApDgg0zwHz
 mAbDGnTO62LYGvyfdB/aN+y8BxU6J7Rn4NgQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlB4wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4eh0Wlhf6
 PYhJxcOaiCDo7ztz62DY7w57igjBJGD0II3nFhFlWucNtB/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxrswA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE17CSwXinA996+LuQpt53g1qOn1YoM0c9W1awrvSZ20CfcocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjVIctAhuec9TCYm0
 VLPlNTsbRR0q6GcQ3+Z8raSrBuxNDITIGtEYjULJTbp+PHmqYA3ywnJF9BqFfbvisWvQW2gh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7AJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:PImGDqA9ewE3Ms7lHemP55DYdb4zR+YMi2TDGXoBMiC9Ffbo9f
 xG/c5rtiMc7Qx6ZJhOo6HnBEDtewK4yXcx2/hqAV7dZniehILYFvAH0WKK+VSJcE3DH6xmpN
 9dmsBFaeEYZmIK6voSjjPIburIA+PqzElrv4rjJrtWIj2CE5sQkzuRwzz0LnFL
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="97543435"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxSLXAWZ747Ya8PdyujZO1/z9bRtolJNjh+dAv/zl1wBJtKKY5YUNyetHGBtL1zOYXVZloD2NVmFwh70ebSiLKm5lTmvDt+9Y6lxTbtc9+0zr7Obqspe82auAEOSVquQ26f0h+iSbtIVoHnJIROPeIY2BEGTezzuAX+UIDQiok4r0jzmbdmsLSUZj5Jtug0GfqeQ1Tku1XGXtPNxQkLJs90caeEK0Vx7z71m8Faot+vsvj71Wxuoq2VH0943F4p0SnNyXylKLvpcnb3PEvwS1UsFd8+Dz2lGS8Q+eVZNTgPZsPPVBLsk9Kevh53qV3Dsz4jRVrwX6b/5PVjGYVFx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0r6SsTliDfwd16tfleMFNbXaIkxjIfcGFrhBKGa3dYk=;
 b=kBMXn6G6LMrPWM57uDEeRyD/Otzjr6bM7Q4h3kI2QbvqSUPVnQk58qm7v8C5T7oRA7gp2WgK/18wUurovJJz4D24pbF1/oAm+/PtDaydR/BPkIXBJjs2CUDPT5r7cI5djS7yyriRe5h0P4NedmUuZcPwQt2PGVF3z9J1FloLsu5KkLuNn48GU4z7kwvdZ0E6GTOVmE7bKdZFSteZVyywPfeSHghGquzC4jaGA1t7oTcf2+v2imBiUjOa5qxQktByJFYz+h/FOvchiJKRa4h//AY7MgYsoj5dgjnX/fNpNmIl5EQ3ETYlb8Yo7rqqVpcS6x+0XYdZLMWiQYWMNsLbWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0r6SsTliDfwd16tfleMFNbXaIkxjIfcGFrhBKGa3dYk=;
 b=of48MUPdqU3qLA/pTHNy0zAtYTGaWHAAO0erxNIAeJRmM3epioM6HMj13qhgOVrAlSFuniMCSHriCr+de0QjcIKStjowpIbzCkGal1QD4Q3h/LLFldg2l6IQCz9CRugqY+mzmFNscrg+qTSiqbYkYaobeunj6XMuj+a1FOvVxaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6fa7fa56-d30a-e66e-b46f-5e7daffeb487@citrix.com>
Date: Wed, 15 Feb 2023 12:26:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH 1/4] automation: Remove clang-8 from Debian unstable
 container
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
 <20230215120208.35807-2-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230215120208.35807-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0022.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: d278e156-2134-49b9-f9ae-08db0f4fe6ff
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u7Lo9605WzYOI/LzONODUxR8tdHU9PjtfRPA+1HPOQG/DpY0pSvJX4bWScgHAGI6cqA1qroaykhTJi7TG4snHbb/3FnqX9CuOFDa3pPFKkVULNbXRpltyk6k4/zB+yWhpWXsC/+ADwxQ9qXnmTq+Ix4GFxxATLoKzoODnzgRF/jswc9Or3NePBBUxZWLvPUIFeRNHzd6qi5H/yL9qrRExLcMHkmnSONPx8jxTXSEbdf62Xuu+4tF4gcxQS/Vxb8utAF9JwGmOlumeBUARjwdic1whOpqhg6hgphGYShD5b+JPdS22lwrrPogPKN/4cXOW4cTAB5nlv8nZ/7ICHucZhO77joZQnBFfk4ywIr+LX/3jef+79N1N22tXEEd5npc2hj1BdxQFAQ5sOGHQ/qD0mI72B9k0VLjbpQMmD1KdYcPrZ/LUxUYoPsJJPcdpDCa5OsR27llwNJgRI361UX5/eNPWhJOEDrh6o/95WnqNV6u4QnRvkvnz3nAHmfY1Cr2ZMBDwMUSmpuREf9Ikdz0ZMAHHrsGnCsbmoxYH33Aq6+kuMKmD5GtRfmTjn7bFV8CiYr4v/g9et6wvf6Yi2QNk6E+T6YZV3Jv3CtuAKWP17KJQ27nDzD+obsh/5FvBFhj4g8nGLusgKmyu2+0KscuYY+ggyMtuhE3gAOqLZAf/MZjfsVmRG1tGbRJK/IRWOAhhSZOSzooHJJtgAt39e6rgryAy7vm7+2YJHoDbRLgqro=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199018)(41300700001)(31686004)(36756003)(4326008)(66946007)(66476007)(66556008)(8936002)(8676002)(316002)(5660300002)(6512007)(26005)(54906003)(83380400001)(186003)(82960400001)(966005)(86362001)(2906002)(478600001)(6486002)(31696002)(2616005)(53546011)(6506007)(6666004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmx2dmpCU3pBZjJ6K2ZMMzhob09HeXBmdkpnSitveXlVelFkRnJaZzhaTWJN?=
 =?utf-8?B?RjRnWGlzTTRhdnZaYXM4aTNTd2NsK2pHVDNJS3pZUWplVHJ4L1psZFRkZHh1?=
 =?utf-8?B?MFFUWjVKUFNPeHROd1ZPaW9SZk92S0x2Slh4am5vN2NNVVRSRHFlNnJaUVkw?=
 =?utf-8?B?TlNTaXBZMVZVa0x0TjBBbGExV2pGa0IxUldjV0I3MWkzSkJURmlDQ2VtdURQ?=
 =?utf-8?B?SEp4MFRoNkZBYTJVUFZGODh0MjBxNEJIVGFhOFdDVHc2a0dSLzVrZzBHTSt0?=
 =?utf-8?B?KzU0RExKUlQzaHRWNG8rVWZ4SnBLWjBFTm1ZWTVlWXo5QTdvUFNpNGFmM3Z5?=
 =?utf-8?B?dzNXaFBHQTJNckNyUnUzaTJweFlJOVNFMFJvNFhLdlpabzdwZm0ydkZUYVB0?=
 =?utf-8?B?TUhSdGgwTFJNc2Jlak02cE5SSXRLZkQwclpqSG9IWHpEUGh6bERTMXowaU8x?=
 =?utf-8?B?ZzV2b3V5NFRaZktUQWRDaXZidEloNkNDS2pwV3B2NWMreTg4ZlBtUFRocjhL?=
 =?utf-8?B?OHVKMHNXWHFQSGNCeFZJbDRUbUNHVmNHaFIzVFJpbjVDeUtIK0NveERjdkJV?=
 =?utf-8?B?T0ZuMFl1MzFYbHI1S1RNK3JnYjBNcHl3UXU0ZzVHd0k5NlZnUDdPSkZBbWFa?=
 =?utf-8?B?OWtKSGsrRUErMXp1dWE5SldnMmZmNWRia1BBcHdscExwYnAxWUhFYTh0ZlpR?=
 =?utf-8?B?UzBzOTRIbVZ6QlM1VThkaldCa3UwM0JKaFBIQ1NnbW9XYkFCVGcwcE9yVkNL?=
 =?utf-8?B?R0FTY081WWhUcktkdTIxbERxcmt1MUhhMmtEaDNCdGMxMkdXK2lmSHJNR0V1?=
 =?utf-8?B?RmpOVEhqbHFaQm13SGk1OWR4ZGNWQ3RNdUhpQkJ3TjhRWGFlZ29QSWhtSWEy?=
 =?utf-8?B?c1d3N1pmQzZwM0NIRGN2VmxNVXB6RllkNVprWml5MVRtWEt0bk15bHhrdTNt?=
 =?utf-8?B?OEtEdTJLeVI1Vm40Uk42Y1NhSVVON0ZRT0x5NzAwbVZ1WWlWSm9EUVptRitT?=
 =?utf-8?B?UlM0QitkVDl4OXQrUkZoNHJoVmh1T1VBV215L2pVZHYxbFljelpPd2NFMWNX?=
 =?utf-8?B?b3VQRCtvcm1oK0JzQUpKbmd1dWN1SHc1aCt4c1hxd3pyM3FuR0M5QXc5bUVr?=
 =?utf-8?B?SEpORVM3VllaSnJQRnFGWGExL1BMa2lsaXV5cmRlc3BPMTg4WjQwaXQrNlNv?=
 =?utf-8?B?Z0VhV3BMVGpkak10c0U5d2dKMGZmK3d3RDdRNk5Wa1k4RjM0c3dOdlVUcXpp?=
 =?utf-8?B?ZndzSlhxMWI0b1hUYzFEeEFqS3ZBcURkdkhGUkdSbWtaeHRXVUNNcTJ2NTRC?=
 =?utf-8?B?aWYwN2dRS3R2S3JiMnIzYThxamExZjIzcGg1K0FnUU9uM2xtL25wV3VUT1JV?=
 =?utf-8?B?TjlBZVk1c1BjRUo0MzRZRzh2T0lrTFlEcU5FM1c5NjVaTmhqUVZIckkxTHRJ?=
 =?utf-8?B?c1dNNy8rOU9hOU5GOEpkOHQrVHBXNmNndzJ6WFVJMk5RVE14QVMyT3d0NG5O?=
 =?utf-8?B?UklRSHhFQWxzMTVuNTY4VHc3ZDRRRll6R2pyNTBhalAwVHN3T0tOL0RYTnJJ?=
 =?utf-8?B?eVBWZzZTMkJGcHJvS0RQSk5JZkhYVXBiTWY0WS82ZVZEUmlDcWxHa1pmRW1u?=
 =?utf-8?B?TE1xaEFUMEh6K3I0SlhyY0pWOXBXNi9JYzB2ZExSaGcrbGRCOXlzc0VGbEF2?=
 =?utf-8?B?d0p5TDVsZkcrTVlUNkI5OC81VER4Yys5a1dDSUpQM3FITVJBNTBXSWZpdVUx?=
 =?utf-8?B?Z0kxMlNWczFUZWpNbmlDSmNuS2F5Ty9FM2M5RUlFNVJ6RVJGS2RES1RUQVI5?=
 =?utf-8?B?eGtpbHlrZ0JZT20xOWFBWkVTOEtYUmxrMzByYytqTnZhOGpWR2lSMU8rcmZQ?=
 =?utf-8?B?MnkrRkVZOXd0eVA1WXNraUwyTjBGbXlrcUhFUVpQU1J0am9UcmV5SjloUW8v?=
 =?utf-8?B?R2tQck9ERE93UUtKbnEvYUxCc0xpQXRvNlZwK3l4MTBrdCtYVm1MWnZXN1VU?=
 =?utf-8?B?cEo2WjdKOEtmQXZ5akJnZnVsbnUxa1lUakNCOXZNNTA5RlZUbkpVQTZRR2tW?=
 =?utf-8?B?UmplZkNXUGF1aTdNY3pYSnBlVlcvT01LelA2c1ZWRHBUZGxUS21uVnhIbldM?=
 =?utf-8?B?aFVBcWNyMmxuUE9GcUpFMHRWTzlmYzZOK3hDNGU1eG94NTREbER4YXgxMndD?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yAtlfvtSB/9sWPQxJvEMOEx3NTw/UWnbu7AxvpQk0OE4DUnwExEUEGyjKTS+YRjGw7HbXJDeph6Ri4aW7isjAV6MbJgvjw9vqWD3Ck2mbrK7BdcKbz9hAbdTO7+SfSF4jYbchLJ4oyq/G0LfUbHj5dy6xccL1V9deyAP1m3GiJPyW4zDv7gDf889uYqv0XXgxcWachUf32b8A/83RXMk8ukOEmz7Gokq/imU2o0F1pH0coIS2X0AJgoYmucFjvpsQbYdjSsQpH2CXlZxtxaNLI0mL4fvJ4IequLlBiHGJF9DJU2gkbM/3bWDoNYtx9+G+34zuPwh+tS9Gfks/d3hQUi/ky+GUfVjL8kyGBB6MDbeqC5yODbo/u7f/jsbZfdEkMrxSNtHQyLO4c0PahM1vxlvSVfFPPsntbowoYtqJowZKxpaLEQeETl2RoBvM+CfjdMdjpR4H7GZGoylHTfmDrZ9u/ZKLuIdOjTvrxtv4TxhjBIp66Syqurj56ccV93JbZ7ggHRBryVbYwUuQWEqjwUug3IPIbtvZ98Dp47y4uTvRoJympsyDhVj9+jkuY3xPWRxGFEGVF63Yw7FV5qAgWnaCPYaPnWU6GENb3pv+2iQMJHOWMYFfpQ1b6W5dwbR+WJs1qWgwwYwprUO+wnrTes88AhJvduVsH6v8tE6tu8uT1SC0jltGoJa4msqHz2ZU5N2C5RSmeJ227fjc6qY7oltJ6VtpyhEcHBwBz3fBJKIqAX+IckrIAMleFw+tTQSnoZoTh/swrm6sVtvM29ov9gRV+Oni8qrw/Fin5UdcfOYasxIfl+qZjzfee71ZMy8DSf1wrBqID2JA8TIMSjkKQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d278e156-2134-49b9-f9ae-08db0f4fe6ff
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 12:26:45.8862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utP/i8eyP4RP4XuWZ3pBnuQRB5HoXOhHApXNiJ4AMNJAalmwkWwxg93Qilv/4swaem4GFWbiXM2u0kECPESn/mhjfgXfyxAJjOyl/8LKBRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5804

On 15/02/2023 12:02 pm, Anthony PERARD wrote:
> First, apt complain that it isn't the right way to add keys anymore,
> but hopefully that's just a warning.
>
> Second, we can't install clang-8:
> The following packages have unmet dependencies:
>  clang-8 : Depends: libstdc++-8-dev but it is not installable
>            Depends: libgcc-8-dev but it is not installable
>            Depends: libobjc-8-dev but it is not installable
>            Recommends: llvm-8-dev but it is not going to be installed
>            Recommends: libomp-8-dev but it is not going to be installed
>  libllvm8 : Depends: libffi7 (>= 3.3~20180313) but it is not installable
> E: Unable to correct problems, you have held broken packages.
>
> clang on Debian unstable is now version 14.0.6.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Yeah that's because clang 8 is way obsolete, and http://apt.llvm.org
only supports Clang 15 and later now.

In hindsight, it was a mistake to take unstable-llvm-8.list in the first
place.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

