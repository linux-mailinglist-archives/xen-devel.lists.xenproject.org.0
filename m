Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C966C4F1295
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 12:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298232.507970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbJZP-00018O-1k; Mon, 04 Apr 2022 10:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298232.507970; Mon, 04 Apr 2022 10:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbJZO-00016N-V0; Mon, 04 Apr 2022 10:04:22 +0000
Received: by outflank-mailman (input) for mailman id 298232;
 Mon, 04 Apr 2022 10:04:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjy=UO=citrix.com=prvs=08688decb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbJZM-00015z-Et
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 10:04:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9481c66a-b3fe-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 12:04:15 +0200 (CEST)
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
X-Inumbo-ID: 9481c66a-b3fe-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649066655;
  h=date:from:to:subject:message-id:mime-version;
  bh=wd+U9l9whlTW0NoQfDgjyi98G8boMD0/950K5cWZC08=;
  b=UN6fiIp5CXlwE/EExZGzqy4yzR6lYai7unXrGDt8k4W2V5qUMEz9M3mP
   kB9jADeOl35m64TbVKbSju4+60fzdQ3MQaNoaXo5mh4BfAiWumqhgojNn
   HqPDfyVFIWx+2yjICdiQhwU2uqwGA7tAuyE4Kh69L1F2iJ5uNV7BQ0gn4
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70319170
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JSpz56Bei0hq7hVW/1/jw5YqxClBgxIJ4kV8jS/XYbTApDImg2RTy
 mBJWDrUaKyCYmP1ftpwao/lo0gCsMPRyN83QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jh3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh60
 OQTu7+hWz4yBfORms0mfERhTQthaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcHhGxp15kRRZ4yY
 eIZVx5ScD3mfSRDM1EJI8k6hevv2nrGJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqRavTnxH2hHthITfvhq6As0Ab7KnEv5AM+XkOK//eam1yHQOkBd
 k49wQVzlPYY6xn+JjXiZCGQrHmBtx8aftNfFewm9Q2AopbpDxal6nssFWAYNoF/3CMibXlzj
 wLSwYu1bdB6mOfNIU9x4It4ut9b1cI9CWYZLREJQgIeizUIiNFi10mfJjqP/UPcszEUJd0S6
 23RxMTdr+9K5SLu60ld1Qqa695LjsKUJjPZHi2NAgqYAvpRPeZJnbCA51nB9upnJ42EVFSHt
 3Vss5HAsLFWV8nRyXDWHLll8FSVCxCtamC0bblHRcdJythQ0yT7IdA4DM9Wei+FzfroiRe2O
 RSO6Gu9FbdYPWewbL8fXm5CI59C8EQULvy8Dqq8RoMXOvBZLVbblAkzNR/49z28yyAEzPBgU
 ap3hO7xVB72/4w8l2HoLwrcuJd2rh0DKZT7Hsukn0z+gePBPBZ4i94taTOzUwzw14vdyC39+
 NdDLcqajRJZVez1eC7M9oAPa1sNKBAG6Vre8KS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:1a3SRq70kscvD7R1MgPXwTOBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJgFo6H6BEDgewKlyXcR2+gs1NiZLWzbUQeTXeVfBOjZskHd8k/Fh5dgPM
 5bGsAUYrCAbikZsS+T2njELz9K+qjgzEnHv5a48587JjsaEZ2Ioj0JfTqzIwlTfk1rFJA5HJ
 2T6o5uoCehQ20eaoCeCmMeV+bOitXXnNa+CCR2TiIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zgnxbi7quunvmnwlv31nPV7b5RhNz9o+EzcvCku4wwEHHBmwyobINuV/mruy00mvim7BIQnN
 zFs34bTrZOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpOCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvGrf2UIUh4bD3wXklX6vpREnBmc4a+a
 hVfYnhDc9tAB6nhyuzhBgv/DSuNk5DbStuDHJy+vB96AIm4kyR/3Fou/D3oU1wha7Va6M0kt
 gsYZ4Y4I2ncKctHNJA7aE6MIiKNlA=
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="70319170"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jw9L9ApyUm7S0iDHu1PTroJWl6W2PRAbTC2WouNC603G7kTS86jMtmNLRLps4uhHjrALSBBcV5Avgt5oJum1EdkIIm2ycpUOvT5ThnrlpMmpREevc/lO+mfOUpaotOILYbA7b1EzERlAMYL1C6yJpOKt6ZmFiCB8sQIleG74hWlivnrzzt+dr9IrhGuhCeUy4NuY2IT/xUT8PR2TA2vSE/o5wuQJEeYfbMJnDe0UsiQStNekSOUu4Q1G9g7uHhOtXarKvJnjBbMyV4dM0RnhIETIBVHd4tJ1TRrLsDwPBg2BbKFF1FFEc0PTOq4eJipsFpMOEUN19y+g7jYSI4kfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+CDDSSaXAb6T7t8b1sqsKZHhME11JRkzfvhHQ7UNCg=;
 b=iCZJUchoCTjoaKt1kvhLJmdU5nypskQzqtRxhOn1gJLRlhInNoYVrCtjSktepTGOd+7TLuJthBHJC+nUNrUVWBpVnPBS6ksbG4VmIxYP4i+6KBPHy/7nt92V3WvrvqEgBiwizQQdhhu66ixi1LYHuHLGEqQDXn7I5ErpZeL7X+ArWMVD9SpoVR/Fj47xSZ0xlIOWadhfKR64HttZ1Zx4Tt/SvOauuBYGLv4SzBZ8JfuYtMNCBMBYXvm8AIWNtwkW4fo3B0wfWgMjrcsxTaBjuGr1tTNg+xgCcs9sRq4guvtUx/RpC1jXiGYoFnUHPgBIk0CQMRgVBwHMhKTPp4dMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+CDDSSaXAb6T7t8b1sqsKZHhME11JRkzfvhHQ7UNCg=;
 b=u0Xws78moOnDKFjvSRlHSV3WVXekiiDJkl0YvNOvOqAXgjFtVCW7fzJEfPzKQZiA+dGdZPD+QcULbKA+jueCnIrXmeCjbkuvXClk6aQx2s4hNomvHfea00Hu2B/btn2pNban28eOQjQ5ojGzWPctmGtFDaVt+VgBwOMOWLIvWPM=
Date: Mon, 4 Apr 2022 12:04:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: osstest: boxes pending comission
Message-ID: <YkrCkzWRW1xMvzSj@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: LO4P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e806d40e-4d38-4333-089f-08da162275c7
X-MS-TrafficTypeDiagnostic: CH2PR03MB5301:EE_
X-Microsoft-Antispam-PRVS: <CH2PR03MB530108C078C699CF6BEB6AE08FE59@CH2PR03MB5301.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GbRjMOJHe7xk6KMZP9ldHrJHRcIUL3Cu+PYU+H9vnFf4cRiWzG3gxOrjwh2eo13er28OkFAGoTexG2/Ib/0uW7RF2Fm88K2po/cffOhx2JUSzVZ9eTTd2prcnsR3fPwE8hFupNf8g1J5LMQw+IraKcUwOzJBHdvu5YCPvvFmJ74G/DSEi2yrJtV+YPJH69ISUpeCkBpLDoO2wyecSULKys7e3yfD+xPZySUGSTSNBNPKQDVFkBIFes4gCHaaX5sq6fALtlo5AUI3ab0ICyt6AV1pGVNp9n7e+lUiqvBjDmVZc/A3S2SfjDWVj0K6wfBZQsArraxn+9CAfVciXd8618fWCPwmuxKvga/lypFvkwvLDtyV37PKHS30xXAYkTLsBTJCto/t0n6OAFFqmlVGE9I6TdBCJkTLshcbCFvAiEeN++8Sk2lmYeo4BKWC1qW/dE22fxVC8HwSskRTYfe+O8F1i59t2xoB+r4HVChbPEfGk0PJbTRfVoJQyobX+d2q7sWQeWa6hLud06QG+HsaFQYGueiq/oLP0y/oN2Q83yXTdEVY96SP+yKEuL3vsv4+SKv5ADO8qa5diPnLjg2DitKWCP5TwAx39cY/tN+OcIpcuoENpssuC5FUHtEC0j4vX9yrxeMxkdHosClJ7kRXRYoxZ6ocHISJGMv7wVke/NvVt5IAA05aEP/7rWKYbIEfCT8h+CtIeTJn/wwJmEjNdRprAeGDGFgQqsT4sbt9RoSZUCGq6LqKgUnwtb5Esj3IHt6c+T9hBoF8gImTw/idng==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(86362001)(82960400001)(6666004)(2906002)(6512007)(9686003)(6506007)(316002)(6916009)(66556008)(66946007)(33716001)(8676002)(83380400001)(186003)(66476007)(26005)(8936002)(85182001)(508600001)(966005)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUxXd0JJZHB1OFVUQjg4L2VXdGtBUnFIMmRmUTZjZFRqMG5MS0d5UEhDRzZm?=
 =?utf-8?B?Y2dMWitsZlYvMXRRb1kzdmMxMUl2SDBhNWxyenRnOUxlTWw1dFFmazV6M1dr?=
 =?utf-8?B?c201ZGNucHQ2YUFnTnFvYzNLTnppQ1Bab0sxNXNBdkw3NzFUZGlFV3VMdzh4?=
 =?utf-8?B?b2I2WHBsVUFoMjYyUElVa0NFSUZuR1Q2dWkwTHBSYTZzK3k4aGQyUXhiMXNR?=
 =?utf-8?B?dXJ0QzNjOHI1ZFRjOGUxM0hDZEJQUUpacVhkM3FMdWt5L3ExMSttbFlxdHoy?=
 =?utf-8?B?V0xpYlEyc0swdXlhSis1bFl4WlZrblVHcmVGNWV6NTl5UWhHYVhCenMxZUpk?=
 =?utf-8?B?ZVJJSSt2Vi93amtTd2dJcDc3MWswTHJyMUpxbGVmL0RXOGJUTGJUQ0thdHZs?=
 =?utf-8?B?aEtPRE9vbGlQZ3pPQ0xseVl3N2dJcXV0S0lSdkpTUUNIM25tRnJMaWtMU0dr?=
 =?utf-8?B?aDl1NC9ITjEyTXpBV0h5bDFRTkg3eFZsM0VkYmMzT0dOMFdhZHVsMHgzb0Z4?=
 =?utf-8?B?dGRkN1RFaXY4U0RsaFhxaFQ2V2RqTEZabkMrRjdnUklxdkUvQlFET3JpWWxQ?=
 =?utf-8?B?d0dXazJPTGZsUzlPMlZaNFJNOXpnWFNCT0JyZS9ISHZZWEVGS285WGw4U0lD?=
 =?utf-8?B?Rkx4R0FVVXRTWWdGRXhkRHcyUmtXRWxCQ1h3TDM4ZkJWalNmN3U0SXF0WVhD?=
 =?utf-8?B?c1pxUThnb2VldjB4aTVLbGVlL0FVTWI0N3lhVkJ2NExyb3d4VEM3b1pvdWdl?=
 =?utf-8?B?UFVtcXBnVkNqaGZ6cEdrckprRFhTWEozZ21mV0dYSzg3cENtb00xTmR5Q2Vx?=
 =?utf-8?B?dU5wNi9STC9lSkw2UGJ0S3RTMGhWdVIvdE02V1N6RWRjd0NPcERBOWJNUUw1?=
 =?utf-8?B?Y2NjblN1bTU0Z08vamhzUjhHWG1qTmV4emc5K29sU2JaSitCQnQvckt2NFE5?=
 =?utf-8?B?N0FqWFUxTlBRNTJtUE9iOGhOM3FkY2x5dXZibHhzM3I0MFZzSkJzeVYyUld1?=
 =?utf-8?B?bW52WW9VbjJmSStwa2NBSXpMWW1tVW5sUzZDRUpTRmdmLytrM2o2dXhudE9E?=
 =?utf-8?B?Sk4wbDMrTXdKNGJNZGxUK2hyYnd6YUJjYVBwY01kd2pCTXBwaGhGd1ZBZTB1?=
 =?utf-8?B?Y1N0STBJVkc3WWNSeFh6L0hKb3d6Z1ptM2RZSDg1cFk4RmQ4ZE5nZXROa0M3?=
 =?utf-8?B?aVpCTGRsNjNUOVBYT0dKdHVOOWRiOGJySHZkTkVEOWFPeGEyL3lYcmlUL2tP?=
 =?utf-8?B?akV2YTEwRHppaDZJbEZwZXQ5VW54UkI5Nml0RGZUTlRTTUdyYnZ2eEM2S1Mr?=
 =?utf-8?B?Z24xOEsyelcyaS9yUm10QTVvS2F0cGlnTEJrZC83TXlCNjBKREJpMjBNTGM5?=
 =?utf-8?B?ZmZBVUtxMmNCMWlKSDdXb2JqbEdyMUtpSUE0aGM2RmU5WXRFZ3crcC9yK056?=
 =?utf-8?B?WDdyakNrNndyZEhGeDVNcURoQlJLUE1RT2pzMHRzMnAzNW1YaVQrcUgydTNa?=
 =?utf-8?B?akxPN1h0SDZ6eSthbG5KZjNCZWdGYWhDK25oTFBsVlJMMnIzZWhlQlBMUkti?=
 =?utf-8?B?WG14NXZPMVk2Q0tYTWo3VDk5cTgrZnYyNGZQTjhKdHRta1dHYTBTSEJ5ejhl?=
 =?utf-8?B?TEcxaVlDdWVJelJpRkw0MUVyZ1M3VTNuRXJ3bHlBdGpDcFNWdTc3NnJydGNL?=
 =?utf-8?B?YXUrZWpqS0h3cmdtZEFNcFZMNkZxTGVhMDVqQzlzNnEyL0V0RU1nbjZHVE5t?=
 =?utf-8?B?TVBNSExlTE9Id3BDSm9uWmdNRkI5Ukg1T0RlbUszTThvNEFLRm1GNHpUYmQ2?=
 =?utf-8?B?NnBrVGNCMm1rTXNXK0RFTjdDOStiakVONUdTYUZ4a2xpQnRaS2FySndzbTBU?=
 =?utf-8?B?TllDZlNnNGtEalJrUVRWV0JyZ0lmVklCQXRzV2dyaEtwMjJYNlQxcUpBdXh6?=
 =?utf-8?B?Vm96eklQY2lnRVM0TGxCangvdjBsN2hQMEp3eG5iQ1pjT21VZlBUL3FVMFl1?=
 =?utf-8?B?aHF2UjN0aC9pK1l4dG9IVHZsSWV5UHk4YmpvQ1pxdEJaanVrY1RRYVQzWWFT?=
 =?utf-8?B?RXNPNWJlMUlyb0d4Ti94NzMyQ2FJRGZxK0FDblR0dDFHQWc3cWFrbitDVDVB?=
 =?utf-8?B?M1hCd0E2WlFaMTkwMmJISllER21UMlFzU0dINFlTanpFSVJhQmlFNTZuMnpm?=
 =?utf-8?B?a05ILzk2V0g0U3dwQWZpenorY3Y1bFhCZW1ZU2JnY3RabmJvcHMzbEl3N2ty?=
 =?utf-8?B?WVA3ZVhWSktNbzM1UmhQS0h3WW56S1FuZ0VPa0daQ3lpV05GSDJQdGF0d0g5?=
 =?utf-8?B?LzZUT1JlM3J2MllZeWtmZGdyRUFjbUl4c1RBeXlOV3FGNjF5Y1ByZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e806d40e-4d38-4333-089f-08da162275c7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 10:04:08.8898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zB6TvYGMx4qExL/7MP4voub4ImGFENmJQNPRHkUKbbUxHQvJEunbgUcfl0TMZOODkcLmeq0lOGR7557rGNOVDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5301
X-OriginatorOrg: citrix.com

Hello,

We have the following boxes pending commission:

italias
 * Commission flight at:
   http://logs.test-lab.xenproject.org/osstest/logs/169015/
 * Issues:
   All fine except for the leak-check errors:
     LEAKED [process 14559 run-parts] process: root     14559 14558  0 19:29 ?        00:00:00 run-parts --report /etc/cron.daily 
     LEAKED [process 14558 /bin/sh] process: root     14558  2252  0 19:29 ?        00:00:00 /bin/sh -c run-parts --report /etc/cron.daily 
     LEAKED [process 14564 /bin/sh] process: root     14564 14559  0 19:29 ?        00:00:00 /bin/sh /etc/cron.daily/apt-compat 
     LEAKED [process 14571 sleep] process: root     14571 14564  0 19:29 ?        00:00:00 sleep 1091 
   Those processes are from tasks started by cron. Disabling cron in
   rc.d during the host install doesn't seem to be honored later on,
   I'm looking into a fix for this.

joubertins
 * Commission flight at:
   http://logs.test-lab.xenproject.org/osstest/logs/169014/
 * Issues:
   * 2 network timeouts while connecting to guests. The timeout seems to
     be while executing the command, not while establishing the network
     connection.
   * 1 timeout while running update-grub on bare metal (without Xen
     installed). I've already had the raise the timeout for
     update-grub to 120s, but that's doesn't seem to always be enough.

debinas
 * Commission flight at:
   http://logs.test-lab.xenproject.org/osstest/logs/169016/
 * No issues: Arm test failing, -amd test failing due to the box being
   Intel.
 * Will bless tomorrow (5th of April) during the day unless I hear
   objections.

