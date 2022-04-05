Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E544F2CF1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 13:34:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298758.509066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbhS4-00031b-HC; Tue, 05 Apr 2022 11:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298758.509066; Tue, 05 Apr 2022 11:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbhS4-0002yl-Dv; Tue, 05 Apr 2022 11:34:24 +0000
Received: by outflank-mailman (input) for mailman id 298758;
 Tue, 05 Apr 2022 11:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbhS2-0002yd-Mh
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 11:34:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 547692a2-b4d4-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 13:34:20 +0200 (CEST)
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
X-Inumbo-ID: 547692a2-b4d4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649158460;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=X9LtNCNMuvCfnzhL3xipXrl8mmnDDYL0OUnzwIYs2Bs=;
  b=TiGNnjcAEOkQM2NgHNHZywLKio1qDkrheNzZJHFqeOHjKFQp5e85Vcmo
   SZ1/y8CyKTGIpo/9ariKIOF6tjBtBJrbbSM/L1NG9MN2AVVnLLC1z0lX4
   fcRIMsErwW8+ABPqMPhfPjgcNX+/XXGtsbq8lRstmdfzqus1rjJtzJB2y
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70430352
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:S5GtRqOhF8xOTl/vrR2al8FynXyQoLVcMsEvi/4bfWQNrUpzgzQEy
 DdMXmyDOvfeZzGjL9kkYYvj8xgB7MWHzNVmHQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tMw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 Yxii6Kfb1gVMZLMivs2VwJnLjlnIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwg29s3ZgVQKy2i
 8wxbChUcznKWjp2A2gGU5hkoP2lqmXdbGgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSAzRKV/3TqgfXA9Qv5RYYTGbuQ5vNsxlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BBGVAjoO6by2h+YiUvyyZPTMqEHcbenpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzl+PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnvNOzyjxpmGGeF6bKKI3XH327wk5JEVdoNiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+SYW9DKiIM4YVPsQZmOq7EMdGPxP4M4fFyhZErE3CE
 c3DLZbE4YgyV8yLMwZat89CiOR2l0jSNEvYRIzhzgTP7FZtTCX9dFvxC3PXNrpRxPrd+G39q
 o8DX+PXm0Q3eLCvOUH/rN9MRW3m2FBmXPgaXeQMLbXdSuencUl8Y8LsLUQJINU/xfkKz7uWp
 RlQmCZwkTLCuJEOEi3TAlhLY7LzR5dv63U9OC0nJ1Gz3HY/J42o6c8im1EfJtHLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:f9+tvaC+V0GedvHlHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpYfHHfFAlEii8eV57HzzcZdQ60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="70430352"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eu3oSBUR7W02lXBzAUjHcBYiQbFhRgx0arEUO2/YPi6te16CbBeELt+gnuDT218067TaiTIcuf4rsMJJXa60DP6hdm/kSpKTn+KAD1Cdv1HckDnA6ugbvsXuU4/jutEVDj7CH/DN/FYrlenKhCPKkg7+EMKr+UpsGOVLiKKfu80sFrtArh3QRFWvAbj5kCZpE1aMawv2o297tiJFnXfQxJe2W9ZNVyE9yBTmnshLCXFSkHK2icKBQq6aR4F/aGxad+thYJqyP2wLJNZURI15nv0EwSprigzcqrH2wpxUW7M/FIrypsXZxRo31lfW2fjOek221NYvnmG8hoqm6JkmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6d2EMwQuMlZZemqHnYYwxySu6RfYTiI9NZx/51mPiqs=;
 b=Mm+rYtDr9GqeXWcopIG6AZx8PlAM52bNij5R53RBehkdAEyC5BRFiTs/AEeebZhw71G1vl9TjGfzxlSFM4zm7WWFQNlhF3fDE8aJ9C3eyPQcUU8qHiM7vYIFv3AJEWZCSLrErWs+VNPsLEUZ0+rowDIJGczbwYAbOtP7w1Z0+eCZIB1HHNfvmsIMfdY2aJYoVs0B7RFvGIJgwIlEpweeF9KOUkjPAgl/8Pp5f8OgGpAFJQ6I0qasET+Un5Nt7WbQSRXG4tZtFCSppIIFHvNZT7Rv0bR3seDt3M93ebigHgQ0RmzN/AMHNaSQLpnz6hGCCxu9SUl9baT8D5NU6JRVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6d2EMwQuMlZZemqHnYYwxySu6RfYTiI9NZx/51mPiqs=;
 b=AEsBmkUr8tikGbLvzssPtHvNrvNiWMXwzMl1CRzaXyjyOEyL07nrrez2AK4lC/I5GJFmZqpgZEs51d1s/z5OkgkMmC8KQZVfT8f8e423hvqldxz39f9Wri5xp3AYz7hmlMRlKtGvmXCGn6W27eGu6fCNOilsdjWtPsDJAN/jbLo=
Date: Tue, 5 Apr 2022 13:34:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 2/8] x86/boot: obtain video info from boot loader
Message-ID: <YkwpLavk8bC3Ir0+@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <6fc25224-7985-73a6-8877-bc209f64bf8c@suse.com>
 <YkwNbi3lTNJbWVNC@Air-de-Roger>
 <26b988cb-8b20-f78d-548e-1b1f16d10a63@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26b988cb-8b20-f78d-548e-1b1f16d10a63@suse.com>
X-ClientProxiedBy: LO3P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2cca11d-9b66-4950-3189-08da16f83402
X-MS-TrafficTypeDiagnostic: DM5PR03MB2475:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB24752E85677743C6B3573F2A8FE49@DM5PR03MB2475.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUL1f0Lu7deCzp5cRlJ2aWHCcu6+/np6f+tE7f/l8rD5K7Eu9peUvVLO3IaEs9Ot6ZU8pk0EXjnGnkMu+8etkNeeLVlUpKw3I0Pe2brK4Sdl0tzJ3piVwMaFMAI38X5L9Y38h4/5ha70uuhSfg29ESGb/gJVgNav81YYdPwV2hM2kgnuZw/OfYuwFyel3/OKwwb9DObYUO+ouzm+Mr0isMSkJ0yxKHL3LLrDr21STOuqIkBUVVZvkLl6UXO/Kyb1+YA2WV6X2IAt2+EcYvwbtZmy8TLdi+OS+G7G9wZuJNVfZyTW9d9QzLVwVveb8D387M7vJyrIwPdT3C2cOsouYLDwhtq1Bsvv0g3yHCK61we/A/L6Q4JqmiegjfYunO2sBPlHHur5zzbBP5zLWUa4aMbV7/pI2RCmkdDQz6IJxynoWn81R0hOtHQ+nv/yx4dH3tUsoDyClD7rvtE3abitUEkHyhJvJIW6s4RNlkA40bS9m9NsdNLcTbjunXFmEdbHQrzRP4zMiW3pTWbTmGMXdHBWTB9FuJ2ekqX3ccPCUTrG3zCBjYeQhb2zMqMpXve5bwXzBGmCgSWGI5wk+6upc+e5FYBglW/Hr1AC3K7I/v/Bw6qAH+rNC4Ry7licIXpG1gcGuxz/CcsXNUmP2v1yag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(4326008)(66946007)(66476007)(86362001)(2906002)(83380400001)(66556008)(5660300002)(82960400001)(38100700002)(8936002)(6666004)(9686003)(53546011)(6916009)(186003)(33716001)(26005)(54906003)(6512007)(6486002)(316002)(6506007)(508600001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFBSRWMzNTN1V09jZnYzdzRHRTBoSDZIMmRUWjZXRUJuU0ZtNjY1QmdlNzZy?=
 =?utf-8?B?dk91c1V1QlZFbUVzYmJ2WnB5Yk8vTFJjT1NITkFmeEVSUGlWVE9vN0ZyTmRI?=
 =?utf-8?B?bXdieFduYmVFNmZscjhoTVFVUmNxKzBzL3gyOWRoS1hVY1ZhQ0x5VDJzSVJU?=
 =?utf-8?B?b3lkemZqUUdxREpYWkNMTk1KSUo2MTAzYjEvN0tRcE01c1RxZVVlZnRvR3hW?=
 =?utf-8?B?OUxXNDFUams5V25EVE1XWFVPZFIrQlBNekViNHV2RkRaNkNadHp0dWFleHgz?=
 =?utf-8?B?UFY4R0pFMGNlRTIyM2VHMjJJalc4YVA0OFVabUJFQkptWEdrZ0hJcW41QnMz?=
 =?utf-8?B?bzZ0TWlqYm1CNHBuK2oyMWVrbnNxWWRHeXVSQmlLay9pUGZTYnZYeWxKdy9I?=
 =?utf-8?B?cTRsQm45RElMbkJqdmtmckVlOGc4eHl4d1BvaTViYmxxbUFscndwaUllTG5x?=
 =?utf-8?B?UmNkdm43dUFYbWNIQlM3OFZmTm9udld4czgramphMFZMS3J6dm42Qm1INWNs?=
 =?utf-8?B?Vk5EVURsaG5obmFuSE00TDVBWU1MMFhWZWFkM1pmcFhybkdoZFpMS0NueXlw?=
 =?utf-8?B?dUEralhyZ0lYVThKTjFsck5aeVdabHpZY0RvNTA2c2pRT05UajBzZm14U2dR?=
 =?utf-8?B?eDh0UGNFSFZjNVpwT2U2MDdvZFdzVmwrNFU1WkZCQkFGaEVWa08rdndzR3RY?=
 =?utf-8?B?MUZOUkIwb2xrSzhCNXBnbjR3bUFLNHFJY1c0TXdxNnBxMUEwZ2d5T2dVaDlH?=
 =?utf-8?B?QUZYVmo4UG1vNDg3RUplNUdRdHh3L2VSUldzQlJZdUN4eU9NRXhMNFpycG16?=
 =?utf-8?B?SHR3c0Q1c0ZTL0Q5TmJqeVFYR2ZNVzF5ZHpTTzRVb1VOU0t4dTVGUzk4QStF?=
 =?utf-8?B?UmxQM0U3ZlV5OG51SlRSN3M5WUdBZHpRK1p5Y1Z4MVNqVC9kRkNsRFFuZ3l2?=
 =?utf-8?B?S09ndzFDN3o2b1NyWnZHY0gvSFAvc1h3NlhCN3I2VE9TY3F3MG90VkkvVVJH?=
 =?utf-8?B?VEVHZS84a2c4L1FiYUQ3WDMza053dWsweDRtbjk0U0FqOVkvOTRFVzVqY0dP?=
 =?utf-8?B?Q2FuWE9XcC9xaHMxcXp5QVd4UW9CbUEzbkhMUFpwbVkzdysxcGRiTGFNcEdI?=
 =?utf-8?B?WGNDWEtsSWlST2xwL00rYzNuejZCa3p4RUxGbERlUktPUEJRS09UL0IvOEtS?=
 =?utf-8?B?OTFIL282elJXaTdiWTM1Q3g3YzZBVDhRNC81czZJOWVuSTYxUUFEdnNidWFS?=
 =?utf-8?B?cVRlcS93R0QrMkwxUHNBRDhZSmFQSVFWWmxzQWFQdHMwSWlIeFlSMVQvT25m?=
 =?utf-8?B?V090Ujh6TnRNR2l2NUlHcUd2RHd3Y1RrcWhvcnBieFFCcW1OWlBtbDB4cGJN?=
 =?utf-8?B?Yk00THg1SzM3cXpKT0tscDhwaEhVZ2ZsOEd4VFRKLzZNRjdGM0k2VGdrSXF6?=
 =?utf-8?B?MFd6czB4MXR2eXBJNFlyY0MyODhZelpvdk9jbEx1SUpmcEhIayt3SHd1YlFs?=
 =?utf-8?B?MVBLU0RtN3VmaG01M3A5bnRPbytGaVl4dG9SdW1vMnA0N28xbWRaUTI1MjB6?=
 =?utf-8?B?emhxV2NnMzE0aGgyRUxRQm11RS9aZDFjenJ1STlMdmUvK21RaVNia1JuVVRk?=
 =?utf-8?B?Ym5laUQzSVNNWFJjN3Vpc0N1UGk0T0c5VittZ25WRUFLK0dHdGlKNXpZby9D?=
 =?utf-8?B?b2FxUUozNFB1eGdxaHpiY2M0aFhFRzYrRGNPRk1qV3l1UGE2VENMUEYvNS91?=
 =?utf-8?B?VWNidVBZTFZDZUhINS8vTHBJWW13bG11ZzRBMnpTTFJrdzhXTTc5Y3A2aytL?=
 =?utf-8?B?OE85eGNEbkFiYTlaNytxWjZoYis3bnBEUndzaXUxUFFJQktteHZFQ1BCMHkz?=
 =?utf-8?B?V3ZhNndtTDY5cTJSYUljVGNnTkJ3MERjL295NzhBWEZESlY5TndnTUZYcjhn?=
 =?utf-8?B?RWp6TUNreUpoWnBhaXRwQjNDSis1OTJwODcwNEo0MVRHeDJQRGRjdlJ0R2RD?=
 =?utf-8?B?OVl5Z2hSRktLL3p4cG1paDFwNFY1dGg2NG1oOVhFZjlkdEdrbUpBeTRvSXc0?=
 =?utf-8?B?RXM5QWt1dzZzRUxFdzQ3OW9vemNZMXpXYTFOaFR3WTVxR212QTNoWFlMQ0FY?=
 =?utf-8?B?elgzQUpkemdIQ1FrVWdaeVQyNWU1ZHZYNlhDbTZSSDRHc3FocGdac09UU0xh?=
 =?utf-8?B?M2Z1M2VWRVU2bTZlRm50SWJzTTNrTFhleEJ0bEFWTnpKanJxRUk1UEplNHVF?=
 =?utf-8?B?dHlHMzlJTVNFTEZiSlNBVjhoanVUVHkxZStQbDJCUld3Mi9wdVhIb0RXakY4?=
 =?utf-8?B?S3F5ZDEza3U4dGFqbUZxaUNDNXB5RlhXNlF2USs0K2JDWklpVjhFcmRXOUxs?=
 =?utf-8?Q?mjp7zFPYd11jnCnc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cca11d-9b66-4950-3189-08da16f83402
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 11:34:10.7710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foBUx5OVPqkBO0LrQYGdnMIYo59QvVhOFN0kCaFeieN4upX/znMVesLmXIk7T5ZGXHKs7MxB36fmM6pkJRLHFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2475
X-OriginatorOrg: citrix.com

On Tue, Apr 05, 2022 at 12:57:51PM +0200, Jan Beulich wrote:
> On 05.04.2022 11:35, Roger Pau Monné wrote:
> > On Thu, Mar 31, 2022 at 11:45:02AM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/boot/head.S
> >> +++ b/xen/arch/x86/boot/head.S
> >> @@ -562,12 +562,18 @@ trampoline_setup:
> >>          mov     %esi, sym_esi(xen_phys_start)
> >>          mov     %esi, sym_esi(trampoline_xen_phys_start)
> >>  
> >> -        mov     sym_esi(trampoline_phys), %ecx
> >> -
> >>          /* Get bottom-most low-memory stack address. */
> >> +        mov     sym_esi(trampoline_phys), %ecx
> >>          add     $TRAMPOLINE_SPACE,%ecx
> > 
> > Just for my understanding, since you are already touching the
> > instruction, why not switch it to a lea like you do below?
> > 
> > Is that because you would also like to take the opportunity to fold
> > the add into the lea and that would be too much of a change?
> 
> No. This MOV cannot be converted, as its source operand isn't an
> immediate (or register); such a conversion would also be undesirable,
> for increasing insn size. See the later patch doing conversions in
> the other direction, to reduce code size. Somewhat similarly ...
> 
> >> +#ifdef CONFIG_VIDEO
> >> +        lea     sym_esi(boot_vid_info), %edx
> 
> ... this LEA also cannot be expressed by a single MOV.
> 
> >> @@ -32,6 +33,39 @@ asm (
> >>  #include "../../../include/xen/kconfig.h"
> >>  #include <public/arch-x86/hvm/start_info.h>
> >>  
> >> +#ifdef CONFIG_VIDEO
> >> +# include "video.h"
> >> +
> >> +/* VESA control information */
> >> +struct __packed vesa_ctrl_info {
> >> +    uint8_t signature[4];
> >> +    uint16_t version;
> >> +    uint32_t oem_name;
> >> +    uint32_t capabilities;
> >> +    uint32_t mode_list;
> >> +    uint16_t mem_size;
> >> +    /* We don't use any further fields. */
> >> +};
> >> +
> >> +/* VESA 2.0 mode information */
> >> +struct vesa_mode_info {
> > 
> > Should we add __packed here just in case further added fields are no
> > longer naturally aligned? (AFAICT all field right now are aligned to
> > it's size so there's no need for it).
> 
> I think we should avoid __packed whenever possible.
> 
> >> +    uint16_t attrib;
> >> +    uint8_t window[14]; /* We don't use the individual fields. */
> >> +    uint16_t bytes_per_line;
> >> +    uint16_t width;
> >> +    uint16_t height;
> >> +    uint8_t cell_width;
> >> +    uint8_t cell_height;
> >> +    uint8_t nr_planes;
> >> +    uint8_t depth;
> >> +    uint8_t memory[5]; /* We don't use the individual fields. */
> >> +    struct boot_video_colors colors;
> >> +    uint8_t direct_color;
> >> +    uint32_t base;
> >> +    /* We don't use any further fields. */
> >> +};
> > 
> > Would it make sense to put those struct definitions in boot/video.h
> > like you do for boot_video_info?
> 
> Personally I prefer to expose things in headers only when multiple
> other files want to consume what is being declared/defined.
> 
> >> @@ -254,17 +291,64 @@ static multiboot_info_t *mbi2_reloc(u32
> >>              ++mod_idx;
> >>              break;
> >>  
> >> +#ifdef CONFIG_VIDEO
> >> +        case MULTIBOOT2_TAG_TYPE_VBE:
> >> +            if ( video_out )
> >> +            {
> >> +                const struct vesa_ctrl_info *ci;
> >> +                const struct vesa_mode_info *mi;
> >> +
> >> +                video = _p(video_out);
> >> +                ci = (void *)get_mb2_data(tag, vbe, vbe_control_info);
> >> +                mi = (void *)get_mb2_data(tag, vbe, vbe_mode_info);
> >> +
> >> +                if ( ci->version >= 0x0200 && (mi->attrib & 0x9b) == 0x9b )
> >> +                {
> >> +                    video->capabilities = ci->capabilities;
> >> +                    video->lfb_linelength = mi->bytes_per_line;
> >> +                    video->lfb_width = mi->width;
> >> +                    video->lfb_height = mi->height;
> >> +                    video->lfb_depth = mi->depth;
> >> +                    video->lfb_base = mi->base;
> >> +                    video->lfb_size = ci->mem_size;
> >> +                    video->colors = mi->colors;
> >> +                    video->vesa_attrib = mi->attrib;
> >> +                }
> >> +
> >> +                video->vesapm.seg = get_mb2_data(tag, vbe, vbe_interface_seg);
> >> +                video->vesapm.off = get_mb2_data(tag, vbe, vbe_interface_off);
> >> +            }
> >> +            break;
> >> +
> >> +        case MULTIBOOT2_TAG_TYPE_FRAMEBUFFER:
> >> +            if ( (get_mb2_data(tag, framebuffer, framebuffer_type) !=
> >> +                  MULTIBOOT2_FRAMEBUFFER_TYPE_RGB) )
> >> +            {
> >> +                video_out = 0;
> >> +                video = NULL;
> >> +            }
> > 
> > I'm confused, don't you need to store the information in the
> > framebuffer tag for use after relocation?
> 
> If there was a consumer - yes. Right now this tag is used only to
> invalidate the information taken from the other tag (or to suppress
> taking values from there if that other tag came later) in case the
> framebuffer type doesn't match what we support.
> 
> >> +            break;
> >> +#endif /* CONFIG_VIDEO */
> >> +
> >>          case MULTIBOOT2_TAG_TYPE_END:
> >> -            return mbi_out;
> >> +            goto end; /* Cannot "break;" here. */
> >>  
> >>          default:
> >>              break;
> >>          }
> >>  
> >> + end:
> >> +
> >> +#ifdef CONFIG_VIDEO
> >> +    if ( video )
> >> +        video->orig_video_isVGA = 0x23;
> > 
> > I see we use this elsewhere, what's the meaning of this (magic) 0x23?
> 
> This is a value Linux uses (also as a plain number without any #define
> iirc; at least it was that way when we first inherited that value).
> Short of knowing where they took it from or what meaning they associate
> with the value it would be hard for us to give this a (meaningful) name
> and hence use a #define. And hence it's equally hard to properly answer
> your question.

OK, so it's a magic value. I'm happy with the rest, so:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

