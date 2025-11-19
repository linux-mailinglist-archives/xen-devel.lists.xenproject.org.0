Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24F9C6E539
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 12:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165887.1492548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLgfe-0007XJ-HO; Wed, 19 Nov 2025 11:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165887.1492548; Wed, 19 Nov 2025 11:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLgfe-0007V7-Dl; Wed, 19 Nov 2025 11:48:22 +0000
Received: by outflank-mailman (input) for mailman id 1165887;
 Wed, 19 Nov 2025 11:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GacY=53=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLgfd-0007Uz-0a
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 11:48:21 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4228d02-c53d-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 12:48:18 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AS8PR03MB7638.eurprd03.prod.outlook.com (2603:10a6:20b:346::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Wed, 19 Nov
 2025 11:48:16 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 11:48:16 +0000
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
X-Inumbo-ID: a4228d02-c53d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFwS/G3JNKaI1BzslE7XofNbn4FfjP1rlVPGkYp+NqBnTfzP252cp8ibqJnjT604B7wVUqvZjLqy1bbFfLC1RhgST1tFBLgLRSfKLZncYk7ll4Ltd+X1iGEgIQHl2fU3t6/+AaMLPf/uDDKmSyVWgfLgdLlicAnqMtUB3b46nLM2G1QjOFV9071qaiQ6xFzLJyF4W5kgbAnlydCvq+t33aV+/aeOFn+/eAN5udQGUheRxNAOpEoMNasIt/es8sfBBrmGgfl9ooWihk0sA29N/u0sKt1qjdByHXjfeu5iAeIIwVt84b3D+ouySoanOqamhEDFKkmD8PQ+nttw0J5aOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hUTUz8FbAyVfJ3OBFEcwaMmc8+lTI2NZUk0/bO2tA0=;
 b=clfvgUU53SwHbLUqgyISHsb1/sTUqH2CEzx6QnLVz1KOkiXTdHDakwRW1ZjZsk/rN+z5p6slrGSA1vmpBHWdE4qLj+l6mNrGS2nwT0UKvlaUZY4iGLfGe1Bdk9Wg22dBQ5Du4XOP0dVaVuNBBcSZ4MBhlC/n5CQYnH7nA5eeGCHxcNjQ1RD9gtNaEOAs+qt2Zdu1afkhOu44VfafREECaWAccosvSSqQ1jU658r4RrHHKbYyZmefTSwfhQWhpv+UVQp9UilpLPzK8QvZp1AGGBGcGGrNOqEz4wFhGwwlQxXEspo+glfJv2mRRTrWTukjSHTfyRJ0Zb6WWp9cZ4to+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hUTUz8FbAyVfJ3OBFEcwaMmc8+lTI2NZUk0/bO2tA0=;
 b=sD55BimO/FMgbylnjMVEzDojbH26mArV9EMZlCTblPw06wFXq85gGXj72BVReUxFq7xXh3JxbRAlFIpRmj/62PasPQEfJa757R+7iYU3YAJv8ED/DyLoUQM63WNN95lfA1TbGbD3d/+0n0WBWw7PUgwoSfzsPwkCtK2Z/o764+lSPhyMgJRCQhJc0rNtbYn5Jeu9sCEAn28jLwxmgOwmZ6mSgWUBM5UG6Y1IhbaNXFAjbaIRv/ezvyyjHxxC4njpO/tmppaaNXQc79BArc4gdS6bxkNGC8iQwPeIDGKYbBRLjBrzaIJ8TOfNNw7ELJNra3UhroRi6YO0+Yk+QTA5Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <9d5f30c9-1a9e-45d2-93f9-3af20f105a69@epam.com>
Date: Wed, 19 Nov 2025 13:48:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/5] x86: hvm: factor out compat code under ifdefs
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-4-grygorii_strashko@epam.com>
 <af736490-5f04-4fa8-9b73-4071b72e1c33@suse.com>
 <4e4aa540-514b-458f-8036-7941a0ecf268@epam.com>
 <be6f958b-ae23-4cd0-9dd7-c096ae36d39b@suse.com>
 <a17e86e4-f8c1-464d-b30d-42713f793ea5@suse.com>
 <8aa7ddeb-fb2b-42ac-bba6-272b91fc1e8f@suse.com>
 <a36eafd3-35cf-448e-8c46-df063f50b082@epam.com>
 <8a57904f-17f2-46f9-9b08-e2287f8fd44c@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <8a57904f-17f2-46f9-9b08-e2287f8fd44c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0353.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::13) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|AS8PR03MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d19330-227f-4805-da85-08de276186e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlFpWWg4aDVRdVc4Y1JhYnd4Q2pWOEZmemFTOGpHb3NjNzZsZFlGOFFvN2E3?=
 =?utf-8?B?U3E2SS8xUUV3Y0J1R2NPOXZHSUlXaDMxa2ZzT1ZRSnJxcjNHU1pWQVBrUnA0?=
 =?utf-8?B?d0V0cGpqYk8xS3dYblMwcVlvcU1ud05aQkJBUmVzdjZLc2tIQTd4Q1RVM1Na?=
 =?utf-8?B?cmFnRWNuOHVrZ0VFeldJNHl5NlVldURma0Y1M3FsZ01sd2tYeUk1S0xFeitt?=
 =?utf-8?B?UHVLL25ReVZPaXFraGJUTCs2Q2Q3NFVoSEhrd1lrYWtYTUZZVGUrTUFPaEFm?=
 =?utf-8?B?SXJVY1lZRGlHTm0xWEhjR3hoaUZGV2w5a0JCdUlKQk9leEl1NnNETEI4Nllh?=
 =?utf-8?B?MGVRSlV4WTFJZUpGT0hPUEVMdkxuMzhtaGF0cXNvbXQ4b0M2KzVldGl4NWhn?=
 =?utf-8?B?dCtMeExpRFFoaGtxUmxKR2tDdWJxMTFKTmxYTTN0cnNYam1lQnBzRW1tbGZt?=
 =?utf-8?B?MDBuck4rdW1CakJ5YzkrZitmZ1pPUTRsb0JlRGdvRC8rcUNwNHFXK0FKVjd6?=
 =?utf-8?B?a0xUbkNvQmRSazNMcTRmais1SXFXTmljYzZOT25SU3daYTVYQzRBS3JlSHY3?=
 =?utf-8?B?Q2V0TlRsTDluS29MeVdJQkFNUnZKbmZWUmpOTXo3SjkyUWVxYXVqbC9LUnFZ?=
 =?utf-8?B?aTBsdFlIc1lSK3dpMFA2TXJkWEZ5K2g1UzhPTzNUUGNwbk9sVHpTa2JWYVhv?=
 =?utf-8?B?MnVrdnBjZnMwQU1SUTZsY3pUWnJYSHhzRU12aGt3Z0xqK3drb1hNZVRVYTZY?=
 =?utf-8?B?YUZJWENGREVNTWlBVyt6aUxZVUo1T29OSUplZnhOcTdVeFBaZkUybHZjTzlk?=
 =?utf-8?B?amZpaGJVMTVac3I2N2wwTjJrUUJVQmlYZUNhb2xPOFpRcnhsbkxqeU41ODRN?=
 =?utf-8?B?NkFDeWJ2M3RacnMrM0tzQWNRSXpxd0lpMWc3SEtmcUtUSEVpMVJNVzZHRFdi?=
 =?utf-8?B?b1lnTU5raERsb3FEbHVFZ3dhWGVZUDlsajYyZ1NsbVlMYWtNUW85RFZYckdr?=
 =?utf-8?B?UDlHNnVuSEZxN2ZmKzVIR0dkNThTd29kM0srNFQzekZPT3VUa2lqMVBoOXd0?=
 =?utf-8?B?OVNQNnJhUGRPc3BFYWRCMnFoV05jZERuVVBWY1BEV2p1L3pWY3UvOFJMUUdY?=
 =?utf-8?B?dXlzNlpUbnliMzVnSjg2K3F1ZG1PbnpGYWpsNHhzazM2a3RDY1ZxR1pHcTZP?=
 =?utf-8?B?clVad0FGb2gvak1RV0ltWC9vZkJkTURmWUwwbEptSkJhWEczSEVaRDAvYWNT?=
 =?utf-8?B?a0RhQTNQKzdaSHdLNWtTMkNVLzBPeEZoNmllT0twZTk2TnM0VzJhbnZYQ3V5?=
 =?utf-8?B?S1dYOVR6N3Y3RUpoYUYzQ1p0OVlYSmtudHFPbG10dXVMT3BVZmZJVDBZeVFQ?=
 =?utf-8?B?Q1o2UUk1V0Q1VlFkRDNxZDdFRnNzbTZ1SjQ0TXN2WDdtOWJSSXlnMnVSM2dX?=
 =?utf-8?B?cEgxcUhna0o5ZTY4L2ZHOC8rY0NjZ0lRODZxNk1PNDhJY0kydGFRWEtweStD?=
 =?utf-8?B?QUhKSXZlYUM3TlMxUmt2TXN3bC9yR0M4S0lqd1MzbWtjUEFWS0sxZmF5ek5F?=
 =?utf-8?B?emxzZGR5aEFWV2ZuZGZWK25veXBxSFBSWGdaa2NVK2liZDJFSmU2S3M0a1hz?=
 =?utf-8?B?dk1ZWU9NbEh1d3VFNzFCYml3MVU2dmlhTldoRk02dndUY1JHcFYrVjBxd2pt?=
 =?utf-8?B?anpLSHU4bnVsN0toK0orYndLbjJEKy9kLzdOdVdCS2EyNmZSUDZNNjcvNU84?=
 =?utf-8?B?TTFOYnJqSjF1ay80T09QTzNMRHE4VHRvV2hZTUNwTm1ka1VXWWtZcmJKVURP?=
 =?utf-8?B?VGZBOHRWL0gzbDQ3WHAwNi9aYWJrb2N2TlZxZGtGVHdhYlNIVklyQ2RWcklh?=
 =?utf-8?B?U3hJaGJKVmtreVdVTGtHQkVpczROdzFHL1Z5Rkhzd3ovdXJ1dFdUUnVKRXIv?=
 =?utf-8?Q?bksxf0i9NG+S0UjfTc16f8ulT5mD3tRr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHgrcGNhNmZTTUJ3SEgyaUdGbUZRd1hhR1JDY1EzVlZyVXEvTXZyRW9nUlpF?=
 =?utf-8?B?eUEweTJYTDI5U2s4c09SQWd3YkNvbDBpVlo2OGRFTVdBbWtLYW5WOEw2VmlZ?=
 =?utf-8?B?SzBKNGVUa0pBVmRhRExvWHVRdEordmQvUG41UnB6NVplYVpLQW41ZVFEdUVE?=
 =?utf-8?B?eW9iQWl3QUJOd3NsTndZa0UzYlNOVHJvNS9UMnhBbHoxbGlHamhodWlkdzV2?=
 =?utf-8?B?OWo5d0xibDV2TUlYNmY3VWxTNmNLYk9xK3dxUjNZc1BScGd2elpKL1dOWjNL?=
 =?utf-8?B?U1J2RTdseFZpVUMzVHpWQXR2NVFtK0FrNTdEaGl2YVgvc0lsVmRZVnFvNlZn?=
 =?utf-8?B?aEw4Q3hoWmFvR1lhaUhFeWdQRk9LeHVBaU85OWhXeWlpV1dxMmxQRjByYkdu?=
 =?utf-8?B?SXplNkQ5VWptZXNmRFZxYTNQSUNpWWgzZkZ3d01TaTV6MmVSMk9JVDd0QTRT?=
 =?utf-8?B?ZGd3YTlTSmQyMUFxUXJtMjUwMDF0UVBXZHRwWFBlcEVubEZDSk1WVGNGbDg0?=
 =?utf-8?B?UE8vUzFmQmRXVXJWOTlEaVJyaTczdnVNNkNlOFdocXlpNElJYituZzZsa21L?=
 =?utf-8?B?OWI3SU5SZkhOcnl5OXdFUXJxWWxyN0FPRnh6OEN1dTJmR0xmbURnWkJzR0U1?=
 =?utf-8?B?Y1QrMTdXZnRmVXQ0SXJMbkhLc3RES0xzbEc1aEIyQWFkbVJOM3JiMTcrU0VG?=
 =?utf-8?B?SnpUNm5wYVNzU1NYM0I3N04yVzFvWERsNzBFb3M1ZjVka2pSckM1WVpWZmxz?=
 =?utf-8?B?Qkdtd2ZPSElFUnZwSUVMd0h0cGdjc0JBSGZOQytIeDJUTk9GOUJjN1N1aFAz?=
 =?utf-8?B?clBJR1kxT0FVVVZSckRXN1NpRWRoQUlVa2dWa2pGYlRHdFh5cVluTHpjdk9R?=
 =?utf-8?B?S2xGaytSVnB2N2JaNEFCU3RhaFVQUXMzbk91RnRhMVUyaGh6YVhkYnFsV0dq?=
 =?utf-8?B?QkpCaEpPdlA4RDQ0bFVqZ3pOZXdjRFZQL283OWpPdVNHamR6SVA0ZjdGalh3?=
 =?utf-8?B?RVN4bmRYRkpTQzdyTEY2ZnlSeEdzdUxnSk9zUTRIQWdmKzhnTllZc0dncGFP?=
 =?utf-8?B?Yk8wT1Fic1N0ZFhpbzlPcm82SXd2RFFSNHB2THlBVXNHRU9RK0hMTHB0eXlu?=
 =?utf-8?B?amJqRlF2eTBLZUdtUlFjWVM0RE5nT2ZJZGZ6Ym1QY1htcFV6Z0dWUHlaM0V6?=
 =?utf-8?B?cWg1c2pqdXNUOXRraVEzM0NzR0tVaHRzVzhIQXJqK3dudUlCZ1V1ZlpBbjF3?=
 =?utf-8?B?NjJsTjNYa3hBWHgvLytYWjZXU3M5S1RuOUJxWCtlZ0c0bmpBM2hudHkyWUdt?=
 =?utf-8?B?ZDFLVk5TdDlieHA2RWJiOWdsMTZIdlpUMkdlRk84ZWh5U0xpTS9CZjllVTQ1?=
 =?utf-8?B?SEJhQmRaeFRSOEVxMENDUUJEM0k0R0RqVVhJYWhvRUo1NzUybXR5eGRkY1ln?=
 =?utf-8?B?b2daN0VzdVd0d2hrRllrLzV2QkQrMWxrVGJtY3hrQVJ6WHhLMVVkMG9wd05X?=
 =?utf-8?B?L1J1QTEzTC9Jam41VzNmUUp4NjYxbHRPSjFVWnFqZGczeWN2czRoWjFibW5C?=
 =?utf-8?B?VGhNSmRxOThoQTg4RnJTaFQ5elFnME9mazcwYVNYVW1lb3RZOW83Rys1WGRB?=
 =?utf-8?B?N3NGYmQzMlVmVVk3dE5odjJoVU1hYVpKRDdPMFcxQkRKQjc1bWhERXk4Nk0v?=
 =?utf-8?B?WjJTQVJ3VGpGRHJPWmpIemd0cWptdHNvZWsyZE4veVFrUk4wRkszVEIvVk5R?=
 =?utf-8?B?T0doRkZXU2lseC9LMUY0WGtBclR3WEwzSENEamFYOGxrYXJreUhaRDJTQVZj?=
 =?utf-8?B?V09veHUyWEZncGN6QnprK3B6d3Zpa05mdmh2TU9sdURtL3pWMUxuSXdRVHJI?=
 =?utf-8?B?Nmh4b254VmFzVUVoWm1YbkZRSGg5YThRTC9CUnVNRnNkZnFzWDF3RGhPMzYr?=
 =?utf-8?B?NkM1d09TQXBtLzNudy85Z0ZHeDRFQ2hNZVgyTTg2T05FR2tNS1ZkczZ5VkxU?=
 =?utf-8?B?bS9NbUFYYUN6VFV5ZVRRTzd6NlV3VnBxMFBxRjhMUlNMcHVmU1hicEtCNzNH?=
 =?utf-8?B?K0piKzUxazJ1Z0g0Z1lpdDcvUUtXSW1uUzVyZ2wrTUJtUTAwM1lGSjhXVmds?=
 =?utf-8?B?cHgyMUQyTGoxeUlmc1FBK0hndG5vZnNNNUVOa1RlTHFNMi8zOVpydzBSVzFw?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d19330-227f-4805-da85-08de276186e4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 11:48:16.3792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iO9IwAFCChwbH5Ghqvs/w/727SLPKZe46Q+t4Ux2+3aVZ0NLwSz/qb8dJ5i77FF5iQqdrc2n9AyrM8Cqwvk460yYbKgf8OJD2FJ19V4Plkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7638

Hi Jürgen,

On 13.11.25 17:43, Jürgen Groß wrote:
> On 13.11.25 16:32, Grygorii Strashko wrote:
>> Hi Jürgen,
>>
>> On 13.11.25 16:46, Juergen Gross wrote:
>>> On 13.11.25 15:39, Jürgen Groß wrote:
>>>> On 13.11.25 14:23, Jan Beulich wrote:
>>>>> On 13.11.2025 14:18, Grygorii Strashko wrote:
>>>>>> On 13.11.25 14:30, Jan Beulich wrote:
>>>>>>> On 11.11.2025 18:54, Grygorii Strashko wrote:
>>>>>>>> --- a/xen/arch/x86/hvm/hypercall.c
>>>>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>>>>>>> @@ -29,10 +29,12 @@ long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>>>>            return -ENOSYS;
>>>>>>>>        }
>>>>>>>> -    if ( !vcpu_is_hcall_compat(current) )
>>>>>>>> -        rc = do_memory_op(cmd, arg);
>>>>>>>> -    else
>>>>>>>> +#ifdef CONFIG_COMPAT
>>>>>>>> +    if ( vcpu_is_hcall_compat(current) )
>>>>>>>>            rc = compat_memory_op(cmd, arg);
>>>>>>>> +    else
>>>>>>>> +#endif
>>>>>>>> +        rc = do_memory_op(cmd, arg);
>>>>>>>
>>>>>>> Why would this be needed when vcpu_is_hcall_compat() already honors CONFIG_COMPAT?
>>>>>>> (Same question then applies elsewhere, of course.)
>>>>>>
>>>>>> This I do not like by myself, but I was not able to find other options :(
>>>>>>
>>>>>> hypercall-defs.h is autogenerated and it's the only one place where functions
>>>>>> declarations like do_x_op() are appeared or disappeared.
>>>>>> So build is failing without ifdefs as compiler can't find compat_memory_op()
>>>>>> declaration.
>>>>>
>>>>> Oh, I see; I hadn't thought of that aspect. I wonder if we wouldn't better take
>>>>> care of that in the machinery there. Cc-ing Jürgen, who did introduce this
>>>>> originally. Maybe he has concrete arguments against us doing so.
>>>>
>>>> No arguments against it.
>>>>
>>>> You probably will need a new Prefix defined (e.g. compat_always) and set it via
>>>>
>>>> #define PREFIX_compat_always compat
>>>>
>>>> unconditionally. Then it should be possible to have
>>>>
>>>> Prefix: compat_always
>>>> memory_op(...)
>>>>
>>>> outside of #ifdefs and drop the memory_op() in the #ifdef CONFIG_COMPAT section.
>>>
>>> Oh, this might be wrong, as this will break the PV32 memory_op() hypercall.
>>>
>>> You need to keep the current memory_op() in the #ifdef CONFIG_COMPAT section
>>> and move the compat_always stuff into an #else part of the CONFIG_COMPAT.
>>>
>>>>
>>>> This should result in the compat_memory_op() prototype to be always available.
>>>> Having no related function should be no problem due to DCO in case CONFIG_COMPAT
>>>> isn't defined.
>>
>> Smth like this, right?
>>
>> diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
>> index 338d7afe3048..e85943320bd2 100644
>> --- a/xen/include/hypercall-defs.c
>> +++ b/xen/include/hypercall-defs.c
>> @@ -80,6 +80,8 @@ rettype: compat int
>>   #define PREFIX_compat
>>   #endif
>>
>> +#define PREFIX_compat_always compat
>> +
>>   #ifdef CONFIG_ARM
>>   #define PREFIX_dep dep
>>   #define PREFIX_do_arm do_arm
>> @@ -156,6 +158,9 @@ platform_op(compat_platform_op_t *u_xenpf_op)
>>   #ifdef CONFIG_KEXEC
>>   kexec_op(unsigned int op, void *uarg)
>>   #endif
>> +#else
>> +prefix: PREFIX_compat_always
> 
> This should be:
> 
> +prefix: compat_always

Unfortunately, ^ is not working it generates
long compat_always_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);

My version works "prefix: PREFIX_compat_always"

-- 
Best regards,
-grygorii


