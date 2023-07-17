Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D8775640D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 15:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564539.882019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLO3i-0006EC-7n; Mon, 17 Jul 2023 13:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564539.882019; Mon, 17 Jul 2023 13:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLO3i-0006CB-5A; Mon, 17 Jul 2023 13:14:38 +0000
Received: by outflank-mailman (input) for mailman id 564539;
 Mon, 17 Jul 2023 13:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdAb=DD=citrix.com=prvs=555bb5b00=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qLO3g-0006C1-Br
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 13:14:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de58f592-24a3-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 15:14:34 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jul 2023 09:14:23 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB7056.namprd03.prod.outlook.com (2603:10b6:806:325::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 13:14:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 13:14:21 +0000
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
X-Inumbo-ID: de58f592-24a3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689599674;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+JoHWxd0mWPlrRMFBfbJ7K40eTzwMVUkMLMRWfSgvcE=;
  b=d+bua+7M2cqoKZfueaGIkfrtHgoNeZEmLOSjEAcwPg2wdlNE7+2zKbct
   l5FZo/MYMdxIdUJB6EXA6kN0KO62fJDB0q9wEYJ9H9WG73WWPQqjH0+in
   11nb44NNhbgCX5EVNldT6qu3qEkPwUpeWEr2ZrymfT2SmNMQYG3I0vbwA
   8=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 115753022
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YWl2fqhLQI4E2Pw78fYRdGHyX161ihEKZh0ujC45NGQN5FlHY01je
 htvDW2PbKuONDT0Kdx3aY2y/UNVup6Bm9I3Sgtk/is0Figb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4waBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRfFQACYhehvNuH66nkccRX1tYAcPL0adZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS0WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeDnq6Uy2gf7Kmo7Cj8mS0ThvNCFyQ23ed1AJ
 BEy5g4glP1nnKCsZpynN/Gim1aBtwQZUsBdEMU77h+M0ave5wuFBmkCQSVFYdZgv8gzLRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBsZQAM+dXkrak4hwjDSdslG6mw5vXuAi35y
 T2OqCk4hp0QgNQN2qH9+krI6xqnoZ3MTxIp6x/MdnKo6BtjY4yobJDu7kLUhcusN66cR1iF+
 X0bwc6X6blUCYnXzHDUBuIQALuu+vCJdiXGhkJiFIUg8DLr/GO/eYdX43d1I0IB3ts4RAIFq
 XT74Wt5jKK/9lPwBUOrS+pd0/gX8JU=
IronPort-HdrOrdr: A9a23:C4Rs66A8VEIhm6vlHemW55DYdb4zR+YMi2TDgXoBLiC9Ffbo9P
 xG/c566faasl0ssR0b8+xoW5PgfZq/z/FICNIqTNOftWDd0QOVxedZgLcKqAePJ8SRzIJgPQ
 gLSdkZNDVdZ2IK7/oTQWODYrMd/OU=
X-Talos-CUID: 9a23:40nvuWMWv84yF+5DHxRX+0ITOPscQ1bGk0z9GB+qKjpSV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A2NfGkQ5hg6Gq6Qk77CRMDFYcxoxqwZSwFxoQuKl?=
 =?us-ascii?q?F+MCmOjN/ZhGBqDqOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="115753022"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W95i21I/YJYVwYdzhGzZpdfrDbvBImrdKFGpWeN1eH7371nQDkI+C2kBzbNms73rFkVilIMmL4DosFtd1nagB7X/Su15FZcs7Bw2ag+MCW0d0eHQh1hUoKdWCMLXiKLjeoReaQCFACnQN2GBZ4vgjzileVYz6DkFDzA6lsAMluDBoh7oKCbqEnSqSkDRrAnkzpLy74LqxmfVtVUBjLhEakzQcuxx8BVmFz6lobBDygrp78eTiLcTGJP4wCQRrjo3yz3dS7SoxAOmbS8Vy6vwb2FlWMFBX8BoWxD6d0twBFc8GLo6iEncSEKk0+295W8Z7awe3Dx/1hZ4sqnk/X4zeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHZrwrJvMpH5U9bxsIskuSofd7Bh61t53/2vJsGvyWM=;
 b=adYmreCTzWjxay/fP2hVvHpXPhO8XGrD3R4QfI7B9c+znMeo8pojCJEaywEjW4Jk8LOhTz03/BClxFHZI34yePJDfme1LWwHneNP1uBV/uN8iNHItLTTB7FahsqqwWJ4v99pt8+ukyLWTn2vBAYwV7bjuJSnOTW9P9wTjtwazMBT9z87k2h4ovoPGhO6J/ho0GUzDhM+Z/0a1p8vUmn8K4d9JbcJC3pMIAfeVveZ2xZCEUtPooIQ6gwbsrof6TEobeFKFU00RQ2YPpgNDj/knFOxPBMRHVHhaZ33WI4xL5uyWE40fM3daGX7R7ZQ0QUl3STf4VHCwv7+yXS5kNN01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHZrwrJvMpH5U9bxsIskuSofd7Bh61t53/2vJsGvyWM=;
 b=sxVs4bcQaDzBzcfC7oFuHgVKa7Ed5ybFyMP1OPXOzxqhyLSvzHWkP88xPxAedu1novni0QKMPZnKAxYYJMGf9QpilhYjUDCbsTkKK5O0VWuq0le4rY1UbTbEgUlT6babUtu0NI9eqpSkSkeF6fok91CkT2EaxGRqUAlvbUNwTxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cf7ac648-dbef-80bb-986b-3fe0daef855a@citrix.com>
Date: Mon, 17 Jul 2023 14:14:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <20230717130925.28183-1-marmarek@invisiblethingslab.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230717130925.28183-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0111.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB7056:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a92c31-44df-456b-c48f-08db86c7bb97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yI+yEP3eijtWCVN+Pmxbhj1uXhxS+Ke53ZK8NKNAvIQtnyEIqQa6NNWpUO4ZZa/An0GzHLBLeuYRJlbCVw/q51cxVRWdlO51T/KGVG79Qq6sYEhcjoSdvlW8bn7D9mZgsAC3mDgobeL2TMDeTM5Y3mDM4QNKGiT2zcHqm2nx73d3uqOlvtXjj5Zjmkt1G8fLnmFiGF3dCC+DMti4Pn2JJrf18NqOd0no72+lqNBad7bwhTh9QZsDIdDMLllxbTH0RJugdN7HUbPzFWTr+z+2PqT/tbZA5ScLfCtPsnjS8LWLc91iQESYKC8rLgd5qmJb6M1WNaidH8ZCQk6gOeQAxQm6uBoiFEDhK6sZQeG3UDJsag5qoW8dMbDTgTzkmMsU1MTMakBsKr3mE6lRrTxZxiirzcxhwBkDqhle3tbBplxZ8wFKNj5Gcm/N67nD4BMiYn9GyKnTIxOHMTHoO07GOkkm/UDn6+k1wf+GdjqtqE42MH32lLerLNblMttN12Dn+9aDNJjIqBsBYmjEBeH1OkpLL0c0DgJlLpiYKFsDnmdz5QK6HaSQjkQ7TYfI3avL7AdajK9Li4A66DwtvVpxbj5RWRMHYEDi8dMyTbbiotRVUrA+BuENILOuIFKjqLDwk+bpZpOxDFwic4dtHtGG1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(41300700001)(8936002)(8676002)(26005)(53546011)(6506007)(54906003)(82960400001)(478600001)(66556008)(66476007)(66946007)(4326008)(316002)(6512007)(36756003)(6666004)(6486002)(38100700002)(31686004)(86362001)(2906002)(31696002)(2616005)(5660300002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE9hQ3plMmxoOWNxcldOd0VESVFXVDZNQmU0T0JjbktZbGwwelNJUDIrbHJN?=
 =?utf-8?B?dGR6Um42a1ZlWGtIbWlRbzRlc0lZVU1ReXNpN2VrMjZOaUpaalhjQ0xYRzRx?=
 =?utf-8?B?aEx6NWwyaklWbk5uSlp1YmpYeHNFTWZUS3NyN2Mvb3JjSHA3RFNxS3RnbWJD?=
 =?utf-8?B?RXNPNENRQysreFZrOWEreGxkK294QWVLVklvTEczejVQWnA3SUlpVDUwSE4z?=
 =?utf-8?B?eWhBS3Z4dFEwOUoyYWgzOFJtWmE0L29NNkRMSVFTaHdTMVhRWlVRWlpsalg4?=
 =?utf-8?B?Nm1Jb21zZjBsZFNML2l0TEZ3ZEYzaS85SC9sWXBSZ05Ta0M1OVRVQUtOU3oz?=
 =?utf-8?B?QUF4S0hPVW1YblM1aWVnZkR4NTdRMjJsYzR1Q0h5ZERkN1oyOFdWRmpWUG9Q?=
 =?utf-8?B?UXZTZVMzc0J1Qzg5RFc1S3FPR1RBUTZhY1ArZS9yZTF0Zy90SS9lN21lcEpG?=
 =?utf-8?B?VlFTZXJXOFRodjF1Z3FEUGtSelg1Q2FhMzlidHU2YXBOWktlaGpKODlxMU96?=
 =?utf-8?B?c3ZWM05CbTREK0dOdkVoaGZvM2hIVHlaM3pJQ2RaU3ltdmIvanRzZlNYS2hL?=
 =?utf-8?B?ZGhWQmhLaUFxclc2MTVmT3pCcitkQjk2UHh1R1BrR2JFalBLVW5uemkwK25J?=
 =?utf-8?B?RGlxZEE3VmNTRVZRcE8wSVorU1M4MkV2SlVqY2FQZi9MN245T3VIZVBFbzJ1?=
 =?utf-8?B?eWxMdkNlRTM4L1dMdFExaTZFQmdCZWxOZEtVcHQ3TVRxYWtrcFMybVBBVlVU?=
 =?utf-8?B?cDlSckRxbkFiaEllY2pBbWZLNno3dktKS1hkbUlORGxucUlBRXhxWTdNY3Zr?=
 =?utf-8?B?UFowVEpsdUhzRFJnNXdYTGhxNW0rYWJockxFdDVodU45Vk5YN3FBOUJ1SnAy?=
 =?utf-8?B?VlBjbkZPK3Nyb24wRjl3enJzZ2VaWGFhMXpFREtnaEJFZ1JyeVVDZ0JBdVZZ?=
 =?utf-8?B?dlpvR3dzMUE2NFZoWTdERnphdStETWpTblIvZVh6MXgyVUJ2WG1PVE5oWlFM?=
 =?utf-8?B?WGZ5QzU5YXB0NHk2SFIzNktnTS9SOTFxQmd3MlZRSXNTWnF6RGZvNnloM3Y0?=
 =?utf-8?B?cSs1QVFndCtsNnVjYnVDbkVTUkY0dkM5MVlMd0VmeW0vWTdUOHNva2dSSFhI?=
 =?utf-8?B?OWJSNC9mTGM0TDhJYWI2Wmx1YitQVVI3ZHFHMWJuMkh3WGljaStHdE9uK1V6?=
 =?utf-8?B?YThGYUU4RFJEY2oxajN4K1pMaEx0cVMxTzlWUWhzRllLMmkxcXgvZ1B2aHJZ?=
 =?utf-8?B?NEVtNXlkSi9mV05JY3g5UHZuMHZOMi9jNElGQzVDN1I4QXFGeGZ4Q0ZYSnRi?=
 =?utf-8?B?ZUwvMzh2L05BcWRTQ2hhU21nWFcwRS9Jd3BGaXU5MlBteW8zRTc5ZEtYQ2tC?=
 =?utf-8?B?UzBTc3ArZGFScVRPQW90WFROSDVHcWhCOG5EeHdnK3NyZEovai9WRDBMbklY?=
 =?utf-8?B?em0yWXFNZnUwQ0NYSlU5ZXAxY1NqcGtvKzhzd2dERXJscmhxSUxQZDBlQkJt?=
 =?utf-8?B?UU1uaDBOOVVVYy8zeGVBbUZhUzZVVk9TQW9yYXZOSzZMY0tkd3FBUW5WVHY2?=
 =?utf-8?B?VGZHcmZRMVdkd1ZYU0Fsbk4vSUFkd3ZZemplZmpEZFZBSWF4dzJVRytuUmpP?=
 =?utf-8?B?Y29GNTZ3UHFYNkdOVkR1WGNDOWt2UGFIV1IwYzJvTXg1bjh6U3hVZDZLTzg0?=
 =?utf-8?B?ZHV0Z3FtUVFaREdpSVRUak5pOFQrQ2trMlB0NldNcjNSZUdiMlVPV1RCOWxB?=
 =?utf-8?B?WnBCVGdKMHJrV2Z6bU5ZUXhnbW9nODhaTUdmaWJ3SndCd3IzbGZLWmY0clF3?=
 =?utf-8?B?azlaeFhJSEV5WTljUGxjVEhRbnFhYnNVdTBhUzltY29kRERVLytPTnIyMG12?=
 =?utf-8?B?Z3Vqc0lSRWZ5dnkxSjNVa3pVc3pnREFHTmVxOGRkNDRic0hJVHlrOExBa2lB?=
 =?utf-8?B?Y2NBU3VRSkhMbW5Wd25wZFkrTm5kbUg2TVV2TWdXcDQ4YytJQTVQZDFyTEhs?=
 =?utf-8?B?Ump2cTVGWnpsYUtTeFVCbm1NSXRHdmcxWWF2cTkvL2FZc0VHS1BIMVlIcWdw?=
 =?utf-8?B?eWUwSGxyWEtaRy9VRm1yK05CNWJNTXBkd0lQTXd4aTBxSnU1Mml1bEZjUmJ2?=
 =?utf-8?B?RE5CazJNWkpSbzdmWDVkOFFjdVRWZkorbGxkUXQ2MDlHYTJFMEJ4ZnJUSnBM?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?RHRqUHJmVTdYNWVJVmdLMXYrV2g5eWxOTVNGRVpLMGdsVkZmVzRkcTR3Ylo3?=
 =?utf-8?B?cnRzdTI1bkhYMW1VdmM0MTkyWjUyQWk3TVZLZEpXYyswUmRWckhUeXMxQVYv?=
 =?utf-8?B?cElZaW5Hb1pCZ1k0NVFMSU9PeEJPWXNhQVNVN1ZFdnZ3dHlKbWx2WjNUY3pU?=
 =?utf-8?B?WFJSMktvYzhWNC9oTmlwOWJCaE5IUWdWbmtSV3FUWjNCSk9KZTIzVTVxZ05U?=
 =?utf-8?B?RDVIUmdwTkVETW5nRFhQd3ZrNkZsaGp4SHBSR2RSeGMrWHJjTUU0ODY2cmx0?=
 =?utf-8?B?bkJ6b0VSMkpZMXRlUXV2bHA2cDZxbW1ieVZkL2lIL1luODdOU2hWY21rdEpZ?=
 =?utf-8?B?blE1NVZWc3RsWldxNkszdjhiVkJqckxiS3QzWlMrZTk1Qnl2TnZQUVRidm1O?=
 =?utf-8?B?SkVOK3B0d0I4b2s0MUc2UFk2ankwZzUydXFDcnhMNzV0Z0VYamZHb3ZHK2FJ?=
 =?utf-8?B?UjNTRDZJamwxZXRYQkNIdUQzTUIraEs3Z2l5Q0lJUmtCNlBhSWQxbDJtR3VP?=
 =?utf-8?B?WFlJRzNDSzZnRmVlT3pxM0NIT2xJMnpZNkVONS9wcENhOVdvV3AwWkw4V0dZ?=
 =?utf-8?B?NTUraWxqa0xaZTBESTFzUGF1V2hTYVlFRjlTMlFSOTJvSVJmZ2xsbllTMTZ5?=
 =?utf-8?B?RHVOcmJaYmxXblJnM2xRTk00ZlE2eG5zd3pYRDRQVUI2di9LeHgyYUVOQUhs?=
 =?utf-8?B?bHlnMGdjMHJueCt2eUIzcE8rbEdydEtOVXhGTjZ1WUZranVpQkVMa3N4YjF6?=
 =?utf-8?B?MmdXZ0pXMEV4OUtpdWtycjk1aVJvNzlSaXFFS3IraFJtVytEOHhQcytQRXNw?=
 =?utf-8?B?ZmhjZStnQVRCazJiSkNWS0ovdUt4YmlpbUZZODMxNEdZUUVGc2RCVDJkamtM?=
 =?utf-8?B?aExtOVlmR052QVorWTVEeUtXODBSckUvWlVUNlpaRFVkdi83SHRjeXJYRmFk?=
 =?utf-8?B?d2dTWjlOUFl4b2RCVThJMmRUb0YxblQzRjFTZVdFSlBqZEhnelFRZXZGeGhl?=
 =?utf-8?B?NkplUXJxRVZtb1R5Q0ZZNnFweXRURGlicG1CRTdzZ1M0Tzh1Z1B2RDh4U2ow?=
 =?utf-8?B?Y00weUFGQktSV21QSTNaaUpZcExsbVNBR0s1QTJXUEFaaWtveGZ0b2ExbnVU?=
 =?utf-8?B?YlNsZmNwemZLaWtUV3l0Z0NOSUhzUmFGd0dFbEpJNjZNZXVML3J6SUZDMUpa?=
 =?utf-8?B?L2R4Z2pRbG44RW5qK2dnZTFRdXYvdWF4U1NXMWZ1Q2lyVkJCKzJoM2wxKzFt?=
 =?utf-8?Q?KExnQ64pt5sV6WX?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a92c31-44df-456b-c48f-08db86c7bb97
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 13:14:20.9593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJg7jLeK7Tp1znm73rxuS1SvIKRXeWEy2nZoNUBNzu/2mR6MQoerbvoMoHLfNjolnNhZV9khFXYj7soRqFkKKzfbPZ+DwsYM2wtpAKOrLr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7056

On 17/07/2023 2:09 pm, Marek Marczykowski-Górecki wrote:
> "staging" branch is mirrored (automatically or manually) to several
> repositories. Avoid building it several times to not waste runner
> resources.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  .gitlab-ci.yml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index c8bd7519d5fb..c3b05e32636b 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -2,6 +2,12 @@ stages:
>    - build
>    - test
>  
> +workflow:
> +  rules:
> +    - if: '$CI_COMMIT_REF_NAME == "staging" && $CI_PROJECT_NAMESPACE != "xen-project"'
> +      when: never
> +    - when: always

If we're doing this for staging, we should include staging-* and
stable-*.  They're all the same from this point of view.

However, this does need double checking with the committers who use
gitlab regularly (CC'd).  This doesn't happen to interfere with my
commit workflow (I use a separate branch called for-staging), but I
can't talk for others.

~Andrew

