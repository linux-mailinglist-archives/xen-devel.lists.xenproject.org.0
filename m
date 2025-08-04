Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F01B1A409
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 16:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069448.1433301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivnj-0001Vl-Pq; Mon, 04 Aug 2025 14:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069448.1433301; Mon, 04 Aug 2025 14:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivnj-0001TB-N2; Mon, 04 Aug 2025 14:04:31 +0000
Received: by outflank-mailman (input) for mailman id 1069448;
 Mon, 04 Aug 2025 14:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YK6J=2Q=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uivni-0001T5-7e
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 14:04:30 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed0436b0-713b-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 16:04:24 +0200 (CEST)
Received: from DU0PR03MB8934.eurprd03.prod.outlook.com (2603:10a6:10:473::15)
 by DB9PR03MB9757.eurprd03.prod.outlook.com (2603:10a6:10:452::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Mon, 4 Aug
 2025 14:04:21 +0000
Received: from DU0PR03MB8934.eurprd03.prod.outlook.com
 ([fe80::26fd:98f2:a1cc:be40]) by DU0PR03MB8934.eurprd03.prod.outlook.com
 ([fe80::26fd:98f2:a1cc:be40%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 14:04:20 +0000
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
X-Inumbo-ID: ed0436b0-713b-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIQG6JtOMuN8liyCgsZDg5tr7V/M+LQiDFdoSsBQr1KmrdXcsJ1H7lnjB9yprpMRpdyfthQiNgQNnZiF7mwjjLXLVhO7dreS1JD24wHiFDB6bYB5fQihXLBQD7Q3telfwHDyWx7GwY28u3CycrlytgkXS5UD5csNUb5p986fF9Mnrt9cNqMsVv4AdJLHXvyPWlDQ1XXc73QDN58cUl8X3US4lr3Lzml84pmgkMKo2lF6S5OcGh3NhY3lJ3+AycEoewIbqWnHFpBsOOh9FB8FGbtKdApl9iQ7HPoM04GNIktXzNG+EoEpGnjDlCMCcuqMg+3jfXh9UbOu2QwHJ8FCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vu6MddREgGAtSNktMQMMOvj4GGfmyBeAArmHW3YLlE=;
 b=dqt9Z7LZcgoTG+FMv4FXJpc+GFPLiotl5AjEVfpz28jf/Pyhq1+uUc/Slu/xWIzRoqQI9Z6JybyknOmtTFHraFQft3ETOF4OqlOdbI1iQT0kXwne7vmtu1Cj9SI9b1Y4F+FjcA3h3l99qUKBBiwowRGGOYzzAAvTGxxjCTP2HWDdM/tb22xD8vsl0alK/KKn6QNaFrMkiYbF9iMgjlAx7v/qrCmGYneY5Rg9k/5WI/wY4I8iMmmCfWgcZAfLPU2+BGMoNDkwWZJbcLPX46c0+kzxuXyv16My6x35/qap4p0NoROP07ydH0WF9c2/YImEYsBGqE2NyITJ2Tnn1WFnRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vu6MddREgGAtSNktMQMMOvj4GGfmyBeAArmHW3YLlE=;
 b=qaZoGCZIWwnC2xZp+ZFOjBr2sNuLLGOzWmPs+hpnSTVZ4SVBwBAMF3yZ78ud8rDGQ5WT4+CI5+xbxMJOAXAwfFJbkxvaM/gpcuJGEBKMNxJT/dILFXuCSu5c4oDiP7hmDr9DPm+zP6v2lAVeCgX/tZi8rxi3ZDnBVt2PMlegTDiryYvQxRxmur2WWxTjsrYgZzoVAz2hL0iFZM1BsIYPaI1/+sZyw81f9blc8pDbIqVXJiH0kVRNcuH51xLFab6MJnifn5lp1UM8m92lyAaVpH49tIxNkJd3j1ezCaQmeQcPAikFwn940RBKrqyHIaGuEQ1leItpymwofvxJk5TpZg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "dmkhn@proton.me" <dmkhn@proton.me>, Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: Re: [PATCH v2] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Topic: [PATCH v2] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Index: AQHb/+IacHiE2y5puk2LQertSkS3OrRIDWwAgAC2NwCAAOeoAIAI5joA
Date: Mon, 4 Aug 2025 14:04:20 +0000
Message-ID: <63781514-eef6-46c8-992f-56bde2f07e82@epam.com>
References:
 <90e79e175b5f703f33944415df3c7a73d6abc385.1753722403.git.oleksii_moisieiev@epam.com>
 <aIfrhfoaEBx2tyM3@kraken> <182d2b92-ba93-4916-a277-d7996b784fa2@suse.com>
 <aIlGtLz4ZxNwE/gO@kraken>
In-Reply-To: <aIlGtLz4ZxNwE/gO@kraken>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB8934:EE_|DB9PR03MB9757:EE_
x-ms-office365-filtering-correlation-id: d21f964a-be22-450f-5795-08ddd35fcf2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QzcwS0FZdERmUnFUcUI4RlhobnZlR1JSS2RZVGJrT1ZlTUZXVjhpRko3U2Fs?=
 =?utf-8?B?cUJ2S0RzNjM4TmdOOE1BZ2NaR1hSYzI0cVBmMTdCcThRUXhyVytvQkl5VVB1?=
 =?utf-8?B?UnIrU1ZGdXlkUzFxN3JNd2ovdWxKMnFrUmRLOXRpbzM4d1UzSEtrNXRxZGhx?=
 =?utf-8?B?WExKejlpZkt6UUpTSjN6SDA0ei8wOW04VXRxR3MvcFFLV0lXSlFvOG1qNldF?=
 =?utf-8?B?TmMvRzRBbngrRjRTbE1YNnlUWmRzTktjUjZLQVB3a29oOVZPcVEwSEJBa1Bk?=
 =?utf-8?B?RTUzNGZXNDhCWFg3V2xNellrUmE0K2lMdlFoUmdZb2Noczh5cjY4TXpFbGNw?=
 =?utf-8?B?aFJqRHhXMDVyNDI3M0tjVld5MlJFenVHQWdtemhFSWljK3BMdFpsNkJzbDY1?=
 =?utf-8?B?T3hPSFNvR2tNak95ay9nalhzVnZTRHFES2gzdEhFelFBbGRUbGU2bTFKN0Ur?=
 =?utf-8?B?L1hOWnFhdkJKaU0rL0tlUldOSHJYTW1uUnNXTzZydXVZVVI2ZWowQnJHTU1s?=
 =?utf-8?B?SkNMVldTU3ZVdWFzem5mVHcrdG1rU1BoQ3dIaUY0cC9tc2ZJSG9DakZRT2Nu?=
 =?utf-8?B?V2FhUFNvTGZ0UG1CNCthZFlsT3U4amNGVFB2ZEY0SGVtRVplbnNNT0s3d05n?=
 =?utf-8?B?Yll2T2podDNRWFJXWGZ0Uy9pTlRrSnRsL2dSWllDandSWlpMRjdsUjNXRGxi?=
 =?utf-8?B?YU1RUGN4N0pRSGZ5bWNEQUdaWTZUa1crK1lLbE1YeUhackVBaWRuQitmcC9F?=
 =?utf-8?B?eS9Sa1hrWjRwZk8zdndmdGlYaGo4YjhuemlTbTBjNnVuR3pnWXBYSjB3Ni9M?=
 =?utf-8?B?c3dRUmtmRmVPSjBxeGVmb3BtTXgrMFJTckp2RjJ0SzNXSUV2OVJOSURnbmdD?=
 =?utf-8?B?cFVvZy8wOEZiYVVMVC9FZTlFNDdWSjZRdlY5ZWhBUTUyUzh5ZUxLY0ZIMVRH?=
 =?utf-8?B?NnFQcWdwYm1zYTNlTmdVTXN6dDA3NFJwYU02TU93c3ZLUWhBK1o4TkpaaFdV?=
 =?utf-8?B?SXUvcklaNy9VYldINlhrZUQ4S3E2Qzd2eDh4VWx2RG5PeTY4bDNTY1BkRk56?=
 =?utf-8?B?cUtRd0lpZ0ZocVhmMWxZZnVsc1RsbDhUNkp5bmFpZ2piWXdHMjlMTXNpZ0s2?=
 =?utf-8?B?NHQxbm5HMXJyV2hGV3ZHSC9GUkkrU2FSU1BoRytsQTRnNmU4SUxpZC9LUzh6?=
 =?utf-8?B?aFRFd1Y2ZTFweUtoSzZrWjlJdDVOMU1nRmpyR3g5S0Znd0xuNVl1UEtKZTJX?=
 =?utf-8?B?MTdKb29CMDNKeWJNcDc0SlY5bGRVcGNINkVKQzhuL0U3V1lBYklhQ1VJbWFJ?=
 =?utf-8?B?VTJPL1lxWVpxeFZaOHZ3RDFKeHdSYS90UE9oeXhtbmU3ejkraEhKQkx6aHBx?=
 =?utf-8?B?Z3cwcEhFNGVJVzFoUWw5SncxeFVTRHFDNXY3dHdkYXBhRnFTdHJ0NDJDTjVO?=
 =?utf-8?B?eXBTZlVRd1hGTFNTUUJWWlAxRVU3czVmQnUzeTNWQXNUS2gwWUZPeDRzVVhS?=
 =?utf-8?B?VUNvNmk5elBjV1puYTQzWWIwU0VVaHdpblJ1Ny9uMndXbVB6NUtiRlR4Mzg1?=
 =?utf-8?B?aTBucENaNlFiOW1xQzJWc3lpTTcrVng2NGIvS0J0dHF4a0hsRyttMVp5amRU?=
 =?utf-8?B?am81a2NGellDZEtSc1c3UkM0YWFtVEcxMUdjNkJkeGdJdkdxS2RPSTNiUUNt?=
 =?utf-8?B?azd3WkRKVDFhUDJzamZCT1RpUG1pOG1KR2hMZHFhb1RTaWlPNUVNS2dERTFr?=
 =?utf-8?B?ZFBGSG5MYU14S0VFWUhHam9aQUJyK1QxbUQvYTMyZTFWN0UrSVU1WEVvZlFh?=
 =?utf-8?B?d1Jzek5uU0JRSnRaRVNzSStzU0xjVkRXcXZLSHYwQS9IUTV0aldiTzQ5R2J2?=
 =?utf-8?B?VkpWSnFXa3ZHUmoyTW80ZWljNkp5dU8xOWZDbStNY3Z4QmJoSi94cE1yaGpF?=
 =?utf-8?B?aURXSUhOa21CVXEwSTJJdFJiTi96Qm55d0lGMy9QZ0lTZ2hrWjRiVWQ5VkRY?=
 =?utf-8?B?aFVLODRocS9nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR03MB8934.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1A4VnpDaEdFSUUvQUZCVFBJNXdTSjExeWhWd2VGd204aDdIOTNDQkZycnNC?=
 =?utf-8?B?RXA0ZkQ3RGZjWC9uSTA4MVE1Vnk5T2w2NHRMRnNUOGxTNGhJdmN4RGtrbTEv?=
 =?utf-8?B?OHFIMGcwMU9YMGZuUWh0RXFFbFBtNkRKK0hldlJXUzVhTEFnYms2SWZCSjlv?=
 =?utf-8?B?UGh5M1RSY1VTeVpySElUUytVZURTODJGS3MyVXBDWWxNczRmSE1qZUVIdkti?=
 =?utf-8?B?d1E5L2dJeWxRVmlVeTdKWGVwd0ZyaGVYVmdqRWdWNFltUlMvWFZjUHFuZ0hE?=
 =?utf-8?B?MnZSYXg3d2RLVHM0cXRFdVBSUURtdFNDemw0bXlGNktpOFkzdUlvVnJwMk5k?=
 =?utf-8?B?K2JuUCtiV2R0YmhoWjVScEZIUDNwaWNDLzlyMkFkNkNDMnExNlVOU1hYTmpH?=
 =?utf-8?B?VDhGSENuTnFEUml0UlMwU0NxdzRLNWJJSk5PZHU4eWlsNG1ENGFnRjhsclB1?=
 =?utf-8?B?eis2MUE1cDlOT0JVZTlZMHl4MWVaSitCZmhidkpVc2p1a2lYUHR3Rno3TFFy?=
 =?utf-8?B?WTkvTjNPbmJraWpmUFY4MUdVdEoyenF4aXh0MmtWZXpHT3FydkhSaGsvbStK?=
 =?utf-8?B?SDVzUy9HaWdtcVFJS0ptN09HVVBtU29ieGt2MTl2Z0orMEhwdHJibEoveXNh?=
 =?utf-8?B?NWpmNHJuNDZXY3BZOUp3MlRVK1lrcHp0anRVaHFVdkhiNnFDSXlkSDl2OXJM?=
 =?utf-8?B?K2R1T2VmMVNUVnVrTFdiL0xTWjVCZzcwMEp1aHhqQmhWNXoyUnZjMFB3TE1D?=
 =?utf-8?B?Rzh2VU91TjY0ekU1a2dyWVVNYXZXQUpwb0lCeGRScWZBYlBlNUhxbDQ1dzBt?=
 =?utf-8?B?YjRrQ3Bqa1A0eTRmMVlHRjh0S0xOekhHNWJUcENVRXVLZmNPNnpaQkdZVm5z?=
 =?utf-8?B?UkpRSURTV2VXV05kaFFGb0dCOGs3bEF1TElXZHpIU20rZzE1R1JjbnFReXNV?=
 =?utf-8?B?OUdZR0diNERQUWljZ1o5TFk5VmdVdmNjUXJYbFpSc1BTZ3h4Vk1WT3E2aE1h?=
 =?utf-8?B?N1A4NHI3eG15MXFlbTVrYW1nUE5pQXlVcWxBN0lsTDJHb2E3TDNnbUJGWXhp?=
 =?utf-8?B?U3pXYzBnNG9VVHZjSERrM0N4WHorMUZZVFBoamhiSUZkTXFKU0hyc3dpTkxX?=
 =?utf-8?B?VVBKeHFpbnd3M3EvaFU2N0EvWnBMVFBWRVl3R0NTL1ZGbXJ2ZDhGbmlRdmw0?=
 =?utf-8?B?RXhjMmk3THRHSER1SzBORmhjcTV0RGl1NDVGMU5aMktHeDlwRDlMS0xxc1kv?=
 =?utf-8?B?QURhemVXNk1pQXRCNnhYb0liblFyaHI1TkdSWEZXdml5VlNjWEs2MUxEZGtt?=
 =?utf-8?B?UUlsVUozVDc0WGF0ampNaGw3Z3JNNDlhUlNQTnk0M3I0OG1IVlRwYVVoTENV?=
 =?utf-8?B?MVpVWmFWVXppekEwdnkveVFsMWlOTXdRY0htQmkwZXFKNUpHMzB5NlFtZUdU?=
 =?utf-8?B?TWZoQlpxMCtTT0tOR3huclJuTFVhN2t4SGd0V2EwS3F4S1pCa2pDSDEwNnZP?=
 =?utf-8?B?OG91a3gybXBzTXFwR0VnWlJXMzNLejlWbEh3TjYrYStsNkg0WmI4MVoxNEda?=
 =?utf-8?B?dVRZQmp0eHM4cWE4YTVnWVNHb0VpWUJnNkk5TFZseUZ4MGxrbU52a3VPTklh?=
 =?utf-8?B?WTEwTDRuQWhuaUNMaTNVdlplMC9uSTlKUkIzSXovc1B6bkl6RUZRNXN5NG9Y?=
 =?utf-8?B?ejNYUmNzODE0WTNPRUJacXk2d0lLQmo2Vzhad0dYZFI2dStlYmJzNnI5RVJZ?=
 =?utf-8?B?WFRYS3VuWFgzUWtUM0lxWUR4YkMrL01rcUdma1JHMjNlQTNqeHkwNkx3VTlT?=
 =?utf-8?B?K1F2UzkzdlEwWXFvajljemJyVkx5Q241QmFzZlRzZloyNUx1RWZCcmlIVjRy?=
 =?utf-8?B?dmxSZDVvamJoNzJaaWhuRHdicHU0RG9YWnhDL1E0UkJ4N3VRQVJoK2xpQmlU?=
 =?utf-8?B?TldOc0dHb1pENDVpQlFmRXRLM0RzYXB0VzlXYnhHblBsTnNFakpTaS93THVu?=
 =?utf-8?B?WnZVUngxWFZzOGd0SUdLV3VoYkVieUIwdkVmTStQdEp1Q2xxaHBTdENDdlhZ?=
 =?utf-8?B?VVllTFJBRXFua3lkT1dJL0drOTRaWHA5Snd2ak1CWDB0YkFXdzRCUmhBUnhU?=
 =?utf-8?B?dmIrUzlTdEFvaFl5R0FOQm1ZTXI4WmlnTkNqSzZ2R05ML0hnWG1UYkk3Q2lQ?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF514D3A2BBD1943BFD5A4DD12617CF2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB8934.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21f964a-be22-450f-5795-08ddd35fcf2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 14:04:20.7392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IXME0W+u8GhTVCcYpHt7iydBaod12AZCcenEeUNFWU7KzNMzyXNN+phP+7/wo/HwhVZmANwY8etfz1xYfKILnCeP6nqiLg8cjVcPcwMujZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9757

DQoNCk9uIDMwLzA3LzIwMjUgMDE6MTAsIGRta2huQHByb3Rvbi5tZSB3cm90ZToNCj4gT24gVHVl
LCBKdWwgMjksIDIwMjUgYXQgMTA6MjA6NTRBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
PiBPbiAyOC4wNy4yMDI1IDIzOjI4LCBkbWtobkBwcm90b24ubWUgd3JvdGU6DQo+Pj4gT24gTW9u
LCBKdWwgMjgsIDIwMjUgYXQgMDU6MDc6MzBQTSArMDAwMCwgT2xla3NpaSBNb2lzaWVpZXYgd3Jv
dGU6DQo+Pj4+IFRoaXMgY29tbWl0IGludHJvZHVjZXMgYSBuZXcgS2NvbmZpZyBvcHRpb24sIGBD
T05GSUdfRE9NMF9CT09UYCwgdG8NCj4+Pj4gYWxsb3cgZm9yIGJ1aWxkaW5nIFhlbiB3aXRob3V0
IHN1cHBvcnQgZm9yIGJvb3RpbmcgYSByZWd1bGFyIGRvbWFpbiAoRG9tMCkuDQo+Pj4+IFRoaXMg
ZnVuY3Rpb25hbGl0eSBpcyBwcmltYXJpbHkgaW50ZW5kZWQgZm9yIHRoZSBBUk0gYXJjaGl0ZWN0
dXJlLg0KPj4+Pg0KPj4+PiBBIG5ldyBLY29uZmlnIHN5bWJvbCwgYEhBU19ET00wYCwgaGFzIGJl
ZW4gYWRkZWQgYW5kIGlzIHNlbGVjdGVkIGJ5DQo+Pj4+IGRlZmF1bHQgZm9yIEFSTSBhbmQgWDg2
IGFyY2hpdGVjdHVyZS4gVGhpcyBzeW1ib2wgc2lnbmlmaWVzIHRoYXQgYW4NCj4+Pj4gYXJjaGl0
ZWN0dXJlIGhhcyB0aGUgY2FwYWJpbGl0eSB0byBzdXBwb3J0IGEgRG9tMC4NCj4+Pj4NCj4+Pj4g
VGhlIGBET00wX0JPT1RgIG9wdGlvbiBkZXBlbmRzIG9uIGBIQVNfRE9NMGAgYW5kIGRlZmF1bHRz
IHRvICd5Jy4gRm9yDQo+Pj4+IGV4cGVydCB1c2VycywgdGhpcyBvcHRpb24gY2FuIGJlIGRpc2Fi
bGVkIChgQ09ORklHX0VYUEVSVD15YCBhbmQgbm8NCj4+Pj4gYENPTkZJR19ET00wX0JPT1RgIGlu
IHRoZSBjb25maWcpLCB3aGljaCB3aWxsIGNvbXBpbGUgb3V0IHRoZSBEb20wDQo+Pj4+IGNyZWF0
aW9uIGNvZGUgb24gQVJNLiBUaGlzIGlzIHVzZWZ1bCBmb3IgZW1iZWRkZWQgb3IgZG9tMGxlc3Mt
b25seQ0KPj4+PiBzY2VuYXJpb3MgdG8gcmVkdWNlIGJpbmFyeSBzaXplIGFuZCBjb21wbGV4aXR5
Lg0KPj4+Pg0KPj4+PiBUaGUgQVJNIGJvb3QgcGF0aCBoYXMgYmVlbiB1cGRhdGVkIHRvIHBhbmlj
IGlmIGl0IGRldGVjdHMgYSBub24tZG9tMGxlc3MNCj4+Pj4gY29uZmlndXJhdGlvbiB3aGlsZSBg
Q09ORklHX0RPTTBfQk9PVGAgaXMgZGlzYWJsZWQsIHByZXZlbnRpbmcgYW4gaW52YWxpZA0KPj4+
PiBib290Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIE1vaXNpZWlldiA8b2xl
a3NpaV9tb2lzaWVpZXZAZXBhbS5jb20+DQo+Pj4+DQo+Pj4+IC0tLQ0KPj4+Pg0KPj4+PiAtLS0N
Cj4+Pj4gICB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgfCAgMSArDQo+Pj4+ICAgeGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgIDggKysrKysrKysNCj4+Pj4gICB4ZW4vYXJjaC9hcm0v
c2V0dXAuYyAgICAgICAgfCAxNCArKysrKysrKysrLS0tLQ0KPj4+PiAgIHhlbi9hcmNoL3g4Ni9L
Y29uZmlnICAgICAgICB8ICAxICsNCj4+Pj4gICB4ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAg
fCAxMSArKysrKysrKysrKw0KPj4+PiAgIDUgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkNCj4+PiBJIHRoaW5rIHRoZXJlIHNob3VsZCBiZSBjaGFuZ2VzIGlu
DQo+Pj4gICAgaW5jbHVkZS94ZW4vZG9tYWluLmgNCj4+PiBhbmQNCj4+PiAgICBhcmNoL2FybS9p
bmNsdWRlL2FzbS9zZXR1cC5oDQo+Pj4gdG8gY29tcGlsZSBvdXQgZGVjbGFyYXRpb25zIG9mIGRv
bTBfbWF4X3ZjcHVzKCkgYW5kIGNyZWF0ZV9kb20wKCkgdW5kZXIgbmV3DQo+Pj4gQ09ORklHX0RP
TTBfQk9PVC4NCj4+IEFkZGluZyAjaWZkZWYtYXJ5IGp1c3QgdG8gaGlkZSBkZWNsYXJhdGlvbnMg
aXMgb2Z0ZW4gbWVyZWx5IGFkZGluZyBjbHV0dGVyLA0KPj4gd2l0aG91dCBwcm92aWRpbmcgYSBj
bGVhciBiZW5lZml0LiBJIGRpZG4ndCBjaGVjayBpbiB0aGlzIGNhc2UsIGJ1dCBJIHRoaW5rDQo+
PiB3aGVuIG1ha2luZyBzdWNoIGEgcmVxdWVzdCB5b3Ugd2FudCB0byBjbGFyaWZ5IHdoYXQgdGhl
IGdhaW5zIHdvdWxkIGJlIG9mDQo+PiBhZGRpbmcgbW9yZSAjaWZkZWYuDQo+IHJlOiBjbHV0dGVy
OiBmdWxseSBhZ3JlZS4NCj4NCj4gSSB3YXMgdGhpbmtpbmcgYWJvdXQgdGhpcyBmb2xsb3dpbmcg
Y29kZSB3aGVyZSBpZmRlZi1lcnkgbWF5IGJlIG5lZWRlZDoNCj4NCj4gKyAgICBpZiAoIElTX0VO
QUJMRUQoQ09ORklHX0RPTTBfQk9PVCkgJiYgIWlzX2RvbTBsZXNzX21vZGUoKSApDQo+ICsgICAg
ew0KPiArICAgICAgICAvKiBDcmVhdGUgaW5pdGlhbCBkb21haW4gMC4gKi8NCj4gICAgICAgICAg
IGNyZWF0ZV9kb20wKCk7DQo+ICsgICAgfQ0KPg0KPiBCdXQgbG9va3MgbGlrZSBjb21waWxlciBp
cyBjb3JyZWN0bHkgdGhyb3dpbmcgYXdheSBjcmVhdGVfZG9tMCgpIGNhbGwuDQpZZXMsIGl0IGlz
LiBJdCBpcyBwcmVmZXJhYmxlIHRvIHVzZSBJU19FTkFCTEVEIGluIGlmIHN0YXRlbWVudHMgd2hl
bmV2ZXIgDQpwb3NzaWJsZS4NCj4+IEphbg0K

