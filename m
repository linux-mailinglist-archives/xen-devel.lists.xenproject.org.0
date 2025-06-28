Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B25AEC78B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jun 2025 16:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028334.1402370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVWDd-00066m-Fl; Sat, 28 Jun 2025 14:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028334.1402370; Sat, 28 Jun 2025 14:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVWDd-000655-Cg; Sat, 28 Jun 2025 14:07:49 +0000
Received: by outflank-mailman (input) for mailman id 1028334;
 Sat, 28 Jun 2025 14:07:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XT7f=ZL=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uVWDb-00064m-4y
 for xen-devel@lists.xenproject.org; Sat, 28 Jun 2025 14:07:47 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4333a8cb-5429-11f0-a310-13f23c93f187;
 Sat, 28 Jun 2025 16:07:46 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by OS3P286MB3243.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:211::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Sat, 28 Jun
 2025 14:07:42 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8901.012; Sat, 28 Jun 2025
 14:07:42 +0000
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
X-Inumbo-ID: 4333a8cb-5429-11f0-a310-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+LTDw3qjznyyj5Cyg2Y3KT6Kvo93gY0qynawumS/EdRc479XlxCNxhSYTl8W6LGmD7jFInZx3hJA5HZub5fyaSKaz0JMyIRUQsiy0ns9YYDEmKJfbOeK2utN6ahZpHadk+LhXtdW+zTuuyb9M1iLbuNhe0TSIdZxaQjO61w4F0Hb2cxhho0S9/DElbdkHnUmSURN5Oq3cMYVGyWSejrr8tXgzQXBfn3GPAegIXjQI2hupcssjYOgNogJe1odUHXV2T/7iq4pBGuP7dOgPSRtHevepRN3tnBGV7crNz3oz+NvA5REjTxlWke7HUt0CokpDMapx282hVjTQokM/t7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgl5PQvJZ4OV4myipiXt+4l9Si8lphWW4NdCwHuCHO0=;
 b=EeZifzyc7NWnkDDZCeYd/NlK0NnhuMI6ZPcqRr39myI1KNgbY8B2+Q8bWroZ5xX1RHprUb0oLRJF1ZaDHe4avIWN05VvcMjoVU5yxn0myYJ4OK6h38pji3jzXDAlxsan5aaPq/CKDLpLZBNo5wF7M63WsK9dF/CpPN/R+pX0Zd0oiI/Hr4MOCH5n9SuwZuJeoqkTxXBP2TxGX4jDa7FsAXahyF5RxbfbRKyClMM3re+0Ei5XwYoGASwboOQnPSCRqc8Xx9fWnZtos2vAXNqz3zQaQbWt74lzVO03jocCk9qtTFNXPkdDLH8RA7jscn91mRcarocYzU47kVcnQ5FFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgl5PQvJZ4OV4myipiXt+4l9Si8lphWW4NdCwHuCHO0=;
 b=fV9vZ5BwmjwzTiUclU6wviZUP7W+G3DTvQHZR8NwXy0V75fJy2N3t+VZumgTWpXYD4C6/cooh4w0GUWeIVOzqCQF2CPlaM4W1VGQwTOETDUtr7qM7CjAxZzjY7rgqCjd/O/kK+VSctxnTLEikLGTYr+fPGKJ/x4lgderLT8rTD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Sat, 28 Jun 2025 23:07:41 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 3/4] xen/arm: Move make_resv_memory_node()
Message-ID: <ocakba7y7uee76bm4lejguechs5o7e46zd3cftukagxugk5bcp@ejuxlrcgkkoo>
References: <20250621151201.896719-1-den@valinux.co.jp>
 <20250621151201.896719-4-den@valinux.co.jp>
 <alpine.DEB.2.22.394.2506221608030.8066@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2506221608030.8066@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: TYWPR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::18) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|OS3P286MB3243:EE_
X-MS-Office365-Filtering-Correlation-Id: 9952eb25-dc73-4bf5-9045-08ddb64d25e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlQwOWpFK0orZk5vM2hMbFBDZ2Z3MXo1aDRnaHVBeG00bUFpUXA1a2Fwc1FM?=
 =?utf-8?B?LzhoUDMxNldkSlpvbjZ6VW9lTmxqU0FlQjY3WnZSRVZCd1hXamUzQ1ZJaXoy?=
 =?utf-8?B?eUxCdEtKUXdIdVlxNExjeDQrTlkwOGUxbnQrLzNNREdZSFNINXFXYTUybmVh?=
 =?utf-8?B?Q2ZtWU9kcXNYL0JCUkFVN21PVXZLYzFZZ0pWUHpsM3FUa3VsdGhZUThnQTlu?=
 =?utf-8?B?eVNVRjBCVWRKdSswanVQNGd1WmJzdUo4bHRQdXo2MFVRRzhWWnFyY29lM0wz?=
 =?utf-8?B?YW9KL1B0dEZFeDJYQ1hGQWl4ZHBZU0JNL1RsWXBKRFBibm1uWUxrdWsydGlh?=
 =?utf-8?B?aEhTRFdGMUcrai91UjRVVHpVZnd1RUpVbUVZQkVuQVRoSFRUMVZSTndVd1pz?=
 =?utf-8?B?UzBkWjFqTTk2bUw5VU1yYVkwTk9OS3hVSVZjc0o4M3NWK3VsdDlJck9tS2s0?=
 =?utf-8?B?VHByS2pIZzF3aWp0eWxjT3JPVkQ4S1U3QjRvd2NscjNyWDYxTHVDSno0VmN6?=
 =?utf-8?B?NzJNTFNZS2ZJcDhMRXEwSDI2MjNRTUZtSWdwYk9BN0Fsd0RGTjFoMitSbTRO?=
 =?utf-8?B?SlJRK2xpcGdZOU1Mc09scys3Y1ZVNTVsbHREZzlNSENXSVNiSmV6UGpjTkp4?=
 =?utf-8?B?Q28yNWFucmlXcHVWRlQ3bXJFZ1g3THlTK0VrZ3RLbEplOUMxa1FMbUtDYWV0?=
 =?utf-8?B?RTd1bS90YVJSQUFUVDNqcmJkQUwwZlBWcHRISzgyWEtPTjRPS0MrU0taay90?=
 =?utf-8?B?S1I1SXEwWVFaaFRPcGV0bFpsUzVPZUZuN2R1YlhYc2VWWEsvYmRzSXd2MXBn?=
 =?utf-8?B?ekU5UnQrajNwSUlIMHIzRmhSaTlaZm1mRWo4em9PdWlwcUlqcVNsRnBzUzdS?=
 =?utf-8?B?L1pLZE1QZnVnRnU3Z0dCNHMyREdWZUl2YXYycW84NEhJaDk3blhjWUhIVyti?=
 =?utf-8?B?MzUyTzZGM3UwNG80aGFVZ0o4aGNYSGJDT3pjdE1sTXBNMlJlRHM0TExOQUp6?=
 =?utf-8?B?ZlFhalV2RG4rSXlnQWkwbms5ZW05U2U3eGVyZ1dkSnZkOFN4ZGZHZmhzTWdm?=
 =?utf-8?B?bi9ZejNxVzQrekJvK2U3WWE3RXZnQ1ZrQ2pIYWthU3hZaGFvV1NXQjNRQ2dW?=
 =?utf-8?B?ZFpQQzJxM0VMbmpGMVZ4KzZjQ1ZlbGwzRVpacmE4TDdUSk5PWGc2emZOMVpW?=
 =?utf-8?B?ZUFtSTR5NWt2a295K2tDZUw3d29rV2FiTkdjamc0cFlJazV1WjBDdktOWVFC?=
 =?utf-8?B?RzRMdTBxajNJYThWWVRrcE9JVW4zNExBVStSMmxSNDlqaENhMmF2Qkc0QWhQ?=
 =?utf-8?B?ZWIrRC9JN3VUMERoOTVnWUkyMnIwSWJoclhpQ3NLYjFKVTA0eitEV09HbXh4?=
 =?utf-8?B?WWtZSjFrU0RNNFhFRDZzYU5kZUhXbU96dG42bUZFMGdxWVVlOWM4emhKcHdq?=
 =?utf-8?B?N2lPR0NCUnpVaFJjaUJqblRZdlU0Zk9UaXE1bEFHb1BzNjJ3UWI0ci9CaTNL?=
 =?utf-8?B?bmJoeXdveE93SVdQbDZVN3dOYzdkMHI1UHBsNXh4Wi9MZFhYNityRElWcVll?=
 =?utf-8?B?S1hQY1AzMDVnMDBhZFBGQ3pCaUU1ZDMyWGZSRU1nak5KczRNOXkvTEN3Tk4z?=
 =?utf-8?B?eG1ac2QweGZwR3AySVNydFNTV1FxVmRpZER4aisvZlF1UlEwdG94T0VXT0V4?=
 =?utf-8?B?VlNwNnpZS2ZJc29NV2NQZXQxa2U4VnNYeUxEWHZ4V2hKaGZidlVCQjR1Qkxt?=
 =?utf-8?B?MGRkUWJMcTZHMFU5UUlrT3FHZm81Q280azd2TSt3Y0JYMzU1d1B0c0U0em1j?=
 =?utf-8?B?TS9lZjBFUk5tcmx4aWtoUjZuYlkvZHNPc1VOYjNrVnQ4eTV6LzhEN3luYXln?=
 =?utf-8?B?QXVENGtDUXZQVzF2RkZEQmJGMWdtS1d2NGdPRlpOZ0NhMm5TcSsvb0swVHM4?=
 =?utf-8?B?ZzBkR3E1T2dFaDRVVE1rRGJMVHVXeEdTTWVqWExpVFN5Mng0VUxEZzIwZWxu?=
 =?utf-8?B?Y1lIK2JyVDhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1hZeW5HQkV3QlVTVHdwc0lMb0x5MlRaaDNnYnJtKzB4TlQxN2tQNElkUnVl?=
 =?utf-8?B?Rm5xN3pJZzR4VHNMWFFyRzNFRXAvWk0vVEhRT0VlZlhnaHBVdi9yOE5Ldk5V?=
 =?utf-8?B?SmE4b3V0K2VFd08vOGl4YmtMZVp4K1gxM0dMNTlVV1pzTDBsVnRHU1NmdEUy?=
 =?utf-8?B?QXd5Qkt2d1NRUnJDQnA2VVJ4algwaWQ5ZzdsanUzc3N0ZjdXaW5EV1BCL1dZ?=
 =?utf-8?B?OHRPSENPSWFudDFvZnFZa2RBQ20xSnc0VEJHWGFEL01iVHNyYnltaW1SclR0?=
 =?utf-8?B?MVRWTFUwU0FMWS9ZclFYcUtqYWprSkpFTXZqclRQV0hzMVQ3UFFsdE9VRm52?=
 =?utf-8?B?VDVWY3EvczlHWVovRW9oZ1JOSDVHMzdvcG1HVThFMElKdkU4Mmp5MjlmZlVm?=
 =?utf-8?B?Vkdnby9VZi9QaDBXMktDZnMwVFVLc1QwT2t0cmUxOHpIelZPZXQ5alhtdjdh?=
 =?utf-8?B?RnBGMC9wOWM2QThlTHBPMHRJR01CZUNvUXRIU3NTTCtyZElKRVNWQzJHQ0pV?=
 =?utf-8?B?UEZ4NXBFd3VETWlOSHBRT3E3ZmJhczZIVFZTTzdrVE95M1U3bjJsVHN2Qkxj?=
 =?utf-8?B?WFYxV3ZXWkFKM2NDUnVKOHFXUThWVzRiK0FsM0ZRVVRlVW5OOTV2RHk3bWdS?=
 =?utf-8?B?YTZpaDFzNFovWU9hR3pzdTl6eDdoZkxxU2FnMERkUzJ3WXFHY2UxUGVQUDBl?=
 =?utf-8?B?MmI4NkNUQ24zdS9VOVdHd3lxZFRZVTgxdVdjUDJqTlFqQ3hHNEc0OE1XSk44?=
 =?utf-8?B?anFXZUlDVXVVam9mOVpuUFB1UDh2UmM0SFVnbHNoZ0pHZnRyYlVuTVkrRzFw?=
 =?utf-8?B?aUxCRGlFUEtWN0pmU2xvbEFTekd5OU9lOHo1a3AxTjF6T3I4aFVPb0ZYUlVu?=
 =?utf-8?B?NHAxSjlxT1dsektCQytOaGZ0WWh2alczejQ3UUgwaUNOK21Xdk9TbVQzalQx?=
 =?utf-8?B?MWtQMThFSVNGSXBYRGFTanVESFFjV3NtOUU3TGRzMnZJL29qS1B5K2hld3ZY?=
 =?utf-8?B?K2JMTHNGbnptUGhrM3NXbnVtN3N1WXJMSkJxYjJULzJ1MmVYT1ViNUVvZ3lt?=
 =?utf-8?B?ZWdhM2duNnNzaU9jQVRJYWxMb0dQOHp3UW5kRWE3WlBITmUvbVpUa3ZQSHBF?=
 =?utf-8?B?a2tvRXV4Q3ZmSUNwRGlsRHg0U3RyVHBRdzAwVWk0SVVaSzJmMVVmSExkbkQ3?=
 =?utf-8?B?VlIwbUl1NmdCR2NsbmE0WGZ1UWtUSDEyUy8ybUl1Sm1FRDRIZngxS1IrYlNY?=
 =?utf-8?B?ZTNkekY3dTVjbjNmOVdTQVZOeHpTZW1Lc0pRb3o0V0ZWZzBoeTlpMVh5K1pr?=
 =?utf-8?B?V2diYUQ4cnhVMGpPUzhqalJmbkViWnRaZHpMUFpkRHA0VXd6dnpOSjg1ZG03?=
 =?utf-8?B?OGlwRVVOZWNGUnhOdUFUbm9NbWdFZy9WVmFWZUpLYWhOM1B6NDU5YzUwUGJh?=
 =?utf-8?B?U002dFJxcW5ESEVmNEJBTTY4OTJTUHRyYVNOcUxHaHZmQkg5cFRhRUo3T0tv?=
 =?utf-8?B?dXZ1Snk4SjB5TWFKVWpqWHVTMnBycFRxa082Sm5Wb0Y2T2YxUnJQSEozazJs?=
 =?utf-8?B?a0loV2Y0TXdpU2hwRURGUjkwU0tOUDJueFMzb01UYmFvWXo2WEhibFFXV0Yz?=
 =?utf-8?B?WWc4L3VuR0NvRDhoSDRYM2lBUUJmQzBiK29pQUtUSFJKSzRKTmtMZUhHMXpr?=
 =?utf-8?B?SkxaTVBBRS9NMVdKVmt5STF0TjJKLzRrVjcvRGF5S3ZwRmhjUW1uV1d0dVBW?=
 =?utf-8?B?Q0svejVkaGpST1ROTUp2Yi9HV01CL0wzYllQWTFRRzBhWldQM1Q0SVg0anlY?=
 =?utf-8?B?WEFXZUcrbjFtQ0pFVUdNNTl3QlhKVVFPZmR5Uk5QWXBlTjNoaXAzZVY0ODZ4?=
 =?utf-8?B?T0NsdDBYbld6SHRQRDdtd1k2TExQWXlIdjRPUEpWeENhTDFTbmVrcUErMlli?=
 =?utf-8?B?UVEwV0ZyZDkyWXRYNlFmdGlvT1Z2b3BJZEVyZkFwRlVNNHQ2aVVXZXQ3ZUVL?=
 =?utf-8?B?UHZZS0t1b2Q4SDFrbVA5cDlPZVdrTUNodFJMM1dOMTBQLzdhd2RPd0JvYk91?=
 =?utf-8?B?b2RmM1l1VU1mNUw3R2hHSlgwc0s4VTBPN0pYUXJKUndURHM4WDBTam5scUQz?=
 =?utf-8?B?Q081azNqR2VYUmM4YnM3MkxteGdiY1BDT0ZmcE1jbVp3V1lGNDB3eTZWWnlU?=
 =?utf-8?Q?9B5wlNRb7EIgqD3VC0ylMyE=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9952eb25-dc73-4bf5-9045-08ddb64d25e4
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 14:07:42.1876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYQ4euY2BLMzBcwKRlp1XU83TKzHHXgNJtILj6kczdGxp1ILAiC4kzsdlF7nJnbJFgN4rDefpD2gEKWAvkPOzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB3243

On Sun, Jun 22, 2025 at 04:12:15PM -0700, Stefano Stabellini wrote:
> On Sun, 22 Jun 2025, Koichiro Den wrote:
> > The /reserved-memory node is inherently not specific to static-shmem. In
> > the next commit, child nodes will be added under /reserved-memory for
> > the stolen time shared memory regions.
> > 
> > No functional changes intended.
> > 
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> 
> This causes a build failure when CONFIG_STATIC_SHM is missing.
> 
> arch/arm/domain_build.c: In function ‘make_resv_memory_node’:
> arch/arm/domain_build.c:1567:34: error: implicit declaration of function ‘kernel_info_get_shm_mem_const’; did you mean ‘kernel_info_get_mem_const’? [-Werror=implicit-function-declaration]
>  1567 |     const struct membanks *mem = kernel_info_get_shm_mem_const(kinfo);
>       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                  kernel_info_get_mem_const
> arch/arm/domain_build.c:1567:34: error: nested extern declaration of ‘kernel_info_get_shm_mem_const’ [-Werror=nested-externs]
> arch/arm/domain_build.c:1567:34: error: initialization of ‘const struct membanks *’ from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]

Thank you for pointing that out, I'll address this in v2.
> 
---(snip)---


