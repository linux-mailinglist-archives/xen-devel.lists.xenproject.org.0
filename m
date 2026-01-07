Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6806BCFE480
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 15:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196773.1514502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdUVS-0006iH-TO; Wed, 07 Jan 2026 14:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196773.1514502; Wed, 07 Jan 2026 14:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdUVS-0006gw-Pr; Wed, 07 Jan 2026 14:27:26 +0000
Received: by outflank-mailman (input) for mailman id 1196773;
 Wed, 07 Jan 2026 14:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFOO=7M=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdUVR-0006gl-Kr
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 14:27:25 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbe72036-ebd4-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 15:27:24 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA1PR03MB8214.namprd03.prod.outlook.com (2603:10b6:208:5d6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Wed, 7 Jan
 2026 14:27:21 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 14:27:21 +0000
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
X-Inumbo-ID: fbe72036-ebd4-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kG1aq1VUX7OkPVFF2mPLkMCrXJs0i8MJMCvPqvmNTGmlHGRS+AoeWs5NFtpMeLQrrnZJXnZ/GGikJxtU98ZM7ciZpjlL2nFiUwjORhyqYn539UUWGQfvhmrGC7a5pZWcFK6ATz4aUQ2NAk4XOEgZTDW5ggjzSPcrLOKW7quO6e4LJVewrGe5LmbnmlkC/fkNZ6/PX/nu/D1WmU3wAxewgPW3vnJXwLivsG1f66I0R6QggIheUTTlUSGTQvWt5fe8JwChjsSVLneEzQzEVomNwdANP8cnvmqD3E8fc9N60fVZkyJBscOlju+w1Im3zMmkyM2lewBVVHIPZ8klcjgjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVMmgP/29r9K1JzbcGoAGvMJ+s5vsTxunlavN4xtz0U=;
 b=bmBTiMtOwFg8H7QB5XrWMkqHrmgJNdqZTDld2WsEE4Nm76r4w77HVvLRiZQ2Dp3rRmSa2BVEvo+Mr+ekGlgJ9iRgiSrpQMH1KdsJqp30Dze9D7NFezbX8/NNOs4ZpwDhkWN1Kvbb36K8qswvuipGqtdGddWNvVdorxOfHDSWY5fq9Cr7ZDevrWB7mNnb8YTYRL7KRnZzmDTRBPh4lrtrahElC9759ojpG4rh6M+MnCLFjXminoOkuvuQCtMH9V0o/u9WRCL6xpXRlBQ3DKhcxDD//d5tM0H+Vear2WeID+wGPhFnUxOD/y/fuNtaSO9RvgqHjEDB01ldSek1Uc6fCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVMmgP/29r9K1JzbcGoAGvMJ+s5vsTxunlavN4xtz0U=;
 b=o5Z6wFtQJ+RAQ4uONuAzHXUm/Um69TSkUVUrDpGfQIEGMxf+R+bTYk6YwfOSaA41wGusGEuqqX5nOv5FIkHyKIfDsnN9PT7oqscf6OhCBAs93mlh5eRHHXVfjlAYwtR9oqTU0zfz2XIHQdVGSQ91Lg3WS0JPVgBM5eyjl+yXqCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 7 Jan 2026 15:27:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] xen/mm: move adjustment of claimed pages counters
 on allocation
Message-ID: <aV5tRNEC2vvO7ebe@Mac.lan>
References: <20251224194035.60173-1-roger.pau@citrix.com>
 <20251224194035.60173-2-roger.pau@citrix.com>
 <bf6a97ed-2daf-4057-a283-cfe820954c71@citrix.com>
 <6ba614c0-740f-4c39-b81d-990a1d0add0a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ba614c0-740f-4c39-b81d-990a1d0add0a@suse.com>
X-ClientProxiedBy: PR3P189CA0011.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA1PR03MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: 60685d40-ccc8-43f3-57f2-08de4df8de6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M05JVDBhVTB4UUdiemg4N0xRbk81aTB3R01na0c5RXFtcDByL1hYemxBVEs2?=
 =?utf-8?B?SXE4SHFsK1hjN2FaTEZ0c0ZncldjK2NkN1VtRVZvQXE3QkROdk1DcVZoSXF2?=
 =?utf-8?B?YlRFa2pZMStCYnVEQ0JaQWkrZWNaZWdwd0tBWThtRTNkbFBXY2dtL3YrREZz?=
 =?utf-8?B?SEk1MWR5SWxWd0tRbDlYaGpLbnppNjk2ZXIwb2s1eHZMZlk2QVNGY3JyaU5w?=
 =?utf-8?B?M2ZXNXFFZkYvSVFQOFdDeDlpWnhWNkhVNDVPZlIxNVlrU2hJZjUraDBvQ013?=
 =?utf-8?B?ZVB4S0RrVkcyQTZLYWpJR3ZNVGlLOXBvN1JadjE5K1FPT0NXaldPMkVkRHZD?=
 =?utf-8?B?Q0tlR1Q1K0xTSzgraUFYcXR1US9NQmt6ajdXd0FrdVdrMVplcEJGLzVEdmhr?=
 =?utf-8?B?c0RiTzYxWk15L3dzek9QWjJ6dlc5c2loMm9DVHNQNUM4WHdPV2xuNGp2SEdE?=
 =?utf-8?B?VU5qNUhYUWdUdm5NNXJTM0FCZURYRThHa1FQYjVSNEtvcW82ZGQvSGFYRnl2?=
 =?utf-8?B?Z2c2akhnTEdOWG5QekoySkJEZmNRZlFSc1VMelVLazI3Y3UvZ3VpZ1F0TzNv?=
 =?utf-8?B?SFBldVU5S1VNMWVBN094alpTL1BwV1Z4ZVlsb0dGMCt4YmxFcEJCOURMTTE1?=
 =?utf-8?B?SE13OXBBM0tIcUxvTCtROWY1OXpIQ2pOZHBjUTFtaTZSMkZ2WkdVN1EvWGZO?=
 =?utf-8?B?eGNzVjRwQXREbG9xNDhPemZDa2NFYnY3ajI4dXllR1d0dVVNSDFiTXVMR1pL?=
 =?utf-8?B?SmtvV3lMRnNSWUg4NkZGZWw2RWVOYXRiTGUvU2licFcrOXBuTmxZbndwUWtv?=
 =?utf-8?B?K3hLTHlUSDcyOXl5cHY3RkY2ODhiZEZnRUVmS2hObmVoOUkrNlBuVGorNnhF?=
 =?utf-8?B?Z2JDTHBXdHRQRDdEdGd6MloyTWV6Wk95MS9HUldiMkxCcVVTWG5ubTVFR085?=
 =?utf-8?B?eUw5UjN0dFl5RmZSaXdkWUEvV3ZZOVVRTmhWemNHV2RYWDA1aS9RTkdaVHFn?=
 =?utf-8?B?amJEYU1ldlYyRnFYazN3Mm9EeFYrNUVoSHlTbzBoOTFuOUs2OFdkUmFUeHN0?=
 =?utf-8?B?TjNNWVRENzMrS3FzRUlLQjRsY081ZkhlQ3FhcW1RclNxS0RDcmY5dEVPS3BK?=
 =?utf-8?B?VlVjSXJhT3F0NVJZTVY1ZEQ3dTM4R1RPTnpaYTMxVU8xblREeFFyR1J6NHhl?=
 =?utf-8?B?ayt5eE1RZ21hSi8xQ3hpclI5dkdpV2VYeGNodHI3YytuYmhuYWZXNzNXV3hx?=
 =?utf-8?B?YzlWVFF6OThzK0pqN1RpTDdQTDhJbFBNeVZmVFBrMldRT1R6cEl1OGdHTHg0?=
 =?utf-8?B?N2RVUWFxamtScHViQ1kzUTdETTdBSUc0UXlzbEVQaVJCQ3RmWG5wWGZhQVlj?=
 =?utf-8?B?bWxnWGU3dkpEL09pWkFlK0N0OEU0d2c1NXFMMUlnSHFQMnVkNFhpekhLTlk2?=
 =?utf-8?B?ZHEwRUl0Y29zdFVEUGJkdUZMcUlCelA2U3RmbmFuc2NnUk5RSXprSm9tRWNB?=
 =?utf-8?B?clU2S3FxRzdJWis4M1N4Yk92ejg2eklOL0lQKzB3UzI3b0JrVFhMOUFMMUJF?=
 =?utf-8?B?aHdHZ0QzVHY2Y25iK1RBTmFOd25SelpqcE5Mc0M5TGo2azlOOXlxdFh4RFpM?=
 =?utf-8?B?U3dKaWdYRVpKbTdBV0txdWpsTWo4OUQwWnVuRkJXY3lNR29qeFJpQVNJem1l?=
 =?utf-8?B?c3IwdytmZWlzNnV5YmYxc2xWM2xEcnRiUDFCVHpwVU1jOTZXUlFOVlZ4ZG1r?=
 =?utf-8?B?K1E5MU56U2tBL0Yxa0Y0c2duNnVoTU5PQXhub2xrT0N4YVd4ZEZ1dmdlSk5F?=
 =?utf-8?B?R0FETWMzVDN2VXZPcnlYZ3ZtYTRhNkdqNnM4cVl5VkV5ZDRQUllac1ExWmMr?=
 =?utf-8?B?NVIrTUUzMEVQa08zbjZFVkc2N1BobW5DYjkxTUlmTnNvWHlTSHU0elZSV0hX?=
 =?utf-8?B?dUVHY0NaSGNNZ0RwMjRUbGp3ZFpZSW9wMnBod1dWSlVXYXlmcitPT2hMSDBL?=
 =?utf-8?B?enEvMzdMK2xnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3Vqa2NjTVZLbWx6aXhRNVlObkR1L2wrWld5Nll0Z0NnRXlReTlCS0Iza3E1?=
 =?utf-8?B?cUVnNVZZYXZBRVpFT0ZKY0lLM3EyekVZeW8waHU3TTBZNGF1bjBtYTFOK0ZK?=
 =?utf-8?B?VU9xcCtYUytqK3RjK2t0cHFFZTV6dFlNazMyNFBTbEduOU9Ja1RRMmhIdncy?=
 =?utf-8?B?WWlZOE5odGQ3aEtsVWxKZEFlbnpBZGhyZEJSRVJGdVZCR2RkM2tEdGRQVHdq?=
 =?utf-8?B?UFl4UENmNk9weS93SU51VjNUTDVKK2ZQeXNQbkF6VFV6azBBcGwvdWFPcVpK?=
 =?utf-8?B?Yi9FTDQrcmlwNXZXNEdDcVlIWVozdElPSytqZTAyQ2VUV2NtdE84SWswbkpS?=
 =?utf-8?B?ZG1NZGkwZmxKdmxkdmtZWGdYS2hGWklGcVV5cVh1Q1FnTXFpUTlubm05Z2k5?=
 =?utf-8?B?cWI0Q1A2YUVjSlUyVUNvUFByenBDUE1ZUWs0OGJvN0RENkp5RnJ4MVdlQUt0?=
 =?utf-8?B?dkROQ0Z6SUttM21sclRSL3RicUt1UUZydld0SDVtMWpCRytVZWNoN3Q2L0xt?=
 =?utf-8?B?MUs3MmxvNE9CVDNmTElYcHNjcnJCSEFwSHJpYXA1RURqN3pCMFkvamRJUExz?=
 =?utf-8?B?WWtXRHpBSGFhMW0wb0tkakJFbVNJSzdTN0hUU0R1WUZtc3FCc29TRmI1VmQ4?=
 =?utf-8?B?cy82UGdyUXlwWFBlckhHNDVxQ0pOU29YbzZkVmdqaW42eGY2bWFqRVcvNUFY?=
 =?utf-8?B?SHJtaVpPbXFxOHJtK0VYRHhIUmRpUXRLRkpRSXF6TnVTYk1PVXNZNEkrQ3gz?=
 =?utf-8?B?emFZT2NnbHloeFpMa3Y2U1MvNUtJaVBqdjZoUWNtd2FCdjF2QUhiWmJBTlcr?=
 =?utf-8?B?aW9kWHJsOStpeVk3MUkveGdaUzNxWnh6NmxhZUFRUm1wckF3Z3dIbjFXZm1u?=
 =?utf-8?B?TjVQU2JtMkFuQTM5UFhMeEl0QTA0V3hheE9CSHBKME9YVC91OVJIb2hRMjNJ?=
 =?utf-8?B?c21YcGFpeWRuUXpzREZEZXRZMEdvRnN4Vms0aGNqMFNTU3NQWVpRYzZJdFYw?=
 =?utf-8?B?VUlma3FEVUk4eTBrSmU0S3RFUnBYSGUyVURBK2VQUWJ4VHJadXk4Rm5qN3Jo?=
 =?utf-8?B?WU4xQm5IN0ZlTVNHQi92UHBDT2VrZjBUM2pQbVoyNmVWY2dUSzVIN1F0RnhV?=
 =?utf-8?B?WFptZjNtMERKWERhRlhHLy9QOGFROGppd2NBNzYvMHA2d0NkU05ObWh2cHVY?=
 =?utf-8?B?TDVlai9wenpFVzhuR3NHclc1ZnhnUjVvZHkzWVdMQTdjcmZiYmRxblhSRUlF?=
 =?utf-8?B?TWh6NEdNa1hRREszTlVvVnBzajJwRHUwRFFWNEhQSkUveXl5cE1BSUE1dWJL?=
 =?utf-8?B?MFZCTXZYamZZSy9BNGtKNjlWQU5qcmlhUml3WEtTbEtBaVFWWkVqL2UxMWph?=
 =?utf-8?B?QzdpUzhRUjZocHNORFpZTDh2bEwrU0ZWU3dudUlSeHZnVWsrcEpJZzdOQmxX?=
 =?utf-8?B?RlpmbjRzMzlvckZBSGZEcHpsYWFFQUtUc05IOU1UWDNXMEFhVFdTdmtEMVo5?=
 =?utf-8?B?UVNJTWtXdU9Zc3hHRlBDVVNwcUhMTEV6Qk85dTlBdlZSWUpZMHAxVkVwM2xZ?=
 =?utf-8?B?RXpkVDVPRTRIK1JHMWV5bStic0FsVlJDMmNmS3piaXY3THNMMjFhNC96b1NH?=
 =?utf-8?B?MEk0QndvVzBVc1A0MWhEVzhOM0s5WDhRR2t1Y0xYTUMxOEN4MHVSQlNqYzNr?=
 =?utf-8?B?QWF4UUVJYUtMKzNMeGJOMVNkN2dKYTVtQm9zY0EzRnJWR2FYL2xsZkF5QzB1?=
 =?utf-8?B?L1h1c3o5MDF6a2hWNFlhcDJZekV3Y2FCTXZJVTFzeC9QeS9ybG9KQlNjaUFX?=
 =?utf-8?B?NFQ0bjBXNytjMXIzaFBiMlY1RGNmTWNhNHdpTmpJOC9KZ2tQYnNLOXFjYXVv?=
 =?utf-8?B?L1huMStlYjJEWjd6aTZsZEFXdWVxN0d3dmRRR0l6d0lJR2QzTUxTRC81T3dJ?=
 =?utf-8?B?U3Y5bVJwMmlQWWRmRS9odWpTOSsxRjRsUk5GNjg0cGVBQTErRDRPVU5Uajd4?=
 =?utf-8?B?OU1lQ3FoZzZzY3piRWVqWHgvcE5wTDk3ZVl5b2FJVjZiTXpJWTZHSDNHZjk4?=
 =?utf-8?B?cWltcTNONk1Ca1U4NFFJSE8wSGRiWGtmb2ZGRS9Ebm00dVM2Snc4Z2Fxd2JI?=
 =?utf-8?B?VlViNzhKTzRQZU5lc3ZwaVJaOFY4WTVCTktkVjJkTTZ3MTlxNSttaS81SGR1?=
 =?utf-8?B?ZEhsV05EYklvVmRPMk5mejNocXY1bTVLMFNjdmxCTkxQdUJreFlNR0t3V29q?=
 =?utf-8?B?YlRPb0g0WXNuaHZQd0RwRmY1VHA2Rm5sdmp6QnIyRnZmYmNrZEZ4bDlGQTJP?=
 =?utf-8?B?ZVJrTC9WdGFGZUNCOHhxWUFPeGIzbTlVWWFGYW9iaUExbWE2dTRmUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60685d40-ccc8-43f3-57f2-08de4df8de6b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:27:21.3579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOomhJodbFkkoOzIczGODQKU4iT/kZjjFwTlOSaEmI8Qtd/uYurMB1WiH5chagulieXaQZJbqrVLmju+HTX7Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8214

On Mon, Dec 29, 2025 at 09:44:49AM +0100, Jan Beulich wrote:
> On 24.12.2025 23:31, Andrew Cooper wrote:
> > On 24/12/2025 7:40 pm, Roger Pau Monne wrote:
> >> The current logic splits the update of the amount of available memory in
> >> the system (total_avail_pages) and pending claims into two separately
> >> locked regions.  This leads to a window between counters adjustments where
> >> the result of total_avail_pages - outstanding_claims doesn't reflect the
> >> real amount of free memory available, and can return a negative value due
> >> to total_avail_pages having been updated ahead of outstanding_claims.
> >>
> >> Fix by adjusting outstanding_claims and d->outstanding_pages in the same
> >> place where total_avail_pages is updated.  Note that accesses to
> >> d->outstanding_pages is protected by the global heap_lock, just like
> >> total_avail_pages or outstanding_claims.  Add a comment to the field
> >> declaration, and also adjust the comment at the top of
> >> domain_set_outstanding_pages() to be clearer in that regard.
> >>
> >> Finally, due to claims being adjusted ahead of pages having been assigned
> >> to the domain, add logic to re-gain the claim in case assign_page() fails.
> >> Otherwise the page is freed and the claimed amount would be lost.
> >>
> >> Fixes: 65c9792df600 ("mmu: Introduce XENMEM_claim_pages (subop of memory ops)")
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> ---
> >> Changes since v1:
> >>  - Regain the claim if allocated page cannot be assigned to the domain.
> >>  - Adjust comments regarding d->outstanding_pages being protected by the
> >>    heap_lock (instead of the d->page_alloc_lock).
> > 
> > This is a complicated patch, owing to the churn from adding extra
> > parameters.
> > 
> > I've had a go splitting this patch in half.  First to adjust the
> > parameters, and second the bugfix. 
> > https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/roger-claims
> > 
> > I think the result is nicer to follow.  Thoughts?
> 
> Question (from the unfinished v1 thread) being whether we actually need the
> restoration, given Roger's analysis of the affected failure cases.

Let's leave it out then.  It's certainly possible to add the claimed
amount back on failure, but given the intended usage of claims and the
failures cases of assign_pages() I don't think it's worth doing it
now.  It adds complexity for no real value.  A domain that fails in
assing_pages() during domain creation physmap population is doomed to
be destroyed anyway, and hence possibly dropping (part of) the claim
is not relevant.

I will send a new version of the series with the approach used on v1.

Thanks, Roger.

