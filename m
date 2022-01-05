Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE214854AC
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 15:34:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253622.434829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n57ML-0000H1-ES; Wed, 05 Jan 2022 14:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253622.434829; Wed, 05 Jan 2022 14:33:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n57ML-0000EW-9x; Wed, 05 Jan 2022 14:33:49 +0000
Received: by outflank-mailman (input) for mailman id 253622;
 Wed, 05 Jan 2022 14:33:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fM50=RV=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n57MK-0000EQ-9v
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 14:33:48 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b679e7c-6e34-11ec-9ce5-af14b9085ebd;
 Wed, 05 Jan 2022 15:33:45 +0100 (CET)
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
X-Inumbo-ID: 7b679e7c-6e34-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641393225;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tv2yhoGBehO1p+ehoOoDOBvQTOgenysxP0E5t45FReA=;
  b=enhtkp//CrmAIhaIYNzDz7raZi0ZOUWsi+BtcY/9wqfGHntWNqOsxWiI
   SJPDNxiifeGgtDqC8icQl4scwk01wXiupgZEbyDdoFUIK1sgq9hfPHmSR
   +0b/d0Tcuwzq1QpsBxf2bul6Tro9TSTtCqRGq5pnHn+gf6TT9Gz8UZnIh
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: EFuKXv5+E1FLRzcxoMzd9ASmB9vHb2xd8+wRvFd+pdKCx6WWK5kFk+YvcZ4jnnHxIo7nhWZz4L
 9XyLweeHZeV3S4R4Cu9KGzo5V49aKPHewZmWtdw+k3NjNP2rr6qS5TYoHvY54aQ5sIxvFlNBE7
 7nHZH3/gv5xCS4SH7U66TO2ubKZdZnOOyzVDw3zWEQ3hVGsVSxoTpuH1hIMskoh9eZkpvuw3E4
 p0X5T9zEuP1bytgVq2XlxgP6mtqVLodn8Bo1EWELd0e8LehnFBXR9yANWE7dRFE5HfwZ3g8NOk
 RaFudPtga/biwRsmvZgio0a3
X-SBRS: 5.1
X-MesageID: 60849771
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pskElqgncUPcrdKeL/QyZiiwX161vhcKZh0ujC45NGQN5FlHY01je
 htvDD/SMquIYzbxedtwb4Xlo04CuZ+AyoBnTgA/pS02RS8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcw3IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1D8piXaURqJJT8kchaWSFgIzh/OoZ/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u3pASTKmBP
 qL1bxJOKxjsUjNCFW4VM7t5sP703WHxXD5x/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfnkyLhVYcfCLC/7NZ3m1CJ3SoIDwAMXla1puO2hwi4Vs43F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc9QXF8oaq0KX85rdz0GTPlA0Vz9GQ+Vz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5N+RECnCBtJ6sybp1qHHa4
 hDofODEtogz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0nfx0wYp9aI2O3C
 KM2he+3zMQNVJdNRfUsC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLGkP3SMr9dMdQtiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSGvxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:n+cJ+aGIS4aCFzYapLqFCpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcV2/hrAV7GZmfbUQSTXeNfBOfZsljd8mjFh5NgPM
 RbAtZD4b/LfCFHZK/BiWHSebZQo+VvsprY/ds2p00dMj2CAJsQiTuRZDzrdnGfE2J9dOYE/d
 enl4J6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr10jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKva/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdY11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj8lLYIk7zI9HakGOul5Dt
 L/Q9FVfYF1P74rhJ1GdZQ8qOuMexrwqEH3QSuvyWqOLtB0B5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.88,264,1635220800"; 
   d="scan'208";a="60849771"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NY04HXZCviRRG3PcHUA32fQItJyOBon3n3GXpywkjGFwqM8Ns0GB5DYkxNH9wqYs4zBdwfDN6mHtzSvi/v/67DL5GgC/cTeWw6nRxQER21jSVYUOoRRQONqUR6l2iIHhVxOkThvsbrjKuqInnfnOB7/7IP5ju8SSGkg/XrteBCJHHdagnLcfkIse8Jr60+1YWg0Ea9DC5nCcOYeJUOzy/y/mLUfH1+Tj0lCgi4rOwhwhzT3o+Rsia+JQ08GvAoHFdb83GSFjnUD6t/bgTm/Tc9QVjt/YW2epRpCPTqjgVitvaAIvx4Cviu5pjQaL2Zph1OCEj+MQMZhoBdIJGwRyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMjIHHZJFeTFDTmLnE2ZBy3TmKC0C/cAuXPQ26YKXIs=;
 b=YbaLidohSE32TrPpCbdUhkYFVL9kMnuiytHZ8Tmj031v46WKpadSFARX1Gy85RSrM1IM6KewcEuzaWhqG616XINPlvg/6IHALTBNWYTB59D41LXa3nRYtFrJ+0legpUDW+wL05d+WuF+inUdrkPVTNpxY6nBnXA8yoE7DuZB/9/XH3Vh1D0NzkeRIVsVBxHJx7gt6l2Hh7ZOsDiTZr2L2zkFORLdodEKX44PDj0KY90YP0Bsa1t6EdoPQ156RgMrH+20SI2p7rm3FQPI5V6oayOJAnr9RL5IC3fiXypuCRL4XV44iUvK4lZQTT5vdUgDwuqbdiAswOdZmRR/AvcwbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMjIHHZJFeTFDTmLnE2ZBy3TmKC0C/cAuXPQ26YKXIs=;
 b=u8ApqP7JWQPMHC7WJDK3PE1icCUv9nmanVyrSe/XoZhRqGcVBRbXOmQtVZnu49cwC2MX8CbBy8eLYrkA4Ass7P+t0dZaPmMnO/TCykvR20tnfKNQwWAPIIUdfIF01nTdm/cneCaRHkmuOGByHeuwfrzlcCcHyP6e/N0VoJK9o9Q=
Date: Wed, 5 Jan 2022 15:33:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: G.R. <firemeteor@users.sourceforge.net>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <YdWsPWqALWBRGtqW@Air-de-Roger>
References: <CAKhsbWY5=vENgwgq3NV44KSZQgpOPY=33CMSZo=jweAcRDjBwg@mail.gmail.com>
 <YcwdJn/Y0yncuJ/e@Air-de-Roger>
 <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
 <Ycw4Jna5J2iQJyeM@Air-de-Roger> <Ycyx65BDakqWmEe+@Air-de-Roger>
 <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
 <Yc3/ytwCHFtR1BLi@Air-de-Roger>
 <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
 <YdQgf2+E467kuTxK@Air-de-Roger>
 <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1841cb8-6195-4a8c-1fb6-08d9d0585c92
X-MS-TrafficTypeDiagnostic: DM6PR03MB4060:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4060F3AE9EDAF0428E4F5F4C8F4B9@DM6PR03MB4060.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2mAHyR3FmFmw4wsCEKft6mi0wHfBZYebdHQawJopU72lRj/zJ7Lql57+4T8iMcl2ZmY8C8eWLigD+2chp5RSdvKls/t7pv4zoJK0OH7lpH2BEKazZUghgGoTUKAef/JMTUF7N8XvFaNvJq96gtyO2iewOAO7c1zb7uSczMUD5ENMhww8Mp6c/gNpz8Z5icjU4VPXw1qV2dxSr1FRzmdqXYHDU6wZJ1gWW3l6O2wIj0bwFiAxQA6G1IMZy9abx4UnQreFsdNtWz79iwzuPL22WDFpZ11UIXCYKXgzN5FnSbXHrRG0EHLM1rFC1ApbjS4Ex5UB8CoVCBzkoya7y71jC2QCq5riLz5lgd1m1rm3QjYcsMCWEWwjB6Q1v/FPIO+nTH/deqr2HsE/Zpvh7+0DhxIhyUMnjDThwaSag7G+Y5jmmUk17xMurZefk/kCNoYyjeoGJa17v/VGXsUO1CHe9QA+YRaNXitwbHJibvXWc33u52W4snxB46gwS0xvadcGblZkmYrePjyzlIHC/oGHPBcbLDnnxPVinGUT0TKv6QV6j7O+FSTtEF00hhSAW0np92uvOrhE6tTzU4Ong5F0+aIm6EWrbG5TBbuUHsWYsxt9aSXGlU9EwD1mH8z0lSEEtLtHChCILk7IYz+gtyxq/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6916009)(26005)(83380400001)(33716001)(4326008)(508600001)(66476007)(85182001)(6666004)(86362001)(38100700002)(6506007)(5660300002)(186003)(8676002)(8936002)(316002)(6512007)(82960400001)(9686003)(66946007)(6486002)(66556008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkhXTkxleUs5emwrSDgrZi9SejU2T3dLcE9sTWxzV0lCTm43TWNpQ0hVeW9W?=
 =?utf-8?B?MFJGaW5ucFRoQkdhaXU0RmQ0RjRPZnR1MXVuMmFDQmZqUnI5dno4NWFhQktp?=
 =?utf-8?B?TW92TzM1c2kzRC92emJxck9YTHlCQjlrbkdZalZHaU42YVAyWUVEanZrVTR2?=
 =?utf-8?B?YzdNNHpod2hkaUNySUorcHZ4a0h1UjN5UnpRR01yYTM5TlBlNXZGUzl2SXR5?=
 =?utf-8?B?M3RGb2Q4MktyVFFNODVPSlE5SGdMTXFESSs0dXcvV2IyTmt6MGdSdDNtTXdr?=
 =?utf-8?B?K2IyWXB0aWpDb2JFRUhCWkV2VS9ReXYrc1JDOWV4K3NtdmdQVzlsK1lJMEJa?=
 =?utf-8?B?UWNTVjVXK0RVWjY2eWhPZE1NWERqTlJJSXh6YW1wdktXNHRuUWJSZWNnNXYv?=
 =?utf-8?B?aVhrOFNCeVp3UU5hZ0ZwVnhVN1N1Mm1PU0w3aXFubUpLSmtCN3JzZHBHaExD?=
 =?utf-8?B?a1JvbGtSdmwzQk9rSzN4Y0dLQloyS09OejIvWGR3MlRXeDBTQUxrRDBscVhZ?=
 =?utf-8?B?ckZiSG1EZkdyNFZycmdncVZkS3JpdWJhOC96U3NQYkpINStXYnJiNWZTOHlI?=
 =?utf-8?B?VXlXSFdqempzeVN1OFRtZEpPL2MwbUs5VlpOZ3BLY05KcWt2ZDduOFkvVDRT?=
 =?utf-8?B?M2hlU0RMd3Iwb1NUa3BrR09xdTdPaitiV3FpOFQ2dWNnaDZjZzV3Z2lIVlZR?=
 =?utf-8?B?N0haTGoxdTNvNU90c1hBMW43ODdoWDkrYkhSbHdLaU12WHdOTGM4V24rRVQ5?=
 =?utf-8?B?NXZBZk9sNkhpTlJhWHFBUGdMc0RxWHQ1OFVtY0x0R0hVREZCcWJGMWVXQ2JJ?=
 =?utf-8?B?cEgxOVNnNnpWVE5OcW43a3k3L25XWGlRdUtmZ3VCeHVab0NxN0dhSG9vOGxW?=
 =?utf-8?B?WnhxSU1uYjIzc0ZlZ0lITzd2QzcyY25kNWd0Q29jeVVDaGJRM21tVmhTZmtC?=
 =?utf-8?B?Uy80NnNvZjhaQmkwWHMvSUU4VWV3QTJMeVEwMXRiRFJTa09UdndZV0pBNkQ0?=
 =?utf-8?B?NVp1dC9nblZzNlRRRG1hMTZXRUNqV2JOZUNiTnRFcGdweStCOTRFdjc3UTdm?=
 =?utf-8?B?bVJvcXpHdTBlWk5pTEdXUDNHdHRwZlpnK0VHZnNQd3RNcUFpZjd2OXpidmRz?=
 =?utf-8?B?RmxLK01COUpKVEllMHVBN0Fwc3pGOUt0T0xIZUtEUVFyTHdwV21WZHd3VmpU?=
 =?utf-8?B?elZTTmdFOEtjRzNRNlUvdjZVdFZGQVlLdWVmendjcDVFSFRHU0lKekVHM1dx?=
 =?utf-8?B?TDd4RCtySVAzbFJxSGZTSHR5Vk5UVjB3UXFVd0ZVZVVtRTBTcG9PbjByWFVU?=
 =?utf-8?B?WlI4QVNJMDV5WENpbU5rWHJKZDZmdnpOL2pKVFFUR3RvdGM3MXdPUWUxbXFU?=
 =?utf-8?B?QU1yVjNvTWhqSUNDNVN4TFVXZENtQno2VTR4d1dqQnI2NFM0eXR6NHhFVzdi?=
 =?utf-8?B?QjMwUHlFaWZYSDVpOXVYclVpL1J2bjZobzcwanpOSFB2Vm9WQlArM3FmaHp3?=
 =?utf-8?B?STVIY3BWQ2JnMDZPU2d6VlpPaGdaTkhrQzBzT3pFTFhjeVlxM25TdCtqM2RL?=
 =?utf-8?B?T0hOWUc2MTZSRk1sR1JHa1lPbzcyTTFBRDR3KzZtZ1J5ZENjQkY0Z01ZOHpw?=
 =?utf-8?B?em55OWg3dFloUEVkajVFMkIrZlJyeUlKK2Yrb3pZUmZNcENIdkVKajdZTXNh?=
 =?utf-8?B?UmxGRVZZaXM5U1Rsakk2VHYxY3dYV0paRVFkQ1hZY2YrZ2VIQndSSTZjeTQ5?=
 =?utf-8?B?QW8xU1BLUzBIVVdZR2ZlWGFYaVY0ZXYyY3I5dW9pZ3VhQVR2SFNUNHZJMm1D?=
 =?utf-8?B?U005d2VyM3Vydi9Xc2hLUzhodGZzYUVBSVppSFYvVlltZHovelRidy9nNFh4?=
 =?utf-8?B?V1JiODZubWdvNmNaUXh0bWFLcFdqdHZqNlM1ZjMrdi94MlhGSVRVL0xjRUVu?=
 =?utf-8?B?T0lybUp3SUtmblM1ei9FczhBMTBCUVA0WG5mYVNFc0wybE1WUWxHRGhVRnph?=
 =?utf-8?B?R1c0bnUzamhqRkRkRTdrNWEzUjh6M1hmZE1sTTJldVRmS0F2Y2x4cWNRdEt4?=
 =?utf-8?B?MFBXTlVNNFE2Q2FRbjZia1hpTHNkaGNCd3BJam4vakZpZ09FUTY1Y3VLNi9z?=
 =?utf-8?B?RHcwSmJUT1MzeDdtRzZhSFZ0M3gybEF4Lzk4cDZaREpsazBHK3IzNTNLbE5x?=
 =?utf-8?Q?GZOhIDJqIEvoCY5SEVRliK8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1841cb8-6195-4a8c-1fb6-08d9d0585c92
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 14:33:38.0915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzhdW/ADVjCRTCWjC1L1fAY3zCu+si9u3M5VJeDB7lSmcu4tr5MgFTPyNMV56mHKh7YkVzKKJn+RJYe930O/ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4060
X-OriginatorOrg: citrix.com

On Wed, Jan 05, 2022 at 12:05:39AM +0800, G.R. wrote:
> > > > > But seems like this patch is not stable enough yet and has its own
> > > > > issue -- memory is not properly released?
> > > >
> > > > I know. I've been working on improving it this morning and I'm
> > > > attaching an updated version below.
> > > >
> > > Good news.
> > > With this  new patch, the NAS domU can serve iSCSI disk without OOM
> > > panic, at least for a little while.
> > > I'm going to keep it up and running for a while to see if it's stable over time.
> >
> > Thanks again for all the testing. Do you see any difference
> > performance wise?
> I'm still on a *debug* kernel build to capture any potential panic --
> none so far -- no performance testing yet.
> Since I'm a home user with a relatively lightweight workload, so far I
> didn't observe any difference in daily usage.
> 
> I did some quick iperf3 testing just now.

Thanks for doing this.

> 1. between nas domU <=> Linux dom0 running on an old i7-3770 based box.
> The peak is roughly 12 Gbits/s when domU is the server.
> But I do see regression down to ~8.5 Gbits/s when I repeat the test in
> a short burst.
> The regression can recover when I leave the system idle for a while.
> 
> When dom0 is the iperf3 server, the transfer rate is much lower, down
> all the way to 1.x Gbits/s.
> Sometimes, I can see the following kernel log repeats during the
> testing, likely contributing to the slowdown.
>              interrupt storm detected on "irq2328:"; throttling interrupt source

I assume the message is in the domU, not the dom0?

> Another thing that looks alarming is the retransmission is high:
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec   212 MBytes  1.78 Gbits/sec  110    231 KBytes
> [  5]   1.00-2.00   sec   230 MBytes  1.92 Gbits/sec    1    439 KBytes
> [  5]   2.00-3.00   sec   228 MBytes  1.92 Gbits/sec    3    335 KBytes
> [  5]   3.00-4.00   sec   204 MBytes  1.71 Gbits/sec    1    486 KBytes
> [  5]   4.00-5.00   sec   201 MBytes  1.69 Gbits/sec  812    258 KBytes
> [  5]   5.00-6.00   sec   179 MBytes  1.51 Gbits/sec    1    372 KBytes
> [  5]   6.00-7.00   sec  50.5 MBytes   423 Mbits/sec    2    154 KBytes
> [  5]   7.00-8.00   sec   194 MBytes  1.63 Gbits/sec  339    172 KBytes
> [  5]   8.00-9.00   sec   156 MBytes  1.30 Gbits/sec  854    215 KBytes
> [  5]   9.00-10.00  sec   143 MBytes  1.20 Gbits/sec  997   93.8 KBytes
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-10.00  sec  1.76 GBytes  1.51 Gbits/sec  3120             sender
> [  5]   0.00-10.45  sec  1.76 GBytes  1.44 Gbits/sec                  receiver

Do you see the same when running the same tests on a debug kernel
without my patch applied? (ie: a kernel build yourself from the same
baseline but just without my patch applied)

I'm mostly interested in knowing whether the patch itself causes any
regressions from the current state (which might not be great already).

> 
> 2. between a remote box <=> nas domU, through a 1Gbps ethernet cable.
> Roughly saturate the link when domU is the server, without obvious perf drop
> When domU running as a client, the achieved BW is ~30Mbps lower than the peak.
> Retransmission sometimes also shows up in this scenario, more
> seriously when domU is the client.
> 
> I cannot test with the stock kernel nor with your patch in release
> mode immediately.
> 
> But according to the observed imbalance between inbounding and
> outgoing path, non-trivial penalty applies I guess?

We should get a baseline using the same sources without my path
applied.

Thanks, Roger.

