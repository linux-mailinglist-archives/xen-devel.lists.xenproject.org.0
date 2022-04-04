Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F17C4F15CC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 15:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298340.508199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbMf3-00064A-6H; Mon, 04 Apr 2022 13:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298340.508199; Mon, 04 Apr 2022 13:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbMf3-000610-2F; Mon, 04 Apr 2022 13:22:25 +0000
Received: by outflank-mailman (input) for mailman id 298340;
 Mon, 04 Apr 2022 13:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjy=UO=citrix.com=prvs=08688decb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbMf1-00060u-FI
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 13:22:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 415c60d3-b41a-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 15:22:22 +0200 (CEST)
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
X-Inumbo-ID: 415c60d3-b41a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649078541;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=QRbAPhnk4HVM8z+yUKxlHxgZZZ3PdMpbuZzASV2rNts=;
  b=bparVBCm8tvHg6Ao4i1g+C6xRVWWuzis7TLrnNkQNFYJlWx8pKpyqj47
   74P7tDTZVMaaNXPeFf8jkOgtziZLVecK+W9TrM7mKa4ipwr/Pu9itiQtJ
   +IMk7GkXVxJemQcSZ1e+RhzV9GKPWV/MWtHR6S+u03GPDZ8OSgDMH6lbm
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67370518
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xMumFKgvvgW1lSI8Yzbec97hX161dxAKZh0ujC45NGQN5FlHY01je
 htvXT3SbvnZYGfwKNogO4i38x5XscXRzYVnQAtprCpmEywb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1vR4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTw3EaTGmMIlaRoCHXB6eoBDwb3JO3fq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiBP
 JVBNGM/BPjGSxhWPEoGT5tjpum5uFT7UTlJpmio5oNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4KPMV4QuN7JLu4FyXV2xDYzt4atI8u5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoetcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HzgbQ4xawZRGp8crVnl
 CJZ8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBYxaJ5YJGOyP
 BO7VeZtCHl7ZibCgUhfOdzZNijX5fK4SYSNug78MLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOXKIodZKfQlVdRDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:EM35fKN8hgIuAsBcTy/155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80lKQFm7X5WI3CYOCIghrMEGgP1/qH/9SkIVyDygc/79
 YQT0EdMqyJMbESt6+Ti2PUYrVQouVvsprY/ts2p00dMz2CAJsQljuRZDzrdXGfE2J9dOUE/d
 enl4J6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr10jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKva/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdY11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj8lLYIk7zI9HakGOup5Dt
 T/Q9RVfY51P70rhIJGdZE8qJiMeyXwqSylChPmHb2gLtBCB07w
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="67370518"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiqWDIPDp/bDlZu8I2uZD7bdcvlwuSmJJyxOqeWtH9JwQGfr0IpmY/8I7YK7+VVsrkL5E5sWNyKdeiqWLd3W0mDHE0jcmMRnF4f0Aa5rvkBTEZlzNlnMloEUvvoQPh7APY859d2Yy0/xx/75DU+4S+g4zHauPbuQcpgWx4gR1kZuk6mWuOzhAE50UFdBhQ4o+FIQH4YLdbPXZx25Rp1qvK3ONdDuQMJBbD06I7mJW/Lh4yWkWo2941wfDSzLTJswGTE2ZvIJamY5dn5+p8Q1FfBdP/w5EP1p2jPE5ho5bFsfoC0DdAA7JzH2qmKlWMuGOUQ2xhZBunwAgLYZ3dsuaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dM5NPhdrVPEHQ1C0IQMR/V+vTg+RJY68DtxFMMsm7ts=;
 b=f1Wfu5PB+kfup3uZLj5T4AQvJjLNY6zwsa49NvN/nc0SoTkK5TVQ+UUYTLssH4yNKZ9a8Tlk8Bebxjtc1BzZpJRwOAfaZ4E7XGwYZUDtkLTdKn7a9erejy6nsVHLPJGF96FlvotYxtGuAqgBszirn+F30DSb5LQK8oon/dQHlI4w/ehs/ydAmdPyVlpmkc8byFL0/WyvMuGG8gKtw3TJA53dpy3uhi54zCEEHXqn28nI8d5DQ8SXR7k6PbduzK65pUwLKzFFAnrgsa5zqezBPgJgLW2c0g9tHTcXIoJ7hjIIMi9eJ/zZf7jSIPR+Rgn2uR7yOUYiJ0BqGndzbXzPRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dM5NPhdrVPEHQ1C0IQMR/V+vTg+RJY68DtxFMMsm7ts=;
 b=s10z6dHCuJfQqDI2jGXDooD4QzMwp4bnRTK4SpZpHdPwsQWFAexl9LdUnGwVOWXXVmxdN/7JDNx5hYo4ntz527nGc1IvJD9XSEi/8Mkwr1JrT8NVXDRkREjh8PhhVAPb0ZWdaHFCOLPoETFLFT3GTo1kldYJ3Gs7Bp6/M5KJuNo=
Date: Mon, 4 Apr 2022 15:22:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 4/4] x86/time: use fake read_tsc()
Message-ID: <YkrxAX7X1sxVf15r@Air-de-Roger>
References: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
 <bddbec0e-acc2-03f9-fe4c-167fa5ac0ea1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bddbec0e-acc2-03f9-fe4c-167fa5ac0ea1@suse.com>
X-ClientProxiedBy: PR0P264CA0243.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::15)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fb85b11-333f-4e45-86b0-08da163e22fc
X-MS-TrafficTypeDiagnostic: CH0PR03MB6067:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB606726E4B01C200DD295CB438FE59@CH0PR03MB6067.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TnwdULF1jZef/S8ERr3w3JVMLMm7QnoYpY45fSP7CBiYLN+YP8yPvRFpJ2KesLvMGreWNtSJg6iySbMIg13oSCRRJ3Lw1q8IjFb1ZzPTXCexYuiVPowB5HXy06+407pXyKfxDuod69fSTs+vAC6c8cw2KW60QLL66jKZHcerqqC50TOKH20W8ULeGJhLX2owXl6CUx1s3Eie3fAQyS0BvqiyFj0TTRK61LrINtg9gLIUnABeR/KUsWMpx5JP1URCP4Fwqzwr+xt17a6fexOuSUPbsJAMy9+nPmYGSbmRGXeUJoesvnzxt9wR9CLkEjL/1NztBxPgbOVRvSw1/+S+OCCKlAvKWc3+9o91jqajW1Es40tny8ixcpWFQql5QWjfMhm6hNzlI/CXRgRym981DSu/r7cFUI5LELqP2l5aYZI2ACEYVELZckcXtdkk6pDNjENMMsqi4oqDKWpDKMopZkjfKgfkoaLITVRpbDkwxuDVhsBSlddCQfaNTfNEu1kwp6wLs6gibX4mlNEQit2UXAsi5mNxSomU4RYiVw1oMnixERAyiKD7x2PRhXeqI9LHEwBaF2Nu60eTWpq1dX/cFjZUI5S+V19tCV8Ms7YuQ9xd2cJ1bs0USTYnLcyJseN7B01m81s+pJyUeP0w4nLj/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6486002)(508600001)(82960400001)(86362001)(4326008)(6916009)(316002)(66556008)(66946007)(8676002)(2906002)(54906003)(66476007)(38100700002)(5660300002)(8936002)(83380400001)(33716001)(186003)(26005)(85182001)(6512007)(6506007)(6666004)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzVmZFFYd0dYaTlQQzRmTUFUTGtCSDk2Q0pUTGp0Ui9kMXNoa0c3Q05JQlpZ?=
 =?utf-8?B?aVJ1SC9US1lUbjdvSXkzZWdveE5QSWNMUGM2cThVVGl3MXhmZVRqV2pERXl5?=
 =?utf-8?B?czZuaTl4ajB6Q09INnMvNzlYOGt2aE1pcnhBVUR6dFRISzM0UkZtNXROUVdo?=
 =?utf-8?B?NmIzOFVBeU1HcGY3TUdVYnJMcTJOakhsMG9aMjhWanRsb3EvYVFuKzJxWTRi?=
 =?utf-8?B?QWhxREJqTmxDYmxoczJpd1RyT2gyV3JwMkw3NEpvWlFveUZTekJvUEUyV1Zo?=
 =?utf-8?B?WG9zeHlCTzBMQmM4RUhrUnhCalVrMUlXV3dyTTRsSHZ3UEJOb3FTaFpST1hq?=
 =?utf-8?B?RWpnN3RyMHFVQ3JIUG5BWmdlK0ZGMzZWOUxjSkpEQno0c0tMbW1yeTFvQ2Vi?=
 =?utf-8?B?VitySW9RZ0ZrdFBWTjF6THRJYklhLy8xLzlRSVNpN0xaT0VtTEs4U29DYTBh?=
 =?utf-8?B?OGtkZjBTWm9Zd1ZmNFY3YnVESjRTRCtjNkxIQ2RKVnRsamNWN1hSWHhsRDlk?=
 =?utf-8?B?UDdzV3NTZnZGNVA2cDZoSEVBdlhmSkNjb3BmMWZmYWpPS0ZrdTlkWE5vNSty?=
 =?utf-8?B?Mlp2VUpoL1RueGxHazFCeFUwY2UvZFY4RGFadFRPTzJWa3R1ajByODAwUERw?=
 =?utf-8?B?QkJMNVhjMFVlV0t0QTdZK0pSMjNNNFlnQ1YzbEhxM0ZGRmhuUWkxdW9pMkFs?=
 =?utf-8?B?cXg3cmN4dUF3d24yekxnZHJTU0gweUxWTnJRVWwzK3RzZGtwL1owdDhVOVpC?=
 =?utf-8?B?WHBGNTlLdUxCMWNab1FhVFp1NjdadURhR2ZySzA1NHFMbGYzcks5RGZRenZY?=
 =?utf-8?B?ZHhvV1JWTTNUS2hvU3BrbEhCbkd6Rkdqd0wwamFFdDBxb2VtZEJRZWMyTW13?=
 =?utf-8?B?dUhOMzVXNGxDbzB1eFBPcTlFU0dxUU40dFpSQ1VjaTU5VFpJRGNzWkMreStC?=
 =?utf-8?B?eTBDVXFENVBLa2JXZmltSUNzREp4WnptbEZxbzE4MEgvTHhuTmZrZGN4bnZB?=
 =?utf-8?B?Sm5EODhyOFFjYUo1ZFQ4dWd1Sk1DMmVCTGkzSFYrYzJVYkNKSytQNDB0eWFl?=
 =?utf-8?B?bmZjZlkyVG9PQVVZN2Q3Qnk4dDdVVC9UaTlYZ0w5TmJTcFlTZTQ3RndpRFJ4?=
 =?utf-8?B?blhtdmhXalhuRk50bEwyNk5OQTBCUU92ZzZVcWkwamtMbmcvYVNIbUpnUkxl?=
 =?utf-8?B?ZnpDMW8vMjFwS1hEdkhoT2ZWMFhSTVdkYUJTSk9iTFNubTlXTDJ2WkpNSEVj?=
 =?utf-8?B?OFFjYWpqUStvbUFOVkx3SUJ5TVNQMnNXTGFENVFJREV3REVvUlkxQUxTN0Fp?=
 =?utf-8?B?UnpMbkZCNno0NWt2RkVRTTF6QTRwZW5jMkt1Um9iZ3JzbFdndEcwVENOYWd4?=
 =?utf-8?B?ZEp6VUtZZm8zVDhoTGtKK2lKVUF6VzZURkFRamdzRzNHLzF4MFFzTjVSamRB?=
 =?utf-8?B?bFZyeXMzeHhiZEQwdHFOYXllYUNQNmdEYWp5eUNvTWFpdlFpZmVBVWpYKzJ6?=
 =?utf-8?B?US9EVzJyL05YeU80YnRvRWdYRUgyelo0bytER01tQmV1TTQ2M1hpWnUra2RH?=
 =?utf-8?B?dzhqTTI5WWtaaW5MUk1mT2ozaDZwSUUwQXRxaUpzcnBja0pONTltT2hieFcw?=
 =?utf-8?B?eTZ2WklKWjlWWnVWZkZlNk5lMVVVd012SWRnZVhNNGpHWTVOWGZmUHdvSExR?=
 =?utf-8?B?QWV4TE5WY1ROTUdaSEVFWVFDMmpuWjVQMXI0anBKN3psK1ZrNXlmcTVzYUw3?=
 =?utf-8?B?MFIybVJvWWRrL1djVGdFQVlhdWxKSkV6bnR4clNzM1oyL3BTckJSWjZpNEJC?=
 =?utf-8?B?OWcwRU5VaC96eEVBTHlpVDdERkEzbW1kdThONDhVYUpHa2Q1Q2xYYnpuRnZ6?=
 =?utf-8?B?S1F0MVdBSm51MTUwVFhrOUU1MlNCaW81c3NRNTJDU0J3TjJ3emtoRmk5OFo3?=
 =?utf-8?B?MERkaWZPTXdPUnJpV0p3MVlHTU45bWZwZUpqRExheEhFcWNaYTdWZm1MTFdq?=
 =?utf-8?B?K05lcWx6OXpSa3pKa3lHQS92U01uOWh1RVRBeUt5UmhiUE1VRUwvVVgrcUpS?=
 =?utf-8?B?YW9VMHJ1V1lFZGRLZ2x5MEpjRUdjU2NPRERZTEE4Rkt4YVZ3NWMwUUxJejdP?=
 =?utf-8?B?L3U2RWVROExzSGNwR1NiNGpuZXRhQVFyNGJuSzNmWDhLblNkUm42eHBYQXFW?=
 =?utf-8?B?MCt6TytZTUR5WVNJMXhQU0FkRDBxaExESFpiemF6eTZNN2d2OUFvNGN1UXht?=
 =?utf-8?B?a241aEhOdUZ3NHh2eFk2aW9oSm4wd1lUL2dBbk9EaTN4RVEwS1hTZjcyZ3Yx?=
 =?utf-8?B?ZWpHdFJSTVhYOVUyTXNsdnh1Yk1lSFZpRFZyZWtDa0RiK0hJQm1wVzBtWTRt?=
 =?utf-8?Q?HHnZI6zZb7rAevS0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb85b11-333f-4e45-86b0-08da163e22fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 13:22:15.8979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EB6laAp2i4IrHxPdXOa2cUPCh4DmnKY8rzj9wliCqnYHIOKwtae0FFu1LIEauh9FWC5FIV+vNSb3vsJhwf3QJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6067
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 11:31:38AM +0200, Jan Beulich wrote:
> Go a step further than bed9ae54df44 ("x86/time: switch platform timer
> hooks to altcall") did and eliminate the "real" read_tsc() altogether:
> It's not used except in pointer comparisons, and hence it looks overall
> more safe to simply poison plt_tsc's read_counter hook.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wasn't really sure whether it would be better to use simply void * for
> the type of the expression, resulting in an undesirable data -> function
> pointer conversion, but making it impossible to mistakenly try and call
> the (fake) function directly.

I think it's slightly better to avoid being able to call the function,
hence using void * would be my preference. What's wrong with the data
-> function pointer conversion for the comparisons?

> ---
> v2: Comment wording.
> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -607,10 +607,12 @@ static s64 __init cf_check init_tsc(stru
>      return ret;
>  }
>  
> -static uint64_t __init cf_check read_tsc(void)
> -{
> -    return rdtsc_ordered();
> -}
> +/*
> + * plt_tsc's read_counter hook is not (and should not be) invoked via the
> + * struct field. To avoid carrying an unused, indirectly reachable function,
> + * poison the field with an easily identifiable non-canonical pointer.
> + */
> +#define read_tsc ((uint64_t(*)(void))0x75C75C75C75C75C0ul)

Instead of naming this like a suitable function, I would rather use
READ_TSC_PTR_POISON or some such.

Thanks, Roger.

