Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0ED4D9EE9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 16:42:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290886.493485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU9IY-0000lQ-1D; Tue, 15 Mar 2022 15:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290886.493485; Tue, 15 Mar 2022 15:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU9IX-0000iL-UX; Tue, 15 Mar 2022 15:41:21 +0000
Received: by outflank-mailman (input) for mailman id 290886;
 Tue, 15 Mar 2022 15:41:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAQZ=T2=citrix.com=prvs=0668da279=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nU9IV-0000iF-SL
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 15:41:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59cee5b6-a476-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 16:41:17 +0100 (CET)
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
X-Inumbo-ID: 59cee5b6-a476-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647358878;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xMiR+WXhgBAnfOEaJmGFhhQFyqGX3QlQhKpL6tr9GJc=;
  b=BZUcSCFpo0y1M8CPVO6RaLSDSbY61DKL1StT3v7OcLxjBgOiOxvv5w3C
   t/khXSVdTLTujilqX1uH4to3qg5ElTkxyYJsPnOlVuNbZq5YiOBhojdb4
   8+CjcrIs17Nyl5wuyxJkXw6vOyPlIY9IeQc7HqmmmC4Y4g/ae6yPmbAlf
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68659485
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pIqJCq/S7oM4yJ7C2rFZDrUDmH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jZOWG/TPanYZTPzL9F3PIq2/UIP7ZOAmNJrSAo/rys8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oHkW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnY2LQywgO5/tovYMXAtBEwBcEo1s+paSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4eQ6uPO
 5pEAdZpRCnDRBFxOn01Mcw3rsyGinrfTD5m9E3A8MLb5ECMlVcsgdABKuH9dtuHT8hRtk+dr
 3DB+SL1D3kyN9uZ0zOJtG2tguznmjnyU4YfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1ILF2AyyD202bwRTedM0rc8XZxMK/
 F2gyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/tht00unosJLVffs04arQW2YL
 yWi9nBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocd7xorqp5
 iFsdy2iAAYmVsnleMulGrllIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGG1P
 xWC41oLtMYJZhNGiJObharqUqzGKoC6SbzYug38NIISMvCdiifalM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhRdCllX8+q85ILHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2PopuzNXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:RgwTaavWy0RJcJE02meFyN5c7skCmIMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtRD4b7LfClHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYGNu/xKDwOeOApP+tfKH
 LKjfA32AZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wgK7VBaM0ot
 gsCZ4Y542mfvVmHZ6VO91xM/dfKla9Ny4kY1jiaGgOKsk8SgfwQtjMkfEI2N0=
X-IronPort-AV: E=Sophos;i="5.90,184,1643691600"; 
   d="scan'208";a="68659485"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhnLw5vDJml3adG7mIMFxdFbGwcf88l81y/vAwReiKzAiMmLPI8ETUM0K85NAllx0W6yfZr5V2t0evV4yv5IK1NVUZwfPSt5tjcawF0WlJ52KnN8Yq6DraQ83fWtUbTAF7R4GyHa/PzcMXAZ7AvNTp2DDgu5+rhh9gUtLjCD1M2Vlg/gW0DYwysRFgv916vWvq3lADOYEtrhr8RrN3R5yHaHC4UojyQaJ1/R1EogXHKnIFAQlB7VdEdDYKyWnghH3NxfWZBHhFiqgwfp9Kf7kLLMF55TyqxxAWyxJYrfP2gwiB5/n+ChImZTx+i9+4vU9r5w/FfrPUzecDC1EUNtZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMiR+WXhgBAnfOEaJmGFhhQFyqGX3QlQhKpL6tr9GJc=;
 b=THYWolL0wl2amPtO28xroOg3iOAUrE/UiMhbPoOtwnU80ck2mG7h7yvqGYrScwGm5Q0e065UjfaXmCr3SOKIJMxxetTBzo7SdO6rghRtX7Kh9lJ4wmAWEz1BvTArgJe18f8CAFP3iEsY+xk1aYxh+a5N4Km7/1T5THmZlmoWVAvtOyFpLerhD8NOQGUV+iqMUVRksdeupLW61ihHNRBN3sGsZ5+mZFAhr9irXOBYK61QGhuQCAHB62kuitQn1kzd6vcNMq+tvaGws7ImtPFXz6DLYdUae7+cnGad+KGWbSEuZL79bqlQNfvL3Ii1Iasc8k6ht3f4+vL2T8eukbSn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMiR+WXhgBAnfOEaJmGFhhQFyqGX3QlQhKpL6tr9GJc=;
 b=wPWrscJlXwOKSr+0DqKJL9ZWiQWbXjk4O4Lr9elK9lHZCWE+HPH8NVbJtna3dGY6Gx+VR5Rgy3THWvm167xwwhTx1EeebekPNJg90Xhyuj+MJSH/1YKIhn4CAOrFf4/w+ZqCOL2B49+bwChzNBE9Si1XwIX9xwxT3hxXJLQB0uo=
Date: Tue, 15 Mar 2022 16:41:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, <doebel@amazon.de>
Subject: Re: [PATCH 3/3] livepatch: correctly handle altinstruction sections
Message-ID: <YjCzk+CAs72d9Vy5@Air-de-Roger>
References: <20220310150834.98815-1-roger.pau@citrix.com>
 <20220310150834.98815-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220310150834.98815-4-roger.pau@citrix.com>
X-ClientProxiedBy: LO2P265CA0440.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40e3b6b7-c07a-4832-79f4-08da069a3c01
X-MS-TrafficTypeDiagnostic: BY5PR03MB4933:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB49337A24E044233BAE1222AB8F109@BY5PR03MB4933.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pegSxkqziJkBGUozoc2RqfMiSDvgvlLnscQBxbXZec9fENMUlOQfhK9KDOsdbv2aBMAdTimNOIGeT8kg8oZxVmGolGSwjD5a4ba+FqkkTHR4fOyQQt+iyAS5j2Dn0aiusCujBLDWmC6jpl78dHf5TzstkztN0AUM+D1Z0wzpN2vFrRzdYN+8AZ5V1XcqOWMn6Fv644We6FfQQAcCSaT0NhkCJPhp6Ku76FUTTZm0CPZxS490utVYCa/t6YL45mHqFbGZ+M8/7nYBQ0dB61Inn7qQZPaq3GqHuyTE3Ldqi00wgreC9synnyl6N1OHCcUSx1rEX/b0806eAnJhgwYR3/ckbDvpraMj4npFPuyRdn2VY4c48clLOGDUS0ZCG6QfNq1b7mIVlprKKWLAwI793oP3kIs9FPbt2trX9EmM/UVmRyBxO30+zkPl3rjUY5yJ5Xf8g6Yo2z6WdPiFIlSTct/yzOM3S7llHvNruhAgfV1rhk9Ocw7/Z3xOvOiDaJLLZxTI133yrsU62T39vHhty/MM7PvZdVFI8WHQAV6ViDeInITveZIFxox5weLVilnD2yGm2gg2SjpCKnTFJOb2P4/DsRDu9OORIhA8emmIvffo2wcIHmxkv/0quge5zdOIuuYuEB507RBdB/x7eqyuGiJMwoogCM1hZeJ45UJnVhewB7dARm3Eq985TMdmQ315F2dz5dy8qnvyYdzt1Y/y8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(26005)(186003)(6506007)(6666004)(9686003)(6512007)(2906002)(4744005)(8936002)(5660300002)(33716001)(508600001)(54906003)(6486002)(6916009)(66476007)(66556008)(66946007)(4326008)(8676002)(316002)(38100700002)(86362001)(85182001)(82960400001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGxESVBXV3FXS3FLSU1DaGVKMTN4Q2dtUWw2TWtiQ1lEdWtYTXNIbytNWWs1?=
 =?utf-8?B?RE40SEcwdm1VNFRtVU1OOXl4QWc0SGlSRWRNU1FpUTRRZndLUnkxb1NzMk5Y?=
 =?utf-8?B?Tk1leXUxUEk5R0k1YUpJQ2ZtbldWYzBOb2pCemtnOW9aNEVmVldrd0hyNGFX?=
 =?utf-8?B?bEI5Y3B3Rk56RkNPKzFMVG1oTUdDc0hGZExZVzB6dzIwb3BMbnVSMUV3OWpv?=
 =?utf-8?B?Lys5eHNnTysrUUFKSmdVZlZncm94MUFIeHFFc210S2VaNy9MQkh0RlpVdjVX?=
 =?utf-8?B?bkVaNEdFaWpXbHNQWmVSMXdMQzZ0RmtSK0FIS0ZHbEhzVk5CM0tVWk03OEdF?=
 =?utf-8?B?V2pHMUd3SkNNKzJlZzFGWGs5dko1Z2p3L3VFcjNyd1dNRWZ2QnA5N1NPUlYx?=
 =?utf-8?B?MWpuWFB4eUJ0YVJCSjZCU3JsSGFQaWgxOTV6dUEzZEFPTWFKTFdEMFJ0Ymoz?=
 =?utf-8?B?VDRlemRqU01CQlVXcXlxdlhHTEYzcEtET3UwQ1RLQU9PdWVkQk5lWFFBWjdi?=
 =?utf-8?B?T2o0VEtJN2lzVHl1Z1RrRTBOS3lhYVNsQVdaWFpMSzFMQkJ1TlNvRlVDdUl6?=
 =?utf-8?B?RGJqdjhTVUNBQjBVNmprdkJBN09HeXM5bDNMWFlZU20zcFdUamFGSlpvdGhO?=
 =?utf-8?B?S2RrNFhaT1hsSld0ajlhcnRLYThnUVZwTGNRQzlaSjJxV3VrRkRmQXYyNzFZ?=
 =?utf-8?B?NGVaTXN6U3VNbUpwTHlFbXNHWEllcmJFN1B2TURXaU1HL0p6RFN6Yjg3TUla?=
 =?utf-8?B?WkUzY1lIWGc1ZFlmVjZPY3ljWUZsUlp4VEgvSzV0c2lGUkhJbEZQaXY4c0Yz?=
 =?utf-8?B?RitFNmcvM08vQS9ENUc3SGxUN3ZPYy8wU2Y0dk9zNitxU2h2VlpOTExsQlhT?=
 =?utf-8?B?bGpTcTFBR2xxdVVESTR5Qm1zMzJlcldpZkRGZzR4clFON1dlRmVxMkNpMHFK?=
 =?utf-8?B?UmVaK3RPN0hGcG9FVlNLSDNLOXU2MHdsZXdaU1hrWEtnRUZXNktsVUF2a3FK?=
 =?utf-8?B?WitPN0wwS0hCOXhWTjRrUkRxQWc1VXhKOGVydXpPdlJuOUxNM0srOVB4WXFW?=
 =?utf-8?B?aURGYUxlYjVTaUprZXRKT3VabVdBUHI3TWZkczR0TU1OdEV4UDZJaFpUQnVD?=
 =?utf-8?B?OTZ6MWkwV1ROVURXQVNReUpQWmZ5UWNVTUVwek8yYVQ1RWVEWmxMbmM2MU42?=
 =?utf-8?B?OU8rM3JWRHpXakdQcEZ6b3NpSlFrWUgwQzhrSmc5bW8rZzl3ODZuZUFMd2Rs?=
 =?utf-8?B?czgwVWswUmd1b1NPTDc3VmFXTENLM0xraTZlS0s4eFBOVUc4VFZSK1c0Sm8x?=
 =?utf-8?B?c09TWHkxMTRSUU1nUmxaVUdGbGZaUktLWXBTTGc0aXp5TFNHU2hwZzVxV1Jk?=
 =?utf-8?B?TkdBdXJTOUhDb1Bhb0FHSmxVejRlcnBPTUFzRlloazdyem9OcWc1allUMjRw?=
 =?utf-8?B?azdkOFUrMzMxd2FkRXQ3c1ltd1Y0T3hhYkNlRmJHNWJCTk5NYytaYjU4L0sv?=
 =?utf-8?B?TzljT0x6aEw2bDZyTEpaT1NhaFZTTnIxRlVBZHRvUzB2L0RNa2lxa1hJelFi?=
 =?utf-8?B?dnRMZG1WU1BJWkQ5aWc5cXJxYXEzR0VqQ0FrN0N3bWVja2xsSVBoR3RZaUR4?=
 =?utf-8?B?Y05RL0R5WU1LZk1Fa3BhWlEzZWpSOFBkbFhUd3hGNmRHZmpibWpOdlAwQUw1?=
 =?utf-8?B?ZkxFZ1VkcE96cTVVRC9nd2JlQnMzUDZodnFqVnJsN0Zhc1o5WWJTY2NGd2Nx?=
 =?utf-8?B?aUR5ajM1MzBhdzVSeStpcWE5bUtxRVU2L2tyRFBjRVdVRkhqNTYwNzhENmVG?=
 =?utf-8?B?aDIyU0drUk1zWXVUWXYwdE1WbFVsYVNCREV5bmh1VmhHbW5Cc1hkejdHSDBl?=
 =?utf-8?B?WE9RdVVlelJCNDZSV1UzM3hBMTk5TEJ4b3N4U1lNWEhETDE3TmlyVVFZMjZG?=
 =?utf-8?B?VEFxQ0FxTVZBZkJ1T2wva3VqSzJtZ3pjRnlwRnRBbThNMTVkOFNGWmloMVV2?=
 =?utf-8?B?RmNUT2xWazBnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e3b6b7-c07a-4832-79f4-08da069a3c01
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 15:41:12.9524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wvKiSvERo2sfHJ6cFpVlNB0Te45uvu/TYZr9zirxXrcpSO6S9Syc+Unaezy2CqEJwIPbx/7i4i28UPNCIwp3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4933
X-OriginatorOrg: citrix.com

On Thu, Mar 10, 2022 at 04:08:34PM +0100, Roger Pau Monne wrote:
> The current handling of altinstructions sections by the livepatch
> tools is incorrect, as on Xen those sections are part of .init and
> thus discarded after load. Correctly handle them by just ignoring, as
> it's done with other .init related sections.

I think my logic here is wrong.

While looking at something else I realized that livepatch does support
'.altinstructions', as it needs to be able to patch the contents of
the payload that is being loaded - hence ignoring any '.altintr*'
section at patch generation is not OK.

I have to withdraw this patch, will likely repost with the other
sections that do need to be ignored.

Thanks, Roger.

