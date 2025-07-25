Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BD3B116B1
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056940.1424963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8WE-00048E-FA; Fri, 25 Jul 2025 02:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056940.1424963; Fri, 25 Jul 2025 02:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8WE-00045z-Bq; Fri, 25 Jul 2025 02:50:46 +0000
Received: by outflank-mailman (input) for mailman id 1056940;
 Fri, 25 Jul 2025 02:50:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yx3=2G=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uf8WC-00045t-RB
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:50:45 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2416::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27548470-6902-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 04:50:42 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 02:50:36 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 02:50:36 +0000
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
X-Inumbo-ID: 27548470-6902-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNisB/hCg1cwQw5+Mj5l1IyHqaKqQNbQcz9b7xTJ/a7mtvkD+ek0J78CMkXAvVjdhKudb4k9nyYCmvQHm9olWC4DKWrAucw1pDHaH0qTVN4yg3f+wX89DvcyVNJN++q5aQzSuGnDqH4GVpg8AuZl6Zx7PJQpkqvcalcSwpUhoN/SJWVvmnzy0UBGuBurZVjiGX0O5vEL5Es7KG39N3LdxPbjRS2+e9s0+ipRU3bgjthb/Z7HXRQJoHe1SEZjq+7G/x1pdl7VHut/zIgW/vnirj3YJWm/hSr2Nm4LYJvwTMZmfpoDfFYI7xIE32DglpyolGB6T7Hf3NYsZZZ96v7wXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwH8IJa705QWEInDq9Mhuh+aQTDdZouENlPXSo7xfII=;
 b=I5L90yO4r1wfQ3HJRlLBjAU4/D7FBL3/w7juKLJbs9nm+Y2JC7DTAne8o5nHGNgcxYqwCwkz97zQD0m+8qqIfvx9EbSs6YHMNLkWdbQ5uqLO0UPn49EHA57PJJXcn63FQngWXCrLauMomhay9YYA0FN09qnVLb9rojgXLBQjHphO2/6pCuyF8moyH2EbdGxrW/HF3+uPdPdhx1YzIC1XrRGygXbQfsHHbb/JnSFAL6Jj36JYWXMB9wxeOqCA7HNIG8riJ16gKnfYUR496ZwtCpd/Q1GFRpUVi0Zm/v2xMJe3VhURPIluEzRx3jRvpqUWsM7eYiRxXAft9vw5hD7BuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwH8IJa705QWEInDq9Mhuh+aQTDdZouENlPXSo7xfII=;
 b=lG00V8F+J1lP1ZgzwSrrMOj7oE1va/qgYZwJnRCm5Ji5F3U9PTxnXHSbjTcUZLb9+SIroFTHQ0gIS3iBi7ir473hXDEuyOYYX0fGAEye8CBplyoJShQM3HfZ0cSvhuBUOgzTNR39tipAnIKwAQ2w9TKQ2XYRy40sq/X08yxvGII=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v8 8/8] vpci/msix: Free MSIX resources when init_msix()
 fails
Thread-Topic: [PATCH v8 8/8] vpci/msix: Free MSIX resources when init_msix()
 fails
Thread-Index: AQHb/F7mXBROjWByc02zqpGzTzf7KrRBbwMAgAE4foA=
Date: Fri, 25 Jul 2025 02:50:36 +0000
Message-ID:
 <BL1PR12MB58495437343EBAC5DA119A97E759A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
 <20250724055006.29843-9-Jiqian.Chen@amd.com> <aIJYSGSGQ76MgKF2@macbook.local>
In-Reply-To: <aIJYSGSGQ76MgKF2@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8964.019)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|LV2PR12MB5966:EE_
x-ms-office365-filtering-correlation-id: abe9f49b-453f-49b2-961f-08ddcb260859
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c1hnbnM1Z3EydldGZTVPVjUrdkJCb2lIV0JyQXlySXV4VnlQUnVtcmUzdGty?=
 =?utf-8?B?ZEtLS0ozamZoUi9sS1hnZDhRR2ZPVDVwUjJWTDI5VmxodEJOZklNdEdTbGtF?=
 =?utf-8?B?M2pNSkc0TjBuSmdydlBVKzZuSjhhaEFKUGlVYW55SU1JZVlFbUVtb25JVGk5?=
 =?utf-8?B?Y25ySE55cXdBeVhia0p6emdpQ3BYME8wUzFndXgrcUhLZmFoaDFXQmFlQTcz?=
 =?utf-8?B?cmcxejVvMmRoblhLaXRuVEJhQnJmZmJCbFB5TzJKcG8zcjBqcTJybi9ZU3R5?=
 =?utf-8?B?R2RPUlg2OUEyRHk2eHpVeUFOM3B3dDczN0VYSFF5eVpJK2h5Wml2SDYzVHQ5?=
 =?utf-8?B?MVRGYVN1dS9FTHRtR3JUMHVDQXBhQWF3UlllN01MT0did0U2K1VJUy85dXFm?=
 =?utf-8?B?WVBQL0tCeWV4c2dKeUFrVnRGQWZuVVRMY0JpY3NRM0NBbUtpQmZjempzTlRO?=
 =?utf-8?B?dlZQcndTeWJUSGZnczg1bWUzazFHTWw1Snh6dFVVeC93NG1TaWxYR1cvVmNT?=
 =?utf-8?B?bFQzQmJKdytLOGR0NEFxNng4Q1kyZUFOWHpFWEVvdVdJRHlYNmg3K2pPanJY?=
 =?utf-8?B?UlIzdHFnKzJ2TCtYRUJ4SERReWxYVHFLdXBCTkVCTXE2MmNuS3JjWnAraEZy?=
 =?utf-8?B?ZmUwR2Z6M0RBTHNLNjcxVW1QT0pQcW5rSG4zcDNNdHZUZmlwdE05b0g3RDZM?=
 =?utf-8?B?WXA5ck1CWVd1ajFsK0MzTzhLaFU5akovYnV1bHdtdEFUcEMycks3bUI4cGlX?=
 =?utf-8?B?aU1VbGhWWWJVdHlNcDFvSU1EaWhQMWdoUG5yanZqVzk1TXUxMEIvNjN1cTh0?=
 =?utf-8?B?ZisyNEhLeXVNWlFwbmgzRUZlYnRXRU14cnhlTFBYbW4rN2lPam5PVXB5Y3Zp?=
 =?utf-8?B?K2Q3bWdxRTBScUMrRVFGRzBtbEE3N2JzNU4wdTVKZUtlRktIY3FwR1plakJa?=
 =?utf-8?B?WmpGNGxRSmp3MEtiR2diR3llaCtHVlZ3czNIV1BFRE94aWI2cU9Da1JybGZO?=
 =?utf-8?B?RXdJdTJiMzFtdEFJaVo1d0RydFlnQ1daREhzbHdSd1QrQ1RVeGxEM3JleWNP?=
 =?utf-8?B?blFpRy8vQkFDSFNEeE1GRmlKcUdGSmp2UDlwSkJjTFpjT2dvcUhXclVndXp4?=
 =?utf-8?B?RlgwdEorU2dvUXlzMUlxb21PdjJwcmpXTC9YZmkxRnEzdmcyNEd2dExmV2xY?=
 =?utf-8?B?Kzl5UTJUUkdMbzBHN2hhUnNGQnc3WTBtMkYyTzJQNWtER3FTQ04zMUl4SlI0?=
 =?utf-8?B?NlZqeUk3dE1pSXdsamFCQzRxNU1HNHBpMlZxdkwxbDJsSkZyNWJML3RXZUtn?=
 =?utf-8?B?S0FTckxQNUNiV2VieVVPbFk1c0Rub0VrSUVCZE92cWZoV1p2UldFanY0OVg0?=
 =?utf-8?B?VGtGV05jVXk5YmF6OUR0UG9TMDIwSnpLdFVDSXZwRVBSTURObjRLRDNLZE40?=
 =?utf-8?B?eXFkZlJtdEdxL3hkNXNWVC93SDB5UWg4VkROUEluNjZkQTQ1Nkk4RlZ5R2J2?=
 =?utf-8?B?dW9nTGZ4aElvTXphemZQbVNQVXpOVWZTTnJSTzF3OVRQOWxpOHJZOHpydWti?=
 =?utf-8?B?NHRCUHhUNWVxcVdrTHdhdUNLaFNQZUZSV2RobldmZy95MW1ITmpsYUQ3MGo2?=
 =?utf-8?B?T3JyWGJjeWZjOTFlR2EyaDNNREZrcXNicEYzMjJpOThsNTBRR2E5VExyU1dS?=
 =?utf-8?B?RnkrR05rRStaSFc1OTllemplek1WZWtpbVZxYXBnWmJlZHN0RUNLbmV5Mk5s?=
 =?utf-8?B?VTJBc3FYMUswbnJzdXNFK2pvdXgrRE01STc3RUNOWUNhYW5RSHg1Rm9yWFBQ?=
 =?utf-8?B?a0c2N3hQWkJrQ3Z5YmFqR3BJZUtPU05RQXZlYnY4YTNvZGFlSm5Lck52b1JG?=
 =?utf-8?B?UWZpaElraEE2RzlaYmhGeHZHRXoxR3FXdFZzNm9HN2JLZ3lHeHNqeGVicDc3?=
 =?utf-8?B?TzRob2lJb0l2OUNOSkpaTFZZWWUzN1lTSnB1am5zQmRxdzJJOHhSZXNIYlp5?=
 =?utf-8?B?OFRPTmxSZHBBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDRHN1ZTVk5PWWFjbzhBamtBQXFYOXQwYmh0WEJHd2RYNXVvd0hSLzJLdEYz?=
 =?utf-8?B?R1ZNbHZYMnZtc2JGNUZOTy9RdDZlTXA3RkRYWnRLc05ERDYySmh0NTlteTVH?=
 =?utf-8?B?SzRHNGxpY2VmNzRpWE52MEFWc2plaG1IZVMzY1BGMCszdFYrOXVvWTkyVEEy?=
 =?utf-8?B?U0kyckpzVTZqRkNDSHpBSThGaXhlMUh2UTJpL0xCNEkxU0swU2pKcklmOHJi?=
 =?utf-8?B?SWtGQkpWK2V6UXpKVkZEZ1F2WDVML1lPMlV2dEZ2U1ZJRjNncXh1bUtzTW0x?=
 =?utf-8?B?WEtmbWhKRXIrQWVzSUdhTmpEK2JkM3VnVWsxODRVZVdoOXR3MnBPa0ZmUHlJ?=
 =?utf-8?B?V0FaNE9OVVV3VHd6ME1icEwwcC9id0IvUGMvQ1dyaUQvdGV4VWpJeC9yVE9U?=
 =?utf-8?B?eEVnMW84VVRpUnFVbEpmYnJ1SmZSQTlJSlZlUi9VWklCYmhMeStmRUJsbjF2?=
 =?utf-8?B?a2ZZK25oR3oxdUI4MVRYdDlXdlphb1Z4TFd4NlczNi9oczRuVFVkUlpMVXli?=
 =?utf-8?B?S0l5Tmg1Z0N1OGhodTZrakk3VWxTVG5qbUUvVkpTQ2p2MzgyY3d4SUNVYWY5?=
 =?utf-8?B?dmh4M3Y5UVZOL213VTFHbzdrK0l6cGhoNHZvRHlESnpkWDlKTGRZMkJWa2xJ?=
 =?utf-8?B?QkRMUEZQZGtDYUFUNEd6RlBMOXRIOGVTNWFuS0lOSFB0VUlkYk42MkR0aXpj?=
 =?utf-8?B?c3E0OHpmR0hKK2FUaTBlQmhEVlZmZ3kwK282QUZ0UFhXSlA1a3ZSeTlaanFx?=
 =?utf-8?B?bElHMkp2VEFPNEZOME92Rjhoc3c4allxNm1hN2hHMGY1ZlpyMit2UWFDRGNY?=
 =?utf-8?B?MGRGVVhWemRaWmpMWkpFdmNJRm5ZMTMvUS90TU5kYXRvRk04M0FQOFNIc2JC?=
 =?utf-8?B?d3hpUU4yd3BVSmVLTG9kSEtGSlR5MThuVmJpRmJwdjhFeFlrWDVzZWtlUXZP?=
 =?utf-8?B?YWMvcUY1a0dWVncxREViQStLcXpFMXVZMU9KbjZqclNBTU82MjNRbU5QdTdQ?=
 =?utf-8?B?M2FxdTdkVTlEM0gxRGVTcy9LV1NBWHluS3JRWGY0LzFRVndHdTR2WDhBcmxs?=
 =?utf-8?B?dmNvcC92ZTFra08vNjFEbnNlUXM1VGtqSzZSWXR6T3lqMElUUEFPdjRpVVox?=
 =?utf-8?B?THRtU01jWmVSbnRlYTJvRVJnR2FwK2dWQ012cWZGaEwzcE4rcE9iaXRMQi9l?=
 =?utf-8?B?RjVTOFVQR3lNeG13RFhHQkRIdldXaUg5QmZoN3pTaHZVR0cyTzFaeTB3Qks0?=
 =?utf-8?B?T1U2bnpwd1ZrNHhiRC84blQ3N0JhL2t4QUdHVzhJZUpScmdHb1U0L3pSZ1pL?=
 =?utf-8?B?aVJrdk9kelZnZk5EQ0lzZmdLenRhTWsyWmprcFoxR2dRMlNKaFY0UTU3b203?=
 =?utf-8?B?Z3JXZ0JrZWtRZncyM0Zjc2VMdUJmSHB2TGlKM0xLeVgyUlMxUXU2cGFEa1M1?=
 =?utf-8?B?TG5sSjQzTzRObEVDNmJWbGU4L1FDWHRMVit5eWdQNFZKYnozTGJnNUdocVNk?=
 =?utf-8?B?K2tnNzk3MXJYSEFnTTYweFNCSFdQdW9sOEZUblFHekVFQ2o1TnRaa3kvZWx3?=
 =?utf-8?B?c2NUeDFNU2pXNVJtbkR3TlQ4UGtYMmxwS3BjQUo1Ykxld2orbVJ4ZVAxQzhw?=
 =?utf-8?B?dDZTbThyZEJLT0tQVEprbktiSUhOcGtXaTdpei9Fd0tXN2I3NWY1UlNubDEv?=
 =?utf-8?B?V1RNQUIvTFJHYVVid3J5eXd6bmlDLzM2VTMzNFpEb0xBNm1QM0NuWUttY2pw?=
 =?utf-8?B?UUcwRHdrWXRML1p2MlhxcFZxMUFRSTJrV0dncE9ldERlWkQwUmFqclNVWEZy?=
 =?utf-8?B?N0JJRnA0emhIUFdzVjdkMkY5WXZ4T3JNTDN5SW53clpTTVRrd1BUZUFId01R?=
 =?utf-8?B?MlRhRzU1Y1N1eGVDcS9Kc05BVUFrWUk2TUdyV3lkd0REM3NFTTk2Tm90c1hm?=
 =?utf-8?B?aGdPdUZQNVQ0TENEckFueWZIanhLN1VSeWNDVG1WcE5FKzU5M3hRSGF5UExu?=
 =?utf-8?B?R1A2TmNaTmJac2tONG0zbWREaURPaldzRlNnb0ZrZncvbnhtdUx4RUs3V25V?=
 =?utf-8?B?RWM2eGl3bUVRVzg3OGdTNFNaT0NSTzkzSzFaWGhYQVdHaVp1R3lLaGgxQVdO?=
 =?utf-8?Q?wKqA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F816E66E8266DD4BBD19399C098BA859@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe9f49b-453f-49b2-961f-08ddcb260859
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 02:50:36.5708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JrkAz5dJijwa8bAJkZwmcc6sjHi3ubYRXJAEZpOUMbtbw0kinFSCmTJbzWKR2cD/sVUg4kV2skYkNnN2+nWlpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5966

T24gMjAyNS83LzI0IDIzOjU5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUaHUsIEp1
bCAyNCwgMjAyNSBhdCAwMTo1MDowNlBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdo
ZW4gaW5pdF9tc2l4KCkgZmFpbHMsIGN1cnJlbnQgbG9naWMgcmV0dXJuIGZhaWwgYW5kIGZyZWUg
TVNJWC1yZWxhdGVkDQo+PiByZXNvdXJjZXMgaW4gdnBjaV9kZWFzc2lnbl9kZXZpY2UoKS4gQnV0
IHRoZSBwcmV2aW91cyBuZXcgY2hhbmdlcyB3aWxsDQo+PiBoaWRlIE1TSVggY2FwYWJpbGl0eSBh
bmQgcmV0dXJuIHN1Y2Nlc3MsIGl0IGNhbid0IHJlYWNoDQo+PiB2cGNpX2RlYXNzaWduX2Rldmlj
ZSgpIHRvIHJlbW92ZSByZXNvdXJjZXMgaWYgaGlkaW5nIHN1Y2Nlc3MsIHNvIHRob3NlDQo+PiBy
ZXNvdXJjZXMgbXVzdCBiZSByZW1vdmVkIGluIGNsZWFudXAgZnVuY3Rpb24gb2YgTVNJWC4NCj4g
DQo+IFRoZSB0ZXh0IGhlcmUgaXMgYSBiaXQgY29udm9sdXRlZCBJTU8uICBJdCB3b3VsZCBiZSBj
bGVhcmVyIGFzOg0KPiANCj4gV2hlbiBNU0ktWCBpbml0aWFsaXphdGlvbiBmYWlscyB2UENJIHdp
bGwgaGlkZSB0aGUgY2FwYWJpbGl0eSwgYnV0DQo+IHJlbW92ZSBvZiBoYW5kbGVycyBhbmQgZGF0
YSB3b24ndCBiZSBwZXJmb3JtZWQgdW50aWwgdGhlIGRldmljZSBpcw0KPiBkZWFzc2lnbmVkLiAg
SW50cm9kdWNlIGEgTVNJLVggY2xlYW51cCBob29rIHRoYXQgd2lsbCBiZSBjYWxsZWQgd2hlbg0K
PiBpbml0aWFsaXphdGlvbiBmYWlscyB0byBjbGVhbnVwIE1TSS1YIHJlbGF0ZWQgaG9va3MgYW5k
IGZyZWUgaXQncw0KPiBhc3NvY2lhdGVkIGRhdGEuDQo+IA0KPiBBcyBhbGwgc3VwcG9ydGVkIGNh
cGFiaWxpdGllcyBoYXZlIGJlZW4gc3dpdGNoZWQgdG8gdXNlIHRoZSBjbGVhbnVwDQo+IGhvb2tz
IGNhbGwgdGhvc2UgZnJvbSB2cGNpX2RlYXNzaWduX2RldmljZSgpIGluc3RlYWQgb2Ygb3Blbi1j
b2RlIHRoZQ0KPiBjYXBhYmlsaXR5IHNwZWNpZmljIGNsZWFudXAgaW4gdGhlcmUuDQpUaGFua3Ms
IHdpbGwgY2hhbmdlLg0KDQo+IA0KPiAoc2VlIGJlbG93IGZvciB0aGUgcmVhc29uaW5nIGJlaGlu
ZCB0aGUgbGFzdCBwYXJhZ3JwYWgpLg0KPiANCj4+IFRvIGRvIHRoYXQsIGltcGxlbWVudCBjbGVh
bnVwIGZ1bmN0aW9uIGZvciBNU0lYLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVu
IDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gLS0tDQo+PiBjYzogIlJvZ2VyIFBhdSBNb25uw6ki
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+IC0tLQ0KPj4gdjctPnY4IGNoYW5nZXM6DQo+PiAq
IEdpdmVuIHRoZSBjb2RlIGluIHZwY2lfcmVtb3ZlX3JlZ2lzdGVycygpIGFuIGVycm9yIGluIHRo
ZSByZW1vdmFsIG9mDQo+PiAgIHJlZ2lzdGVycyB3b3VsZCBsaWtlbHkgaW1wbHkgbWVtb3J5IGNv
cnJ1cHRpb24sIGF0IHdoaWNoIHBvaW50IGl0J3MNCj4+ICAgYmVzdCB0byBmdWxseSBkaXNhYmxl
IHRoZSBkZXZpY2UuIFNvLCBSb2xsYmFjayB0aGUgbGFzdCB0d28gbW9kaWZpY2F0aW9ucyBvZiB2
Ny4NCj4+DQo+PiB2Ni0+djcgY2hhbmdlczoNCj4+ICogQ2hhbmdlIHRoZSBwb2ludGVyIHBhcmFt
ZXRlciBvZiBjbGVhbnVwX21zaXgoKSB0byBiZSBjb25zdC4NCj4+ICogV2hlbiB2cGNpX3JlbW92
ZV9yZWdpc3RlcnMoKSBpbiBjbGVhbnVwX21zaXgoKSBmYWlscywgbm90IHRvIHJldHVybg0KPj4g
ICBkaXJlY3RseSwgaW5zdGVhZCB0cnkgdG8gZnJlZSBtc2l4IGFuZCByZS1hZGQgY3RybCBoYW5k
bGVyLg0KPj4gKiBQYXNzIHBkZXYtPnZwY2kgaW50byB2cGNpX2FkZF9yZWdpc3RlcigpIGluc3Rl
YWQgb2YgcGRldi0+dnBjaS0+bXNpeCBpbg0KPj4gICBpbml0X21zaXgoKSBzaW5jZSB3ZSBuZWVk
IHRoYXQgZXZlcnkgaGFuZGxlciByZWFsaXplIHRoYXQgbXNpeCBpcyBOVUxMDQo+PiAgIHdoZW4g
bXNpeCBpcyBmcmVlZCBidXQgaGFuZGxlcnMgYXJlIHN0aWxsIGluIHRoZXJlLg0KPj4NCj4+IHY1
LT52NiBjaGFuZ2VzOg0KPj4gKiBDaGFuZ2UgdGhlIGxvZ2ljIHRvIGFkZCBkdW1teSBoYW5kbGVy
IHdoZW4gIXZwY2ktPm1zaXggaW4gY2xlYW51cF9tc2l4KCkuDQo+Pg0KPj4gdjQtPnY1IGNoYW5n
ZXM6DQo+PiAqIENoYW5nZSBkZWZpbml0aW9uICJzdGF0aWMgdm9pZCBjbGVhbnVwX21zaXgiIHRv
ICJzdGF0aWMgaW50IGNmX2NoZWNrIGNsZWFudXBfbXNpeCINCj4+ICAgc2luY2UgY2xlYW51cCBo
b29rIGlzIGNoYW5nZWQgdG8gYmUgaW50Lg0KPj4gKiBBZGQgYSByZWFkLW9ubHkgcmVnaXN0ZXIg
Zm9yIE1TSVggQ29udHJvbCBSZWdpc3RlciBpbiB0aGUgZW5kIG9mIGNsZWFudXBfbXNpeCgpLg0K
Pj4NCj4+IHYzLT52NCBjaGFuZ2VzOg0KPj4gKiBDaGFuZ2UgZnVuY3Rpb24gbmFtZSBmcm9tIGZp
bmlfbXNpeCgpIHRvIGNsZWFudXBfbXNpeCgpLg0KPj4gKiBDaGFuZ2UgdG8gdXNlIFhGUkVFIHRv
IGZyZWUgdnBjaS0+bXNpeC4NCj4+ICogSW4gY2xlYW51cCBmdW5jdGlvbiwgY2hhbmdlIHRoZSBz
ZXF1ZW5jZSBvZiBjaGVjayBhbmQgcmVtb3ZlIGFjdGlvbiBhY2NvcmRpbmcgdG8NCj4+ICAgaW5p
dF9tc2l4KCkuDQo+Pg0KPj4gdjItPnYzIGNoYW5nZXM6DQo+PiAqIFJlbW92ZSB1bm5lY2Vzc2Fy
eSBjbGVhbiBvcGVyYXRpb25zIGluIGZpbmlfbXNpeCgpLg0KPj4NCj4+IHYxLT52MiBjaGFuZ2Vz
Og0KPj4gbmV3IHBhdGNoLg0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+IEppcWlhbiBDaGVuLg0K
Pj4gLS0tDQo+PiAgeGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMgfCA0NCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Zw
Y2kvbXNpeC5jIGIveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMNCj4+IGluZGV4IGViM2U3ZGNkMTA2
OC4uOGFiMTU5OTY5ZGE2IDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMN
Cj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jDQo+PiBAQCAtNjU1LDYgKzY1NSw0OCBA
QCBpbnQgdnBjaV9tYWtlX21zaXhfaG9sZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+
ICAgICAgcmV0dXJuIDA7DQo+PiAgfQ0KPj4gIA0KPj4gK3N0YXRpYyBpbnQgY2ZfY2hlY2sgY2xl
YW51cF9tc2l4KGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAgaW50
IHJjOw0KPj4gKyAgICBzdHJ1Y3QgdnBjaSAqdnBjaSA9IHBkZXYtPnZwY2k7DQo+PiArICAgIGNv
bnN0IHVuc2lnbmVkIGludCBtc2l4X3BvcyA9IHBkZXYtPm1zaXhfcG9zOw0KPj4gKw0KPj4gKyAg
ICBpZiAoICFtc2l4X3BvcyApDQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICsgICAg
cmMgPSB2cGNpX3JlbW92ZV9yZWdpc3RlcnModnBjaSwgbXNpeF9jb250cm9sX3JlZyhtc2l4X3Bv
cyksIDIpOw0KPj4gKyAgICBpZiAoIHJjICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcHJpbnRr
KFhFTkxPR19FUlIgIiVwZCAlcHA6IGZhaWwgdG8gcmVtb3ZlIE1TSVggaGFuZGxlcnMgcmM9JWRc
biIsDQo+PiArICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+c2JkZiwgcmMpOw0K
Pj4gKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+PiArICAgICAgICByZXR1cm4gcmM7
DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaWYgKCB2cGNpLT5tc2l4ICkNCj4+ICsgICAgew0K
Pj4gKyAgICAgICAgZm9yICggdW5zaWduZWQgaW50IGkgPSAwOyBpIDwgQVJSQVlfU0laRSh2cGNp
LT5tc2l4LT50YWJsZSk7IGkrKyApDQo+PiArICAgICAgICAgICAgaWYgKCB2cGNpLT5tc2l4LT50
YWJsZVtpXSApDQo+PiArICAgICAgICAgICAgICAgIGlvdW5tYXAodnBjaS0+bXNpeC0+dGFibGVb
aV0pOw0KPj4gKw0KPj4gKyAgICAgICAgbGlzdF9kZWwoJnZwY2ktPm1zaXgtPm5leHQpOw0KU2hv
dWxkIEkgbmVlZCB0byBtb3ZlIHRoaXMgbGluZSBhYm92ZSAiIGZvciAoIHVuc2lnbmVkIGludCBp
ID0gMDsgaSA8IEFSUkFZX1NJWkUodnBjaS0+bXNpeC0+dGFibGUpOyBpKysgKSIgPw0KQmVjYXVz
ZSBJIG5vdGljZWQgdGhhdCBpcyB3aGF0IGl0IGJlIGluIHZwY2lfZGVhc3NpZ25fZGV2aWNlLg0K
DQo+PiArICAgICAgICBYRlJFRSh2cGNpLT5tc2l4KTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAg
ICAvKg0KPj4gKyAgICAgKiBUaGUgZHJpdmVyIG1heSBub3QgdHJhdmVyc2UgdGhlIGNhcGFiaWxp
dHkgbGlzdCBhbmQgdGhpbmsgZGV2aWNlDQo+PiArICAgICAqIHN1cHBvcnRzIE1TSVggYnkgZGVm
YXVsdC4gU28gaGVyZSBsZXQgdGhlIGNvbnRyb2wgcmVnaXN0ZXIgb2YgTVNJWA0KPj4gKyAgICAg
KiBiZSBSZWFkLU9ubHkgaXMgdG8gZW5zdXJlIE1TSVggZGlzYWJsZWQuDQo+PiArICAgICAqLw0K
Pj4gKyAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHZwY2ksIHZwY2lfaHdfcmVhZDE2LCBOVUxM
LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIG1zaXhfY29udHJvbF9yZWcobXNpeF9w
b3MpLCAyLCBOVUxMKTsNCj4+ICsgICAgaWYgKCByYyApDQo+PiArICAgICAgICBwcmludGsoWEVO
TE9HX0VSUiAiJXBkICVwcDogZmFpbCB0byBhZGQgTVNJWCBjdHJsIGhhbmRsZXIgcmM9JWRcbiIs
DQo+PiArICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+c2JkZiwgcmMpOw0KPj4g
Kw0KPj4gKyAgICByZXR1cm4gcmM7DQo+PiArfQ0KPj4gKw0KPj4gIHN0YXRpYyBpbnQgY2ZfY2hl
Y2sgaW5pdF9tc2l4KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gIHsNCj4+ICAgICAgc3RydWN0
IGRvbWFpbiAqZCA9IHBkZXYtPmRvbWFpbjsNCj4+IEBAIC03MTQsNyArNzU2LDcgQEAgc3RhdGlj
IGludCBjZl9jaGVjayBpbml0X21zaXgoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgDQo+PiAg
ICAgIHJldHVybiByYzsNCj4+ICB9DQo+PiAtUkVHSVNURVJfVlBDSV9DQVAoTVNJWCwgaW5pdF9t
c2l4LCBOVUxMKTsNCj4+ICtSRUdJU1RFUl9WUENJX0NBUChNU0lYLCBpbml0X21zaXgsIGNsZWFu
dXBfbXNpeCk7DQo+IA0KPiBEb24ndCB5b3UgbmVlZCB0byBhbHNvIGNhbGwgdGhlIGNsZWFudXAg
aG9va3MgaW4NCj4gdnBjaV9kZWFzc2lnbl9kZXZpY2UoKSBhbmQgcmVtb3ZlIHRoZSBvcGVuLWNv
ZGVkIGNsZWFuaW5nIG9mIE1TSS1YDQo+IGRvbmUgdGhlcmU/DQpPaCwgd2lsbCBkby4NCkhvdyBk
byBJIHByb2Nlc3MgdGhlIHJldHVybiB2YWx1ZSBvZiBjbGVhbnVwX21zaXggaW4gdnBjaV9kZWFz
c2lnbl9kZXZpY2U/DQpKdXN0IHByaW50IGFuIGVycm9yIHdoZW4gaXQgZmFpbHMgYW5kIGNvbnRp
bnVlIHRvIGRvIG90aGVyIGRlYXNzaWduIGFjdGlvbnM/DQoNCj4gDQo+IE90aGVyd2lzZSB0aGUg
Y29kZSBoZXJlIGlzIGR1cGxpY2F0ZWQgd2l0aCB0aGUgY29kZSBpbg0KPiB2cGNpX2RlYXNzaWdu
X2RldmljZSgpIGZvciBNU0ktWCBjbGVhbnVwIChhcGFydCBmcm9tIGl0IGJlaW5nIGEgYml0IG9m
DQo+IGEgbGF5ZXJpbmcgdmlvbGF0aW9uIHRvIG9wZW4tY29kZSB0aGUgTVNJLVggY2xlYW51cCBp
biB0aGVyZSkuDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkpp
cWlhbiBDaGVuLg0K

