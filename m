Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A2CA01C4
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 17:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176963.1501401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQq18-0002pM-Ej; Wed, 03 Dec 2025 16:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176963.1501401; Wed, 03 Dec 2025 16:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQq18-0002ne-Bn; Wed, 03 Dec 2025 16:47:50 +0000
Received: by outflank-mailman (input) for mailman id 1176963;
 Wed, 03 Dec 2025 16:47:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WC6h=6J=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vQq17-0002nY-0P
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 16:47:49 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbb71cb4-d067-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 17:47:46 +0100 (CET)
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com (2603:10a6:5:3::28) by
 DB4PR03MB9412.eurprd03.prod.outlook.com (2603:10a6:10:3f8::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Wed, 3 Dec 2025 16:47:43 +0000
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66]) by DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 16:47:43 +0000
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
X-Inumbo-ID: cbb71cb4-d067-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1laEPJ5/DKUl1Kwm9OHgUKQ7kw5k7Jw+njb5eUgWutEEyRUG4h6J1nmhjakSWxSrUeBPDcU6/ZO6ULD4p05biZCFMNmcaVCthzyVcFbss8CKHa1O+84PIJV+s9IdzrUxbiV2CDnZFK0QDabbQmthVIUmzn2FKjnUkfB/KejZfB4CCeeSLxuipVxbzWvjz/sOsQ8eG3uEg7cSrm+ec5Cgn2Ey5wVxEmxBbQnT2EPXcceoJSiqOdHg/sHXd+pmFMICZs2agbjAgLkB2nNGbNJi3jLZaUG2tjh5Qch5fd0iEVsU9syqNOVYlU3JKyzS5Zq6iSPUmp8vG6R8uwRfVgP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGoeMGDyK8mIHLXtZi2wh1tcABLeq6d3HDNB7BSiNig=;
 b=eU/t6vNbFxDfjnjsOEWsATpbq6SjgvIvktAvMsezxupYATVM1aUOKz1dgT6V5eewCjTjT3CDcDidg7Ng2cTrM9z+8ufojMD5+FTAP1GPhu7nm7bAFAK+UtoZ0B8mQuz6Ge9UleRMGA9GaOTE/fyVeRrX2HHTJaEk88fdU5ZqeKYCJrDy1vWU2oU/Jf85MQqO1rlw5emaIavp+YAJVPOU24BubPnBY8mxNjx8jvKlNDfyZ0MKWu/XJvtQfo1LfsTartTyoMQGuV8sHjBs6/CDmQJb/9XydsltNwHWACVWnJb6gpwG6CYRwaH15ysAbKTeaoOlhhpbTjjl/1k5QpmR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGoeMGDyK8mIHLXtZi2wh1tcABLeq6d3HDNB7BSiNig=;
 b=qNyBya3gBR3378rwHtKbua5STPETygRl19BuHKHI5Qm7Ftm4o2bGDWTvnQWAbpdHW12meUHS1nGuFdHzqcYTbAlRKAbVx0Z4TL/PUqkHL5jIQ9vy2/poittfWByS2y+dXr4ZQGNVHDX2JoYkTcvBBO0VZ0c4u7iRV17pbsdOACYB1NTD0SWWuc37enrqLT1FnlF5TI/kZvtqWzPqL4Ral6UKlRogre6ua7DviEJC8VvGKmI5ShBEFWWUr+MoiIvQ6lqv1UBIe/pVvUUupRYbhlyJjxjpJRXagL47+ZFGjJJQgcmJFqVqy/qJf2nv7/OYECvDGnXnwDGSyIGCuN/EPA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH] xen/dom0less: Increase guest DTB size for high-vCPU
 guests
Thread-Topic: [PATCH] xen/dom0less: Increase guest DTB size for high-vCPU
 guests
Thread-Index: AQHcY8JwgLGK5hUeEUKxVWNaY5XmsLUO3xoAgADiZoCAADpaAIAAJbeA
Date: Wed, 3 Dec 2025 16:47:43 +0000
Message-ID: <add1ee27-7ea1-47ca-9721-ac49e7326184@epam.com>
References: <20251202193246.3357821-1-oleksandr_tyshchenko@epam.com>
 <98e9f551-cd8f-4c0c-aa79-144466e68df0@epam.com>
 <a1443030-f594-4f25-b12a-37974eae64d2@epam.com>
 <6a724a9d-dee8-483d-89bb-050aff381077@epam.com>
In-Reply-To: <6a724a9d-dee8-483d-89bb-050aff381077@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB3577:EE_|DB4PR03MB9412:EE_
x-ms-office365-filtering-correlation-id: 9dad189e-b560-4db1-7e27-08de328bae1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z0JwTk90SUphQ1Nlc3RFTDJlVDErZG80QWNNSDBjcDhnS2gyVjRCMFo5Z3o4?=
 =?utf-8?B?QjB3S1VCUUl0NjJvRHFYSG1NbWVtdGp5UFR3VGFnOU94ajlGZXRLU3p1OU4z?=
 =?utf-8?B?UnArclYzSUdVQUZ4UU1kbEg2VGJYcDFjODJGdlVTOEtsMlg3ZTNDbURmN2RK?=
 =?utf-8?B?QVY5dHNUckxoSDZ1MEhEUjAvS0dUYXIxTkpUeWcvZXJFUVJSRjIxdGNYYXUw?=
 =?utf-8?B?dEVZcDlVUHBRcXlYL29yUUJsMEN3Z3R6cG5HWTRmc2U1S0hYUlBtcDJLRWJ1?=
 =?utf-8?B?VzBReTJPYkp5bnlXT1p0K0l4dUZXUm5BRm01cG52cFpzN1NCTmJweWljc3Fl?=
 =?utf-8?B?b0NSeCt3KzFxckZ1RXVyeU5NUmQwcTFSbVFteHF2Z0g3d2ZCSERYc0pBVjh6?=
 =?utf-8?B?bDRjOW1IcERsS21hTVozdThVd3hSSm9KRG9DTlRPaG9rVmVkdFdzcW04ZHBm?=
 =?utf-8?B?ay81NVRnNm5IYWJXQUxSMllnY0xBdTBzUFlMSTQ4KzlnSVJkVFowb09MN2Jo?=
 =?utf-8?B?eEpsNHU5MGIvSFVnSWZQVndDaFZuK1dkQjRvaDB1RXhseVJtM2hibUVpWmJM?=
 =?utf-8?B?TVJFbEFZVitCVGRRbHVycTZFcXZaNU9pby9hTG8vWGZibFo2T1NETURnN1pP?=
 =?utf-8?B?UHlYZVRmMkcvMmZ3T2ZaM0ZSZmVLWnIxcTNhMkxKNHFuK3NFcGlsdHFNM01O?=
 =?utf-8?B?MFhrR1llT0dPQktqQk5FbVp0bFhwUVk3ZjZBVnFQV3lJcVg5a3BhazVJcVdr?=
 =?utf-8?B?YWFJWDlrYmxHd05KN2p1V0hHMEJnajk2RmRoNVRXYktxaUtGdFZ0dkRoRG5u?=
 =?utf-8?B?Y01YOTdVVzE0MmR0blNCaTF2dkgwbVUrTWRBcFhiS1pEVlV1YlFDWlJ1REZS?=
 =?utf-8?B?OTcraWY3OVBIOHAydG9xdUp6MlBjQ1I1QVVnWC81U2cxSGtORzFqV2lJQWQw?=
 =?utf-8?B?bHJubTd0RTNvalJQd0M5VGlUSHFKU3lKUk1pdm82T3ZqTkRCTHFIWlRURFZm?=
 =?utf-8?B?MkVZTG9pZlFjV0dWR1MrNnY0c1ZJbzQzMG90cGgwQXFuWk9oalZKSVJWbk4y?=
 =?utf-8?B?TjdNNkowVTI3em5QSkd3YXdqZkdDN0FEcFJXdDZnQXdKWE4xRGNrZktyL041?=
 =?utf-8?B?bFZKVGF4QlN5a1hhWHFreERkOEhCWGJIU1BPQkhBaWZOVVRKU3JnTUFCRXVF?=
 =?utf-8?B?QUNYVk5BUEdQajd6YUNybWNORUlWQ2Vvc000OEJ2UGtsekJOVzBSbWc2K1Yw?=
 =?utf-8?B?aS91RGFQeFdOWEo1TEc2ZjU1eEVVRnBDNmhWQ0w0T09RdTlXSmtXM2hDUGRZ?=
 =?utf-8?B?dlZOTGtUNW54U1FLSU1DOS9yemF1Z0Y4T1FYTW1GR3VhemtLZU5hb2tET01O?=
 =?utf-8?B?YnRRbE1kTkt3cmRBeU9VQ3hIUWR3aFNrRitvNmovdkVBWkt6bXNKZURHbDA0?=
 =?utf-8?B?WFFTZGVaVVlIRHRhd2NmM2VjSzByS1BGWWQrWEx2RHBuWUtTckd3SkFHRFQ2?=
 =?utf-8?B?RkNUZ29leWs3dFg3NkVzMHZMeklWR1FwOTBzelMrcXNrdXhBYlVVbnNhTTQv?=
 =?utf-8?B?QXFwSllNeGE5MVA3UkVzOS9YckJjTnRhZGFnS1Nkd3hRTTNvblhjWUxOeXdo?=
 =?utf-8?B?UGd5cHB4SFgxTmFja3gralUxT0hKL1hGN1pSZGIxQWtQaytQMmhnaU5FNTZa?=
 =?utf-8?B?OWNBeFpoTkVLVHBzNktFU2J5Nmw4RWcxOGlFczFRZi9xRGN3a01neWQ2TGhi?=
 =?utf-8?B?NHRiYjg2WlhJN2NEOEI0cHpGQ0l5Wk9MSmt0TzNZWUliUkxaT0dUM2c4NXNE?=
 =?utf-8?B?c2tqZW1RL29zbWZZR1krZGRLQTIyb0Z4Y09aVmhyWVhiTzVrM1hMYW0rYk1F?=
 =?utf-8?B?VlNMQ0lydFVYSWtHS1dtUEZ4YXhlVVZ3azhvUlZVenhwSVFwRW1jNk8xaHlR?=
 =?utf-8?B?NkY1Q3pZTmJhMmI1UzVicjJ3eHZZTXRTNmJacmpRNDg2a0xwZExPcEJia1hZ?=
 =?utf-8?B?aURDWU5CTDhsZFR0d2pIRU9uMHF0TEMvNmdwMG1JK1dlbEVJeTVNazl3R2Nx?=
 =?utf-8?Q?/oly/8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB3577.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWJJWENjWlpsR0I2NjVRcThEb0pVNlhLdXg2a24wd2hEWHZpTDhNa2tqN0NS?=
 =?utf-8?B?VjF0NmZHV2JUamxkeHVOMTY1WUlNd3kzc2lOMTgyaFNiaHY5VDNXT05kUEhP?=
 =?utf-8?B?WiszbUl3MW5NM2txbTJaREdXUE01ZlJ2ZjE1S2llbnhuRTlrMWxPcXRqZkNL?=
 =?utf-8?B?UzNnM2c3dFBxV2E3T0NGUFM4ZFZ4Q0QzZEdCNk92VWR3UTFHcTZmSDQ1SlZr?=
 =?utf-8?B?enJ3UEFuK1g4RXNWNlNGWVBucEZNc0hCRWlMazBzRTRKRVpUdFQxVlpNYzdU?=
 =?utf-8?B?dURuL05iVGc3TFlsVjNmUUZmWW1lRTg2Y0RFK09lcEgvM3BLQ2lkb2s3NElv?=
 =?utf-8?B?bmZmc3NwRGFBM1oxb2t0am9USFZ5a1VXbExQbG1VNmd0OWxjbmtYSjIxd2F2?=
 =?utf-8?B?WXE3TTFobzN6dytkSlJjRGtQV2pvTGRMQTN6QXJETDM5MXJDTlliWEd1MDlD?=
 =?utf-8?B?YnFxSm1TY1Q1MjhtWUFxSS9LK05VOFAxcTFjQmEyaVhReE5nNm5td1BycS8x?=
 =?utf-8?B?Ti8ya1B1VGVqYjVzZGJTbXd4alR2NzRVM0V5WEZYQkpESEV4eEQreHlSMXVp?=
 =?utf-8?B?eStmTEdTcDhwSUZOQTJ5TU1WTXJyT0tNODVRSUlBbGYvdmRVUnliNzlQWlN3?=
 =?utf-8?B?Q3k2T1hWZ2RJWSttUytvTzNNYlNIMzZKSTdEVWQ1akZxOWtvYW5uek8ralk4?=
 =?utf-8?B?TFhCcG1kQ0UraS94WTFPMDRLZDZyNGJVSjRBUjRPYmRVY29TVXBvdjhURUpY?=
 =?utf-8?B?ZmJzQmVMZENSb2d1SUVjU2xvYVd0WHJreTZJVmxRMzVMRE5CS1p2ckYrL29n?=
 =?utf-8?B?V3Jwd3VIejBOSUh5NVEyWWlMSE9idEJnZ0xUa1R3NmgyeHBFdGdtclEvaXhE?=
 =?utf-8?B?SFI5Ym9SMGFnbHlUcjM3Nlk4Uy9vU0FGY3JVcjZ4d2ppOXl5eE9Jc3lQNjVM?=
 =?utf-8?B?VHdYWUJCaGNoN0M0WVFSU3J5aHZ0VmQ0RHJUcStsMStZaVpwQVpsd2YwN1BG?=
 =?utf-8?B?RXh6L2c1dHNLRnYvOWl6aWtNUjVPbFYxeDY2RWhqTkdveWlhejJTN3hRRmQy?=
 =?utf-8?B?NW9ZbVg1dUU3WjVzRzl2bHh3Z01MWGUxQTRFbmdHamNUeTljWG16MWtqMm9u?=
 =?utf-8?B?c0JtYjVXelhLZ0NXYXE1YXI1SnJKK1lwbVJuQURHWS83MGhrZDh5SWdqSEJ6?=
 =?utf-8?B?OFBFNDhLc29UeVI1dFl0L2pEa1BpSEpNYlh4SDN5TDBsMS9udWlzOUVUSHBZ?=
 =?utf-8?B?Y3JtK1hwS3hCMWJpMnJFdEd2TXFML3E3bGp2a2RMSlhnUDRIdkw1YU5Da25k?=
 =?utf-8?B?dVNJZjdEVVU4R3dQY2haY2liTXI4TE5GaW81TDdyM0V0RVQ0WklVb2Y1MGtx?=
 =?utf-8?B?SnpETDkvMWlGcWs3OGFSZHFhYkx5V3hlaFVDRmtJczlMMTBRZGljVElwMVZZ?=
 =?utf-8?B?cDRkeEYzVEFhcUVFV2p6S0JEMHkyU3FMVkkrN0dVWXYrQ1RxTWpzeXFYcmpN?=
 =?utf-8?B?WW9rUy9HeWhVeTR5ZitpMGhLQzNCVVdqeXJ1VE1VOUNKbjBKajk3N2F0cVNo?=
 =?utf-8?B?WE5MMjN1Y25SZGdob3hMYVIwNVlPWlVkVXE4UkdyZDRudnhzZ1V5WWdDVGFX?=
 =?utf-8?B?UEwxRDJuWndydFVnYlA3T3MxZmg2a1lJRFg0aE5jQUxBSk1IMk9pMXYreFlS?=
 =?utf-8?B?akhHNDFTQ3UwYjQ1ZERyYUt3aS9kVVVHeENaUktqeWN5cThWWVVEMDVrZWtR?=
 =?utf-8?B?SWtiTS80bEtybHpuOWJsdWZoWTFXOW8zRnRDN0JKdUdRNEt6Vy8rWU1QWmdL?=
 =?utf-8?B?ajVySm5BcGw2SlJ3eHdSNUVvSEFwY09oMHNNTW5zMWhGZEdZZ2JNaFJXYVZK?=
 =?utf-8?B?YXQvT3JlMVR4L0x5STgyL25qRDlKUFBMNjBzSkNPWE1pVDZ4VnREMUhUOWRC?=
 =?utf-8?B?WndIZG9wZElXa3pDVkVZcXl3WnAwN0NoOGhCaXJkVUZvNy8vVEtZSjF2OThm?=
 =?utf-8?B?c3lDbFNLekNrbFgxQ0w0dFNKMUVXejNiZjlKL3RlVWpXMlRJUkxVV09sVDVN?=
 =?utf-8?B?KyszY1BWOEZ6YVc1VyswZXBYaGxZTkJ2a0JpNUZFc3F1STAxRW5hUEtzbjlr?=
 =?utf-8?B?eEVkd212RUpreHFqenlUY2d0WUhCY3A0S3pQOWFpWWhJMERsOW5XMnoydXpH?=
 =?utf-8?Q?E5tRe/BZucGcYd6g9/DqLEg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <782689631CB83E4089F231B9DDC349E6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB3577.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dad189e-b560-4db1-7e27-08de328bae1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 16:47:43.6169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ToiUlL1ErERzTCFh9F//PV5ShO17YGMZrCwA4YVLC9eVKiLpy4UaeCkgYFL+N/l0yet6/gCb6lJjoSegPy1Orfbb0sGwBLVx4+oO1biG+AU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9412

DQoNCk9uIDAzLjEyLjI1IDE2OjMyLCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90ZToNCj4gSGkgT2xl
a3NhbmRyLA0KDQpIZWxsbyBHcnlnb3JpaQ0KDQo+IA0KPiBPbiAwMy4xMi4yNSAxMzowMywgT2xl
a3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4NCj4+IE9uIDAyLjEyLjI1IDIzOjMzLCBH
cnlnb3JpaSBTdHJhc2hrbyB3cm90ZToNCj4+DQo+Pg0KPj4gSGVsbG8gR3J5Z29yaWkNCj4+DQo+
Pj4NCj4+Pg0KPj4+IE9uIDAyLjEyLjI1IDIxOjMyLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90
ZToNCj4+Pj4gQ3JlYXRpbmcgYSBndWVzdCB3aXRoIGEgaGlnaCB2Q1BVIGNvdW50IChlLmcuLCA+
MzIpIGZhaWxzIGJlY2F1c2UNCj4+Pj4gdGhlIGd1ZXN0J3MgZGV2aWNlIHRyZWUgYnVmZmVyIChE
T01VX0RUQl9TSVpFKSBvdmVyZmxvd3MgZHVyaW5nIA0KPj4+PiBjcmVhdGlvbi4NCj4+Pj4gVGhl
IEZEVCBub2RlcyBmb3IgZWFjaCB2Q1BVIHF1aWNrbHkgZXhoYXVzdCB0aGUgNEtpQiBidWZmZXIs
DQo+Pj4+IGNhdXNpbmcgYSBndWVzdCBjcmVhdGlvbiBmYWlsdXJlLg0KPj4+Pg0KPj4+PiBJbmNy
ZWFzZSB0aGUgYnVmZmVyIHNpemUgdG8gMTZLaUIgdG8gc3VwcG9ydCBndWVzdHMgdXAgdG8NCj4+
Pj4gdGhlIE1BWF9WSVJUX0NQVVMgbGltaXQgKDEyOCkuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4N
Cj4+Pj4gLS0tDQo+Pj4+IE5vdGljZWQgd2hlbiB0ZXN0aW5nIHRoZSBib3VuZGFyeSBjb25kaXRp
b25zIGZvciBkb20wbGVzcyBndWVzdA0KPj4+PiBjcmVhdGlvbiBvbiBBcm02NC4NCj4+Pj4NCj4+
Pj4gRG9tYWluIGNvbmZpZ3VyYXRpb246DQo+Pj4+IGZkdCBta25vZCAvY2hvc2VuIGRvbVUwDQo+
Pj4+IGZkdCBzZXQgL2Nob3Nlbi9kb21VMCBjb21wYXRpYmxlICJ4ZW4sZG9tYWluIg0KPj4+PiBm
ZHQgc2V0IC9jaG9zZW4vZG9tVTAgXCNhZGRyZXNzLWNlbGxzIDwweDI+DQo+Pj4+IGZkdCBzZXQg
L2Nob3Nlbi9kb21VMCBcI3NpemUtY2VsbHMgPDB4Mj4NCj4+Pj4gZmR0IHNldCAvY2hvc2VuL2Rv
bVUwIG1lbW9yeSA8MHgwIDB4MTAwMDAgPg0KPj4+PiBmZHQgc2V0IC9jaG9zZW4vZG9tVTAgY3B1
cyA8MzM+DQo+Pj4+IGZkdCBzZXQgL2Nob3Nlbi9kb21VMCB2cGwwMTENCj4+Pj4gZmR0IG1rbm9k
IC9jaG9zZW4vZG9tVTAgbW9kdWxlQDQwNDAwMDAwDQo+Pj4+IGZkdCBzZXQgL2Nob3Nlbi9kb21V
MC9tb2R1bGVANDA0MDAwMDAgY29tcGF0aWJsZcKgICJtdWx0aWJvb3Qsa2VybmVsIg0KPj4+PiAi
bXVsdGlib290LG1vZHVsZSINCj4+Pj4gZmR0IHNldCAvY2hvc2VuL2RvbVUwL21vZHVsZUA0MDQw
MDAwMCByZWcgPDB4MCAweDQwNDAwMDAwIDB4MCAweDE2MDAwID4NCj4+Pj4gZmR0IHNldCAvY2hv
c2VuL2RvbVUwL21vZHVsZUA0MDQwMDAwMCBib290YXJncyAiY29uc29sZT10dHlBTUEwIg0KPj4+
Pg0KPj4+PiBGYWlsdXJlIGxvZzoNCj4+Pj4gKFhFTikgWGVuIGRvbTBsZXNzIG1vZGUgZGV0ZWN0
ZWQNCj4+Pj4gKFhFTikgKioqIExPQURJTkcgRE9NVSBjcHVzPTMzIG1lbW9yeT0weDEwMDAwS0Ig
KioqDQo+Pj4+IChYRU4pIExvYWRpbmcgZDEga2VybmVsIGZyb20gYm9vdCBtb2R1bGUgQCAwMDAw
MDAwMDQwNDAwMDAwDQo+Pj4+IChYRU4pIEFsbG9jYXRpbmcgbWFwcGluZ3MgdG90YWxsaW5nIDY0
TUIgZm9yIGQxOg0KPj4+PiAoWEVOKSBkMSBCQU5LWzBdIDB4MDAwMDAwNDAwMDAwMDAtMHgwMDAw
MDA0NDAwMDAwMCAoNjRNQikNCj4+Pj4gKFhFTikgRGV2aWNlIHRyZWUgZ2VuZXJhdGlvbiBmYWls
ZWQgKC0yMikuDQo+Pj4+IChYRU4pDQo+Pj4+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioNCj4+Pj4gKFhFTikgUGFuaWMgb24gQ1BVIDA6DQo+Pj4+IChYRU4p
IENvdWxkIG5vdCBzZXQgdXAgZG9tYWluIGRvbVUwIChyYyA9IC0yMikNCj4+Pj4gKFhFTikgKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPj4+PiAtLS0NCj4+Pj4gLS0t
DQo+Pj4+IMKgwqAgeGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jIHwgOCAr
KysrKy0tLQ0KPj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RldmljZS10cmVl
L2RvbTBsZXNzLWJ1aWxkLmMgYi94ZW4vY29tbW9uLw0KPj4+PiBkZXZpY2UtdHJlZS9kb20wbGVz
cy1idWlsZC5jDQo+Pj4+IGluZGV4IDNmNWI5ODdlZDguLmQ3ZDBhNDdiOTcgMTAwNjQ0DQo+Pj4+
IC0tLSBhL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYw0KPj4+PiArKysg
Yi94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCj4+Pj4gQEAgLTQ2MSwx
MCArNDYxLDEyIEBAIHN0YXRpYyBpbnQgX19pbml0DQo+Pj4+IGRvbWFpbl9oYW5kbGVfZHRiX2Jv
b3RfbW9kdWxlKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+IMKgwqAgLyoNCj4+Pj4gwqDCoMKgICog
VGhlIG1heCBzaXplIGZvciBEVCBpcyAyTUIuIEhvd2V2ZXIsIHRoZSBnZW5lcmF0ZWQgRFQgaXMg
c21hbGwNCj4+Pj4gKG5vdCBpbmNsdWRpbmcNCj4+Pj4gLSAqIGRvbVUgcGFzc3Rocm91Z2ggRFQg
bm9kZXMgd2hvc2Ugc2l6ZSB3ZSBhY2NvdW50IHNlcGFyYXRlbHkpLCA0S0INCj4+Pj4gYXJlIGVu
b3VnaA0KPj4+PiAtICogZm9yIG5vdywgYnV0IHdlIG1pZ2h0IGhhdmUgdG8gaW5jcmVhc2UgaXQg
aW4gdGhlIGZ1dHVyZS4NCj4+Pj4gKyAqIGRvbVUgcGFzc3Rocm91Z2ggRFQgbm9kZXMgd2hvc2Ug
c2l6ZSB3ZSBhY2NvdW50IHNlcGFyYXRlbHkpLiBUaGUNCj4+Pj4gc2l6ZSBpcw0KPj4+PiArICog
cHJpbWFyaWx5IGRyaXZlbiBieSB0aGUgbnVtYmVyIG9mIHZDUFUgbm9kZXMuIFRoZSBwcmV2aW91
cyA0S2lCDQo+Pj4+IGJ1ZmZlciB3YXMNCj4+Pj4gKyAqIGluc3VmZmljaWVudCBmb3IgZ3Vlc3Rz
IHdpdGggaGlnaCB2Q1BVIGNvdW50cywgc28gaXQgaGFzIGJlZW4NCj4+Pj4gaW5jcmVhc2VkDQo+
Pj4+ICsgKiB0byBzdXBwb3J0IHVwIHRvIHRoZSBNQVhfVklSVF9DUFVTIGxpbWl0ICgxMjgpLg0K
Pj4+PiDCoMKgwqAgKi8NCj4+Pj4gLSNkZWZpbmUgRE9NVV9EVEJfU0laRSA0MDk2DQo+Pj4+ICsj
ZGVmaW5lIERPTVVfRFRCX1NJWkUgKDQwOTYgKiA0KQ0KPj4+DQo+Pj4gTWF5IGJlIEl0IHdhbnRz
IEtjb25maWc/DQo+Pj4gT3Igc29tZSBmb3JtdWxhIHdoaWNoIGFjY291bnRzIE1BWF9WSVJUX0NQ
VVM/DQo+Pg0KPj4NCj4+IEkgYWdyZWUgdGhhdCB1c2luZyBhIGZvcm11bGEgdGhhdCBhY2NvdW50
cyBmb3IgTUFYX1ZJUlRfQ1BVUyBpcyB0aGUgbW9zdA0KPj4gcm9idXN0IGFwcHJvYWNoLg0KPj4N
Cj4+IEhlcmUgaXMgdGhlIGVtcGlyaWNhbCBkYXRhIChieSB0ZXN0aW5nIHdpdGggdGhlIG1heGlt
dW0gbnVtYmVyIG9mIGRldmljZQ0KPj4gdHJlZSBub2RlcyAoZS5nLiwgaHlwZXJ2aXNvciBhbmQg
cmVzZXJ2ZWQtbWVtb3J5IG5vZGVzKSBhbmQgZW5hYmxpbmcgYWxsDQo+PiBvcHRpb25hbCBDUFUg
cHJvcGVydGllcyAoZS5nLiwgY2xvY2stZnJlcXVlbmN5KSk6DQo+Pg0KPj4gY3B1cz0xDQo+PiAo
WEVOKSBGaW5hbCBjb21wYWN0ZWQgRkRUIHNpemUgaXM6IDE1ODYgYnl0ZXMNCj4+DQo+PiBjcHVz
PTINCj4+IChYRU4pIEZpbmFsIGNvbXBhY3RlZCBGRFQgc2l6ZSBpczogMTY5OCBieXRlcw0KPj4N
Cj4+IGNwdXM9MzINCj4+IChYRU4pIEZpbmFsIGNvbXBhY3RlZCBGRFQgc2l6ZSBpczogNTA1OCBi
eXRlcw0KPj4NCj4+IGNwdXM9MTI4DQo+PiAoWEVOKSBGaW5hbCBjb21wYWN0ZWQgRkRUIHNpemUg
aXM6IDE1ODEwIGJ5dGVzDQo+Pg0KPj4NCj4+IHN0YXRpYyBpbnQgX19pbml0IHByZXBhcmVfZHRi
X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvDQo+PiAqa2luZm8pDQo+
PiDCoMKgIHsNCj4+IMKgwqDCoMKgwqDCoCBpbnQgYWRkcmNlbGxzLCBzaXplY2VsbHM7DQo+PiBA
QCAtNTY5LDYgKzU2OSw4IEBAIHN0YXRpYyBpbnQgX19pbml0IHByZXBhcmVfZHRiX2RvbVUoc3Ry
dWN0IGRvbWFpbiAqZCwNCj4+IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pDQo+PiDCoMKgwqDC
oMKgwqAgaWYgKCByZXQgPCAwICkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOw0K
Pj4NCj4+ICvCoMKgwqAgcHJpbnRrKCJGaW5hbCBjb21wYWN0ZWQgRkRUIHNpemUgaXM6ICVkIGJ5
dGVzXG4iLA0KPj4gZmR0X3RvdGFsc2l6ZShraW5mby0+ZmR0KSk7DQo+PiArDQo+PiDCoMKgwqDC
oMKgwqAgcmV0dXJuIDA7DQo+Pg0KPj4gwqDCoMKgwqAgZXJyOg0KPj4NCj4+IFRoaXMgZGF0YSBz
aG93cyAoYXNzdW1pbmcgbXkgdGVzdGluZy9jYWxjdWxhdGlvbnMgYXJlIGNvcnJlY3QpOg0KPj4N
Cj4+IC0gQSBtYXJnaW5hbCBjb3N0IG9mIDExMiBieXRlcyBwZXIgdkNQVSBpbiB0aGUgZmluYWws
IGNvbXBhY3RlZCBkZXZpY2UgDQo+PiB0cmVlLg0KPj4gLSBBIGZpeGVkIGJhc2Ugc2l6ZSBvZiAx
NDc0IGJ5dGVzIGZvciBhbGwgbm9uLXZDUFUgY29udGVudC4NCj4gDQo+IFRoYW5rIGZvciBkZXRh
aWxlZCBhbmFseXNlcyBhbmQgaW5mby4NCj4gDQo+Pg0KPj4gQmFzZWQgb24gdGhhdCBJIHdvdWxk
IHByb3Bvc2UgdGhlIGZvbGxvd2luZyBmb3JtdWxhIHdpdGggdGhlIA0KPj4ganVzdGlmaWNhdGlv
bjoNCj4+DQo+PiAvKg0KPj4gwqDCoCAqIFRoZSBzaXplIGlzIGNhbGN1bGF0ZWQgZnJvbSBhIGZp
eGVkIGJhc2VsaW5lIHBsdXMgYSBzY2FsYWJsZQ0KPj4gwqDCoCAqIHBvcnRpb24gZm9yIGVhY2gg
cG90ZW50aWFsIHZDUFUgbm9kZSB1cCB0byB0aGUgc3lzdGVtIGxpbWl0DQo+PiDCoMKgICogKE1B
WF9WSVJUX0NQVVMpLCBhcyB0aGUgdkNQVSBub2RlcyBhcmUgdGhlIHByaW1hcnkgY29uc3VtZXIN
Cj4+IMKgwqAgKiBvZiBzcGFjZS4NCj4+IMKgwqAgKg0KPj4gwqDCoCAqIFRoZSBiYXNlbGluZSBv
ZiAyS2lCIGlzIGEgc2FmZSBidWZmZXIgZm9yIGFsbCBub24tdkNQVSBGRFQNCj4+IMKgwqAgKiBj
b250ZW50LiBUaGUgMTI4IGJ5dGVzIHBlciB2Q1BVIGlzIGRlcml2ZWQgZnJvbSBhIHdvcnN0LWNh
c2UNCj4+IMKgwqAgKiBhbmFseXNpcyBvZiB0aGUgRkRUIGNvbnN0cnVjdGlvbi10aW1lIHNpemUg
Zm9yIGEgc2luZ2xlDQo+PiDCoMKgICogdkNQVSBub2RlLg0KPj4gwqDCoCAqLw0KPj4gI2RlZmlu
ZSBET01VX0RUQl9TSVpFICgyMDQ4ICsgKE1BWF9WSVJUX0NQVVMgKiAxMjgpKQ0KPj4NCj4+ICoq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4+DQo+PiBQbGVh
c2UgdGVsbCBtZSB3b3VsZCB5b3UgYmUgaGFwcHkgd2l0aCB0aGF0Pw0KPiANCj4gSXQgbG9va3Mg
b2suDQoNClRoYW5rcy4NCg0KDQo+IE9uZSB0aGluZyBJIHdvcnJ5IGFib3V0IC0gc2hvdWxkIGl0
IGJlIFhlbiBwYWdlIGFsaWduZWQ/DQoNCkdvb2QgcXVlc3Rpb24uIEkgY291bGQgbm90IGZpbmQg
YW55IGluZm9ybWF0aW9uIHRoYXQgdGhlIGRldmljZSB0cmVlIA0KYmxvYiAoRFRCKSBzaXplIGl0
c2VsZiBpcyByZXF1aXJlZCB0byBiZSBwYWdlLWFsaWduZWQgKGF0IGxlYXN0IG9uIEFybTY0KS4N
Cg0KMS4gVGhlIExpbnV4IEtlcm5lbCBCb290IFByb3RvY29sIERvY3VtZW50YXRpb24gb24gQXJt
NjQgc2F5cyBhYm91dCANCnNldHRpbmcgdXAgdGhlIGRldmljZSB0cmVlIjoNCiJUaGUgZGV2aWNl
IHRyZWUgYmxvYiAoZHRiKSBtdXN0IGJlIHBsYWNlZCBvbiBhbiA4LWJ5dGUgYm91bmRhcnkgYW5k
IA0KbXVzdCBub3QgZXhjZWVkIDIgbWVnYWJ5dGVzIGluIHNpemUuIg0KDQpJdCBkb2VzIG5vdCBz
YXkgInRoZSBzaXplIG11c3QgYmUgYSBtdWx0aXBsZSBvZi4uLiIgb3IgInRoZSBzaXplIG11c3Qg
YmUgDQpwYWdlLWFsaWduZWQuIg0KDQoyLiBUaGUgb2ZmaWNpYWwgRGV2aWNlIFRyZWUgU3BlY2lm
aWNhdGlvbiBzYXlzIGFib3V0IHRoZSAidG90YWxzaXplIiANCmZpZWxkIGluIHRoZSBoZWFkZXI6
DQoiIC0gdG90YWxzaXplDQpUaGlzIGZpZWxkIHNoYWxsIGNvbnRhaW4gdGhlIHRvdGFsIHNpemUg
aW4gYnl0ZXMgb2YgdGhlIGRldmljZXRyZWUgZGF0YSANCnN0cnVjdHVyZS4iDQoNCkl0IGFsc28g
ZG9lcyBub3Qgc2F5ICJ0aGUgc2l6ZSBtdXN0IGJlIGEgbXVsdGlwbGUgb2YuLi4iIG9yICJ0aGUg
c2l6ZSANCm11c3QgYmUgcGFnZS1hbGlnbmVkLiINCg0KTXkgdW5kZXJzdGFuZGluZyBpczogbm8s
IHRoZSBzaXplIG9mIERUQiBkb2VzIG5vdCBuZWVkIHRvIGJlIHBhZ2UtYWxpZ25lZC4NCg0KPiAN
Cg==

