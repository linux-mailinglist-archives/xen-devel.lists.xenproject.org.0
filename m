Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7626BE3DB
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 09:38:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510931.789513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5bC-0004En-1W; Fri, 17 Mar 2023 08:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510931.789513; Fri, 17 Mar 2023 08:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5bB-0004CH-UV; Fri, 17 Mar 2023 08:38:05 +0000
Received: by outflank-mailman (input) for mailman id 510931;
 Fri, 17 Mar 2023 08:38:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=001K=7J=citrix.com=prvs=433d55c46=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pd5b9-0004C9-RZ
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 08:38:04 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 054ea31a-c49f-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 09:38:00 +0100 (CET)
Received: from mail-dm3nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 04:37:39 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS7PR03MB5512.namprd03.prod.outlook.com (2603:10b6:5:2c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 08:37:35 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Fri, 17 Mar 2023
 08:37:34 +0000
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
X-Inumbo-ID: 054ea31a-c49f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679042280;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1aa/bsn6uFWAnot3MneG2CCvIx24wvKDwsDFiNJJU54=;
  b=WVmYpiL34cXnN0u7wAuHTBEaHDWFzSKgagmW4rq6XQ/rRkdMN3JX9nqc
   J3tt67qNuFzabOL/AOuzC2icGkfkiElwkJvO4jynq52euyaN//qrH7y9X
   ThihserkTvHpisj43/tGCMvJDxnU/Je8YPt6HltMqMoZoECFECHxAFcxn
   Q=;
X-IronPort-RemoteIP: 104.47.56.45
X-IronPort-MID: 103654892
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WVeC7K0FqaN5Hep/vPbD5RRwkn2cJEfYwER7XKvMYLTBsI5bp2dTm
 zcZW2jXPviIYjGnLdp1Pdy/80kHsZ/cx4JkSVA4pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdnOqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfKn9Xp
 KIUIgI3aRWu3bmc5b2ecrU2mZF2RCXrFNt3VnBI6xj8VaxjbbWYBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6PkWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03bGSwXOqAur+EpWGx/4xunCR41cKSycyfF+wm8Kdp0ihDoc3x
 0s8v3BGQbIJ3HKsSt7xThipukmutxQXW8dTO+Ai4QTLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313pCQoDCpMC4ZN1grYyMeUBAF6NnupoI0ph/XR9MlG6mw5uAZAhn1y
 jGO6SQ73LMaiJZR073hpQyaxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTRGo3hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:XYg0ZaCUKqReGpzlHela55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZImPHrP4gr5N0tOpTntAse9qDbnhPxICOoqTNCftWvdyQiVxehZhOOP/9SjIVyaygc078
 xdmsNFebnN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="103654892"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3YB8cR+vVT7YtyDOQdVtsoQlkOTpNJ7mSzBp9ngV1P1jnV6R43T05y92wFbYHzcNa5xFOXQn04mL7M2honowyGyzfeJnzTGIoYnGUIAB6hRrscETKJWP6PWpi1U4zJQILRXSxd3mgkUeF9tzPEZT0tfQISC08WzZbjHc20TnzwK2ciRa9SuX8gES3ElTwiLHYbxalVZEnUYf+jiE3hg9cuBZtiXUlcpWPifuyiVTMeK3jpOALFwAgmK/SVX6mKodmOdb6OCnD411GsYZvlXrCLsErv8pMctKqyw0RuGXj5nPuyYw/8rTl9ZvRlMS7EISRFgjYhTvvPVhprcOKqdzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FpPXZMCHVJOCib70klz0c/5VZXO7Wnp1cmr/VKjJuM=;
 b=QRrE4q40Wd0cTE0/E4s1ukURofB+fqkj+5inRiOn66fmROtrFRbGxBvQkL/PXZlIUiuCPR9NXuXqVdygQ1Rx6hRv8i1ufvOiQOQg+frA0UCQGxXiM4wnYbdTkeVbmZmRSesX38t8/9Y5IP4X8exCVHmkCsIQOmt+3L6TYYwk7i3yEyMxJO7Yytyn3BB2XLrTgGSlDhML86dI0k+qgEx2RrDPoCMB6fGcmilf+hJ3fQVnLMiIlfSunlosVtcrnY8jkCFJb83oMfVBUFdeo2H6fXzXZUK0H/WANROTEXV+JRa+v8BQ8a5JWmnnyJ8Jyk9dG/bq2wCyKqlPpO0HjH022w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FpPXZMCHVJOCib70klz0c/5VZXO7Wnp1cmr/VKjJuM=;
 b=GHtOpBDLrMC/gRia5tYd4/hvBn6M0qQssfawyDiA/gs8d5ZTfvtIMUC9P06IrUqpdyN4MIZIN4hp+Pzb4mHdDC0E48GCZUYvykf05qTE/x2Sbrk1hudVrN+i0c9Vq1/S9/btHOFKQJChqPKEcI0nX3+c6+TMtRBo0j4pR+Ojfmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Mar 2023 09:37:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 4/6] vpci: restrict unhandled read/write operations
 for guests
Message-ID: <ZBQmyGCLG6OMFkUt@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230314205612.3703668-5-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P265CA0199.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS7PR03MB5512:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5a5885-ac10-45ad-2eaa-08db26c2dae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LD7t0PJU5rwkVruG177DDSHhSNUIs5s58IgZRRjNzjveqNW+ujU6RYlVwJZWn9Lb5znkqVg81Mbmd3rcgzmNDHNopRADh3amv+1SgRlMcQSWVXpIX7PX32pFAonKUnjXw/IzU74FH64/vIoV3RjZrxcP0yOnudctOveS0g2DLLzder/ill134Iu4OPVSzCYU7T2wChMunkBSI8lLO2vL/XHIysZETHYK+qDfGD5OAfDIcAa+MKqMeetgh6Jrtpp8ZOh0QI3qVRLQRembWegJXo977bk4ONZ9sX+LYim9+9aejQJ0z8/EgY4bsI2vgpsQ1t8QZsHjOxc6Vj7yRaxGxlBlucrSjNkxE1a391kPuF4HB2vIdtrTVNOoC1mEwptbqc57X3YkwYKLHWqk4t3AAEZZX/dnYslTzLDIQ6xfSFY+5PZkU15HZLuRTveHn3hHe1A8g/LBYeqQS3W7byYTNHdiFwpSog0LTIEdl2McuOm05NGf3gRYPk3MqetYi9KXtJVkDtFQGYzUbyR/lEb4AmqiPl2SmG9DMlD3B/4Yd2lqTDG9mUD0lT1Z/ZmaJ3AzTTFk02v39etb71+M/zAii9OgW97M5XDGxx+uEXgEWB5yFosWPYH7LA1FEP4KK3feiMPCHTvympxbB7+qJFGPQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199018)(186003)(6512007)(6506007)(6666004)(6486002)(83380400001)(316002)(26005)(9686003)(54906003)(6916009)(8676002)(66476007)(4326008)(66946007)(66556008)(478600001)(41300700001)(5660300002)(8936002)(2906002)(82960400001)(38100700002)(33716001)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDgzTWFkVlVnYmlGelNFMFdQU2FGeUNHZFo4K2RtcVZpbzVRejdlbFE0UDJP?=
 =?utf-8?B?UjNtMmdDa0dTa1VqTkhob04zbjRSMndyQlVaVTY1WUVNV3JZWjJqTzA4ZGRj?=
 =?utf-8?B?YWd1OG9QVEpYWUxWUFRUa0xTLzVLVXZpVExYMjVVM3FuN1JkR1VIcDhHLzFn?=
 =?utf-8?B?aU9hSkNTRlZNY3lORDhVaWZCb3BYQ2dRNmpQemlKb2JUVTlRblZldmRKS3N2?=
 =?utf-8?B?R3owN1RYNnkvK2xXcEZBVys0Z1VKTW1YMGhLY1BiNXFYK3F1eVh6RW5nOUdJ?=
 =?utf-8?B?Z2lxMEJjMkgxNUQya0lLU3BEekg4SUo2SW1hRTUyN3B6T09FOEF1emtsZHFh?=
 =?utf-8?B?V0VjSXNQTW1lOTJPMXdZRkQrY3VScDFUa1ZxNlZUSWFQVC81M2NROW1Sd3V2?=
 =?utf-8?B?Yi9IRDJ5MXVjMXhVdVFEOFZHWlRVaWpSajBkclQrQTd5UzF5anU5Nm94MFdy?=
 =?utf-8?B?b1YrNHp0T2VFWUsyWlVGQTVWUDgwbEM0OWtOZk1zd0ROQnZ2cEE1RlJiRnNh?=
 =?utf-8?B?UDlWaU1wNDYzNTRwS1dpeWNRV0JzbXBVUkFDNW9TeWhvWXl0WVd4RjR6Ullp?=
 =?utf-8?B?VEk4VDRLclRiOGxYWG80MXp6Y0ROVWlNbHUwMU9CQUtnUzBuSjVLdjBDbUI5?=
 =?utf-8?B?V1diYklMWU5WK2pHZ3VJc1o3MHJBNGNhOEZNcE9Ta3VrL3VuNUFwN29BMGNK?=
 =?utf-8?B?Y2kzR0FtSFJSUWRWMW0zMmN5MnlGejBEZCtEbzFtL0ZHMUtuZlp2UTFPNUs4?=
 =?utf-8?B?UkxJazF0eHRFc1BxUWs2dnBhNXJmYmtySGNSdlNlM1orRTEzZmZQN09WMGxU?=
 =?utf-8?B?OHorYlA1K1ZGQmtoaDVyN1BGK0VPczFtK0VNRStUVkU4MGxTcmFxWUNHL2Nj?=
 =?utf-8?B?RFNuWjluc3NVTzNPR243cGJJVE5EMis3NGUzcHhuUmxvNElXYTFKOFQxSG9i?=
 =?utf-8?B?SzdXTk1QcHFiSnIvbU1md0plaGNtR3RlYnU0MFJMRGJMUHpONU90aGEzTjQ1?=
 =?utf-8?B?b2VQVG5lVVBXbXhVVGkzNzRpN1k1OU5ZeWtsTnRDUFJHTkVyWmQ3VHN3VW5S?=
 =?utf-8?B?QW51dWo1K055UnAweDhpZmFWZHZsazBFSTZ0Znd6anNGOHJsSnBqbmo2SURO?=
 =?utf-8?B?RHlCZDRJcytVSVlpdGR4OHJFeWp2VEx0L0ZDNlBCeUxBSTI1ejBqZDZlZ1F1?=
 =?utf-8?B?L1BlUDh5RGhJU1V1U2kydVc3VWRYemVGekVlREJlaWEwSU81V1hOYnlaTnlF?=
 =?utf-8?B?T1lrWGEzQzJmRmZ1UDVPN2grY0xUVTd5M2FpYS9ldHJGdEo2dkxYc2FtWkFn?=
 =?utf-8?B?a3JFWXg1R3VmdjVrUUFuTFQzMkp3NGp5Rm9YS01GRHdFUEZnVzNYSEdZMnRq?=
 =?utf-8?B?cTJndHJ6Y29ER3hNT0lUY1piZDRnSWdsVm1VV05hQzdWSHFacEJONFFUM2oy?=
 =?utf-8?B?U2dXa2lCTzlhVWJxcG1JYlZkZzZSL1J3UTBSUThCYmlxZ2tOZnJ1K3FvSHVF?=
 =?utf-8?B?OHVYOXVNb1d1MnFJTm4rMklqWnhjU0MvREgrSXZwTVJEcUpHWHprd0lsMWdV?=
 =?utf-8?B?MW52RzdISnB4cHhMQWl1YUI3cUF2b2FmUHNaeVhOYlpDTGtYL1NjVmxySGNl?=
 =?utf-8?B?WTFSWE4zZnVEK0pGNWpIelk5S0s2eC8rK2ZSWnJyVHQ0VWtmaC95RURaZzRK?=
 =?utf-8?B?Tkx3V2p1Z09aamJSL2hhN1VYUFUyWTc2bE1jTDRtNEQxWFBMcVBrT3YrMzBF?=
 =?utf-8?B?cU84UDg2TW9nRG56RldWMlhhNFJEelZTYStJMklteVBoQkFoejVjSHZSbXln?=
 =?utf-8?B?anBmcTRabzBTb2hRRWR4dmcyV3FPTlpkYk5LT3p0Y2RZRnlmYzBLTlp5Tndt?=
 =?utf-8?B?V0sxdEpXUnpJUTd0ZE41YW8zOUlqVzVTLzlJMFQ3Wkd2dUV2eGh2c1hBVUNw?=
 =?utf-8?B?Qk9DL2gxTnlneW9nYnNkVUl0NnlOMkFvbWRORmVZMFV0N1FRaktqWFNVOG1i?=
 =?utf-8?B?M3ZLNG9WYzFDR1RtTFdFQU5CNStrbXRZUXMzSno0eFhZYk9JcnNkL21lT1RX?=
 =?utf-8?B?dVZsNUhyYWJQVEJ0T0pqbUhqejk3ZnFZTVpaa214MW5UWklDN2gvYmgyN0Nz?=
 =?utf-8?B?aTdJVmR3YjE2RkU3K0JWaUlDRzRuTTlxM2wxdnExM2JPS1BacUlYK3h5Z2pl?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Sci9ZHFkpMh38y8J/QHCTo9iBTSMz8dwBGVIwcp4wPBqZy/RWv6F4JqCa7vs2qF2zBsTSjJFrPnb7z19Stro1AkhTozzPeKF5zVq1Zf2KXl4yRjLpd2uY09AzK1xmW9aRrp4d+L3WH4YPEFsdyuAsPWK0215QpVq1x0nzNAw6pcErWt0wNK7lxSf4jJNb3xy/rLakydRecVIsafnqx7ttCQCDqmojf+3+8pZsKSiLuofXailKVLpJQ/vwLz801K1cbrV2bM5RT9+YeOT+yMMWCOir2vdAGJIFgQS++lBZynfL2O9Lnj6eMjtxZ8EbGRkW+LtGrKwda1KyXRCcyt9/wuDG+UXpKchLZRollHqn04iSeNYgn5nzQib00iRYWxp3Ic0JWX+ikkzHMrNnWxN3xtx6QPzoiMFQROtYKjCN2YRW5RBJuqfRabCV7ol5ZhRCTNsJ/GSQMvEuI1gDw0NHdK/8elwY6TncYarRvG0QiFOxR58c9cJYSmXb/tN/dtB1LedkF5eXXbtCdNjrpRNpKlnhVG7ERZvjoadcPHv2UfE4/gbzDo8G3aJChC6flSLvyB1uqaM+vYidQuGyTaA8znfvdUYM0bcTBEeqyNIjKqvPqayN7/z09SfM7YZNHNEBnkPi0mFlj+3t7nHRauGY0zAF5TlJzw9tpOe6KjifooXpnJ96wkF5ySFkjBhrshBVHJDvSCwgO1vDdwPp4yTSyLOwx6jNSdsKOv+avzMrP8dH0xwWgrCc4pqKqu3C0jg8Tpu+0sUYtFs7aI0XbsTndFn8dIcZVpmXobfpUsIaFE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5a5885-ac10-45ad-2eaa-08db26c2dae9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 08:37:34.4422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CG5H1ZEnCF8ufI5Hlu6VyRO4Zh2hrokhCEiiRZ2qysuzvE419bHhbouvoBGNFwVF89ig1GJij0lJnlbV5Nb2Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5512

On Tue, Mar 14, 2023 at 08:56:30PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> A guest would be able to read and write those registers which are not
> emulated and have no respective vPCI handlers, so it will be possible
> for it to access the hardware directly.
> In order to prevent a guest from reads and writes from/to the unhandled
> registers make sure only hardware domain can access the hardware directly
> and restrict guests from doing so.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> 
> v3:
>  - No changes
> 
> Older comments from another series:
> 
> Since v6:
> - do not use is_hwdom parameter for vpci_{read|write}_hw and use
>   current->domain internally
> - update commit message
> New in v6
> Moved into another series
> ---
>  xen/drivers/vpci/vpci.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 5232f9605b..199ff55672 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -220,6 +220,10 @@ static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
>  {
>      uint32_t data;
>  
> +    /* Guest domains are not allowed to read real hardware. */
> +    if ( !is_hardware_domain(current->domain) )
> +        return ~(uint32_t)0;
> +
>      switch ( size )
>      {
>      case 4:
> @@ -260,9 +264,13 @@ static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
>      return data;
>  }
>  
> -static void vpci_write_hw(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
> -                          uint32_t data)
> +static void vpci_write_hw(pci_sbdf_t sbdf, unsigned int reg,
> +                          unsigned int size, uint32_t data)

Unrelated change? The parameter list doesn't go over 80 characters so
this rearranging is not necessary, and in any case should be done in a
separate commit or at least mentioned in the commit log.

>  {
> +    /* Guest domains are not allowed to write real hardware. */

I would maybe write this as:

"Unprivileged domain are not allowed unhandled accesses to the config
space."

But that's mostly a nit, and would also apply to the comment in
vpci_read_hw().

Thanks, Roger.

