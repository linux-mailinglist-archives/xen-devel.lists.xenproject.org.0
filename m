Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C50FABB666
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 09:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989624.1373644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGvFU-0000Lx-Ij; Mon, 19 May 2025 07:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989624.1373644; Mon, 19 May 2025 07:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGvFU-0000KW-Fl; Mon, 19 May 2025 07:49:24 +0000
Received: by outflank-mailman (input) for mailman id 989624;
 Mon, 19 May 2025 07:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vhbn=YD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uGvFS-0000KQ-OQ
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 07:49:22 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2009::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5cde4dd-3485-11f0-9eb8-5ba50f476ded;
 Mon, 19 May 2025 09:49:21 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM3PR12MB9286.namprd12.prod.outlook.com (2603:10b6:8:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 07:49:17 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 07:49:17 +0000
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
X-Inumbo-ID: c5cde4dd-3485-11f0-9eb8-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NX/uxJl2EMtyqnP6EqyFSDs0MSiP3zUCz5wJG4zpR5MOvJRw/w/N+7fCFL0UIFgoqZdzus31mSvfVa/9o/Jg+U9D8sNzUsHtL2TWbVSyh0ORvf4XSB25J6Lz4JZGoeNvNqDSRkfgmI+zh+H7uNROAEaAYe3KHHEeXYVnIPiHd/nB2t7/QvkTOa1UYvxr6WLNBvnvrh6kCjpsm8JHlMSqGE/9qiDg5R6NTs/h6vWvaCNTo7KSehuGqOj+1VCo/BkHuiSFPLgHiqIChEldGAsp1Jy2oEdrMloyKzj68Z+OJtAGq6JqagUe1ezWZO+69E4tZSpXBwDR3wplUlEXBHQKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRuy3wektnG2j1QDmSmqn7HZ7BnVThQbQrgg1+poX4Y=;
 b=b/soKVF7X+fMntZ+NAkrxL8ODcjVrFaJAQBpXZl/kNOPMfDqOo79JuO/9k5zGaPI9HkQbGn9+fpCqbCUY/YLEClqFFPEWecGfH8Q8tLyyguPUxwwkpwUSA2oKTmKVFZrm5V6SH4swlIGzxsZu4ESTAy3Jzwiuny9byBmoAZTeB/U1Du+N2x0ktsJfNMNIYK2Uks7QZ12UdhwZE6vajSH0iOe5/sYpmxRGsPGVDYGlEMAmDaY3YkvufSOetsXDZVkxUjCcVtcGQmitxJiXea0zTPBmQ4UY1MH+G7TVZWLG3VXHSKVJHZxCWYi1coByNKhWW0p7a+20OtylLJYoyA79g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRuy3wektnG2j1QDmSmqn7HZ7BnVThQbQrgg1+poX4Y=;
 b=NdvE8+hd41twlJsq8c6kcrWc5iXGMC0J9ZyVOcOdy66/0YwRdGw/rdtqZKMJBD8Qe+YeOqLiJ8vuoxxLwT+SRH1EEZcIDXlin8yyKttbrW65xa/WDsvZq4P71J99iS9dTZc8xS1ZrOfsF2HVWMZzNlhboOjb0PHSsH2i0ucH7xk=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v4 08/10] vpci/rebar: Remove registers when init_rebar()
 fails
Thread-Topic: [PATCH v4 08/10] vpci/rebar: Remove registers when init_rebar()
 fails
Thread-Index: AQHbwMGht1D1H8X23kq6XrWFn0smo7PZlEAAgACVAwA=
Date: Mon, 19 May 2025 07:49:17 +0000
Message-ID:
 <BL1PR12MB584948FDD752F0D42391B538E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-9-Jiqian.Chen@amd.com>
 <b4ea2a79-68b5-465f-b4e0-652852596fae@suse.com>
In-Reply-To: <b4ea2a79-68b5-465f-b4e0-652852596fae@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8746.028)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM3PR12MB9286:EE_
x-ms-office365-filtering-correlation-id: 97e6749d-1191-4a3e-1148-08dd96a9a86a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NUVnZHB5T2tnbXFvNkNFVzRYYTJrK0hPZ0wyUlo4bXFhVkRsWHZSQnRaVUN1?=
 =?utf-8?B?cFpSV2lPanBOOE9PUXZSSVpSMlJYTlBYTUUwYVVuSG1WcGVDM1M0eVlCRXZw?=
 =?utf-8?B?dGxVY1JCa0h3UWV0V05sLzZRbTgzcVRUQnpRK3RRcXdSTC94b21CK2ZPR2NI?=
 =?utf-8?B?bjBKVi96azNmQjJ4c2N4cE45cGpFRktqRWI1ZmJmUVBoSkk0UGpHNFFVTmY4?=
 =?utf-8?B?OGxLeGNxUE1Cb2NvN3RMMmRaVGN1ZDlxY3Nmc05ZQTJTVmUyNFNBY2RHY3NJ?=
 =?utf-8?B?Mlc2K05FTXBNdGZoWDNxSDdRcVNaaEhHa1JObmQ5SzYzTFoxQzZBT2dGUUtz?=
 =?utf-8?B?dzd2R3BVeHFWeWQyR0Y0aU1jV0ZHMmVWdkg3YWphNm80MWM5dk1RUStqSHZs?=
 =?utf-8?B?Q3Y4ZVIyNklMR0NZVXhqZ0kwMStUZ1VMVTZBSFg2R2Y4aXNoMCtuRnpQZ245?=
 =?utf-8?B?SFQ5VW1XTG9XcnJnM0JXdkJTRnBvR2twbDlNbSs0Mm1aZXVXSi8zRXZFdHBT?=
 =?utf-8?B?OWRIRUxBeklHN1NVYTF6UU5tMnMwMEZ6Rnc0YUZ0c0h3OUNYeTFQL3NYN3BF?=
 =?utf-8?B?NXNUL3NwOGp5TGZKeWdDN1lQZGdIU3ppTEtHdHVjcHFJbXJiVWhzOHVJWEk0?=
 =?utf-8?B?VXg1ZmhCSzdpdWlZT2prT1ozRGRwZmZtM3pHQzJra3hIV0RDeDkxdFZXOWVn?=
 =?utf-8?B?ejZhL0gzYjlER1loNDhJUkJPK2tyU3Y1QzQ5OSsxa2JwdSsvYWNPdDhTczAw?=
 =?utf-8?B?a2lTQ3gyQTBBalZKdnBUbkZHS0JpbmxXNWFmRHlMUW8xMWFoL2V5aHd4NTNp?=
 =?utf-8?B?Z3d5VzRVZ0ZWUmo2cVhlVW1nYWFJNjVRWEMwOFlmNC9ReG16VnRKNWx6WWcr?=
 =?utf-8?B?NElLcG9ROWVLVHVFeU9ra0hTVStzMHdGU09tOVoyL1BJa0hHanlTZW9xQVVN?=
 =?utf-8?B?S1gwQW1CWFkrOWF3MW80SUdQckdzUm1lSnhVeWxjNTh5RmVJS25KSDlRQlpE?=
 =?utf-8?B?OFcrN0pqc1I0T2ZIYS8rbFhrUXpONC9uOG1ScHdXN0dXUGVXd0UxVm1CVnRV?=
 =?utf-8?B?aVJYR2JiMS9tbnVlVmhwdUZWbmZJWkxoOXQvSXdLNkd4cjJqamExd0pDRG5C?=
 =?utf-8?B?S0htVUplYVlGQStsb0E1SzFpMlZ0dnV1M29Xb2pteDAwTHk0TnBlZE5PaG1P?=
 =?utf-8?B?eDVGZUJJWTQ1NlBpWTY4RjUvekN3WlVsTXdwdllyaUxrV2JjWjh0UGljS2pm?=
 =?utf-8?B?ZmJsZXQ4VEljKzZHQnZBeXVOTUVzajRySVczRTc5Y2pManZiLzdxVDNwbFpt?=
 =?utf-8?B?NmRDb2JpK3NmYlhKQmE1N3ZrUnQxRXUwV05XanlkL2RqK0JXcndLYVRxSFlq?=
 =?utf-8?B?eUZGSG5WaFNkZXZCUm5aaXRFWXNpaXlqVHpyaTZVc1AxMXJCc2ZHdzA4ekpH?=
 =?utf-8?B?NnRpUVVObnV2MWhaTE1mcnE4a0d6RjVnNDZHc2pQbHplQklvYy92WmpUbkgy?=
 =?utf-8?B?d0RmYVNOckxnMzltSGl5OTVmZXQ4a3gyYU12ZFZ5NEFpMjMyREh6TDlaQ1ov?=
 =?utf-8?B?M2tLU2NoVDhmaUFLWHlrSDhMK3R5T2g4T3Mvbk4wNGhubkUyTHhDMlV4NUdv?=
 =?utf-8?B?eFFDa2ttV3ZWZ0xEV2plTGtDQ2tucjRvSVJSMFdZMHR5VTFBd1laNlFWR1Fh?=
 =?utf-8?B?Vm1SdUppenBWRWdDcWNFTmcvSXFENDc3QlIxbDlHcjd0UGtDQXBWdG9pKy8r?=
 =?utf-8?B?ajZXME5wdjF1RzJOR0t6SHhsSlJ2dStUK3M2UmFXT0JUcm5hR3d5SUI1bDRu?=
 =?utf-8?B?VWlJZ2l4STZBMDFjbXc0a2pPaDhwdzB5OVhodGpFMlU0MThQNDFOSWpZRS9j?=
 =?utf-8?B?NjdtTW05cUNxMTNPRGI1R0FMTGdDT3RSWU9wclhOZ3pwRlY4WEVBSEhVWUVS?=
 =?utf-8?B?YVNUMXRraFZxTGxmbGE4NjZOVzRjOXFiU0VBb1pRbW5SUUNMZ3Y1U0lNekoz?=
 =?utf-8?Q?/8tNU/mK5rtx7X9FhhqKM3F3RceW9I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2xZQzVJU0lMVmMyZ3lOWndUQXhBZjVZTnRjbmdkTFBidnIyVzBRWUJDZ2x2?=
 =?utf-8?B?NkJFM3J2Um9nZml5bHFvYUpPeHMrSGhQNk93Q091bmFNTXhDTW5Gbm9DYTRM?=
 =?utf-8?B?L3F0dzFKa2Z6bFpQU1V4ODVGdjZRREtLbkVVYk1SL2UwRXBvaTNySjlZT29j?=
 =?utf-8?B?OVpIbkEzQWQyQmpMMUNKQ2xnNzhLSzNINSsvSm1QTENtQ0g1YXA1M2E5VmVS?=
 =?utf-8?B?VlFwbE9GV0cvRmpEZUNUc2kwd3U2UHBqZWppaUFPeXF0b2gzTFJpYUlKVXhV?=
 =?utf-8?B?U2FkUkZmemFmWTZNR250Yk9xSExzU1VpbEZLOUJqK3lVSGh2L0s0Y3lNRHho?=
 =?utf-8?B?VEc2MFd4VGtiUk5yUHhlenByQVNUcExRZmNuK21DeHhlUzZNbDBYQXRUQjlW?=
 =?utf-8?B?ZDNyd3FUWGZuRENSanZOZE9VNS96MVVMZ2FpUUpCZjNkcDBESDNoZ1BJMHNr?=
 =?utf-8?B?b2JXOWpqVExUeHl4Q1NrZnJyOGR2UmpURVlXYzArNnBwUzFHOXZxcXdvQlZ6?=
 =?utf-8?B?L2xSYlJxUlhnVUhUS2xMbXpwV2pQK1FxZGxxd0l3SEJtOW45RlN2SVhRckpB?=
 =?utf-8?B?UERRZTl3U1JBbGRybklPeVpTYkVDRUVqV08vdkhLN0l6MG5NSVdwWmZCQmFN?=
 =?utf-8?B?NERyUmNEMktXekJGaWRwalZUTXM4dlFTQ0pYYnhGUFppcnFUKzdkODR6QUhH?=
 =?utf-8?B?Vk0rWGY3VzdSb2NlYy8wekM3b2I1MitYcGQ5RG5YMlM2WFFyVmZPM3Z5VUZW?=
 =?utf-8?B?SVhES2dNc0VpM3crZ3ZZb2VPSHQ4VElNYkZGOHp3L0Nrend2aG4vNFFjNml6?=
 =?utf-8?B?aGFXemcwcll4Y1FjQ3RPUlovUkRtT2lmYzRMUStMblR4elhZL3VkRjA1UGhV?=
 =?utf-8?B?a3ZtRVQzYjVkcC84SDhZS3V5V2pnaVUxNkFPUHVlWUlSUmwyaTBTb0VqdGJk?=
 =?utf-8?B?QUE4ZzNBbHM3Vk9GWlcvVkdLNVlma25sM2k5T1NEYVpuSkNGQzNEMGxyT0Zk?=
 =?utf-8?B?eEx6UEsyUkdzYkg2clE3QVpxODdlMHRPK3BwVys3Ukl1L2Z3ejU3QnVTa051?=
 =?utf-8?B?UzRCTnhSSjVRWnNvdEg3ZktKR0Q4ZHU3dXk3REk3Smg4a1VoenFYSUIyVlRs?=
 =?utf-8?B?K0o1aktoWFNnbXB2cXptWE9FdS9OWFhiUE9pcjl6RXhtbEFCSkZZcHRQL1VM?=
 =?utf-8?B?NzIrOXBYZmNtNUIrb01nWE5BSDFDempFekQ3eENQRVFjdURxcDlzazRmQ1JF?=
 =?utf-8?B?djdiUGVKNG1scXlXTG9XQnBxQ3ZwRGVrbVhVSXlkK2k4QTVEcE0vVjJRU3hB?=
 =?utf-8?B?bElzcG9mYmIzSndXZXpPTm9iV2tnWEZDOTEwZzR4U1NsYk96RFF1enNFcVBk?=
 =?utf-8?B?eisvRlVvMXdOQWhacHg3Tys2TDVOcHFvak8rSWtrR3JFMWJBNGNPL2M2T3FU?=
 =?utf-8?B?TVdPenMvL241ZUl1Y3c2UEJJUmIyYkYwV1ZkQlFpVEQyVXBzdG5vVGFPQlVY?=
 =?utf-8?B?elRSaWZOWHF1VHNCZVdqdC9zaDg1NGY5T2tuVnhIajY0L0V4N2FXWVFtTzBH?=
 =?utf-8?B?L3JvSENHc0FZMG5NVWdYbEJoTENHam9SU0tMNlo4OHRFbU9yUDFuakx6S1Fp?=
 =?utf-8?B?K2JMdndtc2dIY3hLdk9CbHVYLzQycGdOVFdxeFJHWG1nMko3RXBuQThraVIw?=
 =?utf-8?B?dVhPNUw0QTBRMGZmOUFpdi80ZnBZS1d0SUEyc1ZnRExHWnV3Nk1vRy91dFpk?=
 =?utf-8?B?QmtWMFlBT245WEVBZVdxWXhNQlRVWnNUeFZOZ2ovbGJrenFBNTNPeGZhZTZ4?=
 =?utf-8?B?dUtRemNneXV4d2NMVWRNRlA1TjloM0MwcGxZZjJXbHhpdVpqK1hZUVBFVFVz?=
 =?utf-8?B?cGM4SUV3clI0dkVxYUd4THltTlRxbFBhaHJJWGhGL2FqeDFEZzlHSERKRThT?=
 =?utf-8?B?dnIvZWRIRWtMNm0xUWVGenlEa3J5Wk1NUy9JQ2JZUEYxU0hMWHBYWkxPZDdk?=
 =?utf-8?B?RGJQQTVzYlVaOGplTXVnMFJKRk9ydjJ1U0NWbGFKWXJlNllqbGFrczhNNmhB?=
 =?utf-8?B?Q1E1OGkwcm5Wb2pHNHdWN3BuUUYxdjFGMDNES1dhKytmQWRnOGo2SC9OOUdQ?=
 =?utf-8?Q?jExw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC571ED400F5664EA89D5CE936C8F025@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e6749d-1191-4a3e-1148-08dd96a9a86a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 07:49:17.5253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aYzxK+OxG8wUwxFaeXSfSwLT9cOvqR3MMG66UiNdwFBzhU5K7pG+GU4ASuTiJqM7v9jWwwy5ar196kFA7NT8Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9286

T24gMjAyNS81LzE5IDE0OjU0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDUuMjAyNSAx
MTowNSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3JlYmFy
LmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvcmViYXIuYw0KPj4gQEAgLTQ5LDYgKzQ5LDI2
IEBAIHN0YXRpYyB2b2lkIGNmX2NoZWNrIHJlYmFyX2N0cmxfd3JpdGUoY29uc3Qgc3RydWN0IHBj
aV9kZXYgKnBkZXYsDQo+PiAgICAgIGJhci0+Z3Vlc3RfYWRkciA9IGJhci0+YWRkcjsNCj4+ICB9
DQo+PiAgDQo+PiArc3RhdGljIHZvaWQgY2xlYW51cF9yZWJhcihzdHJ1Y3QgcGNpX2RldiAqcGRl
dikNCj4gDQo+IEp1c3QgdG8gcmVtaW5kIHlvdSB0aGF0IGFueSBob29rIGZ1bmN0aW9ucyBuZWVk
IHRvIGJlIGNmX2NoZWNrLg0KVGhhbmsgeW91IGZvciByZW1pbmRpbmcgbWUuIFRoaXMgaXMgbXkg
Zmlyc3QgdGltZSB0byBrbm93IHRoaXMuDQpJIHdpbGwgYWRkIGNmX2NoZWNrIGZvciBhbGwgY2xl
YW51cF94IGluIG15IHNlcmllcy4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0K
SmlxaWFuIENoZW4uDQo=

