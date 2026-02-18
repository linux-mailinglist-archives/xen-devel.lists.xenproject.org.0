Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGDaOva7lWntUQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 14:17:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587371568CB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 14:17:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235559.1538523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vshQZ-0002Af-8r; Wed, 18 Feb 2026 13:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235559.1538523; Wed, 18 Feb 2026 13:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vshQZ-00028a-69; Wed, 18 Feb 2026 13:17:15 +0000
Received: by outflank-mailman (input) for mailman id 1235559;
 Wed, 18 Feb 2026 13:17:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=po7z=AW=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vshQX-00028U-RG
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 13:17:13 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fe24c06-0ccc-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 14:17:08 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA6PR03MB7615.namprd03.prod.outlook.com (2603:10b6:806:43d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 13:17:04 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 13:17:04 +0000
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
X-Inumbo-ID: 1fe24c06-0ccc-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOTnqKgkEFECGGjok3d7br8WmCl48JKOnnyW9/mYl2TbT5yV4ga450H7I+TQ449Tw9gNMMICpjGbOQOzZNfQrlfcv8SsLzCZW7d/xgAkRQEl4F+2UMHt83vUPSpE/JNnyyyzVwDfaAHzeolYae02gnUEGABR6/8auuLPYsXnhtbOfItzEmCPAJ7DDwn/UTAD91YJ1l72r71UyVGSGRL0jfb+40vctWZInyUDrJI2YAAgSaV2lLtBSsLW6mhe8En5Xhxdrd/BtlziTW7HXeOmP/WlY4BEakkivBx0YRd7tB58CrOhbKvhjewVQSae9NI5xkQ08TykeV8OFgdsoqsWMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTb0daaIsHYkk70kEDJIoUYrec26MszOBa3sIZltg08=;
 b=uSQsFHUHcgHyYgHUuFWSD/Br6nXbNo8xw3M2eqIPpMINc/i5ZHEQHu/ISv9JfgNhoGXjonsZK0oeYPqsf2SC3J0HarJLR5wCyok03r/dAQKgROGv5ylVmg3tBVxxVUDvKwb21BZDdTz7g3rZED8vXHmuDLKNHQnyuoJaYKEtz93vptrtlv8vd40+HK/kvCmbOKlJ4YwhtINkSqFEzJNkOGGgix/agaRZLBjdcJJmVVT6mAUAgUinwFKLRFxN9KPF+j6YcLoD8+Ws/AQSosVn1k/Ibu/yDYXvPIJWl0DJwta3puLlw6ftdB1yJa9j7Gw48useKvos+QIJy9MMDPX0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTb0daaIsHYkk70kEDJIoUYrec26MszOBa3sIZltg08=;
 b=D0lGYZG21b5AhSvmYM6uPm8z/EMmOByHFKxS80H/E10uby/s5TMP7FTjkzTvhs5UEawE538bC/6ffziJeMk+RQSFecRgtxXibJeaxN1N2CJyjxHHjq18Nh1CWbLaX2hU/6q1hXjuIZFiNC4zdrxoS9LrragUHNDAECboRSMIg1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c1da2a8e-3e15-43e1-a603-8b13e2f8e7e8@citrix.com>
Date: Wed, 18 Feb 2026 13:17:01 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/shadow: don't use #if in macro invocations
To: Jan Beulich <jbeulich@suse.com>
References: <23951625-939c-4658-8146-84c1f12381d0@suse.com>
 <60a1bc11-f9a6-48c3-b7d8-d007799fbe91@citrix.com>
 <a0ff4341-2754-404c-8b42-95747e3cb6ab@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <a0ff4341-2754-404c-8b42-95747e3cb6ab@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::15) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA6PR03MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 97240e93-154c-46a5-9942-08de6ef0021a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEpwcVBzUG5jTkVaN2VkNzJIWnJNTXJSMEpsdG51cklYZHZTU3R3MzRTRFpW?=
 =?utf-8?B?eDZDUTZxbjdhRXpCdWFYL3FIM3FyM0R5RGowa0RYbVM1MGFINHp0SjBGdW1R?=
 =?utf-8?B?TU1JWlhJZXZVcElIMWE4RjA3R3BjczV0aVhuM1N1Q2JJd3dNRy9BeUQwSWJz?=
 =?utf-8?B?YTIzdTBSeG5mYmNhT2hUVjhEeFZBRFJ1ZWhXbUE4MjFSQ2podzVnK05iWnhV?=
 =?utf-8?B?cHJJOS9uZWZLSmtITnlpQk1JWXd1SFFKTDZjZXFQQ0RJS3FKUkplRk9tQUk0?=
 =?utf-8?B?Y3VPRjNHbnE4RzBxM2ZLcEt2a25McW1TcG9ucHpZK1hVNU5mOVVWWGVVcG5k?=
 =?utf-8?B?RGNJVDZrbHFXZStCRUVVeXd2TUU2eFBOTFJjM1BpSVNmbTlLbEtRdlljOVVM?=
 =?utf-8?B?a2ZsWmw0RXU0bHlDdE4wYnFIWVA2OWJhdkk3eFFHZnpQUmRGR25DUjVkbTJx?=
 =?utf-8?B?Z1dBeGcrNk80dnJDN0dyNWlwczNQd2VXU215K21odnJqMloxa3ppek1EY3N0?=
 =?utf-8?B?b1NSdnFIajBDWkM0WHNsbUo3aUwyREdyVExMdmt6WTZEMUsxMnFKTEhGMGdx?=
 =?utf-8?B?RnJNM3JiUFlKUTBORDl4TDFuNS95VDFHem5jYlpLZXRyOWUxaWpXSzJHMk5N?=
 =?utf-8?B?djI4NWh0WWQwRFFSTjRERUtCVjhKdWtiRVBUYytwRW5nWjBRU0JFY05BS3J3?=
 =?utf-8?B?bXFLeEJKUG10WFppMHZrY2NvczJ6ZHdnbFhKMnJNSG9aT2RxSERKV3ZldWF1?=
 =?utf-8?B?YSswazhLNWVFMmRwdVlaUTdLN253UWlKSmo1N0kxeUNJN1QxeFU4dHgrK2hk?=
 =?utf-8?B?eU5ESng0ci9QQUY0SmRORkhIVGhPQ09QQTl1RU9XZFROSGJ4eWt1aVBSdG1H?=
 =?utf-8?B?QW9sVkVCUnFlM2VVeGs0bk1VdHRQSWcvempzcGtFcC8xMmdIRy90NkQ2TC9S?=
 =?utf-8?B?azVJRVZDeGdLY2ZudU9OZEdpRWU5b0cvTS9UVEQzaWVPaFIxYjcwaWJnMk9M?=
 =?utf-8?B?ZE90QXA1UTJrMFdNVlNKSUtubGlCakdvWllqNkRZU1htVGNWc2pyQ0xBYWZp?=
 =?utf-8?B?dXpsRGFCcDI3WEhwSWgvS21XdExGb3V2UWJnVTRwSDVzQU5vditlMDhwOHNO?=
 =?utf-8?B?U2NHbmQvY21DbUFLLy9tRWlpamJBRFhNTmxCcENOemlsVDZaKzBWa0toYVgy?=
 =?utf-8?B?L3BEMXNvcGpvQ0FrS29nTG5kSmtDWFVqWjFmSlNEUkZhcFRjSWJxYm02TzFD?=
 =?utf-8?B?UGdCbUZacmxvdGl1QytmZ2Z2RmpSbEJxYjUvTkJGQlloM25admNZK1FTazYv?=
 =?utf-8?B?bTdiZFpIeEIvZzBrakZ1VGl2N0VOR0NXMEw0bUxVNEpuQlpONGpYQmtKQnh0?=
 =?utf-8?B?UGNaenBsb0o3U2g1OG8vTGJER0l3KzJHaFhzbnB4Y2M3ZnV5cW0zMk0xNzdq?=
 =?utf-8?B?cUlNZkZRWmVaQmhSSXRrZVMvZ2RMQmUzOHcvaHlycHZITnZiK2ovWjlDVjJP?=
 =?utf-8?B?QVMxS0p2MFI4a3pudEk5SVliNGJGWUJtSCtsMSs1bDBYNS90bzN6aUduZ3Yx?=
 =?utf-8?B?aEpvOW5ZZXN0M0Z0ZmdJMmZ0NXJsSXdFQ1Y0S3dReU9DQmF3NWZNcU4yWFBJ?=
 =?utf-8?B?WWVZRzVKNW1CWngzTEtCODJoN0hpVU1lbGhlQ1ZpRkxDdjVsVW5VcFFSemlM?=
 =?utf-8?B?Smg0U3lnUGw0Z3dKMmJnRFduQ25QajkzSWQ1USthM08yVTc3OGZ3Y2x6cUQ2?=
 =?utf-8?B?eUtGczRKSFk1SXVvMFF4UjlSOWJHU2lOemxPUWd2c3JYTDRUUE54dTgrWUNQ?=
 =?utf-8?B?WEJWd1cxUDhrb1EzZFFZbE94a2lOU1ZjTUFSWTQxUC9vOGN1S2tIQ0JHN1Rz?=
 =?utf-8?B?TkVZVjNoSDlPdGZ6USttV3RqNXFsbU1vcXk2eW5JOVU4bzR2VFZpTDJDUlM0?=
 =?utf-8?B?ZUZLeVBNaXNRQkhhd0E5UVVjR1JoNVFNUFlGUEphY0VxNU1udjVhd0dYS0h5?=
 =?utf-8?B?VVpNeGQ0eFVTbVlleVQzTkdEWW9aeU1ZeTgwNDRSS2UvcVlmUy9XZDNxVU1s?=
 =?utf-8?B?bWlyQjdlQ2pUMTZrRlgvNmphaXlUZjUvbUlIS3RXZ1VUVDE5cHpFK3F6MHJQ?=
 =?utf-8?Q?93tg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmIxcFBJWlZ0MnhVVERiVGVGc0RJTmFKSHF1M0U3L2xZVGc3eUUzeXhrNnB6?=
 =?utf-8?B?NGJoak8vcmlBdGNIYjgyVlByUDZXd2ZmN2Y4VExNelBtalUzblVaK2xYVURK?=
 =?utf-8?B?Z0tuTmdtbFpwVFlKQ1BwdVpGbXlWcTdKd1hpdlpXUGVBRGxVMUJsSkRHT2Ri?=
 =?utf-8?B?UWUweG04NlJtYXBsREErYi9RYjVZL2hQcjJHZE1obVpUUjk5RlNrNjl6Nkxu?=
 =?utf-8?B?VzRCYnJleFlwUkpJS3hIKzN2Z3pvK2YvdVVGR2pnK2NZN1lERjExZVZVR2pn?=
 =?utf-8?B?eW1DUittM2ZFQzZkVFpNSFFqR2VDVnkzMGh1THl0UGVuRWtXUlBzOXVUL09M?=
 =?utf-8?B?ZHBzbzBpNjZnRDhONzA3UnQ3VExhRVVmaVl4amdZZEthQzc4aDFkMUdTRW5z?=
 =?utf-8?B?MGU1U0VqWWlkV3dRSWlaY0F1ZHV2OU5CenVKRVFrZ2JCYnVqZzdmUDQyR2Z0?=
 =?utf-8?B?cFJNdEdlaDF3S1owd0FPendDRkxVenllYTA1b3NsSUxwR1RjalAvV09Eekpj?=
 =?utf-8?B?WUEzVmhoV0hhZ1Vxc3JJSzdWQTRQWEFZVWFDMEs2LzdOcTJ6OG9uSzNKK2U4?=
 =?utf-8?B?cjNTQWx4YmxHaHVBOWNWd1ExVWFia1ZzRFczT2hnQTloMkZkOTJiYkFqM3pR?=
 =?utf-8?B?bVg4OW9WWkw4WEZvSUpDOWFYS0c3ZTNIOWRubVI4MlRmWTJ0TS9yak0rTlVt?=
 =?utf-8?B?UzBzbnpsc2dhTGJqS09yU1ZQaW5LSytkQXZOZjBiSmtXSU9LRE9najZBVlVn?=
 =?utf-8?B?b0hIczZyUGFuTFZuWEJQSHlSclFrcVBXaXhEMExRVkNGcHhOOWQwQWxlRENZ?=
 =?utf-8?B?Tm9qMlBnSHozRWlmTndseUtvT1pkWDRlTGNXcEU1Vnd6UTlOOXQ2NTZwd1JS?=
 =?utf-8?B?WkJMSS9JKzVDb29JeFRLd0J5RjIzaDBGZWJGYTh6L2dKRk84M1NYTldOMm1v?=
 =?utf-8?B?azlEWEp6b2oraS82bkh0K21HR093YURRa2RMS0Y3dFJVOC9MbGNvMElRa0NF?=
 =?utf-8?B?djY5Kzdrdk9NcmhSeGdtUzRPRDNCdDNsMnZGbEpwazFUZXhQekttM082TGhU?=
 =?utf-8?B?L3lmWGlQelVkZTFMQkdxQzlpSTRBaE9hTzh6MkM1bFplanpmQlVnTHlobVp0?=
 =?utf-8?B?SEIxaWREbUNCa1RzUHUzNVJBeVhUdVB4ckZ1QldmZnY5Ykh6clkwSzBtQ0FZ?=
 =?utf-8?B?TVR1a3Jnc3ljM3AycnIvQTdGQStXU1VnZ1pQVHZFRC9HRnlvQ3NzY3BHUFRI?=
 =?utf-8?B?Szk5cWN0dWJ4TG8yVnd5K1VhdGtzOFlmVzVZY1REY2dyN09RK2lNdVZvL0tv?=
 =?utf-8?B?TG13VUVzT0tSUjRZRjFRc3ZsUUNFNG9RUXo3UlR0NlY3U2lpOXhESzFpNEdm?=
 =?utf-8?B?SGFETnI1SzlnMms5NExsdFNZYW5aZVNPRUJna1U2SWxwYUNvajZpTUY1Mlow?=
 =?utf-8?B?SHFIK2ovclFsckIyRVNaR05EeGZGT0RUSjZ1ZnB5NUQ1MEhmMitkMVhrNWRD?=
 =?utf-8?B?MHV2d1U2Ry8wSk1zWm5lMkNvN2E2bFFTY3JkcFJsa2dZZUdWNWJhL0srQ3Ay?=
 =?utf-8?B?MHF4b09URnpSQUgzUVo1dEIrQUxiRm5LNW1tY3l2Snp0KytDWG41blFBRXBl?=
 =?utf-8?B?eDYzbkU3dnExODkyU2grUS9mQlk2WklEMnFFMXZjb1ppSGg2M1paU3QvWDY5?=
 =?utf-8?B?ekZ5MTBBemQvOXk4eGZBUUNkcjBGUEJrekVOTElEQUFNaXlxRGE5MS9EUHpz?=
 =?utf-8?B?K2dsZXhNaEl6NXEzZCtQMEVxK0dKeGlMZTdzY0RsK01OdDRFQzNHTUNUL2Nx?=
 =?utf-8?B?ckxqRzU1aE9Cci8vNWcvK1dVZVFKRUZZNlcxWU1WaC9DT1JJeXdKVWU1MXJK?=
 =?utf-8?B?R3RseDdTeTFqZTBvaUh4aHBSblA4QzZoRzgvTkdYY1RtY3RkTFgwWWVxUXBB?=
 =?utf-8?B?eXNnam9Ycmg3OTIzNFc3cTNKZUFiTHBTS3Q4c3hoYm8rTGFwMkEwRHVneTUv?=
 =?utf-8?B?QUxVK1c1R0VTRS94NnJGSDJFU3p2UkdCNTZYZnA0MFJTcmwvb1JuUXlQMm1Q?=
 =?utf-8?B?V0VHSjlZTkxxMVlKcUNZZjlWT3dtYVI2S1FSbDVHMFNuTWVZNmtWZ3U1TXpV?=
 =?utf-8?B?OHBEQ2Y4Rmg0Q0EyTEtMNDJGWHZ2aEExTEJTT1ZuSVJJUmtrR1ViOCtMS01V?=
 =?utf-8?B?VThrNU1ZdmVmL3VGMHpkZUxrdXozQ0lNU2NUNVMvL1lsbS8weUZ0U0NtSmxQ?=
 =?utf-8?B?N2dKZXIyeHFCUUJzaHR3bkhrZFYrVkdPU2tHaWFwZm05QjRUZUE5aW45dW5v?=
 =?utf-8?B?NDRQWGVXM0lVWTNUTGNkQ3QxMDJQdmp5bFU3WksyMzgxeVh2TGVOdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97240e93-154c-46a5-9942-08de6ef0021a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 13:17:04.0432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrzbzcZGMTW9aJeqmE66xFSGcgNaAQWjs7McsdMRrnFvd7CQ1GziGw6NQwdOl3VfHw9PbpHPkgFsMKvmd7IyLhX+Iv0DWHgKkQlbReo6bKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7615
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 587371568CB
X-Rspamd-Action: no action

On 18/02/2026 12:42 pm, Jan Beulich wrote:
> On 18.02.2026 12:30, Andrew Cooper wrote:
>> On 18/02/2026 9:03 am, Jan Beulich wrote:
>>> As per the standard this is UB, i.e. we're building on a defacto extension
>>> in the compilers we use.
>> Is it a real extension, or just something that happens to work?
> I was hoping I would not need to go through that large swath of gcc doc to
> actually figure, because ...
>
>>>  Misra C:2012 rule 20.6 disallows this altogether,
>>> though.
> ... this I assumed was reason enough. Still, now that you forced me to: In
> The C Preprocessor the behavior is described as intentional, but not as an
> extension (section "Directives Within Macro Arguments"). Now you get to
> judge whether that's a "real" extension or a "de-facto" one.

Sorry - all I was trying to do was judge whether it was fair to call it
UB like this or not.

The MISRA complaint alone is fine justification for the patch.

Given this, I'd suggest dropping "defacto" as the easiest way of making
this a little more precise.

>
>>> Use helper always-inline functions instead.
>>>
>>> In sh_audit_l1_table(), along with reducing the scope of "gfn", which now
>>> isn't used anymore by the if() side of the conditional, also reduce the
>>> scope of two other adjacent variables.
>>>
>>> For audit_magic() note that both which parameters are needed and what
>>> their types are is attributed to AUDIT_FAIL() accessing variables which
>>> aren't passed as arguments to it.
>> This is grammatically awkward.  IMO it would be clearer to say "For
>> audit_magic() note that there are more parameters than might seem
>> necessary, caused by the expectations of AUDIT_FAIL()." 
> I've switched to using that, but one aspect is lost this way: I would have
> preferred both gl1e and sl1e to be plain entries, not pointers to ones.
>
>>> ---
>>> Leaving even the fetching of current to the helper in
>>> sh_rm_write_access_from_l1() looks tidier to me overall, albeit this means
>>> the fetch will now occur once per present L1E.
>> This will not make a dent in the performance of the shadow code.
>>
>>> Converting the #if to if() and #ifdef to if(IS_ENABLED()) wouldn't work
>>> here, as identifiers are used which aren't available when the respective
>>> conditions are false.
>> Personally, I'd have put this in the main commit message, because it's
>> the justification for why out-of-line static inline's need to be used.
> I was wondering, so I've moved this up.
>
>>> --- a/xen/arch/x86/mm/shadow/multi.c
>>> +++ b/xen/arch/x86/mm/shadow/multi.c
>>> @@ -395,7 +395,7 @@ static inline mfn_t cf_check sh_next_pag
>>>      shadow_set_l2e(d, sl2e, new_sl2e, sl2mfn, SH_type_fl1_shadow, sh_next_page)
>>>  
>>>  static inline u32
>>> -guest_index(void *ptr)
>>> +guest_index(const void *ptr)
>>>  {
>>>      return (u32)((unsigned long)ptr & ~PAGE_MASK) / sizeof(guest_l1e_t);
>>>  }
>> While fine per say, this doesn't appear to be related to the patch?
> It does, the compiler told me to: type_from_gl3e() uses it, and I really
> want to keep the const-s on both of its parameters.

Oh of course.  I'd gone looking explicitly, and failed to spot it.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

