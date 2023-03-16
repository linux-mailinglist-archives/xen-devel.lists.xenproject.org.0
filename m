Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F786BC2E1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 01:37:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510276.787650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcbcZ-00047w-Ty; Thu, 16 Mar 2023 00:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510276.787650; Thu, 16 Mar 2023 00:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcbcZ-00045i-QP; Thu, 16 Mar 2023 00:37:31 +0000
Received: by outflank-mailman (input) for mailman id 510276;
 Thu, 16 Mar 2023 00:37:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZp/=7I=citrix.com=prvs=432965e83=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcbcY-00045a-Dj
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 00:37:30 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9ee1e9f-c392-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 01:37:28 +0100 (CET)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 20:37:21 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by DS7PR03MB5639.namprd03.prod.outlook.com (2603:10b6:5:2c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 00:37:20 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5655:5504:ff73:814]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5655:5504:ff73:814%3]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 00:37:19 +0000
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
X-Inumbo-ID: b9ee1e9f-c392-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678927048;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IdIBInz1m2QTYlk6DrxxuObPcjDGJc34lmvC/ufwO9U=;
  b=SvPH9pXHv64b8z8bAjoYhUka4CWde5vCsM1yGPjEw/TYVuRnQb5w/XR5
   K3U1jUtp1OUILOs4Vfpx2kF2kS/zCuzmp4LAIElgaL4ThBLyB/jDq2URn
   jAIxg4LG/5TBcsEVWwsN8xSf6K+AOUzq8nzwEfvhDfCGtfBxxr1L7hzAY
   k=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 99842122
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hKtjLqOmwqV/A3nvrR0RlsFynXyQoLVcMsEvi/4bfWQNrUp21zYPm
 GEWXmCHP6vea2ehf4wgOovk90hS78LcnYRnHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5wFmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uNUK39qq
 uMgEREcdADc2P/n7YOjTvY506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCJpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eezHOnAttITtVU8NZongLJhUoKJycEclWrncC/l2W8Z9dQf
 hl8Fi0G6PJaGFaQZtP6VRep5nOfvhoRXtNWO+I/4QCJjKHT5m6xAWwJTSVAaZolqdUxTjwp0
 XeGmtroAXpkt7j9YXuZ96yIpDKofyYPJGkJZDQsUgcOpdLkpekbhRXJSNFhHKerj8bdFjT5w
 jTMpy87750cjMcN07iw9HjdgiyrvZnPRUg+4QC/dmCv4x59ZYWlT5e18lWd5vFFRK6CVUWIt
 nUAn8mY7cgNAIuLmSjLR/8CdJm56vDAPDDCjFpHG5g66y/r63OlZZpX4jx1OAFuKMlsRNPyS
 ErauAcU4YAJOnKvNPdze9joU55syrX8H9P4UPySdsBJfpV6aA6A+mdpeFKU2Gfu1kMrlMnTJ
 KumTCplNl5CYYwP8dZ8b711PWMDrszm+V7ueA==
IronPort-HdrOrdr: A9a23:H+jfyauRyKstbBK2DhuO4Cg67skCEIAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MArhHO1OkO4s1NCZLXTbUQqTXftfBO7ZrwEIdBeOldK1uZ
 0QFpSWTeeAdmSS7vyKnjVQcexB/DDvysnB64bjJjVWPHlXgslbnnhE422gYylLrWd9dPwE/d
 anl6h6T23KQwVqUi33PAhNY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzSIwxsEVDtL4LE6tU
 zIiRbw6KmPu+yyjka07R6f071m3P/ajvdTDs2FjcYYbh3qlwaTfYxkH5GSoTwvp+mryVAy1P
 3BuQ0pMchf427YOku1vRzu8Q/91ytG0Q6p9XaoxV/Y5eDpTjMzDMRMwapfbxvi8kIl+PVxyr
 hC0W61v4deSUqoplW32/H4EzVR0makq3srluAey1RZTIslcbdU6agS5llcHpssFD/zrKonDO
 5tJsfB4+s+SyLTU1np+k1UhPC8VHU6GRmLBmAEp8yuyjBT2Et0ykMJrfZv6ksoxdYYcd1p9u
 7EOqNnmPVlVckNd59wA+8HXI+eFnHNaQikChPSHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8JfV70A8Hm5uwEzvn0ehT/Yd3R8LAd23Ag0YeMAYYDcBfzB2zGqvHQ48n2WabgKr
 KO0JE/OY6XEYKhI/cP4+TEYeggFZAvarxlhj8FYSP/nivqEPycigWJSoekGJPdVRAZZ0jYPl
 wvGBDOGeQo1DHYZpa/ummcZ0/Q
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="99842122"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2dd4tKgMfRbYE2ulm7fv70JeFRXkIzBF7BS+4qflWwQ3rrFFwNeSTO9EVNwwSqGRW5IPEFRjceD0w5IWWlvyAOtqytseHbgb/LV0pJaF9YQvaEgO4wLe2PtBG+jimb39a64+wWcVIBXHho8gRug6j2zSQotk8Bevy0pBP2SJBC/gc+WxQ4s7ZDo8oesLMR8f7B8YJLirCssPaJH/RIdB3QLawa3xXpNmEWj4K7MTYUscFRirwCyIEaCfQjV9AKa0wI1cpjEKBFeH1tesoBTlmxgHgUcH864r3QFLSCDT/WCYOXaFqbm6QkQUdL85MeW/s5dKA+yNMj4qukU2HulZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdIBInz1m2QTYlk6DrxxuObPcjDGJc34lmvC/ufwO9U=;
 b=mUWFv+MeY/4Lc1ZZWkgj4ymcYgXRlEnfF0/rGtZA72ZCaekUS/z2TIHi1b97y9j7NBtCw3oemrju9YppZKlghEliI7xHknGtWNIooyApdzjGldzpwB3ZPjw8poeNQehd0agcAk5W5SjhkPa55O9v4jMbYeoVyE6/hEgvsEAy/cDk0CQ09R52KLMKYgqvyygoZtPwNi/kxVh1tIuErZfGYlISGmMI8+23CcUiSunZwlBxAr11WLFWDB7qbPWBIpjkoOpO8ZvbAXL9cMWyKwmRvuaLCPIznNq6ap32kk8q40FTlAZJB8ySi36ntf6GU7RRQmDQ8vZyjO9qpdtkAtmpkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdIBInz1m2QTYlk6DrxxuObPcjDGJc34lmvC/ufwO9U=;
 b=nhzRU3rFg8fGYir0y1Rup583soKEYajPjZf2YrAG7Bd78qhCVPpr3cWsljtvzIH9kvcFMtgEqLoTu5wTbh9tZpJPzxzNyWVOo9Ochkmxbag0jMEsXiLDKyEeMHVGuQFGE/cB4Ocm6MbMZnB2TEtq8CXmdjNPxJWpyIxnz8ZLIOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1a970dcd-2c0e-d938-b0e2-67d2455a8592@citrix.com>
Date: Thu, 16 Mar 2023 00:37:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 0/3] Do basic initialization things
Content-Language: en-GB
To: Bobby Eshleman <bobby.eshleman@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Gianluca Guida
 <gianluca@rivosinc.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
 <CAKB00G2=MSXrLyczXUEm+OzBj=an6CsjUrRfDhLELupTyAGd2w@mail.gmail.com>
In-Reply-To: <CAKB00G2=MSXrLyczXUEm+OzBj=an6CsjUrRfDhLELupTyAGd2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0656.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::12) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|DS7PR03MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f658c9-f35d-4757-b0db-08db25b6995a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tfkZcPksRqhEax15KzTw8vZHvXbYu2DfFj6pDduvKb1wu06SyKjzoZ5tkk84s+M9r6BJ5PBVTZLgvZiYIdSJIgDSCkHdF56kRCUL1dcvOYciQP/kCJ006OiN9GkL/NLCwmSNFidi1RIKcUtPV7cneiLhOIkNBmMS7cOEIrTvNtttqFRKtPo/u4FnTGzTWQ4Zwy85Xt138urhR4WHk/YDX8s4/dES7k8EtAvWgO0tyS36LsEk8B1bSE8OlcmzYZb/bmbpK48tyQDmNxTx4jnKGYyMkg1OUsZjNX7lFvHHl15t+fi0GUYUcEDf1ob4YyLKFFj2B7OTNNszzdi/8A9WEPcokUcP1BYl7HO7BhLklPSerL/SJTW5gyrp2Y1sHZn173BLA0haBx7Zo6iVvH264GkJ9q9zXQRJ9QWRRWnagjszF4d998v5g15QIOt9efIdLckrMuRXhJu0lNakubHn15CykWbyZ47E/rEQa6on/QT5byPUZZMzXBecUrAvGdsexxZVVLI2an08tAvUPp3Xy1eh2gp8mXuT+zPiN8J++y/v0YUUUNAW7J99c7orZkHy9zdh54eJviT6yJH5IMCnalvvUCCyG6+V/jhR6sWNFexTxIHUVTqP6q/PRKwYUoLUVuRNjQYVcyg6LnGalFhG1PNJeb0bygzWUh10v9BOVhWVN/CG75buEHCTBauwVy7Ibw5CdWXkeW6EO4qyMj6CAHg2CSNSjQuHF382sy9Z2Eo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199018)(2906002)(82960400001)(31686004)(83380400001)(5660300002)(36756003)(66476007)(66556008)(41300700001)(8936002)(4326008)(31696002)(558084003)(38100700002)(54906003)(86362001)(110136005)(316002)(66946007)(478600001)(8676002)(2616005)(186003)(26005)(6512007)(6666004)(53546011)(6486002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDNWbXQzbUJrd1pyTVN4a1RtQlhNRE1YTjdDZDh3VyswaEpXMXhEdTN0byt3?=
 =?utf-8?B?REd4Q3g0b3ZTSzRXeUVJSUZYc0dpei9UQWUzWTVZRS95dmtuR3hTZlUzRURv?=
 =?utf-8?B?dGtLaFd6cEpUVEJYM1hBMDk0U0NaZnNVM3RZZUxjK3A5NXh3K0hBcVVxbm96?=
 =?utf-8?B?Yjd3bUxRMkRRRENvK2ZWMzJJUXl2RGoxc0hPMHh2N09RZ09JY3E1MFZ2clgx?=
 =?utf-8?B?ZG9zRnNuQ2RWVVliQS92V1c2L01zQ1JlRno3TUltU0I5RkxuQW5iNnJXNDlR?=
 =?utf-8?B?eHV3S2JqT1Y1dG1tTDBYWTcxUXg1UEJEaE55WitUL3dBYnY5c3REM3dYT09W?=
 =?utf-8?B?U1BhYkk3NG84R3dKWldFSnlEbFZGY3FUd0s3Q3dmZlpjVEdWR1RGUjUydmd0?=
 =?utf-8?B?citZcmxKVmF3QnlybTI2dDBXd1ZuTVVsblhTVWg1ZWNYQWFIOTNsR1BpWWRO?=
 =?utf-8?B?dlVJMXFhb2FFQVhzR21RdjN6c2xtZldlL2t1OTIrVGc2TUVGb1E0dFdTSGlX?=
 =?utf-8?B?VllpQUwxbzNIMGVkbDJtUXl2QmdGMm4rMmZOWURDWTEyMk8wbFppYmQ0a1lz?=
 =?utf-8?B?czlBaWRhNGNTK0UwaWFXaC9LQndpWTlyQ1czV3MyNDVRbU15L1J3VXRTNUFQ?=
 =?utf-8?B?UVV0d1ZLc25hZWMwTVpkd1R5K3JQaWNSSzhHTENqOHhndlpMdlJUMU1QdUJ1?=
 =?utf-8?B?aUZsQnpJUXFTV1RhbkFJZW1RcWhsRG54R1hVVWRyQjlWZGg0eVBXVHR2NHVY?=
 =?utf-8?B?WVZSaG1TRVNBRmpqYnBHODN2ZllrS3d5elpxcndyUzZ2Y2toSFpOUHdRZnBx?=
 =?utf-8?B?cDdVWVloamJVak5YNDlkVG4yOGdWRnhkV0V6dlFXYWV6cnFjeVA5WW9Ialpt?=
 =?utf-8?B?dnljenMvWS95WW5RS2ZsMTVBajExYTR3WlltRTNvQXJ6cTdEVmtOLzNVYkp1?=
 =?utf-8?B?eEhaUGF0OUFNQ1JCSmpTK0pyR0o4MzI2L2NFblZaQlRrc3psaUZ2OTVkSkV0?=
 =?utf-8?B?eWd3S2dudXI4Uy9SZGNGSjZCOVFJQzdENkxoWm1rWWNQMkl6R0RTMkp6eUdF?=
 =?utf-8?B?TnpLaXdUNjhrWlUrZENnc2RVM2dHbnhJNVV2VU4zaXNoaFVRdXFlZVBOdXpz?=
 =?utf-8?B?dFBPV0tkN054V1JmbmVRbDlYWUlaMklPR1BqRC80T0RmL3huZlRzMnlZUVRh?=
 =?utf-8?B?aVplTSt3TTV3SXZkRnJ6eEJhNXdOOVBuUmJORXF4djhZWkRqY0FMVkNSWFcw?=
 =?utf-8?B?M0xIR1A5M1RBMDQvQkwrblN1Nmxxaytia0ROTDRpd1ZVQlhoS1ZPeitjaFN1?=
 =?utf-8?B?aUk3cXRQbEt5cVRQTjBZNmtLVGJZaVROdTF6bHNJV3BRRUpUZi9TNGJmMUp6?=
 =?utf-8?B?NEdTT2Z2L2dwcXZsQ0ZBM2RydjVOWUd1ZkdPVDRTWEsxRi9yZENxMThNWUtu?=
 =?utf-8?B?a3V1UUVIa1J6dWg4czRUeCtNc2c5Vk1GbHowMEVDbjFtekJYc1d5YWI0NTkx?=
 =?utf-8?B?QzJsOXdVcWo1NXFrQ0s0SFA5bkNCSzZZTjVIajYwaCtodEtLTVlPc3BMUjda?=
 =?utf-8?B?dDE0Wm5tY2RTVGFVWmVBc1dnMTI2b2taOVdJZGFndXk5bVlLS0NtOVdnQXRr?=
 =?utf-8?B?Z2dLUElENjVTVFZFcWhLVUtZdlNpc0ptbVhDT2VpVVF3d3dkeUExZUh6bG1t?=
 =?utf-8?B?VUc0UC9FSEg0RUd0dzRxeXJwRk1IQWFJQkh0VlRZcmhLQk9SRTRQeEZiWit1?=
 =?utf-8?B?MTlwT0Z6QkJJdHhLUklIZDBaM3VQOXA3YnZvNStQLzRoc0llVVBUQklaZGow?=
 =?utf-8?B?K1NoekZTa2FxOEwvYkZHZklhelFZdHM1UXJRdlJZYTB2V3l2RnRNdEVWdms3?=
 =?utf-8?B?WFMwUUpURGhLVXhlY1lsV2NsRm5EN1hVT0t3amNVT3lUMmJGNkhFSHhseWxm?=
 =?utf-8?B?Tk0wNC9jekZOWlhhVnI0M0pXUzFvdjFyaHoxTkVrU0YrS3R6dmljRVM2ZnB4?=
 =?utf-8?B?RVQrcFNsU3BuOFFoVGYwblp0SnoyVHVlZ1JFSElJVXhDOTZOZFFSdml5Zi9M?=
 =?utf-8?B?RGJIUE4zeGw0ZEVnSFFtaURNanNIWnhHL2QvcWlyM0FMb3hrM290K0FlME5z?=
 =?utf-8?B?bGdjZkpCL0NXM0xSMThXdkJKRGszOElMcktMaHdBbS9YLytrbHkxcVNlMk9j?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7DkIjeEF+/SFUEs5qPonEODRsxQXukRVTffxCzJ+3o9jBWsQGrgs6+SzuBp5w3U+16/lgM/zylA/aecxU3RjK+iuKT1uGvNbnoz2BF805U25vNvSVou3f58uICuQ/TpFxIXqvM2AVejV4vsQC9cr7faKJpJ+G1Mh+0RmCfZOiEVeBHuwGgmnc9SEjuva32zHTEIGdldP8fy8RtDo2pu7eAEe7uXRDNi1vxez/tKIP67ZWff0tWxhfuXPdCGQ2lAlZs20SNnzyvdZ1iwKQ6gmdBIe0W9F08jCVNB1dg6FgPRqOhmQtRpcbXi2IGaIfx8z83g51K7Cyaq2DWGIBr2MS7Ka7HZNeEHuQa8qlT/SANV8LF0jryL/tOPLLYpdEknFj1IFSvDAltad2eP5V3qb5MlUMyLx14E57mc0Fyf67svoIg1mUpIQP7EYrphdlHDFCXPFnYWv0kby81BTArPIxVo3gEW30StUYcR2vyfPveaph+Fs44QzdVLdNstf85i8QO7DWMyRccSI6epUNiFl6XliBQFsonpzc8iPXlcSFUJWoOHgmrn6sIqATGAs6MaHO+8udaNkzbJU8Aqe6nHClRiFyW5iwEg+pzK0/yFOKsfFPyWIrPjgK5fst9Bi3zKQnya7Eyav3zqz7fxcAe3bacFyldrzGKOHwceFH0kz9DKBLVqkbzR+qssCFEKF1MLJirAe9ifl6rvIwCrEdIbtMSc93d4Er6gWHrO2+0amH4r3wj2J3j+a9iLbQnXVwzEvl3VRaqWTQpqKl6+Nd9ITavcXz2bSORp+/3AjZnmjK6HG7uxJX89G4mpVwTT5t7qls1eP55jlrxrG1TopEbr8guwXxAjedZNJ1BxBjpHtU+/Q1F5o/5yybUpAQ7zraBwIT4tjKu+d7CBSTAhazU15po2VHzIZONSiw4/so1ybzfY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f658c9-f35d-4757-b0db-08db25b6995a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 00:37:19.3158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yoh+iTtUligqf9BVELe1pS4CThcU+TiHMntfjQitD86d4g0clpGuoT2Z/UmOH01mQDqNDUobXHb/SXsLKPnRqUqczw3ZBKNNxXeprBLnyOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5639

On 05/03/2023 7:06 am, Bobby Eshleman wrote:
> I just wanted to let you know I have this queued up to review, I’ve
> just been very overloaded. I’ll give these a review in the coming week.

Any update on this?

FWIW, all 3 look ready to go in to me, so hopefully its very easy.

~Andrew

