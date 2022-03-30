Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6226C4ECA40
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 19:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296448.504604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZbkS-0001bQ-Ah; Wed, 30 Mar 2022 17:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296448.504604; Wed, 30 Mar 2022 17:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZbkS-0001ZP-7N; Wed, 30 Mar 2022 17:04:44 +0000
Received: by outflank-mailman (input) for mailman id 296448;
 Wed, 30 Mar 2022 17:04:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQ0c=UJ=citrix.com=prvs=08136f46d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZbkQ-0001ZJ-Lj
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 17:04:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bb4913b-b04b-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 19:04:40 +0200 (CEST)
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
X-Inumbo-ID: 7bb4913b-b04b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648659880;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=d5nMH9wHJqscDVIysi+6xD/UIKv/mGHeGqIeUbf1xgs=;
  b=E/71JhV0Bn3N208iLE4wWrZSP7xEZu04NrDCoGoujpnk0djALG4YAY2c
   sYErvnkk6BmNFWnjN/KiNGKd2vZOUuV1y5ONOYSc/TUinlU0d9yEOlghn
   fDFGYG3Uk26wPkd+l5W6HZXMLSsJ4Bm2YExIVQUh0wfazSVbch6JcT+mB
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67012652
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CX9HN6P2mlUTaxvvrR2bl8FynXyQoLVcMsEvi/4bfWQNrUp2gzNUn
 DcfDziEaauCMzSkKNx1b4S0/B5SuJfXmtc3GQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2dYw3bBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 5J3ksyBFR4QOrzFs9leU0UILAsiMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmho35oQQKy2i
 8wxMTp0MD2QOw9zGnhHGLUUzeaEmUjxSmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Uo
 W/M8mDRCxQTJtuZjzaImlqvgenVlC+9R4MWF5W/7PdhhFDVzWsWYDUUX1ampfiyimalRslSb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbizt1HUBdEGQHMoZ/8pZrG3p6j
 Tdlgu8FGxQw94eyGUPB746QvDqZBGsVcT89T3MLGF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 w1mvBTSlJ1I05dVivzTEUTvxmv1+8OXFlJdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBuq7t3N702wcH83wdG9KFoSTLkWd4umwWGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq5Bq2ENIMUOsIpKGdrGR2Cg2bKhQgBd2B2zMkC1
 WqzK57wXR7294w5pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29Et843K+1Rrlhtsus+VyNm
 /4Gbpfi40gPAYXWP3iMmaZOfA9iEJTOLc2vwyChXrXYeVQO9aBII6K5/I7NjKQ4xvwMzb2Zp
 yvVt40x4AOXuEAr4D6iMxhLQLjuQYx+vTQ8OyktNkyvwH8tfcCk66J3Snf9VeZPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:rabi2aphhE/uqn6l2TORaZAaV5vHL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAe0+4TMHf8LqQZfngjOXJvf6
 Dsmvav6gDQMEg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iosKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCulqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0BjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXd
 WGNPusqsq+TGnqLkww5gJUsZyRtzUIb127q3E5y4OoO2M8pgE786MarPZv60vouqhNCaWs3N
 60QpiApIs+P/P+UpgNd9vpYfHHfVAlEii8Rl57HzzcZdM60jT22tvK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,223,1643691600"; 
   d="scan'208";a="67012652"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsotklWcX/Tb8UtMzwYOpEz9m4eYF2CkB8537nr7BNg06xpGWAbMwtTWirG/nIlixUqOGXFmrtQQ4uM5Kp7R5Mq8yhBQYhogaAInuZBMKLVXAU26WmqaVABFxyZVVHcv755CeYXQrFPBZi7klqETzQVyeef0BEkht/aJME27Tf4sSkhfxSEr7nOcqtOmGLtall+lfi/ttwlJen3EKzt4vYKGDdWECPnGsnymPwGOJqaE/WII9SueUA6fwRkgdRdPK9R2SBRCxlF0txkwDoxl2Z+ctXJK0SPRd7tz5qwDbd2B7HW7whVO5EX9EEyHLYUtCPlpvsNsdvD+IriIA6RVlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjtcuDj2cXDN06yUqLIzdyypTFAjFHr+RxlqXMdHt8c=;
 b=R1PfB0ClsBnEKqn/d442qBtZk0zdG3tgLxJ20jSwCIhArfXufzDAyL7l8EYimt6yy9PFD8tc5qrGXl380XT87qRwRW3lROxNOmzDDhLM0TCN7jolLJdt8nVvxIXrevl/STu7ODaQ4fXHvpO7KsKYgGiJPE19KghlMGmqxprmH8u35f6oed8mEYs6+r/yKbW9njn52+3dtsQ07TWV1HbW6lwa/kIrZ71DDqfTxG0osn3W9V38tIhF0qJEZ/DDw7ctSnFvk3z0Lv89s3ylMg6lS3jEH4IInqsqEUHTPeEFpG3m2rsSpDSDURFauxf4+1k5VUzVzqeBGayC6ps2Gnb5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjtcuDj2cXDN06yUqLIzdyypTFAjFHr+RxlqXMdHt8c=;
 b=e0573doUdV1VDgo+YNmujC+Hl3v8jodlPOQhTX8Wo4ZHGi1j8Znn5Os+bu79OS6s10cN6gg0pBS7jRe5VVdGUco3MDH9CCraXmFWsjPCXRXZh+DTBCIHJVjw+OpWfdvS3cRy1ZbzCqgvCgxPl2YJe/AdXwPwmgdv3teig9E758M=
Date: Wed, 30 Mar 2022 19:04:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Bjoern
 Doebel <doebel@amazon.de>
Subject: Re: [PATCH v2] livepatch: account for patch offset when applying NOP
 patch
Message-ID: <YkSNm0mb47Vc6nGr@Air-de-Roger>
References: <772f0afc-64db-6b98-af49-bd970ac78cbb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <772f0afc-64db-6b98-af49-bd970ac78cbb@suse.com>
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 793ee85d-efe3-4550-19ae-08da126f5d2e
X-MS-TrafficTypeDiagnostic: BN6PR03MB2977:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2977B1D7E91E88CDA0398C208F1F9@BN6PR03MB2977.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dl7h+l984JhP7xCQJ7AtAn99jqh7RluT4AjlXKc6vkOigFtaq6xMetIBuHQBOSvHQujgZvewSdXUQQIuUkOXuG7mDRaHZticejiKTVE4vrO1RnvD7xvvNUR7ard4+e4myvmj9l/EndisRe16biHuMZEMm/ye5NHi15xcZlzAlLZLJfMJu8MZ2KjNqwO8zbtefeylgxoFixZcjX/idfE446aX9qH0UQq/AUh0HbH6cVZNXottBENMvdns31Xy+9F23a2SseEk+nZJJRJAznQxibY6uGPRBAX3paFyjlQfhONEuGAKZPyN0nBo19OugjGK7MIgjKBrTISfi4PFMCq4Dm5+sxhGzIKzVE5Q1gBb8y4v9GQXFXKYUU9FyFiyonlciKs+2YTg5WJBLnlPIvuCpXdNbmtNXrXaFi9XfBd2tJavgTEzLaAwGh/xQ8f2ZbLxWqxZP8pfLFcN/sO16O8RlItOcA8RBwdBih1n31StaqHJOBfnvnJ16/HtmxufpFWUakOkdyFWhe6ZyfZmxpOWL4wVvuZttyAhwJQNLeNaOc9lgaj6iQ7bjCvHOoQYG9+ct4M3PDHqV5zbrenq/3LAKDXUlSdHHkHPDDprNrNu0pVrACR16d8Jqf3CDDN/j+dqaZEWHdWgTFsKkDo7PUYWpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(85182001)(6666004)(82960400001)(86362001)(66556008)(33716001)(2906002)(15650500001)(9686003)(6512007)(316002)(508600001)(186003)(8936002)(5660300002)(54906003)(83380400001)(6506007)(38100700002)(6486002)(8676002)(6916009)(4326008)(26005)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJNMFAwTkNrbSs5ajI1bDNrQUVFWmNKdUN4cFZXMnhJemhPK3kwUDBseGxm?=
 =?utf-8?B?d3Rra1VIWndsOGZkUC9BT0N1LzV5R3ZDNUpsa2ZEMUI2V056RTI2UFhsUDhv?=
 =?utf-8?B?cThGRU9ybEtnYkw5MGZzYVJqWnM3UStQczNwdEw1YUQ2eUFkYlZnZmFhYkx2?=
 =?utf-8?B?cllEVzUxSHdwMlZXN2xrV0t3SU1EQkVFdlM5ZWI1M1BobnZGdTNDYlhmZVRN?=
 =?utf-8?B?Y1NDVTRoc3lwZTVNa2pOalRUajBMdGU2UzhRUnVZQ21ISXNPZm9HNVNVS0cr?=
 =?utf-8?B?SUZaQythdmVYMVVOUU5UU3dmTmNhOXU0ZGhlQVI5K2NlTE9ZUm5Fa0lsWmNy?=
 =?utf-8?B?V25lM2JPWWtwbi9JK2hQZSt2SnI2OFhXYVRjTGVlUlFyNWtrdzk0a0pUOWJR?=
 =?utf-8?B?K1grTkU2cTE0K0RlWC9DZjBWSHpSaWJLSStQOW9DaUxQdlB2V2x1TFBLZDFs?=
 =?utf-8?B?UFdwZ3VzN1NGSHloMXdIYm1WN1JWaXE5VUl1RDJDQkpSd09CbXpTa0MxMGlP?=
 =?utf-8?B?bm1Sb1pqZXNYTnRTbWpyZDljeTI5Wk5tTXAzRDE0NXB4OGNmSFpGSDBuMS9u?=
 =?utf-8?B?b1E0aUlUWFBhblNISng4cmtMVmg3TnZkaEwrVDFudFcrenZYZjdnL3liTHB1?=
 =?utf-8?B?SkU2MkVUdFhGRVR6UU5MQUFSaVNlS3dvMjVERHRIdEkwQ0owY0haVlEybVRI?=
 =?utf-8?B?V0srMDVaWHEveTRnWjdtNzJVWlhyTWVGTXYzL3c3a1hPUU9Kc1hWWHhldmMz?=
 =?utf-8?B?cTc2OWcvdUwwOUo5TzBTdmtsa3ZhVERVTGRBc0V0b1ZQeXg4WFFucmdmTnA5?=
 =?utf-8?B?UVdsYVpPVHFTbkVUZWZPb0ZRRGV5MGpTend4cUQ1MUFOclZ1ZlpHYWtNZWll?=
 =?utf-8?B?cWd6azBtWTd1eTArVXMxSVlBZzFiaGRUOFNDbk1rMGZzNjl1SXJNSU0rcHhV?=
 =?utf-8?B?anhmWHFNVU16S3NZL1o2THQ0QVU3aVRiNm1UNU1mSkhabzZ5V2oxYTQrVGFL?=
 =?utf-8?B?UUV0NkdUaXdBcURnVWU0VUZxcVR2MFJTVjlsU0pUUzZDdnYwOHFNVE1Fdlpu?=
 =?utf-8?B?dlJ3NjJ5OXlZZ3N2MmtYc0FOb3dQY0VFUS9qVkFHVmJBRmx6V0taZEhlRFFH?=
 =?utf-8?B?MHBZekg5MXN5c0pMSjFzV2JUYit2TlV0TkREUjNYeEErOWk2SkZSSThuQ1oy?=
 =?utf-8?B?QzRPUGdBL3FvNUc1QXplaW5FNDRlOU1lSnZSN09JNzdsTHEvQ241NlFxZ3VH?=
 =?utf-8?B?anVpdDl2WVM4dGFFQ3pZSEtpRU94RVQ0c05tci9ReDZuNnZ4VCszSmJIbVMy?=
 =?utf-8?B?RmEyZ3Q4aStOTGUxaG82R2tXdkNWeWtpRE5YRzVZK05GWGRKVVQrNEdvM3Iy?=
 =?utf-8?B?bGpha2FUWFFFWTE3dS8wbEJDSXBTZjdrV2hOTkEvUEFQUXhObGJISDJrZjBt?=
 =?utf-8?B?L2RxbVIrb3VlR2x2THczRlAwN3ZGaGkrZnFzTGxDOVBoMmo2aXIycnFRRmx0?=
 =?utf-8?B?WlVFL21IU1ZRam0wSHJiZ1YyVVVJYW9FZFl6aU9oeE9Bdld1bE1nazcxT0dG?=
 =?utf-8?B?N2l4RjVKaUt5ekhmMktyLzZndWVoRzZtNXFnUVlmdE5wdTRML29ERVJCOWxk?=
 =?utf-8?B?TE9lMUhNbXIzR21ROS9KUXlValdqQ09FenZWMFlrdExxMFNIZ3U3dkVLa3R3?=
 =?utf-8?B?akw3YmNha2hPUE9CeUg2MmR3a282Wm5rZVFWL1ZGVGtLakUzWEtpQWdzUWhk?=
 =?utf-8?B?U1dnMWNIcTlTR0QrMUFmdFpkSEpJcVY0Y1JSNXlLUGxnV2p6SEVDay8zcE5k?=
 =?utf-8?B?eG91YXNUR05WMFNuZ1ROSUxXSHI4OFh2QksvcGhTMlBzOWthMStEUXJLcnlL?=
 =?utf-8?B?K0JwRklLM3I2VWdZWjFxQVo3MUtIdlFqTHRDNmZVMmpxR0w3MEdCY2pzWmc4?=
 =?utf-8?B?bUExeUxucHNTYlREaGxDem1YQWhhSndDMlJuMmtPU25ZcjdKT05wSVIrdWYr?=
 =?utf-8?B?T0JQWHlRUG14NzliQUFQVFdFSG83WlZrZ0VSbmt4YkNEcVBUaDRTN1JmWmdj?=
 =?utf-8?B?MEY1NkdtN1ZZaFZXNjNvTzkrWkU3Mi9OZHNIYVhRQTY2bUhqK3BxUFB3OHFM?=
 =?utf-8?B?YW5aSHhlZ2xmYVdsaG9sZUlNUHFzZW5wVGdRTW5SaTVZMUtFc3dwV21GVzdW?=
 =?utf-8?B?R1ZNMnVXTjRrYTBEYzJYYVRwUjhDUTlSVDAxaVlMMlo2UGRPSllWbmlpZGxU?=
 =?utf-8?B?RzlROW50S2czUVk2azhRc1dROWxxT2IvSnFrZDMvVVlXN2loOTE3QnJ4YlVQ?=
 =?utf-8?B?VE0yNFhQRjdXSTJadVEwcTJ2QzZqK3ZnK0d5QU9oNEl0NWd3ekIxb3piZHZ4?=
 =?utf-8?Q?GbggLnacEYyjGWTg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 793ee85d-efe3-4550-19ae-08da126f5d2e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 17:04:34.2661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YjFRd+2JoUfe4SHIBhBspvCWygCCmMaLN4/Hiezt0mS3BGoAiSHJcC8git6OzQTRhmAWbGUN4mb/3BSdxcgBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2977
X-OriginatorOrg: citrix.com

On Wed, Mar 30, 2022 at 01:05:31PM +0200, Jan Beulich wrote:
> While not triggered by the trivial xen_nop in-tree patch on
> staging/master, that patch exposes a problem on the stable trees, where
> all functions have ENDBR inserted. When NOP-ing out a range, we need to
> account for this. Handle this right in livepatch_insn_len().
> 
> This requires livepatch_insn_len() to be called _after_ ->patch_offset
> was set. Note however that the earlier call cannot be deleted. In fact
> its result should have been used to guard the is_endbr64() /
> is_endbr64_poison() invocations - add the missing check now. While
> making that adjustment, also use the local variable "old_ptr"
> consistently.
> 
> Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced functions")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Re-issue livepatch_insn_len(). Fix buffer overrun.
> ---
> Only build tested, as I don't have a live patching environment available.
> 
> For Arm this assumes that the patch_offset field starts out as zero; I
> think we can make such an assumption, yet otoh on x86 explicit
> initialization was added by the cited commit.
> 
> Note that the other use of is_endbr64() / is_endbr64_poison() in
> arch_livepatch_verify_func() would need the extra check only for
> cosmetic reasons, because ARCH_PATCH_INSN_SIZE > ENDBR64_LEN (5 > 4).
> Hence I'm not altering the code there.
> 
> --- a/xen/arch/x86/livepatch.c
> +++ b/xen/arch/x86/livepatch.c
> @@ -157,9 +157,15 @@ void noinline arch_livepatch_apply(struc
>       * loaded hotpatch (to avoid racing against other fixups adding/removing
>       * ENDBR64 or similar instructions).
>       */
> -    if ( is_endbr64(old_ptr) || is_endbr64_poison(func->old_addr) )
> +    if ( len >= ENDBR64_LEN &&

Sorry, didn't realize before, but shouldn't this check be using
old_size instead of len (which is based on new_size)?

Thanks, Roger.

