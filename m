Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E632ABF1C72
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 16:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146408.1478838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAqfh-0003sk-1J; Mon, 20 Oct 2025 14:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146408.1478838; Mon, 20 Oct 2025 14:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAqfg-0003r0-Tz; Mon, 20 Oct 2025 14:15:36 +0000
Received: by outflank-mailman (input) for mailman id 1146408;
 Mon, 20 Oct 2025 14:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gwR3=45=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vAqff-0003qu-Sk
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 14:15:36 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c02ec38-adbf-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 16:15:30 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB9607.eurprd03.prod.outlook.com
 (2603:10a6:20b:5aa::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 14:15:24 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9228.014; Mon, 20 Oct 2025
 14:15:24 +0000
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
X-Inumbo-ID: 3c02ec38-adbf-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tV4Qm8UvFYKwitFXmMzfAg97ctfyxalx0N8ddq631IOW+C6Uq+xCroTXYhmBut4Q1rzqAGjT6br7iGfW+7Iu1JRGkyR8G+Vmtb/myW1hPGwBmVYbzyZCqcDIDN6ZMdfGOUYxecvoPxRhYZGc7HZnCPtZWpAovfwmdCbQJ6nfA75uIt4KQDx+3a09XkaHOoRahc24yUmuO9D6JB4cKqwT3gnKrmfpwtryyU6kYb5Ussf7Hdgq5VabnVDY3MNhTAIuKcStdEU0JZhcLtuaOcIzLsLhxBpFRIYPf3OFFTfGsEEzeClbnWYi1rv72Dzd1bQE+oo/+ceTbujdPKNng6Ym5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ped0LGid1UcTE8vxOQhB6FJi6aLME1fw+i0UV6KNi38=;
 b=m7qbQBNDorxFNPs48ebtLqilBysQwue4FuqIdeDszwNO4CwmQ9Zcoik8ug+MT2g0eJFTJk8Y49Q8fG9gJRAjpgOm0ijjitmrm1puzKtgxb5y4/OJLtANGJkB4DficG8GIR2/Jc8V+UGCnOK9QxbiT72C1KVf6weO3eW7q7j7ZAdNFprCpeA1Dj1rs/SQo1l0nFl6T0Qz5Ke33J8hsDYFdfPkjMRJo65xYIWYbGgY/kdbAYp5cIV8HEz3w3I7Qxq2smzWEcHYQtTVYKsbdEK00wjcmGLMzvYdBz6jwtgI59VDjb+9XcV84kX6FnYpuu/MYAV7GCKqpYlyb3LyBYRB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ped0LGid1UcTE8vxOQhB6FJi6aLME1fw+i0UV6KNi38=;
 b=VztjJVtVoZ6voaF0EfWk5lTPqHEVCbntDUCRBy3qAVzqlVCyk4tWieKCfVSMuk9gq6V/J23+exj4hkVgly5YXHE6TivB6Egswmv7x4ClBoTyAcpoeCahGuv3v1mUvdaVlL/8CvpzjyDMCdEqK0SFL8KPDf0vJixj+RhUU4aYqXpk/rfIQ+Or/LB9fnTAo1t8PyyLRr63yZpvi+MP1s94PYcv1GNlClBowDl1lE18zX1TLkEnL8lqZooaBJWOwVJQagTPmNINr1Ny9P7ySW3JavQRCtBXCbJ07HsUa8X0ogM+72Xvi8UOEtb1LP00x6QLp6E2JRVg6sxNjwJNKDqUmQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v3 0/5] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v3 0/5] Implement CPU hotplug on Arm
Thread-Index: AQHcOcdPI3ki3mxsgkWwwomwd2VOcrTDfxsAgAelSIA=
Date: Mon, 20 Oct 2025 14:15:23 +0000
Message-ID: <2728d969-06fa-4f35-95a1-a79dd441242f@epam.com>
References: <cover.1760083684.git.mykyta_poturai@epam.com>
 <CAGeoDV-=ON+WSvCQnjaa9zU_74RuFHXrqa5+p8dAjM9fxpomxw@mail.gmail.com>
In-Reply-To:
 <CAGeoDV-=ON+WSvCQnjaa9zU_74RuFHXrqa5+p8dAjM9fxpomxw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB9607:EE_
x-ms-office365-filtering-correlation-id: 362c8bc7-b203-4c4a-c743-08de0fe31c54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QkFnNmhvRHBsVmlRT2VtV2VwK2JCWThUNVdLMDgzZE5jbDFEM20vNmQ0KzBJ?=
 =?utf-8?B?Sk5lK1pwL052MkcvWnRla3paWkNiWlJsR3VTclR2OFJ1SUwwdlNtMDU0QmJr?=
 =?utf-8?B?cW9LdVBUL0NYejZRT1YrWWRvQ3NQNWZKcWEzdjg2T1N3cWZpdFJiWWlTME44?=
 =?utf-8?B?MEhMN3UrdE1qZnZHSDFyZTNyNGdLeVVPbk1aODNkZHFIMU4zV2lrZGsrdkdC?=
 =?utf-8?B?T0RxZUpXZEJ0T3RYanB2ZGl2WnNpNG5oWU9GRzFnMU1BTVcyNUQ4Q0lEcXR5?=
 =?utf-8?B?anlMenJ3NTFLU09FckhFZld0a3E5OGlyUkVGV2NzOTV2enVhWjhSRVdrREVz?=
 =?utf-8?B?WkxYR1kxWDRVRSsrKzJPRXBXRHFXTnpISWNrZ1d6U0xVVUwzMnUvYnFYcDd1?=
 =?utf-8?B?TG1xTURaU09lSFYxQWd5RFB5RnZUOTMxMmJDL1Q4ZUFpUEMxdG5taE9kbW5o?=
 =?utf-8?B?cWQ5bUl2MTdlT3Uzb2h1RUNnRmo1SURCaWs2M0hLY2d3K0hydW9VSCt1K3Zs?=
 =?utf-8?B?S1BUNnJuTXdLUUV1V2swV0JWVE1PbjNMNjhKZXFSSGNPSGdVNy9PQXQ0cDJ3?=
 =?utf-8?B?V2tBV2ZqNFdOOHhucWNNUWhSUlcrZElQZS94NmlCcjMxL3lrbDB6Rzh3RUg5?=
 =?utf-8?B?MVJTUmNhSFErSllySTM0ZFZmdVNTN2tCYjh4eTJUcWszMk9FaUc1VXN5bWNW?=
 =?utf-8?B?WU1TRnErTVR6bE9QTFdzT2tHLzlNdURTK25ISWJEZkF1U1k2T09TV3BnWHYz?=
 =?utf-8?B?YVVBSHVOS0ZxL2RTQ0lBVGhuTEpjajkvajVsTVgvTEs5bU0weWZMNFA0V24r?=
 =?utf-8?B?NkIxV0lPT1hmcnJ5ZEJGTDM4WERzZG52cUZGZXJ2cHFLTVVRek1UaEN4dlRR?=
 =?utf-8?B?VUxwK1hFNWhkKzNZb0JZMmV6Smp6ZkZMWHVwQ2pJZVRzODhoR0daZEMrY2tG?=
 =?utf-8?B?OHVUNVQvOXJPS0taQnVXZ29NNC9ISXhWTHJ6VmNYVHRaeDNkbmhya3RjMlVN?=
 =?utf-8?B?a09VakxWeTlaNXdQN2x6QjVUeUNNUk1nYjRzZzlzVHlVMU1IMGhYOHdBaE01?=
 =?utf-8?B?SDFXaWJPMXhBZXMybStnQ1pOUFRqK1loN3ZpR2pROVplbWhyeHR5b0lwM29O?=
 =?utf-8?B?L05BT3RLM2VtSUpnd0JmZ0RKemhHOEhhbEkxQ1JXKzRGWFAvTWRhMjhJQUhq?=
 =?utf-8?B?RlhoYWJCd3lVY0FSRXJuMTdiZ2YxN1J5TG45Vm44UUJQeFhRcW9mRURGOTNF?=
 =?utf-8?B?QW8vODVCR2Q3TDczQ01sYXJlcGhEVGVaMis5ZjJ4bTQ3QTFjR0d2alhSWWdn?=
 =?utf-8?B?aTlsay9XNDhvaGNIME4yTVJaZnFtSmpGV0JnR2k5cHlUZGQ3RC9ybTV5MVVx?=
 =?utf-8?B?VGVVQW1DOEpOTEREc29IeWpSbkx0VUpnOGxLaFlORCtLNUdWbVM4UXd0NldI?=
 =?utf-8?B?cC83ZzEraGc3QU02NEc3WERjaEVUMnhJaDBTOHQvN3d0Rlo3NXF5SWtoZ1lM?=
 =?utf-8?B?V2xIVGdrYWF4WlVoOGw4RkovTG91b3JrbmtSNzd3bUY0aHFUSFdjSjZobFlV?=
 =?utf-8?B?WlZmRHdnM3FKV0RiMjFYbGszb0JjMDNpR3M4UHlzVHVjYW9RaHdxSXpPdEpq?=
 =?utf-8?B?T2hWZHFiUzJKelBXc0R6NVo5dng3b2hOZUFFRTR3T1JNdGF2WTlNZ2toS2k4?=
 =?utf-8?B?L09Cdm1kMWlkQUJQemN2SnNkbFNTMDdmY1ViQkpxUngrR0poYWJQYTlOdVhZ?=
 =?utf-8?B?MGVPZFR5ZC8vR2lWUFkzQVFDMjA0clNYck9iMkdWV1pSdkJBRVZicGgvWCtK?=
 =?utf-8?B?NENHNHBoL3dZeTNER1N1NzB6SVJ6djB1NXBwc3NlN1dRVXZvUlEvL25EbFd0?=
 =?utf-8?B?NGNoM255N2pPamVodmFERDVWeVJpcXVMd0xha1QzUWRqYUIrbG4ycTF3VEkv?=
 =?utf-8?B?amsxTEswdExuK0pFbkt6NEV4SkdjcmZONmplclB3cFlxbVp6em1MTHI5UFd5?=
 =?utf-8?B?djV3bWlSZWRMQUdjNExkWnYvNFpaREhTbERacm1aUVVoekh1ZXFtVDRiTXk0?=
 =?utf-8?Q?JmGX3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ejkxZ3B3cVh2OWM3SEgxbnNBS1NkSDNsT0YrSUhNemhFQW9wNHBreERyVXZ1?=
 =?utf-8?B?N2kzVXpkZ01ZZ0hRaW5JbVhKcHV6NkJHUGp2MWdVNnZCeVR6bTJLMnM4RHpk?=
 =?utf-8?B?NEh0VmQ3UXZ6QStySWowSEdWeXREZVI2OVRtU0lzV1Rta1pIK2hCNGFpYlNZ?=
 =?utf-8?B?clNtOU1wWmpJTGdTT203YjJRZUpOSkt0MVkydnAvV0xJR1d0Y2dIT1ZFU2ox?=
 =?utf-8?B?NUIzYXZraXY0TTNyN2hYd2tDenZTWDV3SWNTVmI2bHJWcExaMEU2dWdRcmdU?=
 =?utf-8?B?TUpMTkh5YTJyWHoxTGUvWXZibVVwdHFiVE5UaVp4UnRpSzRTK3JEWHg0dEZO?=
 =?utf-8?B?SkZwc2Q3engrVWxtd1lvdEZsc0ZoSUNndVVLL00zcU5ZUGs4emdSRU5FY3lI?=
 =?utf-8?B?QXVOWWNac2g3TTZDbXBldFZYSnJYVmVXQkQvR1BPdGdYUElmQVpSY3gxRjJU?=
 =?utf-8?B?d0ZlQ0tXSTZicnVKTmtCWWRSNm1zNTgxQU12alZFK2daeVRnNEh5d29neFpx?=
 =?utf-8?B?ZTN6cUdnOHo2eUlOeUdwZFZNU29FSFIzcXZrcDFneHY2VjRSWWExYTdUaFo2?=
 =?utf-8?B?d3NpOWxERVkvUVh6akV3TEdPZHhrL0d0VHFlb090VG0yQ0VqU0I5MG5aSm1H?=
 =?utf-8?B?bXZ0YWxFMjRjdUF5a3I3R21IUm0wdHdmcVY2Y1dnKzI5TTEwRFB3dmlCQWNQ?=
 =?utf-8?B?cXRiRzg0R3JSNnZTaGdDYjlld25kOENtVmpBWEcrYTFiZCtoYjhna0UxekJW?=
 =?utf-8?B?NTBmK0RjRkMrYUIvcGF4eHRrTUt2ZWhKWXA3S3FWY0QrR0lPN3FzZncwS1hO?=
 =?utf-8?B?NDAxeWFWRERBMGFJbGVySU91N1d1TlBSQ0hOOC9DbXB5R3JqY2c4V1d6a0VD?=
 =?utf-8?B?NXpwY2IrWEdyYkI1Y1p6amgrN21UWG14QWVSYUNsM2hCMFpYZkRvL0tJTVNm?=
 =?utf-8?B?OXdnRGRlUkxzQUEwUEJCT2JrVXVlSDJtQkhZdmVHWm0vaE9MWmV1SEZPZUZM?=
 =?utf-8?B?RndhWSthSytpdHQzVnhyQXVXbERuZVFkbzZQSVBxbndZc3R6TktjSm9GWEp5?=
 =?utf-8?B?VHpMNG1ITkw2cGFQY0dEWFZzTmdLMWt3TTU5K2tTaXVrN3NmSFBrMHRVR2Ux?=
 =?utf-8?B?VC9iZGdQLzZaZlMrc1IzWjNVcWFCV0VpQUlUNGtZb3E4VTNtRDdLQUluc0hz?=
 =?utf-8?B?QUY3bW9sU0UrMDNTNWdTTFdCZjVKVm5MZEFTVGZkdGVKb3E3eGdzZnozclpn?=
 =?utf-8?B?d2NQVXh2dERHZmxTTHF5RjI3RWFBNk5ONjZxRWdyK21BcWhYMFpENFVhWUhK?=
 =?utf-8?B?cXVtbVluZDdpcjhZYzEyY3ZQTjlpbWhtamwvNVQ1NDlXUFBlSFhrY1o2QnBV?=
 =?utf-8?B?VmE5ZUdhQ2dkbmlkVVNVL3czdStNeTBROGlxWmVWWHBCVGtPT2xvTHJITVRE?=
 =?utf-8?B?MDRlck1EZnZJNkZuejRzN043dmRDMHhvQVo3bnJqZzUvYytnZmVrUDRyWnho?=
 =?utf-8?B?WXRCNFF1ZmYzT0lEdXZHY2xoZ08wRkxWbnhvT1lKdDdLLzRpcDU2Qi9WVlNN?=
 =?utf-8?B?aUF3cDRjZ0hSdVViOGFzaDFxbU41OWJRU1podTQ3RjR1cEllT0hxS3FWcGlY?=
 =?utf-8?B?SWxPMmVVME96UGF6eFY3RGRPTlJhUGF3TnBTSXBFYmRiQlRmaUFpZUxTSXI5?=
 =?utf-8?B?bFk0ZE15b1dDZUR3MU5iQTJtaDducytYMEJqYXhIcFZrOG9NMzlOM0syQ0VY?=
 =?utf-8?B?Uk1UdzFVVEkxdGQyZ1lkdUQ4MEpicmVsK2ZjQ3pFcDhBTUpyNHo4b2hReWhI?=
 =?utf-8?B?R1VxNFhNY3RMWEl0ekhXcEJNNDJFTllXSzRULzl0alRnWUQ5Z2R2d1pIL0k5?=
 =?utf-8?B?cHVHQTBmcGVPSWJ1YlVhWWZjTnBndWtLN2lKakM4eGtRYWZqZzA5azRqaHF4?=
 =?utf-8?B?Ni9ublhDbGV4NGZiZEFUZHdrTTRpVFFjV0NNSVlXdFBkeng1aURPVHFkdnpm?=
 =?utf-8?B?TDlVV2p4VTFhUHdxSEt5bWd2Nk5lOU1WcXNmN1ZZTWFVZHJrUHRlVDZucGx2?=
 =?utf-8?B?Y1R5TFRLd2xxb2tDTHIvajVDZExBNjRrQXhoaStjVUsybXFiZS9Dd0d0MlZF?=
 =?utf-8?B?SzBsVUdTTVNiOVRNTmNCZnJKbGc2VWpTcHNZSUFoVGQ3OFVsN0J3LzU2b2xy?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <724D8716F9DD134AA367E5440A33714F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 362c8bc7-b203-4c4a-c743-08de0fe31c54
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 14:15:24.0075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oGCc7hqFXxEXGLVtCSenIBPFXP3Xs05iEiq/J6vDmUraIqXprWXU9ysW+6AmLknz6qwjk5+Wtn3p+GQbbn8DTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9607

T24gMTUuMTAuMjUgMjA6MzAsIE15a29sYSBLdmFjaCB3cm90ZToNCj4gSGkgTXlreXRhLA0KPiAN
Cj4gVGhhbmtzIGZvciB0aGUgc2VyaWVzLg0KPiANCj4gSXQgc2VlbXMgdGhlcmUgbWlnaHQgYmUg
aXNzdWVzIGhlcmUgLS0gcGxlYXNlIHRha2UgYSBsb29rIGFuZCBsZXQgbWUNCj4ga25vdyBpZiBt
eSBjb25jZXJucyBhcmUgdmFsaWQ6DQo+IA0KPiAxLiBGRi1BIG5vdGlmaWNhdGlvbiBJUlE6IGFm
dGVyIGEgQ1BVIGRvd24tPnVwIGN5Y2xlIHRoZSBJUlENCj4gY29uZmlndXJhdGlvbiBtYXkgYmUg
bG9zdC4NCg0KT1BURUUgYW5kIEZGQSBhcmUgbWFya2VkIGFzIHVuc3VwcG9ydGVkLg0KDQo+IDIu
IEdJQ3YzIExQSXM6IGEgQ1BVIG1heSBmYWlsIHRvIGNvbWUgYmFjayB1cCB1bmxlc3MgaXRzIExQ
SSBwZW5kaW5nDQo+IHRhYmxlIGV4aXN0cyAoaXMgYWxsb2NhdGVkKSBvbiBicmluZy11cC4gU2Vl
DQo+IGdpY3YzX2xwaV9hbGxvY2F0ZV9wZW5kdGFibGUoKSBhbmQgaXRzIGNhbGwgY2hhaW4uDQoN
CklUUyBpcyBtYXJrZWQgYXMgdW5zdXBwb3J0ZWQuIEkgaGF2ZSBhIHBsYW4gdG8gZGVhbCB3aXRo
IHRoaXMsIGJ1dCBpdCBpcyANCm91dCBvZiBzY29wZSBvZiB0aGlzIHNlcmllcy4NCg0KPiAzLiBJ
UlEgbWlncmF0aW9uIG9uIENQVSBkb3duOiBpZiBhbiBJUlEgdGFyZ2V0cyBhIENQVSBiZWluZyBv
ZmZsaW5lZCwNCj4gaXRzIGFmZmluaXR5IHNob3VsZCBiZSBtb3ZlZCB0byBhbiBvbmxpbmUgQ1BV
IGJlZm9yZSBjb21wbGV0aW5nIHRoZQ0KPiBvZmZsaW5pbmcuDQoNCkFsbCBndWVzdCB0aWVkIElS
USBtaWdyYXRpb24gaXMgaGFuZGxlZCBieSB0aGUgc2NoZWR1bGVyLiBSZWdhcmRpbmcgdGhlIA0K
aXJxcyB1c2VkIGJ5IFhlbiwgSSBkaWRuJ3QgZmluZCBhbnkgd2l0aCBhZmZpbml0eSB0byBvdGhl
ciBDUFVzIHRoYW4gQ1BVIA0KMCwgd2hpY2ggY2FuJ3QgYmUgZGlzYWJsZWQuIEkgdGhpbmsgdGhl
b3JldGljYWxseSBpdCBpcyBwb3NzaWJsZSBmb3IgDQp0aGVtIHRvIGhhdmUgZGlmZmVyZW50IGFm
ZmluaXR5LCBidXQgaXQgc2VlbXMgdW5saWtlbHkgY29uc2lkZXJpbmcgdGhhdCANCng4NiBob3Rw
bHVnIGNvZGUgYWxzbyBkb2Vzbid0IHNlZW0gdG8gZG8gYW55IFhlbiBpcnEgbWlncmF0aW9uIEFG
QUlVLg0KDQo+IDQuIFJhY2UgYmV0d2VlbiB0aGUgbmV3IGh5cGVyY2FsbHMgYW5kIGRpc2FibGUv
ZW5hYmxlX25vbmJvb3RfY3B1cygpOg0KPiBkaXNhYmxlX25vbmJvb3RfY3B1cyBpcyBjYWxsZWQs
IGVuYWJsZV9ub25ib290X2NwdXMoKSByZWFkcw0KPiBmcm96ZW5fY3B1cywgYW5kIGJlZm9yZSBp
dCBjYWxscyBjcHVfdXAoKSBhIGh5cGVyY2FsbCBvbmxpbmVzIHRoZSBDUFUuDQo+IGNwdV91cCgp
IHRoZW4gZmFpbHMgYXMgImFscmVhZHkgb25saW5lIiwgYnV0IHRoZSBDUFVfUkVTVU1FX0ZBSUxF
RA0KPiBwYXRoIG1heSBzdGlsbCBydW4gZm9yIGFuIGFscmVhZHktb25saW5lIENQVSwgcmlza2lu
ZyB1c2UtYWZ0ZXItZnJlZQ0KPiBvZiBwZXItQ1BVIHN0YXRlIChlLmcuIHZpYSBmcmVlX3BlcmNw
dV9hcmVhKCkpIGFuZCBvdGhlciBpc3N1ZXMNCj4gcmVsYXRlZCB0byBDUFVfUkVTVU1FX0ZBSUxF
RCBub3RpZmljYXRpb24uDQo+IA0KDQpUaGVyZSBkb24ndCBzZWVtIHRvIGJlIGFueSBjYWxscyB0
byBkaXNhYmxlL2VuYWJsZV9ub25ib290X2NwdXMoKSBvbiANCkFybS4gSWYgd2UgdGFrZSB4ODYg
YXMgYW4gZXhhbXBsZSwgdGhlbiB0aGV5IGFyZSBjYWxsZWQgd2l0aCBhbGwgZG9tYWlucyANCmFs
cmVhZHkgcGF1c2VkLCBhbmQgSSBkb24ndCBzZWUgaG93IHBhdXNlZCBkb21haW5zIGNhbiBpc3N1
ZSBoeXBlcmNhbGxzLg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IE15a29sYQ0KDQotLSANCk15
a3l0YQ==

