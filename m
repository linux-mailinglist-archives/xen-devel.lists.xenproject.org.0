Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D45654DEBE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 12:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350523.576892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1mWU-0004zh-Mp; Thu, 16 Jun 2022 10:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350523.576892; Thu, 16 Jun 2022 10:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1mWU-0004xf-JF; Thu, 16 Jun 2022 10:14:46 +0000
Received: by outflank-mailman (input) for mailman id 350523;
 Thu, 16 Jun 2022 10:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOxQ=WX=citrix.com=prvs=1593354c1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o1mWS-0004xZ-Md
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 10:14:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22d77eb5-ed5d-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 12:14:42 +0200 (CEST)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2022 06:14:40 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA0PR03MB5531.namprd03.prod.outlook.com (2603:10b6:806:bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 10:14:39 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 10:14:38 +0000
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
X-Inumbo-ID: 22d77eb5-ed5d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655374482;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=feQVQ2JU0N4Rv8pdmf8AXmzA7E3ChGKbkJQbuq5O0DQ=;
  b=Cj8RdGs8MBAmrR8qkq8UB+WbJN2MikZIZWcnUKi9/LqCj+cl3JAxutmv
   DBPR/udaUMZzoGX+ZdVNTfqrWl0aaTktxlfG6F5Y7MkW/+w1zImfp/k4v
   BmLEV7wjEl2f/S5bUCRIJUweGnmAE14I54XbPMvTcwHmdgZ2dY1CGlx5M
   E=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 74162023
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:W7wVIaNb5WyGTr3vrR3QlsFynXyQoLVcMsEvi/4bfWQNrUoghWYEy
 TEZWm/QOfzcZGbzeIgiaoyz/EgFuMeAmtFjGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZn29Aw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 vNP6riBWFcVOZbpkcMZaB9oInA5MvgTkFPHCSDXXc276WTjKiGp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7ENaaHPyiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/32iChKWUC8zp5o4I7zVT51gpQgYSuH8D0KuKFVfl3umuh8
 zeuE2PRR0ty2Mak4T2e6W6hnfOKlC/+WYQ6BLC+7uRtglCY2ioUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxa5UgU0XtNRF6g27V+Lw6+NuQKBXDFbF3hGdcAss9IwSXoyz
 FiVktj1BDtp9rqIVXaa8bTSpjS3UcQIEVI/ieY/ZVNty7HeTEsb13ojkv4L/HaJs+DI
IronPort-HdrOrdr: A9a23:WM7/Ga4tpFhhVeYzcQPXwVSBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcV2/hpAV7GZmXbUQSTTL2KgbGSoAEIXheOjdK1tp
 0QD5SWaueAamSS5PySiGfYLz9j+qjgzEnBv5ai854Hd3APV0gP1XYaNu7NeXcGPjWuSKBJYq
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWySw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLbhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqnzd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7k16xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklXavoJBiKprzPLd
 MeTf01vJ1tABOnhjHizyNSKeWXLzsO9kzseDlAhiSXuwIm7kyRgXFohvD3pU1wiq7Ve6M0mN
 gsDZ4Y5Y2mbvVmGZ6VV91xNvdeNAT2MGLxGVPXB2jbP4c6HF+Ig6LLwdwOlZKXkdozvdAPpK
 g=
X-IronPort-AV: E=Sophos;i="5.91,304,1647316800"; 
   d="scan'208";a="74162023"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efekLzV0Zfnd3XsTIuWxl4+Uw/jxCtz4G52ZC+Sc4wQoM9dI47dTVetFj+THAcb+wWhFSbtHkDivLxww0zilmeZTYAdH2DVG6rRbLIjUJ0IebJRkPxaY4VOzEq0AM80IPYPFM3h6uYM6aNy4SDqbD7uhUGt2xAzNjb7KmiwQHQglrOgozTJb+9Mp9Ss9RJ9fYolQxbNgrnFI9Bwcp4xVV1M22E+Q6c2wjGNHlBrP7q7YbH3CB3LIYlw2WaHIGz0VOEaFAdxR2VPJlpUAgfLEACP1HrbcRNvV1ytlbVraaJcaTLzkJlMinUBeN05/rIlslt47vjFG63KhHjN8fGcrrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHsPe542jizFaxb9+LIfW92OlsCpT4cYQD8aEMb8+3A=;
 b=jM9ucqa74fp4V3tcE11AFcNFCVIuHPylK/P/5AoCKipWNMgPoQfFJcqLpzOdgj5SOXr+ta+XnKyHQc1ZIJMz9MqciCl9yeQMqXVmQmGvYNux2MbDw/jRxY5JwvQBGWQ9w1ETbPqy655YjJdNzS/0q2jPb9UB6G2WDNxDf4kF3a/khkS7GTsGLLQW2lvet8DwTQ93jtwarQwEo08NbYqFYRlNT4gUEKqStU3nLrBvX8dLLj6J2FHhtYVI+Y5kAHe1UDwnPhxYux1NO1SK37Jas0Bm8AvfWqD3dGVhrV40T/pxZTLjhgcmr8pRiYdS7LYu47Q8QCpy1alLkkhugFHn1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHsPe542jizFaxb9+LIfW92OlsCpT4cYQD8aEMb8+3A=;
 b=UVlRLc71pnz0sI376HiEjuROydTC+1eU+6ibaMe1WAd1QeVlFYXQjoHrueC30w2Xp04uuMxq4io8Kt8RhCs0EGGilaettDQvHPWfnkbbQeqEbsMI5AD4L5NoJzwDpD5wnqYJl4XZ5RsfQA8onn8zh7llGlSW6ypY6Srz6ifAcao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Jun 2022 12:14:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable test] 171181: regressions - FAIL
Message-ID: <YqsCi4r1IYYl4e+x@Air-de-Roger>
References: <osstest-171181-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <osstest-171181-mainreport@xen.org>
X-ClientProxiedBy: LO2P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: caa4daea-e764-4ec7-89a0-08da4f810571
X-MS-TrafficTypeDiagnostic: SA0PR03MB5531:EE_
X-Microsoft-Antispam-PRVS:
	<SA0PR03MB5531D979544BF12D96215D568FAC9@SA0PR03MB5531.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ht312BLpTTIgwBCu81pgq21gs/M80iDtdsuk6P3SyZ/tL+ZFdAqEVV+A0JzIWKYNxGGf1fUvh8V5ruIRoggyWc+QU56RgpuZh9uElbHhW33QrCKexSZ5/tq1a9CIxQ8JYj9qW7rg3MYycSpozD6dGLlrdB6AaiwI884nf/YQHhqXV/RHzVyjECivCXIGCnnVO/Xwgrb1lULlm1YWHaUP401Zmvwb6pwryLjTnNBfBIjkFVBuvNX20T8l+Q16+vcRD87ohjfJya2+nSMDMybJyWOWPZ26A9c03ohvaxekckBYQ+97DQ47pUusIpt13iCwJKR92STuPYw/c1gdmJm/xNQ3ykLsQsSckmmYrsCk0ZU3YuG5jENfzTjYu2RH18nLD7BbBswWG3jexgzP8EOCx7wCkzDT1v+Mq3/g8NI8Rh3ZANkQdObbHhB4OxYDkQ44YsMzOraiSGhWdh9SYQlv8lzD3O3IoFJT9xd6Fp6MmhLvBRCUoL5QIwosqX11aIMTA851SXtK0WmJHzT3nAvWrrK7Ye6cEoqjZ07RgHrBiNGHy+LNGiVa+bZvoMJUEY0Dq2aiPMP0ZaaRZVnyNBFg5NoOI48BDj5C4YbUUE21q6qszhmGa8jQsWBVh80/sThAElrg0wnqgc9FlQf+iqAA9m58sypLplkSpLRIKQDPd7i6Fg4wirtntwBcczB3FX1CQnY2yzni7j4BNtKwFOfv8WIM3VWnnb8x/Zy8pJpFR2+wHfrH3u6nsFH3cq9HBBsuI/4vhifbG1dBVAXFklTukqLZtc3bj2ib2uvqNo2VdRCKEPGwZZqe9PYUt4JrKgVOVrX2p/tidjkBCnIK2Io/xg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(366004)(6916009)(9686003)(6666004)(86362001)(6506007)(316002)(26005)(6512007)(966005)(6486002)(33716001)(186003)(498600001)(5660300002)(85182001)(38100700002)(8936002)(66556008)(2906002)(82960400001)(4744005)(66476007)(4326008)(8676002)(66946007)(83380400001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTFPOWlXaXBNMUdxUkFyUU4vUTJqWTV0MlVnYkFNcndsUVAzbTh5V1NYc3Zo?=
 =?utf-8?B?aHAzYm5jY0ZFQW41b2xVOGZtN00vNVVSS3dPYjJMaHhVVm9yNXFnWmdlTmla?=
 =?utf-8?B?a0RiRE9OM2ZZR2ptMXZwZDZOazl2eXlGVUJMM0FEa0tVNE1UaHMyME9Cai9Y?=
 =?utf-8?B?U055cmp0Y3pWdzVjU3pWWXRZL3E0WjNGYmVJYXI5VzVUZ25yTk1CbUk3TmRR?=
 =?utf-8?B?YXBmRXhhUVVndWtta1hNdWtMWmE1bm1TZWpoUjhVbmQ3YlZQMVhMTjJ3Nmxx?=
 =?utf-8?B?UFZmM2NTRmttS0JEWWM4RHgvWG1ob2hHanIzeEdjNzkwU3hZQkhzZzVybGZ1?=
 =?utf-8?B?bFo1QVZvR2tONHh5MmY4aU13T3BkS0NQc0hxVk1jblpOU2YwVHZhQVpDMkhJ?=
 =?utf-8?B?MWo1WW5CQmdPdG5vVjNCdlFJamw3bzROckdnT0I3YUpSR2VwcWRtaVQ0N1k3?=
 =?utf-8?B?ZEpCYjdDTzVEY2tlcXlWV2NiYnh2blJPWmJJUlV1NTBRc3gvTTFWN1JGdzRr?=
 =?utf-8?B?YS9zOFhGL29sYjdiRFlIUUhqelcvejNkYkVYbTJEQkcxeEg2S1NYYXFoSnA4?=
 =?utf-8?B?K2x5L1Q3V3ZUeFdkeHFqQStxeHM2K2hBMjc3NUlLNjMwM1EwOGNvdjJoZmpG?=
 =?utf-8?B?cFV1SWU2dVRFOVZadWlRYmNsQU5ic3E4QWZubzQ3VVBYMEtRU08rYTJSM1Z1?=
 =?utf-8?B?VDllMVZGbnlvRGZQQlVkVHRXckNGMDlHaU5DWUZhRlhBWWkvV2lhY2dzWWVJ?=
 =?utf-8?B?V3RNUmZ0VGdaODhMUTJ0ZUdiZzhtd3Vta2hHZ0psc0h4cFBkUXRuY2k3UnhP?=
 =?utf-8?B?Vy8yTWhnRHp6bVBxR1lGaDlCdTdleUpRNVZpdFpKU2Q2dEJ0K21zUjV6ZWls?=
 =?utf-8?B?SU1Hb3pwMVdUaytzaTR4RzBZaEF5WUxBTkpnN3JQbENZMTdWV2hMQSt2QVps?=
 =?utf-8?B?U1dpRXc3bFZpSDhCT0ozTEt0WlJrZmovWkRkMUEyRmtXOWY4R1RwOHpEaE1k?=
 =?utf-8?B?SDNrZG95TjNaZVVwVVpYMWpVZzhSR0VMTEY0Yno2WHVjVTFmTW9manRMcEps?=
 =?utf-8?B?cGRoeVBvYXJuRkR4cWZTci90NUprUlNvSFhyMVVPQm9kQ3YrSnFoMDB3SWIw?=
 =?utf-8?B?YTJvM004QXRMVGlucEkxMndNUHpQSUk1VWJMNStTNktDQWxrYXE2cmZjOUR5?=
 =?utf-8?B?ZGM3MTg1c1h2SG1tempVTmNxbktOb1Z3WmJVcUNPeHUwa2d5SWFuTXUwTTVr?=
 =?utf-8?B?ZXFTK3h6dzQwOGg2TW9PZ2kzd0ZuMDV6V0x3b28rdnNyWC9FV05WQXl3N3kr?=
 =?utf-8?B?djBNdWZheTRiNWZQR2o1NTRUeU9UcXFYMGlvdWkrT0pNakNkbDd4RzNsZ1Mz?=
 =?utf-8?B?clBITVZqRThQRklvcTFWeFRwbENWRlNpNWN3Y0gyRnFPSXpyeCtPbkdpVzk3?=
 =?utf-8?B?UkVMNnlqOFM0L3o5RW5sUHFuR0RnRW54SE1KTVhtVk1QU0kzNFJ1UGdWYnJs?=
 =?utf-8?B?a3BCWmlyemVGak5VdW9makJRcnJCbGlZbU9DbEZHQkFkL2lVWlVXSS9mSHBz?=
 =?utf-8?B?bjU5bXZDbUZnYWJUKzBheURLZWNNTjJRQW56dmdyWTlLd0ZNdzMzT1NmZ1h5?=
 =?utf-8?B?VjZJYWo0L293SW1YN2FPaEprWUprcFVSUURnaWlvUURRZjRwVG9RN3lkREdV?=
 =?utf-8?B?RXlkS08wWVgvSEc1Z01WN0xwN0hMdjcyTUdpVENVRXR1eGlJblNtT3MrTENq?=
 =?utf-8?B?NGtuUWNHU0VtY1hiK1JpYjhGMm9YUkJBYWxoQnd1QlB5eXd5dnBHSDFPc01l?=
 =?utf-8?B?VEpyaCs0MkJXaGRVc1B3Q2RuQVZFK0h4Rkt4cDlLWm5xT1ZoMjFLdEFTK2hi?=
 =?utf-8?B?cjRCRkpTOGdCMDMreFJXMHJmQitwZStqN1c3RGE3SXp6dnh5dVdLcmtyaVhw?=
 =?utf-8?B?cFVJaXVMUmFFbkdWOXAzZk5kRnR6QlVMdnQ5OURKOHh2R1laazA4WHg4MG9u?=
 =?utf-8?B?dVlYc1FqZG5BUEJlR3M3dlpWTmw3ZmRRR0JwQm9oVVQ4UEM4MzZxT3k5Z1Qy?=
 =?utf-8?B?RnVFZGhpRENzL1JzU1J3R0JqalRWL0c2U2FkbDFxcW5STUxsSGVxY0VwK0Zy?=
 =?utf-8?B?SGRKYkJjMjRzdVN0cUJaT3BlYTNWam5nZGVieTJ0UkpCVEJKQXBGczNveXRr?=
 =?utf-8?B?OW5hMkVuZmdoWGlYSkRUWHdaemRQenNGajAxUDhJR1NMc09YdWt5WjlrM1J1?=
 =?utf-8?B?MVhDZFIzVzlhWEdhaE5JSmxmZnRFVTVud0E3aEgwRThyOGJ2bm82ZnlZeUJI?=
 =?utf-8?B?eVJpbVkrREg4TjcvQmVmaUFONTUvT2pHb2FRQU5yb0p2RVlVRGU4SU5SRVVK?=
 =?utf-8?Q?MxoB/ACctjQueg68=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa4daea-e764-4ec7-89a0-08da4f810571
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 10:14:38.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SftbLdwtv1XYD6d/kZQb8cxQOZgb5HBx5hIJvlQD3GhkyIp5/Wcz+UZjDHRmdlpwFy8OmEaniMh2tlyAqhvb4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5531

On Thu, Jun 16, 2022 at 02:34:00AM +0000, osstest service owner wrote:
> flight 171181 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/171181/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64                   6 xen-build                fail REGR. vs. 171174
>  build-i386                    6 xen-build                fail REGR. vs. 171174

Seems like the issues with xenbits being overloaded has caused those
builds to fail:

fatal: remote error: git-cache-proxy: git remote died with error exit code 1 // Fetching origin // fatal: unable to access 'http://xenbits.xen.org/git-http/ovmf.git/': Failed to connect to xenbits.xen.org port 80: Connection timed out // error: Could not fetch origin

I expect next run will be fine.

Thanks, Roger.

