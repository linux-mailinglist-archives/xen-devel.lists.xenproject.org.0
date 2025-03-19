Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB82EA6931E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 16:21:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920866.1324918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuvEN-0000K2-85; Wed, 19 Mar 2025 15:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920866.1324918; Wed, 19 Mar 2025 15:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuvEN-0000IN-4w; Wed, 19 Mar 2025 15:21:19 +0000
Received: by outflank-mailman (input) for mailman id 920866;
 Wed, 19 Mar 2025 15:21:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9jgP=WG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tuvEK-0000Hy-RI
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 15:21:17 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c201::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbd0eb31-04d5-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 16:21:14 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8336.eurprd03.prod.outlook.com
 (2603:10a6:150:50::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 15:21:11 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 15:21:11 +0000
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
X-Inumbo-ID: cbd0eb31-04d5-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chLOJfWjI5V5P/D2nBh7sOjXqtr5KtSDlHNuSW2sV9N6AJWm2oqdhfcwWoM+znLgj9wmKwUaAE1mYBvNVeoHkr0S7soBc03HykdWq8ksvFTTOAxOawJ04GcDSsWTjaPIIgeDTrG0h3+UDdHAtZY57wxQ712/BkMhnrkaS0vgxrmZY6Gd98t7kjg+nxuT0NfLrpa4rwX6Crc2GgLcquAPYyd03765+fL4tK1TJrqhPJDuwPc6IeE/s/HvTQJvVN/cUgCRDZ9ovOmKa7ByHJ5JGiJEj63LUxbeEH6hJ/iWdPVszD9XrIQIMwdzLFzBP0ZK7V3NAXvB4VLaaYpQc8/yQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tvoe/if8S57Q42MNvGgVMT6UIq2muAQoE8e97X1QzOY=;
 b=B5pygAEBoSGDekAlLfldrhvOdaIivX2T8yWxZQM8NkbYYOIhnDc3jwpKQirrnp+P6X/jpEIUFCqX8nFRRd/jWz1czfpq4k21tjR1rtoRlhHU3tmlw0yMOfBb2tyca49BjkpHEu1ysl4GBEgGsyYj1hLuSIX5uxYUq5rhpOx0l51CKSk+rMIsEviE99uta3N7O2DQ0IWStIp1W78/x4p+vCQ6KxXMpJPSPwvhWfGTdt+6k29/UBHhHu/F2J8Pb1owl3V/UTrG/vQnMwKVleE8CHk8MS/7VuRvvoWo9GSjRyDA2BGHNsS+u60UE8AlsEzTGVsjUZko0UwRjHLmXnokRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tvoe/if8S57Q42MNvGgVMT6UIq2muAQoE8e97X1QzOY=;
 b=ZwDFQAV+CdDNfhsLt4eHI8/Kpmj/UgXRcRQEJebbjCnmjJEr6spmxaiR1ZvDKfedrxjqF67GvHFmViJVXpTxgdOqC7o9ZHrdiQrmWTTe3/hx+qizjFlEhEb1OTUHvWtbFJvf0e+mVkZkTKkS8u/YyL0l6QpUPlIJqzDajH9ck6LqlgfvbvfI57hLMdGwBcTaLjPNM8n1855y4g8mschDbSt6qt1ALCZ4AO0amNlcbmL2devPX9YPCueLmCh4bTKkc5QYQBhWTXlhD/q5PhG1bLHweScYUQfstdsER8ymBLCN3OuuFpA3SweLBNHA0are5ZBcejR5Fs7VLtsZB5YxyQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Thread-Topic: [PATCH v9 2/8] iommu/arm: Introduce
 iommu_add_dt_pci_sideband_ids API
Thread-Index: AQHblOXcI08sNdwZJ0ah+pJJkNPOtLN3b9CAgAMregA=
Date: Wed, 19 Mar 2025 15:21:11 +0000
Message-ID: <710bfddb-6ce3-4b11-bcd8-91f17d4f5be2@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <95d779f00127defa37f3c5056c762ea0da47fc53.1741958647.git.mykyta_poturai@epam.com>
 <d646b0b9-bae8-4f97-908a-f2e52cac708d@suse.com>
In-Reply-To: <d646b0b9-bae8-4f97-908a-f2e52cac708d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8336:EE_
x-ms-office365-filtering-correlation-id: 60a6aca2-1177-4f87-672c-08dd66f9ae5c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dXNNT2ViUHNGb3RoVUxBWExCWlFoMDA4bFMwZ2JHaEpVay9uNnFwV05CdXJI?=
 =?utf-8?B?ZytpaVFHVDhoY2RwU2hXZDhTWGF1VHMyeVA3bDVVc0FzL3FxV3dVeHhZRXls?=
 =?utf-8?B?RGo1bUtROG9ZUVpkNlYxS0o0M0ZOQXpCWEw3RVBXLzVTMUNiWG1JamFVTnYw?=
 =?utf-8?B?M2FIa09qekVxdUlqbEpOM3RobG00azZSS3cyc2dXOXhKTU93Znd6dTM4STMw?=
 =?utf-8?B?aHZGTDdjaE9wRC9sT0NZdTdWMnBBZ2duTHZqa1krU2kvdG1xM082OTVLQjNr?=
 =?utf-8?B?WjdGQUV4YXlWT1hrVDRnSlIrYkpIdElKZVFPc1k0ZHRjQUxvMEpSMU1ISGo1?=
 =?utf-8?B?VGdhOFBlczJUbXBUT080QldVbmJhYk11K3JsQUpDVStUeGZtak9mb2lPdFpY?=
 =?utf-8?B?bXIvajJuanI0VWEzL09KRGx4ZEt4cjQydCt6bDdXaThTSkcyMnNDdGFQVFhn?=
 =?utf-8?B?Mm9DakUxSDNnQXVSVmwrWXAzRENXbGw1eFVtdUkzalR1dU5QTlp3VzQrUnFN?=
 =?utf-8?B?aldtQm1heXVQWTNrbW43WWozckJ4bk1IcWtqRmEvTFlBNlAvN244ZmdEMzZu?=
 =?utf-8?B?TnRRVjRueFk5d3VBdlAxd0RwQmU0OHlpS1hjZE43STQrR0RDSml0ODBYNkp3?=
 =?utf-8?B?N3liYUE4YldIYk1NVzlmSkh5c2hkT0hwOFBEeUFpRXYxaG93bngwRlBEcXl0?=
 =?utf-8?B?bkpweXkvRnJONHlIOWdpaU9SeS8yR3ZkZkFVbWRaSWVkaUlITTRHbXZRc2Rj?=
 =?utf-8?B?SURrSGw2czJFb0NYc0VjY2RWaXBJTnF4ZFkxN3BRYWpMcW1zM0hCVy9vNndS?=
 =?utf-8?B?eU42NXlqL1MyMkRwZEpEbHFlalpDRmpzUUNET1M1bSthR3NlS3UyeFRybTZ1?=
 =?utf-8?B?U091WnVRNEowUGdTYkx6cE5DMk9Jdi9wb0ZSS1hPYzhQLzRqYzUvRnZqS1pN?=
 =?utf-8?B?U2xOUzAwQ1hhZzEzV21KTVUzUjU0MVRKa3hqa24wZ3BQK1g4Y096Mzdxdi96?=
 =?utf-8?B?MnJDMzlIalROM0dhZEgzaVlRbkdBRytVd09zWGZFWFAybWJHMVZ2OGFiU0pv?=
 =?utf-8?B?Unh4b3BLRFpocktJU3V0RHM5NU5Bdy9jb1F1d2NHbzhBUlVHK1J0YzNBTk91?=
 =?utf-8?B?TUhBeWZjckVNeHFPMDcrd0tma1JUREVTc29zNGZ2eXhLOXZncXJENnhWRm83?=
 =?utf-8?B?UElyNUtKZGJsbC9XOGVock15Rys4aVFrUngvNHY3RVdTQnhjWW9IRnBaRnd2?=
 =?utf-8?B?cy9NS2RkR2NJaDN4ZVdDY2tpUWJXSVNpYzBRL0JDay9ROTI5Ym5mYm85anlX?=
 =?utf-8?B?Q0M3MUlQL210dnJRSDdWRzlWWDlXRUs1a0Vyc2dMdWhYRGhnQUx1bCt0S0E4?=
 =?utf-8?B?K3RxdXpwYU9EdDM3NVp2SmM4eGVPVlY2ekExaEV3Y3pYZmtMSWNVU3B4SWlt?=
 =?utf-8?B?VFZDZFNZd2dvb29kNk83THlGVEppSldpMHdCdjVKSXdCQVVPTVM2NjdDUWcx?=
 =?utf-8?B?N21PUzlqemtoMVYxSmwwZjB3emVGSG5JcnkzLzg1cTFpN010YmsvYkNuUlRL?=
 =?utf-8?B?R1FnRG95NEtFdTVhRUprYUZmWGhQRHJJbHZGQlFmUGZtbldsaURiNWJFUnZ3?=
 =?utf-8?B?bjRhNmdpcjBNWDlqK1pTcTBlS1lja1NQSEdUMFhoUjZEY3BLRFpKdmY2ZUVl?=
 =?utf-8?B?SzdNbEVmSCtQT3BUbTZ3VlNYU1pJOXMxZHNpZnh4TmtjRU9BSVJOaXFTTmpa?=
 =?utf-8?B?N2J1TTJZOVA1eXJ4TXdicVVnYVI5Y1BwMzdtU2h2ekl0SE11RjJiYnFLOEV4?=
 =?utf-8?B?R1l4amluei8vTFMrWmNaUU5Qd29IaUlTRW9MUmJaSDN6U1RoR1FVeURSb1V3?=
 =?utf-8?B?VWpLTFh5TFVDVngrRG1zUmE0bk16ZzZ6WndMVjlCMWlYTEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?am5zS0x4Y2FuVTNOb3h3YkducnZESEYvclhKTTl3NDhvZjQ1RFJrY2lBMll5?=
 =?utf-8?B?RG1YY0pBdUNQUGE3VFQ4dmFhNGpTaWtRd0RMOElxb0praU1hU0tVRDN0Tzcw?=
 =?utf-8?B?SnNLSmFML09qZkptQ2ZCR2tFQVpram01NmsxekFGL2lUNkxDYVBpdGNLS2Fx?=
 =?utf-8?B?Rk94aUZlb29SRUg0dE5lUk53QnVQZzBOeko3MWYyam9yVFAzTWl1OUZhMHZT?=
 =?utf-8?B?Yk1sUVhCNEJsZklEUW1WZk0rUVR4eWxzd1RNWHExOVduMTN0R1VFWVo1SXEv?=
 =?utf-8?B?N1lVTS8yam9uTHFqaUV1SnYxczFqKzd1OXQ4cXJXSVZld0NrY2FaY0VoZm81?=
 =?utf-8?B?T3R0WFVIWjNGNWZXMlJSRUhjcUJEMFBNUDdXVWtqcHZpakovUmQvSCs3NWp0?=
 =?utf-8?B?RThEYm9lamJQWmZtWFJOWHc3T0VnUitWWmtIRWhkQ2tnSFM4RGt5RmNHR3Nn?=
 =?utf-8?B?Wks2Y3JNQzJhQVJabytNNk8zTHl6anE3a0VKY3JXUlFIWFcwSk85T2RTNVpv?=
 =?utf-8?B?cWIvV1ZTOFRNQlJqZmVMeHJGbmF4YkhSUUxOWFFvbVR6L05ld0FrMm5ubnFS?=
 =?utf-8?B?K1h6cWtLWHlnU3NUaXM0Z05iUVVHUHlzaGpUdXdKME1ZZ01lTzBZWWpwemtu?=
 =?utf-8?B?VFBaSytKaUU2QmVuL1plakZhOEw0cVRBUHNLN3JlQnNyd1BMNHhIdWRjTWNK?=
 =?utf-8?B?QVhnWmhyN010YS9PekhOZUtvN2Z6V3lLMklCQUFVOUtMYUdWSURYSEFuSm9J?=
 =?utf-8?B?R2czbDA4QzQ3K3NvaFVVbmZqcnYybTFIRGlaUUVRMTM4c0ZSNUtNczQyMEtC?=
 =?utf-8?B?QWxRWWFHa3pWM1lKU1NjaVUrRXN1cG5nR096R091QTk3V0w3aVh1d3k4d1dL?=
 =?utf-8?B?VmJtSktrbUk1d3VkN2ViaFV3eXVObEc1bGZ6Vk5va1J6Q2plWHMzTWxFZkhp?=
 =?utf-8?B?aFI5NmlQNzZFL2hNSGJBYlcrVjA1QnVvNXJobGtjcVdoOUhwcFVrYUcxekxn?=
 =?utf-8?B?SnRRQmhQeFltdFd2UUg3cHo1QlpyRTdNRE9uRlpuVU1kTzJHMmVURml3WU1J?=
 =?utf-8?B?MGpPVERnTDFIS2ljOXlEMXdFSFJFN05Hc2lvMEFIenovOTJna2JLV2ZzRUF3?=
 =?utf-8?B?cnBrcnZHdC9HS294czZId2tiampYR3FXR3lqc0kvSGQ3OFkxY1RLSjNLc2pu?=
 =?utf-8?B?ai9OVHZRNFRXTkNRVzQ1QkZTUTVyRmZNYm1hK0hUWFhCZzJyL0RZcHN6NVJI?=
 =?utf-8?B?eGxEUFhvNGZKRHB1Y1ZvNnY3eFJnZnR6YTM0cWo4ai9pbzZDV20zWm1NZEVX?=
 =?utf-8?B?SDZaMEZEa3lhZ1ZaMXpyelZFNFpaaXRDdHF5b3Ixc2htZC9xVE1kczNEckVn?=
 =?utf-8?B?bEtYc0hOc2MzQWF1c3lSdjRsNXBhQnNZejNJS3ViaDJqVUFEWHlBUjRETWYr?=
 =?utf-8?B?UEJGMW90bTgxeUFCVEFhUktzZVJXWk9QUlJEaGJ0dHE5Q2RtaEZsR3kvZ1Fz?=
 =?utf-8?B?cjJlbDdlb2dYVGZaWmdoL1NLdFNld21tNDJNYW55M3lOZzlKNGRKK0JocVpC?=
 =?utf-8?B?UmdCN2tHeXdiRzFrSXAvZTN3dTZPd0ZFNXAvZ3MxNndrUDBKRFQ2VzgwdXhC?=
 =?utf-8?B?VFhmbFhnUy80Zlh1NXdQQVF2UUR2WGNDRDNRQ0VxRDd1MlRjVGoxYmxGeFNZ?=
 =?utf-8?B?WmtpMjZOTXdtTFlKOXhoK1FUZ3pHcTFWM3UwNXE5emI0a2d1Wk5mL25qcnFu?=
 =?utf-8?B?eTRSQy9qTkZCMmJFQ0ZlZzhKTW9NSE1uUi82eEt0UVpub21BeTJFZkRDdjB5?=
 =?utf-8?B?YUpEbStJbFM5YTk5eW9sTVFLYmpQSWhwNkJ5L1hSY1U5Yi9lNlF6amlyazFt?=
 =?utf-8?B?N1UzK3dDYnZTV2dBWTNGNlNVeUEwY0xJS2Z0SDBVRGJmVEk4MFJSdFhPUGJX?=
 =?utf-8?B?WVpmL0tNTmNXWC9vS0Z5QmhBU1BZWFVrZlFqa1FOejBKenFmOFpXNHorMnlC?=
 =?utf-8?B?ZVVjbm03b2tCMS9MRStFT1Y2T1dhZWo2L0VFYjMzU3FQanZRdnhhOUVrNDQz?=
 =?utf-8?B?NFNnZklWbC9sdkppWncrOXhSUlZTVVFFRTJ5Vk5FY2Q1VjBUaURycmJHV2sz?=
 =?utf-8?B?eFhyQnJrdmh3RTJ2TzNSZ08yQUlJOEYrUXZmSFVESzFWZ0E1anRlUnFFVXVE?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAC4F9F21817B4429AD8483F40F02E28@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a6aca2-1177-4f87-672c-08dd66f9ae5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 15:21:11.4453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kkdGgRc4M3ObuCiFH/7J0u8XeKfCCcrpZm2JeKMPKsr5xW2uaGDg5Z8e7yKB/jkTQNfgwNgFHxSLuJLrbMwbjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8336

T24gMTcuMDMuMjUgMTY6NTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4wMy4yMDI1IDE0
OjM0LCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtv
IDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBUaGUgbWFpbiBwdXJwb3Nl
IG9mIHRoaXMgcGF0Y2ggaXMgdG8gYWRkIGEgd2F5IHRvIHJlZ2lzdGVyIFBDSSBkZXZpY2UNCj4+
ICh3aGljaCBpcyBiZWhpbmQgdGhlIElPTU1VKSB1c2luZyB0aGUgZ2VuZXJpYyBQQ0ktSU9NTVUg
RFQgYmluZGluZ3MgWzFdDQo+PiBiZWZvcmUgYXNzaWduaW5nIHRoYXQgZGV2aWNlIHRvIGEgZG9t
YWluLg0KPj4NCj4+IFRoaXMgYmVoYXZlcyBzaW1pbGFybHkgdG8gdGhlIGV4aXN0aW5nIGlvbW11
X2FkZF9kdF9kZXZpY2UgQVBJLCBleGNlcHQgaXQNCj4+IGhhbmRsZXMgUENJIGRldmljZXMsIGFu
ZCBpdCBpcyB0byBiZSBpbnZva2VkIGZyb20gdGhlIGFkZF9kZXZpY2UgaG9vayBpbiB0aGUNCj4+
IFNNTVUgZHJpdmVyLg0KPj4NCj4+IFRoZSBmdW5jdGlvbiBkdF9tYXBfaWQgdG8gdHJhbnNsYXRl
IGFuIElEIHRocm91Z2ggYSBkb3duc3RyZWFtIG1hcHBpbmcNCj4+ICh3aGljaCBpcyBhbHNvIHN1
aXRhYmxlIGZvciBtYXBwaW5nIFJlcXVlc3RlciBJRCkgd2FzIGJvcnJvd2VkIGZyb20gTGludXgN
Cj4+ICh2NS4xMC1yYzYpIGFuZCB1cGRhdGVkIGFjY29yZGluZyB0byB0aGUgWGVuIGNvZGUgYmFz
ZS4NCj4+DQo+PiBbMV0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9wY2ktaW9tbXUudHh0DQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0K
Pj4gU2lnbmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRA
YW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IE15a3l0YSBQb3R1cmFpIDxteWt5dGFfcG90dXJh
aUBlcGFtLmNvbT4NCj4+IC0tLQ0KPj4gUmVnYXJkaW5nIHBjaV9mb3JfZWFjaF9kbWFfYWxpYXMg
cXVlc3Rpb246IGdldHRpbmcgaG9zdCBicmlkZ2Ugbm9kZQ0KPj4gZGlyZWN0bHkgc2VlbXMgbGlr
ZSBhIHNpbXBsZXIgc29sdXRpb24gd2l0aCB0aGUgc2FtZSByZXN1bHQuIEFGQUlVDQo+PiB3aXRo
IHBjaV9mb3JfZWFjaF9kbWFfYWxpYXMgaW4gbGludXggd2Ugd291bGQgYXJyaXZlIHRvIHRoZSBo
b3N0IGJyaWdlDQo+PiBub2RlIGFueXdheSwgYnV0IGFsc28gdHJ5IHRvIGNhbGwgZHRfbWFwX2lk
IGZvciBlYWNoIGRldmljZSBhbG9uZyB0aGUNCj4+IHdheS4gSSBhbSBub3Qgc3VyZSB3aHkgZXhh
Y3RseSBpdCBpcyBkb25lIHRoaXMgd2F5IGluIGxpbnV4LCBhcw0KPj4gYWNjb3JkaW5nIHRvIHRo
ZSBwY2ktaW9tbXUudHh0LCBpb21tdS1tYXAgbm9kZSBjYW4gb25seSBiZSBwcmVzZW50IGluDQo+
PiB0aGUgUENJIHJvb3QuDQo+Pg0KPj4gdjgtPnY5Og0KPj4gKiByZXBsYWNlIERUX05PX0lPTU1V
IHdpdGggMQ0KPj4gKiBndWFyZCBpb21tdV9hZGRfcGNpX3NpZGViYW5kX2lkcyB3aXRoIENPTkZJ
R19BUk0NCj4NCj4gSSBmZWFyIEknbSBjb25mdXNlZDogSXNuJ3QgdGhpcyBjb250cmFkaWN0aW5n
IC4uLg0KPg0KPj4gdjctPnY4Og0KPj4gKiBFTk9TWVMtPkVPUE5PVFNVUFANCj4+ICogbW92ZSBp
b21tdV9hZGRfcGNpX3NpZGViYW5kX2lkcyB0byBpb21tdS5jIHRvIGZpeCB4ODYgYnVpbGQNCj4N
Cj4gLi4uIHRoaXMgZWFybGllciBjaGFuZ2U/IFJlYWxseSwgd2l0aCB0aGVyZSBiZWluZyBubyBj
YWxsZXIsIEkgY2FuJ3Qgc2VlDQo+IHdoeSB0aGVyZSBjb3VsZCBiZSBhbnkgYnVpbGQgaXNzdWUg
aGVyZSBhZmZlY3Rpbmcgb25seSB4ODYuIEV4Y2VwdCBmb3INCj4gTWlzcmEgY29tcGxhaW5pbmcg
YWJvdXQgdW5yZWFjaGFibGUgY29kZSBiZWluZyBpbnRyb2R1Y2VkLCB3aGljaCBJJ20gc3VyZQ0K
PiBJIHNhaWQgYmVmb3JlIHNob3VsZCBiZSBhdm9pZGVkLg0KDQpUaGUgb3JpZ2luYWwgcmVhc29u
IGZvciBtb3ZpbmcgdGhpcyBmdW5jdGlvbiB3YXMgdGhlIGNvbmZsaWN0aW5nIEFDUEkNCmFuZCBF
RkkgaGVhZGVycywgSSBkZXNjcmliZWQgaXQgaW4gVjggY29tbWVudHMgaGVyZVsxXS4NCg0KPg0K
Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPj4gQEAgLTIwLDYgKzIwLDcgQEANCj4+ICAgI2lu
Y2x1ZGUgPHhlbi9wYXJhbS5oPg0KPj4gICAjaW5jbHVkZSA8eGVuL3NvZnRpcnEuaD4NCj4+ICAg
I2luY2x1ZGUgPHhlbi9rZXloYW5kbGVyLmg+DQo+PiArI2luY2x1ZGUgPHhlbi9hY3BpLmg+DQo+
PiAgICNpbmNsdWRlIDx4c20veHNtLmg+DQo+Pg0KPj4gICAjaWZkZWYgQ09ORklHX1g4Ng0KPj4g
QEAgLTc0NCw2ICs3NDUsMjAgQEAgaW50IF9faW5pdCBpb21tdV9nZXRfZXh0cmFfcmVzZXJ2ZWRf
ZGV2aWNlX21lbW9yeShpb21tdV9ncmRtX3QgKmZ1bmMsDQo+PiAgICAgICByZXR1cm4gMDsNCj4+
ICAgfQ0KPj4NCj4+ICsjaWZkZWYgQ09ORklHX0FSTQ0KPg0KPiBJIHJlYWxpemUgd2UgaGF2ZSBD
T05GSUdfWDg2IGhlcmUgYXMgd2VsbCAodmlzaWJsZSBldmVuIGluIGNvbnRleHQgb2YgdGhlDQo+
IGVhcmxpZXIgaHVuay4gWWV0IHRoZW4gdGhlIGdvYWwgb3VnaHQgdG8gYmUgdG8gcmVkdWNlIHRo
ZXNlIGFub21hbGllcywgbm90DQo+IGFkZCBuZXcgb25lcy4gU2luY2UgSSBkb24ndCBoYXZlIGEg
Y2xlYXIgcGljdHVyZSBvZiB3aGF0J3Mgd2FudGVkLCBJJ20gYWxzbw0KPiBpbiB0cm91YmxlIHN1
Z2dlc3RpbmcgYW55IGFsdGVybmF0aXZlLCBJJ20gYWZyYWlkLg0KPg0KPiBKYW4NCg0KSGVyZSBp
cyBhIHNob3J0IHN1bW1hcnk6DQoNClRoZSBtYWluIHByb2JsZW0gaXMgdGhhdCB3ZSBuZWVkIHRo
aXMgZnVuY3Rpb24gc29tZXdoZXJlLCBidXQgdGhlcmUgaXMNCm5vIGdvb2QgcGxhY2UgZm9yIGl0
LiBJdCBpcyBvbmx5IGNhbGxlZCBvbiBBUk0gZm9yIG5vdyBidXQgaXQncyBub3QNCkFSTS1zcGVj
aWZpYyBieSBuYXR1cmUgYW5kIGNhbiBiZSBldmVudHVhbGx5IHVzZWQgb24gb3RoZXIgcGxhdGZv
cm1zIGFzDQp3ZWxsLiBJdCBjYW4ndCBiZSBqdXN0IGRyb3BwZWQgYmVjYXVzZSBvZiB0aGUgZWZm
b3J0IHRvIHN1cHBvcnQgdGhlDQpjby1leGlzdGVuY2Ugb2YgRFQgYW5kIEFDUEkuIEl0IGFsc28g
Y2FuJ3QgYmUgZGVjbGFyZWQgYXMgYSBzdGF0aWMNCmZ1bmN0aW9uIGJlY2F1c2UgaXQgcmVxdWly
ZXMgdGhlIGluY2x1c2lvbiBvZiA8eGVuL2FjcGkuaD4gZm9yDQphY3BpX2Rpc2FibGVkIGRlZmlu
ZSwgd2hpY2ggbGVhZHMgdG8gYnVpbGQgZXJyb3JzWzFdLiBBbmQgd2l0aG91dCBpZmRlZg0KZ3Vh
cmRzIGl0IHdvdWxkIGJlIGEgTUlTUkEgdmlvbGF0aW9uLg0KDQoNClsxXQ0KaHR0cHM6Ly9wYXRj
aGV3Lm9yZy9YZW4vY292ZXIuMTczOTE4MjIxNC5naXQubXlreXRhLl81RnBvdHVyYWlAZXBhbS5j
b20vNjdiOWJkMTM4YzEyYzBkZjM1ZTVjNGIzMTM3YzMwYWQzNDUwOTdkNS4xNzM5MTgyMjE0Lmdp
dC5teWt5dGEuXzVGcG90dXJhaUBlcGFtLmNvbS8jZTZlYTUyYTMtYzdjZS00MTFmLTgxODYtY2Y3
MjVhYTYwOGYzQGVwYW0uY29tDQotLQ0KTXlreXRhDQo=

