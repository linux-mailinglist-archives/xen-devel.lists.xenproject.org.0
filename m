Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9D4B9AC43
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 17:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129551.1469465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1RjW-0004Dv-5s; Wed, 24 Sep 2025 15:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129551.1469465; Wed, 24 Sep 2025 15:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1RjW-0004BS-3A; Wed, 24 Sep 2025 15:48:42 +0000
Received: by outflank-mailman (input) for mailman id 1129551;
 Wed, 24 Sep 2025 15:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uXxj=4D=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v1RjU-0004BM-Jd
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 15:48:40 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea466ede-995d-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 17:48:29 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB9048.eurprd03.prod.outlook.com (2603:10a6:20b:5b5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 15:48:22 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 15:48:22 +0000
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
X-Inumbo-ID: ea466ede-995d-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pm1vsnrHPZOq8+ZH7cL8b8tmGQe055bSyLGeTZF3I3N29AlMjE+0KqjR041BjQMq50t/qnYnHQU/ZlX80On/6wfkow8H4Zwms1uASSgePIGYqzAKQsaeqZsxwlZVdo0WZzJPX40HfhhnVMHzwxVHZ4SALyZj6Cld6NmXsv2j5fc8vvmLWWvLr626pywsrWIJRzeHqWrgO/Hkz8W1IwBmauxQnjy6S1TNMiMMT+nFbSwLIUFnreCGWKagT6XrCKoBitXgjLXBpO25nUmn3SrPNtdGOatm+navFjPdbclMx+iVh38XrYHzW6fX5qnXNnRHbgZ7M3x7K8pKeD0lxEVg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MfyHMCRP8HPtzZVYgkMnCz4+pmtmTOZLz4wlduRlZU=;
 b=ic0ezPJW0OfzV3cvwWbLGN+9Cgv9KwwWIRIhinsbsLiLoJcn3aORoG0gJsafbwcIB0aeMXbvphVQmR3lV0nTqUN6kj4FyUdwksC/UtIsb2K/jJjde426OlrLCEafcsMEWsmmqGPPR9NXq3JBwiX9SXG6heJGSxbO8FfHlJPF9IPFGiAJuYrLYy1vKevf9Lw9X/SzaL+poQICZaph+aY1p39J4gckoTy5jpQSqlXRpVjPoldYcSO/Wvu1iknd9lokujAB9AymAB1ToX/kRE4WG0SgVXsIDCeJ7wqD7D/L8dg9cjQRpPzwLGU3TpF7cwL6rWUQ6bUTQLuIyaVvaXVikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MfyHMCRP8HPtzZVYgkMnCz4+pmtmTOZLz4wlduRlZU=;
 b=oZ+XSFHGzh9aDOP8PMR6Z4Ocvdq1rqEMCodgWzMtA5L2KJjm5WGqmSc/A6WEZSBlBsj5fzDdLldGUBiaXF0qqlvaafxEpGtPmlkRxQhm7vWIuSHFk8tOadKaPyfYDDRKYQML4KtLKAesPRGDUjvNZ4AD7qWmAilRGr/A9axiHG6IGakkhwAfgVkngaJAKy5MpRzWfr/lq0IsVk60E61a6ALV0MK4ibwEOQC5EJbenrCryXhqT5zuXtIJOfK3D+320kQRsCmzxc06w3iNSjIeowGx0sIxzhRW7rDgVjO57bWZrU9J7q3UHo+rAljOzbA3psWwkXZoVLkq0n8g5AER0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <054b31c6-8911-495b-a8b4-b7a807c95786@epam.com>
Date: Wed, 24 Sep 2025 18:48:21 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Introduce GICV3 Self Tests
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
 <bd0d3670-51c7-4c60-9b45-201f00a14b8e@epam.com>
 <762b9d19-f1dd-4bfe-a298-d88ab8e7bbd2@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <762b9d19-f1dd-4bfe-a298-d88ab8e7bbd2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::6) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f2c99b-fa92-45b4-d1e9-08ddfb81caa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWZRZnNrTWtjVGZ5dDdWWSt1dkZ0NXpaYjdGdGNibzJscEduZFlXQmZZT1FM?=
 =?utf-8?B?UUcvd3oxVGZEYUwrdHpGOExFU05XYmNObDI3R1FxZ1FTVml0VGJaRXFYWFJN?=
 =?utf-8?B?dm5TMHgxUWtCaGV0NlkycWYyck9kRWIraVFocVR6MmFWUk5Hb3dadGdtMVE5?=
 =?utf-8?B?cGVlUndndlVxK1lNanAzMXhxWU1LMkpYYmhmS0xHZEZDWnQ1N1NYUjhzOS9y?=
 =?utf-8?B?NTdWaW5KV3FPMzVRKzE0MDdrQUpnOTJVajR4K1owb0pQbENaTnlWNUdsVll2?=
 =?utf-8?B?eXJDOEN6cEpmOXRnQjlCQS9zRW5wRU1xZy9vZGVFN1Fwbk1rSXRRKzh6djlq?=
 =?utf-8?B?OEl0bmhaRUJ1d2JyUUVac245R28zL3VuRFNxUXZyNGVpVHQ2RjBFR0hrZGJT?=
 =?utf-8?B?eUo0VU5xRDY4UkFlYXFBYXh6U04vMEp1NC8wbllEU2RnYUI3T1UrRENOMC9G?=
 =?utf-8?B?bnNXOEpSaG51c3pZT3I4M1pGVElNR1FsNGhzVHpCUE5QcnFhSEUydTFMbC9n?=
 =?utf-8?B?RG1TQ3U3LzAwVWlWVHE2dDJ6OTJ3ZTRpZ3JKWFlsUFBkTkluSUlkYjNzZUR5?=
 =?utf-8?B?L2NnQ2s2WXI1dG9BRk4zWVdTM1JUcWNCcmRoZVBjNHNQRnJYamtiVmpVMkFG?=
 =?utf-8?B?M0hsZ0IvQnhJUkpPS0pMNVM2Z1BZN3k4TjVjUVRacm5ScHJrUEtlZGk3ZCtR?=
 =?utf-8?B?YnExUE9CdHVDeTZMaFdhMVZRLzRpbVQzd1VrNmVoV2VZU3ZvUjZFY2JtU1lU?=
 =?utf-8?B?L0NsbTQvMHkrMFZEVkwrRXZjaFBqYWYwWmtNK25lTzF2ai9UNzhSb2MwK1BO?=
 =?utf-8?B?NWNnbkRsdy9WM2RmeGV5ZGl4VE1UR2d2eTR3SlR5N1RaYXpzTjF6M0FRMFo0?=
 =?utf-8?B?UXc2ZTdRWWdWeXorcUpodTgrVUtqcVRVWkxnOGR4VXFNZ2ExdjNIbmpSTG04?=
 =?utf-8?B?V1NQQnArbSthM1JrbHlseGs1Q3BPTEhEVWFzSjRxMDRGVXVtNFVnWU0ya1lJ?=
 =?utf-8?B?bUowUXVCQm5KQTNoQm9tSFdpVVpFWlExdC9xUGEyL29BZTNDbFVEeWUzcDd0?=
 =?utf-8?B?cmJmbG5ueHlkVEU5ZUExN1pXVmJNKzR0VllHdG0rOUJTeGpMaUtyK250WUk0?=
 =?utf-8?B?VW5vRlBpUFp6MlluMHhRMHZ6YXE2bW1qWXFTNWc5cS9ZSVVFOEhNbEdKUHhS?=
 =?utf-8?B?dUFWL3FkSnVBeXRUUUE0NEJGalFlMkdldlEwbzVpajNNY3hGWlZFZXk0MFNz?=
 =?utf-8?B?VFZHZ3hLMllGQ09rT3cxWXdCZ25qVFJBQlBvTFozVTZrL3p1dHBDV0EwWmtw?=
 =?utf-8?B?VG8vc01keWxObVBKbXFSWnpSSjBvL0wwR0hjL3V5d3g2ZDdmeFdFMG1UZEdR?=
 =?utf-8?B?VGI5b245Mmc2ZWZ5VldSRGlqeENTZmZRSmxmWVpvMUw0VHdUd0pvUWtGb2NQ?=
 =?utf-8?B?RFNyOVJRbDFiYWxLOFBZVVRZbVVBMjBZb0F4b1Nma0d6bFZpWGRiZS8zbTgx?=
 =?utf-8?B?VXZRM3ZXTFpWOURwbTF6YVZxTVdZU3pvUzgyTnFXYVVVT3llNmY4dXNpU3VE?=
 =?utf-8?B?bUo0TXpIVnVkUmlhN05ITUd4blc3eGZnM2FnVTRCUUNtYVpMeVBiZFlCTll2?=
 =?utf-8?B?WE9NbXY5VmdYVzNGMjI1d2pVb2haUkdNajFEanAzMW5wNjF2QWNVVmdvVk9I?=
 =?utf-8?B?SHorWFJELzZtbGpqVFQ0UUptRDBTZXZFbW92S0RlbXpJeXp1anRWR2Q2b2Q1?=
 =?utf-8?B?d0pTTUhOOUtDYjlMWXM0WTdsdFE2MG1PcFdMdHFCTWg2cWZqQld6NlVIT3c4?=
 =?utf-8?B?Z2VvMmhSNUc3RzEyNmdwaUdIS2EybW5KKzJmdWZwTG5TTnVEWk5pSitwR2pR?=
 =?utf-8?B?SlpvZWcrMmtGcVE4dTVBNUp4Q0JPZmxNZnpzdkZQQmsrR29IMVJBTHdHd2Ra?=
 =?utf-8?Q?kejke7TbG2w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGhCdURPWkZBang5YUduQUtlZHF5V0VDL1JkSVZIeld2Zlh3SmpTME5GOU9w?=
 =?utf-8?B?SmUxVkk4dUNiUm5EdHk4UFhtUEVTanY5WXBrMTRMNC9xamI2c0x0QmxhY213?=
 =?utf-8?B?cXVyRzNMSk1RSnNpcS9XWmswSzdLV1hKU0VlazdaQVNWWFdFcC9tRXVIck4y?=
 =?utf-8?B?bk5BNjd1VFdUMnhhOWxXcjNmaHA2MWVtUCtDS21pV0puYWdaWjBEKzFOQVZR?=
 =?utf-8?B?RVlpcFoydVYyZ0U3M0ZEc3llUEFyV0U1MGJZUEgyZWlqN1dMbTVSVmJuYmZO?=
 =?utf-8?B?V0ZoSWpVMVh3b3Rtc3dMWDVITkFIckNNdDEzdmltVEJ4MWlodDBOT21xWjFQ?=
 =?utf-8?B?ZXJ0R0dYcVRpdkJNZzZxY0tiVEpBTzRrTW9MSVNIREhXc1NPaTh5dHIyY0tn?=
 =?utf-8?B?VGpiMzcxdFJORkQxUThIWkVFRVVKY2RUeWVLN0FDMUlUazk1eFFreWpDUm5U?=
 =?utf-8?B?VldGazY2K3J3V3RYcTRzZ2h6NGxKL1QxVlBnQ29VSFFkMUdVU1E1Vi9lRUZT?=
 =?utf-8?B?Y1FLVHdMdXlKd1V2VHVrZGlyeVllVDdMSHcxYis3WVE1VlNYK25oc3BQN3ox?=
 =?utf-8?B?NE5HM1hrVXI4QlVUYlN0c0FMTVQyTUpWS2xMR2liRGxybnVSdlpCcEMyYWxq?=
 =?utf-8?B?Q0wrbFVmejNVd05MWk9rcE9HRFNDNElyR1RueVcyaWNETXhVTUpaYzJCT0Vw?=
 =?utf-8?B?SjRJMjNIbk1sT2hKUjVJNlhLdDdMNHI4L29NN1VBdmlxbkpDdjl3MzJjcjZq?=
 =?utf-8?B?Q1NKRUFDOWpHaFhPYXhjUTJRTHUzVTkzVE1CWVh4NWJVSURibWNxNzZmd1JM?=
 =?utf-8?B?S2ZYMUJjV0poZE9SMnNVSnZzdHBScVB1YVdhTDR3VU01MTBYN1ZPa21mb0lH?=
 =?utf-8?B?NEFMVUVQMUZ4NXI0Z0xwSW1QdGthT3hiZTZBaTJzdmZwR3hwaUM0eXFhZlc0?=
 =?utf-8?B?U0JMNGp1MEVSVGdraThtSU53QmhSYitQNnM0K1Rqc0E4L1ArYjlKVzN3YXJK?=
 =?utf-8?B?VmF1RVdrS2ZNRlVNWkdLZzF6UnRYVHphekpWeFl1akh0OWRDNmF5RE0wY0ph?=
 =?utf-8?B?eUhUN3FpeE5aSm1mOUdlTmNYOVBnVW8vY0VZL1hqZW42NmdiN09PeU5wWkUz?=
 =?utf-8?B?eU1KMlIyVHNYQkdXTUh0b0RjSzFSUmhHc0g2MFNGZ1Y3ZTZtL1hkdEdDallR?=
 =?utf-8?B?SUNxd2lPeEdCOXpEbU5UN2tMSUVzUEFzL0FhRlFaOGlJNnhwS0x2dENOSFRr?=
 =?utf-8?B?MktTdWpMLzVsdDgrMFBCMFA1MWZnWkxRODdSanBleUllVW1LTy9COUFEeTVU?=
 =?utf-8?B?akNhTjlVRXFCMmlSZWNoU0FjWmtpYXp0d2pxb2d1OStsdVFKSzd5cmNQdzdE?=
 =?utf-8?B?UEJnWFNrWmZlaC95TmlOUlJ3OFpOUGdXZUh1TW0zSStzRjhNQVhqci9odTVR?=
 =?utf-8?B?RGFzNGdBTG5BQlZZT2lONjJRUEVmMjN1UnQ5YjJ0dTdRNEhFSjJPUXhKMGpn?=
 =?utf-8?B?cGFZOG9PRXoyVEdjMms2Yytlc1NBSzBDd0lVTHBObnYwUHhVTTRyclgwSXRV?=
 =?utf-8?B?VjM2VGpEc3BuekVTUUlQTlppZHNMdjZ3QXp6NFhta0lNa05WL3owbExRUTgx?=
 =?utf-8?B?V2NkN09CbzhNOEZkd1NreTRVc2RON3Azd0d1QUFESy9zbTRJV0FlMnNHYmoy?=
 =?utf-8?B?eWx6aHVjaktEelRyZ01UL3ZQMG5yWlFVYTIvamFJSHR3dTlsbnYxQW5TSGYz?=
 =?utf-8?B?ZkFROFMwUFczRGtwUFQwRDR5THN3dWlkV0xhTWtqbmRpcENSdml4dGVzSmV3?=
 =?utf-8?B?NUw0c2RYSWdBcGprMTQrYmxqTGhSZythTXZPUXhJLzg2T3ppV2VEQ3Mwa0Js?=
 =?utf-8?B?dDNXVGNwRVRkVTMwOWVPK2pUbFZRZW1uMUEzNHJjUThrV3E1VENvdVhVMnZY?=
 =?utf-8?B?Y3FhcWF5WHBTdGk5T1A3Y0VuWXhoZHIwazYxd0hpYmkrMk4rYmgxbWJVTTAv?=
 =?utf-8?B?cHg3YkR1RDRNdHYzbVlacGRzek1HVTBITldFbGtQbEw4VEhOcVhzUUhmVkUx?=
 =?utf-8?B?eGlSQkZsUUR5VngyZ2xyS2FlemI2Y0tmQXlqamJMR21tak9acXFwTnNuYlVn?=
 =?utf-8?B?L2tDTEQ4QmV2ZVdiOUVIdVdrbGpabjBRZTdwMmJyWjZncENUNjd2aHhTWHlE?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f2c99b-fa92-45b4-d1e9-08ddfb81caa1
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 15:48:22.6755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/IMhs1tyOaRTVD5thzX4zi9L8nWad0X8XBOXPOhS2qnJysjHzIxACpxumExxBDfwN/EhEyy8xGkLL5UH+pqRQ5iWY0teO40fcOX9YOzFig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9048

Hi Ayan,

On 22.09.25 19:55, Ayan Kumar Halder wrote:
> 
> On 16/09/2025 11:55, Grygorii Strashko wrote:
>> Hi Ayan,
> Hi Grygorii,
>>
>> On 12.09.25 20:00, Ayan Kumar Halder wrote:
>>> Introduce CONFIG_GICV3_SELFTEST to enclose tests for GICv3 driver.
>>> Test that Xen is able to generate SGIs.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> One of the aim of functional safety is to test hw/sw interface. This means that
>>> Xen is able to configure the hardware correctly for the desired functionalities.
>>>
>>> Normally this is tested from the VMs. For eg if a VM is able to receive irq, this
>>> implies that Xen has configured the GICv3 interface 'correctly'. However this is
>>> a high level (or integration) test which uses not only the GICv3 interface
>>> between Xen and VM, but the interrupt injection code for Xen to VMs.
>>>
>>> We want to have some kind of unit tests to check that Xen is able to receive
>>> various interrupts, set priorities, etc. Here, we have written unit tests for
>>> software generated interrupts (SGIs) as example.
>>>
>>> These tests are expected to be triggered as Xen boots (right after Xen has
>>> initialised the GICv3 interface ie gicv3_init(). The aim of this test is to
>>> check whether Xen can trigger SGIs after gicv3_init() is invoked. If so, we can
>>> claim that gicv3_init() was done properly to be able to trigger SGIs. Likewise
>>> we will have tests to check for priorities, SPIs, etc.
>>>
>>> A script will parse the logs and claim that Xen is able to trigger SGIs.
>>>
>>>   xen/arch/arm/Kconfig  |  8 ++++++++
>>>   xen/arch/arm/gic-v3.c |  7 +++++++
>>>   xen/arch/arm/gic.c    | 21 +++++++++++++++++++++
>>>   3 files changed, 36 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 950e4452c1..739f99eaa9 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -73,6 +73,14 @@ config GICV3
>>>         Driver for the ARM Generic Interrupt Controller v3.
>>>         If unsure, use the default setting.
>>>   +config GICV3_SELFTEST
>>> +    bool "GICv3 driver self test"
>>> +    default n
>>> +    depends on GICV3
>>> +    ---help---
>>> +
>>> +      Self tests to validate GICV3 driver.
>>> +
>>>   config HAS_ITS
>>>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>>>           depends on GICV3 && !NEW_VGIC && !ARM_32
>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>> index 4e6c98bada..eb0c05231c 100644
>>> --- a/xen/arch/arm/gic-v3.c
>>> +++ b/xen/arch/arm/gic-v3.c
>>> @@ -1818,6 +1818,13 @@ static int __init gicv3_init(void)
>>>         gicv3_hyp_init();
>>>   +#ifdef CONFIG_GICV3_SELFTEST
>>> +    send_SGI_self(GIC_SGI_EVENT_CHECK);
>>> +    send_SGI_self(GIC_SGI_DUMP_STATE);
>>> +    send_SGI_self(GIC_SGI_CALL_FUNCTION);
>>> +    send_SGI_self(GIC_SGI_MAX);
>>> +#endif
>>> +
>>
>> I'd like to ask, if possible, to minimize mixing selftest and functional code.
>> Like add gic-v3-selftest.c.
> 
> I can try that. However, the self test needs to be invoked from functional code.
> 
> Also, your suggestion gave me an idea. I can do :-
> 
> +static bool __initdata opt_gicv3_selftest = false;
> +
> +#ifdef CONFIG_GICV3_SELFTEST
> +opt_gicv3_selftest = true;
> +#endif

I'd like to propose to consider other approach according to the following assumptions:
1) the goal is "Test that Xen is able to generate SGIs.". According to the goal and your code
- for this test, it doesn't matter which one (SGI) is tested. Any way you don't call real handlers for
  GIC_SGI_x.

2) there are 16 SGIs available, only 3 are statistically defined (enum gic_sgi) and
It's possible to reserve one more for testing purposes,
like GIC_SGI_SELFTEST

Then, gic SGI selftest might work without breaking Xen boot (probably for gicv2 also)

gic.c:
   do_static_sgi()
   {
    ...
    #ifdef CONFIG_GIC_SELFTEST
         case GIC_SGI_SELFTEST:
           gic_sgi_selftest();
         break;
    #endif

git-selftest.c

   gic_sgi_selftest()
   {
     // process test SGI, like count number of triggers
   }

   void [__init __constructor?] test_gic_sgi_selftest()
   {
	setup test 1
	send_SGI_self(GIC_SGI_SELFTEST)
	setup test 2
  	send_SGI_allbutself(GIC_SGI_SELFTEST)
	setup test 2
	send_SGI_mask(cpu_mask, GIC_SGI_SELFTEST)
   }




> 
>>
>>>   out:
>>>       spin_unlock(&gicv3.lock);
>>>   diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>> index d922ea67aa..5cb58cdb92 100644
>>> --- a/xen/arch/arm/gic.c
>>> +++ b/xen/arch/arm/gic.c
>>> @@ -346,6 +346,26 @@ static void do_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
>>>        */
>>>       smp_rmb();
>>>   +#ifdef CONFIG_GICV3_SELFTEST
>>
>> if (gic_selftest_run)
> And then instead of ifdef, I can enclose the below under "if (gicv3_selftest)" .
>>
>>> +    switch (sgi)
>>> +    {
>>> +    case GIC_SGI_EVENT_CHECK:
>>> +        printk("GIC_SGI_EVENT_CHECK received\n");
>>> +        break;
>>> +    case GIC_SGI_DUMP_STATE:
>>> +        printk("GIC_SGI_DUMP_STATE received\n");
>>> +        break;
>>> +    case GIC_SGI_CALL_FUNCTION:
>>> +        printk("GIC_SGI_CALL_FUNCTION received\n");
>>> +        break;
>>> +    case GIC_SGI_MAX:
>>> +        printk("GIC_SGI_MAX received\n");
>>
>>        gic_selftest_done = true;
>>
>>> +        break;
>>> +    default:
>>> +        panic("Unknown SGI triggered\n");
>>> +        break;
>>> +    }
>>
>> Potentially GIC selftest code can be guarded by some "gic_selftest_run/done" vars
>> if xen boot is expected to proceed further after testing.
> 
> Ah no, Xen will terminate after running the self test.
> 
> - Ayan
> 

-- 
Best regards,
-grygorii


