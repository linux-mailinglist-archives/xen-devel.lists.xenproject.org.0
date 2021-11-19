Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717CF457093
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 15:24:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228049.394529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4nk-0002YR-6J; Fri, 19 Nov 2021 14:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228049.394529; Fri, 19 Nov 2021 14:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4nk-0002Vs-34; Fri, 19 Nov 2021 14:23:40 +0000
Received: by outflank-mailman (input) for mailman id 228049;
 Fri, 19 Nov 2021 14:23:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r4T=QG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mo4ni-0002Vm-84
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:23:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47539dcc-4944-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 15:23:36 +0100 (CET)
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
X-Inumbo-ID: 47539dcc-4944-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637331816;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=gSUYUeMqNuLL9/9LpxG+uMSrGCcNJ+QSDzlIZhGWLoU=;
  b=GBXYtNge8dedydVRgmF3Uo72AqOG2FpRUxDMAPKlcPrZ8u6Sa0DqtP1E
   pfBUii7ENaZGjUzqI3fZuK1um0tMQIsW7ou94sT5noNfz7Pvr+iJKw8Vi
   +JK3cNLnUNCfp+Bnhf5aBu+d+rlOa1UcqXVuSniH0QwKMTlblq5dbXHUB
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yK6xOk72Juoqln+StRAVxW1RhQCTPp2MpzfiR6SGnfxV6lEBfXX0lwtJJ7OLdu8biRpC+mV2So
 37sDp9dvqatWROxIwsaohUS58QIaahzvCbBRvrjguBGLwIQGlrOZPSsTLnULW3f9IHZRSaxrgZ
 RhRNLWy9CwbmlLzf4nvAvOAB0/oJ6j1QsWc5AxkJLm+8szWxp794GpUNTeLOUFYLw2MkkNS95V
 Zsk8WTFzoShVOYdu1JIUDQyDdsFvlyZNVTwtUgGgOZBa5Oa7MPs3xeEYSzodyETQQUsbKeVT2f
 HXCYwS8TkC/k/jfw7PWx/7sK
X-SBRS: 5.1
X-MesageID: 58182591
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NR+7va1c5FO137lke/bD5ep3kn2cJEfYwER7XKvMYLTBsI5bpzNRz
 GMaX2GEafzcM2Ghft4na47n9UxUsZPdx9AxTQRopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wr9h2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhuJchx
 uV1hIGLQhZwFJTiktsnTCZiDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuI8BjG1t15km8fD2T
 cYpWwVLfkX7WgBiN00rArgOv/yKmSyqG9FfgA3M/vdmi4TJ9yR73aLxKtPTdpqPTN9Mg0eDj
 mvc+iLyBRRyHMSW1D6t4n+qwOjVkkvTcZgOGbiP0+9liVye2EQeEBQTE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JXF+A58wiLxrDj6gCVHHUfTjVBZdols+c7XTUvk
 FSOmrvBHzVvrbnTUnOb+be8pCm3fyMSKAcqZzIATAYDy8nupsc0lB2nZt9lHLTv1oWtMT71y
 jGO6iM5gt07j8QGyqG69lDvmC+3q97CSQtdzhvQWmWp/wZofrmvboaj6UXYxftYJYPfRV6E1
 FADn8Wd9+kIAYu6iD2WQO4NEbeq4N6IKDTZx1VoGvEJ7C+x8nSueYRR5jBWJ0pzNMsAPzjzb
 yfuVRh5vcEJeiHwNOkuPtz3W59CIbXc+crNcbeEYOp2U4VKfx7e1hhAb3GqwF/Xjx15+U0gA
 quzfcGpBHccLK1oyjuqWusQuYMWKjACKXD7Hs6ikUn+uVaKTDvMEOpebgPSBgwsxPrc+F29z
 jpJCyedJ/yzusXaazKfz4McJEtiwZMTVcGv8Jw/mgJuz2Nb9IAd5x35nexJl29Nxf09egL0E
 peVABIwJL3X3yOvFOlyQio/AI4DpL4mxZ7BAQQiPEyzx18oapu14aEUevMfJOd8q7Y9la8kE
 qRVJ61s58ijrBydplzxirGn8uRfmOmD31rSb0JJnhBhF3Kfe+A50oC9JVa+nMX/JiG2qdE/s
 9WdOvDzGvI+q/BZJJ+OMpqHlgrp1VBEwb4adxaYc7F7JRS3mKA3enOZsxPCC5xVQfk17mDBj
 Fj+7NZxjbSlnrLZB/GV3/3Z9NnwTLMldqeYdkGChYuL2eDh1jPL6adLUfqSfCCbU2Xx+a64Y
 v5Swe26O/oC9GumeaIle1qy5a5htdbpuZFAyQFoQCfCY1ixU+syKXiax8hf8KZKw+YB6wexX
 0uO/PhcOKmIZ5y5QAJAelJ9Y7TRz+wQlxnT8e8xfBfw6hho8efVSk5VJRSN1nBQdeMnLIM/z
 O49k8cK8Ajj2AEyO9OLg3kMpWSBJ3ANSYs9sZQeDNO5gwYn0AgaM5fdFjX38NeEbNAVahsmJ
 TqdhazjgbVAxxWdLypvRCaVhecE3MYAohFHylMGNm+loNudi69lxgBV/BQ2Uh9RkkdN3dVsN
 zU5LEZyP6iPoWtl3ZARQ2C2FghdLxSF4UitmUARnWjUQkT0BGzAKGoxZbSE8EwDqj8OezFa+
 PeTyXr/UCasd8b0h3NgVUlgov3lbNpw6gydx5z3Q5XbR8E3MWj/n6ujRWsUsB+2U8o+iXrOq
 fRu4OstO7bwMjQdovFjBoSXvVjKpMto+ICWrSldwZ40
IronPort-HdrOrdr: A9a23:a1fQgK9s4yW4rhDY73luk+E8db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICOgqTMyftWzd1ldAQ7sSj7cKrweQfhEWs9QtqJ
 uIEJIOduEYb2IK9PoSiTPQe71LoKjlgdGVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvqRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W2Dk1frsA7ciYnV9MMOA4/e7rENoXse2OEDIvAGyWuKEk4U0i93qIfpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.87,247,1631592000"; 
   d="scan'208";a="58182591"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwuyZ2PAXKJuXSfwb7d28rzSenscRyRKAWJv7NUzUlYYF8a0MSgOWZoYTWCNPOcrN08FR5H1m+NfSL1J5KFo3GSYaL/QzD5IGCgpBfmi/DzBUz3Q/LMwxzkz5jBX/FlJlNaTeCgyeB2fbGcv3NT7Hb3vn+VEuEFlnwML8P/QPuAZbHm1GYYWSEwvD6CAOXLtRdXyDK4J7V6KmOuGmfxprXZIPdXT1jhDh93pWeH4HXT6cTa8yNj8NvBa1as7pfHmUd5gdKk700RRFWAW5ykRd8NSDrpgW5AyLj/efHX9gmHF34ZA6p+3gPHeDGtG6y3of585ouymnZ6dt9gr40sSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeklMwL1MzYLpBOSQucrFfty7Z2RRccaIAw5pIApugo=;
 b=Vwy26Dmjy0jsRD0ux5a/RjPgkz2tSKdHEn1y5cZp4Zk7lUx0aGKRJYXWEz+qiSPzK8kAg4DbjvOYM4GWPIjPn2Z35bCtgHsv9hL89QCDeiEkgc184HtxLerRXxQ0Onkjr+2vqT+Qlq+86dktB8FTkpBonFr4YmOLY2AQrWZ/3CcVdtzv+2HzGqs3smdz2Atcvl4yr7qptE0lC3b9q/S8+bsT6+hnyFKBjd1XIzWMkCMRGzE8x3X/OlQfi91/q3GDf/mQBtkBQWogW0WDSDp0zPRnqp6DKGrX4XnR+s8tC+kZDDQeIQdax7E3mDWHgYejQQ1X86rBFjXM8cQbEy3Saw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeklMwL1MzYLpBOSQucrFfty7Z2RRccaIAw5pIApugo=;
 b=o2sUnf3F/M8nRvW/6syiUnMJ/v0ir80qSIb5FJXRoZhl56CNPp7uAPU41adXTYvA8ps0I5S4p+t1fxj25QVKrZTrvqhCEJ2IYh7re4/93zsr8Tos2cDWbr9sEoeA5uJVMoyN2ePxRuvcWEKoOusBZYNs+rHq9FKGO0p3oVllhiM=
Date: Fri, 19 Nov 2021 15:23:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 00/11] PCI devices passthrough on Arm, part 3
Message-ID: <YZezXShKi1ofH5Aq@Air-de-Roger>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <f659a29e-f006-ddc5-53b4-236eb261e1ea@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f659a29e-f006-ddc5-53b4-236eb261e1ea@suse.com>
X-ClientProxiedBy: PR3P251CA0026.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19289efa-efa8-4b88-73a9-08d9ab6829b1
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:
X-Microsoft-Antispam-PRVS: <DS7PR03MB54452FE9230C13BAF8E4D5F48F9C9@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4hdSWeV93ydTBA+hg2y3lvJQX1TYPqoBG/DrdyqGHlFmxiX8sxpXYgzRz+vAa0gK2hl1+m2vHcWjGHvjHHOIvtyKvSHFNSqZ6bGeLpsV/TSe7nTfVAAR94P+Bd0HUV8/LSvdq9xl0P50W0R/3hpjT3fYf4u2Pjf9u537b0xvPBhiv4FsfrtJqz4u0qmccnM8htxEC00b+R73T3cVt3LY+p7xDXplctCM4rAVloEqTsHS0ze9IFUvm/9nZiRke7Kd60wrfbZ0FvpIu22mcoWwCwRerrpegd79usO/5BxO7Nvpb3McAUKI0aQcHOatgmzRuuaWCj71WuCM1PHnN/VLGbR4jfqySVZQV+ByHJ5De/rFQjtpmlY3gBru5HKRyGMQdXOXAIevaMxgVUMniOW+v/lLUkxe9uj/nMk/36/paZ1Atu55PY50AYAQHIu2CgrQIQE1EEXtxPTroolS4hpFToH7kxik+pow+yLcKGVD4Bee97KPLuSp3E0I2kxOe5hxTvXm9/4BmC2Y4wiP+z1XKldFUmvZKYm5sH/s4hkf6tvcHY6FaGhEmMdBr+TQyAhOeAJ9dA7vtLaK76bSExyniFH8iwIkIfB9OujwT+HHG74fK5UwrY93MbRm0NuULQFSGDWVWHXt++E+RJjNvdXeZfINZhle36n6FwupZl+/Yuj/knPAu5gluBkTuN6tqhe+pKfyG2PYlVC0ZG15q7T4gP8qOpetnHQlNK8tZNc3nE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(9686003)(6486002)(83380400001)(2906002)(85182001)(956004)(6916009)(38100700002)(86362001)(186003)(33716001)(82960400001)(508600001)(8936002)(966005)(66556008)(66946007)(66476007)(6666004)(54906003)(7416002)(4326008)(53546011)(26005)(5660300002)(316002)(6496006)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDJpUmozL1pJcWpuZnpoRDRXNHY3ZXBXWXNWcG5mMGplQzVXQWcvVmdNdStz?=
 =?utf-8?B?NkpUa2FmTG90MG5DNUN0Szc0dy9nb2JLK3VhNGZsclJRVGgrYmtqVzY1dUlo?=
 =?utf-8?B?Z0J5Wm9RZHJ5b0wveU9kbDluNWRtY0QwWFJSZEpWYS82U1lETHg0OHdoNUR5?=
 =?utf-8?B?bklMQlhra09NakhGTkY1cFZHYVAxZk1YYTJaYzI2MktONTVnZVVqT2xpVTNx?=
 =?utf-8?B?Qk1NQ3F3eXE4NzlSUUpOUkJDN3pZZXFvblBiMk9zdjFCSWxFZzNyYjFDNDda?=
 =?utf-8?B?M0NDdkxIak9nM2F4ZGxieEo0NjVqZ1o3WWZ3eVg2R3pUazl1YWs3TTRMV212?=
 =?utf-8?B?ZllDS3drMGNaZk01dzFEc3lOVDlhQStVazFkQjNMWW1nbW9KVisxbWV2NERS?=
 =?utf-8?B?enY5SUxVOVhGVUJzeUE0UEYvd3JCaUhNOWxFeGdMOHdVOU1JaVNtT3hHVjhX?=
 =?utf-8?B?bWJmR285VDNKVXZ1c3NoZ1BtaHg3RU45emdqOVRaNkkrK3lYbGZpNEhLc2dp?=
 =?utf-8?B?S0M5UlBHR2YwRjEyVWZmRitXdTcwenB3S2hGYmdVc0Z3Wm4zNmpJNHFtQlcz?=
 =?utf-8?B?ZzRSTkUrYkFZcFR4VDlyQUVDeTRyem5OLzlKU2R1UmR2cW5CR3hLdG15Tlov?=
 =?utf-8?B?QW9KLzVKZWxubmdxSjN1TDdwdk5icEluWHByODNVTmhuQzFYcnY1Vjcxb1h1?=
 =?utf-8?B?SXpjQm8xeEpZNUxvV2pLTzJscUd1aFBTT044RUJXQ3l3R3JuSlNGSGU5a2o2?=
 =?utf-8?B?U29OWERWMk4ydEswUlpadzUydVdJRkhHdHJlN0hFa1pTT2FkdGpYR2JoY0JM?=
 =?utf-8?B?VzVNcU4yeU9OdUUxdFJkKzgvU0w3TnQ5UFI3c1ZkMWVtWmdETWxNM0MxUWcr?=
 =?utf-8?B?dGdiVTV4bmJwZEpabTJhcTBKbk9XOG9mZTdyYVhiYkZ5dmdYN0hWMWQxdVUw?=
 =?utf-8?B?cUE5dElweVdCbFNPQzQrYjBIWXRWYTJpUTJJRXoyWHVuOUFTVGd0RkZ0MlBK?=
 =?utf-8?B?N1RpWi9Mc0Q0M2RTM3VmVXJESk10ejBaOEZjRDRJZjNDSTdQd0Z1Y000VVJH?=
 =?utf-8?B?b280c04yMW9xZERJazhVbUxqUU16cDU2b1IvLzR2clBpOGxQUHl2cXFnMnJ5?=
 =?utf-8?B?Z0xUcU1YcGI0VjdnN3JGOWhOMDJ2MTB1ZThLRFBEZ3FHRXVwUnd6Si81WlZz?=
 =?utf-8?B?YUsyQWhhdFVPd05STmJ2Wkl0YjB1cFRBRDkvekxFUGkwV1BEMnhxbjRxUmo1?=
 =?utf-8?B?S2NFVjM3aTRCV3kzNDZTeEg0eVovS2JBOVBPeFpMK3JJUHhJbkhqb0s1NklR?=
 =?utf-8?B?eWx3NGUvRXdKYnU5cHdCQzdnY1NzTnZVaTlUa3hGS2VVYWRCU2MxK1lvd3Qr?=
 =?utf-8?B?b0dZdVdaQUJKWUhHeEdNNnNVbnhZbFAweVZwU3JrWXNEVmhhMjVTcjRuVEZn?=
 =?utf-8?B?cUFDdnhOSjQrbmlYTStUR3VYbFdrdVJNUm9leGlEZDdtUXpBcHFENVFLOGhJ?=
 =?utf-8?B?V1Y5di9rSXpLTFVuR1Uxd3N5Z0hzSWVpcjQ3YjQ1bkhVU0ZMV1oySWxONUZp?=
 =?utf-8?B?R3RXTzFnNTZqK2w2Q043bW9XNlJkWkdYT1RQRFZJVHdFenU1T1prMUVjQjIx?=
 =?utf-8?B?b08wazlxaGVlVk42VXBlMEtySmw2VTdISXlBUDMxaGpoTFVzblQvdGpjNldv?=
 =?utf-8?B?NStsNnM3SVBVTjR4dlp1MkU4QXhjbnpzNCtRMlU5OTBXUVpRS0pvUFlvbVN3?=
 =?utf-8?B?djNZMVdKU3lJeEtPdWR4ZjE3MmZGaDhMQzcybWM2cFlsQ0ZKa0l2cHQ0a1hK?=
 =?utf-8?B?OTJydmFyOHVmZjZxeldjVWI4S3ZMSlhrSy9qOHNaT0ZkZ1BzYkd3bHFPMWNV?=
 =?utf-8?B?TUczVDdEdTZzeldPa0ZEckpqNlRpUDlBTmZnQ2pQakJxSHpaS1k4UVA1bFB6?=
 =?utf-8?B?OFYxRHloa0RkM2hrNERJSVdwUEt1SjVEWk14VWx1b01HYlJCTkxETFF3ejdz?=
 =?utf-8?B?YWs2Z3N6RVJCSXV0NlZBNTBFenczbHdyeXJRZlBCZkhBdGlobnlnTlRwVVlW?=
 =?utf-8?B?elQ4c0NpTTNDYUFUNFhFTEVSTndlOEFlQnloN1VlQnFhbWxxQTZLUS9JLy9V?=
 =?utf-8?B?R1l5WmhYOG4yQmdOaGpocEFQdC9pdisycnB3RE1rV2xsVFBOaC84SmpibFlQ?=
 =?utf-8?Q?YRgXojLYBOfLggg36H5502s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19289efa-efa8-4b88-73a9-08d9ab6829b1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 14:23:31.5443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXZGMS61FgAziwiBZszxs7otMgucdgfOuCBeimkEYcsGHyt/r+J4ElwXQFKUHwTNxgfaXxrSXP6L1WFFAyOLIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com

On Fri, Nov 19, 2021 at 02:56:12PM +0100, Jan Beulich wrote:
> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > 
> > Hi, all!
> > 
> > This patch series is focusing on vPCI and adds support for non-identity
> > PCI BAR mappings which is required while passing through a PCI device to
> > a guest. The highlights are:
> > 
> > - Add relevant vpci register handlers when assigning PCI device to a domain
> >   and remove those when de-assigning. This allows having different
> >   handlers for different domains, e.g. hwdom and other guests.
> > 
> > - Emulate guest BAR register values based on physical BAR values.
> >   This allows creating a guest view of the registers and emulates
> >   size and properties probe as it is done during PCI device enumeration by
> >   the guest.
> > 
> > - Instead of handling a single range set, that contains all the memory
> >   regions of all the BARs and ROM, have them per BAR.
> > 
> > - Take into account guest's BAR view and program its p2m accordingly:
> >   gfn is guest's view of the BAR and mfn is the physical BAR value as set
> >   up by the host bridge in the hardware domain.
> >   This way hardware doamin sees physical BAR values and guest sees
> >   emulated ones.
> > 
> > The series also adds support for virtual PCI bus topology for guests:
> >  - We emulate a single host bridge for the guest, so segment is always 0.
> >  - The implementation is limited to 32 devices which are allowed on
> >    a single PCI bus.
> >  - The virtual bus number is set to 0, so virtual devices are seen
> >    as embedded endpoints behind the root complex.
> > 
> > The series was also tested on:
> >  - x86 PVH Dom0 and doesn't break it.
> >  - x86 HVM with PCI passthrough to DomU and doesn't break it.
> > 
> > Thank you,
> > Oleksandr
> > 
> > Oleksandr Andrushchenko (11):
> >   vpci: fix function attributes for vpci_process_pending
> >   vpci: cancel pending map/unmap on vpci removal
> >   vpci: make vpci registers removal a dedicated function
> >   vpci: add hooks for PCI device assign/de-assign
> >   vpci/header: implement guest BAR register handlers
> >   vpci/header: handle p2m range sets per BAR
> >   vpci/header: program p2m with guest BAR view
> >   vpci/header: emulate PCI_COMMAND register for guests
> >   vpci/header: reset the command register when adding devices
> >   vpci: add initial support for virtual PCI bus topology
> >   xen/arm: translate virtual PCI bus topology for guests
> 
> If I'm not mistaken by the end of this series a guest can access a
> device handed to it. I couldn't find anything dealing with the
> uses of vpci_{read,write}_hw() and vpci_hw_{read,write}*() to cover
> config registers not covered by registered handlers. IMO this should
> happen before patch 5: Before any handlers get registered the view a
> guest would have would be all ones no matter which register it
> accesses. Handler registration would then "punch holes" into this
> "curtain", as opposed to Dom0, where handler registration hides
> previously visible raw hardware registers.

FWIW, I've also raised the same concern in a different thread:

https://lore.kernel.org/xen-devel/YYD7VmDGKJRkid4a@Air-de-Roger/

It seems like this is future work, but unless such a model is
implemented vPCI cannot be used for guest passthrough.

I'm fine with doing it in a separate series, but needs to be kept in
mind.

Regards, Roger.

