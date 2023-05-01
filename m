Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B06F2FEF
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 11:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527994.820559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptQ3L-0002HX-E2; Mon, 01 May 2023 09:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527994.820559; Mon, 01 May 2023 09:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptQ3L-0002Fh-AD; Mon, 01 May 2023 09:42:39 +0000
Received: by outflank-mailman (input) for mailman id 527994;
 Mon, 01 May 2023 09:42:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ExGp=AW=citrix.com=prvs=4789cc51e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ptQ3J-0002Fb-CX
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 09:42:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eca9566-e804-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 11:42:34 +0200 (CEST)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 May 2023 05:42:23 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5357.namprd03.prod.outlook.com (2603:10b6:208:1e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 09:42:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 09:42:18 +0000
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
X-Inumbo-ID: 7eca9566-e804-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682934154;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=TNw1JkG/WJ6X19gEA6XgkNzFyZFAGhk3BSAduUwCFLA=;
  b=OUygsJlZb2OGP34PelYcMqv62nQgyVIorh7WCyjJTcgS30QZjGxa8gIa
   D35G8qephknyB/ZhuMxkgs3N5jEUKGLbTgL1K85uF4DpWI8uKrV6BY55y
   IYrHmmuuykJpFsGLeHi86uEXRxmerzT/zbJbts7s/NIjLqbQR5cZVe9jh
   0=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 107315830
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LefeaqM23laoNljvrR2JlsFynXyQoLVcMsEvi/4bfWQNrUog1TADn
 GMdCmiBO/uDNDT3fI0jYdyz9U5VuJPQnIMxTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tE5QRmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uMmHktC9
 PgWFGwUYErEuaW28pGaTeY506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/Rxvzi7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXwniiBdJJTNVU8NZTg1ap/DIDSyFGTEqhn9ap1HeFA5F2f
 hl8Fi0G6PJaGFaQZtz0RRixunOHlh8aRdtLEuc+5R2Ny6zb+AKQDC4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkAowXQqYCYFSU4A/IPlqYRq1BbXFI4/QOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAuTA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:1RlYg6kaLAPRKYGHzhHrmyUxfj3pDfNMiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5VoMkmskaKdhrNhR4tKPTOWw1dASbsP0WKM+UyCJ8STzJ8l6U
 4kSdkHNDSSNykEsS+Z2mmF+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbzpzfHcGIzWuSaBJdq
 Z1saF81kedkDksH7KGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu1Xh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboX0Twk6n7WXdrWrooMT/Sj5/I81dhbhBeh+cz0Y7ptlz3I
 9Cwmrc7vNsfFv9tRW4w+KNewBhl0Kyr3ZnuekPj0ZHWY9bTLNKt4QQ8G5cDZ9FNiPn74IMFv
 VoEajnlb9rWGLfS0qcknhkwdSqUHh2NhCaQnIassjQ6DRSlGAR9Tps+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQM8cXMqeEAX2MFzxGVPXBW6iOLAMOnrLpZKyyq4y/vuWdJsBy4Z3sI
 jdUWlfqXU5dyvVeIKzNaVwg1DwqViGLHfQIpk03ek6hlS8fsumDcS7ciFuryP6yM9vR/EyWJ
 6ISeBr6rHYXC/T8L1yrn3DsqlpWAcjufIuy6cGsnK107b2w97Rx5vmWceWAobROhAZfU66Kk
 c/fVHIVbZ9BwaQKzLFvCQ=
X-Talos-CUID: 9a23:NvnFq2Hwf08Fi97pqmJipVE+FsEhfEGB1XmKZHH/CVRKabqaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A/r2sqg/3KID5L3VsUU3pQtqQf/5r6J6UVlBOrcU?=
 =?us-ascii?q?fqtO6GjwuAgzFzx3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,239,1677560400"; 
   d="scan'208";a="107315830"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXzP6HIFMQPBp74qp/G4GHvduk45yOCKN9kVp+vTZTP2WVRSelQeKaBsfzA88usjBXjMRW6WK/8He/i5XPp19ncpljmTmaMbsiYEGXzAJXQk97Fh6+s1dz2eb70fe9FS3Yu7eAanGQTfHKJdPybhJWTvD/3TqhgtFhzo6yLySZSqDn+JitjBJjPaTy70tq/U6Rf1+xoG+Z//cFd1wAZLofS4XckGzpIqVsXkc64AITY/iP7dBonPlzoHMC5QwOlnODZlieNozzylsuJcpwz505f3sxHfgv5b2IirduOx7NLG2EkOGTe3RQDnjBiNHOSA1OXiadkcv7/f0oo50Ivgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PXg4EtINe7QjykmwunbB7ueYRJ0hS8xhvdoz9Z7xrA=;
 b=ZND+0D7vGQ4pwQtCuPIBqX+fRuvS3lOb5vGkpsk0UN35ofLrSvte8LIg26UP6odQCajvxgbj4mCXAg2zskjQ95vSyfYQ3CFcsGXn/OJ7K6IYc37kc+1QTuDREh98b0G4YRSJZCRLhtV0KIghhUM9yRpNVTm87SWLqsW+awm84fmKQbpNjT8KRba4zBggzdYphqRVxRtKsMJYP6D1tWh/AHdRLLXEVN4cfAfNI48Zt6gXm7i4o+b36DdCI5F42sIG3R64xmPxmcmNDofaxGI4nQtDP4MjJVaFaO2Ok9GJv7CDSMYfvjcs1MwxPjtDhZJIy0TE6+Iw+KDetvP57Jun2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PXg4EtINe7QjykmwunbB7ueYRJ0hS8xhvdoz9Z7xrA=;
 b=e2Luj439KGL8n+PQTY3QGsLZ0GtiA+hONQMbyn5XxUGAnJo440qnyhQ+LaeLaIC60IlSvRswlAUVARH4Z9BLiOFknr0pbPOVPDYKq/BOGFYzmLAiNUymoKVW7YvG+SqGxHpYc/ZxdcFjlvpo1CiIGAuw7SdjQlH0f+SrWVixUEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5b17e7c8-3c52-799f-f995-73b3b30ee5ad@citrix.com>
Date: Mon, 1 May 2023 10:42:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/2] automation: optimize build jobs order
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.ff073811df470285fc1011952c6cc28e9e77607e.1682894502.git-series.marmarek@invisiblethingslab.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <cover.ff073811df470285fc1011952c6cc28e9e77607e.1682894502.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0157.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5357:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bbad587-85e4-4a41-4b2c-08db4a285a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6F0Fgp40QCF8U47O73UbS1fKAca3kFpqyAiCjS0+kpLxpl4K102WiAh3dLPov5mitMW3c0k+vDL+ArZwUeQh4kYgYCBssuqQ2rdgkYqYRCuSs0lcOnnOyAuLBd16UYLcaZipsdW1XzzweOP7kNjS+zSaz8JO5DRrOOhjT2wx0AzBdMJRwjyuev1suXlX5thhKOldZNj4eJ+h/EAEpyfsu6L6dPTefDAiyWv0Z9VtCLbsxKbatSLAAcvoEro+CD+HLKniMXtmvf2Sgylom5i4zZuN8k8Hs286oYlgehh/fal89e+bEsvvUlrE19SYd3v4z5FotmJIMPHWC227cFCGDj7ragXz3AhyURYA8s2TxN7n7Oqw+UbNTkhE5QZwprJbL1qyY6M64jVhxUc6OJ+xR/oGZ467ApUHlRVzsC8MyHJEMaDz/bdkHK42exnEafvspn6Yqd6eHoGjJ4d5NDTbdMshRmSJCPyB7TaOcD/Jr/5TWZpCTx0QKEKAal6GDwN8qcEkDowoxFJB6NHF2P/7sjIGpJN+GezQ99OViSDE247bleBY8PTt70+O4mXaUoGEUI6LRHWIVHtcA1944DNe8+riSwo/CnOTJjPWg0EZYZNmPNW27kcvU33WPGinRyhI5BHVlCQzxG7NrC8caac4VA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199021)(31686004)(31696002)(86362001)(36756003)(82960400001)(38100700002)(66574015)(83380400001)(2616005)(6512007)(6506007)(26005)(186003)(53546011)(6486002)(6666004)(478600001)(66946007)(66476007)(66556008)(41300700001)(8936002)(316002)(8676002)(5660300002)(4744005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXFCMWNKYng3STV5NmlXcks3OUZHcTdJSUFiRk1ZWEdIZ0VZbGlrVFdCMmVp?=
 =?utf-8?B?Und0N2VFY2pDNUIwN0x4ZFgyRWhINGl3cXFUZVg5UFV6Vm1UdWcwTDFPM0lw?=
 =?utf-8?B?T1d5a1NrcGRSSWUvL3kzbTY2UkVCS1pLRGlodGxFaUVQU3VZODFzSzRGVUlk?=
 =?utf-8?B?K2R3NlRUcWxLZ1dKd2IzckoyUU5KT2hleUg2aHJlQ3VCdXQ4Y1RoK21uQTg4?=
 =?utf-8?B?L1k1Z2lQeE5xcGk5S2w1bnhVbE5oNHpvaXJxWTN0TVBFaUJPeUhYRlVOZ3BK?=
 =?utf-8?B?V21lQnVmZVZhMk9iR0Y0N3BXZ1QvaHdjSXpSczZWVlpLbUZSWVZGMDV1RVdN?=
 =?utf-8?B?Y2Z5b1V6NDd2b29IYWNpaVdpNjhYYWtlcXA2SksxMS9aNUFkZWlMdUFlSm5W?=
 =?utf-8?B?a1hBKzQrWXdjMU5WSFlUQnYrSFN4MTRaOUY2cFJONUJTMFBhVE5sZlZ4S2s5?=
 =?utf-8?B?WnZYZm1LRERQa0MraXpnenphbFB4QWFDekVwU1JoS1duTXlLdE1OMFZxNkZQ?=
 =?utf-8?B?SmdSdVVmUVZnb1J2UHRnTW5aRGcvdFlSay84b1BWa2NEeFcxVjYwZ2owNHB1?=
 =?utf-8?B?VDZyQzFHcGxQanZ0YnpRam9IaUh6STFrOGd1ZkVRNlNRcDVudHp3RVE1SjJk?=
 =?utf-8?B?WHJOM1RRM2ZQUmgyemlrV1lIUlJjd0VTS1Y0SHg2QTErenZvdFRkSkNad3hI?=
 =?utf-8?B?WUNMQXJmQUc1WmhnRjRGVCtCWllaY1UzcksvanJORkVpNFdDS3o2eDI2NDJY?=
 =?utf-8?B?VEJVdENGUnp5TzlTR3kyV01YV040bWwwV0h4UWpwOU0zcHJCeEJFLzdoWXl5?=
 =?utf-8?B?cjVqcmhNVVBTQW9FSCtBOE0xVEEvQjNyTDIxTElJNkZMbTdnWDlDa3ZxeTdZ?=
 =?utf-8?B?SXFCcGNsRDBaMk9Gb2hhZVlMZlZmMHd5eVVuMHB2QXVsVFhjcFFpZWIrb0Y4?=
 =?utf-8?B?bkpsV3p3bVFEbGpqcFFySWVpMTgxVUdmMXIxM0VlNm9lc2RwN3BySGlzOXFu?=
 =?utf-8?B?T2IzOTFKdWZjY0NDUXpvZXMvcmlmbnI0RVpkME1tdlNRQnozUmQ5YzZZeDI4?=
 =?utf-8?B?NitqVTFNQzIyWXk2dStoV0xJVnBFUm8yM0svWHJjb0pmWE1nWHA3ZU9lMnR2?=
 =?utf-8?B?OWdCTnpnSnY5SnhSTTVkekVFZmh3UVU0MkVYbWJFbFNZTDJwRDE0LzB1aXUz?=
 =?utf-8?B?c0x6RFh3aU0ybGhYY0dTdE1hdWpaRHFzdGF0a09KSGVOd2VNWE5aTXlUL0h3?=
 =?utf-8?B?bGVMUmRuUlZEZFdmNnFVM1hpeUFpeGlHNmpBME0vZlVUVWF4Nk45bnhmL2Nx?=
 =?utf-8?B?SHB1ZW1QazAySVB3OVFBQzFwdWo0V2ZETlJ0dWR3RHFTVmxLbzBrTzJ4RWFj?=
 =?utf-8?B?YkxVZnNYQUl6RS9sK3krZWFaNmRlekZWUUFEVDlzc0QvUVZBakxyNzg0b3JL?=
 =?utf-8?B?MVlyVGdPTEl6VzUrMHcrdnpibzBpcnpsQVUwMVZ0TDhhRXpvaVJob1RHYUZE?=
 =?utf-8?B?YUFoOWV4U3FjblhNVnBQb2hmRkRVd1Z2ODNQL3hWN3Q3ZkZNaWFLNWZhWjlV?=
 =?utf-8?B?M0w0ekhoVTI0aFZNdC9GYWNVbWtBWjRWUUcvYi9Wdmd2Q2RQSklDNXVNV1RL?=
 =?utf-8?B?bXJWSTZNeXErY1JGdHVaNkdNR09QeEdOV1gwQ1BSOWNVWW0wUTFrNHlPZWFk?=
 =?utf-8?B?MmJDQlhYeGxZYnE5Z0xlREtmUHN3cXRub2F5MUNqaVI5MGNnc0xLYU5NNi95?=
 =?utf-8?B?WGlEYXZxOHhjeXhvOElweDlvWVRxclJxV0RSdlRyNEh1L0pJT2hNTjI3ZVRk?=
 =?utf-8?B?OE1PZk85NVBRTUlZZ2hpVGp4Ry96VDBzUkJtR2NBdmVpcXBSOGRpcTViTjNw?=
 =?utf-8?B?MnkwakFRYTZKc2dQS25TVTliSE54UWU0azVMQmxuQjY1amlXOWlnYzR6ZGlr?=
 =?utf-8?B?TGtiYVRMMEVtay9wWFdVNlBxaEVVd1hXRFN2TEhLSmVZaFZaY1B6U0pHMmxI?=
 =?utf-8?B?eG5MVUluNWVMZEllNm1SRHJGTnpEaHI5eEJ1R1JJcURPTWtuamFuM2xOaVpY?=
 =?utf-8?B?N0JJVEFCY3hHaGY1TlZhdExrbUdwRktpeFErcVB6U3dJZ1N0NTREdjRpckUy?=
 =?utf-8?B?RVR0Y3k3a1hCcW1DT2tPVTd3d2hOcTNaUFNhT25MWFNzWHVYOXA3SDlGa1hN?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j9os9VWauS7GfRIUZpNWEDhvWvgiHrwXCNS6CsZRXi0HW+Zy7/QPKsgmywoJbqpXMIE//tprJyEkGomJA8j6gcgZexWHCUiCQpsXQWUvbpkCkigH7r3SZKqX/Js5osJuNIBeFliRexiYt5kq14glWChi0AdrWMa2ctkQaNkcJ+wleCmTmY1eAyX/IvoCssFFcBlptIBR3vXHWBVuW/haHooPPuhXGkwsSkwVQZ0c4YYgd5OiAwzRipCDyyX30TkRRsqYDo8AXzpq5NcYux+nxCLILyZcejdno19GJGD3wGOj/DA4ClsMxMJoclgo9BlxOhm+2s5ACSktudwCID8UlaqBD8Ei5baHSXTnKYcsA/Ayijd8/PHaOc1hwX0HyxrC4OZAxYnofHdIr32aFW5szP57MxJAUGbU0XZ9rf3UQr6FRkLvvGrkeOChSyK1sZ9f+LBiqwzQYAOQ2vxTRxBLL8D1lFPxZnFZiKDCpA8RYiyAWDTQKaLnX5ncOe94xALt8Gca/czUp5nm7CjVChX16vp6Mf54fyrd0QF6EFSzirPZa5nV9PhsUFi9LJ/fmyKc/HxJH+BTQqqJc2/mwPB0ekfFTMCcYZ0s4OJUuytylhA5TRRriat6OcqB1ud4wX0EvMoEZlIEANX8tO/nKm/cyYZiY6OgT1d5u6DIVQQEaOzzjdtIZouOkSyWeVWMOiJuwki6EZ2T76KQyfLlr6svQd9k7wCPKrxCPzK4A9q+CAR/kjq/VnIf4Y/gy/h/OWNGYnzZuc8MK2amOm3LQYVQGcdsNUT06yFAK7N7RG2HVVr0AanqAez9MmuXH1A9Js/AijteJstDf9G/6H1Vdov3cQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbad587-85e4-4a41-4b2c-08db4a285a51
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 09:42:18.4194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cw7dsPwLTS2lwrO4RnOjQ8NcOEmMfAs6z3RJHeE1R2yWzaSbMS1ZD3o2++mQaqv03dWML/rF2hopjHuzvu4+qdHFucOLD4oow4jdPmvCItk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5357

On 30/04/2023 11:42 pm, Marek Marczykowski-Górecki wrote:
> This made the pipeline to complete within 45 minutes. This isn't big
> improvement on its own, but should make adding more runners more
> beneficial. While looking at it in real time, most jobs were really
> waiting for available runners and not stuck on dependencies anymore.
>
> Marek Marczykowski-Górecki (2):
>   automation: move test artifacts jobs to the top
>   automation: optimize build jobs order

Much easier to follow.  Thanks.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

