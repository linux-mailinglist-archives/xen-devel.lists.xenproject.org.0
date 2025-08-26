Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F308B356A8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 10:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094071.1449411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqowS-0003L4-2C; Tue, 26 Aug 2025 08:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094071.1449411; Tue, 26 Aug 2025 08:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqowR-0003Jb-VW; Tue, 26 Aug 2025 08:22:07 +0000
Received: by outflank-mailman (input) for mailman id 1094071;
 Tue, 26 Aug 2025 08:22:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofj+=3G=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uqowQ-0003JT-E2
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 08:22:06 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2412::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc25466a-8255-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 10:22:00 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SA1PR12MB7317.namprd12.prod.outlook.com (2603:10b6:806:2ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Tue, 26 Aug
 2025 08:21:55 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 08:21:55 +0000
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
X-Inumbo-ID: bc25466a-8255-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJLgEG9G68SG74JO0yuF8PVgGcQwIv4PBGtiiwELG8EI/Uzctk0CJdby6PreElLMp0uaG0rWb5WxlX1BbJjXdE0s4XsBR/N5+ltuHkpeME5TveNyP6RPY1J5+hquETQUVkUf4iFK4ly09KMbJwDKnrXrCBQdIgx9iTf0PlgjyMCyD0JWwxjclg88O1Kb3WH5LwJuwCmC/DCGRpSTFFpUifS1PxKKV8JGuiC+NPR6b/uXaywtee+aa0bshHAGSWHCX5upxQwygqTCD1uRhpCkMJBQw7zKzprneY37NVKzdJtuuK+ibmgNkjCfa/6cun1yN8XxBd/DFIWC6fYg2dSGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=px3ujermkuIgj3WrZnBLkXS1fkDkxnPp7/NdwTK64XQ=;
 b=idc5ETh4nLjoah54MP7RJwAsivxsZu1zSgHs3hlSDqRo6tiBXajMgBcwpC16e4lXWjQH87+WQRHtVNSVZuPCdrEg0MPJzQqKn9sMzh+tRmLqT9A0iXoRbNnuHog2nzbS/LJRzhYU1gB/GxgntKcRZtqoXty046jiYQMf75dnzaNHA5JHghNnNZsrtU9o0oOJ7I5iXXyC0DiPu/pkQiGEOmkV1neBqTauFzf0WDZe/PtDk7v6SLMobx+Dz2p05TJux2VCEgyS208XJNzHg2fdDlFifbclDTmUk9Dcq8JKqU4LoUu/rCf6t0Es+nKj4T0yUtO23M3nj2253nCuXdr7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=px3ujermkuIgj3WrZnBLkXS1fkDkxnPp7/NdwTK64XQ=;
 b=jgAG1scBo3+r8UdKpQvR+m/LxqDZLSvDCpb6ZOTUpH3W7+/XqDqFHYicSwqCFOhLf3w5dum7NsIsK5R0d+r3VzW1Ul4HjRbYz0TZN2I19EtU7NksSbhpTFGFubTOYENVRMM3k9M2AzsJMAVRPmUubQl8qVK0VJmIVuEnnHZsdDE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 11/13] tools/cpufreq: extract CPPC para from cpufreq
 para
Thread-Topic: [PATCH v7 11/13] tools/cpufreq: extract CPPC para from cpufreq
 para
Thread-Index: AQHcE1LyQ0lYyaNtv02FRdV+NHpcFrRzhX0AgAESjyA=
Date: Tue, 26 Aug 2025 08:21:54 +0000
Message-ID:
 <DM4PR12MB845198356D8DDCE39A62DF29E139A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-12-Penny.Zheng@amd.com>
 <b54e3460-380b-41e4-b9e9-75ba5c6129fd@suse.com>
In-Reply-To: <b54e3460-380b-41e4-b9e9-75ba5c6129fd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-26T08:21:46.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SA1PR12MB7317:EE_
x-ms-office365-filtering-correlation-id: 6df3d917-5afb-45df-bfbc-08dde4799e03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MHczWjdMUW51ZUJFSWlGTy9XOG9CR3lUbDZYRXE1UjZDNEZZV2x6bktlV2xQ?=
 =?utf-8?B?aUYxSGdmcVVHN0pNZ1haZVVPanBzbDdmWjlmWTh3eUZwNSs1a0FGVzBja1Jq?=
 =?utf-8?B?U3VYbW1iQk5qRHVFZnZnNFNnOUE4d2RGTW1GTXRrd2RWbXhMM09uNnlVYS9W?=
 =?utf-8?B?bXV5QTgzdUU2UWJ2Qk1aYjgzR3pyR3Bic2NSbW1ZK2s2RENCZ0RtbW1veFJ3?=
 =?utf-8?B?dFRKVHRla2YzcWYrMGsxaEZvRWFRWm1UblpYd3FWS3ArNUN3NUxwblNVYU1y?=
 =?utf-8?B?LzN1WmxCS3Z6TkFVaENrM002NzJpMnlVK1BVVTFRQndjNTVoRitxVUZKdlhU?=
 =?utf-8?B?WkJnWDlhSm9oSnM1bWxzQjlySldOaWxZZGdsSURQOEdDSGhyQk5Bc1l3aEtq?=
 =?utf-8?B?VTB3bTBFMnZJbmxXQkIxSm1ybmtnc2FiZldzOTBVdncxQ0ZHY0R1QW92L2ZB?=
 =?utf-8?B?QmMvc05IQVFrZUpXQlF2RitqTGZmNEx0NkN5THVKOVdRREgrdTRiSGhyeURq?=
 =?utf-8?B?N0FhNnc3VEU0R0ZFckZVWjc0RC96Skd1bUdGMnBPeTN6MS9uT3EzSlFmS0Z5?=
 =?utf-8?B?aUdIaUhJRUx2cXpYK2NkWDdiMjRsekJZRUdIOExqU256Z0V5ZTFsUzNrUDho?=
 =?utf-8?B?NHoyT0NCUkpub041eUhqdUNLTUxoaG1wQ0xrb3lZRys1dUxyRjc2Z0JOU1dJ?=
 =?utf-8?B?NWRXU3YvMGlwc2xMZlVsUjdoVGZUMXVSbUpSSVBPSllZSHhiSHg5c0g2dDZl?=
 =?utf-8?B?Q0Uvc0poaWwrWXpFTng3cDM5eitreU0rQkZ5UW5aZEZLLzZGeXRGRkY0VFV3?=
 =?utf-8?B?UUpSZUpwWDQyT2VuOG53WVpxWUtDUTJ1V3dCdjc3K3JaODRYRVEydmdBaCs2?=
 =?utf-8?B?ZjRXTlViTTdGNjA3cE8vM3pndXlReWVUVWNtcDFya25HWmpUQXNwcm00eWdY?=
 =?utf-8?B?NXhuOUQrWnROYVNDSHFPaVNaSjUrd3dMQi9XR1lnTkhVd2NxOVdyMzdTLzRy?=
 =?utf-8?B?RWFHdUNObEJHem5LaytYR3dKbUt5dnNYcExhbXIrUmxxK0wvbDFSczZza2JQ?=
 =?utf-8?B?S3Y4b0tManZwQ2NSdUhMdDI2QmhzU3p3S2t3QjRHak10dDhDdmt3aXlSSFVp?=
 =?utf-8?B?bktsQnRtTzhtRTJjbWo5aHRSdHdBUG92V21PWFdRQ081OW9jZDkwRU5BOEZx?=
 =?utf-8?B?Y0pVaTYxYStPdjNISms3cExPRW9tS1BPeG9nckY2a25aNkwyc1ZPTFhndTJt?=
 =?utf-8?B?NnFlR1lBNFBTWk15OXpnK0hDZ3FEa201cGF0UTZ5aUpnTmliTEUrSDhoTkVi?=
 =?utf-8?B?RDBUV1V2NzR3R1pxTkE5SDRYNjJvTWRTM3lTRTNtTUl5ZExOa05EbzN6aW9E?=
 =?utf-8?B?K2pydm5MbEgwazFmWjZpZkx2OWZEUFEwWEg3K0hPRm03eGJPbGJWdFVOMWNJ?=
 =?utf-8?B?SlF3VXhjNWN4cFBFUkNmZ0xQNHAyR1ZlSkpESHNkRmFLTWFWUE41RFRYd3hX?=
 =?utf-8?B?MVJRRnVIVkx5S1kwTlBWQmpjTjZjR01hM0k3MS9lbFZDTTZWQnUzWTV1ckJQ?=
 =?utf-8?B?NkkvWlN0dWIrUVFKbU4xUENTTENTeXBxSDdDRjgwb3grTWhnVytzUnFFaDVU?=
 =?utf-8?B?cGQ4b1dFYTFMVlM3K1RKRlp2RHAzY0xnbytvVVJBL3IrWHU1SC9mRXAwQ3Ba?=
 =?utf-8?B?ZmUvd2sycEZqb01XS2JveTlmaDcrejY2dndxSG1sU2hXaEczNGFGOUg4MzYx?=
 =?utf-8?B?VWJCdUkyeHB4ODBQakZya0N6bHVXZlplVlVXT1FMbCtMcmhLR3REZ2I2cXZv?=
 =?utf-8?B?a0wvNGtWeXg0YUlDdlZrd211NTBxNDdTa21KY3FFdGtUUms1QThhNUhDS092?=
 =?utf-8?B?YzBvVExoeE51NjQ3R3NZR3FJV1BBOTYvY2NlVXFLMVY4ZmUwak5ZUEJab2J1?=
 =?utf-8?B?L3NVVFJoTG1tNmRzalFaS3lGYnpEUDNKQ1dpM0tQZXhOVzdmUTc0R1dPbHcx?=
 =?utf-8?B?TG1wUUF0QjB3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bU9TR1ZBbHNnUDY2TGg3NkJTamNhWmtyZFVoc3QxNVIvbEF0V0J1dXlVUGhq?=
 =?utf-8?B?YndjUXNJdGswRVFBMHlwWTdwTCtGTzB6cmZYQkhKR0haVm9POFlUZzBSWUFE?=
 =?utf-8?B?dUFnYkhtVGtzcnBSVTE4VUJXSU9BSFFLdmVnLzA4UVg1Qm1lb3FPOXM3WGdO?=
 =?utf-8?B?TklnSXZqVWZjWjBqNHJwWkFTYnAxWEFkTlQraStiYndyTjB1MGdNa0hzWTUr?=
 =?utf-8?B?TmhmWmhqbW02SnJkdnZFWHdvYTNldXdZMlNOTVpYTFhuUFRQMGdmVlFPUkRq?=
 =?utf-8?B?YUNKSWdBOWhZT1MrZVhDUlk3TFhNZnZZK0ozV21ieDNTaVpoR0Fiand0K2lX?=
 =?utf-8?B?eWc0dnYvRnFFM09xVnlxNExzWXQ3M0R1SHhSeWVOcGF5MHZiampLbG55cGhO?=
 =?utf-8?B?NGlpREVVNlcwcTVaRWw2Ryt3RHZsU2s4Nit4YTZwL0pQWVNuN3d5Z0dqdnBJ?=
 =?utf-8?B?RVJrTkphQVVtNGZESk1mVHArejRHK2wyV0NCWjdvanY5S2owUW5kdUVVYVIr?=
 =?utf-8?B?ZVU0MGdZeEtISUUydGY2M2ttZmJWVmN0SVFPTk5JOWNnUStwZTVpREhTblRM?=
 =?utf-8?B?c0MwNzBiZ2NORXFIdG45NWIwZjlMR3ltc2JEeTZSclJpeTNZemdjb2hXZXlo?=
 =?utf-8?B?WnhxR2hHSjF5RW83dFFhKzRaalBoS3YwMlVrUStCcXNiRnhPait3N3hSSEh3?=
 =?utf-8?B?OHF0NGVPd08wTXdIOUZxSXVJZEF4NVNQQnJZTXc5Yk0rNGRScHdpRFMzb3RY?=
 =?utf-8?B?YlhpU3V0eTNVRldhSUF1WkF5RlBGbi9VUlhCMVFuRXlnZkxZbG1JbEEvcy9B?=
 =?utf-8?B?Z3lNcmM1ZUZaMmpWbUhqWHh4aHJXbFROaDRmcHN2azNDY05aS2o5N0lqNDQ4?=
 =?utf-8?B?RGlTZjVCVXNFaEVRVlU5REJ3UmFNaGhtUTdla0RhVVMvenlvNm9BZ1pQWjRQ?=
 =?utf-8?B?RWdJVjFpeTRFaE9QRnA3UWo3bmJhU2Z3NENVeklWQXlOcVpnUjAzMGs1aVRi?=
 =?utf-8?B?V0pWeVJpcllUd1EyUzdrY2VQdG1odWR6RDBjdlp2ZVh3OFNOOUpIVXBzdUll?=
 =?utf-8?B?UWc5K0VOOXgrdnBSbUJTclFNMHRQWHZIYzA4aWlrbFVydHMzNHpMZjFCWm1a?=
 =?utf-8?B?TzBRM0pOR2VaZDA5STdpQlgwdFl6aFBTSms5VzZ0NE9VN0thZzU4N283cHdP?=
 =?utf-8?B?SEtLZmtMYno3R2NBZXhlREs3ekFqRTN0alREeUVoSDFVV0dDM1lpaXRMZkQ5?=
 =?utf-8?B?VGZ6YVlndWd1M3pSR0F3b2tsYzVzM1ZVUTJNblhFd0lGb3RDVnBjYWl2c3lo?=
 =?utf-8?B?dHlMYjhxOGNIVTdxU2MxWDMzblBtYWVVajc0V04wUlVuMXIwdVA2MTU4Q2VP?=
 =?utf-8?B?emhjS3VpSDkxOFlZU1FSSFlheHp0QlNNZi9naGN2NmtXSTlZbzB1UUxpenE1?=
 =?utf-8?B?azdhc0djWGJmekRrUjU5N2p1eWdJY25mLzNDSmhvRWZlWnYxR3NESlBSczBo?=
 =?utf-8?B?SWRQNTlmZzJmSXdxYXNPa0JCUVNyY0x5bFN5cDUyTWE3SXFUZFg4Z1dtSE9X?=
 =?utf-8?B?Q1FlYmxoOXVVS0I0dGtYYmhJbmdSOG94WkxMSDIxSk9TYXRZS2prcjJGVXNO?=
 =?utf-8?B?TDFaWjVYT21sRXFwbkVGUVpHcTdvNHp2REs3TDZhMUhlQ0pyV2lwS2Q0UEZ0?=
 =?utf-8?B?WXBtdU1KSVRWcmdkYXhHajZkZHc2UnZtMERnWnI3UkVJb2J3NWZFOEJYcVBp?=
 =?utf-8?B?QmJkRmM4MkZBdmlvT00rVVEwMDhoSm92a2krajd5TVEwUmk4YnJkSTdaTzRD?=
 =?utf-8?B?NzRVeTJrWm1UaExxaEVnZjNXVFpzZVBwS0lqdXQ4VjZhTi9kbDlTWk94dSs5?=
 =?utf-8?B?cUtsaG96UlRLOC9kcEdVcm85UkU0TVRwdGJHWVd4bjF3Ny9nSm9uVS85cGY3?=
 =?utf-8?B?Sys1M0V4Y1h3Ukl1VHFJT01wdE9oTkJYSVd2dUdRU09vQVl3VlpZdWtuekR5?=
 =?utf-8?B?QThRZGJMeFlzWXNWYnpQWFVGdWF3NXpvdUN1c2ptd2dwaWs5VGRMYlRYQ1Nt?=
 =?utf-8?B?TjdLNkhFNTZCSE5TUDBQazZXYmhZeklpR1ZKZFNweFN6TEJlQ0lLNEhEY3I4?=
 =?utf-8?Q?z6AY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df3d917-5afb-45df-bfbc-08dde4799e03
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 08:21:54.9191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +JPnmC6RsYBKBGSiBsENv6ULeqMY9ec/sp6Sbuq6syuveWR9xWIR8D9VgQFt7oeYyqXU4HagykAYLyj/G4DyjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7317

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDI1LCAyMDI1
IDExOjM3IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFudGhvbnkgUEVSQVJEDQo+IDxhbnRo
b255LnBlcmFyZEB2YXRlcy50ZWNoPjsgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjsg
QW5kcmV3DQo+IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IE9yemVsLCBNaWNo
YWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsNCj4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFubw0KPiBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMTEvMTNdIHRvb2xzL2NwdWZyZXE6
IGV4dHJhY3QgQ1BQQyBwYXJhIGZyb20gY3B1ZnJlcSBwYXJhDQo+DQo+IE9uIDIyLjA4LjIwMjUg
MTI6NTIsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IFdlIGV4dHJhY3QgY3BwYyBpbmZvIGZyb20g
InN0cnVjdCB4ZW5fZ2V0X2NwdWZyZXFfcGFyYSIsIHdoZXJlIGl0IGFjdHMNCj4gPiBhcyBhIG1l
bWJlciBvZiB1bmlvbiwgYW5kIHNoYXJlIHRoZSBzcGFjZSB3aXRoIGdvdmVybm9yIGluZm8uDQo+
ID4gSG93ZXZlciwgaXQgbWF5IGZhaWwgaW4gYW1kLWNwcGMgcGFzc2l2ZSBtb2RlLCBpbiB3aGlj
aCBnb3Zlcm5vciBpbmZvDQo+ID4gYW5kIENQUEMgaW5mbyBjb3VsZCBjby1leGlzdCwgYW5kIGJv
dGggbmVlZCB0byBiZSBwcmludGVkIHRvZ2V0aGVyIHZpYSB4ZW5wbQ0KPiB0b29sLg0KPiA+IElm
IHdlIHRyaWVkIHRvIHN0aWxsIHB1dCBpdCBpbiAic3RydWN0IHhlbl9nZXRfY3B1ZnJlcV9wYXJh
IiAoZS5nLg0KPiA+IGp1c3QgbW92ZSBvdXQgb2YgdW5pb24pLCAic3RydWN0IHhlbl9nZXRfY3B1
ZnJlcV9wYXJhIiB3aWxsIGVubGFyZ2UNCj4gPiB0b28gbXVjaCB0byBmdXJ0aGVyIG1ha2UgeGVu
X3N5c2N0bC51IGV4Y2VlZCAxMjggYnl0ZXMuDQo+ID4NCj4gPiBTbyB3ZSBpbnRyb2R1Y2UgYSBu
ZXcgc3ViLWZpZWxkIEdFVF9DUFVGUkVRX0NQUEMgdG8gZGVkaWNhdGVkbHkNCj4gPiBhY3F1aXJl
IENQUEMtcmVsYXRlZCBwYXJhLCBhbmQgbWFrZSBnZXQtY3B1ZnJlcS1wYXJhIGludm9rZQ0KPiA+
IEdFVF9DUFVGUkVRX0NQUEMgaWYgYXZhaWxhYmxlLg0KPiA+IE5ldyBoZWxwZXJzIHByaW50X2Nw
cGNfcGFyYSgpIGFuZCBnZXRfY3B1ZnJlcV9jcHBjKCkgYXJlIGludHJvZHVjZWQgdG8NCj4gPiBl
eHRyYWN0IENQUEMtcmVsYXRlZCBwYXJhbWV0ZXJzIHByb2Nlc3MgZnJvbSBjcHVmcmVxIHBhcmEu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYW1kLmNv
bT4NCj4NCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gIyBoeXBl
cnZpc29yDQo+DQoNClRoeA0KDQo+ID4gLS0tIGEvdG9vbHMvbGlicy9jdHJsL3hjX3BtLmMNCj4g
PiArKysgYi90b29scy9saWJzL2N0cmwveGNfcG0uYw0KPiA+IEBAIC0yODgsNyArMjg4LDYgQEAg
aW50IHhjX2dldF9jcHVmcmVxX3BhcmEoeGNfaW50ZXJmYWNlICp4Y2gsIGludCBjcHVpZCwNCj4g
PiAgICAgICAgICBDSEtfRklFTEQocy5zY2FsaW5nX21pbl9mcmVxKTsNCj4gPiAgICAgICAgICBD
SEtfRklFTEQocy51LnVzZXJzcGFjZSk7DQo+ID4gICAgICAgICAgQ0hLX0ZJRUxEKHMudS5vbmRl
bWFuZCk7DQo+ID4gLSAgICAgICAgQ0hLX0ZJRUxEKGNwcGNfcGFyYSk7DQo+ID4NCj4gPiAgI3Vu
ZGVmIENIS19GSUVMRA0KPg0KPiBXaGF0IGlzIGRvbmUgaGVyZSBpcyBhbHJlYWR5IGxlc3MgdGhh
biB3aGF0IGNvdWxkIGJlIGRvbmU7IEkgdGhpbmsgLi4uDQo+DQoNCkVtbSwgbWF5YmUgYmVjYXVz
ZSB3ZSBkZWZpbmUgdHdvIGRpZmZlcmVudCBjcHVmcmVxIHBhcmEgc3RydWN0dXJlcyBmb3IgdXNl
ciBzcGFjZSBhbmQgc3lzY3RsLCBzdHJ1Y3QgeGNfZ2V0X2NwdWZyZXFfcGFyYSBhbmQgc3RydWN0
IHhlbl9nZXRfY3BwY19wYXJhLg0KQnV0IGZvciBjcHBjIHBhcmEsIGl0IGlzIGFuIGFsaWFzOg0K
dHlwZWRlZiBzdHJ1Y3QgeGVuX2dldF9jcHBjX3BhcmEgeGNfY3BwY19wYXJhX3Q7DQpTbyAuLi4N
Cg0KPiA+IEBAIC0zNjYsNiArMzY1LDMzIEBAIGludCB4Y19zZXRfY3B1ZnJlcV9jcHBjKHhjX2lu
dGVyZmFjZSAqeGNoLCBpbnQgY3B1aWQsDQo+ID4gICAgICByZXR1cm4gcmV0Ow0KPiA+ICB9DQo+
ID4NCj4gPiAraW50IHhjX2dldF9jcHBjX3BhcmEoeGNfaW50ZXJmYWNlICp4Y2gsIHVuc2lnbmVk
IGludCBjcHVpZCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgeGNfY3BwY19wYXJhX3QgKmNw
cGNfcGFyYSkgew0KPiA+ICsgICAgaW50IHJldDsNCj4gPiArICAgIHN0cnVjdCB4ZW5fc3lzY3Rs
IHN5c2N0bCA9IHt9Ow0KPiA+ICsgICAgc3RydWN0IHhlbl9nZXRfY3BwY19wYXJhICpzeXNfY3Bw
Y19wYXJhID0NCj4gPiArJnN5c2N0bC51LnBtX29wLnUuZ2V0X2NwcGM7DQo+ID4gKw0KPiA+ICsg
ICAgaWYgKCAheGNoICB8fCAhY3BwY19wYXJhICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBl
cnJubyA9IEVJTlZBTDsNCj4gPiArICAgICAgICByZXR1cm4gLTE7DQo+ID4gKyAgICB9DQo+ID4g
Kw0KPiA+ICsgICAgc3lzY3RsLmNtZCA9IFhFTl9TWVNDVExfcG1fb3A7DQo+ID4gKyAgICBzeXNj
dGwudS5wbV9vcC5jbWQgPSBHRVRfQ1BVRlJFUV9DUFBDOw0KPiA+ICsgICAgc3lzY3RsLnUucG1f
b3AuY3B1aWQgPSBjcHVpZDsNCj4gPiArDQo+ID4gKyAgICByZXQgPSB4Y19zeXNjdGwoeGNoLCAm
c3lzY3RsKTsNCj4gPiArICAgIGlmICggcmV0ICkNCj4gPiArICAgICAgICByZXR1cm4gcmV0Ow0K
PiA+ICsNCj4gPiArICAgIEJVSUxEX0JVR19PTihzaXplb2YoKmNwcGNfcGFyYSkgIT0gc2l6ZW9m
KCpzeXNfY3BwY19wYXJhKSk7DQoNCi4uLiBtYXliZSB3aG9sZSBzdHJ1Y3R1cmUgc2l6ZSBjaGVj
a2luZyBpcyBlbm91Z2g/DQoNCj4gPiArICAgIG1lbWNweShjcHBjX3BhcmEsIHN5c19jcHBjX3Bh
cmEsIHNpemVvZigqc3lzX2NwcGNfcGFyYSkpOw0KPg0KPiAuLi4geW91IG1pbmltYWxseSB3YW50
IHRvIGFwcGx5IGFzIG11Y2ggY2hlY2tpbmcgaGVyZS4NCj4NCj4gSmFuDQo=

